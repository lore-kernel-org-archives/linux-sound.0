Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614793F6C2D
	for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 11:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783681567; cv=none; b=XECLOk+uTJ6JDJTxVBlHbu741nAPHblJqaCZwcKBS4nCAFHlhTFGWwSs8cNFR4csUF4LpU8HM8kG3BSiPNyABNg6YzPisi4ThqdqdJOOptMp2hzpb308Othuv4T4KFlEuRMX6u447wDRTjvqubAL9ct3ZYjQ1kJ8ZYTJvt3pB6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783681567; c=relaxed/simple;
	bh=P2l3uI8Ag9Hn8VEmZ1nCu3l91PW7O2Yc1kwvwy44Ew4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MwyKiByPZUgebx7rQ1wFtsJ6W+dOnnQan1JBK1yumwXA+ooAF+1fdq9Cd0o/y5yt3Hxkg+gEiJ3/mySxunTYu7JtGVr7GH8SVmPPEbqOH96qbn/WHLA1lqcpIkdUVK0/6yRnsH5EFwsb4EYa/8tvMwa8Ogg5EYEdE5xCG3xTWyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISrTsNtu; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISrTsNtu"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca913a601fbso581793a12.3
        for <linux-sound@vger.kernel.org>; Fri, 10 Jul 2026 04:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783681566; x=1784286366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bxEC8S+4wPaf6YNA7I4YHpQhkjSKPcljYjeafE5m3P0=;
        b=ISrTsNtuQyRF0mGDMi1Kbt7p40PEgz0L+hvwde5gF0vf4rWyTxhhNBmhOIJ6MX9clQ
         wnj8ZRo5g14H7VU4Yv+eZ3u/hgKuzXPypAEi3OzhVVb7DXbHaYbzUXFnnMBVAmd/Ou8o
         cpJMkQ0Cf/kSt8C85HzwTGgLKWNdtbXuoD6aOCvBlgZlokVEMFR0i6pox2kwhEgzz5Pv
         fQ+Eb5FOhSM8Vf1UZJJZiCHr+3D7lMylfuwlkui6gHoz5KPDu8vJmvDR+m5JqG6mftrl
         2DTkfNq7VoQawfmA1bNGDPLUsx4AR0Q7xMsyppiZDYesXhyWqQIljn6nXy/VZY3bpWmo
         fhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783681566; x=1784286366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bxEC8S+4wPaf6YNA7I4YHpQhkjSKPcljYjeafE5m3P0=;
        b=BrW6RsMppddhsYifVHg53J/XXHAomsA5kqYNpOg3n1e4c52vK3BuVkFjakwdJArB7j
         oQXotY7vzvnuCVD8P2+UhtRE6iLf2uMcjCpiljZv3vQlJmCkfsdA/iJ3rF4FMcy+plku
         Bf1kR2nYdc93Iuvb5qs7DkHuVVPNExJaFKgnEkQiXgixi3UwOqCTK2BawGLk3p/Z/n80
         CfMLg5bSSH9tHQY9b/TZmEbDbV48qkLAZ6PVDMK16VCeuDC8naa9ctJUMdSaDStAb+ID
         Jrb2N1xy274EKRSGPnrfFz0C8UX+JD02wk7vTUP4orbWHtXPakvvHk8B4jxZKexqCezS
         eOFg==
X-Forwarded-Encrypted: i=1; AHgh+RoDWnalHqw6zFXpW1aJOinNd3+KlyQ851Hh1z6G83vbbx51d+h3GXCEl0M18QtETsgF03LERrDaNp6Fgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzAhrKKah1DZSxv5AFtnprAOLrgkv9xgblXMDV2D4zwaYx4ddBz
	gyjQMBGX1QUqJje5R6KZtPSISI26GhUkIfOpme4GDGaQTy10yuLnsPH0
X-Gm-Gg: AfdE7cm69n597+ZZ3TYtHNYDrJWwpURteYZ+C06LczD5RB/uBT442yEMycy8W6PJdhk
	oySC+XthKb6twqFmt48zfEdioZDworMoFfWq9hRGg0dNxBy6iX2mYinLuEb+Yhf6/ZQ1UlB1RaR
	NroAzuaFaPwrX4KfOlGW3oXYJL4/XLe1+LHOKaSwrjJ4Ic0WZgFspZxFVen622d56kjZdQA9Zcl
	G5bRQiCVSCFIrHZYW4Y7DqIAn1fL+ANzeiy45x+cH87nFS95ZJzHIqr8uLtYaXJ7g6AX3/0jQwy
	9DBdIYhBeqcgw8oAgEzCDncxszmqc6XGAxbug9ZIUVPQ0C9ExsW7MVOlwGKsIfrwg/qRTaxY7Dy
	hILqPNvUgmttBqlPKiEgOixUbWIDrc/BL9y9/41zUid5eZgIsdl1YJ+hzTYja8mPlvajPaCKVrD
	utgpk5yAc9ZasqxIuPI8smyf3vMo+c/ExHSJehYFoNx40M48aFojcbgC+P2w==
X-Received: by 2002:a05:6a20:d493:b0:3bf:7110:9949 with SMTP id adf61e73a8af0-3c0bcbe9106mr13761714637.6.1783681565625;
        Fri, 10 Jul 2026 04:06:05 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5afeb060bsm4960310a12.14.2026.07.10.04.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 04:06:05 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] ASoC: uniphier: Drop redundant error messages in probe
Date: Fri, 10 Jul 2026 18:02:49 +0700
Message-ID: <20260710110249.31830-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return the error directly when the helper already reports the failure,
avoiding duplicate log messages.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/uniphier/aio-cpu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/uniphier/aio-cpu.c b/sound/soc/uniphier/aio-cpu.c
index d3dba21b2d04..78c82bf42a8f 100644
--- a/sound/soc/uniphier/aio-cpu.c
+++ b/sound/soc/uniphier/aio-cpu.c
@@ -795,16 +795,12 @@ int uniphier_aio_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(dev, &uniphier_aio_component,
 					      chip->chip_spec->dais,
 					      chip->chip_spec->num_dais);
-	if (ret) {
-		dev_err(dev, "Register component failed.\n");
+	if (ret)
 		goto err_out_reset;
-	}
 
 	ret = uniphier_aiodma_soc_register_platform(pdev);
-	if (ret) {
-		dev_err(dev, "Register platform failed.\n");
+	if (ret)
 		goto err_out_reset;
-	}
 
 	return 0;
 
-- 
2.43.0

