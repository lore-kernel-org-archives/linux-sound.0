Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612315;
	b=1vdxcpehyIhPCoZVQfOIXEBwKOhRokvJ6xRrUSfabOwBol/FBYIhZXaMRxzN0/iwDDZK
	 8VTCz3AiEfa9Q16ytLxDwjmXqSfVra+fxR5VNJZInhbOeCT7UzLiRkbcqT2ZcO/wpC1l+
	 4Q6+hAQDjSL0j1IJ7TiCO1LrAToWY4dpw544HMrIjia2glX6w1VdX4xS6WNsjyWI/55+B
	 oPnrAFNCSk+rK0qiihvbPYTB4B1gY82Pxa/pNzPQ0ypGRLabllxmBZY0LSPkIjpEPi09A
	 7D316HjrtpJqfcMOaDLl1V3IpsIGAULTmjt4WfSWXnLP7urM5S5ocMkqC/p6SAv+axA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=9W6SMwMnOG7tjkQ5Ri3kpEZarqiEynjz7U73u8xMxLA=;
	b=X8avTemaQRuff5qw4LmYo3Agd/xhSL4l6VznQx44RH/l1I0jFwTcrPBjM+jB8IPizdKM
	 N5/R61tbjTZ3VZbXQAckWv/nF10uDHrpd75eggxz1WTdThSBFuLAEZevohqEIXYxQ90Ae
	 IvlwoLers1AqYrSPMJcK4L6qOcOgXc3VF2UL6i92VHoP1C7PGLCjQT6bWMM6uQUOEOoyJ
	 EG7tCC5UedrApK3V/ERecS1ONHk4vdWNKCeMI1qjZBQ5on8v3JO5FXolAJza0wD10NNnZ
	 dJbjDHzOGzQTaHQVxM7mrel9PUeF1CzC2bHFbcnQMnplQTIthwk67M+f5XP71AjXQGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=lpDNggkl;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8A9606A324
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 09:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8A9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=lpDNggkl
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b125371596so27434197b3.0
        for <linux-sound@vger.kernel.org>; Mon, 02 Nov 2026 01:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793612311; x=1794217111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9W6SMwMnOG7tjkQ5Ri3kpEZarqiEynjz7U73u8xMxLA=;
        b=lpDNggkl1wdDfUyHy0IGsj330/0ITDVxw0HAC2o42SIcmmsQg4sCcTd221hmuK8Fwb
         KTrUnU+ZKoPmysoWazVFzL9sObwRnEECcVx0HkmbI3HxwBLyQ6hVhmgqdw/JhH8BROcT
         dSeXbp+Ga19xif+mRpVGQh2G8ASyiUj9r8gIJvbta0yRPyFjgteQIGqdNPRu60itDSGs
         pYmBZIvYFHPdsy6JzghVuJyaYXANwi97nSAVFQZJmg3/7mWRDv9uRNx4Xg4Jd7XB0rcE
         O/BX6zPEBvp1mfQrHihqnelbKtTQpLWZMs5yagqMjosFZeQI0qlV8VNmE+tnFiABu/R1
         AVfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612311; x=1794217111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9W6SMwMnOG7tjkQ5Ri3kpEZarqiEynjz7U73u8xMxLA=;
        b=g7A7wkgK1yTupOR7q6OSn5krH9898s3QYpy/oaNdU9/Mc+KLMI9DUa8FBHBldiNa23
         UA0yjWRHDiVtAoKjpK7daqoYaSyzGrBR/yR11bj1xdAsImNjw7q/BEBAxnwfJAvUCbo0
         Wn/vOL7CpU57tI1eBesRxmCl/dE3ve+MdsoFQgsFYNpXbUwnr+EnRq6GZMvNZ6DgPc0F
         J20yGxC/H7CFutPKhjR4VCSv6DXOiUsHdzYpdJLAMmzHrTlZbeVI+YauCQ51Ae84cvCV
         5JVKG7nfrTteD0/GZe74hNAGdLHSxUXMLAge+XPSgl7zIc0huATHIHPKPGoIeUYuC7OR
         1f5w==
X-Gm-Message-State: APuU4Z+faZSp0vq9XmOVjZC2LQODmyW1fZWclO1Nqeq7f+bJ9gZacH3S
	d7Qn8BVUnkfLrHqS3SNnrK6Cdeq1sNg1kiJsyaH4XXIT8AL1Q9fuYMQMiZQl4ntdN7CP8cspMYl
	0gPRpHg==
X-Gm-Gg: AYBFou2YRruTyNCHy90rxkuH9eyEFGnA3fEGzdBPFVhxQO8RsedPYFy6NmlIGYzpJcj
	iWfKrrQm3YFoXGFC8baFiSQO/9Ln9ZuRPySNCZF36MgIOppbqQ9VxfVOZmat9bVW6P966T+1BY0
	PMEQ7O8KZw4gw3N1tfO4UrHxsyZ7Z0I0RRBqmaY39WtNfFQ8B8xB0Op0rXXTmwase+d95io/Yfa
	5qqLnyziP3RmSv7EnXQPds+VU9RyR4R4d/IsQ8AQHzjuM59fQhjT1G+IG7CRc/BZXKpVp2y1j4C
	/WAd4iBWKMD9ZY0DJBX5jJcdHqUQltqC9G2p1AdFsW4H62RiV9pL7yFiqWnUwxfd58XFVmqJCEV
	6CLh0gRiRcTE+NRy+ZWnDjfLgpkMIOMZAJNUJH9kYXmmiTJMo6jNyWiMCeEYOB920t7rBfisJib
	bZM/wfwXvPrHxWS4obNpVizNtEmz8O/ItxT0ZzBfYdqMlJAJGv9DM6bzy48l4PriuvPI5zUr/IU
	Emczil2bZ19WFQZnIRiINyZYLEpK7f6T6zECeeyjQfkEmNH2/DAAJMduWqmAfOKwwHvkJs=
X-Received: by 2002:a05:690e:1186:b0:679:a925:edf8 with SMTP id 956f58d0204a3-67ba50a3868mr7303167d50.44.1793612310652;
        Mon, 02 Nov 2026 01:38:30 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67baf2e0937sm4731269d50.13.2026.11.02.01.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:38:29 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH v2] ALSA: ice1712: Make chip_init helpers return void
Date: Mon,  2 Nov 2026 18:38:24 +0900
Message-Id: <20261102093824.3123528-1-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

snd_ice1712_chip_init() and snd_vt1724_chip_init() always return 0, so
the error checks on their return values in the probe and resume paths
never trigger.

Change both functions to return void and remove the dead checks.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
Changes in v2:
- Rebased onto sound for-next, on top of commit d54819ee513f ("ALSA:
  ice1712: add a board-specific EEPROM initialization hook").

Link to v1: https://lore.kernel.org/all/20261101172134.3451066-3-ingyujang25@korea.ac.kr/

 sound/pci/ice1712/ice1712.c | 12 +++---------
 sound/pci/ice1712/ice1724.c | 12 +++---------
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 5481720a17ed6..2d4c9bdfb62f2 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2299,7 +2299,7 @@ static int snd_ice1712_init_eeprom(struct snd_ice1712 *ice)
 	return 0;
 }
 
-static int snd_ice1712_chip_init(struct snd_ice1712 *ice)
+static void snd_ice1712_chip_init(struct snd_ice1712 *ice)
 {
 	outb(ICE1712_RESET | ICE1712_NATIVE, ICEREG(ice, CONTROL));
 	udelay(200);
@@ -2343,8 +2343,6 @@ static int snd_ice1712_chip_init(struct snd_ice1712 *ice)
 	      ICE1712_IRQ_PBKDS | ICE1712_IRQ_CONCAP | ICE1712_IRQ_CONPBK : 0),
 	     ICEREG(ice, IRQMASK));
 	outb(0x00, ICEMT(ice, IRQ));
-
-	return 0;
 }
 
 int snd_ice1712_spdif_build_controls(struct snd_ice1712 *ice)
@@ -2517,8 +2515,7 @@ static int snd_ice1712_create(struct snd_card *card,
 	err = snd_ice1712_init_eeprom(ice);
 	if (err < 0)
 		return err;
-	if (snd_ice1712_chip_init(ice) < 0)
-		return -EIO;
+	snd_ice1712_chip_init(ice);
 
 	return 0;
 }
@@ -2696,10 +2693,7 @@ static int snd_ice1712_resume(struct device *dev)
 	else
 		rate = PRO_RATE_DEFAULT;
 
-	if (snd_ice1712_chip_init(ice) < 0) {
-		snd_card_disconnect(card);
-		return -EIO;
-	}
+	snd_ice1712_chip_init(ice);
 
 	ice->cur_rate = rate;
 
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 651d926635675..d4ed7050c533a 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2342,7 +2342,7 @@ static void snd_vt1724_chip_reset(struct snd_ice1712 *ice)
 	msleep(10);
 }
 
-static int snd_vt1724_chip_init(struct snd_ice1712 *ice)
+static void snd_vt1724_chip_init(struct snd_ice1712 *ice)
 {
 	outb(ice->eeprom.data[ICE_EEP2_SYSCONF], ICEREG1724(ice, SYS_CFG));
 	outb(ice->eeprom.data[ICE_EEP2_ACLINK], ICEREG1724(ice, AC97_CFG));
@@ -2364,8 +2364,6 @@ static int snd_vt1724_chip_init(struct snd_ice1712 *ice)
 	 * since they cause machine lockups
 	 */
 	outb(VT1724_MULTI_FIFO_ERR, ICEMT1724(ice, DMA_INT_MASK));
-
-	return 0;
 }
 
 static int snd_vt1724_spdif_build_controls(struct snd_ice1712 *ice)
@@ -2511,8 +2509,7 @@ static int snd_vt1724_create(struct snd_card *card,
 	snd_vt1724_chip_reset(ice);
 	if (snd_vt1724_read_eeprom(ice, modelname) < 0)
 		return -EIO;
-	if (snd_vt1724_chip_init(ice) < 0)
-		return -EIO;
+	snd_vt1724_chip_init(ice);
 
 	return 0;
 }
@@ -2703,10 +2700,7 @@ static int snd_vt1724_resume(struct device *dev)
 
 	snd_vt1724_chip_reset(ice);
 
-	if (snd_vt1724_chip_init(ice) < 0) {
-		snd_card_disconnect(card);
-		return -EIO;
-	}
+	snd_vt1724_chip_init(ice);
 
 	if (ice->pm_resume)
 		ice->pm_resume(ice);
-- 
2.34.1

