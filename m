Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD98A25179A
	for <linux-sound@vger.kernel.org>; Wed,  4 Jun 2025 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749036041; cv=none; b=H5A2RuGP3GJ3+RcNKALrgy5FP15Lj1QhW90AcrAF12qDE2ArrMSmDzC5bleNrIRsuF4NI5m6DOHQUdbtI9e0R5yifgLCHaFQ/Yk+ttqO1sBDJNQFmPUFf3j8uGTo+PeKm/d9usGu2q7cLSwrtuojh2BEHTYTFw19uKZyHYJ4iww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749036041; c=relaxed/simple;
	bh=YEisNjW51wJtXkb1/A3QPq4yG6PaRm0ahzR9jyhpgkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mjhH5PiUNkGqXWrIoxz2VXLENPlGWv7zvVEjQFsQhmIs9vVPIaeUakq0fpkNaCeQAQm1JdyVRAnadaaiQJbBETnx8vo21qDKUD0b+1y8oUFPaGLTKt+3SNMbV1O26boyMawX4BghDjz7UosZkvQumb97NCHqx/SuHZMIevq7taY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QLz9HN4Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QLz9HN4Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA322C4CEF3;
	Wed,  4 Jun 2025 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749036041;
	bh=YEisNjW51wJtXkb1/A3QPq4yG6PaRm0ahzR9jyhpgkA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QLz9HN4ZnDCCG18BoT9pOxMxaNUd8G44eZ7F1TwluPNdQqhv6dkU2vS0DqCyOqp7L
	 9sXO6BDT/q/NW3QDU1HlRomJSQRlVlyk3n0HiwzsZRQuD1IkIDAtGwNDym5HYJ+LZY
	 jDn2Nzqy+cinduZ58+lZUA8kEbBvwdqGLT9Kh2DfFpm7g0UPjOzPFDje1+u4UDJnZZ
	 bREUNWeqt2C0efzyqBn27KBQ+UxeoAsRI+3UtwGG07m2aaue9FGkHKQilEsgg9cUKJ
	 RgCy4WgDkcRYy9wxuDB7fE9Kae1fNQnlz46jdVSJTtbZpgFM3U4caPxzWVcoFC/hKh
	 fEIPJKK9QJ+DQ==
Date: Wed, 4 Jun 2025 12:20:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: hdac_hdmi: remove hdac_hdmi_jack[_port]_init()
Message-ID: <35983696-730b-4a89-a675-3e73fbde47cc@sirena.org.uk>
References: <875xhcut6o.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XIvDWg2iwzYmdKmH"
Content-Disposition: inline
In-Reply-To: <875xhcut6o.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Non-sequiturs make me eat lampshades.


--XIvDWg2iwzYmdKmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 04, 2025 at 02:38:56AM +0000, Kuninori Morimoto wrote:
> No one is using hdac_hdmi_jack[_port]_init(). Remove it.
> We might need it in the future, keep it and its related functions
> under #if 0, so far.
>=20
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
> This patch try to keep code, but please let me know if is should
> remove all.

It'd be better to just remove them.

--XIvDWg2iwzYmdKmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhALAUACgkQJNaLcl1U
h9DWDgf/eE2M4xaaSt2BsoYwcSBDJS+oqteGdnTHuZQPVmUPMr7decRspgrbhct+
WqVxCQAJ8uym/CNa0t4/1/edqImJFS2yMYMzchu9FR64tn9Z1DoydLqqRKuKd1bu
7ZJCn0noVBZgBIyhjQsPyh2suYoee5RUMCZA0IQXXXLYKDgDk4jV0/uXk+blX4fJ
X3WGut6toMkfNP5+D+QFWS3zEwdwW7Vi5mW+0oXH1rF2+L5t5dhLX/X+HKKmpupy
YvzcPI7TdPlA8uF7Il4hIIZSCqFa1H2d4MdptcBDDcIJb5c01XzispJcqwXWIPKu
P+seyg5FfvbXfBTeUdQpVUphyq35jw==
=hv9E
-----END PGP SIGNATURE-----

--XIvDWg2iwzYmdKmH--
