Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611B41CDA2E
	for <linux-sound@vger.kernel.org>; Fri,  4 Apr 2025 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756416; cv=none; b=J7j9fFhPXSidWoegGjg8NRx+0HbcLMqUfs04pDK+IAXajFSfmgRZ18wlW3U8NIbj9jMSLCFYULEC6YT2pSrByLXnxoy2PCDZ4CGCQVXY6mKYMFp2tr3yF/R5TRQj6KGe0EWFzNovyICI29HQTMER8nDJMripQ+uGG75tMAxd+EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756416; c=relaxed/simple;
	bh=/UevfbcnTbZEaJA+Qe7d8HKfUxCq/djTs56rCJbxT0w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rzxbfYgfef79RRFcVChrGnkPP6ns9dbjEjU9bnjwYmyBquMoblaqj+KJSrfB3SKbCz+4TPef6okrSc0nxF7DQV0PWeNoc3kclm0aEusTQz4SZRoXVX03oNiTk4suXffYuL4eCTVihkBY+1MSJ18YbKLCgEkgQV9WrtiKqmj3aIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=goKlX0am; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="goKlX0am"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743756414; x=1775292414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/UevfbcnTbZEaJA+Qe7d8HKfUxCq/djTs56rCJbxT0w=;
  b=goKlX0amLKV+qhp0aSWev5aCQ7FsMkOQU67FF7qkqYFb7ijZEHhampyZ
   XD90lg1m9ObR8BENZQtjOjOmb47aHpo/SAhv48tjb1mnVepGDv+AuSRkX
   UZCz+ngZOG3GE0Yd9CwstHh8PvfH/0iNzyiW1wdSIZxnnomLeOsxlCBnD
   CBupjLQgkAnXJrQHbd+agvbW5Q4SRM/WVI4MMiPd7od89ailLcJqglqoL
   RNrftgAQ1brzB/p2aEEgn7Oej6yOaC1vo1btYVEXQ5odNFzGi/x9aLb1y
   ueRIJBAnhtgrbz0htJQC32cHF+aMLivPpF5H6Q37EGa4m49mInl43+E64
   Q==;
X-CSE-ConnectionGUID: CrxTvNw6QZGV9bm5Qbe3kw==
X-CSE-MsgGUID: 0F32tzazSquCqB12LeQ2fQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55854579"
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="55854579"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 01:46:51 -0700
X-CSE-ConnectionGUID: tqeUirR/R2COpZrxdqNPsQ==
X-CSE-MsgGUID: HPCYCE8VTV6QKCHNO1e8yA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,187,1739865600"; 
   d="scan'208";a="164464235"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa001.jf.intel.com with ESMTP; 04 Apr 2025 01:46:49 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 3/8] ASoC: Intel: avs: Rename AVS_CHANNELS_MAX define
Date: Fri,  4 Apr 2025 11:03:32 +0200
Message-Id: <20250404090337.3564117-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250404090337.3564117-1-cezary.rojewski@intel.com>
References: <20250404090337.3564117-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>

It is used for coefficient table in updown mixer module, which supports
maximum of 8 channels. However it does not represent HW capability.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/messages.h | 4 ++--
 sound/soc/intel/avs/path.c     | 2 +-
 sound/soc/intel/avs/topology.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/avs/messages.h b/sound/soc/intel/avs/messages.h
index 2f243802ccc2..673e4577df14 100644
--- a/sound/soc/intel/avs/messages.h
+++ b/sound/soc/intel/avs/messages.h
@@ -697,7 +697,7 @@ enum avs_sample_type {
 	AVS_SAMPLE_TYPE_FLOAT = 4,
 };
 
-#define AVS_CHANNELS_MAX	8
+#define AVS_COEFF_CHANNELS_MAX	8
 #define AVS_ALL_CHANNELS_MASK	UINT_MAX
 
 struct avs_audio_format {
@@ -846,7 +846,7 @@ struct avs_updown_mixer_cfg {
 	struct avs_modcfg_base base;
 	u32 out_channel_config;
 	u32 coefficients_select;
-	s32 coefficients[AVS_CHANNELS_MAX];
+	s32 coefficients[AVS_COEFF_CHANNELS_MAX];
 	u32 channel_map;
 } __packed;
 static_assert(sizeof(struct avs_updown_mixer_cfg) == 84);
diff --git a/sound/soc/intel/avs/path.c b/sound/soc/intel/avs/path.c
index ef0c1d125d66..d5cce357b162 100644
--- a/sound/soc/intel/avs/path.c
+++ b/sound/soc/intel/avs/path.c
@@ -452,7 +452,7 @@ static int avs_updown_mix_create(struct avs_dev *adev, struct avs_path_module *m
 	cfg.base.audio_fmt = *t->in_fmt;
 	cfg.out_channel_config = t->cfg_ext->updown_mix.out_channel_config;
 	cfg.coefficients_select = t->cfg_ext->updown_mix.coefficients_select;
-	for (i = 0; i < AVS_CHANNELS_MAX; i++)
+	for (i = 0; i < AVS_COEFF_CHANNELS_MAX; i++)
 		cfg.coefficients[i] = t->cfg_ext->updown_mix.coefficients[i];
 	cfg.channel_map = t->cfg_ext->updown_mix.channel_map;
 
diff --git a/sound/soc/intel/avs/topology.h b/sound/soc/intel/avs/topology.h
index 304880997717..f5601a4e3ec8 100644
--- a/sound/soc/intel/avs/topology.h
+++ b/sound/soc/intel/avs/topology.h
@@ -87,7 +87,7 @@ struct avs_tplg_modcfg_ext {
 		struct {
 			u32 out_channel_config;
 			u32 coefficients_select;
-			s32 coefficients[AVS_CHANNELS_MAX];
+			s32 coefficients[AVS_COEFF_CHANNELS_MAX];
 			u32 channel_map;
 		} updown_mix;
 		struct {
-- 
2.25.1

