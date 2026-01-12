Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BC92E0B5C;
	Mon, 12 Jan 2026 14:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768228274; cv=none; b=mMIEdP8LXatenN4HiOyUcVpGlCoLWQK11qEdxiFkZ6Y3qjpNGn+w1iaELiDOWUBN+ZA7zEVNd7HBxq5VT4rNGH6VY76GM0qPVqn/G/OKtpO5Mek8K1Yp6sqz4JR00vk2T5WZElBIMgDJz4VW9eh/RzQIUMY7q61hr/17iZeWbvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768228274; c=relaxed/simple;
	bh=d9TxG3RE+HlK+Yb0HVhLrfZuEwgynlsRJ/MMbSYgE4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILFFPnjvX4QVOjbQyXvdoNpe0hrFZbkwjmHSyYpASD/jCELDfRTvKDvQTSoZm1tBY3hY26/1Ov/BgNGMTebc41npG2lwzF/ijnCMoF/SsZpU/D/2xgo66FHm5yyxOQch+wlqualhzwtn6llYrdadb4RuSwxxEvDhubPPs4h900w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZl+uLeM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZl+uLeM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06FCDC16AAE;
	Mon, 12 Jan 2026 14:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768228274;
	bh=d9TxG3RE+HlK+Yb0HVhLrfZuEwgynlsRJ/MMbSYgE4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pZl+uLeMjfKS7W8+70vnQagbtBxdppfw6nsaz9r7z8HTULgxVtAWxpw0PUUhNS1I4
	 8hAW7cnEYI/W9VFkdyD+NWzzzK5Zk85Mj8TbEni8Q+gi1v223vL6rFLyT6AMS1Ai47
	 XlyzAdJwcY1m5gr/e2N1VJj+KsFjD61kZYxkCJCcs2KvZ6yI9RLRDaV0lvJcQkU5DS
	 qyRANx+0VBti9pPpGiwwcgeAkpUPlBsFPbYgcYyMtqr2k+IRGo3l26Nzg9n34FZmVB
	 Ci+05PDZVVZVu/dzIShfBxv4sr9y74QBpZW2JMf6tGB7B/qBdaawY69+WpVtkZAF/k
	 E4gkQei4UC75Q==
Date: Mon, 12 Jan 2026 14:31:09 +0000
From: Mark Brown <broonie@kernel.org>
To: cy_huang@richtek.com
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, musk_wang@richtek.com,
	roy_chiu@richtek.com, allen_lin@richtek.com,
	devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] dt-bindings: sound: rtq9128: Add rtq9154 backward
 compatible
Message-ID: <16b5a932-8ff1-4519-a208-dbe68e6fb76e@sirena.org.uk>
References: <cover.1768180827.git.cy_huang@richtek.com>
 <ab31e3965e9cb50ecdc14d5ea90d70dc26d1d187.1768180827.git.cy_huang@richtek.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wjutb6xtYoUI47Hc"
Content-Disposition: inline
In-Reply-To: <ab31e3965e9cb50ecdc14d5ea90d70dc26d1d187.1768180827.git.cy_huang@richtek.com>
X-Cookie: Surprise due today.  Also the rent.


--wjutb6xtYoUI47Hc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 09:27:33AM +0800, cy_huang@richtek.com wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
>=20
> Add rtq9154 backward compatible support.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--wjutb6xtYoUI47Hc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmllBawACgkQJNaLcl1U
h9DpWggAhH5Aj515SZY7Qs+k1j4gybNaAEkFKG9jZOZJavBFKXsLIdRjDYBlg8cU
USHNdUpj3DbFKpsvLKFW3rRdxwgPEN+WLgrHIvZgFjE2qs75YcV39Epcgs1TBiQg
icIkTNSBoFQ0QDlkW95MT1NoyH4WRwis8ga4OyPsil5lX0+dOQ5BFD7+YBeUmN6P
RJiTQmayZLtX5WX/mnmsp9RXG2RtbC6ZiZJoM7AICchcVHT19JvzT0jy3NcS9LaX
1bdter7Eh37pEdLUOZOFTvQEXKExIREeQpOfadcuiE8xPMHh5XilQa0xIkMdWNN4
/q9u0qSM0os87m5Vmjgx5nWHniZMvg==
=aDHr
-----END PGP SIGNATURE-----

--wjutb6xtYoUI47Hc--
