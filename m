Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2C73B798
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 22:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712873055; cv=none; b=FUpDPkYTlXjT/2kwZi/5WcTRhxvIEkWN8aLgMeUQ18vy52Ki77RQo5AIDn1E79KCjYSCwbsxaUCiZvLeikGBCKiP+0mJH84wcHVbH8e7gZ8j5209fvMTBiYUf3GiQ4VnVXgogxsVvjblNwuf9Je5Mdmb+UIAbruffOnG6OkNndE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712873055; c=relaxed/simple;
	bh=Kbiv77vxQq3VJjGZ7RvYiy7zJq+A+aZfJkXlW/grBDc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Rb0GYoRyekXTqItZcp3VemwNNRAmOarSFAC9nAXVq+1lMan5dkPUIBtrQhcRhHYtK5trv/zyAneWHQzJgfWUJoe16T7onxn7OtepF+pU02gZrT9QqoMkHaprw5DSUjoyrp/7T05YU37DbZ9McTxSYOQiF/XKrpv6hPEM1AxhXNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=StEVZIPH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="StEVZIPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873054; x=1744409054;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Kbiv77vxQq3VJjGZ7RvYiy7zJq+A+aZfJkXlW/grBDc=;
  b=StEVZIPHHyKCUfGA/lV8GfPoP4duVnv5DgNDEF/2+GVx410IGvDcCUFb
   Gf1QK2UDxNfpTWIgwVONVlWG1D8y8TmmpD9bbht3nC/EC0CCm1cN33pn+
   Xpiy3UuSJOXouRyg7Le6hPpF1pHyeoaa/yuT0c9s1dZM27H0Uzieimg9m
   kUOIskVnUl0dFXK5T0xBS6HXMaZZO5AG8IoOM9DGJz4tJ0PoOeTeLbDVf
   Bq3hqgyTjF+gmF40m7pRMSKLlp81r3k8s/3Ydw367pN6e0t41om75y3kx
   cm7Kd+P8X2PsQHWUF5NIHRVcllbNAwnFreXohG1RjBH42jelKdjTKnvkw
   g==;
X-CSE-ConnectionGUID: bjKdd8VjRkmJuAhNvJJdKg==
X-CSE-MsgGUID: aPk178OmQYmShSYlGO44oA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708341"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="19708341"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:13 -0700
X-CSE-ConnectionGUID: n0ovwgHsTQKoQzRwtPERSQ==
X-CSE-MsgGUID: iX8eRg2NTPW/XSnD8RtMfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21628715"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 02/12] ASoC: Intel: soc-acpi: add support for HP Omen14 SoundWire configuration
Date: Thu, 11 Apr 2024 17:03:37 -0500
Message-Id: <20240411220347.131267-3-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
References: <20240411220347.131267-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This platform has an RT711-sdca on link0 and RT1316 on link3

Closes: https://github.com/thesofproject/linux/issues/4880
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-mtl-match.c   | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
index 75935b454e5d..264f5c19af56 100644
--- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
@@ -296,6 +296,15 @@ static const struct snd_soc_acpi_adr_device rt1316_2_group2_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1316_3_single_adr[] = {
+	{
+		.adr = 0x000330025D131601ull,
+		.num_endpoints = 1,
+		.endpoints = &single_endpoint,
+		.name_prefix = "rt1316-1"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1318_1_group1_adr[] = {
 	{
 		.adr = 0x000130025D131801ull,
@@ -562,6 +571,20 @@ static const struct snd_soc_acpi_link_adr mtl_rt713_l0_rt1316_l12[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr mtl_rt711_l0_rt1316_l3[] = {
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt711_sdca_0_adr),
+		.adr_d = rt711_sdca_0_adr,
+	},
+	{
+		.mask = BIT(3),
+		.num_adr = ARRAY_SIZE(rt1316_3_single_adr),
+		.adr_d = rt1316_3_single_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_adr_device mx8363_2_adr[] = {
 	{
 		.adr = 0x000230019F836300ull,
@@ -703,6 +726,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_mtl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-mtl-rt711-l0-rt1316-l23-rt714-l1.tplg",
 	},
+	{
+		.link_mask = 0x9, /* 2 active links required */
+		.links = mtl_rt711_l0_rt1316_l3,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-mtl-rt711-l0-rt1316-l3.tplg",
+	},
 	{
 		.link_mask = BIT(0),
 		.links = mtl_rt722_only,
-- 
2.40.1

