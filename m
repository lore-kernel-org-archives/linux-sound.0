Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7FE93C3458
	for <linux-sound@vger.kernel.org>; Wed, 20 May 2026 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270945; cv=none; b=q9xFpBkd2zNrulRK/TKlGTNteWKcLlTor/5H+MkOtLGppf+/01iUndhq6r3wOY7lyOEKnvtVp820H6D8LQPvOnYbfBEAiA7s375N1IixP70iYF9ZDm4qzL+3rziZDQvRZfAF53rLss7UWVhHwukB1n1hZo69QCedMx36OVoO8aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270945; c=relaxed/simple;
	bh=3cYAqPZzzuzV42OjBeaT6KZaDZr2f/3JfI+gMFvfvE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EgR0camqYCQeNaJdOoghlnFGPhKwCxvFysLFIDWFE2Vo3KJHK9G9tqT+828UffQ7FKPYRS0ODUBMGWYl+DkR64FJRfZI6ZNoU6Q0gZ0dHu1W9ryUL3ZoCBvdapdRaWn32EKgKom0WAY2K+zz0bIALjMkn4rgr0S1mqFKJSimrWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=h9N4+Q64; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="h9N4+Q64"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=myxRvf5RQblbYQs6l8j2kCNiLwaAnbpSHzBk7M0CYc8=; b=h9N4+Q64+B267nsZP4xS7z8hIs
	hDsO4WyprvaFpr+FkEiM6tRYLBfr4j+/zRhpoL+WSOEObL8JM7/mAqy57AeZYAyNzC+qSBNJLNFDH
	ek5oBMLrin6NW6Cy1euey3+yDh9sGWy1/Srj/irrGE7vCIEVii+4dfTfx6B7wMHAp2dwcgo2EYs8J
	ISKU/2tEQkgDHL+EuJspYzD5juc2esuF6U9Qp11fcmH/kYyD3hnrudaT5cprHbKFMGI1CB6zeLOuf
	gcw2FO3Dqf6+imwe6I9ekSAWGwdGx3rJc6w5EnvDzQteitlZ/7vfQMlQTHBLwxUQm7tc4SFxpRV0o
	EhkxrcHg==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wPdeO-0005i2-0V;
	Wed, 20 May 2026 11:55:40 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wPdeN-000FyP-18;
	Wed, 20 May 2026 11:55:40 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: broonie@kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>
Cc: tiwai@suse.com, perex@perex.cz, amade@asmblr.net,
 kuninori.morimoto.gx@renesas.com, linux-sound@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH] ASoC: core: Move all users to deferrable card binding
Date: Wed, 20 May 2026 11:55:39 +0200
Message-ID: <3045975.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260430140752.766130-1-cezary.rojewski@intel.com>
References: <20260430140752.766130-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28006/Wed May 20 08:25:19 2026)

Hi,

Am Donnerstag, 30. April 2026, 16:07:52 CEST schrieb Cezary Rojewski:
> Commit a3375522bb5e2 ("ASoC: core: Complete support for card rebinding")
> completed the feature and at the same time divided ASoC users into two
> groups:
>=20
> 1) cards that fail to enumerate the moment one of the components is
>    not available
> 2) cards that succeed to enumerate even if some of their components
>    become available late
>=20
> Given the component-based nature of ASoC, approach 2) is preferred and
> can be used by all ASoC users.  By dropping 1) the card binding code can
> also be simplified.
>=20
> Flatten code that is currently conditional based on ->devres_dev and
> convert snd_soc_rebind_card() to call_soc_bind_card().  The latter is a
> selector between managed and unmanaged card-binding behaviour to keep
> non-devm users happy.
>=20
> With rebinding being the default, devm_snd_soc_register_card() takes
> form of its deferrable friend - all the devm job is already done by
> devm_snd_soc_bind_card().
>=20
> Suggested-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

This showed up in linux-next and causes a regression on my imx8mp-based
platform (imx8mp-tqma8mpql-mba8mpxl.dts).=20

On 7.1.0-rc3-00101-g56ba969925ac eveythings works as expected and sound
cards are registered.

On 7.1.0-rc3-00102-g42d99857d6f0 I'm getting these messages/errors:

fsl-asoc-card sound: ASoC: CPU DAI (null) not registered
tlv320aic32x4 1-0018: ASoC error (-22): at snd_soc_dai_set_sysclk() on tlv3=
20aic32x4-hifi
fsl-asoc-card sound: failed to set sysclk in fsl_asoc_card_late_probe
fsl-asoc-card sound: ASoC error (-22): at snd_soc_card_late_probe() on tqm-=
tlv320aic32

The clock tree looks like this:
audio_pll1_ref_sel               0       0        0        24000000
   audio_pll1                    0       0        0        393216000
      audio_pll1_bypass          0       0        0        393216000
         audio_pll1_out          0       0        0        393216000
            sai3                 0       0        0        12288000
               sai3_mclk1_sel    0       0        0        12288000
                  sai3_mclk1_cg  0       0        0        12288000
                     pll         0       0        0        49152000
                        codec_clkin 0       0        0        49152000
                           nadc  0       0        0        49152000
                              madc 0       0        0        49152000
                           ndac  0       0        0        49152000
                              mdac 0       0        0        49152000
                                 bdiv 0       0        0        49152000

Adding some debug output the offending call is
tlv320aic32x4 1-0018: set sai3_mclk1_cg to freq: 24000000

Apparently this was not happening before.

best regards,
Alexander
> ---
>=20
> This is a direct continuation of subject [1] begun by Kuninori with goal
> of simplifying the code related to card rebinding.
>=20
> [1]: https://lore.kernel.org/linux-sound/87eck7k868.wl-kuninori.morimoto.=
gx@renesas.com/
>=20
>  include/sound/soc.h    |  2 +-
>  sound/soc/soc-core.c   | 44 ++++++++++++++----------------------------
>  sound/soc/soc-devres.c | 28 +--------------------------
>  3 files changed, 17 insertions(+), 57 deletions(-)
>=20
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index a30f95ff7d86..f0935523c8df 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -425,7 +425,7 @@ struct snd_soc_jack_pin;
>  int snd_soc_register_card(struct snd_soc_card *card);
>  void snd_soc_unregister_card(struct snd_soc_card *card);
>  int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *=
card);
> -int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd=
_soc_card *card);
> +#define devm_snd_soc_register_deferrable_card(d, c) devm_snd_soc_registe=
r_card(d, c)
>  #ifdef CONFIG_PM_SLEEP
>  int snd_soc_suspend(struct device *dev);
>  int snd_soc_resume(struct device *dev);
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index e70bf22db5c9..ec141b810b50 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2165,6 +2165,7 @@ static int snd_soc_bind_card(struct snd_soc_card *c=
ard)
>  	snd_soc_fill_dummy_dai(card);
> =20
>  	snd_soc_dapm_init(dapm, card, NULL);
> +	list_del_init(&card->list);
> =20
>  	/* check whether any platform is ignore machine FE and using topology */
>  	soc_check_tplg_fes(card);
> @@ -2308,6 +2309,10 @@ static int snd_soc_bind_card(struct snd_soc_card *=
card)
>  probe_end:
>  	if (ret < 0)
>  		soc_cleanup_card_resources(card);
> +	if (ret =3D=3D -EPROBE_DEFER) {
> +		list_add(&card->list, &unbind_card_list);
> +		ret =3D 0;
> +	}
>  	snd_soc_card_mutex_unlock(card);
> =20
>  	return ret;
> @@ -2323,12 +2328,15 @@ static int devm_snd_soc_bind_card(struct device *=
dev, struct snd_soc_card *card)
>  	struct snd_soc_card **ptr;
>  	int ret;
> =20
> +	/* The procedure may be called many times during the lifetime of the ca=
rd. */
> +	devres_destroy(dev, devm_card_bind_release, NULL, NULL);
> +
>  	ptr =3D devres_alloc(devm_card_bind_release, sizeof(*ptr), GFP_KERNEL);
>  	if (!ptr)
>  		return -ENOMEM;
> =20
>  	ret =3D snd_soc_bind_card(card);
> -	if (ret =3D=3D 0 || ret =3D=3D -EPROBE_DEFER) {
> +	if (ret =3D=3D 0) {
>  		*ptr =3D card;
>  		devres_add(dev, ptr);
>  	} else {
> @@ -2338,21 +2346,11 @@ static int devm_snd_soc_bind_card(struct device *=
dev, struct snd_soc_card *card)
>  	return ret;
>  }
> =20
> -static int snd_soc_rebind_card(struct snd_soc_card *card)
> +static int call_soc_bind_card(struct snd_soc_card *card)
>  {
> -	int ret;
> -
> -	if (card->devres_dev) {
> -		devres_destroy(card->devres_dev, devm_card_bind_release, NULL, NULL);
> -		ret =3D devm_snd_soc_bind_card(card->devres_dev, card);
> -	} else {
> -		ret =3D snd_soc_bind_card(card);
> -	}
> -
> -	if (ret !=3D -EPROBE_DEFER)
> -		list_del_init(&card->list);
> -
> -	return ret;
> +	if (card->devres_dev)
> +		return devm_snd_soc_bind_card(card->devres_dev, card);
> +	return snd_soc_bind_card(card);
>  }
> =20
>  /* probes a new socdev */
> @@ -2550,8 +2548,6 @@ EXPORT_SYMBOL_GPL(snd_soc_add_dai_controls);
>   */
>  int snd_soc_register_card(struct snd_soc_card *card)
>  {
> -	int ret;
> -
>  	if (!card->name || !card->dev)
>  		return -EINVAL;
> =20
> @@ -2578,17 +2574,7 @@ int snd_soc_register_card(struct snd_soc_card *car=
d)
> =20
>  	guard(mutex)(&client_mutex);
> =20
> -	if (card->devres_dev) {
> -		ret =3D devm_snd_soc_bind_card(card->devres_dev, card);
> -		if (ret =3D=3D -EPROBE_DEFER) {
> -			list_add(&card->list, &unbind_card_list);
> -			ret =3D 0;
> -		}
> -	} else {
> -		ret =3D snd_soc_bind_card(card);
> -	}
> -
> -	return ret;
> +	return call_soc_bind_card(card);
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_register_card);
> =20
> @@ -2909,7 +2895,7 @@ int snd_soc_add_component(struct snd_soc_component =
*component,
>  	list_add(&component->list, &component_list);
> =20
>  	list_for_each_entry_safe(card, c, &unbind_card_list, list)
> -		snd_soc_rebind_card(card);
> +		call_soc_bind_card(card);
> =20
>  err_cleanup:
>  	if (ret < 0)
> diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
> index d33f83ec24f2..718165ba84ac 100644
> --- a/sound/soc/soc-devres.c
> +++ b/sound/soc/soc-devres.c
> @@ -49,11 +49,6 @@ int devm_snd_soc_register_component(struct device *dev,
>  }
>  EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
> =20
> -static void devm_card_release(struct device *dev, void *res)
> -{
> -	snd_soc_unregister_card(*(struct snd_soc_card **)res);
> -}
> -
>  /**
>   * devm_snd_soc_register_card - resource managed card registration
>   * @dev: Device used to manage card
> @@ -63,32 +58,11 @@ static void devm_card_release(struct device *dev, voi=
d *res)
>   * unregistered.
>   */
>  int devm_snd_soc_register_card(struct device *dev, struct snd_soc_card *=
card)
> -{
> -	struct snd_soc_card **ptr;
> -	int ret;
> -
> -	ptr =3D devres_alloc(devm_card_release, sizeof(*ptr), GFP_KERNEL);
> -	if (!ptr)
> -		return -ENOMEM;
> -
> -	ret =3D snd_soc_register_card(card);
> -	if (ret =3D=3D 0) {
> -		*ptr =3D card;
> -		devres_add(dev, ptr);
> -	} else {
> -		devres_free(ptr);
> -	}
> -
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
> -
> -int devm_snd_soc_register_deferrable_card(struct device *dev, struct snd=
_soc_card *card)
>  {
>  	card->devres_dev =3D dev;
>  	return snd_soc_register_card(card);
>  }
> -EXPORT_SYMBOL_GPL(devm_snd_soc_register_deferrable_card);
> +EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
> =20
>  #ifdef CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM
> =20
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


