Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623843161A3
	for <linux-sound@vger.kernel.org>; Fri, 12 Dec 2025 10:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765534440; cv=none; b=WfH1UMZPZuNQA5GREM+8Hsx7+ob484ObejP+KlUKfHLDI/9ox/gRCiloKXzm/4EkMqi/vfh4iRADXWo+gveUaysIekodKK9qNPgx1bVmx6TfdWD5u2Itj11uSh8NT47gf8e04R/rHn7fimj7ewWUGclhIgSQ7NyjWxRLK9+D6Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765534440; c=relaxed/simple;
	bh=5s4LLRqz7ubfBtYQsnoHHS5fNR7AlY5PDNyq+fqJhMM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d7TfqrOc30/Q6y1oZPVitVni8KZ+rId/wcCHH7ZjVuNaPcoZSfFyMLwwgFFeJW/R/k78AogVpL3Rijovqi/Aj7L7/Ru6FkyW7v2avd2rhH+8QlbDTwf1M2VJotcq/cTQUvKCLsdN0Vwl49+Zr8+IjVqF/7B4WR/H4jhDFUONinM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GIRIaA+s; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GIRIaA+s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765534439; x=1797070439;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5s4LLRqz7ubfBtYQsnoHHS5fNR7AlY5PDNyq+fqJhMM=;
  b=GIRIaA+shUaxehEkPxFDQIOXakHjf4lWtMXmrf/qPA3T8Q/2apVeNsu9
   DPI2PYZ5TaXxOUMxEa/7Ev+kpna9hx3V0ukThmvuQ8raVQpNe7YpBZ06D
   Z1SkoQZ/HT0zMSlbaQZepKgHFM6PtUHFLkw2vLQhIOX51RUlTgxTrOdQO
   YZGBnUgxCycUiZH4wPmPBDAo76XZ4acKGxihj89LYdCy7f8g4VjBO5jZ0
   sZ7V5ckIEQhhuv5bNwjH9JilkWfEKOu/hu84T3P6LLxRFCxtmTXDXrZoE
   dfM/x/hniflG9bOuY4uHckDV8sn1F4ISFoU9Zy3tEmodELl1y9+sFxItc
   w==;
X-CSE-ConnectionGUID: 4lEs8swYRbioEIgdros3LQ==
X-CSE-MsgGUID: GSV0b5osT1KqixQ08YSLMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78891344"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="78891344"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 02:13:58 -0800
X-CSE-ConnectionGUID: qWMbWeZDS7qU7gNHJOC/Ww==
X-CSE-MsgGUID: 43Iel4nnTr61uNc0GRPaXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="234444930"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 02:13:57 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amade@asmblr.net,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 4/5] ASoC: Intel: catpt: Specify image names in the device descriptor
Date: Fri, 12 Dec 2025 11:38:57 +0100
Message-Id: <20251212103858.110701-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251212103858.110701-1-cezary.rojewski@intel.com>
References: <20251212103858.110701-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

State files to load explicitly in the device descriptor instead of
hiding the details within a loading function. Apart from readability,
this also reduces the catpt module size slightly.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/catpt/core.h   | 1 +
 sound/soc/intel/catpt/device.c | 2 ++
 sound/soc/intel/catpt/loader.c | 6 +-----
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/catpt/core.h b/sound/soc/intel/catpt/core.h
index d273f24d3d53..df8a5fd95e13 100644
--- a/sound/soc/intel/catpt/core.h
+++ b/sound/soc/intel/catpt/core.h
@@ -62,6 +62,7 @@ struct catpt_module_type {
 struct catpt_spec {
 	struct snd_soc_acpi_mach *machines;
 	u8 core_id;
+	const char *fw_name;
 	u32 host_dram_offset;
 	u32 host_iram_offset;
 	u32 host_shim_offset;
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index d8e0da558495..0638aecba40d 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -348,6 +348,7 @@ static struct snd_soc_acpi_mach wpt_machines[] = {
 static struct catpt_spec lpt_desc = {
 	.machines = lpt_machines,
 	.core_id = 0x01,
+	.fw_name = "intel/IntcSST1.bin",
 	.host_dram_offset = 0x000000,
 	.host_iram_offset = 0x080000,
 	.host_shim_offset = 0x0E7000,
@@ -363,6 +364,7 @@ static struct catpt_spec lpt_desc = {
 static struct catpt_spec wpt_desc = {
 	.machines = wpt_machines,
 	.core_id = 0x02,
+	.fw_name = "intel/IntcSST2.bin",
 	.host_dram_offset = 0x000000,
 	.host_iram_offset = 0x0A0000,
 	.host_shim_offset = 0x0FB000,
diff --git a/sound/soc/intel/catpt/loader.c b/sound/soc/intel/catpt/loader.c
index 566b6e04a848..05c50a6728f6 100644
--- a/sound/soc/intel/catpt/loader.c
+++ b/sound/soc/intel/catpt/loader.c
@@ -581,10 +581,6 @@ static int catpt_load_image(struct catpt_dev *cdev, struct dma_chan *chan,
 
 static int catpt_load_images(struct catpt_dev *cdev, bool restore)
 {
-	static const char *const names[] = {
-		"intel/IntcSST1.bin",
-		"intel/IntcSST2.bin",
-	};
 	struct dma_chan *chan;
 	int ret;
 
@@ -592,7 +588,7 @@ static int catpt_load_images(struct catpt_dev *cdev, bool restore)
 	if (IS_ERR(chan))
 		return PTR_ERR(chan);
 
-	ret = catpt_load_image(cdev, chan, names[cdev->spec->core_id - 1],
+	ret = catpt_load_image(cdev, chan, cdev->spec->fw_name,
 			       FW_SIGNATURE, restore);
 	if (ret)
 		goto release_dma_chan;
-- 
2.25.1

