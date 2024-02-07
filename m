Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA23A59B61
	for <linux-sound@vger.kernel.org>; Wed,  7 Feb 2024 12:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707307771; cv=none; b=Wp3lH21bWslhoCrTolHmFqFIgPA+xE8TD4hKI5HgF5kavGcEL/YxRUMn4C9EgBF4gqpJWZuv5entpFuJc6lfVaPLr5uwxzN7kE+nsN0MNnOs9gAX4NAr1pFBTw6jlTaB4mU01bfRIpqg6muMM6um7sihTA1+co4GhJnL/0m0Ydw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707307771; c=relaxed/simple;
	bh=RtezLeKtYqzMMlD7l4M22QwSiNc/vjvRHMceNkkvGLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OosCEx/1Bfc1lVmKpRDgVdWL71NgBHSmhcHVVCMTtns4o8GQZI0TmyVxNzH2+wpdl5DR5NoS85iWZzP15YZOzpVehiH1y6R8+yDKZnagGe2RbSNRJzhrPLKqGhYl8jhYz0Edn5kA/Y2Jtg2ST2LnHd18IDnlbWJ0QvjH3B+YcZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kN58ZzBn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kN58ZzBn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707307763; x=1738843763;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RtezLeKtYqzMMlD7l4M22QwSiNc/vjvRHMceNkkvGLc=;
  b=kN58ZzBn4UE9x9v2S3Udj/+t4Lcs37VN8WBaJSiYUSQbuwD4Omuj6YHI
   5Ky5tS4XaHhe7fEZDqVbg5v2Ohi62xqsDVMEwtC0v+12p4dNLLaLrdBKp
   j4sWDfRHs92EYTDGJU+523OqBkleXkhhtXsLdoa5zkMOqqQoI55FXNtv2
   U6F5GCT3dVkn1aHjZX0oCEMa/Pgo8bEEJFpgu7btPr+XRdG7WLYGRkmqa
   UG3Jbpl4fLZEo0/Jm+CdJVGKJMCHNSwBphOF31vh0Uu4LAO1LAF/TDVJg
   I6OW+OST0Mp9qom8DMQNOWqP8E3HiQi/kvfQt8awRUWeS/R6sR/lXDQrG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="4757845"
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="4757845"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 04:09:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,250,1701158400"; 
   d="scan'208";a="1631801"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by orviesa007.jf.intel.com with ESMTP; 07 Feb 2024 04:09:18 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 1/3] ASoC: Intel: avs: UAPI: Add tokens for initial config feature
Date: Wed,  7 Feb 2024 13:09:44 +0100
Message-Id: <20240207120946.2140480-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207120946.2140480-1-amadeuszx.slawinski@linux.intel.com>
References: <20240207120946.2140480-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Allow for defining initial config which will be send after module
initialization to configure initial module state. This is only useful
for modules which need to be configured on init.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 include/uapi/sound/intel/avs/tokens.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/uapi/sound/intel/avs/tokens.h b/include/uapi/sound/intel/avs/tokens.h
index 4ffe546aa409a..4beca03405c07 100644
--- a/include/uapi/sound/intel/avs/tokens.h
+++ b/include/uapi/sound/intel/avs/tokens.h
@@ -19,6 +19,8 @@ enum avs_tplg_token {
 	AVS_TKN_MANIFEST_NUM_MODCFGS_EXT_U32		= 6,
 	AVS_TKN_MANIFEST_NUM_PPLCFGS_U32		= 7,
 	AVS_TKN_MANIFEST_NUM_BINDINGS_U32		= 8,
+	AVS_TKN_MANIFEST_NUM_CONDPATH_TMPLS_U32		= 9,
+	AVS_TKN_MANIFEST_NUM_INIT_CONFIGS_U32		= 10,
 
 	/* struct avs_tplg_library */
 	AVS_TKN_LIBRARY_ID_U32				= 101,
@@ -109,6 +111,8 @@ enum avs_tplg_token {
 	AVS_TKN_MOD_PROC_DOMAIN_U8			= 1705,
 	AVS_TKN_MOD_MODCFG_EXT_ID_U32			= 1706,
 	AVS_TKN_MOD_KCONTROL_ID_U32			= 1707,
+	AVS_TKN_MOD_INIT_CONFIG_NUM_IDS_U32		= 1708,
+	AVS_TKN_MOD_INIT_CONFIG_ID_U32			= 1709,
 
 	/* struct avs_tplg_path_template */
 	AVS_TKN_PATH_TMPL_ID_U32			= 1801,
@@ -125,6 +129,11 @@ enum avs_tplg_token {
 
 	/* struct avs_tplg_kcontrol */
 	AVS_TKN_KCONTROL_ID_U32				= 2301,
+
+	/* struct avs_tplg_init_config */
+	AVS_TKN_INIT_CONFIG_ID_U32			= 2401,
+	AVS_TKN_INIT_CONFIG_PARAM_U8			= 2402,
+	AVS_TKN_INIT_CONFIG_LENGTH_U32			= 2403,
 };
 
 #endif
-- 
2.34.1

