# WAVSEP - The Web Application Vulnerability Scanner Evaluation Project

## w4af test application

WAVSEP is  vulnerable web application designed to help assessing the features, quality and accuracy of web application vulnerability scanners.
This evaluation platform contains a collection of unique vulnerable web pages that can be used to test the various properties of web application scanners.

## Building

The project builds with maven:

```
mvn install
```

## Running locally

You can run the project on a local Jetty server using the Jetty Maven plugin:

```
mvn jetty:run
```

## Docker

### Building

To build the docker image, after the maven build, simply:

```
docker build -t wavesep-jetty-runner .
```

### Running

To launch the docker jetty runner:

```
docker run -p 8080:8098 wavesep-jetty-runner
```

## Copyright

WAVSEP - The Web Application Vulnerability Scanner Evaluation Project.

Copyright (C) 2014, Shay Chen.
Docker, maven, jetty integration, Copyright (C) 2022, Arthur Taylor

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see [https://www.gnu.org/licenses](https://www.gnu.org/licenses).
