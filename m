Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE89BC54E69
	for <linux-sound@archiver.kernel.org>; Tue, 14 Nov 2023 20:11:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233849AbjKNULf (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Tue, 14 Nov 2023 15:11:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233816AbjKNULd (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Tue, 14 Nov 2023 15:11:33 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A11D10F
        for <linux-sound@vger.kernel.org>; Tue, 14 Nov 2023 12:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699992690; x=1731528690;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GA8VlHDMdmcVDZ3lRaKAia5d6PdwAqVOFHsMlwEcNgs=;
  b=OUt1Kp+eIGvHMPCiouiiwmVXNPnq78yj195S1s5Bumrlemqt2fFkjXaG
   Tz9DmQntaUGuSg0x1rIQC1kTmZd2v4HSvlOnowGuEbL6dnc5ZPkFnfgxJ
   tCpBs4ZTu7/t5lS5CrSziyERLykv/ra2Ix7sohbPJxq4HsfKlvnouSP9A
   HXYMrGaGGBuSwgO9M1AQS+vhjM0MG3co/UBTVV/FUHPWuXj7R8u0MkWtq
   9UIIS8t55UqBAvITpyB1ld9vabXXP0RMODWWQG6oT5rr1lM8U9Gw34Cok
   bWiLhBcmCl+LV1X5n7wIq+MmznauJEHaRrvvJJ7z8nk7giY7icYuRY2uI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381134678"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="381134678"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 12:11:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855422410"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="855422410"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 12:11:28 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        linux-sound@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 06/16] ALSA: hda/hdmi: Switch to new stream-format interface
Date:   Tue, 14 Nov 2023 21:13:07 +0100
Message-Id: <20231114201317.1348066-7-cezary.rojewski@intel.com>
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
 sound/pci/hda/patch_hdmi.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 687b8b8fd7ac..dff2d7221982 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -1655,7 +1655,6 @@ static void hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
 
 #define I915_SILENT_RATE		48000
 #define I915_SILENT_CHANNELS		2
-#define I915_SILENT_FORMAT		SNDRV_PCM_FORMAT_S16_LE
 #define I915_SILENT_FORMAT_BITS	16
 #define I915_SILENT_FMT_MASK		0xf
 
@@ -1668,8 +1667,8 @@ static void silent_stream_enable_i915(struct hda_codec *codec,
 				 per_pin->dev_id, I915_SILENT_RATE);
 
 	/* trigger silent stream generation in hw */
-	format = snd_hdac_calc_stream_format(I915_SILENT_RATE, I915_SILENT_CHANNELS,
-					     I915_SILENT_FORMAT, I915_SILENT_FORMAT_BITS, 0);
+	format = snd_hdac_stream_format(I915_SILENT_CHANNELS, I915_SILENT_FORMAT_BITS,
+					I915_SILENT_RATE);
 	snd_hda_codec_setup_stream(codec, per_pin->cvt_nid,
 				   I915_SILENT_FMT_MASK, I915_SILENT_FMT_MASK, format);
 	usleep_range(100, 200);
-- 
2.25.1

