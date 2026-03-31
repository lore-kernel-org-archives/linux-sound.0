Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12A1377542;
	Tue, 31 Mar 2026 19:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774984664; cv=none; b=sH5jjN3MmYt0wopfWcxKpz1GPn/gCUGVn4LlQ3sG/nhcRtUrWQZfGqTKq7Zg8MsdkPGaT3Z5O7oX+gr2oiJpuPdVC6OSXgwVzvIhfuRrobgWSiGkCyGZlRQkiihPKD+iy5LgkhWCn/WO9fX8bnwHD9DALqTsbpCW/ulBXfWZwi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774984664; c=relaxed/simple;
	bh=/vTZy7DNheaWvuUlBmUGnqxzXfCO6SeXhGn+6yRist0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V1ZQB6x/TrnQcdUaGLgKrU0lNEmjUVcFrb8whkJALTYRKXh25C4FjRhhazsiaH/cwcrBVBprBAxiy7W3JoTpcMw3uLN9K9psSeEfBIGHj8LiBIP8qHA7YHX7bZKifASAc1DG+rwPZs3+y1+M0Hxw95xd5+vm3PBeNdj0Z6sVNIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EtmCM0uo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EtmCM0uo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4664CC19423;
	Tue, 31 Mar 2026 19:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774984664;
	bh=/vTZy7DNheaWvuUlBmUGnqxzXfCO6SeXhGn+6yRist0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EtmCM0uoGw4csxFZJZ1yAqVNUwrjA5ZegQuGFj+/TT3WUga/CYRYUwgx18gbXjh/b
	 hAfUJLccOk0X4i/8BbDWW4i8mn9P4qOWjXdPyqFJgCr8Tvtv3fEI3DFNRJRuu+/KZE
	 7qcHNqUydXcRl+TIoXMnxrc1QIXmq55WNdNB3d2almoRTwOv4JUekpgA5hPPxCM8G3
	 EzoSGcasUmnwpRWLvT/E+s/uUuztabRKLzPpoNtjIWaD2SoqTf7AJPCNMte/2WhVjJ
	 P4P3scCqzE0FI4N19zY6lerrjhQliWP8FVWcKP6a0HjIIDgpDpgPbyihpfQX0ohxpM
	 aifIHpYSpBOWw==
Date: Tue, 31 Mar 2026 20:17:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	srini@kernel.org, val@packett.cool, mailingradian@gmail.com
Subject: Re: [PATCH v8 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
Message-ID: <f2bb116e-bee4-4cd1-9f57-154ea1e9f0e5@sirena.org.uk>
References: <20260330082105.278055-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260330082105.278055-14-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pFTWHHyQCqzqbyxs"
Content-Disposition: inline
In-Reply-To: <20260330082105.278055-14-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: I just had a NOSE JOB!!


--pFTWHHyQCqzqbyxs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2026 at 08:21:05AM +0000, Srinivas Kandagatla wrote:

> @@ -416,9 +415,10 @@ static int q6apm_dai_close(struct snd_soc_component =
*component,
>  	struct snd_pcm_runtime *runtime =3D substream->runtime;
>  	struct q6apm_dai_rtd *prtd =3D runtime->private_data;
> =20
> -	if (prtd->state) { /* only stop graph that is started */
> +	if (prtd->state) {
> +		/* only stop graph that is started */
>  		q6apm_graph_stop(prtd->graph);
> -		q6apm_unmap_memory_regions(prtd->graph, substream->stream);
> +		q6apm_free_fragments(prtd->graph, substream->stream);
>  	}
> =20
>  	q6apm_graph_close(prtd->graph);

Given that we allocate the fragments before setting state it looks like
there's a window where we might leak them.  Please send an incremental
patch for this if you're going to fix it, I've queued things for CI and
will merge tomorrow unless something blows up.

--pFTWHHyQCqzqbyxs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnMHdAACgkQJNaLcl1U
h9Ak8gf9HLuKkpq9Mkj48w49xYC0VDMje5Ww4RkphFcNwa+Y68pyGuch/wnk4uGy
KfjAoflKnNsDyMPEqqOIxxh1vV8G4MAJpthYF7bfHjuad6AKl1tE7Lexnp0qw55c
cd/1XeWOXpEq9nxA3Na5UJ06vHtbYdFdWfN7uUh13+4O1202/+L0aKSB9O9u/aV+
7pYU/dla1ENEEf+w64agH3vsKPTmkqxy8UEkzvALDCxyTYOMVgKDNBuvUJpTixRR
UpoB5mgwIfgqC9V9PXclCBFBdnGAJi5QbsFi+V1U+BQhD5MDru2i2UQrzjS53BiA
BAaoYQq/6vcQnaRc5cEEoZW+jMwjHg==
=6Oyu
-----END PGP SIGNATURE-----

--pFTWHHyQCqzqbyxs--
