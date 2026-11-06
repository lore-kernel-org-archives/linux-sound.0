Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964636;
	b=yJZl8XrW2Uq+oM+TdiPZepgMQzFru51zhHxVbBaocc+NDdy4uW6sL+nxpI3qjcxjow/a
	 jxzN/49Y6V0Bf9Cb/EFQeidkw2d25fSHk1KAp2yAtfSj/zl0YzKWUV039SOB1CxrorCNZ
	 T+249PRnwXpJjp4A0wIaL2abp5ZqiJsgbWPvEonQTw4GPft8/dXgYnp08cr7p0BxlWE4G
	 5LQQ5bK4tMawEpcVdKWxLriWMKxRJ23sEewmra+HK9RaSdvCbMzMYm+z9+tXHF/WVWRnV
	 dlKLgiBOzx/46c8j1KVeyIwc3S1YUhAFYOtGyQ082s9cRY5cQr3y3Yh6GIgUXsjtIoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=XA8R7iMpBeDRjMa8OJpHCw9pBZF3N4J8Ecsr8+cx7Yw=;
	b=bbQX+HVwBhDAitauVrQxK1loM4ZzbJgkJYlCkGLp35YaxQsBuJOlR5JRQStNsJmKccqE
	 b5CjDB8Uza8TcchGrWtj2TLCAMap02z85cRjV/S3ncMbzbQoFDT24VTarqVtCEFMektj6
	 ki/eAj/2lVLNhRUnFbKYoJB4A+ZTms4bHAmc2SOKEzs72dMPaePRu1yZxX6dI60i8N7E5
	 6ovryUk6uf9vl4C+IUxslIY0AffXcIQ/JPzqDf+8JxBJYm1fVMrhgYqjJkzY8OGqH4D/b
	 NUUUPNMCkXvOg1ZuNbiJn7u4o+927BHlV9uDjKoBzIMMclqSUbhsxpvHDPz2UvGnAFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="E/6NoteO";
	arc=none smtp.remote-ip=209.85.210.176
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9966082BDC
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 11:30:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9966082BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=E/6NoteO
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8a089dfee18so942547b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 06 Nov 2026 03:30:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964635; x=1794569435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XA8R7iMpBeDRjMa8OJpHCw9pBZF3N4J8Ecsr8+cx7Yw=;
        b=E/6NoteO9iLfm/5PXHp2QQxvMql2vgayNbxfbO2AiKpDOIPQaWhANkFbiWMKDuAg2y
         6lssST8pwp7ubLMzxG93KATVMwNlh0mYwyCGanpdZAQ5w/mC64fV79M0xp7eYptjWg6J
         cXozeiezUgYDJ5iDnoKmAV9dkwolEcpKmH18KjXGM2jJn0ttX30ZojaqunASOJa/EZpi
         9YVX6hnHfyED/ViGVPw9v7VeM9vWm7glnu71MXmRVizzDZiLbgPrRP8ByzKiJikNpHq9
         EG359J5AHs77Ar5agp1AyB3lFxN29NpjSkJdIeEDsHoCSow8D58rlucjBX2ZvBrHH5aI
         FPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964635; x=1794569435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XA8R7iMpBeDRjMa8OJpHCw9pBZF3N4J8Ecsr8+cx7Yw=;
        b=ULZMqZZs9bDcCrRSv4j4OObqM1JQCEF8YyVnQzOLyEMcw2pVeoHtoo5S8dqCR9jqyw
         esVG7uNJimZuLYYHfO/AKCw2CHZ61rzeiK8bqGkfivxY5Dq4zWBCQ4NfARZVC9eMpdj5
         YTo9+/W4B/M0IRuj6j9r6mhHTkCAZ5qntEXYjAxvAnUC4FkmF0Dn2pKVfSanhshYpV+R
         Fr52Q+BRW/ezzkpAS0e8fOc2ofWwBsI2my572+RQQNuZUUh2y5jrG8eWLc6ulkGnmmXR
         /8pgxLd7FC8MghFK6pjaBCrT8AlkaYP6s95W8o2k03WBPIVj6O4broq/Qz5VxaQb7U0f
         5Uww==
X-Forwarded-Encrypted: i=1; AKwUvBydGhy7qZMP1/c6+r8SG0njD1l9TvTEbD6uzP9E4cx5IlQ1/TNItsGS8dKIrsp4ZVR48XfXU/vPgvyMxg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZeRVRzzDDtjZlCmQcD8HAPEcddvzqN/S/erniKhJ3p4TNfi2M
	lHBjljWf9X7hI2YyckrIio8gNd+ruNAPMVLVjZqj20dXNs8J8SDPkIEi
X-Gm-Gg: AYBFou1Py3LExbjcwD1Nt7S8cle+Ohm5xz1AKFuJK82YOqVLm4yLYRRzH808AvAbfVL
	fJ5/vw5WkaHj/A9eU7tOPZQkm9Xo6a9j5YPbIdc3lO8tUU6BK7Dd9w3QS+vvzNeOew3+qCEyk98
	pV3N2Vjoz4Mt0HtMq5tiPAZHGZZzolxU/Faucsowx3NpOavvjBeUWWCZqch69rKOlM9mAUCYeYu
	KKj0ewR2A7mJTyVNoLUZc8BeI4Mo2jIOuTbhG/eorqnmRc2CJhpoULcXPpp1vw5N1NpnOoWs2k5
	6/TlW/vkO5BC3o8mWzSykdtgHYpYHhoCFoHU1Ca/qDLoOng7LLVRuExd4duS33YXxAnewgg2x82
	KabHfia4kUWE8XKDHlrdPGrIdanO3DZGPueTh2QcXlXewBWUsHTppgT1tulGkQeMJZr3SqYLeud
	UOi09nu6vJ3FVfhcXZJ3qep2b6AmxW99bb7rU60Dt5kTcbCjBtETh+fjUkD4kNz2Q2sRwvcpRcU
	zmgD3XAmzMWSeGTeYu+oxb7zJAaGQu8LZUKwZyTWdzdhzdodlaE97t9XPHVf4Evv2LHoPjfgybr
	aawbLc1IVs1shblQ8+GVUorvHdEEpfLT2wkQ4f7nQY9uFfcccaffswg4Z717PgskwyHVxw1JDNc
	2bUB9JNgSLY3fn01T2LrgWRfpvZZm5SP3vTDKqGm3GVd6
X-Received: by 2002:a05:6a20:430c:b0:3eb:50c9:b3c6 with SMTP id adf61e73a8af0-3eb985175f6mr4148228637.22.1793964635163;
        Fri, 06 Nov 2026 03:30:35 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70aa6ab9sm479228a12.27.2026.11.06.03.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:30:34 -0800 (PST)
From: phucduc.bui@gmail.com
To: Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 4/5] ASoC: dwc: Fix DMA fifo_size calculation
Date: Fri,  6 Nov 2026 18:29:39 +0700
Message-ID: <20261106112940.53550-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106112940.53550-1-phucduc.bui@gmail.com>
References: <20261106112940.53550-1-phucduc.bui@gmail.com>
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

From: bui duc phuc <phucduc.bui@gmail.com>

fifo_size should be the FIFO size in bytes (depth * width / 8), but
the code shifts by 8 instead of 3. For capture the parentheses also
make it always 0.

Use depth * width / 8 for both directions.

Fixes: 52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/dwc/dwc-i2s.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 0de7bcb2d0c5..1ff5b6f8864d 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -664,14 +664,14 @@ static int dw_configure_dai_by_pd(struct dw_i2s_dev *dev,
 			idx2 = COMP1_TX_WORDSIZE_0(comp1);
 			dev->play_dma_data.dt.addr = res->start + I2S_TXDMA;
 			dev->play_dma_data.dt.fifo_size = dev->fifo_th * 2 *
-				(fifo_width[idx2]) >> 8;
+							  fifo_width[idx2] / 8;
 			dev->play_dma_data.dt.maxburst = 16;
 		}
 		if (COMP1_RX_ENABLED(comp1)) {
 			idx2 = COMP2_RX_WORDSIZE_0(comp2);
 			dev->capture_dma_data.dt.addr = res->start + I2S_RXDMA;
 			dev->capture_dma_data.dt.fifo_size = dev->fifo_th * 2 *
-				(fifo_width[idx2] >> 8);
+							     fifo_width[idx2] / 8;
 			dev->capture_dma_data.dt.maxburst = 16;
 		}
 	} else {
@@ -711,7 +711,7 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 		dev->capability |= DWC_I2S_PLAY;
 		dev->play_dma_data.dt.addr = res->start + I2S_TXDMA;
 		dev->play_dma_data.dt.fifo_size = fifo_depth *
-			(fifo_width[idx2]) >> 8;
+						  fifo_width[idx2] / 8;
 		dev->play_dma_data.dt.maxburst = 16;
 	}
 	if (COMP1_RX_ENABLED(comp1)) {
@@ -720,7 +720,7 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 		dev->capability |= DWC_I2S_RECORD;
 		dev->capture_dma_data.dt.addr = res->start + I2S_RXDMA;
 		dev->capture_dma_data.dt.fifo_size = fifo_depth *
-			(fifo_width[idx2] >> 8);
+						     fifo_width[idx2] / 8;
 		dev->capture_dma_data.dt.maxburst = 16;
 	}
 
-- 
2.43.0

