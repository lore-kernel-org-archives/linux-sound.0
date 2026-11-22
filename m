Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341072;
	b=TegJuLH5UFmveNYMIjF0R4oFwgh1EaV/pCGXpcZX3vr64sdWT8ECuymAI8PXMRXTYyeE
	 EXK8EMzkuBC/OA87sppIHHbvNV0+AdJ4sU6DusVd83KsxXRUmbsnVyKf8p0oq5MaTNSst
	 qH+E/7puv2s18KOcdqc1dwwhGPsGabDwQASdrQBajQkhR1FMn6TMDMP5vNeaeJoNoNLZn
	 bnv3NrA8S7ajCKcN9k8h9esaCUQEbQMywoVuCCM4LwEtmv2CvfVkBYMNeGE+5GFA+Wvt7
	 1Cb8Vk8k2xKcWfCWqsd/G6PjrBErIk/O4kG+MEETX1pOvuIugJbgXK0CqGMg0VFgwiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341072;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JyZJchwJlSP8RLH0SHZKWiJ79/Ljok6L2Lw8ymce+Hk=;
	b=fIyF4xoyq0Hr2FVf3v82mIPvmtm3L6uEtLOeVGWUjX2jMmwVi7Q56rPA5LneOpHUvqDW
	 IqnH/pcpmxYqxWsXAws2f/QbWRSXhAkRryseArjLViL77bWB9tdw/sdvAz5lPBSh2cKT7
	 e6qWVzy+M/d0iYCqZXCdhVU6xDi4gBNuGsyWqoghEBb+hxEbqYG6FsqylkZUt5vw5Y5bP
	 IoTCZCKNBYz4YqU1a6TIwKnBu8qtEGgGxhNJhmuJB/K8SvO9prlpVcSRKhk72rs+EB3O8
	 E9S2/DvRAsNrBtp636/oX5IZPetrWzYbLddBl5ZK0cNrbQgAheNWknfAuJU0oOhvnDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KdmUyQDQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FDE606A320
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 09:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KdmUyQDQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF141F000C4;
	Sun, 22 Nov 2026 09:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795341072;
	bh=JyZJchwJlSP8RLH0SHZKWiJ79/Ljok6L2Lw8ymce+Hk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KdmUyQDQ/3BcZ6wB583lo4glDUd33/KeAziIqq2ZUTEmrVeXeG30lpLMZFNinENeF
	 E8KrrnyIBDBaUeEsyJLCkKo01frc6a1OQxzOjAgJRB99Uvn3HIrLmkqfAIt7MwH6gv
	 GwT9Z3RFyEmjKBgRHStTt9trYSp576ozDalvcLTskmtxysRLCGlvNAY+agbD5PQAdz
	 L8Lcy0tHV4bhQHXD8cudCjBEbdaT3Pt8LE7sw3GCJDGTRevxTjbqVmchTVFGmiCZbl
	 xyuIjjoAHmyMEt04p9Ui516AGLmpFJBIYoCCHS9kJhVHPiNZxPZ5AC3SSb6wEyDRkM
	 EtKrLBONmqiTg==
Message-ID: <sashiko-outbox-227863@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] ALSA: line6: Stop URBs synchronously via sync_stop
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261122093454.14422-1-25031212351@stu.xidian.edu.cn>
References: <87a4n1702t.wl-tiwai@suse.de>
 <20261122093454.14422-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 09:51:12 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ALSA: line6: missing URB sync on shared stream stop before
  snd_line6_prepare()
- [Medium] ALSA: line6: race between line6_kill_audio_urbs() and
  snd_line6_trigger()
--

commit 61dfc4a9ef88afb11aedb1393a3ece64bb26365b
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

ALSA: line6: Stop URBs synchronously via sync_stop callback

This commit replaces the polling in line6_wait_clear_audio_urbs() with
synchronous URB termination via usb_kill_urb() in line6_kill_audio_urbs(),
wires it up to the PCM sync_stop callback, and drops the wait from
snd_line6_prepare().

> diff --git a/sound/usb/line6/pcm.c b/sound/usb/line6/pcm.c
> index d17baf7761c67..16e6f9900514b 100644
> --- a/sound/usb/line6/pcm.c
> +++ b/sound/usb/line6/pcm.c
> @@ -109,29 +109,37 @@ static void line6_unlink_audio_urbs(struct snd_line=
6_pcm *line6pcm,
>  }
> =20
>  /*
> -	Wait until unlinking of all currently active URBs has been finished.
> -*/
> -static void line6_wait_clear_audio_urbs(struct snd_line6_pcm *line6pcm,
> -					struct line6_pcm_stream *pcms)
> + * Mark all currently active URBs for unlinking and kill them.
> + *
> + * The unlink bit is set under the stream lock, so the completion
> + * callbacks cannot resubmit these URBs any longer.  usb_kill_urb() then
> + * waits for the giveback of every URB, hence the stream buffer is no
> + * longer referenced by the host controller.  The unlink marks are
> + * cleared afterwards, so that a later stream start can submit the URBs
> + * again.  This function must be called from a sleepable context.
> + */
> +static void line6_kill_audio_urbs(struct snd_line6_pcm *line6pcm,
> +				  struct line6_pcm_stream *pcms)
>  {
> -	int timeout =3D HZ;
>  	int i;
> -	int alive;
> =20
> -	do {
> -		alive =3D 0;
> -		for (i =3D 0; i < line6pcm->line6->iso_buffers; i++) {
> +	/* May be called when the URB creation failed during the probe */
> +	if (!pcms->urbs)
> +		return;
> +
> +	scoped_guard(spinlock_irqsave, &pcms->lock) {
> +		for (i =3D 0; i < line6pcm->line6->iso_buffers; i++)
>  			if (test_bit(i, &pcms->active_urbs))
> -				alive++;
> -		}
> -		if (!alive)
> -			break;
> -		set_current_state(TASK_UNINTERRUPTIBLE);
> -		schedule_timeout(1);
> -	} while (--timeout > 0);
> -	if (alive)
> -		dev_err(line6pcm->line6->ifcdev,
> -			"timeout: still %d active urbs..\n", alive);
> +				set_bit(i, &pcms->unlink_urbs);
> +	}
> +
> +	for (i =3D 0; i < line6pcm->line6->iso_buffers; i++)
> +		if (pcms->urbs[i])
> +			usb_kill_urb(pcms->urbs[i]);
> +
> +	scoped_guard(spinlock_irqsave, &pcms->lock) {
> +		pcms->unlink_urbs =3D 0;
> +	}
>  }

[Severity: Medium]
Can line6_kill_audio_urbs() race with a concurrent snd_line6_trigger() on
a shared line6_pcm_stream?

line6_pcm_acquire() (called by snd_line6_capture_open() for both out and
in, and by mixer controls for monitor/impulse) and capture's
snd_line6_sync_stop() (which also kills URBs on line6pcm->out for
LINE6_CAP_IN_NEEDS_OUT devices) hold only line6pcm->state_mutex, check
!pstr->running outside pstr->lock, and call line6_kill_audio_urbs().
Meanwhile, an already-prepared PCM substream on that direction can enter
snd_line6_trigger(SNDRV_PCM_TRIGGER_START) -> line6_stream_start(), which
only takes pstr->lock:

CPU0                                  CPU1
snd_line6_capture_open()
  line6_pcm_acquire()
    lock(&line6pcm->state_mutex)
    if (!out.running)
      line6_kill_audio_urbs(..., &out)
        lock(&out.lock)
        /* active_urbs =3D=3D 0 */
        unlock(&out.lock)
                                      snd_line6_trigger(PLAYBACK, START)
                                        line6_stream_start(..., &out)
                                          lock(&out.lock)
                                          set_bit(..., &out.running)
                                          line6_submit_audio_out_all_urbs()
                                          unlock(&out.lock)
        for (i =3D 0; i < iso_buffers; i++)
          usb_kill_urb(out.urbs[i])  <-- kills newly submitted playback URBs

Because line6_kill_audio_urbs() does not recheck pcms->running under
pcms->lock and drops pcms->lock across the unconditional usb_kill_urb()
loop, a concurrent playback start either has its newly submitted URBs
killed (leaving playback running with zero active URBs) or sees
active_urbs || unlink_urbs non-zero in line6_stream_start() and skips URB
submission.  In addition, if a stream starts and stops before the final
pcms->unlink_urbs =3D 0 assignment, its newly set unlink bits are cleared
and completion callbacks can resubmit URBs after stop.

[ ... ]

> @@ -592,15 +598,36 @@ int line6_init_pcm(struct usb_line6 *line6,
>  }
>  EXPORT_SYMBOL_GPL(line6_init_pcm);
> =20
> -/* prepare pcm callback */
> -int snd_line6_prepare(struct snd_pcm_substream *substream)
> +/* common PCM sync_stop callback */
> +int snd_line6_sync_stop(struct snd_pcm_substream *substream)
>  {
>  	struct snd_line6_pcm *line6pcm =3D snd_pcm_substream_chip(substream);
>  	struct line6_pcm_stream *pstr =3D get_stream(line6pcm, substream->strea=
m);
> =20
>  	guard(mutex)(&line6pcm->state_mutex);
>  	if (!pstr->running)
> -		line6_wait_clear_audio_urbs(line6pcm, pstr);
> +		line6_kill_audio_urbs(line6pcm, pstr);
> +	/*
> +	 * A capture stream may use the playback stream as a helper, and
> +	 * snd_line6_trigger() stops it together with the capture stream.
> +	 * Stop the leftover playback URBs here as well, so that the helper
> +	 * stream can be restarted at the next trigger; skip it while
> +	 * another playback stream is still running.
> +	 */
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE &&
> +	    (line6pcm->line6->properties->capabilities &
> +	     LINE6_CAP_IN_NEEDS_OUT) &&
> +	    !line6pcm->out.running)
> +		line6_kill_audio_urbs(line6pcm, &line6pcm->out);
> +	return 0;
> +}
> +
> +/* prepare pcm callback */
> +int snd_line6_prepare(struct snd_pcm_substream *substream)
> +{
> +	struct snd_line6_pcm *line6pcm =3D snd_pcm_substream_chip(substream);
> +
> +	guard(mutex)(&line6pcm->state_mutex);

[Severity: Medium]
Does dropping the !pstr->running URB synchronization from
snd_line6_prepare() leave unlinking URBs unsynchronized when another
stream sharing pstr stops after this substream?

snd_pcm_sync_stop() only invokes snd_line6_sync_stop() when
substream->runtime->stop_operating is set, and clears stop_operating
immediately.  Two cases then reach snd_line6_prepare() and
line6_stream_start() with pstr->running =3D=3D 0 without ever calling
line6_kill_audio_urbs():

1. A PCM substream stops first while another stream type (such as
   LINE6_STREAM_MONITOR, LINE6_STREAM_IMPULSE, or a companion PCM/capture
   helper stream) is still running on pstr.  Its snd_line6_sync_stop()
   consumes stop_operating but skips line6_kill_audio_urbs() because
   pstr->running is still non-zero.  When the other stream later stops
   (for example via XRUN in trigger(STOP) -> line6_stream_stop(), or via
   __line6_pcm_release()), pstr->running drops to 0 with only an
   asynchronous line6_unlink_audio_urbs() call.
2. LINE6_STREAM_MONITOR or LINE6_STREAM_IMPULSE is stopped via
   __line6_pcm_release() while an open PCM substream holds a bit in
   pstr->opened (such as BIT(LINE6_STREAM_PCM) after hw_params or
   BIT(LINE6_STREAM_CAPTURE_HELPER) after capture open).
   line6_buffer_release() skips line6_kill_audio_urbs() because
   pstr->opened is non-zero, and stopping monitor/impulse does not set
   stop_operating on the PCM substream.

When the PCM substream is then prepared and started, line6_stream_start()
can see pstr->active_urbs || pstr->unlink_urbs still non-zero:

sound/usb/line6/pcm.c:line6_stream_start() {
	guard(spinlock_irqsave)(&pstr->lock);
	if (!test_and_set_bit(type, &pstr->running) &&
	    !(pstr->active_urbs || pstr->unlink_urbs)) {
		pstr->count =3D 0;
		...
}

line6_stream_start() sets BIT(type) in pstr->running and skips URB
submission, leaving the stream stalled with no active URBs once the
unlinked URBs complete (or allowing an URB that raced with the unlocked
line6_unlink_audio_urbs() scan to keep resubmitting while stopped).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122093454.1442=
2-1-25031212351@stu.xidian.edu.cn?part=3D1
