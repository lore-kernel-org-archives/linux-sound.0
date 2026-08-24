Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267B43803F8;
	Mon, 24 Aug 2026 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787571678; cv=none; b=KfarQ91J1YtRCFV+XxP26VqgF7id4vAGJe2FgJh04mBVchhapRZaNO/A5ruMHMxtdjO4JGS4/vZKqEH2C12fuoHXVNELnYYaPaB+fzrx73vjpVclnmB64a6OPMK5VcMeEcJTFAP6WoI9DWzznYAXKMWfnLw6/SQjyiQd5lRfDkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787571678; c=relaxed/simple;
	bh=oKkamCww1q5Ba18PxYV1T6fttml/X82gi0Gcp6tm1xU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HARs02Ch7e66npfDCmvYvNJif7I8kgCidfEx5qNte2agbXVLXzQNA42SWeWwocwQfpwfMVynY62DFBYW44tOg3a8uXW0R7G1GTWoepfyl+wkdQqXT8JXcKsgRO2zlj1AzoaNUrt98pxw0ByFSbm81uCbrYXq2KjyWVoO9A69bvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYiXYYC7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYiXYYC7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F19BC1F000E9;
	Mon, 24 Aug 2026 11:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787571676;
	bh=oKkamCww1q5Ba18PxYV1T6fttml/X82gi0Gcp6tm1xU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hYiXYYC7ozYlvjA4gz2sZSYuHLqlOuiXPUsqaRU8sJcZziXbXCBdB4qHTv2x7x0cs
	 Ukqybg6GDCZmBkZoVu45RJ1OxwUwsCWdfkoulgJ34nqLCRymjWo5riEbmKJV0lISnQ
	 Udmj21xM50PIYzZA7vKYruUvu0OSBAkcf4szAnBoioAUgnFgWbDsfwKXKbsGUN6DLO
	 pN1bk4q9+xMUT8yu0+7WOUXKvYAw9cLlHxd76/AjPVKqpD5Hp7G/Lxq1dXps5qC1pg
	 ipj4NiJCQAzvAQt4jY69XHSe/tkWj8rZ5DnW5+kA0YFpdIp0Ci4u3FaiNdxiJV9qAO
	 F2ZlsxRiC0LgA==
Date: Mon, 24 Aug 2026 12:41:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Michal Simek <michal.simek@amd.com>,
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCHv4] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-ID: <219e4bf6-f7c2-4651-b032-e9b1ea11feab@sirena.org.uk>
References: <20260823050012.17067-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PRkKuBKNpKGJW20A"
Content-Disposition: inline
In-Reply-To: <20260823050012.17067-1-rosenp@gmail.com>
X-Cookie: Accuracy, n.:


--PRkKuBKNpKGJW20A
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Aug 22, 2026 at 10:00:12PM -0700, Rosen Penev wrote:
> Use devm_clk_get_enabled() to let the clock be enabled automatically
> and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> clk_disable_unprepare() calls in probe and remove. As a result, move the
> clk struct member into probe, which is the only place it's used.

This doesn't apply against current code, please check and resend.

--PRkKuBKNpKGJW20A
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmqMLdcACgkQJNaLcl1U
h9DxTQf+INtzJgyDvqgqcnc4gNY8dx1hZe21T8KpXzsJojjOXwkDwQGQulFOAJgL
zAECBEeLfPd4N6aFurXZkKHxEe1BpwJisUnq7/9fmQybVM+OemOQNOhs5x14YXzp
uoqs9VUsYKYE0JMLDskxrWs1Z5zwCYWUt9Tm1n3U7uOmIHQtZsZWOGU9wvVYeOIv
tsi0suIQPyulXa/JBpciNv3TW10mL+E8w1FfZxu+hSSxHab9ZAm8sF4RiiUc6ulb
awFeBY/aju3oKS/YhB4jvYB3txuVuapfZ5xFbjgb1By69qYGd+K2qqOB5JjaL+5c
d48RB4uNYBlp2EMGcLjWy5vorczVzg==
=bl82
-----END PGP SIGNATURE-----

--PRkKuBKNpKGJW20A--
