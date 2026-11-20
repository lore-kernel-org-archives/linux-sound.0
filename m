Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205848;
	b=xjktQx92UMEVjm4Vj8rarrM0eFSUvjYNfmcMCiocwiPUSWeGZfb5GIVmL3G7zyJB1oVP
	 8ogKpqggXvDqN3DuQfcT86UtGoFd5+upYQcLN4JsKvv80agQbUdBVGXuxIvsaC6IcAALT
	 +JtS1RnWiejvVFTIw3nsfYwgBd7pbNrzrIeA1izVsYGEHuphEqKqnlBCEmtTT5Y7mZdtK
	 Vbt/0fN6JFtkKaoPa7+VOO/pProtzqOKT5X80nqO0C4cKFdVpqvIptfznd5/JgsCYncIb
	 ihHJXokx87zEFmHTxzqJ9xluaQf/QMl28dHmndrjIvZRFDFK0DAN3iKxdqf8h7/T0oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205848;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mjkEWbZ9NXVNPSXEqcA3SYLXWAnHnEaUk0TfB5aw4ZY=;
	b=AKk6VOlVWnAS+TBK/KGi6sU7tMrJbTj5OMqfgWKaO0q7pqxsv0z3BTk1vXELId/1OBdS
	 8MzbgEza78lLKcnUofxVwZTcyP0vhGLIoW8fXVwNw2cXvwY68cy8qh1BIXWlHqQMJ9+Iq
	 NQ9b10pjaj2fJ0Z7es0wESc77Ecsq0teE7g8Et4DmaMn29p3a8q4PX4kzyWWKPbqh9U+v
	 lRgzwoeFrgOh215+4OS/aOHtc+pe/oJF8Zh15aMnQERHAE6+42v2tCKbBg1iAdksDB2w2
	 Awt0U/YLMzP/WkGrf/t+3QJQKzwUj/p4D0YJ0kDwF0Lf6YAGsOzUejHheeCypoh83Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g1VBEiva;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998A0606A6F4
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 20:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g1VBEiva
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A18201F000C0;
	Fri, 20 Nov 2026 20:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795205847;
	bh=mjkEWbZ9NXVNPSXEqcA3SYLXWAnHnEaUk0TfB5aw4ZY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g1VBEivasvHsFhHlfUJosCckrpI8W0q67Egkaka4dcVs4cctlxp/ujQwYZe7fufo1
	 8GJbw/hB9iDIA/JOGjpwCQDx/I5fa1Q34DftNl2116N1l5V/eraVslj+ctRqe+OSW/
	 ouWSrYK3W3JMz8awQ50PSa1L6lwv8QQdFtprTmeYzhcthfvdWl2FXgmCt8P0PCfSWE
	 oEQgDdERiedBz96qsKc7JTBWsqK3fS1pjtFqNHdLVsY6JbYz9ze9g6jVI8UPqkOU6s
	 VrkxxGTQrqOsYGChsGxw2pfvKZ7yHxwcFldBFwpsod0xzOxcZ79ubQVOWSwT5bwmFS
	 e3/NJxuLWFs4w==
Message-ID: <sashiko-outbox-226027@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: qcom: q6apm-dai: keep a playback stream
 running across a PCM reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Perry Dale" <techluddite@outlook.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <LV5PR84MB4026E23CD27421FEF1D8B373A7782@LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM>
References: <LV5PR84MB40268B01B9F458296BE453ACA7782@LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM>
 <LV5PR84MB4026E23CD27421FEF1D8B373A7782@LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 20:17:27 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] ASoC: qcom: q6apm-dai: queue_ptr desync and stall on
  non-running reset
- [Medium] ASoC: qcom: q6apm-dai: reset lock-gap race in
  q6apm_dai_ioctl()
- [Medium] ASoC: qcom: q6apm-dai: snd_pcm_stop() while paused skips stop
  trigger
--

commit 76e6dbc3559b40e7770b67301512b5eb160e3c6d
Author: Perry Dale <techluddite@outlook.com>

ASoC: qcom: q6apm-dai: keep a playback stream running across a PCM reset

This commit tracks the number of playback buffers in flight with the DSP
and realigns queue_ptr against hw_ptr on SNDRV_PCM_IOCTL1_RESET and in a
shared queueing helper called from .ack and APM_CLIENT_EVENT_DATA_WRITE_DON=
E.

> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6ap=
m-dai.c
> index d0d19fc38e8be..e4a6817ee17bb 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
[ ... ]
> @@ -433,14 +447,39 @@ static int q6apm_dai_prepare(struct snd_soc_compone=
nt *component,
>  	return 0;
>  }
> =20
> -static int q6apm_dai_ack(struct snd_soc_component *component, struct snd=
_pcm_substream *substream)
> +/*
> + * Give queue_ptr its ring offset back relative to hw_ptr. Called with t=
he
> + * stream lock held after hw_ptr moved without it.
> + */
> +static void q6apm_dai_align_queue(struct snd_pcm_substream *substream)
>  {
>  	struct snd_pcm_runtime *runtime =3D substream->runtime;
>  	struct q6apm_dai_rtd *prtd =3D runtime->private_data;
> -	int i, ret =3D 0, avail_periods;
> +	snd_pcm_uframes_t hw_ptr =3D runtime->status->hw_ptr;
> +	snd_pcm_uframes_t ahead;
> =20
> -	if (q6apm_is_graph_in_push_pull_mode(prtd->graph))
> -		return 0;
> +	ahead =3D (prtd->queue_ptr % runtime->buffer_size + runtime->buffer_siz=
e -
> +		 hw_ptr % runtime->buffer_size) % runtime->buffer_size;
> +	/*
> +	 * The offset is 0 both for an empty and for a full queue. A running
> +	 * stream with every buffer queued continues with the buffers the DSP
> +	 * holds. A paused stream can have them played before its hw_ptr moves
> +	 * again, so a stream that is not running queues what is written from
> +	 * here on.
> +	 */
> +	if (!ahead && snd_pcm_running(substream) && prtd->in_flight =3D=3D runt=
ime->periods)
> +		ahead =3D runtime->buffer_size;
> +
> +	prtd->queue_ptr =3D (hw_ptr + ahead) % runtime->boundary;
> +}

[Severity: High]
Can q6apm_dai_align_queue() desynchronize prtd->queue_ptr from
prtd->in_flight and stall playback when SNDRV_PCM_IOCTL_RESET runs on a
prepared or paused stream?

Because q6apm_dai_prepare() starts the DSP graph immediately and
q6apm_dai_trigger() does not stop or pause the graph, the DSP continues
consuming queued periods while !snd_pcm_running(substream).  In that state
event_handler() decrements prtd->in_flight down to 0, while
snd_pcm_period_elapsed_under_stream_lock() leaves runtime->status->hw_ptr
unchanged.

If the application queues k periods (0 < k < runtime->periods) while
prepared or paused, waits for the DSP to finish them (prtd->in_flight =3D=
=3D 0),
and calls SNDRV_PCM_IOCTL_RESET, snd_pcm_lib_ioctl_reset() sets
runtime->status->hw_ptr =3D 0 and appl_ptr =3D 0.  q6apm_dai_align_queue()
then computes ahead =3D k * runtime->period_size and leaves prtd->queue_ptr
at k * runtime->period_size even though no buffers are in flight.  If the
application writes m <=3D k periods and starts or unpauses the stream,
q6apm_dai_queue_playback() sees pending =3D (m - k) * runtime->period_size =
<=3D 0
and queues nothing, stalling playback permanently with prtd->in_flight =3D=
=3D 0.

Conversely, if a full ring is queued while prepared (prtd->in_flight =3D=3D
runtime->periods, prtd->queue_ptr =3D=3D runtime->buffer_size) and reset be=
fore
start, q6apm_dai_align_queue() sets prtd->queue_ptr =3D 0.  If the applicat=
ion
rewrites K < runtime->periods periods and starts the stream, .ack cannot
queue anything while prtd->in_flight =3D=3D runtime->periods.  When the fir=
st
in-flight buffer finishes, snd_pcm_period_elapsed_under_stream_lock()
advances runtime->status->hw_ptr from 0 to runtime->period_size before
calling q6apm_dai_queue_playback().  With prtd->queue_ptr (0) now behind
runtime->status->hw_ptr (runtime->period_size), ahead wraps past
runtime->buffer_size and q6apm_dai_align_queue() sets prtd->queue_ptr to
runtime->buffer_size (past appl_ptr =3D K * runtime->period_size), so the K
rewritten periods are never queued.

> =20
> +/* Queue the periods written and not yet queued. Called with the stream =
lock held. */
> +static int q6apm_dai_queue_playback(struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct q6apm_dai_rtd *prtd =3D runtime->private_data;
> +	snd_pcm_sframes_t ahead, pending;
> +	int i, ret, avail_periods;
> +
>  	/*
>  	 * ALSA calls .ack whenever appl_ptr moves, also after a stop and
[ ... ]
> @@ -461,37 +500,84 @@ static int q6apm_dai_ack(struct snd_soc_component *=
component, struct snd_pcm_sub
>  		return 0;
>  	}
> =20
> -	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
[ ... ]
> +	for (i =3D 0; i < avail_periods; i++) {
> +		ret =3D q6apm_write_async(prtd->graph, prtd->pcm_count, 0, 0, NO_TIMES=
TAMP);
> +		if (ret < 0) {
> +			dev_err(prtd->dev, "Error queuing playback buffer %d\n", ret);
> +			/*
> +			 * The core has moved on to its next buffer. Only a
> +			 * prepare brings queue_ptr back in step with it.
> +			 */
> +			snd_pcm_stop(substream, SNDRV_PCM_STATE_XRUN);
> +			return ret;
>  		}

[Severity: Medium]
What happens when snd_pcm_stop(substream, SNDRV_PCM_STATE_XRUN) is called
here while runtime->state is SNDRV_PCM_STATE_PREPARED or
SNDRV_PCM_STATE_PAUSED?

q6apm_dai_queue_playback() runs in both states, where
snd_pcm_running(substream) is false.  In sound/core/pcm_native.c,
snd_pcm_do_stop() only invokes the SNDRV_PCM_TRIGGER_STOP callback when
snd_pcm_running(substream) is true, while snd_pcm_post_stop()
unconditionally sets runtime->state to SNDRV_PCM_STATE_XRUN.  That leaves
prtd->state as Q6APM_STREAM_RUNNING, and when called from
SNDRV_PCM_STATE_PAUSED it also causes later snd_pcm_prepare() and
snd_pcm_drop() calls to miss their runtime->state =3D=3D SNDRV_PCM_STATE_PA=
USED
check and skip snd_pcm_pause(substream, false), leaking fe_pause and
be_pause on the DPCM runtimes.

[ ... ]

> +/*
> + * A PCM reset, which ALSA also runs at the end of every prepare, moves
> + * hw_ptr: modulo the buffer size on a running stream, to 0 otherwise.
> + * appl_ptr follows it without a call to .ack. The buffers the DSP holds
> + * stay with it, so keep queue_ptr in step with the ring.
> + */
> +static int q6apm_dai_ioctl(struct snd_soc_component *component,
> +			   struct snd_pcm_substream *substream,
> +			   unsigned int cmd, void *arg)
> +{
> +	struct snd_pcm_runtime *runtime =3D substream->runtime;
> +	struct q6apm_dai_rtd *prtd =3D runtime->private_data;
> +	int ret;
> +
> +	ret =3D snd_pcm_lib_ioctl(substream, cmd, arg);
> +	if (ret < 0 || cmd !=3D SNDRV_PCM_IOCTL1_RESET ||
> +	    substream->stream !=3D SNDRV_PCM_STREAM_PLAYBACK ||
> +	    q6apm_is_graph_in_push_pull_mode(prtd->graph))
> +		return ret;
> +
> +	guard(pcm_stream_lock_irq)(substream);
> +	q6apm_dai_align_queue(substream);
> +
> +	return 0;
>  }

[Severity: Medium]
Can an APM_CLIENT_EVENT_DATA_WRITE_DONE event race with the unlocked windows
around q6apm_dai_ioctl() during SNDRV_PCM_IOCTL_RESET?

During snd_pcm_reset(), the PCM stream lock is acquired and dropped four
separate times across snd_pcm_lib_ioctl_reset(), q6apm_dai_ioctl(),
snd_pcm_do_reset(), and snd_pcm_post_reset():

CPU0                                    CPU1 (kworker)
snd_pcm_reset()
  snd_pcm_do_reset()
    snd_pcm_lib_ioctl_reset()
      lock(pcm_stream_lock)
      runtime->status->hw_ptr %=3D
        runtime->buffer_size;
      unlock(pcm_stream_lock)
    q6apm_dai_ioctl()
      lock(pcm_stream_lock)
      q6apm_dai_align_queue()
      unlock(pcm_stream_lock)
                                        event_handler()
                                          lock(pcm_stream_lock)
                                          prtd->in_flight--;
                                          snd_pcm_period_elapsed_...()
                                          q6apm_dai_queue_playback()
                                            pending =3D hw_avail - ahead;
                                            q6apm_write_async()
                                            /* queues stale periods */
                                          unlock(pcm_stream_lock)
    lock(pcm_stream_lock)
    runtime->hw_ptr_base =3D 0;
    unlock(pcm_stream_lock)
  snd_pcm_post_reset()
    lock(pcm_stream_lock)
    runtime->control->appl_ptr =3D
      runtime->status->hw_ptr;
    unlock(pcm_stream_lock)

If event_handler() runs on a stream in its second lap before
snd_pcm_post_reset() updates runtime->control->appl_ptr,
runtime->status->hw_ptr and prtd->queue_ptr have already been reduced into
the first ring lap while runtime->control->appl_ptr still holds its
pre-reset value.  snd_pcm_playback_hw_avail(runtime) can then evaluate to up
to runtime->buffer_size instead of 0, causing q6apm_dai_queue_playback() to
queue stale DMA periods to the DSP and advance prtd->queue_ptr ahead of the
appl_ptr that snd_pcm_post_reset() is about to set.

Similarly, if event_handler() runs between snd_pcm_lib_ioctl_reset() and
snd_pcm_do_reset(), runtime->status->hw_ptr has already been reduced while
runtime->hw_ptr_base is still >=3D runtime->buffer_size, so
snd_pcm_update_hw_ptr0() sees a delta >=3D runtime->buffer_size and either
drops the hw_ptr update after prtd->in_flight was decremented or restores
runtime->status->hw_ptr to >=3D runtime->buffer_size right before
snd_pcm_do_reset() zeroes runtime->hw_ptr_base.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/LV5PR84MB40268B01B9=
F458296BE453ACA7782@LV5PR84MB4026.NAMPRD84.PROD.OUTLOOK.COM?part=3D2
