Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795092365;
	b=QUyeICDTTtlwtrD7Dwprzhw/RzFWnnCXliYMtasVkc0IKc/NYR6p0bspsKsvCeAQaJNO
	 utIGH7lHe8mlKr6XJ1pNSR4FQy9AWY/In7usllF9+LkH7EIDnSSW+xJde6NTIb+GoFBl/
	 qfePbYjWtIk1REGqbezubZSTxUldxfKhY1dpMDJ4CPAT10KcIjFJVHtfEA0WujiqZ/TUB
	 nBfC8skEuoTZ1p9wsSqgHalFSEL3/00FZeeUrFdNU5qgIK+qgKrcnPd/+KsBhttuIy7kg
	 DP/qaq9VmSQh/64aDcG6fcZrQ96LkqOdxMI1WfnlrM3fggcpB2zgzJ0ViD0TxN9YrFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795092365;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ulHXugNzPsYVncXqg1R7L/duBMA3mgb28CA2H1+yZbE=;
	b=CcOHnCA8NKOWn55MIypm58dAJYn/ZXr7TrfxdTt9D670Bb6aKJfudrmZ1w64jYN4FBva
	 /vRkVXxtF8tCjnt/yE5T3d5hC+VVDfjg1oJ2EQmKy9zi0m1pddCy737K62DAmNO+K57iI
	 WLVmxlW1qu1YPSFmWh/t4ZFidSO/HyUiH1+6J3iUA7yfK4lp23oh3/3GhutFFWeOnCuBp
	 UdeWLzAKGnpZwP4oNwDvdiOjFhsy9bA3X1GuqHMvnOxQPimojCWq1ok328XYbH004rpJA
	 +RL/s20m/himKfIYQNDpxy+e5m1pIP/aum/s1tgkxYkCZGV2a9zby0V3qfydOcwWq0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nsWCj+Gl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05022606A336
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 12:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nsWCj+Gl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A3FB1F000CD;
	Thu, 19 Nov 2026 12:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795092364;
	bh=ulHXugNzPsYVncXqg1R7L/duBMA3mgb28CA2H1+yZbE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=nsWCj+GlXorTx60ktYHjHxWtFqPgQpes+aQwsvQrZ6AmDmW2ZG0V6DJheKvQJhxeo
	 jaispq6k/4r33MujpXzNgb2HkuB1MxmY+MuZBx+NLC6bQw1ZucO7yiwbg+TnPCBmsR
	 eRgWDWU9NqtUcfLY3sf/qQ6btCCLTp4bPQjQHYVUCgwtvI/+8wBigx4+K1uk8ow6/B
	 tjieKtWQWT8bXc/K5aGthH0D5EEhG/aZekQ1cd4hpcPqftXcZQPyj1L5Fc/awTldhu
	 SpkPZhSq/A4p8ietD/waPL6Z4NVW5i4YKFv7C+iDJrSPtmhcvfh9i7xa0L7Izm45fT
	 vs5GWjQem+N1w==
Message-ID: <sashiko-outbox-223115@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ALSA: pcm: Avoid hw_params/hw_refine changes
 during PCM buffer access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Takashi Iwai" <tiwai@suse.de>, linux-sound@vger.kernel.org
In-Reply-To: <20261119122356.2134523-4-tiwai@suse.de>
References: <20261119122356.2134523-1-tiwai@suse.de>
 <20261119122356.2134523-4-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 12:46:04 +0000
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
- [Medium] ALSA: pcm: missing buffer access gate in xferi frame ioctl
  handlers
--

commit 1d0a5a9306bc1367f12d8e1ee79c3cdcad53aa1b
Author: Takashi Iwai <tiwai@suse.de>

ALSA: pcm: Avoid hw_params/hw_refine changes during PCM buffer access

This commit acquires the PCM buffer access gate at the entry of the
non-interleaved frame transfer ioctls and PCM read/write file operations
to prevent concurrent hw_params or hw_free updates while accessing
runtime state.

> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 7d5e662b219bd..d028f03369e74 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -3434,6 +3434,9 @@ static int snd_pcm_xfern_frames_ioctl(struct snd_pc=
m_substream *substream,
>  	void *bufs __free(kfree) =3D NULL;
>  	snd_pcm_sframes_t result;
> =20
> +	SND_PCM_BUFFER_ACQUIRE(runtime, lock);
> +	if (SND_PCM_BUFFER_ACQUIRE_ERR(lock))
> +		return -EBUSY;
>  	if (snd_pcm_get_state(substream) =3D=3D SNDRV_PCM_STATE_OPEN)
>  		return -EBADFD;
>  	if (runtime->channels > 128)

[Severity: Medium]
Should snd_pcm_xferi_frames_ioctl() and snd_pcm_ioctl_xferi_compat() also
acquire the buffer access gate with SND_PCM_BUFFER_ACQUIRE()?

__snd_pcm_lib_xfer() only calls snd_pcm_buffer_access_get() inside its
inner transfer loop around writer().  Until then, a concurrent
snd_pcm_hw_free() or snd_pcm_hw_params() can free runtime->dma_area
before transitioning runtime->state to SNDRV_PCM_STATE_OPEN, causing
pcm_sanity_check() to hit snd_BUG_ON(!substream->ops->copy &&
!runtime->dma_area), or modify runtime->access, runtime->channels and
other runtime parameters while __snd_pcm_lib_xfer() validates them or
sleeps in wait_for_avail():

CPU0                                  CPU1
snd_pcm_xferi_frames_ioctl()
  snd_pcm_get_state() !=3D OPEN
                                      snd_pcm_hw_free()
                                        snd_pcm_buffer_access_lock()
                                        substream->ops->hw_free()
                                          runtime->dma_area =3D NULL
  snd_pcm_lib_write()
    __snd_pcm_lib_xfer()
      pcm_sanity_check()
        snd_BUG_ON(!substream->ops->copy &&
                   !runtime->dma_area)  <-- WARN / race
                                        runtime->state =3D SNDRV_PCM_STATE_=
OPEN

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119122356.2134=
523-1-tiwai@suse.de?part=3D3
