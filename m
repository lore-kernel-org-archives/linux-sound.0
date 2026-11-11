Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794419267;
	b=cjLQxGr+arASDEFVMwM5NAJW9Y4MaTU+3oqzoZe6acAaZiolp3jae0L6n5i3Eyxxx7F2
	 WIhZf3ExCKO8fsDf0bcrXqV3XuZg8LvC3rKVgA4vsdJTyFUZvLoCM1MqB1WmYH3EzS6Ag
	 EaVHyfDN1kACTwyWtBxYTz0wPSNDqPyGI0llS9Qns4b6JgwUv2isAYh7WeWTdNU3hveJ9
	 6XrocGkH5goYUNXvV4SXTgxegDePUEhvx/4IP8sdwW/wm9GdpeK7tBa9KiXqZ29Ot941z
	 8ZacuaDb+C0asVeJKG5Ya1zJgM8bu9GxRArTP7OtWSyv1KIa8+/MIHajygU3WIE9i0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794419267;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YEF+3XQuh6CioDWZgE6K4DJfsOU1qsu3awZ/trTV0mI=;
	b=aoRk+54OI3SHcSJgWepQsSaslgiEAjNpEzZ1j0eNYVNgXuRTyEsu7AL0x/O0u+An9Xjw
	 sU4UU7nRhUCH3yu6zpG4tYvY3aWJvtU6So9SiEIjz6bPXTVgLK8bw+tefZEbvdotiWe5Y
	 DmVTfcVhUD8sq/Dax9MpnlVw3BNgG9qzL8Fpe4jjiIYO9OxRsL84kcYT42GBo493xqkQ9
	 JtHSHi22JquA37n5nGzZ8P41JIwrYbSgHVyb88AkIalNdJ7n7g2wW9Uggx9u6e363ig/0
	 ffTF3CVb3lkytuV0fEDc/pfZWNBYtv/qTlyGa3bwNZXSMSEQtBSWSXFeZ4HP2IMfaqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fb+mq6sc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD533606A326;
	Wed, 11 Nov 2026 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fb+mq6sc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE05B1F00A05;
	Wed, 11 Nov 2026 17:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794419267;
	bh=YEF+3XQuh6CioDWZgE6K4DJfsOU1qsu3awZ/trTV0mI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fb+mq6scb293KyuROgecG+KC6M+VW9ykL+OzGdG2SRJZ2DLWh7VwccGnSUJlhVbbA
	 KnrDeoh/tohDYX1x81R8Zv5O0CWcjpn5RYQpwUEog8z1J9d6HdGCE/84SDB8wZhx9P
	 e5L8gxyC+knuKu8UmJt42w0GU36DdDQ/luddipAZN7QOF5CxhHgrwwU77HadUyBesC
	 Ot5oidnr0CZ5KvVq08PbAteUR3fOOZE6j79ShiKdOmhXgq6vHmptt5QcRztzJ9dgoX
	 quGeVypwkQRxDg/N4jSJX/1ZGnv90NrxPn9FThIMRNCRXtJUcCX2jodSD6rvnZ4Crx
	 cYl20L1WKc/wA==
Message-ID: <sashiko-outbox-209438@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] ASoC: cs42l43: Update load detect procedure for
 cs42l43b
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261111171032.1491717-3-ckeepax@opensource.cirrus.com>
References: <20261111171032.1491717-1-ckeepax@opensource.cirrus.com>
 <20261111171032.1491717-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 17:47:46 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] ASoC: cs42l43: cs42l43_run_type_detect() treats invalid
  status as headset
- [Medium] ASoC: cs42l43: CS42L43B_LOAD_DET_SEL cached due to unread
  regmap_write()
--

commit 2f8a25cd3cc97db982b37853fb39365ad8d29795
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

ASoC: cs42l43: Update load detect procedure for cs42l43b

This commit updates the headphone load detection procedure to pass the
detected jack type into load detection and configure CS42L43B_LOAD_DET_SEL
on newer chip variants.

> diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-j=
ack.c
> index a2555dd9229e3..b3f89c712ed93 100644
> --- a/sound/soc/codecs/cs42l43-jack.c
> +++ b/sound/soc/codecs/cs42l43-jack.c

[ ... ]

> @@ -526,14 +533,36 @@ static void cs42l43_start_load_detect(struct cs42l4=
3_codec *priv, bool mic)
>  			dev_err(priv->dev, "Load detect HP power down timed out\n");
>  	}
> =20
> -	if (mic)
> -		regmap_multi_reg_write_bypassed(cs42l43->regmap,
> -						cs42l43_4pole_patch,
> -						ARRAY_SIZE(cs42l43_4pole_patch));
> -	else
> -		regmap_multi_reg_write_bypassed(cs42l43->regmap,
> -						cs42l43_3pole_patch,
> -						ARRAY_SIZE(cs42l43_3pole_patch));
> +	switch (cs42l43->variant_id) {
> +	case CS42L43_DEVID_VAL:
> +		switch (type) {
> +		case CS42L43_TYPE_3POLE:
> +		case CS42L43_TYPE_OPEN:
> +			patch =3D cs42l43_3pole_patch;
> +			size =3D ARRAY_SIZE(cs42l43_3pole_patch);
> +			break;
> +		default:
> +			patch =3D cs42l43_4pole_patch;
> +			size =3D ARRAY_SIZE(cs42l43_4pole_patch);
> +			break;
> +		}
> +		break;
> +	default:
> +		patch =3D cs42l43_4pole_patch;
> +		size =3D ARRAY_SIZE(cs42l43_4pole_patch);
> +
> +		switch (type) {
> +		case CS42L43_TYPE_OMTP:
> +			regmap_write(cs42l43->regmap, CS42L43B_LOAD_DET_SEL, 0x89);
> +			break;
> +		default:
> +			regmap_write(cs42l43->regmap, CS42L43B_LOAD_DET_SEL, 0x98);
> +			break;
> +		}
> +		break;
> +	}

[Severity: Medium]
Does writing CS42L43B_LOAD_DET_SEL via regmap_write() here and in
cs42l43_stop_load_detect() cache the register in REGCACHE_MAPLE and cause
every subsequent regcache_sync() in cs42l43_runtime_resume() to re-write
it to hardware?

Commit "mfd: cs42l43: Add load detection register needed for cs42l43b"
added CS42L43B_LOAD_DET_SEL to cs42l43_precious_register() (which
cs42l43_volatile_register() also consults), but did not add it to
cs42l43_readable_register().  Because regmap_volatile() returns false for
non-readable registers when format_write is NULL, regmap treats
CS42L43B_LOAD_DET_SEL as cacheable, and with no entry in
cs42l43_reg_default[] it is synced back on every resume unless it is marked
readable or written with cache bypass.

[ ... ]

> @@ -629,23 +666,25 @@ static int cs42l43_run_load_detect(struct cs42l43_c=
odec *priv, bool mic)
>  	if (!cs42l43_jack_present(priv))
>  		return -ENODEV;
> =20
> -	if (mic) {
> +	switch (type) {
> +	case CS42L43_TYPE_3POLE:
> +	case CS42L43_TYPE_OPEN:
> +		switch (val & CS42L43_AMP3_RES_DET_MASK) {
> +		case 0x0: // < 22 Ohm impedance
> +		case 0x1: // < 150 Ohm impedance
> +		case 0x2: // < 1000 Ohm impedance
> +			return CS42L43_JACK_HEADPHONE;
> +		case 0x3: // > 1000 Ohm impedance
> +			return CS42L43_JACK_LINEOUT;
> +		default:
> +			return -EINVAL;
> +		}
> +	default:
>  		cs42l43_start_hs_bias(priv, false);
>  		cs42l43_start_button_detect(priv);
> =20
>  		return CS42L43_JACK_HEADSET;
>  	}
> -
> -	switch (val & CS42L43_AMP3_RES_DET_MASK) {
> -	case 0x0: // < 22 Ohm impedance
> -	case 0x1: // < 150 Ohm impedance
> -	case 0x2: // < 1000 Ohm impedance
> -		return CS42L43_JACK_HEADPHONE;
> -	case 0x3: // > 1000 Ohm impedance
> -		return CS42L43_JACK_LINEOUT;
> -	default:
> -		return -EINVAL;
> -	}
>  }
> =20
>  static int cs42l43_run_type_detect(struct cs42l43_codec *priv)
> @@ -686,18 +725,12 @@ static int cs42l43_run_type_detect(struct cs42l43_c=
odec *priv)
>  	if (!cs42l43_jack_present(priv))
>  		return -ENODEV;
> =20
> -	switch (type & CS42L43_HSDET_TYPE_STS_MASK) {
> -	case 0x0: // CTIA
> -	case 0x1: // OMTP
> -	case 0x4:
> -		return cs42l43_run_load_detect(priv, true);
> -	case 0x2: // 3-pole
> -		return cs42l43_run_load_detect(priv, false);
> -	case 0x3: // Open-circuit
> +	type &=3D CS42L43_HSDET_TYPE_STS_MASK;
> +
> +	if (type =3D=3D CS42L43_TYPE_OPEN)
>  		return CS42L43_JACK_EXTENSION;
> -	default:
> -		return -EINVAL;
> -	}
> +	else
> +		return cs42l43_run_load_detect(priv, type);
>  }

[Severity: Medium]
Does replacing the switch in cs42l43_run_type_detect() cause invalid
CS42L43_HS_STAT values (0x5..0x7) to be misclassified as a 4-pole headset
instead of returning -EINVAL?

In cs42l43_run_type_detect(), type is initialized to 0xff and
regmap_read(cs42l43->regmap, CS42L43_HS_STAT, &type) is not checked for
errors; if that read fails or hardware reports 0x5..0x7, type &
CS42L43_HSDET_TYPE_STS_MASK is passed to cs42l43_run_load_detect(), which
now hits the default branch, enables headset bias and button detection,
and reports CS42L43_JACK_HEADSET.  In addition, the CS42L43_TYPE_OPEN
cases in cs42l43_start_load_detect() and cs42l43_run_load_detect() are
unreachable because cs42l43_run_type_detect() returns
CS42L43_JACK_EXTENSION when type =3D=3D CS42L43_TYPE_OPEN.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111171032.1491=
717-1-ckeepax@opensource.cirrus.com?part=3D2
