Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795012178;
	b=yw2WscXdA4twKbJ+mJtys0yeX5NrCCB/8i3wn1EDHPyr7/R0Mu8VIzSB5pg+Et4p5flc
	 pF4/wjj22n4R333UgHX6ryrxaKxrC2VYKvNIniuT6RmWtOJV+3nMk3burLQAdt9ZIbZwN
	 4TAio2h086PC/D914pVtnNCHxItpBtWocehnspl13lw2GreGen8V+lCUELaWhkiuswkK+
	 thWNImphy3r6A+gQYpQ4BBo1+zRr24svjhZaQHx690yovyXo5sg2lLVQQteFbICneFq6N
	 h0+N9X5nP3K1FOnbk29z2hHrA5362cvRKbXuGgRvVu7TuHt3vxS4tT0+i5epHkSSoGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795012178;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cqsxmh2mlYqDMmNIzSxcBeupuedYwtc7a6qgJEnhbno=;
	b=5nt/3Sr90IHDasYUOihxXpy5E/cYnFm7cslm0seGSepdT0xjERMzenZe6ClPVJ0n4rZR
	 iim9Fm9qO/zpcOknOtexLa/ikZAsDYbq3Twvqh4wfLbn3Dbvw2PH8D2jELIkeNQl0vqMZ
	 dHY3FB2pFSrJbaCN5IfHK3jhNGONRwYeKjxzJ1yYR3FaFD0moT4TgKiX7FHNnYUp+mPjF
	 scptrEmaLY4nw0weYnuwzf0l2fKdi4Nzpi1OwNQLMo80cIZsHc4WH7oLe64Ap8rsC9xVd
	 QaicfBLHkA3GPHbNbkxiMYeYewtjtzg8lxZO/N90diy98k85RBOPQFpmJoCw0rYIOag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JD12UI2Q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34DDC606A336
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 14:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JD12UI2Q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B17721F000C4;
	Wed, 18 Nov 2026 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795012177;
	bh=cqsxmh2mlYqDMmNIzSxcBeupuedYwtc7a6qgJEnhbno=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=JD12UI2Q2K0Hkf4+9p8SNZrtZ6iA0S/oaIMRwcJteD5hjZZf5x5/S7EhB+uw44TkJ
	 kujJ8xqOP8MhmMQww7BPuQij59uQL0iJ2Sv+GFWnnaHCZQPFi0RQI8LlhUpqZkA5eY
	 Yr/E4NKq1pVEsN5Ov7/hYm5mF7IJJUnaMtyLqk+iTyfUyl74nK3WjqGPfdZVppoOqu
	 SmdUnIWRdFrmb0GYsKJxP23R3sPCdAffx85VBa8cBFklf0qaPgQWa1InjUii5mCj/p
	 SJIlAjNbQYxGG9MEugsEDHPol+O/cAEGU/erDEPmkX5DSuSybLlQFwrj9dkztXK2qM
	 UetgAoZy6Yotg==
Message-ID: <sashiko-outbox-221208@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ALSA: pcm: Avoid hw_params/hw_refine changes during
 PCM buffer access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Takashi Iwai" <tiwai@suse.de>, linux-sound@vger.kernel.org
In-Reply-To: <20261118135558.1928160-2-tiwai@suse.de>
References: <20261118135558.1928160-1-tiwai@suse.de>
 <20261118135558.1928160-2-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 14:29:37 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ALSA: pcm: state check before SND_PCM_BUFFER_ACQUIRE() races
  with hw_free
--

commit 307843a70c44558cff1055cb6881e2bf43f018d0
Author: Takashi Iwai <tiwai@suse.de>

ALSA: pcm: Avoid hw_params/hw_refine changes during PCM buffer access

This commit acquires the PCM buffer access gate at the start of PCM read,
write, readv, writev, and xfern ioctl paths to prevent concurrent
hw_params or hw_free calls from changing runtime attributes mid-operation.

> diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
> index c54cb07304ad4..0321d4241ec5b 100644
> --- a/sound/core/pcm_compat.c
> +++ b/sound/core/pcm_compat.c
> @@ -341,6 +341,9 @@ static int snd_pcm_ioctl_xfern_compat(struct snd_pcm_=
substream *substream,
>  	if (snd_pcm_get_state(substream) =3D=3D SNDRV_PCM_STATE_OPEN)
>  		return -EBADFD;
> =20
> +	SND_PCM_BUFFER_ACQUIRE(substream->runtime, lock);
> +	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
> +		return -EBUSY;
>  	ch =3D substream->runtime->channels;
>  	if (ch > 128)
>  		return -EINVAL;
> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 61bd4f4af81a4..22cf138981c30 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -3417,6 +3417,9 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pc=
m_substream *substream,
> =20
>  	if (snd_pcm_get_state(substream) =3D=3D SNDRV_PCM_STATE_OPEN)
>  		return -EBADFD;
> +	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
> +	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
> +		return -EBUSY;
>  	if (runtime->channels > 128)
>  		return -EINVAL;
>  	if (put_user(0, &_xfern->result))
> @@ -3656,6 +3659,9 @@ static ssize_t snd_pcm_read(struct file *file, char=
 __user *buf, size_t count,
>  	runtime =3D substream->runtime;
>  	if (snd_pcm_state_open_or_disconnected(substream))
>  		return -EBADFD;
> +	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
> +	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
> +		return -EBUSY;
>  	if (!frame_aligned(runtime, count))
>  		return -EINVAL;
>  	count =3D bytes_to_frames(runtime, count);
> @@ -3680,6 +3686,9 @@ static ssize_t snd_pcm_write(struct file *file, con=
st char __user *buf,
>  	runtime =3D substream->runtime;
>  	if (snd_pcm_state_open_or_disconnected(substream))
>  		return -EBADFD;
> +	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
> +	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
> +		return -EBUSY;
>  	if (!frame_aligned(runtime, count))
>  		return -EINVAL;
>  	count =3D bytes_to_frames(runtime, count);
> @@ -3708,6 +3717,9 @@ static ssize_t snd_pcm_readv(struct kiocb *iocb, st=
ruct iov_iter *to)
>  		return -EBADFD;
>  	if (!user_backed_iter(to))
>  		return -EINVAL;
> +	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
> +	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
> +		return -EBUSY;
>  	if (to->nr_segs > 1024 || to->nr_segs !=3D runtime->channels)
>  		return -EINVAL;
>  	if (!frame_aligned(runtime, iov->iov_len))
> @@ -3747,6 +3759,9 @@ static ssize_t snd_pcm_writev(struct kiocb *iocb, s=
truct iov_iter *from)
>  		return -EBADFD;
>  	if (!user_backed_iter(from))
>  		return -EINVAL;
> +	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
> +	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
> +		return -EBUSY;

[Severity: Medium]
Can snd_pcm_hw_free() run between the state check and
SND_PCM_BUFFER_ACQUIRE() in these six paths?

CPU0                                CPU1
snd_pcm_write()
  snd_pcm_state_open_or_disconnected()
    (passes in STATE_SETUP)
                                    snd_pcm_hw_free()
                                      snd_pcm_buffer_access_lock(runtime)
                                      do_hw_free()
                                        runtime->dma_area =3D NULL
                                      runtime->state =3D SNDRV_PCM_STATE_OP=
EN
                                      snd_pcm_buffer_access_unlock(runtime)
  SND_PCM_BUFFER_ACQUIRE(runtime, lock)
  snd_pcm_lib_write()
    __snd_pcm_lib_xfer()
      pcm_sanity_check()            <-- hits snd_BUG_ON()

Because pcm_sanity_check() evaluates snd_BUG_ON(!substream->ops->copy &&
!runtime->dma_area) before checking whether runtime->state is
SNDRV_PCM_STATE_OPEN:

sound/core/pcm_lib.c:pcm_sanity_check() {
	...
	if (snd_BUG_ON(!substream->ops->copy && !runtime->dma_area))
		return -EINVAL;
	if (runtime->state =3D=3D SNDRV_PCM_STATE_OPEN)
		return -EBADFD;
	...
}

losing this race triggers a kernel warning (when CONFIG_SND_DEBUG is
enabled) and returns -EINVAL instead of -EBADFD.  Acquiring
SND_PCM_BUFFER_ACQUIRE() before checking the substream state, as
snd_pcm_mmap_data() does, would prevent transitions into
SNDRV_PCM_STATE_OPEN after the check.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118135558.1928=
160-1-tiwai@suse.de?part=3D2
