From: "Adam M. Costello" <amc@cs.berkeley.edu>
Date: Thu, 04 May 2000 00:45:17 +0000
Subject: Re: MP3 to AIFF
Message-Id: <marc-linux-sound-95740649719599@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95736435308653@msgid-missing>
In-Reply-To: <marc-linux-sound-95736435308653@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

The Fresh Prince of Darkness <ghstwrtr@evilgenius.net> wrote:

> Does anyone have a good linux app for converting MP3s to AIFF?

mpg123 is a good MP3 decoder:
http://www.mpg123.de/

mp3info is a good MP3 inspection tool:
ftp://bimbo.hive.no/pub/mp3info/

sox is a good non-MP3 audio format converter:
http://home.sprynet.com/~cbagwell/sox.html

Here's a script for gluing them together:
http://www.cs.berkeley.edu/~amc/utils/#mp3to

AMC
