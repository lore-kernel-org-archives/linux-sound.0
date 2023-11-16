Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E403AC197A0
	for <linux-sound@archiver.kernel.org>; Thu, 16 Nov 2023 11:22:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344985AbjKPLWM (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 16 Nov 2023 06:22:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235733AbjKPLV7 (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Thu, 16 Nov 2023 06:21:59 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3794A10D9
        for <linux-sound@vger.kernel.org>; Thu, 16 Nov 2023 03:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700133715; x=1731669715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=e/MRhjR0kzflry7uFf3SrUDC5vM1n+xeCA0SNUy3hoU=;
  b=IWePqRHUzmDoK+XOJr3//mAvJAcn1GdZzPYpa6x7J7BmUgfNvxUk+c9w
   q3x86JMhbLtJh3Oa9wpGOv8HLbz02WZMgF1Z9htBZ7pfM2PlT0PkRdKLj
   DaviW6xscinIKhABYn0TPhofPtJ1HinpLG/NgqZCUApT/W3bPtDI12NV9
   Fp+5jG+6JKaE4Sle6tl/o+wqP5T3Kxd/K5N7Rb05F/a70qQYJkvnWoyl8
   fI/KYAh69Mrcjll/9O3dbN1p1GjgSRIx4/2tkN/wnSIJTxq1tYq55TIjQ
   dwDS2EYZNYka39N8EJyMMjBmnxxOd/tz3E1IPDkU1r1LNq1blRJWNJA6S
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="457562008"
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="457562008"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 03:21:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,308,1694761200"; 
   d="scan'208";a="6698234"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2023 03:21:52 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v4 07/16] ALSA: hda/ca0132: Switch to new stream-format interface
Date:   Thu, 16 Nov 2023 12:22:46 +0100
Message-Id: <20231116112255.1584795-8-cezary.rojewski@intel.com>
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
 sound/pci/hda/patch_ca0132.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/pci/hda/patch_ca0132.c b/sound/pci/hda/patch_ca0132.c
index 748a3c40966e..aa312441604f 100644
--- a/sound/pci/hda/patch_ca0132.c
+++ b/sound/pci/hda/patch_ca0132.c
@@ -3022,8 +3022,7 @@ static int dma_convert_to_hda_format(struct hda_codec *codec,
 {
 	unsigned int format_val;
 
-	format_val = snd_hdac_calc_stream_format(sample_rate,
-				channels, SNDRV_PCM_FORMAT_S32_LE, 32, 0);
+	format_val = snd_hdac_stream_format(channels, 32, sample_rate);
 
 	if (hda_format)
 		*hda_format = (unsigned short)format_val;
-- 
2.25.1

