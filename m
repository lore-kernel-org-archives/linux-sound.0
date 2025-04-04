Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B89E1AA1E8
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 09:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759180; cv=none; b=JUUJZoI3jgFh4vV6gwwxBl9Ql1DeljTpBv7V+g3yrROCxZfAgWqKhQtrYFeh0mYyEKQ3zatj4ANMNo5hrr13ZJ8C4zzcdIA44p2MXM8tZQNrMkXd6UD6b9IbFs3nZDJ2QvnqhzsBS9O4GNcgMW7CpegMjMB1QmwTaAHtwZykOYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759180; c=relaxed/simple;
	bh=j2vVmnMTsJNFOU/rlU9QDVdYgMqtxygBkRfjY+rbmWI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AOgNhX3a4RNGYLzXbKASvb0QydE7gymY39GdqcYDp3/gFbA9lx26exNofKc5dThCMU674fz/D0tDmR+o9sx70rPsKLwPmGE8YuKHJM3/i01g103Wssyq8W9J9IqMIXQwHDHHbBMXkhtggSkp0QP+l4RxkmOFo2WLLK6T+WrFLf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b/zNcwnW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b/zNcwnW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743759179; x=1775295179;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j2vVmnMTsJNFOU/rlU9QDVdYgMqtxygBkRfjY+rbmWI=;
  b=b/zNcwnW1dBMaDmBOMLICpGPFsD9XqKLE02HcmK6XJzTPjucL1F3a5sj
   oTVOsgALpEMOHUZ5XiHJ3MFdbvYE+0DoZHp/+C0SnmJ42ZBC70vQ5z0Si
   CR0KzZRyNYSChmT1EDFTDpTKfDeq/d+hQ/8UPv/FUfUPKFb/tCdN4Mjb5
   o/AWvNrdn4zINTUoPl3Ue3Bei7+CgTgfGDbpC3lVXR9pWPM47GkKL7izr
   CNKMFUU5OXjSJ7reQr42OR9VtPyymn4IwKp38HHkiPNQ16DYwDoodMwrj
   FttOhivsQuoQJx9etYO+LfzY7Bniq56D7DhP8GF3hiRJlCET+hS3AIyFd
   w==;
X-CSE-ConnectionGUID: uSmxsdRHSfWGlh5lQgWDpQ==
X-CSE-MsgGUID: DndzGpPtS3OftqEyTZ5Zpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="70566333"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="70566333"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 02:32:59 -0700
X-CSE-ConnectionGUID: ajxjJn8cTfuTcoUBiBKZiw==
X-CSE-MsgGUID: XQTjjSCJRUudCkIUFccgEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="158248604"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa001.fm.intel.com with ESMTP; 04 Apr 2025 02:32:57 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 04/12] ASoC: Intel: avs: Relocate DSP status registers
Date: Fri,  4 Apr 2025 11:49:45 +0200
Message-Id: <20250404094953.3657679-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404094953.3657679-1-cezary.rojewski@intel.com>
References: <20250404094953.3657679-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The firmware status and error registers are not part of SRAM on ACE
platforms. As these registers take part in IPC on ACE and cAVS platforms
both, relocate the field denoting their offset to Host-IPC descriptor.

In consequence, code remains cohesive with the ACE specs while still
maintaining high readability for the cAVS platforms.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/avs.h       |  2 +-
 sound/soc/intel/avs/core.c      | 18 +++++++++++++++---
 sound/soc/intel/avs/loader.c    |  2 +-
 sound/soc/intel/avs/registers.h |  2 +-
 4 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 201897c5bdc0..ec5502f9d5cb 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -81,7 +81,6 @@ extern const struct avs_dsp_ops avs_tgl_dsp_ops;
 struct avs_sram_spec {
 	const u32 base_offset;
 	const u32 window_size;
-	const u32 rom_status_offset;
 };
 
 struct avs_hipc_spec {
@@ -93,6 +92,7 @@ struct avs_hipc_spec {
 	const u32 rsp_offset;
 	const u32 rsp_busy_mask;
 	const u32 ctl_offset;
+	const u32 sts_offset;
 };
 
 /* Platform specific descriptor */
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 72a14dca1a1e..1495e163d47e 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -755,13 +755,11 @@ static const struct dev_pm_ops avs_dev_pm = {
 static const struct avs_sram_spec skl_sram_spec = {
 	.base_offset = SKL_ADSP_SRAM_BASE_OFFSET,
 	.window_size = SKL_ADSP_SRAM_WINDOW_SIZE,
-	.rom_status_offset = SKL_ADSP_SRAM_BASE_OFFSET,
 };
 
 static const struct avs_sram_spec apl_sram_spec = {
 	.base_offset = APL_ADSP_SRAM_BASE_OFFSET,
 	.window_size = APL_ADSP_SRAM_WINDOW_SIZE,
-	.rom_status_offset = APL_ADSP_SRAM_BASE_OFFSET,
 };
 
 static const struct avs_hipc_spec skl_hipc_spec = {
@@ -773,6 +771,19 @@ static const struct avs_hipc_spec skl_hipc_spec = {
 	.rsp_offset = SKL_ADSP_REG_HIPCT,
 	.rsp_busy_mask = SKL_ADSP_HIPCT_BUSY,
 	.ctl_offset = SKL_ADSP_REG_HIPCCTL,
+	.sts_offset = SKL_ADSP_SRAM_BASE_OFFSET,
+};
+
+static const struct avs_hipc_spec apl_hipc_spec = {
+	.req_offset = SKL_ADSP_REG_HIPCI,
+	.req_ext_offset = SKL_ADSP_REG_HIPCIE,
+	.req_busy_mask = SKL_ADSP_HIPCI_BUSY,
+	.ack_offset = SKL_ADSP_REG_HIPCIE,
+	.ack_done_mask = SKL_ADSP_HIPCIE_DONE,
+	.rsp_offset = SKL_ADSP_REG_HIPCT,
+	.rsp_busy_mask = SKL_ADSP_HIPCT_BUSY,
+	.ctl_offset = SKL_ADSP_REG_HIPCCTL,
+	.sts_offset = APL_ADSP_SRAM_BASE_OFFSET,
 };
 
 static const struct avs_hipc_spec cnl_hipc_spec = {
@@ -784,6 +795,7 @@ static const struct avs_hipc_spec cnl_hipc_spec = {
 	.rsp_offset = CNL_ADSP_REG_HIPCTDR,
 	.rsp_busy_mask = CNL_ADSP_HIPCTDR_BUSY,
 	.ctl_offset = CNL_ADSP_REG_HIPCCTL,
+	.sts_offset = APL_ADSP_SRAM_BASE_OFFSET,
 };
 
 static const struct avs_spec skl_desc = {
@@ -803,7 +815,7 @@ static const struct avs_spec apl_desc = {
 	.core_init_mask = 3,
 	.attributes = AVS_PLATATTR_IMR,
 	.sram = &apl_sram_spec,
-	.hipc = &skl_hipc_spec,
+	.hipc = &apl_hipc_spec,
 };
 
 static const struct avs_spec cnl_desc = {
diff --git a/sound/soc/intel/avs/loader.c b/sound/soc/intel/avs/loader.c
index ecf050c2c0c7..138e4e9de5e3 100644
--- a/sound/soc/intel/avs/loader.c
+++ b/sound/soc/intel/avs/loader.c
@@ -310,7 +310,7 @@ avs_hda_init_rom(struct avs_dev *adev, unsigned int dma_id, bool purge)
 	}
 
 	/* await ROM init */
-	ret = snd_hdac_adsp_readl_poll(adev, spec->sram->rom_status_offset, reg,
+	ret = snd_hdac_adsp_readl_poll(adev, spec->hipc->sts_offset, reg,
 				       (reg & 0xF) == AVS_ROM_INIT_DONE ||
 				       (reg & 0xF) == APL_ROM_FW_ENTERED,
 				       AVS_ROM_INIT_POLLING_US, APL_ROM_INIT_TIMEOUT_US);
diff --git a/sound/soc/intel/avs/registers.h b/sound/soc/intel/avs/registers.h
index 368ede05f2cd..4db0cdf68ffc 100644
--- a/sound/soc/intel/avs/registers.h
+++ b/sound/soc/intel/avs/registers.h
@@ -74,7 +74,7 @@
 #define APL_ADSP_SRAM_WINDOW_SIZE	0x20000
 
 /* Constants used when accessing SRAM, space shared with firmware */
-#define AVS_FW_REG_BASE(adev)		((adev)->spec->sram->base_offset)
+#define AVS_FW_REG_BASE(adev)		((adev)->spec->hipc->sts_offset)
 #define AVS_FW_REG_STATUS(adev)		(AVS_FW_REG_BASE(adev) + 0x0)
 #define AVS_FW_REG_ERROR(adev)		(AVS_FW_REG_BASE(adev) + 0x4)
 
-- 
2.25.1

