Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553717;
	b=4cmFyuIask6/ZylZSxMeAnd5SEjZycH5WyIRAGBawNpVTE2BPFzm+C1HZtrM2b5Bqqg/
	 kp26CuDdz/5mPLjHtAVk1ZYZk2CWLRRGOHWfCbrS2ZaDVZLfadsTCugPPkynXt4Z7nNfh
	 jR3uHlm6NOqCis4AizuRTF2dIVxVMtigHnhkwngLhh7f+FGNOINdV67p8SmIg1SKzgZ+z
	 Atgujx1jrtAKaVOX/P94vYRs1al4+dviDFZhZhI6uysgEzMoAVs7UqdX2bplQTpQe5jrX
	 PikF79OjCsJDxyrmt10z/2Tu+BFKRzAk/cFqg6UmXLJRr2nWXPQKox5AQWjvhm5LV7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cPGQwf1ObFoYgjtiWhEowvS7SFovmImP8POBo6vs5as=;
	b=D+X0yhxMJ0NWTgJTyGp/itJlbhtfUTMn/f5bzaNun0h9KHZX4ZfFeI+2zjIoY3bR5wmg
	 KyUrszi9ZWa3PzCoRbltIMa4Nlj0HySvi1dNvBw/OAeRdB2xWqrdFHW7E/viUD8CcqlPf
	 Xde4IH9q4MI1zBipHLZnIXSeomtNEG6WgcqHSulsPCxKXGlQW2XN5j+gCE+jFI0WRqb+t
	 fOZO1CI/lBeLTcfydmHMHJm9rVUdUwMfx37uqL99SaSMk61I/q4nJ16DhPkM60h6BHVZG
	 bpmkkJwsOaoSwc4z0IHuFDEzjrvLknJbDg+X2HN1L2zz9VGfOwENo5dBvaeMYIpbVyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=dB9F4pMd;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB6C606A324
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 17:21:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBB6C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=dB9F4pMd
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b09e07e149so17103207b3.1
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 09:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793553716; x=1794158516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cPGQwf1ObFoYgjtiWhEowvS7SFovmImP8POBo6vs5as=;
        b=dB9F4pMd6Au4NpDgXLrOdMXuhYHWIgmuywaKglaRDzikSOqUGu/fOzrphcj8Gy4pSe
         iNlXOINeGQjo3gCyPEN4585GpDYPEAPZL4tTzy3MCKIT0l2EznJzYfjVAUr2HqbOSUdu
         Y54XlN5t8v+UmmOurbsLgaMoi9zfSq9JNyXi04CT/CCljR65OgB0SXONbzGUYI6s1UED
         cK267BK1JtssyyT+ErzXVD1n/2QmMXF/rcKXhG5zJ1WPnr2ajce+3sDLQtK3mNz11Tn+
         D/7G3IaKyYpSbo1iLLRS58x18yWC75kPZV05lWu7567r3vHDlAB1w1+dWiWbBnpRJQEV
         nfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553716; x=1794158516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cPGQwf1ObFoYgjtiWhEowvS7SFovmImP8POBo6vs5as=;
        b=Paw9gtJr06FkVaEpNrrDVeNQCleVj4kJM6qpxgZiwpBap7FehQWYeMhXmB9uqruAM+
         P9imwaz5PJeqG28xHrdGzvEXO3X/ScLnF1lkKGfKtdCUL/F6oQnSlY1yGUV1s/saegZP
         lU33q9DcAnZpafOoJEVRQtOdzYXvUvsUm6aXLEJU9kSL8KKPadnnE+Y+Tr+vTiY8o/3a
         BFGd7AL//Hcr/UbBUTaMmke+ji3WyhIHLTWm+yRUJIzhihu1sJ0xpg22TJPzYZO/84yy
         sK5XdTS6c0fDcJnvt0S1f+ZCOSJUoH6lypkF0JfxOHosR2Pg+YKzPEwB8ePtZQNmpL0B
         Izhw==
X-Gm-Message-State: APuU4Z+BUYxSjc1AxzdVSzeuaD3jaq/LC1CTwxbv2aOmhNSow1ast6iW
	4nc3p+XZm+TlTmKFS9CZVSPLdDCyRgOohPOw7IO+s3DygN373iX0RXlDB2WBgFk1zw==
X-Gm-Gg: AYBFou1TvICC40g9GncQenyICq9vKluAD5McXet3Zbd1AeJJ9RU8Bl/MjgbOF+qixzN
	tb0ayCQWc483ROBbJTm9yq54dnHH3Ge3J7xnm9JSGeMfVXnM9cYjVE2IqStpkffjvz9Q3CUZgCM
	tRv+aMibRBqBMX6Qyf0bcIDBcAlv65KajXY1Qozim5hrHxXKCfkNVfkR8eEKxyMsi7uA7Q9NaPq
	ftIyEpZAhRviF55SSsC2Cm0c4edao+3Cb9tDdox5RFuRa5pjz2qiEwvuyWKcFBgdAcssV16tUUL
	sG3B+5944ChK/2mCiQUSmAX7jPm7+r1SCVVk6Nakjv7FuDN0IBqo81Ep8xOznsLHyE4w2X5iLrp
	W5fb5kPd9mQkgPcRXLBkJzpj67QPiXvbeG+umsmyXNceOdSBf3CNxEscrrNQhmNQUgu0HSsVYCa
	rDESCYemjkgX+2x9rAvTj6scr2ERIxOdWkXFcOLkBR5Qtnay2/PIbTTJae2u/9FKSv1ZYdLZ9zI
	B9VoAqKGKr0n35a+rRVE1iEjpc9SWqBaQdHoWFUkzka0ONO1J1oKX032jRV6PzVVJOh7pk=
X-Received: by 2002:a05:690c:8007:10b0:8b0:8e22:d937 with SMTP id 00721157ae682-8b2b66c7923mr29268157b3.33.1793553716082;
        Sun, 01 Nov 2026 09:21:56 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd40sm39086837b3.16.2026.11.01.09.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:21:55 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH 5/5] ALSA: ali5451: Make snd_ali_reset_5451() return void
Date: Mon,  2 Nov 2026 02:21:34 +0900
Message-Id: <20261101172134.3451066-6-ingyujang25@korea.ac.kr>
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

snd_ali_reset_5451() always returns 0, as a reset timeout is treated as
non-fatal, so the error check in snd_ali_chip_init() never triggers.

Change the function's return type to void and remove the dead check.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 sound/pci/ali5451/ali5451.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/pci/ali5451/ali5451.c b/sound/pci/ali5451/ali5451.c
index 8295eee9b977f..b86b921296427 100644
--- a/sound/pci/ali5451/ali5451.c
+++ b/sound/pci/ali5451/ali5451.c
@@ -414,7 +414,7 @@ static unsigned short snd_ali_codec_read(struct snd_ac97 *ac97,
  *	AC97 Reset
  */
 
-static int snd_ali_reset_5451(struct snd_ali *codec)
+static void snd_ali_reset_5451(struct snd_ali *codec)
 {
 	struct pci_dev *pci_dev;
 	unsigned short wCount, wReg;
@@ -442,13 +442,12 @@ static int snd_ali_reset_5451(struct snd_ali *codec)
 	while(wCount--) {
 		wReg = snd_ali_codec_peek(codec, 0, AC97_POWERDOWN);
 		if ((wReg & 0x000f) == 0x000f)
-			return 0;
+			return;
 		mdelay(5);
 	}
 
 	/* non-fatal if you have a non PM capable codec */
 	/* dev_warn(codec->card->dev, "ali5451: reset time out\n"); */
-	return 0;
 }
 
 /*
@@ -1901,10 +1900,7 @@ static int snd_ali_chip_init(struct snd_ali *codec)
 
 	dev_dbg(codec->card->dev, "chip initializing ...\n");
 
-	if (snd_ali_reset_5451(codec)) {
-		dev_err(codec->card->dev, "ali_chip_init: reset 5451 error.\n");
-		return -1;
-	}
+	snd_ali_reset_5451(codec);
 
 	if (codec->revision == ALI_5451_V02) {
         	pci_dev = codec->pci_m1533;
-- 
2.34.1

