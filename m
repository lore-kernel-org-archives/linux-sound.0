Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB363CCFCC;
	Fri, 31 Jul 2026 23:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785539733; cv=none; b=mRb4k3u+quRsKWhF+qWCHFqmi43kYgCcn9ydOp3g24PKCSauKPWOn475/zCbYFtxYWwamuT9OhIiuAfWND8ckji0J3qaB39rVBsA/RlIniVqDU8AtGoH0WUm3rPCnz26KIf7BfZQebAabMxfSC2ZApxMzKnDVyPFI1rv+jFx0Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785539733; c=relaxed/simple;
	bh=TSMZEaEBC5bAbFnGz3ZldPgNXjB4NwPWqqi+5A4czZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4ZBLtLZgbQm0VcufrRdahY2qOF4jyH1D1NZ8vw7k/n0QElNMETTkMX7DeC4GxUkME/RY4S3RYkC5eKvNfwipQsjlv4ALStnYbaes1wdZ2HCowY9pnyf8r8g52InStiON8nyqXC3H1QWVdsOI4gbx5dLW3DG429b9D+KW+BfICI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cIdxCJOW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cIdxCJOW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBA441F00AC4;
	Fri, 31 Jul 2026 23:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785539732;
	bh=TSMZEaEBC5bAbFnGz3ZldPgNXjB4NwPWqqi+5A4czZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cIdxCJOWW/3nnVP5HfncHyLhAfDLn1s7aAhAkW1sDONrcsTsiOJYglaTHdKnD3pD/
	 TtEUMgxVRn6PVHCWufFzjOD2gVovir5O/i//NK+aHS8BjqoCKcnVvlwYjECvZ9cqjx
	 eONUh/jJgjFYQ4znI/5i8KoYfbfMbAkX6/H6bFwqPwKMaMblQN5zzTG0Yj41x1NWVL
	 7SlFSKnsbLWEu4U44z77vLZN41R8flmDwOesFPqYQDEjlE6CeFmasF6qtMfHOk3QDM
	 nSiba6sVNPwxUWcY/2sYb9nFYoVxQEoHpmIxJSi6fg3Ap8qThC3tG7Si3+9DYoIJ+n
	 qTWTB0rCUWf7A==
Date: Sat, 1 Aug 2026 00:15:28 +0100
From: Mark Brown <broonie@kernel.org>
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] ASoC: qcom: q6apm-dai: add carveout SCM assignment
 for mDSP buffers
Message-ID: <f83d3fd5-6f15-49f2-952b-17697d56749a@sirena.org.uk>
References: <20260618112810.2009847-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lBx69BHZi+IpUCDM"
Content-Disposition: inline
In-Reply-To: <20260618112810.2009847-1-ajay.nandam@oss.qualcomm.com>
X-Cookie: No shirt, no shoes, no service.


--lBx69BHZi+IpUCDM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 18, 2026 at 04:58:10PM +0530, Ajay Kumar Nandam wrote:
> On targets like Shikra where audio processing runs on the mDSP
> (modem DSP) instead of the ADSP, the DSP operates with stage-2
> secured memory. Unlike ADSP platforms where SMMU-mapped system RAM
> is directly accessible, mDSP cannot access buffers unless they are
> explicitly SCM-assigned to the appropriate VMIDs. This requires
> allocating PCM DMA buffers from reserved carveout regions and
> performing SCM assignment to grant both HLOS and the mDSP shared
> RW access.

> Depends-on: https://lore.kernel.org/all/20260609064038.492641-1-ajay.nandam@oss.qualcomm.com/

Please resend when the dependencies have been applied, I'm spending far
too much time repeatedly checking if any of these things can be applied.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--lBx69BHZi+IpUCDM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmptLI8ACgkQJNaLcl1U
h9DbWQf+PfnOx+NXnBboLetKS1FHu6DzJpcWlXdmhhopcpg6ij6/T9W5YhskISs3
xeQC4qVSRSZKvjUai85dx1AKYjR8SuVog4gMKk6yZqnH4dJhUOpQ1Hb+JWS46MFD
cISrWVjaqn73ipfEloUMIv50Km6dDu0GVYzK0DuYtZoX08YYW8Nbx3buhEcc/ymn
npFvRpMNzCm56yDyUj3lAWHVoynfP8SAUVSOoZzeFDNx+iyAXd++xzVErWWoFWXu
/n2yca9WjFleSIYyTzq5+QcxbL1ZcNRGCy8uQpXng3tB0GiMNR2SXdpEtgISFd4S
hrPwjjqdXikHrNmSir+x3BaLt1Dj1A==
=r/72
-----END PGP SIGNATURE-----

--lBx69BHZi+IpUCDM--
