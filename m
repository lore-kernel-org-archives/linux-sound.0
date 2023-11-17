Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75043C072A2
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 12:04:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230379AbjKQMEd (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 07:04:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjKQMEa (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 07:04:30 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7DBDA5
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 04:04:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222667; x=1731758667;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yMFZO1XFVSMnVTs0FKW+mfiZ2iIU7XgPnUanFhVdXKo=;
  b=YklAO0ANFCi1orkGRnedkKKHqBJhrhAWMQDmVodrY9p29bjvSck7DMpP
   w7xKjtALpplcOWPH5v+K9gtynycGf1KtCfT1C4/ixI7cSIfrQ6UanDDcR
   2ypaezq+uwbsKvILnyL3Zd0YHynXpgk+gT7Qo7xri6TBm59p/B3mQ8QEB
   zdDCPVWfhJ5luTxlzV/m5aH6N0G8NTuIy+BYfDl+4P5oK6dt+/9jFluNN
   ak4vDEDRA9oyhiNMdrBOh4Z9GSmkX7nX1BNpix8zlzmiXhMvJah/oaWso
   BUmDSoP5HmrQt2NJhowpjIKFX7lEpmCW3f7ryEqhZjrG9IP146Bn3jc2W
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675282"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="381675282"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:04:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110206"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="883110206"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:25 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v5 11/16] ASoC: Intel Skylake: Switch to new stream-format interface
Date:   Fri, 17 Nov 2023 13:06:05 +0100
Message-Id: <20231117120610.1755254-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231117120610.1755254-1-cezary.rojewski@intel.com>
References: <20231117120610.1755254-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

To provide option for selecting different bit-per-sample than just the
maximum one, use the new format calculation mechanism.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/skylake/skl-pcm.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index d0c02e8a6785..4d52e3b35850 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -127,6 +127,7 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	unsigned int format_val;
 	struct hdac_stream *hstream;
 	struct hdac_ext_stream *stream;
+	unsigned int bits;
 	int err;
 
 	hstream = snd_hdac_get_stream(bus, params->stream,
@@ -137,8 +138,9 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	stream = stream_to_hdac_ext_stream(hstream);
 	snd_hdac_ext_stream_decouple(bus, stream, true);
 
-	format_val = snd_hdac_calc_stream_format(params->s_freq,
-			params->ch, params->format, params->host_bps, 0);
+	bits = snd_hdac_stream_format_bits(params->format, SNDRV_PCM_SUBFORMAT_STD,
+					   params->host_bps);
+	format_val = snd_hdac_stream_format(params->ch, bits, params->s_freq);
 
 	dev_dbg(dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
 		format_val, params->s_freq, params->ch, params->format);
@@ -165,6 +167,7 @@ int skl_pcm_link_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	struct hdac_ext_stream *stream;
 	struct hdac_ext_link *link;
 	unsigned char stream_tag;
+	unsigned int bits;
 
 	hstream = snd_hdac_get_stream(bus, params->stream,
 					params->link_dma_id + 1);
@@ -173,8 +176,10 @@ int skl_pcm_link_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 
 	stream = stream_to_hdac_ext_stream(hstream);
 	snd_hdac_ext_stream_decouple(bus, stream, true);
-	format_val = snd_hdac_calc_stream_format(params->s_freq, params->ch,
-					params->format, params->link_bps, 0);
+
+	bits = snd_hdac_stream_format_bits(params->format, SNDRV_PCM_SUBFORMAT_STD,
+					   params->link_bps);
+	format_val = snd_hdac_stream_format(params->ch, bits, params->s_freq);
 
 	dev_dbg(dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
 		format_val, params->s_freq, params->ch, params->format);
-- 
2.25.1

