import React, { useState, useEffect } from "react";
import Card from '@mui/material/Card';
import CardContent from '@mui/material/CardContent';
import Button from '@mui/material/Button';
import {useParams } from "react-router-dom";
import { getCourseData } from "../api/courses";
import '../../assets/stylesheets/scss/course_content.scss'

const CourseContent = () => {
  const { id } = useParams();
  const [currentVideo, setCurrentVideo] = useState("https://www.youtube.com/embed/dQw4w9WgXcQ");

  useEffect(()=>{
    const fetchCourse = async(courseId) => {
      const response = await getCourseData(courseId)
      console.log(response);
      console.log(response);
    }
    fetchCourse(id);
  }, [id])

  const relatedContent = [
    {
      id: 1,
      title: "Introduction to React",
      videoUrl: "https://www.youtube.com/embed/dQw4w9WgXcQ",
    },
    {
      id: 2,
      title: "State and Props",
      videoUrl: "https://www.youtube.com/embed/9U3IhLAnSxM",
    },
    {
      id: 3,
      title: "Lifecycle Methods",
      videoUrl: "https://www.youtube.com/embed/MKuB7Gl7uR0",
    },
    {
      id: 4,
      title: "Hooks in React",
      videoUrl: "https://www.youtube.com/embed/f687hBjwFcM",
    },
  ];

  const handleVideoChange = (videoUrl) => {
    setCurrentVideo(videoUrl);
  };

  return (
    <div className="d-flex row gap-4 p-4 course-content">
      {/* Video Section */}
      <div className="col-8">
        <Card className="card">
          <CardContent className="h-full flex justify-center items-center card-content">
            <iframe
              className="w-full h-full rounded-2xl ifrane-video"
              src={currentVideo}
              title="Course Video"
              frameBorder="0"
              allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
              allowFullScreen
            ></iframe>
          </CardContent>
        </Card>
      </div>

      {/* Related Content Section */}
      <div className="col-3 content-list">
        <Card className="overflow-auto card">
          <CardContent className="card-content">
            <h2 className="text-xl font-bold mb-4">Related Content by Vishal</h2>
            <ul className="space-y-2">
              {relatedContent.map((content) => (
                <li key={content.id}>
                  <Button
                    variant="outline"
                    className="w-full text-left"
                    onClick={() => handleVideoChange(content.videoUrl)}
                  >
                    {content.title}
                  </Button>
                </li>
              ))}
            </ul>
          </CardContent>
        </Card>
      </div>
    </div>
  );
};

export default CourseContent;
