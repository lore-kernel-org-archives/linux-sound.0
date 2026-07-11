Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 958ED21CC5A
	for <linux-sound@vger.kernel.org>; Sat, 11 Jul 2026 01:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783732310; cv=none; b=jkFCz1XBL9uZj9ycpte+AygULNLxvJXFG5J5s4ML1Nh/SQrG4r/A19a4EV3P8DWcMUsf2qAt72CHbfQGWnlEGPFQm6I8AJnbAC8kv820kgw4hsUobkLkW14XViNlNc0ZKAgtl+Wf7C7kVob3LfR/cKZcCG9EiLvJPKrhh+Aso3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783732310; c=relaxed/simple;
	bh=ANceJ9b98BTOb7cjTXpEWeapQ0x5Y+oW6BrMwWfSbU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qyf3j9sQnIPGIzz69thXlRXRmvL3n+PUlhuMnTv+AW1KkP6fnXkUPfHGEcQZclDwRF7lRUQj6vDO527knEnL9rdg1qN95toEmknurZMxEx+drRHJ4q3a7DF7+NxPTv+6OeKdj/e3eWm/XkFFyhc/v8OtTQ9Gr3nHUrWA+VlAMBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qK4xxSmJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qK4xxSmJ"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84862b0d5f8so1245114b3a.3
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 18:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783732309; x=1784337109; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WH3fDa/mQ1wFJ8AJw76Ffp4EfrLnbmDhJB4OgmL9g5s=;
        b=qK4xxSmJeDjt4FklW3PWaE32JGN7SoCzGudBNYuXGytse7PwQEltLFNgFPTZCfHafk
         B4Ww2F6FgiS6SJ0DFPgi/JMXr+1ppt8nbxt8HkTRT46W9LsDYoC6P+gUmDTLKkpTofBf
         gbzs9g/Lhpvi5Qa2rEkVyg9QKHznp7PM0hP7xdMSJZWbMGRVWcJ1BrwLwi5qA8UOWZA2
         OsKfO97TmiXjPXwnqvKAtT4WsEQtm0Th7pbM7bX9Gr7cRBLLdd/bC4sFww/kBGwhu2ZL
         CnhxB4lQHOnDJE7VxqO1ubL0xgqwU+WO/vh8cveysLorFzZmpn9SkcHwjUskXHjyg8Ne
         R39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783732309; x=1784337109;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WH3fDa/mQ1wFJ8AJw76Ffp4EfrLnbmDhJB4OgmL9g5s=;
        b=Izs7xaBCepuhoYBOZnV/ajTqj1LLhVh+TcpxwG8PxjgAAWr7tePb9wxXDYMzYShnHe
         6qAYLcbLhmKJuoWuCG9ku+QrrvI3zdW86VBK3/PvCJ8X1OGmLeCwLFxcKyKyWWcPa9jp
         3/80QJ+6Mm4SAYjjpPY0ujxh0ZEY6uV+Xt6fPZkLCTXKn+laEAqL0riDZ/R8hpc73GGN
         ZxNHa2PI0EDG0hGw2bk3fMB/UVwTVODnKfaZ9AsgK6EDtLchkT2nImdjIjiDfV3YcLE+
         FOpCXAVnI8vGd6nDxfsHVUUe8c7MeutDE3VYBoKWFg1ngvS0gktmK4fosc61nmfljDrX
         QXsw==
X-Forwarded-Encrypted: i=1; AHgh+RpU8kdUksMjnCNXHrFRXYbh0Rfa6PUbDs5diajDz1gl8We24KJdY9a4DLx5VHDddujBtrqKr8EszWpgzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+YbuvvwZolOmuQ41ahrOoX7ZxRI9AkCXg/5nxb8ebwt0JYzgq
	g6wwjoTgpkuqmhCIsRkCyJQP5EkjYoG2QWCGiqod+SmOeRNfaaTPcosm
X-Gm-Gg: AfdE7cmfFq/CftIgPxo6I8bNgwq6fk+TEd1lb1V5f5Eg3f3vUqSirwMLHFrXLFZPDuu
	KEPbth8Nm/teWqzjqbhFoS6mSHCADLzrJqCFBq8zk1hfzGo/A3YtgjBsvGBJ8W4Sic/tQRN79VT
	TwkzOZEsuwz3QNmwIuGSNpMnrr9OLI9fQrGZMm/49cbQqMt4ozpIi+5dhomXMZnPG8PiTkm65fs
	B3JAqxz9H+jNlDDkn1dzQLOpe4gL6WlVviJToMMiiBlt0beLX6nLqbDo7ZLmlyyWiKeJRKR0t5x
	lojet9O1QStnKCuI04VaEP2IjaGx+v425Wb851zYVY4q7cyTwebMg5v3QEmFd70GBVSP10xeM+I
	Y5/fmde7lUP6FO90K/Gy7B+ti8o7OG1vG2pcWvqpjpaXHarZVeDGhZjdaVEGleVse86TCRvTxuO
	Xn8tx5smNh6frdm/4sHx++Hgswpk7fMgnNm1bBj13DHwPQHMcjv9kK2fg6cp7CKQD1zfYcRi4cR
	jTIwJc37YWIGELBc7q4OVWCptx+8AewjWNQwt3Zv+faZG7W4Y5MogEzlO038KSd3akrhLkp+IQf
X-Received: by 2002:a05:6a00:b47:b0:847:9c99:ea52 with SMTP id d2e1a72fcca58-848896084ebmr1269711b3a.24.1783732308877;
        Fri, 10 Jul 2026 18:11:48 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848530c5a12sm3751929b3a.5.2026.07.10.18.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 18:11:48 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 11 Jul 2026 11:11:19 +1000
Subject: [PATCH v4 1/7] ASoC: apple: mca: increase SERDES reset delay
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-apple-audio-redux-v4-1-2994d87c2f24@gmail.com>
References: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
In-Reply-To: <20260711-apple-audio-redux-v4-0-2994d87c2f24@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1359;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ANceJ9b98BTOb7cjTXpEWeapQ0x5Y+oW6BrMwWfSbU0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmBM7zq3ZT/2GdU9L5IUT2esvjMqxq9k/Hu62YeM3vU6
 reZbVNgx0QWBjEuBksxRZYNTUIes43YbvaLVO6FmcPKBDJEWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 jXSMdYwYuDgFYKq7DjH8s0i9L6e8ZVnNV4t5p13+lYk5ihg82Vs2g00u30Kt9OeEKYwMK103XJ6
 zIM6xZMYW8xovt+nr7UpYzqmJHEtjfJq9w5OJFwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

The SERDES clusters in this peripheral take a long time to warm up.
We tried polling the reset bit until cleared, however this is not
a reliable signal of readiness to be configured. Only waiting
~25 us to give the cluster a chance to settle makes it work
reliably.

Increase the 2 us delay to 25 us and hope we never have to do this
again.

Fixes: d8b3e396088d ("ASoC: apple: mca: Fix SERDES reset sequence")
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 492165c0e1ea..ebe116f32661 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -210,10 +210,10 @@ static void mca_fe_early_trigger(struct snd_pcm_substream *substream, int cmd,
 			   SERDES_STATUS_EN | SERDES_STATUS_RST,
 			   SERDES_STATUS_RST);
 		/*
-		 * Experiments suggest that it takes at most ~1 us
-		 * for the bit to clear, so wait 2 us for good measure.
+		 * The SERDES cluster needs a bit of time to reset itself
+		 * and settle before we start poking it. This is... slow...
 		 */
-		udelay(2);
+		udelay(25);
 		WARN_ON(readl_relaxed(cl->base + serdes_unit + REG_SERDES_STATUS) &
 			SERDES_STATUS_RST);
 		mca_modify(cl, serdes_conf, SERDES_CONF_SYNC_SEL,

-- 
2.55.0

