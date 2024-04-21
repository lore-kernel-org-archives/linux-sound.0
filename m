Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76EF3D978
	for <linux-sound@vger.kernel.org>; Sun, 21 Apr 2024 20:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713732442; cv=none; b=SQAb61qpXWPWd1ZnnXdElDXQ4BqJ5CswvcbB2PGmiWTErBPa11Br/5niLwdCz7iZ3Vm/Zw7KeoNk3h1by0PpvyNLeH4NS8zaFAFaDWLUbojCUs5XG9goraZHV2Unq/nSWa9hYGW8WlmxOzg0u6wCSB/6BNKnFky0znZkyUltv6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713732442; c=relaxed/simple;
	bh=4RkRE9rzJMG18/5jzqZ+XaQG83hPlcjC9s4hIXGnsV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eZPg81wQnaCVs0zXmdA6EmIO35Aa6eAsEYRoEV9PFe8U/ssKZrL+cR7rQOpBXzIpG6DxODM5unXx8U3RZM4ipmYTtvkkhfsfSV3R9Jnbt+tKa19yWNVRRjgKpnUkNLtZDAzog9CfoI/ryFTxZT1G9QjnSQGRiT1ilZXHyoAL8Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b=uZI63p53; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=oswald.buddenhagen@gmx.de header.b="uZI63p53"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1713732428; x=1714337228;
	i=oswald.buddenhagen@gmx.de;
	bh=9H0nQdNyd4uDsmIBqCh/lsoqusbudeEOWxCPrdNSiaU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=uZI63p53+dcArrO6i/8Cg9rkPES+aZI2AHdKvEdEvVYkr1c07vuPmiCz1AOiSen3
	 vnjQpc878p00RXQPg+H3HDs9umm27pGpUUdfRUMKragzoGlRXKg3YcCZU9GbzAnRa
	 oukNI2q3kHyyoy9TbD8IuhwvH4XlBsvvAlbZ6+vKqfzWbTeP7f7JY4DAwth60muXn
	 NNiPJc5jDdS5p5Mxsw9Ag7kHe7KSiHXwdjVcotGaEcCujTnuygQGGxHt+YvqpxVlV
	 IJtpc9lpbu5gFEh8/+2Nis1le5oDh/dqQTi7myLRRieq9UX92aMHHQ/mMF3bJSPRn
	 OEufLfQzmzIxcu+Vbw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from ugly.fritz.box ([89.247.162.112]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MHoRA-1rte9q1nxm-00Es4q; Sun, 21
 Apr 2024 22:47:08 +0200
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1rye5b-RAM-00; Sun, 21 Apr 2024 22:47:07 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Pietro Caruso <pietrocaruso50@gmail.com>
Subject: [PATCH 01/10] ALSA: emu10k1: fix E-MU card dock presence monitoring
Date: Sun, 21 Apr 2024 22:46:58 +0200
Message-ID: <20240421204707.2487686-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.44.0.701.g2cf7baacf3.dirty
In-Reply-To: <20240421204707.2487686-1-oswald.buddenhagen@gmx.de>
References: <20240421204707.2487686-1-oswald.buddenhagen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VUfx5T+p0cEDdCIaccEL1g7O3zbsF+EGnETnhazoQNqv86xA0qd
 aXvRZAKcH0A2VC9UrRWrysGy30V5VUo5BGANYALATja715WRkO7VBJmxZ/bCY8x6obrp0Bb
 /mzHu9vFVK/d/nV3cOl8SNAO15EbhcPoicRKuAwq7XDhvZHeoyh7UcOMGSzRMA1oQknwyEl
 8IHnykdN9z7v//ajv+NJQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eDGA7FxfjVE=;1AYpDczmVUvOsIEtp8z6ArRhaRk
 3ez0zzaDbE6jw/QzNc8WXlvb7dFO5N/xWVgy2TiSHecGtSrSFUtmYVm2EasL3FmXgr0OOdaZg
 A9gzi/E/P/Yv6RxQt7SwOFuPSLuUx3E8JhA4WSz0yAz/bFwDYIv1ak+1U9hYe/blEvG6BRJUR
 WSPxV0wiAzRpCmGgWayqZSJNxP1NioK9P8lOKykCBbgQfL8o8yhZTzmkbs+qu8IJYHkdos51k
 tZaJCCJP9DmwaEb/iN2XVQIUyC1W2LKqVXptVm6J850XsCRz5sll81l6LOs+jVE9RZOIUJFX7
 tGZFunrKeA5iROTHnt6m2Fk/xo8Fz41Et27GkBkRHnraM2b7Y6ZotfHbW7OI0emC4Z3wGDhml
 JwbxOND5j5xvgyCrrlW2PWIJUp2YBft4UNMbQfPFjQnIARcRTnavJBCJocT8Y3ZDFiCOMjVXg
 JkHhfYIe+OiJcU5EC+pMxzYkk+bolu6Rd2TjRGeaqqxW4cmiJARB0R9hbrXKmu80Vg6qCjNL3
 wP0mEkPdNQSonX1M0PByB0WK9HSjCC+cniEU4gjv7b3AS1bSKixrQT2zGtmiz7X/k9SuCpfNP
 amoLDz2VPxX9X5etRGHAOf7H7bT0JMJtIN5sVyuW8C6TSYh/YCHWaUAZScE2gW/ZXSufcZ7SV
 pLjPGAvcdD9KkFhHrTEWjrYtkm/fvgSu92ukXOeu4RaIwxO/JRGggUxlz1BHiZU92ggQczPIb
 nqGYYsAl0OHpWJTWHJJAqBLO5qtR9Srf3s0LROljjarKELP3su6abB+QaWMIFq0fa1wXP+u1e
 CQUzdaY/wZY9W2vmRnnaQRINK1wIlqUnprk556b2f2uYU=

While there are two separate IRQ status bits for dock attach and detach,
the hardware appears to mix them up more or less randomly, making them
useless for tracking what actually happened. It is much safer to check
the dock status separately and proceed based on that, as the old polling
code did.

Note that the code assumes that only the dock can be hot-plugged - if
other option card bits changed, the logic would break.

Fixes: fbb64eedf5a3 (ALSA: emu10k1: make E-MU dock monitoring interrupt-dri=
ven)
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

