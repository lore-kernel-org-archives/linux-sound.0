Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27345C197A0
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 11:22:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345140AbjKPLW1 (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 06:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235760AbjKPLWJ (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 06:22:09 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BD321720
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 03:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700133724; x=1731669724;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0zTT435H4Aa6NbSsO9Xp3cKN7tKRTDrpI5/uY43fyBo=;
  b=aMw85dhWxFylVY/TgFMShS4vTS4gb9KbOm0ZGnQevbod8xv/ify+I5My
   P5u3FyhEsKFGB9ofEBmgnHeB8mP1YZEgmRSCAODITK+zPMTrtxBJsST+1
   srUh+nnJRcSzfIi6sCVoFNUElojBL6znq2R9jf8tZ1tJAOXFR3hEHSYRc
   bBgu/Mw1EYOce7fXdZn1E9fa61y6K2W4bhkFgbD/86f3Efzm/VmM+f3Vc
   GWowWUCVt/8ViHkx9DvopZQT9K933lbxyxs4MKBjk46ikBxMopmKlVuaY
   Ghy+ZYNRqQ6VBWkCbvx4RHZGbiMJCLSApNFf8LMG7Y2X7CYIvtG1T761/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457562036"
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="457562036"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 03:22:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="6698253"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2023 03:22:02 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 11/16] ASoC: Intel Skylake: Switch to new stream-format interface
Date:   Thu, 16 Nov 2023 12:22:50 +0100
Message-Id: <20231116112255.1584795-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116112255.1584795-1-cezary.rojewski@intel.com>
References: <20231116112255.1584795-1-cezary.rojewski@intel.com>
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
 sound/soc/intel/skylake/skl-pcm.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
index d0c02e8a6785..7331cbbf75ea 100644
--- a/sound/soc/intel/skylake/skl-pcm.c
+++ b/sound/soc/intel/skylake/skl-pcm.c
@@ -127,6 +127,7 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	unsigned int format_val;
 	struct hdac_stream *hstream;
 	struct hdac_ext_stream *stream;
+	unsigned int bps;
 	int err;
 
 	hstream = snd_hdac_get_stream(bus, params->stream,
@@ -137,8 +138,8 @@ int skl_pcm_host_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	stream = stream_to_hdac_ext_stream(hstream);
 	snd_hdac_ext_stream_decouple(bus, stream, true);
 
-	format_val = snd_hdac_calc_stream_format(params->s_freq,
-			params->ch, params->format, params->host_bps, 0);
+	bps = snd_hdac_stream_format_bps(params->format, SNDRV_PCM_SUBFORMAT_STD, params->host_bps);
+	format_val = snd_hdac_stream_format(params->ch, bps, params->s_freq);
 
 	dev_dbg(dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
 		format_val, params->s_freq, params->ch, params->format);
@@ -165,6 +166,7 @@ int skl_pcm_link_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 	struct hdac_ext_stream *stream;
 	struct hdac_ext_link *link;
 	unsigned char stream_tag;
+	unsigned int bps;
 
 	hstream = snd_hdac_get_stream(bus, params->stream,
 					params->link_dma_id + 1);
@@ -173,8 +175,9 @@ int skl_pcm_link_dma_prepare(struct device *dev, struct skl_pipe_params *params)
 
 	stream = stream_to_hdac_ext_stream(hstream);
 	snd_hdac_ext_stream_decouple(bus, stream, true);
-	format_val = snd_hdac_calc_stream_format(params->s_freq, params->ch,
-					params->format, params->link_bps, 0);
+
+	bps = snd_hdac_stream_format_bps(params->format, SNDRV_PCM_SUBFORMAT_STD, params->link_bps);
+	format_val = snd_hdac_stream_format(params->ch, bps, params->s_freq);
 
 	dev_dbg(dev, "format_val=%d, rate=%d, ch=%d, format=%d\n",
 		format_val, params->s_freq, params->ch, params->format);
-- 
2.25.1

