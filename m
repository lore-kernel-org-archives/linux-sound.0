Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677EF3A0B20;
	Tue, 24 Mar 2026 18:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774376742; cv=none; b=NGpXV6HwqC0r7II7uLZlu3575TkHGiDebE776pjY6JytOAkMBslqK9ZEUW+tZH34n3JC2LcCioCKh6VSY5D6ZCX/wvJ4Nyq9pKzH14zvm8ny8zUIXFjmH0cdsbSqRKQ2HLGkQ/vFSoBXh2Okbd2JoD/vkROOexG2yCqun5e6ip4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774376742; c=relaxed/simple;
	bh=2EqXEYRv3JrQt20k0oE7Vkvk1xPApU+5GmVMlQH8KMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q/4ZD41NT5BSex3asFb0QUiTkthxMZKLrLbRiDR2AoZwn8RuaBNrRCWEaCA6arD3Uoi2jkBfXKG9L8LZJw5vlN70fjEEuN9BOhVtrEQ/e5g41KO9SfyaZjtsk9/y2hnmZx5r3dh6FXyQIiHxKOAEqYypLKcSpTqjowuROHxCVRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qh0GRLkc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qh0GRLkc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0ABAC19424;
	Tue, 24 Mar 2026 18:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774376742;
	bh=2EqXEYRv3JrQt20k0oE7Vkvk1xPApU+5GmVMlQH8KMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qh0GRLkc9rHuCXbpL5uXX/35u12V+DfV3hlGRbywBl3lOd/TW8GrMFW7pwpanOfcy
	 xg50VWkauxU5SXLU1wYN5aLU/sqJ5Yjbgpr7f1ms175S+RbX1/n3LBfYsoBpRuV2j4
	 JVJw5ZDyFNwco8MhXL64KJPwVrrXdDCL/qfTZrkVjAeEsy9MYJl98c4yXA/jPExzzv
	 JFAywfRD0dpf0wtaLZKeUaX9J5CN4KonjNztE1iWOUhPxqaQ2vbNQTpsyoVYr1QVsy
	 rbyuwVhj7cv+DAWNUQwGY+FPPdjIdZVFU395m05SZ/O2UbuhpQUWggdMuQ3wW5vMPx
	 IP+p0xw4D3AZQ==
Date: Tue, 24 Mar 2026 18:25:35 +0000
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	johan@kernel.org, dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	srini@kernel.org, val@packett.cool, mailingradian@gmail.com,
	Stable@vger.kernel.org
Subject: Re: [PATCH v7 04/13] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph
 opens
Message-ID: <61596b66-4fef-4bdc-93f2-a8639da79d32@sirena.org.uk>
References: <20260323223845.2126142-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260323223845.2126142-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NkWWMnqpGUZIItID"
Content-Disposition: inline
In-Reply-To: <20260323223845.2126142-5-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Forest fires cause Smokey Bears.


--NkWWMnqpGUZIItID
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 23, 2026 at 10:38:36PM +0000, Srinivas Kandagatla wrote:
> As prepare can be called mulitple times, this can result in multiple
> graph opens for playback path.

>  	 */
> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {

This is an array of APM_PORT_MAX elements but we have DAI IDs in the DT
bindings over that and now we're using the DAI ID to index into the
array (I didn't check for existing instances...).  This might be
impossible due to system design though.

--NkWWMnqpGUZIItID
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnC1x4ACgkQJNaLcl1U
h9DYtQf/ZUJdPb1Fy8ubmiDoH29GzkbRv/yMMqXdcnuhTdMMCE6Os8laILqGbhYz
D9Fbas99uV9sArONUIq2ktrsJ3NPasHC2bH6peRNvtLxox5/D8elZLCMMhlWzlmF
7chBE9lw8XlQl0lkzR2zIE7g4yx0dwTbscd0s6bXyuJ1+OZjHhAi4IBxqc7WQi4y
P1pkxC0A3oH0unkhqr2R4kf6geEWS9ewxfbsilII7+vJzVePDrEL/0hTS9YmpMaD
CLyIbsbXytt/pF4HITnQlScHwfNcXYStO3MJxmIHCDTsGDHemsLFa4SFykQ6PwT9
EQh05p6FKPPJ/qY4BC8QwNbjDsai5Q==
=qn5J
-----END PGP SIGNATURE-----

--NkWWMnqpGUZIItID--
