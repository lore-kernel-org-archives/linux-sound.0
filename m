Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEF0360723;
	Tue, 27 Jan 2026 15:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769526846; cv=none; b=Inrd97pK7LTN5S8bP1Sz4W7YXQKo/JoNOy4/Ugexg8LiUr/9kRWzbb8ZcK3LbeQqKXcvFxgwN87rUKF8bvzdLsHC5wZ5Y4rwiqahRh7TzSFWw5m/6oH9bM6vLbb6TEFhdsGiEzXgl6Js1sWCpFiQ1bgmhNq14B8JCBf1hIWV668=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769526846; c=relaxed/simple;
	bh=m3TPcHEBsfQWalMm0WnZmJSQ9jtV0YcHvN+I+5GyKcg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n94mgLMA23OIt2TMqvHmWoPwi6mtESXkJzQgr55OAZyUo7pC166uvZfveYw+LlUjxmtT+ANszS/7peBdpRgX19Sp4XsLgk1UcuHOKsDqLFyQ0YUSgQZrexsXBnQe5Q/UsJ4S8Yjl0Ig5gsVay28qfVN3FHA5tJ8uJjxyJwu+cTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6HCNZVC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6HCNZVC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80D4DC116C6;
	Tue, 27 Jan 2026 15:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769526845;
	bh=m3TPcHEBsfQWalMm0WnZmJSQ9jtV0YcHvN+I+5GyKcg=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=e6HCNZVCFeM8YX1tPMWcLW1EsiHYjkkwHqseYc4bv6Bxsmoy3ujng5Mi8tUfo/z+m
	 8HReDz5GJjv0zfInqcd1hGFeoGPapwIEudAb2x6Ld7sIppls0NCygGN8UUYgylHX0m
	 76kY5jTACLJPTP5Eye/yWZN0q+GDf1vyTm6jwa6w7NnKYbjnlRxupa5kbw/7IyWmeP
	 xofHAcWndO66DHnxhYIQP66RnvfqNpBgRF4muj8ziPmzjwNkkI8uZokWbRA57cJLVv
	 DIavMPNowsEypkBkLXA4uP6Rb9k8V0VDEGQx5jwMeoW5wermo7GwiEwA3eSDcSn77h
	 wrruRGaaFjNIw==
Date: Tue, 27 Jan 2026 15:13:59 +0000
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v4 5/6] ASoC: sophgo: add CV1800B internal DAC codec
 driver
Message-ID: <153acfd6-cb4f-48ee-82e0-0a18a4a1e9c7@sirena.org.uk>
References: <20260120-cv1800b-i2s-driver-v4-0-6ef787dc6426@gmail.com>
 <20260120-cv1800b-i2s-driver-v4-5-6ef787dc6426@gmail.com>
 <88ef974b-9fa8-490e-ba19-1fb31ca94342@sirena.org.uk>
 <aXjRx12yPA7QflaF@anton.local>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TAPu9R6EF7VUDzRm"
Content-Disposition: inline
In-Reply-To: <aXjRx12yPA7QflaF@anton.local>
X-Cookie: I brake for chezlogs!


--TAPu9R6EF7VUDzRm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 07:11:24PM +0400, Anton D. Stavinskii wrote:
> On Tue, Jan 27, 2026 at 12:49:52PM +0400, Mark Brown wrote:

> > Nothing ever mutes the DAC so this is a bit redundant.  The mute should
> > probably be a mute_stream() operation.

> I'm not sure here. DAC mute feature was not implemented because I don't k=
now how
> exactly do that. The public documentation is very weak for my taste.=20
> This call added here to be sure that override flag is
> not set (override feature replaces the output by setting it to constant=
=20
> value and ignoring the input, so it is some kind of mute from my understa=
nding.=20
> So ensuring this off is needed be sure that DAC will output our I2S data)=
=2E=20
> What do you think will be better to do here?=20
> I'm sure that is needed, but may be better to move=20
> it to some early stages, like probe function.=20

It's probably fine to leave the functional code as is but you should add
some comments to the mute function explaining waht's going on here.

--TAPu9R6EF7VUDzRm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml41jYACgkQJNaLcl1U
h9DvQAf+OiroM7nH8QOX1NaSJVvy9B/1hfdynFnaK+SbJP/lMp8bM0VZfV1zbgKk
KEPUW6fk+OkycL5Qd9oiRuLf5BVb1CvzreYkv24xg/5f7b9tki+qc1NTwCVcCWU7
RdOaf/YEdLbOgpk2APDtn9AwrfKSVZcuNlSUMGyXnTEVGABbGgx2c3wDiqjts2cB
HyuOE4W82gMsLkP+QuBYIhuY8gyXg8kY7GFejrakOm89inTSOzR6hggArLzMOKY/
VhE12PZ/837kiUrlCjPceVMbOFbpLkciDe7fCb3e0YQabDSFzQbk8qjSDG2uZ06R
VPI5Qi3CG/KHSdnVE/nD0d/ARcsHMw==
=jGOT
-----END PGP SIGNATURE-----

--TAPu9R6EF7VUDzRm--
