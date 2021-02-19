Book.create([{
  title: 'El palacio sin mascaras',
  isbn:  'ADC1267',
  author: 'German Castro Caicedo',
  editorial: 'Las vegas editorial',
  publication_year: '1995-02-10',
  photo: 'https://example-photo.jpg',
}])

Genre.create([{
      name: 'Action',
      photo: 'https://example-photo.jpg'
  },{
      name: 'Comedy',
      photo: 'https://example-photo.jpg'
  },{
      name: 'Drama',
      photo: 'https://example-photo.jpg'
  },{
      name: 'Fantasy',
      photo: 'https://example-photo.jpg'
  },{
      name: 'Horror',
      photo: 'https://example-photo.jpg'
  },{
      name: 'Mystery',
      photo: 'https://example-photo.jpg'
  },{
      name: 'Romance',
      photo: 'https://example-photo.jpg'
  }
])

BookGenre.create([
  { book_id: 1, genre_id: 1 },
  { book_id: 1, genre_id: 3 },
  { book_id: 1, genre_id: 4 },
  { book_id: 3, genre_id: 3 },
  { book_id: 3, genre_id: 6 }
])
