From: "Adam J. Richter" <adam@yggdrasil.com>
Date: Sat, 05 Jan 2002 23:39:38 +0000
Subject: Re: Patch: linux-2.5.2-pre8/drivers/sound compilation fixes: MINOR-->minor
Message-Id: <marc-linux-sound-101027401129007@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-101023153926621@msgid-missing>
In-Reply-To: <marc-linux-sound-101023153926621@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>From: Pete Zaitcev <zaitcev@redhat.com>

>> 	Doing a global replace of "MINOR(" with "minor(" in all
>> .c files in linux/drivers/sound allows all of the sound drivers
>> to compile (at least as modules on x86).  [...]

>You did not change ymfpci, why? Linus fixed it already?

	linux-2.5.2-pre8/drivers/sound/ymfpci.c compiles without
errors or warnings, unmodified.

Adam J. Richter     __     ______________   4880 Stevens Creek Blvd, Suite 104
adam@yggdrasil.com     \ /                  San Jose, California 95129-1034
+1 408 261-6630         | g g d r a s i l   United States of America
fax +1 408 261-6631      "Free Software For The Rest Of Us."
