Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D819513FD9B
	for <linux-sound@vger.kernel.org>; Fri, 26 Apr 2024 09:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125422; cv=none; b=ddkycgMyVe1x0YoSAD7ssKdlCZz99b8/XweQVTb68e7PzSM20DzC+u1xxkkPmoY9809u7IkRnlAS/rEswcde+/uPwKyQ83kyKmQF4z0t38lYRlfK/aWBW2BzQeOgvYdnHV25k5YQBn11lJl9UFNMLqNfC0boidODnxm9BeBojVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125422; c=relaxed/simple;
	bh=cJfd0VnFG9YhYzSbRGhfArwkT7UjXbxFfPxrSep4Cqo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qEsJ7SgHBQhRJ4wyoB3gHHVqO+ANkiLx6alaCP+9ngaXEErAc8YrR1hIVn9RxU6fAxEw3blU54MPE5U6f5/xy4ZO57bTuDF28lD4w8zgWpu0JLySJut75xzNvSskX3QFz+M8wxsghW6rwl78k6wjKy0AoTWcRrrwLAs3HARZRQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HIGR25vC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HIGR25vC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714125421; x=1745661421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=cJfd0VnFG9YhYzSbRGhfArwkT7UjXbxFfPxrSep4Cqo=;
  b=HIGR25vCZ2y2eXl17W4qO8t+n7WdhA4+EsaKmT8eRRs6XkM5N007V3hC
   VLb6yEbbtVVwGx4tfDOrda9ugC6UUu+HtFr9b/+Sa/ElZpNrba6R+XXXj
   WlM9HJRaOsyyH9LiQna8lyMyBydKqKEcpH7cXUB5x6q+3/TdMTozvrHES
   mIPmC5Du98hb7QSmqnYArqFKbYx6QsWwoga09vpbYutK1SJKVgCK09PkQ
   0Q30P5S8q0J6n7XXaySQg1JFKDoOsZvmpCRQNGZm3iCBZM9QmwKxeiuNQ
   7siA4EHK6JLfDC8TjyNWt9mROWaw548jeSHMWNiHQ5QGsyVSNYUaOPFo8
   g==;
X-CSE-ConnectionGUID: 65m3CmyzT0mbiMkevcTLWw==
X-CSE-MsgGUID: 4NHDD/7WQeGaV2H+a9koPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20409217"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="20409217"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2024 02:57:01 -0700
X-CSE-ConnectionGUID: M4cu62lWSBC3dDGtRsxc1w==
X-CSE-MsgGUID: BYxq9KG7QBKbrSV8+KE7uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="25460615"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 26 Apr 2024 02:56:59 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 6/8] ASoC: Intel: avs: Remove redundancy around DAI prepare
Date: Fri, 26 Apr 2024 11:57:31 +0200
Message-Id: <20240426095733.3946951-7-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240426095733.3946951-1-cezary.rojewski@intel.com>
References: <20240426095733.3946951-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop unused arguments in the avs_dai_prepare() function. With the
function updated, it matches its template in snd_soc_dai_ops and can be
referenced throughout the pcm.c file without need of any wrappers.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 0771a9716f4b..d4557b7b1c6c 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -151,8 +151,7 @@ static int avs_dai_be_hw_params(struct snd_pcm_substream *substream,
 	return avs_dai_hw_params(substream, fe_hw_params, be_hw_params, dai, dma_id);
 }
 
-static int avs_dai_prepare(struct avs_dev *adev, struct snd_pcm_substream *substream,
-			   struct snd_soc_dai *dai)
+static int avs_dai_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
 {
 	struct avs_dma_data *data;
 	int ret;
@@ -201,11 +200,6 @@ static int avs_dai_nonhda_be_hw_free(struct snd_pcm_substream *substream, struct
 	return 0;
 }
 
-static int avs_dai_nonhda_be_prepare(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
-{
-	return avs_dai_prepare(to_avs_dev(dai->dev), substream, dai);
-}
-
 static int avs_dai_nonhda_be_trigger(struct snd_pcm_substream *substream, int cmd,
 				     struct snd_soc_dai *dai)
 {
@@ -261,7 +255,7 @@ static const struct snd_soc_dai_ops avs_dai_nonhda_be_ops = {
 	.shutdown = avs_dai_shutdown,
 	.hw_params = avs_dai_nonhda_be_hw_params,
 	.hw_free = avs_dai_nonhda_be_hw_free,
-	.prepare = avs_dai_nonhda_be_prepare,
+	.prepare = avs_dai_prepare,
 	.trigger = avs_dai_nonhda_be_trigger,
 };
 
@@ -381,7 +375,7 @@ static int avs_dai_hda_be_prepare(struct snd_pcm_substream *substream, struct sn
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		snd_hdac_ext_bus_link_set_stream_id(link, hdac_stream(link_stream)->stream_tag);
 
-	ret = avs_dai_prepare(to_avs_dev(dai->dev), substream, dai);
+	ret = avs_dai_prepare(substream, dai);
 	if (ret)
 		return ret;
 
@@ -672,7 +666,7 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	if (ret < 0)
 		return ret;
 
-	ret = avs_dai_prepare(data->adev, substream, dai);
+	ret = avs_dai_prepare(substream, dai);
 	if (ret)
 		return ret;
 
-- 
2.25.1

