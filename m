Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE79380FFD
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 09:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791277975; cv=none; b=TTIv83FXCc5dI9yTs0D5xDoPYTqmob6o5QXtst/IdXMrq4uHSuu/GXcsID4DgXgDGt8EP/gf/72SCFth0PpaucYBscQGhP4+qZZruB3JNPl1I/kpsiRy5Ohrv6n9Sfk/oYoJZGgA9A24KUnLsLePiHrYvXUovKT5V+i4jKdmyHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791277975; c=relaxed/simple;
	bh=kFtUPvavdCS0CQORLJr5Yenpi+/z+FvkmtuQNaNuhN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kI0rGvtGBiQ8ZckJAv5s/eP/guyqL9mWHgQ0buIAvxuho2uUVgjf+AE6XVWXm+NlMazEA8KlZwMV8u3qswrqlOXN+5tAC08u+metdXxanVamDR90b35Q2/eliS8YMPDlP70MiCYu+kyDJgqtNaDRrf9LIZuB9FOm+ttsuTybkb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ET6aaNqy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ET6aaNqy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B98AD1F000FF;
	Tue,  6 Oct 2026 09:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791277972;
	bh=96S+5KTcCuJ0/2qUO5h2UazdTt9ijw6yTY1lb6NWUOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ET6aaNqy+tkSO2tJQMS90oCPuy11/BPLL+CORP0JlLYB+qpaPAYt8/Lb9LsOS168b
	 UhIE1G81+/GxAFnUSSbDehAtCd/23ptPZe60cJ04fcJAl6utyPADuV09TSuWo3qV4Q
	 vel3Qh/zk5jqWmI73q/61hQdIVNmQlox3YgGvMhzclqSAkrlHtKAqHnHT/maby6S1o
	 L+3ECL9/mCvuKKMv9VyvkYBq3wY1qBScpAsIvA7lo2aADm/Hez9bCvGIjuUZWB5asJ
	 xswg/WC9MW/OJYHnaRu6+Sx8DGwpsky18jCQLwQZJWF7RwBnoN4yv4kpMMtx7GnWfF
	 DlhW9c/zaVT4g==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 63D951AC57CE; Tue, 06 Oct 2026 10:12:50 +0100 (BST)
Date: Tue, 6 Oct 2026 11:12:50 +0200
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: vkoul@kernel.org, perex@perex.cz, tiwai@suse.com, lgirdwood@gmail.com,
	srinivas.kandagatla@oss.qualcomm.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, daniel.baluta@nxp.com
Subject: Re: [PATCH v4 05/26] ASoC: soc-compress: Implement trigger FE-BE
 sequencing as with normal PCMs
Message-ID: <asS7ktuZo6z68chF@sirena.co.uk>
References: <20260916120320.18318-1-peter.ujfalusi@linux.intel.com>
 <20260916120320.18318-6-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YJGFilgxOwzAEVau"
Content-Disposition: inline
In-Reply-To: <20260916120320.18318-6-peter.ujfalusi@linux.intel.com>
X-Cookie: You will forget that you ever knew me.


--YJGFilgxOwzAEVau
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 16, 2026 at 03:02:59PM +0300, Peter Ujfalusi wrote:
> The FE-BE trigger sequence should be dynamic, similarly how soc-pcm.c
> dpcm_fe_dai_do_trigger() does it.

> -static int soc_compr_trigger_fe(struct snd_compr_stream *cstream, int cmd)
> +static int soc_compr_trigger_fe_be(struct snd_compr_stream *cstream, int cmd,
> +				   bool fe_first)
>  {

> +	} else {
> +		dev_dbg(fe->dev, "ASoC: post trigger FE %s cmd %d\n",
> +			fe->dai_link->name, cmd);
> +
> +		ret = dpcm_be_dai_trigger(fe, cstream->direction, cmd);
> +		if (ret < 0)
> +			goto out;
> +
> +		ret = snd_soc_dai_compr_trigger(cpu_dai, cstream, cmd);
> +		if (ret < 0)
> +			goto out;
> +
> +		ret = snd_soc_component_compr_trigger(cstream, cmd);
> +	}

Shouldn't we unwind the triggered front/back ends if a later one fails?

--YJGFilgxOwzAEVau
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQReagvpf3TrrA7BoYYv73Ows9A4iQUCasS7hwAKCRAv73Ows9A4
iXG+AQCLfKQ7OVg/3r87glkMTe59Zv5VgldZjmRvR/SDLxGeHAD+LtRgFm8YkubX
1mN+XZg8iJXrOP3n1dC9e+J+w1kG2AU=
=Bjnu
-----END PGP SIGNATURE-----

--YJGFilgxOwzAEVau--
