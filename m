Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792701582;
	b=Ag1Qb+qWRu3Dued34yZfJsOQeqqXCYZ056x31YrQ9qae8jfROGZLwpc52hW7QvIwIXV7
	 fJIsZKC2K2iuJNXy7UZYPZi8DDQl8uOu2cmQbDaH7+qhMiijKgUlOuPtUZhXa9LtlfJxr
	 4RRqaw1RCvSHYteK9J2rMeKWrwc7mqpaudAJfrWskxGVe++FqwR4wmMTgIhguUrS7uro5
	 HeOWD0pUtA2ixHXxvIfKLP/Dc59eeCfBzYjCgsfCCXZYNqqOxS3JbtXZp68FFGs6Cft6N
	 7bhdNS6w7UtBNeP6oX3AJW/oWea4jLWaETCv+9xyTUFvkST7yXNWtilvFxbcjNfalOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701582;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a3Du08Qhs+bxKqOetwG9QOfWuVZ7q6BAz1+lWDgO0ns=;
	b=qbURZ3HxhUMjUlj0B1RnIdbzpBWYJm1eXZa2S4UKaypwkJIBZxm0gP7hvEss/BsquYgr
	 vfMYvE2hVrJOuGRz9WW8U/IYOGVC2temtkHj7eVu85fP8HveL7SJm/59AZjjGqB89rW7v
	 MdaFDj7G/zF3DxqAdSjrNrJKDrIW//HpJm4A5JmPB4Y6jfuM6eBDgZYPEWU2Wq1VSwL33
	 2NiTdGa831dz8aOpmw3NjVrVcGz3hMPMeyOccXOMYXhfppulKSow+uw/P7jqHRpYLIuvD
	 AvThbbKD4L1ii9uS/g7jn3IgDzQHQwrFWISfbRRArgzhr5LfDMzOhmFaZwvpYIqcgPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aOaLzL6C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB062606A319;
	Thu, 22 Oct 2026 20:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aOaLzL6C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E83C31F01825;
	Thu, 22 Oct 2026 20:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792701581;
	bh=a3Du08Qhs+bxKqOetwG9QOfWuVZ7q6BAz1+lWDgO0ns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aOaLzL6CQs3yjXd4SrOyo9QvSsx0hl4BKNKgA3KqcaPMw+5hyMFu1Iprc7Ff134oL
	 Y/8T9eTD5a6sogUGDpNb7PGQA28/zL4T3zAnOY/Ta7eWeZt3qrudiRqaqu5Bvz+CAr
	 Ut6o0Hc7PDVmkNIjYBbAXMGGqLyhGJMuZCF/dttpZSOKFpw/ndremH6WyQfmbbiVWz
	 nD9NNOE7cNXRwXQdfKmCXJIG+uZPcZkCVvwPBmkRI5jQXcqeK90NJtBsyEJLuX+4um
	 nbsGR1Iul99pFI/cTKplIw7LtUJ8tEKZo00Nrc6/dqNtOcDF61IecBBxFLYAULpfPs
	 rOQY5GiXBz+ag==
Message-ID: <sashiko-outbox-182018@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] ASoC: codecs: twl4030: fix external mute GPIO
 lookup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261022-twl4030-extmute-v1-1-3d2dbe260df9@gmail.com>
References: <20261022-twl4030-extmute-v1-0-3d2dbe260df9@gmail.com>
 <20261022-twl4030-extmute-v1-1-3d2dbe260df9@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Oct 2026 20:39:40 +0000
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
- [High] ASoC: twl4030: broken ti,hs_extmute_gpio lookup in twl4030_get_boa=
rd_params()
--

commit 0efa5663d0f46476c9f10223a843a170f4992c82
Author: Dmitry Torokhov <dmitry.torokhov@gmail.com>

ASoC: codecs: twl4030: fix external mute GPIO lookup

This commit updates twl4030_get_board_params() to read properties from the
parent device's "codec" child fwnode and request the external mute gpio via
devm_fwnode_gpiod_get_optional().

> diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
> index 7117af5a1a569..9541c8a5a24e8 100644
> --- a/sound/soc/codecs/twl4030.c
> +++ b/sound/soc/codecs/twl4030.c

[ ... ]

> @@ -198,41 +199,53 @@ static void twl4030_codec_enable(struct snd_soc_com=
ponent *component, int enable
>  	udelay(10);
>  }
> =20
> -static void
> -twl4030_get_board_param_values(struct twl4030_board_params *board_params,
> -			       struct device_node *node)
> +static struct twl4030_board_params *twl4030_get_board_params(struct devi=
ce *dev)
>  {
> -	of_property_read_u32(node, "ti,digimic_delay", &board_params->digimic_d=
elay);
> -	of_property_read_u32(node, "ti,ramp_delay_value", &board_params->ramp_d=
elay_value);
> -	of_property_read_u32(node, "ti,offset_cncl_path", &board_params->offset=
_cncl_path);
> -	board_params->hs_extmute =3D of_property_read_bool(node, "ti,hs_extmute=
");
> +	struct twl4030_board_params *params;
> +	int error;
> =20
> -	if (of_property_present(node, "ti,hs_extmute_gpio"))
> -		board_params->hs_extmute =3D 1;
> -}
> +	struct fwnode_handle *codec_node __free(fwnode_handle) =3D
> +		device_get_named_child_node(dev->parent, "codec");
> +	if (!codec_node)
> +		return NULL;
> =20
> -static struct twl4030_board_params*
> -twl4030_get_board_params(struct device *dev)
> -{
> -	struct twl4030_board_params *board_params =3D NULL;
> -	struct device_node *twl4030_codec_node =3D NULL;
> -
> -	twl4030_codec_node =3D of_get_child_by_name(dev->parent->of_node,
> -						  "codec");
> -
> -	if (twl4030_codec_node) {
> -		board_params =3D devm_kzalloc(dev,
> -					    sizeof(struct twl4030_board_params),
> -					    GFP_KERNEL);
> -		if (!board_params) {
> -			of_node_put(twl4030_codec_node);
> -			return ERR_PTR(-ENOMEM);
> -		}
> -		twl4030_get_board_param_values(board_params, twl4030_codec_node);
> -		of_node_put(twl4030_codec_node);
> +	params =3D devm_kzalloc(dev, sizeof(*params), GFP_KERNEL);
> +	if (!params)
> +		return ERR_PTR(-ENOMEM);
> +
> +	fwnode_property_read_u32(codec_node, "ti,digimic_delay",
> +				 &params->digimic_delay);
> +	fwnode_property_read_u32(codec_node, "ti,ramp_delay_value",
> +				 &params->ramp_delay_value);
> +	fwnode_property_read_u32(codec_node, "ti,offset_cncl_path",
> +				 &params->offset_cncl_path);
> +
> +	/*
> +	 * Headset external mute can be controlled either via TWL4030's
> +	 * dedicated GPIO6/EXTMUTE pin (enabled by the boolean "ti,hs_extmute"
> +	 * property) or via a separate GPIO line ("ti,hs_extmute-gpios" or
> +	 * legacy "ti,hs_extmute_gpio"), which implies external mute is active.
> +	 */
> +	params->hs_extmute =3D fwnode_property_read_bool(codec_node, "ti,hs_ext=
mute");
> +
> +	/*
> +	 * This will attempt to parse "ti,hs_extmute-gpios" or
> +	 * "ti,hs_extmute_gpio".
> +	 */
> +	params->hs_extmute_gpio =3D devm_fwnode_gpiod_get_optional(dev, codec_n=
ode,
> +								 "ti,hs_extmute",
> +								 GPIOD_OUT_LOW,
> +								 "hs_extmute");
> +	error =3D PTR_ERR_OR_ZERO(params->hs_extmute_gpio);
> +	if (error) {
> +		dev_err_probe(dev, error, "Failed to get hs_extmute GPIO\n");
> +		return ERR_PTR(error);
> +	}
> =20
> -	return board_params;
> +	if (params->hs_extmute_gpio)
> +		params->hs_extmute =3D 1;

[Severity: High]
Will devm_fwnode_gpiod_get_optional() actually match the legacy
"ti,hs_extmute_gpio" property (with an underscore) when called with
"ti,hs_extmute" as con_id in twl4030_get_board_params()?

In drivers/gpio/gpiolib.h, for_each_gpio_property_name() constructs candida=
te
property names using a hyphen:

	if (con_id)
		snprintf(propname, sizeof(propname), "%s-%s", con_id, __gs);

When of_find_gpio() in drivers/gpio/gpiolib-of.c iterates over gpio_suffixes
("gpios" and "gpio"), it only checks "ti,hs_extmute-gpios" and
"ti,hs_extmute-gpio", and of_find_gpio_rename() has no fallback entry for
"ti,hs_extmute_gpio".

However, Documentation/devicetree/bindings/sound/ti,twl4030-audio.yaml and
arch/arm/boot/dts/ti/omap/logicpd-som-lv.dtsi specify "ti,hs_extmute_gpio"
with an underscore:

	twl_audio: audio {
		compatible =3D "ti,twl4030-audio";
		codec {
			ti,hs_extmute_gpio =3D <&gpio2 25 GPIO_ACTIVE_HIGH>;
		};
	};

When probing a board whose "codec" node uses "ti,hs_extmute_gpio", won't
devm_fwnode_gpiod_get_optional() return NULL, leaving params->hs_extmute_gp=
io
unset (so params->hs_extmute stays 0 on boards like logicpd-som-lv.dtsi, or
twl4030_get_hw_params() configures the internal pin mux in TWL4030_PMBR1_REG
if "ti,hs_extmute" is also present)?

> +
> +	return params;
>  }

[ ... ]

>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261022-twl4030-ex=
tmute-v1-0-3d2dbe260df9@gmail.com?part=3D1
