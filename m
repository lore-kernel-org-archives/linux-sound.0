From: Erik de Castro Lopo <erikd@zip.com.au>
Date: Mon, 15 Mar 1999 08:10:50 +0000
Subject: Re: sound editing tool for split/join/loop
Message-Id: <marc-linux-sound-92148613900544@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92147901029802@msgid-missing>
In-Reply-To: <marc-linux-sound-92147901029802@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Roy-Anders Larsen wrote:
> 
> I have been looking around for good sound tools and found that sox can do
> a whole lot with sound, however there are a few things I'd like to do to
> sound files that sox will not let me:
> I'd like to be able to split a stereo file into two mono files (one for
> left and one for right), then edit those files then join the two mono
> files into a stereo file.
> I'l like to set the loop in a wav file so the sound repeats itself if I
> play it.
> Does anyone know of any good/not so good way of doing this in linux ?

I have just released a C library for reading and writing sound files.
Using this library, writing an application to split a multichannel
files into mono files would be trivial. Unfortunately the library does 
not yet handle looping although I plan on adding this later.

The library is availaible at:

	http://www.zip.com.au/~erikd/libsndfile/

Hope this helps,
Erik
-- 
+-------------------------------------------------+
     Erik de Castro Lopo     erikd@zip.com.au
+-------------------------------------------------+
"Even in the area of anticompetitive conduct, Microsoft is mainly an
imitator." -- Ralph Nader (1998/11/11)
