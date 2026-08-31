Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ED023BB110
	for <linux-sound@vger.kernel.org>; Mon, 31 Aug 2026 22:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788215429; cv=none; b=OcioPs81Yztj51mT048+3kQnCc1IsQqoirLc0fhxWodiLjCzlwsHaPx2P5T6erphPV+rgwwFyg+ttBQHtPc7XQdSnY31mPpJ2tc/27vBzNqSnlktHMUNYfSetN5OVtFA7XtNkaDHmecJYR7z9c1QGwCcjPfvQHhNd4/RwOr/L5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788215429; c=relaxed/simple;
	bh=BiMRGybCXhFlA4III7edHWQ/Pu5mWncFBHG84Az9rGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POpej1dx9yTGjSrE+Ms5E6bQpSRlHaS7vUDP1bCHYW3II+ADh8DA/Go9w9cmfVdvntY4dQ8jZhiuiPJwpnu0rvtsFoN0DeUXsRT6HMLZKyHV6Sq7Lrrs2ngk+IrjmDGnzRMF/vkFnPyTQUF8gLJe6PrgCUANR2X7atdayh++ag0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqKvRwho; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqKvRwho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A9301F000E9;
	Mon, 31 Aug 2026 22:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788215427;
	bh=3QRPqGwDqptdkmDgg7x5BQwqCPcXYPcPcwe4sTsT5dc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZqKvRwhoTh1+q3tgf2+ZpwKfsuC+ERHmDQxxyqyo/BpJFQS1Yuve+RjsU3dCuHAwZ
	 WNwXExiH9nZ0n3uYNabvMljLry3Bixwe1NR3K7LCbrMWrYV1XAtd5JOG0G85Grhk7w
	 qXhx4uDOHPYdGY36NxUdQpVX66G4fhOjmLoRA2mMrbTY53qC2mUs10wz7cRfqhSqU6
	 O7hPgT7m5XT8egw5wD/7WHi0MMUZlPI8FY0wkM86b8mckqYTtOepJYgVmyXYyITpp3
	 6CTpn5oHvCfFke5xy/RYXbXEfmRbEFSB5D9JaZyWEvrFTftHafqtem3AzluGraqkHE
	 Uq2XZmFcUH08A==
Date: Mon, 31 Aug 2026 23:30:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v3 09/10] ASoC: Intel: avs: Refactor and fix init_config
 access
Message-ID: <1f928229-1c43-4260-90e9-9e1bd1cd776b@sirena.org.uk>
References: <20260831164233.1487766-1-cezary.rojewski@intel.com>
 <20260831164233.1487766-10-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oN4Y3csgw+ikYTPk"
Content-Disposition: inline
In-Reply-To: <20260831164233.1487766-10-cezary.rojewski@intel.com>
X-Cookie: Sell by date stamped on bottom.


--oN4Y3csgw+ikYTPk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 31, 2026 at 06:42:32PM +0200, Cezary Rojewski wrote:
> Existing code accesses enties found in ->init_configs array through
> indexes that are part of ->config_ids array.  Those two are limited by:
> ->num_init_configs and ->num_config_ids respectively.  Using ID larger
> or equal to ->num_init_configs leads to out-of-bounds access:

...

> Rather than adding another if-statement, refactor the code.  There is no
> need to store the IDs, have a list of pointers to actual config-entries
> instead.  As the verification of ->init_config entries does not differ from
> verification of other types that are part of the topology.c file, simply
> reuse the code.

>  static int avs_path_module_send_init_configs(struct avs_dev *adev, struct avs_path_module *mod)

> +       for (int i = 0; i < template->num_init_configs; i++) {
> +               struct avs_tplg_init_config *config = template->init_configs[i];
>                 size_t len = config->length;

This will dereference every init_configs entry...

> +	cfgs = devm_kcalloc(comp->card->dev, module->num_init_configs, sizeof(*cfgs), GFP_KERNEL);
> +	if (!cfgs)
> +		return -ENOMEM;
> +
> +	ret = parse_dictionary_entries(comp, tuples, block_size, cfgs, module->num_init_configs,
> +				       sizeof(*cfgs), AVS_TKN_MOD_INIT_CONFIG_ID_U32,
> +				       init_config_parsers, ARRAY_SIZE(init_config_parsers));

...but IIRC this ignores things it doesn't understand so will leave NULL
entries behind.  You'd presumably need malformed firwmare or something
but still, we're parsing data from userspace.

--oN4Y3csgw+ikYTPk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqWAH8ACgkQJNaLcl1U
h9AERgf/aMK7Ixaxc+2kZCt9C/z6jV0SVIuGyB4AcTGbH5oZk05W9uIMrXfuf0bz
QihioQ1k6NhE0Tm6C+mKPLXXwMTfMehxqdDghKIZle4RycD9P89GL8wWoauLJTVJ
XfItNLixwZPRYH/MWtqXbB+Bj/wPA99bWU/NyJznsDp0U/7K6LWFe5APo1ZR4MCS
1NdcX3LFP5XCKPTAW29SMTjSjJx1bMDwAoy+KgyQ6j8JbtYKbNcFQSc96pWgkOVh
pkexmljbvfqcaxrsX1gm+dMdrpunMojXQjfP7VaSFsdQ73X8zHXXrcx9UxJ4qqip
7Ckhxlaycx2QquYHLma2Ija73SCJ+A==
=BnU9
-----END PGP SIGNATURE-----

--oN4Y3csgw+ikYTPk--
