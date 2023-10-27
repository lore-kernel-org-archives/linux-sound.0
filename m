Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CC0C25B6E
	for <linux-sound@archiver.kernel.org>; Fri, 27 Oct 2023 11:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345549AbjJ0LFg (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 27 Oct 2023 07:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345730AbjJ0LFe (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 27 Oct 2023 07:05:34 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0AFC18F
        for <linux-sound@vger.kernel.org>; Fri, 27 Oct 2023 04:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698404732; x=1729940732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fOfitkbsDWDdgR7///RvDABbFaiYSzh0npo5N5wdWdg=;
  b=BxWtMHqnhgMV5ivXu/N+rkhpy/zfe2xItKCp9JPjm0IbUQkNvOlLhZyG
   sIYF4Kdxg/9hiI6RP1ASbRSj8o5M792WxhHLMX25vAhpqZAP6sY7Tt5vH
   rVnkLsX5zfRenyhr02vbXG5OIFyqVtfPrOpS0QrQrg/1q3hX4RCollhg0
   X6axelZG78Jhns5V/y9IUzXhS4y96Hpxw4qYVQYbSTD4gDt5L8wQaTDEK
   60I/xXx3Y/hbXdoxhIpgY5YIi8KPghZeNVkv+gISFFviY3dnWwfUKiYKT
   JmPeznITVQMsjcyoi6UgVaUYI9HMyR4rt8Tyf/rljhEX5bHt0nmDhiaEK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="418866480"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="418866480"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 04:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="736054991"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="736054991"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orsmga006.jf.intel.com with ESMTP; 27 Oct 2023 04:05:30 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org,
        =?UTF-8?q?=C5=81ukasz=20Majczak?= <lma@chromium.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 2/2] ASoC: Intel: avs: Add rt5514 machine board
Date:   Fri, 27 Oct 2023 13:05:37 +0200
Message-Id: <20231027110537.2103712-3-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
References: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

In order to support Eve chromebooks add rt5514 configuration to board
lookup table. rt5514 is used for capture in DMIC configuration on SSP 0
and TDM 1.

Signed-off-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/intel/avs/board_selection.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/intel/avs/board_selection.c b/sound/soc/intel/avs/board_selection.c
index c10fff705496..8e91eece992d 100644
--- a/sound/soc/intel/avs/board_selection.c
+++ b/sound/soc/intel/avs/board_selection.c
@@ -135,6 +135,15 @@ static struct snd_soc_acpi_mach avs_kbl_i2s_machines[] = {
 		},
 		.tplg_filename = "max98927-tplg.bin",
 	},
+	{
+		.id = "10EC5514",
+		.drv_name = "avs_rt5514",
+		.mach_params = {
+			.i2s_link_mask = AVS_SSP(0),
+		},
+		.pdata = (unsigned long[]){ 0x2, 0, 0, 0, 0, 0 }, /* SSP0 TDMs */
+		.tplg_filename = "rt5514-tplg.bin",
+	},
 	{
 		.id = "10EC5663",
 		.drv_name = "avs_rt5663",
-- 
2.34.1

