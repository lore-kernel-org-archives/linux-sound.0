Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306AF77620
	for <linux-sound@vger.kernel.org>; Mon,  3 Jun 2024 08:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.48.224.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717405062; cv=none; b=H6LkYBfehc6Gen1+G/6PueoP2b+UnrO0ezMONlnbheLWtAkDU1i1QtNusGDiVEdDhg1glklvHuuZtDMMBGoFwAtl0/MKOMj/HNaTQRyhTTMCb/I0ZsYyZd1bVbrXB0mn4gxICwm/kGk31IPF65jSzecaviKF1tmMJERYY6hZy2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717405062; c=relaxed/simple;
	bh=24HQvbzt7emSqv+a15wbgctrmJd8yqdc0Hxab66vfBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IUFY+49xmY2ETLIG2ZHPO9maEhVw+9SNfkxlQpydiiECSKUtyhSrof7WhbmVDCXBSQjVz1x5LqDceQeE1pi8iuYfIqHhgS5RlHVfD2cRS/d4SIMTOT4OYv3jf6T0zLUEE2emk96+fIbY8n9Je0b3KRl3WJtlOb11caj6dBXPaJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz; spf=pass smtp.mailfrom=perex.cz; dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b=KzUDt4sk; arc=none smtp.client-ip=77.48.224.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=perex.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perex.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=perex.cz header.i=@perex.cz header.b="KzUDt4sk"
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id CBB77B97;
	Mon,  3 Jun 2024 10:57:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz CBB77B97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1717405048; bh=k3RG4Q7r2BzZLaTfDfSD1QFVekL5TEhDeEkeygdfQR0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KzUDt4skqmb1s+qBWB1MtQpPG44vxCbGCQempumDNGzr/jKAFrBihgCND0ofdWd46
	 Hl+aF/b39Z/9tTJMeSwugV7PzG5UE20eKUOE4wMdbBNlDOsyee743+g45Sy9oDs96N
	 IeCdBBBuNYhQrf4u67JBDVSuEwM1Af6NGVkaQrsE=
Received: from [192.168.100.98] (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Mon,  3 Jun 2024 10:57:20 +0200 (CEST)
Message-ID: <c7152a8b-443e-457b-bd14-528cc28c0e65@perex.cz>
Date: Mon, 3 Jun 2024 10:57:20 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] ALSA: compress_offload: introduce passthrough
 operation mode
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
 Mark Brown <broonie@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Vinod Koul <vkoul@kernel.org>
References: <20240527122216.244443-1-perex@perex.cz>
 <CAA+D8ANqr+kck7myOsC_9PryCSYJuOK3F5EjXqm3mKEgp7bd5A@mail.gmail.com>
 <CAA+D8AO5Tw=DGU1=5pOcJDOVFW3gx0Tsq7KqLUO-LXOmfh0RjQ@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Content-Language: en-US
Autocrypt: addr=perex@perex.cz; keydata=
 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
In-Reply-To: <CAA+D8AO5Tw=DGU1=5pOcJDOVFW3gx0Tsq7KqLUO-LXOmfh0RjQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03. 06. 24 10:31, Shengjiu Wang wrote:
> On Tue, May 28, 2024 at 7:14 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>>
>> On Mon, May 27, 2024 at 8:23 PM Jaroslav Kysela <perex@perex.cz> wrote:
>>>
>>> There is a requirement to expose the audio hardware that accelerates various
>>> tasks for user space such as sample rate converters, compressed
>>> stream decoders, etc.
>>>
>>> This is description for the API extension for the compress ALSA API which
>>> is able to handle "tasks" that are not bound to real-time operations
>>> and allows for the serialization of operations.
>>>
>>> For details, refer to "compress-passthrough.rst" document.
>>>
>>> Note: This code is RFC (not tested, just to clearify the API requirements).
>>> My goal is to add a test (loopback) driver and add a support to tinycompress
>>> library in the next step.
>>>
>>> Cc: Mark Brown <broonie@kernel.org>
>>> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
>>> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
>>> Cc: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>> Cc: Vinod Koul <vkoul@kernel.org>
>>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>>>
>>> ---
>>> v1..v2:
>>>    - fix some documentation typos (thanks Amadeusz Sławiński)
>>>    - fix memdup_user() error handling (thanks Takashi)
>>>    - use one state variable instead multiple (thanks Takashi)
>>>    - handle task limit (set to 64 - mentioned in documentation, NIY)
>>>    - fix file release (free all tasks)
>>> ---
>>>   .../sound/designs/compress-passthrough.rst    | 125 +++++++
>>>   include/sound/compress_driver.h               |  32 ++
>>>   include/uapi/sound/compress_offload.h         |  51 ++-
>>>   sound/core/Kconfig                            |   4 +
>>>   sound/core/compress_offload.c                 | 334 +++++++++++++++++-
>>>   5 files changed, 537 insertions(+), 9 deletions(-)
>>>   create mode 100644 Documentation/sound/designs/compress-passthrough.rst
>>>
>>> diff --git a/Documentation/sound/designs/compress-passthrough.rst b/Documentation/sound/designs/compress-passthrough.rst
>>> new file mode 100644
>>> index 000000000000..975462500c33
>>> --- /dev/null
>>> +++ b/Documentation/sound/designs/compress-passthrough.rst
>>> @@ -0,0 +1,125 @@
>>> +=================================
>>> +ALSA Co-processor Passthrough API
>>> +=================================
>>> +
>>> +Jaroslav Kysela <perex@perex.cz>
>>> +
>>> +
>>> +Overview
>>> +========
>>> +
>>> +There is a requirement to expose the audio hardware that accelerates various
>>> +tasks for user space such as sample rate converters, compressed
>>> +stream decoders, etc.
>>> +
>>> +This is description for the API extension for the compress ALSA API which
>>> +is able to handle "tasks" that are not bound to real-time operations
>>> +and allows for the serialization of operations.
>>> +
>>> +Requirements
>>> +============
>>> +
>>> +The main requirements are:
>>> +
>>> +- serialization of multiple tasks for user space to allow multiple
>>> +  operations without user space intervention
>>> +
>>> +- separate buffers (input + output) for each operation
>>> +
>>> +- expose buffers using mmap to user space
>>> +
>>> +- signal user space when the task is finished (standard poll mechanism)
>>> +
>>> +Design
>>> +======
>>> +
>>> +A new direction SND_COMPRESS_PASSTHROUGH is introduced to identify
>>> +the passthrough API.
>>> +
>>> +The API extension shares device enumeration and parameters handling from
>>> +the main compressed API. All other realtime streaming ioctls are deactivated
>>> +and a new set of task related ioctls are introduced. The standard
>>> +read/write/mmap I/O operations are not supported in the passthrough device.
>>> +
>>> +Device ("stream") state handling is reduced to OPEN/SETUP. All other
>>> +states are not available for the passthrough mode.
>>> +
>>> +Data I/O mechanism is using standard dma-buf interface with all advantages
>>> +like mmap, standard I/O, buffer sharing etc. One buffer is used for the
>>> +input data and second (separate) buffer is used for the output data. Each task
>>> +have separate I/O buffers.
>>> +
>>> +For the buffering parameters, the fragments means a limit of allocated tasks
>>> +for given device. The fragment_size limits the input buffer size for the given
>>> +device. The output buffer size is determined by the driver (may be different
>>> +from the input buffer size).
>>> +
>>> +State Machine
>>> +=============
>>> +
>>> +The passthrough audio stream state machine is described below :
>>> +
>>> +                                       +----------+
>>> +                                       |          |
>>> +                                       |   OPEN   |
>>> +                                       |          |
>>> +                                       +----------+
>>> +                                             |
>>> +                                             |
>>> +                                             | compr_set_params()
>>> +                                             |
>>> +                                             v
>>> +         all passthrough task ops      +----------+
>>> +  +------------------------------------|          |
>>> +  |                                    |   SETUP  |
>>> +  |                                    |
>>> +  |                                    +----------+
>>> +  |                                          |
>>> +  +------------------------------------------+
>>> +
>>> +
>>> +Passthrough operations (ioctls)
>>> +===============================
>>> +
>>> +CREATE
>>> +------
>>> +Creates a set of input/output buffers. The input buffer size is
>>> +fragment_size. Allocates unique seqno.
>>> +
>>> +The hardware drivers allocate internal 'struct dma_buf' for both input and
>>> +output buffers (using 'dma_buf_export()' function). The anonymous
>>> +file descriptors for those buffers are passed to user space.
>>> +
>>
>> Audio data is always separated into a lot of periods. so does this mean
>> that the call sequence is "CREATE" (user fill period data to buffer ) "START"
>> -> "CREATE" (user fill period data to buffer )"START"
>> -> "CREATE" (user fill period data to buffer )"START".... ?
>>
>> Will this cause memory fragmentation?
>>
>> How can the user get each output?
>> Or does this mean the sequence should be:
>> "CREATE"
>> (user space fill period data to buffer )
>> "START"
>> "STOP" :  if the task is running, stop it there is no output generated?
>> "STATUS":  polling the status to check the task finished for every task?
>> then another loop for each period?
>>
> 
> Per my understanding,  I use the below sequence:
> create  -> (start, stop, status) -> (start, stop, status) ...-> free.

The stop is optional. When the driver calls snd_compr_task_finished(), it's 
expected that the task has finished (stopped) and the next started task in the 
queue is processed.

> Below are issues found in the code.
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
> index da048e61c574..7b6168d43d41 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -134,6 +134,7 @@ static int snd_compr_open(struct inode *inode,
> struct file *f)
>          }
>          runtime->state = SNDRV_PCM_STATE_OPEN;
>          init_waitqueue_head(&runtime->sleep);
> +       INIT_LIST_HEAD(&runtime->tasks);

Thanks.

>          data->stream.runtime = runtime;
>          f->private_data = (void *)data;
>          scoped_guard(mutex, &compr->lock)
> @@ -1003,10 +1004,6 @@ static struct snd_compr_task_runtime *
> 
>   static void snd_compr_task_free(struct snd_compr_task_runtime *task)
>   {
> -       if (task->output)
> -               dma_buf_put(task->output);
> -       if (task->input)
> -               dma_buf_put(task->input);
>          kfree(task);
>   }

See bellow.

> @@ -1045,6 +1042,7 @@ static int snd_compr_task_new(struct
> snd_compr_stream *stream, struct snd_compr_
>                  retval = utask->output_fd;
>                  goto cleanup;
>          }
> +       utask->seqno = task->seqno;

Thanks.

>          list_add_tail(&task->list, &stream->runtime->tasks);
>          stream->runtime->total_tasks++;
>          return 0;
> 
> There is no dma_buf_get() called, so remove the dma_buf_put().

I expected that the driver will increase this reference counter in the 
task_create callback. But yes, it will be probably better to do in 
snd_compr_task_new() when file descriptors are used.

I will send v3 soon. Thank you for your comments.

				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.

