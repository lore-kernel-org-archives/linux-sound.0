Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1129823EA8C;
	Fri, 23 Jan 2026 23:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769212258; cv=none; b=F6Kq3r8RJwjRNIFH++vvYzxPmC7kjkDvrnBaL8v7aBKIJFnj1WaO6nOdJmdo72SM9UosRLQ3BlVBtPhK20ZXTbNq5u2yrAH5lVLGgRai96LFCmX6/RcZjp7JD71b725oY0VwKkNb/X3Iz1ey5tEi/4i/vFSFdU3f6sIx85ziXwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769212258; c=relaxed/simple;
	bh=A2i+61EYkisliHlGA54kZAj7atNspEktYBSPlNrLXPA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EyUuz0Zq39z4aiuvSm5xRrsEZydjhvg72ggGDMvjJTCUeHzJ5xRQChfVUUunI2fmIDymabux0tRsHAwBFmvM+Kia9oITqLDKO5Ou2b1/W+5GE+oeP37Uq2+KA4GFdENSdDDQAnpqfNDt3a3m9Fc6Go0xqvHoEcjX9fJ7fmoHz/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YxQj4X4D; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YxQj4X4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769212256; x=1800748256;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A2i+61EYkisliHlGA54kZAj7atNspEktYBSPlNrLXPA=;
  b=YxQj4X4DtJxwA3HGRbE819n50W5BhDJ3lMOUPDdH87p2OSup+fTCN4IR
   WPY0SNuHLY+rVkJrB5HjmTiyFX5tJLo50VrO6p/I5LPDZcDuBnVAF35+r
   XkE8BwlI5bunaRzkL2aA/LJHYcrSyc0ZobGpzuGqwTPKYNNOiE9otcS5O
   uXlSQnkjwWIziDg9g8sctkWJKE7kcSgkKAtut1b2m33LOSY+z5FQhIRU3
   91Sr8UQ1ao9lxfNUzAfPwMI4i+qVs+fFQpE+HjsXf/w66OxMBtPfYu9cW
   T71CJk8zEWkvs1Ar3RzB1w51yLuqnpYKpXCbbWXWwxsIq3Pg/NUZmdPEB
   w==;
X-CSE-ConnectionGUID: Chy0tspvRaSN5kSihQuQWw==
X-CSE-MsgGUID: YifzXocmRVS8Bh8lpWn8tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="70375810"
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="70375810"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 15:50:55 -0800
X-CSE-ConnectionGUID: i4z0KJLHTMipFY5VF0Znmg==
X-CSE-MsgGUID: GaKdkA22ROCFwWPTXOAeNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,249,1763452800"; 
   d="scan'208";a="238406010"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 23 Jan 2026 15:50:53 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EFABE95; Sat, 24 Jan 2026 00:50:51 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Shuming Fan <shumingf@realtek.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] ASoC: codecs: rt1320-sdw: Refactor to reduce stack frames
Date: Sat, 24 Jan 2026 00:50:50 +0100
Message-ID: <20260123235050.2837942-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compiler is not happy about used stack frames in a couple of functions:

sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_rae_load':
sound/soc/codecs/rt1320-sdw.c:1570:1: error: the frame size of 1336 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]
sound/soc/codecs/rt1320-sdw.c: In function 'rt1320_dspfw_load_code':
sound/soc/codecs/rt1320-sdw.c:1786:1: error: the frame size of 1520 bytes is larger than 1280 bytes [-Werror=frame-larger-than=]

Refactor the code to fix these.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/codecs/rt1320-sdw.c | 43 +++++++++++------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 5e8a67eeb08e..051c471a0731 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1429,8 +1429,7 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 	unsigned int addr, size;
 	unsigned int func, value;
 	const char *dmi_vendor, *dmi_product, *dmi_sku;
-	char vendor[128], product[128], sku[128];
-	char *ptr_vendor, *ptr_product, *ptr_sku;
+	size_t len_vendor, len_product, len_sku;
 	char rae_filename[512];
 	char tag[5];
 	int ret = 0;
@@ -1441,21 +1440,13 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 	dmi_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
 
 	if (dmi_vendor && dmi_product && dmi_sku) {
-		strscpy(vendor, dmi_vendor);
-		strscpy(product, dmi_product);
-		strscpy(sku, dmi_sku);
-		ptr_vendor = &vendor[0];
-		ptr_product = &product[0];
-		ptr_sku = &sku[0];
-		ptr_vendor = strsep(&ptr_vendor, " ");
-		ptr_product = strsep(&ptr_product, " ");
-		ptr_sku = strsep(&ptr_sku, " ");
-
-		dev_dbg(dev, "%s: DMI vendor=%s, product=%s, sku=%s\n", __func__,
-			vendor, product, sku);
+		len_vendor = strchrnul(dmi_vendor, ' ') - dmi_vendor;
+		len_product = strchrnul(dmi_product, ' ') - dmi_product;
+		len_sku = strchrnul(dmi_sku, ' ') - dmi_sku;
 
 		snprintf(rae_filename, sizeof(rae_filename),
-			 "realtek/rt1320/rt1320_RAE_%s_%s_%s.dat", vendor, product, sku);
+			 "realtek/rt1320/rt1320_RAE_%.*s_%.*s_%.*s.dat",
+			 len_vendor, dmi_vendor, len_product, dmi_product, len_sku, dmi_sku);
 		dev_dbg(dev, "%s: try to load RAE file %s\n", __func__, rae_filename);
 	} else {
 		dev_warn(dev, "%s: Can't find proper RAE file name\n", __func__);
@@ -1595,8 +1586,7 @@ struct rt1320_dspfwheader {
 	static const char hdr_sig[] = "AFX";
 	unsigned int hdr_size = 0;
 	const char *dmi_vendor, *dmi_product, *dmi_sku;
-	char vendor[128], product[128], sku[128];
-	char *ptr_vendor, *ptr_product, *ptr_sku;
+	size_t len_vendor, len_product, len_sku;
 	char filename[512];
 
 	switch (rt1320->dev_id) {
@@ -1616,21 +1606,14 @@ struct rt1320_dspfwheader {
 	dmi_sku = dmi_get_system_info(DMI_PRODUCT_SKU);
 
 	if (dmi_vendor && dmi_product && dmi_sku) {
-		strscpy(vendor, dmi_vendor);
-		strscpy(product, dmi_product);
-		strscpy(sku, dmi_sku);
-		ptr_vendor = &vendor[0];
-		ptr_product = &product[0];
-		ptr_sku = &sku[0];
-		ptr_vendor = strsep(&ptr_vendor, " ");
-		ptr_product = strsep(&ptr_product, " ");
-		ptr_sku = strsep(&ptr_sku, " ");
-
-		dev_dbg(dev, "%s: DMI vendor=%s, product=%s, sku=%s\n", __func__,
-			vendor, product, sku);
+		len_vendor = strchrnul(dmi_vendor, ' ') - dmi_vendor;
+		len_product = strchrnul(dmi_product, ' ') - dmi_product;
+		len_sku = strchrnul(dmi_sku, ' ') - dmi_sku;
 
 		snprintf(filename, sizeof(filename),
-			 "realtek/rt1320/rt1320_%s_%s_%s.dat", vendor, product, sku);
+			 "realtek/rt1320/rt1320_%.*s_%.*s_%.*s.dat",
+			 len_vendor, dmi_vendor, len_product, dmi_product, len_sku, dmi_sku);
+
 		dev_dbg(dev, "%s: try to load FW file %s\n", __func__, filename);
 	} else if (rt1320->dspfw_name) {
 		snprintf(filename, sizeof(filename), "rt1320_%s.dat",
-- 
2.50.1

