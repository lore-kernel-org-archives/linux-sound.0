Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792448939;
	b=hq9Ly6DyBgyKy7VQCVjuvcXmQhkg5+bo9OydHLr38ej4RjR+NTYc66xPDeRjgNevZnvZ
	 7GQuigx1ZRSxAVrbt864poB2lfUTgd+vKCMutP2w2K393lqASg6qnriiDdDk9O9b9sdtw
	 WsUhatMBMGhyIJVnxvUfRM6svXW8R9TAviyOwdE/+gYn9GQVHNDZkEQFa1FKz2R/LxNbe
	 3sTy+/1zNC/tFzg4U7LVU6Ik6a/I3+5rgHJNNw86XuLDkt16GvO7JD+cLw8xoUxHou1fe
	 7t7S/MNdM6Eqcv4NiHfs59OJf6HwFbsrtOtI9bLN9Te0ji/BFpYEL0HW2TkC3XJteDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792448939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9P2ZZ/chX9UxfZGWfKxw30yCfhELfwUgtEF9EX7Felk=;
	b=M6v/WXVigp6SRXxgfOcgN8xk+aw69KbwYUiLFJ+9ncBN0rn22eZOxcplKg0Mulhh3IaP
	 edCupvodlNY6fyzuC6g5eAgKqzyE2xs4ltFs5SglhzOxeuXow3C2CM/yY6gLzzvEQ0pBF
	 RicJ4kWs+5TYVcC4969Z4OrPQURTbrl7Tm60XtDEdD4tHPmgq7octiXUIud//E4XL1dhd
	 y8pbT0Os54a2QVUR/dLCk+DS4zRTryQa3F4hiPdXohpZTmfL48ijOFb6BA7vVwO4qWlD+
	 6HsYk9Fvz2imTwtv93IJMSUUtseCqW/SsgF1wJzx9qwR15vObHI0DEoEHpZKs1UImwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tIqu9wKk;
	arc=none smtp.remote-ip=209.85.222.44
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05862606A319
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 22:28:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05862606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=tIqu9wKk
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-9908e3cd939so694017241.3
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 15:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792448938; x=1793053738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9P2ZZ/chX9UxfZGWfKxw30yCfhELfwUgtEF9EX7Felk=;
        b=tIqu9wKknYfY7L+x75Tp+X5DWPki8X4LN1OhiqMumWnB+uuetZ2rbs9Hq26owD1/Rd
         snPWaBRZUvSH8WDDVOCT8rFC6LEGelJnAVf6UPCPJelKhsYvH9cwBZjG9H2rojh7TLnv
         2rmfNqmvyy1rcAx4kbaBUO8oEL5KtSqfdYH8wyDQNYn1ZK7uKvARefCAQCc3YKF7wzGO
         ZdOVnuJx5RrVQ+wfxiI3WDBaPZZDCmCPYF4MFYNdQtY3eNlHloCz4y6AbW3+JsETVXhc
         E81m47N6A584i6/Fy3qujfafYYc1es9EXuhfHx4/HgLmXv/X/LKAhWfD8rtVS6bMOY9o
         zovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792448938; x=1793053738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9P2ZZ/chX9UxfZGWfKxw30yCfhELfwUgtEF9EX7Felk=;
        b=k1+xeklkGlMswVjrvcTJZQOXPW0DrRIKfibnBE3ySzSjCTy+cCI1gxGjq5xCUNu5jz
         RvAlsVgS4Q43kQ/1hh5dKe0bLwHu3EkoiiKEljqIG5zh2V1lLJLqgMnvQT/DOBidQ0qs
         uS2Z+fliO6uWs0j3bilAzGjLYjzOw0Kn2QbyTJdjwgwXLNOZ/1vAqjZ48vLo0IaYPeCu
         AiArk/FvTjE9B+6JCrTrFOLDvqiuHMWW0ji5vzydhDWVBIah5GWxFUCt8UHNU9VW2jx0
         h3M2HNlG0Wl02ROmRp/S2ldG0YWwt+CrkW7efx96wWHjDd9f7a4UunlK+35Jn28BnzDT
         YPIA==
X-Forwarded-Encrypted: i=1; AKwUvBwTcAxNJnmF1NJLtLcz7NqCTRjYEBigMO0rCV/yGbCEdgOGMUgxv2+wDlhAQl04cXsbPazsx4LxqnGPOQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIVaeJqMJ5CABUdlJjDyssly8rCjsoEK0O0XABdASucgnvOpCbo
	wSEEfWMZ/52DOhOa37gwanyzXynw4kGY0b7UTiIpRwoIxHkyt74KenRo
X-Gm-Gg: AYBFou1Css2J3bM7Qej3I2W9Cw1ikf81gAzWrgF6yL42of4HJw9mk10hnmm88T8KDjy
	D3/2G9cat77MGtuFKrKXms0saXX/vs2a/I3GYBWrkXP4rYaRW4P7EeB5DH0xnL0OkMkgeg4jqbY
	iQ4Q5IOGCdIVV2RcBUUQtKjDybChgBWQsVmRwe3I9tNxHzvNTQKzfuIw41samQuFRDRn3yT5o2d
	UBVznRVmAQAnjMJy0POda0puMExRNzvxspBb6DPaYfU1/I4qD6x2FhtGFkF2SzIyHC+L3YZympD
	vPFThS05F8rOOLOk8NEjad0OMKErePloyYm3gIKGCl29HPJalPdhjsFYBR+SjqD90I2YDrQHi3B
	4y/yL9X6YDcpdsQ0ZwG53wihUSJnJuHk2jc8nRTpY6zuLO4LxNXf+yre03X2zrjZLxYJ4P2d+0b
	NSw/FKKFa9DOqGV5l7d8VchizXX0ADAMd8qSBr6zFqLx63B1QO2LfMWue3SCUeMReHjJjWPyNNW
	0mqLvcChQP4PgZU6xG3vMcRf/R12vr3bJyUogpWzb9zR1ybjfaJM0S4JxdHCR8GqZtA
X-Received: by 2002:a67:e703:0:b0:7a1:f980:e934 with SMTP id ada2fe7eead31-7cc369c0d0bmr2359738137.16.1792448937842;
        Mon, 19 Oct 2026 15:28:57 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a801:c1b3:7470:124f:adf9:af22])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cc7722e6fasm1303685137.7.2026.10.19.15.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 15:28:57 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 1/3] ASoC: fsl_sai: Defer TERE until stream setup
Date: Mon, 19 Oct 2026 19:28:25 -0300
Message-ID: <20261019222827.131120-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
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

On i.MX8MP, TERE also enables MCLK output. Runtime resume sets it
before hw_params has configured the stream, so clocks can start from
stale register values.

In master mode, a custom board with a 400 MHz IPG clock drove BCLK
at 200 MHz before hw_params rewrote xCR2. On first open, reset xCR4
also drove frame sync at about 100 MHz. Later opens can select the
bus clock with DIV=0 and again drive BCLK prematurely.

Enable TERE at the end of hw_params after programming stream format
and clock settings. During runtime resume, restore TERE only when a
configured stream is being resumed.

Fixes: 3e4a82612998 ("ASoC: fsl_sai: MCLK bind with TX/RX enable bit")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d232c8f53061..51779d7f8bf8 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -799,6 +799,15 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
 	regmap_write(sai->regmap, FSL_SAI_xMR(tx),
 		     ~GENMASK_U32(min(channels, slots) - 1, 0));
 
+	/*
+	 * On i.MX8MP, TERE also enables the master clock output. Enable it
+	 * after hw_params has configured the stream to avoid briefly driving
+	 * clocks from stale register values.
+	 */
+	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output)
+		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
+				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
+
 	return 0;
 }
 
@@ -1983,7 +1992,13 @@ static int fsl_sai_runtime_resume(struct device *dev)
 	if (ret)
 		goto disable_rx_clk;
 
-	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output)
+	/*
+	 * A fresh stream has not configured its clock divider yet. Keep TERE
+	 * disabled until hw_params in that case; an already configured stream
+	 * needs it restored after a system suspend.
+	 */
+	if (sai->soc_data->mclk_with_tere && sai->mclk_direction_output &&
+	    sai->mclk_streams)
 		regmap_update_bits(sai->regmap, FSL_SAI_TCSR(ofs),
 				   FSL_SAI_CSR_TERE, FSL_SAI_CSR_TERE);
 
-- 
2.43.0

