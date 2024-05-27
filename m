Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF8238FB9
	for <linux-sound@vger.kernel.org>; Mon, 27 May 2024 16:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716825615; cv=none; b=O7mO8KC1b1W9ZwoT/WoHIjdraD7SLtYlh4RNMvSvStiO/qK/plhi0N0n7qQkOsirvnwBcQY/ioZ3Q2OkDFxu1Cr8HGmhMuPGpytixHQRHbHYk9X7DOInsGmDxf1LFuyIPuL+JwFONmLq9D8tALTwxMB57Wa5FO3y3H3erFfoTf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716825615; c=relaxed/simple;
	bh=8HMimWexhl7mSHfD3r5ROXr88r0bJmU1l+NMBFSDgHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=WNa0VEFXfWjRQDHDx1ohXfP7ZbYutw+dd/GbsDcF1MGtyU491ZNy70C2Y2QnVEpsaFDSmrUrWSPbw5qhQ5SaiiBeZhPEHcevq1W+2lGxZgwWjtDF+BwpNByvu9IBepfpsgsmHGALrakSnTB4cKq2bLeyvZuD/pBnrWjvHrExWZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=ZdZhfOXT; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="ZdZhfOXT"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5A7434B9E;
	Mon, 27 May 2024 18:00:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5A7434B9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1716825608; bh=Id9QFIbrGGwMNxml7StQoGbhlTARSskOugZ/zJ3Doiw=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=ZdZhfOXT5Bp+l4CDbBd9YFhHuWYmR06o6Ld3MrYiWIvmrJ9+mLQFc2zrLvufbuwyy
	 Qn9LwHxXoEpoUrLzHHP6O45gdfh1ZxUuHsBQ5jtTlP/wpjCC9xXCLGIbkfyto4iyH8
	 Rtxqv+Wz7f6NMFaJDZqLrCVGa1WFwI+WB90K+A64=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 27 May 2024 18:00:00 +0200 (CEST)
Message-ID: <24226e6e-ccb5-43f0-b8c1-a0b044299e42@perex.cz>
Date: Mon, 27 May 2024 17:59:56 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] ALSA: compress_offload: introduce passthrough
 operation mode
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-sound@vger.kernel.org
References: <20240527071133.223066-1-perex@perex.cz>
 <a0db818d-8661-4ed1-b8dc-b221bb4ef9b8@linux.intel.com>
 <66bf7ad9-8680-4ed0-8e04-cac3ab701c46@perex.cz>
 <8aa8609b-eb8c-43c8-89ac-94b1eda267fd@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Vinod Koul <vinod.koul@intel.com>
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <8aa8609b-eb8c-43c8-89ac-94b1eda267fd@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27. 05. 24 17:35, Pierre-Louis Bossart wrote:
> Hi Jaroslav,
> did you intend to reply privately?
> I don't mind having this thread in public.

I also don't mind, it was just a mistake. Moving to public again. Thanks.

> 
> Couple of additional questions below.
> Regards,
> -Pierre
> 
> On 5/27/24 09:57, Jaroslav Kysela wrote:
>> On 27. 05. 24 16:17, Pierre-Louis Bossart wrote:
>>> Thanks Jaroslav, this is very interesting indeed.
>>> I added a set of comments to clarify the design.
>>>
>>>> +There is a requirement to expose the audio hardware that accelerates
>>>> various
>>>> +tasks for user space such as sample rate converters, compressed
>>>> +stream decoders, etc.
>>>
>>> "passthrough" usually means 'no change to data, filter coefficients not
>>> applied' in the audio world.
>>
>> I am open to any better word here. The passthrough means data passing
>> through a hardware as fast as possible in this contents.
> 
> I am trying to find a better word.
> 
>>>> +This is description for the API extension for the compress ALSA API
>>>> which
>>>> +is able to handle "tasks" that are not bound to real-time operations
>>>> +and allows for the serialization of operations.
>>>
>>> not sure what "not bound to real-time operations" means. sample-rate
>>> conversion is probably the most dependent on accurate timing :-)
>>
>> The meaning is that the data are not queued/processed with a real world
>> timing constraints like standard audio data for standard playback or
>> capture. It's limited just by hardware speed. I would appreciate
>> rewording from a native English speaker, of course.
> 
> What happens if one bit of hardware is actually tied to an audio clock?
> Would it prevent the use of the API?

No, the conversion will be just slow and the hardware driver should probably 
use a standard PCM for the data output or input. It will be more appropriate.

> I think the only difference with traditional ALSA is that there's no
> concept of xrun or time, but the hardware can implement the processing
> however it wants.

There is no restriction for this design, but I think that we have already 
interfaces for this. This is a proposal for the audio acceleration API.

>>>> +Requirements
>>>> +============
>>>> +
>>>> +The main requirements are:
>>>> +
>>>> +- serialization of multiple tasks for user space to allow multiple
>>>> +  operations without user space intervention
>>>> +
>>>> +- separate buffers (input + output) for each operation
> 
> I guess we're talking about a "pipeline" where all the buffers are
> shared/chained. Mixers and splitters are probably out-of-scope.
> 
> But I wonder if the last task could just consume data, or if the first
> task could just generate data. The former case would be processing that
> analyzes data and generates a 'score' or an event, and the latter would
> be some sort of hardware synthesizer.
> 
>>>> +
>>>> +- expose buffers using mmap to user space
>>>
>>> If every buffer is mmap'ed to userspace, what prevents userspace from
>>> interfering?
>>>
>>> I think userspace would only be involved at the source and sink of the
>>> processing chain, no?
>>
>> We probably talk about same thing. Each task has own buffers which are
>> exposed to user space. The interfering is similar like for any other API.
> 
> What I meant if that if userspace is involved in the middle of a chain,
> then it kind of breaks the idea that the processing is propagated as
> fast as possible through hardware. I don't really see the point of
> having intermediate buffers available to userspace.

There are no intermediate buffers in this API just input and output buffers 
yet. You probably have a bigger picture with the stream/data routing through 
multiple components. It's not the case (yet). The only advantage of existing 
dma-buf interface is that we can share those data among more drivers and user 
space simultaneously. The arbitration must be set elsewhere (and it is not set 
by this simple API).

>>>> +The API extension shares device enumeration and parameters handling
>>>> from
>>>> +the main compressed API. All other realtime streaming ioctls are
>>>> deactivated
>>>> +and a new set of task related ioctls are introduced. The standard
>>>> +read/write/mmap I/O operations are not supported in the passtrough
>>>> device.
>>>
>>> The compress API was geared to encoders/decoders. I am not sure how we
>>> would e.g. expose parameters for transcoders (decode-reencode) or even
>>> SRCs?
>>
>> I expect that the struct snd_codec structure will be modified (or usage
>> will be clarified) for transcoding.
> 
> What I meant is that the snd_codec took a lot of time to agree on, and
> it was based on standards. I wonder if for a generic API the parameters
> can be defined at all. It's probably hardware/vendor specific.

My goal is to start with something simple and decoding of the compressed 
stream to a PCM stream or ASRC use is really simple. Almost all parameters are 
already available in this structure, it's just about to settle the output 
buffer format.

>>>> +CREATE
>>>> +------
>>>> +Creates a set of input/output buffers. The input buffer size is
>>>> +fragment_size. Allocates unique seqno.
>>>> +
>>>> +The hardware drivers allocate internal 'struct dma_buf' for both
>>>> input and
>>>
>>> for each input and output buffers?
>>
>> Yes, for one task you need one input and one output buffer. All tasks
>> are separate (but serialized).
>>
>>>> +STOP
>>>> +----
>>>> +Stop (dequeues) a task. If seqno is zero, operation is executed for all
>>>> +tasks.
>>>
>>> Don't you need a DRAIN?
>>
>> I would expect that transcoding will be fast or the application may use
>> smaller input buffers. We can add drain only when really required.
>>
>>> for a co-processor API, you would want all the input data to be consumed
>>> and the stop happens when all the resulting data is provided in output
>>> buffers.
>>>
>>> And presumably when the input task is stopped, the state changes are
>>> propagated to the next task by the framework? Or is userspace supposed
>>> to track each and every task and change their state?
>>>
>>> I also wonder if the state for a task should reflect that it's waiting
>>> on data on its input, or conversely is blocked because the output
>>> buffers were not consumed? Dealing with SRC, encoders or decoders mean
>>> that the buffers are going to be used at vastly different rates on input
>>> and outputs.
>>
>> I would suggest to study the proposed sources. The allocated buffer
>> sizes may be different from the really used areas. The user space is
>> able to pass lower number of filled bytes than allocated. Also the
>> driver must ensure that the output buffer is large enough to store
>> result for the allocated input buffer size.
>>
>> The START operation means that user space filled all input bytes for the
>> conversion.
> 
> I have a doubt here. Is the intent to fill a bunch of buffers, then wait
> for the output to be ready?
> 
> Or can userspace write additional buffers while the output is being
> created (similar to what we do for ALSA today).
> 
> Take the SRC for example. userspace provides 1024 samples, gets the
> converted output. Now userspace provides a second 1024 sample buffer.
> That second conversion needs to use the history of the first processing.
> In other words, when a task is finished, it should not reset its
> internal context, there is a history buffer that should only be cleared
> if the input is a completely different track or content.

Yes, I would expect that the hardware driver will keep this state until first 
STOP command is received. STOP will create a discontinuation. Then the 
conversion will start again when more buffers are queued. User space can stop 
all tasks together, too.

>>>> +STATUS
>>>> +------
>>>> +Obtain the task status (active, finished). Also, the driver will set
>>>> +the real output data size (valid area in the output buffer).
>>>
>>> Is this assuming that the entire input buffer has valid data?
>>> There could be cases where the buffers are made of variable-length
>>> 'frames', it would be interesting to send such partial buffers to
>>> hardware. That's always been a problem with the existing compressed API,
>>> we couldn't deal with buffers that were partially filled.
>>
>> I expect that the initial handshake (params/metadata) should set all
>> parameters for the driver to determine the right (maximal) output buffer
>> size.
> 
> I wasn't talking about max sizes, but really that each buffer passed by
> userspace might contain different number of valid bytes. In ALSA, all
> the bytes are assumed to follow each other, we can't tell than the
> period N has 200 bytes and period N+1 has 106 bytes valid. That would be
> a great addition if we can lose the concept of 'ring buffer' and instead
> deal with independent buffers.

The proposed task works with independent buffers which may be reused to queue 
next data when the output (result) is consumed. The sizes of used areas in 
those buffers may be different for each task (variable data chunks).

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

