Return-Path: <linux-sound-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2FCBC072A2
	for <linux-sound@archiver.kernel.org>; Fri, 17 Nov 2023 12:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbjKQMEJ (ORCPT <rfc822;linux-sound@archiver.kernel.org>);
        Fri, 17 Nov 2023 07:04:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbjKQMEJ (ORCPT
        <rfc822;linux-sound@vger.kernel.org>);
        Fri, 17 Nov 2023 07:04:09 -0500
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7E9B9
        for <linux-sound@vger.kernel.org>; Fri, 17 Nov 2023 04:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700222645; x=1731758645;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=o1Clj0wfmtvRTRMztmEpRpWTvJKzJXSertPqRGYxMss=;
  b=m8BJ1bi4/xtzXaR1A1i9r4Oiug/lqkd1u/AofvAS6adl5cQF4StcT9Qp
   6MM+lMNB/he1dC2NQFDlCvq26AcC9jt+S7UMl2jS57yoTMMFizMoOI7nv
   MZSynWjWkxW/jKwjU0YhrZz5AzIDkZMHZp1xUXpIGYAGLzI0gJjOJwYuT
   Q7xccKqZFgea3+yVjMd/7oUxp7DRCuWeJuRVDXkkWfVW/Gbdxdv1DZRq0
   BtyfQdj7wM5dNCrYQOQDWhJrvE5JeEkBg75v+QcjMvbRs99fZ/xHF8yHJ
   2MkU17WR1kRfSyfG3gVeI29qCh4MO+ybfeTT5MjbIvHG3PItx2yqgDLPm
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="381675155"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="381675155"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 04:04:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="883110143"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; 
   d="scan'208";a="883110143"
Received: from crojewsk-ctrl.igk.intel.com ([10.102.9.28])
  by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2023 04:04:01 -0800
From:   Cezary Rojewski <cezary.rojewski@intel.com>
To:     broonie@kernel.org, tiwai@suse.com, perex@perex.cz
Cc:     alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        amadeuszx.slawinski@linux.intel.com,
        pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
        Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH v5 00/16] ALSA/ASoC: hda: Address format selection limitations and ambiguity
Date:   Fri, 17 Nov 2023 13:05:54 +0100
Message-Id: <20231117120610.1755254-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-sound.vger.kernel.org>
X-Mailing-List: linux-sound@vger.kernel.org

Patchset aims to address format selection restrictions present currently
in the HDAudio library. Formats which we are concerned about are 20 and
24 valid bits per sample within 32 bit depth container. One may identify
them as S20_LE and S24_LE except that those, according to comments found
in include/uapi/sound/asound.h, are for LSB-aligned scenarios. HDAudio
streams expect MSB-aligned data, no matter if we are speaking of HOST
(SDxFMT) or LINK (PPLCxFMT) side - chapter 4.5.1 of the public HDAudio
specification. In short, S20_LE and S24_LE are invalid options.

Right now, given the implementation of snd_hdac_query_supported_pcm() 
within sound/hda/hdac_device.c, even if a codec responds with: "I
support all possible formats specified within HDAudio specification",
there will be no option to open a 20/32 or 24/32 stream. The kernel will
force the stream to be opened using the highest available bit depth.

After discussing subject initially with Jaroslav and Takashi, suggestion
was made to utilize 'subformat' option to address the problem. The
eye-opening discussion begun much earlier though, in 2019 [1].

Paired with PRs for alsa-utils [2] and alsa-lib [3].


Flow of changes:

The very first patch adds MSBITS subformat options to allow for granular
20/32, 24/32 and 32/32 format selection. The next two make sure
subformat is actually honored during runtime. Most of that code is based
on format-related API.

Follow up is upgrade to the hda stream-format interface - several
functions are added to make the granular format selection simple in the
HDAudio world. Core of the implementation is based on the existing
snd_hdac_calc_stream_format(). The next ten patches are straightforward
switch from one interface to another with cleanup of now-unsed function
as a finishing touch.

Last but not least - the avs-driver, on which the problem analyzed and
debugged, is updated to no longer acknowledge S24_LE as a valid format
option.

Results with skylake-driver and snd_hda_intel show status quo on our
RVPs. PR filed on SOF github shows promising results too [4].


Changes in v5:
- reworded 'bps' to 'bits' in all occurrences.
- fixed an issue of MSBITS_MAX not being reported for S32_LE as reported
  by Jaroslav
- snd_pcm_subformat_width() has been inlined into its only user:
  snd_pcm_hw_params_bits() as suggested by Jaroslav.
- updated commit messege for patch 01 as it was out of date given the
  recent updates.

Changes in v4:
- fixed compilation issues in sof-driver, patch 12/16, reported by ikp
- fixed sparse warnings in patch 01/16, reported by ikp
- updated commit message for patch 03: "ASoC pcm: Honor subformat when
  configuring runtime", as snd_pcm_hw_copy() is gone since revision v3.

Changes in v3:
- merged the first two patches as suggested by Jaroslav
- re-authored patch 01 to Jaroslav, added my Co-developed-by.
- added Jaroslav' Co-developed-by to patch 02.
- 'subformats' field now S32_LE-specific. Given the fact that it is the
  only format currently requiring subformat-intervention, functionality
  is narrowed to reduce amount of memory allocations and cleanup.
  Suggested by Jaroslav.
- note to the above: the hdaudio part converted 1:1 as requested, patch
  02/16
- note #2: alsa part converted to S32_LE-specific yet without addition
  of the chicken bit. Instead, struct snd_pcm_hardware is updated with
  u32 subformat mask to do the job.
- ALSA-core additions in form of snd_pcm_subformat_width() and
  snd_pcm_hw_params_bps() relocated from 01/16 to the user, patch 05.

Changes in v2:
- patch 01/17, introduced struct snd_pcm_subformat which task is to
  represent subformat-mask on per format basis. Expectation is that
  manipulated arrays of subformats always end with a sentinel entry
- patch 01/17, added snd_pcm_hw_copy() as the copying snd_pcm_hardware
  becomes non-trivial
- patch 02/17, added hw_rule that produces final subformat mask
  based on provided formats as suggested by Jaroslav
- patch 04/17, soc_pcm_hw_update_subformat() refactored as the subformat
  intersection becomes non-trivial
- relevant functions releasing resources occupied by hda_pcm and
  snd_pcm_runtime updated to also kfree() subformats
- except for 16/17, no changes to patches past 04/17, retaining acks for
  these

Changes in v1:
- fixed UBSAN due to missing snd_pcm_subformat_names[] entries for new
  subformats
- as HDMI stream capabilities are assigned on PCM open, patch 16/17 has
  been updated to ignore such codecs for now. A separate patchset will
  take care of this case
- params_bps() reworded to snd_pcm_hw_params_bps()
- fixed compilation issues in sof-driver, patch 13/17


[1]: https://lore.kernel.org/alsa-devel/20190905053302.9262-1-pawel.harlozinski@linux.intel.com/
[2]: https://github.com/alsa-project/alsa-utils/pull/228
[3]: https://github.com/alsa-project/alsa-lib/pull/342
[4]: https://github.com/thesofproject/linux/pull/4539

Cezary Rojewski (15):
  ALSA: hda: Honor subformat when querying PCMs
  ASoC: pcm: Honor subformat when configuring runtime
  ALSA: hda: Upgrade stream-format infrastructure
  ALSA: hda: Switch to new stream-format interface
  ALSA: hda/hdmi: Switch to new stream-format interface
  ALSA: hda/ca0132: Switch to new stream-format interface
  ASoC: codecs: hda: Switch to new stream-format interface
  ASoC: codecs: hdac_hda: Switch to new stream-format interface
  ASoC: codecs: hdac_hdmi: Switch to new stream-format interface
  ASoC: Intel Skylake: Switch to new stream-format interface
  ASoC: SOF: Intel: Switch to new stream-format interface
  ASoC: Intel: avs: Switch to new stream-format interface
  ALSA: hda: Drop snd_hdac_calc_stream_format()
  ASoC: Intel: avs: Kill S24_LE format
  ASoC: Intel: avs: Unhardcode HDAudio BE DAI drivers description

Jaroslav Kysela (1):
  ALSA: pcm: Introduce MSBITS subformat interface

 include/sound/hda_codec.h         |   5 +-
 include/sound/hdaudio.h           |  13 +--
 include/sound/pcm.h               |   7 ++
 include/sound/pcm_params.h        |   2 +
 include/sound/soc.h               |   1 +
 include/uapi/sound/asound.h       |   7 +-
 sound/core/pcm.c                  |   3 +
 sound/core/pcm_lib.c              |  34 +++++++
 sound/core/pcm_native.c           |  55 ++++++++++-
 sound/hda/hdac_device.c           | 156 +++++++++++++++++++++---------
 sound/pci/hda/hda_codec.c         |   2 +
 sound/pci/hda/hda_controller.c    |  10 +-
 sound/pci/hda/patch_ca0132.c      |   3 +-
 sound/pci/hda/patch_hdmi.c        |   6 +-
 sound/soc/codecs/hda-dai.c        |   7 +-
 sound/soc/codecs/hda.c            |   2 +
 sound/soc/codecs/hdac_hda.c       |   8 +-
 sound/soc/codecs/hdac_hdmi.c      |  10 +-
 sound/soc/intel/avs/loader.c      |   4 +-
 sound/soc/intel/avs/path.c        |   2 +-
 sound/soc/intel/avs/pcm.c         |  58 +++++++++--
 sound/soc/intel/avs/probes.c      |   3 +-
 sound/soc/intel/avs/topology.c    |  13 ++-
 sound/soc/intel/skylake/skl-pcm.c |  13 ++-
 sound/soc/soc-pcm.c               |  10 ++
 sound/soc/sof/intel/hda-dai-ops.c |  21 ++--
 tools/include/uapi/sound/asound.h |   7 +-
 27 files changed, 352 insertions(+), 110 deletions(-)


-- 
2.25.1

