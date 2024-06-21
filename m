Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD4D620
	for <linux-sound@vger.kernel.org>; Fri, 21 Jun 2024 02:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718935270; cv=none; b=T3aqO7pf2Kbgz7kx5LawvHMyDNz+zKN5mLVHdj0coiJhEMpM3FRj6o2hQ0aqqeHcirWjouYTDoGMGfrCWeH9GliJ6hfNymKsk8srhIyUNSQRZeUfnn7vpCTazM/UyK/68SU4I6ypuDaSIjB7EXdah369VMOf3sgAoWB6P9LuQTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718935270; c=relaxed/simple;
	bh=v7okxzomdo6sYCVPbBr+m67QMh3s6jKnSoqMATpE/6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GItpwg2u1tVM547zCXhi8x7rrCqZnrIxMIB/2NcRFEzhzUXxyGVvw+4pDr1PxZVu6DxUmufDVZIKsekKDyENt8NhC/NRqy/uPej1GJYGN0mVdNv77LZwcMypZXEbZhEIY/nglLeBnAj2dINmjQ2IDppspBK8Zr1R96bbvuu2gyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l886hI8B; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l886hI8B"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-37621e7468eso5894245ab.0
        for <linux-sound@vger.kernel.org>; Thu, 20 Jun 2024 19:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718935267; x=1719540067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZidTobfA5kgJCxPyljhKtkf8cU6IUGXAhKq1TuE2L4=;
        b=l886hI8B+yeUSxQzr98CXLwBhLaVCwSCQWO4hwsuw4skTeI9VT9LXpppICwDVl2h1K
         zJNHUJZNDaOPO2IjCvO4vjT35qb7j+YqGJFwu0jV4gQu4NvGwl8BXW2uJlcuwWAediY+
         qJGBXH1CpRAadKVRCyQXClvHgvJFEkQURQ0siyg0ZQnAuZVLWTAlRKO/g8UpE5UrGC/4
         W3ObfPluHCQorW6hqHTBnt/DUa7AL6fu0i+47MokLOyQJZsG1YfkRIz1SyNFf7PIgvXK
         FvH3bqp91FKTgpWoPzRVnr3VFxGtEVoIadgwYnbymR3edX+Dw1uDJVpGiwyz9929gU/H
         c9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718935267; x=1719540067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZidTobfA5kgJCxPyljhKtkf8cU6IUGXAhKq1TuE2L4=;
        b=gnJ3ltswEEqp8Gi8p1jK9jJtlki9YpawU383tlc0ACqf0UJZ/bcMP6vOizlvtVVvCR
         hX4aczHlaxFTB9Pc2brqh4Q96c6CoSFJXK9LB9lJPSFE4O0mbduVCbsRBssBgqeyZZkc
         1ZULdfIK4s/7vNd/h9AmgT5oTSqhKsCJ5IFu+pg7ye2mB2aLvEtkkgXMb7i3DsC38KdQ
         jgCWdArpfm5d9R8cHnQf8i+9c5w97F57p3ban7wNFUTTbvwX84VhgOuwFgxmAhYps5nL
         WloO/DaXLmxH+cqIu44moc3lMttnKJ2OOflWq3H6X32IKEyhOCFog/lhlVK7eaDHmuKG
         3xtA==
X-Gm-Message-State: AOJu0YznJhdimmmUcgIGCajGw83zMxa90HfqAyKzkrP1K6FQuCzI0ysP
	oKzhlPNOQCPJH2gzXlczh2cGcj6vaUMg7vrGSqD2QTiNRjPNqlgFlgICi+OL/sBKXaQQE9ukiAw
	SIBO9t/WEx/VqyB5S0NC+Hz+UaXk=
X-Google-Smtp-Source: AGHT+IEIIKJ2lGjAHH6UixHbWFV7Ivtr4Hu9Evie5IreqNvioXTYerKCYGUxUaZCQqOFZxf9Bq7W2iZ5Vv0884aumyI=
X-Received: by 2002:a05:6e02:2141:b0:376:2649:32c6 with SMTP id
 e9e14a558f8ab-3762649410dmr23726775ab.3.1718935267333; Thu, 20 Jun 2024
 19:01:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240527122216.244443-1-perex@perex.cz> <CAA+D8ANqr+kck7myOsC_9PryCSYJuOK3F5EjXqm3mKEgp7bd5A@mail.gmail.com>
 <CAA+D8AO5Tw=DGU1=5pOcJDOVFW3gx0Tsq7KqLUO-LXOmfh0RjQ@mail.gmail.com> <c7152a8b-443e-457b-bd14-528cc28c0e65@perex.cz>
In-Reply-To: <c7152a8b-443e-457b-bd14-528cc28c0e65@perex.cz>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 21 Jun 2024 10:00:56 +0800
Message-ID: <CAA+D8AMjXnGTF2s6fNa+xgohQ1hyc1xGJON1SzPR5iuO0JgDyg@mail.gmail.com>
Subject: Re: [RFC PATCH v2] ALSA: compress_offload: introduce passthrough
 operation mode
To: Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
	Mark Brown <broonie@kernel.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	=?UTF-8?B?QW1hZGV1c3ogU8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 3, 2024 at 4:57=E2=80=AFPM Jaroslav Kysela <perex@perex.cz> wro=
te:
>
> On 03. 06. 24 10:31, Shengjiu Wang wrote:
> > On Tue, May 28, 2024 at 7:14=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gm=
ail.com> wrote:
> >>
> >> On Mon, May 27, 2024 at 8:23=E2=80=AFPM Jaroslav Kysela <perex@perex.c=
z> wrote:
> >>>
> >>> There is a requirement to expose the audio hardware that accelerates =
various
> >>> tasks for user space such as sample rate converters, compressed
> >>> stream decoders, etc.
> >>>
> >>> This is description for the API extension for the compress ALSA API w=
hich
> >>> is able to handle "tasks" that are not bound to real-time operations
> >>> and allows for the serialization of operations.
> >>>
> >>> For details, refer to "compress-passthrough.rst" document.
> >>>
> >>> Note: This code is RFC (not tested, just to clearify the API requirem=
ents).
> >>> My goal is to add a test (loopback) driver and add a support to tinyc=
ompress
> >>> library in the next step.
> >>>
> >>> Cc: Mark Brown <broonie@kernel.org>
> >>> Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
> >>> Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
> >>> Cc: Amadeusz S=C5=82awi=C5=84ski <amadeuszx.slawinski@linux.intel.com=
>
> >>> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> >>> Cc: Vinod Koul <vkoul@kernel.org>
> >>> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> >>>
> >>> ---
> >>> v1..v2:
> >>>    - fix some documentation typos (thanks Amadeusz S=C5=82awi=C5=84sk=
i)
> >>>    - fix memdup_user() error handling (thanks Takashi)
> >>>    - use one state variable instead multiple (thanks Takashi)
> >>>    - handle task limit (set to 64 - mentioned in documentation, NIY)
> >>>    - fix file release (free all tasks)
> >>> ---
> >>>   .../sound/designs/compress-passthrough.rst    | 125 +++++++
> >>>   include/sound/compress_driver.h               |  32 ++
> >>>   include/uapi/sound/compress_offload.h         |  51 ++-
> >>>   sound/core/Kconfig                            |   4 +
> >>>   sound/core/compress_offload.c                 | 334 +++++++++++++++=
++-
> >>>   5 files changed, 537 insertions(+), 9 deletions(-)
> >>>   create mode 100644 Documentation/sound/designs/compress-passthrough=
.rst
> >>>
> >>> diff --git a/Documentation/sound/designs/compress-passthrough.rst b/D=
ocumentation/sound/designs/compress-passthrough.rst
> >>> new file mode 100644
> >>> index 000000000000..975462500c33
> >>> --- /dev/null
> >>> +++ b/Documentation/sound/designs/compress-passthrough.rst
> >>> @@ -0,0 +1,125 @@
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +ALSA Co-processor Passthrough API
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +Jaroslav Kysela <perex@perex.cz>
> >>> +
> >>> +
> >>> +Overview
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +There is a requirement to expose the audio hardware that accelerates=
 various
> >>> +tasks for user space such as sample rate converters, compressed
> >>> +stream decoders, etc.
> >>> +
> >>> +This is description for the API extension for the compress ALSA API =
which
> >>> +is able to handle "tasks" that are not bound to real-time operations
> >>> +and allows for the serialization of operations.
> >>> +
> >>> +Requirements
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +The main requirements are:
> >>> +
> >>> +- serialization of multiple tasks for user space to allow multiple
> >>> +  operations without user space intervention
> >>> +
> >>> +- separate buffers (input + output) for each operation
> >>> +
> >>> +- expose buffers using mmap to user space
> >>> +
> >>> +- signal user space when the task is finished (standard poll mechani=
sm)
> >>> +
> >>> +Design
> >>> +=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +A new direction SND_COMPRESS_PASSTHROUGH is introduced to identify
> >>> +the passthrough API.
> >>> +
> >>> +The API extension shares device enumeration and parameters handling =
from
> >>> +the main compressed API. All other realtime streaming ioctls are dea=
ctivated
> >>> +and a new set of task related ioctls are introduced. The standard
> >>> +read/write/mmap I/O operations are not supported in the passthrough =
device.
> >>> +
> >>> +Device ("stream") state handling is reduced to OPEN/SETUP. All other
> >>> +states are not available for the passthrough mode.
> >>> +
> >>> +Data I/O mechanism is using standard dma-buf interface with all adva=
ntages
> >>> +like mmap, standard I/O, buffer sharing etc. One buffer is used for =
the
> >>> +input data and second (separate) buffer is used for the output data.=
 Each task
> >>> +have separate I/O buffers.
> >>> +
> >>> +For the buffering parameters, the fragments means a limit of allocat=
ed tasks
> >>> +for given device. The fragment_size limits the input buffer size for=
 the given
> >>> +device. The output buffer size is determined by the driver (may be d=
ifferent
> >>> +from the input buffer size).
> >>> +
> >>> +State Machine
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +The passthrough audio stream state machine is described below :
> >>> +
> >>> +                                       +----------+
> >>> +                                       |          |
> >>> +                                       |   OPEN   |
> >>> +                                       |          |
> >>> +                                       +----------+
> >>> +                                             |
> >>> +                                             |
> >>> +                                             | compr_set_params()
> >>> +                                             |
> >>> +                                             v
> >>> +         all passthrough task ops      +----------+
> >>> +  +------------------------------------|          |
> >>> +  |                                    |   SETUP  |
> >>> +  |                                    |
> >>> +  |                                    +----------+
> >>> +  |                                          |
> >>> +  +------------------------------------------+
> >>> +
> >>> +
> >>> +Passthrough operations (ioctls)
> >>> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>> +
> >>> +CREATE
> >>> +------
> >>> +Creates a set of input/output buffers. The input buffer size is
> >>> +fragment_size. Allocates unique seqno.
> >>> +
> >>> +The hardware drivers allocate internal 'struct dma_buf' for both inp=
ut and
> >>> +output buffers (using 'dma_buf_export()' function). The anonymous
> >>> +file descriptors for those buffers are passed to user space.
> >>> +
> >>
> >> Audio data is always separated into a lot of periods. so does this mea=
n
> >> that the call sequence is "CREATE" (user fill period data to buffer ) =
"START"
> >> -> "CREATE" (user fill period data to buffer )"START"
> >> -> "CREATE" (user fill period data to buffer )"START".... ?
> >>
> >> Will this cause memory fragmentation?
> >>
> >> How can the user get each output?
> >> Or does this mean the sequence should be:
> >> "CREATE"
> >> (user space fill period data to buffer )
> >> "START"
> >> "STOP" :  if the task is running, stop it there is no output generated=
?
> >> "STATUS":  polling the status to check the task finished for every tas=
k?
> >> then another loop for each period?
> >>
> >
> > Per my understanding,  I use the below sequence:
> > create  -> (start, stop, status) -> (start, stop, status) ...-> free.
>
> The stop is optional. When the driver calls snd_compr_task_finished(), it=
's
> expected that the task has finished (stopped) and the next started task i=
n the
> queue is processed.
>
> > Below are issues found in the code.
> > diff --git a/sound/core/compress_offload.c b/sound/core/compress_offloa=
d.c
> > index da048e61c574..7b6168d43d41 100644
> > --- a/sound/core/compress_offload.c
> > +++ b/sound/core/compress_offload.c
> > @@ -134,6 +134,7 @@ static int snd_compr_open(struct inode *inode,
> > struct file *f)
> >          }
> >          runtime->state =3D SNDRV_PCM_STATE_OPEN;
> >          init_waitqueue_head(&runtime->sleep);
> > +       INIT_LIST_HEAD(&runtime->tasks);
>
> Thanks.
>
> >          data->stream.runtime =3D runtime;
> >          f->private_data =3D (void *)data;
> >          scoped_guard(mutex, &compr->lock)
> > @@ -1003,10 +1004,6 @@ static struct snd_compr_task_runtime *
> >
> >   static void snd_compr_task_free(struct snd_compr_task_runtime *task)
> >   {
> > -       if (task->output)
> > -               dma_buf_put(task->output);
> > -       if (task->input)
> > -               dma_buf_put(task->input);
> >          kfree(task);
> >   }
>
> See bellow.
>
> > @@ -1045,6 +1042,7 @@ static int snd_compr_task_new(struct
> > snd_compr_stream *stream, struct snd_compr_
> >                  retval =3D utask->output_fd;
> >                  goto cleanup;
> >          }
> > +       utask->seqno =3D task->seqno;
>
> Thanks.
>
> >          list_add_tail(&task->list, &stream->runtime->tasks);
> >          stream->runtime->total_tasks++;
> >          return 0;
> >
> > There is no dma_buf_get() called, so remove the dma_buf_put().
>
> I expected that the driver will increase this reference counter in the
> task_create callback. But yes, it will be probably better to do in
> snd_compr_task_new() when file descriptors are used.
>
> I will send v3 soon. Thank you for your comments.

Thanks,  So when can we get the v3?

Best regards
Shengjiu Wang
>
>                                 Jaroslav
>
> --
> Jaroslav Kysela <perex@perex.cz>
> Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
>
