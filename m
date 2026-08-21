Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE4F0443AAB
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 12:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315396; cv=none; b=so59rR9lq8lnZVrldbhvUyzfcYB9c+G1Kzf7AAQFOVtHyveWCAEXHKTeWcvwQjRg98KcsNVcCk0xOLSDaU/thDrVMBGRYVWXGuaB4wY9gET80J6gaEDeVFWKhkDIjZdCf0uM0E+oLMR+mWynP2Gi13JYuR6mnfBZ9rBFlWfF1dM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315396; c=relaxed/simple;
	bh=o1MWaXkXr2aP1vAPknR4xkrDwfhPNsw9JwAuoBORvkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JrhxjhIFkgb54ncc2Ml0gO997Tl85ZkJDeDHKVSzhri39rgg3830OIxmYGd/kPNHNhCAyCkOIAGvg8BbvGbkb5uA56RhCLtULyL5spXNWgghLgcwzfKT15/PePjVk7IIn+rxcYW85XIRH7H3Xc9Q3fHK3kjoSymN48zegCy/f+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzId3syV; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzId3syV"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso900503b3a.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 05:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315393; x=1787920193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g4hgMi6/uNAtRYrz9ZogYJurz7z1EY11bapUhL//V5s=;
        b=kzId3syVg6pWf2usunhJde+DoqY0Ik7itg6gKbH4FSUXXaVnrdfdXvAwzEgEKj3bPz
         +ShcRTvhM4KIJAzQBWpSVSvheWF8IVFS53zrLBEyqAl4BUa29ZcoiIBiJ8vywIeL12J6
         d7eZI4ngZsBpC39RSM/uh1+L331mQKPcY5y2b2D5hRKo1MMkigPzNkqsvcc2Ax9zQ43w
         R/JtFwz576FY5tDJN5tZQw5bw1P/HHBJ3IvCmm1K792yVxgtQZMOxGglMVBo5TQ1iOPE
         4qsrCLQxApyYVk9qjDXSJ6Z8uJDgzjA75E6eaNSa2G7fv7A4r0VbAJYFO7txiCkSe8Zi
         PrdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315393; x=1787920193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g4hgMi6/uNAtRYrz9ZogYJurz7z1EY11bapUhL//V5s=;
        b=F07FJXfEnoLN6GNRS9B+XfQEWiLPHCdOOh7DsH9CEalClA0I6MHMcGiRSw4lWY6NP+
         iPNX0Hz5NnoDYmTrUGG8Stm6B1HQ+pcK5or2Ocbzu1WwnF64u7wCd9nek+AEFgrRWj2U
         ysaD2afVgxuEmYpsRU+4m1TS1c9OoVwr7ObIWS9F/mSD3dMXI9y/K1LbHh0asnBAv8Qo
         cNgUcO0PHoZje9sdMtzEaqtcoLejPG8/7q59KrJ4ahDM/Sjoj39l4KE2cN+vQwBgGwM2
         SCObiEpnRUzC5CG65paSe8+eMUSBdQWswqygrXGHjBbAFbe9oHBQN8+OZSzxUfnFOWF+
         ASpg==
X-Forwarded-Encrypted: i=1; AHgh+RrKpNT9Ut/TIgCHMhaCAN/bc1ZxRHUv3qIbhnA/Fw3SSLGNn3YkcoDNwlXB+kQj9h9dkerTRmizOowCZw==@vger.kernel.org
X-Gm-Message-State: AFuF++mAm3u8aaJCI/SIvRuks7OAW3dP5dg44DVSEmghCnyPQ5R3BxHq
	+uuJdMv8PiVL21uviSI7gos96tfuMX7htbijpw10WM45OK+QfQyTlARU
X-Gm-Gg: AR+sD136+CHzugxW0PYYjhLb20YgoZlbdeXD/4ly4+TGJtYT2UO88sd8YznjzmReqoV
	AxnHvgAjUJ8Cp4ScHGHK58zlr0h7m2a3ymSs3udrb9tN1v1HVncBr9CaspqRs2ikNt+9ue9Iuiv
	vwLCnCZBAjNcqsCuoG+UI7ROQ5ALxfKHS+CGX9SPZZsKeFK/Y2VV38OhL34munch/4sFWh+PJsM
	sD4KoERvNP9k/CYRqytk/vsHSP8r34trfacM85K9PQUCl33qZXFlWaopZJaS3rDReVLwp0z4YpS
	rIPn/BXpObdzC0Fy+QJ6LDWc2X6lg4imOnIBtx7loWoK3WI167brMKyE4uYvr1tXs6p0uDQltkN
	A/bbC8SNUJVjEVGOONK/I4e8u8gk811cfHEKu4b6/6LdrZvvn35N9eT18f56N9JKdKksjBPDLZn
	9mDeHNMYBgzUbOHol2ugF8rVj0C6EPfOHtC8lh9crMd4apwnopxRAeWPKaFrRVU73IiWqMOh9WB
	TlCyVELg0ihL7P6VPAU/l+UIbpLU1DgqXKYWSGvbh3kvEgFYuYxfYBUmknRNzedpL6IUPHOkzWj
	ergcig==
X-Received: by 2002:a05:6a00:328a:b0:851:b03a:fcb with SMTP id d2e1a72fcca58-851fa018184mr11023615b3a.14.1787315393221;
        Fri, 21 Aug 2026 05:29:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3389fc4sm2848582b3a.14.2026.08.21.05.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:29:52 -0700 (PDT)
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
Subject: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
Date: Fri, 21 Aug 2026 19:29:26 +0700
Message-ID: <20260821122928.41343-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821122928.41343-1-phucduc.bui@gmail.com>
References: <20260821122928.41343-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Currently, the mt8183_apll*_enable() functions call mux_setting(afe, true)
but do not check its return value to handle failures.

In addition, the cleanup paths of mt8183_apll*_enable() do not call
mux_setting(afe, false) when the enable operation fails, while the
mt8183_apll*_disable() functions do.

Add error handling for apll*_mux_setting() and call mux_setting(afe, false)
in the cleanup paths when mt8183_apll*_enable() fails.

Fixes: a94aec035a12 ("ASoC: mediatek: mt8183: add platform driver")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 6ab0734ad136..0790d8123179 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -382,7 +382,9 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		goto ERR_APLL1_MUX_SETTING;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -411,6 +413,8 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL1_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 ERR_CLK_APLL22M:
+	apll1_mux_setting(afe, false);
+ERR_APLL1_MUX_SETTING:
 	return ret;
 }
 
@@ -436,7 +440,9 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		goto ERR_APLL2_MUX_SETTING;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -465,6 +471,8 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL2_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 ERR_CLK_APLL24M:
+	apll2_mux_setting(afe, false);
+ERR_APLL2_MUX_SETTING:
 	return ret;
 }
 
-- 
2.43.0

