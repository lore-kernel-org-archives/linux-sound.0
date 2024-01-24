Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2DE7E768
	for <linux-sound@vger.kernel.org>; Wed, 24 Jan 2024 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706115372; cv=none; b=V8qWWwHawaobrUm0c0CJq8nw+elgWhs2H8fvlFGOzCMO4xrlDerAfp5ZHxiUunk7GgBkfa3Zi4z+5vWNZ46wRixurKVU2kASrbrHD7XgGPb/uoeBp2cQklkogv2fSyv2HkUoNZ8YFwW6i0zq+kShdY+gdEBSvbzQAQWyHBJBFhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706115372; c=relaxed/simple;
	bh=a1HguVsqtkibfnCsqigz2NZCOqz//9IFy1JRq8o2WdA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=pPmi+wzl2V8Dck6evPYH06IBiVey9geZWQweal+lefsvAzoxggoCc0EsRyOck0KV16zRQyqUfrOh+VBOUuMZ3VW2vA5UCrRhVb7lCRVXpdJgRTwyTk3hNcNi+GwPkx017VJWK2WjiVEnhSSb/9VagXZddxMdmjotoPJkQNQXwGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=cy2iYVnf; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="cy2iYVnf"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40O7L4kt000450;
	Wed, 24 Jan 2024 10:56:02 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=1
	EeeXooNVx6FHXV/l/u+FrpuJmEB2sYqBuE8cmw6cKI=; b=cy2iYVnfuUaJwNrfg
	o82uQPhCayu+07iUBUxqbk3AKDbRptQr9aN+bD+sMo2RM+BA9Ut1rUCvj5JzisTG
	L/1zE5o9u5vRrk7f5YGDPqkYwx8icZKBZJlZRAGmz6cXw84c02/1d3Us6idhBqpk
	HGtpIj/e2f3sCH/0H9VbDscU7N5U36CedmtbQGmaVD3RV4+p9hKvQ0IGdZSFM1KD
	D32jjUdq1vEcYAQIZk2xZLJIuJhhB+NyPv53GkWGcqqJ2VkE/dVsjiOf5Y2ZO2xT
	QuX6rAEOaZAXuFRGp9hYR9o7N3muPTLaOLwXh/yFCHVK5bNsmxtAoJJakML5rTGY
	x+WqQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3vtmfhh44s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Jan 2024 10:56:01 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 24 Jan
 2024 16:55:59 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Wed, 24 Jan 2024 16:55:58 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E09E3820246;
	Wed, 24 Jan 2024 16:55:58 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <andy.shevchenko@gmail.com>, <lgirdwood@gmail.com>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>
Subject: [PATCH 1/7] ASoC: cs42l43: Tidy up header includes
Date: Wed, 24 Jan 2024 16:55:52 +0000
Message-ID: <20240124165558.1876407-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 0k54TIZoG0mSAqSEBMAJHDWt6DsXDcRu
X-Proofpoint-GUID: 0k54TIZoG0mSAqSEBMAJHDWt6DsXDcRu
X-Proofpoint-Spam-Reason: safe

Use more forward declarations, move header guards to cover other
includes, and rely less on including headers through other headers.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c |  5 +++++
 sound/soc/codecs/cs42l43-sdw.c  |  1 +
 sound/soc/codecs/cs42l43.c      |  8 ++++++++
 sound/soc/codecs/cs42l43.h      | 19 ++++++++++---------
 4 files changed, 24 insertions(+), 9 deletions(-)

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
index 125e36861d5d5..a491e9254568e 100644
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
@@ -37,6 +32,12 @@
 
 #define CS42L43_N_BUTTONS	6
 
+struct device;
+struct cs42l43;
+struct snd_soc_component;
+struct snd_soc_jack;
+struct clk;
+
 struct cs42l43_codec {
 	struct device *dev;
 	struct cs42l43 *core;
-- 
2.30.2

