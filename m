Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83761131734
	for <linux-sound@vger.kernel.org>; Wed, 27 Mar 2024 16:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711556678; cv=none; b=KwCsV6V4oBDpk05Kl3xZAvBYGwe77RrbszABazG/Q9QVrvuowBoE/TbjuBIYQAMrgxsq7Lep9BYYkIebbIVsDjQvMIrYXVNAhO3iQLDcVLXFbrCYbMNwh9EG45GrrH540qgsGsPBoiKzucooMV6bSXURHdiYLAZ525NqKKEzMaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711556678; c=relaxed/simple;
	bh=k4DX4gn64X3zpa0wG4xldGenu8XVSNu55Cuza/XVQds=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BXmcBhxG96CFEeMaNqQrekvNdLNGSA676It/W8AhZsZulSz1sWeZelsosrFQwPCtAy1u+nqthGzQKayAp/otahHUunvLMlebNyo23X6BFYsxsfvwQl7+HAwKOqcLcBbOdE27wXNqPYDtkZ/tkEZQxrlaT3XYHuVUVpjORydnN1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihKSpGnl; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihKSpGnl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711556678; x=1743092678;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=k4DX4gn64X3zpa0wG4xldGenu8XVSNu55Cuza/XVQds=;
  b=ihKSpGnlo9fBef0L1AlWLyFz9YMHx2sMrwjHKwazeeprnF9nqdsC8YXb
   4TRG+ql5JHfRcLxxZ+Iz5aQOwnfuMl1+aoS4zpHsIN4EhSs4Az7PwuE9a
   TKvw4Ifss6X58Bve68LoN1z4Mlb8vzoH6B+l4odn/A3bvwZePA5VSa2u0
   Zr2NeHjtc/PF1ORV6tjOTmdbx21/gzHibGkrsuJ9Y8/8RRbLYrCeFERwG
   6fewaLNAT0VCNB6QkneU7MBgiSw8T9875Rw5PUTA7zoodDFs4aSYgeB4W
   bZ4gKCPWhuf5Zwfz+F11P9YGHOZpYRJKXHoqV9VaHQo+WS2IiP+oGU+yj
   w==;
X-CSE-ConnectionGUID: PaXeokuuS2y3isqkk4LF3Q==
X-CSE-MsgGUID: rDQYUfB3RDWdNCv0OlohIw==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="17221571"
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="17221571"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,159,1708416000"; 
   d="scan'208";a="53821345"
Received: from ssherman-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.117.1])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2024 09:24:37 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 16/18] ASoC: Intel: sof_cs42l42: mach cleanup for adl boards
Date: Wed, 27 Mar 2024 11:24:06 -0500
Message-Id: <20240327162408.63953-17-pierre-louis.bossart@linux.intel.com>
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

Add a common entry in enumeration table for all cs42l42 boards
with/without speaker amplifier. All other adl_cs42l42_def entries
become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 7977a6fb9a5c..1ea2d9c582ee 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -495,13 +495,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.quirk_data = &adl_lt6911_hdmi,
 		.sof_tplg_filename = "sof-adl-rt5682-ssp1-hdmi-ssp02.tplg",
 	},
-	{
-		.id = "10134242",
-		.drv_name = "adl_cs42l42_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_max98360a_amp,
-		.sof_tplg_filename = "sof-adl-max98360a-cs42l42.tplg",
-	},
 	{
 		.comp_ids = &essx_83x6,
 		.drv_name = "adl_es83x6_c1_h02",
@@ -527,6 +520,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	/* place boards for each headphone codec: sof driver will complete the
 	 * tplg name and machine driver will detect the amp type
 	 */
+	{
+		.id = CS42L42_ACPI_HID,
+		.drv_name = "adl_cs42l42_def",
+		.sof_tplg_filename = "sof-adl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	{
 		.id = NAU8825_ACPI_HID,
 		.drv_name = "adl_nau8825_def",
-- 
2.40.1

