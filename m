Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7387B55C1C0
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790089306; cv=none; b=VS+4qglr/YzkFayzYzAq/7D4f7uEHRsV4PBvnDjOQ5yBhq6gmeTM8/YDTMaUTDmrL/KS+3a+s5nDwBY42qSeGrD7EQACJwKpPVjPwxHfgxKG8eC1z7irGGilM0xx0pXntsnAyAWn10AVLfT7QVkmOHSqgm/X42PmxXwT/apy+Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790089306; c=relaxed/simple;
	bh=XJCmuMzIjH2Ash+3rDlTx1D0Bka5esedUikVBBaQRiE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uFW9kGIHsCpn4GEENdZc+yOwwZA6pzYqec2Wkul/iJWhRzd2MzpZVfwRgVR0QHbCgD0fC85ern7iTJBmGTd37iM9ZrPij6BfHmDon0JNnFiHe2gP4JRWdOw158eVKsoz1+O4nF177IkPcJdppEXFQERseqLT4/WkJcJTBKCLjz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UAy+3710; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UAy+3710"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d097b4939so22952015e9.0
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 08:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790089301; x=1790694101; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYZSrvfaNRUF8vysf/3RvkJxXOyz3bEJ1eP7jW1LNrc=;
        b=UAy+3710zPQw8zk4wz4x2cZRf9MRz6lpH3bQY8GBeQeUmtfm7tZcPhgilTnfgvUzEn
         sXnxUlbWKfz2hChkse4UKjGsmUbZW8J+7v2wsUOIds2ip/0neBTXV0ZGqrsXCIRrSQ6a
         fg5gMUTAOhMtuJoyfg4weX472v9r5zf2knPPOS/RqDL57F5ss5Hx4dU+gdLAPSZRSIet
         7MtRCQa96z9VOiwq6SH3CjH5vbAYTkx7G7uDANmrkmM3OI8JOxAaUjw564N/+56rTwWI
         Wz1wGaOQ32UMPGKCQRR2fPdxUPhpFDMP3+zN4puE+4ywT8kGLf3HjpuIUnn5xxkyPasa
         QVEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790089301; x=1790694101;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYZSrvfaNRUF8vysf/3RvkJxXOyz3bEJ1eP7jW1LNrc=;
        b=cVGE2W+J9FFOTTJoEmhEFM43AFk9adkZFwYjx6OqY5FM5Sf/M8YZP8qlB1ekQzRD6x
         eo1N8+Kh3Mf8j9gZ9dvjZRLTPRB1VcNbPmVSwlWqjcQsVUl4E2+dNGHih0usEA1vRy5I
         kThjXeduoATrQnunMB5IobqrqA7Twxi27N6uJzvoj0yPdxtSx1/W4W8WIygW2jmyiisb
         zNpnPx670kg4KMxn42MNdTrEeJdU0m4I0oNfgWEJVRa4plOYhgyK2Y165jRKg7USP32B
         MqhF87qTOBmczA6rpbVWVT/Yr0s4Un7othPfklJndPSkXGh/P38cUkK2UzilYC4ivRqD
         W+7g==
X-Forwarded-Encrypted: i=1; AKwUvBx3mAGDtRSadJBunvPcV6Pq6vyqfMUr9Th4trpzwKC1SQa2zlZxbI/PQYmbNzeKwJ5jVaBFIc/WYtEr1w==@vger.kernel.org
X-Gm-Message-State: AFuF++kWGIt2fE9v+8Q/H9XdqlPUeVQgV/1nulYxzVHUEtCCMIhnQ2+Y
	96yB2aLP+zD4G6bzgwh9zr5vJ3icZlsPS773V66rUGIm33p2YZmmP+X4ONLyWFnKITY=
X-Gm-Gg: AYBFou3h/hn7onrivzLKhObUDr0ikIH+AG9Vl9jhLpYlRI5LXrgD1u01YaaNPVVfAsl
	71f3jfh4SvMrMXU0UFGBU4vejV8TMg/v56xoGZeHZXKFyPwhqlbzYsv5g3zqddCGkQFxldj5gG7
	tQWdP4BtlkyHwm7OtgP0rErZeUxRz/3fSxTC7Hw2eq1lgc/0VZQ5VT4xbJxjZPJgF9uqrUfbacl
	R6bjJFxJnj1vbkCAZB+icvIyhJIZLIzXwNXuMErWRTbDJXg9/dcqCbz09Pk64Goshhc83OEXLg1
	TtJ9USrHTY5fcHptR4+RBAwFTDIeORHjkHEVsv/Zmf+hsdyp9eqQWs8Igagp0Cq5L4AGe1tQUyU
	/qub0bvuX/c7m7EN/6NVgkuhY00yR85WWg00MNPW+C8EP7v995XboOjTwXAzOvjSz+do/l7xuqE
	xvEdZ0UqUijL5p6pR5KmpxKriPC1G+teNpkb6B1Hal/R7IX12MhDdPu+NnBZ1ERCdaK3ifopzQi
	+eo11vwy3EdvHQTS1PCiF16A5Q3VuBE+fgyNkarC4xHccpRbI9E5xmClvy2UA==
X-Received: by 2002:a05:600c:6097:b0:49e:7cd8:b269 with SMTP id 5b1f17b1804b1-49fc57411a5mr205964555e9.21.1790089301582;
        Tue, 22 Sep 2026 08:01:41 -0700 (PDT)
Received: from localhost (p200300f65f19a9041d0e57515b2ea4c8.dip0.t-ipconnect.de. [2003:f6:5f19:a904:1d0e:5751:5b2e:a4c8])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fdaafa9cfsm61257695e9.4.2026.09.22.08.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 08:01:40 -0700 (PDT)
Date: Tue, 22 Sep 2026 17:01:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: joakim.zhang@cixtech.com
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz, tiwai@suse.com, 
	p.zabel@pengutronix.de, cix-kernel-upstream@cixtech.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
Message-ID: <arKXJ3mlnq8E5SGP@monoceros>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-5-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="q7aq3xdvldwxgy5c"
Content-Disposition: inline
In-Reply-To: <20260922112134.4167305-5-joakim.zhang@cixtech.com>


--q7aq3xdvldwxgy5c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 4/4] ASoC: cdns: Add Cadence I2S-MC controller driver
MIME-Version: 1.0

Hello Joakim,

On Tue, Sep 22, 2026 at 07:21:34PM +0800, joakim.zhang@cixtech.com wrote:
> [...]
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>

Please don't include <linux/mod_devicetable.h>. You can rely on
<linux/platform_device.h> to provide of_device_id instead. (Or if you
prefer it, use <linux/device-id/of.h>

Same for patch #2.

> +#include <linux/pinctrl/consumer.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <sound/dmaengine_pcm.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>

But please don't rely on <sound/soc.h> pulling in
<linux/platform_device.h>, so please include the latter explicitly.

> [...]
> +static const struct of_device_id cdns_i2s_mc_of_match[] = {
> +	{ .compatible = "cix,sky1-i2s-mc", .data = &sky1_devtype_data},

Missing space before closing }.

> +	{ /* sentinel */ },

Please no comma after the list terminator.

> +};
> +MODULE_DEVICE_TABLE(of, cdns_i2s_mc_of_match);

Best regards
Uwe

--q7aq3xdvldwxgy5c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqymFAACgkQj4D7WH0S
/k478Af/d+mXR7ED7qQBSPvWMVUXs1dj0eXbvlU1Lh5/nYAdu6XY6ghnYahPD6sd
n5guUj6dgqPeGND4qQtAD2M3/dM0QUCC9hTxRNZhU2WPjJJ5K2GBgOzYKwBJZfOb
sEFLS72glHFiOGAXLbEMgc+3YbAIq6t8iidG56ujbxCfk6f6Awxs47Ly8uU0Xu6q
xqqHGYoEsPBZ3t+tDqC96+uRAThOXxUZ3Vz7Sj4ieXZhnE9HCeLd+rL2yb6CpC/5
87kaauk0tor1zrnB4fGRI7XUxWeKR6ojH3NlJd7xFKSimohFKw1t/PFOVQI9iggq
1pNvwN0bLxN7Vx0RnlTeKcBO9cZ4BQ==
=rB0Z
-----END PGP SIGNATURE-----

--q7aq3xdvldwxgy5c--
