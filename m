Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31F8318EE3;
	Mon, 19 Jan 2026 16:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768840610; cv=none; b=hfFum+H1WglJLCpBmY9cc44T9lH/Q5Nrbu4wwcoh7Fg9Vy/UFA6yY7Z/sHScISM9FyjxkbD5F53PIivBhVZW6sOedDqlbCokqcMh5qnZs8l1J4txmF5Q90aS4dVjk4qB0JYEBtcy8kvjYagxhh0OG+gMIu+/SgWElrWwH9D37WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768840610; c=relaxed/simple;
	bh=r5AEjxu0ffIco57i3KrTMg0Pm0HG6BQGf3lgxhMEqFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyDdbrB3QBmxtlqwOgcFF8pn65iV9jMa+TYM0XbTAiL7rbDVjdQ/1e2/6h1gejqnESQZKXaHYKRZEVfJACUOxRKF66rmxd7cXPi6PWGTNHPpjSkoi6f4AcDKxNtqd53sIQ4eKvdZR7h/bJhvWG3ncmy18CWJ14jUqZXEI9iYhGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F6ErR9he; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F6ErR9he"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B22C116C6;
	Mon, 19 Jan 2026 16:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768840610;
	bh=r5AEjxu0ffIco57i3KrTMg0Pm0HG6BQGf3lgxhMEqFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F6ErR9heEjtTfI8bj+c+dyVTZdG0hyw7zI62IiINmsComZit6HlQyijcsFeykWvQ7
	 iQ1zBFL3pQoIG/kX7ftnx0iNvSwgKydlJuGaWFcp9deH7S5lUai//9KTFaYzJUbC7H
	 YvApF93/MH9kkxUBy+iqeNM3ghcPbafz9aV+K6ib1QAT17GiTI0YMXXYSE50q0IHyn
	 jwqUSfsxNSevgnBKxKfXeYmPravvY6IqsU2CZ7U8RwFOtQhrqa9Ym1a655yxpnI0+i
	 7v+3aCs4lwpL6kd5d6Vz9ORKb7eEIeq7T6rBD/6VY/mA0O3qXuHRoWpje80bdKF4kK
	 Jv2ZxIpUczUfw==
Date: Mon, 19 Jan 2026 16:36:43 +0000
From: Mark Brown <broonie@kernel.org>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 3/6] dt-bindings: codecs: sophgo,cv1800b: codecs: add
 ADC/DAC
Message-ID: <af0d60f7-9566-4aae-a349-c01fe0220663@sirena.org.uk>
References: <20260119-cv1800b-i2s-driver-v3-0-04006f4111d7@gmail.com>
 <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4P9RQnxsZDW3YdgJ"
Content-Disposition: inline
In-Reply-To: <20260119-cv1800b-i2s-driver-v3-3-04006f4111d7@gmail.com>
X-Cookie: Does not include installation.


--4P9RQnxsZDW3YdgJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 19, 2026 at 08:30:44PM +0400, Anton D. Stavinskii wrote:
> Document the internal ADC and DAC audio codecs integrated
> in the Sophgo CV1800B SoC.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--4P9RQnxsZDW3YdgJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluXZsACgkQJNaLcl1U
h9B3hwf9G1boRH8L5QCtx392+XGOiT4sOYgYXU0pmlteHX9unFMgDjR+FgH5TM2F
XLSCLPcmqhF49sa7nXmfhG68KwsL1b73U++hOxIIZNS/+q7LlB7n9nhsgmfQeANZ
7H4Y09vaMv7BuNbcyc5+klFCEsx1FeOfEsaVR5IJTqxve/Cu4LD4iOpbLcJ0WkaH
uW96QEQ+1b0OyjlkpmaykhS45RThDReaYjG5Mw9behxwvHz3BNIrfHBkmjp2miL3
Nm8J2bs04riq7EGAFzA88i2kymp0Q5jIxZnd+F6fdh4bPXG+8o1q8FC66acSnAT1
FXiKNOv+fds2KcshsMWSX9zl0KvRwQ==
=VPcX
-----END PGP SIGNATURE-----

--4P9RQnxsZDW3YdgJ--
