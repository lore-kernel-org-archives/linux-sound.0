From: Pete Zaitcev <zaitcev@redhat.com>
Date: Sat, 05 Jan 2002 20:28:58 +0000
Subject: Re: Patch: linux-2.5.2-pre8/drivers/sound compilation fixes: MINOR-->minor
Message-Id: <marc-linux-sound-101026401907691@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-101023153926621@msgid-missing>
In-Reply-To: <marc-linux-sound-101023153926621@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> 	Doing a global replace of "MINOR(" with "minor(" in all
> .c files in linux/drivers/sound allows all of the sound drivers
> to compile (at least as modules on x86).  [...]

You did not change ymfpci, why? Linus fixed it already?

-- Pete
