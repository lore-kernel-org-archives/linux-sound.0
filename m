Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590967;
	b=PpWFn9uE+Qr02IKLnu6BXne3RCKb9xBqW4f6YtzqNRT0LuNog6pf+A6H2pXGNfcT1XIk
	 i1ycuAfOAYhqx3SX0a+oTJhl2eKuy0IeOtS0vgQ7cG49NSvh0wZtb5fkdg/vjReDpejWT
	 ydP3pAQ3mSFfidb97IFeu7wc03pJtm4iXO9WvWGtJ8N/sNaFCspgEfrOpZUpz5zbqo7lU
	 3q6B4cSJR3AGPR69/GCIgqjmAixNXzvkYm5XSjBV85GoRHJ8vaiFxvXUqV9HMaoI9HYsT
	 Os6V4pZlVWk4pAKAxEqM/U+0AtWmyMuP59q3yO1u5cpv6peUc2J6/ciREsA8VpWgo1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590967;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tzqeOBpH5cqY+1r94hCteVR+JRFSHfgUzW80U073a4U=;
	b=5R0K8r3f7eumjBz3FdttmaUm4RE5HlVLGbF3RGR5njVc0Pwvr1ReMgiXBDYYpNpDa68t
	 e+EDYYxpi62d7LOd31Z+fzw5bT4ly3F07othDOiRm4zV0gEkUGbJb9Qu1uh+lzS+os6rO
	 cID9wRcGcOtKrWIV9i55qzlQqmY7cup524UI1+sarSMpElP5XOUEsYFS6unCI92Ul9vv2
	 Swq/pPkxJ2azs+w2vH/3xapQm/0+elgL6R42dYxuSdHDaQaqhhDiN9vvg1TntGUkM9kcG
	 +1CzfqpUvh0eGqjDkFnL33PdK/Ah5LC9VPeLkab5Y8ckX2HqOUN5iZziaCmwgkbicjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QSLrQWTY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75E2606A339
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 07:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QSLrQWTY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526931F000C4;
	Wed, 25 Nov 2026 07:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795590967;
	bh=tzqeOBpH5cqY+1r94hCteVR+JRFSHfgUzW80U073a4U=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=QSLrQWTYUoPsyT7h+FODnTNYUvVs93xtYlvpP8SIxmf2MKO8o+UgcLvIsIqpEl/a0
	 LVaQih7dlFtWyHzsNPjfOuToEOn8OBIPt+qrz1U6Zkuax0eqNAsdGGVAmFpJ/0+BXR
	 5ijULeL9gEHoAgKf5CCGKWWiQi9MTTQFn5aEAL2tH2+M0y9DP7wKp+lA7aoXHBWcZ7
	 XSK+07D46RTz/G2uqPyqek9nYwb+DIhdSgVuunsndp1R4qGPP9KTQmNEirrknxVu5Z
	 kBf9DEpjDqAJbCptMYvW7N8WkcVmjSoNfII6y8EAymNhdnwfGkLy1zGRPs8aAaUNkg
	 dTHQ8bcrtm89A==
Message-ID: <sashiko-outbox-232763@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ALSA: pcm: Cover buffer access gate in all
 read/write ioctls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Takashi Iwai" <tiwai@suse.de>, linux-sound@vger.kernel.org
In-Reply-To: <20261125065034.1470697-2-tiwai@suse.de>
References: <20261125065034.1470697-1-tiwai@suse.de>
 <20261125065034.1470697-2-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 07:16:06 +0000
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
- [High] ALSA: pcm: missing writer() error check in __snd_pcm_lib_xfer()
- [High] ALSA: pcm: missing buffer_accessing gate in
  __snd_pcm_lib_xfer() callers
--

commit a0ca0563533dec8be3f120c69e7d751e0b7fb94c
Author: Takashi Iwai <tiwai@suse.de>

ALSA: pcm: Cover buffer access gate in all read/write ioctls

This commit acquires the PCM buffer access gate in the native and compat
interleaved read/write ioctls and removes the inner
snd_pcm_buffer_access_get() and snd_pcm_buffer_access_put() calls from
__snd_pcm_lib_xfer().

> diff --git a/sound/core/pcm_lib.c b/sound/core/pcm_lib.c
> index 3b66677c037a6..50bd5f32d2f8d 100644
> --- a/sound/core/pcm_lib.c
> +++ b/sound/core/pcm_lib.c
> @@ -2377,9 +2377,6 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm=
_substream *substream,
>  			err =3D -EINVAL;
>  			goto _end_unlock;
>  		}
> -		err =3D snd_pcm_buffer_access_get(runtime);
> -		if (err < 0)
> -			goto _end_unlock;
>  		snd_pcm_stream_unlock_irq(substream);
>  		if (!is_playback)
>  			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_CPU);
> @@ -2388,9 +2385,6 @@ snd_pcm_sframes_t __snd_pcm_lib_xfer(struct snd_pcm=
_substream *substream,
>  		if (is_playback)
>  			snd_pcm_dma_buffer_sync(substream, SNDRV_DMA_SYNC_DEVICE);
>  		snd_pcm_stream_lock_irq(substream);
> -		snd_pcm_buffer_access_put(runtime);
> -		if (err < 0)
> -			goto _end_unlock;
>  		err =3D pcm_accessible_state(substream);
>  		if (err < 0)
>  			goto _end_unlock;

[Severity: High]
Does removing "if (err < 0) goto _end_unlock;" here drop the error check
for writer()?  Because err is immediately overwritten by
pcm_accessible_state(substream), a failure from writer() (such as -EFAULT
during user copy) is lost whenever the stream remains in an accessible
state, causing __snd_pcm_lib_xfer() to advance appl_ptr and report a
successful transfer.

[Severity: High]
Also, can dropping snd_pcm_buffer_access_get() and
snd_pcm_buffer_access_put() from __snd_pcm_lib_xfer() leave callers
outside pcm_native.c and pcm_compat.c with runtime->buffer_accessing at 0
while the stream lock is dropped?

Callers such as snd_pcm_oss_write3(), snd_pcm_oss_read3(),
snd_pcm_oss_writev3(), snd_pcm_oss_readv3(), and snd_pcm_oss_sync() in
sound/core/oss/pcm_oss.c, as well as u_audio_playback() ->
snd_pcm_kernel_write() in drivers/usb/gadget/function/u_uac1_legacy.c,
enter __snd_pcm_lib_xfer() without SND_PCM_BUFFER_ACQUIRE():

CPU0                              CPU1
u_audio_playback()
  snd_pcm_kernel_write()
    __snd_pcm_lib_xfer()
      snd_pcm_stream_unlock_irq()
                                  snd_pcm_hw_free()
                                    snd_pcm_buffer_access_lock()
                                    snd_pcm_lib_free_pages()
      writer()
        ...                       <-- use-after-free on runtime->dma_area

For OSS streams, a concurrent SNDCTL_DSP_RESET followed by prepare on the
same descriptor can similarly bypass snd_pcm_buffer_access_lock() while
writer() and snd_pcm_dma_buffer_sync() run unlocked.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125065034.1470=
697-1-tiwai@suse.de?part=3D1
