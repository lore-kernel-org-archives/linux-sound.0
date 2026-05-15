Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93B430E82C;
	Fri, 15 May 2026 01:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778810332; cv=none; b=YROvFZSsCYOJaua7sy4wRuED5x7eQyzsvA2uZaQmQA2ZOyq3/7kAq4tEdbqBVoFwCC8nLB3HP/HcZEewXXzEkdL61kfgG+X7VYMnc+VZfXPrBHrwSHgcDsHfcn+xMwVZkdR1IjaVbw4lUOwkBPiHXmQ8a/OhY7zivAMVg26ijE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778810332; c=relaxed/simple;
	bh=/csn1MNH7CqxFXm3s7m/76YlqYFlImYSXV+Re8/2PKc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bEI6YcyV2ABs5zmHPjfWXq9PTkenczpkKRjzQexkyaFdgz8rlTwc8/uxcgIAxKPdG4f3vP60v7KrcWPVAv9chJuNgXK57xbe51RUY2rqlm2APMogIpiNnSAc1a12Y/zoQsV2M7B8wyOAjNzwvfr10sjb6pLGBv9FWSN8b/TnL/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5pxKzdw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5pxKzdw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48918C2BCB3;
	Fri, 15 May 2026 01:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778810332;
	bh=/csn1MNH7CqxFXm3s7m/76YlqYFlImYSXV+Re8/2PKc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l5pxKzdwNjKdE8TGxE90IYP/49WOgSOflnJanmfjicNzCsOcd2c4CFiACAzlBXFRb
	 n0ACEYMRTcu0F1UVnqo2B0lB/s+oN5ktVIXiONRISjc63QmnT0baoUYaHN73Dt3Dk2
	 q10yhPgkw9/gvlg9Jg+0ILBJdFbJKvAlcqET3mpZJ5TtnO4ttmKMQCZQCcR4zf+VCC
	 WemngNbgxqgeVrCDWwNpsF5Z2tM+Xkr6Kgh0D8L0XTHfSGrrPqHC4Nn0PGpCp/aw//
	 OAGb5GkztWe0exOdND7MFI8KmRSLA7a5o9clb75x6nChwksC16NIiW+y4AWMg/Bkc9
	 U08+t8bGvzUkA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id EABCF1AC58D5; Fri, 15 May 2026 02:58:49 +0100 (BST)
Date: Fri, 15 May 2026 10:58:49 +0900
From: Mark Brown <broonie@kernel.org>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: stm: stm32_i2s: Use guard() for spin locks
Message-ID: <agZ92TVjcYpEv_eH@sirena.co.uk>
References: <20260513104329.81592-1-phucduc.bui@gmail.com>
 <20260513104329.81592-3-phucduc.bui@gmail.com>
 <agUknFcDIfwrOCld@sirena.co.uk>
 <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JHw9B3lGFRV/+bbA"
Content-Disposition: inline
In-Reply-To: <CAABR9nHfXi5G4+sVnLbWWJctQHkWASTzTwiV424bO6BXZDqX+Q@mail.gmail.com>
X-Cookie: Truckers welcome.


--JHw9B3lGFRV/+bbA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 14, 2026 at 05:33:17PM +0700, Bui Duc Phuc wrote:

> I'll send a v2 of the whole series with this fix.
> Would that work for you?

Yes.

--JHw9B3lGFRV/+bbA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoGfdkACgkQJNaLcl1U
h9B8ZQf/Wr48Xle/QH86Qy9wtXpd8zyaMYRJrmD7tgd33VlhL1P2qqPPpzIgFrUx
+oQOYBU8Y+JZajXK4OINoFfDIr1rLrMm7+nu5V8VYWVitSbQS0DF78UDQKn6AbVl
qbP4EkTeB4F5EP734i8DHd8asnpcB7wiDy8NAmyxpdlfswb4YNza/Zgv56BMbAQQ
vT9e6m3hAbFpmHqROAfgjOMExTCn2sjNEZ7EoZIZPpDWzDssNwavU+844z8UqFeT
sdaNE5jTe+DIV6NHimxIdUWkmnJMO5FFj7vse9C2Zrfp5J990SHdQUM4nmTzcXld
iEtrhJ77xFh2eFPZij6nhd7doLSf1A==
=xBvo
-----END PGP SIGNATURE-----

--JHw9B3lGFRV/+bbA--
