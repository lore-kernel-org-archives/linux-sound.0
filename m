Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEB544C67C
	for <linux-sound@vger.kernel.org>; Fri, 11 Sep 2026 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128622; cv=none; b=aJmRcdzm2shr3H7H17cgbvketsV53ZRpztuGCjYWz6rr7VF/7sl6fg80M/rJBkaOypDR3HBjdWie6NjCF/rRiOQTYL384HtHdM0gJGZ0jJ88FfGI+zkfe0FQr2ixl//A7lbA/BjZ+4bUSYiBT0WdKSr+PxpyfU9l4EEw3yrlxmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128622; c=relaxed/simple;
	bh=kNMlsQezd1iZmM0xDoLBFhmS58jnozdamnygr+7vGoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lTayIQjzsscOgWZx6jreIaAhRI+CA0pVcCCSfcarblvP2cQboaPpfDxvwHBmUOUOfUYsMrHOBx/riL2vf6Vicrfym8h2lmzU3np0tpRQ8k5dulEp9WQoUnGy03Z544xnHoGJ9uhF88VNzz/J6JxAMgCak7Yg5Np2OX+JWm2/SnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kf3rvJm2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kf3rvJm2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37651F0089B;
	Fri, 11 Sep 2026 12:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789128621;
	bh=TdvbQ6yOUtVtDGHuFPleFIfExvSpSAMTUy/qYK8cue8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kf3rvJm2OO18FjSvTe/jT3e0QCH5mNQwTO/U+WSAIFAXeEaOd9Z7UqY3GPakCnmuR
	 UVC2WFbpyD57U9Jsp+Ycbt22dO1Jgy0egq/FhcrgVPoI9c7Crlw9P9RBfkDbDRZY/5
	 PF63j1gstU06hrnzK0TpQjlkxNgq2zPYSVn0ZL4Xx2LdMIzBoM46JuFGwaRJpb3cs0
	 6AQHCKxymuTktDQQSCpdCFbNoYmvqrCqZ5dnR2KKByFet3qLEiCRctaXmTwXax7jrj
	 Jgog4Wuhf//It21Pr1KhUygLYFh7jIpPCc+nEfmTqLOUpAanEmiD6oAG/M/iTexpGC
	 t0ARy/Q/8EUiA==
Date: Fri, 11 Sep 2026 13:10:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: tiwai@suse.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: ES8326: Add private members about HPF
Message-ID: <71b07c2f-7dd5-4344-9a10-f63bc67ccd4a@sirena.org.uk>
References: <12182d7f-b6f6-44d3-9b4f-e73ed0253ef5@sirena.org.uk>
 <20260911021623.29862-1-zhangyi@everest-semi.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4NG2zaDy9vLzdoSK"
Content-Disposition: inline
In-Reply-To: <20260911021623.29862-1-zhangyi@everest-semi.com>
X-Cookie: Piece of cake!


--4NG2zaDy9vLzdoSK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 11, 2026 at 10:16:23AM +0800, Zhang Yi wrote:

> > > +			dev_dbg(component->dev, "At the %u Hz sampling rate, %ld Hz could not be obtained."
> > > +				"the frequency has been set to the closest value, %u Hz\n",
> > > +				es8326->capture_rate, ucontrol->value.integer.value[0], es8326->hpf_freq);

> > It's fine to just do this silently.

> Yes, but I'd still like to keep the information displayed here.

If you're going to do it you should rate limit it, userspace can trigger
this and DoS the logs.

> > This will update hpf_freq, does that ensure stable values (especially if
> > the capture frequency changes with different streams)?  We probably want
> > to just store the user value without modifying it.

> We want to be able to change the values of the HPF-related registers when the capture frequency changes,
> because the specific values depend on the capture frequency.
> As for changing `hpf_freq`, since the codec cannot support all user-specified frequencies,
> I will replace the user-specified frequency with the closest available frequency.

The problem is that on repeated stream runs the value will keep on
getting updated and drift away from the original setting.

--4NG2zaDy9vLzdoSK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqj76kACgkQJNaLcl1U
h9Bydwf+OwdN1YIXvwXoh8UDWfEa9udqSYHNh63LWHhKQymZQVw71Y+KsCEmrP+f
dwQ8ivVv8KQV5GoVIhqlsTf5f8pVgjMUICJr9Xt5tpZdmnNq4A/9ZU+N3DOeLZtj
doKVuGT5K6RNMHb9Rs75vkHXG3uf7EtRAeIU6BrnSF2RcZtoxe20WC+HiZD6KSIT
tPw/2DCuR5UV70q5he7s21ErS9xuXXMz3AhrEhVNvIm3vANxLPbNVN9N56kOI7bS
RLa1DNi8nmUHEXsi4VVcjx/ebDoy2QeTHv5vGeAIw7qV+BsJDkJzufyRpv975UbS
cExeaJTAxR4wJBXuAsRWQBWyFrrTcA==
=l6mX
-----END PGP SIGNATURE-----

--4NG2zaDy9vLzdoSK--
