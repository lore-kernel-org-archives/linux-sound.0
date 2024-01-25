Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5DA1CA82
	for <linux-sound@vger.kernel.org>; Thu, 25 Jan 2024 10:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706178688; cv=none; b=eBWuG2/SIsYzhY1tqlT31X7p+kFtBfZyOBdru4LJKG3CABDMnlhmna7XzLngNQOwqtuvFd2zDq0zeMM/HDsHjWXtQTvS/iUGUyYbtiMKvAp9A12wHEb/Iaf2nHVTxgswNKUH8biwHnMweymwuOob2j3rLClawEOFVfehlFiNxSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706178688; c=relaxed/simple;
	bh=dP1nGXxsMCY2F5/u1k++YVby2qiBM6bGmD+FcrbasGY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IVQti3r1u8mnLhVMiv2W12yjupofYLyZ5aG/o63DshMae4PT8VC/+p97pRVFP1uQhBUce6Fp7m97iVok0JYpUq9HhGabPdn008Fc2L+RLzEwIUL9XxVpx1TRIPjHwhNVE6r2CY8b4pJjeMtk033Y10u1YypxXP/qUOxKnvmoxP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kIWbEIlk; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kIWbEIlk"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40P6oFQ2010841;
	Thu, 25 Jan 2024 04:31:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=q
	YrlmXtQv18SjBS8+hZTJonIOBNbD4DOAkMk4mxdJ5w=; b=kIWbEIlk33UMbYwOy
	/ceY/PFruGM5paYRW3cD6WJtwE/pCfh8kT3vFlF/2vLz0CCUmM2ldzbuaNUpUeDF
	oc9r7Hm2HrTwJ1ZvJJ+75qeDfLcbH9eCaoDk6VEGQI1wCyhP9MNYmIWQbGtED5jH
	XsRqftmADFzXyaS/3zt+YgIUQ+QJ4qbkY8kdULkwiPxY4rigZm0buMuW5rvUyUJ/
	pUChDNpfgewacq2zxZX0gneQkNToER4J3HfWU09e/v0Nfiw4LpuyoNO7GoabEwV2
	ic0yYNQfwvM0DgY54nQ+wOzhlBNYUEi6ke1yPuzDz13baSuUyf3HTjRnwBzym05y
	6W6Yw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhj3jn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jan 2024 04:31:19 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 25 Jan
 2024 10:31:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 25 Jan 2024 10:31:17 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 70A4A820246;
	Thu, 25 Jan 2024 10:31:17 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH v2 1/7] ASoC: cs42l43: Tidy up header includes
Date: Thu, 25 Jan 2024 10:31:11 +0000
Message-ID: <20240125103117.2622095-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: fcZMI8xpfq7jlJIQx7NtCYEk9o8_2uur
X-Proofpoint-GUID: fcZMI8xpfq7jlJIQx7NtCYEk9o8_2uur
X-Proofpoint-Spam-Reason: safe

Use more forward declarations, move header guards to cover other
includes, and rely less on including headers through other headers.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Shuffle forward declarations around

Thanks,
Charles

 sound/soc/codecs/cs42l43-jack.c |  5 +++++
 sound/soc/codecs/cs42l43-sdw.c  |  1 +
 sound/soc/codecs/cs42l43.c      |  8 ++++++++
 sound/soc/codecs/cs42l43.h      | 21 ++++++++++++---------
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 24a598f2ed9a3..1d8d7bf0a6b0d 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -6,19 +6,24 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 
 #include <linux/build_bug.h>
+#include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/errno.h>
 #include <linux/irq.h>
 #include <linux/jiffies.h>
 #include <linux/mfd/cs42l43.h>
 #include <linux/mfd/cs42l43-regs.h>
+#include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/workqueue.h>
 #include <sound/control.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc-component.h>
+#include <sound/soc-jack.h>
 #include <sound/soc.h>
 
 #include "cs42l43.h"
diff --git a/sound/soc/codecs/cs42l43-sdw.c b/sound/soc/codecs/cs42l43-sdw.c
index 388f95853b699..60c00c05da055 100644
--- a/sound/soc/codecs/cs42l43-sdw.c
+++ b/sound/soc/codecs/cs42l43-sdw.c
@@ -9,6 +9,7 @@
 #include <linux/mfd/cs42l43.h>
 #include <linux/mfd/cs42l43-regs.h>
 #include <linux/module.h>
+#include <linux/soundwire/sdw.h>
 #include <sound/pcm.h>
 #include <sound/sdw.h>
 #include <sound/soc-component.h>
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 6a64681767de8..f2332f90f8337 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -6,17 +6,25 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 
 #include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/errno.h>
 #include <linux/gcd.h>
 #include <linux/irq.h>
+#include <linux/irqdomain.h>
 #include <linux/jiffies.h>
 #include <linux/mfd/cs42l43.h>
 #include <linux/mfd/cs42l43-regs.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 #include <sound/control.h>
+#include <sound/cs42l43.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc-component.h>
diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
index 125e36861d5d5..9924c13e1eb53 100644
--- a/sound/soc/codecs/cs42l43.h
+++ b/sound/soc/codecs/cs42l43.h
@@ -6,19 +6,14 @@
  *                         Cirrus Logic International Semiconductor Ltd.
  */
 
-#include <linux/clk.h>
+#ifndef CS42L43_ASOC_INT_H
+#define CS42L43_ASOC_INT_H
+
 #include <linux/completion.h>
-#include <linux/device.h>
 #include <linux/mutex.h>
-#include <linux/regmap.h>
-#include <linux/soundwire/sdw.h>
 #include <linux/types.h>
-#include <sound/cs42l43.h>
+#include <linux/workqueue.h>
 #include <sound/pcm.h>
-#include <sound/soc-jack.h>
-
-#ifndef CS42L43_ASOC_INT_H
-#define CS42L43_ASOC_INT_H
 
 #define CS42L43_INTERNAL_SYSCLK		24576000
 #define CS42L43_DEFAULT_SLOTS		0x3F
@@ -37,6 +32,14 @@
 
 #define CS42L43_N_BUTTONS	6
 
+struct clk;
+struct device;
+
+struct snd_soc_component;
+struct snd_soc_jack;
+
+struct cs42l43;
+
 struct cs42l43_codec {
 	struct device *dev;
 	struct cs42l43 *core;
-- 
2.30.2

