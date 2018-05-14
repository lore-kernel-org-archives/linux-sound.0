From: Muni Sekhar <munisekharrms@gmail.com>
Date: Mon, 14 May 2018 12:53:41 +0000
Subject: sound: aplay\arecord audio frame flow
Message-Id: <CAHhAz+itiVWKN7aiCJX17_6iHbyzdr2_4hr8=PB-=gCyzxMthg@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org

[ Please keep me in CC as I'm not subscribed to the list]

Hi All,

Is there anyway in the kernel sound subsystem to know when the
application calls ‘aplay’ and anything starts playing?

Also for arecord\aplay, Is there any way from kernel's point of view
to know when it receives for example the first and last audio frames?


-- 
Thanks,
Sekhar
