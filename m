Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA42241665;
	Wed, 20 May 2026 13:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284577; cv=none; b=l/OU0jtmpiKjayOlSQvkYvR4JKNN9pgjRitnGFU1LDeYII2scTuDmnOTKsPE17YIHPgqeHYqAyowMK33BfDUnTuFlOukPMj9sPyWjXfgqadBKXmvuefHWZ69SP53g9oZxPOw1AfCNKk15VXS4An0VFCAHt0OChSlIsUS4DLz5BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284577; c=relaxed/simple;
	bh=u5qGBegF2d0rfNnCblIf7e5GAakt66rinBSN7lJP+sA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HjlHyK8Zkwr3TC49zelV5WIqgPJGK/H+/SnllwJxT9htCGc78fTT3hZDpZIcX+fqAn8szkb8Kej7YlSR9hND+S6aNLsYhMC3ocd/Wtc4SJ7FNyWrSIskX9C/knCkXsqxy81GXoqCxjJxvdmf62CfzNK2LmokpuEd4oalphJ5mQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l4hK+Kr7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l4hK+Kr7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9466A1F000E9;
	Wed, 20 May 2026 13:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779284576;
	bh=u5qGBegF2d0rfNnCblIf7e5GAakt66rinBSN7lJP+sA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l4hK+Kr7ChSq6w3hiH+CTTU36JGDkfcLEx/ZrdW6ZcLoPPRqfLijP0mWoHJz+uU0t
	 8FgJQEhH+89+v/bCec+WFTb+xjrWouY5DxWy+gCHeNek1kZaH2V7KStsyTVrVW09hh
	 MWhtd1pBI4UcruR5S0dYS+u/7zA1s6W2q7r68xJoks9XkRfHACSg4F6gBaFARkAR1Z
	 Ji6ehkxsSfGR8G6+/wlAVZzuGAAhnUZ/NibeKBaAroR49379cO6qlkIeEC9T5KXCzx
	 G25OGpWq9YfxFAJbdMl+N912ULQy0ToxtxP7wfOnWarc+mRlteKCBa1BwUGe+wByhk
	 1xVOSzWARgs5Q==
Date: Wed, 20 May 2026 14:42:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	sharq0406@gmail.com, kuninori.morimoto.gx@renesas.com,
	ckeepax@opensource.cirrus.com, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/2] ASoC: mt8173-max98090: use standard callback to set
 jack
Message-ID: <5990fbb1-286f-482d-b02a-d0637494f435@sirena.org.uk>
References: <20260520132930.54333-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7i2xBcyZcHONdB8E"
Content-Disposition: inline
In-Reply-To: <20260520132930.54333-3-srinivas.kandagatla@oss.qualcomm.com>
X-Cookie: Natural laws have no pity.


--7i2xBcyZcHONdB8E
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2026 at 01:29:30PM +0000, Srinivas Kandagatla wrote:
> use snd_soc_component_set_jack() instead of custom callback to
> max98090 codec.

This needs to be squashed into the first commit, otherwise the first
commit will cause a build break.

--7i2xBcyZcHONdB8E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoNuloACgkQJNaLcl1U
h9B4Twf+JV6WN5hwidB7pRGuzELS5rSCHOwICTi0LQSUzc/WMRJr+Y8kiC3yRvN7
amSj3E7W75Isd+JbMKquETUaR+JjBdE31iS5f6gVBQVqHkTt77bxZzxSALZL+AAc
GlYYlopGaMw0VIhK6dD0NgdzCYUzB6YxFrAqh01DpGx05ekJhu9dE/iieDn69QJr
vxHwxHpUY5eQ1KpggAQcKGhRSr7fuyr4KSyQPkFdH9UuDIQQLVOvvzQvgW6+FFt3
zTY/mYxojOUUImPtjyIWB4Wuax3l52Rue+HvA9zZ1u68YaJDz06UsT+Gcvfkwi/N
gTQvW+EDETQralTW0M+5urEBORKp7w==
=9ozI
-----END PGP SIGNATURE-----

--7i2xBcyZcHONdB8E--
