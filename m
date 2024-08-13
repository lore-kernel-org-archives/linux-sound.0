Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8053D197A61
	for <linux-sound@vger.kernel.org>; Tue, 13 Aug 2024 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723545943; cv=none; b=Zs7hkFDAZ+y0wCg4fXJIbrOEqC9IMjxLZjko6TOCJRTNz2ODjBOSoRjkYjlhUR/tneE+SQzqqfcK8CRt5vgjKREg/0yEqD1eYSvjES2XcDVOQCyTUZJawGwsoKzLSB33HXLqKA3Epa3UImzRibyx0H0N3TG4qJ4hRdltjyLUCfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723545943; c=relaxed/simple;
	bh=rs+ZcL3nfb9gutANbS8vtfHeq8LpXm0o3+R4Fwp3POQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P2JZ8OZJwwbNLsJjEfY5dFfz6TSDX5LNbEsB1jGKnxfHfLymoR0Sq+i4B+938I5heGAoQD01jzNrDsz4WF3719tHwutw5hjY8mExCfaeYFUyKKtjZGgYeS9ATmF2g0TA3RRJkrFGM9c45bJuuOXYFiLVd6gXGnuJSWYls2Nw75U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gWGPn3Wl; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gWGPn3Wl"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-81fd520fee5so214576739f.2
        for <linux-sound@vger.kernel.org>; Tue, 13 Aug 2024 03:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723545939; x=1724150739; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aq8IM4cpJARyJErtXVs/MN2mwRje7BEaknvdsHbWKUA=;
        b=gWGPn3WlM8EQHeipubcvXShZixjtuHK1zSpvlYYrZ4oekkYO9KLVDhuXXinZuVCS62
         oHEoYIywsHqKRaL5kvepOkmlcEx49wwH/JSYgJx5Y2hehzi+i68e5wixpidlN9C0wInB
         ylhcMG+S1xVk5KQf3wEtAQlQVeMFh49JjRezFpEFDph9g3gv7rfFgOnppGgL7OAbq4LE
         bk2m2f6r5pKPQXCJnqw6e9FrBPteUQKkkemVMbysj6RCyc22OEjxqMPTNXB/u5oA5ruj
         oBe54mbH7Ls5QQV3s/RvUXgx22hXYkX0K747D3j64F3rmDqGEHtifXlhOCrCCnmqm+aF
         Ox8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723545939; x=1724150739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aq8IM4cpJARyJErtXVs/MN2mwRje7BEaknvdsHbWKUA=;
        b=m13Duf4yh/jzh2TH7KZkGB6lVYXHI2P7Aq6uNjn4nrg0gcmsUtlMoXd1hPAU6nXAOH
         D/37NeFk4bYea3lpneaiXG4w3KlAVyxmYLcDDEJqIbfAh+NfvnYkhHpQBrkO3qkcUSxx
         A2VDcWeZ0/rUKnfpQjqO6Sg8XJz9A8b5s79FucVDEH8rDqLc8kTPH83mPJVgfyJOXpLq
         kyzYNgTdbfU8sT+fA25G7+PjnYSRuVTRCQmaiVAQSdhGQvnfwUWktElyXcwCJb5Re4+R
         o3hNsWFx3+QMh0mrn0aRhKrZpAfWDmjErsrwKcma/5BgVH/1CFmdiauJWZJsP1lqR3kN
         NoyQ==
X-Gm-Message-State: AOJu0YzyEEqEXgZHsWC2AgDVtqvSR4iG+d4QO/tlb8G0QOXMLMeqIXAj
	IwU76swtUDCsEVymmcb5rQxaj1cbYxkvX/Ad+pwzsCYxLTNVM4oqt3ticZOOv8evPMZxcmrUUCV
	o/6cByOpR5CmlOIzqzJh2BRNxqbQ=
X-Google-Smtp-Source: AGHT+IERToJ4GMYyGSHteIPaDW3Zhm/1hFUmYZCWA+wFZtv7x9a7YcN/jJt5/JKUAbNps3RzFzJPS1On8yq5VI2xfbU=
X-Received: by 2002:a05:6e02:20e1:b0:39a:13e3:9176 with SMTP id
 e9e14a558f8ab-39c47862d14mr37133635ab.15.1723545939323; Tue, 13 Aug 2024
 03:45:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240731083843.59911-1-perex@perex.cz>
In-Reply-To: <20240731083843.59911-1-perex@perex.cz>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 13 Aug 2024 18:45:27 +0800
Message-ID: <CAA+D8AOH-0bjGD=rC84NO72hUb_b9a0SBKZF_hne0GuPkWFB_w@mail.gmail.com>
Subject: Re: [PATCH v5] ALSA: compress_offload: introduce accel operation mode
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
	Mark Brown <broonie@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 4:39=E2=80=AFPM Jaroslav Kysela <perex@perex.cz> wr=
ote:
>
> There is a requirement to expose the audio hardware that accelerates vari=
ous
> tasks for user space such as sample rate converters, compressed
> stream decoders, etc.
>
> This is description for the API extension for the compress ALSA API which
> is able to handle "tasks" that are not bound to real-time operations
> and allows for the serialization of operations.
>
> For details, refer to "compress-accel.rst" document.
>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> Cc: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
>
> ---
> v4..v5:
>   - rename to passthrough_accel
>   - fix bad indentation (compress_offload.h)
>   - move runtime->tasks initialization (thanks Shengjiu Wang)
>   - add documentation for internal struct snd_compr_task_runtime
>   - add flags member to struct snd_compr_task (allow stream state reset
>     without releasing the allocated buffers, future extesions)
>   - add output_flags member to struct snd_compr_task_status (for future e=
xtensions)
>   - add input_size member to struct snd_compr_task_status (thanks Pierre-=
Louis Bossart)
>   - do free/stop operation for all tasks in reverse order
>
> v3..v4:
>   - resolved Takashi's requests:
>     - make CONFIG_SND_COMPRESS_PASSTHROUGH as bool, remove wrong DMA_BUF =
selection
>     - use EXPORT_SYMBOL_GPL for snd_compr_task_finished function
>     - fix snd_compr_find_task indentation
>   - add more CONFIG_SND_COMPRESS_PASSTHROUGH #if blocks
>
> v2..v3:
>   - fix missing runtime->tasks initialization (thanks Shengjiu Wang)
>   - fix missing seqno initialization in task_new (thanks Shengjiu Wang)
>   - fix reference counting for allocated dma buffers (thanks Shengjiu Wan=
g)
>   - use origin_seqno to reuse the already allocated buffers for new task
>
> v1..v2:
>   - fix some documentation typos (thanks Amadeusz S=C5=82awi=C5=84ski)
>   - fix memdup_user() error handling (thanks Takashi)
>   - use one state variable instead multiple (thanks Takashi)
>   - handle task limit (set to 64 - mentioned in documentation, NIY)
>   - fix file release (free all tasks)
> ---
>  .../sound/designs/compress-accel.rst          | 134 +++++++
>  include/sound/compress_driver.h               |  46 +++
>  include/uapi/sound/compress_offload.h         |  64 +++-
>  sound/core/Kconfig                            |   3 +
>  sound/core/compress_offload.c                 | 348 +++++++++++++++++-
>  5 files changed, 587 insertions(+), 8 deletions(-)
>  create mode 100644 Documentation/sound/designs/compress-accel.rst
>
> diff --git a/Documentation/sound/designs/compress-accel.rst b/Documentati=
on/sound/designs/compress-accel.rst
> new file mode 100644
> index 000000000000..abf1f76a8778
> --- /dev/null
> +++ b/Documentation/sound/designs/compress-accel.rst
> @@ -0,0 +1,134 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +ALSA Co-processor Acceleration API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Jaroslav Kysela <perex@perex.cz>
> +
> +
> +Overview
> +=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +There is a requirement to expose the audio hardware that accelerates var=
ious
> +tasks for user space such as sample rate converters, compressed
> +stream decoders, etc.
> +
> +This is description for the API extension for the compress ALSA API whic=
h
> +is able to handle "tasks" that are not bound to real-time operations
> +and allows for the serialization of operations.
> +
> +Requirements
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> +=3D=3D=3D=3D=3D=3D
> +
> +A new direction SND_COMPRESS_ACCEL is introduced to identify
> +the passthrough API.
> +
> +The API extension shares device enumeration and parameters handling from
> +the main compressed API. All other realtime streaming ioctls are deactiv=
ated
> +and a new set of task related ioctls are introduced. The standard
> +read/write/mmap I/O operations are not supported in the passthrough devi=
ce.
> +
> +Device ("stream") state handling is reduced to OPEN/SETUP. All other
> +states are not available for the passthrough mode.
> +
> +Data I/O mechanism is using standard dma-buf interface with all advantag=
es
> +like mmap, standard I/O, buffer sharing etc. One buffer is used for the
> +input data and second (separate) buffer is used for the output data. Eac=
h task
> +have separate I/O buffers.
> +
> +For the buffering parameters, the fragments means a limit of allocated t=
asks
> +for given device. The fragment_size limits the input buffer size for the=
 given
> +device. The output buffer size is determined by the driver (may be diffe=
rent
> +from the input buffer size).
> +
> +State Machine
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
> +
> +All operations are protected using stream->device->lock (mutex).
> +
> +CREATE
> +------
> +Creates a set of input/output buffers. The input buffer size is
> +fragment_size. Allocates unique seqno.
> +
> +The hardware drivers allocate internal 'struct dma_buf' for both input a=
nd
> +output buffers (using 'dma_buf_export()' function). The anonymous
> +file descriptors for those buffers are passed to user space.
> +
> +FREE
> +----
> +Free a set of input/output buffers. If a task is active, the stop
> +operation is executed before. If seqno is zero, operation is executed fo=
r all
> +tasks.
> +
> +START
> +-----
> +Starts (queues) a task. There are two cases of the task start - right af=
ter
> +the task is created. In this case, origin_seqno must be zero.
> +The second case is for reusing of already finished task. The origin_seqn=
o
> +must identify the task to be reused. In both cases, a new seqno value
> +is allocated and returned to user space.
> +
> +The prerequisite is that application filled input dma buffer with
> +new source data and set input_size to pass the real data size to the dri=
ver.
> +
> +The order of data processing is preserved (first started job must be
> +finished at first).
> +
> +If the multiple tasks require a state handling (e.g. resampling operatio=
n),
> +the user space may set SND_COMPRESS_TFLG_NEW_STREAM flag to mark the
> +start of the new stream data. It is useful to keep the allocated buffers
> +for the new operation rather using open/close mechanism.
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
> +=3D=3D=3D=3D=3D=3D=3D
> +- Shengjiu Wang <shengjiu.wang@gmail.com>
> +- Takashi Iwai <tiwai@suse.de>
> +- Vinod Koul <vkoul@kernel.org>
> diff --git a/include/sound/compress_driver.h b/include/sound/compress_dri=
ver.h
> index bcf872c17dd3..5db4881b0681 100644
> --- a/include/sound/compress_driver.h
> +++ b/include/sound/compress_driver.h
> @@ -19,6 +19,30 @@
>
>  struct snd_compr_ops;
>
> +/**
> + * struct snd_compr_task_runtime: task runtime description
> + * @list: list of all managed tasks
> + * @input: input DMA buffer
> + * @output: output DMA buffer
> + * @seqno: sequence number
> + * @input_size: really used data in the input buffer
> + * @output_size: really used data in the output buffer
> + * @flags: see SND_COMPRESS_TFLG_*
> + * @state: actual task state
> + * @private_value: used by the lowlevel driver (opaque)
> + */
> +struct snd_compr_task_runtime {
> +       struct list_head list;
> +       struct dma_buf *input;
> +       struct dma_buf *output;
> +       u64 seqno;
> +       u64 input_size;
> +       u64 output_size;
> +       u32 flags;
> +       u8 state;
> +       void *private_value;
> +};
> +
>  /**
>   * struct snd_compr_runtime: runtime stream description
>   * @state: stream state
> @@ -37,6 +61,10 @@ struct snd_compr_ops;
>   * @dma_addr: physical buffer address (not accessible from main CPU)
>   * @dma_bytes: size of DMA area
>   * @dma_buffer_p: runtime dma buffer pointer
> + * @active_tasks: count of active tasks
> + * @total_tasks: count of all tasks
> + * @task_seqno: last task sequence number (!=3D 0)
> + * @tasks: list of all tasks
>   */
>  struct snd_compr_runtime {
>         snd_pcm_state_t state;
> @@ -54,6 +82,13 @@ struct snd_compr_runtime {
>         dma_addr_t dma_addr;
>         size_t dma_bytes;
>         struct snd_dma_buffer *dma_buffer_p;
> +
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
> +       u32 active_tasks;
> +       u32 total_tasks;
> +       u64 task_seqno;
> +       struct list_head tasks;
> +#endif
>  };
>
>  /**
> @@ -132,6 +167,12 @@ struct snd_compr_ops {
>                         struct snd_compr_caps *caps);
>         int (*get_codec_caps) (struct snd_compr_stream *stream,
>                         struct snd_compr_codec_caps *codec);
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
> +       int (*task_create) (struct snd_compr_stream *stream, struct snd_c=
ompr_task_runtime *task);
> +       int (*task_start) (struct snd_compr_stream *stream, struct snd_co=
mpr_task_runtime *task);
> +       int (*task_stop) (struct snd_compr_stream *stream, struct snd_com=
pr_task_runtime *task);
> +       int (*task_free) (struct snd_compr_stream *stream, struct snd_com=
pr_task_runtime *task);
> +#endif
>  };
>
>  /**
> @@ -242,4 +283,9 @@ int snd_compr_free_pages(struct snd_compr_stream *str=
eam);
>  int snd_compr_stop_error(struct snd_compr_stream *stream,
>                          snd_pcm_state_t state);
>
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
> +void snd_compr_task_finished(struct snd_compr_stream *stream,
> +                            struct snd_compr_task_runtime *task);
> +#endif
> +
>  #endif
> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/c=
ompress_offload.h
> index d185957f3fe0..98772b0cbcb7 100644
> --- a/include/uapi/sound/compress_offload.h
> +++ b/include/uapi/sound/compress_offload.h
> @@ -14,7 +14,7 @@
>  #include <sound/compress_params.h>
>
>
> -#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 2, 0)
> +#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 3, 0)
>  /**
>   * struct snd_compressed_buffer - compressed buffer
>   * @fragment_size: size of buffer fragment in bytes
> @@ -68,7 +68,8 @@ struct snd_compr_avail {
>
>  enum snd_compr_direction {
>         SND_COMPRESS_PLAYBACK =3D 0,
> -       SND_COMPRESS_CAPTURE
> +       SND_COMPRESS_CAPTURE,
> +       SND_COMPRESS_ACCEL
>  };
>
>  /**
> @@ -127,6 +128,57 @@ struct snd_compr_metadata {
>          __u32 value[8];
>  } __attribute__((packed, aligned(4)));
>
> +/* flags for struct snd_compr_task */
> +#define SND_COMPRESS_TFLG_NEW_STREAM           (1<<0)  /* mark for the n=
ew stream data */
> +
> +/**
> + * struct snd_compr_task - task primitive for non-realtime operation
> + * @seqno: sequence number (task identifier)
> + * @origin_seqno: previous sequence number (task identifier) - for reuse
> + * @input_fd: data input file descriptor (dma-buf)
> + * @output_fd: data output file descriptor (dma-buf)
> + * @input_size: filled data in bytes (from caller, must not exceed fragm=
ent size)
> + * @flags: see SND_COMPRESS_TFLG_* defines
> + */
> +struct snd_compr_task {
> +       __u64 seqno;
> +       __u64 origin_seqno;
> +       int input_fd;
> +       int output_fd;
> +       __u64 input_size;
> +       __u32 flags;
> +       __u8 reserved[16];
> +} __attribute__((packed, aligned(4)));
> +
> +/**
> + * enum snd_compr_state - task state
> + * @SND_COMPRESS_TASK_STATE_IDLE: task is not queued
> + * @SND_COMPRESS_TASK_STATE_ACTIVE: task is in the queue
> + * @SND_COMPRESS_TASK_STATE_FINISHED: task was processed, output is avai=
lable
> + */
> +enum snd_compr_state {
> +       SND_COMPRESS_TASK_STATE_IDLE =3D 0,
> +       SND_COMPRESS_TASK_STATE_ACTIVE,
> +       SND_COMPRESS_TASK_STATE_FINISHED
> +};
> +
> +/**
> + * struct snd_compr_task_status - task status
> + * @seqno: sequence number (task identifier)
> + * @input_size: filled data in bytes (from user space)
> + * @output_size: filled data in bytes (from driver)
> + * @output_flags: reserved for future (all zeros - from driver)
> + * @state: actual task state (SND_COMPRESS_TASK_STATE_*)
> + */
> +struct snd_compr_task_status {
> +       __u64 seqno;
> +       __u64 input_size;
> +       __u64 output_size;
> +       __u32 output_flags;
> +       __u8 state;
> +       __u8 reserved[15];
> +} __attribute__((packed, aligned(4)));
> +
>  /*
>   * compress path ioctl definitions
>   * SNDRV_COMPRESS_GET_CAPS: Query capability of DSP
> @@ -164,6 +216,14 @@ struct snd_compr_metadata {
>  #define SNDRV_COMPRESS_DRAIN           _IO('C', 0x34)
>  #define SNDRV_COMPRESS_NEXT_TRACK      _IO('C', 0x35)
>  #define SNDRV_COMPRESS_PARTIAL_DRAIN   _IO('C', 0x36)
> +
> +
> +#define SNDRV_COMPRESS_TASK_CREATE     _IOWR('C', 0x60, struct snd_compr=
_task)
> +#define SNDRV_COMPRESS_TASK_FREE       _IOW('C', 0x61, __u64)
> +#define SNDRV_COMPRESS_TASK_START      _IOWR('C', 0x62, struct snd_compr=
_task)
> +#define SNDRV_COMPRESS_TASK_STOP       _IOW('C', 0x63, __u64)
> +#define SNDRV_COMPRESS_TASK_STATUS     _IOWR('C', 0x68, struct snd_compr=
_task_status)
> +
>  /*
>   * TODO
>   * 1. add mmap support
> diff --git a/sound/core/Kconfig b/sound/core/Kconfig
> index b970a1734647..7c4942a216b7 100644
> --- a/sound/core/Kconfig
> +++ b/sound/core/Kconfig
> @@ -59,6 +59,9 @@ config SND_CORE_TEST
>  config SND_COMPRESS_OFFLOAD
>         tristate
>
> +config SND_COMPRESS_ACCEL
> +       bool
> +
>  config SND_JACK
>         bool
>
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.=
c
> index f0008fa2d839..651568f891b5 100644
> --- a/sound/core/compress_offload.c
> +++ b/sound/core/compress_offload.c
> @@ -24,6 +24,7 @@
>  #include <linux/types.h>
>  #include <linux/uio.h>
>  #include <linux/uaccess.h>
> +#include <linux/dma-buf.h>
>  #include <linux/module.h>
>  #include <linux/compat.h>
>  #include <sound/core.h>
> @@ -54,6 +55,12 @@ struct snd_compr_file {
>
>  static void error_delayed_work(struct work_struct *work);
>
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
> +static void snd_compr_task_free_all(struct snd_compr_stream *stream);
> +#else
> +static inline void snd_compr_task_free_all(struct snd_compr_stream *stre=
am) { }
> +#endif
> +
>  /*
>   * a note on stream states used:
>   * we use following states in the compressed core
> @@ -85,6 +92,8 @@ static int snd_compr_open(struct inode *inode, struct f=
ile *f)
>                 dirn =3D SND_COMPRESS_PLAYBACK;
>         else if ((f->f_flags & O_ACCMODE) =3D=3D O_RDONLY)
>                 dirn =3D SND_COMPRESS_CAPTURE;
> +       else if ((f->f_flags & O_ACCMODE) =3D=3D O_RDWR)
> +               dirn =3D SND_COMPRESS_ACCEL;
>         else
>                 return -EINVAL;
>
> @@ -125,6 +134,9 @@ static int snd_compr_open(struct inode *inode, struct=
 file *f)
>         }
>         runtime->state =3D SNDRV_PCM_STATE_OPEN;
>         init_waitqueue_head(&runtime->sleep);
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
> +       INIT_LIST_HEAD(&runtime->tasks);
> +#endif
>         data->stream.runtime =3D runtime;
>         f->private_data =3D (void *)data;
>         scoped_guard(mutex, &compr->lock)
> @@ -154,6 +166,8 @@ static int snd_compr_free(struct inode *inode, struct=
 file *f)
>                 break;
>         }
>
> +       snd_compr_task_free_all(&data->stream);
> +
>         data->stream.ops->free(&data->stream);
>         if (!data->stream.runtime->dma_buffer_p)
>                 kfree(data->stream.runtime->buffer);
> @@ -226,6 +240,9 @@ snd_compr_ioctl_avail(struct snd_compr_stream *stream=
, unsigned long arg)
>         struct snd_compr_avail ioctl_avail;
>         size_t avail;
>
> +       if (stream->direction =3D=3D SND_COMPRESS_ACCEL)
> +               return -EBADFD;
> +
>         avail =3D snd_compr_calc_avail(stream, &ioctl_avail);
>         ioctl_avail.avail =3D avail;
>
> @@ -287,6 +304,8 @@ static ssize_t snd_compr_write(struct file *f, const =
char __user *buf,
>                 return -EFAULT;
>
>         stream =3D &data->stream;
> +       if (stream->direction =3D=3D SND_COMPRESS_ACCEL)
> +               return -EBADFD;
>         guard(mutex)(&stream->device->lock);
>         /* write is allowed when stream is running or has been steup */
>         switch (stream->runtime->state) {
> @@ -336,6 +355,8 @@ static ssize_t snd_compr_read(struct file *f, char __=
user *buf,
>                 return -EFAULT;
>
>         stream =3D &data->stream;
> +       if (stream->direction =3D=3D SND_COMPRESS_ACCEL)
> +               return -EBADFD;
>         guard(mutex)(&stream->device->lock);
>
>         /* read is allowed when stream is running, paused, draining and s=
etup
> @@ -385,6 +406,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_t=
able *wait)
>  {
>         struct snd_compr_file *data =3D f->private_data;
>         struct snd_compr_stream *stream;
> +       struct snd_compr_runtime *runtime;
>         size_t avail;
>         __poll_t retval =3D 0;
>
> @@ -392,6 +414,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_t=
able *wait)
>                 return EPOLLERR;
>
>         stream =3D &data->stream;
> +       runtime =3D stream->runtime;
>
>         guard(mutex)(&stream->device->lock);
>
> @@ -405,6 +428,20 @@ static __poll_t snd_compr_poll(struct file *f, poll_=
table *wait)
>
>         poll_wait(f, &stream->runtime->sleep, wait);
>
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
> +       if (stream->direction =3D=3D SND_COMPRESS_ACCEL) {
> +               struct snd_compr_task_runtime *task;
> +               if (runtime->fragments > runtime->active_tasks)
> +                       retval |=3D EPOLLOUT | EPOLLWRNORM;
> +               task =3D list_first_entry_or_null(&runtime->tasks,
> +                                               struct snd_compr_task_run=
time,
> +                                               list);
> +               if (task && task->state =3D=3D SND_COMPRESS_TASK_STATE_FI=
NISHED)
> +                       retval |=3D EPOLLIN | EPOLLRDNORM;
> +               return retval;
> +       }
> +#endif
> +
>         avail =3D snd_compr_get_avail(stream);
>         pr_debug("avail is %ld\n", (unsigned long)avail);
>         /* check if we have at least one fragment to fill */
> @@ -521,6 +558,9 @@ static int snd_compr_allocate_buffer(struct snd_compr=
_stream *stream,
>         unsigned int buffer_size;
>         void *buffer =3D NULL;
>
> +       if (stream->direction =3D=3D SND_COMPRESS_ACCEL)
> +               goto params;
> +
>         buffer_size =3D params->buffer.fragment_size * params->buffer.fra=
gments;
>         if (stream->ops->copy) {
>                 buffer =3D NULL;
> @@ -543,18 +583,30 @@ static int snd_compr_allocate_buffer(struct snd_com=
pr_stream *stream,
>                 if (!buffer)
>                         return -ENOMEM;
>         }
> -       stream->runtime->fragment_size =3D params->buffer.fragment_size;
> -       stream->runtime->fragments =3D params->buffer.fragments;
> +
>         stream->runtime->buffer =3D buffer;
>         stream->runtime->buffer_size =3D buffer_size;
> +params:
> +       stream->runtime->fragment_size =3D params->buffer.fragment_size;
> +       stream->runtime->fragments =3D params->buffer.fragments;
>         return 0;
>  }
>
> -static int snd_compress_check_input(struct snd_compr_params *params)
> +static int
> +snd_compress_check_input(struct snd_compr_stream *stream, struct snd_com=
pr_params *params)
>  {
> +       u32 max_fragments;
> +
>         /* first let's check the buffer parameter's */
> -       if (params->buffer.fragment_size =3D=3D 0 ||
> -           params->buffer.fragments > U32_MAX / params->buffer.fragment_=
size ||
> +       if (params->buffer.fragment_size =3D=3D 0)
> +               return -EINVAL;
> +
> +       if (stream->direction =3D=3D SND_COMPRESS_ACCEL)
> +               max_fragments =3D 64;                     /* safe value *=
/
> +       else
> +               max_fragments =3D U32_MAX / params->buffer.fragment_size;
> +
> +       if (params->buffer.fragments > max_fragments ||
>             params->buffer.fragments =3D=3D 0)
>                 return -EINVAL;
>
> @@ -583,7 +635,7 @@ snd_compr_set_params(struct snd_compr_stream *stream,=
 unsigned long arg)
>                 if (IS_ERR(params))
>                         return PTR_ERR(no_free_ptr(params));
>
> -               retval =3D snd_compress_check_input(params);
> +               retval =3D snd_compress_check_input(stream, params);
>                 if (retval)
>                         return retval;
>
> @@ -939,6 +991,264 @@ static int snd_compr_partial_drain(struct snd_compr=
_stream *stream)
>         return snd_compress_wait_for_drain(stream);
>  }
>
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
> +
> +static struct snd_compr_task_runtime *
> +snd_compr_find_task(struct snd_compr_stream *stream, __u64 seqno)
> +{
> +       struct snd_compr_task_runtime *task;
> +
> +       list_for_each_entry(task, &stream->runtime->tasks, list) {
> +               if (task->seqno =3D=3D seqno)
> +                       return task;
> +       }
> +       return NULL;
> +}
> +
> +static void snd_compr_task_free(struct snd_compr_task_runtime *task)
> +{
> +       if (task->output)
> +               dma_buf_put(task->output);
> +       if (task->input)
> +               dma_buf_put(task->input);
> +       kfree(task);
> +}
> +
> +static u64 snd_compr_seqno_next(struct snd_compr_stream *stream)
> +{
> +       u64 seqno =3D ++stream->runtime->task_seqno;
> +       if (seqno =3D=3D 0)
> +               seqno =3D ++stream->runtime->task_seqno;
> +       return seqno;
> +}
> +
> +static int snd_compr_task_new(struct snd_compr_stream *stream, struct sn=
d_compr_task *utask)
> +{
> +       struct snd_compr_task_runtime *task;
> +       int retval;
> +
> +       if (stream->runtime->total_tasks >=3D stream->runtime->fragments)
> +               return -EBUSY;
> +       if (utask->origin_seqno !=3D 0 || utask->input_size !=3D 0)
> +               return -EINVAL;
> +       task =3D kzalloc(sizeof(*task), GFP_KERNEL);
> +       if (task =3D=3D NULL)
> +               return -ENOMEM;
> +       task->seqno =3D utask->seqno =3D snd_compr_seqno_next(stream);
> +       task->input_size =3D utask->input_size;
> +       retval =3D stream->ops->task_create(stream, task);
> +       if (retval < 0)
> +               goto cleanup;
> +       utask->input_fd =3D dma_buf_fd(task->input, O_WRONLY|O_CLOEXEC);
> +       if (utask->input_fd < 0) {
> +               retval =3D utask->input_fd;
> +               goto cleanup;
> +       }
> +       utask->output_fd =3D dma_buf_fd(task->output, O_RDONLY|O_CLOEXEC)=
;
> +       if (utask->output_fd < 0) {
> +               retval =3D utask->output_fd;
> +               goto cleanup;
> +       }
> +       /* keep dmabuf reference until freed with task free ioctl */
> +       dma_buf_get(utask->input_fd);
> +       dma_buf_get(utask->output_fd);
> +       list_add_tail(&task->list, &stream->runtime->tasks);
> +       stream->runtime->total_tasks++;
> +       return 0;
> +cleanup:
> +       snd_compr_task_free(task);
> +       return retval;
> +}
> +
> +static int snd_compr_task_create(struct snd_compr_stream *stream, unsign=
ed long arg)
> +{
> +       struct snd_compr_task *task __free(kfree) =3D NULL;
> +       int retval;
> +
> +       if (stream->runtime->state !=3D SNDRV_PCM_STATE_SETUP)
> +               return -EPERM;
> +       task =3D memdup_user((void __user *)arg, sizeof(*task));
> +       if (IS_ERR(task))
> +               return PTR_ERR(no_free_ptr(task));
> +       retval =3D snd_compr_task_new(stream, task);
> +       if (retval >=3D 0)
> +               if (copy_to_user((void __user *)arg, task, sizeof(*task))=
)
> +                       retval =3D -EFAULT;
> +       return retval;
> +}
> +
> +static int snd_compr_task_start_prepare(struct snd_compr_task_runtime *t=
ask,
> +                                       struct snd_compr_task *utask)
> +{
> +       if (task =3D=3D NULL)
> +               return -EINVAL;
> +       if (task->state >=3D SND_COMPRESS_TASK_STATE_FINISHED)
> +               return -EBUSY;
> +       if (utask->input_size > task->input->size)
> +               return -EINVAL;
> +       task->flags =3D utask->flags;
> +       task->input_size =3D utask->input_size;
> +       task->state =3D SND_COMPRESS_TASK_STATE_IDLE;
> +       return 0;
> +}
> +
> +static int snd_compr_task_start(struct snd_compr_stream *stream, struct =
snd_compr_task *utask)
> +{
> +       struct snd_compr_task_runtime *task;
> +       int retval;
> +
> +       if (utask->origin_seqno > 0) {
> +               task =3D snd_compr_find_task(stream, utask->origin_seqno)=
;
> +               retval =3D snd_compr_task_start_prepare(task, utask);
> +               if (retval < 0)
> +                       return retval;
> +               task->seqno =3D utask->seqno =3D snd_compr_seqno_next(str=
eam);
> +               utask->origin_seqno =3D 0;
> +               list_move_tail(&task->list, &stream->runtime->tasks);
> +       } else {
> +               task =3D snd_compr_find_task(stream, utask->seqno);
> +               if (task && task->state !=3D SND_COMPRESS_TASK_STATE_IDLE=
)
> +                       return -EBUSY;
> +               retval =3D snd_compr_task_start_prepare(task, utask);
> +               if (retval < 0)
> +                       return retval;
> +       }
> +       retval =3D stream->ops->task_start(stream, task);
> +       if (retval >=3D 0) {
> +               task->state =3D SND_COMPRESS_TASK_STATE_ACTIVE;
> +               stream->runtime->active_tasks++;
> +       }
> +       return retval;
> +}
> +
> +static int snd_compr_task_start_ioctl(struct snd_compr_stream *stream, u=
nsigned long arg)
> +{
> +       struct snd_compr_task *task __free(kfree) =3D NULL;
> +       int retval;
> +
> +       if (stream->runtime->state !=3D SNDRV_PCM_STATE_SETUP)
> +               return -EPERM;
> +       task =3D memdup_user((void __user *)arg, sizeof(*task));
> +       if (IS_ERR(task))
> +               return PTR_ERR(no_free_ptr(task));
> +       retval =3D snd_compr_task_start(stream, task);
> +       if (retval >=3D 0)
> +               if (copy_to_user((void __user *)arg, task, sizeof(*task))=
)
> +                       retval =3D -EFAULT;
> +       return retval;
> +}
> +
> +static void snd_compr_task_stop_one(struct snd_compr_stream *stream,
> +                                       struct snd_compr_task_runtime *ta=
sk)
> +{
> +       if (task->state !=3D SND_COMPRESS_TASK_STATE_ACTIVE)
> +               return;
> +       stream->ops->task_stop(stream, task);
> +       if (!snd_BUG_ON(stream->runtime->active_tasks =3D=3D 0))
> +               stream->runtime->active_tasks--;
> +       list_move_tail(&task->list, &stream->runtime->tasks);
> +       task->state =3D SND_COMPRESS_TASK_STATE_IDLE;
> +}
> +
> +static void snd_compr_task_free_one(struct snd_compr_stream *stream,
> +                                       struct snd_compr_task_runtime *ta=
sk)
> +{
> +       snd_compr_task_stop_one(stream, task);
> +       stream->ops->task_free(stream, task);
> +       list_del(&task->list);
> +       snd_compr_task_free(task);
> +       stream->runtime->total_tasks--;
> +}
> +
> +static void snd_compr_task_free_all(struct snd_compr_stream *stream)
> +{
> +       struct snd_compr_task_runtime *task;
> +
> +       list_for_each_entry_reverse(task, &stream->runtime->tasks, list)

Just find a issue here, need to use 'list_for_each_entry_safe_reverse'
because in snd_compr_task_free_one the list_del() is called.

Best regards
Shengjiu Wang

> +               snd_compr_task_free_one(stream, task);
> +}
> +
> +typedef void (*snd_compr_seq_func_t)(struct snd_compr_stream *stream,
> +                                       struct snd_compr_task_runtime *ta=
sk);
> +
> +static int snd_compr_task_seq(struct snd_compr_stream *stream, unsigned =
long arg,
> +                                       snd_compr_seq_func_t fcn)
> +{
> +       struct snd_compr_task_runtime *task;
> +       __u64 seqno;
> +       int retval;
> +
> +       if (stream->runtime->state !=3D SNDRV_PCM_STATE_SETUP)
> +               return -EPERM;
> +       retval =3D get_user(seqno, (__u64 __user *)arg);
> +       if (retval < 0)
> +               return retval;
> +       retval =3D 0;
> +       if (seqno =3D=3D 0) {
> +               list_for_each_entry_reverse(task, &stream->runtime->tasks=
, list)
> +                       fcn(stream, task);
> +       } else {
> +               task =3D snd_compr_find_task(stream, seqno);
> +               if (task =3D=3D NULL) {
> +                       retval =3D -EINVAL;
> +               } else {
> +                       fcn(stream, task);
> +               }
> +       }
> +       return retval;
> +}
> +
> +static int snd_compr_task_status(struct snd_compr_stream *stream,
> +                                       struct snd_compr_task_status *sta=
tus)
> +{
> +       struct snd_compr_task_runtime *task;
> +
> +       task =3D snd_compr_find_task(stream, status->seqno);
> +       if (task =3D=3D NULL)
> +               return -EINVAL;
> +       status->input_size =3D task->input_size;
> +       status->output_size =3D task->output_size;
> +       status->state =3D task->state;
> +       return 0;
> +}
> +
> +static int snd_compr_task_status_ioctl(struct snd_compr_stream *stream, =
unsigned long arg)
> +{
> +       struct snd_compr_task_status *status __free(kfree) =3D NULL;
> +       int retval;
> +
> +       if (stream->runtime->state !=3D SNDRV_PCM_STATE_SETUP)
> +               return -EPERM;
> +       status =3D memdup_user((void __user *)arg, sizeof(*status));
> +       if (IS_ERR(status))
> +               return PTR_ERR(no_free_ptr(status));
> +       retval =3D snd_compr_task_status(stream, status);
> +       if (retval >=3D 0)
> +               if (copy_to_user((void __user *)arg, status, sizeof(*stat=
us)))
> +                       retval =3D -EFAULT;
> +       return retval;
> +}
> +
> +/**
> + * snd_compr_task_finished: Notify that the task was finished
> + * @stream: pointer to stream
> + * @task: runtime task structure
> + *
> + * Set the finished task state and notify waiters.
> + */
> +void snd_compr_task_finished(struct snd_compr_stream *stream,
> +                           struct snd_compr_task_runtime *task)
> +{
> +       guard(mutex)(&stream->device->lock);
> +       if (!snd_BUG_ON(stream->runtime->active_tasks =3D=3D 0))
> +               stream->runtime->active_tasks--;
> +       task->state =3D SND_COMPRESS_TASK_STATE_FINISHED;
> +       wake_up(&stream->runtime->sleep);
> +}
> +EXPORT_SYMBOL_GPL(snd_compr_task_finished);
> +
> +#endif /* CONFIG_SND_COMPRESS_ACCEL */
> +
>  static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned l=
ong arg)
>  {
>         struct snd_compr_file *data =3D f->private_data;
> @@ -968,6 +1278,27 @@ static long snd_compr_ioctl(struct file *f, unsigne=
d int cmd, unsigned long arg)
>                 return snd_compr_set_metadata(stream, arg);
>         case _IOC_NR(SNDRV_COMPRESS_GET_METADATA):
>                 return snd_compr_get_metadata(stream, arg);
> +       }
> +
> +       if (stream->direction =3D=3D SND_COMPRESS_ACCEL) {
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
> +               switch (_IOC_NR(cmd)) {
> +               case _IOC_NR(SNDRV_COMPRESS_TASK_CREATE):
> +                       return snd_compr_task_create(stream, arg);
> +               case _IOC_NR(SNDRV_COMPRESS_TASK_FREE):
> +                       return snd_compr_task_seq(stream, arg, snd_compr_=
task_free_one);
> +               case _IOC_NR(SNDRV_COMPRESS_TASK_START):
> +                       return snd_compr_task_start_ioctl(stream, arg);
> +               case _IOC_NR(SNDRV_COMPRESS_TASK_STOP):
> +                       return snd_compr_task_seq(stream, arg, snd_compr_=
task_stop_one);
> +               case _IOC_NR(SNDRV_COMPRESS_TASK_STATUS):
> +                       return snd_compr_task_status_ioctl(stream, arg);
> +               }
> +#endif
> +               return -ENOTTY;
> +       }
> +
> +       switch (_IOC_NR(cmd)) {
>         case _IOC_NR(SNDRV_COMPRESS_TSTAMP):
>                 return snd_compr_tstamp(stream, arg);
>         case _IOC_NR(SNDRV_COMPRESS_AVAIL):
> @@ -1140,6 +1471,11 @@ int snd_compress_new(struct snd_card *card, int de=
vice,
>         };
>         int ret;
>
> +#if !IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
> +       if (snd_BUG_ON(dirn =3D=3D SND_COMPRESS_ACCEL))
> +               return -EINVAL;
> +#endif
> +
>         compr->card =3D card;
>         compr->device =3D device;
>         compr->direction =3D dirn;
> --
> 2.45.2
>
