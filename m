Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B59205ACE
	for <linux-sound@vger.kernel.org>; Mon,  3 Feb 2025 13:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738591035; cv=none; b=tiHyK38LH3J9bxdFZiuzxpnN508z1Q96cTshQw9P0lmCuKpueoyp6oe0JZeqlZinNzg+BbUxKgiIa+oBhUaWYkv8KIUGmmqd9+2dcPEycRkdifu0bicfisARsa9g4qqiKvqZtk90GBH7i82KQK40Sp/3+8oAp2VlMIeHkq9Bqhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738591035; c=relaxed/simple;
	bh=Q2tTV+81G4/MIjWZ/sbni7M/iC9q+LSXApJ+OP1JbQ0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LXesucrRBxS7IqSe+aBPTnmru/b6xL8erI8N10sG1iuuL9CkydeP/0NiWmdKoRiq7BW4VJYf+1qsq8IPvli4oooUSZtmy/BGrQrHryl8Y4O86+CNRQgp1Svy0OSVMtiIOzi+g8o9F+AzA9Wr4ekMvuEXCTU5hCbiQ3gWoUjU8xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P/5AkFY4; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P/5AkFY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738591034; x=1770127034;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q2tTV+81G4/MIjWZ/sbni7M/iC9q+LSXApJ+OP1JbQ0=;
  b=P/5AkFY4ltQ6YErbNr1iWirhruA/Mu9Qkb3GbjU1wjpzMhL+iTHTZWob
   enqW7PuSB9uD9umuCKf6/RBbMZVnq0C9s/lu8OoBR5v4O6tRDil618bam
   bw6A7x1cwAzmbd7i12qP10Vz559gS46zUWr8qdSr11JolsNzS3jq7HzhL
   CaEOCzNDuQmeqV7l58uIDgZNl2XI/k6k7GIyXTwgTWDw/pazByJFvIhm3
   FI1STciir5ciLjBeXelfJhdpBZuJ/cGxwfe1eewdezptZRPhzCFqidWiS
   3N6fBf8odIWPR3/uMdmhxrx7qzpWCoObEOH+R85Uw+uiDEXOqgwgAMIfV
   g==;
X-CSE-ConnectionGUID: PMjD264kTzS+KaDPCBiGxQ==
X-CSE-MsgGUID: 2HSnspipT3Klsk1YRyoD4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56511828"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="56511828"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 05:57:14 -0800
X-CSE-ConnectionGUID: UmmsBxLmR5+b0SLvKK+V1A==
X-CSE-MsgGUID: 3EdZ1gebTFuCISCsT8Eprg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110057901"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa009.jf.intel.com with ESMTP; 03 Feb 2025 05:57:12 -0800
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
Subject: [PATCH v3 05/11] ASoC: Intel: avs: pcm3168a board selection
Date: Mon,  3 Feb 2025 15:10:45 +0100
Message-Id: <20250203141051.2361323-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250203141051.2361323-1-cezary.rojewski@intel.com>
References: <20250203141051.2361323-1-cezary.rojewski@intel.com>
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

