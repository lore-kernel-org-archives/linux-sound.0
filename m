Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A73CFC25B47
	for <linux-sound@archiver.kernel.org>; Fri, 27 Oct 2023 11:05:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345671AbjJ0LFb (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 27 Oct 2023 07:05:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345696AbjJ0LFb (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 27 Oct 2023 07:05:31 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A36418F
        for <linux-sound@vger.kernel.org>; Fri, 27 Oct 2023 04:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698404728; x=1729940728;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5WhEmsKf7FralyoMJxUWZggzvDbNaA86yLnvkXMcEow=;
  b=XzL7nOrOpmwcie52v4qTIqqI+LLpEOwd1B7LtXoPJ7YcpDbVbo4etSiE
   Aibyl1AuBD9/GG4CxjbRzgnftPwk0stP/sTGDKDrhOB4nbIgBnD9SEf/I
   3dXTFBJDaK8Peyn37Q2jvDFjzfU1u5P4/1QvB24khcsgrFoyRoMSSId4F
   xD/sw1qnHfZYxo2SloCXtGxXD0gl2Pbx/7bnnDcXcgjVCzgdw5Pq0zaXa
   j2XgDKJnyTiXPNZ6fl0b3/JOt7Ol69l9uOouUXNjRlRkRPWdKWBSPYUDf
   JEMzyJz1VXJRP117Up+FVgyPv617fcQ+yMxRbgLS/WXOTWEolKyvPb1ZT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="418866464"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="418866464"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 04:05:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="736054979"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="736054979"
Received: from dev2.igk.intel.com ([10.237.148.94])
  by orsmga006.jf.intel.com with ESMTP; 27 Oct 2023 04:05:26 -0700
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
Subject: [PATCH 0/2] ASoC: Intel: avs: Add support for rt5514 codec
Date:   Fri, 27 Oct 2023 13:05:35 +0200
Message-Id: <20231027110537.2103712-1-amadeuszx.slawinski@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

There are machines which use codec rt5514 as DMIC, add support for them.

Amadeusz Sławiński (2):
  ASoC: Intel: avs: Add rt5514 machine board
  ASoC: Intel: avs: Add rt5514 machine board

 sound/soc/intel/avs/board_selection.c |   9 ++
 sound/soc/intel/avs/boards/Kconfig    |  10 ++
 sound/soc/intel/avs/boards/Makefile   |   2 +
 sound/soc/intel/avs/boards/rt5514.c   | 187 ++++++++++++++++++++++++++
 4 files changed, 208 insertions(+)
 create mode 100644 sound/soc/intel/avs/boards/rt5514.c


base-commit: 00236a89602f7b67016bd1d9bc63079f2c0f0a8d
-- 
2.34.1

