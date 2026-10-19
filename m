Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426851;
	b=VmECnFU8t92bEpm1rlsncitkPogBp5Ve0mzOm6AkuMkmg3lq0NpJvVXR4in79sJqEeIn
	 x2UnYaQxFgGjOgXwqnoko8M7t2XF7banJzGwOPrc39xmDf71tZ+RuVNmMncf/jnY6cOdb
	 SeJAu34IK7mR+u864He9L0wnyXbnmWKb57FazogBoga0l4+2gjGAP4W3FN6RvGSPBKOxn
	 mBE7pw8WHd5lGyfIm3FUPBJpv268OX6Sctj1s0Y2/zq64lMuJA/86tAxyyRSblIof8yj0
	 F5ND7HrqmPYpm2itaFVwxlv6Iroyo6UrS3WQ0pVzf+m2VkaBzPFeDbTkwtkdnXb0llw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426851;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=J/0wPbhXzTQT3bpxR/dxioe0MV62x2a+VU8CjVUfg+A=;
	b=uLkYUUU3InY5fhsaRFynm7SlODoKWWy9dNXeRLUGrLcuH35CukVLD70U3lXY0JRXpnfR
	 HhxACyOVqD2ui+KaL1VFnYP7wfiL7XnGBG1NYnhGRQzJOpHbfnCr1BUHyyNr50LDZGHuF
	 Xu4CIifDmYiumE4Lh6pTeq9v07GimCVSL34jwn0FGj0dgz2QXgkoTyQxEimjCxcEpW1Eu
	 sIhFXmhImQXZ+jKpyh48DSSmt78Wt9lC+OeBMHoSv08fxuOMmLOQ/+t6qtYYDqXuWhaMA
	 YjLuGCRQpA6SAGQXaMVi+RY/cvrBWSV/hLFJQRNleAQrgBXz5j0xQBBPBCec84mpQug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xOaYxYMH;
	arc=none smtp.remote-ip=91.218.175.244
Received: from mta0.migadu.com (out-244.mta0.migadu.com [91.218.175.244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC848606A31A
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 16:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC848606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xOaYxYMH
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Xeca3n6lmfyJVzcxN3CESOBuimNE32PHjo4jv87HDG4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792426849; v=1; x=1793031649;
 b=xOaYxYMHRgUpFq94Z31nEPnhj3ySdI57wx7UEImkWB/nkCX3pVHzPMoRN5AsSRznFW0XHTgP
 kUQMoON0UORLKt4+0swkpS+24kAAf291jau4BXwUc+Crwcm1C+bcAKRuKW20NxzgJ6e62fF8wDA
 7cgW7kbe7HrVzIEADD+hJ0yY=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d60bd2750841b06b;
	Mon, 19 Oct 2026 16:20:47 +0000
X-Mizu-Trace-ID: d60bd2750841b06b
X-Migadu-Flow: FLOW_OUT
Message-ID: <e1d55639-bdb2-4b26-876b-68c71e7f724f@linux.dev>
Date: Mon, 19 Oct 2026 18:19:10 +0200
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
Subject: Re: [PATCH 4/4] ASoC: SDCA: class_function: clear sconfig.bps on PDM
 data-port terminals
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Maciej Strozek <mstrozek@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261018192359.287987-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261018192359.287987-5-srinivas.kandagatla@oss.qualcomm.com>
 <atXck2Ef4OllKrAA@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <atXck2Ef4OllKrAA@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>  static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream,
>>  					     struct snd_pcm_hw_params *params,
>>  					     struct snd_soc_dai *dai)
>> @@ -133,6 +144,7 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
>>  	struct class_function_drv *drv = snd_soc_component_get_drvdata(dai->component);
>>  	struct sdw_stream_runtime *sdw_stream = snd_soc_dai_get_dma_data(dai, substream);
>>  	struct sdw_slave *sdw = dev_to_sdw_dev(drv->dev->parent);
>> +	struct sdca_entity *entity = &drv->function->entities[dai->id];
>>  	struct sdw_stream_config sconfig = {0};
>>  	struct sdw_port_config pconfig = {0};
>>  	int ret;
>> @@ -152,6 +164,9 @@ static int class_function_sdw_add_peripheral(struct snd_pcm_substream *substream
>>  
>>  	pconfig.num = ret;
>>  
>> +	if (class_function_terminal_is_pdm(entity->iot.type))
>> +		sconfig.bps = 0;
> 
> I think this is fine, as you say bps makes no sense for a PDM
> stream but I might need to spend a little more time working out
> how this all propagates through the core. I guess my concern is
> if other drivers don't handle PDM in the same way.

It's a bit odd to rely on bps when we already have a type for the stream
in struct sdw_stream_config:

@type: Stream type PCM, PDM or BPT



