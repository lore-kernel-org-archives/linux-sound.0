Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2A02CAB
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 12:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740574179; cv=none; b=cuRleLT86jAZsuNZ8Q1Q4Vi8Eddna/0PDzPJKfjEodfqRYLgF0jxomN1OWKIg0VkbWzND1Tz8YC40sB0QIOreqr7n6+PILUefxGPb8N+QxNInmpqBNYBomScguvtUcv5LYxQAurWBI4d4BYGmVeByDnZqpnUb43SoSdkL7pWmPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740574179; c=relaxed/simple;
	bh=0Qdb/p27Xl/rAs5FZXv/LdNFOTLwrltYWKyIjNgz6B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYSHL4HivhZ7QS43JKQdCSxdyrufeSB8Pqcf0TJOnpuX3MMG0pTJLaRQVPbux8roeVPAAi9ZBnaHaOtDIpYc9YXuuiW3BQOfcYrbnnXCNbYezAo/dpC+dm3eo2gaR6bcclwWtk3DZuGohNb/xRDPZxpWQMPS1kjLoQ2SlR5h4Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NiunkJ+L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NiunkJ+L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF68C4CEE4;
	Wed, 26 Feb 2025 12:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740574178;
	bh=0Qdb/p27Xl/rAs5FZXv/LdNFOTLwrltYWKyIjNgz6B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NiunkJ+LjW+gTfBIRG0jVQ1CZvfy+DTVIqFuTjXF2bALOg/TIKKomhTC2yCOf7jrz
	 fWsz2zSLAsqojYvnMXFbBFr9vZtlEMmjevWQ0cZCcYNRXsq4cGeTqqoz6jfhwXK0B0
	 Sp8SDTQD5xyuD+iP0baEePLzV2Ay4nIrDt/muS0Spc1mqQAIs8gMSpWUZoJmy4D7sl
	 TVH+C+h7qW4foQoxpKiKeTG8nSqeuFB1h9qygRw7FvRDHklS1QstJ+1f0yb6KgPZ8c
	 RJxLVePaae55OfTLqYGBS00s5rQRSno+eOvuhHzcSdjNud8LXwlMoISLwG1laEqluf
	 WCfLvPGR6XsoA==
Date: Wed, 26 Feb 2025 12:49:34 +0000
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
	Thuan Nguyen <thuan.nguyen-hong@banvien.com.vn>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 0/3] ASoC: bug fix patches
Message-ID: <968e6830-2826-46dd-b7ca-107cd3af89b0@sirena.org.uk>
References: <87frk16wxt.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qmFoNHwOCuzKNXvW"
Content-Disposition: inline
In-Reply-To: <87frk16wxt.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: I've been there.


--qmFoNHwOCuzKNXvW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 26, 2025 at 06:29:19AM +0000, Kuninori Morimoto wrote:

> asoc/for-6.15 branch includes my patch (419d1918105e) which uses __free(),
> but because of it, it has of_node_put() count underrun issue.
> [1/3] will solve it.

That's actually in Linus' tree isn't it?

--qmFoNHwOCuzKNXvW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme/Dd0ACgkQJNaLcl1U
h9BEmgf/SdGt87fIAK0e4NO77rupZhutJhpOfsVIWAj8pr86tABiFkuEnYcXGE+c
aXQ14YUbtKSB84uZ+3PU9anowgc3bebYcaiUOloBpjPB2vKoNrxRa+Sqfik/uvSb
2cYw5NdB4hTRJ5mGuRN6n3ANJ+FuSCK7tZH7psePgKxcfHkXmiauLZQ62Tez7uyW
LLP3G3/5gggeJsO4nt04hqMCoszanXJoR3n1Y5bAndcSMiJ3E5C8EKV3tK94Gkyp
5pTJVS9fVAbiDIkCF5St5Vqj8TUAfacITUrzJlkz9YgxBMYeEOPDHi8uSrTjISMc
8U2/wXGYVGy1zIEjgZyAl9bidV0T6A==
=WGw2
-----END PGP SIGNATURE-----

--qmFoNHwOCuzKNXvW--
