Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304624;
	b=nrUXSmCjZnBuD4YjQbwuTIu/Ot/76Ff8xRkR7SoHIBVS6Kc3weOFfpzoRyUe09y+98e6
	 lKrd30GQpb/6SPiski2F1Zgdt3fqShFUuA0LBwHzrbPCOSTEWT2AO1gGIUl+8Xittsd4h
	 dRfkKkB5eeZi7u0qjaTAIEht/1BSIUXngVTxwJxOkeyLIiHqrkFc/6zvgbT9UwNoYGCmX
	 zC0y3wPVBQ4PRo6dDGWzhzKJ5cviO9eo2G1LTzZka/1Vs86EAyyPHh/gSDwwjGfOxNNic
	 s8ZBi4ijLsApzx640UGCRAxmbTmGmu//pwid2d5qWbdRWSnjRrBPHlxksl1qIVw2OAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FQVoN2DIK9tE472IrCzkbLgC7VY9Ri60XsntnBv9TC4=;
	b=zUzJ2WiK6Q9NbKu/Lbg7GEV560A2POb0B3uKqSlvV3QtkDpEZk1Vo1fsgF6u702v6kjj
	 1TWKOF+FSQFlLY8aIMbhvShScvuYcimFw8oWA9DWS1e7qrD0fYv17RdL1CbdO8XylHjDr
	 rHzJxQqR/e2ucgd5zfLmG7cxefDTWgsDaSf3pxBCwIThUBBUHva/DKGaDFU10tkP6yrh2
	 8NA794ElOzZsdVuaLE53tuh+JryZjkre8FwOEk2g1UWXbsM6/Y6pgMXJYHe2z0mP1Ag1P
	 b4CE1MswRMbHs6QyZrsbOAXkpsMysR8aE7JIma63DPrtDMaE/ZHw0jX1k4rWtYjL13Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vYaLbiLH;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C0C606A334
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 09:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62C0C606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vYaLbiLH
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-170135e43c7so2752361c88.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 01:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794304623; x=1794909423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQVoN2DIK9tE472IrCzkbLgC7VY9Ri60XsntnBv9TC4=;
        b=vYaLbiLH+Ml7HUhkCVIdy0ckcfKS15GmMl7M7vvVOk0a8iaoCp0Y7GZH41N9ZjnUrd
         w/7+FI4zgMUdIBMi9nDw8JfoowjqGh2gDp6X5pfyMcV09Dl9S0rFtTYEZCa0QJH406il
         9g0N5dNNj4OrmBItDlJ/akSL4nT7epVTNvZsi/N4BqDnoOOqMGacDwgSkOdOVdTa3dvI
         mkAFmiW41h/XOhkxNvW4gAB7I9f0B5r/2JJUJBzZJvhgHOeX6zliPiUm7rrprcsO4vAc
         q9bZeGosL2rO5XL860sLKyG9P/cPcgJD3mLXGIf48kgkMUqR8Qgi1igL3i+rRoyQ+L/z
         OSrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304623; x=1794909423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FQVoN2DIK9tE472IrCzkbLgC7VY9Ri60XsntnBv9TC4=;
        b=IJuDsoyQpy1xqtwTlxHckQRH4QxzS+MOYQdYmoYwcRg6PC/ASwpEFRLhzhqMqrN/cw
         7pHg/ffOAyttGaBAFVr/Ntt34QcJjXoi6BycfSjC38BU/KVfAb5+CdQ+ZYReVQQJwtH0
         mJc7t41glSSYAsVDZncD890rSUC//DUM9C4pvoSDA9Zh8RWw4VYB/QX27vfujQ4o+FYg
         gCTqSe9bvUwvcwQd52ai9v4ALjYvODWTAYS9Qwzv8Givvbczs1wftUKRgTm2XPGU72v8
         CSkAxsFFaexEjkPuHZ97ptUlPZwfQ9H/5+xIdQef1aJ5IrlRmLc+Cf1dwIW/+DM47LhC
         PLlQ==
X-Forwarded-Encrypted: i=1; AL+hErFqLjaKMEB6vlGnx+eIAfpcMx9q9V8VBIEuixG1Cau1Yy3tB7ds7v0sw8PpCc5vXTkqmzOkeJ1L9LlAnQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/l5DADL3cZ7NMFcF0UFj3jdhs9nMSdgMfH6UiV7ZT0/buu67yG
	dEDjEGkzbC+y5FQolXIUwB8LIaq5YrsjxRp+zkIlPYmvpVVbtfV6AQl3
X-Gm-Gg: AYBFou0DztCVQIsVRJ1Q9KB53WN/H6nHn/poozAqlJVqSbqTt80aHrpl2+d+0y6K9Ky
	Psl2gs/fC1lRfygt18ZM/SHtnnuj8X2AX0QSNBbl8JLZ9sfqPMkCKR2rsb1eDmWSr0Cuj8TXSpv
	ghiibZ6v2bUvEwgCdDbRVe7dbtrKOxjx/dNDHdzgT4u5inDvSnWYIBbATB2ZHOnX7KzqM7mUptJ
	scLsIgbYXMXtRdwxA2KuCeZ9VPofyoRKUAjQ3IvQIyVSQTOiwiYMSvRASLyze3YrEwalYCc4ZlY
	e7XebWkyREAR5c4dFKENS6Ug6+1UUSFg6W6awk9V1Oy7f7vY00AThWvzH+KFMcIOKK1z575Sppp
	HryPoF/wZkAjU78romTvxacbFJaeakte2EGAxllanGkLVl0LHsvYKDs0/c1wMIacmmb0L2nWjAr
	qOcTVfN1ymU1kvrFVcwegiNzlLpINX2Mq6LX+3LZQWvRPnkleQ1hDgYKWvE/9axLq9beQGTZriI
	IwYH5MYZHU8qIaURbPLB9VVWa8jNnjbuLCZWQ82yaLUZIVgdjQhz/eW+JTeuPq23u/okGUijOIL
	Yl3PwEKoA1FM62Oik1MtHUihU1Gy4b4LvbulWjZxxnYitQ+e+UF6VhNIbUmk3m30OpluyveZAqg
	iXHo5ZHheNAc/7OEwx3dpY85SCIeew4PjUNvWvHVn8FfQ
X-Received: by 2002:a05:701b:420c:10b0:1b2:6cba:7f48 with SMTP id a92af1059eb24-1b3b5fff737mr3087655c88.31.1794304622608;
        Tue, 10 Nov 2026 01:57:02 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b75d42sm5203801c88.20.2026.11.10.01.56.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:56:57 -0800 (PST)
From: phucduc.bui@gmail.com
To: Maxim Kochetkov <fido_max@inbox.ru>,
	Andrew Jackson <Andrew.Jackson@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: Tim Bird <tim.bird@sony.com>,
	Yuri Zaporozhets <yuriz@vodafonemail.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 4/6] ASoC: dwc: Fix DMA fifo_size calculation
Date: Tue, 10 Nov 2026 16:55:23 +0700
Message-ID: <20261110095525.504660-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110095525.504660-1-phucduc.bui@gmail.com>
References: <20261110095525.504660-1-phucduc.bui@gmail.com>
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
index c5773f191db7..b0d3413c27d2 100644
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

