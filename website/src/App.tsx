import { AuthorsSection } from './AuthorsSection';
import { Author } from './routes/Author'
import { createBrowserRouter, RouterProvider, Outlet, Navigate } from 'react-router-dom';
import { TopBar } from './TopBar';
import { Home } from './routes/home';

function App() {

  return (
    <>
      <RouterProvider router={router}/>
    </>
  )
}

const Layout = () => (
  <>
    <TopBar />
    <AuthorsSection />
    <Outlet/>
  </>
)

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
      path: "/authors/67208",
      element: <Author number={67208} />
    },
    {
      path: "/authors/67209",
      element: <Author number={67209} />
    },
    {
      path: "/authors/67210",
      element: <Author number={67210} />
    },
    {
      path: "/authors/67211",
      element: <Author number={67211} />
    },
    {
      "path": "*",
      "element": <Navigate to="/" />
    }
  ]
}
])

export default App
