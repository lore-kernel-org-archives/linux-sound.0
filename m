Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793444056;
	b=h6BsnkHWXXnStfRBk4R/pcO8HwjVFRFE7A6YnpwOpY6XTXh66K3K/t4gP9zawwOjyRDE
	 KxI1apuWXvwf1yt2N7IaDLvQupJNaZclg22uguc+ELs3Gc+eu4DE1hartEd/N7nmdAnLT
	 afDSFVbnDliYFEtNLgT9ZdPvTMYEvzoPsGanqKwmmulY99WlKbgvr2aGEY8hjUhmYRmGh
	 ty9i5EItl4sXs6O8CjrZR9xij2GM3dSAmMQMaEz+/vOe9gu0JAqdlNoJM7VF5je8njYr7
	 sKWrvdoc4c0FO+J4n1V7PKcyZsZJFEqIzzHqKyd8UT/Lsucyw3YoPwmtvbVO25BTCcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793444056;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=C82GxZP5gTIlNDWHwdhnjgIzruYNpHNbQJr8Hbki5GU=;
	b=kp19yC3jDcvUnUF3QgLhphO+VmINWuntPbUThIOVkAeNoLnGpMrZIZkQ1+PxYgiFhRJZ
	 YUMuARB6ZwEZoS1zggGRWbblRXu7bXsDO/sfp50j2oVwhBp5s8K3YXquXf/8PReWbWF2b
	 4MWK8RqHKI/YKFWHPHy66NR+YFq9FkqYDZTQywHgwFmKnTgtxTK9M+L/zyC5bNtrY8HGE
	 PTrtB8ZgEeEwqQ1m5kY7sDJzMga3n31FbukUuDfjgF6jlHwVepvFA4x4bfjhOxTOayU8r
	 oYCMugA1lfPtMgrsfp4JsqOUq4W2RfcY+Cagc+iX/EFRe5OOCB/Gd1hPX6fz7M9OMRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHzJQFe8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F397E606A31A
	for <linux-sound@vger.kernel.org>; Sat, 31 Oct 2026 10:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LHzJQFe8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72CAE1F000C1;
	Sat, 31 Oct 2026 10:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793444055;
	bh=C82GxZP5gTIlNDWHwdhnjgIzruYNpHNbQJr8Hbki5GU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LHzJQFe87zvMsgy8NxaWiAZMd7icYIePEMtbx51wHy5qPfouSgxOSvv1mpNcXHQCz
	 +doyIZTmZemOYXlqIKbsLuB6ChdYN4zfk1mgdKYwS5HjwLIc7yQbH4fDmakHGESJfP
	 qTxygVVbLph3SkgTwxQ+9pzjhIchljTzy0EJNaPXOrNK3f//YsvfDEV5FEPjNMcCrp
	 igv/LcUhBiooGRa1qeLL+Nbt+RALxLcTwoED1Yp7C1pFhz6junysMhsNe5hhIqPY7D
	 hiCxIBhEs/cNgeqMP6bSjOe6lmZ8eSMy6IMOOGGx9X5O8PxEVQvHEK4w63Of4jTkCJ
	 GdcTQUkjSckYA==
Message-ID: <sashiko-outbox-191908@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] ASoC: es8328: reset the codec at probe time
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bob Hui" <bg9oxa@163.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261031-es8328-vol-init-v3-1-7d9c4b7ab67f@163.com>
References: <20261031-es8328-vol-init-v3-0-7d9c4b7ab67f@163.com>
 <20261031-es8328-vol-init-v3-1-7d9c4b7ab67f@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 10:54:14 +0000
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
- [Medium] ASoC: es8328: es8328_component_probe() drops reg_defaults from m=
aple cache
--

commit ba0bf46975c3e97ffea12aa1305bf31f046a45fb
Author: Bob Hui <bg9oxa@163.com>

ASoC: es8328: reset the codec at probe time

This commit issues a control port reset in es8328_component_probe() so the
codec starts from a known state across warm reboots and driver rebinds. It
also adds per-variant register default tables for ES8328 and ES8388 and
selects the matching regmap_config during I2C and SPI probe.

> diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
> index aaa6646ad4c5e..5618fd7e6eb62 100644
> --- a/sound/soc/codecs/es8328.c
> +++ b/sound/soc/codecs/es8328.c
[ ... ]
> @@ -836,6 +837,37 @@ static int es8328_component_probe(struct snd_soc_com=
ponent *component)
>  		goto clk_fail;
>  	}
> =20
> +	/*
> +	 * Put the codec into a known state: the supplies may already be on,
> +	 * a warm reboot or a kexec keeps the registers alive, and a driver
> +	 * rebind leaves whatever the previous instance programmed.  Without
> +	 * this every read-modify-write in the driver works from a value the
> +	 * hardware never had.  SCP_RESET is not self-clearing.
> +	 */
> +	ret =3D snd_soc_component_write(component, ES8328_CONTROL1,
> +				      ES8328_CONTROL1_SCP_RESET);
> +	if (ret) {
> +		dev_err(component->dev, "unable to reset the codec\n");
> +		clk_disable_unprepare(es8328->clk);
> +		goto clk_fail;
> +	}
> +	usleep_range(1000, 5000);
> +	ret =3D snd_soc_component_write(component, ES8328_CONTROL1,
> +				      ES8328_CONTROL1_ENREF |
> +				      ES8328_CONTROL1_VMIDSEL_500k);
> +	if (ret) {
> +		dev_err(component->dev, "unable to clear the codec reset\n");
> +		clk_disable_unprepare(es8328->clk);
> +		goto clk_fail;
> +	}
> +
> +	/*
> +	 * The reset put the codec back to its power-on values, so whatever
> +	 * the cache still holds from a previous bind is stale.  Drop it and
> +	 * let the next access read the chip again.
> +	 */
> +	regcache_drop_region(es8328->regmap, 0, ES8328_REG_MAX);

[Severity: Medium]
As reported by Sashiko on v2 [1], does calling regcache_drop_region() in
es8328_component_probe() in sound/soc/codecs/es8328.c wipe out the
es8328_reg_defaults and es8388_reg_defaults tables that were just populated
during regmap initialization?

During es8328_i2c_probe() or es8328_spi_probe(), devm_regmap_init_i2c() and
devm_regmap_init_spi() call regcache_init() -> regcache_maple_populate(),
which populates map->cache with the default register values from
es8328_reg_defaults or es8388_reg_defaults.

When the ASoC card binds the component, es8328_component_probe() runs and
calls:

    regcache_drop_region(es8328->regmap, 0, ES8328_REG_MAX)
      -> regcache_maple_drop()

In drivers/base/regmap/regcache-maple.c, regcache_maple_drop() frees and
erases the maple tree entries in [0, ES8328_REG_MAX] without restoring
map->reg_defaults:

    kfree(entry);
    mas_lock(&mas);
    mas_erase(&mas);

On subsequent register accesses, _regmap_read() in
drivers/base/regmap/regmap.c calls regcache_read() -> regcache_maple_read(),
which finds no entry in map->cache and returns -ENOENT instead of falling
back to map->reg_defaults:

    if (!map->cache_bypass) {
            ret =3D regcache_read(map, reg, val);
            if (ret =3D=3D 0)
                    return 0;
    }
    ...
    ret =3D map->reg_read(context, reg, val);

As a result, every register read or read-modify-write after
es8328_component_probe() misses the cache and performs a physical bus read,
leaving es8328_reg_defaults and es8388_reg_defaults unused after probe. On
3-wire SPI (sound/soc/codecs/es8328-spi.c), where the control interface has
no data-out pin, dropping the cache causes snd_soc_component_update_bits()
to issue physical SPI reads that return bus garbage instead of using the
default values.

Should es8328_component_probe() call regmap_reinit_cache() with the matching
es8388_regmap_config or es8328_regmap_config (selected via es8328->type)
instead of regcache_drop_region()?

[1] https://lore.kernel.org/r/20261031-es8328-vol-init-v2-1-d15b04c22f4f@16=
3.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031-es8328-vol=
-init-v3-0-7d9c4b7ab67f@163.com?part=3D1
