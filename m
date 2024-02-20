Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7F8679ED
	for <linux-sound@vger.kernel.org>; Tue, 20 Feb 2024 11:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429771; cv=none; b=ItOxoDFbabFIoAvC+14MIPQerFeIcdHYoMJn9MEkQTLfp6fjmpaITeu+IFT6nNzUIiCCf5cOb32VpkkYeCs9O9oq45mSBOkNUnODE2LEEEarqOlRTScsDpbpBvbM8/EgIDYI0qvMGsGbduuRr36GV3hm077mUMkNpb6V2/yv2KU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429771; c=relaxed/simple;
	bh=csyouZw8RBz0O87Tqthq8qlDT5GA20abpHjXlv93IGU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fInY1KydU7AQqLD1wI6vUoPBeCO4sbAgTz+10s/ac8wPkuVKgnWqxuu5axm4ZYyaCfi8NPAm31W8/0Q9duPmqhFF4JbCVpF3m8XzsFoI0D0YvvVH7Nu/q0TSuAMHc5gaLgPhq9fxByKzlRs1BOcL0jORtdrhSP0nmALcBIN0C/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+dOCDRa; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+dOCDRa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708429767; x=1739965767;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=csyouZw8RBz0O87Tqthq8qlDT5GA20abpHjXlv93IGU=;
  b=i+dOCDRavqmwqpu46zgxjrd99Ic6gwdD6FflNNSdDXLO4Co0v8XNBu/6
   gp0i9uxJrsjl8QsCyjIkEyuO4iH99U8XTvLyvaPm0mKtq9y/AFOlbR//v
   XirJArQq95bmxozNLRokf5PKm6xi2rEnz+nZhRri0wsffYua0fpv3G42C
   qqKls2NSdptOIMqsU8kje1ShtFzs5TOUUU4nx7COhuGraA61N4wX/k6ie
   8G8D1SC4ml9oXkqVFwPFQaDxhp/LflnYb2ICVeNlUoHHeNUivW6mPb0WA
   /l80b7Oe2AsSc+LmaiKoHv7DVMokDa1kL90mOPTjqBvNAFFlEbSqdEuIF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2988977"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2988977"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 03:49:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4751001"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:25 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 05/10] ASoC: Intel: avs: Abstract IRQ handling
Date: Tue, 20 Feb 2024 12:50:30 +0100
Message-Id: <20240220115035.770402-6-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220115035.770402-1-cezary.rojewski@intel.com>
References: <20240220115035.770402-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Servicing IPCs on CNL platforms and onward differs from the existing
one. To make room for these, relocate SKL-based platforms specific code
into the skl.c file leaving only the genering irq_handler in the common
code.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/apl.c  |  4 ++--
 sound/soc/intel/avs/avs.h  |  8 ++++----
 sound/soc/intel/avs/core.c | 14 ++++++++++++++
 sound/soc/intel/avs/ipc.c  | 30 +-----------------------------
 sound/soc/intel/avs/skl.c  | 29 +++++++++++++++++++++++++++--
 5 files changed, 48 insertions(+), 37 deletions(-)

diff --git a/sound/soc/intel/avs/apl.c b/sound/soc/intel/avs/apl.c
index 24c06568b3e8..6382543a9cdb 100644
--- a/sound/soc/intel/avs/apl.c
+++ b/sound/soc/intel/avs/apl.c
@@ -236,8 +236,8 @@ const struct avs_dsp_ops avs_apl_dsp_ops = {
 	.power = avs_dsp_core_power,
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
-	.irq_handler = avs_dsp_irq_handler,
-	.irq_thread = avs_dsp_irq_thread,
+	.irq_handler = avs_irq_handler,
+	.irq_thread = avs_skl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
 	.load_basefw = avs_hda_load_basefw,
 	.load_lib = avs_hda_load_library,
diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index b93f38515403..2cd690a78b5c 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -46,8 +46,8 @@ struct avs_dsp_ops {
 	int (* const power)(struct avs_dev *, u32, bool);
 	int (* const reset)(struct avs_dev *, u32, bool);
 	int (* const stall)(struct avs_dev *, u32, bool);
-	irqreturn_t (* const irq_handler)(int, void *);
-	irqreturn_t (* const irq_thread)(int, void *);
+	irqreturn_t (* const irq_handler)(struct avs_dev *);
+	irqreturn_t (* const irq_thread)(struct avs_dev *);
 	void (* const int_control)(struct avs_dev *, bool);
 	int (* const load_basefw)(struct avs_dev *, struct firmware *);
 	int (* const load_lib)(struct avs_dev *, struct firmware *, u32);
@@ -242,8 +242,7 @@ struct avs_ipc {
 #define AVS_IPC_RET(ret) \
 	(((ret) <= 0) ? (ret) : -AVS_EIPC)
 
-irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id);
-irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id);
+irqreturn_t avs_irq_handler(struct avs_dev *adev);
 void avs_dsp_process_response(struct avs_dev *adev, u64 header);
 int avs_dsp_send_msg_timeout(struct avs_dev *adev, struct avs_ipc_msg *request,
 			     struct avs_ipc_msg *reply, int timeout, const char *name);
@@ -265,6 +264,7 @@ void avs_ipc_block(struct avs_ipc *ipc);
 int avs_dsp_disable_d0ix(struct avs_dev *adev);
 int avs_dsp_enable_d0ix(struct avs_dev *adev);
 
+irqreturn_t avs_skl_irq_thread(struct avs_dev *adev);
 int avs_skl_log_buffer_offset(struct avs_dev *adev, u32 core);
 
 /* Firmware resources management */
diff --git a/sound/soc/intel/avs/core.c b/sound/soc/intel/avs/core.c
index 46162d637573..4d1d3445cac1 100644
--- a/sound/soc/intel/avs/core.c
+++ b/sound/soc/intel/avs/core.c
@@ -321,6 +321,20 @@ static irqreturn_t hdac_bus_irq_thread(int irq, void *context)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id)
+{
+	struct avs_dev *adev = dev_id;
+
+	return avs_dsp_op(adev, irq_handler);
+}
+
+static irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id)
+{
+	struct avs_dev *adev = dev_id;
+
+	return avs_dsp_op(adev, irq_thread);
+}
+
 static int avs_hdac_acquire_irq(struct avs_dev *adev)
 {
 	struct hdac_bus *bus = &adev->base.core;
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 29c7f508a7d6..ad0e535b3c2e 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -301,9 +301,8 @@ void avs_dsp_process_response(struct avs_dev *adev, u64 header)
 	complete(&ipc->busy_completion);
 }
 
-irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id)
+irqreturn_t avs_irq_handler(struct avs_dev *adev)
 {
-	struct avs_dev *adev = dev_id;
 	struct avs_ipc *ipc = adev->ipc;
 	const struct avs_spec *const spec = adev->spec;
 	u32 adspis, hipc_rsp, hipc_ack;
@@ -350,33 +349,6 @@ irqreturn_t avs_dsp_irq_handler(int irq, void *dev_id)
 	return ret;
 }
 
-irqreturn_t avs_dsp_irq_thread(int irq, void *dev_id)
-{
-	struct avs_dev *adev = dev_id;
-	union avs_reply_msg msg;
-	u32 hipct, hipcte;
-
-	hipct = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
-	hipcte = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCTE);
-
-	/* ensure DSP sent new response to process */
-	if (!(hipct & SKL_ADSP_HIPCT_BUSY))
-		return IRQ_NONE;
-
-	msg.primary = hipct;
-	msg.ext.val = hipcte;
-	avs_dsp_process_response(adev, msg.val);
-
-	/* tell DSP we accepted its message */
-	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCT,
-			      SKL_ADSP_HIPCT_BUSY, SKL_ADSP_HIPCT_BUSY);
-	/* unmask busy interrupt */
-	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL,
-			      AVS_ADSP_HIPCCTL_BUSY, AVS_ADSP_HIPCCTL_BUSY);
-
-	return IRQ_HANDLED;
-}
-
 static bool avs_ipc_is_busy(struct avs_ipc *ipc)
 {
 	struct avs_dev *adev = to_avs_dev(ipc->dev);
diff --git a/sound/soc/intel/avs/skl.c b/sound/soc/intel/avs/skl.c
index 7ea8d91b54d2..d19f8953993f 100644
--- a/sound/soc/intel/avs/skl.c
+++ b/sound/soc/intel/avs/skl.c
@@ -12,6 +12,31 @@
 #include "avs.h"
 #include "messages.h"
 
+irqreturn_t avs_skl_irq_thread(struct avs_dev *adev)
+{
+	union avs_reply_msg msg;
+	u32 hipct, hipcte;
+
+	hipct = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCT);
+	hipcte = snd_hdac_adsp_readl(adev, SKL_ADSP_REG_HIPCTE);
+
+	/* Ensure DSP sent new response to process. */
+	if (!(hipct & SKL_ADSP_HIPCT_BUSY))
+		return IRQ_NONE;
+
+	msg.primary = hipct;
+	msg.ext.val = hipcte;
+	avs_dsp_process_response(adev, msg.val);
+
+	/* Tell DSP we accepted its message. */
+	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCT, SKL_ADSP_HIPCT_BUSY, SKL_ADSP_HIPCT_BUSY);
+	/* Unmask busy interrupt. */
+	snd_hdac_adsp_updatel(adev, SKL_ADSP_REG_HIPCCTL, AVS_ADSP_HIPCCTL_BUSY,
+			      AVS_ADSP_HIPCCTL_BUSY);
+
+	return IRQ_HANDLED;
+}
+
 static int __maybe_unused
 avs_skl_enable_logs(struct avs_dev *adev, enum avs_log_enable enable, u32 aging_period,
 		    u32 fifo_full_period, unsigned long resource_mask, u32 *priorities)
@@ -103,8 +128,8 @@ const struct avs_dsp_ops avs_skl_dsp_ops = {
 	.power = avs_dsp_core_power,
 	.reset = avs_dsp_core_reset,
 	.stall = avs_dsp_core_stall,
-	.irq_handler = avs_dsp_irq_handler,
-	.irq_thread = avs_dsp_irq_thread,
+	.irq_handler = avs_irq_handler,
+	.irq_thread = avs_skl_irq_thread,
 	.int_control = avs_dsp_interrupt_control,
 	.load_basefw = avs_cldma_load_basefw,
 	.load_lib = avs_cldma_load_library,
-- 
2.25.1

