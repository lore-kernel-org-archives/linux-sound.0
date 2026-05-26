Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA2F3C769E
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 22:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779836144; cv=none; b=fWPR528xNISV3NFrnLGHB62R7iUCU4Cw7JOYKYeEBjrXmE3hZUcGFyD2EWxRzaJ3A8+aRmix8uT7Ar77YMPeYfZyrBNCnkJ4x3YI6ky232dbDmV9MCmqrylqO9bjTISEdl0PRPTogs+Oyw8pfBQbcVbLmvo7XY3ljLg2ZqF2pqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779836144; c=relaxed/simple;
	bh=mFFZyV34L3Nu/uik88Dw56TJBvgieIGBe+jl7s1EZnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cMHO1zI3Lzt52UN4hAFX3B12UR0WZ4q6OEZgKI2HKZVx5GBfrmThto01IUkXOkmMJEbUqReJoBHRpu6Wu6L4NL3X2l9HNZRH/lg9Ix/T+CGEyu8x/Pxun+0oVyeqPaAreG2EFSM8EcdoZWVDwvt7cK8w9dRtTfScETLUVcwdPGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KheLNs1r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KheLNs1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D28D1F000E9;
	Tue, 26 May 2026 22:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779836143;
	bh=FqA95nSIxYqzAlY09OsO/D9lWDffVZ+DXEdyL+oNPng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KheLNs1r8TMD3vuqTJXeb50mHFvBE2KExZuy4sY+7g90ezOv2f6/Tgg+I8uMcZiqj
	 TShp88xBmHBPJLKwVzen+EbH2tZfyPxwwrbCGYOnOiDOBV0Wp3Nih1M1knkTtUIQSF
	 TMUVvEmt4Tv77dWnMzXFGInO+ero76w3OLC5szD83vUQRJwJY/SnZ7Hlp3lWNS40Cw
	 HRqLphrjsghPkrWXoJSWODiO4wytUkri4Fs/2a8rww44jz3CFJkeBEUtCG/V1bNMSU
	 l9fQns8b+Nz6mxxHj/js2JsHZNkeM/9bauhG83gq8vQTbBpjpjuiEwxo5zt3tXuXsK
	 9ncI19fTz0O9w==
Date: Tue, 26 May 2026 23:55:24 +0100
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
Subject: Re: [PATCH 25/83] ASoC: codecs: cpcap: use .auto_selectable_formats
Message-ID: <21d2e424-5eeb-497f-8f5f-f8cf57a6e5e8@sirena.org.uk>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
 <871peyj4sv.wl-kuninori.morimoto.gx@renesas.com>
 <57bedd7f-dec1-4b61-8a94-d858297ef3f1@sirena.org.uk>
 <871pexaizq.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qW7ZKP48Tph/h1O4"
Content-Disposition: inline
In-Reply-To: <871pexaizq.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: You are fairminded, just and loving.


--qW7ZKP48Tph/h1O4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2026 at 10:44:41PM +0000, Kuninori Morimoto wrote:

> > > +/* FIXME: non I2S ? */
> > > +static const u64 cpcap_selectable_formats =
> > > +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_AC97	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_PDM	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> > > +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;

> > 	/*
> > 	 * "HiFi Playback" should always be configured as
> > 	 * SND_SOC_DAIFMT_CBP_CFP - codec clk & frm provider
> > 	 * SND_SOC_DAIFMT_I2S - I2S mode
> > 	 */
> > 	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {

> Thank you for pointing it.
> The reason of above formats is it cares I2S or others.
> AC97/PDM are not handled as error here.

...

> I'm not 100% sure about this codec, but should v2 ommit AC97/PDM ?

Pretty sure, yes.

--qW7ZKP48Tph/h1O4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoWJNsACgkQJNaLcl1U
h9Agnwf/XHueofH5CWAvwEmnI5d8dBqca7qXFlE/nCaNbedif8Ei3y2W2UQVnz9C
rQN5zeI+p3PzJUpPbwtv0/BfmhyLvwX8Y9XLjWivxHa6MkaFpQ+e0d7cQgAynbjG
2UY5n7eOPRwfTtwvmbst6vR9hdTqAZqBqeuboLHfQQvsmo8hrlPMry6FGJLVrEPB
1iduWyb/GRlThpnQ72r3HHobD41Eu1wC+8h8/MQkX6li3fxmJi4kiqUTZaQV+/cf
xq8x2mG5k5gwT1mjGc874+r2F/McGYQonTRfn0ZBzKd39T1ZSmB71wQRCNM2BD67
86+4loi5SbbQdPFGNyJ6Ur5CuZVaTQ==
=iOiF
-----END PGP SIGNATURE-----

--qW7ZKP48Tph/h1O4--
