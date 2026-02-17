Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22D31D5CD1;
	Tue, 17 Feb 2026 19:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771356183; cv=none; b=YG+alZgKzIYzjzLMpVgrbsa+rhk5GusnCRMH/qHFCggMB3PsaQ4IK5asx9Tg9CAAPFe30RIULmg2aY+oZpWxnACj124pCimh1ZPJXJ595TED/mMwvgSWXPMeCkhlXFR+9Mb9b8SpcsTIbyS6/Rd87zOiOtk7R0t5wSRPyqE0Y1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771356183; c=relaxed/simple;
	bh=AuzP1RjH2J93oglEEmMjAhLwguv68kNmitEf4HtcFgE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ht7rfClS5hPtSHRsepgphlVdJ7aGrW2bRDBLKJOA07LOTha41xfwTzLFQt6W3+nWvO7psUV/TG8FkhzDCTOwHythptqyDnYN/UqdQ3iicDarA5Y59S4+PZUOKRZ+KwcSkBAkZyNkC9vBER6YfnMp80+xmdJpOQVHSqcY/Xx2+vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZkvlKQ1s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZkvlKQ1s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 297B1C4CEF7;
	Tue, 17 Feb 2026 19:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771356182;
	bh=AuzP1RjH2J93oglEEmMjAhLwguv68kNmitEf4HtcFgE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZkvlKQ1sAlkJX0vA8Tfn/Qm6cXriGO4FcK4Iq+24smpf4EOQUndrJZuiEfBUsvDTb
	 8f5oygBZtahKpGeWEtE9ucsZrCF9lp2nOLIPJrr2qGUAYQlxS1ON62M5jFt0LdlJ20
	 m8NrK2gPPqO/16qTZ2SatXHf3a2dTo20wfa+LvXccSrpz+UjlDMi9Z1V68l8Evv9NF
	 GfGTL8E+sRfYbyO9Wkru7Lv3HYqvO1ANbgDyxKXtfwCRSbOX7VJZKA0QyBplFI+i9w
	 kkkKZE3VVU4vbv0aw/OFHK6tZh8BF65PofnAs6fFBBJJt3yIvKPjyhrZPe7o2yrY7Z
	 AZC0uat5+b0Rw==
Date: Tue, 17 Feb 2026 19:22:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
	linux-kernel@vger.kernel.org,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
	alexandre.belloni@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [REGRESSION] Re: [PATCH v1] ASoC: rockchip: i2s_tdm: Re-add the
 set_sysclk callback
Message-ID: <49e43733-1366-4a4a-a787-f7221b9612d2@sirena.org.uk>
References: <20250117163102.65807-1-detlev.casanova@collabora.com>
 <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r2QkDNKpLEvUVJ3W"
Content-Disposition: inline
In-Reply-To: <DGB6VK7LC8N7.322SYGWZXPL5W@bootlin.com>
X-Cookie: I'm into SOFTWARE!


--r2QkDNKpLEvUVJ3W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 10, 2026 at 10:54:04AM +0100, Luca Ceresoli wrote:

> I'm afraid I just found this commit breaks audio capture on the RK3308.

Can you please send a revert explaining the issue so we can drop the
patch (unless a fix is forthcoming which doesn't seem likely right now,
we can always re-add the support later)?

--r2QkDNKpLEvUVJ3W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmUwBAACgkQJNaLcl1U
h9Dd2Af9HGtRQCrve806p8Dm1UkaY3VZUZSB8RwkclUugeGfGhNUiOQJuarjCy6n
U5Nh1vijddpOuXxHlFWzj3QXeCLnbnHixhdua3InE577kp6SYrV+B+DQQecLtRHe
jy6zRPH/HsN3147BbqLYuAeAP3Zo+fwGxbhcvkIOUqmergCqBXHTSbRbI8E1C2iW
YaBHlV/HR3J6kAwjKK6a739hGCWzS4D21f3TE5trL/+buFSstLcki67zTBJDnKVZ
z09GrxLYVcmTcILzSUplO0s9kWzfRbbjcdid1OnYH+vyO0Q+GOWRav7jnL77C1ip
u19vZSXZGcCE+wzi9nh6cE1A4gLUfQ==
=wiOT
-----END PGP SIGNATURE-----

--r2QkDNKpLEvUVJ3W--
