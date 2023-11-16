Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A6DDC5ACB3
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 11:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345054AbjKPLWo (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 06:22:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344966AbjKPLWk (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 06:22:40 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64997C1
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 03:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700133757; x=1731669757;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pZ8KkWlAC5FQ4sDN25COBS7V2ofaqlPLtHROUYObzCc=;
  b=Wx3X++gKueFPG1FqyCuMnXavnbyccsOZv2GtMcWWMf/Qawc2lfPXc1ka
   E3theSHYbX3RziaDx6+jcTn6xxr34rd4JFSmF8QuzPcQ4sRWQYBWEE+qS
   eVL+msYcEoZEQx+H1uW37GRVquXJOrudHoydkYoSFXP2kTM7Sg2crqQ6Z
   seVY7+MPfSp4KHV+bZ0GwYciA0ZBgPVP18/W3O56OK4+sKwyd0ORg1V0W
   fyITcHpnKXx0Lh3ImdZ8955WxDFVhkf8/lHlAcE2Ut5zcUQcSSBIrx0at
   OObzHEhNo/NbY4LbZFCVKtesBYiippy3z+mxIBdDtZpgSLPxx42mz0/Wt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457562084"
X-IronPort-AV: E=Sophos;i="6.04,308,1695711600"; 
   d="scan'208";a="457562084"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 03:22:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="6698275"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2023 03:22:15 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 16/16] ASoC: Intel: avs: Unhardcode HDAudio BE DAI drivers description
Date:   Thu, 16 Nov 2023 12:22:55 +0100
Message-Id: <20231116112255.1584795-17-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116112255.1584795-1-cezary.rojewski@intel.com>
References: <20231116112255.1584795-1-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

To not expose more than in fact is supported by the codec, update CPU
DAI initialization procedure to rely on codec capabilities instead of
hardcoding them. This includes subformat which is currently ignored.

As capabilities for HDMI streams are initialized on PCM open, leave it
as is for now.

Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/avs/pcm.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 73f0fadb97b9..3e2c3f2f1d38 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -17,6 +17,7 @@
 #include "avs.h"
 #include "path.h"
 #include "topology.h"
+#include "../../codecs/hda.h"
 
 struct avs_dma_data {
 	struct avs_tplg_path_template *template;
@@ -1406,6 +1407,15 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 				ret = -ENOMEM;
 				goto exit;
 			}
+
+			if (!hda_codec_is_display(codec)) {
+				dais[i].playback.formats = pcm->stream[0].formats;
+				dais[i].playback.subformats = pcm->stream[0].subformats;
+				dais[i].playback.rates = pcm->stream[0].rates;
+				dais[i].playback.channels_min = pcm->stream[0].channels_min;
+				dais[i].playback.channels_max = pcm->stream[0].channels_max;
+				dais[i].playback.sig_bits = pcm->stream[0].maxbps;
+			}
 		}
 
 		if (pcm->stream[1].substreams) {
@@ -1416,6 +1426,15 @@ static int avs_component_hda_probe(struct snd_soc_component *component)
 				ret = -ENOMEM;
 				goto exit;
 			}
+
+			if (!hda_codec_is_display(codec)) {
+				dais[i].capture.formats = pcm->stream[1].formats;
+				dais[i].capture.subformats = pcm->stream[1].subformats;
+				dais[i].capture.rates = pcm->stream[1].rates;
+				dais[i].capture.channels_min = pcm->stream[1].channels_min;
+				dais[i].capture.channels_max = pcm->stream[1].channels_max;
+				dais[i].capture.sig_bits = pcm->stream[1].maxbps;
+			}
 		}
 
 		dai = snd_soc_register_dai(component, &dais[i], false);
-- 
2.25.1

