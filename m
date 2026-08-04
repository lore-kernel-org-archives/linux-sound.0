Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1FF45FFD1
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 17:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785865034; cv=none; b=oG5A5NU4P8mP37VoxO6WpI7i7vEc0M5i+V39onq4JWbmUjTN1LslGXRKdZFbB/EtzjCmZkitGeRGmYgBIJQEISTtCN3irTyZcA0GlNNnpRigdmNLHKNO7UHlBDaF9ckSGkdMr7tFYq0T08O3D1hik0D5Ny56KwvJk0MXKrO7Iy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785865034; c=relaxed/simple;
	bh=PqPTthO7IwzwDK8gKW5uKqVbRXFpaMF1x8p42/29x7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rRVyXCqkL3YtaPy/5aWb2+dp6ZlMwQUnfIAJxaJLdqj6GWmmPqxsUVQED9W6dh9T/M6bJDmja2kqjvcShGDStRmU68NlFjXpGkFoDiD0cGqYnwpKaGBEyazeH79No0nwSVb7Vkr265Moo0DNnv8L6g/J4+2JlF1/SROTXci6yK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofh1Q4qD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofh1Q4qD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B591F1F000E9;
	Tue,  4 Aug 2026 17:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785865033;
	bh=VUPa0fr8mu1CREWm/AaKCqdFb2LGwl5zp1Yo1iEKPNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ofh1Q4qD4aVdq6jjPgq7q7JD6z1bPc7Q0qeuJvZQspWRWkQPSqhod/J+4DECFMCmx
	 QnT2bfUxwiZCMut4ZaVCGUXj32n8o3LO26GNNhV+G0vEiPZ1ZT7/sxGomLf+P6DpRl
	 hq/wW46lbeCDbtKuG90Jt42eyCPTf5WzfXgOcboCnGWMJErQ6uNHXZG5/BEmEY0ta/
	 q8A0+rqqzLJvQHD0upzW2+DEbS+wDbkMamwOk0cA96ASw2NuBOjCs1zAq1yKmFJltl
	 unGsZRyGu4/MHw8njP+ZOMAHSHXisk0Lde6TCiUn49ktXNLHa4zlZnBrKNaTDfnI8b
	 oAg6YE1gDptVg==
Date: Tue, 4 Aug 2026 18:37:09 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Rosin <peda@lysator.liu.se>, Takashi Iwai <tiwai@suse.com>,
	=?iso-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 23/44] ASoC: codecs: max*: use .auto_selectable_formats
Message-ID: <8ea031ca-92af-4b51-9993-c0f34c85bddc@sirena.org.uk>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
 <87fr0uwwb2.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IBUoa1jW9WdR82cH"
Content-Disposition: inline
In-Reply-To: <87fr0uwwb2.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Biz is better.


--IBUoa1jW9WdR82cH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 04, 2026 at 12:42:26AM +0000, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.

> +static const u64 max9860_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;

This has the same issue the Apple controller had where not all clock
inversion setups are supported with all formats, I2S style and DSP style
are different with DSP only supporting normal frame.

--IBUoa1jW9WdR82cH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpyI0QACgkQJNaLcl1U
h9AUdAf+J8XhDUdvMNCXPD8VsHKQgVLlDxOBANPydGCL6YqxOP9i3dvrUfwVfenj
KWiczFcCTso0H+pab0sF3UAmvueLJVRtlLnIdfOx2guzSGaJXJqrLb4KoBPN0CmP
59YgGr7NmXlYJvvXve3Yy1l1EbUHkA0iCjO6AU8uK7N2og1lbCqUgV9gHOELc6LZ
RbacSCX/OjlBcvNuiJd7N4YpZdDxtmIzgBp50iMttvOkYa0Yh2lgsOYnScjSf1qU
t/AXZpomcX8QAgPQlebToJ9lMMR14cHBoQUZNAuE6i+O5eWjke6/rRNA0ZNbFxf4
ztbIqnRZESogv32Jn2FXe+EjjqYPYw==
=BWEw
-----END PGP SIGNATURE-----

--IBUoa1jW9WdR82cH--
