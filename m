Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B899F38423B;
	Tue, 28 Apr 2026 23:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777418599; cv=none; b=q2Fw9PQOqnYLW48Zcibcs5AY33MhsCHFmdjGSwxfAGICd4oUAMyJd3z/VMAwc8YEJXlNuZsQSU9IYih4ClD5HLtQF8+Kb6BNDRwySAt0AnjSflBpQ+Dl+Sdx8O6V4SUmBP5291dh1aXGkq5KjrSz7wZ5heXBFBcYTFKE7HAl/xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777418599; c=relaxed/simple;
	bh=9NUysSWG+x3PrA9tVI4rHEUrpj54nXczJIPdSwGQdak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d02eHzJLj41rt1hHYiy4zfBNSqT4qik6MJTqfGefiY+679Oo/RW5eERH0w09MvGUBuhpyfggu8EvuPn6Jq7hsMbLeMFzBnEpUa+EH5WvCJAgakY4PzBTSiLnqwn+3F38krw9FS9T3BS7lxZz05MOyxNReYTEohyjzoWPr+cD6wA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNMoyg3x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNMoyg3x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 402D9C2BCAF;
	Tue, 28 Apr 2026 23:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777418599;
	bh=9NUysSWG+x3PrA9tVI4rHEUrpj54nXczJIPdSwGQdak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BNMoyg3xABqJJus3AsWwBhOilVZufsnXGeZORMmiJtrANEG5qVOfeJPqzdeH/QJCM
	 NkDMkwBsgO/pdk/Gzpddq0Owh63J/S/UYsC477LJN64LWANHUMh/kGSl6NSb3h9S00
	 SyNuAD2xYnVxHws6PM9OA3Oh43KR5+y2PRhVXqRBG3LQxbUscYvHvAt5S1wcgdEBnW
	 jw31fE17+odUtN5NFfufpw4mRpWltij0zVew9GgbFiTnsSFFcHHKy+tamVEFF5HU3+
	 qsOPVOdhveM7IXpj8D6aX3Uvq5AkNuwx/2YMMtZ5NrflGABMU8QpRjYmyeLgT9VASr
	 HHugn1yno6lZw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id A4ACB1AC5842; Wed, 29 Apr 2026 00:23:15 +0100 (BST)
Date: Wed, 29 Apr 2026 08:23:15 +0900
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Fix illegal writes to OTP_MEM registers
Message-ID: <afFBY3BuBbScZdu2@sirena.co.uk>
References: <20260428115228.158252-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7OGMxDDllCYWBEh2"
Content-Disposition: inline
In-Reply-To: <20260428115228.158252-1-rf@opensource.cirrus.com>
X-Cookie: 667:


--7OGMxDDllCYWBEh2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 28, 2026 at 12:52:28PM +0100, Richard Fitzgerald wrote:

> These registers hold a constant, and originally they were marked as
> readable non-volatile so that this value would be read into the regmap
> cache. The problem with this is regcache_sync() issues a write for any
> cached register that does not have a reg_default.

This feels like something that's common enough to be worth teaching the
regmap core about.

--7OGMxDDllCYWBEh2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnxQWIACgkQJNaLcl1U
h9DxyAf+OvTwyWTAQBdkBgibvJhKR8HbEbowW8NoF2SnT2E+lyAdNYn9A49adszp
SU1lnHSnEUlp4QznKnDQOnHKixbpTOPAjkF1Nn6Q50DevUEBoeXtVY/WKrfTfmud
+FPT8kG9RPcpciKIiUnKw3y0QMsj3TgP/xxixAOY65s/ZnFFUJyTGXarD5aoxeMP
aBb2SXtLs7GmG700gr2XNfchdMdeEXGBavl5cmphyAWB646HVg/BQh6Vg41o7Zg/
O5RKaT4cL2kBUjw1kHVVIMCb2TM9pZ/sLHcypA9Cc6mk91fD6xfiHNklStmMasWM
xgp76SNdqX3MrA7Cnc0cdDiK7eLZ4w==
=rwor
-----END PGP SIGNATURE-----

--7OGMxDDllCYWBEh2--
