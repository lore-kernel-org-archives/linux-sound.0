Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4E516726E
	for <linux-sound@vger.kernel.org>; Fri, 30 Aug 2024 08:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725007289; cv=none; b=K5JHvmbLJceQKnAVKpjiB8pC0Xfo+a01CFFKlBOCX8Id+rXBmSsXcV+7Krc87fhWX539z7Wok3JR6hCgB5CeGRcFC9hjw6t3Lxd3jZsYVo8c/aWcoAs+cEgDCqlkif+07QU3fx/W++9Wvn4BNuPZvKAfbXo2ucd2bHloGZW+T10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725007289; c=relaxed/simple;
	bh=QeBcgQC6Uqqhj+R1iY8wI6U65X+2oHSnvrbaAGjiUgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HM3npHIO6OuvQ1GBjZNkJBkWdHwklHuHzMuKDWTa60Hp/ko9VCLZByKpw8k7MZbHS/Divua7lL7eqlqI3Nn/Gcv4Px67IJepkXjCaeb8nrTCIn6o5NWFF0yUN6DZOlQOiiBwfStvVewf6AYEBE+JGDcKjhWXsn0B1bYitidZFDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GVz8Q9by; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GVz8Q9by"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725007288; x=1756543288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QeBcgQC6Uqqhj+R1iY8wI6U65X+2oHSnvrbaAGjiUgg=;
  b=GVz8Q9bymPXfgjivthSObsE98bcvBRkeBQRdtN1L6a8izixLWbdEayP8
   IhunlrWFCZBqSkG9xSZ+AmaQrtJsdRQLuj+fVRqGmB5loqHqc9rjsMlBh
   c6v+K5/j+8Hy4usVvcC1Pe0G3oiZRf2NuPezmMRt7Kvlu354wQLUF6JAU
   ol72vr4oOy5JsbT3z+LQ7j+UL/KKNZxkqfdEgvCP/Bd51VxzPS7w2BcXC
   0PmeM66aeTr6lsO7r6clHcNC9r0jsh9vtmq6COkZvA5SCz9DO5G3WUv1b
   wBI5aEIXlUD7IeSfqXQNXWMZFuJm48Fnp2LU36LOGH9YCQJitM8gRJ4WV
   Q==;
X-CSE-ConnectionGUID: 9TtNEc9AQ1+FjNTlkzLTVQ==
X-CSE-MsgGUID: bf8b1sLfTtS00XuUFi4Meg==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26536449"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="26536449"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:41:28 -0700
X-CSE-ConnectionGUID: eA5vWyG0QoG4bgqym3raWw==
X-CSE-MsgGUID: TMutcFBPTBuYpyjttieI2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="94665929"
Received: from unknown (HELO yungchua-desk.intel.com) ([10.247.118.125])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 01:41:26 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH 4/4] ALSA/hda: intel-sdw-acpi: add support for sdw-manager-list property read
Date: Fri, 30 Aug 2024 16:41:05 +0800
Message-ID: <20240830084105.154062-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240830084105.154062-1-yung-chuan.liao@linux.intel.com>
References: <20240830084105.154062-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

The DisCo for SoundWire 2.0 spec adds support for a new
sdw-manager-list property.  Add it in backwards-compatible mode with
'sdw-master-count', which assumed that all links between 0..count-1
exist.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 include/linux/soundwire/sdw_intel.h |  2 +-
 sound/hda/intel-sdw-acpi.c          | 25 +++++++++++++++++--------
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwire/sdw_intel.h
index 37ae69365fe2..734dc1fa3b5b 100644
--- a/include/linux/soundwire/sdw_intel.h
+++ b/include/linux/soundwire/sdw_intel.h
@@ -227,7 +227,7 @@ struct sdw_intel_ops {
 /**
  * struct sdw_intel_acpi_info - Soundwire Intel information found in ACPI tables
  * @handle: ACPI controller handle
- * @count: link count found with "sdw-master-count" property
+ * @count: link count found with "sdw-master-count" or "sdw-manager-list" property
  * @link_mask: bit-wise mask listing links enabled by BIOS menu
  *
  * this structure could be expanded to e.g. provide all the _ADR
diff --git a/sound/hda/intel-sdw-acpi.c b/sound/hda/intel-sdw-acpi.c
index 582e761e7b9f..ed530e0dd4dd 100644
--- a/sound/hda/intel-sdw-acpi.c
+++ b/sound/hda/intel-sdw-acpi.c
@@ -57,8 +57,10 @@ sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 {
 	struct acpi_device *adev = acpi_fetch_acpi_dev(info->handle);
 	struct fwnode_handle *fwnode;
+	unsigned long list;
 	unsigned int i;
 	u32 count;
+	u32 tmp;
 	int ret;
 
 	if (!adev)
@@ -66,10 +68,9 @@ sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 
 	fwnode = acpi_fwnode_handle(adev);
 
-	/* Found controller, find links supported */
-	ret = fwnode_property_read_u32(fwnode, "mipi-sdw-master-count", &count);
-
 	/*
+	 * Found controller, find links supported
+	 *
 	 * In theory we could check the number of links supported in
 	 * hardware, but in that step we cannot assume SoundWire IP is
 	 * powered.
@@ -80,11 +81,19 @@ sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 	 *
 	 * We will check the hardware capabilities in the startup() step
 	 */
-
+	ret = fwnode_property_read_u32(fwnode, "mipi-sdw-manager-list", &tmp);
 	if (ret) {
-		dev_err(&adev->dev,
-			"Failed to read mipi-sdw-master-count: %d\n", ret);
-		return ret;
+		ret = fwnode_property_read_u32(fwnode, "mipi-sdw-master-count", &count);
+		if (ret) {
+			dev_err(&adev->dev,
+				"Failed to read mipi-sdw-master-count: %d\n",
+				ret);
+			return ret;
+		}
+		list = GENMASK(count - 1, 0);
+	} else {
+		list = tmp;
+		count = hweight32(list);
 	}
 
 	/* Check count is within bounds */
@@ -103,7 +112,7 @@ sdw_intel_scan_controller(struct sdw_intel_acpi_info *info)
 	info->count = count;
 	info->link_mask = 0;
 
-	for (i = 0; i < count; i++) {
+	for_each_set_bit(i, &list, SDW_INTEL_MAX_LINKS) {
 		if (ctrl_link_mask && !(ctrl_link_mask & BIT(i))) {
 			dev_dbg(&adev->dev,
 				"Link %d masked, will not be enabled\n", i);
-- 
2.43.0

