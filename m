Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611806;
	b=Z9IaNVFKUv6GjPR1nyCzGECfC9ctOrCmrd0EwNbu6AgT/mK0TTus82a+3yp74+ZtCVu8
	 NXaAor7lvUwQbkz9z8haNwMFPMGJtGcdZJ+CMfyZYC7m4QsRgTXDVhr/Z6ceUjs3szfiY
	 lydsN1DAcytmB+optXFPQ1LekCS4cS9Ihgurw8gU3KY3yZ3DwtlUA5pm7ZPBxRo1r9cAa
	 4WQmtc+U3PYRlTY52GFfwZ8Vav4KvpOMmjrflMnCvuLZVDRyWELG6ugI6pHkGSzk9f3nn
	 Uhsr+b+OYAvjUihtD7LsDvnmnMKLb2SljxOL7ja6LGa49Pp2l1A2AWxys8bDpHP4ryA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611806;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dxGtd41JA8hauGjx79wcdXzKK3OXPhB42SyFUFjf5kY=;
	b=mMmFYzsKxvEwIT4Y+8a9UEelH1KouFONtBepp2E62q01gjOjO+hODnbcGT6oVNx2YDTI
	 B0kznu212YneLja4XNZ61m+dsmVoksUpLjavHVN4XI+0GEg28qIG/uDqT4M9LjrZYg6KQ
	 6Wo1gdAt1RifuR3pqg5trsgk/7W+a38ayWDHjbF2GAD/XvT3y8Ru45cU72hOzT7EFCBbn
	 1Gqcn8NwSCs59HUmetmyk1vk9TvK/ex/oQsKSTabh+SVdO4wRQIctMjoUjIhQ54kkhZfL
	 5419SjBehBRvuuKAOUavcaWTcPKoL/0VAeCpJFppeLS9MPgwgfAfdAYqUhuq5LbWawg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O3nf2/2X";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D65606A32D
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 13:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O3nf2/2X
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 911AA1F000D4;
	Wed, 25 Nov 2026 13:03:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611806;
	bh=dxGtd41JA8hauGjx79wcdXzKK3OXPhB42SyFUFjf5kY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O3nf2/2Xga16BiAdfFI9CBF0QVw7gpIK3Gr91DvUZsfM2hjH7Z8ZoRWagjKxWIB3Z
	 F9uQo0Y869kSFwEuV53k/PeI1gT8SDyiTrrDjMmQFiB4MNyrCBUtV7zvab2BmJ5w08
	 xmVUni65t4NQ77zzMlwNKTqCubEIEDxNFL9BLgRIJN/9jTw5d+2WWac2k7jLnfeylS
	 EUk2TiGdDliUS1C86pFTh0h2fktyWdmmvxT07fK2QlwL1bNud5EM1I4d7j3GORi28R
	 KhcMLcqnKEAsFChfLGzeNHjVuxcowNAB/LMkqarxKo89hgXOCZt5OiiY4+dGn1Pcro
	 HzkgS8nxZJqWw==
Message-ID: <sashiko-outbox-233433@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Re: ALSA: usb-audio: us144mkii: queued stop_pcm_work
 calls snd_pcm_stop() after PCM close and dereferences NULL runtime
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <753f2e86.57a.1a212c1052c.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <6891aa7d.26365.1a1d4e2c4e4.Coremail.xuhx@hust.edu.cn>
 <753f2e86.57a.1a212c1052c.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:03:26 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] ALSA: usb-audio: us144mkii: missing Signed-off-by trailer in
  commit
- [High] ALSA: usb-audio: us144mkii: feedback_urb_complete() re-arms
  work after close
- [Medium] ALSA: usb-audio: us144mkii: unlocked TOCTOU substream read in
  stop_pcm_work
- [Medium] ALSA: usb-audio: us144mkii: cancel_work_sync() in close drops
  sibling XRUN
- [Low] ALSA: usb-audio: us144mkii: missing Fixes trailer in commit
  message
--

commit b36c55bb30946f2fb9b8c0b478d61532334be47c
Author: =E5=BE=90=E6=99=97=E7=BF=94 <xuhx@hust.edu.cn>

> ALSA: usb-audio: us144mkii: queued stop_pcm_work calls snd_pcm_stop() aft=
er PCM close and dereferences NULL runtime
>
> A stop_pcm_work queued by feedback_urb_complete() after a feedback
> sync loss read tascam->playback_substream/capture_substream without
> any lock and called snd_pcm_stop() on them; PCM close did not
> cancel the work, so after snd_pcm_detach_substream() cleared
> substream->runtime the handler's snd_pcm_stop() oopsed in
> snd_pcm_pre_stop() on the NULL runtime.
>
> Cancel the work in both .close() callbacks (cancel_work_sync() is
> the lifecycle guarantee; it waits for a running handler), and make
> the handler use snd_pcm_stop_xrun(), which takes the PCM stream
> lock itself and rechecks substream->runtime -- fixing both the
> missing close-cancel and the ALSA convention that snd_pcm_action()
> must run under the stream lock.  This patch touches the same .close()
> functions as the separate PCM-close UAF report; the two fixes are
> complementary, not interchangeable.

[Severity: High]
This commit message is missing a Signed-off-by: trailer.

[Severity: Low]
Since this fixes a bug introduced when playback and feedback handling were
added, should it include a Fixes: tag?

  Fixes: a2a2210f2c2e ("ALSA: usb-audio: us144mkii: Implement audio playbac=
k and feedback")

> diff --git a/sound/usb/usx2y/us144mkii_capture.c b/sound/usb/usx2y/us144m=
kii_capture.c
> index d7cdf9e0f6851..1f6d87a9421a5 100644
> --- a/sound/usb/usx2y/us144mkii_capture.c
> +++ b/sound/usb/usx2y/us144mkii_capture.c
> @@ -37,6 +37,9 @@ static int tascam_capture_close(struct snd_pcm_substrea=
m *substream)
>  	struct tascam_card *tascam =3D snd_pcm_substream_chip(substream);
> =20
>  	tascam->capture_substream =3D NULL;
> +	/* a stop_pcm_work queued on feedback sync loss must not run after
> +	 * ALSA detached the substream and freed its runtime */
> +	cancel_work_sync(&tascam->stop_pcm_work);
> =20
>  	return 0;
>  }

[Severity: Medium]
Can cancelling tascam->stop_pcm_work here drop a pending feedback-sync-loss
XRUN stop for a playback substream that is still running?

tascam->stop_pcm_work is shared by both playback and capture.  When
feedback_urb_complete() queues tascam->stop_pcm_work, it immediately sets
tascam->feedback_synced =3D false:

sound/usb/usx2y/us144mkii_playback.c:feedback_urb_complete() {
	...
				if (tascam->feedback_synced) {
					tascam->feedback_consecutive_errors++;
					if (tascam->feedback_consecutive_errors >
					    FEEDBACK_SYNC_LOSS_THRESHOLD) {
						...
						schedule_work(
								&tascam->stop_pcm_work);
						tascam->feedback_synced =3D false;
						break;
					}
				}
	...
}

If capture is opened and closed (for example by an application probing the
device) while playback is running and losing feedback sync,
tascam_capture_close() cancels the pending work item and
feedback_urb_complete() will never re-queue it because feedback_synced is
already false, leaving playback running unsynchronized instead of entering
SNDRV_PCM_STATE_XRUN.

> diff --git a/sound/usb/usx2y/us144mkii_playback.c b/sound/usb/usx2y/us144=
mkii_playback.c
> index 7efaca0a64899..1bdc68006baf1 100644
> --- a/sound/usb/usx2y/us144mkii_playback.c
> +++ b/sound/usb/usx2y/us144mkii_playback.c
> @@ -37,6 +37,9 @@ static int tascam_playback_close(struct snd_pcm_substre=
am *substream)
>  	struct tascam_card *tascam =3D snd_pcm_substream_chip(substream);
> =20
>  	tascam->playback_substream =3D NULL;
> +	/* a stop_pcm_work queued on feedback sync loss must not run after
> +	 * ALSA detached the substream and freed its runtime */
> +	cancel_work_sync(&tascam->stop_pcm_work);
> =20
>  	return 0;
>  }

[Severity: High]
Can an in-flight feedback_urb_complete() schedule tascam->stop_pcm_work
again after cancel_work_sync() returns?

During close, tascam_pcm_trigger() with SNDRV_PCM_TRIGGER_STOP only queues
tascam->stop_work asynchronously to kill the anchored URBs, and neither
tascam_playback_close() nor tascam_capture_close() flushes tascam->stop_work
or kills tascam->feedback_anchor before calling
cancel_work_sync(&tascam->stop_pcm_work):

CPU0 (close)                      CPU1 (<softirq>)
tascam_pcm_trigger(STOP)
  playback_active =3D 0
  schedule_work(&stop_work)
                                  feedback_urb_complete()
                                    /* entered before URBs killed */
tascam_playback_close()
  cancel_work_sync(&stop_pcm_work)
                                    schedule_work(&stop_pcm_work)  <-- re-a=
rmed

In addition, snd_pcm_stop_xrun() does not serialize against
snd_pcm_detach_substream(), because snd_pcm_detach_substream() frees
runtime->status, clears substream->runtime, and frees runtime without
taking pcm_stream_lock.

> @@ -449,8 +452,13 @@ void tascam_stop_pcm_work_handler(struct work_struct=
 *work)
>  	struct tascam_card *tascam =3D
>  		container_of(work, struct tascam_card, stop_pcm_work);
> =20
> +	/* snd_pcm_stop() requires the PCM stream lock and dereferences
> +	 * substream->runtime unconditionally; after a concurrent close the
> +	 * runtime is NULL and snd_pcm_pre_stop() oopses.  Use
> +	 * snd_pcm_stop_xrun(), which takes the stream lock itself and
> +	 * rechecks substream->runtime before touching it. */
>  	if (tascam->playback_substream)
> -		snd_pcm_stop(tascam->playback_substream, SNDRV_PCM_STATE_XRUN);
> +		snd_pcm_stop_xrun(tascam->playback_substream);
>  	if (tascam->capture_substream)
> -		snd_pcm_stop(tascam->capture_substream, SNDRV_PCM_STATE_XRUN);
> +		snd_pcm_stop_xrun(tascam->capture_substream);
>  }

[Severity: Medium]
Can tascam_stop_pcm_work_handler() pass a NULL substream pointer to
snd_pcm_stop_xrun() when racing with tascam_playback_close() or
tascam_capture_close()?

The close callbacks clear tascam->playback_substream and
tascam->capture_substream without a lock before calling
cancel_work_sync(&tascam->stop_pcm_work), while
tascam_stop_pcm_work_handler() reads each field unlocked in the condition
and can reload it when passing the argument to snd_pcm_stop_xrun():

CPU0 (kworker)                    CPU1 (close)
tascam_stop_pcm_work_handler()
  if (tascam->playback_substream)
                                  tascam_playback_close()
                                    tascam->playback_substream =3D NULL;
                                    cancel_work_sync(&tascam->stop_pcm_work)
    snd_pcm_stop_xrun(tascam->playback_substream)
      guard(pcm_stream_lock_irqsave)(NULL)  <-- NULL pointer dereference

snd_pcm_stop_xrun() immediately dereferences substream when acquiring
pcm_stream_lock_irqsave.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/753f2e86.57a.1a212c=
1052c.Coremail.xuhx@hust.edu.cn?part=3D1
