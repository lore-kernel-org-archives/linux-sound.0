Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC88920C476
	for <linux-sound@vger.kernel.org>; Wed,  7 May 2025 06:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599304; cv=none; b=mV1+MyqfYDI+4CTXvlgkZ8ty3xDQzbc7UVIkD5NJxJcFk2KxLUm7DHwUmU24M0y0RU3M9ao2AphKq0kGBRiooPXc3bWx/nnHeRi+87OZecOmNlu3zbagyv/+PI7LlCxoIBSatNU6bgqZXYRFBbhXYT0s8mjvXikU9RvTg6JOHyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599304; c=relaxed/simple;
	bh=0BBXtgG6+DYTpVO/d/U2FQs0TP3wmyb0D0ODwvdy6tQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T5ctGTCs+OLf8yhbu8+Y56pis1WTV9I/6aCPPEmQO1499nJUQ4ockJZJ7o4UVjZlbuALYcXrR6/+TZ+mHHqgdGxSS6Xnaf7MMz8QGn7gSxjni3lhu2ctzHD5asxHkQ/OhNXJCpINsD56P4V/mbCmZ60GV2q2fO5Np7EkTOOZOHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZK2sMv05; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZK2sMv05"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746599302; x=1778135302;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0BBXtgG6+DYTpVO/d/U2FQs0TP3wmyb0D0ODwvdy6tQ=;
  b=ZK2sMv051V3loc5T3g2vkDnPC02sylD50mCMVjBVl2sWfNuiiQmdw0WX
   jhoLaLYigR3rleYxGL3XiLzPxvyO4XkaJ56eE0yHjCdaMx3mmBsxbNxWt
   kvpVuBMf+dwP+j7yQv1elkjzjWO/DE6n6L0jgBh44sLNXoqsZP6vYCLoz
   uE6vell5G1o4R6gXCBJrnk70gdFlCVbqyOBy6VvkGkQI9yMn4rjelI32I
   bZ/hDwEYeHsnwPuVmDddCCWXqGNALGeb1I4P7EHChLdVhz4GaZhQb9s2l
   cjU3e+fG3/wlmUkco08wmutXdvyCsA+hr3gcUZ28FuKu/6u1Zg7NP/QdG
   g==;
X-CSE-ConnectionGUID: jU4SOMWdSx6zBp07jCSftQ==
X-CSE-MsgGUID: IcLYgsTfRpCBwlayuU3+xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47407629"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="47407629"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:28:22 -0700
X-CSE-ConnectionGUID: oVhrGlLcRcuFQuTct7+Osw==
X-CSE-MsgGUID: ji4xZoiTTr6Du3bXjWm8Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135822247"
Received: from uaeoff-desk2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.52])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:28:21 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/2] ASoC: Intel: soc-acpi-intel-lnl/ptl-match: Simplify variable name
Date: Wed,  7 May 2025 14:28:11 +0800
Message-ID: <20250507062812.46401-2-yung-chuan.liao@linux.intel.com>
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

The variable name contains duplications;thus, remove the redundant strings.

Signed-off-by: Mac Chiang <mac.chiang@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-lnl-match.c |  6 +++---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
index a2bee667facb..558dc4c91239 100644
--- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
@@ -137,7 +137,7 @@ static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
 	},
 };
 
-static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints_endpoints[] = {
+static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
 	/* Jack Endpoint */
 	{
 		.num = 0,
@@ -350,8 +350,8 @@ static const struct snd_soc_acpi_adr_device rt1712_3_single_adr[] = {
 static const struct snd_soc_acpi_adr_device rt712_vb_2_group1_adr[] = {
 	{
 		.adr = 0x000230025D071201ull,
-		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints_endpoints),
-		.endpoints = jack_amp_g1_dmic_endpoints_endpoints,
+		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
+		.endpoints = jack_amp_g1_dmic_endpoints,
 		.name_prefix = "rt712"
 	}
 };
diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index 0454de04da68..f9510480d188 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -138,7 +138,7 @@ static const struct snd_soc_acpi_endpoint jack_dmic_endpoints[] = {
 	},
 };
 
-static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints_endpoints[] = {
+static const struct snd_soc_acpi_endpoint jack_amp_g1_dmic_endpoints[] = {
 	/* Jack Endpoint */
 	{
 		.num = 0,
@@ -288,8 +288,8 @@ static const struct snd_soc_acpi_adr_device rt711_sdca_0_adr[] = {
 static const struct snd_soc_acpi_adr_device rt712_vb_2_group1_adr[] = {
 	{
 		.adr = 0x000230025D071201ull,
-		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints_endpoints),
-		.endpoints = jack_amp_g1_dmic_endpoints_endpoints,
+		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
+		.endpoints = jack_amp_g1_dmic_endpoints,
 		.name_prefix = "rt712"
 	}
 };
@@ -297,8 +297,8 @@ static const struct snd_soc_acpi_adr_device rt712_vb_2_group1_adr[] = {
 static const struct snd_soc_acpi_adr_device rt712_vb_3_group1_adr[] = {
 	{
 		.adr = 0x000330025D071201ull,
-		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints_endpoints),
-		.endpoints = jack_amp_g1_dmic_endpoints_endpoints,
+		.num_endpoints = ARRAY_SIZE(jack_amp_g1_dmic_endpoints),
+		.endpoints = jack_amp_g1_dmic_endpoints,
 		.name_prefix = "rt712"
 	}
 };
-- 
2.43.0

