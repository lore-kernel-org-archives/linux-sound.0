Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E00C3E171F
	for <linux-sound@vger.kernel.org>; Wed, 16 Sep 2026 12:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789560206; cv=none; b=KZZ79OVywbP6fGQ5HjNHEuKNP22PKUNr5vm7VJiiu6x970QprI/0xsvPU3eDrfM2vC/rl2CG9DqcDmH4s1SnHacfQO+As1IWZj/5RWM87P2xykNK2x6emAVAcOZod1KpdqETVqbOi55do7sdKUHyqMukeq5TOJbNt4/6eo6oYeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789560206; c=relaxed/simple;
	bh=VzXHVX1tKcmHblXK1H0GpRJtupX+A2BUJ2NvciQtBkU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HnniSc9fO1fQdHYoMGJQEdVJgubY+XfvgvX03hHy2memLCnd6RKzrDzKiJKXMYY2ER62rqwxyxWiTiJArivTndqxHyVkAoeIdFSfYKv7N8k45H9zhZbiUVTo3M9FBHr2i4P7A63WzfbgSgbmC+ImDNol4nXY2stwI+1i79EaujY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivDXK9fl; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivDXK9fl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789560198; x=1821096198;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=VzXHVX1tKcmHblXK1H0GpRJtupX+A2BUJ2NvciQtBkU=;
  b=ivDXK9flHw8VPgHVLJ+qu3AuPKq9PWuBnfWBkHkFrUXBryO6bT8BqYO6
   O7MqhR+jL7P8NzXGjFVJgcvnzOIeQY8BYcDDkfEm3Y+Mik81vJA9yYY/K
   FVtNYWRoJG52lZCcXP8RwNWuqz4i3natpH4x/nnpfxkJQq94jqb7rppGJ
   2kddh+0ykrkKHT1GVwHyKBmrmFCW/wYhrKpc+M2z+Ipuveqoz4+ZLMagn
   HpkExVQ7S0CR21OGN8+fq0j/TsQS+0lPvmodW/eJM9oFxw8o+WPfbeyuz
   6D2BVvXCN3sf8hW2RTOf1MmNiwyzlkmtjg8ocxAKOMWUtFUGpAzmy47a0
   g==;
X-CSE-ConnectionGUID: VghOM8WeSkiIwEYoysNSPA==
X-CSE-MsgGUID: GmKB4h31SqOzmE6J9xrQLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="77496210"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="77496210"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:12 -0700
X-CSE-ConnectionGUID: YZEKbUv7QzW7YX50pu4g1w==
X-CSE-MsgGUID: 4ikOMuUHRbq3gjtW8LN/9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="273293310"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO pujfalus-desk.intel.com) ([10.245.244.100])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2026 05:03:10 -0700
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
Subject: [PATCH v4 00/26] ALSA compress / ASoC compress / SOF: Compressed audio support with IPC4
Date: Wed, 16 Sep 2026 15:02:54 +0300
Message-ID: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Changes sinve v3:
- Drop the tuple size validation from patch 18 in ipc4-loader and add a
   comment to note the trusted source of the data
- Add validation of the PCM format in patch 22 within the ipc4-compress.c
  file

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
 sound/soc/sof/ipc4-compress.c                 | 782 ++++++++++++++++++
 sound/soc/sof/ipc4-loader.c                   |  37 +
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
 27 files changed, 1776 insertions(+), 310 deletions(-)
 rename sound/soc/sof/{compress.c => ipc3-compress.c} (66%)
 create mode 100644 sound/soc/sof/ipc4-compress.c

-- 
2.55.0

