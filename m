Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9531C2325
	for <linux-sound@vger.kernel.org>; Wed, 16 Oct 2024 13:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729083710; cv=none; b=WsJ47V1hLzsaaK3K5ARnWJP7s8R1o2iLrvPEvUzh2IroVEcjsrcZy+hmfwlFxHEsCSLc8zovfQnrfSm79qHMoyRIfoVTkrc3nYIHlLSofEgx7/63sReEzSuSMa0n/7LwlvnCFNfnw2NRNuRGwuMy1uUbe60hbBu+WcA08ly9PmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729083710; c=relaxed/simple;
	bh=PRZHQ+AHptGUSm+fntC4dYprPdUah1lZ1vJxzlzL6l8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k9Ii2io+Fiua0YZkeFN1I+bzxKKYK2k6qRRHMn2NgqbUTPeeHF5eH+x1j8pvv6hMdDRmkMaMY1VFOf4yXPyiHMXBmYVFc8tCWCEDC4/PyyY46MYRGaAr7axXfnLWKX/qFP3yBGWJfmdhsUfOJLT/14WHrruhkBegQhwML68uLYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKVV9YkR; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKVV9YkR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729083709; x=1760619709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PRZHQ+AHptGUSm+fntC4dYprPdUah1lZ1vJxzlzL6l8=;
  b=CKVV9YkRf5Jr0TUvEAxZlUHDRjsIAMww9zmqm9hupLbj8nU7pLjJFrmp
   r05fkwG+UMZ6gRvVhfkELVEZSuzXN5puyWjqKsrTGG6o75F0k+sY8DBcF
   1cL2UnEWdMBuwtDFmWWX42104dFrjCoqBbPQjqMtNhH6SCQyLWzyVj42A
   /sRJbX8FSR9TzomwjnUcolnvQ/Z3SvzkMvit3kxkXlQKDaaT3SCZL2plq
   cyj0nh6rqhGervj0acEc8ByVxpLIFvplYhpoUH/f1CiQqUeIdfKfThoBl
   eYIsB/yukMAXgSH8J7P5/1XC2ugfam4kQmTV38f3Dk6R97FtR3L4TwnAr
   Q==;
X-CSE-ConnectionGUID: FcLPSDDHS1KClGlx/ltLlQ==
X-CSE-MsgGUID: 5afLzoCMRyGaUghIR216mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11226"; a="32450334"
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="32450334"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2024 06:01:48 -0700
X-CSE-ConnectionGUID: OyuqZPZATFWrliql3kGJ6g==
X-CSE-MsgGUID: NByL8VQyQRWDr4ELQvxi+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; 
   d="scan'208";a="78566158"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by fmviesa010.fm.intel.com with ESMTP; 16 Oct 2024 06:01:47 -0700
From: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>
Subject: [RFC PATCH 4/4] ASoC: Propagate DETECT trigger
Date: Wed, 16 Oct 2024 15:02:28 +0200
Message-Id: <20241016130228.1013227-5-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241016130228.1013227-1-amadeuszx.slawinski@linux.intel.com>
References: <20241016130228.1013227-1-amadeuszx.slawinski@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Adds support for DETECT trigger in ASoC API, so it can be propagated to
ALSA core.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-component.c | 2 ++
 sound/soc/soc-dai.c       | 2 ++
 sound/soc/soc-link.c      | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index b67ef78f405c3..1ac8acb326623 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1237,6 +1237,7 @@ int snd_soc_pcm_component_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_DETECT_START:
 		for_each_rtd_components(rtd, i, component) {
 			ret = soc_component_trigger(component, substream, cmd);
 			if (ret < 0)
@@ -1247,6 +1248,7 @@ int snd_soc_pcm_component_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_DETECT_STOP:
 		for_each_rtd_components(rtd, i, component) {
 			if (rollback && !soc_component_mark_match(component, substream, trigger))
 				continue;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 4a1c85ad5a8d6..41fc4ce682a63 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -616,6 +616,7 @@ int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_DETECT_START:
 		for_each_rtd_dais(rtd, i, dai) {
 			ret = soc_dai_trigger(dai, substream, cmd);
 			if (ret < 0)
@@ -630,6 +631,7 @@ int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_DETECT_STOP:
 		for_each_rtd_dais(rtd, i, dai) {
 			if (rollback && !soc_dai_mark_match(dai, substream, trigger))
 				continue;
diff --git a/sound/soc/soc-link.c b/sound/soc/soc-link.c
index 7f1f1bc717e2c..30d283062baee 100644
--- a/sound/soc/soc-link.c
+++ b/sound/soc/soc-link.c
@@ -163,6 +163,7 @@ int snd_soc_link_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_DETECT_START:
 		ret = soc_link_trigger(substream, cmd);
 		if (ret < 0)
 			break;
@@ -171,6 +172,7 @@ int snd_soc_link_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+	case SNDRV_PCM_TRIGGER_DETECT_STOP:
 		if (rollback && !soc_link_mark_match(rtd, substream, trigger))
 			break;
 
-- 
2.34.1

