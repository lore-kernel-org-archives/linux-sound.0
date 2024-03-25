Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD8A75817
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404688; cv=none; b=tlhOQ0rfKNa6FZ5Wc1SnL+SrVvfLJ2UtH/AWF2ye/vGnqDM5TInnG8Ii1f+yldtBXYSOG3n/gtQeO7c4eoh3JV+XzgJWdk8nUg3ygKnhBsUe4BEHYsULbRj1+IA6TML/IPmRdwz72cvhVDnJ8rTbdNVDFZ7U7G85tzCOiXCVNQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404688; c=relaxed/simple;
	bh=TGe/aTbC/Ax1DpTq9vEIfquwDuAbVXTLGFXWDTJr6Qs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Z8DoAGup5KTRkrBJr0JpjsjRzhw3/5JBOPUhMD4NO7E5srtNoEn+VJFS0nyEAG6ccinIUaE6nCTc528e5DFLgoDIJc/GpOvFec/oM23gdx5Xyfqv1LXCklGmifzISiLgrKGUFZCOqSbZCtRbmOG+SmPQugZh2+izOw0m41DWcTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JB6KcFcv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JB6KcFcv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404687; x=1742940687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TGe/aTbC/Ax1DpTq9vEIfquwDuAbVXTLGFXWDTJr6Qs=;
  b=JB6KcFcv0Z+CPxomFLAN+cfsz1CKtCth744Y+hpsKQ12iqBtF8JG41eG
   5EPWc+pwNCKbBJ6LoH2WVCkg691hsfyfCF362pU2MsWB5mrT+ep1xy5N3
   lyCc2mEss5Gvuq8kkUxpLj/9Dj3EcBna5VF28ZQlKdaAeAFUikSXjYFmd
   o0AiRYbBNADuolYmsZUgL80w4MeCW0uO3yXH5UEA4MDd9EemnTYnqjGQG
   KyKyei6mzGdEBf1bRkDT/Vj5qIsfVdc7jr1tKae24KGaMpFUWLmyihvoM
   TIU1hqrFupbRrmS9hd/iu4sNw8JDVQknsDxr27DJ5oHXfU0/CLp2a3+vL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643667"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643667"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722156"
Received: from jaimbres-mobl2.amr.corp.intel.com (HELO pbossart-mobl6.lan) ([10.212.98.109])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:24 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 15/21] ASoC: Intel: sof_da7219: board id cleanup for jsl boards
Date: Mon, 25 Mar 2024 17:10:53 -0500
Message-Id: <20240325221059.206042-16-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
References: <20240325221059.206042-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Introduce "jsl_da7219_def" board to reduce the number of jsl board
configs. This config could support all boards which implement
headphone codec on SSP0 and speaker amplifiers on SSP1.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c               | 8 +-------
 sound/soc/intel/common/soc-acpi-intel-jsl-match.c | 4 ++--
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 4417e2b7adfd..3057798a0dca 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -375,13 +375,7 @@ static int audio_probe(struct platform_device *pdev)
 
 static const struct platform_device_id board_ids[] = {
 	{
-		.name = "jsl_mx98373_da7219",
-		.driver_data = (kernel_ulong_t)(SOF_DA7219_JSL_BOARD |
-					SOF_SSP_PORT_CODEC(0) |
-					SOF_SSP_PORT_AMP(1)),
-	},
-	{
-		.name = "jsl_mx98360_da7219",
+		.name = "jsl_da7219_def",
 		.driver_data = (kernel_ulong_t)(SOF_DA7219_JSL_BOARD |
 					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1)),
diff --git a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
index a6ac2525df17..d4b397c53bcc 100644
--- a/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-jsl-match.c
@@ -52,14 +52,14 @@ static const struct snd_soc_acpi_codecs rt5682_rt5682s_hp = {
 struct snd_soc_acpi_mach snd_soc_acpi_intel_jsl_machines[] = {
 	{
 		.id = "DLGS7219",
-		.drv_name = "jsl_mx98373_da7219",
+		.drv_name = "jsl_da7219_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &mx98373_spk,
 		.sof_tplg_filename = "sof-jsl-da7219.tplg",
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "jsl_mx98360_da7219",
+		.drv_name = "jsl_da7219_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &mx98360a_spk,
 		.sof_tplg_filename = "sof-jsl-da7219-mx98360a.tplg",
-- 
2.40.1

