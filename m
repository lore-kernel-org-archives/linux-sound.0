Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E44373BE8
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 20:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788208509; cv=none; b=B6C6h7iS25ytAlvUEh4NDHrYs6d6buqEzh0kV58vW3XPama7NkTYjzFLl1bhJqPsjAAREjRrWZ89w2+qof83VoT5JSRnj0QXTfkUSTLBZBMsh888Qfc7sLYMeVeSQUEixPuIxbPWPCKchvM4nqs7z0f8ME2Zm2mlzXuLZjJUGHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788208509; c=relaxed/simple;
	bh=9gCb8782Kzqp+aDkEHf+/UvLwZxUtAs3f1L72E6kDjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EG01rjNwiELiaR3ziYE2835xnckQ+nNZfWJjAHO7kYdw/MiF0rwhCeDvBs0pAqGdop4hF5hQnRdBXRXw158/hzxS+HN15M9W/UhbEUMk//vhqkCVx6Q6XP3SzKlzXA5TUkFh/Ezkt6ek2nUF7Vxgxwm/0tEm5KtGmriLOCF6SMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ITTJb0dz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ITTJb0dz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6F191F000E9;
	Mon, 31 Aug 2026 20:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788208507;
	bh=da+dn1bsZvuXigxmTsVU8W1ZzKMjQQJKQx3lExi9DZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ITTJb0dzac1sdoWi2HLXzARQV+D4CMFaikV9lXm3HsUru8+yFxcs/UWe4dA8yOMNF
	 JYl8agYWQ82dR0a7keoYuUtQoBKD3XxgwZ3Icwyh3LxTdwwqE/DtfYncwMSl1d0NB4
	 eGzZCu6rDScBxItD7515JglGcrn60RVjwATkhmNeF7z1gV+1ASoqDra4lVycYAqLDP
	 9s132QqlSai8MIKCnKHL+JilV+/dGziwBy4SwggK37AZrCYjmZHKM7ByBZwQ6PRtQm
	 3nDa832rEuf/uGPRTV4ejg6GlIttOlvKoenA/QlQ2qKQOx5HH2eoUBfiu5TO9CPE87
	 SgOMx424IrEDg==
Date: Mon, 31 Aug 2026 21:35:03 +0100
From: Mark Brown <broonie@kernel.org>
To: jml <jml@carbonforge.ai>
Cc: Vijendar.Mukunda@amd.com, shenghao-ding@ti.com,
	venkataprasad.potturu@amd.com, kevin-lu@ti.com, baojun.xu@ti.com,
	sen@ti.com, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 1/3] ASoC: amd: acp-config: override ACP config flag
 on HP OmniBook X Flip 14
Message-ID: <a4fc3b3f-f0f6-4298-8f48-cf8d11c8ca9a@sirena.org.uk>
References: <20260824034153.50193-1-jml@carbonforge.ai>
 <20260824034153.50193-2-jml@carbonforge.ai>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oI4K/CXgnAgiFtnJ"
Content-Disposition: inline
In-Reply-To: <20260824034153.50193-2-jml@carbonforge.ai>
X-Cookie: Sell by date stamped on bottom.


--oI4K/CXgnAgiFtnJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 23, 2026 at 08:41:51PM -0700, jml wrote:

> +	{
> +		/* HP OmniBook X Flip 14-kc0xxx (Krackan Point, ACP 7.1) */
> +		.matches = {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "HP"),
> +			DMI_MATCH(DMI_BOARD_NAME, "8EA1"),
> +		},
> +	},

This already has an entry.

--oI4K/CXgnAgiFtnJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqV5XYACgkQJNaLcl1U
h9C+5Af+JODq7OJy4uy1gvHcfbcp5eYtlXHgYVRxOvSHkyANNKgPnDW8qcAwj1rc
xxHJ5DEl5+ZX3r0W39Zmpe1ih3B0GMQysry46Tvs+dqzed+Tx+muly1oRbvbT+ZF
FJt81EICac8wyUjEEPDlQb/MK9qd7qkbjZWVWJ6fB2NYV7xYbK8zxqt9aX2o5dK0
e60sWQ/+FG87FgsVZeOnpddUSlcry53080YTV14Zv4gxrq3vuHcnzXIVhvsyTW7N
bVI0SqsHhkBiXo5hduVkmJCSbGHaB39uyDDKQ5v1vgBKEuiv1aHyYlY0uLO2QKUS
TZ7tyEPqIQ6P2BtByz1pV18bhR/kog==
=fAze
-----END PGP SIGNATURE-----

--oI4K/CXgnAgiFtnJ--
