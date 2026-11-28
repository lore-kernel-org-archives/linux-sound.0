Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795853840;
	b=0tt1mr27ik8U6KNpw5iLVl41M6Iu7dH7rg17t4Hjt0iM2bwFJGgCDh7ckm9aJAXLVE/n
	 248q8T3aR9qv51LXp3O4p1it3KjCMkleackbKqV2kVuCCvaCiOPYzcRHJ7mXqZ6fSCNNe
	 VwmTnKfMSlv1KakWE1zf3jSLmx7MxiX3JtJRdpLe58xaUhAx0P4dqQ7iU1R6KuDL1yRlR
	 YtyEWYIPjfwBXO885KLJYuj5WkSN/tEsfWYHxzf1GX6XxqISSUfd09KLYV5pMC8ymR69c
	 uEvXIXXH7SzPSt/qKWDZbmDQDl2x7YVzrBpk4kpX5B3bpBHn9tC8vFSPkpzwLg/mV+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795853840;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DvwAHUA9xxAcJieYquaWRmbNrxSC7oy6ogor0rVDELo=;
	b=w5HZFxQQzf/4GhPPeMK1wQhymIdGYrr0k0gPY2PN2FjZBgVZvQpRkCPAhhj2gRE3nCv/
	 IP2584jjWeU6XUYvTWmh/lu+WAQsWrMdzUku2+dkH2hV7Z280cLqBePpl8L0lhoUxy41T
	 /HqXpV1X9uYMPlayj/lpfCXyNshHd64xOd1P0cNEx0qV8J0NMU23vk4SWMxXjcxns9j6N
	 ZDcMfQ0HxsR+p2MqaLZ5/WhTCWI4Kitw1D5tc3JwdnV9I2xRZ9G9h0Hepgup2hpeL4Map
	 ebLyUZzvphrctf7JI3XV8VR913a2TCq3ajE941Ltmz8+p2ElSIk3152aiet4TyXWIPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nyr05iZb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CA2606A31C
	for <linux-sound@vger.kernel.org>; Sat, 28 Nov 2026 08:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nyr05iZb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB7861F00899;
	Sat, 28 Nov 2026 08:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795853840;
	bh=DvwAHUA9xxAcJieYquaWRmbNrxSC7oy6ogor0rVDELo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nyr05iZbDNsarUN9ilpVUKJQOyijX3BIuOFDmn6yeskcdfXJZ5t68I38i3WaTw1zr
	 uDCLfgvihZjlNR9pcqOxan2fG4Rk6Egiqwcr847gt5q7ywfRMNoutld+TI6diDNvB3
	 C0TXK0bl8zhO/GQ1kBZf+lmu5xx4ltdIIVNvjKTTQLad4Qci0jO/h3Kea8CPvhDXPY
	 B7SKsM0/Mn8LVvalZuH05fT7e6+zAlTIoq29CaaFstn2nVT4q5uj2d0JxVM9iGchj3
	 N4c/FuHaeXkSzXKPuV5RHhsPfuE/fDfB4Sm04yIGvOindLTh2ojBga/Z50x26sqWf1
	 tzzqdgKT7eI0w==
Message-ID: <sashiko-outbox-238537@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] aoa: Fix codec unregister handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sreeraj S Kurup" <sreekuttan2156239@gmail.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261128081025.2878-1-sreekuttan2156239@gmail.com>
References: <20261128081025.2878-1-sreekuttan2156239@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 08:17:19 +0000
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
- [Low] ALSA: aoa: aoa_codec_unregister() duplicates
  aoa_fabric_unlink_codec()
- [Low] ALSA: aoa: missing Fixes: trailer in commit message
--

commit b926c8dbc73cbd6442745a299e6053651d3d611b
Author: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

> aoa: Fix codec unregister handling
>
> Fix aoa_codec_unregister() to use the codec's own fabric pointer
> when removing a codec.
>
> Previously, the function checked the global fabric pointer instead
> of codec->fabric. This could call the fabric's remove_codec()
> callback for a codec that was never attached to the fabric.
>
> The function also called module_put() unconditionally, even when
> no module reference had been acquired by attach_codec_to_fabric().
> This could cause an incorrect module reference count.
>
> Save codec->fabric before unregistering the codec, and call
> exit(), remove_codec(), and module_put() only when the codec is
> actually attached to a fabric.
>
> This also prevents releasing the module reference a second time
> when codec initialization has already failed and the attach path
> has cleaned up.
>
> Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>

[Severity: Low]
Since this fixes a bug introduced when snd-aoa was added, should it include:

  Fixes: f3d9478b2ce4 ("[ALSA] snd-aoa: add snd-aoa")

> diff --git a/sound/aoa/core/core.c b/sound/aoa/core/core.c
> index 99b032a4081fd..41a3b79ca93a2 100644
> --- a/sound/aoa/core/core.c
> +++ b/sound/aoa/core/core.c
> @@ -71,13 +71,18 @@ EXPORT_SYMBOL_GPL(aoa_codec_register);
> =20
>  void aoa_codec_unregister(struct aoa_codec *codec)
>  {
> +	struct aoa_fabric *codec_fabric =3D codec->fabric;
> +
>  	list_del(&codec->list);
> -	if (codec->fabric && codec->exit)
> -		codec->exit(codec);
> -	if (fabric && fabric->remove_codec)
> -		fabric->remove_codec(codec);
> -	codec->fabric =3D NULL;
> -	module_put(codec->owner);
> +	if (codec_fabric) {
> +		if (codec->exit)
> +			codec->exit(codec);
> +		if (codec_fabric->remove_codec)
> +			codec_fabric->remove_codec(codec);
> +
> +		codec->fabric =3D NULL;
> +		module_put(codec->owner);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(aoa_codec_unregister);

[Severity: Low]
This isn't a bug, but could this call aoa_fabric_unlink_codec(codec) when
codec->fabric is set, the same way aoa_fabric_unregister() does, instead of
duplicating the detach sequence?

sound/aoa/core/core.c:aoa_fabric_unlink_codec() {
    ...
	if (codec->exit)
		codec->exit(codec);
	if (codec->fabric->remove_codec)
		codec->fabric->remove_codec(codec);
	codec->fabric =3D NULL;
	module_put(codec->owner);
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128081025.2878=
-1-sreekuttan2156239@gmail.com?part=3D1
