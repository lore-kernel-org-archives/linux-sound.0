Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BAC3A0B18
	for <linux-sound@vger.kernel.org>; Fri,  6 Feb 2026 14:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770389046; cv=none; b=UPhLzn7kP2zfDrbwuARFm+jCnE00Eg/Mhl6xo1vAhBZm87p/zEbPbOCWVQAL7zvaHpl5x3rQb6m986Aeww5FZPPv4xklG7xlbIG8uCJPL2+jBAsV6iJUmm4ObV2+l2lwoMsG50K+xd6c2ApAzJtbDdU+kyAfhhU9OpRd4t/miqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770389046; c=relaxed/simple;
	bh=4pzk+hOKbeZmQcrM7JQdh10kjVHMNP6qprrhOG7F2E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHg9YA+Zm4XIxExN5l4cjiDmeKKZzuASMr3phdBWuLCsVHaMmKQf2zZfRuMCXPvkLBeBhicNxf6WYN2gOqo0//d0tKoNuAHTjY1LNjucex+86M2ct5W5a+8r0dUy4EutaibuhcAKmaQ8MLwtJILpuE8nv9Y39yCrDOaJnnvj78U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kiTXVmJ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kiTXVmJ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E9D1C116C6;
	Fri,  6 Feb 2026 14:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770389045;
	bh=4pzk+hOKbeZmQcrM7JQdh10kjVHMNP6qprrhOG7F2E8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kiTXVmJ9N6fk7tv9r17nw9ussN9j+2puj8BB+NdQio4vowA7XsNkvG7KRv8kqMuVQ
	 iRgM1XOsNqfDaxPvmcTa+J/bgCMEfUivejU2xRhvLmyT+lxU7yw+uqXfvgOcUnZVUX
	 nqLMRdhOFDFHy2pizhAl7aDncBq7qIBLYJo+Nc7j8CzlsQqlXpQA4lOOF71aSzWTOB
	 TIUfaBJxX+UY8/cMBnGLXyVcMarI+7lH8IpWx0OQqhSWPLExZOCEt9PZ1wo5eueNvs
	 TWc+OZEtgmRL3r895Vn2e2lIm+QhtnxmqJfhRKQY1QJ+/ByhXmk0siovrFwHPsPwUx
	 g9ZI10ZS59sFw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B5A481AC57C7; Fri, 06 Feb 2026 14:44:01 +0000 (GMT)
Date: Fri, 6 Feb 2026 14:44:01 +0000
From: Mark Brown <broonie@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, tiwai@suse.com,
	perex@perex.cz, amade@asmblr.net, linux-sound@vger.kernel.org,
	kuninori.morimoto.gx@renesas.com
Subject: Re: [PATCH v3] ALSA: control: Verify put() result when in debug mode
Message-ID: <aYX-MUIqvrHpduQ3@sirena.co.uk>
References: <20260206113250.207179-1-cezary.rojewski@intel.com>
 <87ms1m9htu.wl-tiwai@suse.de>
 <aYX13LsGaMjO8X92@sirena.co.uk>
 <871piy9c1t.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dJ9zXkWMLX/m0ZaJ"
Content-Disposition: inline
In-Reply-To: <871piy9c1t.wl-tiwai@suse.de>
X-Cookie: Think big.  Pollute the Mississippi.


--dJ9zXkWMLX/m0ZaJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 06, 2026 at 03:33:34PM +0100, Takashi Iwai wrote:
> Mark Brown wrote:

> > Might it be worth considering doing this via trace_printk() or possibly
> > tracepoints?  They're very low overhead and with tracepoints they're
> > strutured so they're more suitable for very high volume logging.

> If we want to record each kcontrol access indeed, then yes, I agree
> with tracepoint as the best way to go.  But, IIRC, trace_printk()
> leads to a kernel warning, so better to avoid.

It does cause a kernel warning, but given that this is only going to be
turned on with SND_DEBUG and probably shouldn't be on in production
(given the extra read on each write) that doesn't seem unreasonable?
I'm fairly sure tracepoints by themselves don't cause a warning (they're
there all the time in all my subsystems anyway) so would be more
suitable if the complaint about trace_printk() is an issue.

--dJ9zXkWMLX/m0ZaJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmF/jAACgkQJNaLcl1U
h9CIdQf/UelbbYZt9rlbXtyx/g0cRSs82sGoUR08CCCclWsigPEafuICXNe+d8RS
oJ5Vr5IcoQ7V+GqopWxsiZQkDg6uO6IIJmW1Lm+t03yGUjLJIEZO3OnW1Ka7b7zu
k3hpU6Pbz2U1tOtunc9JLymxNjAQHok+XEnFqM3HoWU41i9jd2wSr7QYqje7UYo3
zv/3MY3jONFEVsTff3Y16kPcyP269vlBO3qyhYEiVbEbWeLJihe7Hoi+pbvNRfp/
WPkbHPwbj/S0UARZQA2KgkPQY/G341Gr/mD7Uw3pRCaK3YprcfaWhumMVCyc3iN+
Ndnlzn7A95xgZQ1g2tlUlcrO7aJKTg==
=hSey
-----END PGP SIGNATURE-----

--dJ9zXkWMLX/m0ZaJ--
