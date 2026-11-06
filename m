Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.168
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969748;
	b=gKwGQiGDXcRI296i7UBHHE6cq02FKpLBtTmEt632QT4SX9+AWHL0nzAxGgKTlMbhdfy8
	 pEIj9ZYkJPcHNiEgwdJpabxBHPjrT9E4yMl44X7KZherWluPtqU5mVNzvRXzgt0lBTrTG
	 69a1xSFSWmJDwSUkfLhoVkKomZbifri0Ip8WzqHQKfbJqMq/JaNXgwnpXL+D0Ub533UAA
	 rp8PsYhXLnwBDLT2pCYpXv1o+bpv8ESa/f9QVBF7ijGqaKmUYsoo2j+9peliX8QyswIF+
	 R36MZ8kRhKUJYLkSOHpMpqMs3xMhL1wLLuhWjSxTdf6+LlB7bKmPaTMfw9gTa3sBwog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969748;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=8EmPdC5vWewEi/5asfkXUR4yzn7T9ol+sLCcTMAMAlY=;
	b=kcS0KSJS8SqdHJrKJr+/cdvZpT0hlm6YcjhhBxXsu9ngx9nd5I8/dO8bQaniImD3xtDT
	 LgrSY31/KBeMR0Ex6UJNP7o4rpPbdl1k+u2KZnhal6TgWF4a/6aS1w3C0ILDpElACfM6z
	 zcjL7RWUVuCsmYGULHevhWpqX+snj0hkv0HbQy7QhNDMN8e4wmnNxouL4qdAQ4BeG6mU6
	 tVDQ7Jv2PiOweHexPV7Qs6pOaXG00BC0yi3TY4CqtXGJ6MRghNuKven/SOvdd2GYOUQEn
	 wf6+41qZ0WGzP4zEoTB/UDjUdJTMSpRXsNj06o4bP6RoccoqDYqG82tDMh7SyV1WtZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GRKnl3dQ;
	arc=none smtp.remote-ip=95.215.58.168
Received: from mta1.migadu.com (out-168.mta1.migadu.com [95.215.58.168])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644DB606A329
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 12:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 644DB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=GRKnl3dQ
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SZeod1/wR3B7byzDkHEF+Alv03HKTEf56jpKSs65qaA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793969744; v=1; x=1794574544;
 b=GRKnl3dQENpx7OuGWk/zV9zp4FcD+WWMpJWJuRIwt8rzvovFJdz8WwIQl5ihy320R8XuVtQ7
 1BCgTHuYW4lcfqkPfTvExdGh1SA3xAXz9bPzNK4U72HId3jnxyQ9NgRlc0INbrYVY3Q+VLgGBQ/
 MPatKpjCYA24wB5nMu1FrX9U=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2338f323af298724;
	Fri, 06 Nov 2026 12:55:32 +0000
X-Mizu-Trace-ID: 2338f323af298724
X-Migadu-Flow: FLOW_OUT
Message-ID: <fc911031-2367-4bb9-b0eb-f795965e629e@linux.dev>
Date: Fri, 6 Nov 2026 13:55:31 +0100
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
Subject: Re: [PATCH v3 7/7] ASoC: Intel: avs: SoundWire PCM BE operations
To: Cezary Rojewski <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
Cc: broonie@kernel.org, tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
 linux-kernel@vger.kernel.org, yung-chuan.liao@linux.intel.com,
 vkoul@kernel.org
References: <20261106121557.2338556-1-cezary.rojewski@intel.com>
 <20261106121557.2338556-8-cezary.rojewski@intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <20261106121557.2338556-8-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

I am afraid this patch needs to be completely re-visited. You mixed dai
and dailink layers, and that explains most of the misunderstandings in
the review of the PDI stuff where I mentioned that what matters is how
the dailink is created.

> +static int avs_sdw_dai_startup(struct snd_pcm_substream *substream, struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct sdw_stream_runtime *sdw_stream;
> +	struct snd_soc_acpi_mach *mach;
> +	struct snd_soc_dai *codec_dai;
> +	struct avs_dma_data *data;
> +	struct sdw_cdns_pdi *pdi;
> +	struct sdw_slave *codec;
> +	int dir, ret;
> +
> +	mach = dev_get_platdata(dai->component->card->dev);
> +	codec = mach->pdata;
> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> +		dir = SDW_DATA_DIR_RX;
> +	else
> +		dir = SDW_DATA_DIR_TX;
> +
> +	ret = avs_dai_startup(substream, dai);
> +	if (ret)
> +		return ret;
> +
> +	sdw_stream = sdw_alloc_stream(substream->name, SDW_STREAM_PCM);
> +	if (!sdw_stream) {
> +		ret = -ENOMEM;
> +		goto err_alloc_stream;
> +	}

This isn't quite the intented use of the SoundWire stream API, which
provides a sdw_startup_stream() that's supposed to be invoked during the
dailink creation in the machine driver that binds cpu and codec dais

"
 sdw_alloc_stream should be called only once per stream. Typically
 invoked from ALSA/ASoC machine/platform driver.
"


The dailink maps exactly 1:1 to the SoundWire stream concept, and that's
what allows us to deal with aggregation - when multiple cpu_dais on
multiple links are connected to multiple amps. That's the #1 reason why
SoundWire exists and the #1 difference to other audio interfaces.

BPT/BRA support is the only case where sdw_alloc_stream() is used in the
Intel platform driver, since there's clearly no concept of cpu_ or codec
DAI.

> +
> +	pdi = sdw_cdns_assign_pdi(codec->bus, dir);
> +	if (!pdi) {
> +		ret = -EBUSY;
> +		goto err_assign_pdi;
> +	}
> +
> +	/* Fulfill the codec needs by setting the sdw_stream. */
> +	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
> +	snd_soc_dai_set_stream(codec_dai, sdw_stream, substream->stream);

That absolutely does not scale to the case where you have multiple
cpu_dais and multiple codec_dais.

Please take a look at the sof_sdw machine driver (same solution used by
AMD), and please use the sdw_utils library to deal with all the stream
management.

> +	data = snd_soc_dai_get_dma_data(dai, substream);
> +	data->sdw_stream = sdw_stream;
> +	data->pdi = pdi;
> +	return 0;
> +
> +err_assign_pdi:
> +	sdw_release_stream(sdw_stream);
> +err_alloc_stream:
> +	avs_dai_shutdown(substream, dai);
> +	return ret;
> +}


