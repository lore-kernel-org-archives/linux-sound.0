Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F08D3E1210;
	Tue, 17 Mar 2026 18:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773771087; cv=none; b=KaxbhdCOV+xJq6kwW8hWScLSCVpzFF9kT4n/WJYZ3lxpIHNlkonqrEIwe7NvVDC5feVBQgDp0pXOP2OUY5MO4OA3CbPWro7SMx7o+2xNj7tbfb3MNSQdtpU4ya5VCx7lP+sXcm+Vr9hzEcbC65PYr3FG41fkqjCDSTjYQYiuOdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773771087; c=relaxed/simple;
	bh=g8pnUTWpupQo61ecLsQ4GWguI8yImBdciL5cgxEmhQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oIVnGZwlfN6TDMJ6vpKsMMttr8qQIk4Rsrp0BYHF3mcVJ1fFLbvMsoRjeFkdqxTzVbPEq5XeY8jr6MjVPNKHU7kZGRoMWDFtu7o7kmjC7YaR2evT+/kxudyOji8aYWAPR5KNHFWU9XvcwSQMe+rigiUpJufH+0qc1locNKx2+r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7ueOtS7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7ueOtS7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7A4C4CEF7;
	Tue, 17 Mar 2026 18:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773771087;
	bh=g8pnUTWpupQo61ecLsQ4GWguI8yImBdciL5cgxEmhQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O7ueOtS77Xn7fV8g3otImvmVLaWT+c+HSKFbR9VplFDWcAieDEuzbWG+FLNRRWx2X
	 gCsxhcf0zHYK+WRF2rT7qHS/Yp/7EUfbVJ20wnm09b8WbLy58TZXxaiSPseVIroXlb
	 42cR34wXSY3d/OgPPBO6Gtz/VeeNloP5xc/Y6sORByv0J4yXi5TjRZIqggVw8lub1x
	 oeCgZGO1fbuuiPlQgTUMGE2I4YV0r/L4mdJvi6D3k1EPBgsa8XO55/vOoydTudVx0l
	 pY9Hukge2zZqIKehneE+5u7FEVBFai+VqVd/7vrjGpBbNAAp3SkhPbacbRKPDSbtz1
	 //mBNRHW3p55Q==
Date: Tue, 17 Mar 2026 18:11:23 +0000
From: Mark Brown <broonie@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Richard Fitzgerald <rf@opensource.cirrus.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 00/10] ASoC: wm_adsp: Some improvements to firmware file
 search
Message-ID: <b6c7d439-7c46-4c99-9213-30369f1dd443@sirena.org.uk>
References: <20260310141817.1871794-1-rf@opensource.cirrus.com>
 <70c45f75-7ccb-476b-8646-3896181a2569@sirena.org.uk>
 <e9fc894a-4183-4d22-a9d7-6ad05167abe0@sirena.org.uk>
 <abl4wZyYTJf1C4ml@opensource.cirrus.com>
 <abmTp0NcfyCjfdpv@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LSeYRvp9/leVFvy2"
Content-Disposition: inline
In-Reply-To: <abmTp0NcfyCjfdpv@opensource.cirrus.com>
X-Cookie: Must be over 18.


--LSeYRvp9/leVFvy2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Mar 17, 2026 at 05:47:19PM +0000, Charles Keepax wrote:

> The rabbit whole looks pretty deep on this one. As far as I can
> see it fails adding the device because the device already exists
> on the bus but this is the first time it added the device and also
> I can find no evidence it even created a bus in the first place.
> Feels like there is a large piece of my understanding of how
> this is supposed to work that is missing. I think we might have
> to wait for Richard to return on Monday, how much of a problem
> is that from your end?

This is holding inclusion of any new ASoC code since last Thursday out
of -next, that's pretty disruptive really.  It might be easiest to just
drop the changes and let Richard resubmit when he gets back.

--LSeYRvp9/leVFvy2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmm5mUoACgkQJNaLcl1U
h9BMRgf+LSvFzd5T1wrAwp7zuhLfEYCxut8WmCxx2429zfyfdIyY1xj8cyItXMAe
so0yL1TGCVgg3/hcEQaUJRvJTE0qUqQgSBK6w/wKFbe8gDsqxXbFyJoHVlhbx6H6
kuezeqRNAZCviJ8h5msbDCKdlePWmURwQWqRJ4O+sMy2qACV+0x2R12ZFpdQRV9J
PHjzifRdA2TLFwwjbIxYFx+9l0lEuCdWjRVvUHnwZ5EAa3uD+I7RTVtsoPpkBskp
S4jJK23znEDZYTDseYz4JR9vaNV1ImRxOGPYLdhi+SVIhKTMJz78becgrDHIIwFO
YK9tEa5582w16PQ97tkUnzQk/CjBKA==
=H4wv
-----END PGP SIGNATURE-----

--LSeYRvp9/leVFvy2--
