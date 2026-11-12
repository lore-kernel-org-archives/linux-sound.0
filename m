Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487762;
	b=Rum2YYOxnm0V8751wF23NQx9p9ZPJYyZmWq2AVC513/Rs3EBssJCzqQDoArAZAts9boJ
	 umKbFqrSUEhkOBczaJz49HQgvtn865xRKupVY+COvbdrk99BgHFH6zS24TbnUHT6SW3MZ
	 5nhpUHsArcYRlwcR/GwCPPuRmzwRjcs8U5j3Lc4AisYNQCKts7B9i/zbfHBnjPYXddF5J
	 I5Uj9pLb0dSUANJwydiFXwbY2K+kBNcq+COiMDMDKTNvZlMRMWfpo2+EvKrG6M1LDmLY0
	 H90mVbry1raQw0PyJwVwczjUyfYpMCuG+mLOYCzSoeBrM/+0bhgU0TnSg1lt2d7gYbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487762;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dolrLByjkYsrbPGxDnW2iVCd5kMUBChxOyhyt/14gEc=;
	b=JVU7z7SxFKtDOdgYb7wseky7de0fBnWRhFuh/KuIZnbxdQ2Ur1un7zQGNe9+JRkvzorx
	 y99cJzvzet52hqHv77TLDA85tqQJ34/Li5JOEiAIevCrlVrx2B8UZnmLAikH5lI4uF45k
	 qsIuIGeB+oULksLjW6AVCzVk8RiNskLQ7GsEhWsWnJxpblOqFU1QrwnYAVCoaSvx3Y+4v
	 /YxBJQab0BCuWAz4o0kNz2nBegzNMT9fU7JV7Jb2Ul2QCHpaB2gGx0iUjouiuxQ/TmaO/
	 RHIB7WG51vS1oK26U2rxg165iz4muD/dq6kdU8XUPZx6+WU3OOcGf1hovcCQBNci6dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JhTmnE3p;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444A9606A8A4
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JhTmnE3p
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C6FF1F00A05;
	Thu, 12 Nov 2026 12:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794487762;
	bh=dolrLByjkYsrbPGxDnW2iVCd5kMUBChxOyhyt/14gEc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=JhTmnE3pny4/cSKqNTGiJq0V75xCho+lPEmcYk3EpMgZH7ansgxVUqlHLMyB+pGi4
	 I+++Nd+004icrvuzuxPADeh1lPHct5wfgxbcZME/TXViV5HGzkm2h6DCFRvdjXXvXs
	 EgFQBWQnyvyZfM4fYu7uVTbXtOYxuXEVSmHv9Ws4rTu6lkOaEdnm1lnGH1hWeudaCp
	 v7t3GSZH2TxfzA2lJi4t5PKlf8sMVV+xUTlz7wxvokhkqw8QenzXFXaM0xG/0ZEZHG
	 32cDBSAN7cE3oytDM+Fx31oorPfnmBNSUhRiilUY5ya3UmYh6JqT5sT++jy1kYh5c9
	 GrMrMpa+2SYFA==
Message-ID: <sashiko-outbox-211111@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ALSA: pcm: oss: Compare max buffer size in bytes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Takashi Iwai" <tiwai@suse.de>, linux-sound@vger.kernel.org
In-Reply-To: <20261112123430.684056-1-tiwai@suse.de>
References: <20261112123430.684056-1-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 12:49:21 +0000
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
- [Medium] ALSA: oss: array3_size() overflow hits snd_BUG_ON() in
  snd_pcm_plugin_alloc()
--

commit 97a1260d8f9d7c584f3610ce297a74916707f416
Author: Takashi Iwai <tiwai@suse.de>

ALSA: pcm: oss: Compare max buffer size in bytes

This commit moves the 1MB upper-limit check in snd_pcm_plugin_alloc()
to after the bit-to-byte division so the limit is enforced in bytes
rather than bits.

> diff --git a/sound/core/oss/pcm_plugin.c b/sound/core/oss/pcm_plugin.c
> index 3de7137799936..c5b3c67345eeb 100644
> --- a/sound/core/oss/pcm_plugin.c
> +++ b/sound/core/oss/pcm_plugin.c
> @@ -48,12 +48,12 @@ static int snd_pcm_plugin_alloc(struct snd_pcm_plugin=
 *plugin, snd_pcm_uframes_t
>  	if (width < 0)
>  		return width;
>  	size =3D array3_size(frames, format->channels, width);
> -	/* check for too large period size once again */
> -	if (size > 1024 * 1024)
> -		return -ENOMEM;
>  	if (snd_BUG_ON(size % 8))
>  		return -ENXIO;
>  	size /=3D 8;
> +	/* check for too large period size once again */
> +	if (size > 1024 * 1024)
> +		return -ENOMEM;

[Severity: Medium]
Can a multiplication overflow in array3_size() now trigger snd_BUG_ON()?
When array3_size() overflows, it saturates to SIZE_MAX, where SIZE_MAX % 8
is 7.  With the size > 1024 * 1024 check moved past snd_BUG_ON(size % 8),
a saturated size hits the WARN_ON() in snd_BUG_ON() when CONFIG_SND_DEBUG
is enabled and returns -ENXIO instead of -ENOMEM.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112123430.6840=
56-1-tiwai@suse.de?part=3D1
