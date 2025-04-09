Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F160725D8FC
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195858; cv=none; b=XffCu10MgtGth4YEY9edODPq2w3gUB/jsLjgcHvKa/jlYL4zLxQ23o3t/Scp1akyFMFfx3WE+BM4faPpZpd6yTOTyTHceE6EAq9mvAoIE7QDc509w3Jk7LN02X+B80ObWuDgJx7gUOA5yZIqSn2naFAvmVR6iYOIXQKSJbN3Q88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195858; c=relaxed/simple;
	bh=IH3hN3Hos8ePmfJOgpdVA8i+2s87+dTXhaKo8M19T9Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dkmZ/U4wJehfR5l+6/iK3NcK5Xi9OLh2r3S8MbXczIZ+XVYVXAm8rkuVC6ATYE79cUv9V7SnMb+y7GUdoqODgmLMN0AH55tgIVe7FhSGPxhtU+V0btrYqYQIcOZohrsXj8pEc3X7F0uV4oXD0E3mL2p+RL9Wt01GKTZPhu5dJ/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nGyCHHq1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nGyCHHq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744195856; x=1775731856;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IH3hN3Hos8ePmfJOgpdVA8i+2s87+dTXhaKo8M19T9Y=;
  b=nGyCHHq1F4anMqR5n5Q71xLJ1PkyjF8vsy0FELu9jkcTa843GyJ9yV79
   1gR70RSe6nRRD8a93AcQMYOhmdlHmjwk7lG5LTVogzF5B1EVVV4SdoT0a
   V3LtVtaeow4fkNIS1N3mlLu2BvJou4tcOx2IJnZcWVV3905pgZm6hOZ8j
   VgK3/OIiuIEr5UNcjhHlz5XVAM+vG7HqBVopr0zJe1C0S+RHaT1ljKjgw
   rk7MoU04jdNu458stFvQ3Wp/A7iUA4P+8P/hmGbQGW/vuHvYvqKCJEO+n
   uimGM0IqwlVsvIuDjlEeE9E/DcZMVWmQz36BY7o5ZIcIDgbU2xQWvTB0F
   A==;
X-CSE-ConnectionGUID: blIVtGFtROGAGGwJP03aIA==
X-CSE-MsgGUID: 8DtHerkLRA6pYam7NRq8ig==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45380003"
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="45380003"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2025 03:50:55 -0700
X-CSE-ConnectionGUID: WdX/xNEXTX+GODItR+jCPA==
X-CSE-MsgGUID: it36l8BlSxO6r0z9O5Y5GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,200,1739865600"; 
   d="scan'208";a="133426172"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2025 03:50:53 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: broonie@kernel.org,
	tiwai@suse.com,
	perex@perex.cz
Cc: amadeuszx.slawinski@linux.intel.com,
	linux-sound@vger.kernel.org,
	gregkh@linuxfoundation.org,
	quic_wcheng@quicinc.com,
	mathias.nyman@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [RFC 00/15] ALSA/ASoC: USB Audio Offload
Date: Wed,  9 Apr 2025 13:07:15 +0200
Message-Id: <20250409110731.3752332-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Note: this series is based on Mark's broonie/for-next. The xHCI
dependency is missing so it won't compile.  Goal of this RFC is
discussing the direction of sound/usb changes.

Note #2: Why exclude xHCI?  Current form of xhci-sideband.c [1] does not
fare well with Intel's hardware design for USB Audio Offload feature.
The production shape for usb/xHCI subjects is being discussed with
Mathias.  Once we're ready, I'll share the rest.

Note #3: this series does _NOT_ aim to block QCOM's equivalent series
[2].  The team does acknowledge that we came the "table" late.  At the
same time, we're prepared to help QCOM switch to the presented sound/usb
approach if that would benefit the framework and its users as a whole.
Make it part of this very series if need be.



Apart from changes to sound/usb, the patchset contains exemplary
ASoC-based, offload-aware USB driver and a small sound card on the
avs-driver side to show how card/dai_link initialization looks like.

In short, USB Audio Offload functionality lowers CPU usage when
streaming PCM over a USB Audio-Class device.  It has been first
introduced in xHCI 1.2 release and is described in section 7.9 [3].
Once hardware is prepared with hw_params(), all the USB endpoints
operations e.g.: start, stop, submitting URBs, are performed
internally, by the hardware and AudioDSP firmware.  Software driver
shall not intervene.

Startup flow from:

	usb_pcm_open()
	usb_pcm_hw_params()
		snd_usb_endpoint_open()
	usb_pcm_prepare()
		usb_set_interface()
		snd_usb_endpoint_start()
	usb_pcm_trigger(cmd: START/STOP etc.)

reduced to:

	usb_pcm_open()
	usb_pcm_hw_params()
		snd_usb_endpoint_open()
	usb_pcm_prepare()
		usb_set_interface()

Handlers such as ack(), sync_stop(), pointer(), delay() are not used
here too.  The AudioDSP driver will handle pointer(), rest is
firmware/hardware responsibility.


There's a hefty number of limitations, most importantly:

1) typically 2 USB devices tops, rest go the classic (non-offload) path
2) AUDIOSTREAMING interfaces only, MIDI not.  While not an interface
   type, Media (sound/usb/media) unsupported either
3) simple PCM, UAC_FORMAT_TYPE_I_PCM only

Current patchset shows this in form of 'udev->audsb_capable' field.
True if xHCI sideband reasource has been assigned to the device.  The
filtering is code is not part of the patchset.

Important to highlight, 1) means both, offload-aware and offload-unaware
drivers could be utilized simultaneously on the system in runtime.
Opportunistically few devices would be controlled by the offload-aware
driver, whereas everything else by the offload-unaware one.  This
differs from existing HDAudio Controller driver situation where either
classic, snd_hda_intel driver takes complete control -or- the
offload-aware snd_soc_avs driver.
In short, once all Audio Sideband resources are depleted, classic
sound/usb/card.c driver manages whatever comes next:

	snd_usb_audio (offload un-aware, sound/usb/card.c)
	snd_soc_usb_codec (offload aware, sound/soc/codecs/usb.c)


The design goals:
	- make ASoC first class citizen of sound/usb
	- re-use code found in sound/usb, mimic HDAudio integration in ASoC:
	  small sound/soc/codecs/hda.c driver leveraging power of entire
	  sound/pci/hda/
	- no shared control over a USB device, either snd_usb_audio or
	  its ASoC equivalent takes control of the device

To do that, major tasks are identified:

a) On ASoC side 'struct snd_card' is part of 'struct snd_soc_card' and
is managed by the framework.  Similar situation with 'struct snd_pcm'
and rtd->pcm.  To keep the teardown path sane, drop card->private_free()
and pcm->private_free() usage.

b) To initialize ASoC components/DAI properly, PCM capabilities should be
known up-front.  To do that, existing USB card probe() has to be split.
From one-stage to two-stage process:

	- look ahead and parse usb_interface descriptors for PCM endpoints
	  but do not create any PCMs (sound devices) yet
	- create all PCMs based on obtained ->pcm_list and follow with
	  MIDI/mixers/media

Such approach allows to feed DAIs proper data even when a valid
sound-card pointer is not yet present - the initialization occurs before
snd_soc_bind_card() is called.

Point a) is scaled for all three "domains" of sound/usb: chip, stream
and quirks.  That's why there total of 6 commits doing that job.  First
implement, then switch.  Everything that follows is, in my opinion,
self-explanatory.  No need to repeat commit messages.


[1]: https://lore.kernel.org/all/20250319005141.312805-2-quic_wcheng@quicinc.com/
[2]: https://lore.kernel.org/all/20250319005141.312805-1-quic_wcheng@quicinc.com/
[3]: https://www.intel.com/content/dam/www/public/us/en/documents/technical-specifications/extensible-host-controler-interface-usb-xhci.pdf


Cezary Rojewski (15):
  ALSA: usb: Move media-filters to the media code
  ALSA: usb: Drop private_free() usage for card and pcms
  ALSA: usb: Relocate the usbaudio header file
  ALSA: usb: Implement two-stage quirk applying mechanism
  ALSA: usb: Implement two-stage stream creation mechanism
  ALSA: usb: Implement two-stage chip probing mechanism
  ALSA: usb: Switch to the two-stage chip probing
  ALSA: usb: Switch to the two-stage stream creation
  ALSA: usb: Switch to the two-stage quirk applying
  ALSA: usb: Export PCM operations
  ALSA: usb: Export usb_interface driver operations
  ALSA: usb: Export card-naming procedure
  ALSA: usb: Add getters to obtain endpoint information
  ASoC: codecs: Add USB-Audio driver
  ASoC: Intel: avs: Add USB machine board

 include/linux/usb.h                         |  15 +
 include/linux/usb/ch9.h                     |  11 +
 sound/usb/usbaudio.h => include/sound/usb.h |  53 +-
 include/sound/usb_offload.h                 |  46 +
 sound/soc/codecs/Kconfig                    |   6 +
 sound/soc/codecs/Makefile                   |   2 +
 sound/soc/codecs/usb.c                      | 441 +++++++++
 sound/soc/intel/avs/boards/Kconfig          |   8 +
 sound/soc/intel/avs/boards/Makefile         |   2 +
 sound/soc/intel/avs/boards/usb.c            | 115 +++
 sound/usb/caiaq/device.h                    |   2 +-
 sound/usb/card.c                            | 946 +++++++++++++-------
 sound/usb/card.h                            |   4 +-
 sound/usb/clock.c                           |   2 +-
 sound/usb/endpoint.c                        |   2 +-
 sound/usb/format.c                          |   2 +-
 sound/usb/helper.c                          |   2 +-
 sound/usb/implicit.c                        |   2 +-
 sound/usb/media.c                           |   8 +-
 sound/usb/midi.c                            |   2 +-
 sound/usb/midi.h                            |   2 +
 sound/usb/midi2.c                           |   2 +-
 sound/usb/midi2.h                           |   1 +
 sound/usb/misc/ua101.c                      |   2 +-
 sound/usb/mixer.c                           |   2 +-
 sound/usb/mixer_quirks.c                    |   2 +-
 sound/usb/mixer_s1810c.c                    |   2 +-
 sound/usb/mixer_scarlett.c                  |   2 +-
 sound/usb/mixer_scarlett2.c                 |   2 +-
 sound/usb/mixer_us16x08.c                   |   2 +-
 sound/usb/pcm.c                             | 161 +++-
 sound/usb/power.c                           |   2 +-
 sound/usb/proc.c                            |   2 +-
 sound/usb/quirks.c                          | 203 +++--
 sound/usb/quirks.h                          |   6 +
 sound/usb/stream.c                          | 217 +++--
 sound/usb/stream.h                          |   2 +
 sound/usb/usx2y/us122l.c                    |   2 +-
 sound/usb/usx2y/usX2Yhwdep.c                |   1 +
 sound/usb/usx2y/usbusx2y.h                  |   2 +-
 sound/usb/validate.c                        |   2 +-
 41 files changed, 1749 insertions(+), 541 deletions(-)
 rename sound/usb/usbaudio.h => include/sound/usb.h (82%)
 create mode 100644 include/sound/usb_offload.h
 create mode 100644 sound/soc/codecs/usb.c
 create mode 100644 sound/soc/intel/avs/boards/usb.c

-- 
2.25.1

