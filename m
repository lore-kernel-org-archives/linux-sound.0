Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A4F317155;
	Tue,  2 Jun 2026 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780411951; cv=none; b=gaJp2Eg2d/dc+2HmMNVT9k/ATXEXeCrUZryU6/RWVBZ2NyQnSiE25JSnS9tEkZwlhf+q+/5ycMlWUeGxsiwnZGFWHpTtlgZKDbPdxmK3a82TE941wVRaXyDd8B96abCDbKQuPeS90QIMFtH5yvqiTwejemKTqmppq4IMZUgSLl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780411951; c=relaxed/simple;
	bh=21u4SZxJMTimW+TGenRpkelrXVQzMO7HYgu67d3Mv08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DJOowrpbkGs1Ea29JU6nh8ROabYVscHOI2uros13muGcyFF/9vK1T6XEOTnhGNkzT/hL1GMZswLmUOnyQf/QuWJXRt6vlpYRAGozjTYmTT/+nfFUo50sOnPWPx2TSzvmSQvAzo3jdCOgqUz9ZnLebMhvrIar3CuCBnX6y5mUsw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gwfEicrA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gwfEicrA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A314C1F00898;
	Tue,  2 Jun 2026 14:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780411950;
	bh=Ya7vEv/vABepYCwu+Lm3YRqS58jVXIZ3Da039Lo4j2s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gwfEicrAedbddQ/xyEygovHWU1dPM6icLFhBuf0+oPKWs84IGxCz9OCJcEZc6/hHz
	 368q2+ntstxiyDMKT0M51FM0+Av3c/mbTS12kc5E0lhE4l02JRdZHP8B2wjQbVk4AL
	 YvqqaFFRVVSmpPISQqR0HcZ3N2N0b3s+aba0A/0yF/38uqrV+ZnXihWlVLXVVlCu0b
	 Rsi3JrK7pW1nyFQ1vCAUvk8G1OG2eEGOPWuRQ3/9UmYXi6GH8gIEBsu/BgkJHrnPUR
	 88xwZ0dCmEuW3akzhMdRra6TEjYsHCQuBdO+7pdvNdNQY20Rw0QDjkj2Lrk3iUmjyl
	 x9BFKznQ7ji6g==
Date: Tue, 2 Jun 2026 15:52:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH] ASoC: soc-core: Create device_link to ensure correct
 suspend order
Message-ID: <1043e3ea-46cc-4e6e-9c5c-ad4536c95716@sirena.org.uk>
References: <20260601142835.282301-1-rf@opensource.cirrus.com>
 <0aef9b01-65fa-473e-b999-0c5b285009c5@sirena.org.uk>
 <f47bf7df-f1fc-4d77-9293-938e20600826@opensource.cirrus.com>
 <b9c0e5b3-13fa-4139-815f-5652ff494031@sirena.org.uk>
 <e2e34915-1194-4965-b02d-4e64b44a2701@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TowGFrDIg8WkKjTG"
Content-Disposition: inline
In-Reply-To: <e2e34915-1194-4965-b02d-4e64b44a2701@opensource.cirrus.com>
X-Cookie: The wages of sin are unreported.


--TowGFrDIg8WkKjTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2026 at 02:55:09PM +0100, Richard Fitzgerald wrote:

> Oh, you mean two components with the same dev, so that the
> device_link_add() gets called for the same (card,component) devices
> multiple times?

> I tested multiple calls for the same device pair, and it's ok.
> This also covers the case where ASoC core now creates this device_link
> and the codec driver also creates the same device_link between the
> card and itself (hdac_hdmi does this).

> From the kernel doc for device_link_add():

> "if a device link between the given @consumer and @supplier pair
>  exists already when this function is called for them, the existing link
>  will be returned"

Ah, good - I'd remembered there was an issue with duplicates there.  I
guess it's worth adding the defensiveness for card and component being
the same in any case, just to be on the safe side.  There were some
SoCs (sunxi I think?) with integrated DACs that I can see doing
something like that, can't remember if they actually do or not.

--TowGFrDIg8WkKjTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoe7ioACgkQJNaLcl1U
h9ASngf/cBCkrpQ5lod784P/9EmSA7+/bjbrStfJCCc2D21K/jW2ykKUs+TSkqr6
VBnprDLG9sDfR8jx8tWOIP5H7QiXdAla75km8nQgA+J+bsCACzaT4iCHTr6pjYcr
WPzJzNJ6g3I1Vv6WkwTpuz9Ge3Vipd1IJJ5smkolTkQuDNBD3UOIrUkg7qb5/l4Q
7rNIG8kR2F/PmmzoyipUHOH74EQ5pCNikFDgEjabxNIj5kTka1MaKzYxfL+SdYE5
iOcUlQURRlEEmjm8pl19t+j2oKd/YVbXGJ+Nt7YMaRb7fHJQkPwqCXmx7W4rmB89
aO/pTjhABQB6ZGvcqyEpWKuNZ0mCbQ==
=A3ci
-----END PGP SIGNATURE-----

--TowGFrDIg8WkKjTG--
