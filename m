Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BD14B1E45
	for <linux-sound@vger.kernel.org>; Wed,  7 May 2025 12:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746620824; cv=none; b=QkzLzX53uxfcAMNNXhrHN2+2X4wR+HlsNyoBuG3Y1l74SnwPmdsFlnlCuw1QP3DxyBOjKA4lmiYnqJwEOHMaS0bqKW0WiXOq8qsMCaUNXhlWRvRdrN7pMR1VdOUsc8quVzv+xhkOHGjdkg98qwxjH393CUbdaaw9nlG5fv0gDYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746620824; c=relaxed/simple;
	bh=TZVxMavhXcYF4NADrUm9yux3uTNaykfOnfu6wqsezJI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qH72qbleMd5jtQKIReaQs+xdMUY5GgYJm8X4Sfyy37Z4kAUPTkiKUIPOcrQJmmddQO2vix6W/7Ypk0rxebO/QHEvSyAEH78IplFs+qDDsEwG/RwVf9S4guQ6h5rQOpB1jkew416U4fepSsGqXHSJWKOtNcN2OtWjIUhTUsxrzcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMhQiX09; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMhQiX09"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746620823; x=1778156823;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TZVxMavhXcYF4NADrUm9yux3uTNaykfOnfu6wqsezJI=;
  b=fMhQiX09hcwAkWTVvxToDOMyhTDCW34UqLOsUgVFTxwBgDeclZPxm7KY
   aLiWVU+DPBaC30yYJlFFqUvPhvQk7g1ASKa/wg3iCuNDhDInsukj46ny0
   011PKlyAzWh3wGQIjwF6iISP7jE0J0WBABw2MwgnbE5hRgc4JYhtW4yjq
   wPK58C1LGkAACWkHxa61ud1ry3c80WJMRn8gWbwmNE9vC2jP7g4IByKzj
   aEjOl/7zNJMm7keMY0TPTt19it9ReSdgRQmqHeQ/MqZwORKYPy3QFG9/V
   lGB3hXUu8yyimhxG4PwLUUfNBKLmA7ISxzki4JTE1ptbcEQHtLWrPKqXo
   Q==;
X-CSE-ConnectionGUID: 7Nzek1D0ROOMPCxIX4oxWw==
X-CSE-MsgGUID: 813c1TTTSoC+7RGVXNBTMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="65757080"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="65757080"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:27:03 -0700
X-CSE-ConnectionGUID: tavF+yhGQguscGieaINUPA==
X-CSE-MsgGUID: C2Vg08pOTfSK/jydOwHnLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="173131951"
Received: from hcaldwel-desk1.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.222.75])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 05:27:01 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH v2 2/2] ASoC: Intel: soc-acpi-intel-ptl-match: Add rt713_vb_l3_rt1320_l3 support
Date: Wed,  7 May 2025 20:26:49 +0800
Message-ID: <20250507122649.153579-3-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507122649.153579-1-yung-chuan.liao@linux.intel.com>
References: <20250507122649.153579-1-yung-chuan.liao@linux.intel.com>
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
index f9510480d188..eae75f3f0fa4 100644
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
@@ -633,6 +656,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_sdw_machines[] = {
 		.sof_tplg_filename = "sof-ptl-cs42l43-l3.tplg",
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
 		.link_mask = BIT(3),
 		.links = ptl_rt721_l3,
-- 
2.43.0

