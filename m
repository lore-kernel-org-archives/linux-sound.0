Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5219B54F86
	for <linux-sound@vger.kernel.org>; Sun, 28 Apr 2024 09:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714297047; cv=none; b=uK29nz9P49BrYCGXDacakDDJp4sC7AKvqxxhxPap4cI+ALuh/N94FjBx7dGL2LxxzvAg5kIh4Wu+GefoV8/ww/0UhshKh8k0BuZW6jMj5Wk+I+KEsJuTOHKTu1osYkeKb6cf5I7uhe7CPut5Gmz++DrpLUfe8tfxgeEVZUbeFcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714297047; c=relaxed/simple;
	bh=ZjlktYOkymbuVC/0Yq1DisTzunF2Vvg5gIYZDC9QWrY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cIN3VDqcSny3h8gDTK0kB3QLrZcGPUrfoufafsmlJokr2XeBhZ2dhIVdBaCKAsiUQVwZl//cWrlQpBWbDml2wiJ1SdUIcO6M8bKqktEI2H63aa4W1FfAMEc3/6Ii84gWsByGb+zUn0RNGXkKsl0/qXvr9OmUXSOVDHOFP4scajU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=O15hEXE7; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="O15hEXE7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1714297037; x=1714901837;
	i=oswald.buddenhagen@gmx.de;
	bh=d1y2Sl4aPtixLg10f/epbjxh9byB+m2lFU0ZQvAkpMs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=O15hEXE79uxKNJbre5v85jMT4hEj5fA0oXUnJnCQFpIig+Hl4dW3T0vrIaLWr5zr
	 uwyJIueYptbvCbEAgo8vQ78PDP0nq5QRDjlmJxB1XoW044L477phk/LW6TfdIuVb9
	 d7Lz12FS7OjhEhaYwkM6Yt3c7xrLVn4LbeWTRiq6ddst0MURCUlKpbrYs9St9l77V
	 tjNZyJPSIkJV9nsn+N2ZFQNTfiq6Fp46iCMxPx5ZLjmF1eupZxO9l23U4qBu4itCP
	 1QwoaNZ+38JKskEqeWFA3gFtCjZTtwmiimvmLsL++N9yB8LC/i/NpuZpKdmaV0g48
	 wBULjYfwjzcMdmC1PA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.124]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N17YY-1sgUmV0goc-012Wog; Sun, 28
 Apr 2024 11:37:17 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1s10yC-Q7i-00; Sun, 28 Apr 2024 11:37:16 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH v2 1/6] ALSA: emu10k1: fix E-MU card dock presence monitoring
Date: Sun, 28 Apr 2024 11:37:11 +0200
Message-ID: <20240428093716.3198666-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240428093716.3198666-1-oswald.buddenhagen@gmx.de>
References: <20240428093716.3198666-1-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ePNZuKFlcBP7sZfHG9OW1IWcnPTQzjBCBVD8CCaqGHsinBfzej2
 a9pXbiS03zud+YkSfKjHUw57IV/bboejlMjWLSZ3rqWVPSOSU67rfH/mr0ub4rG6FcrSs+V
 ZiEUQMuTp7hINLqlny4yTuwaKeVYVunabYb+UtBIqkEjnUMlUydvynuODg3+g9/tylFGVJW
 bA7l0AIFYU3+4HqePvo6Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:783CvpRIXU0=;upyYVDiFVCCmkvPeznzctJVAt9s
 IQwKK9SSKHRA+ony+iD6zCkyyz98TYGfD0/YdX5iXdK3nRhgIqJ76GkY8wPvccYIHUUYkocXJ
 wtZGoJ5U9AZfXkfQGZmKb2fXJJsQiP5c0tEyNu2tONCgKcDTLTzT6Vxfq/VC3JNTU9Uv+/ah2
 pWG6RbXCUoknqJGkhERxPiM7RM/RoGYWWObLBikAIdsBzFBkIGG1LsKKWjUWr0qAqbUtgWCcE
 hJ0seUTgJt43hcsVL/XfEWyptzdEMEDeJ8CaR/PGoLCtpVWOcSTkyxXdziWCTllAhzdqGhTYx
 iLuip/mKRIoiNduYqmjBa/Lum6IJ+nK7y6KIrSmQwC9qbOI2vlpChZzo2UaOZXiER7EAiNaJa
 aZr3aEqtK6PDwDciDL4Lm6Yt4Uv0S/xXMn84wG/GIZmp7Yc4wBLt6lTyI2IIgiK9iyqEGVXrj
 nEb2sDQwATRWBajDVi2esVLqPnYih/0hclh8Kz/dv3lFBeALQkGIdDTQ5aom8gA3PswHvOSzD
 BxdXeqaCfP88TvJKJJ+ygVLIk5fES+ND43cLDY4RNx5olXWZG/WQ0dvMpzHvvk3dK+eWhVWhs
 eNlgImF+BnYc7f9z8Jw3Tg515BlOVaDGzC8oE3ukd1YEvs0c/gx7UYEJzyepacAS/y4XdqaxS
 23bxv/w+WOVLU4c0SUs3j6PMMAmd8UZAaf7V7TNFctRn5nLyXtb3DBYDs06IbKQVjqWlccR56
 IP3mBkj6deHixGQHOazrq83leZIt2dAuL1kbOMx0G+LE75WT39Zs2M0NVmc+48tYv+92MuR+p
 7z8cau6txo9sUBDtm5jLWlx2xQ0eJmspvuIL6ijtXLD3Y=

While there are two separate IRQ status bits for dock attach and detach,
the hardware appears to mix them up more or less randomly, making them
useless for tracking what actually happened. It is much safer to check
the dock status separately and proceed based on that, as the old polling
code did.

Note that the code assumes that only the dock can be hot-plugged - if
other option card bits changed, the logic would break.

Fixes: fbb64eedf5a3 ("ALSA: emu10k1: make E-MU dock monitoring interrupt-dr=
iven")
Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D218584
Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_main.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_main.c b/sound/pci/emu10k1/emu10k1_m=
ain.c
index de5c41e578e1..85f70368a27d 100644
--- a/sound/pci/emu10k1/emu10k1_main.c
+++ b/sound/pci/emu10k1/emu10k1_main.c
@@ -778,6 +778,11 @@ static void emu1010_firmware_work(struct work_struct *=
work)
 		msleep(10);
 		/* Unmute all. Default is muted after a firmware load */
 		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
+	} else if (!(reg & EMU_HANA_OPTION_DOCK_ONLINE)) {
+		/* Audio Dock removed */
+		dev_info(emu->card->dev, "emu1010: Audio Dock detached\n");
+		/* The hardware auto-mutes all, so we unmute again */
+		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
 	}
 }
=20
@@ -810,14 +815,12 @@ static void emu1010_interrupt(struct snd_emu10k1 *emu)
 	u32 sts;
=20
 	snd_emu1010_fpga_read(emu, EMU_HANA_IRQ_STATUS, &sts);
-	if (sts & EMU_HANA_IRQ_DOCK_LOST) {
-		/* Audio Dock removed */
-		dev_info(emu->card->dev, "emu1010: Audio Dock detached\n");
-		/* The hardware auto-mutes all, so we unmute again */
-		snd_emu1010_fpga_write(emu, EMU_HANA_UNMUTE, EMU_UNMUTE);
-	} else if (sts & EMU_HANA_IRQ_DOCK) {
+
+	// The distinction of the IRQ status bits is unreliable,
+	// so we dispatch later based on option card status.
+	if (sts & (EMU_HANA_IRQ_DOCK | EMU_HANA_IRQ_DOCK_LOST))
 		schedule_work(&emu->emu1010.firmware_work);
-	}
+
 	if (sts & EMU_HANA_IRQ_WCLK_CHANGED)
 		schedule_work(&emu->emu1010.clock_work);
 }
--=20
2.44.0.701.g2cf7baacf3.dirty

