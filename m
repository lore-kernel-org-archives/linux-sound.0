Received: from mta0.migadu.com (out-63.mta0.migadu.com [91.218.175.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6B34399D5
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 19:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789153989; cv=none; b=i/K8dZV/De3xbjJ5smy7otKGaEX3QRxB0V1CONcEmaOW8DXRBOaHsDWwtYEogwVX3YgqD544/bG/WTuCa/xiCvusS3bjm/VSBIQ6h7tQaPfvcgzdrXgrCd6MmsuQuePdtuSIVuHj65TGHi6v1P59Nk3yoRyd6u53q37qnZ8RSqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789153989; c=relaxed/simple;
	bh=yW/A8KSIEQ72BeG7DCs1DJBJXcmHs41E/dEh7A+7t2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZ7xSQsYYS0K04qkA6P9hx3FLWfWLCJxodlXgiqps/bU5qjIIHj19supfo/ocWRDqqFktbgbhzqn/IgRja5ykZ7AyMU5tllZf4UUpIkny8sEm4z6r7RpMSnBzX9N0TJrGjtuBbXdoeha6XuCMnNQfhgNZfieZfNslmhSWt/kmPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OtEZuP/U; arc=none smtp.client-ip=91.218.175.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OtEZuP/U"
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yW/A8KSIEQ72BeG7DCs1DJBJXcmHs41E/dEh7A+7t2M=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789153979; v=1; x=1789758779;
 b=OtEZuP/UvuEH1IjGWM2chnPHhEP3QeV8yL51vTfpTjyfyKLAD5n2GY3xFNt/Xfe1TjLtDp5P
 XvkTWRBTgYlIJ15ErpzouT8IptVa0wvOIptBwDonfgEAjavQ6qrrP4dUl6NFRf/x2hTjy+L7Jkb
 e8EsQ6c6TKrJhw04y8Ljz4pQ=
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d9d85bdfe4abdb8f;
	Fri, 11 Sep 2026 19:12:48 +0000
X-Mizu-Trace-ID: d9d85bdfe4abdb8f
X-Migadu-Flow: FLOW_OUT
Message-ID: <8f29b02a-6aec-4a0c-b375-adb67c38e60b@linux.dev>
Date: Fri, 11 Sep 2026 21:08:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/24] ASoC: SOF: ipc4-topology: Set FAST_MODE for host
 copier in compr mode
To: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
 broonie@kernel.org, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-sound@vger.kernel.org, kai.vehmanen@linux.intel.com,
 yung-chuan.liao@linux.intel.com, daniel.baluta@nxp.com
References: <20260909090949.7503-1-peter.ujfalusi@linux.intel.com>
 <20260909090949.7503-20-peter.ujfalusi@linux.intel.com>
 <0bb3caad-5734-4524-8a9b-75b3c5e058dc@linux.dev>
 <e210f571-fa14-4994-af7c-ca0302ba35ed@linux.intel.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <e210f571-fa14-4994-af7c-ca0302ba35ed@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


>>> FAST_MODE allows the host DMA to work in opportunistic, free running mode,
>>> which matches with the bitstream nature of compressed devices.
>>
>> Does it?
> 
> Yes, it does.
> 
>> My memory of the 'opportunistic' behavior was that the DMA would try to
>> use every possible window to send to/from the DSP, so that the bus would
>> be idle for longer periods of time overall.
> 
> The FAST_MODE detaches the host copier form the sampling rate completely
> and will 'allow' prolonged periods w/o new data to be available. The
> IPC4 definition of the feature bit says:
> /* If FAST_MODE bit is set in CopierModuleCfg::copier_feature_mask then
>    copier is able to transfer more than ibs. This bit shall be set only
>    if all sinks are connected to data processing queue.
> */
>> That would make sense as well for PCM, no?
> 
> We have similar mode for PCMs with Deep Bufferr, but that is a different
> mechanism: it only makes the DMA move in bigger chunks, expressed in ms
> (SOF_TKN_INTEL_COPIER_DEEP_BUFFER_DMA_MS -> dma_buffer_size), so it is
> still bound by the sampling rate checks. It is not opportunistic.
>> Maybe this is the right thing to do for compressed data, I just wonder
>> why it is NOT the right thing to do for PCM...
> 
> Basically FAST_MODE is a free run mode of the host copier. A PCM stream
> has a sampling rate the host side can and should be paced by, a
> compressed stream is a bitstream where the host side has no such reference.

For the host-dsp transfers, there is no reason at all for the DMAs to be
paced by the PCM rate...It's only for the DSP-interface DMAs that it
makes sense.
