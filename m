Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D0C74E0A
	for <linux-sound@vger.kernel.org>; Thu,  8 Feb 2024 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707387816; cv=none; b=k5D2RbVrn8NPKhKRpR4nCaFl1fbdN0yA3xc67YmcOm0+3HX0iUgnPB3e/7R3bSRfg94NeGgzsBqOXsX5Nxf6ZlEGVsfGfM46mR4NFCj9ZVftvWGVynzgkMaQPE9+MmxagGzPML96ZG1FUCXXSAg80RcR9YYB311hU3GTNIxxswA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707387816; c=relaxed/simple;
	bh=RtezLeKtYqzMMlD7l4M22QwSiNc/vjvRHMceNkkvGLc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KyWf2IvLn4Ps6UIFAPH3cUPFR1DHPfomtoDhHpWLpRIdMeGoJZyZwnDR7UgYNsFtmwvbrOl+TB6HhSjZX3qundAl4JqoWE3tE49GR5culD4RTG6jtZRDsZggL0/rIESSVuxv8hmf9Om97r+dZW4583ajQXOP8ZrTnUa2HbwuSHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FUoOfmDH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FUoOfmDH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707387813; x=1738923813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RtezLeKtYqzMMlD7l4M22QwSiNc/vjvRHMceNkkvGLc=;
  b=FUoOfmDHsQIMG1r90hBWYlasKhKhBdFioBC65tY8H0S5eTe5ZJAR+C93
   E/4WLPKsW1kucdvwrd7J5W4AcxoBDVluWijP4n44VtVud6wXlkB+bnN4e
   8Jig+qZo1dh9Wco+gV4X869YFv7coSfeCFqTJuVr6WOxi1m3D8+eRAoz5
   of0iNGZEE6Lnq6kjsmUlzP07vvu1oGQBorUsy2YG9YQs96ADBTG9BLisO
   AEHtW7bxuw78A4QOQXW5IAGHBlYTD7Wok3kVuX+gpXe39eCw2mncJu2jW
   TCJ27tqzogXVJndRLIDryV5OAsBQTRSyN7TouKyaNu1OEHbVVodHD7FuJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="18699115"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="18699115"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 02:23:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1913784"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmviesa006.fm.intel.com with ESMTP; 08 Feb 2024 02:23:32 -0800
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH v2 1/3] ASoC: Intel: avs: UAPI: Add tokens for initial config feature
Date: Thu,  8 Feb 2024 11:23:58 +0100
Message-Id: <20240208102400.2497791-2-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
References: <20240208102400.2497791-1-amadeuszx.slawinski@linux.intel.com>
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

