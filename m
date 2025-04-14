Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D762F32
	for <linux-sound@vger.kernel.org>; Mon, 14 Apr 2025 06:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744612404; cv=none; b=DJC7nQxgZ7ovkW6ojDDdpbY2EkbnR5q/lPYK9reS+7Y5b+dFgaeJ/dsVjTbf0EDlb7hpzZ8jmlMyuTv+VBU7HbJs6C1/xW9TucMTwyVTkaxOWEA1K8SkPKKEJUr/eH9SlNNZkPnLgDTjpDhVBzAj7TMWnzlrfVLIjWuLfdAP+Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744612404; c=relaxed/simple;
	bh=OJoIbJZFduZSR7jjrEVMMz4t9m4/hhNBKBcK02Eoigo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MbKNOBHynlk3GEuF/6hOZwcKCFcedS/g5Q2D0Tf5sJDuKUslLgdP6RUwceeNRM2/D9m0Rv8mwaCPeDHJI/XINLtI3DnDBaHFX+PITO4E+21H/BTGpIhiJFPxrcgD1lQF/AlDDhdYTX9/YqzKxsWp9TdloGOKj6v4CGZYTVxDYC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDHaAbCy; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDHaAbCy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744612403; x=1776148403;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OJoIbJZFduZSR7jjrEVMMz4t9m4/hhNBKBcK02Eoigo=;
  b=fDHaAbCyzzDFktCNcRKhXOtQPixoj+Rj8aVg5WUWeI96l8t3R7ULDdIh
   Rdp2QrMLTcAtCZF+MLuh7Ay+JGayrmhfIcO2oG8qWkwbh77kXJMvM5TDv
   QcFDx4MWX8huDrWP56+yq98SUqIy7XFmbpFgh1222is/+gGxJNrDZkb68
   G9G41Ju9wsfGV38LmTz4Fd1MldvJ0Q4/zMySfUegVHYDa7ae4XRUupFkL
   X1mdVFfbPmLkX1zgFWR2SsRodvXd0ak53FTBjL2MV81noKHbxoooKB61T
   CUYTyhc45Xdbqbgsi1hgwwrINfUuS6aNtVG7gmpbDs82YUkAMkdhWP5Tm
   g==;
X-CSE-ConnectionGUID: Jlm1UBkLTrWPiO0rtJ+/qw==
X-CSE-MsgGUID: HRpKawOtT+u1MiExYIz36A==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="49872616"
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="49872616"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:23 -0700
X-CSE-ConnectionGUID: osMA5DuaSZKyfpQC7YOscQ==
X-CSE-MsgGUID: yj7vHVmmTquHM0ZnU6Zzwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,211,1739865600"; 
   d="scan'208";a="130275272"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO yungchua-desk.intel.com) ([10.247.118.73])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2025 23:33:22 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 03/11] ASoC: soc-acpi: add get_function_tplg_files ops
Date: Mon, 14 Apr 2025 14:32:31 +0800
Message-ID: <20250414063239.85200-4-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
References: <20250414063239.85200-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We always use a single topology that contains all PCM devices belonging
to a machine configuration.
However, with SDCA, we want to be able to load function topologies based
on the supported device functions. This change is in preparation for
loading those function topologies.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 include/sound/soc-acpi.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/sound/soc-acpi.h b/include/sound/soc-acpi.h
index 72e371a21767..b8af309c2683 100644
--- a/include/sound/soc-acpi.h
+++ b/include/sound/soc-acpi.h
@@ -10,6 +10,7 @@
 #include <linux/acpi.h>
 #include <linux/mod_devicetable.h>
 #include <linux/soundwire/sdw.h>
+#include <sound/soc.h>
 
 struct snd_soc_acpi_package_context {
 	char *name;           /* package name */
@@ -193,6 +194,15 @@ struct snd_soc_acpi_link_adr {
  *  is not constant since this field may be updated at run-time
  * @sof_tplg_filename: Sound Open Firmware topology file name, if enabled
  * @tplg_quirk_mask: quirks to select different topology files dynamically
+ * @get_function_tplg_files: This is an optional callback, if specified then instead of
+ *	the single sof_tplg_filename the callback will return the list of function topology
+ *	files to be loaded.
+ *	Return value: The number of the files or negative ERRNO. 0 means that the single topology
+ *		      file should be used, no function topology split can be used on the machine.
+ *	@card: the pointer of the card
+ *	@mach: the pointer of the machine driver
+ *	@prefix: the prefix of the topology file name. Typically, it is the path.
+ *	@tplg_files: the pointer of the array of the topology file names.
  */
 /* Descriptor for SST ASoC machine driver */
 struct snd_soc_acpi_mach {
@@ -212,6 +222,9 @@ struct snd_soc_acpi_mach {
 	struct snd_soc_acpi_mach_params mach_params;
 	const char *sof_tplg_filename;
 	const u32 tplg_quirk_mask;
+	int (*get_function_tplg_files)(struct snd_soc_card *card,
+				       const struct snd_soc_acpi_mach *mach,
+				       const char *prefix, const char ***tplg_files);
 };
 
 #define SND_SOC_ACPI_MAX_CODECS 3
-- 
2.43.0

