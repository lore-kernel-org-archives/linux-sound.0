Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9480236C9C2;
	Fri, 29 May 2026 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780055853; cv=none; b=qozz895ePyUacfoR+G14GQfk+pxPa0t1o30q3VlvCbE7/0RIqYNtiyrLYp8q5JPJ9J/bRX6nPpWcJrqhxosQkvE0R7QBkn5gqVhoqWGCkM16DcOioPk49RKXp7GF8lg1hLk2hgOxx234Vg2HqpxvAe4ZsAXU5cvJw+R2Zz5ZXdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780055853; c=relaxed/simple;
	bh=XFsgrsCjGSjstVa6RvszBDjXsctRxLUF7p0mxc2muI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bj79OpUUcB2LiDHSkmUzEFM+euWYv8zTHaRW88IebtNrztaZ6RnQ18BAjtP5icn8E0JIjGKZMMLI4ZYWvHNUh4pRxRqc7izDdfnWfeSP9F7UCtnAj2Vz2S3TatVuuV/PPe68vB/FmaxODn38nW91oApdWmYisf7f3wHm8J1bbng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k/v7zWyu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k/v7zWyu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D32861F00893;
	Fri, 29 May 2026 11:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780055852;
	bh=sItfJ0cb+MWD2HBd0NIc4WI19pJetbDoSxn5IZKyj6c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k/v7zWyuc9EOSppNop7KG6a3jeHgDERG7u5x2jcoHtdnxhcqG7+MTQBSdeyRk6Cfr
	 8LmpDNxBYawAf/kaF65MMeu90vUFcr9gKTkU+sYNY3uYa4aMEHg5haOX+aMs3oXbfy
	 g8jQrG558iBOsfLwHTAmqg1O8z7hsVxoa/fq76k6NOFJG2TUeyBRKklbwrXz5q8ub6
	 szDp0DU/DPTmOk3a2wfum0qBUl9iYr1+ieyzyfvyiphgemJkNf4GwheVu7jfw3r7wW
	 yfhNoxIlZREH9Cr3yHDVTWnBY2Re6UsOALkohuzQsV6mX8XGTcDrPiL7NUUpysYMQA
	 wV2VC8DFSifhQ==
Date: Fri, 29 May 2026 12:57:27 +0100
From: Mark Brown <broonie@kernel.org>
To: YLCHANG2 <neo.chang70@gmail.com>
Cc: Neo Chang <YLCHANG2@nuvoton.com>, lgirdwood@gmail.com, perex@perex.cz,
	robh@kernel.org, krzk+dt@kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
	kchsu0@nuvoton.com, sjlin0@nuvoton.com
Subject: Re: [PATCH v3 2/2] ASoC: codecs: nau8360: Add support for NAU83G60
 amplifier
Message-ID: <cad71e89-ce31-4ed9-837c-9395e020f34d@sirena.org.uk>
References: <20260526015826.440769-1-YLCHANG2@nuvoton.com>
 <20260526015826.440769-3-YLCHANG2@nuvoton.com>
 <d4cf4ad9-82fb-4beb-be5b-b3687f822fcf@sirena.org.uk>
 <1d7a01aa-dd65-129a-c9ac-e24e9b474f8e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tdZd9ctACY54NNcc"
Content-Disposition: inline
In-Reply-To: <1d7a01aa-dd65-129a-c9ac-e24e9b474f8e@gmail.com>
X-Cookie: Equal bytes for women.


--tdZd9ctACY54NNcc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, May 29, 2026 at 04:49:11PM +0800, YLCHANG2 wrote:
> On 5/27/26 21:43, Mark Brown wrote:
> > On Tue, May 26, 2026 at 09:58:26AM +0800, Neo Chang wrote:

> >     https://sashiko.dev/#/patchset/20260526015826.440769-1-YLCHANG2%40nuvoton.com
> Regarding the sashiko report, I have a few questions:
> Are we required to address every issue caught by sashiko? We found that some
> of them are actually false positives.
> If we need to explain our code regarding sashiko's findings, who should we
> send the reply to?

Just address anything that looks legitimate and ignore the rest.  Part
of the reason I only linked to the review is that I didn't have time to
verify what was accurate in there.

> Additionally, is there a way to run the sashiko checks locally before
> submitting our patches?

You can install it locally, the code for the service itself is
available, but these things being what they are you can't rely on the
output being exactly the same.

--tdZd9ctACY54NNcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoZfyYACgkQJNaLcl1U
h9Dw/wf/SkgXf8IGxg4KAoclYOkN8Wtjlo+8RpQ79pg0XPSoj92+E09CqQOaW28S
4JRXCkA7YKwsDEpldMqAiCajCafVnlprnH6FrRyhOBUGyeWEyVD5NdV166gl9rRp
YSKXy1AxWE025Eib+QfR5CL1GXTlPLSl44mNok1lpaBW4VHPT2jDY9i1Md6tlKUC
6NPYtuYXeyBSgafHPtH1c1OJX09JyWsraRqMN6cFc2YQqpTAU9FR1SeBDmK/7CxC
4IO7WSR5B/10EkDAIBLSPFqDsnwO2EFu2jOGlletvES9QWgo+vyJcrkkI+9wYfut
g/99OTYNG0sf0eLH9Lk5e8majrOoUA==
=jpYX
-----END PGP SIGNATURE-----

--tdZd9ctACY54NNcc--
