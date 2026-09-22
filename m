Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0783C4CB8C0
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 13:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790083109; cv=none; b=Oo2GXyGJLM5WC7zTeg8P2PYPAoC+vH9xTcfKwpkaFAY6CPf//LFiu0EbtVTdmQVx0wMOjpLlicLHQ7usJVPm8tNf/NryH8lDs1/WA0fNaXFbDRUsAei311iQu5Qc4iqZCXU8iHC1zAop5chg8v/+hE6pAI6O4XWjyDdUr7KF80A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790083109; c=relaxed/simple;
	bh=uYMXgYr0sYXBK/0E9XSciBC5oa2ToqQFPZowW16A4b0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAE3kJDirsrf470BhRi51ELFWt+Mb7u3ISz0M8Il7BN/mDCP50rujWFWDUHWmOz0X4Y8fe2nTDKvObACitp6WuPW29cBeIPsytpn88f233qWJR4HZpt5YTFoPWSojnr+DBwSTBwui91bAPJrXBagKhJq320D1ylBRGYm98qsnmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TATjQvIN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TATjQvIN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73BD41F000FF;
	Tue, 22 Sep 2026 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790083107;
	bh=eoUkcgnQ4Db5APz9JvjQYP6nFegEEdYEPI95TvwEljc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TATjQvINbDziZf7+wFdASm+NpAYtepeR2piNoa+zZNqeHgTpfHGVcS4dDYNlhsBQa
	 Bha6QISeAD+kiuuS+FW1NN8xf6p3Y+e3iezN0BmgaqzYr7NS8M6x2ogiAhOlx9tRQ9
	 i2XEE1ry/igN5CjL+S8tqv6WwgEj3LOHnYCanqhH87nX22S0FjH6lpSKwzwJiHI2Ev
	 NuEGi9rrwaFCY/yEQjmdPvxKlNMzFY1y5YJ7tiYmN2dl/nnwftIBelUUlUjUmdZzgP
	 I78DI9gWEyBNzxLwqBYVzGYB4ZjgZ0UJE4ewcoedndghYYXSvGgcXD8T8MxgO4Xtw1
	 CFwzwVMOEdkBg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B45E21AC56C0; Tue, 22 Sep 2026 14:18:24 +0100 (BST)
Date: Tue, 22 Sep 2026 15:18:24 +0200
From: Mark Brown <broonie@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: tiwai@suse.de, linux-sound@vger.kernel.org, bard.liao@intel.com,
	peter.ujfalusi@linux.intel.com
Subject: Re: [PATCH 5/7] ASoC: Intel: sof-function-topology-lib: add I2S
 support for sof_sdw_get_tplg_files
Message-ID: <arKAIIkESvrODYQ3@sirena.co.uk>
References: <20260922092316.2296039-1-yung-chuan.liao@linux.intel.com>
 <20260922092316.2296039-6-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iGT6ijX4LRonN7IG"
Content-Disposition: inline
In-Reply-To: <20260922092316.2296039-6-yung-chuan.liao@linux.intel.com>
X-Cookie: Too clever is dumb.


--iGT6ijX4LRonN7IG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Sep 22, 2026 at 05:23:14PM +0800, Bard Liao wrote:

> The Intel SOF SDW machine drive also supports I2S interface. Add related
> supports for the sof_sdw_get_tplg_files() callback.

> +static int get_ssp_tplg_dev(struct device *dev, struct snd_soc_dai_link *dai_link,
> +			    u16 *hdmi_in_mask, int *tplg_dev, char **tplg_dev_name)
> +{
> +	unsigned int ssp_port;
> +
> +	if (sscanf(dai_link->name, "SSP%d", &ssp_port) != 1) {

Should be %u for unsigned, or a regular int for %d.

> +	if (strstr(dai_link->name, "Codec")) {
> +		/*
> +		 * Assume DAI link 0 is jack which is true in all existing
> +		 * machine drivers

How about sof_ssp_amp.c?

> +	} else if (strstr(dai_link->name, "HDMI")) {
> +		*hdmi_in_mask |= BIT(ssp_port);
> +		/* The number of HDMI in dai link is always 2 right now */
> +		if (hweight16(*hdmi_in_mask) != 2)
> +			return -EINVAL;
> +
> +		*tplg_dev = TPLG_DEVICE_SSP_HDMI_IN;
> +		*tplg_dev_name = devm_kasprintf(dev, GFP_KERNEL,
> +						"ssp%x-hdmiin", *hdmi_in_mask);

Not %d?

--iGT6ijX4LRonN7IG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqygB8ACgkQJNaLcl1U
h9AQYAf/WZ9csxhlevT28PUr5pegfretw7xj63/KcsCpJTCgiyuWvyQTV1YFwZR2
Q6d3Y6fHRDkkx0b66od5VhR7jbGMX+VetbbJsHAiArbDyKPD6msLr/6Z5qaDnjpl
dxcaRrXrCyoPgJ5p1rF4BP6LOp9TXbfVkDzpAMT0S6Yln8TJqZNbtj4lg9Zzd2eV
GuRAXBIRX9w9xFFZe8dpny31XGRwswSL76036HBTvh2BZS2TjLxOc/6LTInYURRs
uJjMbrsEGlwIuVZg2mnXgSU2ZjV6KoiJmphDOmGbmgTPfeSi/CRH28o5g0EtHWII
UK/La7D8abJQHeqmAn2dcxwdHOhjjA==
=NFQ1
-----END PGP SIGNATURE-----

--iGT6ijX4LRonN7IG--
