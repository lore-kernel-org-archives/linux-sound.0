Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ADA53D6476;
	Tue, 17 Mar 2026 13:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773755761; cv=none; b=NeNE0gcxt2FgN1Brs/VTO3taKRFHwhFQKkaPOz0BOUyGepwS4evvAggAX9m2rbAIgabApfwtWa4yaaG20gf/qJiYw55+msOVY5pPrZtfe9ZXv3//VTzf5dvZiaNa0MQVS/7Zk+JPjGlqkBrWneErF80aazdk61Fy6dYWxqOaegc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773755761; c=relaxed/simple;
	bh=jVmkV6ljx6YWWMHlduO2hDsiKm3JPJhnhgt1x+g8DYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CaOe1FrxKScKOKwapzhgM4y/OfqgnlH8phWcprRIL0NC6fZtOv643nEjVkNZxPSNk3cm+7/byCFV/e2zSngzC2N3KgfBXzmZgDmuquEclv4mBldG8WKVV6Sp7ExiCXI0sSPZHldrowry+fNe1NAQTHY+QjJGcXNx9c+ZZt8A33M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qGqnPlpG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qGqnPlpG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7392C4CEF7;
	Tue, 17 Mar 2026 13:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773755761;
	bh=jVmkV6ljx6YWWMHlduO2hDsiKm3JPJhnhgt1x+g8DYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qGqnPlpG5H8xJ3obYVIzMAeEhsAOrkh5B0OBE5qhsTf0VUZbsaWDNTGJMwEd+3Y+A
	 PN1RymLaO6ZsXF0uN5q5s2iAN2wtE9y9zWC58udIePowO0YyYero3B9IXge0rEfsDa
	 KIzaHj3YU5oFnUGMRkHUt9hkguEWXdbjLpNf6Vy6XV2sHn5zojdPNTk1AIaaOnCJxe
	 vu/d/s/tyZENyDH0RJ1QhWgcLx3fGKhWHZQvqAOk91IM0k7UcNwAHBD78C4h65/lEc
	 koM7pRV0bnvF+ytcEaj1rJIgJIe8BchJwl2ICrdmibeYHXOOFFoCaapUL6V6N3S/fe
	 q8z9WdMWr57tQ==
Date: Tue, 17 Mar 2026 13:55:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, alexander.stein@ew.tq-group.com
Subject: Re: [PATCH v2 2/2] ASoC: fsl: imx-card: initialize playback_only and
 capture_only
Message-ID: <af97f536-be17-4173-83d4-3f3f052514ee@sirena.org.uk>
References: <20260317033952.462209-1-shengjiu.wang@nxp.com>
 <20260317033952.462209-3-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u5B8Xh/bOBcTqSb1"
Content-Disposition: inline
In-Reply-To: <20260317033952.462209-3-shengjiu.wang@nxp.com>
X-Cookie: Must be over 18.


--u5B8Xh/bOBcTqSb1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2026 at 11:39:52AM +0800, Shengjiu Wang wrote:
> Fix uninitialized variable playback_only and capture_only because
> graph_util_parse_link_direction() may not write them.

> @@ -544,7 +544,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
>  	struct snd_soc_dai_link *link;
>  	struct dai_link_data *link_data;
>  	struct of_phandle_args args;
> -	bool playback_only, capture_only;
> +	bool playback_only = false, capture_only = false;

Don't we need to initalise these once per link rather than once for the
whole function, otherwise if they are initialised one time then any
subsequent links will inherit the new value?

--u5B8Xh/bOBcTqSb1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5XWwACgkQJNaLcl1U
h9D9IQf7B64bLLxGqqBBgoHxureWnohpxFSN8tT0TamhcY5YbsdpuxlWjSLEFmci
s24pQ05WJQ84SZsqpojgT8lrcpUIA6APDcV8ftrX2aRpSdFQZyhuuJescToxo41F
CpMdRuRgk6yxBB0X5ROHdPnQarKoi9u1rMvljpr9e7cWZo7UJnTpNliuln02Vtok
IRsyA9VCOfmmue0fK5sHpB6otRbxXrbIeE9VM6XodQP7uT+u8PBuhYD5YzucGSr2
vGG+GT1Y8D9F+QvbAgQBF9noM+zf95pjpPE7+6XfICyj1UhUavXoobQAqUhYbvC8
Er/CVaDRd4QlvJJh5PuBHwf4rO+8eA==
=Y6vf
-----END PGP SIGNATURE-----

--u5B8Xh/bOBcTqSb1--
