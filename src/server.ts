import cors from "cors";
import dotenv from "dotenv";
import express from "express";
import morgan from "morgan";
import { DatabaseClient } from "query-from-file";
import userRouter from "./routes/users";
import { getEnvVarOrFail } from "./support/envVarUtils";
import { setupDBClientConfig } from "./support/setupDBClientConfig";
import homeRouter from "./routes/general";

dotenv.config();

export const database = new DatabaseClient(
  setupDBClientConfig(),
  "sql_queries"
);
const app = express();

app.use(express.json());
app.use(cors());
app.use(morgan("tiny"));
app.use("/", homeRouter);
app.use("/users", userRouter);

connectToDBAndStartListening();

async function connectToDBAndStartListening() {
  console.log("Attempting to connect to db");
  await database.connect();
  console.log("Connected to db!");

  const port = getEnvVarOrFail("PORT");
  app.listen(port, () => {
    console.log(
      `Server started listening for HTTP requests on port ${port}.  Let's go!`
    );
  });
}
