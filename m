Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1762D600
	for <linux-sound@vger.kernel.org>; Tue, 25 Jun 2024 01:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719280723; cv=none; b=BhT3SJ40w6+DKNL9d7rA60Mv/d5d3jtBlegTSjL2EF7vQ21qYP6Q4/sAq5Eiyh9Xur3mIDq44zZ91nwrCXlXlpmkRcy/NIHx4FvGIy1bjcetx4VRfjr1WFUAZRgzpYmFBnQ+R0AMXhTSJBojYEcnRuIu/Nj9D2T5P3RAudlwzkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719280723; c=relaxed/simple;
	bh=cUhgdPu0bbbqyq5+VMhYhGd3fSUwSP3BIAOmwV4xgac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eRb1TMw2IbBlwZ8fH7hwQCEXHHjsd3tgIbH8+qwZuxtuWRPZDHv+YXbBgQXQxl0aIDWfSFeIO6MVvLO97f8M4rduxCqDF5fSLjdU8TCy+WlLocIqTKTc+ag2qSih/8if4FFJuCoIlm69VdWOF47pzQzqpyDIPyoesKuhwuFP0Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VWHP6vWS; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VWHP6vWS"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-7eba486df76so149785639f.0
        for <linux-sound@vger.kernel.org>; Mon, 24 Jun 2024 18:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719280720; x=1719885520; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zZ3XFPlFsmQxuufM2zB7IS6OsbAwN84HsCaquhd5RPk=;
        b=VWHP6vWSwvHUwnG7V8441bImQthNPMhj5DCDcd1nm6SJTA/OIt4os+tXuFH8gW13F0
         2UAsAL+PoY2R8RpsmXsDO1+XmpoWbIgWBu6FxAEWi847gMUAS9yIoaEBu7yFF38lGA/1
         Vt0jMpITdKk59/Z6fGQ8GajW2eG3qmq9yX6BRg2M9gvp0/N+7d3IKBvP+6h6OvoGCvyv
         5Lt7ZhQE/fXQZs9+zD6BZvYORe9mKlhFc6odet2rqss7ZeoRfKfed4+E/k7gKNHRufWq
         XZ2vqEO5o9uiXAfk0kRqCr2rI8DluqNBUNnH4xgbnIWj4cn71IO8Tn1ZZCvZawBqHKoZ
         jA3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719280720; x=1719885520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zZ3XFPlFsmQxuufM2zB7IS6OsbAwN84HsCaquhd5RPk=;
        b=lo9BLfiPuge8XrAY3skTZiwdRLYoz1OHOJ/fXsGzQhH70ZjWNkf0hkTBwjp4ooBhd0
         8AmZ2c35UN8bLQhNb8fWQi8eNLfhUVFAOhpp1OiHUKh5Hs2oaegm7VmhPgrfNJbysiQq
         uYrkPb+QaowO0iU0c665XLItyEta2imN3m/XlZpdlhZHR2hxoKzrYfeMjDIiFJUkLLRD
         5dsja73EVxJRfZG/222il+niVlHTT10iyV9iArs8jQKpl5mnm7CytwnzrsOksa9WcL1l
         CYx2FaF/04GC9/eh2/QAjlX+eib+Lnii+cZaHJJWpUbqzu6l1jRsWLUT4u1v3UAvuvOg
         1bVw==
X-Gm-Message-State: AOJu0Yz/8ZivjWapqMYF1/0083uXpliRK4y0Udb6QU7s31llTeRZpnrG
	qKAinEOeBaq8CBQwVpD+9DJWTqEQ9+CB3yakRN5cDr56o/NYGc6Z9YrLyJOy/h6+WRuRLGf6pHe
	26ig7yzUtFgjUcRQyWA8PSPsRF4A=
X-Google-Smtp-Source: AGHT+IHLPNU0+zNzWtJ5jO2bVVyDOEW+CWd4uwJPQGYhAcEN381BvZcxjfeXK9JN3YSwrRm9fuGdaQBfejDd2R2jL3w=
X-Received: by 2002:a05:6e02:20c3:b0:374:6431:7472 with SMTP id
 e9e14a558f8ab-37656439bcbmr2079025ab.15.1719280720049; Mon, 24 Jun 2024
 18:58:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240621164915.410946-1-perex@perex.cz>
In-Reply-To: <20240621164915.410946-1-perex@perex.cz>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 25 Jun 2024 09:58:28 +0800
Message-ID: <CAA+D8AN3MCYeVv90mqrnkxpsvfQN2Yf=R_X_NQDq_j5MU=BNWQ@mail.gmail.com>
Subject: Re: [PATCH v3] ALSA: compress_offload: introduce passthrough
 operation mode
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
	Mark Brown <broonie@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 22, 2024 at 12:49=E2=80=AFAM Jaroslav Kysela <perex@perex.cz> w=
rote:
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
>  .../sound/designs/compress-passthrough.rst    | 125 +++++++
>  include/sound/compress_driver.h               |  32 ++
>  include/uapi/sound/compress_offload.h         |  51 ++-
>  sound/core/Kconfig                            |   4 +
>  sound/core/compress_offload.c                 | 338 +++++++++++++++++-
>  5 files changed, 541 insertions(+), 9 deletions(-)
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
> index f0008fa2d839..190d754ec994 100644
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
> @@ -112,6 +121,7 @@ static int snd_compr_open(struct inode *inode, struct=
 file *f)
>         }
>
>         INIT_DELAYED_WORK(&data->stream.error_work, error_delayed_work);
> +       INIT_LIST_HEAD(&runtime->tasks);

This needs to be after the 'runtime' allocated.

Best regards
Shengjiu Wang
>
>         data->stream.ops =3D compr->ops;
>         data->stream.direction =3D dirn;
> @@ -154,6 +164,8 @@ static int snd_compr_free(struct inode *inode, struct=
 file *f)
>                 break;
>         }
>
> +       snd_compr_task_free_all(&data->stream);
> +
>         data->stream.ops->free(&data->stream);
>         if (!data->stream.runtime->dma_buffer_p)
>                 kfree(data->stream.runtime->buffer);
> @@ -226,6 +238,9 @@ snd_compr_ioctl_avail(struct snd_compr_stream *stream=
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
> @@ -287,6 +302,8 @@ static ssize_t snd_compr_write(struct file *f, const =
char __user *buf,
>                 return -EFAULT;
>
>         stream =3D &data->stream;
> +       if (stream->direction =3D=3D SND_COMPRESS_PASSTHROUGH)
> +               return -EBADFD;
>         guard(mutex)(&stream->device->lock);
>         /* write is allowed when stream is running or has been steup */
>         switch (stream->runtime->state) {
> @@ -336,6 +353,8 @@ static ssize_t snd_compr_read(struct file *f, char __=
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
> @@ -385,6 +404,8 @@ static __poll_t snd_compr_poll(struct file *f, poll_t=
able *wait)
>  {
>         struct snd_compr_file *data =3D f->private_data;
>         struct snd_compr_stream *stream;
> +       struct snd_compr_runtime *runtime;
> +       struct snd_compr_task_runtime *task;
>         size_t avail;
>         __poll_t retval =3D 0;
>
> @@ -392,6 +413,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_t=
able *wait)
>                 return EPOLLERR;
>
>         stream =3D &data->stream;
> +       runtime =3D stream->runtime;
>
>         guard(mutex)(&stream->device->lock);
>
> @@ -405,6 +427,18 @@ static __poll_t snd_compr_poll(struct file *f, poll_=
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
> @@ -521,6 +555,9 @@ static int snd_compr_allocate_buffer(struct snd_compr=
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
> @@ -543,18 +580,30 @@ static int snd_compr_allocate_buffer(struct snd_com=
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
> @@ -583,7 +632,7 @@ snd_compr_set_params(struct snd_compr_stream *stream,=
 unsigned long arg)
>                 if (IS_ERR(params))
>                         return PTR_ERR(no_free_ptr(params));
>
> -               retval =3D snd_compress_check_input(params);
> +               retval =3D snd_compress_check_input(stream, params);
>                 if (retval)
>                         return retval;
>
> @@ -939,6 +988,262 @@ static int snd_compr_partial_drain(struct snd_compr=
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
> @@ -968,6 +1273,27 @@ static long snd_compr_ioctl(struct file *f, unsigne=
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
> 2.45.2
>
