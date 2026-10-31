Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793432450;
	b=wKWSLQgy9c2EHVUbH5am9EvzHZDc2a8yEFVEhp1HUkidkhiB+KL914+BzCMWQHlYJFtf
	 /nicgjJ8SQabeRKVaTU1lSEqNyBqTn5thQqmaHf4tpVVW0pUDQDMqDKUUY4onfIgPzkDZ
	 bYa5Hvb/Q1s0nUFvJBFowSe84ykIhbWs1UQ7yYJXaebQyRLzbqNhth2WgOM30FaG4isH+
	 uypFdR/IWns608nCduWOx4QeYBR099t03J5e7vWVhUNwDHbIyEVwcYoHj+00vYRFKtMh1
	 18xd9TJsphJ0MSEDHPC2HWko2Ty67WCh4J88QpSY+XLggLJPBNqmROmzEmLVR5KHkWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793432450;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=9AO1+KAuRTwLLijR7WkNSui+GZ6lgqrHeIQMSU2PVe8=;
	b=j5QFz+BQv+F5T8NnZu3kKpLcqoOzr7ii3HTpRsbwDZh/SuHeFThHK4a44VbrVB0d4lOq
	 SeN/6BdyK7l6Q7Ll9Y9aBxo6U4d53D2S00107usnrPHEAuV+nte6olaiyg99gGD7r0z8h
	 CfnzJpwwGHBtO0/IXxq0pe0kiRbg1ojUd+Bd63p5H2XR/+drW0UCk9EWr+9/CrQMFJQqe
	 85OELyN7Qq9SrT9jdofjV8xqSX+mkRxfa69WBSAdnTsU4jOIUNoK3VXg/BkftYiiXlgkN
	 3Xcv71hW5HtUeDkim/jcYkYG5GIeLO6j/4McJuJjocamCFgzGrcCoTyurUO28Ou9NEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HDbfMBQD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC39606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 07:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HDbfMBQD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968A61F000C1;
	Sat, 31 Oct 2026 07:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793432449;
	bh=9AO1+KAuRTwLLijR7WkNSui+GZ6lgqrHeIQMSU2PVe8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HDbfMBQDhjS+TtEiXj9OnFf0D8K6hTpMzeHvUP5NyS40eJM7uVpZo1NK8H9eRmP5+
	 97xKD0cHV6h05WwXKsgp8+y02inRS3hiB/0s7vACGb9KpykbOdnoX76lxUjChWmCOo
	 jMIIlyMl0KZlI58v+NvZxrFwSnH5+ZCOnb+fZSpvCPbE6w8zFUhvhkrbQolUtVkOak
	 5lPJMfnRKvdPwpcQ+t/yrIrzPrrFMsFkt9VfhJ4h9ttkSJVgaavL0ocuQp5KdfTtwa
	 GjZ8FOX82NftrXodIH+h4bj2oWwXv5djJ5wvnD2fsStt4LZxtThCHGa+kfh4laaXSj
	 cBDCioby4gcBQ==
Message-ID: <sashiko-outbox-191805@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] ASoC: es8328: set SLRCK for the ES8388
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bob Hui" <bg9oxa@163.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261031-es8328-vol-init-v2-2-d15b04c22f4f@163.com>
References: <20261031-es8328-vol-init-v2-0-d15b04c22f4f@163.com>
 <20261031-es8328-vol-init-v2-2-d15b04c22f4f@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 07:40:49 +0000
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
- [Medium] ASoC: es8328: missing ES8388 match entries in es8328-spi for SLR=
CK setup
--

commit db663b096dbe9f68fbdc51ad2211743c7793550e
Author: Bob Hui <bg9oxa@163.com>

ASoC: es8328: set SLRCK for the ES8388

This commit sets the SLRCK bit in ES8328_DACCONTROL21 during
es8328_component_probe() when the codec variant is ES8328_TYPE_ES8388 so th=
at
the DAC and ADC share the single LRCK pin.

> diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
> index f04e310262e79..3d9a1fe1b9a00 100644
> --- a/sound/soc/codecs/es8328.c
> +++ b/sound/soc/codecs/es8328.c
> @@ -861,8 +861,25 @@ static int es8328_component_probe(struct snd_soc_com=
ponent *component)
>  		goto clk_fail;
>  	}
> =20
> +	/*
> +	 * The ES8388 has a single LRCK pin, so the DAC and the ADC must
> +	 * share it: without SLRCK the capture path never gets a frame
> +	 * clock and records digital silence while playback still works.
> +	 * Bit 7 of DAC Control 21 is SLRCK on the ES8388 and LD2MO (left
> +	 * DAC to the mono mixer) on the ES8328.
> +	 */
> +	if (es8328->type =3D=3D ES8328_TYPE_ES8388) {
> +		ret =3D snd_soc_component_write(component, ES8328_DACCONTROL21,
> +					      ES8328_DACCONTROL21_SLRCK);
> +		if (ret)
> +			goto err_slrck;
> +	}

[Severity: Medium]
Can es8328->type ever be ES8328_TYPE_ES8388 when the codec is connected over
SPI?

In sound/soc/codecs/es8328-spi.c, es8328_spi_probe() checks for
ES8328_TYPE_ES8388 and passes the resolved type to es8328_probe():

    enum es8328_type type =3D (unsigned long)spi_get_device_match_data(spi);
    const struct regmap_config *config;

    config =3D type =3D=3D ES8328_TYPE_ES8388 ? &es8388_regmap_config
                                        : &es8328_regmap_config;

    return es8328_probe(&spi->dev, devm_regmap_init_spi(spi, config), type);

However, es8328_of_match in sound/soc/codecs/es8328-spi.c only lists
"everest,es8328" and es8328_spi_driver has no spi_device_id table:

    static const struct of_device_id es8328_of_match[] =3D {
            { .compatible =3D "everest,es8328", .data =3D (void *)ES8328_TY=
PE_ES8328 },
            { }
    };

When an ES8388 is connected over SPI (with devicetree compatible
"everest,es8388", "everest,es8328"), it matches the "everest,es8328" fallba=
ck
entry with ES8328_TYPE_ES8328, so es8328_component_probe() will skip setting
ES8328_DACCONTROL21_SLRCK.

Should sound/soc/codecs/es8328-spi.c also include the "everest,es8388" match
entry (and corresponding SPI device IDs) to match sound/soc/codecs/es8328-i=
2c.c?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031-es8328-vol=
-init-v2-0-d15b04c22f4f@163.com?part=3D2
