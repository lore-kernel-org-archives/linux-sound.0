Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C99B49DBBE
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 13:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465029; cv=none; b=jvuI5f7d4bzXdlFLATZ4xjsOWk+Kaol1zksIGzanfHH8kWxyplM7yMsbTTEUYLXA8Q6R4iebu318eMJWcfCiJuyzUmdhu3DgFN59+f4UWIGTUVT/GY8BFrHI1FZTOO4x8SkjMLoZNInbzdss2qdXLbbHhnmAqhj0/eJjcY4VbEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465029; c=relaxed/simple;
	bh=FW+M5Chu4W2BidjPpohFRBIjtT2yv0mCxqjYHiuMgvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hlnmj9B7DT5C8zMMuPrZjqhixqsMilEl1yahKxeh4FwD4J789sAqzIAjxUt3chsDcXcLroA7i8qAJi+WcIpY6ZUgSKknc0Oi8OICmnSlsgVU3QK9phiHIGIdXULZ2O5iCcCEDigI41Tu+nYtr7xlQXiIYAcyTlwAj9MCIJg18uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpIZxY7D; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpIZxY7D"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc4b5bdd578so1392041a12.2
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 06:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791465027; x=1792069827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sbNj7+3qYNNHpJNsAPAmuGDKu5hgPeJHpvv36maJHJg=;
        b=EpIZxY7DFpAxVHW2PEmPVWMEl51UnoQXpbV3OgjpRUEl4hGCU0j3pWjSkCierWo7X2
         BYksxSPlTjZz2UZR4RCrQEQG7gPlKOqKqe87g0zc1EbeLo1VUUJ0RyR4OVWuPrm3ggrY
         bhlLtq2t5ZzCNN5Hu/Ah6KOTOdQ1nv7hQhTO+/af20GEjetddQ/s+WKYmzyUWy4XO13s
         MoOexLvNaLPwyauQScJP2quoRFi6l3WEM84VM5I/rN6RMqB3NBeIxXDaTtUl+FB2FV4Q
         qonljRgmMF7IHEDr/4eM0KrOFnJviiVcRay/esDTIp+0qUkSf1EYdGIUhDymBqZTFswz
         eQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791465027; x=1792069827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sbNj7+3qYNNHpJNsAPAmuGDKu5hgPeJHpvv36maJHJg=;
        b=tC1e68g2+fasCWtAuvCuaJ0+9tMkP4tuiweHrO/hjLRaOsrWhtAWmdLC/yER7snhXN
         bzD54n0NL0lZTMDZocNsqyp0xVwq+K/ywKaX14bCiJlO4qOhE45s93io0FiGxIAYMeHM
         beHSkTeOGu/WyuAh8u9DPyFTabY40t+LpUfXzUikwjZkV3hOe0pljgDOSrMVesIr+3Wf
         BUZca6bccmd566RV5xgOvDfB3wq6yBCLzRHua02oDKHPCzBNdl78YW07Fz1/qrFDMrK+
         Nb1+YCS1zIzVUiXhDiAUJuNVFkJiJq9lSvq0JwaDe4IPLY1+BSAqXUf1l5sq7VV9veta
         VT+A==
X-Forwarded-Encrypted: i=1; AKwUvBwk3y2q5zYZ0USIVUX3QXs3352L56MmtyhtJ90xIH1EHu3jeFCktMZqxVNL2ZfFe2Sz1wNdCvgkPSe+SQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kPfog+U/ZH6Jsy5vPGPC/uTi4LL9lWL4ncwYHPSNoSyOf0UdcP
	a79hLKWzMgSfmC8xXTOfxUKbar9r+fH9byC2542lOzMdzgXbdc8ugXBj
X-Gm-Gg: AYBFou0Hsw9pvid0L2ofniIKjRSUj/8iCL2hZvlziGrUme15CzCsIMKJD3l8YCtWDiP
	YRNiRu91pwZwDSklWcWlbf6FBVyxNPSrvvhCxJQUxOUIARAvX46P6ccqb3UP2rVPBWvegsrBlXu
	ZLWMxZCW/8rMWFyHzVd08wgWxBCawsxIe3t0bzkjAjIJ8EdVTj2PAaEHPOctlrRspgzDJkSbqfC
	tGTDYnZ1uA35u+sFGVgh+59aeAFWVrNYt+8aKOYpzfX8HIhaFP54E5Tmast7x3KXZohO7snk2o7
	05Fopxd7TmWWhEyR48PUsUwEYBUgH6IgaE1jmEGw25d91Dh77nqX5ii6LHrS4zIYHplcMP1E9B/
	5DNgAb0JeP27YFg/wGGne2TYXf+nDNY9Ta4BHlKXKOBeVWZw5aaQb2/En1qof8n6EOvaQReU+04
	zkscJSVGwkWlgKwHynd12+2lbic1wnnxcnYWiUYK9CSZ1vgkL6KOOp2sPIKA2NLjTzTGDDJ149b
	VMmYhHFdOylv5cGoT6OyrOiBXy31gvYpWAfCnv/6q1j50WdDnAH3lBxciu0kqu4QEW3uajdF1sE
	kERs564L+w==
X-Received: by 2002:a05:6a21:3b8e:b0:3dd:ff70:1426 with SMTP id adf61e73a8af0-3e133d9578cmr4573434637.3.1791465027299;
        Thu, 08 Oct 2026 06:10:27 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-893143368a7sm870761b3a.48.2026.10.08.06.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 06:10:26 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	patches@opensource.cirrus.com
Subject: [PATCH 5/6] ASoC: wm8978: Fix the 128x oversampling switch bits
Date: Thu,  8 Oct 2026 22:09:51 +0900
Message-ID: <20261008130953.2446692-6-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008130953.2446692-1-sammiee5311@gmail.com>
References: <20261008130953.2446692-1-sammiee5311@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DAC and ADC 128x Oversampling Switches use bit 5 of R10 and R14.
Table 66 of the WM8978 datasheet puts DACOSR128 and ADCOSR128 at bit 3
of those registers.

In R14, bit 5 is inside HPFCUT[6:4], which the High Pass Cut Off
control owns. So turning on ADC oversampling changes the high pass
cut-off, and the oversampling bit cannot be set. In R10, bit 5 is
reserved, so the DAC switch has no effect.

Use bit 3 for both.

Fixes: 823dba519122 ("ASoC: Fix broken bitfield definitions in WM8978")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/soc/codecs/wm8978.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8978.c b/sound/soc/codecs/wm8978.c
index 25cc433c7653..258bc9f88f52 100644
--- a/sound/soc/codecs/wm8978.c
+++ b/sound/soc/codecs/wm8978.c
@@ -255,9 +255,9 @@ static const struct snd_kcontrol_new wm8978_snd_controls[] = {
 
 	/* DAC / ADC oversampling */
 	SOC_SINGLE("DAC 128x Oversampling Switch", WM8978_DAC_CONTROL,
-		   5, 1, 0),
+		   3, 1, 0),
 	SOC_SINGLE("ADC 128x Oversampling Switch", WM8978_ADC_CONTROL,
-		   5, 1, 0),
+		   3, 1, 0),
 };
 
 /* Mixer #1: Output (OUT1, OUT2) Mixer: mix AUX, Input mixer output and DAC */
-- 
2.43.0

