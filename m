Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24DF5C54E69
	for <linux-sound@archiver.kernel.org>; Tue, 14 Nov 2023 20:11:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233792AbjKNULw (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Tue, 14 Nov 2023 15:11:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51420 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233399AbjKNULt (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Tue, 14 Nov 2023 15:11:49 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C080EB7
        for <linux-sound@vger.kernel.org>; Tue, 14 Nov 2023 12:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699992705; x=1731528705;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iP37RDitzrXGneJ3rKCjoMcrCYiKqc6SeOzU/KcDy8w=;
  b=MZJP0L+JskkXRJV+o04ytAb830Z0cxt4rbM76YD0R2qULX4dsh5UW8Z5
   H6uT+Tfa3tlX0H0I3vs1ciupwKBRHF1NbezGUqBEqL4ZNByIVfxt8TjKK
   TjPRr88rGqhBvJy5EKbs8BmZr9+NEGBXP/+RmUCQftO3ypRf/2n8ShBmG
   mElqte2w+zRTEX8nX9LnfXJR3tfKyx88q23EM8/B76fpG6LMTi0lSK48+
   bg+caTS0fHYGynrBQ54CZaEQudTBiNyXXi4zwOyB6wZk1W2Lvt/2tkymd
   mmNN7s/hVjrFiJVda1hJIjN6QW+7/3Nkz0E8vLx0xsqlxUhH1K7q2jBRx
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381134755"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="381134755"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 12:11:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855422440"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="855422440"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 12:11:38 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        linux-sound@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 11/16] ASoC: Intel Skylake: Switch to new stream-format interface
Date:   Tue, 14 Nov 2023 21:13:12 +0100
Message-Id: <20231114201317.1348066-12-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231114201317.1348066-1-cezary.rojewski@intel.com>
References: <20231114201317.1348066-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

To provide option for selecting different bit-per-sample than just the
maximum one, use the new format calculation mechanism.

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

