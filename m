Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859DBC54E6C
	for <linux-sound@archiver.kernel.org>; Tue, 14 Nov 2023 20:11:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233792AbjKNULg (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Tue, 14 Nov 2023 15:11:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233907AbjKNULf (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Tue, 14 Nov 2023 15:11:35 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8A2B7
        for <linux-sound@vger.kernel.org>; Tue, 14 Nov 2023 12:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699992692; x=1731528692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uFo3JTP2alB99rkg19E443MKdeHnjsbmxR/ux1VI5Z8=;
  b=gV9NjVj2RHt15vH4iBoc8WCY4G+hpP8G9USRSFEPgcMh3gQrSyfdcVzX
   aK8iYwOIfcDiVt2QBsrqLLE2yoVKT5OOyUrXzgb3GSqYoig/iqbFN9WNJ
   4mf8GggSkUaycRAv0pBdJN6WX1zQyw39/pa0tI2dttIUlh3lQxEE0oAFs
   xeLHAqfN5ZBF1x/LD1zgi+55Ki1MUJIrlIpHgmowLHjADmpDAp8UZugP6
   lOuRKtlhe8s3fomBVR/fUBcpnRF+NSqba4Ol5miLtC3154tKhkkh0QWGz
   HEjpFfSYqURfcjAxWh25awRS3MfJ3KGwXGn7Mz4SFHZ3P+IY3dT1gJRd3
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="381134689"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="381134689"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2023 12:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="855422415"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="855422415"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2023 12:11:30 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        linux-sound@vger.kernel.org,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v3 07/16] ALSA: hda/ca0132: Switch to new stream-format interface
Date:   Tue, 14 Nov 2023 21:13:08 +0100
Message-Id: <20231114201317.1348066-8-cezary.rojewski@intel.com>
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

