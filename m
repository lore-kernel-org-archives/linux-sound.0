Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D66B3D0D5
	for <linux-sound@vger.kernel.org>; Thu, 11 Apr 2024 22:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712873058; cv=none; b=dWvysAmA/Bvz1i4bU4YM3rc2CdC/SvFLvKGmGDP3F/VytV5nDURvZ0EDGUaKplNTPDifzfquVgM+MjeqryHS83k6srI1E1PG26c0u3Evzd+xohL9K1XdEWTpFw66uNU7f2LyckJZSI5abeA8GV21Ym8glkWQHTni0cKopOv0jJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712873058; c=relaxed/simple;
	bh=4ICqNi7vqhb2xGHusmpS/YlxcDHMkVyEnauN1AgKMlI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SWEcst2JTC64O4xkYZz0YhY1M9/+CvE4L95+oXyqbkO8WKUXvWT+Dy9tNGhonfQFQyAyq2vuYezdIwzG7mkTe6u3qW1t2svJMi4LDStH17Aa2yVaGTFqXJpCmhipZlyOu4idpVA3iLyeHFVzXYO5Y3ot1rKN43dHw5J/LnZXfgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UUitF/Ir; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UUitF/Ir"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712873057; x=1744409057;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4ICqNi7vqhb2xGHusmpS/YlxcDHMkVyEnauN1AgKMlI=;
  b=UUitF/IrXsNbmzh+5hXy+8zzhNjcDTJR5Xwx+Q3dXbZ4rh6wAlV2eYot
   Nq2t8G5a+Vd9hsCLR8eOSDAbyoST/qxrHqhhzoHlzMloepJKEnVtx21mD
   836QcVqv4iwTvFMqYIWYjYfmb7ORWLGOnl3BnzCLBQK5czpA79G9dUSyS
   40/grZ0JKhW22egy4fW8umtoJPAYvr7/FoV8icszAAfzki5y8Q8I0fxkg
   lEB/gr98tWk0qySAldZT2GBTO3tT1LCw9AfB7bpO8Xi335B3cczG39cc+
   SGO7yoOLG0k/aSSQxJB2tA7t1D/2tjxELnjD6rD/Faaioxn3Civ62C4Gs
   A==;
X-CSE-ConnectionGUID: q3IOzbiPQbO5PoiXys39zA==
X-CSE-MsgGUID: qpS6KFKUT8y1gh13YV079g==
X-IronPort-AV: E=McAfee;i="6600,9927,11041"; a="19708361"
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="19708361"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:16 -0700
X-CSE-ConnectionGUID: YC/usQsZQ3aFUwko6ZlbQg==
X-CSE-MsgGUID: jsEjuBeCSaWcZHSqjiDOnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,194,1708416000"; 
   d="scan'208";a="21628746"
Received: from aramana1-mobl.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.213.177.233])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 15:04:16 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 06/12] ASoC: Intel: sof_da7219: mach cleanup for adl boards
Date: Thu, 11 Apr 2024 17:03:41 -0500
Message-Id: <20240411220347.131267-7-pierre-louis.bossart@linux.intel.com>
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
with/without speaker amplifier. All other adl_da7219_def entries
become redundant so get removed.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 .../intel/common/soc-acpi-intel-adl-match.c   | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 1ea2d9c582ee..4167b2e9bc6a 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -453,11 +453,6 @@ static const struct snd_soc_acpi_codecs adl_max98357a_amp = {
 	.codecs = {"MX98357A"}
 };
 
-static const struct snd_soc_acpi_codecs adl_max98360a_amp = {
-	.num_codecs = 1,
-	.codecs = {"MX98360A"}
-};
-
 static const struct snd_soc_acpi_codecs adl_rt5682_rt5682s_hp = {
 	.num_codecs = 2,
 	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
@@ -510,13 +505,6 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
 					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
 	},
-	{
-		.id = "DLGS7219",
-		.drv_name = "adl_da7219_def",
-		.machine_quirk = snd_soc_acpi_codec_list,
-		.quirk_data = &adl_max98360a_amp,
-		.sof_tplg_filename = "sof-adl-max98360a-da7219.tplg",
-	},
 	/* place boards for each headphone codec: sof driver will complete the
 	 * tplg name and machine driver will detect the amp type
 	 */
@@ -527,6 +515,13 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
 					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
 	},
+	{
+		.id = DA7219_ACPI_HID,
+		.drv_name = "adl_da7219_def",
+		.sof_tplg_filename = "sof-adl", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
+					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
+	},
 	{
 		.id = NAU8825_ACPI_HID,
 		.drv_name = "adl_nau8825_def",
-- 
2.40.1

