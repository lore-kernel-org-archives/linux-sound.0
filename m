Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3128A1DFEA
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 15:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719242938; cv=none; b=V5T4YB72hpEurtntA1+r/PIqpRdcqEzHTMJLoQPEAYgec8Z5w1QLNSrWYD4CkBzsnTdc+/vXucGyZ3WxMRQ4thdQYq86UASKdHO9xRb1OIv4Fp7Hh3Z6pUgoNkIWBafz30T1ux7lvK9pW4hXuHexLbPWp/Q9klP13ap+yPyfUz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719242938; c=relaxed/simple;
	bh=wQqd4GPyjUoxdq4Z9Sgxt00Ohg6B/OqVMHrafLaap0s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TKE9T9PU/tfp6PaLMnhGKf4OU0UaNkl1yTnt6g9ncpv+1++o8RMoI9N9XhhLq2K/XRDKjEBnS55Pl2eWi2v4KktrzPKUgZ1/P4vQegQCIP8A3NKLCfM2GeDwOlVxAiYUA1+b7Q3pekCqTqmi5HyEgCk0rkBWqKjgEyPm4iDKmbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkrngMcI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkrngMcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719242937; x=1750778937;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wQqd4GPyjUoxdq4Z9Sgxt00Ohg6B/OqVMHrafLaap0s=;
  b=OkrngMcI/yva72iqbfVOG6Hh82Y6D4tzaTyaJgbVqjmbh965+0n4g7od
   c4wySpNBGsIEwnhihL54KxDMMhTTQkcpAQqVrnJ4/sXsBjcWS9YayXfNI
   NNibTO3kfV9jvsBiNamDFkokyUOg+q5qSCHIefXvcWsTK346TYY5kWXJQ
   T6Fyd8Yxixz5SZVVi0NmlImD1WldWSwJM2OsSHIxYhh4DxsB0A9CD8c0S
   FGPhQ03xBd7AmbV0Ui1rKALq5VZCspgsigQ8Eugs7AU59rwjktwQ6+HBD
   EzoKPWyfXV3JV3iObE+khCacECjKcJeBZJzznEsA7md9xjcXFcCsPZWrL
   Q==;
X-CSE-ConnectionGUID: Xc/Q6Gh1Sbe6zNzb9QeZfA==
X-CSE-MsgGUID: BJKdbq3oR1CnyusgwnPGRw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="19121752"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="19121752"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 08:28:56 -0700
X-CSE-ConnectionGUID: HPDu9dW0TEKm72r1HTYmtg==
X-CSE-MsgGUID: 3zj9nVo3RW2DAW3Qv+kEbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="47703925"
Received: from ksztyber-mobl2.ger.corp.intel.com (HELO [10.245.246.230]) ([10.245.246.230])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 08:28:54 -0700
Message-ID: <18c2a323-f0b5-4dea-b502-ce7e7021c555@linux.intel.com>
Date: Mon, 24 Jun 2024 09:13:09 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ALSA: compress_offload: introduce passthrough
 operation mode
To: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
References: <20240621164915.410946-1-perex@perex.cz>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20240621164915.410946-1-perex@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Thanks Jaroslav, couple of questions below:

> +For the buffering parameters, the fragments means a limit of allocated tasks
> +for given device. The fragment_size limits the input buffer size for the given
> +device. The output buffer size is determined by the driver (may be different
> +from the input buffer size).

if (stream->direction == SND_COMPRESS_PASSTHROUGH)
	max_fragments = 64;			/* safe value */

Is there anything preventing us from increasing this if there was a need
for it? Wondering if this would be an ABI restriction or just an
internal safeguard userspace doesn't need to know.

> +
> +State Machine
> +=============
> +
> +The passthrough audio stream state machine is described below :
> +
> +                                       +----------+
> +                                       |          |
> +                                       |   OPEN   |
> +                                       |          |
> +                                       +----------+
> +                                             |
> +                                             |
> +                                             | compr_set_params()
> +                                             |
> +                                             v
> +         all passthrough task ops      +----------+
> +  +------------------------------------|          |
> +  |                                    |   SETUP  |
> +  |                                    |
> +  |                                    +----------+
> +  |                                          |
> +  +------------------------------------------+
> +
> +
> +Passthrough operations (ioctls)
> +===============================
> +
> +CREATE
> +------
> +Creates a set of input/output buffers. The input buffer size is
> +fragment_size. Allocates unique seqno.
> +
> +The hardware drivers allocate internal 'struct dma_buf' for both input and
> +output buffers (using 'dma_buf_export()' function). The anonymous
> +file descriptors for those buffers are passed to user space.

The code adds the tasks in the order in which they are created:

	list_add_tail(&task->list, &stream->runtime->tasks);

This should probably be documented, there's no explicit mechanism to
chain the tasks other than the order of creation.

> +FREE
> +----
> +Free a set of input/output buffers. If a task is active, the stop
> +operation is executed before. If seqno is zero, operation is executed for all
> +tasks.

Can a task in the middle of the list be freed?

If yes, is any locking required?

> +START
> +-----
> +Starts (queues) a task. There are two cases of the task start - right after
> +the task is created. In this case, origin_seqno must be zero.
> +The second case is for reusing of already finished task. The origin_seqno
> +must identify the task to be reused. In both cases, a new seqno value
> +is allocated and returned to user space.
> +
> +The prerequisite is that application filled input dma buffer with
> +new source data and set input_size to pass the real data size to the driver.
> +
> +The order of data processing is preserved (first started job must be
> +finished at first).
> +
> +STOP
> +----
> +Stop (dequeues) a task. If seqno is zero, operation is executed for all
> +tasks.

What happens if a STOP is sent to a task in the middle of the list?


It's similar to the question on free above, the creation needs to follow
an order but the free/stop can be individual tasks so there could be
interesting state machine transition and programming errors.

I honestly find the state machine confusing, it looks like in the SETUP
stage tasks can be added/removed dynamically, but I am not sure if it's
a real use case? Most pipeline management add a bunch of processing,
then go in the 'run' mode. Adding/removing stuff on a running pipeline
is really painful and not super useful, is it?

>  /**
>   * struct snd_compr_runtime: runtime stream description
>   * @state: stream state
> @@ -54,6 +70,11 @@ struct snd_compr_runtime {
>  	dma_addr_t dma_addr;
>  	size_t dma_bytes;
>  	struct snd_dma_buffer *dma_buffer_p;
> +
> +	u32 active_tasks;
> +	u32 total_tasks;
> +	u64 task_seqno;
> +	struct list_head tasks;
>  };

should there be some sort of identifier that says the stream in used in
passthrough mode and only then are the 4 added members relevant?


'struct snd_compr_runtime' doesn't have a notion of direction, so
there's no real way to know what set_params() requested.

> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
> index d185957f3fe0..5fed1979522b 100644
> --- a/include/uapi/sound/compress_offload.h
> +++ b/include/uapi/sound/compress_offload.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +	/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */

spurious change?

>  /*
>   *  compress_offload.h - compress offload header definations
>   *
> @@ -14,7 +14,7 @@

> +/**
> + * struct snd_compr_task - task primitive for non-realtime operation
> + * @seqno: sequence number (task identifier)
> + * @origin_seqno: previous sequence number (task identifier) - for reuse
> + * @input_fd: data input file descriptor (dma-buf)
> + * @output_fd: data output file descriptor (dma-buf)
> + * @input_size: filled data in bytes (from caller, must not exceed fragment size)
> + */
> +struct snd_compr_task {
> +	__u64 seqno;
> +	__u64 origin_seqno;
> +	int input_fd;
> +	int output_fd;
> +	__u64 input_size;

Any reason why output_size is not listed here....

> +	__u8 reserved[16];
> +} __attribute__((packed, aligned(4)));
> +
> +enum snd_compr_state {
> +	SND_COMPRESS_TASK_STATE_IDLE = 0,
> +	SND_COMPRESS_TASK_STATE_ACTIVE,
> +	SND_COMPRESS_TASK_STATE_FINISHED
> +};
> +
> +/**
> + * struct snd_compr_task_status - task status
> + * @seqno: sequence number (task identifier)
> + * @output_size: filled data in bytes (from driver)
> + * @state: actual task state (SND_COMPRESS_TASK_STATE_*)
> + */
> +struct snd_compr_task_status {
> +	__u64 seqno;
> +	__u64 output_size;

... but it's listed here.

It'd be worth explaining why the input and output are in different
structures. I can understand that for the configuration only the host
can provide data in the input, but in a status it'd be good to have a
snapshot of the two variables, no?


> +	__u8 state;
> +	__u8 reserved[15];
> +} __attribute__((packed, aligned(4)));

> +static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_task *utask)
> +{
> +	struct snd_compr_task_runtime *task;
> +	int retval;
> +
> +	if (stream->runtime->total_tasks >= stream->runtime->fragments)
> +		return -EBUSY;
> +	if (utask->origin_seqno != 0 || utask->input_size != 0)
> +		return -EINVAL;
> +	task = kzalloc(sizeof(*task), GFP_KERNEL);
> +	if (task == NULL)
> +		return -ENOMEM;
> +	task->seqno = utask->seqno = snd_compr_seqno_next(stream);
> +	task->input_size = utask->input_size;
> +	retval = stream->ops->task_create(stream, task);
> +	if (retval < 0)
> +		goto cleanup;
> +	utask->input_fd = dma_buf_fd(task->input, O_WRONLY|O_CLOEXEC);
> +	if (utask->input_fd < 0) {
> +		retval = utask->input_fd;
> +		goto cleanup;
> +	}
> +	utask->output_fd = dma_buf_fd(task->output, O_RDONLY|O_CLOEXEC);
> +	if (utask->output_fd < 0) {
> +		retval = utask->output_fd;
> +		goto cleanup;
> +	}
> +	/* keep dmabuf reference until freed with task free ioctl */
> +	dma_buf_get(utask->input_fd);
> +	dma_buf_get(utask->output_fd);
> +	list_add_tail(&task->list, &stream->runtime->tasks);
> +	stream->runtime->total_tasks++;

no locking for these two lines? If there's already a lock handled by the
ALSA/ASoC/compressed frameworks, it'd be worth explaining which one is
assumed to be held.

> +	return 0;
> +cleanup:
> +	snd_compr_task_free(task);
> +	return retval;
> +}

