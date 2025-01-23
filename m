Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAA12135D7
	for <linux-sound@vger.kernel.org>; Thu, 23 Jan 2025 16:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737649389; cv=none; b=MC+wNxGCr45sE1RL2qTmZHhtwoPEe2CzvNf+qGcBCLBR/kkSsA+Dxxf4mA/bUxOeLE0Cu9AP0iVuoti4aawovQPq7ckTxiRGc3g+o3NQCtukZIfPrOGyr8ZmCHdZErz9dhiRN09Cx7aXGkRgQkm7U77s3NibskF0tyWdHUDTNkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737649389; c=relaxed/simple;
	bh=Q2tTV+81G4/MIjWZ/sbni7M/iC9q+LSXApJ+OP1JbQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WMmy6eJOgWB44wASDSuQRLab1I2Sl06D6B/mMZoFWiqmRbenKemoUi/GGuAu1bRUzfXpGySeKFaCxnl9xQEsPgjlgTwht+j+X/czdvlXios4Sirt9+mBeBQt0NKW6goKGM/357a/ECLMvR9sSgR88miT1joTLAS/X10T1Ws39dM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6ZM2Ab1; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6ZM2Ab1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737649388; x=1769185388;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q2tTV+81G4/MIjWZ/sbni7M/iC9q+LSXApJ+OP1JbQ0=;
  b=A6ZM2Ab16mjaRrU+db/37AyiG9nzH92M4RPmTrCQooL6ClzX8yomU02e
   4R/aVXYQ3yETxIx1gadd6kl8QgSZR3RZP+Z1gp18ALIngxYNdhtja4VHS
   7PMc4g9d47HvsoEh9Va1yUlOJz9IfPpdT8KSEAWzH1f0ocUGM9Ml4Ljv6
   aJ+Vd2nFMjbwN1c4dfOI7qi2ReRVzPbG5B1gvmAZfQm7OgqUdeAtKu4E7
   h16Z/3lbMoPPINwMXjnKRozNcWeB7GouAM88M2GJUrsRajlrvk8kohpWV
   W4T3aYMyM9t/Kqj4+xbI00dyrXun9jA40GU9636IyW/Fic+i+c7ZsvJAH
   A==;
X-CSE-ConnectionGUID: lsvOHL6kQ3efNuVaEMEthA==
X-CSE-MsgGUID: crprbzv0TcGMIAJcg5vi5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="55572520"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="55572520"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 08:23:08 -0800
X-CSE-ConnectionGUID: KyWJ/JsWQDmP+xxivozH3Q==
X-CSE-MsgGUID: TglyT64nSCKtDI24nmabcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107346749"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 08:23:05 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	shenghao-ding@ti.com,
	kevin-lu@ti.com,
	baojun.xu@ti.com,
	linux-sound@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 05/11] ASoC: Intel: avs: pcm3168a board selection
Date: Thu, 23 Jan 2025 17:36:28 +0100
Message-Id: <20250123163634.1451237-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250123163634.1451237-1-cezary.rojewski@intel.com>
References: <20250123163634.1451237-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Populate board table with avs_pcm3168a machine driver for RPL-M-based
and ADL-N-based platforms with pcm3168a codec onboard to allow the sound
card to enumerate.

While at it, drop comma the terminator entries to align with the coding
standard.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/board_selection.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index 0266edeafc19..2d706edcbf92 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -312,6 +312,18 @@ static struct snd_soc_acpi_mach avs_tgl_i2s_machines[] = {
 	{},
 };
 
+static struct snd_soc_acpi_mach avs_mbl_i2s_machines[] = {
+	{
+		.id = "PCM3168A",
+		.drv_name = "avs_pcm3168a",
+		.mach_params = {
+			.i2s_link_mask = AVS_SSP(0) | AVS_SSP(2),
+		},
+		.tplg_filename = "pcm3168a-tplg.bin",
+	},
+	{}
+};
+
 static struct snd_soc_acpi_mach avs_test_i2s_machines[] = {
 	{
 		.drv_name = "avs_i2s_test",
@@ -378,10 +390,11 @@ static const struct avs_acpi_boards i2s_boards[] = {
 	AVS_MACH_ENTRY(HDA_ICL_LP,	avs_icl_i2s_machines),
 	AVS_MACH_ENTRY(HDA_TGL_LP,	avs_tgl_i2s_machines),
 	AVS_MACH_ENTRY(HDA_EHL_0,	avs_tgl_i2s_machines),
+	AVS_MACH_ENTRY(HDA_ADL_N,	avs_mbl_i2s_machines),
 	AVS_MACH_ENTRY(HDA_ADL_P,	avs_tgl_i2s_machines),
 	AVS_MACH_ENTRY(HDA_RPL_P_0,	avs_tgl_i2s_machines),
-	AVS_MACH_ENTRY(HDA_RPL_M,	avs_tgl_i2s_machines),
-	{},
+	AVS_MACH_ENTRY(HDA_RPL_M,	avs_mbl_i2s_machines),
+	{}
 };
 
 static const struct avs_acpi_boards *avs_get_i2s_boards(struct avs_dev *adev)
-- 
2.25.1

