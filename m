Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660072;
	b=vCx2qXnCqELF82c7RGufAXNjEU7s9iCOVPQ236TmJckw7BRFYvwhQ3UgCtw4yExPfWpw
	 Y762zyh/cK+3i9pa5pAwkqUOVV46LEPjxq6gjCvK/0ttQ8fP41im3Q0dBEP0GArzKKnvl
	 qskNxNWU8Frzd1CF7+nIyk3F/5Ezi7/OFWccdiylCSJhw1MhVQicA3sVYJz1sb4rnHr04
	 Z1QnqQs/Y4h/VyXAtDNyqUaaoH5GhLhEEuw6sAbnHK/VxHY9FlxeIso1aAlGAK3CkPyA0
	 7ObOE+W6oB4OqlXMBFLbFRdW5+EAV+aI1rlpyDhJoUy4EqBA0PMnahKr5Um5bkKnARw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660072;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=6V4UWkydmxANtV4EYpeAQWe1x1YLLOT+ppZnqriB9G0=;
	b=eWyBNnFbY8dbSlIxw944aigWr8jNqhYn0U6eijrW1GAdkxPUOtTya7LEG9cn/BuE8nFm
	 5cUUhbuQF0gJEPJcNwuALiUSfbO3WC2jKt1BxSCKTEB2GYqp0QWWr54oC2OCdzYOgQDgV
	 z+2dpDvi6f0t0vmSa+jkKLeUGq90L3ZnquNmWxnKtbtFVtBjQw0ou4LKlqhOy5ZR48m3A
	 drBybKtY6G+hptxPxtULuCbQQv6r4uJ+onTogivP4l573wyNqEWC+kmbFBGCA48iPt44u
	 yT5SHbsMdQG1egXmSKLVAj/8SYZ6ty3s4HfFHLNQjVEYCOEqQQvseAyzWDYykooe+6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bwsB5s7U;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F1DD606A31E
	for <linux-sound@vger.kernel.org>; Thu, 26 Nov 2026 02:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bwsB5s7U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4605A1F000C6;
	Thu, 26 Nov 2026 02:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795660072;
	bh=6V4UWkydmxANtV4EYpeAQWe1x1YLLOT+ppZnqriB9G0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bwsB5s7UQLL/s88A4P4xzUlqr8YcbYIbA3yMWdMtvnwJOQs3ri8gC75/HItPsn8i4
	 BsoFFFg4cf6IxW8EADufmGg9dxWD4Ddv65RO98kL6wSRK/piqvvTd5Yi62Xw9IUoHG
	 mJI5uYfk4AHwm1ZLCxs4qJr/Fq9F4iTZRyKhDCV5HiLiHzqztKL0Nz8dSIHZYwvJ7Z
	 +miiStex3prt8hkF3WvEkx8S26sJTtVEjpn/HbNdX//pflpO+bQK+d6xhUkjbTA9d+
	 mIuuTnTIs4p4tqTGHVrc+UVLcG8fp/6GIPhCl8mVP1w/fMyxH/KRJ68eQizOnQgspl
	 5uXJDP1cuj1Sg==
Message-ID: <sashiko-outbox-234640@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: Re: [PATCH] Re: ALSA: ctxfi: do not free a running system timer
 when timer_delete_sync_try() returns -1 (UAF)
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <152af2bc.a54.1a215a12cc9.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <6776b38b.262de.1a1d4ca8711.Coremail.xuhx@hust.edu.cn>
 <20f42cfd.589.1a212c337be.Coremail.xuhx@hust.edu.cn>
 <87fqwp6kt8.wl-tiwai@suse.de>
 <152af2bc.a54.1a215a12cc9.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 02:27:51 +0000
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
- [High] ALSA: ctxfi: UAF in ct_systimer_callback() due to early
  resource release
- [High] ALSA: ctxfi: malformed Signed-off-by trailer in commit message
- [Medium] ALSA: ctxfi: ct_systimer_prepare() skips timer sync on false
  lock claim
- [Low] ALSA: ctxfi: conversational email reply used as commit changelog
- [Low] ALSA: ctxfi: missing Fixes trailer in commit message
--

commit 02a6a4ecfa65d329ad7bd896394803d538429061
Author: =E5=BE=90=E6=99=97=E7=BF=94 <xuhx@hust.edu.cn>

> ALSA: ctxfi: do not free a running system timer when timer_delete_sync_tr=
y() returns -1 (UAF)
>
> Hi,
>
> thanks for the review.
>
> Also, sorry for the potentially slow follow-ups: I have been quite busy
> lately, so I will get to the other reported issues (the rest of the sound=
-core series) one by one with their patches in a while.
>
> Signed-off-by: <Hanxiang Xu> <xuhx@hust.edu.cn>

[Severity: Low]
Conversational reply text to reviewers belongs below the "---" separator in=
 a
patch email rather than in the commit changelog body.  The commit message b=
ody
should provide a technical description of the bug and how the patch resolves
it.

[Severity: High]
The Signed-off-by trailer wraps the contributor display name in angle brack=
ets
("<Hanxiang Xu>") and does not match the commit Author header ("=E5=BE=90=
=E6=99=97=E7=BF=94").
Should the angle brackets around the name be removed and the Author header =
and
Signed-off-by trailer made consistent (for example,
"Signed-off-by: Hanxiang Xu <xuhx@hust.edu.cn>")?

[Severity: Low]
Should this bug fix include a Fixes tag?

  Fixes: b7bbf876087e ("ALSA: ctxfi - Use native timer interrupt on emu20k1=
")

> diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
> index 9d6f5df2bc7ef..fea9d61aa4569 100644
> --- a/sound/pci/ctxfi/cttimer.c
> +++ b/sound/pci/ctxfi/cttimer.c
> @@ -111,11 +111,17 @@ static void ct_systimer_stop(struct ct_timer_instan=
ce *ti)
> =20
>  static void ct_systimer_prepare(struct ct_timer_instance *ti)
>  {
> +	/* non-sleeping: also runs under the PCM stream lock */
>  	ct_systimer_stop(ti);
>  	timer_delete_sync_try(&ti->timer);
>  }

[Severity: Medium]
Does ct_systimer_prepare() actually run under the PCM stream lock, and can
leaving timer_delete_sync_try() here still race with a running
ct_systimer_callback()?

snd_pcm_prepare() releases pcm_stream_lock_irq before calling
snd_pcm_action_nonatomic(&snd_pcm_action_prepare, ...), and all three calle=
rs
of ct_timer_prepare() in sound/pci/ctxfi/ctatc.c
(atc_pcm_playback_prepare(), atc_pcm_capture_prepare(), and
spdif_passthru_playback_prepare()) run in sleepable process context where t=
hey
allocate with GFP_KERNEL and lock atc->atc_mutex right before calling
ct_timer_prepare().

When timer_delete_sync_try() returns -1 because ct_systimer_callback() is
running on another CPU, ct_timer_prepare() resets ti->position =3D 0 and
ti->running =3D 0 while the old callback is still in flight.  That callback=
 can
then overwrite ti->position with a stale value, call apcm->interrupt(apcm),=
 or
observe ti->running =3D=3D 1 if ct_timer_start() runs right after prepare a=
nd
re-arm ti->timer with a stale interval.  Using timer_delete_sync(&ti->timer)
here avoids this race.

> -#define ct_systimer_free	ct_systimer_prepare
> +static void ct_systimer_free(struct ct_timer_instance *ti)
> +{
> +	/* may sleep: wait for a callback running on another CPU */
> +	ct_systimer_stop(ti);
> +	timer_shutdown_sync(&ti->timer);
> +}

[Severity: High]
Isn't waiting for the timer inside ct_systimer_free() too late to prevent a
use-after-free and NULL pointer dereference in ct_systimer_callback()?

When a running stream is stopped and closed with use_system_timer=3D1,
ct_systimer_stop() only calls non-blocking timer_delete(&ti->timer), and
neither ct_pcm_playback_ops nor ct_pcm_capture_ops implements .sync_stop.
Before ct_timer_instance_free() calls ct_systimer_free(), both
ct_pcm_hw_free() and ct_atc_pcm_free_substream() call
atc->pcm_release_resources(atc, apcm):

sound/pci/ctxfi/ctpcm.c:ct_atc_pcm_free_substream() {
	...
	atc->pcm_release_resources(atc, apcm);
	ct_timer_instance_free(apcm->timer);
	kfree(apcm);
}

atc_pcm_release_resources() frees apcm->src via src_mgr->put_src() and
unmaps/frees and clears apcm->vm_block while ct_systimer_callback() can sti=
ll
be running on another CPU:

CPU0                                  CPU1
snd_pcm_release_substream()
  snd_pcm_drop()
    ...
      ct_systimer_stop()
        timer_delete(&ti->timer)
                                      ct_systimer_callback()
                                        substream->ops->pointer(substream)
                                          atc_pcm_playback_position()
  ...
  atc_pcm_release_resources()
    src_mgr->put_src(..., apcm->src)
      kfree(src)
    apcm->src =3D NULL
    ct_unmap_audio_buffer(atc, apcm)
    apcm->vm_block =3D NULL
                                            src->ops->get_ca(src)
                                              <-- use-after-free
                                            apcm->vm_block->addr
                                              <-- NULL dereference
  ct_timer_instance_free()
    ct_systimer_free()
      timer_shutdown_sync(&ti->timer)

The same unsynchronized atc_pcm_release_resources() call also runs in
ct_pcm_hw_params() and at the beginning of atc_pcm_playback_prepare() and
atc_pcm_capture_prepare() before ct_timer_prepare() is reached.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/152af2bc.a54.1a215a=
12cc9.Coremail.xuhx@hust.edu.cn?part=3D1
