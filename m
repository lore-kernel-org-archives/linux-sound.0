Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A385747DD78
	for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 12:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787315468; cv=none; b=NsKWwdGisZJ1FV9Xk6Iimu9sySmBkOgOXJSlYN+kIZtF1L39I91vRcAFTfX9gJxQYw3i5o49r+WL0jC+GAbGcjehNpkBDIiQjigN++7P3pFxh3Gc51qrx6D5zyIKhYlH5lxgFoSgu8/HRdRzyJ3JzSBK3ezPJxvSSfAk/txh0xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787315468; c=relaxed/simple;
	bh=t72dr0cwfbwJ9VAdoQJMcgZwLqXIztHpdw9rz+BPXpY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wir18+PHnTdn7anqyZ5r2aY7VJ1/NAosa2emyYgiCCO+MtZlXINqNEU23dKCoaXvrPwfFnHeqdwYAnB6c8gaWBx59xw7nQH1P8371D0WNr1g2Il6Vv4O640gPNQ5udqbHIyAHSuK950NSwAXtz1oBKPU8ZYi8KiY+nWkDbw6AvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Od1juvEf; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Od1juvEf"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso10225795ad.1
        for <linux-sound@vger.kernel.org>; Fri, 21 Aug 2026 05:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315466; x=1787920266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gGl1wn1tthVVpzXm7BgSd3YBH4Pka/KCiti4HDh7cGM=;
        b=Od1juvEfwmEtI4cZUzUrnK6l+YbuUO23CvQMS1JG6PBz1e7gyRaLMe4wHYSqC1h5gb
         VYyxf7R2gYuFdbrl7d8DBdz5vyEZbMz/RRPi5itjJJOFZ0YAK3GbBbDeVy0uPdXH+uv6
         P5e7XHF9fV8oxs3lhkr0+OysB9mX2xAvr0vIIg2lmePdubpiSTF7D8D0GBYpGcgJm2SI
         MA6ZjbSdnpWP8lmSWT7nvWMgEusFfA6W5be4qL8Ha7K2J4YTjCsMoy+v2y2Vyv6pUNuM
         OdJeo2VaJGE1o4uEcGF30FVlghnaOZWhGbgf5xMdvTOIp8Hqo8mwAZWz5TG+TUh6cBOU
         EUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315466; x=1787920266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gGl1wn1tthVVpzXm7BgSd3YBH4Pka/KCiti4HDh7cGM=;
        b=KiAcM9AeVbfALhNeMbBhPpjButxrDILV2aVxP+DDVUbb2E8kDf0VVVEa1Utr2nI/wd
         e4oyL08SFXNZePWsj438hB8e2D3PoIOgQH0z/XBqNB4pIFrR417m2FENlVsYbWpqeNx4
         VYlAbui7vedGP/9xfWNwpxuXLbtiHzlR9T9tCYMCI4b9cScQfavLdK0eNkOKb0w+h3sk
         CwoFP+VdE34W85RZ6xwdUumLKdvrE7uc1B4CI6PAv2dCY561mmBwpLbWnZSE2N6l1bWr
         augTLap8qgj+DTqd/Zg6s+HSjZ36OyyLav8XQnJD8nTLb2KMejlIw5UNrHpmSn9OOHaR
         d/Fw==
X-Forwarded-Encrypted: i=1; AHgh+RpHfops4mv3n7fHROg6ncD3ILdNcNU69o2+e+gsRbqLanDIjXvnAckUt3JfwDQrN9WWvPGGMG78j5oREg==@vger.kernel.org
X-Gm-Message-State: AFuF++n0BtKldVggXlJcBiBqN9CHYuKdj6CNGroLT9bSueDd4h7E4wwr
	TAc/qx9ffJ5UCuEJAxUrryuUfvFGiSiZ9IP/8mNeKW+NdaXA6ppk0I1J
X-Gm-Gg: AR+sD13r3sWwqvKHKGAywr1cOYYq3ugUmZcWai+9ekqWGeF1TcENDhgwfk4FxKIvKeo
	0dadgAA+AhhPMMEdZgB6aduau42Gj6RjJX+/Be0C+izMNjUmqEzNgwwvctPU2f+eitpI0hyWI1O
	uwAsVpKg0UluLcHzWn82y/hpLGxM+scelbdvryszrz1REwlpbEJhysW6R4zw4Y8j6lmADSX2hjs
	UON+XV44u6QUt4ish6qXaOML6E/BeX6PalxNlk8D0b8jNzZX9tcoelXVSpZP2Z0GI3VMDX5dqgY
	XCpVyTA4vDOvAv0QmniEfhzDPY8I+hOE9a0LnczMttlJye6gnZ0++lGHMG+gNiquUfX7QmH+yJB
	siou8r+xWHM86DQ+AGwzEQl1tZpGdj1kIGAfFdlazpQSEeKsxav3hgXBB0jg4Z48QCXVZsHyO4K
	BCXTdx7HAFV+Kn5oEa0S99FKKSC+gUTX5p9kQ2z2DYaE9MGNcUNRImqGluVTh8LnG2qSf6D2Q5n
	Wq4ZYQvDF8p0ODQinNeXlCDFSseF/iPh3hPNpe/VOTBoH0GALZRwbPmCKg0fPNssPGI7R/Aa9gW
	zVZg
X-Received: by 2002:a17:903:3546:b0:2c7:f2c6:89e0 with SMTP id d9443c01a7336-2d64adf3b42mr124052375ad.4.1787315450332;
        Fri, 21 Aug 2026 05:30:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62e36e1besm18302235ad.53.2026.08.21.05.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:30:50 -0700 (PDT)
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
Subject: [PATCH v2 3/4] ASoC: mediatek: mt8186: Fix APLL enable error handling
Date: Fri, 21 Aug 2026 19:30:20 +0700
Message-ID: <20260821123021.41390-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821123021.41390-1-phucduc.bui@gmail.com>
References: <20260821123021.41390-1-phucduc.bui@gmail.com>
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
 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
index 94bcaf92e396..d6b0174e2655 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-clk.c
@@ -359,7 +359,9 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll1_mux_setting(afe, true);
+	ret = apll1_mux_setting(afe, true);
+	if (ret)
+		goto err_apll1_mux_setting;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL22M]);
 	if (ret) {
@@ -384,9 +386,10 @@ int mt8186_apll1_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll1_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
 err_clk_apll22m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL22M]);
+	apll1_mux_setting(afe, false);
+err_apll1_mux_setting:
 
 	return ret;
 }
@@ -412,7 +415,9 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	int ret;
 
 	/* setting for APLL */
-	apll2_mux_setting(afe, true);
+	ret = apll2_mux_setting(afe, true);
+	if (ret)
+		goto err_apll2_mux_setting;
 
 	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL24M]);
 	if (ret) {
@@ -437,9 +442,10 @@ int mt8186_apll2_enable(struct mtk_base_afe *afe)
 	return 0;
 
 err_clk_apll2_tuner:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
 err_clk_apll24m:
-	clk_disable_unprepare(afe_priv->clk[CLK_APLL24M]);
+	apll2_mux_setting(afe, false);
+err_apll2_mux_setting:
 
 	return ret;
 }
-- 
2.43.0

