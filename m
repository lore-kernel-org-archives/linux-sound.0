Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571588;
	b=p1ZJmlemRR6dFL7VNpr/xX4uIds59lxmpiXNZUqWTvWv2g9alDXWV1fola0WI/XUgO9m
	 K9iO4ttX7NDruUtJmyBjbVpj5GtQFBKi7FIwFn+gBJIczEpeODAdCgaLteXLdhkmlK8Ck
	 JelYXDYlHsWXvN50iLsEX/scBGaQEvjKbnbSfqweVVSBYgLVwt8JCGWlmhwtKMzDF2gGE
	 hC8OQOjj42IaFc74SICRq3z+aZGpKbrHmZ4xelsoUXTXa6GvfTokoYNaVCNHctl24rVst
	 B0pUJShHnnsGyjUR93/p0BXoq2xSblVYJlksuIsTtmt26/haFxA6ASEvN3n9zejspZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571588;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=NUdVuu8PbEZipMNCXRTRBZBd/BcT/iyguuj+jTjCfxM=;
	b=5kfsoA03M73QasNwBha8dzzHjzrZ5KetG6Crmbve5N4EGIJl37eBH8taU4PPow6/uLSN
	 PUlDmgEwzfKcrp27XdpIOONSMerNfdB/8/Al8VA/g/2UvRg+5VNzf9Me6ry6QWKosLbXF
	 cF8GUr6Ibh+T5vt4eJEzMDuc9/cIkO7Qo7z74jq4IVitEe9EA6tGcHMvfzSwXqwfVbZ9N
	 i2XwAydqvjksvkltJI/p9YqNecbA4x5BKuyYD3ZJZXu/5ks2AFIAfiXxnieu3mFdHpW6M
	 F41IDm3Q8C6PClzGSYBWzkLWxdcuTgSmecMUirqn1wrynpq1OBmFWzjBDjBra3c82QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AzGzK1+M;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C9A606A33B
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 12:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AzGzK1+M
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 391131F000C4;
	Fri, 13 Nov 2026 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794571588;
	bh=NUdVuu8PbEZipMNCXRTRBZBd/BcT/iyguuj+jTjCfxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AzGzK1+MmeH/66J5+Mo77L3RsW/LN+E5yg7lBJ8jx2DszghEZ+ngIj7v8XPzHmH7A
	 mI8lvSVENDAsJ0xmR7Z2kaXvCohu8ClizESabJQbLRnxfeDTxm6Wm1ZF308B8vehkZ
	 qyr+j16sDgAMYDUBfpoWRZaIXBe8crEv0xf3QlRGtBZO6CVsN2oh60j8q1eVTUpUyu
	 JoikrdBbP7af4kvK1GWIqiq6e0AVl3TVdGpWWWkskyoCTKH5QxeBDW7Ipi/jxP1X8B
	 RuU6Qc0V78+2D5pyID8oVatGLdVBhbPAQAKX95zYHdt9PcDIZPw2w5ZKNfM79XMtn4
	 0pRTw4uKcZlFA==
Date: Fri, 13 Nov 2026 12:06:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 00/15] ASoC: soc-card: move snd_soc_card_xxx() to
 soc-card.c
Message-ID: <b624c779-0586-4e55-b11c-e92dc43d71d2@sirena.org.uk>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
 <179406327208.3424803.13117419976586053782.b4-ty@b4>
 <4dcf8dcb-bab0-43f7-8fc8-d2eba609ec10@packett.cool>
 <ac7e2bb3-90bf-49e9-9282-cd276b60b612@packett.cool>
 <76a4cf2e-2444-4e21-82f2-e4e08682980c@packett.cool>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z3tnHqMZT1tLIlC5"
Content-Disposition: inline
In-Reply-To: <76a4cf2e-2444-4e21-82f2-e4e08682980c@packett.cool>
X-Cookie: Flee at once, all is discovered.


--Z3tnHqMZT1tLIlC5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 11:41:25PM -0300, Val Packett wrote:

> Actually more related to the new devm_kzalloc_flex usage in
> soc_new_pcm_runtime. I'll try to get a fix submitted

d00ba321499c (ASoC: soc-core: reset rtd->num_components after allocation)
is probably what you need here.=20

--Z3tnHqMZT1tLIlC5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr2/TkACgkQJNaLcl1U
h9DP+Qf+NVOw+B2hjaNvXEKhygwD0kswQ/0iJhZAWfi8sF0fui2mwF9JjHVFdoDv
qAlyqLaCY24UXIACYDYt8W5buwTzbAYnCSfZhkYy3zUlXVnSOy/OEbX9oo2wfI7D
+c9+AYZs7j9wFX6Wl4y61cXFZkS+YCQTr/SAQfTE2vZKrHl/z1+qB+Kj49UWqfNK
QamASSud62PcXQqOkKJERuWT8Qe8G02MYM7y4fsMWJfNWXvZ5DlCN5gMyDjLK/gy
gRpMv9M67h57agSK+dVnq0MYRa3JhlVbbtWfKU2EFpUJIqzN3ZOZhUyU/pPcLoyB
pBOwmnmD8oABUolgQUj2L9/kW6uEWw==
=Q4iZ
-----END PGP SIGNATURE-----

--Z3tnHqMZT1tLIlC5--
