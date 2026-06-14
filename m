Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B6734A773;
	Sun, 14 Jun 2026 00:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781395204; cv=none; b=iBFwzFe0WBpcZG5qYfDvG4JYdLd3noML2QAND+aTI6pbmfEVBXJekUyLknUSZ4Rxl9FQDqvFXqa2jrrTO4YacRGusFKorBb/t1eWRiXX1VmB8zNQ7s/ULQVo2ExxaAAX3QH5ADLyU9L85gwBj3VjmuUoP9nH6Aae3DDfQTFTTrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781395204; c=relaxed/simple;
	bh=jFF+eeZB1ecvhkue+I1HaUT9KdxZPWEZs3yw9ZdZz58=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4+JH4ofpTrK82IEmshm8pyUX2tGh2TrDh/kDNyMKZwaYvOlxgG7UU197zX1Ze055k7/nXtyPwS1JVuSG53MI8oXidcQieTnDaUQ0E/AvjvwJTAo9qMOSDGz2atHxuhzf98rpdNpbbqiOyBuEz9q7gZYPmtK5rcBdi5yMWjQhlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEQiDdum; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEQiDdum"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588771F000E9;
	Sun, 14 Jun 2026 00:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781395203;
	bh=vWnYftrBfPVj2NQwXF5MfjOIipJux2nhgBrNfiqs4wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HEQiDdumz+3QAq715Ly3n07550/kVJxYYnPMEdq4GuQ+a6XAKDJ+ihc9vYFatK3ON
	 Ovcz3PIYVLLL6lknkhuXqkAzrJQmrI4Ok9DSI7OcLcNERfPkLotZCtiHT6LyCvL+yb
	 z8qrg6jNb71mMmPZZPv6vFlGCEbEwTPEXZ3V9YXlW1MkotBoIvYKUEghWEXQmagXtO
	 /XiP2OOTV+umsyjXuxQrcmIm/m6MHl1jVnxPwMNtEGTRHFrJOzCq/A6PAFIL+CWro1
	 sYzBhHkmWK5K3TGw/JnwdV6t1A/3Q6hqIEMN91cq7gWUZhTWq0Zp0/CO1Fkxk4wiKq
	 f0lBivr8whWPw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 325941AC5AC5; Sun, 14 Jun 2026 01:00:00 +0100 (BST)
Date: Sun, 14 Jun 2026 01:00:00 +0100
From: Mark Brown <broonie@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] ASoC: Match DT helper types
Message-ID: <ai3vAG1-rXB2fanG@sirena.co.uk>
References: <20260612214904.1882991-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WmzbjAo2OCEmQmFD"
Content-Disposition: inline
In-Reply-To: <20260612214904.1882991-1-robh@kernel.org>
X-Cookie: Price does not include taxes.


--WmzbjAo2OCEmQmFD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 04:49:02PM -0500, Rob Herring (Arm) wrote:
> The affected ASoC drivers read properties whose bindings use boolean
> flags, normal uint32 cells, or phandle-style arrays. Using helpers for
> a different encoding makes those accesses disagree with the binding.

> Use helpers that match the documented encoding and keep the existing
> driver storage by copying through temporary values where needed.

This feels like it would be easier to deal with as separate commits for
each issue...

> --- a/sound/soc/rockchip/rockchip_pdm.c
> +++ b/sound/soc/rockchip/rockchip_pdm.c
> @@ -546,8 +546,7 @@ static int rockchip_pdm_path_parse(struct rk_pdm_dev =
*pdm, struct device_node *n
>  	unsigned int path[PDM_PATH_MAX];
>  	int cnt =3D 0, ret =3D 0, i =3D 0, val =3D 0, msk =3D 0;
> =20
> -	cnt =3D of_count_phandle_with_args(node, "rockchip,path-map",
> -					 NULL);
> +	cnt =3D of_property_count_u32_elems(node, "rockchip,path-map");
>  	if (cnt !=3D PDM_PATH_MAX)
>  		return cnt;

The error codes reported by these two functions for missing properties
differ (-ENOENT vs -EINVAL) and the caller of this function has a
specific check for -ENOENT which allows it.

--WmzbjAo2OCEmQmFD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmot7v8ACgkQJNaLcl1U
h9A3sgf/SDzvTG6Xl4sXlpglcdGeWlHrsF3pMXdJW0ufLi3V/x9khABDQtW9Jgsd
g2hiQdTlV1K2E2NfPxFOboHPibROXNNvxHkV0FeKBmtodnyYZjEtsbtDSSP6c72c
wlU9lB/QgtlmG4Hj2CGgsV0A9JoLdf5Z3BD2266tGv5vfn028M5yOB+QLRqOVZbV
6HmgmuDLjhfYNkmTxugAICnoXElgp0MRV7DGNeIXFVzdqRCtzOufoT6l6bwPsmYY
WNlBs0E/jjsMIaYXqYeBV8wGV6Hsjgd1Frvz6x3oozgxY4+q8g1F4Ma2NXVQJT11
oGWlrnDcFmLFF0LdkR5NcPilBPLEYw==
=8qCV
-----END PGP SIGNATURE-----

--WmzbjAo2OCEmQmFD--
