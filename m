Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2887747DD7B
	for <linux-sound@vger.kernel.org>; Thu, 27 Aug 2026 14:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787841640; cv=none; b=Zkmt+/mZiqTlPHq6t9q/BazEVCuiUImAvMAo0IEO2Ho2migSgKQ+d3+9MAs0BnFx77m+ts2/Osn1nVpG6bCO85VbGzSOHrY3K99Oa3dhQMj9Ul+wujcmwDbrbhgGp75kf7hXOZiiRigwE3WvfQhscuOMaCJCDc8nRJKEZyW01Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787841640; c=relaxed/simple;
	bh=lM7E3XpL2NGpDGZdgaXXD6tMuAZbW8EkHdaXi43Qur0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkmNC4YctUseNxzQw2uxfL9aWKXiL1xZEdGuzENLSKdqcvnypS29iWkZsVq6OQAKdeAWma3JPwx3BDOz/B0yqbqzvy2eU0ixyNwR+D2Q+k5R3YuR2CY01mv4Mi43emhrXr+CcSLzTaZaCgAGFDdgbe9lHVDuaXYba1uVWJHoc5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f92uiqXU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f92uiqXU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F70B1F000E9;
	Thu, 27 Aug 2026 14:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787841631;
	bh=SqzBHeKxcNAInlsYktkxbz5Ns635rN14d2/DWg6gEU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f92uiqXUeObTFpPEfYxHeE3QBZhW9neRUVYOQjFXISrNaqxJHWZMqgaj53s+G9AYC
	 OzXGj6gRoJ+T6/LnGeMi6vGvZPaHQtQwwyw0ZG+chU3EU0jTtOqvEGy75sGFOeW69e
	 9kQE5laAKtWZWBNwP3qzlPQZ+wXHs+vS3F1NeVBSu8GNQ4v5NEFtzM1q6rFWzdBo3L
	 G1vff2zs8TYEeEGS0LzxhqjSXzKqslgpK4s07Orm3PlIpX8GzTxm0GQXm4DDaeh8gt
	 3jjiteBTy/ZgpxpiNLNDlQAqa7fRm2geDpEy/R+SeII7a4CjdIub/2Envm1EA+XrnB
	 nJtpqOw/xXn7A==
Date: Thu, 27 Aug 2026 15:40:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 09/10] ASoC: Intel: avs: Refactor and fix init_config
 access
Message-ID: <868fabf5-81f5-487e-8ed1-855e97f31897@sirena.org.uk>
References: <20260827131510.1014084-1-cezary.rojewski@intel.com>
 <20260827131510.1014084-10-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LjOuRwCtZGZL+nU2"
Content-Disposition: inline
In-Reply-To: <20260827131510.1014084-10-cezary.rojewski@intel.com>
X-Cookie: Alimony is the high cost of leaving.


--LjOuRwCtZGZL+nU2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 03:15:09PM +0200, Cezary Rojewski wrote:
> Existing code accesses enties found in ->init_configs array through
> indexes that are part of ->config_ids array.  Those two are limited by:
> ->num_init_configs and ->num_config_ids respectively.  Using ID larger
> or equal to ->num_init_configs leads to out-of-bounds access:

> -	acomp =3D to_avs_soc_component(mod->template->owner->owner->owner->owne=
r->comp);
> +	acomp =3D to_avs_soc_component(template->owner->owner->owner->owner->co=
mp);
> =20
> -	u32 num_ids =3D mod->template->num_config_ids;
> -	u32 *ids =3D mod->template->config_ids;
> -
> -	for (int i =3D 0; i < num_ids; i++) {
> -		struct avs_tplg_init_config *config =3D &acomp->tplg->init_configs[ids=
[i]];
> +	for (int i =3D 0; i < template->num_init_configs; i++) {
> +		struct avs_tplg_init_config *config =3D template->init_configs[i];

I don't see any users of acomp left after this refactoring?

--LjOuRwCtZGZL+nU2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqQTFoACgkQJNaLcl1U
h9Av5wf9EPnYhfAl5jSE3TG7U7aY8FAhXrvFi0FBnJi8XXVqB4sDGFg1zWG96FO8
HBI+5yKnVM5OLZTPf8vOhVuHO890e77DKRVBZurkMGhBdq8uBI6i8HMWQ2kUiifo
Ys5GTa1VZGGqrUsNxurYFhJXtvpueMcwH2UJqQj2cmCrBvaofpYThkQvce4EhTNJ
563qNj4wnNCtbVXfODMMl5rykJb91iV8afAm1Q6VCKivcRiqZ5H8P479thHVNwlw
K6pclXFQf1iRZMhRdhwAkO07cpCXk3iaGO4eyLXhtN4LdflekMDNlhU/S/B6QcuF
WTaLPQPp19W4CrSAow1HEKwu1a9iQw==
=xSgp
-----END PGP SIGNATURE-----

--LjOuRwCtZGZL+nU2--
