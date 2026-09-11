Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC440468C3F
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 11:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789125715; cv=none; b=usdP+hyQk764J5ALJFFVctqTz+Dhr/FWwWW+xLFWtG4bN/lpPlNsS61aBU3ylRIqHrCZSq/4eWOarfi27Lkstf6J2/1xi4pBByB9hUrJArqVgppVOu5STSsaHCjE1VejiqJgLlDkWdryEfICT4pp5zbtCINsJI/1DSiTOz++GNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789125715; c=relaxed/simple;
	bh=A7QcToOYpfllpwzANoB2ainbG/9VsEJkPd+w9yr8NL0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FumJT/lNDww8UhTYt51g9lmm09iN8faPiThdftm7bJl7yA49zmJoxf6Bo7kcEQ2zwSi68FLoGUpfSi+NeRyXYcZBpttCoYxU2AFY2oOpEbDwCiKsr/z8Cg9K8ymU4p3UZG21uleeBlw1KCdoQ7PQTMJj+SbE7X9YRtb5MQgi4Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+A03KKe; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+A03KKe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789125710; x=1820661710;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=A7QcToOYpfllpwzANoB2ainbG/9VsEJkPd+w9yr8NL0=;
  b=k+A03KKexXtDj828BGIuwt0Nbuea+Ztit8I4nmbUt7o42MOy6OLB7vl6
   B5UP0xXvO4bO51ovMVVVtSkv0h1CHN7zNOVBaUHe+EGdBrzdBPNw/HOFg
   mhONdcZadnNA8WGITw7vT9alr6xmWdCUSQEtEm/ackLOgxphA8Bvoq+lM
   +NPBoSts/fp6qxDLRAfzCqFYSXkFcfKo9giphAD9eX6sITAZoCHdRMYUI
   keBvUtqf1yWZxAdB0UsTzf/4g6/zXRmfuBetDrulISXSL1pMAHCLh5tGv
   sw3yAb3EppKqobsSdcp0iiGSI4CLwnrJY44l1d2dfSpQVbnwqzYnv03bk
   Q==;
X-CSE-ConnectionGUID: ligC/DJJRBOLSkr+o349yw==
X-CSE-MsgGUID: 96/5k4xnTS2sdOhcBA1aQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="100749855"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="100749855"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:21:45 -0700
X-CSE-ConnectionGUID: NSReeKpZQa+AX4TZeptGrA==
X-CSE-MsgGUID: GzfJMVvRQjiauR8/iqkdHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="268213226"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.83])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 04:21:42 -0700
From: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	daniel.baluta@nxp.com
Subject: [PATCH v3 00/26] ALSA compress / ASoC compress / SOF: Compressed audio support with IPC4
Date: Fri, 11 Sep 2026 14:21:26 +0300
Message-ID: <20260911112152.28528-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changes since v2:
- Split "ASoC: SOF: compress: Rename compress ops with ipc3 prefix" into a
  first patch moving the IPC agnostic helpers to sof-audio.c and a second
  doing the rename itself (Pierre-Louis).
- New patch "ASoC: SOF: sof-audio: Fix the pipeline_list population": the
  pipeline count was incremented before the array slot was written and a
  widget with no spipe could be added as a NULL entry.
- "ASoC: SOF: ipc4-pcm: harden pipeline teardown races" is now "ASoC: SOF:
  ipc4-pcm: Serialize the PCM free with the pipeline triggers" and only
  moves the pipeline_state_mutex and clears the freed list's count, as the
  defensive !spipe checks it carried became redundant with the patch above.
- Moved "ASoC: SOF: ops: Add new platform-specific ops for compress" from
  the middle of the series to right before "ASoC: SOF: Add support for IPC4
  compressed" (Pierre-Louis).
- Reworded the "ASoC: SOF: ipc4: Add definition of module data in init_ext
  object type" commit message to explain what the new object type is used
  for (Pierre-Louis).

Kept unchanged after review:
- The ALSA_MAGIC_MASK -> SOF_MAGIC_MASK rename stays: the notification magic
  is no longer ALSA control specific, the EOS/drain-complete notification
  reuses the same scheme.
- Compress is enabled for TGL and newer rather than keyed on IPC4, since APL
  and older platforms also run IPC4 but compress is only enabled from TGL on.
- The series is posted as one set, as the ALSA, soc-compress and SOF
  preparatory patches only carry their justification in the context of the
  full compress enablement.

Changes since v1:
- Add patch to snd_card_file_add/remove for compress
- Hanlde the SND_COMPR_TRIGGER_NEXT_TRACK in soc_compr_trigger_fe()

Cover letter:

This series adds compressed audio support for SOF with IPC4 firmware.
Supported formats are PCM, MP3, AAC and VORBIS, the feature set is
PAUSE_PUSH/RELEASE, DRAIN and position reporting.

Patches 1-5 are prerequisites in the ALSA compress core and in
soc-compress.c.

These are core fixes rather than driver level workarounds on purpose.
The other users of compressed DPCM have DSP internal ports on their
BEs, driven by code they own. An Intel/SOF BE ends at a third party
CODEC driver which is shared with the non DPCM case and has no reason
to know that the FE is compressed. That set of CODECs is open ended,
so teaching each of them to cope with a compressed FE does not scale.
The core has to hand a BE the same substream state whether the FE is
a PCM or a compressed one.

Two of these patches change behaviour for the existing users of
compressed DPCM, so they would need a look from Qualcomm and NXP:

 - "ASoC: soc-compress: Implement trigger FE-BE sequencing as with
   normal PCMs" makes the FE/BE trigger order follow
   dai_link->trigger[], the way dpcm_fe_dai_do_trigger() does it.
   Neither sound/soc/qcom/ nor sound/soc/fsl/ sets it, so both default
   to SND_SOC_DPCM_TRIGGER_PRE: START keeps the current order, but
   STOP, SUSPEND and PAUSE_PUSH now trigger the BE before the FE.

 - "ASoC: soc-compress: Stop running dpcm on free" sends a STOP trigger
   from soc_compr_free_fe() if the DPCM is still in START state, which
   is the case when the last trigger the stream received was a DRAIN.

Patches 6-20 implement the IPC4 compressed support, patch 21 is a
Kconfig cleanup. The last two patches enable the feature, in Kconfig
for TGL and later and in the topology parser, so the compressed device
type only becomes usable once the code behind it is in place.

Testing:

 - IPC4: Arrow Lake, compressed playback on speaker and headphone
   (cs42l43), MP3, AAC and VORBIS.
 - IPC3: tested by NXP. This does not cover the STOP on free path
   above, as they do not implement DRAIN.

Regards,
Peter
---
Peter Ujfalusi (19):
  ALSA: compress: pin card module while stream is open
  ALSA: compress: register the open file with the card
  ALSA: compress: stop active streams on disconnect
  ASoC: soc-compress: Provide a runtime for the compressed FE substream
  ASoC: soc-compress: Implement trigger FE-BE sequencing as with normal
    PCMs
  ASoC: soc-compress: Stop running dpcm on free
  ASoC: SOF: sof-audio: Fix the pipeline_list population
  ASoC: SOF: ipc4-pcm: Serialize the PCM free with the pipeline triggers
  ASoC: SOF: sof-audio: do not dereference swidget->spipe
    unconditionally on free
  ASoC: SOF: ipc4: Add definition of module data in init_ext object type
  ASoC: SOF: ipc4-topology: Support init_ext_module_data for process
    modules
  ASoC: SOF: ipc4-pcm: Make the timestamp info usable outside of
    ipc4-pcm.c
  ASoC: SOF: ipc4/ipc4-loader: Add SOF_INFO and CODEC_INFO to
    fw_config_params
  ASoC: SOF: ipc4-pcm: Handle COMPR DRAIN triggers as EOS pipeline state
  ASoC: SOF: ipc4-topology: Set FAST_MODE for host copier in compr mode
  ASoC: SOF: Add support for IPC4 compressed
  ASoC: SOF: ipc4: Handle compressed drain done notification from
    firmware
  ASoC: SOF: Intel: Kconfig: Remove redundant IPC version selects
  ASoC: SOF: Intel: Kconfig: Select compress support for TGL+ platforms

Ranjani Sridharan (7):
  ASoC: SOF: compress: Move the IPC agnostic helpers to sof-audio.c
  ASoC: SOF: compress: Rename compress ops with ipc3 prefix
  ASoC: SOF: sof-audio: Expose a couple of functions
  ASoC: SOF: pcm: Modify the signature of a couple of PCM IPC ops
  ASoC: SOF: intel: hda-stream: Clear the current position when
    releasing stream
  ASoC: SOF: ops: Add new platform-specific ops for compress
  ASoC: SOF: topology: Add support for decoder and encoder widgets

 include/sound/compress_driver.h               |   2 +
 include/sound/sof/ipc4/header.h               |  24 +-
 sound/core/compress_offload.c                 |  86 +-
 sound/soc/soc-compress.c                      | 200 ++++-
 sound/soc/sof/Makefile                        |   4 +-
 sound/soc/sof/core.c                          |  10 +-
 sound/soc/sof/intel/Kconfig                   |   9 +-
 sound/soc/sof/intel/hda-common-ops.c          |   8 +
 sound/soc/sof/intel/hda-pcm.c                 | 142 ++++
 sound/soc/sof/intel/hda-stream.c              |  70 +-
 sound/soc/sof/intel/hda.h                     |  15 +
 sound/soc/sof/{compress.c => ipc3-compress.c} | 145 +---
 sound/soc/sof/ipc3-pcm.c                      |  29 +-
 sound/soc/sof/ipc3-priv.h                     |   3 +
 sound/soc/sof/ipc4-compress.c                 | 776 ++++++++++++++++++
 sound/soc/sof/ipc4-loader.c                   |  51 ++
 sound/soc/sof/ipc4-pcm.c                      | 114 ++-
 sound/soc/sof/ipc4-priv.h                     |  45 +
 sound/soc/sof/ipc4-topology.c                 | 115 ++-
 sound/soc/sof/ipc4-topology.h                 |   9 +
 sound/soc/sof/ipc4.c                          |  13 +-
 sound/soc/sof/ops.h                           |  74 ++
 sound/soc/sof/pcm.c                           |  18 +-
 sound/soc/sof/sof-audio.c                     |  95 ++-
 sound/soc/sof/sof-audio.h                     |  23 +-
 sound/soc/sof/sof-priv.h                      |  12 +
 sound/soc/sof/topology.c                      |   2 +
 27 files changed, 1784 insertions(+), 310 deletions(-)
 rename sound/soc/sof/{compress.c => ipc3-compress.c} (66%)
 create mode 100644 sound/soc/sof/ipc4-compress.c

-- 
2.55.0

