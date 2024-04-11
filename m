Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3C83D3B1
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 22:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712873058; cv=none; b=ozucMnTf24qI39gva7xBKGGMqAFtUhgnoXMoHKZBhiqR9nNkCL6SYHsQ1GKeoDoq+5h9fAbGhF4cKmmY+nbO4H6Xng6nekHI4fuksiv56NvFBhqY9N6gF8NTBH8p6pQUQugotIRbExlNxVQlvAKIT8UPgcmQD/CR3KXHrJSSocg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712873058; c=relaxed/simple;
	bh=F/gI6jdQzZTY4a2T3I8ooQcwxQGn2NnW7MR76QFt71Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ojIfpKizsDy8T7x4LxRdzDVEGw0mm1DdnvuuO5y/Qzod20B9tuMCm3Jssq0DHM/kfDuLGxBFYj5iAABLUlnFypw+74IKfpAX7udBPO+mA0DOxbX7KEJJTlU4KkieMisI8gDBRNVEvI+6m9O+HLGr9huCMibwz4uYowXgc+OQ17U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6sz/pl/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6sz/pl/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873057; x=1744409057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=F/gI6jdQzZTY4a2T3I8ooQcwxQGn2NnW7MR76QFt71Q=;
  b=X6sz/pl/+eCXE58QC3pMRk7OfXCaseDeyn+fbFc+xrZVoWRo4yuHdT5V
   3O1R0HkKaCVJ2pvkZBA8F6eozk6uEjb8FKlE9XfpP+aWCl+KcuvRZ+pPL
   gPvhFGt8g1fa8u6vYsqEEyeK9254oxwl/uexizMy7ukju0OS+njGdvwY4
   cgnjT7SXgzM8eJK/EdpLtgtPGzk7jwZTY0p8qv3g8prpJOPkNhB78+OX+
   AbniNAXxWRGnkObaCNZcbJ4AiCUoS3Rfmis6UWJE2/hR6gBP8lESD4oTz
   u5ruY+/MLJhg+tlIEEHNBVfP1sleet0vpTCM+WpwTh4RIYzUyYKeh3Tgk
   Q==;
X-CSE-ConnectionGUID: qKIIGo3yRXmKhDqQPp5pyA==
X-CSE-MsgGUID: jqUnvpl3Tz+cnBN7OTwrXA==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708366"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="19708366"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:17 -0700
X-CSE-ConnectionGUID: qF4ih7T4RmeRJ90B7sAcQQ==
X-CSE-MsgGUID: h3D/k9HmR4i7wmMHkPQDAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21628751"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:17 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/12] ASoC: Intel: sof_da7219: mach cleanup for rpl boards
Date: Thu, 11 Apr 2024 17:03:42 -0500
Message-Id: <20240411220347.131267-8-pierre-louis.bossart@linux.intel.com>
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

From: Brent Lu <brent.lu@intel.com>

Add a common entry in enumeration table for all da7219 boards
with/without speaker amplifier. All other rpl_da7219_def entries
become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-rpl-match.c   | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 34588db6138a..b0a49e28ab09 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -361,11 +361,6 @@ static const struct snd_soc_acpi_codecs rpl_max98357a_amp = {
 	.codecs = {"MX98357A"}
 };
 
-static const struct snd_soc_acpi_codecs rpl_max98360a_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98360A"},
-};
-
 static const struct snd_soc_acpi_codecs rpl_lt6911_hdmi = {
 	.num_codecs = 1,
 	.codecs = {"INTC10B0"}
@@ -411,6 +406,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
 					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
 	},
+	{
+		.id = DA7219_ACPI_HID,
+		.drv_name = "rpl_da7219_def",
+		.sof_tplg_filename = "sof-rpl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	{
 		.id = NAU8825_ACPI_HID,
 		.drv_name = "rpl_nau8825_def",
@@ -438,13 +440,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.drv_name = "rpl_lt6911_hdmi_ssp",
 		.sof_tplg_filename = "sof-rpl-nocodec-hdmi-ssp02.tplg"
 	},
-	{
-		.id = "DLGS7219",
-		.drv_name = "rpl_da7219_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &rpl_max98360a_amp,
-		.sof_tplg_filename = "sof-rpl-max98360a-da7219.tplg",
-	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
-- 
2.40.1

