Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485F46AF14;
	Tue, 16 Jun 2026 16:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781626852; cv=none; b=QnxPShPM7/tOFZayjGZOluMwbFcoZThdopWcXcwCzc3rI5szMFIW2YZOTr/TQYbzNa6JGUKiCQ2qvnKUWZdNJkGueFZa0+62e8SnVO+rkkgGSosB+46zF1B6lDl+BjbIWd3eaxA6QAIcBn1xU7+LpcqD4vRHg9ORlxHw4E6XEF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781626852; c=relaxed/simple;
	bh=GJgFpaOODT7PKCmOi/uHSqP0I3tmz0cXhUIvKgtkXkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLJkuJakzk8nycgf3geo3HlYTKj2yzU88fBlU7tqLgqzfRfrXxiuytHnHj8vU4L+ZdTBjQRnmKFeuuY8FptXZ20MEnB1gGrAGlM3SMH5j1sMUdnV7nEMNgK3w6j/jDtynZiy0ZnbUDBbrv/rlH5A+BSXaqrlHKI3ViVfZa0DH8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QCPvpIQE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QCPvpIQE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5D471F000E9;
	Tue, 16 Jun 2026 16:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781626850;
	bh=0AsclxypfELZoR4JIGkVPPEGEpP6Cc+HL71Qk/KC3Ks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QCPvpIQEQtuq47nCz6/7eHev9nFJkZAtz3qN0yOn4W+xzfpwNdJ9Puy/gSBHMVGio
	 DFSTv5vP4FcZVI3gvltYAG50Q0g5huGwF0Jzh/fUjTIYSLKD88n4SHp93Evqx5Zghv
	 0f0HYEzjPzvtyKdoWs8BryCqdA0RVBAKXkRz9uO6SL9eNURGrUH5UvEy1BdARXPyFE
	 EmKZn+jHqRab5PHSnOq6ER88iSPBK1uuRa8oMf4Ykp5JoN/OoesZ62zdnQlQDiOLQ/
	 WIUM9seNBG0Czwse4OiCjPffIuJV6kxNYHXQUS5H8Z9BnVkiWvS2FxNPG7lnJNUgPo
	 NY+JVN8EiIcdA==
Date: Tue, 16 Jun 2026 17:20:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Juraszewski <bjuraszewski@gmail.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: tas2783: Update loaded firmware names to
 linux-firmware 20260519
Message-ID: <d2558567-67b9-4fca-b170-c6ece9f8cf23@sirena.org.uk>
References: <15efa76a-aab8-4a21-ac91-ed6698cb958a@sirena.org.uk>
 <20260607093023.42070-1-bjuraszewski@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5VYmqCSxtQIhbtDo"
Content-Disposition: inline
In-Reply-To: <20260607093023.42070-1-bjuraszewski@gmail.com>
X-Cookie: Password:


--5VYmqCSxtQIhbtDo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 07, 2026 at 11:30:23AM +0200, Bartosz Juraszewski wrote:

> This patch adds `0x` prefix explicitly to the generated firmware name
> allowing file to successfully load. In case prefixed firmware is missing
> due to out of date linux-firmware, we set the fallback flag and attempt
> to load firmware again based on the old file names.

> @@ -800,6 +815,11 @@ static void tas2783_fw_ready(const struct firmware *=
fmw, void *context)
>  	wake_up(&tas_dev->fw_wait);
>  	if (fmw)
>  		release_firmware(fmw);
> +
> +	if (try_load_fallback) {
> +		dev_info(tas_dev->dev, "Attempting fallback fw load\n");
> +		tas_io_init(tas_dev->dev, tas_dev->sdw_peripheral);
> +	}
>  }
> =20

This will unconditionally wake fw_wait even if we've gone for the
fallback, meaning that the rest of the driver will think the firmware
is ready when it isn't.

>  static inline s32 tas_clear_latch(struct tas2783_prv *priv)
> @@ -1115,13 +1135,16 @@ static void tas_generate_fw_name(struct sdw_slave=
 *slave, char *name, size_t siz
>  	bool pci_found =3D false;
>  #if IS_ENABLED(CONFIG_PCI)
>  	struct device *dev =3D &slave->dev;
> +	struct tas2783_prv *tas_dev =3D dev_get_drvdata(&slave->dev);
>  	struct pci_dev *pci =3D NULL;
> +	const char *fw_uid_prefix =3D tas_dev->fw_using_fallback ? "" : "0x";
> =20
>  	for (; dev; dev =3D dev->parent) {
>  		if (dev->bus =3D=3D &pci_bus_type) {
>  			pci =3D to_pci_dev(dev);
> -			scnprintf(name, size, "%04X-%1X-%1X.bin",
> -				  pci->subsystem_device, bus->link_id, unique_id);
> +			scnprintf(name, size, "%04X-%1X-%s%1X.bin",
> +				  pci->subsystem_device, bus->link_id,
> +				  fw_uid_prefix, unique_id);
>  			pci_found =3D true;
>  			break;
>  		}
> @@ -1326,6 +1349,7 @@ static s32 tas_sdw_probe(struct sdw_slave *peripher=
al,
>  	mutex_init(&tas_dev->calib_lock);
>  	mutex_init(&tas_dev->pde_lock);
> =20
> +	tas_dev->fw_using_fallback =3D false;
>  	init_waitqueue_head(&tas_dev->fw_wait);
>  	dev_set_drvdata(dev, tas_dev);
>  	regmap =3D devm_regmap_init_sdw_mbq_cfg(&peripheral->dev,
> --=20
> 2.54.0
>=20

--5VYmqCSxtQIhbtDo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoxd90ACgkQJNaLcl1U
h9CkaAf9HqAwhSWv/oXFUUwmhxDY6QZQhjqu/KSqyjqOGYTixSEL41yFAtzVg2ug
V91MSpl0eSyt2nF6shqdocmbo2Tv0Z9p1efPgfXgNwdK3Q1KmczSTrH9VOFMvuj9
9NLIt7zc/0urdSPGaoYEN+rBBBsTtyhaTJlazuiODg+JO/kOMOdh6XTCcQrgezlo
qYYxW1LkHLOAVDscc6KjY9QlC1FNlbvyQDahgKJnNWGaHpLdndIC8YChefekZJVH
vfthAtNfYEBVCQZFA6qv5ROHcXpCQ51Qhz0SKr0AXKJqLPVFc9W9WH9OdQXUTVBP
jMBjLWw8ASW1c4esPpVglfPbRUoenQ==
=bobi
-----END PGP SIGNATURE-----

--5VYmqCSxtQIhbtDo--
