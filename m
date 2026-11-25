Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611944;
	b=DTKbS1HshArgdu21stxD51WM637O5Sl58SXostKLPBLXT+fzv057kgjTyJEU1ihENUnT
	 LPsKDhJhlGF4elL2W4fC/LfCAFkmy1xQSBZoh5GNH1grC8JFXj99EkmTzMrVzNoSiHoal
	 idutCorj21YtxLpX1K7o8bbVzHTRFuzrbCKD95MrqMCXMKQrmzCXTHl4YbZeMhMAb7A2/
	 1dGHgEPvbL+9wJt42F3ZB4tJcZo1Jofir3g82Gmeo/5G45GX9H99kW44GYephjR9VLO25
	 sWXjtwdjHnhyRPIuz+WSGsvooWyYlFHW10y8YusWgifjw0lCwkHkvA23MslViZ4jb4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611944;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4EhKHWv5rhFEy5L0xN7s/ByT0q9QW78G8ooyCv6TxQ8=;
	b=IIierLcWQZam7DVXRGiIC7j+6zLKKod918myS2hDBeBrjtc4SA+xOpa0jK3ao2dx0nr5
	 gs9X0GBgC7/DRHUuOPzZPfr/cGf3JLd3/9bPIgSoC3Tg0JMFKSO6UvWyDVOINliBCRUc1
	 S9m95slTAUmirHpqY0W6/SI9hmkvL1LEJTiWCMO8BeF1gh5Tf8Dr8LnEa5k4KXAjmWSNG
	 cQJE3ClfT2+KVJUjMAdGuGy7yGq/Nu58V24V5dha5zvCAruKDdZ2JbJoIz1cbA73QNT3O
	 NG1SmJP8wmj83HvPyxxkTf+dk4n+TN4cWB47T8LDw5CJzXG3/3jgymTUQDxS3jA2bwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DF0ODMtE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C41606A323
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 13:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DF0ODMtE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1171D1F000D0;
	Wed, 25 Nov 2026 13:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611944;
	bh=4EhKHWv5rhFEy5L0xN7s/ByT0q9QW78G8ooyCv6TxQ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DF0ODMtE6XVVMZqAExVclHnQl7fDHXz+NYDY66j6ltH9Fdga4ym5LrhRXFRcVsbl3
	 T8mlor4RSfUKIIn4OHIEa1CcEaQmur5vV+XabSAN1iH2tMLimwrMqiGjBqlQdJTjHb
	 7gZDXdcnTGoL+vXo2CrAOinE+YrVLEbaps89rOK/nc7c7kgLRT2n8dLbUhBS17AbLh
	 vb1tMLyJnN3s9MYPbHu/9DcAL/QCTt47Vpivh1Ka4LvYim270sXbuUecvp0iSdaVPu
	 IKThCcJSeQFvKK+HE/l5Dqsb3Roufrrf6axxo4cS35Cc6KNIqG19quJDb5N6Zu5F5z
	 uso5Or632Rakg==
Message-ID: <sashiko-outbox-233451@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] Re: ALSA: ctxfi: do not free a running system timer
 when timer_delete_sync_try() returns -1 (UAF)
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20f42cfd.589.1a212c337be.Coremail.xuhx@hust.edu.cn>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <6776b38b.262de.1a1d4ca8711.Coremail.xuhx@hust.edu.cn>
 <20f42cfd.589.1a212c337be.Coremail.xuhx@hust.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 13:05:43 +0000
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
- [High] ALSA: ctxfi: missing Signed-off-by trailer in commit message
- [Medium] ALSA: ctxfi: ct_systimer_prepare() skips timer sync on false
  lock claim
- [Low] ALSA: ctxfi: missing Fixes trailer in commit message
--

commit e750bb6cd03b9a9826e84cf3cb74558902482fe7
Author: =E5=BE=90=E6=99=97=E7=BF=94 <xuhx@hust.edu.cn>

> ALSA: ctxfi: do not free a running system timer when timer_delete_sync_tr=
y() returns -1 (UAF)
>
> ct_systimer_prepare() served as both the prepare callback and the
> free_instance callback and ignored the -1 return of
> timer_delete_sync_try() (-1 means the callback is running on
> another CPU and was NOT deleted); ct_timer_instance_free() then
> kfree()d the instance while ct_systimer_callback() still
> dereferenced ti->substream, substream->runtime, ti->apcm and
> ti->position -- a UAF on a normal PCM close with use_system_timer=3D1.
>
> Split the callbacks: keep ct_systimer_prepare() non-sleeping (it
> also runs from ct_timer_prepare() under snd_pcm_prepare()'s stream
> lock, where a sleeping wait would be 'scheduling while atomic'), and
> give the free path its own ct_systimer_free() that calls
> timer_shutdown_sync() before the instance is removed and kfree()d.

[Severity: High]
The commit message is missing a Signed-off-by: trailer.

[Severity: Low]
Since this fixes a bug, should the commit message include a Fixes: tag?

  Fixes: b7bbf876087e ("ALSA: ctxfi - Use native timer interrupt on emu20k1=
")

> diff --git a/sound/pci/ctxfi/cttimer.c b/sound/pci/ctxfi/cttimer.c
> index 9d6f5df2bc7ef..ad463321cac2e 100644
> --- a/sound/pci/ctxfi/cttimer.c
> +++ b/sound/pci/ctxfi/cttimer.c
> @@ -111,11 +111,24 @@ static void ct_systimer_stop(struct ct_timer_instan=
ce *ti)
> =20
>  static void ct_systimer_prepare(struct ct_timer_instance *ti)
>  {
> +	/* keep the try variant here: this callback also runs from
> +	 * ct_timer_prepare() under snd_pcm_prepare()'s stream lock, where
> +	 * a sleeping wait would be a "scheduling while atomic" */
>  	ct_systimer_stop(ti);
>  	timer_delete_sync_try(&ti->timer);
>  }
> =20
> -#define ct_systimer_free	ct_systimer_prepare
> +static void ct_systimer_free(struct ct_timer_instance *ti)
> +{
> +	/* the close/free path runs in process context and must wait for a
> +	 * callback that is already running on another CPU before the
> +	 * instance (and the PCM runtime / apcm it dereferences) is removed
> +	 * and kfree()d; timer_delete_sync_try() returns -1 in exactly that
> +	 * case without waiting, so a UAF followed.  Use the full shutdown
> +	 * sync here, but do NOT route prepare through it. */
> +	ct_systimer_stop(ti);
> +	timer_shutdown_sync(&ti->timer);
> +}

[Severity: Medium]
Should ct_systimer_prepare() use timer_delete_sync() instead of
timer_delete_sync_try()?

snd_pcm_prepare() drops the stream lock before invoking the .prepare
callback via snd_pcm_action_nonatomic():

sound/core/pcm_native.c:snd_pcm_prepare() {
	scoped_guard(pcm_stream_lock_irq, substream) {
		...
	}

	return snd_pcm_action_nonatomic(&snd_pcm_action_prepare,
					substream,
					(snd_pcm_state_t)f_flags);
}

All three callers of ct_timer_prepare() in sound/pci/ctxfi/ctatc.c
(atc_pcm_playback_prepare(), atc_pcm_capture_prepare() and
spdif_passthru_playback_prepare()) already run in sleepable process
context and take atc->atc_mutex right before calling ct_timer_prepare().

With timer_delete_sync_try(&ti->timer) ignoring a -1 return when
ct_systimer_callback() is running on another CPU, ct_timer_prepare() and
a following ct_timer_start() can race with the in-flight callback:

CPU0                              CPU1
ct_timer_prepare(ti)              ct_systimer_callback()
  ct_systimer_prepare(ti)           ...
    ct_systimer_stop(ti)
    timer_delete_sync_try() -> -1
  ti->position =3D 0;
  ti->running =3D 0;
ct_timer_start(ti)
  ct_systimer_start(ti)
    ti->running =3D 1;
    mod_timer(&ti->timer, ...)
                                    apcm->interrupt(apcm);
                                    ti->position =3D position;
                                      <-- clobbers reset position
                                    if (ti->running)
                                      mod_timer(&ti->timer, ...)
                                        <-- re-arms with stale interval

Calling timer_delete_sync(&ti->timer) in ct_systimer_prepare() waits for
any running callback while still allowing the timer to be re-armed on the
next start.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20f42cfd.589.1a212c=
337be.Coremail.xuhx@hust.edu.cn?part=3D1
