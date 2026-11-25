Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795612397;
	b=MTiql5U+ONiT9Bmg29R+edPgmeVhVzEWrgKWBgV1YOub3kqy/6pvzdxkMM3pmWdaFqVU
	 v5mPITTciYrRXThil8wig4YYdbzPPytBLkMTWzgeSvUQuOrlqVLutdXb77gJJ0wYomCjj
	 qF1KZqhs4MlAyGcTrFM/ZyXBVQLkr1pdGOd3tsKpB7WKl14/Wiz6Hg51zwF6QXJjIdCgt
	 1vGpKHoQq6SArntBf2np3fRfF+EsF4bOJXVkYVccf+QjTVmIcUaT/K1bdBZSnCDwDTxAy
	 cegzZjcVh3ft6d/TnXYlJ6/mJYyUy12Ksp/isG09+1CYEmSQVxHoRFAw7S6IrZCg+5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795612397;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=c3stE1BqP8XaKFrr5dMIMEzF+QzS2vPviY7Wx1fFXbU=;
	b=DfscOYorja27x1+gFvu9VAJcYjBUatQlHjP2/KQ3QFe2vioKNMy48a6lS5foQKl2DIPY
	 A5T5T/epDWGmt5XjDPvENPAVQxXBXsDufyCa9QraRB91ijbjkhPuqrWqfZEcN0ccypf0I
	 tkOd1HWr+rhLC4EtIjlY0INugCEDoOpynJRYUBw2sp12X7PLSLadMYpzeiEP9pbTsNRVI
	 K1iIMd9ibKNW2q9KogVoGjPFoiFJbzrBWybrQljQYmcm5e24QKfE67yfDy+znu3MbCm5w
	 uHLVqedDNwFdhKKOQCB/Xe9mEPuzU6FAIugh/bsJZ2nd/perRp5BfRPidm6AyHd8Ycw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gNSr7OaD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EA6606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 13:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gNSr7OaD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF521F000CA;
	Wed, 25 Nov 2026 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795612397;
	bh=c3stE1BqP8XaKFrr5dMIMEzF+QzS2vPviY7Wx1fFXbU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gNSr7OaDNLVyX0tCs3VleXUL3xR94hHld81JW2c8vkstCMJBuwofADoA0NUc0I+O2
	 kIwuYc87pvpnxhQ7TXfaJFflPoXqq+/6fy92piAmbACX1Y2DKD3tFZHz+qIuld2Oxn
	 FgCmx3Fs/3c08xgol3KEnrLS/fChT3ueubTnhsWRnzSKXRCjnopP14Ss8et54dfkwd
	 zswzUl55wXvhtXgWv1YRff9nYxLwl0nHGBdwCYIzzJgjDbhioibkvXic0bRkHCvdvv
	 RptFKuffgGLGKYqd/2IV1e9gFHVQUQPco4gAPvACYZkS/8laib8J7LJ+q19rkFJu9w
	 kYjK0Ghr629gg==
Message-ID: <sashiko-outbox-233470@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Re: ALSA: usb-audio: us144mkii: PCM close frees runtime
 while  playback/feedback URB completion and capture work still use it (UAF)
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <7b5aed28.578.1a212c08a97.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <12a3a26a.26361.1a1d4e1ad57.Coremail.xuhx@hust.edu.cn>
 <7b5aed28.578.1a212c08a97.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:13:16 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential
issues to consider:
- [High] ALSA: usb-audio: us144mkii: missing Signed-off-by trailer in
  commit
- [High] ALSA: usb-audio: us144mkii: cancelling stop_work wedges
  active_urbs
- [High] ALSA: usb-audio: us144mkii: killing feedback URBs on close
  stalls stream
- [High] ALSA: usb-audio: us144mkii: DMA buffer freed in do_hw_free()
  before close()
- [High] ALSA: usb-audio: us144mkii: unlocked resubmit in
  capture_urb_complete()
- [Medium] ALSA: usb-audio: us144mkii: stop_work cancelled before
  stop_pcm_work
- [Low] ALSA: usb-audio: us144mkii: missing Fixes trailer on UAF bug fix
- [Low] ALSA: usb-audio: us144mkii: missing kernel-doc for new
  tascam_card fields
--

commit 7f947095f0e3230e63ce245111703c733cee7d7a
Author: =E5=BE=90=E6=99=97=E7=BF=94 <xuhx@hust.edu.cn>

> ALSA: usb-audio: us144mkii: PCM close frees runtime while playback/feedba=
ck URB completion and capture work still use it (UAF)
>
> tascam_playback_close() and tascam_capture_close() only cleared the
> substream pointer; the ALSA release path then detached the substream
> and freed the snd_pcm_runtime while a playback/feedback URB
> completion or the capture work still used it.
>
> Make close() a real synchronous barrier:
>
>  - clear the active flag and the substream pointer under
>    tascam->lock, and load them under the same lock in the
>    completions, so a completion cannot observe a stale substream of
>    a stream being quiesced;
>  - usb_kill_urb() every playback/feedback URB on playback close and
>    every capture/feedback URB on capture close (the feedback
>    completion consumes BOTH runtimes); usb_kill_urb() waits for each
>    in-flight completion, including one already inside the giveback
>    path;
>  - serialize the completions' final usb_submit_urb() with the close
>    under tascam->lock, so a completion that raced the close cannot
>    resubmit a killed URB;
>  - cancel_work_sync() for capture_work/stop_work/stop_pcm_work;
>  - serialize the whole quiesce with tascam_disconnect()'s
>    tascam_free_urbs() through a new cleanup_lock plus a
>    tascam->disconnected flag, released before snd_card_free() waits
>    for the open PCM files.

[Severity: High]
The commit message is missing a Signed-off-by: trailer, which is required
under the Developer's Certificate of Origin.

[Severity: Low]
Since this fixes a use-after-free in the playback/feedback and capture
paths, should it include Fixes: trailers for those commits?

  Fixes: a2a2210f2c2e ("ALSA: usb-audio: us144mkii: Implement audio playbac=
k and feedback")
  Fixes: c1bb0c13e430 ("ALSA: usb-audio: us144mkii: Implement audio capture=
 and decoding")

> diff --git a/sound/usb/usx2y/us144mkii.c b/sound/usb/usx2y/us144mkii.c
> index 58ef23146f209..d2f2cd8bb3305 100644
> --- a/sound/usb/usx2y/us144mkii.c
> +++ b/sound/usb/usx2y/us144mkii.c
[ ... ]
> @@ -605,6 +617,10 @@ static void tascam_disconnect(struct usb_interface *=
intf)
>  		cancel_work_sync(&tascam->stop_pcm_work);
>  		timer_delete_sync(&tascam->error_timer);
>  		tascam_free_urbs(tascam);
> +		/* release before snd_card_free(): it waits for the open PCM
> +		 * files, and a close running during that wait takes this
> +		 * lock (and sees tascam->disconnected) */
> +		mutex_unlock(&tascam->cleanup_lock);
>  		snd_card_free(tascam->card);
>  		dev_idx--;
>  	}

[Severity: Medium]
Can tascam_stop_pcm_work_handler() re-arm tascam->stop_work after
cancel_work_sync(&tascam->stop_work) has already returned here and in
tascam_playback_close() / tascam_capture_close()?

tascam_stop_pcm_work_handler() calls snd_pcm_stop(), which invokes
tascam_pcm_trigger(SNDRV_PCM_TRIGGER_STOP) and calls
schedule_work(&tascam->stop_work).  If stop_pcm_work is already running
when stop_work is cancelled first, it can queue stop_work again before
cancel_work_sync(&tascam->stop_pcm_work) runs, leaving stop_work pending
after close() or after snd_card_free() frees tascam_card.  Cancelling
stop_pcm_work before stop_work avoids this.

> diff --git a/sound/usb/usx2y/us144mkii.h b/sound/usb/usx2y/us144mkii.h
> index 95c4341f038ad..4d049db675ef6 100644
> --- a/sound/usb/usx2y/us144mkii.h
> +++ b/sound/usb/usx2y/us144mkii.h
> @@ -229,6 +229,9 @@ struct tascam_card {
> =20
>  	/* --- Stream State --- */
>  	spinlock_t lock;
> +	struct mutex cleanup_lock;	/* serializes the close-time URB quiesce
> +					 * with disconnect()'s free path */
> +	bool disconnected;		/* disconnect() freed the URBs */
>  	atomic_t playback_active;
>  	atomic_t capture_active;
>  	atomic_t active_urbs;

[Severity: Low]
struct tascam_card has a kernel-doc comment header above it, so adding
cleanup_lock and disconnected without @cleanup_lock and @disconnected
entries in that comment block will trigger W=3D1 kernel-doc warnings.

> diff --git a/sound/usb/usx2y/us144mkii_capture.c b/sound/usb/usx2y/us144m=
kii_capture.c
> index d7cdf9e0f6851..0eba34cea5d1d 100644
> --- a/sound/usb/usx2y/us144mkii_capture.c
> +++ b/sound/usb/usx2y/us144mkii_capture.c
> @@ -35,8 +35,43 @@ static int tascam_capture_open(struct snd_pcm_substrea=
m *substream)
>  static int tascam_capture_close(struct snd_pcm_substream *substream)
>  {
>  	struct tascam_card *tascam =3D snd_pcm_substream_chip(substream);
> +	int i;
> +
> +	/* Serialize the quiesce below with disconnect()'s tascam_free_urbs()
> +	 * via the cleanup lock; after disconnect() has run there is nothing
> +	 * left to kill. */
> +	guard(mutex)(&tascam->cleanup_lock);
> +	if (!tascam->disconnected) {
> +		/* Clear the state under tascam->lock first (ordered against
> +		 * the completions' locked reads) before killing. */
> +		scoped_guard(spinlock_irqsave, &tascam->lock) {
> +			atomic_set(&tascam->capture_active, 0);
> +			tascam->capture_substream =3D NULL;
> +		}
> +
> +		/*
> +		 * Kill the capture URBs, and the feedback URBs, too: the
> +		 * feedback completion consumes the capture runtime
> +		 * (capture_rt->period_size, snd_pcm_period_elapsed()), so
> +		 * closing capture while playback stays open must quiesce
> +		 * the feedback path as well.  usb_kill_urb() waits for each
> +		 * in-flight completion -- the explicit synchronous barrier.
> +		 */
> +		for (i =3D 0; i < NUM_CAPTURE_URBS; i++)
> +			if (tascam->capture_urbs[i])
> +				usb_kill_urb(tascam->capture_urbs[i]);
> +		for (i =3D 0; i < NUM_FEEDBACK_URBS; i++)
> +			if (tascam->feedback_urbs[i])
> +				usb_kill_urb(tascam->feedback_urbs[i]);
> +	}

[Severity: High]
Does killing tascam->feedback_urbs[] here without restarting them stall an
active playback stream when capture is closed?

When usb_kill_urb() unlinks the feedback URBs, feedback_urb_complete()
bails out on -ENOENT without resubmitting (and any in-flight completion
with status 0 fails usb_submit_urb() with -EPERM while urb->reject is
set).  Because tascam_capture_close() never resubmits feedback_urbs[],
feedback_urb_complete() stops running altogether, halting
tascam->playback_frames_consumed updates and snd_pcm_period_elapsed() for
playback.  Symmetrically, closing playback while capture is running clears
tascam->playback_active and kills feedback_urbs[] in
tascam_playback_close(), which freezes capture_frames_processed and causes
capture's later tascam_pcm_trigger(SNDRV_PCM_TRIGGER_STOP) to do nothing
because it checks atomic_read(&tascam->playback_active).

[Severity: High]
Is capture_urb_complete() missing the tascam->lock serialization that this
patch adds to playback_urb_complete() and feedback_urb_complete()?

sound/usb/usx2y/us144mkii_capture.c:capture_urb_complete() {
    ...
	if (!tascam || !atomic_read(&tascam->capture_active))
		goto out;
    ...
	usb_get_urb(urb);
	usb_anchor_urb(urb, &tascam->capture_anchor);
	ret =3D usb_submit_urb(urb, GFP_ATOMIC);
	if (ret < 0) {
		dev_err_ratelimited(tascam->card->dev,
				    "Failed to resubmit capture URB: %d\n",
				    ret);
		usb_unanchor_urb(urb);
		usb_put_urb(urb);
		atomic_dec(
			&tascam->active_urbs); /* Decrement on failed resubmission */
		return;
	}
out:
	usb_put_urb(urb);
}

If capture_urb_complete() passes the unlocked capture_active check just
before tascam_capture_close() clears capture_active, it will still call
schedule_work(&tascam->capture_work) and usb_submit_urb().  If
tascam_capture_close() has already finished usb_kill_urb() on that URB
index, the URB is resubmitted after capture_active is 0; if usb_kill_urb()
is currently running on that URB, usb_submit_urb() fails with -EPERM and
the early return skips out: usb_put_urb(urb), leaking the URB reference
acquired when the completed transfer was submitted.
tascam_capture_work_handler() also still reads tascam->capture_substream
and substream->runtime at entry without holding tascam->lock.

> =20
> -	tascam->capture_substream =3D NULL;
> +	/* the capture work caches substream->runtime at entry and writes
> +	 * runtime->dma_area; it must not run after the detach below */
> +	cancel_work_sync(&tascam->capture_work);
> +	cancel_work_sync(&tascam->stop_work);
> +	/* a stop_pcm_work queued on feedback sync loss must not run after
> +	 * ALSA detached the substream and freed its runtime */
> +	cancel_work_sync(&tascam->stop_pcm_work);
> =20
>  	return 0;
>  }

[Severity: High]
Does cancelling tascam->stop_work here and in tascam_playback_close()
leave tascam->active_urbs permanently non-zero after closing a running
stream?

When a running stream is closed, snd_pcm_release_substream() calls
snd_pcm_drop() -> tascam_pcm_trigger(SNDRV_PCM_TRIGGER_STOP), which queues
tascam->stop_work, and then immediately calls .close().  None of the URB
completions decrement tascam->active_urbs when an URB is killed with
-ENOENT; tascam_stop_work_handler() is the only place that resets
atomic_set(&tascam->active_urbs, 0) (and kills all three URB anchors,
including capture_anchor on playback close and playback_anchor on capture
close).  When cancel_work_sync(&tascam->stop_work) cancels the pending
work item before it runs, tascam->active_urbs stays at 16 and every
subsequent SNDRV_PCM_TRIGGER_START fails with -EAGAIN at:

sound/usb/usx2y/us144mkii_pcm.c:tascam_pcm_trigger() {
    ...
	if (do_start) {
		if (atomic_read(&tascam->active_urbs) > 0) {
			dev_warn(tascam->card->dev,
				 "Cannot start, URBs still active.\n");
			return -EAGAIN;
		}
    ...
}

> diff --git a/sound/usb/usx2y/us144mkii_playback.c b/sound/usb/usx2y/us144=
mkii_playback.c
> index 7efaca0a64899..58de4721ee859 100644
> --- a/sound/usb/usx2y/us144mkii_playback.c
> +++ b/sound/usb/usx2y/us144mkii_playback.c
> @@ -35,8 +35,40 @@ static int tascam_playback_open(struct snd_pcm_substre=
am *substream)
>  static int tascam_playback_close(struct snd_pcm_substream *substream)
>  {
>  	struct tascam_card *tascam =3D snd_pcm_substream_chip(substream);
> +	int i;
> +
> +	/* Serialize the quiesce below with disconnect()'s tascam_free_urbs()
> +	 * via the cleanup lock; after disconnect() has run there is nothing
> +	 * left to kill. */
> +	guard(mutex)(&tascam->cleanup_lock);
> +	if (!tascam->disconnected) {
> +		/* Clear the state under tascam->lock first, so a completion
> +		 * that races this close observes the cleared flag before its
> +		 * final resubmit (see the completions) and cannot bring an
> +		 * URB back to life after the kill. */
> +		scoped_guard(spinlock_irqsave, &tascam->lock) {
> +			atomic_set(&tascam->playback_active, 0);
> +			tascam->playback_substream =3D NULL;
> +		}
> +
> +		/*
> +		 * Per-URB usb_kill_urb() is the explicit synchronous close
> +		 * barrier: it waits for each in-flight completion (including
> +		 * one that already passed the active/pointer checks).  The
> +		 * feedback completion also consumes the playback runtime.
> +		 */
> +		for (i =3D 0; i < NUM_PLAYBACK_URBS; i++)
> +			if (tascam->playback_urbs[i])
> +				usb_kill_urb(tascam->playback_urbs[i]);
> +		for (i =3D 0; i < NUM_FEEDBACK_URBS; i++)
> +			if (tascam->feedback_urbs[i])
> +				usb_kill_urb(tascam->feedback_urbs[i]);
> +	}

[Severity: High]
Is .close() too late to quiesce playback_urb_complete() and
tascam_capture_work_handler() against runtime->dma_area teardown?

CPU0                                  CPU1 (<softirq> / kworker)
snd_pcm_release_substream()
  snd_pcm_drop()
    tascam_pcm_trigger(STOP)
      schedule_work(&stop_work)
                                      playback_urb_complete()
                                        /* or tascam_capture_work_handler()=
 */
  do_hw_free()
    tascam_pcm_hw_free() /* no-op */
    snd_pcm_lib_free_pages()
      runtime->dma_area =3D NULL;
                                        memcpy(..., runtime->dma_area + ...)
                                          <-- NULL dereference / UAF
  substream->ops->close()
    tascam_playback_close()

Because the driver uses snd_pcm_set_managed_buffer_all() and has neither a
.sync_stop callback nor URB/work quiescing in tascam_pcm_hw_free(),
do_hw_free() frees the DMA buffer and sets runtime->dma_area =3D NULL before
tascam_playback_close() or tascam_capture_close() is reached (and userspace
can also trigger do_hw_free() directly via SNDRV_PCM_IOCTL_HW_FREE without
closing).  Stop synchronization needs to happen in .sync_stop or .hw_free
before snd_pcm_lib_free_pages() runs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/7b5aed28.578.1a212c=
08a97.Coremail.xuhx@hust.edu.cn?part=3D1
