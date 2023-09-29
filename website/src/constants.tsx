export const authors = [
    { name: 'Francisco Barreiras', number: 67208 },
    { name: 'Tomás Carvalho', number: 67209 },
    { name: 'Miguel Palma', number: 67210 },
    { name: 'Alexandre Madeira', number: 67211 },
];

export function getAuthor(number: number) {
    return authors.find(author => author.number === number);
}

export const stages = [
    { number: "1" },
    { number: "2" }
]