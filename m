Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04522423A9F
	for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 16:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975027; cv=none; b=WSxus80Gnoasp9G1OH5BuvjwH40TjPruFoWO/66w+u0LXjbnY9xasdXjiaGjWTtPcB+qAdEqesA+CNR3KZCND5Erf3Zq3IOTxmNqs6OT2WVuG7bRbpfc03vZLOD7KPOSLh1caVjllTrgujneEwHvKJggnYNYzrVJaX0DL9aQNq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975027; c=relaxed/simple;
	bh=PHs3f/gaFyYReQoQxx1imm6pw7yPcVpOTvcve/so69k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pKL/+KbVe2qkD1Zb3DqWU+TTZMDOJOzRA72ZjDaJbyR+wl5hdhtE2DesJKP+A7EeHymaSwkFtJpu2yQMH0RoH39xYc3iWrg50X3J3uDF2Ms3GKNPZ9zHoKSH0RQzGPhp2Qnuq75Flah5Z/8HzKvnlFKA9tmTSD2WVI6AEWrWCN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VN/C+NPh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VN/C+NPh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2b0afa0210bso30330875ad.2
        for <linux-sound@vger.kernel.org>; Tue, 31 Mar 2026 09:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774975025; x=1775579825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/w11NnTydmVHrODXF8dcnWWEar8WU1lyFFID+3qgjWY=;
        b=VN/C+NPhP50wiRdw7USUtakUrAOv9Vbzsr5hsZDpZ9rc0Yay+nEzmFkO4ATHz+wXkV
         1dt6JxS05KjpLlTsKQCbfCnQSgPVGyY+WDTMaXrnye+IKbmjOVJzNTrF2mjld1+EvrNe
         qftcTd/ojITUB8myW6QtHchPbEx4NhGEEJcV8/HXgS21emp4pAaEZBx4vRLdQDNvFkaU
         9E7uVKDWC12pIuANpM7JNz1RsOF7oquqxuBV2G0NblP1ugL1xwa+68vJLIR9BdhPNHDj
         /5yUVkveTDdoT+90+smCHZhch7237gMBMgP/TJRO6wAUu8xBmUV62cAIkiq2GKrPe/1A
         2Ffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774975025; x=1775579825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/w11NnTydmVHrODXF8dcnWWEar8WU1lyFFID+3qgjWY=;
        b=KT8nzld93Wtpzocv1NLQINI30aLRzMuS+nV+Utn56vdKyXhAVrOaVrBf/Ws2UZ+ctx
         tjiiZBvJpvKS1+bYR1oUYLLL5u8uUsOCHk4wl7Ky3rsHQd3ANc4SLsDj3xV1kToOF4Qg
         McfC6Pt7yYau0IUa7EgnIa8shRwrSvVZXI9Ve+Tb4jLnKcKkaZUraoT7dmguxhZruU4n
         BHPK3ehg+JMCGRkyYWI9zmL4QM7k5+f2JakXAs2hhSshEklQZZMbTIP7a70YV6uahmFb
         pgNqgstbGH4U2jZyfQjcl+Ivm0Er15V/D/GVR37tdaFdKZ1a4aEndwg63Q4VbtdJFn7v
         bdAw==
X-Forwarded-Encrypted: i=1; AJvYcCUkV3RZPClAd7xrbx7z6CEUMP2KXHIqpu7v5poZbiVx1/b2VNZGLBTWi5x1fkEvRbTZ9/FsHXAIybNGjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSFPxzrw72nsWttskLWMGlL1N1w1JxRbZ9OdCdk+rwLPJS0E2C
	Du4iHjPlWNXtAD0bszngA/zjNib5DgwST/qWclrloyKQ69JFpq4e989O
X-Gm-Gg: ATEYQzwzoLIwKADA5rLwTSz1EHJdwQUzteY0d0G+PP2QVVKtyxX+L0+ZorRButsN9qY
	KTpW2T685WXpdZHGucEAGV11obSP8idO2h6777e0gIkcW+nQjPl2AThM+3TxhLPSZ+Bao6uA1+S
	VmoVsDEECEzYr8uS6G5aOTa682DkR+Yf5o9tYnojQ8f6Oq4ZJOyUxC3xcj5hjFZyoG+FZxYBBJU
	fZIb05M1qusuTJN6BLFznEp1vBIjwXbvX38tTyjSP1C120Kmkoy0oKHd9hpnQ3Ax05aMmkdyVlm
	VFR+Gj63abRBRNW5G3tW46tS77j8KVrYQU/C4R9j80dt+vgnuvbF94bGb37RZwO2mn10xGn2f3s
	G15NrmaF1cY8N+qBQHRTZHR9h0pcI80HSblgu2VlQi33O/si1N5jw6O8yfAhBB1g/6hIwYtdk2Q
	T5qFu/I8mga1K4NZqD+cn3w6kNqGODzD0bwX8ictHuCRh3p6QN
X-Received: by 2002:a17:902:e885:b0:2b0:663f:6b53 with SMTP id d9443c01a7336-2b0cdc9b555mr175094965ad.13.1774975025211;
        Tue, 31 Mar 2026 09:37:05 -0700 (PDT)
Received: from debian.killsync.com ([152.59.222.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24b02a11esm116069255ad.65.2026.03.31.09.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 09:37:04 -0700 (PDT)
From: aravindanilraj0702@gmail.com
To: broonie@kernel.org
Cc: cezary.rojewski@intel.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aravind Anilraj <aravindanilraj0702@gmail.com>
Subject: [PATCH v5 4/4] ASoC: Intel: boards: Log error code in MCLK configuration failure
Date: Tue, 31 Mar 2026 12:36:35 -0400
Message-ID: <20260331163636.15238-5-aravindanilraj0702@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331163636.15238-1-aravindanilraj0702@gmail.com>
References: <20260331163636.15238-1-aravindanilraj0702@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aravind Anilraj <aravindanilraj0702@gmail.com>

The dev_err() calls in platform_clock_control() for the three Intel ASoC
board drivers do not log the return code when clk_prepare_enable()
fails, making it harder to diagnose failures. Add the error code to the
log message.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Aravind Anilraj <aravindanilraj0702@gmail.com>
---
 sound/soc/intel/boards/bytcr_rt5640.c   | 2 +-
 sound/soc/intel/boards/bytcr_rt5651.c   | 2 +-
 sound/soc/intel/boards/cht_bsw_rt5672.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index cd611c0da4e1..a934b3684347 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -285,7 +285,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		ret = clk_prepare_enable(priv->mclk);
 		if (ret < 0) {
-			dev_err(card->dev, "could not configure MCLK state");
+			dev_err(card->dev, "could not configure MCLK state: %d\n", ret);
 			return ret;
 		}
 		ret = byt_rt5640_prepare_and_enable_pll1(codec_dai, 48000);
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index e2f59a008b29..3c5082034f5c 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -205,7 +205,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		ret = clk_prepare_enable(priv->mclk);
 		if (ret < 0) {
-			dev_err(card->dev, "could not configure MCLK state");
+			dev_err(card->dev, "could not configure MCLK state: %d\n", ret);
 			return ret;
 		}
 		ret = byt_rt5651_prepare_and_enable_pll1(codec_dai, 48000, 50);
diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
index 0c2435edbd08..016732a57278 100644
--- a/sound/soc/intel/boards/cht_bsw_rt5672.c
+++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
@@ -67,7 +67,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 			ret = clk_prepare_enable(ctx->mclk);
 			if (ret < 0) {
 				dev_err(card->dev,
-					"could not configure MCLK state");
+						"could not configure MCLK state: %d\n", ret);
 				return ret;
 			}
 		}
-- 
2.47.3

