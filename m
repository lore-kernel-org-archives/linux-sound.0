Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6236C54E5B
	for <linux-sound@archiver.kernel.org>; Tue, 14 Nov 2023 20:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232388AbjKNUL3 (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Tue, 14 Nov 2023 15:11:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233399AbjKNUL1 (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Tue, 14 Nov 2023 15:11:27 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529D2D9
        for <linux-sound@vger.kernel.org>; Tue, 14 Nov 2023 12:11:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699992684; x=1731528684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/DT2AYyu+Qz3uwQDpyrR873wKiZMV4vSezxk2m3mjio=;
  b=R+PZ93rZkNzuzNrW4jw7hucwK6glxOgilCPATbLSXX9YGrr5GkYjuenB
   5BDJ2wrUNtAOccv1O12xmFl3sRAAO9tD6c1Byqp9TRRXm1VTeFnXKHfsD
   rDGydkqzkqskTAP9rE7LAeymB4+09dOrZHe+uY/Xig+VLVTHiz7VMJkG9
   /TgKsmNvQso2ayjOGUW4OcYMOStWPLWf5nyNEgGErHNBMbkiZudoSVo0I
   TWgeGtB/ge8ESKOSi3mvDBCa+52P4WypXFFxhq3O0zMKAGqQRBnGOrapO
   LceEgJqonZxSba2C8xqjrOIjdjNXNm7t4H1lbfDkx9vx0jIa3kxuKLamf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381134640"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="381134640"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 12:11:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855422398"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="855422398"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 12:11:21 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        linux-sound@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 03/16] ASoC: pcm: Honor subformat when configuring runtime
Date:   Tue, 14 Nov 2023 21:13:04 +0100
Message-Id: <20231114201317.1348066-4-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231114201317.1348066-1-cezary.rojewski@intel.com>
References: <20231114201317.1348066-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Subformat options are ignored when setting up hardware parameters and
assigning PCM stream capabilities. Account for them to allow for
granular format selection.

With introduction of subformats, copying hardware parameters becomes
a non-trivial operation. Implement a helper function to make things
simple.

Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 include/sound/soc.h |  1 +
 sound/soc/soc-pcm.c | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7792c393e238..ccc31bc41e92 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -620,6 +620,7 @@ enum snd_soc_trigger_order {
 struct snd_soc_pcm_stream {
 	const char *stream_name;
 	u64 formats;			/* SNDRV_PCM_FMTBIT_* */
+	u32 subformats;			/* for S32_LE format, SNDRV_PCM_SUBFMTBIT_* */
 	unsigned int rates;		/* SNDRV_PCM_RATE_* */
 	unsigned int rate_min;		/* min rate */
 	unsigned int rate_max;		/* max rate */
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 323e4d7b6adf..9d688917cce2 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -554,6 +554,12 @@ static void soc_pcm_hw_update_format(struct snd_pcm_hardware *hw,
 	hw->formats &= p->formats;
 }
 
+static void soc_pcm_hw_update_subformat(struct snd_pcm_hardware *hw,
+					struct snd_soc_pcm_stream *p)
+{
+	hw->subformats &= p->subformats;
+}
+
 /**
  * snd_soc_runtime_calc_hw() - Calculate hw limits for a PCM stream
  * @rtd: ASoC PCM runtime
@@ -592,6 +598,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 		soc_pcm_hw_update_chan(hw, cpu_stream);
 		soc_pcm_hw_update_rate(hw, cpu_stream);
 		soc_pcm_hw_update_format(hw, cpu_stream);
+		soc_pcm_hw_update_subformat(hw, cpu_stream);
 	}
 	cpu_chan_min = hw->channels_min;
 	cpu_chan_max = hw->channels_max;
@@ -613,6 +620,7 @@ int snd_soc_runtime_calc_hw(struct snd_soc_pcm_runtime *rtd,
 		soc_pcm_hw_update_chan(hw, codec_stream);
 		soc_pcm_hw_update_rate(hw, codec_stream);
 		soc_pcm_hw_update_format(hw, codec_stream);
+		soc_pcm_hw_update_subformat(hw, codec_stream);
 	}
 
 	/* Verify both a valid CPU DAI and a valid CODEC DAI were found */
@@ -1713,6 +1721,7 @@ static void dpcm_runtime_setup_fe(struct snd_pcm_substream *substream)
 		soc_pcm_hw_update_rate(hw, cpu_stream);
 		soc_pcm_hw_update_chan(hw, cpu_stream);
 		soc_pcm_hw_update_format(hw, cpu_stream);
+		soc_pcm_hw_update_subformat(hw, cpu_stream);
 	}
 
 }
@@ -1750,6 +1759,7 @@ static void dpcm_runtime_setup_be_format(struct snd_pcm_substream *substream)
 			codec_stream = snd_soc_dai_get_pcm_stream(dai, stream);
 
 			soc_pcm_hw_update_format(hw, codec_stream);
+			soc_pcm_hw_update_subformat(hw, codec_stream);
 		}
 	}
 }
-- 
2.25.1

