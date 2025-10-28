Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23582EA473
	for <linux-sound@vger.kernel.org>; Tue, 28 Oct 2025 12:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761653134; cv=none; b=ipVOtx40zUyd4YWZ2085Qb571niNIPJmqitdTGhd25NZF/DzQiaxJjnRNYJIIiYLYhdsbmwU17S2MYHjfGNZNTDhV1jjMxdtGaHyl5Ey08GqYcWi/2zIsHO2G0X4hIeha11PXz7SAVieqwAdeB/SbXLR9iN6TfoHtBYeI57RC0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761653134; c=relaxed/simple;
	bh=KiXATZoBuFcsmB0BFahcV3s96EbZ5ybH9jc91LjKlmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GnEZbRTt9H5o1uQZ6MAIH1H7W0Pb/Sb+P4HHhpyAcGi5cn9IntABJUJ1O2K2Xl9FkVp7h1giyYHs1sHwDXe1OSH4hLYvNjcF9PzJeHMo1c53azWOfv5RYis5PfJRchaMP8OZZl0d8UDHXJqBV6+mIRRf5foijTgvZe67XT09Ico=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTH3saak; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTH3saak"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4CCAC4CEE7;
	Tue, 28 Oct 2025 12:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761653133;
	bh=KiXATZoBuFcsmB0BFahcV3s96EbZ5ybH9jc91LjKlmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTH3saakgo4R+fcCl31AXFdVpqNflzUkiAaSWvbcOraGSwDviqf8D2D43HIuJjsVW
	 WmP6spO9DGJtxdSBC3GSLklZzMF/Tgjs4Ca1GJimTsIg+mAsDPY+cNNMcLjLvV3YIt
	 W4nyM+SLa6Ayyj/fqfuL07Lhcx3U4Pvyw13XirwAZ0HXU06ZjxsT+UuPGuYNx1JgKQ
	 G5D7y1md36jsB3B8xH/Mh+Of0SUpwi5UVnO/8PFYH5XvXuVo/AQ5nXAxds1pg1EEvg
	 saTAi8A5tdMEfc65iCpx2gkstBn1Kv9TfQSunYg8sz5biW3KbImvNUGBVQs4YIvkIz
	 ib55AgJEFhG2g==
Date: Tue, 28 Oct 2025 12:05:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [RFC][PATCH x/x] ASoC: convert to snd_soc_dapm_xxx()
Message-ID: <6358b4f5-88a1-4bd2-b15a-20f090dddbb4@sirena.org.uk>
References: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PXK91FLdYQ4kIJUS"
Content-Disposition: inline
In-Reply-To: <87h5vjselx.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Your canceled check is your receipt.


--PXK91FLdYQ4kIJUS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 28, 2025 at 06:51:55AM +0000, Kuninori Morimoto wrote:

> dapm->dev					-> snd_soc_dapm_to_dev()
> dapm->card					-> snd_soc_dapm_to_card()
> dapm->component					-> snd_soc_dapm_to_component()

> dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

These seem fine.

> snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
> snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()

For these shouldn't the change just be within the implementation of the
helper?  So snd_soc_component_enable_pin() would be a wrapper that does
a component->dapm mapping itself like currently.

--PXK91FLdYQ4kIJUS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkAsYkACgkQJNaLcl1U
h9CkDAf+LB4fvdTHiO/UlYgo7rz7YMbcwiiz3Pdzr9x+0lmBRLrt2PaZTlE8veyq
5io6Dc1ICGXDT3nbqdMDiSrLL+hznyBXxDNPc6lN1beiwNAFB/jiMCcra9qj4STU
knO9mwpcKfDDilTO2h5iuO6ZDZ605u9ejvcDpOx4BCe2RKpAT0NzGOcbIFNCkEqR
fPBI+D+8tHGsVUwnLKcEyZLNsExm22ftdk1Y5UE0y3xBY51wm156HYD2YW8bLA1x
c/gCfpXGZF1ZDj27V6ufpFO3x3ZVOAcmDD2OPwz1NS64sFSCCXLRM8Ql3uJKvuAf
SY8P7zAhVz7crXTZJI5RMIIjurlrDw==
=FNja
-----END PGP SIGNATURE-----

--PXK91FLdYQ4kIJUS--
