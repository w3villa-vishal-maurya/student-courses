import React from "react";
import { createBrowserRouter } from "react-router-dom";
import CourseContent from "./CourseContent";

const router = createBrowserRouter([
    {
        path: `:id/lecture`, // Remove "http://localhost:8000"
        element: <CourseContent />,
    }
]);

export default router;
