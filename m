Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795345008;
	b=OX5cUEQxmrdLvrdwAfFpu6HpV2FobQ5OFAfdOS2oPvOnzAyoR2jHjEDUgNH8E6f9LO4q
	 P+i9muqb6Sxvs/n62YeGePvwdntSd4iSVYlIGhDWt9he3Gbg1h02N8FwNOuxhkBHW+QQt
	 pL4hHiwGgwhxysqJ/J3N50XIEU4xCGfEgsOdwbN1FI4sBD8UG4T+xWMrsjXi4wNXMWgwU
	 fl2aw5ic1XPrXvqye40M0gFD2hLa4UA5Y2GqZpzYxgMHajtwR2rbP2RYUT5Py4tjTE5d0
	 iJerf3kAwuhhSHG/8yfLYmuQE8KeJBz2aOYKu5uHjQMluZR42MmafJm21nAGRtvANQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795345008;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=l53VEG5jVvJy1FKWxq8l6cNlpTsQ6taBD0W9k6ohVU4=;
	b=ovSjoO22MxX4OmiaosJbxhmX5BRqE0YjfqfH6nL446ucMKIq4FU48sFPdcZWjvbPfK8r
	 OnlB+J0BKIqH9DIJPukef+xWay+eOCnelhPDhO8XYlX86nPScPGnrf41gZkWkVVw9sToj
	 lL97w842LBYZ5PXqv7nMyHLKxtMDT8wJ/IWds17yRCx6Aa9jMORwhVaz1j3xGgzT6zCYu
	 s+Q6IAX1xaJ7Sk30OA6lPQmRZRDJrOqKmkoQlMllgJrAKx0Kc+2a2zmIbeCaAzz4CQoRC
	 QCgejPlG/Tn/1j5XyXdg4lmCdAQ6NheYnicujYwS93sIlOd8gKFe+xTknOOGNUgesZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJiUaKpy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86594606A320
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 10:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NJiUaKpy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DB91F000C0;
	Sun, 22 Nov 2026 10:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795345008;
	bh=l53VEG5jVvJy1FKWxq8l6cNlpTsQ6taBD0W9k6ohVU4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NJiUaKpyKfOFPFsgitb8Ye5LF4r0fHo0CJz2tDFan9V8h/TI7+XB99m3p4O8pIt02
	 RgcfjSo8NTFWnOW06OLf62p62i0147wnUpqR8d+celbzn5YA3rmj3kanqizkEY8DVf
	 5UB8LMHk57CMjC7I3tCgG6KkTqfc60cZfy5lOTarE8IG2Th6h9g3DLeN0uiPK+Lfd4
	 AEYbr33vixffFyLTMLnMjZtCOwqZxReFjCkai22brfXDMWptQnrJ+4vEASr6+V/Xht
	 L2Zhcp1hphE6quSBj+bup4p0eHQKbZ8CJNlMeRqi39r8zXk5lJMuhGsaHEGZrLUyP7
	 oVReHZ/G+30vQ==
Message-ID: <sashiko-outbox-227902@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6] ALSA: line6: Stop URBs synchronously via sync_stop
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261122104039.7160-1-25031212351@stu.xidian.edu.cn>
References: <87a4n1702t.wl-tiwai@suse.de>
 <20261122104039.7160-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 10:56:47 +0000
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
- [Medium] ALSA: line6: missing URB sync in snd_line6_prepare() and
  __line6_pcm_release()
- [Medium] ALSA: line6: race between line6_kill_audio_urbs() and
  line6_stream_start()
--

commit 20c8f40e0e74158190f3553ea4d2067649a84199
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

ALSA: line6: Stop URBs synchronously via sync_stop callback

This commit replaces the polling loop in line6_wait_clear_audio_urbs()
with line6_kill_audio_urbs(), which marks active URBs under the stream
lock and waits for them with usb_kill_urb(), and wires it up to the PCM
sync_stop callback.

> diff --git a/sound/usb/line6/pcm.c b/sound/usb/line6/pcm.c
> index d17baf7761c67..34d68a9ce3285 100644
> --- a/sound/usb/line6/pcm.c
> +++ b/sound/usb/line6/pcm.c
> @@ -109,29 +109,51 @@ static void line6_unlink_audio_urbs(struct snd_line=
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
> + * longer referenced by the host controller.  This function must be
> + * called from a sleepable context.
> + *
> + * When @idle_only is set, nothing is done if some stream is still runni=
ng
> + * on @pcms, and only the URBs that are active at that moment are killed,
> + * so that a concurrently started stream is never stopped.
> + */
> +static void line6_kill_audio_urbs(struct snd_line6_pcm *line6pcm,
> +				  struct line6_pcm_stream *pcms, bool idle_only)
>  {
> -	int timeout =3D HZ;
> +	unsigned long active;
>  	int i;
> -	int alive;
> =20
> -	do {
> -		alive =3D 0;
> -		for (i =3D 0; i < line6pcm->line6->iso_buffers; i++) {
> -			if (test_bit(i, &pcms->active_urbs))
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
> +	/* May be called when the URB creation failed during the probe */
> +	if (!pcms->urbs)
> +		return;
> +
> +	scoped_guard(spinlock_irqsave, &pcms->lock) {
> +		if (idle_only && pcms->running)
> +			return;
> +		active =3D pcms->active_urbs;
> +		for_each_set_bit(i, &active, line6pcm->line6->iso_buffers)
> +			set_bit(i, &pcms->unlink_urbs);
> +	}
> +
> +	for_each_set_bit(i, &active, line6pcm->line6->iso_buffers)
> +		if (pcms->urbs[i])
> +			usb_kill_urb(pcms->urbs[i]);
> +
> +	/*
> +	 * Drop the unlink marks left on URBs that were completed and not
> +	 * resubmitted, so that a later stream start can submit the URBs
> +	 * again.  An URB that is still active keeps its mark.
> +	 */
> +	scoped_guard(spinlock_irqsave, &pcms->lock) {
> +		for_each_set_bit(i, &pcms->unlink_urbs,
> +				 line6pcm->line6->iso_buffers)
> +			if (!test_bit(i, &pcms->active_urbs))
> +				clear_bit(i, &pcms->unlink_urbs);
> +	}
>  }

[Severity: Medium]
Can a stream started concurrently while line6_kill_audio_urbs() is inside
the usb_kill_urb() loop still end up with no active URBs?

snd_line6_trigger(SNDRV_PCM_TRIGGER_START) calls line6_stream_start()
under pcms->lock without holding state_mutex:

sound/usb/line6/pcm.c:line6_stream_start() {
	guard(spinlock_irqsave)(&pstr->lock);
	if (!test_and_set_bit(type, &pstr->running) &&
	    !(pstr->active_urbs || pstr->unlink_urbs)) {
		pstr->count =3D 0;
		/* Submit all currently available URBs */
		if (direction =3D=3D SNDRV_PCM_STREAM_PLAYBACK)
			ret =3D line6_submit_audio_out_all_urbs(line6pcm);
		else
			ret =3D line6_submit_audio_in_all_urbs(line6pcm);
	}
}

Because line6_kill_audio_urbs() drops pcms->lock before calling
usb_kill_urb(), a concurrent trigger on an already-prepared PCM substream
can interleave while another caller (such as line6_pcm_acquire() or
capture's snd_line6_sync_stop() on a LINE6_CAP_IN_NEEDS_OUT device) is
killing leftover URBs on the same stream:

CPU0                                  CPU1
line6_kill_audio_urbs(..., true)
  lock(&pcms->lock)
  active =3D pcms->active_urbs
  set_bit(i, &pcms->unlink_urbs)
  unlock(&pcms->lock)
                                      snd_line6_trigger(START)
                                        line6_stream_start()
                                          lock(&pcms->lock)
                                          test_and_set_bit(..., &pcms->runn=
ing)
                                          /* active_urbs || unlink_urbs !=
=3D 0 */
                                          /* skips URB submission */
                                          unlock(&pcms->lock)
  usb_kill_urb(pcms->urbs[i])
    /* callback sees unlink_urbs */
    /* does not resubmit */

If instead the unlinking URBs finish their callbacks before the
usb_kill_urb() loop reaches index i, line6_stream_start() sees
active_urbs and unlink_urbs both zero and submits the shared
pcms->urbs[] pool for the new stream, after which the remaining
usb_kill_urb(pcms->urbs[i]) calls kill the newly submitted URBs.  In both
cases pcms->running has the new stream's bit set, but all URBs are dead.

[ ... ]

> @@ -592,6 +611,27 @@ int line6_init_pcm(struct usb_line6 *line6,
>  }
>  EXPORT_SYMBOL_GPL(line6_init_pcm);
> =20
> +/* common PCM sync_stop callback */
> +int snd_line6_sync_stop(struct snd_pcm_substream *substream)
> +{
> +	struct snd_line6_pcm *line6pcm =3D snd_pcm_substream_chip(substream);
> +	struct line6_pcm_stream *pstr =3D get_stream(line6pcm, substream->strea=
m);
> +
> +	guard(mutex)(&line6pcm->state_mutex);
> +	line6_kill_audio_urbs(line6pcm, pstr, true);
> +	/*
> +	 * A capture stream may use the playback stream as a helper, and
> +	 * snd_line6_trigger() stops it together with the capture stream.
> +	 * Stop the leftover playback URBs here as well, so that the helper
> +	 * stream can be restarted at the next trigger.
> +	 */
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE &&
> +	    (line6pcm->line6->properties->capabilities &
> +	     LINE6_CAP_IN_NEEDS_OUT))
> +		line6_kill_audio_urbs(line6pcm, &line6pcm->out, true);
> +	return 0;
> +}
> +
>  /* prepare pcm callback */
>  int snd_line6_prepare(struct snd_pcm_substream *substream)
>  {
> @@ -599,8 +639,12 @@ int snd_line6_prepare(struct snd_pcm_substream *subs=
tream)
>  	struct line6_pcm_stream *pstr =3D get_stream(line6pcm, substream->strea=
m);
> =20
>  	guard(mutex)(&line6pcm->state_mutex);
> -	if (!pstr->running)
> -		line6_wait_clear_audio_urbs(line6pcm, pstr);
> +	/*
> +	 * sync_stop() is called only after this substream itself was
> +	 * stopped; other stream types sharing the stream (monitor, impulse
> +	 * or the capture helper) may have left URBs unlinking.
> +	 */
> +	line6_kill_audio_urbs(line6pcm, pstr, true);

[Severity: Medium]
Should snd_line6_prepare() also kill leftover URBs on &line6pcm->out when
preparing a capture stream on a LINE6_CAP_IN_NEEDS_OUT device, and should
__line6_pcm_release() do the same when pstr->opened remains non-zero?

As the comment notes, snd_line6_sync_stop() is only called when the
capture substream itself was stopped.  If another stream sharing
line6pcm->out (such as monitor, impulse, or playback) just stopped and
left URBs unlinking on line6pcm->out, preparing capture only kills URBs
on pstr (&line6pcm->in).  The subsequent capture start trigger then calls
line6_stream_start() for LINE6_STREAM_CAPTURE_HELPER on line6pcm->out
while out.active_urbs or out.unlink_urbs is still non-zero, skipping
playback URB submission.

Similarly, __line6_pcm_release() stops the stream with
line6_stream_stop() (which only runs the asynchronous
line6_unlink_audio_urbs()) and then calls line6_buffer_release(), which
only calls line6_kill_audio_urbs() when pstr->opened becomes 0.  If a PCM
substream is already open and in SNDRV_PCM_STATE_PREPARED (holding
BIT(LINE6_STREAM_PCM) or BIT(LINE6_STREAM_CAPTURE_HELPER) in
pstr->opened) when monitor or impulse is released via
line6_pcm_release(), the unlinking URBs are not synchronously killed
there, and starting the already-prepared PCM substream goes straight to
snd_line6_trigger(SNDRV_PCM_TRIGGER_START) without calling
snd_line6_prepare() or snd_line6_sync_stop().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122104039.7160=
-1-25031212351@stu.xidian.edu.cn?part=3D1
