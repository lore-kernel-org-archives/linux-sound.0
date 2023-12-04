Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyxGFEfn"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBCD5BB
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701726445; x=1733262445;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LPh9erdu3rNmmxN1u+8Vj8+xDQyC7KRu/h0HkD3K8Mk=;
  b=eyxGFEfnc4T1BQIDwcJEDwMdf56MLrk6W7SlDiogL0TRMuDKggc5rVyo
   7h/JUZDVkLTNXqeQHmkwurMz3lNtA9Q2AhzlD76Lr88JJ+J1zemcvJi8u
   94WqwHeG4Omazz6JPl3Ow0IX1Gkgg/fz1LiBJQfpMZ+1nhlyM/uGrWWrH
   kxFEUbSbjeuhYrO2TfmqBwcp0VI2X+yowBIi56EOdcoAG46hwve+lb35x
   z1bUfHTuFiuMTSUu1j3TJODgzaJ8zoIjwRIjIC3d10uxn6nllILbO44bJ
   35X+ZkVDEVtic9QixRVKf9vQTAOX7fSPFxRKuO7kDQ/E/lb9HhmjTU2VK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="373249518"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="373249518"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:47:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="746978900"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="746978900"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:47:24 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Baofeng Tian <baofeng.tian@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 2/4] ASoC: SOF: align topology header file with sof topology header
Date: Mon,  4 Dec 2023 15:47:11 -0600
Message-Id: <20231204214713.208951-3-pierre-louis.bossart@linux.intel.com>
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

Add missed definition and align variable names with sof topology
header file.

Signed-off-by: Baofeng Tian <baofeng.tian@intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/sound/sof/topology.h | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/include/sound/sof/topology.h b/include/sound/sof/topology.h
index 906e2f327ad2..466ab8e73d98 100644
--- a/include/sound/sof/topology.h
+++ b/include/sound/sof/topology.h
@@ -39,6 +39,7 @@ enum sof_comp_type {
 	SOF_COMP_ASRC,		/**< Asynchronous sample rate converter */
 	SOF_COMP_DCBLOCK,
 	SOF_COMP_SMART_AMP,             /**< smart amplifier component */
+	SOF_COMP_MODULE_ADAPTER,		/**< module adapter */
 	/* keep FILEREAD/FILEWRITE as the last ones */
 	SOF_COMP_FILEREAD = 10000,	/**< host test based file IO */
 	SOF_COMP_FILEWRITE = 10001,	/**< host test based file IO */
@@ -68,14 +69,15 @@ struct sof_ipc_comp {
 /*
  * SOF memory capabilities, add new ones at the end
  */
-#define SOF_MEM_CAPS_RAM			(1 << 0)
-#define SOF_MEM_CAPS_ROM			(1 << 1)
-#define SOF_MEM_CAPS_EXT			(1 << 2) /**< external */
-#define SOF_MEM_CAPS_LP			(1 << 3) /**< low power */
-#define SOF_MEM_CAPS_HP			(1 << 4) /**< high performance */
-#define SOF_MEM_CAPS_DMA			(1 << 5) /**< DMA'able */
-#define SOF_MEM_CAPS_CACHE			(1 << 6) /**< cacheable */
-#define SOF_MEM_CAPS_EXEC			(1 << 7) /**< executable */
+#define SOF_MEM_CAPS_RAM		BIT(0)
+#define SOF_MEM_CAPS_ROM		BIT(1)
+#define SOF_MEM_CAPS_EXT		BIT(2) /**< external */
+#define SOF_MEM_CAPS_LP			BIT(3) /**< low power */
+#define SOF_MEM_CAPS_HP			BIT(4) /**< high performance */
+#define SOF_MEM_CAPS_DMA		BIT(5) /**< DMA'able */
+#define SOF_MEM_CAPS_CACHE		BIT(6) /**< cacheable */
+#define SOF_MEM_CAPS_EXEC		BIT(7) /**< executable */
+#define SOF_MEM_CAPS_L3			BIT(8) /**< L3 memory */
 
 /*
  * overrun will cause ring buffer overwrite, instead of XRUN.
@@ -87,6 +89,9 @@ struct sof_ipc_comp {
  */
 #define SOF_BUF_UNDERRUN_PERMITTED	BIT(1)
 
+/* the UUID size in bytes, shared between FW and host */
+#define SOF_UUID_SIZE	16
+
 /* create new component buffer - SOF_IPC_TPLG_BUFFER_NEW */
 struct sof_ipc_buffer {
 	struct sof_ipc_comp comp;
@@ -140,6 +145,8 @@ enum sof_volume_ramp {
 	SOF_VOLUME_LOG,
 	SOF_VOLUME_LINEAR_ZC,
 	SOF_VOLUME_LOG_ZC,
+	SOF_VOLUME_WINDOWS_FADE,
+	SOF_VOLUME_WINDOWS_NO_FADE,
 };
 
 /* generic volume component */
@@ -234,7 +241,7 @@ struct sof_ipc_comp_process {
 	/* reserved for future use */
 	uint32_t reserved[7];
 
-	uint8_t data[];
+	unsigned char data[];
 } __packed;
 
 /* frees components, buffers and pipelines
-- 
2.39.2

