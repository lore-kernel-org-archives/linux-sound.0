Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31ABA2DB7B7
	for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 21:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774386590; cv=none; b=KuvcdyJQh+y1IU0Md2i7Zk2DJqb3JHORsBaDjrKTalTdAJg4LWDlDUxze8ljUHbx1mbCuiWVv55WfygRBIpceeWCxNPnRa+lE61os4FvjcuqsugmR1qQ4bfJFPtWzdekHu9YeIrHbL/3c4rvsnggnSSC/g0IebCn8g5WjRdgn+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774386590; c=relaxed/simple;
	bh=8M5WFJCcXeDlacDr05dtrHKKMO61hFHM2Oh3NCHfwQI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ttS2F+uYA36HT05hW/P8Hc8sFWtriLnzGMJFpqmq1Ob/nUIUyHUX+g9TV/cEgVEzqXyc6NDVI/yi4XfusH/r69JdHe2Bv1Cq8C+vfdZX1WuyuujCnrrghfD8Ua1k3ZcWVVfg2ecVvk1S+L7nkDA3jrHfhpD7vdcNApU5HM07oIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cETDtIc9; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cETDtIc9"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so34080785e9.0
        for <linux-sound@vger.kernel.org>; Tue, 24 Mar 2026 14:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774386587; x=1774991387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wRDaZyqcbav64G9Vh7kntZLUx/YAbHuNaqwbGHWK6ek=;
        b=cETDtIc9kZMxINpz6EKlYN3BaipsQVnfBzce8LwvQXroM0h6Jx8oVgix/o5bA3KFb9
         LWYNU8/EnA+P+TQB3c2h2d0juCwbO0aB2gwZtB5Ry2755Fu6ka2LGC+xCVVXWT18OJCm
         XXRQdWGIrITkULFg036JnUH9VJhDgcUEr7UG73uR0GG5uS1qClsITzn3hGfCPGs5Rg5t
         ZcbX1bQI6GKpxupEKrmxezfvpxfEjzlOk5vl+dSovU7eBpSaueUnW5Nj8ULEP2MUzL0r
         j63T4EuAPr+8zcB8FaSR8NNzcxVfHJuITIzsNuxRBKTYAMBsLP34T149bfmJCIM62v68
         7n5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774386587; x=1774991387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wRDaZyqcbav64G9Vh7kntZLUx/YAbHuNaqwbGHWK6ek=;
        b=r69eCxhB4CSFrgWAySpQYFpMrH5jB5m5aM2Gh1fq90Vma05frfxDb/UHalpQZsXxwx
         PHozPBd2jkJL4bpsSbP0rp8TxlwbWvG3N2TxnQlL0xKSyuZQ/SaP6U3QxQAhL36e/kcV
         LT/Mw1luGJCxhTMlOKHKJnevoI4AMXXUdoEHlfH36Hixy7KKAMhuv15i5jWAQB4lNoQQ
         3XGBpyYPkwHU6MJn+Mg/aFI2GsvqnjBeumIvWa1UcvFh+0qVLboVn0ntnwcE4KtKQD2J
         jbOyFWstV3DJM9xzF9tn6r8SzGZJWHvSKOGkh68wlSZsoWVBOlnyYqVvw/WS4ZVQA7hU
         MIZQ==
X-Gm-Message-State: AOJu0Ywqvs13u7ve53uQDQUzbnEVM/NfGR1ijiVyVEqRlkYntkmr3bmI
	Xu7sfZ5lc0OY1PdrI9Epb30e5jtUt9otfHjwt3B2IUJRmP1ckx6a7UqmdqZK
X-Gm-Gg: ATEYQzw2kXZs4BBv1QUKnmUQOtMXB+ByhIHzRisn3OaO9vXSFH9ThE5bCeOT8wk587E
	IVpbN8efPZpuqsAb9JwDdRGywJYhttONjfbqLsSXlWxFHaxcwEFzd95DAT+hgzoQ7hys/9GIMtN
	DMz9AQNXZJ+Zoqzjye0g4eCKRasxuRBod3Q5ZtdQdh4DfVTm8N6Ywo+XaD1EA+DAPWyvRmQ50jN
	JRrBjXObpdmAswvsWZ0E/LiU0SrClSI3izelevOF0hagCHzX0jhWasgCJ8YIq4Fisn9O7cRthtw
	B0TH8JKDjB+Y3PYslqXWSP6WarlM3HArnPnzebquePx5ylDMMdMJrN8pIYClZN9Tv/x/WIvDZEL
	iTnRpetU7P8mCxfrbhlp9B4j3SJE6nDAgxshF14FurEvFTSuod8xSyIQyHQ4rhN6PiWxq6+QqQ0
	4wNguFzQpUDh7mlHlDzaKHeJdTTSgIo9XBXTdCjxSstw==
X-Received: by 2002:a05:600c:83c6:b0:485:9a50:3370 with SMTP id 5b1f17b1804b1-48715fcc5acmr16849565e9.8.1774386586922;
        Tue, 24 Mar 2026 14:09:46 -0700 (PDT)
Received: from localhost.localdomain ([78.240.217.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm94709465e9.2.2026.03.24.14.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 14:09:46 -0700 (PDT)
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
To: linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	jihed.chaibi.dev@gmail.com
Subject: [PATCH] ASoC: ep93xx: Fix unchecked clk_prepare_enable() and add rollback on failure
Date: Tue, 24 Mar 2026 22:09:09 +0100
Message-ID: <20260324210909.45494-1-jihed.chaibi.dev@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ep93xx_i2s_enable() calls clk_prepare_enable() on three clocks in
sequence (mclk, sclk, lrclk) without checking the return value of any
of them. If an intermediate enable fails, the clocks that were already
enabled are never rolled back, leaking them until the next disable cycle
— which may never come if the stream never started cleanly.

Change ep93xx_i2s_enable() from void to int. Add error checking after
each clk_prepare_enable() call and unwind already-enabled clocks on
failure. Propagate the error through ep93xx_i2s_startup() and
ep93xx_i2s_resume(), both of which already return int.

Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
---
 sound/soc/cirrus/ep93xx-i2s.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index cca01c03f048..5dba741594fa 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -91,16 +91,28 @@ static inline unsigned ep93xx_i2s_read_reg(struct ep93xx_i2s_info *info,
 	return __raw_readl(info->regs + reg);
 }
 
-static void ep93xx_i2s_enable(struct ep93xx_i2s_info *info, int stream)
+static int ep93xx_i2s_enable(struct ep93xx_i2s_info *info, int stream)
 {
 	unsigned base_reg;
+	int err;
 
 	if ((ep93xx_i2s_read_reg(info, EP93XX_I2S_TX0EN) & 0x1) == 0 &&
 	    (ep93xx_i2s_read_reg(info, EP93XX_I2S_RX0EN) & 0x1) == 0) {
 		/* Enable clocks */
-		clk_prepare_enable(info->mclk);
-		clk_prepare_enable(info->sclk);
-		clk_prepare_enable(info->lrclk);
+		err = clk_prepare_enable(info->mclk);
+		if (err)
+			return err;
+		err = clk_prepare_enable(info->sclk);
+		if (err) {
+			clk_disable_unprepare(info->mclk);
+			return err;
+		}
+		err = clk_prepare_enable(info->lrclk);
+		if (err) {
+			clk_disable_unprepare(info->sclk);
+			clk_disable_unprepare(info->mclk);
+			return err;
+		}
 
 		/* Enable i2s */
 		ep93xx_i2s_write_reg(info, EP93XX_I2S_GLCTRL, 1);
@@ -119,6 +131,8 @@ static void ep93xx_i2s_enable(struct ep93xx_i2s_info *info, int stream)
 		ep93xx_i2s_write_reg(info, EP93XX_I2S_TXCTRL,
 				     EP93XX_I2S_TXCTRL_TXEMPTY_LVL |
 				     EP93XX_I2S_TXCTRL_TXUFIE);
+
+	return 0;
 }
 
 static void ep93xx_i2s_disable(struct ep93xx_i2s_info *info, int stream)
@@ -195,9 +209,7 @@ static int ep93xx_i2s_startup(struct snd_pcm_substream *substream,
 {
 	struct ep93xx_i2s_info *info = snd_soc_dai_get_drvdata(dai);
 
-	ep93xx_i2s_enable(info, substream->stream);
-
-	return 0;
+	return ep93xx_i2s_enable(info, substream->stream);
 }
 
 static void ep93xx_i2s_shutdown(struct snd_pcm_substream *substream,
@@ -373,14 +385,16 @@ static int ep93xx_i2s_suspend(struct snd_soc_component *component)
 static int ep93xx_i2s_resume(struct snd_soc_component *component)
 {
 	struct ep93xx_i2s_info *info = snd_soc_component_get_drvdata(component);
+	int err;
 
 	if (!snd_soc_component_active(component))
 		return 0;
 
-	ep93xx_i2s_enable(info, SNDRV_PCM_STREAM_PLAYBACK);
-	ep93xx_i2s_enable(info, SNDRV_PCM_STREAM_CAPTURE);
+	err = ep93xx_i2s_enable(info, SNDRV_PCM_STREAM_PLAYBACK);
+	if (err)
+		return err;
 
-	return 0;
+	return ep93xx_i2s_enable(info, SNDRV_PCM_STREAM_CAPTURE);
 }
 #else
 #define ep93xx_i2s_suspend	NULL
-- 
2.47.3

