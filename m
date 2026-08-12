Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF2F3B893F
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 08:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523246; cv=none; b=QjlO5+1JGkf/R2PAP6scx0yv6UcySsTWMKtopzdlgkM2iLoIAINtfhC8Vx/rl3N73+bbv72Okvp6Awu9GUJFxtLSYlgrhB9mLWtokSRCLDSQsHjZgruxOXBKBAPg7qQ1GK942t2lwmD8N2zrRocQFHHbX6s5xnfR7Y/HWXxDBw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523246; c=relaxed/simple;
	bh=sAtCyzuFnxyjqrMhxDj/m0vve+3H6QTGyasVPnl/ykg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZQfF/e31XKH5tdXPPCvtNyOnL3MrOivbnhnDYpO4iy4un2gWlnRfbKTOGH9eC7G2rOnYDkj8ywfzVo0wT+jJ6VtLIHq8i6AIzZYeAnWIddEEji5REkcyCwgIrmbgBirvWI2d5mV3uRs0LOMPelAFOMRqndU3I0hSietV9H1to5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=CDOrRw8B; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="CDOrRw8B"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49954b88fffso6856385e9.0
        for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 01:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786523241; x=1787128041; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NyZFPN57llZ9jLnB+G3bChs5gP73dWaHLz9AjLczrTE=;
        b=CDOrRw8BamSiXeF6WOrJGk43uEtjdMAJgp7dyJuUWj1A/UtmoT8ijG21F0c3aPeCBW
         d3tz3wHis733wtrgpZKfOycB8v2cFzXWC5FN6FkFFIWU/7Uv4R3jr6JxoSQmKCIe3TJ9
         9VAd62t7xeKRTGPjyKNYfsEb9JHyzB7HLCR0gf+QR4C5zVIWGBC6Pt+PSERc788sAZsX
         2xP+K7nxOZYIKdZr5QyrC+1GfoUFeU7wk7S2dHZj5YW9Q+9TpBr19KwbXaiP771xR3J2
         aMCxLrZI1UZGbC5E2wMSv14aX87BEUmy0nRwRUaDP2mGn66VPwc4bgJ925bRYzclTqDs
         CybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523241; x=1787128041;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NyZFPN57llZ9jLnB+G3bChs5gP73dWaHLz9AjLczrTE=;
        b=g03gi6DhjeL5HiX1o5v9eIxlpateFDEt+fGeiKIG2FwY93EZtH8N1HikL5B8hYi30O
         qQ5VhrjTDxpD1zU5WNKe+udR8rabME/qEDq9kTNXk1B9jhe6KUaqZ7zAo4ORZLDUSmYn
         mlTqxp3BE5+nNXck2eafsQpcUXrIMMsL3pgtPbksBQIAKeqGKBkeOhylZ+YfX+2xg9C5
         4k+JXoQyvSGxmpRvMqznaAW2O8+0igJcLtrug8Mhv30AKYfjwwR7UdgqxxPKuM6eAFW2
         cRCX91VHbrIY1D15iNcKCqsnaPqYLbC4hLBFX+Sg1yzRGYqjH8hb4IS69yWzqiEz8Bc6
         0FOg==
X-Gm-Message-State: AOJu0YyW7ag0TNljtjIjS9qAUDWNQTTuK0eocB6Bkos0UnOm6owg6SdF
	oDdx4edbanQ1elxOtRvoEHDSmZ0L5TVIuwB4i2N3KWlVzHC962FNng2Xs8lqpqGymRpjjocK57e
	FyotO
X-Gm-Gg: AR+sD10HjFN27pU6hRc44G6THr6uOyYR/vFPz7ZeFGbn+Xj7y8wvS8U3ZQfwBKPHx6c
	w2dQDtN2VG7jQN3/DNHSiIy+hcFZgHaID41+iIXyw1cFNsTam/+ztQw6XM4Ez0fch6ct4FEO9Wl
	gotfH89u3MIJfKj27kRPPVaKUSudvQaWhc0Jo6lwamXf/g3xn2Rq7BDmwP238uk0CUf8Xb2U9Fs
	hnhBijcubl4T6Tb4bUiDbq1WbVcaVuih5nDtWf9pygtASzjdybkGluOWLAC3tkA7wzCibMbO+nH
	srecuThdpI5JTJcLVHr41a6/CKTBHHp0dCc5Lii0S5B0E9auBqSEi7PhJAGwX2ZqFaA4MR66jll
	Ey4VgQE0dYgWVR/h0ZyN+t+aZe/yzD6P2+j0FGShe1tk9j5dUCv3K6bC6c13QEswG6nc869RHCi
	gm3sx4Afh66wOnm4JhmvDRy4wwHEShnhOQt+0+urozqELNKBnecGKcmx1ojWfNdNHCKw==
X-Received: by 2002:a05:600c:b85:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-4997c12caffmr42330325e9.18.1786523240693;
        Wed, 12 Aug 2026 01:27:20 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4997b34afe3sm39844925e9.2.2026.08.12.01.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:27:19 -0700 (PDT)
Date: Wed, 12 Aug 2026 10:27:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: qianghua wang <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org, broonie@kernel.org, 
	pierre-louis.bossart@linux.dev, yung-chuan.liao@linux.intel.com, liam.r.girdwood@linux.intel.com, 
	peter.ujfalusi@linux.intel.com, kai.vehmanen@linux.intel.com, cezary.rojewski@intel.com, 
	bo.liu@senarytech.com
Subject: Re: [PATCH 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
Message-ID: <anwtiVJxKhqlEtNC@monoceros>
References: <cover.1786511177.git.qianghua.wang@senarytech.com>
 <98f27d5c85ab435aba519ce5d86fdafe793a1968.1786511177.git.qianghua.wang@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zhouor2bv2pzjj5k"
Content-Disposition: inline
In-Reply-To: <98f27d5c85ab435aba519ce5d86fdafe793a1968.1786511177.git.qianghua.wang@senarytech.com>


--zhouor2bv2pzjj5k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
MIME-Version: 1.0

Hello,

On Wed, Aug 12, 2026 at 02:59:42PM +0800, qianghua wang wrote:
> From: "qianghua.wang" <qianghua.wang@senarytech.com>

huh, why is here a . in your real name and in the real From header there
isn't?

> Add SoundWire SDCA driver for Senary SN624x multi-function codecs
> (jack, speaker amp, and DMIC). Extend the Senary MAINTAINERS entry
> for the new codec files only; Intel ACPI match tables remain under
> INTEL ASoC DRIVERS.
>=20
> Signed-off-by: qianghua.wang <qianghua.wang@senarytech.com>
> ---
>  MAINTAINERS                        |    3 +
>  sound/soc/codecs/Kconfig           |   12 +
>  sound/soc/codecs/Makefile          |    2 +
>  sound/soc/codecs/sn624x-sdca-sdw.c | 1873 ++++++++++++++++++++++++++++
>  sound/soc/codecs/sn624x-sdca.h     |  144 +++
>  5 files changed, 2034 insertions(+)
>  create mode 100644 sound/soc/codecs/sn624x-sdca-sdw.c
>  create mode 100644 sound/soc/codecs/sn624x-sdca.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a21c79f3e436..f18e0ed039e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29837,9 +29837,12 @@ F:	tools/testing/selftests/cgroup/test_zswap.c
> =20
>  SENARYTECH AUDIO CODEC DRIVER
>  M:	bo liu <bo.liu@senarytech.com>
> +M:	qianghua.wang <qianghua.wang@senarytech.com>
>  S:	Maintained
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git
>  F:	sound/hda/codecs/senarytech.c
> +F:	sound/soc/codecs/sn624x*
> +F:	sound/soc/sdw_utils/soc_sdw_senary*
> =20
>  THE REST
>  M:	Linus Torvalds <torvalds@linux-foundation.org>
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
> index 4761ff4afb59..06e4a02f0c58 100644
> --- a/sound/soc/codecs/Kconfig
> +++ b/sound/soc/codecs/Kconfig
> @@ -238,6 +238,7 @@ config SND_SOC_ALL_CODECS
>  	imply SND_SOC_RT715_SDCA_SDW
>  	imply SND_SOC_RT721_SDCA_SDW
>  	imply SND_SOC_RT722_SDCA_SDW
> +	imply SND_SOC_SN624X_SDCA_SDW
>  	imply SND_SOC_RT1308_SDW
>  	imply SND_SOC_RT1316_SDW
>  	imply SND_SOC_RT1318
> @@ -1968,6 +1969,17 @@ config SND_SOC_RT722_SDCA_SDW
>  	select REGMAP_SOUNDWIRE
>  	select REGMAP_SOUNDWIRE_MBQ
> =20
> +config SND_SOC_SN624X_SDCA_SDW
> +	tristate "Senary SN624x SDCA Codec - SDW"
> +	depends on SOUNDWIRE
> +	select REGMAP_SOUNDWIRE
> +	select REGMAP_SOUNDWIRE_MBQ
> +	help
> +	  Enable support for Senary SN624x SDCA SoundWire codecs.
> +	  These multi-function devices provide headset jack, speaker
> +	  amplifier, and digital microphone endpoints on the SoundWire
> +	  bus.
> +
>  config SND_SOC_RT715
>  	tristate
> =20
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
> index d2a689006d69..44b471d8b8c3 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -285,6 +285,7 @@ snd-soc-rt715-y :=3D rt715.o rt715-sdw.o
>  snd-soc-rt715-sdca-y :=3D rt715-sdca.o rt715-sdca-sdw.o
>  snd-soc-rt721-sdca-y :=3D rt721-sdca.o rt721-sdca-sdw.o
>  snd-soc-rt722-sdca-y :=3D rt722-sdca.o rt722-sdca-sdw.o
> +snd-soc-sn624x-sdca-y :=3D sn624x-sdca-sdw.o
>  snd-soc-rt9120-y :=3D rt9120.o
>  snd-soc-rt9123-y :=3D rt9123.o
>  snd-soc-rt9123p-y :=3D rt9123p.o
> @@ -726,6 +727,7 @@ obj-$(CONFIG_SND_SOC_RT715)     +=3D snd-soc-rt715.o
>  obj-$(CONFIG_SND_SOC_RT715_SDCA_SDW)     +=3D snd-soc-rt715-sdca.o
>  obj-$(CONFIG_SND_SOC_RT721_SDCA_SDW)     +=3D snd-soc-rt721-sdca.o
>  obj-$(CONFIG_SND_SOC_RT722_SDCA_SDW)     +=3D snd-soc-rt722-sdca.o
> +obj-$(CONFIG_SND_SOC_SN624X_SDCA_SDW)    +=3D snd-soc-sn624x-sdca.o
>  obj-$(CONFIG_SND_SOC_RT9120)	+=3D snd-soc-rt9120.o
>  obj-$(CONFIG_SND_SOC_RT9123)	+=3D snd-soc-rt9123.o
>  obj-$(CONFIG_SND_SOC_RT9123P)	+=3D snd-soc-rt9123p.o
> diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c b/sound/soc/codecs/sn624x=
-sdca-sdw.c
> new file mode 100644
> index 000000000000..5129e883cddc
> --- /dev/null
> +++ b/sound/soc/codecs/sn624x-sdca-sdw.c
> @@ -0,0 +1,1873 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// sn624x-sdw-sdca.c -- SN624X SDCA ALSA SoC SoundWire audio driver
> +//
> +// Copyright(c) 2021 Realtek Semiconductor Corp.
> +// Copyright(c) 2025 Senary Semiconductor Corp.
> +//
> +
> +#include <linux/atomic.h>
> +#include <linux/bitops.h>
> +#include <linux/delay.h>
> +#include <linux/find.h>
> +#include <linux/device.h>
> +#include <linux/errno.h>
> +#include <linux/jiffies.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/soundwire/sdw.h>
> +#include <linux/soundwire/sdw_registers.h>
> +#include <linux/soundwire/sdw_type.h>

Please rely on linux/soundwire/sdw.h to provide sdw_device_id and drop
including linux/mod_devicetable.h. mod_devicetable.h will go away soon.

> [...]
> +static const struct sdw_device_id sn624x_sdca_id[] =3D {
> +	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6242, 0x3, 0x1, 0),
> +	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6244, 0x3, 0x1, 0),
> +	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6247, 0x3, 0x1, 0),
> +	{},

Please make this
	{ }

(i.e. use a space between the braces and no trailing comma)

> +};
> +MODULE_DEVICE_TABLE(sdw, sn624x_sdca_id);

Best regards
Uwe

--zhouor2bv2pzjj5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp8Ll8ACgkQj4D7WH0S
/k4bPwf+ODbODuL8IVtpMZDc5Q6XAWMQr5Oq1wSNblSV09K+kUcwx+4+WHylLUv5
hwxRZOA0ytOzh5zBQX+RPHAzmg7sgRA1eKsi2CmTQNowtbOh57oBARn/LRoDEWQP
N0RoNBsETX2wEdFCx/mrVPTvFLIxp7maMzBpg8ArLjuoTO+aDCzzPwiT+IZUXsD9
nl/0Qurdf5rl2T4yuzTKEGC3mRuousHgn1KofwP0bjbPXSYyFi5N33FcjfG5/Wjr
TEFgNF1C0xdBg3nsUVB0I9oss+ogklFpAN/8zCccSO4oMeyaYqfGMVVmkPPjCdRS
+c1GN8dBswElI22g1NkmCgbfuxv49A==
=HZwK
-----END PGP SIGNATURE-----

--zhouor2bv2pzjj5k--
