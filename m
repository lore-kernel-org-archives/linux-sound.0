Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A31116B757
	for <linux-sound@vger.kernel.org>; Tue, 28 May 2024 11:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716894877; cv=none; b=J4CS+adJFWrejTdzyVPlvAlbtuj4MCK+Ihg0E1oeI1AtJKMImGBn+kjrvJ6oadecAJKBe9ZAp6U/64k0UAOPKSLXgwmIo8QL/rRUpYMBag/LZ/JAn5C+BB7KjaFluq2yMmo0DFXVRF8JobNN/W9LgZBB8pmn34d+PLhmtuf24kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716894877; c=relaxed/simple;
	bh=AJaMJ6znnRmwk0QIws3+G5F+Ji1UYL4KogaL5Y9wXFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YWfSwUFIDq0tv6IysT5Q7DhlBlYKx3Q3jV7/RendWVMPUw4xqV/HXuepQHCNh6DjzpEs+6iU6F8snfMdfYZsypMeONu6Vpvp0mjcW6a9RufXI7/uaQo0/jC2AMtgpEABvAC94uG49xxzMlMhKK/Gsgmh3+boXCN6HVrUBDXi3Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h6K9mCdM; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h6K9mCdM"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3738e997f0bso2516075ab.1
        for <linux-sound@vger.kernel.org>; Tue, 28 May 2024 04:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716894874; x=1717499674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QVpj1JpZkYXCnSqcQ6hSYD7mQIU1/8/F+uUsgR/+Atc=;
        b=h6K9mCdMw7gtkYwvxuQJGFR6tqThicrajbEjtO3mfNpsj9rZW+TciBtPJPebGQv6Um
         7oSGjKH9r5Qee0ANwbUOOMB2OTewOdmckHMqwRxMKHEnCJ678epKNr3EyvV3YKBJYJnt
         wOfcKmcIckLBtQsS9YW69Qi3Dcm8cLOMtzlqD1anfxsS43zCCSNR6HLwUrpNTLojjr0a
         hYLyWwZ9nMYACAjONTEalfJr+Grq+CBbyoLyiTs2Hv/TqTzrPUGeY4S0m+rckoP4DsEm
         WNkjSaTggEKYCR9AH/9H67+SGXAG8iJg4ZnmFRTLK9tjrJ8TW1gzzMds+/CpWJrQ+AFq
         2wjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716894874; x=1717499674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QVpj1JpZkYXCnSqcQ6hSYD7mQIU1/8/F+uUsgR/+Atc=;
        b=bo2GJRJ0nPlcEfA8k9N+PtDrRv++E9sGMZF5hAnzrP/upQ/sPmA6n/SjlpJ/uILXq7
         8lPKIMVXTtu/sV6fYttb2eLMiDmVG8RT8Z4Lhz1wluGpkTTSscUROZdtldaVDJ2ZncOM
         3lYQZPOWeryjgW5sCKbwByqmi14+4h6MyRTJQ1FW89Ikz/m1L2maGFAlITz98OR6sYAt
         rtBKe2F3gYEvl/CcG09TeQjy/FxKUWZINAeJTNE6321wMxI84JP4sBj3CTGfMu5NpB/U
         YNcoySs/rJF9g4UErzgxcLMzXOoCloUPUSadlbG3VbcR7HoZzL1nEu30NqujJYmSlo08
         ee3A==
X-Gm-Message-State: AOJu0YxIkqaz0BR4PaFNOt6YJnqWHUoLWpmOWR4cSkk3RnLVpbI8eylF
	aC0cBN+kGRAjC/qq1iVx6PKhnCEm0O5ENu+NATqTWKvNpjPHYuc/wK9nz6k4IBDejKgi68ztZHK
	AcIDZH3Inq8LGfviLPuZmRrf0IeQ=
X-Google-Smtp-Source: AGHT+IGR77yPL72WolZSZIX6VYl3VlZ00VjW387A4UZ2i0uiu3WlvAWJO6qj/rJ46SgSP88fiJDwJmKKQOMjL9DyUQQ=
X-Received: by 2002:a05:6e02:1a49:b0:36c:4ea0:c706 with SMTP id
 e9e14a558f8ab-3737b2d6ca7mr135244135ab.22.1716894873945; Tue, 28 May 2024
 04:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527122216.244443-1-perex@perex.cz>
In-Reply-To: <20240527122216.244443-1-perex@perex.cz>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 28 May 2024 19:14:22 +0800
Message-ID: <CAA+D8ANqr+kck7myOsC_9PryCSYJuOK3F5EjXqm3mKEgp7bd5A@mail.gmail.com>
Subject: Re: [RFC PATCH v2] ALSA: compress_offload: introduce passthrough
 operation mode
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
	Mark Brown <broonie@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 27, 2024 at 8:23=E2=80=AFPM Jaroslav Kysela <perex@perex.cz> wr=
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
> For details, refer to "compress-passthrough.rst" document.
>
> Note: This code is RFC (not tested, just to clearify the API requirements=
).
> My goal is to add a test (loopback) driver and add a support to tinycompr=
ess
> library in the next step.
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
> v1..v2:
>   - fix some documentation typos (thanks Amadeusz S=C5=82awi=C5=84ski)
>   - fix memdup_user() error handling (thanks Takashi)
>   - use one state variable instead multiple (thanks Takashi)
>   - handle task limit (set to 64 - mentioned in documentation, NIY)
>   - fix file release (free all tasks)
> ---
>  .../sound/designs/compress-passthrough.rst    | 125 +++++++
>  include/sound/compress_driver.h               |  32 ++
>  include/uapi/sound/compress_offload.h         |  51 ++-
>  sound/core/Kconfig                            |   4 +
>  sound/core/compress_offload.c                 | 334 +++++++++++++++++-
>  5 files changed, 537 insertions(+), 9 deletions(-)
>  create mode 100644 Documentation/sound/designs/compress-passthrough.rst
>
> diff --git a/Documentation/sound/designs/compress-passthrough.rst b/Docum=
entation/sound/designs/compress-passthrough.rst
> new file mode 100644
> index 000000000000..975462500c33
> --- /dev/null
> +++ b/Documentation/sound/designs/compress-passthrough.rst
> @@ -0,0 +1,125 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +ALSA Co-processor Passthrough API
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
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
> +A new direction SND_COMPRESS_PASSTHROUGH is introduced to identify
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

Audio data is always separated into a lot of periods. so does this mean
that the call sequence is "CREATE" (user fill period data to buffer ) "STAR=
T"
-> "CREATE" (user fill period data to buffer )"START"
-> "CREATE" (user fill period data to buffer )"START".... ?

Will this cause memory fragmentation?

How can the user get each output?
Or does this mean the sequence should be:
"CREATE"
(user space fill period data to buffer )
"START"
"STOP" :  if the task is running, stop it there is no output generated?
"STATUS":  polling the status to check the task finished for every task?
then another loop for each period?

best regards
Shengjiu Wang

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
> +- ...
> diff --git a/include/sound/compress_driver.h b/include/sound/compress_dri=
ver.h
> index bcf872c17dd3..2884b1e7955d 100644
> --- a/include/sound/compress_driver.h
> +++ b/include/sound/compress_driver.h
> @@ -19,6 +19,22 @@
>
>  struct snd_compr_ops;
>
> +/**
> + * struct snd_compr_task_runtime: task runtime description
> + *
> + */
> +struct snd_compr_task_runtime {
> +       struct list_head list;
> +       struct dma_buf *input;
> +       struct dma_buf *output;
> +       u64 seqno;
> +       u64 input_size;
> +       u64 output_size;
> +       u8 state;
> +       void *private_value;
> +};
> +
> +
>  /**
>   * struct snd_compr_runtime: runtime stream description
>   * @state: stream state
> @@ -54,6 +70,11 @@ struct snd_compr_runtime {
>         dma_addr_t dma_addr;
>         size_t dma_bytes;
>         struct snd_dma_buffer *dma_buffer_p;
> +
> +       u32 active_tasks;
> +       u32 total_tasks;
> +       u64 task_seqno;
> +       struct list_head tasks;
>  };
>
>  /**
> @@ -132,6 +153,12 @@ struct snd_compr_ops {
>                         struct snd_compr_caps *caps);
>         int (*get_codec_caps) (struct snd_compr_stream *stream,
>                         struct snd_compr_codec_caps *codec);
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_PASSTHROUGH)
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
> @@ -242,4 +269,9 @@ int snd_compr_free_pages(struct snd_compr_stream *str=
eam);
>  int snd_compr_stop_error(struct snd_compr_stream *stream,
>                          snd_pcm_state_t state);
>
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_PASSTHROUGH)
> +void snd_compr_task_finished(struct snd_compr_stream *stream,
> +                            struct snd_compr_task_runtime *task);
> +#endif
> +
>  #endif
> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/c=
ompress_offload.h
> index d185957f3fe0..5fed1979522b 100644
> --- a/include/uapi/sound/compress_offload.h
> +++ b/include/uapi/sound/compress_offload.h
> @@ -1,4 +1,4 @@
> -/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +       /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>  /*
>   *  compress_offload.h - compress offload header definations
>   *
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
> +       SND_COMPRESS_PASSTHROUGH
>  };
>
>  /**
> @@ -127,6 +128,42 @@ struct snd_compr_metadata {
>          __u32 value[8];
>  } __attribute__((packed, aligned(4)));
>
> +/**
> + * struct snd_compr_task - task primitive for non-realtime operation
> + * @seqno: sequence number (task identifier)
> + * @origin_seqno: previous sequence number (task identifier) - for reuse
> + * @input_fd: data input file descriptor (dma-buf)
> + * @output_fd: data output file descriptor (dma-buf)
> + * @input_size: filled data in bytes (from caller, must not exceed fragm=
ent size)
> + */
> +struct snd_compr_task {
> +       __u64 seqno;
> +       __u64 origin_seqno;
> +       int input_fd;
> +       int output_fd;
> +       __u64 input_size;
> +       __u8 reserved[16];
> +} __attribute__((packed, aligned(4)));
> +
> +enum snd_compr_state {
> +       SND_COMPRESS_TASK_STATE_IDLE =3D 0,
> +       SND_COMPRESS_TASK_STATE_ACTIVE,
> +       SND_COMPRESS_TASK_STATE_FINISHED
> +};
> +
> +/**
> + * struct snd_compr_task_status - task status
> + * @seqno: sequence number (task identifier)
> + * @output_size: filled data in bytes (from driver)
> + * @state: actual task state (SND_COMPRESS_TASK_STATE_*)
> + */
> +struct snd_compr_task_status {
> +       __u64 seqno;
> +       __u64 output_size;
> +       __u8 state;
> +       __u8 reserved[15];
> +} __attribute__((packed, aligned(4)));
> +
>  /*
>   * compress path ioctl definitions
>   * SNDRV_COMPRESS_GET_CAPS: Query capability of DSP
> @@ -164,6 +201,14 @@ struct snd_compr_metadata {
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
> index 8077f481d84f..3541fe6d477f 100644
> --- a/sound/core/Kconfig
> +++ b/sound/core/Kconfig
> @@ -59,6 +59,10 @@ config SND_CORE_TEST
>  config SND_COMPRESS_OFFLOAD
>         tristate
>
> +config SND_COMPRESS_PASSTHROUGH
> +       select DMA_BUF
> +       tristate
> +
>  config SND_JACK
>         bool
>
> diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.=
c
> index f0008fa2d839..da048e61c574 100644
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
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_PASSTHROUGH)
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
> +               dirn =3D SND_COMPRESS_PASSTHROUGH;
>         else
>                 return -EINVAL;
>
> @@ -154,6 +163,8 @@ static int snd_compr_free(struct inode *inode, struct=
 file *f)
>                 break;
>         }
>
> +       snd_compr_task_free_all(&data->stream);
> +
>         data->stream.ops->free(&data->stream);
>         if (!data->stream.runtime->dma_buffer_p)
>                 kfree(data->stream.runtime->buffer);
> @@ -226,6 +237,9 @@ snd_compr_ioctl_avail(struct snd_compr_stream *stream=
, unsigned long arg)
>         struct snd_compr_avail ioctl_avail;
>         size_t avail;
>
> +       if (stream->direction =3D=3D SND_COMPRESS_PASSTHROUGH)
> +               return -EBADFD;
> +
>         avail =3D snd_compr_calc_avail(stream, &ioctl_avail);
>         ioctl_avail.avail =3D avail;
>
> @@ -287,6 +301,8 @@ static ssize_t snd_compr_write(struct file *f, const =
char __user *buf,
>                 return -EFAULT;
>
>         stream =3D &data->stream;
> +       if (stream->direction =3D=3D SND_COMPRESS_PASSTHROUGH)
> +               return -EBADFD;
>         guard(mutex)(&stream->device->lock);
>         /* write is allowed when stream is running or has been steup */
>         switch (stream->runtime->state) {
> @@ -336,6 +352,8 @@ static ssize_t snd_compr_read(struct file *f, char __=
user *buf,
>                 return -EFAULT;
>
>         stream =3D &data->stream;
> +       if (stream->direction =3D=3D SND_COMPRESS_PASSTHROUGH)
> +               return -EBADFD;
>         guard(mutex)(&stream->device->lock);
>
>         /* read is allowed when stream is running, paused, draining and s=
etup
> @@ -385,6 +403,8 @@ static __poll_t snd_compr_poll(struct file *f, poll_t=
able *wait)
>  {
>         struct snd_compr_file *data =3D f->private_data;
>         struct snd_compr_stream *stream;
> +       struct snd_compr_runtime *runtime;
> +       struct snd_compr_task_runtime *task;
>         size_t avail;
>         __poll_t retval =3D 0;
>
> @@ -392,6 +412,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_t=
able *wait)
>                 return EPOLLERR;
>
>         stream =3D &data->stream;
> +       runtime =3D stream->runtime;
>
>         guard(mutex)(&stream->device->lock);
>
> @@ -405,6 +426,18 @@ static __poll_t snd_compr_poll(struct file *f, poll_=
table *wait)
>
>         poll_wait(f, &stream->runtime->sleep, wait);
>
> +       if (stream->direction =3D=3D SND_COMPRESS_PASSTHROUGH) {
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
> +
> +
>         avail =3D snd_compr_get_avail(stream);
>         pr_debug("avail is %ld\n", (unsigned long)avail);
>         /* check if we have at least one fragment to fill */
> @@ -521,6 +554,9 @@ static int snd_compr_allocate_buffer(struct snd_compr=
_stream *stream,
>         unsigned int buffer_size;
>         void *buffer =3D NULL;
>
> +       if (stream->direction =3D=3D SND_COMPRESS_PASSTHROUGH)
> +               goto params;
> +
>         buffer_size =3D params->buffer.fragment_size * params->buffer.fra=
gments;
>         if (stream->ops->copy) {
>                 buffer =3D NULL;
> @@ -543,18 +579,30 @@ static int snd_compr_allocate_buffer(struct snd_com=
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
> +       if (stream->direction =3D=3D SND_COMPRESS_PASSTHROUGH)
> +               max_fragments =3D 64;                     /* safe value *=
/
> +       else
> +               max_fragments =3D U32_MAX / params->buffer.fragment_size;
> +
> +       if (params->buffer.fragments > max_fragments ||
>             params->buffer.fragments =3D=3D 0)
>                 return -EINVAL;
>
> @@ -583,7 +631,7 @@ snd_compr_set_params(struct snd_compr_stream *stream,=
 unsigned long arg)
>                 if (IS_ERR(params))
>                         return PTR_ERR(no_free_ptr(params));
>
> -               retval =3D snd_compress_check_input(params);
> +               retval =3D snd_compress_check_input(stream, params);
>                 if (retval)
>                         return retval;
>
> @@ -939,6 +987,259 @@ static int snd_compr_partial_drain(struct snd_compr=
_stream *stream)
>         return snd_compress_wait_for_drain(stream);
>  }
>
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_PASSTHROUGH)
> +
> +static struct snd_compr_task_runtime *
> +               snd_compr_find_task(struct snd_compr_stream *stream, __u6=
4 seqno)
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
> +       task->seqno =3D snd_compr_seqno_next(stream);
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
> +               task =3D snd_compr_find_task(stream, utask->seqno);
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
> +       list_for_each_entry(task, &stream->runtime->tasks, list)
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
> +               list_for_each_entry(task, &stream->runtime->tasks, list)
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
> +EXPORT_SYMBOL(snd_compr_task_finished);
> +
> +#endif /* CONFIG_COMPRESS_PASSTHROUGH */
> +
>  static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned l=
ong arg)
>  {
>         struct snd_compr_file *data =3D f->private_data;
> @@ -968,6 +1269,27 @@ static long snd_compr_ioctl(struct file *f, unsigne=
d int cmd, unsigned long arg)
>                 return snd_compr_set_metadata(stream, arg);
>         case _IOC_NR(SNDRV_COMPRESS_GET_METADATA):
>                 return snd_compr_get_metadata(stream, arg);
> +       }
> +
> +       if (stream->direction =3D=3D SND_COMPRESS_PASSTHROUGH) {
> +#if IS_ENABLED(CONFIG_SND_COMPRESS_PASSTHROUGH)
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
> --
> 2.45.1
>
