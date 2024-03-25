Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D9B745C2
	for <linux-sound@vger.kernel.org>; Mon, 25 Mar 2024 22:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711404688; cv=none; b=oq9UaRvqt5TRLRdnEhgrXDWrn7qGgT9IcavxnmyhgZR4uLjGMbgbapmNi3B8AbspfpVo7lCt+kMzP+twTkIdYgp6lsFEwGpWmMOfeb9kzQtGmSp+6BW/e0+aYIrkkv1vzQZkVfCfdxRDHERyUnV+wjjg+NgioEo9IyFFD6s09fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711404688; c=relaxed/simple;
	bh=u7YL/uosgWmOgTrX1I/D78/QvVIiO3Nn6fCcab50v0s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NU+djG8XTyDoRv3AwQnLIo58HYjV4/Y6uG3shjJ2i6xJj7ioj31DHdkUD1dABSuIWKmYywv3oFxwtChgMqXig+heegJPvMMbHrMhcevjEXXHlTyfRohfxpFgRExFoepxhaH6xNoceOH3rGSqdAfWdm+i4GqGrnkBlJG9HYBATPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SLK052I1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SLK052I1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711404687; x=1742940687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u7YL/uosgWmOgTrX1I/D78/QvVIiO3Nn6fCcab50v0s=;
  b=SLK052I1Ord5oxGQJ/mktHpxdZ2H1ZjJ8UcupQqDuSyFTG5m8aRrQGef
   HLSNc1cEVAQCHIGDd4TtGxE0JAV6XVbc6Y2tRWl8xJq9eIDAUwzepL+j8
   tDisU6aYINfFRQDbIm3U5rFO7zQfE8dX9YIdnODp/nGMEasgHbJyVoYJQ
   ZuOC2TFoBAF7BGe3L6YIz2RdrtgRzw2oe9iiNltAfJQieOSAz6zp8pTXc
   q9OA2sKSzO3EnEeSM4aFnQL6ZaUGCDUF0N1sxJXLGajOqMI7D2ZQQC9Mc
   voNV/OOI3CzOw84rrail6EeocR8ShNEUdvn+HReQHO2J7Gw0zQM0y71zS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11024"; a="6643672"
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="6643672"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 15:11:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,154,1708416000"; 
   d="scan'208";a="15722163"
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
Subject: [PATCH 16/21] ASoC: Intel: sof_da7219: board id cleanup for adl boards
Date: Mon, 25 Mar 2024 17:10:54 -0500
Message-Id: <20240325221059.206042-17-pierre-louis.bossart@linux.intel.com>
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

Introduce "adl_da7219_def" board to reduce the number of jsl board
configs. This config could support all boards which implement
headphone codec on SSP0 and speaker amplifiers on SSP1.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_da7219.c               | 2 +-
 sound/soc/intel/common/soc-acpi-intel-adl-match.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_da7219.c b/sound/soc/intel/boards/sof_da7219.c
index 3057798a0dca..0da7aa2e31c2 100644
--- a/sound/soc/intel/boards/sof_da7219.c
+++ b/sound/soc/intel/boards/sof_da7219.c
@@ -381,7 +381,7 @@ static const struct platform_device_id board_ids[] = {
 					SOF_SSP_PORT_AMP(1)),
 	},
 	{
-		.name = "adl_mx98360_da7219",
+		.name = "adl_da7219_def",
 		.driver_data = (kernel_ulong_t)(SOF_DA7219_MCLK_EN |
 					SOF_SSP_PORT_CODEC(0) |
 					SOF_SSP_PORT_AMP(1) |
diff --git a/sound/soc/intel/common/soc-acpi-intel-adl-match.c b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
index 0da79a3ba1f0..6c710e9a26f1 100644
--- a/sound/soc/intel/common/soc-acpi-intel-adl-match.c
+++ b/sound/soc/intel/common/soc-acpi-intel-adl-match.c
@@ -616,7 +616,7 @@ struct snd_soc_acpi_mach snd_soc_acpi_intel_adl_machines[] = {
 	},
 	{
 		.id = "DLGS7219",
-		.drv_name = "adl_mx98360_da7219",
+		.drv_name = "adl_da7219_def",
 		.machine_quirk = snd_soc_acpi_codec_list,
 		.quirk_data = &adl_max98360a_amp,
 		.sof_tplg_filename = "sof-adl-max98360a-da7219.tplg",
-- 
2.40.1

