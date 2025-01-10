Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141FE205AA2
	for <linux-sound@vger.kernel.org>; Fri, 10 Jan 2025 18:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736532211; cv=none; b=qWSM1r8O68K8SFd5OaTcyBgWxlSlTC5JzFtrZuzdB+omzq6PnVVQgOF3T5aMfJmG/TjAtfYp0FOAdsYIq69f52R+hjlQkxW2myb6YmM2zOIKCcD5T7F2Mlr/8umbaAJYVjcyp4b1z2hdHeI4Yjz7TO8e8fFdvjxpi19iERu+EAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736532211; c=relaxed/simple;
	bh=zO4sjLxeAYHyKBhdHoRk/yoXNxoS6ZrvORK3A25n/GE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NMryj9TlNY1bF4iz1G7kmlEDQxVxc9LDaIihZRd7QJkDcuMzhVO9GyjeNv0TL6nfNgoKIEfF5y/6QqvIO4gmM9w5sLi6+6EfmtzivwKEGGLdrcyongywaU9ip0uOWkddK+oQhamhQ2wjjSv6ll4/fkzkMud/0FdpoN9FgDQI+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIrFXsTk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIrFXsTk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35706C4CED6;
	Fri, 10 Jan 2025 18:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736532209;
	bh=zO4sjLxeAYHyKBhdHoRk/yoXNxoS6ZrvORK3A25n/GE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIrFXsTk3YJwj2fvFC5lA67x/2TC1ICkUXdfMSEWUbrN/CdsqeyljA56BT/ik0occ
	 jWHgDTYmoTiRcbx7Hmk5pa3hRI7gEPXnepKArckHVUtV8+6gZAiNWtwyI512oxenKf
	 jc638o1ceB1CBZQ/8WmLMpTZ3di6avM/x+nmDNNbs2R1Y9iZtReD49LhZUCwtHIagz
	 KiyyuA2Dl2FI/piliArQR7p7hSxGokWs1dWtSqaI77amvJ9vX04XXQqGGr70Ga14Nc
	 ZzYCfnUwKWqYv9WvX6kJlBquUDb+L7o9zfotxYwcOGQB6k6/mu5vhanW5sLipoo2wO
	 R1EbCpme23wPg==
Date: Fri, 10 Jan 2025 18:03:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
	linux-sound@vger.kernel.org, perex@perex.cz,
	amadeuszx.slawinski@linux.intel.com
Subject: Re: [PATCH v2 1/2] ALSA: hda: Fix compilation of snd_hdac_adsp_xxx()
 helpers
Message-ID: <bd677059-7c68-4e4d-a2f7-01eb419faf15@sirena.org.uk>
References: <20250110113326.3809897-1-cezary.rojewski@intel.com>
 <20250110113326.3809897-2-cezary.rojewski@intel.com>
 <871pxavdhx.wl-tiwai@suse.de>
 <e07e56da-4259-4a4f-a2b2-2482fc511e01@sirena.org.uk>
 <87wmf2ty36.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w1YsEWmydCBZTENZ"
Content-Disposition: inline
In-Reply-To: <87wmf2ty36.wl-tiwai@suse.de>
X-Cookie: RELATIVES!!


--w1YsEWmydCBZTENZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jan 10, 2025 at 05:47:41PM +0100, Takashi Iwai wrote:
> Mark Brown wrote:

> > I tend to just not look at stuff with ALSA: on it since I get copied on
> > lots of HDA patches.

> Heh, that's why I asked explicitly at this time ;)

I do tend to do it on subject line so it's a bit random if I'll see a
query in a thread (depends a bit on how quiet my inbox is and if it's
the next mail after something I read).

--w1YsEWmydCBZTENZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmeBYOwACgkQJNaLcl1U
h9BFKQf+KA37expKE151LuDiFyTWlu3j++qL3RFbFMkpakYG2PbDO7dIfFuXk24Q
02uE6+pp/xmsmAeR35rzKhnyMhbRibksTlND9TP8rNQ5RLML5Aq7EYt4SxTZ1OgJ
VMXhvczPDLeSdLNnBcV58eDvf3vgWF4OYNbYIOwLa/X0eBqEWD+WZPOwTI0Ztqq4
TlRzVuK/F58S3fH2429QrhyYKTprb9FqdaAEjraU5tLVg+WJ18Y3HCwHHlrPrdsp
YaSzUGf1YkYr4aHJysiYwu/1izwOzu7yUiICYYs0SC6HvKi+DUOD0j7g4jvximAY
Onk9xw4PKk6MvFsAeOUKM85ozzTutQ==
=JkE9
-----END PGP SIGNATURE-----

--w1YsEWmydCBZTENZ--
