const baseUrl = window.location.origin;

const endPoints ={
    courses: {
        getCourse: (id) => `${baseUrl}/courses/${id}/course_content`
    }
}

export default endPoints;