Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA78437B03B
	for <linux-sound@vger.kernel.org>; Mon, 25 May 2026 12:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713077; cv=none; b=QScbSHE1rPZRVmVdsrmgfoCFrXhrVbDwxdOmH8tqt2diTY9YfGc8yBxtTVgBfJdI55OVVBOo+nsI8DmIWbdVFcs0OqY0geS8gwgRkhK8ZSVToAyctAjhVQxWT8L3MVGRKvibJObJqiU9Ls+cFEK/d2S0ru0MZfT6yu5ybouqHK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713077; c=relaxed/simple;
	bh=NapcNfaNbYpIRET68JUf9bulsaic+vQDxBwyHjMiZuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YfH6yWCB4s0naJhhJ/oXGAiySAZGTYtE/ZJd1tggVdLBX9jirP2w49VaPlgWnAC1kUQS9sJbm6a5oxH/kmrdFSVsQH81BwjO+pNe8tVgMUG0v5xdsNurvjVnqReyaqV2wZ3qsSvyAxj5pxEV3hDigZI7W7rulpZhrquzDQqjkcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eEgG6p3t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eEgG6p3t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFCF51F000E9;
	Mon, 25 May 2026 12:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779713076;
	bh=cdgOyW8Ypsar0kN3pT3hbDR3sDlwACmVcPdS07ejctE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eEgG6p3tJ4Ltto415o4vA14aloaC1nvDR9o7Q5bpZJy5HyDF9HVUmDD1Od1YZ31UO
	 zbG3HGyVREnU72XLS8K7L1jWNp5O+SWukl1dpGpQr+anoUmXO2Tt7I2luxBw2ow7r9
	 kYpA4qLSXcPTCarx5keW750BrHpePPkflxh/mZ6SF7ZyPp6HNyTnkx1pJzY4vdb/Qk
	 tVaiYaLFZEybCkHk5yR67QT8V+vOA5mVv5MNnYlDfp/ecozwmYyMUNQ02jHsrhST9k
	 qfIRQCgN6IXfRwZzizmc7F2Ddk1+NdyVus/oIRPoNHdKHuM+/3J4ucujWoBkdT5cer
	 cmTJIcgkgA4tg==
Date: Mon, 25 May 2026 13:44:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Cc: lgirdwood@gmail.com, linux-sound@vger.kernel.org,
	kai.vehmanen@linux.intel.com, yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev, seppo.ingalsuo@linux.intel.com
Subject: Re: [PATCH] ASoC: SOF: ipc4-topology: Allow the use of multiple
 formats for src output
Message-ID: <46d71e73-e491-4d3d-aaf5-e5586852abb7@sirena.org.uk>
References: <20260520150149.18250-1-peter.ujfalusi@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wOMrK7XFUC6IIETJ"
Content-Disposition: inline
In-Reply-To: <20260520150149.18250-1-peter.ujfalusi@linux.intel.com>
X-Cookie: Prevent forest fires.


--wOMrK7XFUC6IIETJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 20, 2026 at 06:01:49PM +0300, Peter Ujfalusi wrote:

> +	if (src->data.sink_rate) {
> +	} else if (dir == SNDRV_PCM_STREAM_CAPTURE) {
> +	} else {
> +		/*
> +		 * Otherwise try to guess what the rate should be:
> +		 * The output formats must have single rate specified if the
> +		 * sink rate is not set for an SRC in playback path.
> +		 */
> +		int i;
> +
> +		out_audio_fmt = &available_fmt->output_pin_fmts[0].audio_fmt;

Did we validate that there actually are output_pin_fmts[] here?  It's
not a sensible topology, but you could trigger it with a suitable
topology I think.

--wOMrK7XFUC6IIETJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoURC8ACgkQJNaLcl1U
h9CJugf+OD30J9tTXOHWJXN0PsMz/KdsJIVN8D4Hcb0uQmPcdjmfcjqAGRjumIZf
rUkjnISmZrioyrdTAOksAjDnfsP0B5/2pyFxO1+n32WbGEPVJ0bDyrpe7HUHOPw9
M3dxtMJYi3p8jrE0hx6xgVtd5jOMv18RRJlq3vPiNPZv66FSo+6z0i2XWezruryL
H7K9Gl6RO8TQsyFqxjD0vfiw/Nky99wHE4n1eJ33MUNuPNC2GXPUi9BvP09IWLQ6
kUPPAAVw5N2dIw8BascHfHddPiLt4m8fgyODiu9Pm7b678nqT6KwelyVsgHlzFLD
my2lphpO+r8kDN6PEfwj5dt4Hs0ZfQ==
=YN7z
-----END PGP SIGNATURE-----

--wOMrK7XFUC6IIETJ--
