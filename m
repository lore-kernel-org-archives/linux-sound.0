Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B9D1DFCE
	for <linux-sound@vger.kernel.org>; Wed,  3 Apr 2024 10:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712141545; cv=none; b=qL95qWMqckYLhZuurlydZOBktI/mwrg4aD7SUgKyVg3hotnmZIZf77cwWP2TAW+LinWME0uZAntXeM54AJUGczazb2zA49v2QkwYZazX/nOTOWpNykLkwNPEiko6JAu2LEih8LnJKFpiukWX5rR6C9znogRuA3B3HcJRH3PyX50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712141545; c=relaxed/simple;
	bh=EEjCPFmKwcpkjJYT22t7Fl+r38U6rXF1EzqRJkGJMhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cGccsW8LfrNFiV0DnS7ydA1e7n+7yMUN7EOL6RoqeUFOKJ6OVAFomnrP3wPW8e32bqmKYgLCl+Y1LLMnsMJ88l6EEhqeA9gU/gl12cfJOJQE4cDBdkXFSHpE8bh37cjnd9JzC09xkFyvjzocAJgqHpeedRFmYxez9P/L7Pil5l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mz+VHI6g; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mz+VHI6g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712141544; x=1743677544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EEjCPFmKwcpkjJYT22t7Fl+r38U6rXF1EzqRJkGJMhs=;
  b=Mz+VHI6gzeaBPnKmpaGqER+jwzhGQ+otrDpYDilY+Vr55Q906h5pkjc/
   VMTgqzWzYqkIuxZxUhMk2zI5eRM17dD4A1sr/m500HVQnrqoEgGOa43BX
   RRisxDBPUhNIgiMJTl5fpjp1U9Bv5lv0iHMyYHEpaVT+hwxDpcaI09Vik
   I/3+XNuSSoBGZkV0RCRORLhS4XHmdm/P+GOza6KZL+a3GuEfU/vPR0TwU
   swE+83WkBdHvuloYrQPhQwaMCen8CTfGiOwS6K5AgQCKMRDQhEDAtplBd
   1M12hi+g8lUzO5oxhd7Xh8VnNcdyDyLS8odl6UIWc/TMB7PZcuZSnmFp1
   g==;
X-CSE-ConnectionGUID: VXxHD5CGQyiKUvmTkBhXqA==
X-CSE-MsgGUID: sGMUxn3BSTuGEYFpptvEsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="7212257"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="7212257"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:51:58 -0700
X-CSE-ConnectionGUID: biHKZu5CSiujHmnAIfLK/A==
X-CSE-MsgGUID: W0r+AP1+RsGGFVFk923ElA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; 
   d="scan'208";a="49374815"
Received: from aelgham-mobl2.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.249.35.133])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2024 03:51:55 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	rander.wang@intel.com,
	liam.r.girdwood@intel.com
Subject: [PATCH 6/7] ASoC: SOF: Intel: hda-dsp/mtl: Add support for ACE ROM state codes
Date: Wed,  3 Apr 2024 13:52:09 +0300
Message-ID: <20240403105210.17949-7-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403105210.17949-1-peter.ujfalusi@linux.intel.com>
References: <20240403105210.17949-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ROM state codes differ between CAVS and ACE architecture, there is a
slight overlap.
Add the ACE related state defines to mtl.h, introduce new table and
use it on case the function is called when running on ACE architecture.

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
---
 sound/soc/sof/intel/hda.c | 72 +++++++++++++++++++++++++++++++++++----
 sound/soc/sof/intel/hda.h |  2 ++
 sound/soc/sof/intel/mtl.h | 44 ++++++++++++++++++++++++
 3 files changed, 112 insertions(+), 6 deletions(-)

diff --git a/sound/soc/sof/intel/hda.c b/sound/soc/sof/intel/hda.c
index 33721e817ef4..2fc10bec7331 100644
--- a/sound/soc/sof/intel/hda.c
+++ b/sound/soc/sof/intel/hda.c
@@ -35,6 +35,7 @@
 #include "../ipc4-topology.h"
 #include "hda.h"
 #include "telemetry.h"
+#include "mtl.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/sof_intel.h>
@@ -597,7 +598,7 @@ static const struct hda_dsp_msg_code hda_dsp_rom_fw_error_texts[] = {
 };
 
 #define FSR_ROM_STATE_ENTRY(state)	{FSR_STATE_ROM_##state, #state}
-static const struct hda_dsp_msg_code fsr_rom_state_names[] = {
+static const struct hda_dsp_msg_code cavs_fsr_rom_state_names[] = {
 	FSR_ROM_STATE_ENTRY(INIT),
 	FSR_ROM_STATE_ENTRY(INIT_DONE),
 	FSR_ROM_STATE_ENTRY(CSE_MANIFEST_LOADED),
@@ -620,6 +621,58 @@ static const struct hda_dsp_msg_code fsr_rom_state_names[] = {
 	FSR_ROM_STATE_ENTRY(CSE_IPC_DOWN),
 };
 
+static const struct hda_dsp_msg_code ace_fsr_rom_state_names[] = {
+	FSR_ROM_STATE_ENTRY(INIT),
+	FSR_ROM_STATE_ENTRY(INIT_DONE),
+	FSR_ROM_STATE_ENTRY(CSE_MANIFEST_LOADED),
+	FSR_ROM_STATE_ENTRY(FW_MANIFEST_LOADED),
+	FSR_ROM_STATE_ENTRY(FW_FW_LOADED),
+	FSR_ROM_STATE_ENTRY(FW_ENTERED),
+	FSR_ROM_STATE_ENTRY(VERIFY_FEATURE_MASK),
+	FSR_ROM_STATE_ENTRY(GET_LOAD_OFFSET),
+	FSR_ROM_STATE_ENTRY(RESET_VECTOR_DONE),
+	FSR_ROM_STATE_ENTRY(PURGE_BOOT),
+	FSR_ROM_STATE_ENTRY(RESTORE_BOOT),
+	FSR_ROM_STATE_ENTRY(FW_ENTRY_POINT),
+	FSR_ROM_STATE_ENTRY(VALIDATE_PUB_KEY),
+	FSR_ROM_STATE_ENTRY(POWER_DOWN_HPSRAM),
+	FSR_ROM_STATE_ENTRY(POWER_DOWN_ULPSRAM),
+	FSR_ROM_STATE_ENTRY(POWER_UP_ULPSRAM_STACK),
+	FSR_ROM_STATE_ENTRY(POWER_UP_HPSRAM_DMA),
+	FSR_ROM_STATE_ENTRY(BEFORE_EP_POINTER_READ),
+	FSR_ROM_STATE_ENTRY(VALIDATE_MANIFEST),
+	FSR_ROM_STATE_ENTRY(VALIDATE_FW_MODULE),
+	FSR_ROM_STATE_ENTRY(PROTECT_IMR_REGION),
+	FSR_ROM_STATE_ENTRY(PUSH_MODEL_ROUTINE),
+	FSR_ROM_STATE_ENTRY(PULL_MODEL_ROUTINE),
+	FSR_ROM_STATE_ENTRY(VALIDATE_PKG_DIR),
+	FSR_ROM_STATE_ENTRY(VALIDATE_CPD),
+	FSR_ROM_STATE_ENTRY(VALIDATE_CSS_MAN_HEADER),
+	FSR_ROM_STATE_ENTRY(VALIDATE_BLOB_SVN),
+	FSR_ROM_STATE_ENTRY(VERIFY_IFWI_PARTITION),
+	FSR_ROM_STATE_ENTRY(REMOVE_ACCESS_CONTROL),
+	FSR_ROM_STATE_ENTRY(AUTH_BYPASS),
+	FSR_ROM_STATE_ENTRY(AUTH_ENABLED),
+	FSR_ROM_STATE_ENTRY(INIT_DMA),
+	FSR_ROM_STATE_ENTRY(PURGE_FW_ENTRY),
+	FSR_ROM_STATE_ENTRY(PURGE_FW_END),
+	FSR_ROM_STATE_ENTRY(CLEAN_UP_BSS_DONE),
+	FSR_ROM_STATE_ENTRY(IMR_RESTORE_ENTRY),
+	FSR_ROM_STATE_ENTRY(IMR_RESTORE_END),
+	FSR_ROM_STATE_ENTRY(FW_MANIFEST_IN_DMA_BUFF),
+	FSR_ROM_STATE_ENTRY(LOAD_CSE_MAN_TO_IMR),
+	FSR_ROM_STATE_ENTRY(LOAD_FW_MAN_TO_IMR),
+	FSR_ROM_STATE_ENTRY(LOAD_FW_CODE_TO_IMR),
+	FSR_ROM_STATE_ENTRY(FW_LOADING_DONE),
+	FSR_ROM_STATE_ENTRY(FW_CODE_LOADED),
+	FSR_ROM_STATE_ENTRY(VERIFY_IMAGE_TYPE),
+	FSR_ROM_STATE_ENTRY(AUTH_API_INIT),
+	FSR_ROM_STATE_ENTRY(AUTH_API_PROC),
+	FSR_ROM_STATE_ENTRY(AUTH_API_FIRST_BUSY),
+	FSR_ROM_STATE_ENTRY(AUTH_API_FIRST_RESULT),
+	FSR_ROM_STATE_ENTRY(AUTH_API_CLEANUP),
+};
+
 #define FSR_BRINGUP_STATE_ENTRY(state)	{FSR_STATE_BRINGUP_##state, #state}
 static const struct hda_dsp_msg_code fsr_bringup_state_names[] = {
 	FSR_BRINGUP_STATE_ENTRY(INIT),
@@ -664,7 +717,7 @@ hda_dsp_get_state_text(u32 code, const struct hda_dsp_msg_code *msg_code,
 	return NULL;
 }
 
-static void hda_dsp_get_state(struct snd_sof_dev *sdev, const char *level)
+void hda_dsp_get_state(struct snd_sof_dev *sdev, const char *level)
 {
 	const struct sof_intel_dsp_desc *chip = get_chip_info(sdev->pdata);
 	const char *state_text, *error_text, *module_text;
@@ -680,12 +733,19 @@ static void hda_dsp_get_state(struct snd_sof_dev *sdev, const char *level)
 	else
 		module_text = fsr_module_names[module];
 
-	if (module == FSR_MOD_BRNGUP)
+	if (module == FSR_MOD_BRNGUP) {
 		state_text = hda_dsp_get_state_text(state, fsr_bringup_state_names,
 						    ARRAY_SIZE(fsr_bringup_state_names));
-	else
-		state_text = hda_dsp_get_state_text(state, fsr_rom_state_names,
-						    ARRAY_SIZE(fsr_rom_state_names));
+	} else {
+		if (chip->hw_ip_version < SOF_INTEL_ACE_1_0)
+			state_text = hda_dsp_get_state_text(state,
+							cavs_fsr_rom_state_names,
+							ARRAY_SIZE(cavs_fsr_rom_state_names));
+		else
+			state_text = hda_dsp_get_state_text(state,
+							ace_fsr_rom_state_names,
+							ARRAY_SIZE(ace_fsr_rom_state_names));
+	}
 
 	/* not for us, must be generic sof message */
 	if (!state_text) {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index c939a24d770e..16140ae22c90 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -695,6 +695,8 @@ int hda_dsp_ipc_get_window_offset(struct snd_sof_dev *sdev, u32 id);
 irqreturn_t hda_dsp_ipc_irq_thread(int irq, void *context);
 int hda_dsp_ipc_cmd_done(struct snd_sof_dev *sdev, int dir);
 
+void hda_dsp_get_state(struct snd_sof_dev *sdev, const char *level);
+
 /*
  * DSP Code loader.
  */
diff --git a/sound/soc/sof/intel/mtl.h b/sound/soc/sof/intel/mtl.h
index 3c56427a966b..d2d709fb4f06 100644
--- a/sound/soc/sof/intel/mtl.h
+++ b/sound/soc/sof/intel/mtl.h
@@ -72,6 +72,50 @@
 
 #define MTL_DSP_REG_HFFLGPXQWY		0x163200 /* DSP core0 status */
 #define MTL_DSP_REG_HFFLGPXQWY_ERROR	0x163204 /* DSP core0 error */
+
+/* FSR status codes */
+#define FSR_STATE_ROM_RESET_VECTOR_DONE		0x8
+#define FSR_STATE_ROM_PURGE_BOOT		0x9
+#define FSR_STATE_ROM_RESTORE_BOOT		0xA
+#define FSR_STATE_ROM_FW_ENTRY_POINT		0xB
+#define FSR_STATE_ROM_VALIDATE_PUB_KEY		0xC
+#define FSR_STATE_ROM_POWER_DOWN_HPSRAM		0xD
+#define FSR_STATE_ROM_POWER_DOWN_ULPSRAM	0xE
+#define FSR_STATE_ROM_POWER_UP_ULPSRAM_STACK	0xF
+#define FSR_STATE_ROM_POWER_UP_HPSRAM_DMA	0x10
+#define FSR_STATE_ROM_BEFORE_EP_POINTER_READ	0x11
+#define FSR_STATE_ROM_VALIDATE_MANIFEST		0x12
+#define FSR_STATE_ROM_VALIDATE_FW_MODULE	0x13
+#define FSR_STATE_ROM_PROTECT_IMR_REGION	0x14
+#define FSR_STATE_ROM_PUSH_MODEL_ROUTINE	0x15
+#define FSR_STATE_ROM_PULL_MODEL_ROUTINE	0x16
+#define FSR_STATE_ROM_VALIDATE_PKG_DIR		0x17
+#define FSR_STATE_ROM_VALIDATE_CPD		0x18
+#define FSR_STATE_ROM_VALIDATE_CSS_MAN_HEADER	0x19
+#define FSR_STATE_ROM_VALIDATE_BLOB_SVN		0x1A
+#define FSR_STATE_ROM_VERIFY_IFWI_PARTITION	0x1B
+#define FSR_STATE_ROM_REMOVE_ACCESS_CONTROL	0x1C
+#define FSR_STATE_ROM_AUTH_BYPASS		0x1D
+#define FSR_STATE_ROM_AUTH_ENABLED		0x1E
+#define FSR_STATE_ROM_INIT_DMA			0x1F
+#define FSR_STATE_ROM_PURGE_FW_ENTRY		0x20
+#define FSR_STATE_ROM_PURGE_FW_END		0x21
+#define FSR_STATE_ROM_CLEAN_UP_BSS_DONE		0x22
+#define FSR_STATE_ROM_IMR_RESTORE_ENTRY		0x23
+#define FSR_STATE_ROM_IMR_RESTORE_END		0x24
+#define FSR_STATE_ROM_FW_MANIFEST_IN_DMA_BUFF	0x25
+#define FSR_STATE_ROM_LOAD_CSE_MAN_TO_IMR	0x26
+#define FSR_STATE_ROM_LOAD_FW_MAN_TO_IMR	0x27
+#define FSR_STATE_ROM_LOAD_FW_CODE_TO_IMR	0x28
+#define FSR_STATE_ROM_FW_LOADING_DONE		0x29
+#define FSR_STATE_ROM_FW_CODE_LOADED		0x2A
+#define FSR_STATE_ROM_VERIFY_IMAGE_TYPE		0x2B
+#define FSR_STATE_ROM_AUTH_API_INIT		0x2C
+#define FSR_STATE_ROM_AUTH_API_PROC		0x2D
+#define FSR_STATE_ROM_AUTH_API_FIRST_BUSY	0x2E
+#define FSR_STATE_ROM_AUTH_API_FIRST_RESULT	0x2F
+#define FSR_STATE_ROM_AUTH_API_CLEANUP		0x30
+
 #define MTL_DSP_REG_HfIMRIS1		0x162088
 #define MTL_DSP_REG_HfIMRIS1_IU_MASK	BIT(0)
 
-- 
2.44.0

