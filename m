Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794364121;
	b=gD2sg0zzqBm0QAN0NZRSl7tKSpCoSZuKJhO5aSSlAQlxYcNJmgGsxMBhJgO0BmESsek/
	 5l4LA2IYNmHRVTVpNsNH/XVvBbedVSnYapJePw/uVtexjbqmA/K8WS14N/Bjzhjy/yJBd
	 LaaoUSt/kNGwTQTIoQ2LJRuUoW6RbzCxfP5Z/Z9kX/lgs41dYDhDOnGOXxmvpHgtLaxPs
	 xAJ5G8xp0EuG6eWV+WjjE8yx38DrdkCZ0ylbI8/4SwQpKa86t1yKAvo3QSt8pvfkKO0yN
	 +S/rLpLkXgfixSNM+MJL1og8askzaz8Q5PWhKZ9pmKGNYodJ1ykn7UlKjX4HomaqB5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794364121;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8hAoTzujMAoXvy2lacWOTMG7M6I/5TyxiDP8VviDZ2Y=;
	b=tj0eDjdb3Yq/tRMVZJYrrzik/fJZ1vJqjbFRrZ4te3HCSls9hM/A01PCGDIRc/88m7r7
	 opCHpjxU3Rlhidd1PqBfQnTk46ThIPBQR78/432CKYLgfUn+96JqegUj9EE5qYi8HS89t
	 IHVWmPD7b1aqWg3kqCh1EzWq754hlftwKWAYGRbOJ51yuN1ZuDjCHXZUlcjPC9QRbuo2t
	 9GeSCgNAxULzq2YO4rfA/dn38+H0CqYJo+U0MGGv6SHuT8ILw1zmUr8jZVIN1I09rsR0B
	 /y/GP02K3KIE0K46YIhbIdWB9HEpS8AJ9dlhCeGzLEnR3dFzvJVHnQNGHspNFtSwPZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AzhvCc6c;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04D260A2606
	for <linux-sound@vger.kernel.org>; Wed, 11 Nov 2026 02:28:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B04D260A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AzhvCc6c
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a8cc11ac42so2702783c88.0
        for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 18:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794364120; x=1794968920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8hAoTzujMAoXvy2lacWOTMG7M6I/5TyxiDP8VviDZ2Y=;
        b=AzhvCc6clxW9pb1IJ/kr8Wwbh6mehd11/IwXOI2FxbEdV3wU7y68gg0VINI7hLYMF3
         DDNAXSjJqvc8TiNh7j9yZqpO9Sgbf74qE7eRRpvfLUP0Y9Bkcb9C2XTfT8n7AGCfKORE
         T11ZmgCQZvOQskXe1EjCPCqjDZ5A7i2u6Xia1jYVQ14urtNonL1wiweDYn0aO8BkHVln
         HjZ7I2fkbrkp5cim5flWbtJYKitkhzjEN8SPq57vVs3UiWUUY2W7NbGGaxfaV7lNW8uk
         /+zQL5zshSI2VEm+C4luzl0IgUMtpPyhC/2+mzuPW0ccpIbaBDL88zg+ofKD6KLdB2qq
         9X8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794364120; x=1794968920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8hAoTzujMAoXvy2lacWOTMG7M6I/5TyxiDP8VviDZ2Y=;
        b=0izeKmyiVVrqOGMZNUZSEs37DyFsWw2Ku+g4mRMn8GZ8BYcTH/qNXB4Qr+qiQm/HWh
         +OwO42pmLBpUO2cOVzzJCHh9pcfmUBJ7A6ITWlYeEv9JgnB5ZPN1x8uvTOym/SN5ovG/
         pitxcf8TCil3dgLYaHm6+g6PyYJwALMIhzjRkiDarphmMpz/q64+M/9lhOOtFKJXdjVd
         qJQiSEHOfPBHzs3Hjo/+QERCPZR8xhFLsCCERHytNOJrD0gECcV+sKNuigzJG01tPCDJ
         yr477GvCEajvHNN+ObDMSGIjhiuXgwYN2HNv/LcYH6z0HXq5f6m9tQNNROrPp5IPta1E
         MrwA==
X-Forwarded-Encrypted: i=1; AL+hErGXqXJhmGmy4n5Vi+7LwhPDjQW93atwD+/f0gTMPRGUYp5MnYUvgdiM4ocKLATFU4xxDbrHgqOJPY29Xw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/CyLKbiNL+C3Z4ZajnEsBBF+ZgRBE1z7PEhAB8pn+OkrF9d3G7
	AIFR51uIEGf9IC+DBBYw3xCPvOTexqxlD9Hucll6sQoDvQTG2sYKiKB8
X-Gm-Gg: AYBFou17SdYoxd4q2p3juyBdrHKL8JW1KepOJD9rjXLC31mT+lKbt1+GQ7wUvHYV6YH
	FreoRbsVjcU5eNzzr9o10v7vx+WXDPnOnM3o0HP2ZMDxUELXFCxIMlfPSmRYLHiegjhNPM3cKd/
	PEhRBWn5ewtKU8oxv10NcR6UTpn4b+varMdUmEB2hlWzHC7LKIfPNiHl/C2pAtX4yGfcxIJBQaR
	cj9OKeeJ+qmEDyNLx0SO+zPxsXI5d61XtbnymRK4vMZSMZsqwIsNV+gMqIi0gmId047xFkRwP75
	UFuCvysF7mqFMmaonmdKeehRQCz1PrLR0d/vUxJaw9tqYbCCyrjFu92/DNGlh5NeMcmn7TsHuX4
	9XHp0Q2Al9626UmYI4t6neITie2e29R4oW0Jz9zRgLd0XnQPo5j8LCtaqz2/KWoPdQUA5EcbAAm
	KNN7srlJNXhjK50ajIWWf+0qEWVPVeNK+dCE5S6n7TQPfN8W+eG/z5dA7Cw37j6i2vA0Isp9IQn
	/bmQZ1t5VCW3zv6RLSlTvRAUrJI67qF0AAKNW3Ovyc1TcdJCVAXmFNp4UET0/M6CFfYSQxbVjMF
	eGwPYTTrvgkrOnkIeNFC8X/uIdpI2CNa5s64e9+acGzWw+y00XKJP9XBXC39nl+l8/U89OZX+10
	MgyHr9ih8EwCWUBaSswgcyE3BAnk83h7a/xrmb0Naw2iJ
X-Received: by 2002:a05:701b:4508:10b0:192:fd91:c567 with SMTP id a92af1059eb24-1b3c02fdb39mr1062793c88.11.1794364119815;
        Tue, 10 Nov 2026 18:28:39 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm10054285c88.14.2026.11.10.18.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 18:28:39 -0800 (PST)
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
Subject: [PATCH v3 4/6] ASoC: dwc: Fix DMA fifo_size calculation
Date: Wed, 11 Nov 2026 09:27:29 +0700
Message-ID: <20261111022731.8243-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111022731.8243-1-phucduc.bui@gmail.com>
References: <20261111022731.8243-1-phucduc.bui@gmail.com>
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

Fixes: 0d274544bfee ("ASoC: dwc: Add devicetree support for Designware I2S")
Fixes: 52ea7c0543f8 ("ASoC: dwc: i2s: Add StarFive JH7110 SoC support")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Fixes tag, as suggested by Sashiko.

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

