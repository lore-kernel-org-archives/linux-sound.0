Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450056;
	b=ZIPlAheeJuWuqA0bZbtMSwc7ni2sSLLCuvysxBHR3e/yFVD7ht52vzzRIgpSVyVhQFyK
	 kqXH3OjGahPERwvhgbLiyirPqLcctmcowlK873pucwQtHJcBXtDoyuV8rQ9zOmPXYG2SB
	 ba0aUUf6ksV5vFBCCPJF3yI25Nmt6HoUbuSRgG5luHmNagmeoLAMSEsZpIQISTtSDPORO
	 ZbfdcMitIHXGr1mfqhQU3ktNY45Q81Vue2Rtvx7eHw1OBtpESqVHsCV9mYCUVP+2/Dr9x
	 D1Ej/X0cgs4Zcs3LXqHLbQULYweniRbH37J06t6XRNv2tBADlF4sJ5tWrUPzOc1Lf0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450056;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VMLazFYJu2oKx7bsMc8HHmRHO8U4C3ZcWRG14B5YE4Y=;
	b=CrjhKW4J3GuPNZ3iOw/QRWyBDCb93kvp6WTyuafgmK9MRxjxowNsa8wjSdIO5kuNpsYv
	 FNZPG6YqOnW/GwaObh31l9xpaWPjaAbJgDChOhjv7Jwjn9RoE5K5hlVhxi+C7fMxTmrZZ
	 EFq0/v1TV8vBMFG9PaR9ejj7a/+km2A1hdsGCIPO9i2JCR10lq9NjxX9fHVhRBSbqTWUL
	 XqiRJtKY/SSYB5EZWYXZsvgqyXirvfM/CbkIHPaTYHQtUnuiiz5mQmICuRtwegCNJGnq+
	 N76EedQECjmE1gqmC9GQL/GxEmiInJ4ptm4nqQAnwyKkDvqtBrOyE6AzX9BSiV2sJVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UqcbKSre;
	arc=none smtp.remote-ip=209.85.221.175
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE39C606A319
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 22:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE39C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UqcbKSre
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5ead5ff47caso662778e0c.0
        for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 15:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450055; x=1793054855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VMLazFYJu2oKx7bsMc8HHmRHO8U4C3ZcWRG14B5YE4Y=;
        b=UqcbKSredRqDcrynqiN5kFKXGgN9kwV3sSBFZWvmqruc9hGLcrbrKm9GK6oeSIu9cu
         +X3Q/5AViVDS3SHUSNuS3OAaED7aqW32nPRX4Tgq1ryvOhp+yPuG9jJy52JJW3cHBgbP
         YGxnvHkFq3+IsRDG2jfpYt8MwLFnb4gbiFkoUlCcFH1lcwZ4Ls4zy4rWCBrVHJ83hvC3
         Kz5n1QLbxMZN+Qedqrt/48mpKnNNKpGMQU92Gj0Etov2cu8oHVJ/JaGgjGAD7fKvTifg
         SdMcFZRJuB0abqKIHRwUVVwiKP16lFpaqoU5s2BoX0937w2HrtLcWMxkbJIoq1XfLNWP
         fjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450055; x=1793054855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VMLazFYJu2oKx7bsMc8HHmRHO8U4C3ZcWRG14B5YE4Y=;
        b=c5mnp5d7FnSt30zk7fp87a4LrZtzE83eA454Rq95Xji2VvsozfnHo1VIPM45g6biKN
         bCxWvenOEsGzq1YRcROyUFB82LPKDJ2MvYh/czpUsDiznOhmKdnn2wG0FHEMiv0Q6KcF
         9svR+MKSNrgRtNSua9bOYm1vmw6iXOaIzpHMxz6jeGpMVqoKB89gpHW7hW6u2Ax3SdKr
         gJWuJEJE7btPDbE0YoA3FUtLDimRM4/HVRqPEgAmWavEUzTmSSk2VuRYeb16axbRg1Aa
         F2+R2cjtrBhFxert1zgonVIt33thsb38wI4HFwcy5W7eTtjrcEjneuIE5qxDkogoiluB
         IADw==
X-Forwarded-Encrypted: i=1; AKwUvBwpS1ycyqCqUe4Zzit0G2dEn8ZkkLKUoYfYV8kca3+989IaPuV5pIrjM82NFEctYv3ly3P2UqUDkpemVQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJnmzmf5/iONz0CGA7ubFOKrfSLMLVdDKvMcjgnI3pN9qzaw6ze
	v8ENHOmpR1a8OIwOpJvKZFUtLNQf8MZvxfVel9u5+nKYul5RSRyAKxyE8cDY1w==
X-Gm-Gg: AYBFou0YGc0xkXQuot46i6vHfgkNtTUn7+ogvVC3YoeP+xlphd6HNAEb/xglSgTxuy2
	tiTprAyHhoQX3boBkn7FmlcIUQWNX4kpqFwlj4XciaCI0DNqJdQirbVAeKc3wSDArC5C/Fbuj2w
	oTggK8WGyFHQc5gpyp0fFxoK8II2NTXsruu3FhuOvV/nETOUCF53D2LX3aelRFga0h1PzMZb0vL
	z8TxyREX++MYqFS+VRApzsfVwQe0hEEOrvMFZ1rCzyjbMdYlO125dNI9X13aZ5K2HoR4qvSGt2i
	L42Uz6aDLa5oypSUidjt/YmjsW7OethV+0MMfjM9fZL1HNuTlaCzslvXTiToxo48nVrLU/A6i0y
	WfHRo0GApJGs9m9x+AXtPI8FyQcqnHubRk6kpNYGqfPcUMQu0AZkejJB3kCri8joJgXdLTt3c2M
	Al+kUL/4rE/eOn3rRljOg4n3Pu5hkangD/yI2UF6d4NBmaCBOltwyUmiSvIyQVgyL7ysYpq5Z+B
	JzMx+Jteu6E0NkmfhXEko9ztqdgr21FQwcq1jJER1ZVnMELy/eqXv8NI1kDPyKe6uWpUw==
X-Received: by 2002:a05:6123:4205:10b0:5d4:1193:73d3 with SMTP id 71dfb90a1353d-5eaaa64171fmr2047295e0c.14.1792450054714;
        Mon, 19 Oct 2026 15:47:34 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.tail2bb604.ts.net ([2804:1b3:a801:c1b3:7470:124f:adf9:af22])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b476852sm11497522e0c.6.2026.10.19.15.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 15:47:33 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] ASoC: fsl_utils: Tolerate fractional PLL rate residue
Date: Mon, 19 Oct 2026 19:47:24 -0300
Message-ID: <20261019224724.236388-1-festevam@gmail.com>
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

fsl_asoc_constrain_rates() admits a sample rate only when an audio PLL
divides it exactly. On i.MX8M Plus, fractional audio PLLs may read a few
hertz off their nominal rate after clk_set_rate(). For example,
audio_pll1 can read 393215997 Hz after restoring 393216000 Hz.

This residue can make the helper exclude a valid sample-rate family,
causing a 48 kHz stream to fail or be resampled after PLL trimming.
Accept remainders within 100 Hz of either end of the divisor range.
The other rate family differs by tens of kilohertz, so the tolerance
does not make the families overlap.

Observed on a custom i.MX8MP-based board: after 44.1 kHz playback and
PLL trimming, subsequent 48 kHz playback was silently resampled.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 sound/soc/fsl/fsl_utils.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/fsl_utils.c b/sound/soc/fsl/fsl_utils.c
index 7651c64bc837..be874eab0a81 100644
--- a/sound/soc/fsl/fsl_utils.c
+++ b/sound/soc/fsl/fsl_utils.c
@@ -153,6 +153,9 @@ void fsl_asoc_reparent_pll_clocks(struct device *dev, struct clk *clk,
 }
 EXPORT_SYMBOL(fsl_asoc_reparent_pll_clocks);
 
+/* Fractional audio PLLs may sit a few Hz off nominal */
+#define FSL_RATE_CONSTR_TOL_HZ	100
+
 /**
  * fsl_asoc_constrain_rates - constrain rates according to clocks
  *
@@ -172,6 +175,7 @@ void fsl_asoc_constrain_rates(struct snd_pcm_hw_constraint_list *target_constr,
 {
 	int i, j, k = 0;
 	u64 clk_rate[3];
+	u32 rate, rem;
 
 	*target_constr = *original_constr;
 	if (pll8k_clk || pll11k_clk || ext_clk) {
@@ -181,10 +185,25 @@ void fsl_asoc_constrain_rates(struct snd_pcm_hw_constraint_list *target_constr,
 			clk_rate[0] = clk_get_rate(pll8k_clk);
 			clk_rate[1] = clk_get_rate(pll11k_clk);
 			clk_rate[2] = clk_get_rate(ext_clk);
+			rate = original_constr->list[i];
 			for (j = 0; j < 3; j++) {
-				if (clk_rate[j] != 0 &&
-				    do_div(clk_rate[j], original_constr->list[i]) == 0) {
-					target_rates[k++] = original_constr->list[i];
+				if (clk_rate[j] == 0)
+					continue;
+				rem = do_div(clk_rate[j], rate);
+				/*
+				 * The audio PLLs are fractional and cannot
+				 * always reproduce their nominal rate: after
+				 * any clk_set_rate() they may sit a few Hz
+				 * off (observed on i.MX8M Plus: audio_pll1
+				 * reads 393215997 after restoring 393216000),
+				 * which must not disqualify the entire rate
+				 * family. Accept near-integer ratios; the
+				 * other family misses by tens of kHz, so a
+				 * small tolerance cannot mix families.
+				 */
+				if (rem <= FSL_RATE_CONSTR_TOL_HZ ||
+				    rem >= rate - FSL_RATE_CONSTR_TOL_HZ) {
+					target_rates[k++] = rate;
 					target_constr->count++;
 					break;
 				}
-- 
2.43.0

