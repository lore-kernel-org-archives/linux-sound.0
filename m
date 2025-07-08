Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A7010A1F
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 08:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751961645; cv=none; b=OJStOhnk28p8zq887+oYHc/hyB7dcgsFZPPXg+WXj04m1i6mRXFPd71NhT7ND3Kk2Dl3jnDB/Qz3EKIq3NsxQWTX0xfMS7pFzvjmk9WCrYAIs1mqWCG0/Tm3SUiTPdwpvRjpUyQ2QStiGbuMNVJTXttd9WpWiPdr0jlg0Oe+o7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751961645; c=relaxed/simple;
	bh=qGro8C63Q8HBCHmBjolGGqLPrCJPWYmRuJCW2ziOllI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t2HqcaX3YbiZ5ggCdoWW3nbVPZSTfs2f18ON6NLk1nmDRjO/g/MfJAAOgyEskkjGeVQ8PZ6AKU6bH6LpNlzO7od8tCg5WJzUrWU2egZYNHjc/XN69JaGlWd5sC5Ze6afrsl+gNmR1n5zmtZVyxBlNXahjkprDFih+BeH8MxWJ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B9Mfik4g; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B9Mfik4g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751961644; x=1783497644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qGro8C63Q8HBCHmBjolGGqLPrCJPWYmRuJCW2ziOllI=;
  b=B9Mfik4gSHMPX8xz0QG9FLH2Z7ee7RMsixfmShRq4STQGW2yu9v8IYXR
   exolYhEsYpgmew7Jj/n/e7pzFBeDvj1K/J7x+VB2TFve7a/FbFyhZ68ks
   clBQk0X9WoRqetBCz5OC4xMX1g+mKfYs9iQWcHTmp7wEtT3yeD9QCWnCE
   pcAB1bE1OsVXu0bhqLkv++8yaeXpd2DPzKCMzsNNFKka/CZPW0MA+ZkiR
   bCdsMxZOTPnsfIMXcraBZWiP858gxbQzw0E8ynpCbakQw31/7ZKnSi3Yu
   SEUXNAkpgQ7pQsdTvdqyefgYQS04Kcu54ftqS5XSlEl5qbsmPc6K4gVOu
   A==;
X-CSE-ConnectionGUID: LsFY0oCsTxKZiASNgmL4nw==
X-CSE-MsgGUID: 5dvg3HBAR9eFyUpyk7L46Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="65542022"
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="65542022"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:00:42 -0700
X-CSE-ConnectionGUID: 7HNRs+nXQsO9crkatsDbaA==
X-CSE-MsgGUID: cNruABfjRRKD8ngeHybR5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,296,1744095600"; 
   d="scan'208";a="154832088"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2025 01:00:40 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 1/4] ASoC: Intel: soc-acpi: Add entry for sof_es8336 in PTL match table.
Date: Tue,  8 Jul 2025 16:00:26 +0800
Message-ID: <20250708080030.1257790-2-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708080030.1257790-1-yung-chuan.liao@linux.intel.com>
References: <20250708080030.1257790-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Balamurugan C <balamurugan.c@intel.com>

Adding ES83x6 I2S codec support for PTL platforms and entry in match table.

Signed-off-by: Balamurugan C <balamurugan.c@intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
---
 sound/soc/intel/common/soc-acpi-intel-ptl-match.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
index eae75f3f0fa4..ff4f2fbf9271 100644
--- a/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-ptl-match.c
@@ -21,6 +21,11 @@ static const struct snd_soc_acpi_codecs ptl_rt5682_rt5682s_hp = {
 	.codecs = {RT5682_ACPI_HID, RT5682S_ACPI_HID},
 };
 
+static const struct snd_soc_acpi_codecs ptl_essx_83x6 = {
+	.num_codecs = 3,
+	.codecs = { "ESSX8316", "ESSX8326", "ESSX8336"},
+};
+
 struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
 	{
 		.comp_ids = &ptl_rt5682_rt5682s_hp,
@@ -29,6 +34,14 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_ptl_machines[] = {
 		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_AMP_NAME |
 					SND_SOC_ACPI_TPLG_INTEL_CODEC_NAME,
 	},
+	{
+		.comp_ids = &ptl_essx_83x6,
+		.drv_name = "sof-essx8336",
+		.sof_tplg_filename = "sof-ptl-es8336", /* the tplg suffix is added at run time */
+		.tplg_quirk_mask = SND_SOC_ACPI_TPLG_INTEL_SSP_NUMBER |
+					SND_SOC_ACPI_TPLG_INTEL_SSP_MSB |
+					SND_SOC_ACPI_TPLG_INTEL_DMIC_NUMBER,
+	},
 	{},
 };
 EXPORT_SYMBOL_GPL(snd_soc_acpi_intel_ptl_machines);
-- 
2.43.0

