Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795083950;
	b=QVs1d7u5TLnAIBsm4eJR9qLGJzCmGOcBvByn9PaoP5wAsXXaP2eZlewKEtFk3Kdc7Fht
	 460jEBlcajgv8KZs3ClLaIFdGQvqTzxyQpbH59t/Gv4m0RQdra+yHdknhpT+BbtQY96s6
	 ethXAPowjm0WHxY/XyXC2AEcpCdAr7HNCn1CcC8OQQlKL0l4gQaKNNvY/KovfFHnyAt5n
	 hEW6i5dSGYZ2thoPFTOPMK8yFQEJxFL5Z8nq3AbeLKXgN96MRHcmS6J+5E4qYMx3KSALU
	 TLbixDe7Eiwrqb+vGQlSXE/X2tPPAqRzWu8rHlPkxiBbGD0Tg5VmMr4QsIMBX6eUi8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795083950;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5XNwYLVboUVjISAwlLmGI6rMHe1RpE55vZQlev8APpg=;
	b=GLYH3NhRNObVpgaE5LDvmX/xyDw0i4eB2hDVIE45w+1DGgZVrd5A6Hrjh/PZeir2J+Y7
	 c67DPplBDxPMoRZnfrKZEEk1T7l4GMyfAK/Y/pdGNXwnHPV+IgLxQOPRttBfjYlNcS20i
	 MVKLzyn+FQjsXvAcJA1rvZ6uCbgVvBsaLPuEuhlVZpfPQVj1JFBveasAqgK7HOUzKw9XR
	 Ag2SIeWU9VNekoLp5a2OWG0uu8twZEgIZYC/vP/EX7AXEaLWcVazjamXE2k+yIQ5eP7RE
	 mdb9hJoQsSDRworuF5lrJ1MILoJky50m1PYlj2+pEsnMrbkhTUdGbU0bkp5Uv5CRcvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNrCknjd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03710606A333
	for <linux-sound@vger.kernel.org>; Thu, 19 Nov 2026 10:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hNrCknjd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD311F000C5;
	Thu, 19 Nov 2026 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795083949;
	bh=5XNwYLVboUVjISAwlLmGI6rMHe1RpE55vZQlev8APpg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hNrCknjdjdI2Qcv6tANK3IODV/X1HJWsLmlkiaywtfpc5OiSXNeSi2CrqbMPRYy2y
	 dOuTG7AuDnogq7A16SFMZEGIO/ZGwFT0cnOHp8Z+J90/bgNpbapLJ+l+IbRe+Ba1YH
	 fzsPcYXJ31yzmCqejJYOkHV4wMM7vya60L/bznkeBEuGrvcMSITagVdbj6Mo+U7f1U
	 bilJsPwNYWqhPz5DVJD96n2Jgg9xYomI60/AGOM8BG1BCIzKRZrz2alWrSV00lGhpm
	 Wa4g70yDEc5ia+9KQ4rrAb6AjMPbBdpoA/3UmabDHUAeQydS+o084kGdUnkvUAvjM6
	 pY7Y2QE4kAyqg==
Message-ID: <sashiko-outbox-222951@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: memalloc: Fix DMA allocation retry cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261119100928.2740-1-sreekuttan2156239@gmail.com>
References: <20261119100928.2740-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:25:49 +0000
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
- [High] ALSA: memalloc: GFP_DMA32 re-entry in do_alloc_pages() triggers
  VM_BUG_ON
- [High] ALSA: memalloc: do_alloc_pages() fails when
  dev->coherent_dma_mask is 0
- [Low] ALSA: memalloc: missing Fixes trailer in commit message
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] ALSA: memalloc: page leak and bad GFP retry in do_alloc_pages()
  [1]
--

commit 8facdcf2ba9ef9e2a164a42b37b12089edb8eb1a
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> ALSA: memalloc: Fix DMA allocation retry cleanup
>=20
> do_alloc_pages() retries allocation with lower DMA zones when the
> allocated address exceeds the device's coherent DMA mask.
>=20
> However, the previous allocation is not freed before retrying,
> leaking the allocated pages.
>=20
> Also, if no suitable DMA zone is available, the function can return
> an allocation outside the device's DMA mask.
>=20
> Free the allocated pages before retrying and return NULL when no
> suitable allocation can be obtained.
>=20
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
Should this commit include a Fixes: tag for the commit that added the DMA
zone retry logic in do_alloc_pages()?

  Fixes: dd164fbfdc20 ("ALSA: memalloc: Drop special handling of GFP for CO=
NTINUOUS allocation")

> diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
> index 5986e9b84ac0a..9458f9cbee537 100644
> --- a/sound/core/memalloc.c
> +++ b/sound/core/memalloc.c
> @@ -298,13 +298,17 @@ static void *do_alloc_pages(struct device *dev, siz=
e_t size, dma_addr_t *addr,
>  		return p;
>  	if ((*addr + size - 1) & ~dev->coherent_dma_mask) {
>  		if (IS_ENABLED(CONFIG_ZONE_DMA32) && !(gfp & GFP_DMA32)) {
> +			free_pages_exact(p, size);
>  			gfp |=3D GFP_DMA32;
>  			goto again;
>  		}
>  		if (IS_ENABLED(CONFIG_ZONE_DMA) && !(gfp & GFP_DMA)) {
> +			free_pages_exact(p, size);
>  			gfp =3D (gfp & ~GFP_DMA32) | GFP_DMA;
>  			goto again;
>  		}

[Severity: High]
This problem wasn't introduced by this patch, but when the GFP_DMA retry in
do_alloc_pages() still exceeds dev->coherent_dma_mask [1], doesn't the
first branch match !(gfp & GFP_DMA32) again because the GFP_DMA branch
cleared GFP_DMA32?

Instead of reaching the new return NULL fallback below, execution re-enters
the first branch, sets GFP_DMA | GFP_DMA32, and triggers VM_BUG_ON() on
GFP_ZONE_BAD in gfp_zone() on the next alloc_pages_exact() call.  Checking
!(gfp & (GFP_DMA32 | GFP_DMA)) in the first branch avoids re-entering it
after GFP_DMA has been tried.

> +		free_pages_exact(p, size);
> +		return NULL;
>  	}

[Severity: High]
Does returning NULL here cause do_alloc_pages() to unconditionally fail
when a caller passes a non-NULL struct device whose coherent_dma_mask is 0?

When dev->coherent_dma_mask is 0, ~dev->coherent_dma_mask is all ones, so
every retry fails the mask check and now hits this return NULL.  For
example, tascam_init_pcm() passes tascam->dev->dev.parent (a USB hub device
with coherent_dma_mask =3D=3D 0) with SNDRV_DMA_TYPE_CONTINUOUS:

sound/usb/usx2y/us144mkii_pcm.c:tascam_init_pcm() {
	...
	snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_CONTINUOUS,
				       tascam->dev->dev.parent, 64 * 1024,
				       tascam_pcm_hw.buffer_bytes_max);
	...
}

With this regression, PCM buffer allocation for the TASCAM US-144MKII fails
with -ENOMEM.  Should do_alloc_pages() check if (!dev ||
!dev->coherent_dma_mask) before enforcing coherent_dma_mask?

[1] https://sashiko.dev/#/bug/linux-189ef083-a418-4b5d-b005-2d24356f0b93

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119100928.2740=
-1-sreekuttan2156239@gmail.com?part=3D1
