Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9E940EBA5
	for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 10:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198403; cv=none; b=q9RBokC9uPv8Bk/dON4bjzc9o4ixdsnf7dsfCCWGC0nU2i21dICd3dK9g/ETBf/eg1iZ44cSJhKXozfzBf3Slx8Wamwv7PzEBp4SUHJmMAKMlUgjzQ7ZnBg+RnW7LLg2a4IAIwG5ugl//dbwUmc/bJl0MIbhw6OWK1g8i92TDhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198403; c=relaxed/simple;
	bh=evBDQ8LUTdIbeMm3xfd3E5UnVCKuP9AXVeeKznBrDQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PL+F/YAMUnI/2Yn3C13DY2bPQV0z3lxbiVw+4b7qrbXiAV1jkqDdswHacoAGnjpULkJVq06p8s+dMFgGHYxvK32LGjVifoYYBxE+ojnoKMgEYSojn2976UVJsby39dD7TKluVNmZryw5TP0Zi+zspWDdKxu88fXShDagdvEG4uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iAmozNN2; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iAmozNN2"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84a652535dcso1228009b3a.3
        for <linux-sound@vger.kernel.org>; Thu, 16 Jul 2026 03:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784198401; x=1784803201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6457K6STfYP0yfng2102Li6Fjdx/uvYow/tpgSviBkc=;
        b=iAmozNN2p2+7+UwbFfByQOZ9TfAeySKrSWqtACGh2bdJC+ExlGJYq1ZRGHYJxm7emf
         50bZ/8JEjUmslLmvjhkmYy9ONP0vIkBf2OwKttiZO5UcDa7ncAZWM5xs4UyEcAEJNoqs
         E0leGx/4QIbQvAkw+EUIKIn1IL4U2eIGowhGOYHUVinDh8VzHHzF9iClJlMgmeRN++j3
         J3hLzQ7RAOx7DqAcPDx322HXv/Cm0Trg+g5ThbfKbxkVkpLKFD5afOdjXd6vptrq0esb
         2u7Pe7uK3D0zhi3fWTLetjC/uweq30NtF5DgO9q27+Th+Cs85OBcDHT8mDV2m4H5LVF9
         K8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784198401; x=1784803201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6457K6STfYP0yfng2102Li6Fjdx/uvYow/tpgSviBkc=;
        b=NALp7KyJiuaaPwiHI2k+nMTJJcxgRgoVfaHQn4+gaX6E/nwMekPLq7gsJbWti5rzrD
         IINtumiGnlrmoeDOBvSFnW0boV+t3D4vMml8OwHGOQ/dgQJRIs8Ra8RZVgznn9v5rMOQ
         j5eTZYRjxmUuqXRmxtQ8ZdG9zEidNhBIuSnt5stTt7XhQ4NJW/BI/ZAvWcq1Fx3CgPmv
         nYQ8NtyjOEylS4zWv8G/BOoUzAaqjgh82dHQ6cgCSnuMmeltYr/sTJKAnkMz5CB8+Yuy
         28BwQWIMRfqstSalGHddxCMrZ2YRFWqgDsNxBtcXRGkPvHSv3UiHwiyXsg+a643/cFvv
         yBhw==
X-Forwarded-Encrypted: i=1; AHgh+Rod1kmYTHtKOrhd+ijbDBOP7NSkah4aWJLVMlnjMcyfajxnqUEG8MRgA47VwRCnvGLb7OiOwixLATFWkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCRIOzC5XJEptN4AHJ4qg6cTF9hKczDjKTlg8rYFNeerKxaOrD
	Ubvtb/OkiGu+GSSVpV6kPBthgyShjyQzRDgVQPej2X3+KaON10+NUk7e
X-Gm-Gg: AfdE7ckl2qJWx6jQUiAwa/3AtjOzf5Xul0+DHJKwtt7UOntVb3eDYgZ+3ksJaRcYYQN
	1pJgKqrYjQftdCHar8lQNRf6zrA1kAjBHG4pLQw6OEHnnhmLJZSLk7xfwZUx/yci1MsHLbxzw3X
	qH2uAYPUMiozz92tijmD+C1ev3p7U6x+TgrDoDzUG4TW5PgPWXMV8w9R2UJMgq7jsRBOm+xb6pc
	0R9Glr7GDn5u59hT+soDOnB2mB4R4bfkz76Nji1dTBusQwhBCRzcqyNwUCU/QN0KqejucZkCD+u
	wIrAnOFLiXKJuM9p94EsIme8bVPQlMaKocyIH0qB/QuFd1f8bgJLN+WKEjKI2IPgnkY5V9q2YtE
	iofFj/HuSTtpcoLQQ2sKDnZfJ8vtB/fIaMqOx2EmO4hVYdTFZeWGtrtmg9O7lo+OG/V69BdUDbJ
	YzjOtfKMexiJf6AJD7shSI/kh4RItAthQ/F8sH
X-Received: by 2002:a05:6a00:1250:b0:848:59fd:2f4d with SMTP id d2e1a72fcca58-84a67390c1cmr5652750b3a.73.1784198401098;
        Thu, 16 Jul 2026 03:40:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f266724sm4757331b3a.15.2026.07.16.03.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:40:00 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 09/10] ASoC: ti: omap-twl4030: Use dev_err_probe() for error handling
Date: Thu, 16 Jul 2026 17:39:10 +0700
Message-ID: <20260716103911.77652-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716103911.77652-1-phucduc.bui@gmail.com>
References: <20260716103911.77652-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace dev_err() with dev_err_probe() when reporting
devm_snd_soc_register_card() failures. This suppresses
unnecessary log messages for deferred probe errors.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/ti/omap-twl4030.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/ti/omap-twl4030.c b/sound/soc/ti/omap-twl4030.c
index 2a80e44035d7..576f4d3615e8 100644
--- a/sound/soc/ti/omap-twl4030.c
+++ b/sound/soc/ti/omap-twl4030.c
@@ -306,11 +306,9 @@ static int omap_twl4030_probe(struct platform_device *pdev)
 
 	snd_soc_card_set_drvdata(card, priv);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
-	if (ret) {
-		dev_err(&pdev->dev, "devm_snd_soc_register_card() failed: %d\n",
-			ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "devm_snd_soc_register_card() failed\n");
 
 	return 0;
 }
-- 
2.43.0

