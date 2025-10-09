Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEF92D193B
	for <linux-sound@vger.kernel.org>; Thu,  9 Oct 2025 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759998806; cv=none; b=jaoiuZVW+pzIuirolnwmeR7HwxGEayQ+bWPABtp2EqlnorlaR5dSPBdhFq/PcCevVZuJUl6Wh4Wy5lg+7eQBv+rw6tt4c1sxl1uJ9SVLS73Utu4CfF0awZfsVGF893RfdKoxLVXoCxs8nie1Uv+7mmUS9CWgN3E1GxvZE/9Ckt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759998806; c=relaxed/simple;
	bh=FkgfL5hEZw22IBlQNg8l9AFLwLElrRRwuB0p9DnsprY=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SBed8M7np3j5rfHqQEQ1mGl52joVUkBLxPWe7SawMSER2Tz5h65BonfoCNwOzmii5f3mDrjTYVWk3xa7J16+HH7wG07PP9SmFua9VfxgsmuXc5Pg4q16U2emcL5JNWqYN61LyakZAKU7GUNKixkiYWozZ58xZpGilgIdqGtg/lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6m5O-0003Sm-O3; Thu, 09 Oct 2025 10:33:18 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6m5N-002hdG-0f;
	Thu, 09 Oct 2025 10:33:17 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1v6m5N-000000002X0-0b2j;
	Thu, 09 Oct 2025 10:33:17 +0200
Message-ID: <4a3266af045b81ab4ae7826db890d5f7333227f4.camel@pengutronix.de>
Subject: Re: [RFC PATCH] sound: airoha: add support for AN7581 PCM driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Christian Marangi <ansuelsmth@gmail.com>, Jaroslav Kysela
 <perex@perex.cz>,  Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
 upstream@airoha.com
Date: Thu, 09 Oct 2025 10:33:17 +0200
In-Reply-To: <20251003015521.2244-1-ansuelsmth@gmail.com>
References: <20251003015521.2244-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-sound@vger.kernel.org

Hi Christian,

On Fr, 2025-10-03 at 03:54 +0200, Christian Marangi wrote:
> The Airoha AN7581 SoC have alternative Sound Card that expose PCM OPs
> dedicated for VoIP application.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  sound/Kconfig             |   2 +
>  sound/Makefile            |   2 +-
>  sound/airoha/Kconfig      |   9 +
>  sound/airoha/Makefile     |   3 +
>  sound/airoha/an7581-pcm.c | 637 ++++++++++++++++++++++++++++++++++++++
>  5 files changed, 652 insertions(+), 1 deletion(-)
>  create mode 100644 sound/airoha/Kconfig
>  create mode 100644 sound/airoha/Makefile
>  create mode 100644 sound/airoha/an7581-pcm.c
>=20
[...]
> diff --git a/sound/airoha/an7581-pcm.c b/sound/airoha/an7581-pcm.c
> new file mode 100644
> index 000000000000..bf1fc447aed4
> --- /dev/null
> +++ b/sound/airoha/an7581-pcm.c
> @@ -0,0 +1,637 @@
[...]
> +static int an7581_pcm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct an7581_pcm_priv *priv;
> +	struct snd_card *card;
> +	struct snd_pcm *pcm;
> +	int irq;
> +	int ret;
> +
> +	ret =3D snd_devm_card_new(dev, 1, "AN7581 PCM SOUND",
> +				THIS_MODULE, 0, &card);
> +	if (ret)
> +		return ret;
> +
> +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	priv->map =3D device_node_to_regmap(dev->of_node);
> +	if (!IS_ERR(priv->map))
> +		return PTR_ERR(priv->map);
> +
> +	priv->reset =3D devm_reset_control_get_exclusive(dev, "pcm1");

Is there more than one reset input per PCM module?
Lookup by name is only needed if there are multiple resets.

This question should be answered by a device tree binding document for
airoha,an7581-pcm.

regards
Philipp
