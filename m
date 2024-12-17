Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4C11FBE9E;
	Tue, 17 Dec 2024 18:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734460215; cv=none; b=j2KE5heZyeXxzs3gFpm3z69/Wd+MtDKUFHRH8crPggug7uq3XrO+fO0u2eaPm+oZNFwL2EYluoE6ZwIyhcIkx7cy3pbtiTGpHvOVZQPyZI+bHrlrZ+Wxt3Uit4VUOKTYP4jF498sjyWf50sbfcP6yo7Fjhnt5d0AUO3xNotrToY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734460215; c=relaxed/simple;
	bh=d9FIQqibd8hQTaOoI6vJEWT2RhssOM0ePn9FFYhZKno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QFORgeExkLI6wmJnvK0pRLXoEqnaliXLCSMAiV/hGsQYs/dkV8DyRP0sW2Zzaq8C4v5tBYP0dIW2XflXu17/g8cp0d0taW3MqTZdJ9fQ6AJbAc+IiKVTvnkTOpWo2zN+26LqHulItaEaGo7jKMj0CSVKrdzo3/4GS/yED/gQUfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKR/273n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKR/273n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07856C4CED3;
	Tue, 17 Dec 2024 18:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734460215;
	bh=d9FIQqibd8hQTaOoI6vJEWT2RhssOM0ePn9FFYhZKno=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKR/273nO267majvSnOBUafH+uSiym8oBdkm+Z9Xx2Hx6xMYnDYY6lIDiNryqw1CS
	 UJgLDlCCbC9FLKU/jxhT8/aVH0S6fopXVCY+p+FjUMoKrm9taX8qVfAt75bZ0YFhw/
	 yDbdgx+y+uUXOcqSaKWTNTe7wrSGIIBNIGCWQCRjMP7MlR/EMlmMxDcm93RArKLcIF
	 jo4PBX+SL2jZcR4XODxYGP72yVekDZ++GxPoMed0oLRpCMwZtFXJy1keez3T2gP1vx
	 Pdb4zsbyZm7HO27lztJbYJLjf/Y5Xy/CCd6j1QcGPB9c9gnRl0K5x1LAbaF2qSUIng
	 obecWszcUmUaA==
Date: Tue, 17 Dec 2024 18:30:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: renesas,rsnd: remove
 post-init-providers property
Message-ID: <20241217-armless-unstable-7165d81cb35d@spud>
References: <877c7zno1n.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UALhVic58E0izIhY"
Content-Disposition: inline
In-Reply-To: <877c7zno1n.wl-kuninori.morimoto.gx@renesas.com>


--UALhVic58E0izIhY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 17, 2024 at 12:36:21AM +0000, Kuninori Morimoto wrote:
> commit f8da001ae7a ("ASoC: audio-graph-card2: Purge absent supplies for
> device tree nodes") marks multi/dpcm/c2c nodes as no suppliers. We no
> longer need to use post-init-providers property to break fw_devlink cycle
> (And no one is using it yet). Let's remove it.
>=20
> Fixes: a2187d0dadf ("ASoC: dt-bindings: renesas,rsnd: add post-init-provi=
ders property")

I'm not sure that this fixes tag is appropriate. I don't think this is a
fix for the cited commit, it is just now not required. If this were to
get backported, wouldn't stable be broken since the supply purging
commit doesn't appear to have a Fixes: tag or a CC: stable?

Thanks,
Conor.

> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> v1 -> v2
> 	- add missing DT maintainers
> 	- Tidyup the git-log
>=20
>  Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 6 ------
>  1 file changed, 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/=
Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> index 6d0d1514cd421..e8a2acb926460 100644
> --- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> +++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
> @@ -112,12 +112,6 @@ properties:
>      description: List of necessary clock names.
>      # details are defined below
> =20
> -  post-init-providers:
> -    description: At least if rsnd is using DPCM connection on Audio-Grap=
h-Card2,
> -      fw_devlink might doesn't have enough information to break the cycl=
e. rsnd
> -      driver will not be probed in such case. Same problem might occur w=
ith
> -      Multi-CPU/Codec or Codec2Codec.
> -
>    # ports is below
>    port:
>      $ref: audio-graph-port.yaml#/definitions/port-base
> --=20
> 2.43.0
>=20
>=20
>=20

--UALhVic58E0izIhY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2HDMwAKCRB4tDGHoIJi
0ij4AP9BIoNuonXfTxnbviXlHjhnRgVWS2hKH89gCTMbb2pmMgEA+aJJwD5wiUE8
OApNDU/j1gfAE6FdSvgjPYXRS5khmAQ=
=ki2B
-----END PGP SIGNATURE-----

--UALhVic58E0izIhY--
