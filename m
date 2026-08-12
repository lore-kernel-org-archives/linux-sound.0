Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB92370AC0
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 14:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786543571; cv=none; b=LiREhukwVDw8nLiHEHtvypvz7LaVXz60PSWpQA3kff4NlGU/KjcFY00hUBIp9UvNjc3dPir66L7Dm3Fqv4hhJolb0IxvdCRKtmwnUVw8sUnkeWZITdgI7NQqxQgL4sQSkUMZ3T3HimZJ093kZUJ75QJ8sSUFIV3HlMh3C8AU/M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786543571; c=relaxed/simple;
	bh=thR37h8D9Uqg2y6FFjgbIP9ZdHxJXAlSzyTRI5wxfn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCcGCl5y1RDIid8pcU2uAF76NkkGuRxb/2PtA1IJCldElumch4Zg/4zF+7UGtOLyDe6zxv7h+GAtGMVGLRC7ZgtZoDA/ziPY9gYDmFrB7UrDncABHbujdGuH/61OslD8lXw+6KDS3uo32efKPK3TNu9Ui/lxTBwoK+tnU6aU9Ss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fwga6Znk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fwga6Znk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7CF71F000E9;
	Wed, 12 Aug 2026 14:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786543569;
	bh=thR37h8D9Uqg2y6FFjgbIP9ZdHxJXAlSzyTRI5wxfn0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fwga6Znku6kXLfwxy7uUO20QC7CQyMb2C2PbmHJnFuDNy40XPXh1qVf+1rj3JZqtq
	 vqwATGTHCP01z0IyFcs1jyxjkIeOr6MfV+W1oC6bETmGS9+UdbOA++JFm6qlJsijOF
	 uDeACCvfGIOA9fgPZTSHkJAOkkhejWd8Z3kjLe1crzdDUntyUCwaZEFzaEbzDOnCpS
	 bQrp/3UwQdK83rm0XvQXm6GjuoLOtCjn6HYlPwZdBT464q+2IVkYZxZ0KI/JE0skcP
	 IZdAIgroDYzf/4Eg/8HjQ0aG4Yj0lVDofYP1DpZA7/baRUoDJEnHhHC4tm3U6KrdCF
	 6zqlaaXXHgj6w==
Date: Wed, 12 Aug 2026 15:06:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 13/14] ASoC: mediatek: Drop __force casts
Message-ID: <385f95c1-f553-4cd8-907a-ede4fa169d57@sirena.org.uk>
References: <20260812060557.80445-1-tiwai@suse.de>
 <20260812060557.80445-14-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ee6UfH7/oefqLT5k"
Content-Disposition: inline
In-Reply-To: <20260812060557.80445-14-tiwai@suse.de>
X-Cookie: !07/11 PDP a ni deppart m'I  !pleH


--Ee6UfH7/oefqLT5k
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 12, 2026 at 08:04:45AM +0200, Takashi Iwai wrote:
> Now that the bitwise parameter definitions are gone for PCM
> parameters, we don't have to cast with ugly __force prefix.
> Simply drop those superfluous casts.

Acked-by: Mark Brown <broonie@kernel.org>

--Ee6UfH7/oefqLT5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmp8fc0ACgkQJNaLcl1U
h9BIGAf+KyBtgnrilsS90LIeVusny9a7M3z55g9LqX+j59GNJ0d+kZCPm1gLidw0
fnhZt4OChDztUowzmLFCfDGsA4oyQTARBpDSQynZdOHqRzMUTjyhQnzFudFkBxN1
CNEOgsjW93y6fXFry8GXZZHU5xmGHVt0Le2Mclou3zW/ERQrbn9ksmDBdMfbdE57
5dksVnjttgh06YAEKMkDE/66D0ECfOYJ61UjSwU2zVDtWBQN813IHBfTiDHSObqB
/rvlBw786KpEx+z9KyOSCNVgPwRYY5vtaqOkFuLT2tjJW4JEG3twOSXpjzoM9Oy9
GmDYQXy4EdFLGEF3i3tY3D30mUZ+vA==
=DENM
-----END PGP SIGNATURE-----

--Ee6UfH7/oefqLT5k--
