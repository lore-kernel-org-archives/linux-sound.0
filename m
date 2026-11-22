Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795339210;
	b=pv3SYJ7mxcGunIJquadOsUfQR5Y6aXnf2PyTkDHa10co/IZ71H5gJaf8XVcf8UjDFTnR
	 lkiIfNqB09XftZNaq7KrHCm7jh6dgftoMQyPfkkncJ1IT1/IO7rvOZCFe4UEM+s0wEIUA
	 LGahFN1ljd60oUL3+V1JKaLG4rsLtTH5bBnNCxmrektwOoXcXhRAsjBoOwuqiOQ0faBeK
	 HRlRO7dtqVueYr97mb2O2LgMwLa4KUwjVtod0g8JVvh51E0cKQtrZ8wwJJi5vvpVLBRmh
	 AcOge5+t0JbFSffilf4ZPtX/OaNzZWjCuYsBm6HbFXbw/XklwWEn0Ssx9Rd3EESB3Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339210;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eJyvDwdOa+78F7CazJPfn+FSQMl5wBjmPxh9UItn2Nw=;
	b=dBMANEXyi680cOd/gwoK1QjOR0eZM2KwYFmANYPUzfKMVdUxZ1gF5eK+P+p+N8wKFrZk
	 HLc2nm4w3JCLmUGHCrDEQFYC8FlQ57489NH6jSwR9L/h/dRn2+nwpT+LYIFFzkVjnewWJ
	 EylaaLXxxN3JDnOt59pRo4yadBE9sWDKS9yvaie4dmRNrc1lgPu+9JVWifkVR++3n0PL/
	 WTE38JVx42WmLWAFrNF5cOaXFG12g33VxpN48Msv7oEMBpyyjThUJ/enfaSyLwwsQ5/g5
	 Uq0rlyIh0wbGsgopJ98sYblxYSmzhJxcqFPnvn9h+tb1iNKPh9A5YCdAnWvRCShUbhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jBuTzWwF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDED4606A320
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 09:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jBuTzWwF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B5101F000C0;
	Sun, 22 Nov 2026 09:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795339210;
	bh=eJyvDwdOa+78F7CazJPfn+FSQMl5wBjmPxh9UItn2Nw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jBuTzWwF2PfqVpww8s4LwM/51GjfxooAkrrk3M6CVsfXGFVWGolD4KnWa6iW5ks5L
	 xU2uIo3r/VHfhNi4IHEskuUVoiBQ3fDBbeIwnabnB1B/884Xsoz6t85v0IS3+3Rsgn
	 J0o3SnQBInTodOaVWxsSwtmVe208LI6m4vmODntm5OKHylqbyUyOj5lI9EZcL39ED0
	 r5Es08FARcJw8S5cH39ndeEKXCY278tJwunwv18tqwEFyaFizGi9+dVkx9fDwIYGpH
	 YmLOdXO+PiJNXHhTModXXy/x4P5Q1hPtvfsfmoJkgE2UU6Rd4IFJ82PQ9Iy3uHToLo
	 j8X9HqQj8fpbg==
Message-ID: <sashiko-outbox-227847@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] ALSA: line6: Stop URBs synchronously via sync_stop
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "YuanZhe Liu" <25031212351@stu.xidian.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261122090454.6217-1-25031212351@stu.xidian.edu.cn>
References: <87a4n1702t.wl-tiwai@suse.de>
 <20261122090454.6217-1-25031212351@stu.xidian.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 09:20:09 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] ALSA: line6: snd_line6_sync_stop() kills URBs while shared
  stream is running
- [Medium] ALSA: line6: snd_line6_sync_stop() misses helper playback
  stream on capture stop
- [Medium] ALSA: line6: unsynchronized URB unlink when pstr->opened
  remains non-zero
- [Medium] ALSA: line6: NULL pointer dereference in
  line6_kill_audio_urbs() on probe error
--

commit 03ea0b5c4363156759700a216da2dd67752857be
Author: YuanZhe Liu <25031212351@stu.xidian.edu.cn>

ALSA: line6: Stop URBs synchronously via sync_stop callback

This commit replaces line6_wait_clear_audio_urbs() with a synchronous
line6_kill_audio_urbs() helper and wires it into the PCM sync_stop
callback while removing the URB wait calls from snd_line6_prepare() and
line6_pcm_acquire().

> diff --git a/sound/usb/line6/pcm.c b/sound/usb/line6/pcm.c
> index d17baf7761c67..dc850aa2ebd09 100644
> --- a/sound/usb/line6/pcm.c
> +++ b/sound/usb/line6/pcm.c
> @@ -109,29 +109,33 @@ static void line6_unlink_audio_urbs(struct snd_line=
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

[Severity: Medium]
Can pcms->urbs[i] dereference a NULL pcms->urbs pointer when
line6_init_pcm() fails during probe?

line6_init_pcm() publishes line6->line6pcm before checking
max_packet_size_in/out and before allocating out.urbs and in.urbs.  If one
of those steps fails, line6_probe() unwinds via line6_disconnect() ->
line6_pcm_disconnect() -> line6_kill_audio_urbs() while pcms->urbs is still
NULL.  Checking if (!pcms->urbs) before the loop (as cleanup_urbs() does)
would avoid this.

[ ... ]

> @@ -337,8 +341,6 @@ int line6_pcm_acquire(struct snd_line6_pcm *line6pcm,=
 int type, bool start)
>  		ret =3D line6_buffer_acquire(line6pcm, pstr, dir, type);
>  		if (ret < 0)
>  			goto error;
> -		if (!pstr->running)
> -			line6_wait_clear_audio_urbs(line6pcm, pstr);
>  	}

[Severity: Medium]
Does dropping the !pstr->running synchronization from line6_pcm_acquire()
and snd_line6_prepare() leave URBs only asynchronously unlinked when
pstr->opened remains non-zero?

When a monitor or impulse stream is stopped via line6_pcm_release(),
__line6_pcm_release() calls line6_stream_stop() (which only runs the
unlocked, asynchronous line6_unlink_audio_urbs()) and then
line6_buffer_release(), which only calls line6_kill_audio_urbs() when
pstr->opened reaches 0.  If an idle PCM substream already holds a bit in
pstr->opened (for example, snd_line6_capture_open() sets
LINE6_STREAM_CAPTURE_HELPER in both out.opened and in.opened),
line6_kill_audio_urbs() is skipped and ALSA core will not invoke
snd_line6_sync_stop() because the PCM substream itself was not running.

If the stream is then started again via line6_pcm_acquire() or
snd_line6_trigger() while active_urbs or unlink_urbs is still non-zero
from the asynchronous unlink, line6_stream_start() sees
(pstr->active_urbs || pstr->unlink_urbs) non-zero, sets the bit in
pstr->running without submitting URBs, and leaves the stream stalled once
the unlinking URBs complete:

sound/usb/line6/pcm.c:line6_stream_start() {
	...
	if (!test_and_set_bit(type, &pstr->running) &&
	    !(pstr->active_urbs || pstr->unlink_urbs)) {
		pstr->count =3D 0;
		ret =3D line6_submit_audio_urbs(line6pcm, pstr);
	}
	...
}

[ ... ]

> @@ -592,15 +592,23 @@ int line6_init_pcm(struct usb_line6 *line6,
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
> +	line6_kill_audio_urbs(line6pcm, pstr);
> +	return 0;
> +}

[Severity: High]
Does snd_line6_sync_stop() kill in-flight URBs on pstr even when another
stream type in pstr->running is still using the stream?

pstr->running is a bitmask shared across LINE6_STREAM_PCM,
LINE6_STREAM_MONITOR, LINE6_STREAM_IMPULSE, and
LINE6_STREAM_CAPTURE_HELPER.  When a PCM substream stops,
line6_stream_stop() clears LINE6_STREAM_PCM and returns early if another
bit in pstr->running is still set so the URBs keep running:

sound/usb/line6/pcm.c:line6_stream_stop() {
	scoped_guard(spinlock_irqsave, &pstr->lock) {
		clear_bit(type, &pstr->running);
		if (pstr->running)
			return;
	}

	line6_unlink_audio_urbs(line6pcm, pstr);
}

Because snd_line6_sync_stop() does not check if (!pstr->running) before
calling line6_kill_audio_urbs(), stopping a PCM playback or capture stream
(on drop, prepare, hw_free, or close) kills the URBs while software
monitoring (enabled at startup on TonePort devices) or capture on
LINE6_CAP_IN_NEEDS_OUT devices is still active.  With the other stream's
bit still set in pstr->running, later line6_stream_start() calls for that
type see test_and_set_bit(type, &pstr->running) already set and cannot
restart the URBs.

[Severity: Medium]
On devices with LINE6_CAP_IN_NEEDS_OUT, does snd_line6_sync_stop() also
need to synchronize &line6pcm->out when stopping a capture substream?

In snd_line6_trigger(), stopping SNDRV_PCM_STREAM_CAPTURE on a
LINE6_CAP_IN_NEEDS_OUT device also stops LINE6_STREAM_CAPTURE_HELPER on
SNDRV_PCM_STREAM_PLAYBACK via line6_stream_stop(), which only performs an
asynchronous line6_unlink_audio_urbs() on &line6pcm->out.  Because
snd_line6_sync_stop() only kills URBs on get_stream(line6pcm,
substream->stream) (&line6pcm->in) and the wait in snd_line6_prepare() is
removed, re-preparing and restarting capture while &line6pcm->out URBs are
still unlinking causes line6_stream_start() for
LINE6_STREAM_CAPTURE_HELPER to see active_urbs or unlink_urbs non-zero and
skip submitting playback URBs, stalling capture.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261122090454.6217=
-1-25031212351@stu.xidian.edu.cn?part=3D1
