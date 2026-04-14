Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195462253EC;
	Tue, 14 Apr 2026 16:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776185635; cv=none; b=dgFXCb5aUWtJ7p4C9LY2FQpzQbp89Jw0/UYxFgV1Mnw+c3wC5pm1LnqjPgWM7CxrznB/n9yy0wMhK3cgRL9Nkwu5xis8LqtsUpZaM1QvE1JvEGxVv21A+hCdFktX8gxjowrg4GsLDJYtHAXtZ5Hf4gXroaciz++yS2GSPIXP0gU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776185635; c=relaxed/simple;
	bh=k3aCy/9bFf7kLfVfyU3dNM1rb5rwmiekRa7+I0WdGzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jaoUOtu4Vs/MosfRchW7UlhbSJlX5qg4I1lft06L1x4CpognBgmIaOVSaIbJ/maffSNvCbchp5IxmDabj4RIKGTwjvLnMBivnk1iqwO0O//G3oZLHlqxy1sUqBap1SF8MhvTOY/I9B80lwwYQPKmzvx+zaqVdqRnlgDrfbO6uwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1iEhTsx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1iEhTsx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C680C19425;
	Tue, 14 Apr 2026 16:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776185634;
	bh=k3aCy/9bFf7kLfVfyU3dNM1rb5rwmiekRa7+I0WdGzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A1iEhTsxtu4BtR87FDWFXvd6tcsshisfm0wYx6XzusUX1xwIzdk3hwc3jYdBl6R7W
	 +h3DrkZld6oiQJru9XKyW7KR0f31KNhDp2twTJYz2xzzpxMGnGbz9/8qw4EbaEd8w/
	 +IHx5h9lZj7h9T7an3S1ZSaXRSZ8MqFk2LOSoB0PMIUGvpdmCJMQJmawhYswfT6uPi
	 iIlJd6pbNT4YkzWmdkdX/4Y01Xbi8z1JVk31DPqTGh9Ra6qhKCojW4PbBfcwzbwS79
	 aUOvFIyGrdpfhGBPeZjKsESFuzAchdWpnIn8XTOUYOUmJUH6PTP0dGywZVuBHGLemg
	 S7Q8a5KBFSpOw==
Date: Tue, 14 Apr 2026 17:53:50 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] ALSA: compress: Propagate real pointer errors in
 avail paths
Message-ID: <0340e472-b0a7-4bc7-bba8-a581784b8e3a@sirena.org.uk>
References: <20260414-alsa-compress-pointer-avail-errors-v1-0-f5a1a8b1dfba@gmail.com>
 <20260414-alsa-compress-pointer-avail-errors-v1-2-f5a1a8b1dfba@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LNQ2Q2yvVaItXea4"
Content-Disposition: inline
In-Reply-To: <20260414-alsa-compress-pointer-avail-errors-v1-2-f5a1a8b1dfba@gmail.com>
X-Cookie: Academicians care, that's who.


--LNQ2Q2yvVaItXea4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 01:47:54PM -0300, C=E1ssio Gabriel wrote:

> Commit 61327f3d817c ("ALSA: compress: Pay attention if drivers
> error out retrieving pointers") made snd_compr_update_tstamp()
> return driver pointer() failures, but snd_compr_calc_avail()
> still ignores that status and continues with stale runtime
> counters.

> The fallback for an unsupported pointer callback remains
> intentional, so keep ignoring -EOPNOTSUPP there. Propagate
> real pointer-refresh failures instead.

> -static size_t snd_compr_calc_avail(struct snd_compr_stream *stream,
> -				   struct snd_compr_avail64 *avail)
> +static int snd_compr_calc_avail(struct snd_compr_stream *stream,
> +				struct snd_compr_avail64 *avail)
>  {
> +	int ret;
> +
>  	memset(avail, 0, sizeof(*avail));
> -	snd_compr_update_tstamp(stream, &avail->tstamp);
> -	/* Still need to return avail even if tstamp can't be filled in */
> +	ret =3D snd_compr_update_tstamp(stream, &avail->tstamp);
> +	if (ret < 0 && ret !=3D -EOPNOTSUPP)
> +		return ret;
> +	/* Still need to return avail when no timestamp is available */

It's not clear to me that the intent there is to only ignore in the case
where we fail to update due to the operation not being supported rather
than to also ignore any other runtime errors we might encounter (eg, due
to the stream configuration).

--LNQ2Q2yvVaItXea4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnecR0ACgkQJNaLcl1U
h9AwTgf9HCbM8mctBAnEkcg9OmeTO4oT+Hb/0WZE5YHxM/F02IUhIfHmvgYiFIr/
aeJJKBlUeoHe+GnT5Tu37QgdJy21ptrXyAuJ9Nm7nG48IsY60er4w2V95d+9khFz
zijKG4ST1hMzlduzF0RNv0okw8nTEVpJL9FcHfxQFVwDnAC6GNK+n5y7k1+2tlpE
p2OJ4thuWfkbD7fAnWMgmYER5M4n7Rfea9Xhs57LBPfp6UOY7hRhTz1ZOm+cc/um
8fRIW9+7LvCKSnmoK4qZ5SLkSj9c33ryB/IJfmQ5ejpKrr6noYLKTXVX3NOxr3W6
1/82GNiwlJv0v0VBPYgFE3SlZdKY0Q==
=bwkk
-----END PGP SIGNATURE-----

--LNQ2Q2yvVaItXea4--
