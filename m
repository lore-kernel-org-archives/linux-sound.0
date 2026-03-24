Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6A53FEB33;
	Tue, 24 Mar 2026 14:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774363228; cv=none; b=swari33XzMKeQXnqyGgMn2sLxfiUtFRyCHjV9IK1AHMQfzt2pP8+4EBwc9NrAmtYgTHDCKngqyGNtZlg62i3ID57Sq81jhFIdUyT9YfjxAiEdzJHr7boMSyu9G6dITzSHJ8rhtXXSs/Z252ELZkI+VMZq90SyrAq/7GaWoXfY8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774363228; c=relaxed/simple;
	bh=USNGmdt2O0zOOhCBcSLXSyaOAdQ6E/AN8KhEYLoOClM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E4sm6BxPkhdgT+mfVulz5YgP4RtfV8t6hDllcQsgFuDsJR726ny3PSxVc7ikAWLObXzi6NdTJ23tjm5pB/nxVp+zMJXWkUQFmweCPFMDDKmIov6vDNlE/zemC1lpIiYsFSZ9tj3jSPQ4njcMg8KXcmTbgsIcxTOvoKAhEhv/xQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LRLjO8Q+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LRLjO8Q+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC11BC2BC87;
	Tue, 24 Mar 2026 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774363227;
	bh=USNGmdt2O0zOOhCBcSLXSyaOAdQ6E/AN8KhEYLoOClM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LRLjO8Q+k1qHJJ8zBlrQcQbhn7le0rD9iTCbWscpqBfh55fpRSqpgvoJqByJZnsvI
	 /4lnT4pLWr9G1PjaGqKGNa51vOfT/TZoP4BXIwjXHNC02VdxTqpzWjjEbDvDvxDELu
	 j6NmZShcoes6E2dtKkMrOiAM26s2xJvuoGw1m3cJkxiuBUsnDAo+u9pzN8wP2d+7aV
	 h5RcxAOoQNpSBfbY0Q3LRV8LovDIFzbXcjnfJMwxw8Wcv/vfmg6HiVgqXImz6QLwWf
	 Vb94jv3IFQj9VCZZIt5nsVaUbzY+M3E8rgKR06nMeQv1R69C+CWCKCY0rB7IxeqZKS
	 AyYQ59le5rhqQ==
Date: Tue, 24 Mar 2026 14:40:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: cs35l56: Allow factory calibration through ALSA
 controls
Message-ID: <8c748490-79c4-455b-a97e-d5ec8b798bad@sirena.org.uk>
References: <20260324110302.273983-1-rf@opensource.cirrus.com>
 <626b66fa-3f7a-4777-b510-18d0c0df3bf5@sirena.org.uk>
 <37b15eab-7dd1-4ec9-9439-bab9389f93f2@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6iV3dXyzsL+o9D0b"
Content-Disposition: inline
In-Reply-To: <37b15eab-7dd1-4ec9-9439-bab9389f93f2@opensource.cirrus.com>
X-Cookie: Forest fires cause Smokey Bears.


--6iV3dXyzsL+o9D0b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 02:24:21PM +0000, Richard Fitzgerald wrote:
> On 24/03/2026 2:02 pm, Mark Brown wrote:
> > On Tue, Mar 24, 2026 at 11:03:02AM +0000, Richard Fitzgerald wrote:

> > > +	if (!in_range(ucontrol->value.integer.value[0], 5, 35))
> > > +		return -EINVAL;

> > The values range from 5..35...
>=20
> The second argument to in_range() isn't a max.
> But if I'm sending a new version to make them volatile I can also change
> it to not use the in_range() macro.

Ah, indeed - that's a bit of a footgun!  Still, there's also the 0..4
range that's advertised to userspace but not actually valid.

--6iV3dXyzsL+o9D0b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnColcACgkQJNaLcl1U
h9Ab+gf+Ikv9hP4kM1dQp6/uuYdTa4H4eyD8ZWdLaEw9BmtQXBnwyuMbFikhLRky
u6BRDEqkfvftLRjtcB8ku5QzgPSTw7+QMeAL0gSVSaaIfiSmq8oBvba/JasS5EbJ
uqIFSMAD/ybZAdDaXCdSJJ5hWsU26XtO+e3WsPRor8mZlZBISN3B6pH4AAKDhx+J
LYo6DDUpuAhiuWKd5+UC2RjcWxEUeznLjeWR2mwiYq5Vj/a12mz8rl5y3BHKCnvj
MV1fLOHSbpO2+8+aKIKRIQCDyBq/W6SoJCEeXoF2sQXDH0lV/ovnG+6fbTfaC5Yl
c3HtKkCV090dXL6hxFzZ9JF4m3Haeg==
=Cal2
-----END PGP SIGNATURE-----

--6iV3dXyzsL+o9D0b--
