Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8C38C40E;
	Thu, 11 Jun 2026 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781187655; cv=none; b=i59Qm7t4WVE7grLYAS6Oku4WTPJ24/9EQgE9xap0HpiOmPqrT1avrsK0tHHuDBvAtcCvkZKIUSKSnW4yVWAw3NVtbV+2KIb8yuvRHOUSbwMPH/KK7Gol1UETnPGG/MCzaTVP5+q/sS5DUEZLHHrZHId1aBgEX66OX8OTbLDmCyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781187655; c=relaxed/simple;
	bh=Y3j2wAh+dneqTKOFeidFnWSeHI9RFs69YS4gh7K53a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHRinyPb5fWdIpBuwrmA6BABJ4nzF0BOMqlTzEnU/smboFiAB+3MJzRzxGKh16uqoPsUp+w6e0IqWwmlktLHIvT53EILNQUGD3Rsiv/XxgXiMA9OU96asSX85hHMJ/ob7XF09nxmd5FOTWFoSm1o3viDzIpHPmidK63SYpOeKBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnBpEcDR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnBpEcDR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E05F1F00893;
	Thu, 11 Jun 2026 14:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781187654;
	bh=Gj4KzS47Eizsj5RhO/M8xnn4aFhZyYa9CL89zRH6klw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HnBpEcDRZ++eAdrCNaYdif2K73ka4qZQTDevhGqrYcWqDy+SvsZrCjk4gMyCpQR/J
	 nLUF0bXNk7aWW543aIYCdzXj+MR75QroIFCuk3RE5Szkrn2sN3keYfAnVSgxc4dqrA
	 L2N1XSI9fbUVP6kiZMOzB0eom9wkM4dIjGkVxujjhSx5asOjHPQOCaD/mImK8VoW0K
	 QfjpH8qYTGbAKkjuON1B6UJkmfjH03YqgyliQzArheK7LX0xkRNSIxMZt5zMTZqAm9
	 KVUmyVx0K6Iz3H+CYNghH6Vc1AzacPUMLqJ5sDsxoxrdwSCPDUfTR+h13nx5Lr+xbm
	 LHz6tV6a1nPDQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8E99B1AC56C6; Thu, 11 Jun 2026 15:20:51 +0100 (BST)
Date: Thu, 11 Jun 2026 15:20:51 +0100
From: Mark Brown <broonie@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: SOF: Intel: select SND_SOC_SDW_UTILS=y from
 SND_SOC_SOF_HDA_GENERIC=y
Message-ID: <airEQ7ER7jUF3SQ_@sirena.co.uk>
References: <20260611132310.137688-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M8H/D+NjDPFAVMT7"
Content-Disposition: inline
In-Reply-To: <20260611132310.137688-1-arnd@kernel.org>
X-Cookie: Leave no stone unturned.


--M8H/D+NjDPFAVMT7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 11, 2026 at 03:23:05PM +0200, Arnd Bergmann wrote:
> +++ b/sound/soc/sof/intel/Kconfig
> @@ -335,7 +335,7 @@ config SND_SOC_SOF_HDA_GENERIC
>  	select SND_INTEL_DSP_CONFIG
>  	select SND_SOC_SOF_HDA_LINK_BASELINE
>  	select SND_SOC_SOF_HDA_PROBES
> -	select SND_SOC_SDW_UTILS if SND_SOC_SOF_INTEL_SOUNDWIRE
> +	select SND_SOC_SDW_UTILS if SND_SOC_SOF_INTEL_SOUNDWIRE !=n

Can we end up with SND_SOC_SDW_UTILS=y but SOUNDWIRE=m?  Though I think
that's a potential issue anyway...

--M8H/D+NjDPFAVMT7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoqxEIACgkQJNaLcl1U
h9D6aAf/ULyd2Z+vQH9qgTpE0Tf+EFMc9QF247O43yJ+nhD4eBLjX9HzLbBvWwjL
EzrnKbf5kDXnIjo5UAZp8Fn2j+hPuTU74X40fPqsPBUd9IdPGl+WjTFGi4Nxn0DJ
L0MpjWUUUH4tdp7SPFNg0ZMDOtIZRg1CTyckU/Vjro4lqtyKu+4xUNMfxaHQiDB2
YcRZ7XyezfSe7N4KBnOOaQt1fE/GZt30L+/NCmByoCC0Z6sPk9b5HbEJSguexsx4
uqe+hTS1OsXHmS4TiHCseteaCTmZiFDkzxINPXjEYW637BQ9RKpM2u2dwgFzo17f
pGpQCQWNGy5zCYDobuvE7w+KQY4FzA==
=q59T
-----END PGP SIGNATURE-----

--M8H/D+NjDPFAVMT7--
