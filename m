Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3537E6773B
	for <linux-sound@vger.kernel.org>; Tue, 20 Feb 2024 11:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708429761; cv=none; b=kTmoVDHAUJM+20HJxeAWvpWzPmRFvTrHqgVjQKbCmjjXkZCHA6wHplUqfEnTUymDC8WTdnpZbp016QjTAtI8E3RL1l/upk1FVqYNiAOAP805wA9mkCyUYdlReYFa5DaV0tQ1N9tiyN2WChlf3+pxSBQlP8x0qVhJBrjThTGAdmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708429761; c=relaxed/simple;
	bh=2z1uKWvVIwaQ2DKT6NQYhg3DF/4KBYL0i6xHWjR8mnk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iK4bYZ1T5vHOF3B9DpJ0JTKVT2zwegrqezXkfeTt8b2pkSoCPVbTpaPDafn7AWg3ZK+AUl9qsovvOAbZi8EYRN/52YyTazUn3oySSKwn922qyhg2R/zKMwHSsUGeS0wYMfGO0xZZoMTPZBeJiGeL+SOXcsebOIhFuW2s8m55XxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pn6pWIAc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pn6pWIAc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708429760; x=1739965760;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2z1uKWvVIwaQ2DKT6NQYhg3DF/4KBYL0i6xHWjR8mnk=;
  b=Pn6pWIAcOlfFSxJyBEGR+ih/ZPre+YvV1Gh4d3vk8xYnPMuYPKO9V3ff
   1s1gaDM+mE9atQKsoPkveadljj0F/HLg9JPsQM+oJ18jBTeVVWv4LKQ/5
   KXO9FH7dU6uV8Pj6FOYMQwlP3uliMvdpuwxKYpeBoRpzRymBnY4aSKKVr
   MSRrswz5wDcJlo0wuPJ4bhdKBkA+aGXXUq8YRW4PIwOZ7zfVWMKiRWwrl
   bE9L1Cts4ySkt81SYT0YipsziHLQt5HOwjgzMID+GGSfOoJKSJAJ9TmQx
   Gk738PG+6h/9KqmKv0VZSsoEWIoFD5a4IBOmn/cLjSPazUumUgRrB1jmU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2988924"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2988924"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 03:49:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="4750960"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa010.fm.intel.com with ESMTP; 20 Feb 2024 03:49:17 -0800
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	tiwai@suse.com,
	perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com,
	pierre-louis.bossart@linux.intel.com,
	hdegoede@redhat.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH 02/10] ASoC: Intel: avs: Fix sound clipping in single capture scenario
Date: Tue, 20 Feb 2024 12:50:27 +0100
Message-Id: <20240220115035.770402-3-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220115035.770402-1-cezary.rojewski@intel.com>
References: <20240220115035.770402-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To avoid sound clipping when there just one, single CAPTURE stream
ongoing, disable L1SEN before it is started. Any PLAYBACK stream or
additional CAPTURE allows L1SEN to be re-enabled.

Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 77 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 4dfc5a1ebb7c..2cafbc392cdb 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -643,6 +643,79 @@ static int avs_dai_fe_prepare(struct snd_pcm_substream *substream, struct snd_so
 	return 0;
 }
 
+static void avs_hda_stream_start(struct hdac_bus *bus, struct hdac_ext_stream *host_stream)
+{
+	struct hdac_stream *first_running = NULL;
+	struct hdac_stream *pos;
+	struct avs_dev *adev = hdac_to_avs(bus);
+
+	list_for_each_entry(pos, &bus->stream_list, list) {
+		if (pos->running) {
+			if (first_running)
+				break; /* more than one running */
+			first_running = pos;
+		}
+	}
+
+	/*
+	 * If host_stream is a CAPTURE stream and will be the only one running,
+	 * disable L1SEN to avoid sound clipping.
+	 */
+	if (!first_running) {
+		if (hdac_stream(host_stream)->direction == SNDRV_PCM_STREAM_CAPTURE)
+			avs_hda_l1sen_enable(adev, false);
+		snd_hdac_stream_start(hdac_stream(host_stream));
+		return;
+	}
+
+	snd_hdac_stream_start(hdac_stream(host_stream));
+	/*
+	 * If host_stream is the first stream to break the rule above,
+	 * re-enable L1SEN.
+	 */
+	if (list_entry_is_head(pos, &bus->stream_list, list) &&
+	    first_running->direction == SNDRV_PCM_STREAM_CAPTURE)
+		avs_hda_l1sen_enable(adev, true);
+}
+
+static void avs_hda_stream_stop(struct hdac_bus *bus, struct hdac_ext_stream *host_stream)
+{
+	struct hdac_stream *first_running = NULL;
+	struct hdac_stream *pos;
+	struct avs_dev *adev = hdac_to_avs(bus);
+
+	list_for_each_entry(pos, &bus->stream_list, list) {
+		if (pos == hdac_stream(host_stream))
+			continue; /* ignore stream that is about to be stopped */
+		if (pos->running) {
+			if (first_running)
+				break; /* more than one running */
+			first_running = pos;
+		}
+	}
+
+	/*
+	 * If host_stream is a CAPTURE stream and is the only one running,
+	 * re-enable L1SEN.
+	 */
+	if (!first_running) {
+		snd_hdac_stream_stop(hdac_stream(host_stream));
+		if (hdac_stream(host_stream)->direction == SNDRV_PCM_STREAM_CAPTURE)
+			avs_hda_l1sen_enable(adev, true);
+		return;
+	}
+
+	/*
+	 * If by stopping host_stream there is only a single, CAPTURE stream running
+	 * left, disable L1SEN to avoid sound clipping.
+	 */
+	if (list_entry_is_head(pos, &bus->stream_list, list) &&
+	    first_running->direction == SNDRV_PCM_STREAM_CAPTURE)
+		avs_hda_l1sen_enable(adev, false);
+
+	snd_hdac_stream_stop(hdac_stream(host_stream));
+}
+
 static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -664,7 +737,7 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		spin_lock_irqsave(&bus->reg_lock, flags);
-		snd_hdac_stream_start(hdac_stream(host_stream));
+		avs_hda_stream_start(bus, host_stream);
 		spin_unlock_irqrestore(&bus->reg_lock, flags);
 
 		/* Timeout on DRSM poll shall not stop the resume so ignore the result. */
@@ -694,7 +767,7 @@ static int avs_dai_fe_trigger(struct snd_pcm_substream *substream, int cmd, stru
 			dev_err(dai->dev, "pause FE path failed: %d\n", ret);
 
 		spin_lock_irqsave(&bus->reg_lock, flags);
-		snd_hdac_stream_stop(hdac_stream(host_stream));
+		avs_hda_stream_stop(bus, host_stream);
 		spin_unlock_irqrestore(&bus->reg_lock, flags);
 
 		ret = avs_path_reset(data->path);
-- 
2.25.1

