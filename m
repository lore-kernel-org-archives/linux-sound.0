Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 617861428E2
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 15:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719244744; cv=none; b=VZ2TRY0OKA7o3l+tKbfyTUvqjjyiwyx/xe/+9CIlctXsjkfb4AnfzzqaB60IPoKEYmPBspXk3ukRZkh3xfd00blpibnMRMUDtWMlbuaDk10xkI1Ufhex4yjRkDEo1vLXEDCJCYULt2ictnJT3v/kZ0BhwMMZEBOLBVrnPCs+2cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719244744; c=relaxed/simple;
	bh=DInjJFIGdpJScrtEwxn1VsKQNvSegoHLnM25y1AsDj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UBeCEp9gBSUpzchtN0hMYBaFo/C4Xq6LOGpsLFr7ZakZHyr4KeKghi90v9wxEqk1Z8mJL0gu+cufSjGPzS4mIq2aDqw2/BxKFCKhYAMOAHi3B5aIR3Ci5ti9obhLK4JC9LslXWxRjQRu9XX2enpOzNR/A+IhiOCH9YxLYZcsz8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=W2rFLxpc; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="W2rFLxpc"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 26A71416;
	Mon, 24 Jun 2024 17:58:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 26A71416
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1719244736; bh=5MC5d2JXsCxuPhRNwOpz4WEcKuta/c70gdYJ0DkEYM8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W2rFLxpcvNrdB5pwkA/xIShKdcbiyNk3opu7vjIfJ6xDQU+Ev8MZW/3CJomCmQv8H
	 s5CctdQnI3yhHGRnjJK3cy6x/P+I2gVb/Mafd1A+YzPkX/qo455IAW/wriQjxYBRDB
	 vazF6IurF8TBsI5QZ0IbxFg1Hj7Kiil2+rXmMQWE=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon, 24 Jun 2024 17:58:48 +0200 (CEST)
Message-ID: <51462bc7-d9da-4e2d-9244-a59184c4d8ed@perex.cz>
Date: Mon, 24 Jun 2024 17:58:47 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: compress_offload: introduce passthrough
 operation mode
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
References: <20240621164915.410946-1-perex@perex.cz>
 <18c2a323-f0b5-4dea-b502-ce7e7021c555@linux.intel.com>
Content-Language: en-US
From: Jaroslav Kysela <perex@perex.cz>
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <18c2a323-f0b5-4dea-b502-ce7e7021c555@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24. 06. 24 9:13, Pierre-Louis Bossart wrote:
> Thanks Jaroslav, couple of questions below:
> 
>> +For the buffering parameters, the fragments means a limit of allocated tasks
>> +for given device. The fragment_size limits the input buffer size for the given
>> +device. The output buffer size is determined by the driver (may be different
>> +from the input buffer size).
> 
> if (stream->direction == SND_COMPRESS_PASSTHROUGH)
> 	max_fragments = 64;			/* safe value */
> 
> Is there anything preventing us from increasing this if there was a need
> for it? Wondering if this would be an ABI restriction or just an
> internal safeguard userspace doesn't need to know.

It can be increased later when required. I think that 64 is good value for 
start, but it's not a limit which is set to a stone.

>> +CREATE
>> +------
>> +Creates a set of input/output buffers. The input buffer size is
>> +fragment_size. Allocates unique seqno.
>> +
>> +The hardware drivers allocate internal 'struct dma_buf' for both input and
>> +output buffers (using 'dma_buf_export()' function). The anonymous
>> +file descriptors for those buffers are passed to user space.
> 
> The code adds the tasks in the order in which they are created:
> 
> 	list_add_tail(&task->list, &stream->runtime->tasks);
> 
> This should probably be documented, there's no explicit mechanism to
> chain the tasks other than the order of creation.

I agree. I will document this in next version.

>> +FREE
>> +----
>> +Free a set of input/output buffers. If a task is active, the stop
>> +operation is executed before. If seqno is zero, operation is executed for all
>> +tasks.
> 
> Can a task in the middle of the list be freed?

Yes.

> If yes, is any locking required?

There's always stream mutex (stream->device->lock) held before any callback 
(operation) is called.

>> +START
>> +-----
>> +Starts (queues) a task. There are two cases of the task start - right after
>> +the task is created. In this case, origin_seqno must be zero.
>> +The second case is for reusing of already finished task. The origin_seqno
>> +must identify the task to be reused. In both cases, a new seqno value
>> +is allocated and returned to user space.
>> +
>> +The prerequisite is that application filled input dma buffer with
>> +new source data and set input_size to pass the real data size to the driver.
>> +
>> +The order of data processing is preserved (first started job must be
>> +finished at first).
>> +
>> +STOP
>> +----
>> +Stop (dequeues) a task. If seqno is zero, operation is executed for all
>> +tasks.
> 
> What happens if a STOP is sent to a task in the middle of the list?

The driver MUST remove this job from the queue.

> It's similar to the question on free above, the creation needs to follow
> an order but the free/stop can be individual tasks so there could be
> interesting state machine transition and programming errors.

Yes, I see your point. Probably the current code should call stop in reverse 
for "STOP ALL" or "FREE ALL" ioctls or in the file descriptor release callback 
to avoid "jump to next active job" in the driver for a short moment.

> I honestly find the state machine confusing, it looks like in the SETUP
> stage tasks can be added/removed dynamically, but I am not sure if it's
> a real use case? Most pipeline management add a bunch of processing,
> then go in the 'run' mode. Adding/removing stuff on a running pipeline
> is really painful and not super useful, is it?

This I/O mechanism tries to be "universal". As opposite to the standard 
streaming APIs, those tasks may be individual (without any state handling 
among multiple tasks). In this case, the "stop" in the middle makes sense. 
Also, it may make sense for real-time operation (remove altered/old data and 
feed new).

> 
>>   /**
>>    * struct snd_compr_runtime: runtime stream description
>>    * @state: stream state
>> @@ -54,6 +70,11 @@ struct snd_compr_runtime {
>>   	dma_addr_t dma_addr;
>>   	size_t dma_bytes;
>>   	struct snd_dma_buffer *dma_buffer_p;
>> +
>> +	u32 active_tasks;
>> +	u32 total_tasks;
>> +	u64 task_seqno;
>> +	struct list_head tasks;
>>   };
> 
> should there be some sort of identifier that says the stream in used in
> passthrough mode and only then are the 4 added members relevant?
> 
> 
> 'struct snd_compr_runtime' doesn't have a notion of direction, so
> there's no real way to know what set_params() requested.

'struct snd_compr_stream' is passed to all callbacks, so direction is known.

>> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
>> index d185957f3fe0..5fed1979522b 100644
>> --- a/include/uapi/sound/compress_offload.h
>> +++ b/include/uapi/sound/compress_offload.h
>> @@ -1,4 +1,4 @@
>> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +	/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> 
> spurious change?

Yes. I will fix that.

>>   /*
>>    *  compress_offload.h - compress offload header definations
>>    *
>> @@ -14,7 +14,7 @@
> 
>> +/**
>> + * struct snd_compr_task - task primitive for non-realtime operation
>> + * @seqno: sequence number (task identifier)
>> + * @origin_seqno: previous sequence number (task identifier) - for reuse
>> + * @input_fd: data input file descriptor (dma-buf)
>> + * @output_fd: data output file descriptor (dma-buf)
>> + * @input_size: filled data in bytes (from caller, must not exceed fragment size)
>> + */
>> +struct snd_compr_task {
>> +	__u64 seqno;
>> +	__u64 origin_seqno;
>> +	int input_fd;
>> +	int output_fd;
>> +	__u64 input_size;
> 
> Any reason why output_size is not listed here....

The real output size is known after the operation is finished not before. The 
maximal output size is determined by the driver based on the maximal input 
buffer size.

>> +	__u8 reserved[16];
>> +} __attribute__((packed, aligned(4)));
>> +
>> +enum snd_compr_state {
>> +	SND_COMPRESS_TASK_STATE_IDLE = 0,
>> +	SND_COMPRESS_TASK_STATE_ACTIVE,
>> +	SND_COMPRESS_TASK_STATE_FINISHED
>> +};
>> +
>> +/**
>> + * struct snd_compr_task_status - task status
>> + * @seqno: sequence number (task identifier)
>> + * @output_size: filled data in bytes (from driver)
>> + * @state: actual task state (SND_COMPRESS_TASK_STATE_*)
>> + */
>> +struct snd_compr_task_status {
>> +	__u64 seqno;
>> +	__u64 output_size;
> 
> ... but it's listed here.
> 
> It'd be worth explaining why the input and output are in different
> structures. I can understand that for the configuration only the host
> can provide data in the input, but in a status it'd be good to have a
> snapshot of the two variables, no?

Is this really useful? The application already knows what was passed to kernel.

> no locking for these two lines? If there's already a lock handled by the
> ALSA/ASoC/compressed frameworks, it'd be worth explaining which one is
> assumed to be held.

Called inside the stream mutex.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

