Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DCAD214802
	for <linux-sound@vger.kernel.org>; Wed, 22 Jan 2025 17:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737567653; cv=none; b=UfZ2n8D8/8zypn4tufc3arXyUcPjspJKIjUrxX5dnpUoFVQcpF2FzrmAvpc59+V0oO5dfRH6XbK39L6JelEpZ7wfRCJ7Jj7eqbOTNdMXFeOETHktj284K6oG+cY+GEeTrWSASc2prk8bs8fH/01L8FHCLiSIKI8ouWttOcvvu+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737567653; c=relaxed/simple;
	bh=Q2tTV+81G4/MIjWZ/sbni7M/iC9q+LSXApJ+OP1JbQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=r64tSmItLJukSG+bXHc1Jedv1w/YPddARd8Id718e70u9xRWn71mNKGXDpyzkM4vZEq6AVs/2K/TZ9r9NRQ6nZsOF4xAFs4zK4VCisYLYAu4BdzDNeGpo+3Q3pZNrcO5Cceq923jSDZgNAPzvUZ4+8aBAfi78TxmPKyK5/MvRnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QNFxvw0k; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QNFxvw0k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737567652; x=1769103652;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q2tTV+81G4/MIjWZ/sbni7M/iC9q+LSXApJ+OP1JbQ0=;
  b=QNFxvw0k2+8oGIySngkLQXnwqpytlsZ9JiE78R5Tx8P8OpogvT5xDyt0
   drfwVjSJ0z1Y5csIqCcG3OOplQLeEKuAnR/wUxG9XIEEdWYTKIwDmwjCe
   1agwNNcfAMqqwyB1gWNTVZpUIIlFSr+v0SdIffWl411jCY5xqdNERsKnK
   EXjg4guwEzKAdK9VgW1vw2TsogsdpiR6AfHYJH8CL8mx9STHetBKgtqye
   iG1+koH/3YW4YAu5nfezrbt3nbDQGSy+EU/QtioJwFBncA9sc7ZWTvaQp
   3axJn3fyJR4nE58f2QpCwTIvYstk0KaZDWZn8ZE7hs7Oagi/59sL2frZn
   A==;
X-CSE-ConnectionGUID: AFt5ZPqKR6y3PPixaIq9Rw==
X-CSE-MsgGUID: 89nQuuuoShOSOYdNDxK7Bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="49434744"
X-IronPort-AV: E=Sophos;i="6.13,225,1732608000"; 
   d="scan'208";a="49434744"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2025 09:40:52 -0800
X-CSE-ConnectionGUID: h3297QIvQhm6wOrjYAYn3A==
X-CSE-MsgGUID: mQMaJq4ORHO4uLn9y1/Ucw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="112185272"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa003.jf.intel.com with ESMTP; 22 Jan 2025 09:40:50 -0800
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
Subject: [PATCH 05/11] ASoC: Intel: avs: pcm3168a board selection
Date: Wed, 22 Jan 2025 18:54:20 +0100
Message-Id: <20250122175426.1369059-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250122175426.1369059-1-cezary.rojewski@intel.com>
References: <20250122175426.1369059-1-cezary.rojewski@intel.com>
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

