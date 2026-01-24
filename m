Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CABF83A14;
	Sat, 24 Jan 2026 10:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769249913; cv=none; b=jXAANctah1fKFX7mdv0PJw9dFMKZU1TrGK5Z94ew9cJ3y0uup+07xbIspQGA0k3UdUCv6IsD020Vjvuf5zOwNB/xmNTM0JPsATTKju2jluc2FaDmv7VfRX8tQiCknP0aL04GtuE6baZz2WQOG0YRGAICiXzc0fZ6zNEg8rrs+W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769249913; c=relaxed/simple;
	bh=Gl8xj/k+pCH0GkVxm4D2K6gwa3vIrT/5Ac0VFAeIwy8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bpHxI0dstykFla4mi8BKS5MuEtR8zgujaltJ5yZ3ImoTSLkyAE4RpAh475K4giMtkCUSYD+IEWENS23xh4O5KEU4UhaxN3F5337AeFXS47tRAx0QsXZ9z7NDkNYLvvWmtU+Ees0uvgbUg+VHLlHcN7xdkkbXJBTLSgNTg2qBd4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nacflaIX; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nacflaIX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769249912; x=1800785912;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Gl8xj/k+pCH0GkVxm4D2K6gwa3vIrT/5Ac0VFAeIwy8=;
  b=nacflaIX+1sWygxVmynQr7s6yMjt4FrM6eby7Ly4T5byGo1pOZd5e88b
   1wrwDD+kUsxjlU7OLkKh8tl8+UX9q9Ksg+eRb6s0hrOCE7cbG9pGx8+gm
   5ssScL2FcBb4CVuq0oyMDMkhg1+RrdI4fcjR6VSlc5HWAgUkKZs8jNW1E
   F0BSov53LACDkWsnhdf4wNRy0oG1vIEWUABuFKCNONhiX5w7FNpbeGW4G
   XwIdNmFEZk3vNWu+OtaBJahnjsjzwDlOa/nRAopIrPi+5iT761jCgNkyF
   r+7jlXZyDiTbUh5i4a5WjFs2XanFiiYVjvHLZMKiFP8aqn449DewlPAWq
   g==;
X-CSE-ConnectionGUID: lRsDguVZSOqzp+059yb7+w==
X-CSE-MsgGUID: cnS6wd6rTVe4xi/Sv+ulvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="87902543"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="87902543"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 02:18:32 -0800
X-CSE-ConnectionGUID: VfzyPDeBQdex76kMTD8ePw==
X-CSE-MsgGUID: tHXJzGzlRnGIZpk3JA/t6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="207583061"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jan 2026 02:18:29 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 3D8CB95; Sat, 24 Jan 2026 11:18:28 +0100 (CET)
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
Subject: [PATCH v2 1/1] ASoC: codecs: rt1320-sdw: Refactor to reduce stack frames
Date: Sat, 24 Jan 2026 11:17:03 +0100
Message-ID: <20260124101824.3424793-1-andriy.shevchenko@linux.intel.com>
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
v2: moved to int type for variable width in the string specifier (LKP)
 sound/soc/codecs/rt1320-sdw.c | 43 +++++++++++------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 5e8a67eeb08e..e849c9772665 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -1429,8 +1429,7 @@ static int rt1320_rae_load(struct rt1320_sdw_priv *rt1320)
 	unsigned int addr, size;
 	unsigned int func, value;
 	const char *dmi_vendor, *dmi_product, *dmi_sku;
-	char vendor[128], product[128], sku[128];
-	char *ptr_vendor, *ptr_product, *ptr_sku;
+	int len_vendor, len_product, len_sku;
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
+	int len_vendor, len_product, len_sku;
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

