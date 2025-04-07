Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E29C23BD19
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 11:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744024021; cv=none; b=gMWYG7FhDbL3Ug6cH5lxJZeKHfvuNL+xFwB0ctD4NyPpfkh1TY83SS4lJmgRp5TuqMhao/IbIBwNdX4eeIeV9d+FIVllfrl3im9hzqFwA5+gaomf9nGVQt9wPQnyKafEIDTSn74I3pblHz/abyCc+bEcidpC42Wz0SLJ+Q05TAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744024021; c=relaxed/simple;
	bh=j2vVmnMTsJNFOU/rlU9QDVdYgMqtxygBkRfjY+rbmWI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QW2gfWx2kUAUqeRRufWPXCsYCtekQkr/sPJu2GIutJs3opPWQYFleRGNaM/MUNIvBhBeq15qDQYBti22b+znj2U7534R1lohOg+N/gSRWAcmOz0fW9P+iMBAtlr1ETopTO+ps0skVGc6wG/IZKMH3KeevpWPTbL+TnAqPsc+/sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VzNOlWNm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VzNOlWNm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744024021; x=1775560021;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=j2vVmnMTsJNFOU/rlU9QDVdYgMqtxygBkRfjY+rbmWI=;
  b=VzNOlWNmf3L9x6rbU6avHDdRj5NwUnIYHCdKYuoTm10Cv1UP0pqMRgg+
   Qe6BdseH51ty0+knkLfaKfVkueX3+0PRHV6dw3sk5DYHXUAHLGJyOF757
   f+zz2Sg94/BG7IpLBfAaV8DEbBwjx6MpGQP03I0HqA0/ciEeZhkoo5G1f
   am3QBRDngZCcvKA507O96FkihbJrr59mSQcx2LCCNdvcPvxzA+gXY4Ty0
   0meu8SqUCWuh6KQN76/9FllaTzynTA/c/q8LXntz+IR/iMF7qoGRoXbXM
   PlM5SPqP/DBTTyEPpfUzjMGtzygHLJWu/VQ98JUXPcquhmbpHHiR2gBjc
   A==;
X-CSE-ConnectionGUID: AHK26+4ZSymus2fq6djLag==
X-CSE-MsgGUID: nGayALZEQo+HnQNFQABCzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="49057342"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="49057342"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 04:07:00 -0700
X-CSE-ConnectionGUID: jK4QY656RuOr8jdXviKX2Q==
X-CSE-MsgGUID: yVFALkeKROyxNejyUywZvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="127776282"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by fmviesa006.fm.intel.com with ESMTP; 07 Apr 2025 04:06:58 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	liam.r.girdwood@intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v2 04/10] ASoC: Intel: avs: Relocate DSP status registers
Date: Mon,  7 Apr 2025 13:23:46 +0200
Message-Id: <20250407112352.3720779-5-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407112352.3720779-1-cezary.rojewski@intel.com>
References: <20250407112352.3720779-1-cezary.rojewski@intel.com>
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

