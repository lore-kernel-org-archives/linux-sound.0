Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1961D3A875D
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 05:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784092306; cv=none; b=KaGupl7MdQVY6Wx2gCtUxgEwn5Q831kL0vhMbu36/8nOC7jhzIyqtPFEUAdeYespu6wmScenFtLmwfrnsUQ6UGPDE4pHAV4NfK3Ua6ZzE80/bpnF/aitQwj/SzUREDnVse0aVMu+4Taool8nTSW43f5bfmIF0z2NGN47psWrrz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784092306; c=relaxed/simple;
	bh=E4mIJW9wHkQ6Yon8lE8Da90aQYJtHYfqur+wNVf38QU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mzhnjmD3wZ8q3ZjNRjj3p0UNjkTQhuhoP8/oZnTgU+KHCisyPn7dT0XOIRAO8giliHuvGoNZ6uUUPVVU7YK0aFsga5gLOtIZ+hUnUoqj/tv+iI3ku1oQOCvxYoK7lWA8L+yZiw+Cs/V5EgkoO7YLEFh0fT9NUXBbFRGB4s0IkDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lf2YESXF; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lf2YESXF"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8484f229529so1233709b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 22:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784092304; x=1784697104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZlbqqQzyBbuATWOdD8i4hZIk03ddaqsUqXtC2EEDeJc=;
        b=Lf2YESXF7esQno3dU0FW+REqpYcao6S7YAL4Mj+R6Z5KdORTXqZobgsdKJxthqAS07
         ECE3KuntPD0PwasiUn3To0IAtKQ66X0g3ITBeZjJGh7X3CGDlM6FjD+DWl3fjmXYIMr1
         7/i1NuR2Q5ghBIAdtvhk3io6Tm/OD6Yfu0eQFwTvrhdDSeOUyzE1dKQirokrB+eKD9iZ
         sSeDZ0eA04OIs5LOkztVFmvOt9cSS2PUlkzZqca+CrsbtZJKNB9SrkoKzJXQ3i/jFe0O
         wDVlneNvci/yE+5z7NqZfwfwwSvopAE0s+RyautpoHu+gBFZ1qkvAmxR4zXvUa/BWSWd
         rxog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092304; x=1784697104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZlbqqQzyBbuATWOdD8i4hZIk03ddaqsUqXtC2EEDeJc=;
        b=jedE1reT8vISNx9X5s5kyrgfz7BmhyO9/xOzalu9svI8g0MP5TzfM2/s4967U/cF83
         pAE3xveHMD1iujgDKhT8XCQ+XMowep5cxP5o0fT1/pNCWfCY8T1uloN14hjFo+mjKnBM
         5Gu3tbsHHHWuL1pNd6GKl6Sm3Ho9nCCpM50NkjxbnCi+oJAv1IldrKygAd4X04AnQTJG
         ZPAueTB4PtozgaYrE5USdoJ8o6p0lpouTMITnP2m8szrJkfOVowCbxqfdYy30k4oqqL1
         sN1+aaZyw/Nl9DoJVdB8Woe2qe99Xt+GDaFZDJA/ELvyzRIsQLRT6GqHWYRolqyxGTtj
         vKpg==
X-Forwarded-Encrypted: i=1; AHgh+RrpqV02lZMsr0EYSvHPpgK6ipfaC4+sjUnWd550aSSavX340H5bvbXAd9eB9+z+k6QzWyYKoc5blmtyXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbLzdasmugR9sgCNyQ9gJku7WL2yniPNq0/kErCjQh7u6uM/kt
	gvlAsoRImbzJ0IMlDvhN5OI69GTTI97HP6SpGBgY7Q4LyteH5jGGNCk+
X-Gm-Gg: AfdE7cltGIg9m3vBJ5McB5vuwo2589hHEl1GK8Xk5cSdooDqKIqK6u6bH8sCJDUGDuI
	rdsHGyTUONxyRia/IldceIZv7Hv/WSdkrzGYcRK2p9BBVjC5DDssmygp+MVRWrQKqtW/izOG1Jh
	TzM9/bDWlb7vi0pYYwnp5A4kf5GbzhE4Q863qCoNb1z409GxVGiAjcXUm9OkY29kxybkwt82FMY
	KoPLTyGbjZBxic3aPqkoNJFwJLRB3xl/hAMLrTHL8GinF7uqG548+Y0M3FBtqQMGUFTuwWs3JD5
	tsjpt6nRm7p5ElyPIPJ/3N+r1RheFtQUirc0d5Jmnx92Ot36GM9ncay2kqDB3FFlKaYlxRDLCvh
	j9nwimS0cCFr8EoFeDSfatxYG2wr8/m8+FXrl9mluNC/fjl0n2OD88zeVcXuE+tfA/Zg6lGZA5k
	yQc+Z3t8jIW2X3uXdCiScV3+BIijf4ZLTNMhhlXR8cOdMW5j4=
X-Received: by 2002:aa7:9066:0:b0:848:6537:580b with SMTP id d2e1a72fcca58-84889803483mr13965120b3a.51.1784092304373;
        Tue, 14 Jul 2026 22:11:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f271ddbsm2594093b3a.18.2026.07.14.22.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:11:43 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Sheetal <sheetal@nvidia.com>,
	u.kleine-koenig@baylibre.com,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rosen Penev <rosenp@gmail.com>,
	Piyush Patle <piyushpatle228@gmail.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/4] ASoC: tegra: tegra20_das: Use dev_err_probe() for error handling
Date: Wed, 15 Jul 2026 12:11:12 +0700
Message-ID: <20260715051115.17385-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715051115.17385-1-phucduc.bui@gmail.com>
References: <20260715051115.17385-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the existing dev_err() and PTR_ERR() sequence with
dev_err_probe(), preserving the original error code while simplifying
the error handling.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/tegra/tegra20_das.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra20_das.c b/sound/soc/tegra/tegra20_das.c
index b48cc4a6967b..ea8bc9bcfa67 100644
--- a/sound/soc/tegra/tegra20_das.c
+++ b/sound/soc/tegra/tegra20_das.c
@@ -167,10 +167,9 @@ static int tegra20_das_probe(struct platform_device *pdev)
 
 	das->regmap = devm_regmap_init_mmio(&pdev->dev, regs,
 					    &tegra20_das_regmap_config);
-	if (IS_ERR(das->regmap)) {
-		dev_err(&pdev->dev, "regmap init failed\n");
-		return PTR_ERR(das->regmap);
-	}
+	if (IS_ERR(das->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(das->regmap),
+				     "regmap init failed\n");
 
 	tegra20_das_connect_dap_to_dac(das, TEGRA20_DAS_DAP_ID_1,
 				       TEGRA20_DAS_DAP_SEL_DAC1);
-- 
2.43.0

