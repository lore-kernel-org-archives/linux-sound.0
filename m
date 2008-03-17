From: "Adam J. Richter" <adam@yggdrasil.com>
Date: Mon, 17 Mar 2008 07:13:54 +0000
Subject: azillia (AMD690) too quiet in linux-2.6.25-rc3..rc6
Message-Id: <20080317071354.GA10381@freya.fugue.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

	I have a motherboard that uses the AMD am690g chip set.  Its
audio works fine under linux-2.6.24.2.  However, in linux-2.6.25-rc3
(haven't tried earlier ones) through 2.6.25-rc6 (released a couple of
hours ago), the audio is very very quiet.  If I crank up my speakers
to the maximum volume, I can hear the music playing relatively
quietly.  In comparison, if I were to do that with 2.6.24.2, it would
disturb the neighbors.  In both cases, this is with the volume set in
aumix to 100,100 (the maximum value).

	I haven't attempted to look through kernel changes from
2.6.24.2 to 2.5.25-rc3 yet, but I wanted to post this information here
to see if the problem is known or already fixed in some development
branch.

Adam Richter
