Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E941B4247
	for <linux-sound@vger.kernel.org>; Mon, 16 Jun 2025 14:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085317; cv=none; b=Hc6jJODlam/l2kXZUi+Ozl0yUMvdDgfsm6cFAjoU2aji2FoxuXJbZDoI2PH6DL0ZByzDH9iD71XR3JGWAZvDeuKahNpKiJBPobqWiUEehPVDRMwUVSxYrdobvfA+zbtvT57BjDiwQXCDZMWGnlGBxRAnVYWbL8AshoZpmWKz4J8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085317; c=relaxed/simple;
	bh=8binSv9LSyqTFp/MXMhAIBczQOCxiMC7x/fMeWYv4AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSvvuWFGv0IgkeEr9a8GoRKibfi+bu/buL3aaBXMBXqUX9zfPoRy6gdEuvK0ylLe2MPg5T/ZMPG5TwZmtexzvseaOoeVu3GoVozlrIGSsmhy0ZAUzQV3VxUIAmeX5NPRd4uMv4Fxu9j8HyLReezQNDNIhTdJ238TffZbRWh6Wtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgpP3WEV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgpP3WEV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BADFC4CEEA;
	Mon, 16 Jun 2025 14:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750085317;
	bh=8binSv9LSyqTFp/MXMhAIBczQOCxiMC7x/fMeWYv4AM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZgpP3WEVExK3helsovcZv5E84Ai9oJWnHCAvp4fC103fC145KcVGZBJsdVJ3n/unM
	 8fIsH1KRZLa1LoUd+0gJxM0zXN/PdEM/dIbs2h6DlKyG/Qy3ZU7vqzXZ+84A2eAjTB
	 8VcE/b6D6K8gGiSFOA/RWnTd4etTGbOzSNPcR/m/nsEJeANg1vweeRh0LqLdr03crj
	 T4wHYJf9KhRvVv1OERdGdDDmUbxfyn1PR9tcyWoeweyp9SBzVa/BovobzKd6YzdX8a
	 gjReBbTYB2vD37YGyqmYRffEbyALo7ZmxqvhhG3YAj28KEelDtsQ9NoMLRfIpbEBhZ
	 4MUBMdU3xJw6A==
Date: Mon, 16 Jun 2025 15:48:33 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: soc-ops-test: dynamically allocate struct
 snd_ctl_elem_value
Message-ID: <c1626628-8d71-4d8a-97b3-dc85eedaf030@sirena.org.uk>
References: <87sek489l8.wl-kuninori.morimoto.gx@renesas.com>
 <174983355578.217351.13383396626687362293.b4-ty@kernel.org>
 <874iwgp6jz.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eD/Vbm3vLxJtGqHs"
Content-Disposition: inline
In-Reply-To: <874iwgp6jz.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Keep out of the sunlight.


--eD/Vbm3vLxJtGqHs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 16, 2025 at 06:02:56AM +0000, Kuninori Morimoto wrote:
> > > This structure is really too larget to be allocated on the stack:

> > > 	linux/sound/soc/soc-ops-test.c:520:1: error: the frame size of\
> > > 	1304 bytes is larger than 1280 bytes
> > > 	[-Werror=3Dframe-larger-than=3D]

> > > Change the function to dynamically allocate it instead.

> > Applied to

> This patch is needed to latest linus/master tree, too.

Yeah, I tend to treat those more as warnings unless they're spectacular,
or someone reports practical problems.=20

--eD/Vbm3vLxJtGqHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhQLsAACgkQJNaLcl1U
h9BmDAf/dypNW7u9xOszjwK1NDY96i502TtssfDaAPXBbCvDCmLHkpvXvO+u82z1
c7RfLb0ffbtj9ENGGsTy2x2/6L5tl/5/ZpAOd8DlZbi1jkLj6HzjhPp01GQ7GxPq
C6XvOJ7tAd4YQJI09wejVZ7TJyQuSdpahAkK0BONJGbU2JdNeOlcx373+PB1kAua
UAvEdsq0oLu6nHmvvQxmR7XCeu7dkAHqzdvtJwjwg8x1yAWSOv/YC8KKvPCYEhAb
RzcBDNd8wFk3G5VWy8LUi0f2Jzlhd7DWCfaYPZBX1W9aajoC7blWPHTLPym/gopX
TWMvYSeMTqvz/xhUOMp++YoTPnIHXQ==
=UGtz
-----END PGP SIGNATURE-----

--eD/Vbm3vLxJtGqHs--
