import { AuthorsSection } from './AuthorsSection';
import { Author } from './routes/Author'
import { createBrowserRouter, RouterProvider, Outlet } from 'react-router-dom';
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
      element: <Author name={"Francisco Barreiras"} />
    },
    {
      path: "/authors/67209",
      element: <Author name={"Tomás Carvalho"} />
    },
    {
      path: "/authors/67210",
      element: <Author name={"Miguel Palma"} />
    },
    {
      path: "/authors/67211",
      element: <Author name={"Alexandre Madeira"} />
    }
  ]
}
])

export default App
