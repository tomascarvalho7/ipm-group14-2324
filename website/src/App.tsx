import { AuthorsSection } from './authors';
import { Home } from './routes/home';
import { AuthorA } from './routes/authorA'
import { createBrowserRouter, RouterProvider, Outlet } from 'react-router-dom';
import { TopBar } from './TopBar';

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
      element: <AuthorA name={"Francisco Barreiras"} />
    },
    {
      path: "/authors/67209",
      element: <AuthorA name={"Tomás Carvalho"} />
    },
    {
      path: "/authors/67210",
      element: <AuthorA name={"Miguel Palma"} />
    },
    {
      path: "/authors/67211",
      element: <AuthorA name={"Alexandre Madeira"} />
    }
  ]
}
])

export default App
