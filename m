Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48442C54E5B
	for <linux-sound@archiver.kernel.org>; Tue, 14 Nov 2023 20:11:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233054AbjKNULo (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Tue, 14 Nov 2023 15:11:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233928AbjKNULj (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Tue, 14 Nov 2023 15:11:39 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2C1F110
        for <linux-sound@vger.kernel.org>; Tue, 14 Nov 2023 12:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699992696; x=1731528696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=r3C9D/ZOT8r6LSMVlOB4rLGMeNzyjuAcizqBYhZOvqo=;
  b=gtSphseI59gVVtTp2GLh6xkUFrZ1woIt5w/d4Ep3P0tAgQk1BLz8QSYY
   LNmwTonKdfBZFJHmqgvLtG/3HQdimyxccuTl7xIKGzFBWSWRwTajMqjvY
   /iyJdSuMUzJgUq6jqE0fzg02wmL81r/ZpwJLceSPue3+xsY1FbHXGSDXE
   F3f8ZwSivo84Mn7BiNPgYEZxhpo6KfECBSwA9ydZkx+0Glel8dWhnAqMn
   Ja+CdkzCEtDLPNeup4M3yr3QEzr6l6Cv2Pnl76Nt3w16+uqmBXimhf/Gj
   B8P1iaRU8Vdis14a1qoo9/eJfo4qiIyvPFK587iDXPIuz+2nCTn9V9jV7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381134715"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="381134715"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 12:11:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855422428"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="855422428"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 12:11:34 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        linux-sound@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 09/16] ASoC: codecs: hdac_hda: Switch to new stream-format interface
Date:   Tue, 14 Nov 2023 21:13:10 +0100
Message-Id: <20231114201317.1348066-10-cezary.rojewski@intel.com>
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
 sound/soc/codecs/hdac_hda.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/hdac_hda.c b/sound/soc/codecs/hdac_hda.c
index 355f30779a34..c08375672661 100644
--- a/sound/soc/codecs/hdac_hda.c
+++ b/sound/soc/codecs/hdac_hda.c
@@ -215,18 +215,16 @@ static int hdac_hda_dai_hw_params(struct snd_pcm_substream *substream,
 	struct hdac_hda_priv *hda_pvt;
 	unsigned int format_val;
 	unsigned int maxbps;
+	unsigned int bps;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 		maxbps = dai->driver->playback.sig_bits;
 	else
 		maxbps = dai->driver->capture.sig_bits;
+	bps = snd_hdac_stream_format_bps(params_format(params), SNDRV_PCM_SUBFORMAT_STD, maxbps);
 
 	hda_pvt = snd_soc_component_get_drvdata(component);
-	format_val = snd_hdac_calc_stream_format(params_rate(params),
-						 params_channels(params),
-						 params_format(params),
-						 maxbps,
-						 0);
+	format_val = snd_hdac_stream_format(params_channels(params), bps, params_rate(params));
 	if (!format_val) {
 		dev_err(dai->dev,
 			"invalid format_val, rate=%d, ch=%d, format=%d, maxbps=%d\n",
-- 
2.25.1

