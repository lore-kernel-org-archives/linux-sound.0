Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20095204866
	for <linux-sound@vger.kernel.org>; Wed,  7 May 2025 06:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599305; cv=none; b=K92kmlm/SOfL60u3ZZs5Lot4rB0cIbrnRtTJrsPBQ6151F3ONIz+P5HontZRj9OWkOhu1HItONkj//CFtrzchT19k0BZeMxEkFnqmBH8uU3ny8NVTKl5UwBXm7Ilr7gvXo/DK/mtWKEyFHseUyHxCao/9Ih7cb47ZE0eJsEl6Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599305; c=relaxed/simple;
	bh=3KeCpEJb/c+KH6/y/mpP4kz/1zjus6kxPnm+rR/TY/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AET24kwNkqZFiWVVv9TICIeYwNxEObAteCdnBGm3ky2UpQENxJwHZnpLxzvi6Xph9m1MVJmWQuKNzA5PevkUWDpAu4e+wAJxTqAPImf3QwqGRCW1yv7ib1HCaRTcZb9o9Lli2GnS8Pju7Aqi2BUvylN4x9fpj1faboRazpw48es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AJpEGeDf; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AJpEGeDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746599304; x=1778135304;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3KeCpEJb/c+KH6/y/mpP4kz/1zjus6kxPnm+rR/TY/c=;
  b=AJpEGeDfyxmyYeLuHURScKrklyc81yNxQyfwOObtYLkERSKoeesO+3AB
   DpU8g1IYoYlIty12rNh+rjTrMCrOyBPl7STZgWgcy9538W2Ap2wcbLBCn
   euj18xkoqmRd48qrWwQPrOqRqOBMTgSYWUtMPk0ZW6TJv0tLlUvyjflzg
   XDpHcw3vZ2HVwUT4Pbso7bEdv+lzqKUTxT9aov83XZr3u5ITio6OKat/w
   MmJZ92J5YlrDt7Qr0r1f4BKw+l+KAPPUiVpdHbq/rrLLh03Fd7X0yj46a
   hXvf9FMZYQYB2faSaRC6w1hE7ob6u7EJkQfE+AgMEld0bV5IqMAD9Reec
   w==;
X-CSE-ConnectionGUID: xWdR7Ew5TZ64MO2hDUuCPw==
X-CSE-MsgGUID: JDVbbuukQm6UNFbDzX5VbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47407635"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="47407635"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:28:23 -0700
X-CSE-ConnectionGUID: nBmTEHm9SZiPeV8HtegD6w==
X-CSE-MsgGUID: 7Mn9atqcRx+dudZTSEV/1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135822252"
Received: from uaeoff-desk2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.52])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:28:22 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 2/2] ASoC: Intel: soc-acpi-intel-ptl-match: Add rt713_vb_l3_rt1320_l3 support
Date: Wed,  7 May 2025 14:28:12 +0800
Message-ID: <20250507062812.46401-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507062812.46401-1-yung-chuan.liao@linux.intel.com>
References: <20250507062812.46401-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

This patch adds support for the rt712_vb multi-function codec and
rt1320 amplifier. Both devices are connected via a single Soundwire link 3,
sharing the sdw3-clock, sdw3-data[0] and sdw3-data[1] data lanes
respectively.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-ptl-match.c   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index f9510480d188..93fd7ae7c825 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -321,6 +321,15 @@ static const struct snd_soc_acpi_adr_device rt713_vb_3_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1320_3_group1_adr[] = {
+	{
+		.adr = 0x000330025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1320-1"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt721_3_single_adr[] = {
 	{
 		.adr = 0x000330025d072101ull,
@@ -541,6 +550,20 @@ static const struct snd_soc_acpi_link_adr ptl_sdw_rt712_vb_l3_rt1320_l2[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr ptl_sdw_rt712_vb_l3_rt1320_l3[] = {
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt712_vb_3_group1_adr),
+		.adr_d = rt712_vb_3_group1_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1320_3_group1_adr),
+		.adr_d = rt1320_3_group1_adr,
+	},
+	{}
+};
+
 /* this table is used when there is no I2S codec present */
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 /* Order Priority: mockup > most links > most bit link-mask > alphabetical */
@@ -606,6 +629,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l2.tplg",
 		.get_function_tplg_files = sof_sdw_get_tplg_files,
 	},
+	{
+		.link_mask = BIT(3),
+		.links = ptl_sdw_rt712_vb_l3_rt1320_l3,
+		.drv_name = "sof_sdw",
+		.machine_check = snd_soc_acpi_intel_sdca_is_device_rt712_vb,
+		.sof_tplg_filename = "sof-ptl-rt712-l3-rt1320-l3.tplg",
+		.get_function_tplg_files = sof_sdw_get_tplg_files,
+	},
 	{
 		.link_mask = BIT(0),
 		.links = ptl_rvp,
-- 
2.43.0

