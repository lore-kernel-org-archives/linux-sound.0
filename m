Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F28371072
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 05:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787893565; cv=none; b=lZ5tzjdJOdmw303iEpI4VVlM+N3Bccm5Ur7P/dd/BS2KojNJ16M+ohZeDLOJph3cAj8agmO8QSPi1nJ3vUiMJcD60sAQIV5y4q48NxYckbgHj2lxquf5FZTj30/YivKrkHIIKJ2qlrkYVvZJ2uTnPxbhsaZbWdIAVxB95/VNLZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787893565; c=relaxed/simple;
	bh=Y/jz3BDQzxg+BSmZzlkipWm7+jQ4A9dc01+HMYYhNmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GunzxfJ2s7zDgu//BZ0uCih5RiABwYPNDV1FkUlqdC4Qn9gqLgj1eXTggK6umu+SV1iKN7e09RuIFKvjWrOoypaXYWPBTtGdG5IbbbDN6eNVJRhCKtHVWf0xAZauQr9kUxDt4SrqcqeT61OAgsYCXdFERdBRokV/8j0ursnrKKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsT1gK9E; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsT1gK9E"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38e041ea211so751441a91.0
        for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 22:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893563; x=1788498363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K2ayKEtWylWEqAbqXks4/0qXdOEmw8tXU6KwY1JgJjU=;
        b=hsT1gK9EbQiaIMzCi5+SgtROr1ZgQB9uuh9sEggK+9hAlbpPyk2U5Cs6znvnQM6FDC
         L4GIqznaEWVNSR1mk5+htvdR12ehJhivD2GEOaV4R4IqxLiQMI8oKSp7hZt1ERDzMAao
         uOiVwG2fO2YiJX82gze8PEXLgduSI/a1lbU8sffoTIn9SN+obdtp7f0MHDFbdExXaBSp
         LQ/MiuTDru1Z+21d0KQcI5LR9ViKGRLHIffN6j4byk8kxknEF8jKnlN0FM3ofjbILH2H
         jYamozF2SuFgw1fAh2Ek3AyUhcMk5cSS+rj3qhbLrAlDigqRM0sZkWYgHt/3QKHqZeBy
         fwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893563; x=1788498363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K2ayKEtWylWEqAbqXks4/0qXdOEmw8tXU6KwY1JgJjU=;
        b=Vgeshx7Zcit+4Zz8DGMZUWDGJ26wmAC0N9+X3JvpbC1Lew5HfL4CyN+Y5DOKw0i+hI
         LosVyNPfdpRJXsZQzGa0j1VnpzQiuJrzQmHqhSkeXxhZdMk5+64QKyUI8FYFyRpx94GU
         +e5ioziDFv/t8OpIXdoIJRWTpfuFuVH8m+5Z39XvYV5VWET7JDVumARw6tk6vjTIDapH
         tJfihIB/Zykc7Sp60zEmtz26c6uHRKo5abf7Z8g1EckeNjfg+BdV28mLaHeFxFCHl3IX
         SjA6g1IeLrp9rLy48aRhH/DN0an3LpigF1qeNIp1Cv0aIjCp9CFm4ZoOq3GZ2dC0eklf
         t9uA==
X-Forwarded-Encrypted: i=1; AHgh+Ro9GXy5vriT8FA9nuFB5DaeyRu60KY+pEDgUTPcxK8imctASDxmF0kHbWLchzbfXhW46I6uv+Ab6/swAw==@vger.kernel.org
X-Gm-Message-State: AFuF++mVGt0Rt0ZzAxYu9V55WKo3hBo8vodB1HB2GOhBWZar5l5EQ7aF
	jfOeVYakBLM/ZnvmhGZuAIIBM/qi1PMAEdj2r62aboHRoPZYQDP+7rIU
X-Gm-Gg: AR+sD10raS8iPh63RE0glU/6kFaZndghKBVM5X/OGtm3NZkUisTbZRRI80SGps1iQaa
	Q1PqBjwLudBYJoRZUDwaJIsO7HHs2M52z2NeZviW0NfGoA66iG2eTEHtpvqg/WhJGeRFNkTt3XC
	ql9lKY9rHheOvp6fBv1iB3XQFHOza0pvp1HfqIxmawy7fpjiT81HhkBAvyACF61Dg8MgTxw9nk4
	pyzCkPGUM2RnnVDRRJStuT3tMLAStg0r+Ig4FbXmyVJ/70PFwFJXZ5Q0mUrM7IfqK0KfUD7fcPP
	RT3qzdwgTMDlfB/7PTNpIphsD2eWBzUj4iifzV2qIH/eUgLksFNdIspe2ODDxMDOPZYZ9YGhAUK
	ju5uQrQBNHAoKSMZRVIVaMNRqy36uVzJZsB7zsHtmJIXHgdyNfou7fhraR9ymzzR6veCd6QIwoa
	v61PwttpKqoIEISh7wgY8h/y/YgxDYJMWBs8k31Ly4YTbAJuWh6BkddnkHE1xIFgRdXtBBRcG2C
	/kE+fYdqL1QbdNwGckhb33nFADyfoEGY7mywNhXcyN1iYDcvhRA+bCck5Dike4NpsjzoTiBqSte
	7U1GWKnuWRoEKpM=
X-Received: by 2002:a17:90a:d2c6:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-396d0f6cb36mr8700122a91.11.1787893563290;
        Thu, 27 Aug 2026 22:06:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:06:03 -0700 (PDT)
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
Subject: [PATCH v3 3/5] ASoC: mediatek: mt8183: Fix APLL enable error handling
Date: Fri, 28 Aug 2026 12:05:24 +0700
Message-ID: <20260828050526.590761-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
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

Changes in v3:
 - Return directly from apllx_mux_setting() instead of using a goto label, 
   as suggested by Cezary.

 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 2dbe0b7f8bad..43d5898357dd 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -384,7 +384,9 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -413,6 +415,8 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL1_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 ERR_CLK_APLL22M:
+	apll1_mux_setting(afe, false);
+
 	return ret;
 }
 
@@ -438,7 +442,9 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -467,6 +473,8 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL2_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 ERR_CLK_APLL24M:
+	apll2_mux_setting(afe, false);
+
 	return ret;
 }
 
-- 
2.43.0

