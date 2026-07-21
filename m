Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B59D3793D2
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 16:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784649883; cv=none; b=CsxpkpdQuOzJSLzlb05lr8DCqlYPqzkvWxb3swzFS9hFJnoh6DlgD/skVMR/L4HY2/uJpqmqzF7ScrCO3CNEOKIYzoLFD9P2ezp1uVRA/RaTVAOVrDi4wD8XWP3wLqTw6oagyZgVN8tJFlfAjP+mFbSclOo3cN+FZObvmozKRIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784649883; c=relaxed/simple;
	bh=fqzQQ71yafrYpmYX4cux5apST4ZjIEZyMaAiPqtWsfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ah8YwV71xSw7enJEtVPvrjQ/92X1T7Ep8lKEUdv2Oa+A8p6n86cKnGlnhe1wQkw3D6q1cf0KV2WPMSUViYDzOlci4COaWtRkzoELOb99vod9BL8GAmRvIlq2AyJ9XKBGlNvFCLCVs3YbSepfGGoyJFlCGVVTLPZ4ddyV1I9lMNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IYq766m/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IYq766m/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D741F00A3F;
	Tue, 21 Jul 2026 16:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784649882;
	bh=gxnzGM/GJxQMLcrffWgU59tkbGwcawho6//YGKy6yHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IYq766m/rkIXGGb7DWF3f2NdkjnbtKi65JJj9Ih40eswePzTCfMoCvsQTE36wApLi
	 Kv6zrPxYj/qtKKJYueVV1rDMqCqO6lJZOxa9kfDFb+OSQM6kWmXbFjzjkNKZb6KNKh
	 +MJ7ArnzOrrZfpA+tl5n02tefsox9Tx8x3KBop7Bvnoi/eW76k8lBTwKxCxaX9SxmL
	 i9aJruNyjucvhqxJSremfQLNUkvtRyucvl++hqgNOVFTxQTFX2Upj29+sWL+gtzXJf
	 VpK8sqOCgEBQfUGErzbWvLdZ/nfO7lb3+FWD29f0l5q1dW6jphPJVG4oUlR3mkWJXk
	 l4UjvNTjBG4/g==
Date: Tue, 21 Jul 2026 17:04:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v4 10/12] ASoC: soc-topology-test: use
 snd_soc_register_component()
Message-ID: <b7b05fbc-8c29-4cf6-92ee-ef835a420230@sirena.org.uk>
References: <87qzkxjg53.wl-kuninori.morimoto.gx@renesas.com>
 <87cxwhjg3b.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5NwEnPg3WZ6/P3aM"
Content-Disposition: inline
In-Reply-To: <87cxwhjg3b.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Love America -- or give it back.


--5NwEnPg3WZ6/P3aM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 21, 2026 at 01:18:00AM +0000, Kuninori Morimoto wrote:
> It is calling snd_soc_component_initialize() / snd_soc_add_component().
> We can now use snd_soc_register_component() instead.

> +	component = snd_soc_component_alloc(test_dev);
> +	if (!component)
> +		KUNIT_FAIL(test, "Failed to alloc component");

KUNIT_ASSERT_NOT_NULL() - you need an assert of some kind to be or we'll
carry on running.

--5NwEnPg3WZ6/P3aM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpfmJMACgkQJNaLcl1U
h9DqZAf/U7CjIWI3EOSut1nwSE1J+ctIcO72fbu1IHnVd20tKhUHt4qJl7wIFJm1
Pef9TQJDw4m7cuyYsTZlY++qCcHVqacRpJSJAPha2ZpEKUgVWYg2ptT+mXhWVdkI
HzQH9jpy/qNqtGEHFs/EhRH44Ly56DTDdexTWlloOTDgx4P3Rw75UcN4/pkVt9bd
2ZWvR3ugNC2ExYia7e5IC7+uRjJjZzNF2dXRu8eNP967GNCvrP3e8+E2yfUjxXWX
ltcI8LTFj50cFyauukU9mtPoZakNSZ8RRpwIgoSeaTL2rOXN+LC1CKFwy2/Cpbfs
Zk8rkvjA9qD1K20cvoZYoSFx0agjjw==
=UwQG
-----END PGP SIGNATURE-----

--5NwEnPg3WZ6/P3aM--
