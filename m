Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC0ED2FE
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 01:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716945301; cv=none; b=jWsJ0TQuGqFVy9rmCLSk4qNs84vCJULBxGG55TPc/Wwd4MpBmQfFONhOgK/f+uyfFFqH64AstLBiGY6FsqFfSLdx7wnnTJ7kPk64vDTRb5GN7kNhAAsO6SvU8iZ5ak5Pj960ieJP704Kr6TsaiaQ3aaU/+G5I2zpDzuHcwjMgA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716945301; c=relaxed/simple;
	bh=ee2u0oiouae9mOBZxrxDH+Kp+aXP9/ibtSVGe+jjl3E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HcrJXFGxZencwTuvKu6sytPpdyJ1r0rJmnHrkXhSkt20Nexw83I3vRdMwlJR050/qaG0P7VZbUGCBOoXEZmvgfjkii3QTsHIiccT7OYIBpEMkCjlXC4MXFDfLjfH5/nCBGXjV4RKUU3dMnjdg4CENW60lXkI/1dNxKZVAZGsat8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OPegw93/; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPegw93/"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2bdf439c664so283123a91.3
        for <linux-sound@vger.kernel.org>; Tue, 28 May 2024 18:14:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716945299; x=1717550099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N4kmMP6gOzpVtv/P5RcqxhyYrbX+J5ShYaWHdV4ipo0=;
        b=OPegw93/v9TgMLt6F2Pvyii/fMpBB2mlO6NHUPFPHdgiE7pgGGas4yAgDQLcgzuS0N
         wZ5WLAduVSEaw8MZ02IR78yxu71AVjUm07muNH1X/vt+fiilkTW8oONyTbP2UTymWFq9
         hcX1pkUAY0908VhcNloA/2ht79at8kgPzC+URb1CbWe4T5cbwxKQKEDuB1OUPSL3MjqJ
         ZgE/9orpb39cceqkX8PtDUMiweJ+VX8FsRH73xVPnIJcgalv97KGD9OG1Fn88Ro2dttH
         wU2dGVDuYp8nz/YVcGlNDKEmjVb2FFtx1Ef9+IgWy7wjy62X/1XE+O64/8t34jgQZGo7
         N5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716945299; x=1717550099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N4kmMP6gOzpVtv/P5RcqxhyYrbX+J5ShYaWHdV4ipo0=;
        b=OHyhB0W6GYIhxPqLmrK2b2S9ZZ/M9VzGHwyL7il36qlAGdJxdi9bi5t7iUkAlSACfM
         gHadRdQjyeLsXjMhMw6YX1Z8AbgjtYOqOM8PQkq5SGBw3MmwTfw7BRiFdMwIJ4wPX80u
         j7ibpj+HovV1ZnnyCNc4Uc4RqLzhQiLdaZNsLAZNWsLm/OxS2Edm5GicuivSRIXDh348
         Zh0N/x9zN9htX+ClSDaY5FK7uiMFTFPs+S3Qo6nxMz9/bAn+AN8u2jbWwUvWDouuzht7
         IzHWtmSjzKJY5T1EfbZmBJEmgf486nV9QgocLucn2HGFzM5ReJQZ2aGAXGU7qS/r+Wcj
         cLDg==
X-Forwarded-Encrypted: i=1; AJvYcCWncmpP3secFW/DFi00qCWTRNEcp4JuBz/V+5THFrKCALQr5ABJtSz0JVOZMYn3jtO8DgDPUJiTS40nn6dk20Hadv2/c8p3/Fac8aI=
X-Gm-Message-State: AOJu0Yzuy1EsuLphqE69Tk0ofJQ/83h29WnobQxMrjcRxzd7nYlN978h
	Ybh8nWDGKdAYSNt6pAo4KT2D+nRAVXQ8fz110YtAdoNz4Z2YwG7x
X-Google-Smtp-Source: AGHT+IGmWqVFoTLEVGsdqrjtX6eof92T7u9+x1jvTKuE6tuMraJN/kcMeJvFRlsZU9KgJvSq9pPTFw==
X-Received: by 2002:a05:6a20:1585:b0:1ae:42c8:4f69 with SMTP id adf61e73a8af0-1b212b7cebamr17070128637.0.1716945299304;
        Tue, 28 May 2024 18:14:59 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:dfd9:2d9b:ff9d:4f57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fbd3ebdasm7029015b3a.44.2024.05.28.18.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 18:14:58 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Cc: shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 1/3] ASoC: fsl: fsl_aud2htx: Switch to RUNTIME_PM_OPS()
Date: Tue, 28 May 2024 22:14:43 -0300
Message-Id: <20240529011445.1436596-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS() with its modern alternative RUNTIME_PM_OPS().

The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
compiler to evaluate if the runtime suspend/resume() functions are used
at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions. 

Signed-off-by: Fabio Estevam <festevam@denx.de>
Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>
---
Changes since v1:
- Only colleted Shengjiu's Ack.

 sound/soc/fsl/fsl_aud2htx.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index ee2f6ad1f800..a6cbaa6364c7 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -261,7 +261,7 @@ static void fsl_aud2htx_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused fsl_aud2htx_runtime_suspend(struct device *dev)
+static int fsl_aud2htx_runtime_suspend(struct device *dev)
 {
 	struct fsl_aud2htx *aud2htx = dev_get_drvdata(dev);
 
@@ -271,7 +271,7 @@ static int __maybe_unused fsl_aud2htx_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused fsl_aud2htx_runtime_resume(struct device *dev)
+static int fsl_aud2htx_runtime_resume(struct device *dev)
 {
 	struct fsl_aud2htx *aud2htx = dev_get_drvdata(dev);
 	int ret;
@@ -288,9 +288,8 @@ static int __maybe_unused fsl_aud2htx_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops fsl_aud2htx_pm_ops = {
-	SET_RUNTIME_PM_OPS(fsl_aud2htx_runtime_suspend,
-			   fsl_aud2htx_runtime_resume,
-			   NULL)
+	RUNTIME_PM_OPS(fsl_aud2htx_runtime_suspend, fsl_aud2htx_runtime_resume,
+		       NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
@@ -300,7 +299,7 @@ static struct platform_driver fsl_aud2htx_driver = {
 	.remove_new = fsl_aud2htx_remove,
 	.driver = {
 		.name = "fsl-aud2htx",
-		.pm = &fsl_aud2htx_pm_ops,
+		.pm = pm_ptr(&fsl_aud2htx_pm_ops),
 		.of_match_table = fsl_aud2htx_dt_ids,
 	},
 };
-- 
2.34.1

