Received: from mta1.migadu.com (out-69.mta1.migadu.com [95.215.58.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B7D584972
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788963797; cv=none; b=PvzZvIZ5iowSGCQX5zR+ky1/gwFVpdRogJqsrQntKngcKadikr2dL3nKSaOyyb7CMD+3PrnnLPqf23k1mrDFzHAO6UnriN2iBR4sJvg9kR5CgR0U5I3R4be3oM6KKs+gYd8TUJz+hd/2oF38dGuhUBTOFG1843LmJDEFOcFNUg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788963797; c=relaxed/simple;
	bh=nFPuMNiXrcqAj1n6GvDKAmkfLd64Dm/b40xI5tLklM8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HbklRqeBKhNUsEJqiCDXbuTvpPDWR9WmEza4xyjgX/FUfuBnYcZprfmb9KuOCoGl+tSpYL5Xl5E063+6sCnBevevVRvP+bR6Yacio2TkwXF2Wrw1JkCv+wALwdQKm6153YC3+eAoljAxxmaMSuJFz0d16i8T8gec68dhC/dqQF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L1Uu4Mpj; arc=none smtp.client-ip=95.215.58.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L1Uu4Mpj"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nFPuMNiXrcqAj1n6GvDKAmkfLd64Dm/b40xI5tLklM8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788963793; v=1; x=1789568593;
 b=L1Uu4MpjU3BOiLgQA++O3z90jEizntOxLuMeXBFM9gnpUKXSrhrZMn6Kq6v6smYgbLgLGIx7
 +3HPm8yyUnao3ctCU9zVXuIS6xStveF6mL9jSgl+WvRUtuhV+ZqM3BAhDT1hhOrjBziN7k9EWuP
 kutcDiCextSbBGakMkSaI2qk=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 09b6f51bc154ba85;
	Wed, 09 Sep 2026 14:23:13 +0000
X-Mizu-Trace-ID: 09b6f51bc154ba85
X-Migadu-Flow: FLOW_OUT
Message-ID: <9d6a8eb0-9518-471a-b20e-68f45d55ff54@linux.dev>
Date: Wed, 9 Sep 2026 15:42:39 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/24] ALSA compress / ASoC compress / SOF: Compressed
 audio support with IPC4
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, vkoul@kernel.org,
 perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
 srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/9/26 11:09, Peter Ujfalusi wrote:
> Hi,
> 
> Changes since v1:
> - Add patch to snd_card_file_add/remove for compress
> - Hanlde the SND_COMPR_TRIGGER_NEXT_TRACK in soc_compr_trigger_fe()
> 
> Cover letter:
> 
> This series adds compressed audio support for SOF with IPC4 firmware.
> Supported formats are PCM, MP3, AAC and VORBIS, the feature set is
> PAUSE_PUSH/RELEASE, DRAIN and position reporting.
> 
> Patches 1-5 are prerequisites in the ALSA compress core and in
> soc-compress.c.
> 
> These are core fixes rather than driver level workarounds on purpose.
> The other users of compressed DPCM have DSP internal ports on their
> BEs, driven by code they own. An Intel/SOF BE ends at a third party
> CODEC driver which is shared with the non DPCM case and has no reason
> to know that the FE is compressed. That set of CODECs is open ended,
> so teaching each of them to cope with a compressed FE does not scale.
> The core has to hand a BE the same substream state whether the FE is
> a PCM or a compressed one.
> 
> Two of these patches change behaviour for the existing users of
> compressed DPCM, so they would need a look from Qualcomm and NXP:
> 
>  - "ASoC: soc-compress: Implement trigger FE-BE sequencing as with
>    normal PCMs" makes the FE/BE trigger order follow
>    dai_link->trigger[], the way dpcm_fe_dai_do_trigger() does it.
>    Neither sound/soc/qcom/ nor sound/soc/fsl/ sets it, so both default
>    to SND_SOC_DPCM_TRIGGER_PRE: START keeps the current order, but
>    STOP, SUSPEND and PAUSE_PUSH now trigger the BE before the FE.
> 
>  - "ASoC: soc-compress: Stop running dpcm on free" sends a STOP trigger
>    from soc_compr_free_fe() if the DPCM is still in START state, which
>    is the case when the last trigger the stream received was a DRAIN.
> 
> Patches 6-20 implement the IPC4 compressed support, patch 21 is a
> Kconfig cleanup. The last two patches enable the feature, in Kconfig
> for TGL and later and in the topology parser, so the compressed device
> type only becomes usable once the code behind it is in place.

It's a rather large and broad patchset. I would break it up in two or
three, you have quite a few cleanup/prerequisite patches that could be
submitted earlier. Then add the ALSA/ASOC changes that might impact
others. And last SOF support for Intel IPC4 platforms when all the
required patches are in.

Otherwise nice job, no major issues, just nit-picks and minor comments.

Thanks Peter!

> Testing:
> 
>  - IPC4: Arrow Lake, compressed playback on speaker and headphone
>    (cs42l43), MP3, AAC and VORBIS.
>  - IPC3: tested by NXP. This does not cover the STOP on free path
>    above, as they do not implement DRAIN.
> 
> Regards,
> Peter
> ---
> Peter Ujfalusi (18):
>   ALSA: compress: pin card module while stream is open
>   ALSA: compress: register the open file with the card
>   ALSA: compress: stop active streams on disconnect
>   ASoC: soc-compress: Provide a runtime for the compressed FE substream
>   ASoC: soc-compress: Implement trigger FE-BE sequencing as with normal
>     PCMs
>   ASoC: soc-compress: Stop running dpcm on free
>   ASoC: SOF: ipc4-pcm: harden pipeline teardown races
>   ASoC: SOF: sof-audio: do not dereference swidget->spipe
>     unconditionally on free
>   ASoC: SOF: ipc4: Add definition of module data in init_ext object type
>   ASoC: SOF: ipc4-topology: Support init_ext_module_data for process
>     modules
>   ASoC: SOF: ipc4-pcm: Make the timestamp info usable outside of
>     ipc4-pcm.c
>   ASoC: SOF: ipc4/ipc4-loader: Add SOF_INFO and CODEC_INFO to
>     fw_config_params
>   ASoC: SOF: ipc4-pcm: Handle COMPR DRAIN triggers as EOS pipeline state
>   ASoC: SOF: ipc4-topology: Set FAST_MODE for host copier in compr mode
>   ASoC: SOF: Add support for IPC4 compressed
>   ASoC: SOF: ipc4: Handle compressed drain done notification from
>     firmware
>   ASoC: SOF: Intel: Kconfig: Remove redundant IPC version selects
>   ASoC: SOF: Intel: Kconfig: Select compress support for TGL+ platforms
> 
> Ranjani Sridharan (6):
>   ASoC: SOF: compress: Rename compress ops with ipc3 prefix
>   ASoC: SOF: sof-audio: Expose a couple of functions
>   ASoC: SOF: pcm: Modify the signature of a couple of PCM IPC ops
>   ASoC: SOF: intel: hda-stream: Clear the current position when
>     releasing stream
>   ASoC: SOF: ops: Add new platform-specific ops for compress
>   ASoC: SOF: topology: Add support for decoder and encoder widgets
> 
>  include/sound/compress_driver.h               |   2 +
>  include/sound/sof/ipc4/header.h               |  24 +-
>  sound/core/compress_offload.c                 |  86 +-
>  sound/soc/soc-compress.c                      | 200 ++++-
>  sound/soc/sof/Makefile                        |   4 +-
>  sound/soc/sof/core.c                          |  10 +-
>  sound/soc/sof/intel/Kconfig                   |   9 +-
>  sound/soc/sof/intel/hda-common-ops.c          |   8 +
>  sound/soc/sof/intel/hda-pcm.c                 | 142 ++++
>  sound/soc/sof/intel/hda-stream.c              |  70 +-
>  sound/soc/sof/intel/hda.h                     |  15 +
>  sound/soc/sof/{compress.c => ipc3-compress.c} | 145 +---
>  sound/soc/sof/ipc3-pcm.c                      |  29 +-
>  sound/soc/sof/ipc3-priv.h                     |   3 +
>  sound/soc/sof/ipc4-compress.c                 | 776 ++++++++++++++++++
>  sound/soc/sof/ipc4-loader.c                   |  51 ++
>  sound/soc/sof/ipc4-pcm.c                      | 125 +--
>  sound/soc/sof/ipc4-priv.h                     |  45 +
>  sound/soc/sof/ipc4-topology.c                 | 115 ++-
>  sound/soc/sof/ipc4-topology.h                 |   9 +
>  sound/soc/sof/ipc4.c                          |  13 +-
>  sound/soc/sof/ops.h                           |  74 ++
>  sound/soc/sof/pcm.c                           |  18 +-
>  sound/soc/sof/sof-audio.c                     |  89 +-
>  sound/soc/sof/sof-audio.h                     |  23 +-
>  sound/soc/sof/sof-priv.h                      |  12 +
>  sound/soc/sof/topology.c                      |   2 +
>  27 files changed, 1790 insertions(+), 309 deletions(-)
>  rename sound/soc/sof/{compress.c => ipc3-compress.c} (66%)
>  create mode 100644 sound/soc/sof/ipc4-compress.c
> 

