Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E44455C2E
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 09:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714297051; cv=none; b=Uo4J16M+8VnzC1N04byJyKx9sueDWsaTTDej8joRbe7DZ1+EXBrOQc4+tYGCOB18fr9THogG8RKAiVH9Dy1LFyw2qa3q1QsF4sLRLf2UBiS49VKvhv2qu15q72YvCUe4zINGQzazyAp3q7RkNUGQItrXz+DvheajkVus7sFkeW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714297051; c=relaxed/simple;
	bh=/VWMnyWMQNKQ9OS33OE0stKKSQIJwNxtPZUaRxakBzs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QXpFKJwsfWI4eKGSCl90MLwqGJjmYz4Of6ORrOoYS0O8R3V2F90P4YKzpF+jL6y5iUC68hjIKAA6xXaALVpNh4/U3kLz2DDapSG7Twecsha73zEZlEGN8StlWNWAEmTpr+X7DdDvF0UOVQuQ57nDhEr/kDZ0lQ/noZI3mExlAnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=uC63zqEi; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="uC63zqEi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1714297037; x=1714901837;
	i=oswald.buddenhagen@gmx.de;
	bh=BaDioJJvx5SP2DKddmfPkbklNxD9FGkeF2ayGtHG2VA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uC63zqEiard8OSqCoESOlCseBUktN5qdJPVzhoHYCNLJhEMBQ40FoIhtctS+pvFv
	 6MiH8dlpJ1T4YyIMVUI+mkfU9rR8QY9VJFgAsH9icJCPBJpBTH7GWTTvre2nPtJt7
	 Mrql92Rrl8Forn3obkXDJpOlQrYxDJLy0gkwi5tpxQ7QAwsnCAZyDb49f1azEhmjI
	 Y0yz+MIi/JscTThTdHz2ZCUVaPAH+YkWSdC3g1hpt3l5h5hHcA7kpfMsnB5GWhAMJ
	 pDObCBsglCH3K52ytun89l/T11s3k10PD8IYFiXU1GmagFeQDGmTNt+fg8az+/TPh
	 i+kK/POOf8KB0Y/GNg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.124]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MmlT2-1sPwOx0JxG-00iNzQ; Sun, 28
 Apr 2024 11:37:17 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1s10yC-Q7d-00; Sun, 28 Apr 2024 11:37:16 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH v2 0/6] ALSA: emu10k1: fixes related to uploading firmware to the E-MU dock
Date: Sun, 28 Apr 2024 11:37:10 +0200
Message-ID: <20240428093716.3198666-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:HYP4akhJ+ehEFUfIp0luxZDbjaWobcLvkHg4V7Y72RxPZpzHS4z
 Ze6vfwzXeoCAOOrx8lQc5KEhUpyb6tLJJoJzJzCwbvpIcVasFkM/ZV2r0B4u+7AOVSSjlwJ
 3r2cvcvJdD6685J7gO8Z4evHWGWZn+eWk28ss5xArbiGPcZN284SVzy9r0GL0Q2dALoWRVZ
 OBSeH2lGv9tezMtYzGH6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vidOd6ABscU=;wWNQKblq5J++MKjHLPn8JpQLpLW
 rJ1OI5HrE9Rte5Pec2/IGdBxqduA3P+k904637pFrBQDYejKBKkywbw5gG/kbQs4wHbEaQqmW
 RRkcExVo9CIwo3GYVpv7m90bKYe9/Vt/MZs9rNt0Mky+TL10rLOhay3bOKau8uC3LNzXya+q9
 NOEsxglxXWfh/tGiQAwJj6yLlrLQkQGkRtfstsxYeFt4Q6eK5QN2CgzJBfPQLeTGLLWocu6PR
 tiMmiUaTfyXW24ySFuRBIpTUcIXdIlA9XHWjx3bAfXnCv66+l0mJ9/0YvA71wd5xSabH4uJjY
 byhAkYgdo+cy2/6DzwN3Ej5Qm32ISdK2WBu5CHge9PJlz+GwN928kORftBMtJii9q2htOiEHw
 7/ywVT/2X1cPXouizINyM4JxNzCT0TYRz/yX6i0gh5Z9knioTTlbrV2MJ1NLErfcsLJP+6btp
 fM8qmzYcYmOIBjZOPJR2zaluCNnrLdokRnTZV7VcmXhQ+CzertzrG/vLEJlvaWYbMRiX5kos0
 b/qk3ijJi2w+i4Sfohxsk/uHvwoyoNXPgtrJ7tGX/BLNgrGCLpzGGfUPDJvgrmC3DIX8BXRwa
 NeR2mi0lBvLxeMalV6bUIb9XZGuAV7PIHwy4rgPNhTC1kgf0TjV2R9r/LnoVShfYs+WHtUHHT
 p2EkYESdXZEIKhggWFObcc2l7lGRvZ42ihru65vmNlIIEHsEYCkCBvHB3/3W+8JfBEsg89koZ
 DoqC4Gj4xfgT2nLAAyJ6OsOem0rQDhp4dSWh5hPChTCZnIfXIFR2ONtJikvAfMK/fZT+i4oOd
 eo+dtcjxaTHuKQtjZs2L0QT7XqPT1vFoz6apK1R8M0I+c=

patches 1, 3 & 5 fix the regression(s), patch 4 fixes a related pre-existing
problem, patch 6 is a speculative fix on top of patch 4, and patch 2 is
logically part of patch 3, just factored out for legibility.

i don't think it really makes sense to revert fbb64eedf5a3 (ALSA: emu10k1: =
make
E-MU dock monitoring interrupt-driven) and re-do things from scratch, as we=
'd
also need to revert the unrelated c960b012ec47 (ALSA: emu10k1: track loss of
external clock on E-MU cards) first.

so i'd just fast-track the series as-is, and cherry-pick it to stable.

---

the series (and a bunch of failed experiments) is fully tested by pietro wi=
th
both rev1 and rev2 1010 cards, a 0202 cardbus card, and their respective do=
cks.
he'll get permanent testing credits in the card capability table later on, =
so i
didn't bother adding a tested-by footer to each patch.

---
v2:
- split off non-bugfix part of the series
- add quotes around summaries in Fixes footers

Oswald Buddenhagen (6):
  ALSA: emu10k1: fix E-MU card dock presence monitoring
  ALSA: emu10k1: factor out snd_emu1010_load_dock_firmware()
  ALSA: emu10k1: move the whole GPIO event handling to the workqueue
  ALSA: emu10k1: use mutex for E-MU FPGA access locking
  ALSA: emu10k1: fix E-MU dock initialization
  ALSA: emu10k1: make E-MU FPGA writes potentially more reliable

 include/sound/emu10k1.h          |   7 +-
 sound/pci/emu10k1/emu10k1.c      |   3 +-
 sound/pci/emu10k1/emu10k1_main.c | 158 ++++++++++++++++++-------------
 sound/pci/emu10k1/emumixer.c     |  18 +++-
 sound/pci/emu10k1/emuproc.c      |   9 ++
 sound/pci/emu10k1/io.c           |  51 +++++-----
 6 files changed, 142 insertions(+), 104 deletions(-)

--=20
2.44.0.701.g2cf7baacf3.dirty

