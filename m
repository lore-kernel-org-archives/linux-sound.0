Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E1E15FA9F
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 19:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716838576; cv=none; b=AHhHEyAgdea5IsPC+TCSFWPjtm5FWEMUJWaAly2mR4akoojtiDDGkn5GIAFs7GynZlIaGwLLGbfg//9ESP5W8XjGntVcCevJW9OZIqbzfwCpWpMRGbrxB2V/XBAw5zJztI7KC/FhbtkA77N2aF9ehUO2rNvjuLa+7jHtjd8dCqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716838576; c=relaxed/simple;
	bh=Axobvno4BTD+B4nQOHHdbjjD+fECyO9OmJP/teh7esw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hHPZoe2RcxV+ZdP4kPZWXPVa3cIOIEURicqj+PBaNsgo2i9XjhUPOUYNbvjufTf3Gt6SH8eTkUgEv3QHFo6sDogqZuGts/i7hj79zdyfCVWzCxPlWAbBR4Hp4pbZguceILjIYx74S85e6vlRpkdCxHKc1/95rcmkszXAXQ6p8o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MZ9kBMIY; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MZ9kBMIY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716838575; x=1748374575;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Axobvno4BTD+B4nQOHHdbjjD+fECyO9OmJP/teh7esw=;
  b=MZ9kBMIYGU3i2SHEChRRT3TNsw5PNZdneaD+aN8/K6dk0N3HfPDBLPnL
   cyu3EuzHF8/wQEFSk2G9u4Lq+NVUjChN2ijPl6OftTKh+Zr22bvWWSzIw
   b7iQLMGB1ZL3Rojc7cH0Gx21UfbyAlnNzuWF3Yu7+ctViX0ZB9W0lPt+G
   uWgNYLf+GNgO5tJbLvIQcJwVHFf5B6HyL57G0LI48C9636Gty+MC0zIJV
   YLp3+pPnonO5RtkNu49jHJNNYPueXjRkowZxF24hW+4Ut3QJkiZH+C7VX
   clPNYWo0ZfOBidyRx4CA/uaLlpgMGttKgqR8t3N3NoJP0m5r6hYkphzuZ
   Q==;
X-CSE-ConnectionGUID: QurAw+mpSvmWq6HA6V1LnQ==
X-CSE-MsgGUID: wmQZrXoVSWS1XTzRQVSNcA==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="13339342"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="13339342"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:14 -0700
X-CSE-ConnectionGUID: Xi4Y4G8QQb29T7kYrDfaUw==
X-CSE-MsgGUID: mfMnBCuJS0SH6BcIovSiYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="58029763"
Received: from unknown (HELO pbossart-mobl6.lan) ([10.125.110.221])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 12:36:13 -0700
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To: linux-sound@vger.kernel.org
Cc: alsa-devel@alsa-project.org,
	tiwai@suse.de,
	broonie@kernel.org,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	=?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: [PATCH 07/18] ASoC: Intel: sof_sdw: remove get_codec_dai_by_name
Date: Mon, 27 May 2024 14:35:41 -0500
Message-ID: <20240527193552.165567-8-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
References: <20240527193552.165567-1-pierre-louis.bossart@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Bard Liao <yung-chuan.liao@linux.intel.com>

get_codec_dai_by_name() is not used anymore. Remove it.

Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/intel/boards/sof_sdw.c        | 18 ------------------
 sound/soc/intel/boards/sof_sdw_common.h |  4 ----
 2 files changed, 22 deletions(-)

diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index e41b0d95e0ff..9dc50a6d5301 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -559,24 +559,6 @@ static const struct snd_kcontrol_new rt700_controls[] = {
 	SOC_DAPM_PIN_SWITCH("Speaker"),
 };
 
-struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
-					  const char * const dai_name[],
-					  int num_dais)
-{
-	struct snd_soc_dai *dai;
-	int index;
-	int i;
-
-	for (index = 0; index < num_dais; index++)
-		for_each_rtd_codec_dais(rtd, i, dai)
-			if (strstr(dai->name, dai_name[index])) {
-				dev_dbg(rtd->card->dev, "get dai %s\n", dai->name);
-				return dai;
-			}
-
-	return NULL;
-}
-
 /* these wrappers are only needed to avoid typecast compilation errors */
 int sdw_startup(struct snd_pcm_substream *substream)
 {
diff --git a/sound/soc/intel/boards/sof_sdw_common.h b/sound/soc/intel/boards/sof_sdw_common.h
index 3dfba6f6b95d..4e92ff65b537 100644
--- a/sound/soc/intel/boards/sof_sdw_common.h
+++ b/sound/soc/intel/boards/sof_sdw_common.h
@@ -134,10 +134,6 @@ struct mc_private {
 
 extern unsigned long sof_sdw_quirk;
 
-struct snd_soc_dai *get_codec_dai_by_name(struct snd_soc_pcm_runtime *rtd,
-					  const char * const dai_name[],
-					  int num_dais);
-
 int sdw_startup(struct snd_pcm_substream *substream);
 int sdw_prepare(struct snd_pcm_substream *substream);
 int sdw_trigger(struct snd_pcm_substream *substream, int cmd);
-- 
2.43.0

