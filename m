Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D19216E28
	for <linux-sound@vger.kernel.org>; Thu,  9 Jan 2025 12:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736424516; cv=none; b=ky0s4CoveR0AQtsOT713eCUxbIE/kOMXJZ8N4HuPdtuP4l8kEQjwIbMJW17S4AvHNt/3aGbDzz3uTZdwKXmop4LgfqtW1Sou/i8LKdpBOmYXdv6Td/CMkJVGJUTTWqSb0/HVf0nf9DOmBOKM9gb5DCAFyvbqX7cNz5EsVnH5Gw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736424516; c=relaxed/simple;
	bh=edJ1PitbeCfSC5vGpbAkDVONXA4avlwa1j8k3lMRdO8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i6nHSnQCoIUprjxKKpnjx1D1f7Xxj9WZviqcbihSVGG2OSnNabc1RAolNb5v9/6gExhnAqacA/87hO/6aomcu9SjPYoSwlxChBooll1RyVM7FeSYQmDp90JjUFbz6ZDOFKAfm9PeSS6CswhRRAdd27a338Kysj3u2jVmprqLHAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UGH4qNHG; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UGH4qNHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736424513; x=1767960513;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=edJ1PitbeCfSC5vGpbAkDVONXA4avlwa1j8k3lMRdO8=;
  b=UGH4qNHGnVbPTFTL0JGuhrK8CT3s20dQ/px8tt/d1espCjcdbTRGvQ8g
   bwEvJ1+puw12S3mhSiLADe/iBF8OF1uBQfgo5luLQNvYPPThQwL+xZfk3
   jlWodPIJhdTkcB3FJrlM57tGglYCRL67pRTTZkEK8FosrBaF17VlTjqJz
   k+zdb0eAcWYYBB0snNBk0Fj3saLuFBBGA74HUYicYwQ8SoakqSw70QtGQ
   4O6QkIbJSq1IxvvDXNrs2HI1Rq+K5f8lB8NHLVQRCWzPXo2VoBew1dVCm
   YeuOCtpYcxJ5GKcaGg8wmgsLEESVsJAPN9qkrF5niKrkNxb71Su0SuCNo
   A==;
X-CSE-ConnectionGUID: cYGetBnATsmz9kSv9hEXnQ==
X-CSE-MsgGUID: 72gayrBmQ7uPcaYTYn6Fsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47179616"
X-IronPort-AV: E=Sophos;i="6.12,301,1728975600"; 
   d="scan'208";a="47179616"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 04:08:33 -0800
X-CSE-ConnectionGUID: YovuC7kkRHeRpOCYc5JDVA==
X-CSE-MsgGUID: cylsQvcPT9eMNmdGsihs8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="140710398"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.254])
  by orviesa001.jf.intel.com with ESMTP; 09 Jan 2025 04:08:30 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 12/13] ASoC: Intel: avs: Adjust IPC traces
Date: Thu,  9 Jan 2025 13:22:15 +0100
Message-Id: <20250109122216.3667847-13-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250109122216.3667847-1-cezary.rojewski@intel.com>
References: <20250109122216.3667847-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The firmware status and the firmware error registers are 4-bytes wide.
Update trace macros and their usage to reflect that.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/ipc.c   | 25 ++++++++++++++----------
 sound/soc/intel/avs/trace.h | 38 +++++++++++++++++++------------------
 2 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 4fba46e77c47..08ed9d96738a 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -184,10 +184,11 @@ static void avs_dsp_receive_rx(struct avs_dev *adev, u64 header)
 {
 	struct avs_ipc *ipc = adev->ipc;
 	union avs_reply_msg msg = AVS_MSG(header);
-	u64 reg;
+	u32 sts, lec;
 
-	reg = readq(avs_sram_addr(adev, AVS_FW_REGS_WINDOW));
-	trace_avs_ipc_reply_msg(header, reg);
+	sts = snd_hdac_adsp_readl(adev, AVS_FW_REG_STATUS(adev));
+	lec = snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR(adev));
+	trace_avs_ipc_reply_msg(header, sts, lec);
 
 	ipc->rx.header = header;
 	/* Abort copying payload if request processing was unsuccessful. */
@@ -209,10 +210,11 @@ static void avs_dsp_process_notification(struct avs_dev *adev, u64 header)
 	union avs_notify_msg msg = AVS_MSG(header);
 	size_t data_size = 0;
 	void *data = NULL;
-	u64 reg;
+	u32 sts, lec;
 
-	reg = readq(avs_sram_addr(adev, AVS_FW_REGS_WINDOW));
-	trace_avs_ipc_notify_msg(header, reg);
+	sts = snd_hdac_adsp_readl(adev, AVS_FW_REG_STATUS(adev));
+	lec = snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR(adev));
+	trace_avs_ipc_notify_msg(header, sts, lec);
 
 	/* Ignore spurious notifications until handshake is established. */
 	if (!adev->ipc->ready && msg.notify_msg_type != AVS_NOTIFY_FW_READY) {
@@ -367,13 +369,16 @@ static void avs_ipc_msg_init(struct avs_ipc *ipc, struct avs_ipc_msg *reply)
 static void avs_dsp_send_tx(struct avs_dev *adev, struct avs_ipc_msg *tx, bool read_fwregs)
 {
 	const struct avs_spec *const spec = adev->spec;
-	u64 reg = ULONG_MAX;
+	u32 sts = UINT_MAX;
+	u32 lec = UINT_MAX;
 
 	tx->header |= spec->hipc->req_busy_mask;
-	if (read_fwregs)
-		reg = readq(avs_sram_addr(adev, AVS_FW_REGS_WINDOW));
+	if (read_fwregs) {
+		sts = snd_hdac_adsp_readl(adev, AVS_FW_REG_STATUS(adev));
+		lec = snd_hdac_adsp_readl(adev, AVS_FW_REG_ERROR(adev));
+	}
 
-	trace_avs_request(tx, reg);
+	trace_avs_request(tx, sts, lec);
 
 	if (tx->size)
 		memcpy_toio(avs_downlink_addr(adev), tx->data, tx->size);
diff --git a/sound/soc/intel/avs/trace.h b/sound/soc/intel/avs/trace.h
index c9eaa5a60ed3..f4288d0ad5ef 100644
--- a/sound/soc/intel/avs/trace.h
+++ b/sound/soc/intel/avs/trace.h
@@ -37,60 +37,62 @@ TRACE_EVENT(avs_dsp_core_op,
 
 void trace_avs_msg_payload(const void *data, size_t size);
 
-#define trace_avs_request(msg, fwregs) \
+#define trace_avs_request(msg, sts, lec) \
 ({ \
-	trace_avs_ipc_request_msg((msg)->header, fwregs); \
+	trace_avs_ipc_request_msg((msg)->header, sts, lec); \
 	trace_avs_msg_payload((msg)->data, (msg)->size); \
 })
 
-#define trace_avs_reply(msg, fwregs) \
+#define trace_avs_reply(msg, sts, lec) \
 ({ \
-	trace_avs_ipc_reply_msg((msg)->header, fwregs); \
+	trace_avs_ipc_reply_msg((msg)->header, sts, lec); \
 	trace_avs_msg_payload((msg)->data, (msg)->size); \
 })
 
-#define trace_avs_notify(msg, fwregs) \
+#define trace_avs_notify(msg, sts, lec) \
 ({ \
-	trace_avs_ipc_notify_msg((msg)->header, fwregs); \
+	trace_avs_ipc_notify_msg((msg)->header, sts, lec); \
 	trace_avs_msg_payload((msg)->data, (msg)->size); \
 })
 #endif
 
 DECLARE_EVENT_CLASS(avs_ipc_msg_hdr,
 
-	TP_PROTO(u64 header, u64 fwregs),
+	TP_PROTO(u64 header, u32 sts, u32 lec),
 
-	TP_ARGS(header, fwregs),
+	TP_ARGS(header, sts, lec),
 
 	TP_STRUCT__entry(
 		__field(u64,	header)
-		__field(u64,	fwregs)
+		__field(u32,	sts)
+		__field(u32,	lec)
 	),
 
 	TP_fast_assign(
 		__entry->header = header;
-		__entry->fwregs = fwregs;
+		__entry->sts = sts;
+		__entry->lec = lec;
 	),
 
 	TP_printk("primary: 0x%08X, extension: 0x%08X,\n"
-		  "fwstatus: 0x%08X, fwerror: 0x%08X",
+		  "status: 0x%08X, error: 0x%08X",
 		  lower_32_bits(__entry->header), upper_32_bits(__entry->header),
-		  lower_32_bits(__entry->fwregs), upper_32_bits(__entry->fwregs))
+		  __entry->sts, __entry->lec)
 );
 
 DEFINE_EVENT(avs_ipc_msg_hdr, avs_ipc_request_msg,
-	TP_PROTO(u64 header, u64 fwregs),
-	TP_ARGS(header, fwregs)
+	TP_PROTO(u64 header, u32 sts, u32 lec),
+	TP_ARGS(header, sts, lec)
 );
 
 DEFINE_EVENT(avs_ipc_msg_hdr, avs_ipc_reply_msg,
-	TP_PROTO(u64 header, u64 fwregs),
-	TP_ARGS(header, fwregs)
+	TP_PROTO(u64 header, u32 sts, u32 lec),
+	TP_ARGS(header, sts, lec)
 );
 
 DEFINE_EVENT(avs_ipc_msg_hdr, avs_ipc_notify_msg,
-	TP_PROTO(u64 header, u64 fwregs),
-	TP_ARGS(header, fwregs)
+	TP_PROTO(u64 header, u32 sts, u32 lec),
+	TP_ARGS(header, sts, lec)
 );
 
 TRACE_EVENT_CONDITION(avs_ipc_msg_payload,
-- 
2.25.1

