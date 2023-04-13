From: Muni Sekhar <munisekharrms@gmail.com>
Date: Thu, 13 Apr 2023 13:49:31 +0000
Subject: ALSA: arecord : silennce recorded as 0x80
Message-Id: <CAHhAz+haVH-4Hgsz0PpTgUSW1pX4XxwxXwEd7nLVb0sFFwQwCg@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, kernelnewbies <kernelnewbies@kernelnewbies.org>

Hi all,

I recorded the silence on the default audio card by running "arecord
-d 5 test.wav."

Once it exited, I checked the contents by running "hexdump test.wav,"
and I see that silence is recorded as a sequence of 0x80 instead of
0x00.

0000000 4952 4646 0024 8000 4157 4556 6d66 2074
0000010 0010 0000 0001 0001 1f40 0000 1f40 0000
0000020 0001 0008 6164 6174 0000 8000 8080 8080
0000030 8080 8080 8080 8080 8080 8080 8080 8080
0000040 8080 8080 8080 8080 8080 8080 8080 8080
...

What might be the reason for silence being recorded as 0x80 instead of 0x0?


-- 
Thanks,
Sekhar
