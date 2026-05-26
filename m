Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868093B7B91
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 18:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779820191; cv=none; b=lrNsEbmChWfgs6VUCgiMNv3X9jmINaFjCMad9weWDiFr7lWzGVCwY9EE2EfWr+7Q4AqUHm5QXak8xpBhaJqA9/c5SYgUlji99AssQ3wV0lfNUl2txv+WbQ36C9FMdzz+bJ5YCKGVsl8/4dw7dRtNUrNBypRtzShC0KsFsuWlZPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779820191; c=relaxed/simple;
	bh=JBi2HK3+2QD2C6A6czIUfc7+B0/8tP9szO3tmargbo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loMpWP4gKn/MC/R879LcWUCPruhqDS/mdaXnvMRdDvCi7rS8738ykPBiVM8NE5ECFtbN56XQQJwmKyP/KLKWhxENP33Ms6tXDXD5M+bR4lRg62xlayeN5WQM+YqAPzKDnveq+wfgCbFW0S/LnRCZ4zxa+rMIkZEzBZCN6hBwOts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MICjcpQQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MICjcpQQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43CEB1F000E9;
	Tue, 26 May 2026 18:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779820190;
	bh=RXTmzJ+YS8oRkZKXEhssFv1OgBCHQJCN6xYpFIA+7/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MICjcpQQqs7hmBQZRllbwbYnw+zfSHuoZHk1DDYWPRkXwJe/jLWFlvGggb/Uv4JtZ
	 Q4qqgTP0ywtNjXThPzbz/h9/qC6bJJeeJBjmxMls59wnLbY7Ui4LbzHS7Dph1z40A9
	 hwIjs+uB+4X3ykFr/0QSDu/fXl0rb2wJKqJUd3/gDQlspgDZRg+jLvLmmdERwmfnPO
	 a4g5JU2ExQwg3vJ+oRmARqeH7X6Wzb5/nrkOZLBDtxg8vfagry1YbTiog33vrbmPgU
	 9yBkfWrLCmUuBZkPggThg+fKRTYV2xDN08ctCP+APAMfxbQZoVbKXNU8sE5fNTBQKD
	 DI2epxTmYTRyQ==
Date: Tue, 26 May 2026 19:29:31 +0100
From: Mark Brown <broonie@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?utf-8?Q?=22Alvin_=C5=A0ipraga=22?= <alsi@bang-olufsen.dk>,
	"J.M.B. Downing" <jonathan.downing@nautel.com>,
	=?utf-8?B?Ik1hcnRpbiBQb3ZpxaFlciI=?= <povik+lin@cutebit.org>,
	=?iso-8859-1?B?Ik51bm8gU+Ei?= <nuno.sa@analog.com>,
	=?iso-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?= <u.kleine-koenig@baylibre.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Baojun Xu <baojun.xu@ti.com>, Bartosz Golaszewski <brgl@kernel.org>,
	Ben Bright <ben.bright@cirrus.com>,
	Benson Leung <bleung@chromium.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Bram Vlerick <bram.vlerick@openpixelsystems.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Daniel Mack <daniel@zonque.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Fabio Estevam <festevam@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>, Fred Treven <fred.treven@cirrus.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guenter Roeck <groeck@chromium.org>,
	Guoqing Jiang <guoqing.jiang@canonical.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Herve Codina <herve.codina@bootlin.com>,
	Hsieh Hung-En <hungen3108@gmail.com>,
	James Ogletree <jogletre@opensource.cirrus.com>,
	Jarkko Nikula <jarkko.nikula@bitmer.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kevin Cernekee <cernekee@chromium.org>,
	Kevin Hilman <khilman@baylibre.com>, Kevin Lu <kevin-lu@ti.com>,
	Kirill Marinushkin <k.marinushkin@gmail.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	M R Swami Reddy <mr.swami.reddy@ti.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Peter Rosin <peda@lysator.liu.se>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>, Ray Jui <rjui@broadcom.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Scott Branden <sbranden@broadcom.com>, Sen Wang <sen@ti.com>,
	Sharique Mohammad <sharq0406@gmail.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Tim Bird <tim.bird@sony.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Vishwas A Deshpande <vishwas.a.deshpande@ti.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
	Yixun Lan <dlan@kernel.org>, Zhang Yi <zhangyi@everest-semi.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH 59/83] ASoC: codecs: wm*: use .auto_selectable_formats
Message-ID: <1bbeb467-cf1a-4403-9ef3-62bc9006f47c@sirena.org.uk>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
 <87o6i2gb9h.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QjV2cPvMkFZjoaeh"
Content-Disposition: inline
In-Reply-To: <87o6i2gb9h.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: You are fairminded, just and loving.


--QjV2cPvMkFZjoaeh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 02:22:52AM +0000, Kuninori Morimoto wrote:

>  			SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
> =20
> +static const u64 wm8737_selectable_formats =3D
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_AC97	|
> +	SND_SOC_POSSIBLE_DAIFMT_PDM	|
> +	SND_SOC_POSSIBLE_DAIFMT_GATED	|
> +	SND_SOC_POSSIBLE_DAIFMT_CONT	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;
> +

This is way more than the device supports, AC'97 and PDM both jump out:

   https://www.mouser.com/datasheet/2/76/wm8737-519090.pdf

Looks like we need a bit more checking of the formats.

--QjV2cPvMkFZjoaeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoV5osACgkQJNaLcl1U
h9DkHwf6AkmhvynwHtdS4NWLE0cSM5NM0VPyQei3zoWkBQlhYH7kMvGc/jMGCwtK
4Hw4EbtyTPlOWZdJpYIuKHZpBf9jyBG3IzJIVzsvIlKECIts2y/oNbGSkaebttO/
fogowwlQ/O0VoJW8DJUf//qChgn5ycXBU+zrPOKl2QitLbB1mHEKkCAsP2VmsrFJ
44xeiBdAKOro7/4zAkNFpfx5JEIeU2TZjgbWTb6vVS485lX5WxghklXnL/svZS0K
Ai344IEVKTj+RbZeh2Hp/BS+DYl3cyb1Rk/5IvZ+x71EuLFpxSo9c9udcNBDwISr
afudj9vWfLIsghcgzgHFhspAUv9fQQ==
=SUv1
-----END PGP SIGNATURE-----

--QjV2cPvMkFZjoaeh--
