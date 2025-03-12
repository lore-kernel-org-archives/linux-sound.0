Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E7F14601C
	for <linux-sound@vger.kernel.org>; Wed, 12 Mar 2025 15:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741793648; cv=none; b=WlER7C8LQ8B8IVqrfKwG0jhg3Eyi1GiFxb1eiMJPHq1HDYamq+FBmZMd9wH/j3lzxntR781MSNQZqQvv0/gfelBbTSlgMDItzhUKOGffiDNHNA70+4LM6lZkJjPEJvRxM1ZfTpP84NDT3uJRJAhEfoyH+Ra18op/dlzLtJK1+XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741793648; c=relaxed/simple;
	bh=Gs1sKEuzRvriDV0T6Yz4n/DH8nwiLhow33b6pRnPL6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jvQaZrudTyvvgmThY7gdfhCmw5gNBMeQXq+w1v6UuykFXuPyMIgBVbBPNfBLEllJ5k+8P/md+urHer8dvaetX3XFfZ4nxRpMUQSJqCMKhHQxprSlAqzqe45bgfH0eqPbF6pRXUbCFJh1TaZ6NgigHRil7yUB+gWyVlklQk/Aqeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uxK0YU1b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uxK0YU1b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14BA1C4CEDD;
	Wed, 12 Mar 2025 15:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741793648;
	bh=Gs1sKEuzRvriDV0T6Yz4n/DH8nwiLhow33b6pRnPL6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uxK0YU1bWaV3eDQdI1EX8sgkssc5yWdzv9hdaOTj0Yqj/jYlB86Xqk/thGq+c2war
	 ClNhXUCVX8UqyGypZuafZ47nj5Lgtp0EU26L5ZGsSqMKKJQeCeot0JPUES7uUAUjlo
	 PiJJMYpqdICh+2v5tWLVI//uQceYz6QaydeKKfhl83d4FPaN/BEKHXLrofGs0g0ng0
	 7zXnLL4kHuVncyDnfoUbWsnfqVhZEY0wfGIzRl8VO0A3JWrxxGWodJVqe4Ou7BWGmg
	 To3g7Lf35s0tM+4fDqEYRjm84dqD0P5+YLBSnXzOxXDj6uheVgrPBHIOSq6mc4zzIC
	 7Y0p+aSOceW8w==
Date: Wed, 12 Mar 2025 15:34:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: cs42l43: Fix build error without CONFIG_PM
Message-ID: <a5cd97fd-dbb0-4438-adf2-e2f9283d771a@sirena.org.uk>
References: <20250312145642.26646-1-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7h+9IsSi5gf/XS0P"
Content-Disposition: inline
In-Reply-To: <20250312145642.26646-1-tiwai@suse.de>
X-Cookie: You will outgrow your usefulness.


--7h+9IsSi5gf/XS0P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 12, 2025 at 03:56:39PM +0100, Takashi Iwai wrote:
> Put __maybe_unused to work around the build error without CONFIG_PM
> or CONFIG_PM_SLEEP for the newly defined system suspend callback.

Reviewed-by: Mark Brown <broonie@kernel.org>

I'm kind of surprised none of the build bot people noticed this...

--7h+9IsSi5gf/XS0P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfRqWsACgkQJNaLcl1U
h9AD2gf/Vak3df0MqVF45/S5dVbeLQchvl1o6GgCw8diHp/Zy8MUpoCVdcSQyuoG
VNPtKwJ5ZxFqV5r3wfSKlvgj4Oa013CWl1/aLYhbYrW5DaQNK8SK/WHuXJBr5tME
/JjXtRQ3aC3QOq1cburV+9drhb52Ht01TE0anAdIkg+gXeqaInzdnOeDOYTMPt34
KEuKNERRQ//XC0MpZihND7Y+SO7Vq1udaaDzPte6k5w5qRfQKvFAI0Reb4S8QAhN
vb/3uIkYjgQBWMC9UpOK8PQYNp8yfD0p7z/U6iSmb1jNm64Ns+IZcWwD0bqV0BZ5
7y9pkQ7oZ+gfjf6c3HUN67rPr5ZJ4w==
=+ijB
-----END PGP SIGNATURE-----

--7h+9IsSi5gf/XS0P--
