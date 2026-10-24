Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792837321;
	b=wAzSz/klhg8PwaBW/KQHWNKpzYgPkKcwlalgsTMMtAw75K8EAHohX/Utem8lCMTvOUDy
	 eO4IYqRzutMthWoFsXYsTcDusF9xVp6z2OM674QhvLFXkPeqPQnpM7adjDnJjhxdeGqZ2
	 IIKWqQoqoh8ItarN8cXYEIwmDPYcYBnTxgov9jXXYd51/1YWYOfsTyc3Dxzj42pIO0RAx
	 4gz6myqRAvWZAs2+YqFHEj480ds9PCiKioCaeJ0aI20i0GgbowgguPSVzvG++372Zdosi
	 d4C/kA0nKPGX3i0kDvLj4qCSeaXEILMiO3QRKoDdp9KLyWsCDIJkvefCaD4Iciup5KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792837321;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=eYXM4y7vVcl00H+9DObDCdderh0QDVdn3eYPAzsxly4=;
	b=lgV1nNWi4Iii7s1jbiNiDHGK85Kdx4jsOqZp8TJYOEAaHFd9Bc1hYsCM1a/P7nG+HMMW
	 9kb9vl8vI+R+vtzpQnfyyK/9VCSlWYREmWiagiZQxiVB/rdgVuExGZiyVsKLvcerucPha
	 5znZ2axfpMng3gjyn1OHSQOdBSYkn/jS5uuDQVQNSyyB92S07E1enja61JHXQ2pZIkS3V
	 N8GJevzzv6kj/W3hmkJQZIKzIn2FpUFVajdzQcYpgGvpq19PiUl2Mw4SO8nUdpoZPzjnP
	 3qr2h5fk6bx3sPh02tdhhRgkqvFcgel4vv+6srfFp6ethiXszJjqlRztWpvJ4wIMJLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OOZxQpcM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5B7606A31B
	for <linux-sound@vger.kernel.org>; Sat, 24 Oct 2026 10:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OOZxQpcM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3982F1F01825;
	Sat, 24 Oct 2026 10:21:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792837320;
	bh=eYXM4y7vVcl00H+9DObDCdderh0QDVdn3eYPAzsxly4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OOZxQpcMc8VvkkOt82eS9CKR1G/9ZWClkZJCGAzGW5CmyyFBgN0kuiE+QE8QWRd/G
	 4VUJHDQuoPtZZIKtZS9Lzxjnsa4uVENe3m/uMUnPnNvZf+o/VeAcsVFcwclYDokfNz
	 Hjl9Q7OO4/TOdsucXOTtFwrAeC7r+AKsPxKB8aLoUntOzuuXzcdYfJHRhit0mDpHTK
	 /rtpVCs7+BnzhmSqigkVjElzJuKJmZKnkVpQ9TuLvAB4//+Gwb7Ar+rN/w51v6FiR6
	 IghfpV6CIfh4opwvPcQ8nDMWmGtS71jfqAwMcullCTaSRjggiZJ4bPAH2fg5h8JEIX
	 4eVHhNJmE/XDg==
Message-ID: <sashiko-outbox-183642@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: us122l: mark hwdep mappings VM_MIXEDMAP
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?TG9yZW56byBTdG9ha2VzIChBUk0p?= <ljs@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Jaroslav Kysela" <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, "Kazuki Hanai" <hnkz.64@gmail.com>
Cc: "Takashi Iwai" <tiwai@suse.de>, linux-sound@vger.kernel.org, linux-mm@kvack.org, "David
 Carlier" <devnexen@gmail.com>
In-Reply-To: <20261023-fix-us122l-mixedmap-v1-1-e7bdd053850f@kernel.org>
References: <20261023-fix-us122l-mixedmap-v1-1-e7bdd053850f@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 24 Oct 2026 10:21:59 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ALSA: us122l: VM_MIXEDMAP in usb_stream_hwdep_mmap() breaks mremap=
()
--

commit c40f3445d293957b8d56aca33b8d5ed4071fcf4b
Author: Lorenzo Stoakes (ARM) <ljs@kernel.org>

ALSA: us122l: mark hwdep mappings VM_MIXEDMAP

This commit sets VM_MIXEDMAP in usb_stream_hwdep_mmap() so that clearing
VM_MAYWRITE on read mappings satisfies the core mm requirement that
mappings clearing VMA_MAYWRITE_BIT must not be mm-managed.

> diff --git a/sound/usb/usx2y/us122l.c b/sound/usb/usx2y/us122l.c
> index a5db0d044ef96..2986a90ea3351 100644
> --- a/sound/usb/usx2y/us122l.c
> +++ b/sound/usb/usx2y/us122l.c
> @@ -193,7 +193,7 @@ static int usb_stream_hwdep_mmap(struct snd_hwdep *hw,
>  	}
> =20
>  	area->vm_ops =3D &usb_stream_hwdep_vm_ops;
> -	vm_flags_set(area, VM_DONTDUMP);
> +	vm_flags_set(area, VM_MIXEDMAP | VM_DONTDUMP);
>  	if (!read)
>  		vm_flags_set(area, VM_DONTEXPAND);

[Severity: High]
Does setting VM_MIXEDMAP here cause a regression when userspace expands
the read mapping with mremap()?

In sound/usb/usx2y/us122l.c:usb_stream_hwdep_mmap(), VM_DONTEXPAND is
intentionally omitted when read is true so that userspace (such as the
alsa-plugins pcm_usb_stream plugin) can initially mmap() the first page to
read s->read_size and then expand the read VMA to s->read_size via
mremap().

When userspace calls mremap() to expand this VMA and the virtual address
range following the VMA is unmapped, do_mremap() -> mremap_at() ->
expand_vma() takes the in-place expansion path in mm/mremap.c:

mm/mremap.c:expand_vma() {
	if (vrm_can_expand_in_place(vrm)) {
		err =3D expand_vma_in_place(vrm);
		if (err)
			return err;

		/* OK we're done! */
		return vrm->addr;
	}
}

expand_vma_in_place() then calls vma_merge_extend():

mm/mremap.c:expand_vma_in_place() {
	vma =3D vma_merge_extend(&vmi, vma, vrm->delta);
	if (!vma) {
		vrm_uncharge(vrm);
		return -ENOMEM;
	}
}

However, vma_merge_extend() -> vma_merge_new_range() in mm/vma.c checks
whether the VMA flags allow merging:

mm/vma.c:vma_merge_new_range() {
	if (!vma_flags_can_merge(&vmg->vma_flags))
		return NULL;
}

And vma_flags_can_merge() -> vma_flags_is_mm_backed() ->
vma_flags_is_mm_managed() in include/linux/mm.h rejects VMAs with
VMA_MIXEDMAP_BIT set:

include/linux/mm.h:vma_flags_is_mm_managed() {
	return !vma_flags_test_any(flags, VMA_PFNMAP_BIT, VMA_MIXEDMAP_BIT);
}

With VM_MIXEDMAP set on the read VMA, won't vma_merge_extend() return NULL
and cause expand_vma_in_place() to fail the mremap() call with -ENOMEM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-fix-us122l=
-mixedmap-v1-1-e7bdd053850f@kernel.org?part=3D1
