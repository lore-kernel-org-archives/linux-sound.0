Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FAC221F2F;
	Sat,  1 Aug 2026 00:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785542721; cv=none; b=iChnadun6ZgqOpGH+C9oJxTg8YPUPQLusZ47VQYnKa3qtbaC+pVvWzv9IFn27rx1c1XYQSZl9zRpwNFxIun7jVaNL3mBUHWdjgRTqCwisQ/8sxVYgFSfx4ZXZc4p4RCS2DSRU4R+AbQtpoeLDvA0612W8z+s4zEH9fFBOujvVYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785542721; c=relaxed/simple;
	bh=dmqkXcFu1oQ4/zFvKbg+j72YjaeaqfVkH0vGBu/4jsI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAxWlKhrdJsJWP6LeQNitkrtJjQT47o2hl9/6xxg/3xTgW9xgLMKcYyHLko1e8rHR7gnKAgZPCYTpKsBWMzNr4xnr1wH2Alt0b0lfbVYnP3Skv2+0+e3TaHVYhZBiqxXYEdwwYEv/8z0fyTmgzZPILLxGR6dWIe3650gmI9b0qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jfKd4LfS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jfKd4LfS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 341641F00AC4;
	Sat,  1 Aug 2026 00:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785542720;
	bh=knOgyuuxNshljdeTzMnmFZIQCsHXGrVxEQ+afmQqD6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jfKd4LfSU38kImp0obzSsw4GkY4CE8G2Ni2T0DE3LnDCeeAucjC6jiO1FS4/9SzCQ
	 rFECLYnyMK6sUeI/lvJIBm7udJD+4EEp5pmJBXMQ3mEyGDySA9SEN74RbdsbAta+yk
	 9Rig8cc4DL/eH0JHm1XozmpXNdpLztlY2CzgeWuy0/7O9igtZk1DtW0mv9FybP+kNg
	 goVwA5uT4XIhDekjPBvUQtRcXdj3AHrM45kZvngE2gMniRRhY3yV6uwirCSyeAEA7F
	 +KWHqZLAkIV+4jRVXeHZ0OrHanj1NlHErfj/mYHrKb+oDDzcwcVDD/f59c1ooTRIqm
	 OvW6FqBXGmmSg==
Date: Sat, 1 Aug 2026 01:05:15 +0100
From: Mark Brown <broonie@kernel.org>
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/7] ASoC: qcom: add AudioReach TDM backend support
Message-ID: <275c15b9-8a46-4e55-aff4-9e0aeb01b730@sirena.org.uk>
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8yEe3BsDYJYQgFpx"
Content-Disposition: inline
In-Reply-To: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
X-Cookie: No shirt, no shoes, no service.


--8yEe3BsDYJYQgFpx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Jul 12, 2026 at 07:11:03PM +0530, Prasad Kumpatla wrote:
> Add AudioReach support for LPASS Audio IF based TDM backends and wire it
> up for the sc8280xp machine driver.

> This series depends on:
> 	- https://lore.kernel.org/all/20260711125740.3083236-1-mohammad.rafi.shaik@oss.qualcomm.com/

Please resend this once there are enough dependencies in to allow it to
be applied.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--8yEe3BsDYJYQgFpx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmptODoACgkQJNaLcl1U
h9A7zgf/QUdlzqpziYKVotZ0qJvYdkQOkEKLCckXltxjWlAXNU6G93MkeiIGiIro
1jq6JHyX5OfzZa4XnGyn7V5OZ27Q36IQ+iR5QwWJ1qbvvzvHVbfKYXEEACvI1jpZ
x8ZsNKlt5u/JEscUAI8Fr1xt/bu3JypFQ9Cyiwpw09pERizkL0EfxpyepAhQVFY0
xfwKGuMW5hPdCHK3K27RUZHYnSOc1WDBoO4rPbPwa7n0u5sQwg96gKJswICDW+zh
fVqudlhv2F6nYe6He5WsbKKIKwHohyCCNIUU2oMQM08q8TUr9MXRnbZbxbC2rgLK
02oBeLNVv/wHHYbgqSssEds9YLvYLQ==
=QFzh
-----END PGP SIGNATURE-----

--8yEe3BsDYJYQgFpx--
