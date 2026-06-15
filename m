Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC303D9680
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 09:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516438; cv=none; b=j5NiPMyTWvoqLkNyL2ywhO6OEsiRQN9qdqm5nbbzTQz0Mus3ZuNyQpDKFKekQcUdEqxWCDuyTRdL6NeQikng7lVkXdhLkLtnD36dEDRbrxbVErvzev6lCDt/4D0ya8Fix3UfybsVn7Hh2bxrHm46lWY8OZxEyRcyzyjy8nCpY9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516438; c=relaxed/simple;
	bh=8cF3HebG5op+ITs1XJRWMhmy9A1xc6/hcMM+4iQxiIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ihRwM8hH4J/eJ9gNdILh+neKlEgquIwYzAKY6XMPnEOOOxwVoPI45SLeLogu8zVjQI6tXNy1bv/SC84cAc1/nQhZBdfOvwNDPFPabvCTCTitx2SOvOcRVKylSNvaWwjE1JvDxrHvXqF2GV6nyDwGx/aWptEoZ1tNq5HtC5NQp10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GphXlP/A; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GphXlP/A"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-372b4330deeso1960194a91.0
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 02:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781516436; x=1782121236; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=;
        b=GphXlP/AbEZJvPUA+fGkJ7BJrk9ygOVTYaM+6pOK/Hl+L8eafcHjJmCOFn4hY9RLMQ
         zRUh9V1OGGGFtfrbNFNax3DQI5uZgJHpRVrB7EznMl68Ye9dTL22sTZKsCX97myvzHKX
         zYVPbssMu/c4sMIKzvHLp//4UefTMwUM4unuS9nxHQGW2S46+UFNUbS0knfzn4S/ew0D
         spKBcq7fdkXZZjaDIe93cm323yKVfiVIHJxcCEhbWaaRy4ICwcFJRAmck2CroA9U3OW5
         mLpARvc+3smzo+vSRr4S2Ijn2aWS3oPiHbbN44hyLNWBj6WbnOXmROX+7MXLz9d9Thsc
         YwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781516436; x=1782121236;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wpnchv9pa/fMvI5rIt88B4RF1cetJyaCH3vcYXn44rs=;
        b=m8ywj95OGqX25aCl+0RQrpX+EZNfa/NXlDB1q1/PJ6PA67eA6zIfQTIXT+qHVC12Cp
         TfXuSzk5gG4jkd62HUmrRKxBdokDnD5QxVe55lAwNCMecF3FZMte+Uln3NoHuxddOzwh
         pSYfTATbuLIBl8ZvuOuchk8A2eqou7sC7NGwXfi5zYTE74KQANz5z1bLyo8NZHCCVl3C
         P6Py9NqGHI/oNE1S3equ9ey9A1014ZQfqXfQO4jmKzDLynrTcb1LOqmTitBOoVlDP+OS
         5flNfIgJQndimE8jRIujmy4uqV/T8arqs67qySw9TSM0Id0TC9+WokmP+NSVwHEUIohx
         V1rw==
X-Forwarded-Encrypted: i=1; AFNElJ8LNrwQsIwQEbbFjOxIIRxZBRSe+WJIAP2mFsI6XWKzlTpvXcWUU/fkBeoohSp6lglsZbanmQh0k88sSA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3RCBckIh3u/rNziNKBaQgpCfd1Td8fwubVBoPJBB2bJX+IMZ+
	fzsHBB34ri7kHU5sBAd67gX1nbCvxsKjI6TuPDQHoiFrHI4FzhcaT5zI
X-Gm-Gg: Acq92OHLaawK/aTD/1lQ/mTeSpQGitz1ZoumGB7fZns4lb0kq3GglyuUmXA9U7jVURc
	oVgy5nqdhzc8hWgCadw+X6nJkHFTkkz7/tRutUSc1AOXjYaMRBmGpQ9Uz75HBmqH/p4Oe9FUWw1
	8K46sOsep/WLOzgLcClh+CmsidtWBLseU88l/YFgAS4NF6jkX/tDkqU3UUlWop/F4hFAQxEgkpm
	NBOAMplJLIxDdp+ksLprp9r/2OGleIkn25+oH/1EV8ieTJ2H84KiBMIaXSnJ2YG1Pcm0f3+y26Y
	Z2iJlpHeoCV5dDi8SWKjJSVeqEbGEcqdF68ToYlb3WEO6O9ZIKON5B/KocllZcqt2OIc7D0odaM
	Ntg8grKhtIqi34kWZZRGQ9sSX06WRJdkY5zHHpS4xtMh+AXmgk7uDlj6kJFQAITPbZM3AReisDY
	HoQm5/991kfVgXnIqdztEPQLd5WHFA2DgQaZLYekhNy0dGS1wHBZpF+BjRwg==
X-Received: by 2002:a17:90b:5623:b0:373:c536:6fc2 with SMTP id 98e67ed59e1d1-37c2bd5a9b0mr10221623a91.22.1781516435860;
        Mon, 15 Jun 2026 02:40:35 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8e9asm9936290a91.2.2026.06.15.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 02:40:34 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 06/11] ASoC: fsl_ssi: Use guard() for mutex locks
Date: Mon, 15 Jun 2026 16:38:19 +0700
Message-ID: <20260615093824.115751-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615093824.115751-1-phucduc.bui@gmail.com>
References: <20260615093824.115751-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_ssi.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index b2e1da1781ae..dc022976c982 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1218,13 +1218,13 @@ static void fsl_ssi_ac97_write(struct snd_ac97 *ac97, unsigned short reg,
 	if (reg > 0x7f)
 		return;
 
-	mutex_lock(&fsl_ac97_data->ac97_reg_lock);
+	guard(mutex)(&fsl_ac97_data->ac97_reg_lock);
 
 	ret = clk_prepare_enable(fsl_ac97_data->clk);
 	if (ret) {
 		pr_err("ac97 write clk_prepare_enable failed: %d\n",
 			ret);
-		goto ret_unlock;
+		return;
 	}
 
 	lreg = reg <<  12;
@@ -1238,9 +1238,6 @@ static void fsl_ssi_ac97_write(struct snd_ac97 *ac97, unsigned short reg,
 	udelay(100);
 
 	clk_disable_unprepare(fsl_ac97_data->clk);
-
-ret_unlock:
-	mutex_unlock(&fsl_ac97_data->ac97_reg_lock);
 }
 
 static unsigned short fsl_ssi_ac97_read(struct snd_ac97 *ac97,
@@ -1252,12 +1249,12 @@ static unsigned short fsl_ssi_ac97_read(struct snd_ac97 *ac97,
 	unsigned int lreg;
 	int ret;
 
-	mutex_lock(&fsl_ac97_data->ac97_reg_lock);
+	guard(mutex)(&fsl_ac97_data->ac97_reg_lock);
 
 	ret = clk_prepare_enable(fsl_ac97_data->clk);
 	if (ret) {
 		pr_err("ac97 read clk_prepare_enable failed: %d\n", ret);
-		goto ret_unlock;
+		return val;
 	}
 
 	lreg = (reg & 0x7f) <<  12;
@@ -1272,8 +1269,6 @@ static unsigned short fsl_ssi_ac97_read(struct snd_ac97 *ac97,
 
 	clk_disable_unprepare(fsl_ac97_data->clk);
 
-ret_unlock:
-	mutex_unlock(&fsl_ac97_data->ac97_reg_lock);
 	return val;
 }
 
-- 
2.43.0

