Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794952100;
	b=MZXMRYhIPZXytyttv8nir1nfCFiMyaNTIshSbO19kNrxTgxklfIjCDiyJXxk1YRL64m7
	 0rPA2rkjYisCvPGPtG5hytTu76D/efAeMdKXyP5Php2XDmuwDz2GVbZMSF5AFnSIWfduf
	 l05Syv33r3k6dVeuKTrFbPEewd72x5szm93O31PyS2gVnQM9+haLAc0lFz3xENl09ptc+
	 8/2m6ff1A3Uq5whFY0A1hwE1wgxEwznm3nvfLinzPof1FCYsJqh/nx6tcma/Xct1dmuQK
	 a0fplrjfVw/Q1MU+z55QHCn3PaquaPHzXD68ziB2tqEfsF7LJUotRhRtl1qafWh4+pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794952100;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Cookie;
	bh=RdNYeIP38wfZFkJ5lt4wSq23Dan8R1tamIp+TWVc15Q=;
	b=By18t3e5tjZN6XwUnQB8gFRyGFDLpMn+VFOnwYT4syhMp77fgT95wzeFkwi1omiZkQEz
	 BT8Dg+AZqCsuhIpq/PfuHVd6RddYTQ+sDEl7q9lWrx9RsY23l3YWfXesQp3OWG13YugYp
	 batcjpj3t5nZnFfzzWIIeGz7xZL7uaqQ4WZtJ65wAYu9Hs5oYbdCRheQ+U5uT5Pw0cpMz
	 pxenaJ8FWORmbCCzQaleCmrT+NBy7gIJz6GOzXafH9EHEnED7vKgzxaqb3mmAVBtRBrQu
	 wgvy+sHqb68miWgvJ60ZnYPVTXsUTyTBEmxbr9z2tlkzXWLSYyW6tl6Cz552MHtiXew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kAz+UfyU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F251606A32A;
	Tue, 17 Nov 2026 21:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kAz+UfyU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61371F000C4;
	Tue, 17 Nov 2026 21:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794952099;
	bh=RdNYeIP38wfZFkJ5lt4wSq23Dan8R1tamIp+TWVc15Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kAz+UfyUu66Jeq65yTxaYKrBgZW9yqCfLaxv6XDyeCFDLQmh06nKEwJOMCzQO6OJV
	 xPXDwNvUR4Cytky+cQrdBCXjOnYG2a5LXVsHqZJrKBGpHiIhwBaHE8T/sHPKRrZ2lq
	 JKDr8leTFLltsz3+Du9d76kxetl4PFzoE270FydhT5Byqi5a/QS+NzN/svZHuC+Wsi
	 r37d9k2x+8hRrYLCWf3rKF5Mcv1hGTsh8i7Dveq56+7e0cZl8K6DPqAky9diDz4ub6
	 eufGOMKzZGpw6by6hbWZoWEXxFReO7WYAfc4g3Pj6NOPaAb/tVSUUyUZTzYlgnwjyE
	 TkDKWfgjcuBmQ==
Date: Tue, 17 Nov 2026 21:48:14 +0000
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
Subject: Re: [PATCH v4] ASoC: qcom: audioreach: support multichannel PCM
 formats
Message-ID: <6410d170-305e-4b24-a20f-3b5e2ee9654d@sirena.org.uk>
References: <20261117050328.213157-1-zhangfei.gao@oss.qualcomm.com>
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
	protocol="application/pgp-signature"; boundary="OKwR6USHj9xXlPAb"
Content-Disposition: inline
In-Reply-To: <20261117050328.213157-1-zhangfei.gao@oss.qualcomm.com>
X-Cookie: Marriage, n.:


--OKwR6USHj9xXlPAb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 01:03:28PM +0800, Zhangfei Gao wrote:
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
> v4: Rebased onto sound.git/for-next at 7cd6b1fd8f9c

This doesn't apply against current code, please check and resend (there
were more updates since then).

--OKwR6USHj9xXlPAb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmr8y50ACgkQJNaLcl1U
h9BggQgAgpAuCiFfnTqcJcroyK4zMqVebD4xdzQ0SX5R4oUwTJ+BrhHy8OvcRNwf
5ZZ0cgEZBouR13ccbKCAQ/ZQyrQ3H2wB1r72cTgT11siCVYUkQI5jBYDZTxm2heo
EvgE1zVWrEVfSzag6mn6Mle2h7m51raQcOEFM/hOZCErklnmYwE2oxTJTB5rqUnt
HwfKSwYP2DqpkyeaDqLZc26pC0oOeVNe8TRgc/f8HHtXadroHRria+2cDDBdcQ4E
0Vk1zXIH4VWRR2e4jIkqNzEycMCTCL5Ykt5XsRtbhqeIqeE5ktrq+uTqGLUnow9E
vKmkyqZDb4DLzjTwZO5ITWCQnjBOIA==
=wwtU
-----END PGP SIGNATURE-----

--OKwR6USHj9xXlPAb--
