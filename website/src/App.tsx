import { AuthorsSection } from './AuthorsSection';
import { Author } from './routes/Author'
import { createBrowserRouter, RouterProvider, Outlet, Navigate } from 'react-router-dom';
import { TopBar } from './TopBar';
import { Home } from './routes/Home';

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
      path: "/authors/:number",
      element: <Author />
    },
    {
      path: "*",
      element: <Navigate to="/" />
    }
  ]
}
])

export default App
