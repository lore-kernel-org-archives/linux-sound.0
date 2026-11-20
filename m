Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795169072;
	b=EG0zXPZftNPHDyWY6qWrYup0NU4DQ2KQaU70G+SP4S2LF4mMbf10gseYK9i1WOyoc7PW
	 Dhi3TOM8o09zFuuBWfmc5oaABdbVS3jtWm48yOWlFLSgTLDylPNCrcrYlaEgG7BK3kf8M
	 DrJ8DhBVy6wjqxtXSt2njivHniFciqty/fem5W9mtkHb25Kz8neZe+Qy300b/PCtCgdtt
	 +4A1tBZa1F72RNazV8qbGHfHWn2wKUN4HlOxezayA1W+Qv39ZOQR/Hf8EIpxVywMW6xi1
	 PoLLyEjg/EWDR6uRV6iWiHyJbZspukgz6/vTyKTSCJZimRXDCGIhurxxmexXkmp6Ltg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795169072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zZhz1yQnT71k8uzCjSn9kv5P76pbsHicTRHAiqa3oWA=;
	b=nPW/k+KlICzcRoqccVTeG6rf0WmH9E7g7gMEzayLSE0BI63/EcOSYnAoFRjxfNqlxIh8
	 J6Cx/cvon/zcQmL0Eh+UZrWai2qcOEcaEzXK39uQ/RYC0A1lPm/OjU0qech5upl10v9GZ
	 7bycNbjOm6eMv4z5aaKg+MI4mkwtPgrBR4+E2jdIc482IxuJ/aJoadwAzPFWsAic8If2W
	 wL6bjBD3k5Rp/CgUHdqIwk/nAKHr2Qm87zi2FMBYDFHc80K8su1gfcNfNx/mUm89shn73
	 EACEtzSGStG8GGIcPdcbTx8YFGVq5lpyQjjqixX4La7qoYd6Yeq6lo6nYgxwXYeZsiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rv26arhW;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D868606A320
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 10:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D868606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rv26arhW
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2f0426a65e0so4294505ad.3
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 02:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795169071; x=1795773871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZhz1yQnT71k8uzCjSn9kv5P76pbsHicTRHAiqa3oWA=;
        b=rv26arhWCmPTw+sGPLYU0uZRUZySILft18MOw1dsJV6s2ZB7fEQ/7c9oU2q4avOJRQ
         P6ywwpyVAnYf4JZslqApm6RUgfklMx7fj3V0QJGETa1rHrisIBBoR+fAxb0HsX9oMER5
         JxUqF5dZZv4QancIRpxevm3WC+OMkOQz4MiACoFaw/JFYUBUQqqzLdqBDtJL1yDEKRdE
         H8rtHN2aYSfC/AUVxhND/8L/vluzACFGo3rY+v8vamFaE6dX7yTE/YllWOFjj82E4qbv
         tzXONUndkRC/YFDECF87vUak2sghtrx/zPuOFdVNXFGXIHfJWSYaEP0MMT9bD706pQNK
         pzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795169071; x=1795773871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zZhz1yQnT71k8uzCjSn9kv5P76pbsHicTRHAiqa3oWA=;
        b=p4Sk88dC5PMG2+zVEhQltboIa5xFLUG8a8EEtABDRhJursr1jXu98AWOq67obo0giu
         GRi3+PvmdBdcbMEVYL2sFrvPa1DITPNYPuKk62sCvqXV6Z6aPBUYi6oeUcUrgMQC1Kut
         zucMKigQXta5qLUtB8HnBc9EgE7yTKsE25UKX0U69S2lV6mBDoqWQFZUgY4t56RMvyD0
         APNirGVRWF2L0Bhepj8CRLVhnWpKE6m5Oy02NI3bSBA2zksl/JYpHjOdsWb9XTbLA9x8
         RV/2TPmKGJhFSkbIy6PKSAkbsvLWVpBB5YgiR0XIvlWiy0Wfk5HFxmDDu67AjmXhtt/9
         fKMw==
X-Forwarded-Encrypted: i=1; AL+hErEVCyda3g/yUneY1vDPtR+DkjDgZzzTjmzdv+MRTycwW+KoJsWJLZ2DW5o+5xjgCVIFc1DzLak6pkjmbA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9LYY9D6kdEYJ3XTMPkgV9DjuEYefw3sXNc2mEG96z1UJ5WpjL2
	wYcXVqvIsdzjP37NFqfmI4L46bHfbJsOlOwbkthdtzoK7UuTsiL7dJyH
X-Gm-Gg: AZFdTZeBCgBwspz0z6WGfWdNrgZstednJHUxAIE63Ku8Zdi7zqJxyTgu7eiO1VyWSDQ
	DownHUO9GAIw1UWDUUmdV7Hie2z5P0Y1QbW+mXGK/2VABaQFpok34+6G4JRxjdBmJ4Wiy4bK8D3
	VaFRPE/B9d14v/fSiyxa07fph6kwbJxtvK85PZ13+73nqa/hMtF80OTMh0GaGOG/BCoYgOMmZfj
	kYAN2YtxeAoU0NdWS+E2ZioGJgbjO36Wlojkb3duy6zzl/WXGpkZ+F3tAfpnMNytDdC2MwE7Khf
	0B44ep8u1TG3/tRMLCRTPn8iG5HZnez+mCZ2ZsnXntPE+Zb9oP4DaBkae8Oqn3YW10rWTBwOh2d
	k04n4bOXUlTp+HkOODcEXIsqAvSCa8TWVaPN8SOzs3C4mfWnF1+Nedkma8s8EE1SQxdwQRES2qf
	J9rtaid354ePNsJ9jdI6JyHAONHJWRCBqBELvl0BahXgxh3Lt/cixkoOOOmm+/nm7A3MWBV8lvR
	n+87gBMRKzc5WL+6zTqA3b2bAmtvCqODlrlI3waEvzVOPF9IbvDsZQJNjOJ0Ibtl+95ZpJ8rji2
	Drdyzyxlom8chN6aDC3vfAVHxI49S/IsBc5izJLtplFzNQdzypM35Ukzr8KW09xL1XMUJ/mI8e2
	71IvPa0qrTE1gehJNHekZWXCufQQf70kfFOQfcLLi4DKO
X-Received: by 2002:a17:903:2391:b0:2dd:c0ff:e72c with SMTP id d9443c01a7336-2f03f263555mr26063905ad.62.1795169071541;
        Fri, 20 Nov 2026 02:04:31 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1a69sm11797365ad.18.2026.11.20.02.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 02:04:31 -0800 (PST)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: atmel: mchp-pdmc: Mark IMR as volatile
Date: Fri, 20 Nov 2026 17:04:07 +0700
Message-ID: <20261120100408.8053-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120100408.8053-1-phucduc.bui@gmail.com>
References: <20261120100408.8053-1-phucduc.bui@gmail.com>
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

The interrupt handler reads ISR and IMR to determine which interrupts
are pending. While ISR is marked as volatile, IMR is not, causing
regmap to return its cached value instead of reading the hardware.

Add IMR to the volatile registers.

Fixes: c5682e2ba132 ("ASoC: mchp-pdmc: fix poc noise at capture startup")
Fixes: 50291652af52 ("ASoC: atmel: mchp-pdmc: add PDMC driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/atmel/mchp-pdmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index 8b55d864f3d5..4b380dc8b6cf 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -842,6 +842,7 @@ static bool mchp_pdmc_volatile_reg(struct device *dev, unsigned int reg)
 {
 	switch (reg) {
 	case MCHP_PDMC_ISR:
+	case MCHP_PDMC_IMR:
 	case MCHP_PDMC_RHR:
 		return true;
 	default:
-- 
2.43.0

