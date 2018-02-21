From: Muni Sekhar <munisekharrms@gmail.com>
Date: Wed, 21 Feb 2018 11:52:33 +0000
Subject: audio CODEC(CS42888) test
Message-Id: <CAHhAz+jSpSD9R9-icgi6PvjeQUJbnaU38kJuLaLZJdFPU4nMFA@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-sound@vger.kernel.org

Hi All,


I’m having a sound hardware which contains an analogue audio
CODEC(CS42888) and configuring the CODEC is performed over SPI bus.


I noticed that linux kernel already had a driver(snd-soc-cs42xx8.ko)
for this, I planned to use this driver.


Basically I’d like to perform loopback test and compare the sent and
received files to verify data fidelity. Also the test to be repeated
for various data rates and data formats.


I’d like to know how to test this loopback scenario?


I appreciate any help.


-- 
Thanks,
Sekhar
