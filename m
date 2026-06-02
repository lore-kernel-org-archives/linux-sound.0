Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720A33E7BB8;
	Tue,  2 Jun 2026 16:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780416477; cv=none; b=fJ5a8i/tVbw4w0ruJmiQ/oDCTnJLsM7QQ3HX23jotaBt2y8CEYGK2u0CCwCjedeJ/hDnw+e8ACI9tIkR6z5H8suTYtLJnHVU1HLeqqTrdLxt9IdjZp8Yyon3d4t7v/AfWxK7zbM30ja0jJDSf5vtqwYgwRYk0vD+7VZ2CkcJOd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780416477; c=relaxed/simple;
	bh=BBZiqqFUMd7TOQJehKbIg7es+BB8z34mlXFj/R54KME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cui1MRFNkBfsY65vjfmk2skyw17HkXoodi4/9VVxSXLK6b0A3VbrY7022H6ppr8PdTnYsVpsIMtQQEOK55dwa8qLF62PoYGEcm8ZA2ymtpfxjHQJ+TSMsilCk75vkeJUCfweUgPK3/LPc1wBBP1KL+hUuuMtzpmC3O5F5nZRyJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3M+DA9K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3M+DA9K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6B51F00898;
	Tue,  2 Jun 2026 16:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780416476;
	bh=BBZiqqFUMd7TOQJehKbIg7es+BB8z34mlXFj/R54KME=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b3M+DA9KEYNJf6fRHbF6Jxjl8VmoGD8uhtl3tokPyNoHE5usjVmwNnCQNEmGx/IIb
	 t15zS2QltkNEBCq9E/L/QbemGI0BW9Bx8vW4257oeBCVFcRYUL9yt60hMIrMuBp17d
	 3ovWdJDdcYp1sKa8YtNjGKXqV/ANAcw4hgDOLb2M9jjrmzz11NzvuYonPMjtw/5SY2
	 VLziXagn9GmS0T0HX0x/snvy5L5zlZmLWUa7LgYzFaRQhybGfovPi8aLyTcdnQcJKG
	 Cz813MCCi0kQanxIA9D1iQBzmOPHm249cpkkZF9AI0d7DahfCTkPKGD0HcargCosm7
	 UqTrCpWt279Gw==
Date: Tue, 2 Jun 2026 17:07:51 +0100
From: Mark Brown <broonie@kernel.org>
To: wangdich9700@163.com
Cc: tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, wangdicheng <wangdicheng@kylinos.cn>
Subject: Re: [PATCH v2] ASoC: codecs: Use struct_size() for aw_container
 allocation
Message-ID: <4b8bcd78-431e-42cc-9e7a-357ce46d4bff@sirena.org.uk>
References: <20260602013701.38855-1-wangdich9700@163.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oKR712/VgHX9Xano"
Content-Disposition: inline
In-Reply-To: <20260602013701.38855-1-wangdich9700@163.com>
X-Cookie: The wages of sin are unreported.


--oKR712/VgHX9Xano
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 09:37:01AM +0800, wangdich9700@163.com wrote:
> From: wangdicheng <wangdicheng@kylinos.cn>
>=20
> The aw88395 driver and its variants (aw88081, aw88261) use sizeof(int)
> when allocating memory for struct aw_container. This should use
> struct_size() helper macro instead for proper type safety and
> portability.

Actually someone else already sent this change, it's in my current tree.

--oKR712/VgHX9Xano
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe/9cACgkQJNaLcl1U
h9CTpgf7Br4ERl6ggjXVUBb1u3Juqhp6a+gQnQUBzG5SpzvOk16SKBwI9/rQDVws
wYoVWnI5VDhwzV9W2Sr/DN0FsKMrmNsz71LF+Nyv1iwGZ8HLSP0da+Z1a+T35N8m
hJSNcyJAZ4AyjEsr5eHjLLPXnAwJLr1cfyXw8wh2vFJ1JoLbc/5QQEy5MEoZTZ9u
p7dfV5FzWIts5RP6QcyjpDxe4x2VgCNqBbK75AgIX0RnE4f/5nFqM4DqdAk2f+J+
DbONT/VrsHM6YsoNyw7W3z6uAdDwiRR2CFN6qjvpGsXhvNHj7vcx2HIDyflU0Cj9
tXhuwYggkyOiHZmLLBHNqs3ZWgNhFw==
=8Aw6
-----END PGP SIGNATURE-----

--oKR712/VgHX9Xano--
