Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9839F43CEED
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 12:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786538972; cv=none; b=G4f6cRkMakqdLOaUF3NLvGh8R5DqYRrzBSzRqcSJWBwU2JuXDBdJXtZ2izP3lVQNMW1vDoQepcsxyMHdEwfjzKyuizq9vjTRRNZcfA3cGxatLg6BPjhBumzGtmiqnwGZvGFItE4bK6IryPzobvQa48jeOwvSxia+DZ7Z5HihJL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786538972; c=relaxed/simple;
	bh=l9aWFcNm0bwxHXmc42qW9RTOAM1VoiGfvBtDrSve78o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+GCc73HM4ynlxd0FK1paNRqIeEsTAcInsbqeepj30wOiTGZ2CzLqf5meaKM21jw6bniEI+qC/YKsnSg2W3UVf2NO9GxNVXdCycXxVRUve/IGKfhJjFxaBTRrNlrC//Zpj8DBsK4J//CirpyA3WdiuILTlFdytgmChDxchPb+4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exQXjwNz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exQXjwNz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA071F00A3A;
	Wed, 12 Aug 2026 12:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786538969;
	bh=l9aWFcNm0bwxHXmc42qW9RTOAM1VoiGfvBtDrSve78o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=exQXjwNzkxeU4MfyU+vcIBWpt9nUZ0CRRu7syTplAUCXMBV07ZgPoxPiyxs3B7SFg
	 5d+bl90O3Gc7fP2NglGDPYx7s2Cs8lGc9/Na7/6aww39X+ng9q++DTF7lAKYWS9nuO
	 5SzQFSECd5EWOST0HaO80CwLT91PZ55WOg4WLDkH1V727mCdgiNftC/P9xeGrWDQt+
	 HmyWY2/YMpVuofztFIKMeM8w769QDyw4fgLz6WK2vmsXxyup6bk3OJGTP0PNjT3nhl
	 hjrBVETlJdpoS2nIOePc2iGVxFE38HQo1njbPCgJIMNXOLy8to+ayteYsdaiqaeR1K
	 2xOqKM/POPutg==
Date: Wed, 12 Aug 2026 13:49:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH 11/14] ASoC: fsl: Drop __force casts
Message-ID: <3649c059-da4a-4c41-98d2-60b30e25f4f1@sirena.org.uk>
References: <20260812060557.80445-1-tiwai@suse.de>
 <20260812060557.80445-12-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WvvsarY36mIM3YHD"
Content-Disposition: inline
In-Reply-To: <20260812060557.80445-12-tiwai@suse.de>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH


--WvvsarY36mIM3YHD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 12, 2026 at 08:04:43AM +0200, Takashi Iwai wrote:
> Now that the bitwise parameter definitions are gone for PCM
> parameters, we don't have to cast with ugly __force prefix.
> Simply drop those superfluous casts.

Acked-by: Mark Brown <broonie@kernel.org>

--WvvsarY36mIM3YHD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8a9QACgkQJNaLcl1U
h9ChSQf7BZsMeuCa/yKVN6S9ZeEqbX0xL+uz0PjYk3qNprd6Z7sWYi6VlAPSFctG
qzzPKv+10iXLu/DyucTMsMW2EiWp4nn03H6n8EsHnCxNkOYMN+XnescjvKQ3uIsh
Xv5qm0eSTxkkkwTEUFFGMKsqFk9t1kouWZ86v7NuJV/MSdZzN4gMBv08kx4M5611
BPjI3rkLDhoBhVElmk+hGMYVJTRvyOPlDybU/FxRn1SPwXTieucEB2MyLko8+7to
/FiHbIj7iJFn/bIRYqOjYBMd5vikY0Rm2rfATAmqEXp399M/iJhHx/Dvv6J2wFPx
2AIHucdvmFo3HrwunWraoKQrEtoHRg==
=x4wi
-----END PGP SIGNATURE-----

--WvvsarY36mIM3YHD--
