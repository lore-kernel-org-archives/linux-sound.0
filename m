Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793553711;
	b=l0Gra9zfkrSlre2SXBmPW5cEJyWKTFrkxlYgpa9vK53jDeDEFmUkeSva+DgJo45YF+AM
	 gGpKJNqrPmqGPAz9buXgTl2wTlUFFEw9XYNSw9zjq0fpmp/k+bCo+/t4afh0Wxhc4H6yH
	 EqmWltmVSOTEho6duUorbUoD1s3rrX8BZF+pHqZDz+5+GJNf3AEz3NIgkf7T8276gFF4C
	 nrrp5QyZsbcTcd5gm8GQxF8Z4Nw8WfBCPvKeJEP8snEf1lCOj8fQ0EmYSo6tro4eQg5Pn
	 5MiIP+IzUaEvnwUv4lYOSR9uDQQ+LIBMO4QStRQjG/2MbsMc5KxGiT6g5uwniy9OlWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793553711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=8jDQySbbwhUBE6Esd8B4uY6dfDK5BBBPW3DY/zlY/98=;
	b=aSkZ5zRJx6sXiBnWBEd8zNlGz58wJJOhaJcy1aHkZGnw8+YK1koBKOyhnU7jmHN7wkaq
	 k0WUnhaOUF2jQx0ms1PKLLxpYLNEen7yEJNR6DTkNBEVHnkASQrnYGC/6R9TNgk83wp1u
	 kyh4IJ5yU9fiD4kMBWBjKgOn7Axx2eIw2zpFiBk6mCHsusSYRTqzQ7/F/lCu+4EC7yg/A
	 LzS4Kd5jlf39QnwReAZK/78dHTI958kJpuWsZVGZT6Fh7SNPY3d1vdK5pnvrBV7J271r1
	 LTvmOEwIhfHn3OiRcHidfFD0JyYLfj2Cia9HGEr8Kopy4Jr02sfoeu8fqN0mxOx85nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=korea.ac.kr;
	spf=pass smtp.mailfrom=korea.ac.kr;
	dkim=pass header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=GhMLKGGb;
	arc=none smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AFF606A32C
	for <linux-sound@vger.kernel.org>; Sun,  1 Nov 2026 17:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78AFF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=korea.ac.kr header.i=@korea.ac.kr header.a=rsa-sha256 header.s=google header.b=GhMLKGGb
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0d63f60bcso17361997b3.3
        for <linux-sound@vger.kernel.org>; Sun, 01 Nov 2026 09:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=korea.ac.kr; s=google; t=1793553709; x=1794158509; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8jDQySbbwhUBE6Esd8B4uY6dfDK5BBBPW3DY/zlY/98=;
        b=GhMLKGGbWofWg2iDi0sQUYKW2qiTFgiMDEKOOwoXhmujiwbLQdjzLNOD4qNos2+BgP
         0QaxFqsXxGbCpNrDBCtNRsJYY4qn+w4WMtncD6ijGeltFWDYOct5oxQddatZvK2yFniw
         FJuFtWAJ+B1zufhYvuWBVdyzX297/tFHPpNt4t0A5oCNAP4CW1ztpDuLM3n3JgkSCcMy
         rz6sx8eIEOAWFJHC0CEWx3ohJFRP5J/n3Nek+DNaKm0WqtrnueDape17bGg9RagFZvoN
         4EoZyHnfzkRaX9YTkCKKgQN5COpFsoJxOr42b3MVbfph9hgmQ0tbzPs2lr6yzlM8PuPl
         0h9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793553709; x=1794158509;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8jDQySbbwhUBE6Esd8B4uY6dfDK5BBBPW3DY/zlY/98=;
        b=G1jqIc/0tNS2ad7+VmFLyamUQ9W264ybta9qch/6ouMsqOx10k1idhzUakVHrpWl8X
         FAtgAP1KqZWYMPPpFNVARyb8Hy5GFlrzE954hm/irVckvVM88Su6WUTFlAfrsO2I4pcG
         Qydh2PeHrgcdyHu8oxJQ++anPBcUjOdkgP11/unzfYKgeTghlp/lrOwmRS1rOn2w0J7P
         nH6TmgVOHSQtmT7FGIpOV5Fy8OfnIHUN/zpwH0k+esdFRB2nagq5pEHe6Y6bGEr8dXNP
         sPkcoXVQxzGXRIT75UPZF2pKWrM9RI6mNK0jTnWpOEavuIJPs16i770rUFBlQgeFLwic
         MMzQ==
X-Gm-Message-State: APuU4Z98JpY+t7jv4+Yv/92BSvk5xW7LMPnw8faIMtYvB8+NYyDFvZXQ
	q09b42BvVbeh+KoFpxyY6mW6bPIG09bq88Yu/s41+b9rCALyeMuDh9AN/7oyc1S4tw==
X-Gm-Gg: AYBFou1fze82QRv56kqtCW97zplqbQlc0R8/1JDOIz7I5jHYNBAuYLT3rz17tDtbL8x
	GUFV8fkQZ6zbDu55u20gYzHlL6VLOo/NdYJ6Haysi24VjF59QUO2E9aJl9u7OJTZM2uBZ7ZHihO
	+WbNb20R8hzfXiXI/o3rUIIgI28KAP0ngT/R/oOIUUy7lVH6k/nh68Lra5Q6AceCz58K7sZYWxU
	29P2KDmSp4CQXpLk3cYL8k8pUOpvXI8rx4OWUTe6RldfNz9C+3PrzOfAgZpQs8HX/uwtDPBSFrO
	gjPl+ppQdR++Rx5JUyvOR+R9aK79iBOI+kch1Lh5pic51arSQxmcpz0VFo8ZalTBeyYVFYqJGHx
	ahkkFZ0RifdMTgKWVXOeA6/3m843jOimPAVEXVaZ4bJUE3qHU7rgxPcVU4di8qsS3wcJc+GLPSI
	FE8E/RdPvEe+HU+BRQ85QvP/r2DLPuCu3501H2LySvVVZMkyKtUdhp58m4PGs9KWrk2/kUtlBSH
	i3dVI63kLnrtebU6Z5dQvUwqMuCbLUfjaRCYvhnGPBMg/9Y2br7QWACzLBjZ/kHza6sHuQ=
X-Received: by 2002:a05:690c:4003:b0:8b0:ad62:19aa with SMTP id 00721157ae682-8b2b671babcmr40938347b3.33.1793553709612;
        Sun, 01 Nov 2026 09:21:49 -0800 (PST)
Received: from s2lab05.. ([163.152.163.130])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b2b714bd40sm39086837b3.16.2026.11.01.09.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 09:21:48 -0800 (PST)
From: Ingyu Jang <ingyujang25@korea.ac.kr>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ingyu Jang <ingyujang25@korea.ac.kr>
Subject: [PATCH 3/5] ALSA: cs4236: Make snd_cs423x_pnp_init_mpu() return void
Date: Mon,  2 Nov 2026 02:21:32 +0900
Message-Id: <20261101172134.3451066-4-ingyujang25@korea.ac.kr>
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

snd_cs423x_pnp_init_mpu() handles a pnp_activate_dev() failure itself by
falling back to SNDRV_AUTO_PORT and always returns 0, so the error check
in snd_card_cs423x_pnp() never triggers.

Change the function's return type to void and remove the dead check.

Signed-off-by: Ingyu Jang <ingyujang25@korea.ac.kr>
---
 sound/isa/cs423x/cs4236.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/sound/isa/cs423x/cs4236.c b/sound/isa/cs423x/cs4236.c
index ecce31b348b02..167a198fa0fb9 100644
--- a/sound/isa/cs423x/cs4236.c
+++ b/sound/isa/cs423x/cs4236.c
@@ -236,7 +236,7 @@ static int snd_cs423x_pnp_init_ctrl(int dev, struct pnp_dev *pdev)
 }
 
 /* MPU initialization */
-static int snd_cs423x_pnp_init_mpu(int dev, struct pnp_dev *pdev)
+static void snd_cs423x_pnp_init_mpu(int dev, struct pnp_dev *pdev)
 {
 	if (pnp_activate_dev(pdev) < 0) {
 		dev_err(&pdev->dev, IDENT " MPU401 PnP configure failed for WSS (out of resources?)\n");
@@ -253,7 +253,6 @@ static int snd_cs423x_pnp_init_mpu(int dev, struct pnp_dev *pdev)
 		}
 	}
 	dev_dbg(&pdev->dev, "isapnp MPU: port=0x%lx, irq=%i\n", mpu_port[dev], mpu_irq[dev]);
-	return 0;
 }
 
 static int snd_card_cs423x_pnp(int dev, struct snd_card_cs4236 *acard,
@@ -296,10 +295,8 @@ static int snd_card_cs423x_pnpc(int dev, struct snd_card_cs4236 *acard,
 			return -EBUSY;
 	}
 	/* MPU initialization */
-	if (acard->mpu && mpu_port[dev] > 0) {
-		if (snd_cs423x_pnp_init_mpu(dev, acard->mpu) < 0)
-			return -EBUSY;
-	}
+	if (acard->mpu && mpu_port[dev] > 0)
+		snd_cs423x_pnp_init_mpu(dev, acard->mpu);
 	return 0;
 }
 #endif /* CONFIG_PNP */
-- 
2.34.1

