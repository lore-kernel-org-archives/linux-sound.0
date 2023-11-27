Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cdVszeL9"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC57138
	for <linux-sound@vger.kernel.org>; Mon, 27 Nov 2023 07:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701099320; x=1732635320;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GNdzKNeZPXBqxHIpXNRJBlZad9ZUikVKFXQgyY2nhUU=;
  b=cdVszeL9Lcc40i2rG1XI2txV2WBfUoPaE65CeEnL5vpt09o0iboG+CoM
   3uEFrfQlhFti4QScWN/VCfDIGUENviL3qJ0MbdzbzdMQd555W7COfOdRH
   jwhtp8joDg8IeCUSqPaBdWZ+jvCpILiTo5cP/syAL3hQeHLwUrYHSar/Q
   ULaF3MBg0GEcOM+j6ZSonJCP+LEPvy16CXW1XAsydTbFX/ZvCc3L9IibI
   7EeZCn5kgLPqrF7EpbzRlCJrsQsmXmm9E0iWHx/AE2baM4XgVQRNGNe+z
   HYd1bN6SvZnVZELwZcOWlKbRQqalIyHZO8hkAzE6R7velqSu/P+taigI+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="372894415"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="372894415"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="771956363"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; 
   d="scan'208";a="771956363"
Received: from acornagl-mobl.ger.corp.intel.com (HELO pujfalus-desk.ger.corp.intel.com) ([10.252.58.144])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2023 07:26:33 -0800
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	chao.song@linux.intel.com
Subject: [PATCH 05/27] ASoC: Intel: ssp-common: get codec name function
Date: Mon, 27 Nov 2023 17:26:32 +0200
Message-ID: <20231127152654.28204-6-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
References: <20231127152654.28204-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add a helper function to get codec name string from codec type enum
value.

Signed-off-by: Brent Lu <brent.lu@intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/intel/boards/sof_ssp_common.c | 21 +++++++++++++++++++++
 sound/soc/intel/boards/sof_ssp_common.h |  1 +
 2 files changed, 22 insertions(+)

diff --git a/sound/soc/intel/boards/sof_ssp_common.c b/sound/soc/intel/boards/sof_ssp_common.c
index 41a258e45a61..96072790e9c0 100644
--- a/sound/soc/intel/boards/sof_ssp_common.c
+++ b/sound/soc/intel/boards/sof_ssp_common.c
@@ -96,6 +96,27 @@ enum sof_ssp_codec sof_ssp_detect_amp_type(struct device *dev)
 }
 EXPORT_SYMBOL_NS(sof_ssp_detect_amp_type, SND_SOC_INTEL_SOF_SSP_COMMON);
 
+const char *sof_ssp_get_codec_name(enum sof_ssp_codec codec_type)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(codecs); i++) {
+		if (codecs[i].codec_type != codec_type)
+			continue;
+
+		return codecs[i].name;
+	}
+	for (i = 0; i < ARRAY_SIZE(amps); i++) {
+		if (amps[i].codec_type != codec_type)
+			continue;
+
+		return amps[i].name;
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL_NS(sof_ssp_get_codec_name, SND_SOC_INTEL_SOF_SSP_COMMON);
+
 MODULE_DESCRIPTION("ASoC Intel SOF Common Machine Driver Helpers");
 MODULE_AUTHOR("Brent Lu <brent.lu@intel.com>");
 MODULE_LICENSE("GPL");
diff --git a/sound/soc/intel/boards/sof_ssp_common.h b/sound/soc/intel/boards/sof_ssp_common.h
index e3fd6fb1db1c..6d827103479b 100644
--- a/sound/soc/intel/boards/sof_ssp_common.h
+++ b/sound/soc/intel/boards/sof_ssp_common.h
@@ -67,5 +67,6 @@ enum sof_ssp_codec {
 
 enum sof_ssp_codec sof_ssp_detect_codec_type(struct device *dev);
 enum sof_ssp_codec sof_ssp_detect_amp_type(struct device *dev);
+const char *sof_ssp_get_codec_name(enum sof_ssp_codec codec_type);
 
 #endif /* __SOF_SSP_COMMON_H */
-- 
2.43.0

