Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534F8131183
	for <linux-sound@vger.kernel.org>; Tue,  2 Apr 2024 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712071126; cv=none; b=epZ6yhSrT0iQnU+WmYSiRVuhRhyUsSQw1+F2MbyOx3tiIP+hhRkHKqhQ6CgU11UY8JqZBmd4sPhY6eRFtapSMToF+j68ZgSncXCrqiaIsOr2vqB5DI9uLH/TxfaPChO6mcXIiFfc6UHuwhmEHJV+U5OEfMwjwYK2z8165CqTRVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712071126; c=relaxed/simple;
	bh=W6yWPOmHO+wzOMkTn0HjzafWo7pRLHPbcwWJchK/jQ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=arYBrQY1SAXSGBKf6zUeUd9sDdNKQAbrdfXP1QVF6pzHpFq98bey+wC3SoqOELdH6TzzBZZrjqCmwXsUkKkCmsqiWtKB1qNPTLm/vqh9L1RfADtYor/L7nLi8ELLthF8lXEvKDwnl0W5bxm7YIJGmB9YAakGN5xJ2k09o5sLHUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mz8zmA5Q; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mz8zmA5Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712071126; x=1743607126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W6yWPOmHO+wzOMkTn0HjzafWo7pRLHPbcwWJchK/jQ4=;
  b=Mz8zmA5QkXzE7ffjqKWZvUZKUX6yCgEiVpB5LgnL8L5AmmLytl54jrPU
   nuZnWfHg74Rs2tlbbTwpAcrmE08aiLbwQcWf4n9znffNccbHX8xt/q308
   r2luzY2dRWDszPx7dsYMXj3YbJdVwetfiMhU+qahUwpRImnYVx1z6HGvo
   grlA6N3DY/DHJoYr6TL6WxET5S11wNwR9QFuO7fc/kr4SUon1fQHlYXrJ
   KaT1igFlqXxhzSehEFd+w5pVISP2NTL061rk91kGgnHAsLzguhjEShUpR
   vm3F85OOZEsrrSQ/mLiXvy9PQCCr1Aa1+bWp8pSUUj1fDl+aWF6v/nvZp
   w==;
X-CSE-ConnectionGUID: hbPyt7qsQdmBd3V17LRE8w==
X-CSE-MsgGUID: MnFlPPZ0Rj+rapCM3qYWHw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="29730109"
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="29730109"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:44 -0700
X-CSE-ConnectionGUID: hOYbmliQRwiIHuHW1cjqBA==
X-CSE-MsgGUID: tzMHbD0ISwqNgUTMWsnIYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,175,1708416000"; 
   d="scan'208";a="22796530"
Received: from skhare-mobl5.amr.corp.intel.com (HELO pbossart-mobl6.intel.com) ([10.212.8.83])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 08:18:43 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Rander Wang <rander.wang@intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Subject: [PATCH 11/17] ASoC: SOF: Intel: hda: move helper to static inline
Date: Tue,  2 Apr 2024 10:18:22 -0500
Message-Id: <20240402151828.175002-12-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
References: <20240402151828.175002-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To allow using widget_to_sdev() in other files, move it as static inline
in shared header file.

Reviewed-by: Rander Wang <rander.wang@intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/intel/hda-dai.c | 8 --------
 sound/soc/sof/intel/hda.h     | 8 ++++++++
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/sof/intel/hda-dai.c b/sound/soc/sof/intel/hda-dai.c
index 86c2325e5949..3f2fd84907d2 100644
--- a/sound/soc/sof/intel/hda-dai.c
+++ b/sound/soc/sof/intel/hda-dai.c
@@ -29,14 +29,6 @@ static bool hda_use_tplg_nhlt;
 module_param_named(sof_use_tplg_nhlt, hda_use_tplg_nhlt, bool, 0444);
 MODULE_PARM_DESC(sof_use_tplg_nhlt, "SOF topology nhlt override");
 
-static struct snd_sof_dev *widget_to_sdev(struct snd_soc_dapm_widget *w)
-{
-	struct snd_sof_widget *swidget = w->dobj.private;
-	struct snd_soc_component *component = swidget->scomp;
-
-	return snd_soc_component_get_drvdata(component);
-}
-
 int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
 		   struct snd_sof_dai_config_data *data)
 {
diff --git a/sound/soc/sof/intel/hda.h b/sound/soc/sof/intel/hda.h
index eedd03020889..c939a24d770e 100644
--- a/sound/soc/sof/intel/hda.h
+++ b/sound/soc/sof/intel/hda.h
@@ -1006,4 +1006,12 @@ int hda_dai_config(struct snd_soc_dapm_widget *w, unsigned int flags,
 int hda_link_dma_cleanup(struct snd_pcm_substream *substream, struct hdac_ext_stream *hext_stream,
 			 struct snd_soc_dai *cpu_dai);
 
+static inline struct snd_sof_dev *widget_to_sdev(struct snd_soc_dapm_widget *w)
+{
+	struct snd_sof_widget *swidget = w->dobj.private;
+	struct snd_soc_component *component = swidget->scomp;
+
+	return snd_soc_component_get_drvdata(component);
+}
+
 #endif
-- 
2.40.1

