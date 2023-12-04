Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdrxyUGq"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0867C3
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701726446; x=1733262446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lxnrl9IS5eiisR0ab0ODjWrRNp7F8l/gq0ekGANPYo4=;
  b=MdrxyUGqws8Dig5SXOzVvpyz6pfCSZ/ihUN5pB+Pon22YnJuQknafH3f
   3aHI6OL8X4hX/dsblW3EE28luYWXcT/MaVTCN5nAZCVlbxdT9tTkjxw9p
   FsOxRvcUiLzUKCe51/iWhmNSJhseTQSG2z0TMtzRffXImSKCR7PhAQ1A7
   IWB/OizmXACKJXtn8L+bHV/ywQLtYWggurSP/mMf1AtLa4WxJJQRBzAZk
   IpHGGusWZE+YiR00VGC+UPY166nBNxI2bnIFpsFh7ZU7zN4sqPcX0xpVx
   p1iZQLn23yfcEMJN0qHqEgi6zC24lgxa/hW8x5as7G58j/MT3i9WEigOW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="373249522"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="373249522"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:47:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="746978908"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="746978908"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:47:24 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Baofeng Tian <baofeng.tian@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 3/4] ASoC: SOF: add alignment for topology header file struct definition
Date: Mon,  4 Dec 2023 15:47:12 -0600
Message-Id: <20231204214713.208951-4-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231204214713.208951-1-pierre-louis.bossart@linux.intel.com>
References: <20231204214713.208951-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Baofeng Tian <baofeng.tian@intel.com>

sof header file requires these struct with 4 byte aligned, so
add same alignment in sof driver definition.

Signed-off-by: Baofeng Tian <baofeng.tian@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/topology.h | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index 466ab8e73d98..b3ca886fa28f 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -60,7 +60,7 @@ struct sof_ipc_comp {
 
 	/* extended data length, 0 if no extended data */
 	uint32_t ext_data_length;
-} __packed;
+} __packed __aligned(4);
 
 /*
  * Component Buffers
@@ -99,7 +99,7 @@ struct sof_ipc_buffer {
 	uint32_t caps;		/**< SOF_MEM_CAPS_ */
 	uint32_t flags;		/**< SOF_BUF_ flags defined above */
 	uint32_t reserved;	/**< reserved for future use */
-} __packed;
+} __packed __aligned(4);
 
 /* generic component config data - must always be after struct sof_ipc_comp */
 struct sof_ipc_comp_config {
@@ -112,7 +112,7 @@ struct sof_ipc_comp_config {
 
 	/* reserved for future use */
 	uint32_t reserved[2];
-} __packed;
+} __packed __aligned(4);
 
 /* generic host component */
 struct sof_ipc_comp_host {
@@ -121,7 +121,7 @@ struct sof_ipc_comp_host {
 	uint32_t direction;	/**< SOF_IPC_STREAM_ */
 	uint32_t no_irq;	/**< don't send periodic IRQ to host/DSP */
 	uint32_t dmac_config; /**< DMA engine specific */
-}  __packed;
+} __packed __aligned(4);
 
 /* generic DAI component */
 struct sof_ipc_comp_dai {
@@ -131,13 +131,13 @@ struct sof_ipc_comp_dai {
 	uint32_t dai_index;	/**< index of this type dai */
 	uint32_t type;		/**< DAI type - SOF_DAI_ */
 	uint32_t reserved;	/**< reserved */
-}  __packed;
+} __packed __aligned(4);
 
 /* generic mixer component */
 struct sof_ipc_comp_mixer {
 	struct sof_ipc_comp comp;
 	struct sof_ipc_comp_config config;
-}  __packed;
+} __packed __aligned(4);
 
 /* volume ramping types */
 enum sof_volume_ramp {
@@ -158,7 +158,7 @@ struct sof_ipc_comp_volume {
 	uint32_t max_value;
 	uint32_t ramp;		/**< SOF_VOLUME_ */
 	uint32_t initial_ramp;	/**< ramp space in ms */
-}  __packed;
+} __packed __aligned(4);
 
 /* generic SRC component */
 struct sof_ipc_comp_src {
@@ -168,7 +168,7 @@ struct sof_ipc_comp_src {
 	uint32_t source_rate;	/**< source rate or 0 for variable */
 	uint32_t sink_rate;	/**< sink rate or 0 for variable */
 	uint32_t rate_mask;	/**< SOF_RATE_ supported rates */
-} __packed;
+} __packed __aligned(4);
 
 /* generic ASRC component */
 struct sof_ipc_comp_asrc {
@@ -194,13 +194,13 @@ struct sof_ipc_comp_asrc {
 
 	/* reserved for future use */
 	uint32_t reserved[4];
-} __attribute__((packed));
+} __packed __aligned(4);
 
 /* generic MUX component */
 struct sof_ipc_comp_mux {
 	struct sof_ipc_comp comp;
 	struct sof_ipc_comp_config config;
-} __packed;
+} __packed __aligned(4);
 
 /* generic tone generator component */
 struct sof_ipc_comp_tone {
@@ -215,7 +215,7 @@ struct sof_ipc_comp_tone {
 	int32_t period;
 	int32_t repeats;
 	int32_t ramp_step;
-} __packed;
+} __packed __aligned(4);
 
 /** \brief Types of processing components */
 enum sof_ipc_process_type {
@@ -242,7 +242,7 @@ struct sof_ipc_comp_process {
 	uint32_t reserved[7];
 
 	unsigned char data[];
-} __packed;
+} __packed __aligned(4);
 
 /* frees components, buffers and pipelines
  * SOF_IPC_TPLG_COMP_FREE, SOF_IPC_TPLG_PIPE_FREE, SOF_IPC_TPLG_BUFFER_FREE
@@ -250,13 +250,13 @@ struct sof_ipc_comp_process {
 struct sof_ipc_free {
 	struct sof_ipc_cmd_hdr hdr;
 	uint32_t id;
-} __packed;
+} __packed __aligned(4);
 
 struct sof_ipc_comp_reply {
 	struct sof_ipc_reply rhdr;
 	uint32_t id;
 	uint32_t offset;
-} __packed;
+} __packed __aligned(4);
 
 /*
  * Pipeline
@@ -281,25 +281,25 @@ struct sof_ipc_pipe_new {
 	uint32_t frames_per_sched;/**< output frames of pipeline, 0 is variable */
 	uint32_t xrun_limit_usecs; /**< report xruns greater than limit */
 	uint32_t time_domain;	/**< scheduling time domain */
-}  __packed;
+} __packed __aligned(4);
 
 /* pipeline construction complete - SOF_IPC_TPLG_PIPE_COMPLETE */
 struct sof_ipc_pipe_ready {
 	struct sof_ipc_cmd_hdr hdr;
 	uint32_t comp_id;
-}  __packed;
+} __packed __aligned(4);
 
 struct sof_ipc_pipe_free {
 	struct sof_ipc_cmd_hdr hdr;
 	uint32_t comp_id;
-}  __packed;
+} __packed __aligned(4);
 
 /* connect two components in pipeline - SOF_IPC_TPLG_COMP_CONNECT */
 struct sof_ipc_pipe_comp_connect {
 	struct sof_ipc_cmd_hdr hdr;
 	uint32_t source_id;
 	uint32_t sink_id;
-}  __packed;
+} __packed __aligned(4);
 
 /* external events */
 enum sof_event_types {
-- 
2.39.2

