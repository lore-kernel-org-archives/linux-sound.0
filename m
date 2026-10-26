Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006452;
	b=RdyVI0RnZpYZcJUwUURxSuKF+hZeyOCApib3xhkUZ8S04vIEGt17cZXVWJhgAOOjgTNn
	 9Kwa1eaeNTo+tTrb4j9ToiANaH+PvpFm/0onHsZ0FVmVadVGA/XWMloV1FXN6PeBTOo+H
	 bHHkIgh+hj3iORXkzQm8X8UreLYJHoVeWCnfbAZvo+5elVQ52b4WqYF2SRfEcYzmoE4yV
	 Ou/B8v7R8nr7id/ArKjenPJ8MbokWdk707mC5wuCuIBw2lzuDHdrUhx+Bt5qwVhN8XUHa
	 FnPNCucH/NjLeCk3UTpuYJLFvo/3b53RBeDqqfVCBYNKwXaWhGSFAc4NT/d2WCL0MlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006452;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Kto1H9A7gGDfrklSxjyR0v1C96BgziLV7fyNMvOc0rY=;
	b=CeLO+SbAufc702gHrLkyJvExjYwKkAoBylQphtahHcF0w9FeTL/wT3yuUE1K3LqUAJf/
	 AhD0A+jFpZk0+lqoy+voUOgtxhWFA9IGKEVsAEi9ETYErGw1zK7iMjgCk69cNW6imgwfv
	 9Adh2A/iGSXpRs13KfC/vB5ATjLlNuA57Sem1UDG1znfuh0P9zgAG7ZYkZEU98fdjuNZR
	 tE0kGsvJbkK2SDN9CCVuZhVVXHVQ2bHrGG+hyATVaSgTDx3TQCajA2o8U+DSCHMFYpt0Q
	 LVoci673UFACzO/lyC7B+vUzvZP03UVLCkjSc2667oGh+/kxoxehrJOCmZZMy8FOvtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1ua6zYh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBC6606A32A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 09:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1ua6zYh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 455C81F01829;
	Mon, 26 Oct 2026 09:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793006452;
	bh=Kto1H9A7gGDfrklSxjyR0v1C96BgziLV7fyNMvOc0rY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=P1ua6zYhsrlMrZsi3K6+s1XhXIZA0bS/WRtEgEzQkf2vnXE3wt7MRXWVcxlGVu7aq
	 zG0ipUldVLe45B636+fSzJ6hX16E6SQSkqiNOFHGt9J5al97I2YihFBt2e/eeas1O1
	 jNmeX+27h60cCwzU3uOXRssyGiqzeAfl5KMQXWCw2oO+JTB6ovxoeB450Eec/+icjw
	 o4wU6YwKisue2W6MrYMxDpVD4G7filaEcLpLr6fzZfnIHUuhkgLWYjUO7wyO2yUSn3
	 RdqEYJyhKYWBs6mMH7OQ27tCiG4PL+pDV+M7EWPLFRsDTWrB89vE+xFe+Uv1EPtW1q
	 BDl0gS3QWJVBw==
Message-ID: <sashiko-outbox-184766@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/3] ASoC: es9356-sdca: Modify the Initialization
 Configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhang Yi" <zhangyi@everest-semi.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261026064251.15017-4-zhangyi@everest-semi.com>
References: <20261026064251.15017-1-zhangyi@everest-semi.com>
 <20261026064251.15017-4-zhangyi@everest-semi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 09:20:51 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ASoC: es9356: unbalanced runtime PM put on error in es9356_sdca_io=
_init()
--

commit 60c9cfe2c366d3c665f55ff2537b8dd346fc2323
Author: Zhang Yi <zhangyi@everest-semi.com>

ASoC: es9356-sdca: Modify the Initialization Configuration

This commit updates es9356_register_init() to read the chip version register
and apply version-specific register settings during initialization. It also
propagates regmap read errors from es9356_register_init() to
es9356_sdca_io_init().

> diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
> index a22e92d1e5ccd..9c70ccd5b310f 100644
> --- a/sound/soc/codecs/es9356.c
> +++ b/sound/soc/codecs/es9356.c
[ ... ]
> @@ -840,7 +882,11 @@ static int es9356_sdca_io_init(struct device *dev, s=
truct sdw_slave *slave)
>  		/* update count of parent 'active' children */
>  		pm_runtime_set_active(&slave->dev);
> =20
> -		es9356_register_init(es9356);
> +		ret =3D es9356_register_init(es9356);
> +		if (ret < 0) {
> +			regcache_cache_only(es9356->regmap, true);
> +			goto err_out;
> +		}
>  	}
>  	pm_runtime_get_noresume(&slave->dev);
> =20
> @@ -867,10 +913,11 @@ static int es9356_sdca_io_init(struct device *dev, =
struct sdw_slave *slave)
> =20
>  	es9356->hw_init =3D true;
> =20
> +err_out:
>  	pm_runtime_mark_last_busy(&slave->dev);
>  	pm_runtime_put_autosuspend(&slave->dev);
> =20
> -	return 0;
> +	return ret;
>  }

[Severity: High]
Does jumping to err_out here cause an unbalanced runtime PM put on
slave->dev?

In sound/soc/codecs/es9356.c, when es9356_sdw_update_status() calls
es9356_sdca_io_init() on initial attachment (with es9356->first_hw_init
false) and regmap_read() of ES9356_VERSION fails in es9356_register_init(),
the error path jumps to err_out before pm_runtime_get_noresume(&slave->dev)
is called:

	if (es9356->first_hw_init) {
		regcache_cache_bypass(es9356->regmap, true);
	} else {
		/* update count of parent 'active' children */
		pm_runtime_set_active(&slave->dev);

		ret =3D es9356_register_init(es9356);
		if (ret < 0) {
			regcache_cache_only(es9356->regmap, true);
			goto err_out;
		}
	}
	pm_runtime_get_noresume(&slave->dev);

At err_out, pm_runtime_put_autosuspend(&slave->dev) is then executed without
a matching get, underflowing slave->dev.power.usage_count and leaving
slave->dev in the active runtime PM state with es9356->first_hw_init still
false.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026064251.1501=
7-1-zhangyi@everest-semi.com?part=3D3
