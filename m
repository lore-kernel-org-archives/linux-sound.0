Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9310377AB9;
	Wed, 15 Jul 2026 08:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784104440; cv=none; b=WyDzYIg/TzvOr2b3JXRl4l2Qe+c+7KMuofCku8HFU6bHY+2RmaIybdNofHuk8+lpRZkub7k3W+e+n1v7VNQ9rTXOb5pAujLGVakQeoKRFdzoPPlWPhXb2ebSevIhx7FFonEfkY4lCYEbojF/UBiEdVABtYCsZ8Ek/6yul9IQ9vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784104440; c=relaxed/simple;
	bh=u8swUNRN7joChPOADTFhXSvLM0uX9h1wE5CN/jrs74A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YxpcYHcFDZpBiiAUDKvVNEcgmFKFuA7r5V+uFXQbf/jnOURHb3S84eOUiiTHHGttYNDeEszlXK5630IaSNFzQ5m6kGxu4/uJkhWrnU5SOLTYNaH8Zs+pXBdH4cnwL8cLTBSXH9lOI5XHPc6RT+zSpDQ5O01mWnVXkfwYvvGGdlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-05 (Coremail) with SMTP id zQCowABHkcTkRVdqNz5HGA--.9680S2;
	Wed, 15 Jul 2026 16:33:41 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: Intel: avs: validate configuration TLV bounds
Date: Wed, 15 Jul 2026 16:33:40 +0800
Message-ID: <20260715083340.24372-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHkcTkRVdqNz5HGA--.9680S2
X-Coremail-Antispam: 1UD129KBjvJXoW3AF1kKr1ktFW7ArW7AFy5urg_yoW3Wr17pa
	y5KF4jkw1UXFs5Wrn7tw18Z3WxtrWkKrZxCF9Yg34ktF92qrsaya4vgryUCa9xArWkGFy3
	WrZF9rZ3ua1qga7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUZYFZUUUUU=
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

Firmware and hardware configuration replies are parsed as a sequence of
TLVs. The walkers only check that the complete reply is non-empty before
casting the current offset to struct avs_tlv, reading its header, and
consuming type-specific values. A short header or a declared value that
extends past the reply can therefore be consumed as part of the current
item.

Validate the fixed TLV header and the declared value span before dispatch.
Also require the value space used by the selected type: firmware version
copies need the complete version structure, scalar configuration values
need one u32, and I2S capabilities need their two-word prefix plus all
declared controller addresses.

Fixes: 3322e1688953 ("ASoC: Intel: avs: Add basefw runtime-parameter requests")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 sound/soc/intel/avs/messages.c | 114 +++++++++++++++++++++++++--------
 1 file changed, 88 insertions(+), 26 deletions(-)

diff --git a/sound/soc/intel/avs/messages.c b/sound/soc/intel/avs/messages.c
index a5ba27983091..c8adbb0de20c 100644
--- a/sound/soc/intel/avs/messages.c
+++ b/sound/soc/intel/avs/messages.c
@@ -388,9 +388,33 @@ int avs_ipc_set_d0ix(struct avs_dev *adev, bool enable_pg, bool streaming)
 	return avs_dsp_send_pm_msg(adev, &request, NULL, false, "set d0ix");
 }
 
+static int avs_tlv_validate(const struct avs_tlv *tlv, size_t remaining,
+			    size_t value_size)
+{
+	if (remaining < sizeof(*tlv) ||
+	    tlv->length > remaining - sizeof(*tlv) ||
+	    tlv->length < value_size)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int avs_tlv_read_u32(const struct avs_tlv *tlv, size_t remaining,
+			    u32 *value)
+{
+	int ret;
+
+	ret = avs_tlv_validate(tlv, remaining, sizeof(*tlv->value));
+	if (!ret)
+		*value = *tlv->value;
+
+	return ret;
+}
+
 int avs_ipc_get_fw_config(struct avs_dev *adev, struct avs_fw_cfg *cfg)
 {
 	struct avs_tlv *tlv;
+	u32 *value;
 	size_t payload_size;
 	size_t offset = 0;
 	u8 *payload;
@@ -409,82 +433,91 @@ int avs_ipc_get_fw_config(struct avs_dev *adev, struct avs_fw_cfg *cfg)
 
 	while (offset < payload_size) {
 		tlv = (struct avs_tlv *)(payload + offset);
+		ret = avs_tlv_validate(tlv, payload_size - offset, 0);
+		if (ret)
+			goto exit;
+
+		value = NULL;
 
 		switch (tlv->type) {
 		case AVS_FW_CFG_FW_VERSION:
+			ret = avs_tlv_validate(tlv, payload_size - offset,
+					       sizeof(cfg->fw_version));
+			if (ret)
+				goto exit;
 			memcpy(&cfg->fw_version, tlv->value, sizeof(cfg->fw_version));
 			break;
 
 		case AVS_FW_CFG_MEMORY_RECLAIMED:
-			cfg->memory_reclaimed = *tlv->value;
+			value = &cfg->memory_reclaimed;
 			break;
 
 		case AVS_FW_CFG_SLOW_CLOCK_FREQ_HZ:
-			cfg->slow_clock_freq_hz = *tlv->value;
+			value = &cfg->slow_clock_freq_hz;
 			break;
 
 		case AVS_FW_CFG_FAST_CLOCK_FREQ_HZ:
-			cfg->fast_clock_freq_hz = *tlv->value;
+			value = &cfg->fast_clock_freq_hz;
 			break;
 
 		case AVS_FW_CFG_ALH_SUPPORT_LEVEL:
-			cfg->alh_support = *tlv->value;
+			value = &cfg->alh_support;
 			break;
 
 		case AVS_FW_CFG_IPC_DL_MAILBOX_BYTES:
-			cfg->ipc_dl_mailbox_bytes = *tlv->value;
+			value = &cfg->ipc_dl_mailbox_bytes;
 			break;
 
 		case AVS_FW_CFG_IPC_UL_MAILBOX_BYTES:
-			cfg->ipc_ul_mailbox_bytes = *tlv->value;
+			value = &cfg->ipc_ul_mailbox_bytes;
 			break;
 
 		case AVS_FW_CFG_TRACE_LOG_BYTES:
-			cfg->trace_log_bytes = *tlv->value;
+			value = &cfg->trace_log_bytes;
 			break;
 
 		case AVS_FW_CFG_MAX_PPL_COUNT:
-			cfg->max_ppl_count = *tlv->value;
+			value = &cfg->max_ppl_count;
 			break;
 
 		case AVS_FW_CFG_MAX_ASTATE_COUNT:
-			cfg->max_astate_count = *tlv->value;
+			value = &cfg->max_astate_count;
 			break;
 
 		case AVS_FW_CFG_MAX_MODULE_PIN_COUNT:
-			cfg->max_module_pin_count = *tlv->value;
+			value = &cfg->max_module_pin_count;
 			break;
 
 		case AVS_FW_CFG_MODULES_COUNT:
-			cfg->modules_count = *tlv->value;
+			value = &cfg->modules_count;
 			break;
 
 		case AVS_FW_CFG_MAX_MOD_INST_COUNT:
-			cfg->max_mod_inst_count = *tlv->value;
+			value = &cfg->max_mod_inst_count;
 			break;
 
 		case AVS_FW_CFG_MAX_LL_TASKS_PER_PRI_COUNT:
-			cfg->max_ll_tasks_per_pri_count = *tlv->value;
+			value = &cfg->max_ll_tasks_per_pri_count;
 			break;
 
 		case AVS_FW_CFG_LL_PRI_COUNT:
-			cfg->ll_pri_count = *tlv->value;
+			value = &cfg->ll_pri_count;
 			break;
 
 		case AVS_FW_CFG_MAX_DP_TASKS_COUNT:
-			cfg->max_dp_tasks_count = *tlv->value;
+			value = &cfg->max_dp_tasks_count;
 			break;
 
 		case AVS_FW_CFG_MAX_LIBS_COUNT:
-			cfg->max_libs_count = *tlv->value;
+			value = &cfg->max_libs_count;
 			break;
 
 		case AVS_FW_CFG_XTAL_FREQ_HZ:
-			cfg->xtal_freq_hz = *tlv->value;
+			value = &cfg->xtal_freq_hz;
 			break;
 
 		case AVS_FW_CFG_POWER_GATING_POLICY:
-			cfg->power_gating_policy = *tlv->value;
+			value = &cfg->power_gating_policy;
 			break;
 
 		/* Known but not useful to us. */
@@ -499,9 +532,16 @@ int avs_ipc_get_fw_config(struct avs_dev *adev, struct avs_fw_cfg *cfg)
 			break;
 		}
 
+		if (value) {
+			ret = avs_tlv_read_u32(tlv, payload_size - offset, value);
+			if (ret)
+				goto exit;
+		}
+
 		offset += sizeof(*tlv) + tlv->length;
 	}
 
+exit:
 	/* No longer needed, free it as it's owned by the get_large_config() caller. */
 	kfree(payload);
 err:
@@ -551,6 +591,7 @@ int avs_ipc_set_fw_config(struct avs_dev *adev, size_t num_tlvs, ...)
 int avs_ipc_get_hw_config(struct avs_dev *adev, struct avs_hw_cfg *cfg)
 {
 	struct avs_tlv *tlv;
+	u32 *value;
 	size_t payload_size;
 	size_t size, offset = 0;
 	u8 *payload;
@@ -569,31 +610,46 @@ int avs_ipc_get_hw_config(struct avs_dev *adev, struct avs_hw_cfg *cfg)
 
 	while (offset < payload_size) {
 		tlv = (struct avs_tlv *)(payload + offset);
+		ret = avs_tlv_validate(tlv, payload_size - offset, 0);
+		if (ret)
+			goto exit;
+
+		value = NULL;
 
 		switch (tlv->type) {
 		case AVS_HW_CFG_AVS_VER:
-			cfg->avs_version = *tlv->value;
+			value = &cfg->avs_version;
 			break;
 
 		case AVS_HW_CFG_DSP_CORES:
-			cfg->dsp_cores = *tlv->value;
+			value = &cfg->dsp_cores;
 			break;
 
 		case AVS_HW_CFG_MEM_PAGE_BYTES:
-			cfg->mem_page_bytes = *tlv->value;
+			value = &cfg->mem_page_bytes;
 			break;
 
 		case AVS_HW_CFG_TOTAL_PHYS_MEM_PAGES:
-			cfg->total_phys_mem_pages = *tlv->value;
+			value = &cfg->total_phys_mem_pages;
 			break;
 
 		case AVS_HW_CFG_I2S_CAPS:
+			ret = avs_tlv_validate(tlv, payload_size - offset,
+					       2 * sizeof(*tlv->value));
+			if (ret)
+				goto exit;
 			cfg->i2s_caps.i2s_version = tlv->value[0];
 			size = tlv->value[1];
 			cfg->i2s_caps.ctrl_count = size;
 			if (!size)
 				break;
 
+			if (size > (tlv->length - 2 * sizeof(*tlv->value)) /
+				    sizeof(*tlv->value)) {
+				ret = -EINVAL;
+				goto exit;
+			}
+
 			/* Multiply to get entire array size. */
 			size *= sizeof(*cfg->i2s_caps.ctrl_base_addr);
 			cfg->i2s_caps.ctrl_base_addr = devm_kmemdup(adev->dev,
@@ -606,19 +662,19 @@ int avs_ipc_get_hw_config(struct avs_dev *adev, struct avs_hw_cfg *cfg)
 			break;
 
 		case AVS_HW_CFG_GATEWAY_COUNT:
-			cfg->gateway_count = *tlv->value;
+			value = &cfg->gateway_count;
 			break;
 
 		case AVS_HW_CFG_HP_EBB_COUNT:
-			cfg->hp_ebb_count = *tlv->value;
+			value = &cfg->hp_ebb_count;
 			break;
 
 		case AVS_HW_CFG_LP_EBB_COUNT:
-			cfg->lp_ebb_count = *tlv->value;
+			value = &cfg->lp_ebb_count;
 			break;
 
 		case AVS_HW_CFG_EBB_SIZE_BYTES:
-			cfg->ebb_size_bytes = *tlv->value;
+			value = &cfg->ebb_size_bytes;
 			break;
 
 		case AVS_HW_CFG_GPDMA_CAPS:
@@ -629,6 +685,12 @@ int avs_ipc_get_hw_config(struct avs_dev *adev, struct avs_hw_cfg *cfg)
 			break;
 		}
 
+		if (value) {
+			ret = avs_tlv_read_u32(tlv, payload_size - offset, value);
+			if (ret)
+				goto exit;
+		}
+
 		offset += sizeof(*tlv) + tlv->length;
 	}
 
-- 
2.43.0

