Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPdFmILX"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F327BC4
	for <linux-sound@vger.kernel.org>; Mon,  4 Dec 2023 13:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701726446; x=1733262446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=icFwjaxRCtWGWbarUPvcsjVy6WE74SjVPsqb+5ZvB+E=;
  b=ZPdFmILXO+GL7yIU504Deumg3Yp7PFjXWZ/Ki7KiZgtj4/MmPK27daIW
   aKECEyEbiEKCgQuWDchjlkxxz1TJXQj1rHOpLXqhN45mS8qapzzr7OA0D
   Z187WSbGVArXwNaQFmEKtKJWFA9gLFmEGBm1Nnxpo89iiz0gKdzRi/ckk
   sOYClk2Uf1y5v5mdR42Iac6rNzmatac6f/gbVxr4IIVDkQRNIpq7hzIUu
   Z4H7pgA26MIopcHtNKCv/qEyoP6I9uZAoLX7UnoyXqiIbaLNwbIVA9eS/
   dVcg6c5rDllIqxoczUFTUT/EObNgYT0lFcRzaiAe5iB1bLRtFhb8T4raa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="373249524"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="373249524"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:47:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="746978909"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="746978909"
Received: from akashams-mobl.amr.corp.intel.com (HELO pbossart-mobl3.lan) ([10.255.231.189])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 13:47:25 -0800
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.de,
	broonie@kernel.org,
	Curtis Malainey <cujomalainey@chromium.org>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 4/4] ASoC: SOF: Wire up buffer flags
Date: Mon,  4 Dec 2023 15:47:13 -0600
Message-Id: <20231204214713.208951-5-pierre-louis.bossart@linux.intel.com>
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

From: Curtis Malainey <cujomalainey@chromium.org>

Buffer flags have been in firmware for ages but were never fully
implemented in the topology/kernel system. This commit finishes off the
implementation.

Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Signed-off-by: Curtis Malainey <cujomalainey@chromium.org>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 include/uapi/sound/sof/tokens.h | 1 +
 sound/soc/sof/ipc3-topology.c   | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/uapi/sound/sof/tokens.h b/include/uapi/sound/sof/tokens.h
index 0fb39780f9bd..ee5708934614 100644
--- a/include/uapi/sound/sof/tokens.h
+++ b/include/uapi/sound/sof/tokens.h
@@ -35,6 +35,7 @@
 /* buffers */
 #define SOF_TKN_BUF_SIZE			100
 #define SOF_TKN_BUF_CAPS			101
+#define SOF_TKN_BUF_FLAGS			102
 
 /* DAI */
 /* Token retired with ABI 3.2, do not use for new capabilities
diff --git a/sound/soc/sof/ipc3-topology.c b/sound/soc/sof/ipc3-topology.c
index 8c999e7721f2..1d9e1145fa8f 100644
--- a/sound/soc/sof/ipc3-topology.c
+++ b/sound/soc/sof/ipc3-topology.c
@@ -72,6 +72,8 @@ static const struct sof_topology_token buffer_tokens[] = {
 		offsetof(struct sof_ipc_buffer, size)},
 	{SOF_TKN_BUF_CAPS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
 		offsetof(struct sof_ipc_buffer, caps)},
+	{SOF_TKN_BUF_FLAGS, SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_buffer, flags)},
 };
 
 /* DAI */
-- 
2.39.2

