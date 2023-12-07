Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hIr15kHW"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBB7D53
	for <linux-sound@vger.kernel.org>; Thu,  7 Dec 2023 14:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701988224; x=1733524224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0d60EUy/Rv1jcqrB9RHzlJjXK5+aoVyqe1eJuA5s570=;
  b=hIr15kHWP/+AWT2man1GVWs2RBb8R7CavMfLRQiupqEaeF5zGxEleTvH
   xZ/Mg3jtco/kW+alsuR2zfglMuDIFBvu6p5JtlbXQDSM9so3UgV+NxQ9N
   d3rO39NdE+3ovuC4wPufXah/iCh8OoxzARe0l11clClAVJBhjfUEI0LkY
   OVoi7nLJasX057IchKiQqP9Twt9zhqXU734QWiE0jm8mA74PAvdoo19Qi
   JWUkAFVcEH9CKEEv4ItIBWqJMTZ1vi48OplG7I+Vb76VzIwIh083kgKJx
   Pw5asGM1f7si+gw46njKOctQvL1XvZ84O/vQnD46gAHhfpyxdKDVBJWxi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="480516682"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="480516682"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 14:30:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="895307507"
X-IronPort-AV: E=Sophos;i="6.04,258,1695711600"; 
   d="scan'208";a="895307507"
Received: from hrcolco-mobl3.amr.corp.intel.com (HELO pbossart-mobl3.amr.corp.intel.com) ([10.212.148.159])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 14:30:22 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	vinod.koul@intel.com,
	Bard liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	srinivas.kandagatla@linaro.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	vijendar.mukunda@amd.com,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Shuming Fan <shumingf@realtek.com>,
	Jack Yu <jack.yu@realtek.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [RFC PATCH 13/16] soundwire: intel: add BPT context definition
Date: Thu,  7 Dec 2023 16:29:41 -0600
Message-Id: <20231207222944.663893-14-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
References: <20231207222944.663893-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is needed to be shared between open/send_async/close.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 drivers/soundwire/intel.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/soundwire/intel.h b/drivers/soundwire/intel.h
index 511932c55216..2289719f318c 100644
--- a/drivers/soundwire/intel.h
+++ b/drivers/soundwire/intel.h
@@ -48,11 +48,23 @@ struct sdw_intel_link_res {
 	struct hdac_bus *hbus;
 };
 
+struct sdw_intel_bpt {
+	struct hdac_ext_stream *bpt_tx_stream;
+	struct snd_dma_buffer dmab_tx_bdl;
+	struct hdac_ext_stream *bpt_rx_stream;
+	struct snd_dma_buffer dmab_rx_bdl;
+	unsigned int pdi0_buffer_size;
+	unsigned int pdi1_buffer_size;
+	unsigned int num_frames;
+	unsigned int data_per_frame;
+};
+
 struct sdw_intel {
 	struct sdw_cdns cdns;
 	int instance;
 	struct sdw_intel_link_res *link_res;
 	bool startup_done;
+	struct sdw_intel_bpt bpt_ctx;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *debugfs;
 #endif
-- 
2.39.2

