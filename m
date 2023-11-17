Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF711C47071
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 12:04:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbjKQME3 (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 07:04:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjKQME2 (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 07:04:28 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C70FA5
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 04:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222665; x=1731758665;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gR1Com1eW/AQxEIYG+ZwqjfqB9kT4ltLhiwwtTCtaYE=;
  b=GYJO0RfeQ/B7G+plUOhvl8sUGDyVncY75KxIWHzWNddUrKOuSn5ReAxJ
   19PRbHSz7sCp94TgaF7txck2dUu4HR19xtUGk/yk314PmdJIB5TLfp2Sq
   9BZUVECfMhjZFoTktGNdnR6h+Bn+2BsKl0llmFMwTQcw7Wcb8QcZQoknL
   K+eh+KO18iS+PzkYRbHIW5sV7hneTrS8BVY53QwJaul9I7EmDzy0ka5ve
   IyXuzpdGmUtBkVhrwEhDeS8exZP5uL5SHrtMgSoptQhEOvKX64r2Gk4Vs
   ax9PhJA6P/xtU+pAVTYo8umt3ZMdvvHtIh4dNl6F8W7obJ8zOOYAnqbTC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675274"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="381675274"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:04:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110197"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="883110197"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:23 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v5 10/16] ASoC: codecs: hdac_hdmi: Switch to new stream-format interface
Date:   Fri, 17 Nov 2023 13:06:04 +0100
Message-Id: <20231117120610.1755254-11-cezary.rojewski@intel.com>
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
 sound/soc/codecs/hdac_hdmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 3e4f632d8665..b3b11225d483 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -468,13 +468,14 @@ static int hdac_hdmi_set_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
 	struct hdac_hdmi_dai_port_map *dai_map;
 	struct hdac_hdmi_pcm *pcm;
+	unsigned int bits;
 	int format;
 
 	dai_map = &hdmi->dai_map[dai->id];
 
-	format = snd_hdac_calc_stream_format(params_rate(hparams),
-			params_channels(hparams), params_format(hparams),
-			dai->driver->playback.sig_bits, 0);
+	bits = snd_hdac_stream_format_bits(params_format(hparams), SNDRV_PCM_SUBFORMAT_STD,
+					   dai->driver->playback.sig_bits);
+	format = snd_hdac_stream_format(params_channels(hparams), bits, params_rate(hparams));
 
 	pcm = hdac_hdmi_get_pcm_from_cvt(hdmi, dai_map->cvt);
 	if (!pcm)
-- 
2.25.1

