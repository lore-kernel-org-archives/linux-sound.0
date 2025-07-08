Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A706A29ACE6
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 08:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961650; cv=none; b=TohhhYc+MzB1zuf6/lDp06AyTj57v9i1x/kfMC3/gTbHD8rKN7Xb6eoawPBHh6OvGLOB+A33+KUC71JOVpNwFwcnuNeks/4kqpybg8yTRAQW/z2UpP100rmP1m2CLf02ts+I4szINXDvKURjZXliryoT/rXHZKuYbjFQbGszLhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961650; c=relaxed/simple;
	bh=GuBO8CEb+p9rEYmjkhKO2dpgHHERWfEyCGPlxgiW3Hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qT2kEYnP1qBw/GjJD+7UvuCvvqkR+5vqNN5cPpdGAd0A6mjGJ0F5A37JU7x+R/h/XYYggO0vvGyXt7us+pv7a8iQLVrWvu7c9AaAMRXvitd70pbk3tRu2LufCPPqQKUqt4DtbJQ+4XMfE64uG/hhTBlVkNlrKasOUybime0Qs2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SgOjUFgW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SgOjUFgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751961649; x=1783497649;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GuBO8CEb+p9rEYmjkhKO2dpgHHERWfEyCGPlxgiW3Hk=;
  b=SgOjUFgWUHoNJkVYO0hxF1PO3jJA1MrbdE2MhoAhJjxp7/ng3LxxE6ep
   Ga7fwRPV0M4nck540YR2FBCEYCFrE9VCcR9I81dkH7cqNwxmNd9fraj64
   x6FCu3RE92MmZOrDfuwfTpvyuw6bceU64qIhA3+nx95DA32zd90OWsxtX
   T2D6k/dLJ3B/9LtJgc31jRDIs5k7lpPcOajHQqTyQ6AEzmRp1MZsCLa86
   N0Ro52XLYZHLZi5BepsPw39ZNnz8oYlP3yONJbKlr3vKa10DIEowIBFxk
   UkCXVsyI4P/LfQCnLUf/4D/CsjGhm0ME79agzkTW1y3tfS6mej/Bn0tAV
   w==;
X-CSE-ConnectionGUID: lZG2LNZ9S/a0Qz/22Hl5pA==
X-CSE-MsgGUID: NG7Hx+BaTwqmn6iSxCLixQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65542041"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="65542041"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:00:48 -0700
X-CSE-ConnectionGUID: hs894fGCRiCvCXenE8WQJQ==
X-CSE-MsgGUID: OR72AJM2RmC1yQflvmw2Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="154832127"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:00:46 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 4/4] ASoC: Intel: soc-acpi-intel-lnl-match: add rt1320_l12_rt714_l0 support
Date: Tue,  8 Jul 2025 16:00:29 +0800
Message-ID: <20250708080030.1257790-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708080030.1257790-1-yung-chuan.liao@linux.intel.com>
References: <20250708080030.1257790-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mac Chiang <mac.chiang@intel.com>

This patch add acpi matching support for the rt1320 left and right
amplifiers on soundwire link 1 and 2, and the rt714 dmic on
soundwire link 0.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-lnl-match.c   | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index 558dc4c91239..937a74a5d523 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -419,6 +419,15 @@ static const struct snd_soc_acpi_adr_device rt1320_1_group1_adr[] = {
 	}
 };
 
+static const struct snd_soc_acpi_adr_device rt1320_2_group2_adr[] = {
+	{
+		.adr = 0x000231025D132001ull,
+		.num_endpoints = 1,
+		.endpoints = &spk_r_endpoint,
+		.name_prefix = "rt1320-2"
+	}
+};
+
 static const struct snd_soc_acpi_adr_device rt1320_1_group2_adr[] = {
 	{
 		.adr = 0x000130025D132001ull,
@@ -609,6 +618,25 @@ static const struct snd_soc_acpi_link_adr lnl_sdw_rt1318_l12_rt714_l0[] = {
 	{}
 };
 
+static const struct snd_soc_acpi_link_adr lnl_sdw_rt1320_l12_rt714_l0[] = {
+	{
+		.mask = BIT(1),
+		.num_adr = ARRAY_SIZE(rt1320_1_group2_adr),
+		.adr_d = rt1320_1_group2_adr,
+	},
+	{
+		.mask = BIT(2),
+		.num_adr = ARRAY_SIZE(rt1320_2_group2_adr),
+		.adr_d = rt1320_2_group2_adr,
+	},
+	{
+		.mask = BIT(0),
+		.num_adr = ARRAY_SIZE(rt714_0_adr),
+		.adr_d = rt714_0_adr,
+	},
+	{}
+};
+
 static const struct snd_soc_acpi_link_adr lnl_sdw_rt713_l0_rt1318_l1[] = {
 	{
 		.mask = BIT(0),
@@ -740,6 +768,12 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_lnl_sdw_machines[] = {
 		.drv_name = "sof_sdw",
 		.sof_tplg_filename = "sof-lnl-rt1318-l12-rt714-l0.tplg"
 	},
+	{
+		.link_mask = GENMASK(2, 0),
+		.links = lnl_sdw_rt1320_l12_rt714_l0,
+		.drv_name = "sof_sdw",
+		.sof_tplg_filename = "sof-lnl-rt1320-l12-rt714-l0.tplg"
+	},
 	{
 		.link_mask = BIT(0) | BIT(1),
 		.links = lnl_sdw_rt713_l0_rt1318_l1,
-- 
2.43.0

