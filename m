Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39343AA2
	for <linux-sound@vger.kernel.org>; Mon,  3 Jun 2024 07:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717399523; cv=none; b=FEn7G6i9xMqsN2RR1PE+4gc7b5BBenSANfFEBvXYM3jvP1pQnJAf+Xxcs2WUmyfK/n49vc6Ym/izCWPyrrJR/Pm0pn7JMhtj2jzqgbo0310cBDuZaF9m9cFxQvnQdTtfDMfMKNgdc0IrHBl86VLaUslkbba/9iFeTYYZr+3s1kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717399523; c=relaxed/simple;
	bh=+ViAv4dLurc/LkhCuyweQpGon7Hvss3jqPZ40w60+ZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Hmpl7FhxBLl8xSqbSsyY65vTldjSzVdRYJtEbyr3go0zhgtbLm9YyWRhiwuhygfrRb5U3+2Ed+e98BIwemIJ3Yf9ZrrywSwlrKrbmiRgB9yx4NisTQ186Xyx8iPLWpksxCVXmIrXOt4DNZT0OtZJIjtqn7I2u7/SVRma0Q9PDYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FsASp6Qd; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FsASp6Qd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717399521; x=1748935521;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+ViAv4dLurc/LkhCuyweQpGon7Hvss3jqPZ40w60+ZA=;
  b=FsASp6QdikpYD2NEfN//3Ba1hZB3Q+l4HrgXs+VBJRoUBy/omtQP2hbm
   qodvq1dvzLwhpS++/YC+moSwQZd7X97WVYrbNba9xQBnHmtSAEviBHFPA
   erTpXi+4lObjiNCI3farpBMBoJgKxoYrABlmreAZZKEmUTrn9SpUM9BfM
   3Smrofc7enw+3tkNR4sSQ76TnLw4Y+kGw9xnf0GhCcdFLnynfPYcIqkzt
   4px8JF9vsrimWDFOy+SJVwfmkmX5PUK1yoxwITrJfWIIN/l1w5R1X2fYT
   Tl7KO6AQ5AGaWbt0YUUYU0Ic96CccBofla6nV6MImjDyWrJMhbZMK67f7
   Q==;
X-CSE-ConnectionGUID: iwIaHsJKRdGT7aK9dahEeQ==
X-CSE-MsgGUID: klJ/md5sQt6YdyilY/t3hw==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="13825003"
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="13825003"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 00:25:21 -0700
X-CSE-ConnectionGUID: Tfd8ltRoRTGa34Cj1TK4Nw==
X-CSE-MsgGUID: rs14uKSOSPOJLpNsPMDojg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,210,1712646000"; 
   d="scan'208";a="59962398"
Received: from fpallare-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.245.158])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2024 00:25:19 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com
Subject: [PATCH] ASoC: SOF: Intel: pci-tgl: Align ADL-N sof_dev_desc struct name to convention
Date: Mon,  3 Jun 2024 10:25:44 +0300
Message-ID: <20240603072544.5215-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow the convention already in use by other platforms on naming the
sof_dev_desc struct by dropping the underscore between adl and n

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/pci-tgl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sof/intel/pci-tgl.c b/sound/soc/sof/intel/pci-tgl.c
index ebe1a7d16689..01db2e720b44 100644
--- a/sound/soc/sof/intel/pci-tgl.c
+++ b/sound/soc/sof/intel/pci-tgl.c
@@ -183,7 +183,7 @@ static const struct sof_dev_desc adl_desc = {
 	.ops_free = hda_ops_free,
 };
 
-static const struct sof_dev_desc adl_n_desc = {
+static const struct sof_dev_desc adln_desc = {
 	.machines               = snd_soc_acpi_intel_adl_machines,
 	.alt_machines           = snd_soc_acpi_intel_adl_sdw_machines,
 	.use_acpi_target_states = true,
@@ -298,7 +298,7 @@ static const struct pci_device_id sof_pci_ids[] = {
 	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_PX, &adl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_M, &rpl_desc) },
 	{ PCI_DEVICE_DATA(INTEL, HDA_RPL_PX, &rpl_desc) },
-	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_N, &adl_n_desc) },
+	{ PCI_DEVICE_DATA(INTEL, HDA_ADL_N, &adln_desc) },
 	{ 0, }
 };
 MODULE_DEVICE_TABLE(pci, sof_pci_ids);
-- 
2.45.1

