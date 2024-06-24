Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256F919FA82
	for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 14:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240436; cv=none; b=UbFXsR0Y1ClEYoMSStZbzf7mpGZ/NLKLnEZvTJSiG7IA8jB5OEezMhDTCHUqhWC53TQB3mgce58IEAV1QOyfDXMORyGzLzbtCIwIwtwfpBf2+3yBTagcZwdnxq0HI/pqVA1BUqeFKYr515uscchhHi3yKp1K4rVl1SWe8y1RO70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240436; c=relaxed/simple;
	bh=YehKVdAHv55x3WDP76KE3VwvT5a2JoLAV0KapwuIhuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVzTl258MPsXul16hTzpSWbcbahpRQMRINTSe5RW0GaMwEmj+yBLT2NXLF6Uhk8iZBp6GU9+KPOdkDJKitQXBa/4olV8Mkk/VMejDUknRIyME238Ine0/9/HfYGGP1haR4fRxLU7k4hiEJrNDyzYNYuRQgHwifZHMO17lTZ2eXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DJlCLsLC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DJlCLsLC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31243C32782;
	Mon, 24 Jun 2024 14:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719240436;
	bh=YehKVdAHv55x3WDP76KE3VwvT5a2JoLAV0KapwuIhuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DJlCLsLCzbZC8TOuW+q4+4ZMB6+qOay/KHLxaaIEjXcf08BtjVePY4VgUI8602JKX
	 Bjiq0KpSlmxSrg4YDk9DM9Nd+RuKVJUUB/IoTXvGarXC8z7WuObztOV+Jsp7TPlerJ
	 5Dy1YKMvPk11HmKjouC2XvPOX9klCZSbYFwPz+fHXWxJcTudPTDc0VUke352M457tn
	 WDlaOcDZH+mzuDwIOxwaM3U46W4ycZ0CQUDkWAi4DCnR0nuX6VTsFzvvbTzwsWcg70
	 eLX4zyIAzN8I4N/3vl+6CdrKyQBPUnR3kAz4Cga7aaDawCw5hgI2V8kjo+gbq9r5MC
	 8eYZVOkef45WQ==
Date: Mon, 24 Jun 2024 20:17:11 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>,
	Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v4] ALSA: compress_offload: introduce passthrough
 operation mode
Message-ID: <ZnmG77hBzedDQcIl@matsya>
References: <20240624135820.516893-1-perex@perex.cz>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240624135820.516893-1-perex@perex.cz>

Hi Jaroslav,

On 24-06-24, 15:58, Jaroslav Kysela wrote:
> There is a requirement to expose the audio hardware that accelerates various
> tasks for user space such as sample rate converters, compressed
> stream decoders, etc.

Can you please tell me more about this requirement. The initial view of
compressed API was data only and use alsa kcontrols to handle the DSP
functions? I would like to understand why we need a new API.

> 
> This is description for the API extension for the compress ALSA API which
> is able to handle "tasks" that are not bound to real-time operations
> and allows for the serialization of operations.
> 
> For details, refer to "compress-passthrough.rst" document.
> 
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Cc: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> 
> ---
> v3..v4:
>   - resolved Takashi's requests:
>     - make CONFIG_SND_COMPRESS_PASSTHROUGH as bool, remove wrong DMA_BUF selection
>     - use EXPORT_SYMBOL_GPL for snd_compr_task_finished function
>     - fix snd_compr_find_task indentation
>   - add more CONFIG_SND_COMPRESS_PASSTHROUGH #if blocks
> 
> v2..v3:
>   - fix missing runtime->tasks initialization (thanks Shengjiu Wang)
>   - fix missing seqno initialization in task_new (thanks Shengjiu Wang)
>   - fix reference counting for allocated dma buffers (thanks Shengjiu Wang)
>   - use origin_seqno to reuse the already allocated buffers for new task
> 
> v1..v2:
>   - fix some documentation typos (thanks Amadeusz Sławiński)
>   - fix memdup_user() error handling (thanks Takashi)
>   - use one state variable instead multiple (thanks Takashi)
>   - handle task limit (set to 64 - mentioned in documentation, NIY)
>   - fix file release (free all tasks)
> ---
>  .../sound/designs/compress-passthrough.rst    | 125 +++++++
>  include/sound/compress_driver.h               |  34 ++
>  include/uapi/sound/compress_offload.h         |  51 ++-
>  sound/core/Kconfig                            |   3 +
>  sound/core/compress_offload.c                 | 346 +++++++++++++++++-

What about the user of this API, i would like to see that as well

>  5 files changed, 550 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/sound/designs/compress-passthrough.rst
> 
> diff --git a/Documentation/sound/designs/compress-passthrough.rst b/Documentation/sound/designs/compress-passthrough.rst
> new file mode 100644
> index 000000000000..975462500c33
> --- /dev/null
> +++ b/Documentation/sound/designs/compress-passthrough.rst
> @@ -0,0 +1,125 @@
> +=================================
> +ALSA Co-processor Passthrough API
> +=================================
> +
> +Jaroslav Kysela <perex@perex.cz>
> +
> +
> +Overview
> +========
> +
> +There is a requirement to expose the audio hardware that accelerates various
> +tasks for user space such as sample rate converters, compressed
> +stream decoders, etc.
> +
> +This is description for the API extension for the compress ALSA API which
> +is able to handle "tasks" that are not bound to real-time operations
> +and allows for the serialization of operations.
> +
> +Requirements
> +============
> +
> +The main requirements are:
> +
> +- serialization of multiple tasks for user space to allow multiple
> +  operations without user space intervention
> +
> +- separate buffers (input + output) for each operation
> +
> +- expose buffers using mmap to user space
> +
> +- signal user space when the task is finished (standard poll mechanism)
> +
> +Design
> +======
> +
> +A new direction SND_COMPRESS_PASSTHROUGH is introduced to identify
> +the passthrough API.

Is passthrough really a new good new name, this suggests data being
passed thru but that is not the case...

Wouldn't a control device be better or something else?

> +
> +The API extension shares device enumeration and parameters handling from
> +the main compressed API. All other realtime streaming ioctls are deactivated
> +and a new set of task related ioctls are introduced. The standard
> +read/write/mmap I/O operations are not supported in the passthrough device.
> +
> +Device ("stream") state handling is reduced to OPEN/SETUP. All other
> +states are not available for the passthrough mode.
> +
> +Data I/O mechanism is using standard dma-buf interface with all advantages
> +like mmap, standard I/O, buffer sharing etc. One buffer is used for the
> +input data and second (separate) buffer is used for the output data. Each task
> +have separate I/O buffers.
> +
> +For the buffering parameters, the fragments means a limit of allocated tasks
> +for given device. The fragment_size limits the input buffer size for the given
> +device. The output buffer size is determined by the driver (may be different
> +from the input buffer size).
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
> +
> +FREE
> +----
> +Free a set of input/output buffers. If a task is active, the stop
> +operation is executed before. If seqno is zero, operation is executed for all
> +tasks.
> +
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
> +
> +STATUS
> +------
> +Obtain the task status (active, finished). Also, the driver will set
> +the real output data size (valid area in the output buffer).
> +
> +Credits
> +=======
> +- ...
> diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
> index bcf872c17dd3..433ad897f054 100644
> --- a/include/sound/compress_driver.h
> +++ b/include/sound/compress_driver.h
> @@ -19,6 +19,22 @@
>  
>  struct snd_compr_ops;
>  
> +/**
> + * struct snd_compr_task_runtime: task runtime description

Can we add the description here for these..

> + *
> + */
> +struct snd_compr_task_runtime {
> +	struct list_head list;
> +	struct dma_buf *input;
> +	struct dma_buf *output;
> +	u64 seqno;
> +	u64 input_size;
> +	u64 output_size;
> +	u8 state;
> +	void *private_value;
> +};
> +
> +
>  /**
>   * struct snd_compr_runtime: runtime stream description
>   * @state: stream state

here as well, am sure it gives a warning now for missing description

-- 
~Vinod
