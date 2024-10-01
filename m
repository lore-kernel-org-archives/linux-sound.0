Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B741C1BDA95
	for <linux-sound@vger.kernel.org>; Tue,  1 Oct 2024 07:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727766399; cv=none; b=HxDFCtKOt3O4RdvCE+dft4gVnZaRehnHkuCIfJOlpVXxPJYM2DXaOVu/hPu+mu9cE8KZewcwzuI4ZOEApzt/sLitA8iOec2nIaxHCkDaVqb48oMTn9ZgL/yc55JOm5UqPYum1H83ngeyZdTQwIG1wnwmWxHOJjkZRmY1RJ1EDak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727766399; c=relaxed/simple;
	bh=QeBcgQC6Uqqhj+R1iY8wI6U65X+2oHSnvrbaAGjiUgg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jJkGOrmx1QoDnSAI3JNlQxcCsraQJB/1P/eKrjsFdyTuXFSo7GJnvjuSoEEmd2ppwhBg8RsscwbDq3aGrs441qAKu/FwO/JxLM1uErMbNG/BARcFLtwTw5Tn4OnAhg9HGOjmOD9DSQdfR4wtybbuqp48PKYRz0NHbQR8zhI71ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yahbsu3L; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yahbsu3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727766398; x=1759302398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QeBcgQC6Uqqhj+R1iY8wI6U65X+2oHSnvrbaAGjiUgg=;
  b=Yahbsu3Ls6DzLS9Q2AYl5PveuTp6Og+sOpTGYMo83SOOZDIF6oMx7LkS
   H4rsYjftbKR8z4AUdIg5xTBOn5SuiMsBJQo49TxlJDETb8dfOxouefzB/
   /I9w4fi1nF3/CsMKxMVXNKyDUNRSnQI+Ca7JgV3wwXZObY3gTk4swcavp
   lbounoJVvVS7JX1E6A9u2qkfyRizr/4orhZggnXQFcke2Fl8Y/fXQbVos
   cc2HGn1PccX3V6JZh7TfZYHx+uJvRuVlvNRaV8h+um2ln0aSqRvc+3NLJ
   0nOILzyIZmFV8T3PoGY0XbknmOC8sc3Ds65AADFwO15gUtBd2tuDJ1CtZ
   Q==;
X-CSE-ConnectionGUID: tRXij7PyRMq10g0wUkP8rQ==
X-CSE-MsgGUID: nJQsgpRZTzWOue0ZgfPi7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="37556060"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="37556060"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:06:37 -0700
X-CSE-ConnectionGUID: xHOBf3AOTGC9U3IDfThtDw==
X-CSE-MsgGUID: Qpb90ep0TjS3Kc2sjAlxBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; 
   d="scan'208";a="78096825"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.119.243])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2024 00:06:35 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: [PATCH RESEND 4/4] ALSA/hda: intel-sdw-acpi: add support for sdw-manager-list property read
Date: Tue,  1 Oct 2024 15:06:11 +0800
Message-ID: <20241001070611.63288-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241001070611.63288-1-yung-chuan.liao@linux.intel.com>
References: <20241001070611.63288-1-yung-chuan.liao@linux.intel.com>
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

