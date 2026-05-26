Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA9C41B340
	for <linux-sound@vger.kernel.org>; Tue, 26 May 2026 18:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779819994; cv=none; b=eQTMu98A3d3K2g9VHewTo8Q1Ztq9U7tO4zHjxLOWe/vtgpclV4n0eLSBosxbzRQjLUbBocIZ/NOP5L20W1pJ2DdRIwlxuQLQdLEaZm0QvazHO7EEAw0gxpeYUUi9yL6F+kewpyeeX13EtOVh0Xe5V63a9ysPdDLaxGL5fVuOEAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779819994; c=relaxed/simple;
	bh=HSl8iFAqpRFbFun0BeSdeLg/ZrV76LjXpVGW1mqZVCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRdiU9EdF59cu0sB1Ch+JrIpBKwKNLwS1QEMaOdXk4qwWhyEGJt42hz1vjZGXTjSZkz9mRXSmf9QwdwgGdgd8hDRlinr3qrur/E0T2P1mLlOV1MSsjaiGqYTtxSm3aJyD58KOYSzTY0vn/yRPBkTHtMef1DT5OuBT3AU67fyUR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z6xAPmiS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z6xAPmiS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C0B1F000E9;
	Tue, 26 May 2026 18:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779819992;
	bh=QeEYI5AVTlPl6B4AG2fWPgXIEpO4KIpUnUoqTxjVp5Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z6xAPmiS4Mt4rO3wnfFjNW+0xqHtkZnuFLiEn0ZHRJCQho0FLTmy/ikPbssialt2S
	 f4v+qIiHwnAOQaeyQDM2d7SHGIbqbX5NHNzqPeODljFWypqzhZ7FtwmNkjD1LARwWE
	 YdCoV8cdcLmXgSfPnQULARqYHH/HZFioz0IYwgvlI5tQRdNWUqrq/xvW278wT24hlI
	 X0s32Q0dshGdqFG9Jx1/bd0PBAVsCQFgj2Wij6wum8C6ohN4Ph514/MJQFvHLq6JLU
	 4CNOr76hFGTN6WmpOjAP5XqvlSv457IJUAHBZ77JJ8PP2ZpaNbOKc9q9spotKd0rum
	 bE8sdQUtCqthw==
Date: Tue, 26 May 2026 19:26:13 +0100
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
Message-ID: <57bedd7f-dec1-4b61-8a94-d858297ef3f1@sirena.org.uk>
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
 <871peyj4sv.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TWZo2NYiyMOYBcwl"
Content-Disposition: inline
In-Reply-To: <871peyj4sv.wl-kuninori.morimoto.gx@renesas.com>
X-Cookie: You are fairminded, just and loving.


--TWZo2NYiyMOYBcwl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2026 at 02:14:08AM +0000, Kuninori Morimoto wrote:

> We can use .auto_selectable_formats. Let's adds it.

> +/* FIXME: non I2S ? */
> +static const u64 cpcap_selectable_formats =
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B	|
> +	SND_SOC_POSSIBLE_DAIFMT_AC97	|
> +	SND_SOC_POSSIBLE_DAIFMT_PDM	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_NB_IF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_NF	|
> +	SND_SOC_POSSIBLE_DAIFMT_IB_IF;

I would be astonished if ths supported AC'97 or PCM.  There's a comment
saying:


	/*
	 * "HiFi Playback" should always be configured as
	 * SND_SOC_DAIFMT_CBP_CFP - codec clk & frm provider
	 * SND_SOC_DAIFMT_I2S - I2S mode
	 */
	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {

--TWZo2NYiyMOYBcwl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoV5cQACgkQJNaLcl1U
h9AFcAf8DcWZGMa3gLPQiEZ3jdJjpsMYsWdXe5G/O2YhcmuuAaj1mHCqgJzthHXA
2hOSIlRY/+MBfSgeriIkccNZSzgD18bZm4cBUmSIPxMZ8jVMetUZkULA5ezmBSyh
APRn/607QIyHBuS2KwtLX/BfXccpBaVImnCJ1VVra9zFzQEihKd7GS5ryiGBPUV/
fPeKMLK5Amf0SKtg5f0sD2oltD+hC2YetPVmBaUjNQgu+13OAtXiSmbM2iRSU2us
yMRb9Jekjaay92z5kRWMnY4A5eC3rKpzARSZ3kLd0fc4o9XvHjHNTPH0wAr87Cph
w3zj4joISA2QRrkhDhWyMgSUL79lBg==
=5iYm
-----END PGP SIGNATURE-----

--TWZo2NYiyMOYBcwl--
