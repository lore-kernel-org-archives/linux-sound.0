Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8090A1DF26E;
	Tue,  3 Mar 2026 00:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772497502; cv=none; b=ApT1oSsqyqS1iccDk/qqRq8saiXzecTPg/N/8g4D6C3q5v0XD6opbljCorRG7j3ptXW2pUoLxCcsLHIA1NlOvBfnkyaeAc00CqixrDSTyk6wEVWUmVyxEsxquwXzwDHAhSVcOQh9z2PyOsw+5rwEefJ21BcT+YSnRePyc2X60kY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772497502; c=relaxed/simple;
	bh=oMRcvAiaEAgwn2b42hGJups4wsIQaDu44aFVS4f8bas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgWElt7CrLUMqdZufY8Pe0XXM8UQzTEv58CKfvfn3TwJBq02NBlJVNSH4EbXfaBwoRd1zmczHYDo/+4/YAfeD7Ka7KBq9g2lCIxxFACk3G4qNY2iOLhKJnU+7i+3+Zd9HVg4Au6OQ8+od70AB+yPAYYJQ6KYQKLdW5WcLkghqv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=byLLl9GN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="byLLl9GN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326D2C19423;
	Tue,  3 Mar 2026 00:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772497502;
	bh=oMRcvAiaEAgwn2b42hGJups4wsIQaDu44aFVS4f8bas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=byLLl9GNqZpApIyee1kfJtFDn+hWssaTx0Noft8I5Fj17JOAQOENdWEAcBSh7mXU9
	 uCoGtr/G+5WrKCU/EbtQIcVm3B14Wln8akOsvotSL937nSgQkwHBiZ6gZcCEsYw5GG
	 kU0PnND3+opC2YqfY/cl9yIKr0i/yy+qb13iKdtdPkMyVHrsyF+PhhfrO+CTuYPCMX
	 vTvUrCFPgQpTAV9Nj66K0nb6rN3ki4SuwUIprYDwULA+BL19Lh9s1GgUV+rrVJ1jja
	 X0F3DEfoPg6G5E0bfx6FzPNAPUHBZqBWqPDPKpc7yedxFYQt95oaGFeGMNPN0SjLY4
	 6sDcPgrHytXdw==
Date: Tue, 3 Mar 2026 00:24:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, perex@perex.cz,
	tiwai@suse.com, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] ASoC: fsl_sai: add bitcount and timestamp controls
Message-ID: <d823ad90-c62e-4960-b012-5e7ba1f1b0d2@sirena.org.uk>
References: <20260212072229.3247604-1-shengjiu.wang@nxp.com>
 <20260212072229.3247604-2-shengjiu.wang@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ExE9y9OK5qW8XAv"
Content-Disposition: inline
In-Reply-To: <20260212072229.3247604-2-shengjiu.wang@nxp.com>
X-Cookie: Please recycle.


--6ExE9y9OK5qW8XAv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 12, 2026 at 03:22:28PM +0800, Shengjiu Wang wrote:
> The transmitter and receiver implement separate timestamp counters and
> bit counters. The bit counter increments at the end of each bit in a
> frame whenever the transmitter or receiver is enabled. The bit counter
> can be reset by software. The timestamp counter increments on the bus
> interface clock whenever it is enabled. The current value of the
> timestamp counter is latched whenever the bit counter increments.
> Reading the bit counter register will cause the latched timestamp
> value to be saved in the bit counter timestamp register. The timestamp
> counter can be reset by software, this also resets the latched timestamp
> value and the bit counter timestamp register.

It seems this makes mixer-test deeply unhappy, spamming lots of:

[   56.466460] fsl-sai 30c10000.sai: ASoC error (-16): at soc_component_read_no_lock() on 30c10000.sai for register: [0x000000fc]
[   56.466469] fsl-sai 30c10000.sai: ASoC error (-16): at snd_soc_component_update_bits() on 30c10000.sai for register: [0x000000fc]

into dmesg on the Toradax Verdin:

  https://lava.sirena.org.uk/scheduler/job/2518775#L2238

I don't have results for i.MX8MP-EVK since I didn't test it with the
fixes from:

  https://patch.msgid.link/20260205-asoc-fsl-easrc-fix-events-v1-2-39d4c766918b@kernel.org

applied so the test ran out of time due to the time taken to log those
issues but I'm guessing this new issue should be reproducible there too.

--6ExE9y9OK5qW8XAv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmmKlgACgkQJNaLcl1U
h9B3cAf+NouyZA9kIdqFHxWVjE4U+fzXHnEmbOGHJxlp6+/OoxBxc6rJP+be3E4L
jd/XaJrl2WVIrAugv7RxPJ+9QgDvWPVnXfOTQPe+VYe3eS2FOduc5qBW2pvIRsiK
J23us37jr/wA78RvMpBuGDRv0LWRUKdyrHu6wktXODXERhFfGxDBeWPEhsVvDD2p
zGkkHBdONRcGsru+JScmgDQrmYcg2tJ5/LbYAvMaknOr9JopRA/Mqn6BjT8mhNqi
4A9VNTOEnL6XPewqV1La3MZli0VGowBlX+X+np+bb4V4WX9xnxCDMvu8nVa2j86/
baij074nOzM2SK6GnmK3B0MKObwNMA==
=hMP+
-----END PGP SIGNATURE-----

--6ExE9y9OK5qW8XAv--
