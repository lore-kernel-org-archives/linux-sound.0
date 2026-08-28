Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763A12DF138
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 09:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908578; cv=none; b=U+Q19NypHZsilUpxXppEWKI6Rc70Rs8KfMYLLl0TjuT/TUpIvgWQMCZnH4m2P0uKN9r5/BAGBJyJ1iaGwRzXWiK1qmBgO00uf6qFysk4gibVZ9xmZG7+Fok31+BNX2tqJ0Eb0N954Y9QbvuuAVknfPQm7a/xHTK9TC472vlb8lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908578; c=relaxed/simple;
	bh=uWaIJLrp3bYszczP+rUWUCw6rT/vSZX1BUIy643qHEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sN4+j7k0F8zr9SegWcKVoPu+9bmhzZIr+4+DGio7p740CULx1bjXlnHf4tKvmsXfon39ZnUWrD0lkM+5FE/qhn+bo/JH9RthmUx4a2J6piCynBq3/Oh0XLPki84FB73ZThdHeqyPjoSzwGKpWM3DXL3itb3OURqYh/yoIkJ9hZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M3v6gn11; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M3v6gn11"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8534d507f59so743741b3a.0
        for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 02:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787908576; x=1788513376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IlDfgda0dYFq9rxw3JdEQPpWay5cHlVA/Z3MyCDCs5g=;
        b=M3v6gn11d2HXWX6OpHTG4QOUVmO8mGG8GC5hjFHF+AT9/VMvYHHv8C5HvJx+8qARL6
         0E3L+FvFCOvvIRzlO2DwZjk/bwxCBRwF81jQ/GK3ltEML/gY47dBRw7XIMthAIBvA5Fq
         Q20fgwOlYlnuxIoA6UBVRkzf5azSQayT4t4N7tVVerxJz+qCk7wJSNiMj7Ky/9YbaP3i
         JkCIeFzEzjVYAN9hiZpPq5MI71AU2BSbYmgMngD+wBo3jZmy6+/VB+RxxPD5EjXxlqNI
         1DUY1AHjpMucomItBcBvXlWasNypqQ9YaxraqD/58o0muqLyhEbrq260t28UDCwWUyVk
         EiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908576; x=1788513376;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IlDfgda0dYFq9rxw3JdEQPpWay5cHlVA/Z3MyCDCs5g=;
        b=ZlRY+1Er6kvhGjrTv6JcoPDDDqvccTDd72HlwUSl27NKYMUlbg899m2GvVRmb1ah5k
         XaBrYHCi4ctKrl5/+3T+EWpM9V4FUNnJnp6BzJ8G5nknbjfaJ6ai/S/ZgZ51Xo4ploQz
         poQP+VGLYaY/QIPqc7W+2g1/p8kUv53tzknudGJHVRpludskSv/UADm+6iZITv+dzu1R
         JW9td/Xh2p35EtDmWgb5+hi2+NGog3uJSVuN4nsPc28NPvZ4HumxZf6MhXhw3xD1O/QV
         tMZNhr0AzznkY/gm8U2OA3PZATZRSePtiXzSM8/wdHj5vqhEeN7mP952I54oi7MJGsgH
         d6cg==
X-Forwarded-Encrypted: i=1; AHgh+RrhTFKmyxXe9unFr2PwwXi8fQ+xpaLnQoJnZ/Dz5uJThCKW6WzFiul/mxrP+cPZyQYI+lJS+iIaEZ9eoQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mXQQAMlmSZ0JaLfwnSLP4EqLLBrAO+gdqjEQIOogJPbVjZwS67
	vvHfMW1DmrKDEE6zxYDFay1Glc6ZjsdU/fZ4xL4eKPHia71yOBcNrIXF
X-Gm-Gg: AR+sD10HamIcQ4fYfq+4mZ8M7DHVKfOBVbofNzvd9FF/vuMG1PAS18AzUQlQTOgHfAQ
	BCERuYCXGU29vcyfXs34sJRNMhmMDKzHGoreY6izrsX3P89fHfXD3mRkkDSnPV2S4Z+0wwMAfyr
	G7E7uPoDlvYG5pKGww9/IEKO3KE5OnTQ+v2UUun+QWnKTqiJHPuqrGlNtnIj1vASZrVm1XBEMaN
	hcsZoNn+BWi+tz4/SjhvKNELMKmU0GewrtYC42G94Bsp8tSexO1S8KJi5RtMjSWAYhX4DQ2uqf8
	oRmJPa7NUvHQp5IfkynUYFIYevuC5hD+uyV/86boWu6upufbQwr7D4Bilv773oYihpBWrEhRyEh
	ilpHNb5M+nijbOfoO/NgVDt8fwgzcjII2tmrUKXe233uxPSNtB5gTyQJztZ6IGjxqKQa7lAqphm
	2OyVxQZLvN13AWUcvobfFkPGmuNV00SvCbXZJYAsN/tJyiQKfdi1I+A++ltkQiKW/kJFnoOQSHU
	nFElJ8IuLjr2VERvK6Yn7hRj75vd9/xEuOGov5gqe+ZTdtdPpcjFXyVWtCAo15nf4doH2+H9VZ4
	4K89
X-Received: by 2002:a05:6a00:c83:b0:853:6571:9567 with SMTP id d2e1a72fcca58-85626f06dcbmr11500046b3a.4.1787908575762;
        Fri, 28 Aug 2026 02:16:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fe78fc3sm381248b3a.24.2026.08.28.02.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:16:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 4/8] ASoC: mediatek: mt8186: Fix APLL enable error handling
Date: Fri, 28 Aug 2026 16:15:28 +0700
Message-ID: <20260828091532.600047-5-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828091532.600047-1-phucduc.bui@gmail.com>
References: <20260828091532.600047-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, the mt8186_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8186_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8186_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8186_apll*_enable() fails.

Fixes: 55b423d5623c ("ASoC: mediatek: mt8186: support audio clock control in platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Return directly from apllx_mux_setting() instead of using a goto label

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index b3e938088a7b..85fe828ca5ae 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -361,7 +361,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -386,9 +388,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll1_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 err_clk_apll22m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+	apll1_mux_setting(afe, false);
 
 	return ret;
 }
@@ -414,7 +416,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -439,9 +443,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll2_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 err_clk_apll24m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+	apll2_mux_setting(afe, false);
 
 	return ret;
 }
-- 
2.43.0

