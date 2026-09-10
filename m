Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D403D9665
	for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 11:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789040639; cv=none; b=Q+TcfP16tpixNgryJGzhzV15hE1neqe48A0qxwEw9dbsDLI1xIypKexruevxaPnNGBqEKESlzuWAusw3Qg1AyJL5lo2xX6xRI0JLXWGMLdVFgSG6OwSX9uX1SW3J80op9f9b8Gx/CTA5nblDdhvT/ct3dIwp/Y7mhbY5A/Is0Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789040639; c=relaxed/simple;
	bh=KnIT+YZYEArHXwX2vj0T9E192bq+jRimOhkW4xiNX0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=U+2h8mGYZWlWv7skPxiHPJwJNHrv5uj19xmtppLRBevxJy1Z63zNWhRSMeT07uvNIx+UThyyNrbcK2SJCLN8TBO/2XxgZiymRsNWrS7q49Lq1fObUIP6Ky5Jw95y5MGcWZtWPyRTlNZsZw66aF8wibaKx31u+h5Yks4O5AvQ9DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7LjV214; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7LjV214"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d8f265cbe6so60003335ad.0
        for <linux-sound@vger.kernel.org>; Thu, 10 Sep 2026 04:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789040637; x=1789645437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAl4R63i7nP2kPOGdri8Gsnk69LVzRCygwjUC9I3Ijw=;
        b=Z7LjV214HmVfnMrNNvK7DZk69PNjSxJ9bt0wCL6YrMfSDNRQFi16MzB4Lbu8Nf4reh
         Ii7CYb4a8Wg5hC9BN2621LTIlwXPeoYqqRS7Ghwi7wSkDcxtixNciSVrIMcKhiCIOIvE
         v/8TwfrmflbGmYMI6CtSfm4mbfnmrWeJ0BE0Zi8doJciOxlRNUzEr6BHKo6RSmySRcOX
         u5l6BkTBC9xnMYKLJSOQKa/VIZ+BCBZ1LGvSjo9V+2YhtvaLYUg/cAM9fXeu6B67poNN
         6HFg8z6Vme2IuqxJwfd4ABm4BFK19RZwYzbgoQyrw5/I8b0BODmFHCgZswWruqICxHc4
         c2cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789040637; x=1789645437;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAl4R63i7nP2kPOGdri8Gsnk69LVzRCygwjUC9I3Ijw=;
        b=s6lN9DcspSZNgKhjT4SGW1IdsMoK2OZPLRA8IsVvE5WUjSAUmYhRNKqG9L49N2gYab
         y71NW2mgoAlVCWaiosPfNZmgji3apOzt1ap88Jala04EHZJb3cvW2iAmKAQ5SqBfdOeK
         uLsc7Jg0nhKCQ1ctrS/i05SD5lqJ9otxIlchPCZvA8lzIC978zUnqqCR5aDX02ZNSxsN
         tpWmOikbxVnjKRUmzNLgqx5zRpbroCvwg31l3OzgZKDUVrKm+q8a9qHiblnFPTdFiRJ9
         l8JeYlc7kbb0SJHPrYpbIDGJrXjlLcGbo2Hiki4yzIK8RyQn5Ll0xsYCHWh+1PR+qksG
         SD2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy2jLr6uV+slSGQwMaUBHUqzy1cW9K5o5bel9L/5w3bLxz8cpXHgMH5Wcp95HYmXzWgcJgB1LXPSHHQIg==@vger.kernel.org
X-Gm-Message-State: AFuF++lRGeqfQxaQdhTbZzmZqO3KfDu+wNZw7X1IbO9MOxM0VDPNPyVQ
	BbmYuO8M+sueF/TxEHbyUwOhVXIS/HF7CMWJBEUuAWAmxEc+heZKJMsv
X-Gm-Gg: AYBFou0V0C41aQ5+hIAKC3RIe/XCbx/E6NeRWorP6lYbCtX5Sfr3wuhVtBMaS7mrXGy
	09BlTMRrjlz+TtSWW77nPPyn9G09XzWRA6V76SFIdo4v0quIXwC+X3LgRJi6oKf0j1f28/n/g7H
	Y4Jnv1pBO4k+9Qirb8DAARzbJjkNrn4LEj+UWJlCd2j2KVy+1S9T/gGKSD5DZp58Eb3FqoAP2qU
	0GliD3uiPLpOPoukjaSRjIz756OhPCqVhf+G5V7ljh9s9JGki/l9AqdycEE9OxnxWA1jtwhztNu
	XypTqole/ZFcEx9akpajjSwDHxigGtGfQEz315f5raa1R0u3wp812p7jzbMnvT0onb8/JSVG6qP
	FpoNZOIAyQ6ij5FKt8HBNP9RHSfNRbbrWkXr0cs6dntHHxIEEaROBpW18gtI8y0gV8c4ye7HN/2
	BCWbrj+wg+QTMLyIQkldkMqm0hFqIXZxGrcrasMp0PZQDnU4/VatO87ed7L1bLTsgUCLBdsS3sV
	+RQeV8u1cI7Z49SoSJl3PwMSPgdVb4ofQj3PBAyAi0lY/QZHID3JVt1iGnvDVTBI5ZjORfkruQK
	bylL4MM+4PLDK1c=
X-Received: by 2002:a17:903:22c8:b0:2d7:5ebe:a588 with SMTP id d9443c01a7336-2db126d6e31mr572534875ad.13.1789040637106;
        Thu, 10 Sep 2026 04:43:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db14959fd2sm87427155ad.23.2026.09.10.04.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:43:56 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Darren Ye <darren.ye@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] ASoC: mediatek: common: Propagate control and DAPM errors
Date: Thu, 10 Sep 2026 18:43:37 +0700
Message-ID: <20260910114338.142682-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

mtk_afe_add_sub_dai_control() currently ignores errors from
ASoC control and DAPM setup functions.

Propagate these errors to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 .../mediatek/common/mtk-afe-platform-driver.c | 38 ++++++++++++-------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/sound/soc/mediatek/common/mtk-afe-platform-driver.c b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
index 477284e12396..c1869b38c9e7 100644
--- a/sound/soc/mediatek/common/mtk-afe-platform-driver.c
+++ b/sound/soc/mediatek/common/mtk-afe-platform-driver.c
@@ -51,29 +51,39 @@ int mtk_afe_add_sub_dai_control(struct snd_soc_component *component)
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 	struct mtk_base_afe_dai *dai;
+	int ret;
 
 	list_for_each_entry(dai, &afe->sub_dais, list) {
-		if (dai->controls)
-			snd_soc_add_component_controls(component,
-						       dai->controls,
-						       dai->num_controls);
+		if (dai->controls) {
+			ret = snd_soc_add_component_controls(component,
+							     dai->controls,
+							     dai->num_controls);
+			if (ret)
+				return ret;
+		}
 
-		if (dai->dapm_widgets)
-			snd_soc_dapm_new_controls(dapm,
-						  dai->dapm_widgets,
-						  dai->num_dapm_widgets);
+		if (dai->dapm_widgets) {
+			ret = snd_soc_dapm_new_controls(dapm,
+							dai->dapm_widgets,
+							dai->num_dapm_widgets);
+			if (ret)
+				return ret;
+		}
 	}
 	/* add routes after all widgets are added */
 	list_for_each_entry(dai, &afe->sub_dais, list) {
-		if (dai->dapm_routes)
-			snd_soc_dapm_add_routes(dapm,
-						dai->dapm_routes,
-						dai->num_dapm_routes);
+		if (dai->dapm_routes) {
+			ret = snd_soc_dapm_add_routes(dapm,
+						      dai->dapm_routes,
+						      dai->num_dapm_routes);
+			if (ret)
+				return ret;
+		}
 	}
 
-	snd_soc_dapm_new_widgets(component->card);
+	ret = snd_soc_dapm_new_widgets(component->card);
 
-	return 0;
+	return ret;
 
 }
 EXPORT_SYMBOL_GPL(mtk_afe_add_sub_dai_control);
-- 
2.43.0

