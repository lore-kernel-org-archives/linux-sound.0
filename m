Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F48539A
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 16:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715272472; cv=none; b=oPZYxiJObt8MsJnvytzd3+Xo+uV3hwM+L/ekm28ke7hfFMyPT77/6kU7mcX2dgVqXroPDk3B00tYljvQx1SAfvjy0O2a2a2emFcDnAYy2/ZVaakeB6KtG/zLCKCpr5riSFmK5c+QrHrAYrQF3ql/ow2tgsmqReoHQ83sRcMr1BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715272472; c=relaxed/simple;
	bh=NwPL9b9kOT7XFtkwmLOgpqy3mczmMWc5vCVdQ5uhZ0M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nIB19VBm045borHulwS4zR1x0J3j7eey82lvLAOh42efc/Bl2LwmqDsnn/f+sX8wecCIppEbb7RZzW2F78JqTZATHDcbNObynb/t9gI4slcVLclDDIKROi0oK+M18Q0u0b/xT1JjwpQOpSODri7oRoL1rY4oxWRJLFFv08E02L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5z3Tgul; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5z3Tgul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715272471; x=1746808471;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NwPL9b9kOT7XFtkwmLOgpqy3mczmMWc5vCVdQ5uhZ0M=;
  b=Y5z3TgulzDtvX/EAgIRBywKr//BMbijORMvlwDGm+AsGjlbNuFhbtuzc
   CdjtzwEXpmdmLBarHRkf3gOdpWjqeLjL8e3NihFSDY7yJPXrOo9YNHlja
   d12TfoJF3U5KJ7c3Qz4COY5zAbHvg7l3Dy7q97RfGaZPh3CwstBBXOtBm
   Df+YI/EW4Mx1rINn7juyBGZ9YDKvxbRbTV2a5SaKhUfb3f36fcGH5Irsk
   R8ryo3r+enCUCbkCf1V/9T90OJ7C4aJCBcnBm1O2uUI9hLtk5gcvQ7rlP
   Yf7XiEZ0O6zjxpJMRCyGl1mQ2/2v08qvwXCnhAckJoAL+E9NYb7Tjro5O
   g==;
X-CSE-ConnectionGUID: N863Vi3+S6izTud1BLMIDA==
X-CSE-MsgGUID: MO1vPap3SQ+B3W7q2kCG3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="15017552"
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="15017552"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:29 -0700
X-CSE-ConnectionGUID: 9xaPMpyVRrOMLt/hMn2Dug==
X-CSE-MsgGUID: Z/tFoEiaRN2baXoyfFY/Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,148,1712646000"; 
   d="scan'208";a="33761011"
Received: from ajunnare-mobl.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.213.181.85])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 09:34:28 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Brent Lu <brent.lu@intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/18] ASoC: Intel: maxim-common: add max_98373_dai_link function
Date: Thu,  9 May 2024 11:34:07 -0500
Message-Id: <20240509163418.67746-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
References: <20240509163418.67746-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Brent Lu <brent.lu@intel.com>

Add a helper function, max_98373_dai_link(), for machine driver to
initialize dai link of maxim max98373 speaker amplifier.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Brent Lu <brent.lu@intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_maxim_common.c | 9 +++++++++
 sound/soc/intel/boards/sof_maxim_common.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/sound/soc/intel/boards/sof_maxim_common.c b/sound/soc/intel/boards/sof_maxim_common.c
index 7e1f485dce7a..c38c5598d87f 100644
--- a/sound/soc/intel/boards/sof_maxim_common.c
+++ b/sound/soc/intel/boards/sof_maxim_common.c
@@ -188,6 +188,15 @@ int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd)
 }
 EXPORT_SYMBOL_NS(max_98373_spk_codec_init, SND_SOC_INTEL_SOF_MAXIM_COMMON);
 
+void max_98373_dai_link(struct device *dev, struct snd_soc_dai_link *link)
+{
+	link->codecs = max_98373_components;
+	link->num_codecs = ARRAY_SIZE(max_98373_components);
+	link->init = max_98373_spk_codec_init;
+	link->ops = &max_98373_ops;
+}
+EXPORT_SYMBOL_NS(max_98373_dai_link, SND_SOC_INTEL_SOF_MAXIM_COMMON);
+
 void max_98373_set_codec_conf(struct snd_soc_card *card)
 {
 	card->codec_conf = max_98373_codec_conf;
diff --git a/sound/soc/intel/boards/sof_maxim_common.h b/sound/soc/intel/boards/sof_maxim_common.h
index 8886f985de68..2d8257cc5229 100644
--- a/sound/soc/intel/boards/sof_maxim_common.h
+++ b/sound/soc/intel/boards/sof_maxim_common.h
@@ -25,6 +25,7 @@ extern struct snd_soc_ops max_98373_ops;
 extern const struct snd_soc_dapm_route max_98373_dapm_routes[];
 
 int max_98373_spk_codec_init(struct snd_soc_pcm_runtime *rtd);
+void max_98373_dai_link(struct device *dev, struct snd_soc_dai_link *link);
 void max_98373_set_codec_conf(struct snd_soc_card *card);
 int max_98373_trigger(struct snd_pcm_substream *substream, int cmd);
 
-- 
2.40.1

