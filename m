Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8F53D564B
	for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 10:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787134749; cv=none; b=Znt+USX/2Bnebl4cz0SVRVy/1+G/LQSK2t3lN5iJqMGUw/XbADg+cP5wIesXjgXprGW7HcG1TTuVGE+urilVIRF96I1gwsPmRVZN72yP+MRuKIRVT2089cny3+f9B4mkm+jVgMjoir+29rjkBBjoeDcsc6zsAAEX90EZYTYrixU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787134749; c=relaxed/simple;
	bh=38a4v99US+t86JR6CIAMcsPAF66ohTi7Rvi/M5i7M74=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dGnk9WZ3f4FDet51Q7C9Q+ypunivwRBvm/K0XvBpdd4kh+b+dRu9qFUd29rWtSJ2vDnAvCvpHxMdma+xB4pyARdc4YzmuMSJw2lnCWvxookvXKsj7OsHmS7/YkPTEwkq87xP+8B6oEv+4cfBOVbrWqoFeYCPwZUqR9UEOA8TE9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IAjG4ZlF; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IAjG4ZlF"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-39266382df6so684300a91.3
        for <linux-sound@vger.kernel.org>; Wed, 19 Aug 2026 03:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134747; x=1787739547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IXqFLwJuyV+JjqMhVzWBsHgdtBjtcPrrFop7DOTcoKs=;
        b=IAjG4ZlFd3TzPsK/C1YjdASrOuof2QomIdLGXr5ba8eFRqxrKYk7/Cj814iibXMHPf
         fntBr50ai4kaCuqA8Wl6U6Hpskrmapz4geOuGlWTRZGQhlslq7JdL3YMiCiGUeuxa6NJ
         ZT+Q9wNXOltpmv8dWWTUJjczBZY1QH7l7RX308WtSd/ljh2DpJ+TzKwOkLBvB8pwX1G4
         B+1G0zyJ4/8/8/HPGOEh6zOOQc7h2JmdZUmQR2y+fgLVasWT7fn0sHrzj4W7CsJzSelF
         2gKDZpMmm+YhUOdaH73W1cYaUux6hg/6Gjao8SxFHdYKiAOpf52vKBY7kILGMQrngzTN
         5W4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134747; x=1787739547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IXqFLwJuyV+JjqMhVzWBsHgdtBjtcPrrFop7DOTcoKs=;
        b=j/oFn6bm4Q57RNRnlgAHvwXqjNb7g+F9EtEVbEb0H22Saq9IDW/17sm6XRrAKaqaf1
         lxEGlKjgNCiFtMhSUV5bHPEpzxkNhtiqqe6LLRwiTYHs8wE4XZRxRCnApxxKhpTN6UWr
         Co96ba3ZNG8At8LksnjyO61LOmFsjsX6W7XIkJL/wdP+d1LwtT/7C1u9aXF4LO7QAH8g
         xBlj+DkaoRS/EMAKznEDHyJ7onfJNq/G+KHcBSnJrIrchQH8Cz3GFyJSKUpyepcJmBM2
         My8ooCz5pneo8pYHYKJ2e162a2Tn8b6fsES+p/B3VEIBX+fB7tPwrSejRG5hvbXZYFbi
         q5UA==
X-Forwarded-Encrypted: i=1; AHgh+RoiotPXAF/oU6aOrh8JvDLvhTafUODuSw2ua/JsEYQQUeksqGgHS7CFZy8BT5HayDy5UsUnIkuTMCrmxA==@vger.kernel.org
X-Gm-Message-State: AFuF++nW6oDn7usfCLbmwmvQABMVBSaYV2c01vYrljdbWduLls18C9w5
	pusCKPYO0ntiKioWiDWTZiYRbesyYG1U/Zs+jxDv5BoJjKrc7vGlipfq
X-Gm-Gg: AR+sD13HmItUWH/yPN3aETCojc3SctHyXWDpA1T3pi+PDJ32wZ1EUSWZ4AMlZoKMLY3
	5b1BNSQ1WAAF86DiWcJaJDPhbtYuEUE1lAuQIXXlJcG+vI99AK9P+GA3eAMa5r1NbWk2Y+ECOjX
	XUvA0jc7VdXQQ0iQvUN9bexonJgmaGAsIXwG6pwdHnZfki1lXn/42jrZCYproLmFF6K5UXLuvPQ
	SqHO+5lOBLuWSIdeIcIMxlSnqNM+FKYmnN228P+CZbbsS65H7dYFX9dPEv4tPdlRpBKhDt0QMZx
	CmIjyuVtadra+mdOCdyZ4Am+ZOZZkrUt+ixqJjZ1jDc6LFAA7RV5L/INU8dzy3t3snDanYDkIoY
	O5H2BgmtQ3JGMqy8x+W6cJTY518T7sBjQvrg/7c1UE1ejDwmoSWaIc+5g3C9jxneCtXj7NjxSkx
	frC605VjI0loYAhv2ewMkJkWTrV611GpnAuLN7RZc2s5LZ0p+VC7HG5OgBVk7o+6YurMLyqHar+
	TcMDPje3B9ATT7qvfIYdoE/9Lr7gCSJuGZwKbi/OGt0PHnx8HgC9MppJ9WeTc/N6MxKk9+UmqkL
	YlGH
X-Received: by 2002:a17:90a:f94f:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39580840397mr7076830a91.2.1787134747355;
        Wed, 19 Aug 2026 03:19:07 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb14bbfsm2146392a91.1.2026.08.19.03.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:07 -0700 (PDT)
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
Subject: [PATCH 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
Date: Wed, 19 Aug 2026 17:18:47 +0700
Message-ID: <20260819101849.68010-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101849.68010-1-phucduc.bui@gmail.com>
References: <20260819101849.68010-1-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8183/mt8183-afe-clk.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
index 6ab0734ad136..260c27016cc0 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-clk.c
@@ -382,7 +382,12 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret) {
+		dev_err(afe->dev, "%s apll1_mux_setting fail %d\n",
+			__func__, ret);
+		goto ERR_APLL1_MUX_SETTING;
+	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -411,6 +416,8 @@ int mt8183_apll1_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL1_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 ERR_CLK_APLL22M:
+	apll1_mux_setting(afe, false);
+ERR_APLL1_MUX_SETTING:
 	return ret;
 }
 
@@ -436,7 +443,12 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret) {
+		dev_err(afe->dev, "%s apll2_mux_setting fail %d\n",
+			__func__, ret);
+		goto ERR_APLL2_MUX_SETTING;
+	}
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -465,6 +477,8 @@ int mt8183_apll2_enable(struct mtk_base_afe *afe)
 ERR_CLK_APLL2_TUNER:
 	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 ERR_CLK_APLL24M:
+	apll2_mux_setting(afe, false);
+ERR_APLL2_MUX_SETTING:
 	return ret;
 }
 
-- 
2.43.0

