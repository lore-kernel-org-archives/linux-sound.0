Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795426858;
	b=OizuGDLO+NNkA1k5EPm879m4UJ759Q6+jtgucWZcR97+6jXz+Ip8uxn0gP1UnomF2Ejz
	 0zIa0HP72UkMQBBpazdrAJYojfdObxPlJHWxWsjmc8pGc32mP/Uu6RfJMErqvMb5++N+j
	 i4T/u6OeGpXZwUch1eLoTcO6odRkZkKLwS/HEfCfeEdJInC0GCC+tqdgnej30BImttAXU
	 ghgqUfg9rw0QoWQcTn/Juyr2vgNa8NOdgAQmRoWoNfuTo4evJQ1uKvFjZvICgBpsne41O
	 XHnWqN92xYrWr8WjQ3bs0QotDDPVnVFiuqOAE3jGKzEczfdney+eSqWvJEGEAAIm89Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795426858;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=Ck8/DWRpmhzKsO2xFeinQ8Y/M6Rk/b55Rx3L46L5mmQ=;
	b=g2aOCGcbrr8avdhnCyxsEv1uin7liBxQkO0im6YEnfUOLyV2obGRe4AkH4iENldq1/Ad
	 cnY5r0BtdX28A7o99EtXhanYf2fnTwG+zspFbsPmWkOQ1pB0VASkhnVn8eOZnul4SAHVf
	 qibjfInkwjrxUB6U10tVYe8ZbaMncKKEuXWVTSXAlpAacvC9Zq3Ob0NeIueWed8MpX2jX
	 19krxIYQTIiiXj/gW2SJGpk811aR8AB47onG2tDiufdKV14ZtoIm+mL0o6x3cVYnOfRtv
	 36Z0Y9uEIv4tBkKt6gLRsWpFkCMVacKoFj9QnZclL4TXGcOZeUMukUZZ90GH4W10yVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Gj6aIkZ6;
	arc=none smtp.remote-ip=95.215.58.2
Received: from mta1.migadu.com (out-2.mta1.migadu.com [95.215.58.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDEF9606A31E
	for <linux-sound@vger.kernel.org>; Mon, 23 Nov 2026 09:40:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDEF9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Gj6aIkZ6
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=wBdhgv5N+I4zAH+2wvzcWYEP5XbAEgHVQBDbSpVhCxQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795426856; v=1; x=1796031656;
 b=Gj6aIkZ6WdhtCWwz6fR5O0J2JLlDbtQARjBVcdQF1sRU4oi1t8nFuX5AmDCOQYHZp1CX/4dY
 PsL9xrxMrPY8hxVm1uf5nUx7m6lU+Wvu+9mn6NEHfeX7ZUZuTmZUsYLUrQK28vjDlDQCGE8BY0D
 C8F/seldp/Dm2ofoyBTqc8GI=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 53d929c664199600;
	Mon, 23 Nov 2026 09:40:32 +0000
X-Mizu-Trace-ID: 53d929c664199600
X-Migadu-Flow: FLOW_OUT
Message-ID: <b3df76ad-e002-4ec0-a1a6-812d22b51432@linux.dev>
Date: Mon, 23 Nov 2026 10:39:33 +0100
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/24] ASoC: soc-pcm: add multi_direction_codecs link
 flag
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261122161437.5994-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261122161437.5994-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/22/26 17:14, Srinivas Kandagatla wrote:
> Speaker protection needs the amplifiers' V/I sense capture running
> whenever the speakers play. Putting the capture codec DAIs on the
> playback BE link ties the two together, but the core skips codec DAIs
> whose direction does not match the substream.
> 
> Add a multi_direction_codecs link flag. When set, the core also calls
> .hw_params and .hw_free on codec DAIs of the other direction, with the
> substream direction switched to theirs for the call under pcm_mutex,
> and sends the matching stream events so their widgets power up and
> down. An optional multi_direction_params_fixup callback lets the
> machine driver set the parameters for those DAIs. Links without the
> flag are unchanged.
> 
> Document the flag in Documentation/sound/soc/multi-direction-codecs.rst.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  Documentation/sound/soc/index.rst             |   1 +
>  .../sound/soc/multi-direction-codecs.rst      | 156 ++++++++++++++++++
>  include/sound/soc-dapm.h                      |   2 +
>  include/sound/soc.h                           |   7 +
>  sound/soc/soc-dapm.c                          |  32 ++++
>  sound/soc/soc-pcm.c                           | 136 ++++++++++++---
>  6 files changed, 314 insertions(+), 20 deletions(-)
>  create mode 100644 Documentation/sound/soc/multi-direction-codecs.rst
> 
> diff --git a/Documentation/sound/soc/index.rst b/Documentation/sound/soc/index.rst
> index 22878d73f7a5..62d01a0a6e52 100644
> --- a/Documentation/sound/soc/index.rst
> +++ b/Documentation/sound/soc/index.rst
> @@ -18,4 +18,5 @@ The documentation is split into the following sections:-
>     jack
>     dpcm
>     codec-to-codec
> +   multi-direction-codecs
>     usb
> diff --git a/Documentation/sound/soc/multi-direction-codecs.rst b/Documentation/sound/soc/multi-direction-codecs.rst
> new file mode 100644
> index 000000000000..2af61598dd7b
> --- /dev/null
> +++ b/Documentation/sound/soc/multi-direction-codecs.rst
> @@ -0,0 +1,156 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===========================
> +Multi-direction codec DAIs
> +===========================
> +
> +Overview
> +========
> +
> +An ASoC backend (BE) link that bundles **codec DAIs of both directions**
> +on a **single-direction CPU DAI** can set
> +``snd_soc_dai_link.multi_direction_codecs`` to tell the ASoC core to
> +call ``.hw_params`` / ``.hw_free`` on opposite-direction codec DAIs with
> +their own direction, instead of skipping them.
> +
> +Typical use case: a smart-amp speaker protection link where the CPU
> +side is a playback-only DMA (e.g. ``WSA_CODEC_DMA_RX_0`` on Qualcomm
> +AudioReach), but the codec side exposes both a playback SPKR DAI and a
> +companion capture V/I-sense DAI on the same SoundWire bus.  Opening the
> +playback FE should bring up both the amplifier output chain *and* its
> +V/I feedback capture chain atomically, without userspace having to open
> +a secondary PCM.

This is a valid use case that has been problematic for some time on
other platform as well.

What puzzles me in your approach is that the codec-side will be
configured/started, but *something* will need to grab/process the
feedback IV data generated by the codec DAI. That part seems to be
completely hidden in your approach, is this intentional? How would a
capture DAI be configured on the CPU side so that the data is provided
to a DSP? Some of the patches, e.g. 11/24, mention a capture dai but I
can't connect the dots with the suggested codec-dai changes.

In addition the feedback loop can be made of not only I/V sense but may
also carry an echo reference, and that may have to go all the way to
userspace depending on where the processing is handled, possibly with a
split between IV sense and echo reference making the topology even more
complex.

And last the SoundWire core exposes a concept of 'stream' that is single
direction, and so far we've used a 1:1 mapping between dailinks and
streams. If part of the dailink is dual-direction, don't we have a
problem on the SoundWire side?


