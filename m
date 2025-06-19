Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2CC23956A
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 12:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750335092; cv=none; b=ma6Niw2iqZ0IRqH/Xsmx2ephCaoTe9S/u7xfBSgo4LXzGmvTE9bEYFK1SQ+qub5WiekOrUXmGiLwXhc732bnBFhXTmL5u8hmsibka++8y4XKXEx2JAA544GoT+o0JUema9iF/opqhjFXzY21HCh40uuUHKfEgksnn/9vgohqkpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750335092; c=relaxed/simple;
	bh=JH4hg4GCIzoQUiIxPyT5oyeo0WMBusBNoun4rZkv99c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=blRQGICB+0h1p8KZNw/pYwDGAFgV/B8b1RhdwqxiKe+umx7FYnkCT84t92bUrZ+VmR2Pzg1CXwr/WcSdO3LuLr0An7brC82I/sPp6omu4MAboRJEe1ipW/trRlnZGrSAFCi7Sl0J5GO9olhXy+w5W0TSTkqOsm/wke4ZuVCtrmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IuTJ99Pc; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IuTJ99Pc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750335091; x=1781871091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JH4hg4GCIzoQUiIxPyT5oyeo0WMBusBNoun4rZkv99c=;
  b=IuTJ99Pc6w4Re/5grwDNLQxAQFwMEYDmNxL9pKOZ/klhsz4tUd7FhCDY
   rh61vtFng56ZMeXPqYCM0BBb/cbBEl1EiM9RvYOC+onxNnB/7+GHfvFBQ
   Z9wZxGw99DtPvYG59BOoxQr9j2loNO7nuChPBU6hu5TIqcVrDTb7he3lF
   OyCCFZCuHf7FSh5VpOHfhUHLiMqg5hI/9/dKHGCw9ojyg9lkmJy0nUppO
   9ImMqxYkEAwV4WCXjd2LipZwopWr/O55xTsOp99DkdgWgpKi320XDvREW
   BT4IBwHJaiDYmeoUcYEktuZL3o7wQlx7BJ2CU4yg4+Pmp6ashuK25nFM0
   g==;
X-CSE-ConnectionGUID: IKRS2+0wSziiSsL7+pPmfA==
X-CSE-MsgGUID: Y+QsYwZqRTK8N+Vp+NDkMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52555690"
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="52555690"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:11:25 -0700
X-CSE-ConnectionGUID: ZelJGbGtQ0SkAa2SJ9Xcug==
X-CSE-MsgGUID: dc522BWFTDejKibpWSN3hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,248,1744095600"; 
   d="scan'208";a="155013351"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.246.182])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2025 05:11:21 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	guennadi.liakhovetski@linux.intel.com,
	liam.r.girdwood@intel.com,
	jyri.sarha@linux.intel.com
Subject: [PATCH 1/3] ASoC: SOF: ipc4: Add sof_ipc4_pipeline_state_str() for debugging
Date: Thu, 19 Jun 2025 15:11:19 +0300
Message-ID: <20250619121121.25241-2-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619121121.25241-1-peter.ujfalusi@linux.intel.com>
References: <20250619121121.25241-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jyri Sarha <jyri.sarha@linux.intel.com>

Add sof_ipc4_pipeline_state_str() to translate enum
sof_ipc4_pipeline_state into human readable form.

Signed-off-by: Jyri Sarha <jyri.sarha@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
---
 sound/soc/sof/ipc4-priv.h |  3 +++
 sound/soc/sof/ipc4.c      | 25 +++++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/sound/soc/sof/ipc4-priv.h b/sound/soc/sof/ipc4-priv.h
index 58b032820683..a256528e030f 100644
--- a/sound/soc/sof/ipc4-priv.h
+++ b/sound/soc/sof/ipc4-priv.h
@@ -123,4 +123,7 @@ size_t sof_ipc4_find_debug_slot_offset_by_type(struct snd_sof_dev *sdev,
 
 void sof_ipc4_mic_privacy_state_change(struct snd_sof_dev *sdev, bool state);
 
+enum sof_ipc4_pipeline_state;
+const char *sof_ipc4_pipeline_state_str(enum sof_ipc4_pipeline_state state);
+
 #endif
diff --git a/sound/soc/sof/ipc4.c b/sound/soc/sof/ipc4.c
index 37e837b22ac8..0b91bd443025 100644
--- a/sound/soc/sof/ipc4.c
+++ b/sound/soc/sof/ipc4.c
@@ -237,6 +237,26 @@ static void sof_ipc4_log_header(struct device *dev, u8 *text, struct sof_ipc4_ms
 				msg->extension, str);
 	}
 }
+
+const char *sof_ipc4_pipeline_state_str(enum sof_ipc4_pipeline_state state)
+{
+	switch (state) {
+	case SOF_IPC4_PIPE_INVALID_STATE:
+		return " (INVALID_STATE)";
+	case SOF_IPC4_PIPE_UNINITIALIZED:
+		return " (UNINITIALIZED)";
+	case SOF_IPC4_PIPE_RESET:
+		return " (RESET)";
+	case SOF_IPC4_PIPE_PAUSED:
+		return " (PAUSED)";
+	case SOF_IPC4_PIPE_RUNNING:
+		return " (RUNNING)";
+	case SOF_IPC4_PIPE_EOS:
+		return " (EOS)";
+	default:
+		return " (<unknown>)";
+	}
+}
 #else /* CONFIG_SND_SOC_SOF_DEBUG_VERBOSE_IPC */
 static void sof_ipc4_log_header(struct device *dev, u8 *text, struct sof_ipc4_msg *msg,
 				bool data_size_valid)
@@ -254,6 +274,11 @@ static void sof_ipc4_log_header(struct device *dev, u8 *text, struct sof_ipc4_ms
 	else
 		dev_dbg(dev, "%s: %#x|%#x\n", text, msg->primary, msg->extension);
 }
+
+const char *sof_ipc4_pipeline_state_str(enum sof_ipc4_pipeline_state state)
+{
+	return "";
+}
 #endif
 
 static void sof_ipc4_dump_payload(struct snd_sof_dev *sdev,
-- 
2.49.0

