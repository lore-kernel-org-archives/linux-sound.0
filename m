Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00214248A0
	for <linux-sound@vger.kernel.org>; Mon,  5 Oct 2026 12:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202641; cv=none; b=O1A2axKcyf8AQYk6gF17+z51OIwAVPBA92z89ActcRAH3dFzuIwfbndUJ150zvQWhilQ2zn63n9+rgQ4nfrEoHvsPKYWhEQPGLHLubxmVPA6kWskFtkZH9nEzJh1DHO4qksvZaSoLnDX+dIm4TuKYuWeV7iBc22Lo3lVbsrz0pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202641; c=relaxed/simple;
	bh=4e6U+rGypz37CcM4YlUbLbTiKVCLCzIgWaZRF1DDzYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r9SS6riO5wupQZN4zRWWz0ZkhUHsN9LGVOcAL968sPCLsf7mrB2aozVBZegx+oJB9IiCUbcBgQ4cn7On6V6/MreSJgWrmJbwh9DO/GRydq2+hqMBgVjm8jMGYvaX/T0AdqwspkvTG4cSLkbbO8TyASriLGmy25tvpRzTYd95cIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1DjqvOP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1DjqvOP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7777D1F000FF;
	Mon,  5 Oct 2026 12:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791202640;
	bh=4e6U+rGypz37CcM4YlUbLbTiKVCLCzIgWaZRF1DDzYc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C1DjqvOPW1UqD5cQOiRP84qjCznCMRG9EIaxCFsnTdOf7gmIPFH5HvYGrBHuNAtSZ
	 K5xxX4h12wr67MKzQDuMvJAuaHMLm0R8c7vyhHMKCYsVUfc731ykVQx/fuQHc9TLYR
	 ikA8VXRszX1V0NUvBPAsihhwEAmYPkcexIEyRk2GUXS0MKW0MsYmfraZ32m+iWyK3z
	 7RSSU1OSi18BpNk3QaXxnrpiq9wbvqUQvX5nTGS6v2J1hiD33tdrswGvngcmHPJDzJ
	 bDwsuU9Gb7O5LsIixYC/wjVXQaXLz34843SMJ/5C45F2GnJWlezdT8OuQXUOxQgiI9
	 um3rTdF/tDUMQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 38CE21AC57CE; Mon, 05 Oct 2026 13:17:17 +0100 (BST)
Date: Mon, 5 Oct 2026 14:17:17 +0200
From: Mark Brown <broonie@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: David =?iso-8859-1?Q?M=E1rquez?= <davidmarquezfernandez@gmail.com>,
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
	kai.vehmanen@linux.intel.com
Subject: Re: [BUG] ASoC: Intel: sof_es8336: speaker amp GPIO stays off after
 stream stop/restart (no sound until "Speaker Switch" is toggled)
Message-ID: <asOVTdEvVmbQ78fB@sirena.co.uk>
References: <CAFmy3_zQ1VNUJJ9H1kkvHxf50Pg9AQ4H1rXZbyz6-zxJxcYowg@mail.gmail.com>
 <33d869bc-ec8a-4d9e-8ba4-350bddce7ccf@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dEe1z9bs53cj4fiv"
Content-Disposition: inline
In-Reply-To: <33d869bc-ec8a-4d9e-8ba4-350bddce7ccf@linux.dev>
X-Cookie: You will forget that you ever knew me.


--dEe1z9bs53cj4fiv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Oct 05, 2026 at 01:22:10PM +0200, Pierre-Louis Bossart wrote:

> Does this happen if the time between stop and restart is greater than
> 3s, or only when the delta is really short? In the latter case, IIRC
> there's a DAPM feature where the power down happens with a delay, to
> avoid unnecessary power transitions. so if the new stream starts
> immediately, then the power-up transition will never happen.

Yeah, the default timer is 5 seconds.

--dEe1z9bs53cj4fiv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasOVPAAKCRAv73Ows9A4
iY+CAQCexo5C0YEaFFOtTNwY4EJzYp0bkJXFWBwpeOTdbdsJIgEAjpshHvbjNDry
JJ7P4EtvzCw9TebCvoi1XTHaOBU7rwE=
=i3kw
-----END PGP SIGNATURE-----

--dEe1z9bs53cj4fiv--
