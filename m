Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB0E30EF9B
	for <linux-sound@vger.kernel.org>; Fri, 30 Jan 2026 14:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769782383; cv=none; b=atTwF7PMlzInKbKvevXSGOgFLkih74dWLH+cC/+JinDxhwNK5o5h5RG87iWEVfaUpiP5XDcKLeW4ZLnkB0AwDxycPBkNS0KHpPSTWTu4nMdh0kZHKyUGykUPmAnsW9l/bg6WUpz7aAQAW4dUmCZDxi7c7pthyk/jYkSbRQ4NIKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769782383; c=relaxed/simple;
	bh=VIUoB2Gd3PRx19p5F0kfipi8dH0z7Fc3L1Uq4ecpRS8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LqPyTjMJNFrJEGpwhFh2x9Ct+EHCnXzCE0n/KtkSZstrggJ6u11RV5xRLG9hzEa9+jqgbwl3AeMX6hH+DPz1GIsYIoZuJpoy+XPzYQpV1jOnpqUag1aoaDiF8BDTLO0icJN1vZZmiN9gxyKvNQljRHB0J3Iur585Poovr9oRNsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NXvgeaI+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NXvgeaI+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB89BC4CEF7;
	Fri, 30 Jan 2026 14:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769782383;
	bh=VIUoB2Gd3PRx19p5F0kfipi8dH0z7Fc3L1Uq4ecpRS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NXvgeaI+fZ1ufC+DXwp0PufjOyLWvd37sls8TD7zpgEr3hP3bjRKo1Dpv0U+mzE33
	 UpQol8wYZsX0ixJophytVZTkUtP2XHxvxhQAAQO+H/bRMo2HrGbvXaquP9u0Iilpos
	 r4wt1n/g5nAkn8zRa+U1a2AlCTANmelzaZ4XwSSO4ot2okvtkCpxgDy1wNs9I6O/4S
	 TW/Kclh2wwrVrPSxgrlmIYzA/YD2yYzbx2INPpoVNwaUCtjNBvI+FJc3fli7cSaWLo
	 lBTcnGsCBPoOV5p8tR4EHlBX9m3MJHo0LSV3C6zGuSqamhi25NKGQic8lS+Q/+JIbA
	 2y25N08zGcBfQ==
Date: Fri, 30 Jan 2026 14:12:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: control: Verify put() result when in debug mode
Message-ID: <60f477d0-ea1f-435a-bd8c-4e7e06a1802b@sirena.org.uk>
References: <20260130135541.115574-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gE0UoTnhCwHOqiaq"
Content-Disposition: inline
In-Reply-To: <20260130135541.115574-1-cezary.rojewski@intel.com>
X-Cookie: War is an equal opportunity destroyer.


--gE0UoTnhCwHOqiaq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 02:55:41PM +0100, Cezary Rojewski wrote:
> The put() operation is expected to return:
> 1) 0 on success if no changes were made
> 2) 1 on success if changes were made
> 3) error code otherwise
>=20
> Currently 2) is usually ignored when writing control-operations. While
> forcing compliance is not an option right now, make it easier for
> developers to adhere to the expectations and notice problems by logging
> them when CONFIG_SND_CTL_DEBUG is enabled.

Makes sense to me, although I fear it's about as likely that people
enable this config as that they run mixer-test it's reasonable to be
helpful.

> +	struct snd_ctl_elem_value original;

> +	ret =3D kctl->get(kctl, &original);
> +	if (ret)
> +		return ret;

> +	retcmp =3D memcmp(&original.value.bytes.data[0], &control->value.bytes.=
data[0],
> +			sizeof(original.value.bytes.data[0]));
> +	if (retcmp)
> +		retcmp =3D 1;

original was just allocated from the stack so who knows what values it
had originally, and the get() is only going to write the part of the
value that has data since the normal get() path has a memset() in the
core.  Similarly with the new value coming in from userspace there's no
requirement for userspace to set anything that isn't part of the value
being written to any particular value.  This means we're liable to get
spurious mismatches.

--gE0UoTnhCwHOqiaq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml8vGoACgkQJNaLcl1U
h9Acugf/aX+Te3D169ELrjOMvq3Q2hESNlxzyGSb8XKu3TvtvlSgybSyCm7ZT2NG
w/Xz9Imrdhgaz8shge0U83HJkNwtqr5AU2vbn0JEfTGpddlKxe2SZH8VcUXo7EE4
syp3kYbWztL+1ecAe5FlKv44eP73hNxpetMsJB1hSSfq/IWIib402ZWUlKnY2ROd
jWQfNWPOgQYnjWay5n0SiqrlviL54Bnokex/MXoMkLjjnw7l1OhmnkOByvdqSMby
p6jh7xub1DeqOz/RTcbQTiDT9uJjqYFmLg0YHgMKjb50riR09UeewQMTBuZtUClY
i/q1GygcZSYqV4KJUhuvSJw8Deb0SA==
=LbKq
-----END PGP SIGNATURE-----

--gE0UoTnhCwHOqiaq--
