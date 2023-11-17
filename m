Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2835FC072A2
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 12:04:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbjKQMEX (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 07:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231345AbjKQMEU (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 07:04:20 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B44EA5
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 04:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222657; x=1731758657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2YYQR5ixxhTMKNWeou1HeGzKjXJ4T6/uurneYHpopNo=;
  b=ao1MPYPM1HdFFNQb0NKVE9bpqK3zuRG0fQsWoNh3Pph2KxorLo9BY6Tp
   rm+OsGsiEmlNR5ggVQ4lV4h/gpavcA5JjsG0apOKr35Z/cj60oM906NOL
   AqtPNecoW021XH8dpiJFeUIH41efJlFxCBxPvSaucvwAYrcB35Kc4Z+47
   41wlR3XCj4lvzuI6p/GmTKLkRq/2SUWxolr7dpux00mLKKFaD2kxp6GQm
   YcYTf3ijVCn4pBemYhss6J7Xq0TfoOB+Mq6NmetbQOOmiaei3u7m664+J
   IdczTnKyDpthuzpT0WBKAE5aFiQgY4Uv72C/YGw0GUnU+QhcIcUv+9HJu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675230"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="381675230"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:04:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110178"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="883110178"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:14 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v5 06/16] ALSA: hda/hdmi: Switch to new stream-format interface
Date:   Fri, 17 Nov 2023 13:06:00 +0100
Message-Id: <20231117120610.1755254-7-cezary.rojewski@intel.com>
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

