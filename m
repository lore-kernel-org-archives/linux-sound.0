Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985C9427A16;
	Mon,  6 Jul 2026 18:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361928; cv=none; b=KEUQXqhwMLYayfJjSkcWjJ/Ju5nTerIzMYXTgMyVYN1DwGsSiGIZexvNH+OcVedWn1KGeKO2r7PFmpM5ZSmQ0wXeumgFoXwGDp88Ms9XzEUN8Kg1bBFR0vjTocJzm4Hpsgjv3+2jLp86FmNfOI+ylpkAmBgdmiRbQQzBg4BXlck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361928; c=relaxed/simple;
	bh=dF4T1DZtk23hJfYcghLKEMbEdbv99KvaJJl4MVYfB10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s6FhmF5P5THA7TsSi3u0J70zKKCP0vjBB4CkbC+nkN9A5xS205/zyLD8lle3T8kmkz2hBjXnr+XWdlfkqagXyETnPedT/MtoyN25u5V9zRk5z31hmZHsZ3GPztoNVXl3i8EGs4etdiSUkP6QF+NG1ZRbl4qOnFFcJZkQSm0V32A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pue0EOWn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pue0EOWn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB271F000E9;
	Mon,  6 Jul 2026 18:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783361927;
	bh=J8swCxXgWR9mRfXQrYqVPiKT0DZKe6CeVnD9NYX6wlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pue0EOWncc1lXfWcvDY2RfXTT0uL/PKCrONwf3eSIQbrkviHj4lc/Wtl9fhrxVG3/
	 YMgHGKnZU7u2vonfoP4Emg3+VQ2udOZzVW3E5USkKNjK7yYvSAEh7WSS7F5KzTOc0i
	 aKZRpLKT9OXz42CUFbf6iuRgSxKMq2a3/4+kIk3RboC62rrc6N7jmCXVx5EdkQpIti
	 DrE83gWfHgxXgR1qfkRJFisjGmbUArraTZPiMXVWqUa+NpYytG1eFSdGDYYl6nPRAk
	 aQkZfXwdc5WLg24lxCGbE7D2P9YzPM07M3vGYcm59A10T8A2q5ULMycaZPUsyB7e1X
	 LRw7dyv0ZpLJw==
Date: Mon, 6 Jul 2026 19:18:41 +0100
From: Mark Brown <broonie@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
Message-ID: <36d2cb00-81e1-47d4-a234-47feea11a351@sirena.org.uk>
References: <20260706132009.1496321-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260706132009.1496321-3-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fBBCP4x3mdusCmOT"
Content-Disposition: inline
In-Reply-To: <20260706132009.1496321-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Cookie: Place stamp here.


--fBBCP4x3mdusCmOT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 06, 2026 at 06:50:08PM +0530, Mohammad Rafi Shaik wrote:
> Add support for MI2S clock control within q6apm-lpass DAIs, including
> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.

> +static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
> +{

> +		clk_set_rate(sysclk, freq);
> +		ret = clk_prepare_enable(sysclk);
> +		if (ret) {
> +			dev_err(dai->dev, "Error, Unable to prepare (%d) sysclk\n", clk_id);
> +			return ret;
> +		}

clk_set_rate() can fail too.

--fBBCP4x3mdusCmOT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpL8YAACgkQJNaLcl1U
h9AT5Qf/QoCyd5sI33K2C8yO8pme9tr8tTtKRqwsLdEdd/DAtd8x0muHGNpj3Dy3
i7KuPD3D6SSfYeoYfGbtiohJcxJdd2ECqTrASlsKK7qBlhPykFRAke+LkozAjDIT
7GXjrP5r2ZWRORiRuwlUPoGxEYabjWjz0/SmS/4QA9x53+VwnYFIKgMgej9G8R5v
uGLUW5F0FOap/DjuhOXSe3RFbGBO67IXjOJAEFZnAGN6jDPqV+NPuKKQ4aulCGBh
AYi+ebdFeEMKAjx/IDU0OkkVFevefEbyhgGk/Nh9YdWdetclfaSJ1yEShPkEShKE
E30r0y7ihtPSJPd8VkwF9hKZMEv3qg==
=VEzr
-----END PGP SIGNATURE-----

--fBBCP4x3mdusCmOT--
