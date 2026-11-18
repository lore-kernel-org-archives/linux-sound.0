Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795007890;
	b=znTWID83v/yBZegFhccOOmopq551u09yWQlGfOzqpOHshQjJ+rQkNZ2agWThSuUEnaYH
	 KjbLP1hft1zuugdXuwpPB/pPGZukJcI47zsm+wG7Mma3+L7FZk34U7PWSTtSqvtHol2Ro
	 Zvt5GdLkDpHjk+CqCv1kFepHZzTYPq0a3fCUZQNyNGYK2GrOk9+i5LSrFR5RaYpErFzoY
	 OdEhnlpfo2P+WA3kK9FEipaPpJpum9gF5yAgFZBv5RoT26latdwmfwAU3rqYSZo7e6c2Q
	 DixLN7V0WoIpYeWKG3kHHg6shEOj5P8iSqAiQeUeStE2/d/rjjUb0Iw+TEraTdrEMWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795007890;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=QTmEhMJbZWBnamFs/kJFQM2GShTvJcyQS/wUsxvrV+Q=;
	b=kZwIj3IXWJzYQUHtYsfcePpsivHr8bq7CkpTMt9n1BFIOt7QqAr8iwVedlm4lEuT6jRL
	 kEw2Px2PV9wx3uk9UCzJdzrK9E9IlrCk9U1h0w/T7oCbABIZ2kBzlpa6Z3O2ZZkxfIzYW
	 C5KRy560sveUK7pZQvDFCgW9sTe8B/oIUeLgjxzPFtPitqt9s92PaP/2/+nXQCjK2vnk3
	 aixnEwGxe3o8fX7Y3FqMq9O9qEER9DV0o8uc5cFkIc6LE3Ycq9MxhhSZKpGHJxOjdChOG
	 i10NKI6nOoR1sRbOgweHQlVIVanH8ea8+0HzmczXZ4keDZ9JguZOVW5/aVg3m2LrLxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XT4sNw0P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31597606A320;
	Wed, 18 Nov 2026 13:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XT4sNw0P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A3F1F000C5;
	Wed, 18 Nov 2026 13:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795007889;
	bh=QTmEhMJbZWBnamFs/kJFQM2GShTvJcyQS/wUsxvrV+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XT4sNw0PTauSWnmjPLnGA4NWOdaDw7b9tuyLjKthbe3l3OJoP/HncLVdERDj7MnVv
	 NV0nhQKr5xxdO+kUR21hCTTAP1QB9F989tJgbE6+jxvwpOe8/7Xo9M4U8MeV8l34Yv
	 +q800ERAebA7Th5MPMaRloQVSS5hMbf1/3trKtyDC8E2hHZP779JCOORI9KDHo3qML
	 Zed9oV5N/rq+PO6egb4oVii3n1oUQkBVkQUOEoFGECmq2+GsNNVmeLMIu/h5b6lW2r
	 mBjt5fCvvFBeIxA0u+OeTqI7iJlUTMKQDybU9mVmVjT61+pKIRB39FIXHSZO/EiWK6
	 qB1UaQnSgN2Lg==
Date: Wed, 18 Nov 2026 13:18:04 +0000
From: Mark Brown <broonie@kernel.org>
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	shengchao.guo@oss.qualcomm.com,
	mohammad.rafi.shaik@oss.qualcomm.com,
	bartosz.golaszewski@oss.qualcomm.com,
	Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 resend] ASoC: qcom: audioreach: support multichannel
 PCM formats
Message-ID: <6aeedf05-a8ae-46ac-bf1c-58ecab7ec6aa@sirena.org.uk>
References: <20261118023201.2031211-1-zhangfei.gao@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LzLR4vvfYSsfj/ew"
Content-Disposition: inline
In-Reply-To: <20261118023201.2031211-1-zhangfei.gao@oss.qualcomm.com>
X-Cookie: When in doubt, follow your heart.


--LzLR4vvfYSsfj/ew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 10:32:01AM +0800, Zhangfei Gao wrote:
> AudioReach currently rejects PCM streams with more than four channels in
> the PCM and shared-memory media format paths.
>=20
> This prevents TDM links that expose more channels, such as the 6-channel
> playback path used on SA8797P Ride, from being configured.
>=20
> Reuse q6dsp_map_channels() to support multichannel PCM formats and use
> the common PCM channel limit definition.
>=20
> Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> ---
>=20
> v4: Rebased onto sound.git/for-next at fcfcd6db32adbd=20

v4 was this rebased onto some other commit.  If you have changed what
you are sending, including a rebase, you need to change the version
number otherwise both people and tools are going to have a hard time.

--LzLR4vvfYSsfj/ew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr9pYwACgkQJNaLcl1U
h9D/zwf+NAK8LzUXRiQqQXahyojdrYEMbK619q1IBHOmaq4C9GX/PGSs9Nqmi7oQ
2LQK3LFna8Dtc5/JJEoFHFgUzsEW1wtvCTr/CaF9QPxM0o3/h7jg1mbPIB6e2iWf
kcH0h/8csavFfurEXoncHxZFr2lH19YX7JO/qWFzHzijPl6OAtV2CpK7iMdQLtn7
qju0yzRa4YAfZmeBULnpSRgETKA5pzNUVmCEHmQRfq1AuvIQ9qAjkukKyVnudDiY
UFWz9X4HejYIfOy5Z9to8y1cboZ+h7ufmNGN3kMc1gedTEwbusm2fDMbptyeI3DL
EIe4ZA3214GKknc81Ho9r8ZSca/cRA==
=xyp9
-----END PGP SIGNATURE-----

--LzLR4vvfYSsfj/ew--
