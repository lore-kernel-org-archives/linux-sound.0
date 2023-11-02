Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E77C4167D
	for <linux-sound@archiver.kernel.org>; Thu,  2 Nov 2023 12:47:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229676AbjKBMrJ (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Thu, 2 Nov 2023 08:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbjKBMrJ (ORCPT
        <rfc822;linux-sound@vger.kernel.org>); Thu, 2 Nov 2023 08:47:09 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 291C1123
        for <linux-sound@vger.kernel.org>; Thu,  2 Nov 2023 05:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698929223; x=1730465223;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tV4zMYZwuhYLY6+OXhuWh69eDrIBWYWnMQ7uZzjdTyo=;
  b=DQbL4dgVDdagmZkfqj4xqqeBUykPX/MRfOFUg6P8DT5ljKM6wbHziGPG
   oGofxS8p3Q7XjURLwhO1OpjaSzgCNdjRMYOgIQtZEgPMdkNU3AklI28xH
   QHJ0MBdLwkZO+j6M4nOfSUEtWt2lKwpbNFeF66lgEJyjnZVRKwni7gVfW
   1Q4ICHzf27I8Atq2vn1m3iXTefQZfbGuhgJJOPTxAO+skIu+nqwY6K69H
   sRITSgSCL2IgLPcz5wqMkjDCDqTmsu7EytOLC370Xb+O602AhT+Xr2wjc
   dQpdQgIk72GwGBCrZbAq7jXQK101w2Z+B9GXHP10xqoblS2mypHWfJvva
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="7343463"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="7343463"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2023 05:47:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="1008454717"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1008454717"
Received: from dev2 (HELO DEV2.igk.intel.com) ([10.237.148.94])
  by fmsmga006.fm.intel.com with ESMTP; 02 Nov 2023 05:47:00 -0700
From:   =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Cezary Rojewski <cezary.rojewski@intel.com>,
        Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
Subject: [PATCH 00/17] ASoC: Intel: avs: Properly identify boards
Date:   Thu,  2 Nov 2023 13:46:55 +0100
Message-Id: <20231102124712.2549327-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Instead of using MODULE_ALIAS() to load boards, add proper device id
table and use MODULE_DEVICE_TABLE() macro to create board alias.

Amadeusz Sławiński (17):
  ASoC: Intel: avs: da7219: Add proper id_table
  ASoC: Intel: avs: dmic: Add proper id_table
  ASoC: Intel: avs: es8336: Add proper id_table
  ASoC: Intel: avs: hdaudio: Add proper id_table
  ASoC: Intel: avs: i2s_test: Add proper id_table
  ASoC: Intel: avs: max98357a: Add proper id_table
  ASoC: Intel: avs: max98373: Add proper id_table
  ASoC: Intel: avs: max98927: Add proper id_table
  ASoC: Intel: avs: nau8825: Add proper id_table
  ASoC: Intel: avs: probe: Add proper id_table
  ASoC: Intel: avs: rt274: Add proper id_table
  ASoC: Intel: avs: rt286: Add proper id_table
  ASoC: Intel: avs: rt298: Add proper id_table
  ASoC: Intel: avs: rt5514: Add proper id_table
  ASoC: Intel: avs: rt5663: Add proper id_table
  ASoC: Intel: avs: rt5682: Add proper id_table
  ASoC: Intel: avs: ssm4567: Add proper id_table

 sound/soc/intel/avs/boards/da7219.c    | 10 +++++++++-
 sound/soc/intel/avs/boards/dmic.c      | 10 +++++++++-
 sound/soc/intel/avs/boards/es8336.c    | 10 +++++++++-
 sound/soc/intel/avs/boards/hdaudio.c   | 10 +++++++++-
 sound/soc/intel/avs/boards/i2s_test.c  | 10 +++++++++-
 sound/soc/intel/avs/boards/max98357a.c | 10 +++++++++-
 sound/soc/intel/avs/boards/max98373.c  | 10 +++++++++-
 sound/soc/intel/avs/boards/max98927.c  | 10 +++++++++-
 sound/soc/intel/avs/boards/nau8825.c   | 10 +++++++++-
 sound/soc/intel/avs/boards/probe.c     | 10 +++++++++-
 sound/soc/intel/avs/boards/rt274.c     | 10 +++++++++-
 sound/soc/intel/avs/boards/rt286.c     | 10 +++++++++-
 sound/soc/intel/avs/boards/rt298.c     | 10 +++++++++-
 sound/soc/intel/avs/boards/rt5514.c    | 10 +++++++++-
 sound/soc/intel/avs/boards/rt5663.c    | 10 +++++++++-
 sound/soc/intel/avs/boards/rt5682.c    | 10 +++++++++-
 sound/soc/intel/avs/boards/ssm4567.c   | 10 +++++++++-
 17 files changed, 153 insertions(+), 17 deletions(-)


base-commit: ed2232d49187cebc007ecf4e6374069b11ab3219
-- 
2.34.1

