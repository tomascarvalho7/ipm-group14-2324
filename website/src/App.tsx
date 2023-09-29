import { AuthorsSection } from './AuthorsSection';
import { Author } from './routes/Author'
import { createBrowserRouter, RouterProvider, Outlet, Navigate } from 'react-router-dom';
import { TopBar } from './TopBar';
import { useEffect, useState } from 'react';
import { StageList } from './StageList';
import { StagePage } from './routes/StagePage';
import { Home } from './routes/home';

function App() {

  return (
    <>
      <RouterProvider router={router}/>
    </>
  )
}

const Layout = () => {
  const [isTopScreenVisible, setTopScreenVisible] = useState(!window.location.href.includes("authors"));

  const toggleScreenVisibility = () => {
    setTopScreenVisible(!isTopScreenVisible);
  };

  const handleScroll = (event: { deltaY: number; }) => {
    if (event.deltaY > 0 && isTopScreenVisible) {
      // Scrolling down from the top screen to the bottom screen
      toggleScreenVisibility();
    } else if (event.deltaY < 0 && !isTopScreenVisible) {
      // Scrolling up from the bottom screen to the top screen
      toggleScreenVisibility();
    }
  };

  useEffect(() => {
    window.addEventListener('wheel', handleScroll);

    return () => {
      window.removeEventListener('wheel', handleScroll);
    };
  }, [isTopScreenVisible]);


  return (
    <div className="scrollable-two-screens">
      <div className={`top-screen ${isTopScreenVisible ? 'visible' : 'hidden'}`}>
        <TopBar showInfo={toggleScreenVisibility}/>
        <StageList showInfo={toggleScreenVisibility} />
        <AuthorsSection showInfo={toggleScreenVisibility}/>
        <div className="scroll-icon" onClick={toggleScreenVisibility}>
          <i className="bi bi-chevron-compact-down" />
        </div>
      </div>
      <div className={`bottom-screen ${isTopScreenVisible ? 'hidden' : 'visible'}`}>
        <div className="scroll-icon" onClick={toggleScreenVisibility}>
          <i className="bi bi-chevron-compact-up" />
        </div>
        <Outlet />
      </div>
    </div>
  );
};


const router = createBrowserRouter([
{
  element: <Layout/>,
  children: [
    {
      path: "/",
      element: <Home/>,
      errorElement: <Home/>
    },
    {
      path: "/authors/:number",
      element: <Author />,
      errorElement: <Home/>
    },
    {
      path: "/stages",
      element: <StagePage/>
    },
    {
      path: "*",
      element: <Navigate to="/" />
    }
  ]
}
])

export default App
