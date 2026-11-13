Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546500;
	b=e3I1vVtPJGSvj9iKPLPYtOnUTng3Ly/zxDYizQZbU92pNz4vEakXlJHyOtBqiXotK/tv
	 OEDdkmnuPtJfjuKqHLvnpGnCbuBPIk6ZCrZ3W86k2+i64Ogra0RpO/D4bUcD5s1xDoJeM
	 efqAvwt6SuUhEI3QQ0uIH2NhhGBHE3BPfH4708e+a021K29xuam3mXg6k0Z9IrCmrXq16
	 XbyMLuYZClueU+BF2M1N3NEhy4BPUhgb6PJWzvOCJa/yO9kVY7Mq3hb817IJoyk9avHZC
	 yBbZdefJzXxNJavM5czy9+p8nPpZyqmyuL41nxgrvD3mXyFoDa4onn04ColNJM6qmnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546500;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pldrHiOuWtpoIUL/Y3y4Fat0jR15gtvqdpka0KGtHh8=;
	b=Ga377+XN/BvxHWvUaMvCLrjXPjTKXX7bhbEdDLwM69wBmBviXGIXyi/9gtbtYXmsNNOX
	 iCm2npib06bcLdmmW9nKdFZO5MvPMunIQinU7zXPkr3qx/gyWV+9HkT8lSMaF2DWHmktg
	 LBsl9h2lX54S9uIsZjyGx1QTUBV/yIM/YoKEPLXgF1BW9Nb68NEd7pKCnOrUtBuxWN88v
	 XP5E13q8xyg7ga4s1uoU4k/7tK0xGHmGCH23glxk/xjyLp0vMuJ7rYf41Pfxfc/WJxSZG
	 ana87wJ6zoEMWZU69Z2AP1XSEgyuAYcqZz0+vJQJcT4v6VY3NHSodUYYyHBBD7qLaUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtJfJiAC;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CB1606A333
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 05:08:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02CB1606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qtJfJiAC
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b155f50c24so907302a91.3
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 21:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794546499; x=1795151299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pldrHiOuWtpoIUL/Y3y4Fat0jR15gtvqdpka0KGtHh8=;
        b=qtJfJiACMXwqAVQXGD0f+UK/ed4OR0W99aeaxv4fnHieGIk/W7ylNtJHKzPgZPe9iM
         yK0DDUt9hxrYQXBovQZ0V+A+Y7DHGp5uW+nqEZD46ykMbRZm8ExEsose4fk3y/aF6UaK
         lkPfTykT/uMTm2HKQEyMjtx7lGCH2CI8clglUgS+9v4x8KaDw+pwOTpGI8AT39GXAjFr
         lYMXWYP/rJHc+yNmiUaa6uTJGycLzByXU2cQfKkLIb8PkAvhr0QoNKay4egoiNMr+yDw
         FPyodo4dERjylCUTf+QBgzp5DBjVZX4KAzygszsIGgW17OpTGLt61Ox9rKB0aNRwplcE
         gjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546499; x=1795151299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pldrHiOuWtpoIUL/Y3y4Fat0jR15gtvqdpka0KGtHh8=;
        b=eb28y8aOVGJCA0YafRNFcdKgAblHOoRC1zeoIFVnZAPpqmVyX7Se9tjzB76+XJlrp0
         0s/H4A91d0UOe/TooRZJ8Zr/xembNXMC71b+/J8HNY+Ej+754cnl8BwqVUZCIdtyqQj9
         38KdqqMKdEVrB4ROb9pOC5OzGSTQzYibPkbUHRbHCpzypacIw/cgED+k+O+bRbyb95iG
         36YPIaFf/ItyKRU12635JERfOLbsQuVx0trlZ2fzjbgmxN7BXWaLlr4i9RwkkcYm2XAY
         PMM7Bco3nreCGXToRgydx6kuTJvLHmPPX8Lx++rt6gv7l4UXGjVp/Vq+phmuHzWZI5wj
         QzOQ==
X-Forwarded-Encrypted: i=1; AL+hErFO5+igXvlY6AZplKhjtsk9vdAIf+aqjPuQyE9DSxEz8Gfn2TH16HZtcfm2JyaENq4Iyh+HbDNw1QXNmQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/7IpuMX5hrVZf95Lf4bXEuoUUFR65a9Ong50PSiFOFVI7aOVUD
	4eRLfUp6xspFonEfi/5eouTPWDQZFILtekHWFk1rzYWqPRk9rX+glrxv
X-Gm-Gg: AYBFou0Cw8UpPKnDhptbuW4Fl0ejeVWwJooNXwPHDyA1G5Kq291xt/SCT3wzpyRCuY7
	pI5XfklcL9DZeRHpaGWfB/IXfQ/+zJp7lf5HR2M3+pEZveOCN5CTxdaoe6IirF3LMgE6sG2NXAG
	6I27NWHF0OplqBPUVs+ATf+RLvDO0lDhAT7gYBDcNU7aAa0u2LwfwJdmZ/3nruSe8+v1ihaOTmQ
	VzOsf66N8xsjF7pbiOiYXJlFBUxDzhse/VckxWz0AlWNSOafS79FHN5FU4iptsRUpN0v/mxiN50
	AtMjpphuDqoshGKVq8YDyIqCBdXNjQEuOe469Zv2QgX6XuoUQvoigVGemgmNyePbxh4JcOXY/qk
	ukXZV1aMqCFe2OQSEzSpazT17ujXU/dN/6PQ8ahm+MlYFIEbtzcFIBBf1CdbaCCh6jbZ+WJyINK
	pM6Ec3splhXAFUjSl6bfb9Kb9E69n9ytgFwSVguauTGe2dh8LyC3Qf6jB9xZJ2Vg4ZenaqExw9o
	Rp8rcHh2q7gFh6gzEJ5gjNxU+sgmESLRFqMxutIM3QsS6piDt56p3+7tbbK3B43U++QpdBC1089
	k9Ef+30ecPrj94bxks/CwOH+gqSzkhpuwIM+a+NKudndef9rOVUhOYSDyN8Aha6d7QCj229YLUT
	Go2OOfoxLN0ZAQ8OrhrknkMRj/kEqq3e0huxoHxpS/ptQ
X-Received: by 2002:a17:90b:54cb:b0:3ac:a139:1b14 with SMTP id 98e67ed59e1d1-3b1b0d39a69mr1118659a91.57.1794546499300;
        Thu, 12 Nov 2026 21:08:19 -0800 (PST)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm7643420a91.16.2026.11.12.21.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:08:18 -0800 (PST)
From: phucduc.bui@gmail.com
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 5/6] ASoC: fsl_asrc: Use devm for runtime PM cleanup
Date: Fri, 13 Nov 2026 12:07:26 +0700
Message-ID: <20261113050727.14053-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113050727.14053-1-phucduc.bui@gmail.com>
References: <20261113050727.14053-1-phucduc.bui@gmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

On unbind, fsl_asrc_remove() gates the clocks before devres
unregisters the component and frees the IRQ, while the component
may still be in use.

Move the cleanup to devm. The action that disables the clocks is
registered before devm_pm_runtime_enable(), so it runs last, after
runtime PM is disabled, as in fsl_asrc_remove().

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Change in v2:
 - Remove fsl_asrc_runtime_suspend_action when CONFIG_PM is disabled.

 sound/soc/fsl/fsl_asrc.c | 54 +++++++++++++++++++++++++---------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index c97f814d7358..317ce0a5c765 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1258,6 +1258,15 @@ static int fsl_asrc_m2m_pair_resume(struct fsl_asrc_pair *pair)
 static int fsl_asrc_runtime_resume(struct device *dev);
 static int fsl_asrc_runtime_suspend(struct device *dev);
 
+/* devm action: runtime suspend the device if it is not runtime suspended yet */
+static void fsl_asrc_runtime_suspend_action(void *data)
+{
+	struct device *dev = data;
+
+	if (!pm_runtime_status_suspended(dev))
+		fsl_asrc_runtime_suspend(dev);
+}
+
 static int fsl_asrc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1413,22 +1422,38 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, asrc);
 	spin_lock_init(&asrc->lock);
-	pm_runtime_enable(&pdev->dev);
+
+	/*
+	 * Ensure the device is suspended after the IRQ and component
+	 * have been released.
+	 */
+	ret = devm_add_action(&pdev->dev, fsl_asrc_runtime_suspend_action,
+			      &pdev->dev);
+	if (ret)
+		return ret;
+
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		return ret;
 	if (!pm_runtime_enabled(&pdev->dev)) {
 		ret = fsl_asrc_runtime_resume(&pdev->dev);
-		if (ret)
-			goto err_pm_disable;
+		if (ret) {
+			devm_remove_action(&pdev->dev,
+					   fsl_asrc_runtime_suspend_action,
+					   &pdev->dev);
+			return ret;
+		}
 	}
 
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret < 0)
-		goto err_pm_get_sync;
+		return ret;
 
 	ret = fsl_asrc_init(asrc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init asrc %d\n", ret);
 		pm_runtime_put_noidle(&pdev->dev);
-		goto err_pm_get_sync;
+		return ret;
 	}
 
 	/* Request the IRQ only once the device is initialized */
@@ -1436,32 +1461,25 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 			       dev_name(&pdev->dev), asrc);
 	if (ret) {
 		pm_runtime_put_noidle(&pdev->dev);
-		goto err_pm_get_sync;
+		return ret;
 	}
 
 	ret = pm_runtime_put_sync(&pdev->dev);
 	if (ret < 0 && ret != -ENOSYS)
-		goto err_pm_get_sync;
+		return ret;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
 					      fsl_asrc_dai, ARRAY_SIZE(fsl_asrc_dai));
 	if (ret)
-		goto err_pm_get_sync;
+		return ret;
 
 	ret = fsl_asrc_m2m_init(asrc);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to init m2m device %d\n", ret);
-		goto err_pm_get_sync;
+		return ret;
 	}
 
 	return 0;
-
-err_pm_get_sync:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		fsl_asrc_runtime_suspend(&pdev->dev);
-err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
-	return ret;
 }
 
 static void fsl_asrc_remove(struct platform_device *pdev)
@@ -1469,10 +1487,6 @@ static void fsl_asrc_remove(struct platform_device *pdev)
 	struct fsl_asrc *asrc = dev_get_drvdata(&pdev->dev);
 
 	fsl_asrc_m2m_exit(asrc);
-
-	pm_runtime_disable(&pdev->dev);
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		fsl_asrc_runtime_suspend(&pdev->dev);
 }
 
 static int fsl_asrc_runtime_resume(struct device *dev)
-- 
2.43.0

