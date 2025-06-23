Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A28A227EB9
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 23:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750722226; cv=none; b=nlA4sz1t8yWDJOp+H0Kh0rOGkWaZRBPo2D9fAHJ0CiLzHcaV3+ExvWfeplMWAaPZd31SLg+n7OwwGCqcI3hCnR4noNlyzdDS+XHkEt0TLjHQv+YrC8gy8Hr4LEYqVFOEoYJj6WYmv5RvCR7gEOo+DIbA1m051IhIATkeuDra/1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750722226; c=relaxed/simple;
	bh=46RqwPv7zk9Z/ggozMZJLfO4DJHUFMXfqd0zGKHfcb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KHWL/8iKSb+M0lvDrgZwH+TcZdgwAdg8J6vmIAeRAdjKpSJXlN4+TrJE/G3xfqFMk2LUX1zbwR5LjoKDTQ+lXsSHo+UeTGW7GFBn4WJ9b6PErtwrE5E9SXPxKt757dSq6g/6Sd/Zoo9eu/NPFZ/MEGOTieg3kGd8KdhMR/Dq098=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SLvp1zbU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SLvp1zbU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CE9C4CEEA;
	Mon, 23 Jun 2025 23:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750722224;
	bh=46RqwPv7zk9Z/ggozMZJLfO4DJHUFMXfqd0zGKHfcb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SLvp1zbUYhkSIuV6/OezF3rEyK++wIsTUD+7HwJV/DclJebuYAWK3KJ4EvOQx7FwY
	 Fb8UiN1ZHHa/5s0SBp7lpZ9mlOndsqBkF4+GMc+wm3xMPBduiT0wfQF8vVvvvt4y8n
	 VU8E/kv3iCnEJvSJNw662smvmAixxELgjj+Rmpuvi2uPLoUEuUBZq8XKyEZcpn/+A9
	 LLkWiTgc8S3gtj+hsdMderd6FpoRbWNBrmtU63kXhxffVKLGeCV/hj7mtrojP+nSHG
	 XQFeateNtWqWSPYsfqft/invtReBycxnE4SYVJ0MgOhyNnkaFmTHzyiMUqUufNbfqM
	 MsFxQhzMcigUg==
Date: Tue, 24 Jun 2025 00:43:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	=?utf-8?Q?=22Martin_Povifff=C5=A1er=22?= <povik+lin@cutebit.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Srinivas Kandagatla <srini@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 36/39] ASoC: rockchip: Standardize ASoC menu
Message-ID: <71ab54ed-b08c-4b9c-b49a-fc8453a351ab@sirena.org.uk>
References: <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
 <87plf9ybqp.wl-kuninori.morimoto.gx@renesas.com>
 <354ff629-0278-4dd1-9e73-145364abead5@sirena.org.uk>
 <87ikkmqboi.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tppNjf89R6wtjxro"
Content-Disposition: inline
In-Reply-To: <87ikkmqboi.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: Do not write in this space.


--tppNjf89R6wtjxro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 11:29:40PM +0000, Kuninori Morimoto wrote:
> > I'm not sure it's actually this patch, and I need to try to dig into
> > this more, but with at least parts of this series appled I'm seeing
> > some of the sound cards in at least the RK3399 based Renegade Elite fail
> > to probe with arm64 defconfig:

> Hmm... indeed your .config lost all CONFIG_SND_SOC_ROCKCHIP_xxx.
> But I couldn't reproduce it in my tree.

> The diff around Rockchip was
>=20
> +	#
> +	# Rockchip
> +	#
> -	CONFIG_SND_SOC_ROCKCHIP=3Dm

Yeah, that's what I'd expect looking at the diff.  Like I say I think it
might be something to do with not rebuilding the defconfig properly
during incremental builds (my automation builds things by series).  I've
got a build running without any incremental stuff.

> Lost CONFIG_SND_SOC_ROCKCHIP=3Dm is no problem. It was used just for
> menu selecting on Kconfig.

Indeed, that's gone for everything as expected.

> According to your new .config , it losts some CODEC too.
> But these should not get effect from this patch-set ?

> 	# CONFIG_SND_SOC_RT1316_SDW is not set
> 	# CONFIG_SND_SOC_RT1318_SDW is not set
> 	# CONFIG_SND_SOC_RT1320_SDW is not set
> -	CONFIG_SND_SOC_RT5514=3Dm
> -	CONFIG_SND_SOC_RT5514_SPI=3Dm
> 	# CONFIG_SND_SOC_RT5616 is not set
> 	# CONFIG_SND_SOC_RT5631 is not set
> 	CONFIG_SND_SOC_RT5640=3Dm
> -	CONFIG_SND_SOC_RT5645=3Dm
> 	CONFIG_SND_SOC_RT5659=3Dm
> 	CONFIG_SND_SOC_RT5663=3Dm
> 	CONFIG_SND_SOC_RT5682=3Dm

I think those were selected by machine drivers that got disabled but
like I say didn't fully check.

--tppNjf89R6wtjxro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhZ5qMACgkQJNaLcl1U
h9BKoQf/ewNPwFrGSRfRDhB9LX6DFUglReAJQSQZLyzanm8W1XYbwnvqLe+yPAGp
RQM562aqg0bixz4BQLMt3iAuxf0lZ2P90pwGXQ9Oe7P6jYvX3bhBDpmZ+d5sf+T/
UzX0trhZGuI37JGGCmMfv7630xAW3/orh0+UttrND6URgqIf38OAmH5NnfhU7jIh
h9KW13sf1BsdCAK1dAOGrqhToW3gLKHPN96LI9dQUvSVu3JzKa0mDJnkAsVTTo2O
vBDKhI8IjO2VgrktfacefIHXbtVnQTDKrtYrhEpw1P6t50d/Y07M2DOHUkvt8t0B
8J8s3iVAGToR/alCVVqt02c3fC9QhQ==
=bkDT
-----END PGP SIGNATURE-----

--tppNjf89R6wtjxro--
