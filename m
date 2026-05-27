Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF067175D53
	for <linux-sound@vger.kernel.org>; Wed, 27 May 2026 01:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779846348; cv=none; b=enfVSGSqJXicKm2rDl8VdFRJCR/6xXeLSoxwM4gvghlRzQ7gx6NDqMOKtVUN/trznztO3ssk9rWIlCmPsyNeJf07a03cPVKm34m5U3urOjnCExOSPc61jFPclga1sF9yb8fDiattL7tWL790O3CBn5HzUlSN1QcDBZXOVYHLGzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779846348; c=relaxed/simple;
	bh=2mYmgewd7BMslu3tCqRiJ4GP1S/DibVWS/nFUuc8zwk=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=JXKWJ6OCgjXwOG8nRBUrn1f3pAiv6RgK4UNx8o90DNiS9G7cKD+1JyCE3pfDByBe3jZt7zQFUm39R2S1tFjRVOPqBtNUlOq1US0U9MnUkUGpXi6r8O47TvCGOyD+2aHY9UEpngihYGDtud0Spj5I6LqDhjzH/V8vzvuQnOe4R6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=xXHDwhgb; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="xXHDwhgb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779846320;
	bh=sZo9cv76lVB3bOJ31jC6189/dhEvGNXcaSl28AEEsSM=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=xXHDwhgbpiawIzkl9LvwKk7VE4g9+8DV1W3LG5h5huSArcHzHDkJdlTBRsqBdDNdo
	 v14YGwOQs++rXyBD2NIKIEFVw6KZAIYZeaBXFMgICqHrR8uP5mLaDYRflLbgnYtOTh
	 zSaNIsIN9E7mwNZZ5RyyY/VqKNk8Ot7yLFPtT3Nk=
X-QQ-mid: zesmtpsz5t1779846310tf18032b5
X-QQ-Originating-IP: xeXs8FTRk8ki0Iz0zNAWsB3w2Hmfu7teZWdKwgPklwM=
Received: from = ( [183.48.244.47])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 27 May 2026 09:45:03 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7616040443660953148
EX-QQ-RecipientCnt: 98
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 09:45:02 +0800
Message-Id: <DIT2UVDILYIY.35U4DGXDF7L3E@linux.spacemit.com>
Subject: Re: [PATCH 75/83] ASoC: spacemit: use .auto_selectable_formats
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>,
 =?utf-8?b?J0FsdmluIMWgaXByYWdhJw==?= <alsi@bang-olufsen.dk>, "J.M.B.
 Downing" <jonathan.downing@nautel.com>,
 =?utf-8?b?J01hcnRpbiBQb3ZpxaFlcic=?= <povik+lin@cutebit.org>,
 =?utf-8?b?J051bm8gU8OhJw==?= <nuno.sa@analog.com>,
 =?utf-8?b?J1V3ZSBLbGVpbmUtS8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpJw==?=
 <u.kleine-koenig@baylibre.com>, "Alexandre Belloni"
 <alexandre.belloni@bootlin.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>, "Arnaud Pouliquen"
 <arnaud.pouliquen@foss.st.com>, "Baojun Xu" <baojun.xu@ti.com>, "Bartosz
 Golaszewski" <brgl@kernel.org>, "Ben Bright" <ben.bright@cirrus.com>,
 "Benson Leung" <bleung@chromium.org>, "Biju Das"
 <biju.das.jz@bp.renesas.com>, "Binbin Zhou" <zhoubinbin@loongson.cn>, "Bram
 Vlerick" <bram.vlerick@openpixelsystems.org>, "Charles Keepax"
 <ckeepax@opensource.cirrus.com>, "Chen-Yu Tsai" <wens@kernel.org>,
 "Cheng-Yi Chiang" <cychiang@chromium.org>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Cristian Ciocaltea"
 <cristian.ciocaltea@collabora.com>, "Daniel Mack" <daniel@zonque.org>,
 "Dario Binacchi" <dario.binacchi@amarulasolutions.com>, "David Rhodes"
 <david.rhodes@cirrus.com>, "Fabio Estevam" <festevam@gmail.com>, "Florian
 Fainelli" <florian.fainelli@broadcom.com>, "Frank Li" <Frank.Li@nxp.com>,
 "Fred Treven" <fred.treven@cirrus.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Guenter Roeck" <groeck@chromium.org>, "Guoqing
 Jiang" <guoqing.jiang@canonical.com>, "Haojian Zhuang"
 <haojian.zhuang@gmail.com>, "HariKrishna Sagala" <hariconscious@gmail.com>,
 "Heiko Stuebner" <heiko@sntech.de>, "Herve Codina"
 <herve.codina@bootlin.com>, "Hsieh Hung-En" <hungen3108@gmail.com>, "James
 Ogletree" <jogletre@opensource.cirrus.com>, "Jarkko Nikula"
 <jarkko.nikula@bitmer.com>, "Jaroslav Kysela" <perex@perex.cz>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet"
 <jbrunet@baylibre.com>, "Jihed Chaibi" <jihed.chaibi.dev@gmail.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Kevin Cernekee"
 <cernekee@chromium.org>, "Kevin Hilman" <khilman@baylibre.com>, "Kevin Lu"
 <kevin-lu@ti.com>, "Kirill Marinushkin" <k.marinushkin@gmail.com>, "Kiseok
 Jo" <kiseok.jo@irondevice.com>, "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Kunihiko Hayashi" <hayashi.kunihiko@socionext.com>, "Lad Prabhakar"
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "Lars-Peter Clausen"
 <lars@metafoo.de>, "Liam Girdwood" <lgirdwood@gmail.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "M R Swami Reddy" <mr.swami.reddy@ti.com>,
 "Mark Brown" <broonie@kernel.org>, "Martin Blumenstingl"
 <martin.blumenstingl@googlemail.com>, "Masami Hiramatsu"
 <mhiramat@kernel.org>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Max
 Filippov" <jcmvbkbc@gmail.com>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Nicolas Frattaroli"
 <frattaroli.nicolas@gmail.com>, "Nicolin Chen" <nicoleotsuka@gmail.com>,
 "Oder Chiou" <oder_chiou@realtek.com>, "Olivier Moysan"
 <olivier.moysan@foss.st.com>, "Paul Cercueil" <paul@crapouillou.net>,
 "Peter Rosin" <peda@lysator.liu.se>, "Piotr Wojtaszczyk"
 <piotr.wojtaszczyk@timesys.com>, "Qianfeng Rong" <rongqianfeng@vivo.com>,
 "Ray Jui" <rjui@broadcom.com>, "Richard Fitzgerald"
 <rf@opensource.cirrus.com>, "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Samuel Holland" <samuel@sholland.org>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Scott Branden" <sbranden@broadcom.com>, "Sen
 Wang" <sen@ti.com>, "Sharique Mohammad" <sharq0406@gmail.com>, "Shenghao
 Ding" <shenghao-ding@ti.com>, "Shengjiu Wang" <shengjiu.wang@gmail.com>,
 "Steven Eckhoff" <steven.eckhoff.opensource@gmail.com>, "Support
 Opensource" <support.opensource@diasemi.com>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Takashi Iwai" <tiwai@suse.com>, "Thierry Reding"
 <thierry.reding@kernel.org>, "Tim Bird" <tim.bird@sony.com>, "Troy
 Mitchell" <troy.mitchell@linux.spacemit.com>, "Tzung-Bi Shih"
 <tzungbi@kernel.org>, "Venkata Prasad Potturu"
 <venkataprasad.potturu@amd.com>, "Vijendar Mukunda"
 <Vijendar.Mukunda@amd.com>, "Vishwas A Deshpande"
 <vishwas.a.deshpande@ti.com>, "Vladimir Zapolskiy" <vz@mleia.com>, "Xiubo
 Li" <Xiubo.Lee@gmail.com>, "Yixun Lan" <dlan@kernel.org>, "Zhang Yi"
 <zhangyi@everest-semi.com>, <linux-sound@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <8733zfj5jj.wl-kuninori.morimoto.gx@renesas.com>
 <871peygb2c.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <871peygb2c.wl-kuninori.morimoto.gx@renesas.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NUj8dsn1QG0ZHyONfz0b0sdeM9KiF85szB5RKmgQbYJ+1CndyF4ZBrNw
	LkPmCBq/wa1kORrDc+RNIbSz/hZLhB2flYC7TBMPjR+bVyIBSLFKdQqq+O0rYGYZoJ8JwNU
	mvPrZZ29HCQp2HQLVSPioqgxvV+sPm9imAk77tLnCn4RndxSUbDZMm/7L4oYggMjLyypIxc
	j+UaQXVNq74D4Ypd4X4P4ZlEAICMrIG5hKDkLSFCkrnhcyv0kRVpe1B4FGl0r0Hf/cm2lZz
	6DJbWELfmdEe/Ok3nS9iY/EhsB3l290uFwlZoF0i0QD22JhITd57meiNRq3ujDGkbGnxoIj
	AwPdxU1IO5uZFCps6AQqVS8KkxfdrQcuD9eX3NU7O95Pi0K/dWw6/q6e0xZDJLE3RzHf46z
	Rr8DfCtacBzpQOvlDWEnFDKblRMjheA4BSBY1I4IgOOz9bqsMZZUDLf3BaYbPFzHbsgVgLG
	91Am+4UDUqhg/Qz1SekrlJf74NmoBWSxzQiCgobJmS8B/tdoWIm+1ZEy38Tq4Kco/gTpgSd
	x3B9N6paBi332wprAPJLYgXZo8BgLoGbrE6sDWlXAxh8bGMwl4HfN5qELdeIUVK7X71Yshw
	nhyBPpbvCV3eAyn6HLRqABXnUlrdm92UXhLZV2duLAr6cPg5i8oOdR1NBJt+3pYK/9PLk1I
	/sCudQBNzUpOt7u4ZFpqJyUeM4ez5D4SsKj0M+z507QTDQuVhgckz4f+l8LTrChkbCudvpf
	xpqvn8IjbNfaNOo3KUemwyPeznVrOMkT53tYhG8YJ5yo+LOij297KslltzCoafIpm6t2gWb
	fI/vx+eftj+Q5FKFVBMG4KGYTMws4TSEv40l6jXGYjZaW/2zAecsdsZDNCfAbLQ2OqjEpQM
	fL/dngeIqSckgpdATNQnyfR4wLRFGVT1WV78wFH480ystcqNIONQrprCFZ8TYUsWyjopbXm
	8zNrUeR902/0bAYWkl/Hj80Pqf73b4lluCiY4AEqHxM1CyJVd1yzxA8oBnX2OZHwX3t9CHN
	KzYyuCazL+jDWO4PXzmWZe1c40a5tT/ysRVObLYaPjpKhrew7I
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On Tue May 26, 2026 at 10:27 AM CST, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
>
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  sound/soc/spacemit/k1_i2s.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/spacemit/k1_i2s.c b/sound/soc/spacemit/k1_i2s.c
> index 5420ca2aefbd8..5a7b6d89efde1 100644
> --- a/sound/soc/spacemit/k1_i2s.c
> +++ b/sound/soc/spacemit/k1_i2s.c
> @@ -317,6 +317,11 @@ static int spacemit_i2s_dai_remove(struct snd_soc_da=
i *dai)
>  	return 0;
>  }
> =20
> +static const u64 spacemit_i2s_selectable_formats =3D
> +	SND_SOC_POSSIBLE_DAIFMT_I2S	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
> +	SND_SOC_POSSIBLE_DAIFMT_DSP_B;
> +
>  static const struct snd_soc_dai_ops spacemit_i2s_dai_ops =3D {
>  	.probe =3D spacemit_i2s_dai_probe,
>  	.remove =3D spacemit_i2s_dai_remove,
> @@ -325,6 +330,8 @@ static const struct snd_soc_dai_ops spacemit_i2s_dai_=
ops =3D {
>  	.set_sysclk =3D spacemit_i2s_set_sysclk,
>  	.set_fmt =3D spacemit_i2s_set_fmt,
>  	.trigger =3D spacemit_i2s_trigger,
> +	.auto_selectable_formats =3D &spacemit_i2s_selectable_formats,
> +	.num_auto_selectable_formats =3D 1,
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
