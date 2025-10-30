/* eslint-disable no-console */
/* eslint-disable no-restricted-syntax */
/* eslint-disable no-await-in-loop */
/* eslint-disable no-template-curly-in-string */
const path = require('path')
const { copyFile, readdir, mkdir } = require('fs/promises')

const copyDirectory = async (dir, file, type, destinationPath) => {
  const source = path.join(dir, file)

  const destinationDir = path.join(destinationPath, type)
  await mkdir(destinationDir, { recursive: true })

  const destination = path.join(destinationDir, file)
  await copyFile(source, destination)
}

const handle = async () => {
  const types = {
    outline: 'outline',
    filled: 'filled',
  }
  const destinationPath = path.join(
    __dirname,
    '..',
    'lib',
    'assets',
    'svgs',
    'tabler',
  )
  let copiedIcons = 0

  for (const [type, dirPath] of Object.entries(types)) {
    const dir = path.join(__dirname, '..', 'node_modules', '@tabler', 'icons', 'icons', dirPath)
    const files = await readdir(dir)

    for (const file of files) {
      await copyDirectory(dir, file, type, destinationPath)

      copiedIcons++
    }
  }

  return copiedIcons
}

handle().then((count) => console.log(`${count} icons exported`))
