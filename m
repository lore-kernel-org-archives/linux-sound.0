Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F732C0277
	for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 14:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762958529; cv=none; b=UqS+cYKsI2W5ymiS3D71VcTqznvaPWiO8POCiS98/JMTL03i890JcbsT9zCpJ7RM1nBWJuY4Q/a9o//r3UQr1jQEUKTRyvHE+qPShystF1q+f45pauv8Zjqe8qRJpkxTPBukAOfew9+5OodvAfbvkd7RsjmfWSlOuKKXUwC00DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762958529; c=relaxed/simple;
	bh=82XTjjSHShPDBuv5ewTva+T1nGonEhZqWcuzr/UnA34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jnFljZUww1Wv54tov+NKojxgQvcxItad+cKAr5nXSg1MXLyiP0xz+2VGbV0Uu71H3SRD2aPzqK8moLIprJVOItegcA5YdnjlA+LEcv29n/Udrf11Ki1MdUUJRxi98bT3/+tau9acY70bz49XW6jRgEFkw2vDexu3myYu5guLpeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FJqh7Tzi; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FJqh7Tzi"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-640aaa89697so1223564a12.3
        for <linux-sound@vger.kernel.org>; Wed, 12 Nov 2025 06:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762958525; x=1763563325; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E6N2LkhR7aeG78fCFoaE5f7J6Vqh6iLlOX4wNPsAzjs=;
        b=FJqh7Tzi2NZeeQDnKBlIHkUb41vUttUkFkJPrP5EJTRYNECRW0rdR1Ds9sXury7tXF
         r6rS64n0UuAaO/lUr0HIaieCMS2+nK7OBsg3PiTe+o0xjBbPh+vOC+UlMqLf1g+dzIW6
         R1kBgjKjQQ8hWL2vRy4LfG9T6O43aM2+WClgdL4dmiOAOvAPdswaiyiW9N+gMnnIHYzo
         KJGCINJ/eteobm+X6I5tUiZAVfPGGkBieN5AfTyEVC61EP6YqOYhOGFLx/jejQwrs9NS
         lgVPuim0IAyLR1teR6r99IS4FhXdk5hsmlZTcw+u9/3TI/xeAbE4sEDmWskCRalGlHsf
         /hYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762958525; x=1763563325;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6N2LkhR7aeG78fCFoaE5f7J6Vqh6iLlOX4wNPsAzjs=;
        b=O7oZjvRDXU1Gp4kK3aEMtvKLWVbeyp+EpSElJDpTKMEHTXll7tNAqWQzA+OWqOyw/6
         l/bLEnA7cjmohhu2oEOR+NNLCVGjhOs/EgT9Br8wXP2EgqYRDV2L3DCth/tmvaqyuW5H
         P8yM4vPorNSdRHTwvytY245sS8rJyh7w/jRA2IOtwrCWe08O8nesr62BQGIQIewcPd9/
         dpw+kw4wvIaN3FIibk/3Adtg4vF18edf74diQ9ir64AYIF7/bq6rNpxxIOADHeomJqZB
         pprKjLCaBGeDs9UhNOWAOeLcyeG2frGXWbraoJps4/uSL99bi5cTyJqNfCSew10XgUW0
         +4Jw==
X-Gm-Message-State: AOJu0YwiE+E2T3cnSK1+acCYhzkhIpaT69hU2Z90FR7NTe+gq7isEzTl
	drN+OCGss5K2XYGwW9kIYUUn0ni9FMXpSmdPCsQ5USQhqwc+hS0tfUrm
X-Gm-Gg: ASbGncuoI6PA2WoRpotJAs3g0VoNNoeMFXjSN6z5ix1HIAQbjix0f2Oz1BMoryCsjXn
	RYug0t2CsDE9H0xEEMnF0AQ01aPta66uYLpico2JL7+n8c8KCSCgqLzvoZwPVeLpjJyo4ONcdKW
	g/4tn/iNOMj5hGgdPw0Boxkee8M9ZaprCR66zMz5qqepulCo2NUYv5e2s119s15GJWhd6riTBQm
	QCZgbnlrBXD12fXoUziWWXrtm6tX7LLhJtfcPf+MtB7wUdbNF4SkuimE4jVkeQp5sapKd11xprz
	4oVxUs68SFm4sNB16NJB1LkSH28BQtqtuFvubrB6K0REj3SKA3YWsn7yBp1SKauzM+XKmao2XlN
	qd3SbPtOCgAXM8dJnlOkHdHYxl9kWDY/h+Ly5pqGXcGCkQ/fDn6gF9teLL0ar9YmXytez/RXQQl
	7uDZloidzBuGAIzkuRmvf1DJX8ivs=
X-Google-Smtp-Source: AGHT+IFTNGoT4aTk5EceAUoALwAHvKb+bdrKgtaYUbE8eWmnwtKSrKlBlBHMiZPM5J2J25G44v5DFQ==
X-Received: by 2002:a05:6402:13c1:b0:640:528c:7d49 with SMTP id 4fb4d7f45d1cf-6431a57e4d4mr3033556a12.38.1762958524375;
        Wed, 12 Nov 2025 06:42:04 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64183bc4533sm8411180a12.4.2025.11.12.06.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 06:42:04 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: SOF: imx9: use SCMI API for LM management
Date: Wed, 12 Nov 2025 06:41:24 -0800
Message-ID: <20251112144124.680-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Linux supports NXP's LMM SCMI protocol so switch to using the appropriate
API. The SIPs were intended to act as placeholders until the support for
said protocol was upstreamed.

The underlying CPU protocol command from IMX_SIP_SRC_M_RESET_ADDR_SET is
replaced by a LMM protocol command with the same effect (i.e. setting the
boot address) since using the CPU protocol would require additional
permissions (which TF-A already had). Apart from this, the SIPs are
replaced by their equivalent Linux LMM commands.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 sound/soc/sof/imx/imx9.c | 36 ++++++++----------------------------
 1 file changed, 8 insertions(+), 28 deletions(-)

diff --git a/sound/soc/sof/imx/imx9.c b/sound/soc/sof/imx/imx9.c
index 853155d5990a..e56e8a1c8022 100644
--- a/sound/soc/sof/imx/imx9.c
+++ b/sound/soc/sof/imx/imx9.c
@@ -3,19 +3,11 @@
  * Copyright 2025 NXP
  */
 
-#include <linux/arm-smccc.h>
+#include <linux/firmware/imx/sm.h>
 
 #include "imx-common.h"
 
-#define IMX_SIP_SRC 0xC2000005
-#define IMX_SIP_SRC_M_RESET_ADDR_SET 0x03
-
-#define IMX95_CPU_VEC_FLAGS_BOOT BIT(29)
-
-#define IMX_SIP_LMM 0xC200000F
-#define IMX_SIP_LMM_BOOT 0x0
-#define IMX_SIP_LMM_SHUTDOWN 0x1
-
+#define IMX95_M7_CPU_ID 0x1
 #define IMX95_M7_LM_ID 0x1
 
 static struct snd_soc_dai_driver imx95_dai[] = {
@@ -38,7 +30,6 @@ static int imx95_ops_init(struct snd_sof_dev *sdev)
 
 static int imx95_chip_probe(struct snd_sof_dev *sdev)
 {
-	struct arm_smccc_res smc_res;
 	struct platform_device *pdev;
 	struct resource *res;
 
@@ -49,31 +40,20 @@ static int imx95_chip_probe(struct snd_sof_dev *sdev)
 		return dev_err_probe(sdev->dev, -ENODEV,
 				     "failed to fetch SRAM region\n");
 
-	/* set core boot reset address */
-	arm_smccc_smc(IMX_SIP_SRC, IMX_SIP_SRC_M_RESET_ADDR_SET, res->start,
-		      IMX95_CPU_VEC_FLAGS_BOOT, 0, 0, 0, 0, &smc_res);
-
-	return smc_res.a0;
+	return scmi_imx_lmm_reset_vector_set(IMX95_M7_LM_ID, IMX95_M7_CPU_ID,
+					     0, res->start);
 }
 
 static int imx95_core_kick(struct snd_sof_dev *sdev)
 {
-	struct arm_smccc_res smc_res;
-
-	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_BOOT,
-		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
-
-	return smc_res.a0;
+	return scmi_imx_lmm_operation(IMX95_M7_LM_ID, SCMI_IMX_LMM_BOOT, 0);
 }
 
 static int imx95_core_shutdown(struct snd_sof_dev *sdev)
 {
-	struct arm_smccc_res smc_res;
-
-	arm_smccc_smc(IMX_SIP_LMM, IMX_SIP_LMM_SHUTDOWN,
-		      IMX95_M7_LM_ID, 0, 0, 0, 0, 0, &smc_res);
-
-	return smc_res.a0;
+	return scmi_imx_lmm_operation(IMX95_M7_LM_ID,
+				      SCMI_IMX_LMM_SHUTDOWN,
+				      SCMI_IMX_LMM_OP_FORCEFUL);
 }
 
 static const struct imx_chip_ops imx95_chip_ops = {
-- 
2.43.0

