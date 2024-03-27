Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C651304AD
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556677; cv=none; b=K+GWKFauOnND1rEmCgpJ0InMGykm6klWfADQFO/tNDJW0qNOwmVRJHRPlMCmeArRYvs2yd/UsTjKEr3SYep8qRIyJF9EMbS8WjQpo1L7qKHgNBXfWYuCJKIcnl1I+YvM9Py/mCJnCKbMHOGYwvivsz+Oy8RuiwQrHA8Sq5tAwLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556677; c=relaxed/simple;
	bh=kBjilh3lBSecefNieVDjy8yvJNKSl/RKrX7Hlh67ag8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iX/IZzueU6nhTt6q3IVS6HsT1xnkwhzK1pfAvlB/0nUXPDX+5Hz0n7EZqL4oMhMyQKBlgPqKWFLD+JxXG4NsaZfzPRaLMal3JgF7CYU6T21S7ncX/KdWyiNlybdH1igj1wumzC2uifgT8xDmGl7pQAzP+MHaQ7Tzlc48JGq7tWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=To/MZ3Dm; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="To/MZ3Dm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556677; x=1743092677;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kBjilh3lBSecefNieVDjy8yvJNKSl/RKrX7Hlh67ag8=;
  b=To/MZ3DmuOozRKuXOFS6u3Hc7+aedJCV1sbyTH+Oi+K1GAoGA2UiZzO4
   FThyqjEaKn5eCGepBgZ7iBtJ0Eh4H9SRNOGzzPEJQl6wRmBWHKlXPkrc0
   UHxQ8U0O0/4yusYat8kjE3HPdnX+krjU8FmnZwZRFYH7Q6LdWacH9ZFoH
   ahvKbhQb1vhhhGkMgLzzHIjzVKmstQg5WegPbrXhDsiY8fuN6LD7g6xrG
   LjYFPg/4RuiW/+DFNVa0YWdrn3mazxfx2W6JIlzqlTm3SZzAN39g+jl3f
   mqbcGtBc8/WRZ1/4oZys23oh/6qf6qyFJL3SIAuuCd5pO7uQrBVVId6BH
   w==;
X-CSE-ConnectionGUID: LuqFqkFJSc2+cI3BmzqPHw==
X-CSE-MsgGUID: QmAERnvmTUmzDnNmplHR5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221551"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221551"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821319"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:34 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 13/18] ASoC: Intel: sof_rt5682: mach cleanup for rpl boards
Date: Wed, 27 Mar 2024 11:24:03 -0500
Message-Id: <20240327162408.63953-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
References: <20240327162408.63953-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add two common entries in enumeration table for all rt5682/rt5650
boards with/without speaker amplifier. All other rpl_rt5682_def
entries become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-rpl-match.c   | 40 +++++++------------
 1 file changed, 15 insertions(+), 25 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
index 44be9077b4e0..e28a21667780 100644
--- a/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-rpl-match.c
@@ -348,7 +348,7 @@ static const struct snd_soc_acpi_link_adr rplp_crb[] = {
 
 static const struct snd_soc_acpi_codecs rpl_rt5682_hp = {
 	.num_codecs = 2,
-	.codecs = {"10EC5682", "RTL5682"},
+	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
 };
 
 static const struct snd_soc_acpi_codecs rpl_essx_83x6 = {
@@ -371,11 +371,6 @@ static const struct snd_soc_acpi_codecs rpl_lt6911_hdmi = {
 	.codecs = {"INTC10B0"}
 };
 
-static const struct snd_soc_acpi_codecs rpl_rt1019p_amp = {
-	.num_codecs = 1,
-	.codecs = {"RTL1019"}
-};
-
 struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 	{
 		.comp_ids = &rpl_rt5682_hp,
@@ -384,20 +379,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.quirk_data = &rpl_max98357a_amp,
 		.sof_tplg_filename = "sof-rpl-max98357a-rt5682.tplg",
 	},
-	{
-		.comp_ids = &rpl_rt5682_hp,
-		.drv_name = "rpl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &rpl_max98360a_amp,
-		.sof_tplg_filename = "sof-rpl-max98360a-rt5682.tplg",
-	},
-	{
-		.comp_ids = &rpl_rt5682_hp,
-		.drv_name = "rpl_rt5682_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &rpl_rt1019p_amp,
-		.sof_tplg_filename = "sof-rpl-rt1019-rt5682.tplg",
-	},
 	{
 		.comp_ids = &rpl_rt5682_hp,
 		.drv_name = "rpl_rt5682_c1_h02",
@@ -430,6 +411,20 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
 					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
 	},
+	{
+		.id = RT5650_ACPI_HID,
+		.drv_name = "rpl_rt5682_def",
+		.sof_tplg_filename = "sof-rpl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
+	{
+		.comp_ids = &rpl_rt5682_hp,
+		.drv_name = "rpl_rt5682_def",
+		.sof_tplg_filename = "sof-rpl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	/* place amp-only boards in the end of table */
 	{
 		.id = "INTC10B0",
@@ -443,11 +438,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_rpl_machines[] = {
 		.quirk_data = &rpl_max98360a_amp,
 		.sof_tplg_filename = "sof-rpl-max98360a-da7219.tplg",
 	},
-	{
-		.id = "10EC5650",
-		.drv_name = "rpl_rt5682_def",
-		.sof_tplg_filename = "sof-rpl-rt5650.tplg",
-	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_rpl_machines);
-- 
2.40.1

