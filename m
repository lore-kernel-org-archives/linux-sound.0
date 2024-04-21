Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAF917C98
	for <linux-sound@vger.kernel.org>; Sun, 21 Apr 2024 20:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713732443; cv=none; b=m119ecxFxbkvrrPP8DolKqxG7tJbbia9+11J/gyoeWAlis64KCi/L4Xky5MxTZJOp0AXoTJbAYVPMnfuhvFpFRfUZ8JS792fPYDm0tldvuQwkO+oQgSwqwKZzVnE1BkBXwTKhuXLJLXZshE7zllLKOlE2If7VkdZsI2OZqqTLtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713732443; c=relaxed/simple;
	bh=2Klus/fSfOSFDRsFitGZmgaJq0NcYroOgb1dgfVaQDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=POQ75Wkt78ykpubXIP/TRO1vU5k7j3msMyZwEJdLvot6kLkK/43KkziXNDeXTsehKE/Log1K29+U/XjLaYlEthJ2WF0d6cHBA95WaqyfWiJ6IXs3siA6JPC5xn/MPzpMe4OM2H/7XKGAb1XWHueAo6HQakQcG5rbTxRcoq95pTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=deLeLkaQ; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="deLeLkaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713732428; x=1714337228;
	i=oswald.buddenhagen@gmx.de;
	bh=5FZa+VZFjlOTCrsWht1bIfeiVR/oumZ8B6qZl8p6I40=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=deLeLkaQwmuoK7l/j4rPDwMunK/bsvovzPMiPpC+R6OYQsRgrulAvsQ5HUZANM1I
	 sD0R7EPRUVG+3AGIuuEGMCgS/5c5oraRdPJfZb+2NUU+y5fSehMqwrzaXBml2IuT0
	 2TE03RNpgzqHNF7ppTSJxGibslelIyzhtJFv+lrLUU5RnGRL53puVfTtNOcUr4Uqz
	 O01w3Dz8AQ+NRY+5VDsAo6I/hP5v/jNKfHWjCwxqnTgrhUTadpx9OSwxa59ZM73Dx
	 OPQEKuS6qqLQUFHTpMIy8qAkavcu+Ik8nxC3gPYx/KuvranhnlahOSg2J/ySAwdJZ
	 jgYg+ZYeMPC06yJKmw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.112]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M42nY-1rye5c2JJg-0004Oq; Sun, 21
 Apr 2024 22:47:08 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rye5b-RAH-00; Sun, 21 Apr 2024 22:47:07 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH 00/10] ALSA: emu10k1: fixes related to uploading firmware to the E-MU dock
Date: Sun, 21 Apr 2024 22:46:57 +0200
Message-ID: <20240421204707.2487686-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3FyyRUWWlPKnI6dEMYNBJzenU1nrhf05psq6jiwuaRTQsHRzo3b
 jFczDaj8M8viXS5eRpg676X9WKw2CcC/o9DUD2jglo1KQQ+A1DT8lRNVqDvt44TURAoo667
 dxYYiSK1sAejYL912ZKq+NThS9fNAtYocwYo01q4lOuo7tJMbNypqMGa54zdo1o3ztwEtPZ
 7W/DUmOfJAO2D5T0H6CFQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:0eC6M+qYmT8=;gYz/vFaxvBQdC65iQ7+I+qY8HX/
 iEktEceMwdx5aKgWGmNnQ0QaKuOJc1/sfCUHlYtcEV8IiYL+favWvFeW2SHEvUv66PV8QD4vn
 e99LMmX7qA5k5gDM7IIEOA4TNWA+9Spbk+TRiojzBi+UJZhuUCu6wHoCGXhlA0f4VmppskDSF
 No9M1ty3Gd25EEQBqSRoGYNtC5uhSvfkcz1nF0IfAGtHMkbDwyzzBpT5mOLsCw6RPFz2Pn+HE
 ZxQYBj8JOMQGeIY69fSEDmDxRS/1SZ6tdocHJWR0K4HkEszQdD5Y5BJZ28HQqVyu7d8d/VcQK
 aJj76I4EhqxiFm5qImt+KuV9LDK+md8jqh1rmaxUZzIdzQIgMKRlNgpA+NMLG+1qn/fu7uAOC
 EL963vMD1gRezhqLd43w5sr2kFdupac0dvq3AevYxgHpiiL1dFRPEqG6fQL2hDfR8s5JXKi2i
 7/wnkSmcIDFDOihhLoYEaU9Q89S6GD8+eg8nebXBW2poTuZ5R+IRSsHBjHBGZx8ZCWksw9mTK
 JMkMEndwtDM3S0kwYh/g0JVb8U3p7gEElcCeqj+WHiV2hBN/rzx4vDwYbY8njTm5zue5ltKsC
 GtvvmDSYgraRMNxkbW16qlhtKB3HlG4tYFoU/FJYjqavRUq+hNAMuR2YHXxHkCemvK7sm12A1
 E0dofbL4gpTM/USeGrWS7dGZ+rOUNnFeweAjYv+Iaq8Uypk7kGDmcnipdj826S1rhyxGfkDD6
 I6nOHKDt8ILvrKSBa6apm+KY2cmMx7ZcVFhuJzJDc59UwmToEPFGiMIkfgG2/Lm7WaoeN/Si+
 GwHoWl1L/4f8sHcqijob+jM66tSbCxkHueIJ9Rrt2jYNc=

patches 1-3 & 5 fix the regression(s), patch 4 fixes a related pre-existing
problem, while patches 6-10 are "only" improvements.

i don't think it really makes sense to revert fbb64eedf5a3 (ALSA: emu10k1: =
make
E-MU dock monitoring interrupt-driven) and re-do things from scratch, as we=
'd
also need to revert the unrelated c960b012ec47 (ALSA: emu10k1: track loss of
external clock on E-MU cards) first.

so i'd just go with the series as-is, and cherry-pick the four (or preferab=
ly
five) patches to stable.

---

the series (and a bunch of failed experiments) is fully tested by pietro wi=
th
both rev1 and rev2 1010 cards, a 0202 cardbus card, and their respective do=
cks.
he'll get permanent testing credits in the card capability table later on (=
if
he so wishes), so i didn't bother adding a tested-by footer to each patch.

Oswald Buddenhagen (10):
  ALSA: emu10k1: fix E-MU card dock presence monitoring
  ALSA: emu10k1: factor out snd_emu1010_load_dock_firmware()
  ALSA: emu10k1: move the whole GPIO event handling to the workqueue
  ALSA: emu10k1: use mutex for E-MU FPGA access locking
  ALSA: emu10k1: fix E-MU dock initialization
  ALSA: emu10k1: simplify E-MU card FPGA reset sequence
  ALSA: emu10k1: make snd_emu1010_load_firmware_entry() void
  ALSA: emu10k1: move entering E-MU card FPGA programming mode
  ALSA: emu10k1: move snd_emu1010_load_firmware_entry() to io.c
  ALSA: emu10k1: make E-MU FPGA writes potentially more reliable

 include/sound/emu10k1.h          |   8 +-
 sound/pci/emu10k1/emu10k1.c      |   3 +-
 sound/pci/emu10k1/emu10k1_main.c | 225 +++++++++++++------------------
 sound/pci/emu10k1/emumixer.c     |  18 ++-
 sound/pci/emu10k1/emuproc.c      |   9 ++
 sound/pci/emu10k1/io.c           | 104 ++++++++++----
 6 files changed, 195 insertions(+), 172 deletions(-)

--=20
2.44.0.701.g2cf7baacf3.dirty

