From: Derrick J Brashear <shadow@dementia.org>
Date: Thu, 22 Apr 1999 04:46:19 +0000
Subject: volume normalization with shuffled mp3s?
Message-Id: <marc-linux-sound-92475638713852@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I've digitized most of my music collection to make things easier when I
listen at home; This condenses what would be dozens of CDs and hundreds of
LPs into about 30 CDs of mp3s; However, the volume of each mp3 (or more
realistically, each album's worth) is slightly different. One approach is 
I'd run something over each file which would compute an average volume for
the track, record that, and when shuffling read the info and adjust the
volume accordingly; I'm open to ideas or suggestions of programs which
would help; I suspect I could write a gain averager but I'd rather not.

-D
