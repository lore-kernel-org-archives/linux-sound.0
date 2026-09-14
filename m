Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCD037204E
	for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371206; cv=none; b=LN4BuRen+Li1J3FK5KY220uvgsn3NHAkVLXV8kWGkUWAVuB6A+/1iEOGV3ma5SOlngp9FEItAuTSAAVE/hYweKLnnq0dcee/C4EIETMde3gOSYnCKnym+a8ddJV+8EEAm1E7Pd+fQZ1q0Z1v3T7Dg1TXU3sXnMvbrmK9d1zDu4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371206; c=relaxed/simple;
	bh=DTr6iiCXWEqi8Ceal6qp4HJBgbt9QBxJ+v30+Z1ghDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjNIIfq8SOFdXYYegjV6IkWleFSO4Ak20NCMFR/JkDmobkWdUQ4KGwepn8wRhDhVlptL9FYhjtLoGY6rGBICe5F+B6gbbvt/D4kW9iNgunJMVnjoHQVComlND1PDU++ut+IQ9o16kcjRhiVxGmzQYC/st9py7obqE3eUIdgIQ38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=WXMCr7d7; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="WXMCr7d7"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6356f6bso1337065f8f.2
        for <linux-sound@vger.kernel.org>; Mon, 14 Sep 2026 00:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789371203; x=1789976003; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZr2FikKI33KDHEnzqoeN/VTnNw+pox/jCxpOuAG6zQ=;
        b=WXMCr7d7uocRZ39WfXINuWRDf9AuOfUDiiJUL+jC+2lTafOUXv3gaAAEUFyQmB+Rvs
         a1lUhv2oavzERsuzNMICfiAZfdAN9K8C1nLLS/lsuWWMrfOGLlWAtUBJd6Jc1cQsYntZ
         UflZVMdql8z3GcmijcDuIQaA/yHVJJJ9RJiUVwDJX6RR4MXCSsRNUYYkuzUwTgLhEfgh
         X5oFV5ri8gAlE7vi88W/vGx6VdlGZygBU5X03HGr14lNZFiRe8yKsiFwDkKr+s3SdapY
         q8QTsZ1CqZ1MVUYgkDP7Lj32OjknilXwOHe3tsKEo/gLHrZfml2ghZj/7IVn8W94Xqz7
         7GWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371203; x=1789976003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZr2FikKI33KDHEnzqoeN/VTnNw+pox/jCxpOuAG6zQ=;
        b=sWg4W9TfFVuBhOtfGfhCdMYh1tlV2vyZmMzBXWXQAHHElMoqKXEShXWyc96lxm5LwS
         PKmVBD7dZEJzW9WiurM3tmHvo7r05b/2q3A4uSqqZ/mtMC9RVdj2gfiZIDszGB01MUnd
         VmpCqVMOkBhGiisYPFGKt0CAZNj8kIVHkuNy1ri83nvO8iOOvTS0Qfb6J9JYOxdoUOeK
         rPcHdGivR4/U5kbWqjIjTVLZ1Q63bzrwb2y12U/oIW7eqbNSxQE+zsRpIh6rLUDkysXj
         mTE8q2c0gRt3mTeJNx2ynouqM6wgMajLYIy8pXcHMGfuDTf8hPhrN0EWIbGuUY1scp2m
         jpXg==
X-Forwarded-Encrypted: i=1; AKwUvByOZZN1SmigMvHd87e9uA2MAJXKE6gxKI7rsGFWPaYsOMEIua3ICwMRzhRJoMSiqRp96jMXKt12RXNGqw==@vger.kernel.org
X-Gm-Message-State: AFuF++k08W6BeKGG/P3K5v1dEUx7ChIuEbe5od2cq0XfbW9QeLjN26L/
	YGNZj+IxZCvH8vgx30KALD31LmJ7T+K2SOoufMsj6pUfjc8OpFOkNIgaeMhdgZ+lJt9JviOVQ6f
	BHglM
X-Gm-Gg: AYBFou1h2hS13BLZU8Xr8FYWGOvyqVOoDEKjhW/NDJUgDfO+5a6VYXv1MdCKjpYEWaF
	WaiAfRByLYnJJHF3MmzS/MvmS8axim1DMASRa/eAq/uCojske0cvxDUwZ5w7KLOmWPpwWFvIatY
	NkqTBkG/WFsrcY5TlXqcBAxme6yR105JTacrqUtPvrIkV8pq4lcOH9QtA6cjOhWsGQAo5z9yb++
	JyCHM62nFM5BQwBzgyNqE11/33OvFO1qea9V0QqMepPNj6S0F4MS/0iOYwvQHhutiQca36wLtg1
	QGltp4oWneWPaKIRkwqXrkgE4RocTxmVhEyDPE4Djv5AiTwulFHvALjst1bt8LJKwRZ5e1+D4hn
	dfpbeexDOpX3SqwkvFMJQEu/42eRxEHaQUrlOc0wNkeeuqa9cxv2dyklpARsHf9ynVOQDiTOLVu
	xLFfZzINCfVsE87jHYymICBTni0SyMMWu2GRp5LS8HNTM81YYcPwMew7OCBMUONDu7lVEaUkdBX
	1S+ifvZ7TNZZifCAxKttqmR7AGwE71CAHDW4lgUMrIDbwC06b32B62su0yz7xq8S1o29hY+
X-Received: by 2002:a05:6000:470c:b0:486:f770:9e87 with SMTP id ffacd0b85a97d-48702aacef4mr2464666f8f.5.1789371202652;
        Mon, 14 Sep 2026 00:33:22 -0700 (PDT)
Received: from localhost (p200300f65f19a904d5c06a7863c841d4.dip0.t-ipconnect.de. [2003:f6:5f19:a904:d5c0:6a78:63c8:41d4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-486eb2ed106sm24129793f8f.1.2026.09.14.00.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:33:21 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:33:20 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Valerio Setti <vsetti@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] ASoC: meson: add audin main module and I2S formatter
Message-ID: <aqeiUfIyeW2mapm_@monoceros>
References: <20260912-audin-v1-0-7fbefe928711@baylibre.com>
 <20260912-audin-v1-2-7fbefe928711@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4kuywhcc5gf5klas"
Content-Disposition: inline
In-Reply-To: <20260912-audin-v1-2-7fbefe928711@baylibre.com>


--4kuywhcc5gf5klas
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/6] ASoC: meson: add audin main module and I2S formatter
MIME-Version: 1.0

Hello Valerio,

On Sat, Sep 12, 2026 at 12:14:32AM +0200, Valerio Setti wrote:
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop the include for <linux/mod_devicetable.h>. That latter header is
supposed to go away soon and injects a lot of build dependencies into
your driver.

If you want to go full iwyn, please use <linux/device-id/of.h> instead.

> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <sound/soc.h>
> [...]
> +static const struct of_device_id meson_gx_audin_of_match[] = {
> +	{ .compatible = "amlogic,meson-gxbb-audin" },
> +	{ .compatible = "amlogic,meson-gxl-audin" },
> +	{}
> +};

It seems to be subjective, but I think most nit-pickers in the kernel
prefer { } over {} to match the spacing in the non-empty initializers.

Best regards
Uwe

--4kuywhcc5gf5klas
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqnoz4ACgkQj4D7WH0S
/k6wBgf/VDlnoO5+iXo8tNZhitG0NPObCWmA3qnUxY31Go2pWwo5D7mENYe58DQf
LbOjfyHM3rG5ajmQJpNpoxoWanM8pHm1pbf7WjzZXg8WxLPnc6Y6QmjA5rC1Rsoe
OaAlq3aB/SmDTaIo9WzaLTYU/UhsFNVrWjtqGWhRXgGod17Q1r4iEW6LZadLjsyw
8xYNabxMGbQJVZK8cXM2tJCC9n1O51+z8w01tQyZ4ze4J3Xw7v8uRXbDezOIqIee
/+z7LE3HPZKG04IMtzYplulwe4dmSdjkf81QWxDR5SFxRrlxNaSuxE12LKJ4DSS4
GL20Mp6Pvdl/Kqd1PwrNPdwUx4BNlw==
=LwSM
-----END PGP SIGNATURE-----

--4kuywhcc5gf5klas--
