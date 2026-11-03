Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706342;
	b=MKmMOd+jNlzDGgd9sGFioliglESfTSpl2nfljWBkymQrgBnU+1Yje17fv7mKUueFq1wo
	 Byu4xePyrSVdpLwiu2IVEwTvdgFouB0yGbZDewE93XY3wzcDrzRclESLCT78BusjrNxF6
	 MlwUNFInkmnu8LMAsdjqpWEgK6gBJE+OnqGVa8LLzvQ6xOq7miEWceIrA9rz22zaT26uw
	 jgwTpjbGV0CM1dK5HJE1z14QkhxUTB5kV4VZ7RPV1t5kqBG4ut1I3TvnnpRVJ3zXhGkio
	 BoDcMEvbm3fmECipOpOB7qvQXtk1K5trglV9mqBDipDQEQ3ujq1qzr8in5m/5XkCsSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706342;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=i6dbsgPVZV7eFzL3b+ZZF8W+EmnneuenbrMLLoHmjq8=;
	b=YgQ5cxelGHc2rT3AnHP98VeE8YKBstZZlyBpPJaNw7vE/mgYmj5qxqxz/m8Qb1qkpnBX
	 bu15qU09U0GkT/bMTTvQzR14dWsLugQwxH0cgzc2BTU26sIlwAOl2KbxTTpA0J7CceCAk
	 hsR8pcv7QZ/+zKsMVLoLuB8nmW8nFEQSK1JB/MG4d0O1mlFw7LLIMjXUYFXW5ug+GJw+G
	 A/Uj8qHtyxJuVKhi86WThs4DgTECPYpy1/wnfMROBmVnLfa+Hs8D90BdwL4HvJMY+zh4H
	 fsCgpeWjPlrF422B1mie17bEpXwTQlY4dBfVykzJ/n++szcx8Yz7Bb5+qaC8QOjrZ5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsgJYiQp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08796606A32F
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YsgJYiQp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85A1F1F000C1;
	Tue,  3 Nov 2026 11:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793706341;
	bh=i6dbsgPVZV7eFzL3b+ZZF8W+EmnneuenbrMLLoHmjq8=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=YsgJYiQpPERX2ZyJgXNFjX90nWEYDXTikU0H2guXD2HdQ5dKf+xUO3HJMslGorfX6
	 hNAt0hnQbSyK0L5TsEC17+VHQLbqFzWhV2XNyqGmHSV+FzTrwp5CCLflSu/z1qgz/8
	 ZomsA+JxG2gxrt6SrJbUNUTeVTDHMXj3g90vHjTfR8Cgzqv0kv/D5tzytVezowlJVI
	 juTquVXLHTms/mNMdwNvLRsLD9ruq5HSDDswjdkcyafJFPYU7NjAw/oZfISNLBx1lM
	 9ImIao//acrxGtYL71ZdIHVqGEX+vO2u+wfM1HWgPGI83XGnlvHM6B3aDYpkXup7MW
	 EIJ4d9YIDisrw==
Message-ID: <sashiko-outbox-195178@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: pcm: Don't release the DMA buffer while it is
 mmapped
Reply-To: sashiko-reviews@lists.linux.dev
To: "bo cao" <treebacker@foxmail.com>, linux-sound@vger.kernel.org
In-Reply-To: <tencent_E90BB4F086165FAA3313723567A5C675EA06@qq.com>
References: <tencent_E90BB4F086165FAA3313723567A5C675EA06@qq.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 11:45:41 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] ALSA: pcm: leak in snd_pcm_release_substream() for non-managed buf=
fers
- [High] ALSA: pcm: state desync in snd_pcm_hw_params() when hw_free() runs=
 mmapped
--

commit d25a1b1c86ceb79fd02fea330e439e2906af4528
Author: Bo Cao <treebacker@foxmail.com>

ALSA: pcm: Don't release the DMA buffer while it is mmapped

This commit prevents snd_pcm_lib_malloc_pages() and snd_pcm_lib_free_pages()
from freeing an active PCM DMA buffer while substream->mmap_count is non-ze=
ro,
and releases any retained managed buffer when the substream is closed in
snd_pcm_release_substream().

> diff --git a/sound/core/pcm_memory.c b/sound/core/pcm_memory.c
> index cfe9f10e7359d..ed3da74e2cf55 100644
> --- a/sound/core/pcm_memory.c
> +++ b/sound/core/pcm_memory.c
> @@ -439,6 +439,11 @@ int snd_pcm_lib_malloc_pages(struct snd_pcm_substrea=
m *substream, size_t size)
>  			runtime->dma_bytes =3D size;
>  			return 0;	/* ok, do not change */
>  		}
> +		/* the old buffer may still be mmapped: refuse instead of
> +		 * freeing it behind the userspace mapping
> +		 */
> +		if (atomic_read(&substream->mmap_count))
> +			return -EBADFD;
>  		snd_pcm_lib_free_pages(substream);
>  	}
>  	if (substream->dma_buffer.area !=3D NULL &&
> @@ -488,6 +493,9 @@ int snd_pcm_lib_free_pages(struct snd_pcm_substream *=
substream)
>  	runtime =3D substream->runtime;
>  	if (runtime->dma_area =3D=3D NULL)
>  		return 0;
> +	/* the buffer may still be mmapped: refuse to release it */
> +	if (atomic_read(&substream->mmap_count))
> +		return -EBADFD;

[Severity: High]
Can returning -EBADFD here while substream->ops->hw_free() still runs on the
snd_pcm_hw_params() error path desynchronize driver state from
runtime->dma_buffer_p?

When snd_pcm_hw_params() fails while substream->mmap_count is non-zero (for
instance, when a larger buffer size causes snd_pcm_lib_malloc_pages() to
return -EBADFD, or when snd_pcm_hw_refine() fails), the _error path still
calls substream->ops->hw_free() before snd_pcm_lib_free_pages():

sound/core/pcm_native.c:snd_pcm_hw_params() {
	...
 _error:
	if (substream->runtime) {
		/* hardware might be unusable from this time,
		   so we force application to retry to set
		   the correct hardware parameter settings */
		snd_pcm_set_state(substream, SNDRV_PCM_STATE_OPEN);
		if (substream->ops->hw_free !=3D NULL)
			substream->ops->hw_free(substream);
		if (substream->managed_buffer_alloc)
			snd_pcm_lib_free_pages(substream);
	}
}

With this change, substream->ops->hw_free() tears down driver-side hardware
mappings or memory blocks (such as voice->memblk in snd_trident_hw_free(),
pcmp->memory in snd_gf1_pcm_playback_hw_free(), or epcm->memblk in
snd_emu10k1_playback_hw_free()), while snd_pcm_lib_free_pages() returns
-EBADFD and leaves runtime->dma_buffer_p intact.

If a subsequent snd_pcm_hw_params() call requests a buffer size that fits in
the retained runtime->dma_buffer_p->bytes, snd_pcm_lib_malloc_pages() takes
the fast path and returns 0, setting runtime->buffer_changed =3D 0:

sound/core/pcm_native.c:snd_pcm_hw_params() {
	...
	if (substream->managed_buffer_alloc) {
		err =3D snd_pcm_lib_malloc_pages(substream,
					       params_buffer_bytes(params));
		if (err < 0)
			goto _error;
		runtime->buffer_changed =3D err > 0;
	}
}

Drivers that only allocate their hardware memory blocks when
runtime->buffer_changed is non-zero or when snd_pcm_lib_malloc_pages()
returns > 0 then skip reallocating the block that ops->hw_free() freed,
leaving voice->memblk, pcmp->memory, or epcm->memblk unallocated in
SNDRV_PCM_STATE_SETUP:

sound/pci/trident/trident_main.c:snd_trident_allocate_pcm_mem() {
	...
	if (trident->tlb.entries) {
		if (runtime->buffer_changed) {
			if (voice->memblk)
				snd_trident_free_pages(trident, voice->memblk);
			voice->memblk =3D snd_trident_alloc_pages(trident, substream);
			if (voice->memblk =3D=3D NULL)
				return -ENOMEM;
		}
	}
}

In addition, snd_cs46xx_playback_hw_free() and snd_cs46xx_capture_hw_free()
ignore the -EBADFD return from snd_pcm_lib_free_pages() and unconditionally
clear runtime->dma_buffer_p and runtime->dma_area to NULL:

sound/pci/cs46xx/cs46xx_lib.c:snd_cs46xx_playback_hw_free() {
	...
	if (runtime->dma_area !=3D cpcm->hw_buf.area)
		snd_pcm_lib_free_pages(substream);

	snd_pcm_set_runtime_buffer(substream, NULL);
	...
}

Wouldn't clearing runtime->dma_buffer_p while the buffer is still mmapped
cause a subsequent snd_pcm_lib_malloc_pages() call to see
runtime->dma_buffer_p =3D=3D NULL and bypass the new mmap_count check?

> diff --git a/sound/core/pcm_native.c b/sound/core/pcm_native.c
> index 5cbf88da7626d..8e337983f2ec6 100644
> --- a/sound/core/pcm_native.c
> +++ b/sound/core/pcm_native.c
> @@ -2851,6 +2851,12 @@ void snd_pcm_release_substream(struct snd_pcm_subs=
tream *substream)
>  		snd_refcount_sync(&substream->runtime->refcnt);
>  		if (substream->runtime->state !=3D SNDRV_PCM_STATE_OPEN)
>  			do_hw_free(substream);
> +		else if (substream->managed_buffer_alloc)
> +			/* a failed hw_params may have left the buffer
> +			 * allocated (it was still mmapped at the time);
> +			 * release it now that the mapping is gone
> +			 */
> +			snd_pcm_lib_free_pages(substream);

[Severity: High]
Does gating this cleanup on substream->managed_buffer_alloc leak
runtime->dma_buffer_p and card->total_pcm_alloc_bytes for drivers that use
snd_pcm_lib_malloc_pages() and snd_pcm_lib_free_pages() without setting
substream->managed_buffer_alloc?

Drivers that preallocate via snd_pcm_lib_preallocate_pages() or
snd_pcm_lib_preallocate_pages_for_all() (such as sound/pci/emu10k1/emupcm.c,
sound/pci/rme9652/hdspm.c, and sound/pci/cs46xx/cs46xx_lib.c) have
substream->managed_buffer_alloc =3D=3D 0 and call snd_pcm_lib_malloc_pages(=
) from
substream->ops->hw_params() and snd_pcm_lib_free_pages() from
substream->ops->hw_free():

sound/pci/emu10k1/emupcm.c:snd_emu10k1_playback_hw_free() {
	...
	snd_pcm_lib_free_pages(substream);
	return 0;
}

When a second snd_pcm_hw_params() call fails while the buffer is mmapped, t=
he
_error path sets substream->runtime->state to SNDRV_PCM_STATE_OPEN and calls
substream->ops->hw_free(), where snd_pcm_lib_free_pages() now returns -EBAD=
FD
and retains runtime->dma_buffer_p.

When the mapping is later unmapped and the substream is closed,
snd_pcm_release_substream() sees substream->runtime->state =3D=3D
SNDRV_PCM_STATE_OPEN, skips do_hw_free(), and skips snd_pcm_lib_free_pages()
because substream->managed_buffer_alloc is 0, leaking runtime->dma_buffer_p
and its card->total_pcm_alloc_bytes quota when snd_pcm_detach_substream()
frees substream->runtime.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/tencent_E90BB4F0861=
65FAA3313723567A5C675EA06@qq.com?part=3D1
