Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553708;
	b=qL2jBOxrAslyYg61OVQhtyz5FO9rffJ+2l7pBucL5rgYxZmBPEljW0eez90sFKf0Ym5D
	 rWHb1MxOzqQidV08vwO6P8JiknmiZxtX9Wep3iMWVCtKZAeobwxD01F+EN3+WnfPOcnW2
	 v+j82wpuvBRsYYHU2SJQv7FrVqzVXxc9fgi7oQbbP0ihMNHu3ffzshBpCXxH8/Me6JIGF
	 L3Y+fnwTVxrUgRPpbxVVSSFtEUJfMUdyAxyiFnk1hyVXxofMPU/Ge0fYlvFw+gjLnNzPc
	 VFBFFU78mgQvsgeBDqa44v2rizw3XZbwSQuUyeS9J885yPw3R5CfNU7V5OZ0PsdJ8eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553708;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=uRhiecFFAaHK0bLgXDuIKi/zmGv5hdM1ZUcVNprqX7M=;
	b=ujHws/QxQLALC1Erbj2EMoVcFEsG+ZSAh7pm2580kgzu81fr/raIX9/sNR9TaeZYe9bP
	 +CLz9a065T6DsrfiptL5TVhBI1ybJsbjUWEdY631FVOZG1s+Bc3v4hQpXP2KpoMOx2V8j
	 Pn/TpfkrPOKwCcWM1vEC97V/s0gaq27rkFM+FLHrbTphJKmNKN7QMHwJPPQsa15wnvYIP
	 2i4UaVaC0ZV6Whgstw3FTxdJzjIw31XjWaG/r/wLIwNVkGO4bWJPGD7OCLX6pOk0NF3tS
	 blOrU7Sv7831i7RjjJDQDb40bgP1qCUSO6M7FIdnmOoDkz1OoSQqO+JN8MqVAAhdHZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=PUpolHbV;
	arc=none smtp.remote-ip=209.85.128.171
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93F6606A32C
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 17:21:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A93F6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=PUpolHbV
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8b2d14968c9so5484307b3.0
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 09:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793553706; x=1794158506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uRhiecFFAaHK0bLgXDuIKi/zmGv5hdM1ZUcVNprqX7M=;
        b=PUpolHbVNgTgC8bZhMGuYtK7yEUlqkpbpOeh1TlpJqjQa4zSOgln3OsDnW8XLbaXty
         y0L0LYnWNT18H0QYKizB2TA83wxL9/K1sHSxdR4Gzp4CkqIArlCW8xk6qronoVGgnhUi
         49G8YvjrW+S4eK0xbLiSai4D452S6TbnLyOMYfCYo2zh8dLKQ01Sx7M8Rcr/uvSNANkI
         vRBg9/O/U/q/kY6Srp4Ff+lGjSiYr/wXHmcgHeyK2P6btYep+iNW3BZu0CSRDn6dhtwd
         2lMrMHcVYYfaGBrawW+hfCQV110+JTX9QptpEq7FM9rSSUg1LNF5JvU+CNfgXzgrLY6T
         /umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553706; x=1794158506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uRhiecFFAaHK0bLgXDuIKi/zmGv5hdM1ZUcVNprqX7M=;
        b=v6cBwD9ZCXOccPtH2k3oZvrblrscvU1xNkrdWUx7VnCBHtaxA8xr+dUDw9RM9cGdPf
         dJXsGu7mRaICQCR1Fs77qJjcpDVY2beKK5S9JwDLJlrYQBQbx1pzQ5y2PqtJpSadZRfH
         EU8jWSGyZIELRma4R9dXjPamApw71Y/P23D9G+LPTJY6Deex5B4AHkM+TE/WyG1LwDxm
         223EYygVl8hFb67H79grNdiBrgbVZXENcwy2xyBKwAJox428MiuDU3Z0XsqEbL4Bu2c7
         7W+QD+GpjSfwjX4WkVTk3ghWFSyCmYUtlbVh4afIi6DRA947h9d0HD2FNH/S1gd9ZQwB
         qJPg==
X-Gm-Message-State: APuU4Z/eUmsP6ZU/RQhWtOYn2AEpcox3oFSHKh+JuPrfou8e5PIBZc9Z
	tnj9tFhMkvBGH9vuLJx87rpruE0zvlpm1WCNs4CG0M5BXfSNcAgOGkjMkKIvwS8XxW8WMUQ1qiU
	Q8FLUzg==
X-Gm-Gg: AYBFou3s+WTVgKuXb7BVcE5v3GhynC9wpO4WjRWrH2x0Ud0NAIjUWbggE4cYazLcGWq
	lPWC6V+7srydyhp4IoadSUv08m0zvIxSkwIWr7ZjZBjefLgQCU8M1T2/K8DzKQq0nGLiRNTw4xI
	H1rrnMW9VUvc4dpVScfEINjM3Tqccad51KS1Vwstzz/sMQk+wjMBOiT9xTEbg3ZCy8YA9VARi4/
	IYYt33fpxEoFCr5Z491dndwVx3/iXFbEmU4evKQeia63KRQEhH6Y42mKC99SiqpQmPwpZ2ISvEi
	GrVRFDAf+6Sfil+a0eeDzRAAA0wDyXhbTq18s/fcegKk8KkoPWNgixradDMkcHkAVteTjONNg9S
	NqKrbvbgMOEuepsLS2dphdzZdYAVvRIrb+ocSMYViGtwF1R25+JDyJvW+7FQ36H5l05sjwSfLvR
	O/s3yM78lRubZMrNtJFvd0snKloowJWGSGCp8ud5URpDTOI0T+imtDyRhwFW5NFdgGcGpZ0Mnky
	Cwu1HPBTl5K8J6JEBMbxBk1AdtbY8N16xuT+5R5UNn/F+KpLnaeXAPVM8uszkrirO8YQ2I=
X-Received: by 2002:a05:690c:920e:b0:8af:1cb6:30ac with SMTP id 00721157ae682-8b2b67dca4dmr35715977b3.67.1793553706619;
        Sun, 01 Nov 2026 09:21:46 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd40sm39086837b3.16.2026.11.01.09.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:21:46 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH 2/5] ALSA: ice1712: Make chip_init helpers return void
Date: Mon,  2 Nov 2026 02:21:31 +0900
Message-Id: <20261101172134.3451066-3-ingyujang25@korea.ac.kr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
References: <20261101172134.3451066-1-ingyujang25@korea.ac.kr>
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
 sound/pci/ice1712/ice1712.c | 12 +++---------
 sound/pci/ice1712/ice1724.c | 12 +++---------
 2 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index 1fad8c418132c..ae1a9de22ce20 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2283,7 +2283,7 @@ static int snd_ice1712_read_eeprom(struct snd_ice1712 *ice,
 
 
 
-static int snd_ice1712_chip_init(struct snd_ice1712 *ice)
+static void snd_ice1712_chip_init(struct snd_ice1712 *ice)
 {
 	outb(ICE1712_RESET | ICE1712_NATIVE, ICEREG(ice, CONTROL));
 	udelay(200);
@@ -2334,8 +2334,6 @@ static int snd_ice1712_chip_init(struct snd_ice1712 *ice)
 	      ICE1712_IRQ_PBKDS | ICE1712_IRQ_CONCAP | ICE1712_IRQ_CONPBK : 0),
 	     ICEREG(ice, IRQMASK));
 	outb(0x00, ICEMT(ice, IRQ));
-
-	return 0;
 }
 
 int snd_ice1712_spdif_build_controls(struct snd_ice1712 *ice)
@@ -2504,8 +2502,7 @@ static int snd_ice1712_create(struct snd_card *card,
 
 	if (snd_ice1712_read_eeprom(ice, modelname) < 0)
 		return -EIO;
-	if (snd_ice1712_chip_init(ice) < 0)
-		return -EIO;
+	snd_ice1712_chip_init(ice);
 
 	return 0;
 }
@@ -2683,10 +2680,7 @@ static int snd_ice1712_resume(struct device *dev)
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

