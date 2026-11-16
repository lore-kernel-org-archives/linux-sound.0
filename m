Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794817911;
	b=T7tyJV41+wEPYGL5KEy0D7CcGYVCy9UUNVaYv7NV4K6WlraJb4f52amDWltH2EMP1oyH
	 6yuSJYVUFBonN4WLw6HqlNkpiWkKkTtPS5X2e7xWDKWV2cPRG7ZMB+9U+26iNBL2dUu23
	 QrV/6yvpBL7zEwMWOv3CMrlDXDB4PolIGE9bi2sb41ezZ6Xrqt50HcGT60rhxvEmrW7E4
	 7nuDCQC1nZHEO32JTx3fSiSqWKGVyk+k5vCpehyDO6StzkCsfg/LM0eej+I6+kvoXcpuU
	 91CggIRy1XvUEwWoIzRZOZSOUhMBqdy4h0ua3EPW7LF9fMiHc1R9lEw0w74M+r0u4uA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794817911;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/nynTu1KQExehnfG+HOKPoJ0YCDDmx+i2llgwZEbaYE=;
	b=XkJQ6tR5DUK1wS4K6ImvxaFGVvQu56Z5sZ5lLCs3sVe93gK+XG/dh4uDAyY09iIiG9xW
	 YVU7MaPDRg9b6MrSJMXMEbTdyeko6VLxqFuIfoId5mSEJyql3dkIxaHfQIbZ2qubNja7z
	 CIAbeUNNaKOetv9BvZqF6H3dIYuqK10JquGQQfXOJW6Nz4oSbui1Sd7I0ZTwbZK6Q/XZG
	 +3NClR1bo/L+ydcd/BT65/gDU/E5sdjjA/SmNOGZZIf5N/AZMDFYL9HSA4vVKycGvUQUx
	 IYauvTI3Rj7P3tZarQNCAAuOBpXElg1yUuaS2+7x0O5ojetliX+vu8jZnRJt/tmrtGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eit3VJhF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B7B606A31C
	for <linux-sound@vger.kernel.org>; Mon, 16 Nov 2026 08:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eit3VJhF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365A71F000C4;
	Mon, 16 Nov 2026 08:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794817911;
	bh=/nynTu1KQExehnfG+HOKPoJ0YCDDmx+i2llgwZEbaYE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Eit3VJhFnRxuXuTb0BN2s8pdce5rpFLKIJH7ubBCKpVD2odtp1c3m1buMRpghAyJg
	 3w09nta+7k7OhIUthtAFlRU+M5jMcmxpB+Jqfi02sVFqtAz5Jb9VpfvbYR0h0fAeRn
	 IXMD9/9fhvkzhsAarYvLy6oPJBzL5xylSWV3lpPwpF3GPnkx/xy7hAe3XjB/p82dPf
	 QTMEDSqzgdgmbEiL8gxuJ2xJ8Ee/+wJOpXbSkqeuSHqO0Qh7ZdT02riVpRzm3eUvq/
	 HFBfZ35b1ByqWWHldlF1X/5Il8BNgx/RtNI1I4rIC+JHzdjmWSJ28++3CxwbJIA0CO
	 SQ6CC35gVWNCg==
Message-ID: <sashiko-outbox-216538@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/5] ALSA: usx2y: us144mkii: wait for the URB
 completion handlers on stop and close
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexandre Becholey" <alex@becholey.ch>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261116071707.217448-5-alex@becholey.ch>
References: <20261116071707.217448-1-alex@becholey.ch>
 <20261116071707.217448-5-alex@becholey.ch>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 08:31:50 +0000
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
- [High] ALSA: usx2y: us144mkii: tascam_pcm_sync_stop() bypassed after
  pause
- [Low] ALSA: usx2y: unlocked rcu_assign_pointer() races with
  stop_pcm_work
--

commit dcdd2bae04ac4bdf13b9db3d7f98d8186df8888e
Author: Alexandre Becholey <alex@becholey.ch>

ALSA: usx2y: us144mkii: wait for the URB completion handlers on stop and cl=
ose

This commit protects playback_substream and capture_substream with RCU and
adds synchronize_rcu() calls in .close and a new .sync_stop callback so
URB completion handlers and capture work finish using the substream and
its runtime before they are freed.

> diff --git a/sound/usb/usx2y/us144mkii_pcm.c b/sound/usb/usx2y/us144mkii_=
pcm.c
> index 03dfb1f388012..7be6710e7fe32 100644
> --- a/sound/usb/usx2y/us144mkii_pcm.c
> +++ b/sound/usb/usx2y/us144mkii_pcm.c
> @@ -259,6 +259,18 @@ int tascam_pcm_hw_free(struct snd_pcm_substream *sub=
stream)
>  	return 0;
>  }
> =20
> +int tascam_pcm_sync_stop(struct snd_pcm_substream *substream)
> +{
> +	/*
> +	 * The URBs of both streams keep running as long as one of them does.
> +	 * The URB completion handlers and the capture work use the substream
> +	 * inside an RCU read-side section; wait for them before the buffer is
> +	 * freed or reallocated.
> +	 */
> +	synchronize_rcu();
> +	return 0;
> +}
> +
>  int tascam_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
>  {
>  	struct tascam_card *tascam =3D snd_pcm_substream_chip(substream);

[Severity: High]
Can tascam_pcm_sync_stop() be skipped when a paused stream is stopped or
closed, allowing do_hw_free() to free runtime->dma_area while
playback_urb_complete() is still copying from it?

tascam_pcm_hw advertises SNDRV_PCM_INFO_PAUSE, and tascam_pcm_trigger()
accepts SNDRV_PCM_TRIGGER_PAUSE_PUSH, which transitions the substream to
SNDRV_PCM_STATE_PAUSED without setting runtime->stop_operating.  However,
tascam_pcm_trigger() does not handle SNDRV_PCM_TRIGGER_PAUSE_RELEASE:

sound/usb/usx2y/us144mkii_pcm.c:tascam_pcm_trigger() {
	...
		case SNDRV_PCM_TRIGGER_STOP:
		case SNDRV_PCM_TRIGGER_SUSPEND:
		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
			if (atomic_read(&tascam->playback_active)) {
				atomic_set(&tascam->playback_active, 0);
				atomic_set(&tascam->capture_active, 0);
				do_stop =3D true;
			}
			break;
		default:
			err =3D -EINVAL;
			break;
	...
}

When snd_pcm_drop() (including from snd_pcm_release_substream() before
.close) or snd_pcm_prepare() runs on a paused substream, it first calls
snd_pcm_pause(substream, false) to return the stream to
SNDRV_PCM_STATE_RUNNING before calling snd_pcm_stop().  Because
SNDRV_PCM_TRIGGER_PAUSE_RELEASE fails with -EINVAL, runtime->state remains
SNDRV_PCM_STATE_PAUSED, so snd_pcm_do_stop() sees !snd_pcm_running() and
never sets runtime->stop_operating =3D true.  snd_pcm_sync_stop() then skips
tascam_pcm_sync_stop():

CPU0                                  CPU1 (<softirq>)
                                      playback_urb_complete()
                                        rcu_read_lock()
                                        lock(&tascam->lock)
                                        running =3D snd_pcm_running(substre=
am)
                                        unlock(&tascam->lock)
snd_pcm_pause(substream, true)
  tascam_pcm_trigger(PAUSE_PUSH)
  state =3D SNDRV_PCM_STATE_PAUSED
snd_pcm_release()
  snd_pcm_drop()
    snd_pcm_pause(substream, false)
      tascam_pcm_trigger(PAUSE_RELEASE) -> -EINVAL
    snd_pcm_stop()
      /* !snd_pcm_running(), stop_operating not set */
  do_hw_free()
    snd_pcm_sync_stop()               /* skipped */
    snd_pcm_lib_free_pages()
                                        memcpy(dst_buf, runtime->dma_area, =
...)
                                          <-- use-after-free / NULL derefer=
ence

> diff --git a/sound/usb/usx2y/us144mkii_playback.c b/sound/usb/usx2y/us144=
mkii_playback.c
> index 7621d752c899e..6fb3be2bacd98 100644
> --- a/sound/usb/usx2y/us144mkii_playback.c
> +++ b/sound/usb/usx2y/us144mkii_playback.c
> @@ -17,7 +17,8 @@ static int tascam_playback_open(struct snd_pcm_substrea=
m *substream)
>  	struct tascam_card *tascam =3D snd_pcm_substream_chip(substream);
> =20
>  	substream->runtime->hw =3D tascam_pcm_hw;
> -	tascam->playback_substream =3D substream;
> +	/* Pairs with rcu_dereference() in the URB completion handlers. */
> +	rcu_assign_pointer(tascam->playback_substream, substream);
>  	atomic_set(&tascam->playback_active, 0);
> =20
>  	return 0;

[ ... ]

> @@ -479,8 +493,10 @@ void tascam_stop_pcm_work_handler(struct work_struct=
 *work)
>  	struct snd_pcm_substream *playback_ss, *capture_ss;
> =20
>  	scoped_guard(spinlock_irqsave, &tascam->lock) {
> -		playback_ss =3D tascam->playback_substream;
> -		capture_ss =3D tascam->capture_substream;
> +		playback_ss =3D rcu_dereference_protected(tascam->playback_substream,
> +							lockdep_is_held(&tascam->lock));
> +		capture_ss =3D rcu_dereference_protected(tascam->capture_substream,
> +						       lockdep_is_held(&tascam->lock));
>  	}
> =20
>  	if (playback_ss)

[Severity: Low]
Does rcu_dereference_protected() in tascam_stop_pcm_work_handler() race
with the unlocked rcu_assign_pointer() in tascam_playback_open() and
tascam_capture_open()?

rcu_dereference_protected() omits READ_ONCE() because it assumes the held
lock prevents concurrent updates, but tascam_playback_open() and
tascam_capture_open() publish the substream pointers without holding
tascam->lock.  If one substream is opened while stop_pcm_work runs for the
other stream, the plain load in tascam_stop_pcm_work_handler() causes a
data race and drops the READ_ONCE() needed to pair with
rcu_assign_pointer().  Either the .open callbacks should assign the
pointers under tascam->lock, or tascam_stop_pcm_work_handler() should use
rcu_dereference_check().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116071707.2174=
48-1-alex@becholey.ch?part=3D4
