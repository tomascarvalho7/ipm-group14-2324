import { AuthorsSection } from './authors';
import { Home } from './routes/home';
import { AuthorA } from './routes/authorA'
import { createBrowserRouter, RouterProvider, Outlet } from 'react-router-dom';
import './App.css'

function App() {

  return (
    <>
      
      <RouterProvider router={router}/>
      
    </>
  )
}

const Layout = () => (
  <>
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
      path: "/authors/francisco",
      element: <AuthorA name={"Francisco Barreiras"} />
    },
    {
      path: "/authors/tomas",
      element: <AuthorA name={"Tomás Carvalho"} />
    },
    {
      path: "/authors/miguel",
      element: <AuthorA name={"Miguel Palma"} />
    },
    {
      path: "/authors/alex",
      element: <AuthorA name={"Alexandre Madeira"} />
    }
  ]
}
])

export default App
