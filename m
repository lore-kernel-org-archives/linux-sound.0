Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C0DC54FB9
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 11:22:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345110AbjKPLWX (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 06:22:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235755AbjKPLWJ (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 06:22:09 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 541DC1706
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 03:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700133722; x=1731669722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4UOEvn702N4fihUnjUfPGzlzRNBWx+HvAKvLncMaRwQ=;
  b=W9Tnrnyu3lVhLCMbwLQz+SilXMrUhBH9a5JL7rg787OyM0k1HnZf1LLy
   PHM9SSyO4orXUXTVviiFPEmzTbmchrsW7ufKgtwpOXcl0PdZoTlc9rwDr
   6tXPkPaLIiU2N1kmk3b8tLdbMpBsOM0LBYZfJkwwf9KbNbQHGuzqUjxs+
   f4zKh7mfJd6Yo6pfaWAiRnjXMHEJlJ/q4FqUUKpYCZyPcMJuEZ0xQT5FR
   mxmVWsUhf2d06L+hYXZaI/Bwhxiwax6UWj9oOxVJAO2xXFKKUbku3o/is
   ONKKAugBv35RT4S3LHgdk+sCJErJlEsyBvmdQnoZKhD9SX7OxsutScq64
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457562031"
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="457562031"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 03:22:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="6698249"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2023 03:22:00 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 10/16] ASoC: codecs: hdac_hdmi: Switch to new stream-format interface
Date:   Thu, 16 Nov 2023 12:22:49 +0100
Message-Id: <20231116112255.1584795-11-cezary.rojewski@intel.com>
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
 sound/soc/codecs/hdac_hdmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/hdac_hdmi.c b/sound/soc/codecs/hdac_hdmi.c
index 3e4f632d8665..824fb4862f22 100644
--- a/sound/soc/codecs/hdac_hdmi.c
+++ b/sound/soc/codecs/hdac_hdmi.c
@@ -468,13 +468,14 @@ static int hdac_hdmi_set_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_hdmi_priv *hdmi = snd_soc_dai_get_drvdata(dai);
 	struct hdac_hdmi_dai_port_map *dai_map;
 	struct hdac_hdmi_pcm *pcm;
+	unsigned int bps;
 	int format;
 
 	dai_map = &hdmi->dai_map[dai->id];
 
-	format = snd_hdac_calc_stream_format(params_rate(hparams),
-			params_channels(hparams), params_format(hparams),
-			dai->driver->playback.sig_bits, 0);
+	bps = snd_hdac_stream_format_bps(params_format(hparams), SNDRV_PCM_SUBFORMAT_STD,
+					 dai->driver->playback.sig_bits);
+	format = snd_hdac_stream_format(params_channels(hparams), bps, params_rate(hparams));
 
 	pcm = hdac_hdmi_get_pcm_from_cvt(hdmi, dai_map->cvt);
 	if (!pcm)
-- 
2.25.1

