import endpoints from "../api/endpoints";
import sendRequest from "./sendRequest";

export const getCourseData = (courseId) => {
    console.log("courseId", courseId);
    const url = endpoints.courses.getCourse(courseId);
    return sendRequest({
      url,
      method: "GET",
    });
  };