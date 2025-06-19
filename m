Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64CDB223DF5
	for <linux-sound@vger.kernel.org>; Thu, 19 Jun 2025 10:47:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750330081; cv=none; b=fA+jGaYxqpqm+1uwbO5sYd/g8LRhNKJarnKsg7luii5fk4N7jjNtiJUy4ceKUZQxHkC4DucsI5hYIJJCknyVWYswQIH4UA6gyCvj3b/mbGk8p2boyUi7v4VU65Rr5rfQGmo+EDYtEJazCJeT0IrZ+EdhVsh/S8ttwgenuEB7fRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750330081; c=relaxed/simple;
	bh=REVJxLVRR7MIPpA6VWc/TUpLa/YzgMJ3+k4M9mPgv5Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IZrvEeFVEOOPM2i10wG0GgzmaG9IblWYqAZAZhtOlKrJtWujXnlh41yRRExuUPR+hyT0RyBIxfl9DMDDa5cyCE+rI1IflbFYGQt6pdS4ScGLHYjQfh2AKxtuyX51dQgVJaNORk8zow6Za4gK9YR1Zuh6d/iY7OQVIDSgQRZoC1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=ys9/Pj8v; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="ys9/Pj8v"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+K3q0R3yVJbx0VEgrYinZfRA4w5iGfCKX1RacFQYGUo=; b=ys9/Pj8vrwLoYjI1Acr2WEWdOf
	ou29IG5vBvyhwPe1oLjjgsTf9cZm9DrtTdc0YSsRLLMYaStgpUrtnmYGCz8/u0AWru79damZeJ9x6
	5/2osksXoE4Yh5TsYjE7nzNgiKOVb2cpo5rIEHRb+37PDf3DsjDK2LjdodU8DmGfafbAUBP6mrmVe
	VNBocykbo/wI/jN/Zhhpv7oVqnXCTjlSxdwPukoLpFFF0MT4hIrYGyFzULYlROa4AiYZM6skJGUql
	fHZVARdSQrkkqgy/PEUx6nL/3OxfqB1szNsTDztvfV6urpoUAKI+q69Y+Qrjd5RHIzepXAuFG8k+T
	9R7Ph80Q==;
Received: from 85-207-219-154.static.bluetone.cz ([85.207.219.154] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uSCnG-0000BW-AP; Thu, 19 Jun 2025 12:46:54 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Martin =?UTF-8?B?UG92aWZmZsWhZXI=?= <povik+lin@cutebit.org>,
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
 Paul Cercueil <paul@crapouillou.net>, Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Srinivas Kandagatla <srini@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Olivier Moysan <olivier.moysan@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
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
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 36/39] ASoC: rockchip: Standardize ASoC menu
Date: Thu, 19 Jun 2025 12:46:52 +0200
Message-ID: <14155423.dW097sEU6C@phil>
In-Reply-To: <87plf9ybqp.wl-kuninori.morimoto.gx@renesas.com>
References:
 <875xh120u3.wl-kuninori.morimoto.gx@renesas.com>
 <87plf9ybqp.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Donnerstag, 12. Juni 2025, 03:44:46 Mitteleurop=C3=A4ische Sommerzeit sc=
hrieb Kuninori Morimoto:
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drive=
rs
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
>=20
> Let's standardize ASoC menu

nit: maybe write that as
  Let's standardize the Rockchip ASoC entries to a menu style
to name the actual change being done?


> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


