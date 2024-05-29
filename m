Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB6F1B813
	for <linux-sound@vger.kernel.org>; Wed, 29 May 2024 13:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716989790; cv=none; b=ZURoD2l+PZUp/LHG8txZa8yLhXQTUiJwzoHijI4HXAXdm0JtzjQkw+xDIN8BnzE8L5K/NU/exiSpRzUcbVlOUVvk3ZdmKKzI9rZekrC3tL9xzZ4uhjiVhopTZdn1W4tJ9Oha+c/EBGgQjahU+Xc9uMIkQb5gY68OPbCIPUOMrko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716989790; c=relaxed/simple;
	bh=mQlV6dZo4XKqDorOY30KkPjwdVowLr5TN/dyNgiAd5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lcl0AOzpspotfepsBzugXf+nqM0MrHookbsQyNkfLLMuf3fIxU/zWm2b1xWXP2G2syv571Jas/AoRZxnEaw9/7yHcfSuh7Y9nujsrU9hf6rpd7oi/QWaJd+I5gejDnHmK66rWaAUSkYSt1IiWBYXUWERhAbQEZ2JvR1U8ZsZXSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N0tV0zgO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N0tV0zgO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E861EC2BD10;
	Wed, 29 May 2024 13:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716989789;
	bh=mQlV6dZo4XKqDorOY30KkPjwdVowLr5TN/dyNgiAd5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0tV0zgOYhXMBOoZRBjm26Bg9d/m9eNc4UhIkVp+TcF4EUlQVIx5ceRwiM6iIKS79
	 MDcpMpQv85SCgWoQ9xLNmBex5VPdI/ZCh3hOcs6r3fOnogpmTYgEDzhGd7VQ1TgAU9
	 r6cDpiCT9P6KY/6s7YD4WyyjhFGJ4l7i8DqxHWQHtscoO2wXadEJeBLPqo6ZScChnR
	 nQv3N8nk8oY9kbcfZHQA5klSQilYdY4eZsCLVKOZgDG/lnwr2oaORC44q/TCteGXqq
	 STNXEipq6M0b9g9aWw1VhxMM7vGeKKwosp3J/CIzNbB1HONO1c5FLDCwfuophUajoW
	 d3dTm5sz3GC8g==
Date: Wed, 29 May 2024 14:36:25 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
	ranjani.sridharan@linux.intel.com, seppo.ingalsuo@linux.intel.com
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Add support for NHLT with
 16-bit only DMIC blob
Message-ID: <cec50849-66ac-4557-856c-a6a423c118f6@sirena.org.uk>
References: <20240516075611.18018-1-peter.ujfalusi@linux.intel.com>
 <d4c5e7a3-710b-4ff1-95a3-395dd780fed3@linux.intel.com>
 <3a7fa9d4-dd14-4b29-b977-3ba9c5b4ade7@sirena.org.uk>
 <53897d0f-1796-4823-9090-a51320c655a4@linux.intel.com>
 <cc7fc8b7-d470-4330-8cb5-6ba85065c74d@sirena.org.uk>
 <80498cd3-609b-4ec0-aedc-3ef6d4bde408@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CMnpwdHvM7HIJOHp"
Content-Disposition: inline
In-Reply-To: <80498cd3-609b-4ec0-aedc-3ef6d4bde408@linux.intel.com>
X-Cookie: Everybody gets free BORSCHT!


--CMnpwdHvM7HIJOHp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 03:32:24PM +0300, P=E9ter Ujfalusi wrote:
> On 29/05/2024 15:17, Mark Brown wrote:

> > If something is a bug fix it shouldn't have a subject saying "Add
> > support", that is very obvioulsy a new feature.  Have these systems ever
> > worked?

> Well, it is adding support for something which has never been consider
> as a valid configuration (16bit only DMIC blob in NHLT table of a laptop
> [1]).
> I have added to fixes tag to carry this patch along with the patch that
> implemented support for preferring 32bit configuration in firmware (the
> [1] would never worked, so that is unrelated).

Fixes tags are so widely abused that I don't generally pay a huge amount
of attention to them, the pattern of new features claiming to fix the
commit where something was introduced is very common.

In any case, if you're going to send a series for 6.10 I guess I'll
leave it for now.

--CMnpwdHvM7HIJOHp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZXL1gACgkQJNaLcl1U
h9BdzQf+KYhd7T1tv/qycJaodriKy1ksB8wgWL1oMKD/HAQfCwk4z67gqUa+pf4A
83xyEOfReZdVJ3qKADXjEIHO2tZx1o7SChvkaU5ad67cmCo5t2FnHhGS3WH0e2LP
OkqiFaGnbCmBSOEDybRcShGviHrhRb9Fx6Vee7rCEg7OiDRV/bl2yFGwox9NyHZ2
p61NdHwD+/SkolKLf9MH8n2aWZsGER74qdCV9iexo+Szg0D5T1NO/wyICL7IX7ft
8kvnNSOuKEN4M5OZNiJx7dw95oHoqzk17YHA6wgQQ5YOJRht9Wzng+AAbVjaGC3Y
E1buJDTIWS2uzbWI9MLqdAEHMOJuiQ==
=iNqj
-----END PGP SIGNATURE-----

--CMnpwdHvM7HIJOHp--
