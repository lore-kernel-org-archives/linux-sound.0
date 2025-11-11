Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3D854262
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 12:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762864676; cv=none; b=D9mtqQiSTKaxEowjnPAMMeb3higWMe1Y0fjBDpcA57gTZ7WQI8RE7GGDVsFu4I0fcUF3BqN7jW7RQVvnYy+7o8mCP1t5gvIVTONF9ygvLB+qhmUz1RjI+9V8bVBQw4tr9Omx4k1uTrrpRw2uYxQKHuptoUsoEMNOTgRZwmu1AZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762864676; c=relaxed/simple;
	bh=pD55nf89zYZQTZ1EhkG0ubiVhtU0gHWIUe2EAovemBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QSa9weuM3sBNvge7heL7NS2lAeGBUPrlhulXqSmAsIOP/Mx/GfLOWIi+kBqPHALtOW9Bz+bCqyh6TBzRfVu4wq1VlVtwAnBs0a+dI413e5VGwqut3vnV0dhcjbYlBUh0J5qL9iLgAVLDjfqmBoaOtCUhJHdOvqn4A28LDbGzDvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c4BU9gS3; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c4BU9gS3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762864675; x=1794400675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pD55nf89zYZQTZ1EhkG0ubiVhtU0gHWIUe2EAovemBI=;
  b=c4BU9gS3wbQto3ZTFbrKThTIjixSkCoW4oHUwog71U7DbwnyyV0elg/X
   1HG2289MHk08WPdEB8j2PQJp/yUAWWEcVBRABX5l7yJ2kktv/yrW2mMPj
   LkFim35fpCyxkUwjSLNkDUQItF2/qgMSOV8d/L7Is7gnyhIYWuMGrFbpC
   HHX16ZqsrFxuICe/lGo8GcMrjOsKoPphBRAlm9Xcmgtyf5ObPwdY+ULa7
   ZXyFg5Wgb7muu421LFQHEwYD9JVqKIXxOa3rOr2moDkP/Tzc2BGRR12Pm
   y2uMBvO0EEFNywODyGCKWEW9VosNowRTAaXLUXTZHMlO/xUnbtQXuVyq8
   A==;
X-CSE-ConnectionGUID: H5ewS/+NRjqlD4bGHmh6JQ==
X-CSE-MsgGUID: ekxq6966RdqjMpIEdq92dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64129471"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="64129471"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:37:54 -0800
X-CSE-ConnectionGUID: FAQ7myVhQde0KygVxo8DBw==
X-CSE-MsgGUID: MOFSLkDWSxakdzhM4D6NWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; 
   d="scan'208";a="189217533"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 04:37:52 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	bard.liao@intel.com
Subject: [PATCH 1/6] ASoC: Intel: soc-acpi-intel-ptl-match: Add support for rt722_l0_rt1320_l23
Date: Tue, 11 Nov 2025 20:37:32 +0800
Message-ID: <20251111123737.246626-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111123737.246626-1-yung-chuan.liao@linux.intel.com>
References: <20251111123737.246626-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

This patch adds support for the RT722 codec on SoundWire link 0,
and RT1320 left and right amplifiers on links 2 and 3, respectively.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 4853f4f31786..99ff1771248b 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -422,6 +422,15 @@ static const struct snd_soc_acpi_adr_device rt1320_2_group2_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1320_2_group2_l_adr[] = {
+	{
+		.adr = 0x000230025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_l_endpoint,
+		.name_prefix = "rt1320-1"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1320_3_group2_adr[] = {
 	{
 		.adr = 0x000330025D132001ull,
@@ -486,6 +495,25 @@ static const struct snd_soc_acpi_link_adr ptl_rt722_l3[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_rt722_l0_rt1320_l23[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt722_0_single_adr),
+		.adr_d = rt722_0_single_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1320_2_group2_l_adr),
+		.adr_d = rt1320_2_group2_l_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1320_3_group2_adr),
+		.adr_d = rt1320_3_group2_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr ptl_rvp[] = {
 	{
 		.mask = BIT(0),
@@ -624,6 +652,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-ptl-cs42l43-l2-cs35l56x6-l13.tplg",
 	},
+	{
+		.link_mask = BIT(0) | BIT(2) | BIT(3),
+		.links = ptl_rt722_l0_rt1320_l23,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-ptl-rt722-l0-rt1320-l23.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(1) | BIT(2),
 		.links = ptl_sdw_rt712_vb_l2_rt1320_l1,
-- 
2.43.0

