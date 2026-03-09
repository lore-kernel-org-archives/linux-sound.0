Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B0E423A8B;
	Mon,  9 Mar 2026 22:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773094102; cv=none; b=lv94ro6q5eT6CnhPOSFfs4mTGPZiMnoq01yUNh68jUvmpKRCZ5pgyCOvCdMHMkPe7YWYKrI5HP9vFqF+rEcyCcPzBgXPOY6a8qQF7auRUt8piEzbcwFHELvpWe9XAPpqTOrIKr7uuQA8+yBmHCQF1XH7sg4E6s+g2W/UZMryEEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773094102; c=relaxed/simple;
	bh=XddtIe73AGoeKS5f2deqs0AUjDHMQT7Iv6MetANv3KU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlRhary0PQsKPrsBx5V+T6iqKzySi+E+3yGpGGMcbqxRbcf0F/gydTsXLibGfzLUzi5yISqQy5RxmHV+JDZtuHrdSAxFvYXHXHzVcSPmN1m4xX4pa53GKPJBNB9keamlCsAHw5vXE+iTHP0yaAsO0Yx2bNxywvw79ERVDRvxJa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZxNY/E5x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZxNY/E5x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8A2DC4CEF7;
	Mon,  9 Mar 2026 22:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773094101;
	bh=XddtIe73AGoeKS5f2deqs0AUjDHMQT7Iv6MetANv3KU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZxNY/E5xbwwgrkTsGq7rhr1+QhJw4voRSvbVbWbzYaCmKU56J6Q3YVJJp3Or4RQhW
	 C00FhCBHgPCGB/bKnXlPpoLWWQeTD29w97YRjELTm4iZ8WaUrc4GT/RaPk0gHfZyDz
	 ouiLU3tI2Qn9D4VkH10coUwSeX5hiPT1rPQi36q1AhZk0Iwl0FxRGmlY4grEgu55qj
	 m1Q0XLHqoEoinQ+VJrM7wV4o6xa5iAqADZHuxn11HITNLlPaqbFjMgCRLQtS0Xbmhl
	 IbDLlJNUWW5UKvSLzUOZxTV5ogDM9xNeGat87o7oR6tOFWjdIpM4hNnr7LPmc8cbQJ
	 Idsh+Femd5FXA==
Date: Mon, 9 Mar 2026 22:08:17 +0000
From: Mark Brown <broonie@kernel.org>
To: "matteo.cotifava" <cotifavamatteo@gmail.com>
Cc: cujomalainey@chromium.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	perex@perex.cz, srini@kernel.org, tiwai@suse.com
Subject: Re: [PATCH v2 0/2] ASoC: soc-core: fix use-after-free in
 close_delayed_work
Message-ID: <fbb7ee30-e60c-4110-917b-94840cb8916a@sirena.org.uk>
References: <17591222-b9f7-4056-9c13-4a2ccd0788df@sirena.org.uk>
 <20260309215412.545628-1-cotifavamatteo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HFqL/RzmWqzAciRI"
Content-Disposition: inline
In-Reply-To: <20260309215412.545628-1-cotifavamatteo@gmail.com>
X-Cookie: Do not dry clean.


--HFqL/RzmWqzAciRI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Mar 09, 2026 at 10:54:10PM +0100, matteo.cotifava wrote:
> Fix a use-after-free in snd_soc_dapm_stream_event() triggered when a
> sound card is unbound while a PCM close delayed work is pending.

Please don't send new patches in reply to old patches or serieses, this
makes it harder for both people and tools to understand what is going
on - it can bury things in mailboxes and make it difficult to keep track
of what current patches are, both for the new patches and the old ones.

--HFqL/RzmWqzAciRI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmvRNAACgkQJNaLcl1U
h9B+MQf/bKWAEycdrGyAAyyhoRYofbPchH+fgQvoeTkncPFbjPwGA310eAzh7z7Y
fYc10i0gVgV1F22aJX/FCthCb3VJ+eAA7m8kP7fVn2WveEFhdZWbVGWnREqOerJr
AAOJN8IyEZU3bzgqLKW/8anu3s/O8TRkQZYXAOe27XmArlHwjCuZsbk2QGgOkqmM
8qf6C6pFQEKIYxsN8ruu/i67er7OFbEj0UVqDbFtnXGuH5HHAP99Vs4Q3S5T0Dn5
XAqLLOclNZV98PT7JU62ucDzji7Y5JdwJQcP6uRkfIyrN+DKqRP07/udiaHD9wec
e6tiGDbpVY+RLgNfrbwM9QYKgN5Aog==
=x1UQ
-----END PGP SIGNATURE-----

--HFqL/RzmWqzAciRI--
