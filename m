Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B4D26056C
	for <linux-sound@vger.kernel.org>; Sat,  9 May 2026 11:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778327968; cv=none; b=EJff0+mUNgn+gT/4hY9YuHwcLqJAK4sQIBoLRVgbhk48bIGdBd1KWINqFRbtZrAqsSfylFvrE4klnDw9VvIBmknKf7F/032BG/LN2aV2pv5uqmEecaaaU6pax/1bYwG/razPXJ0tbo8j+K1a6AH0hJPaPuUUX1IXv3ezmemhh7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778327968; c=relaxed/simple;
	bh=4TzAM6YGpq0d3YFgzUzzIDG7465er24S5rfTFzfo3lw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pg1cFIEZNULgSlJ4/wyJQqSNI49s9wc9dzht512GYhtxVRLxMu0yAAw8qKOXD+5rUB5x0I7yAKWhKlNNroddq/elNp2Bm0Y3JBdlu8oIUT34fyqEAlUxxaEpuBD3LkMmR148Um8A6t/rcw2NKltllgWNTEe6U6hTGPIPj7P+sG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=TlkNWCN6; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="TlkNWCN6"
Message-ID: <85846b1a-b391-48ee-8d28-9be4027cd64b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778327963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=epRGLw8nFudfTQzAlq3JuFWYqeQtPD2IsBXjpxHz/B0=;
	b=TlkNWCN6RrOtJYhLwONfPOASJiUp0nO55alsGLdXVUYTjPgTEzktMrqnwTbuqal0ONAKYU
	9+NRAwiZ1kRdvUg1a/AsadB1Lfz7HeuEoUr/InvsXQmZI6iahYg6VyuxoONudIjrYkvWQn
	dwiTf2ccfiFgujln0b0fBGDpzfpJwoA=
Date: Sat, 9 May 2026 13:58:59 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v12 0/6] Add es9356 focused SoundWire CODEC
To: Zhang Yi <zhangyi@everest-semi.com>, broonie@kernel.org, tiwai@suse.com,
 linux-sound@vger.kernel.org
Cc: peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 ckeepax@opensource.cirrus.com, vkoul@kernel.org
References: <20260509101102.10286-1-zhangyi@everest-semi.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20260509101102.10286-1-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/9/26 12:10, Zhang Yi wrote:
> This patch chain adds support for the ES9356 PC focused
> SoundWire CODEC.

for the patchset:

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

note that updates will be needed to use new SDCA common helpers for power-up/down and resume.

 
> v12 -> v11:
> 	-Fix a helper function to `hw_params` and `hw_free`
> 	-Move pm_runtime initializations to probe
> 	-Add es9356 to wake_capable_list
> 
> v11 -> v10:
> 	-Add some comment for lock
> 	-Add a helper function to `hw_params` and `hw_free`
> 
> v10 -> v9:
> 	-Add some comment at codec driver
> 	-Fixed the jack_lock issue during suspend
> 
> v9 -> v8:
> 	-Fix some formatting issues in es9356.c
> 	-Removed regmap_write(SDW_SCP_SYSTEMCTRL) from the codec driver
> 
> v8 -> v7:
> 	-When the device status is UNATTACHED,
> 	 set regmap to cache-only and cancel any delay work already in the queue.
> 
> v7 -> v6:
> 	-Provide comments for some parameters
> 	-Rename `jack_detect_work` to `interrupt_handle_work`
> 	-Add a jack_lock when handling disable_irq in suspend
> 	-Adjust the handling procedure when a jack register
> 	 is incorrectly identified
> 	-Replace the custom SOC_SINGLE_Q78_TLV with SDCA_SINGLE_Q78_TLV
> 
> v6 -> v5:
> 	-Handling default values in `button_detect` and `jack_detect`
> 	-Add the member `disable_irq` so that interrupts are
> 	 no longer processed after suspend.
> 	-Move the PDE processing to `hw_params` and `hw_free`
> 	-Separate JACK_OUT and JACK_IN in hw_params
> 	-Simplify reading and writing to SDW_SCP_SDCA_INT1 in the callback
> 	-Adjust the scope of `regcache_sync` in the resume
> 
> v5 -> v4:
> 	-Merge patch1 and patch3
> 	-Add vendor_id in codec_info
> 	-Use q78_get and q78_set to create Kcontrol
> 	-Set mbq_size and use regmap_mbq
> 	-An additional helper function to implement DAPM
> 
> v4 -> v3:
> 	-Updated some KControl names
> 	-add copyright in soc_sdw_es9356
> 
> v3 -> v2:
> 	-Removed unnecessary section in soc_sdw_es9356.c
> 	-Add `pm_runtime_put_noidle` to `es9356.c` to
> 	 reduce device incremented count
> 	-Updated some KControl names
> 	-Fix the error related to jack_report in the codec driver
> 
> v2 -> v1:
> 	-Adjusted mutexes in the ES9356 driver
> 	-Use macros to replace certain values
> 	-Adjusted some ordering issues in Kconfig.
> 
> v1 -> v0:
> 	-Modified snd_soc_dapm_add_routes in soc_sdw_es9356
> 
> Zhang Yi (6):
>   ASoC: sdw_utils: add soc_sdw_es9356
>   ASoC: sdw_utils: add ES9356 in codec_info_list
>   ASoC: es9356-sdca: Add ES9356 SDCA driver
>   ASoC: Intel: soc-acpi: arl: Add es9356 support
>   ASoC: Intel: sof_sdw: add es9356 support
>   soundwire: intel_auxdevice: Add es9356 to wake_capable_list
> 
>  drivers/soundwire/intel_auxdevice.c           |    1 +
>  include/sound/soc_sdw_utils.h                 |   14 +
>  sound/soc/codecs/Kconfig                      |    7 +
>  sound/soc/codecs/Makefile                     |    2 +
>  sound/soc/codecs/es9356.c                     | 1153 +++++++++++++++++
>  sound/soc/codecs/es9356.h                     |  208 +++
>  sound/soc/intel/boards/Kconfig                |    1 +
>  .../intel/common/soc-acpi-intel-arl-match.c   |   52 +
>  sound/soc/sdw_utils/soc_sdw_utils.c           |   50 +
>  9 files changed, 1488 insertions(+)
>  create mode 100644 sound/soc/codecs/es9356.c
>  create mode 100644 sound/soc/codecs/es9356.h
> 

