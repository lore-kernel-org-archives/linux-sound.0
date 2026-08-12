Received: from mail-m49221.qiye.163.com (mail-m49221.qiye.163.com [45.254.49.221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7BA2E06D2
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 09:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.221
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786527343; cv=none; b=hB42w4DoJoZO0keDSc4xSHTMv4Xb3Ked8B0wGTUVnWtqC8BVpf5ZgoR+WwmQnAgbbK5J6YSqZpTOYg0t65j9FApiNRsaIKFxy0dsOHI5hmcrHDBeQb57nGT/4Y8DgbX/YbBFmU+XnyIQO3HQfg06Z0ZvRNlg6uvY5AebPT2VvUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786527343; c=relaxed/simple;
	bh=BuEhLtBm1BzbfkPzn48QHnc9SWEUdeiJ0333LWgq0aU=;
	h=From:To:Cc:References:In-Reply-To:Subject:Date:Message-ID:
	 MIME-Version:Content-Type; b=QRaWeyl6EfAxLLtwCoWUYGmSB6F8ANcBZXpPk0g9GGwFrgLzlzx8MteYUrn2GWiyuI3GXO7MlAzgo0fyq3+sqHR4eX5nzLdcNxedQp4UGqEDH2XGoT4j1D2MnvosZCNatDXX68Qh+A1yxDx5XLeBVBoo6u6ovZxYUKm1urP4zVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=WoXH/1Ej; arc=none smtp.client-ip=45.254.49.221
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="WoXH/1Ej"
Received: from Wangqianghua (unknown [182.148.129.247])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49b559e39;
	Wed, 12 Aug 2026 17:00:01 +0800 (GMT+08:00)
From: <qianghua.wang@senarytech.com>
To: =?utf-8?Q?'Uwe_Kleine-K=C3=B6nig'?= <u.kleine-koenig@baylibre.com>
Cc: <linux-sound@vger.kernel.org>,
	<broonie@kernel.org>,
	<pierre-louis.bossart@linux.dev>,
	<yung-chuan.liao@linux.intel.com>,
	<liam.r.girdwood@linux.intel.com>,
	<peter.ujfalusi@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>,
	<cezary.rojewski@intel.com>,
	<bo.liu@senarytech.com>
References: <cover.1786511177.git.qianghua.wang@senarytech.com> <98f27d5c85ab435aba519ce5d86fdafe793a1968.1786511177.git.qianghua.wang@senarytech.com> <anwtiVJxKhqlEtNC@monoceros>
In-Reply-To: <anwtiVJxKhqlEtNC@monoceros>
Subject: reply [PATCH 1/3] ASoC: codecs: add SN624x SDCA SoundWire driver
Date: Wed, 12 Aug 2026 16:59:57 +0800
Message-ID: <002a01dd2a38$f4feb010$defc1030$@senarytech.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: Ad0qOLl2oihaLMcoSICeUYjxG1j00A==
Content-Language: zh-cn
X-HM-Tid: 0a9ff53334ef09d8kunm246b65603fa9e1
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCGhodVk0ZGhkeQkwaQ0pCSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpJQlVJT0xZV1kWGg8SFR0UWUFZT0tIVU
	JCSU5LVUpLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=WoXH/1Ej3yj4w/BsOtagTLxEoQpasAV2jx8q/jPu73Ch1UqdtdvpTu/tTju8dw07XjT4D7lf3xG500k0tr/ZfFeOPuiaixGlB5rnhODHvBICIlOvH/9NFVtYN7iwR99GgKDiwZZFifz0/SNEeBGM+iZE/Rp6TITNufwrkB/QEq8=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=0BLl9FSjf1FLA81KdtKtYe1LDCJu97UgX6b7Uta9ksk=;
	h=date:mime-version:subject:message-id:from;

Hi Uwe=EF=BC=9A
	Thanks for your comments. I will address them in v2.
Best regards
Qianghua Wang
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>=
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

Hello,

On Wed, Aug 12, 2026 at 02:59:42PM +0800, qianghua wang wrote:
> From: "qianghua.wang" <qianghua.wang@senarytech.com>

huh, why is here a . in your real name and in the real From header there =
isn't?

> Add SoundWire SDCA driver for Senary SN624x multi-function codecs=20
> (jack, speaker amp, and DMIC). Extend the Senary MAINTAINERS entry for =

> the new codec files only; Intel ACPI match tables remain under INTEL=20
> ASoC DRIVERS.
>=20
> Signed-off-by: qianghua.wang <qianghua.wang@senarytech.com>
> ---
>  MAINTAINERS                        |    3 +
>  sound/soc/codecs/Kconfig           |   12 +
>  sound/soc/codecs/Makefile          |    2 +
>  sound/soc/codecs/sn624x-sdca-sdw.c | 1873 =
++++++++++++++++++++++++++++
>  sound/soc/codecs/sn624x-sdca.h     |  144 +++
>  5 files changed, 2034 insertions(+)
>  create mode 100644 sound/soc/codecs/sn624x-sdca-sdw.c
>  create mode 100644 sound/soc/codecs/sn624x-sdca.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS index=20
> a21c79f3e436..f18e0ed039e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -29837,9 +29837,12 @@ F:	=
tools/testing/selftests/cgroup/test_zswap.c
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
> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig index =

> 4761ff4afb59..06e4a02f0c58 100644
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
> diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile=20
> index d2a689006d69..44b471d8b8c3 100644
> --- a/sound/soc/codecs/Makefile
> +++ b/sound/soc/codecs/Makefile
> @@ -285,6 +285,7 @@ snd-soc-rt715-y :=3D rt715.o rt715-sdw.o =20
> snd-soc-rt715-sdca-y :=3D rt715-sdca.o rt715-sdca-sdw.o =20
> snd-soc-rt721-sdca-y :=3D rt721-sdca.o rt721-sdca-sdw.o =20
> snd-soc-rt722-sdca-y :=3D rt722-sdca.o rt722-sdca-sdw.o
> +snd-soc-sn624x-sdca-y :=3D sn624x-sdca-sdw.o
>  snd-soc-rt9120-y :=3D rt9120.o
>  snd-soc-rt9123-y :=3D rt9123.o
>  snd-soc-rt9123p-y :=3D rt9123p.o
> @@ -726,6 +727,7 @@ obj-$(CONFIG_SND_SOC_RT715)     +=3D =
snd-soc-rt715.o
>  obj-$(CONFIG_SND_SOC_RT715_SDCA_SDW)     +=3D snd-soc-rt715-sdca.o
>  obj-$(CONFIG_SND_SOC_RT721_SDCA_SDW)     +=3D snd-soc-rt721-sdca.o
>  obj-$(CONFIG_SND_SOC_RT722_SDCA_SDW)     +=3D snd-soc-rt722-sdca.o
> +obj-$(CONFIG_SND_SOC_SN624X_SDCA_SDW)    +=3D snd-soc-sn624x-sdca.o
>  obj-$(CONFIG_SND_SOC_RT9120)	+=3D snd-soc-rt9120.o
>  obj-$(CONFIG_SND_SOC_RT9123)	+=3D snd-soc-rt9123.o
>  obj-$(CONFIG_SND_SOC_RT9123P)	+=3D snd-soc-rt9123p.o
> diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c=20
> b/sound/soc/codecs/sn624x-sdca-sdw.c
> new file mode 100644
> index 000000000000..5129e883cddc
> --- /dev/null
> +++ b/sound/soc/codecs/sn624x-sdca-sdw.c
> @@ -0,0 +1,1873 @@
> +// SPDX-License-Identifier: GPL-2.0-only // // sn624x-sdw-sdca.c --=20
> +SN624X SDCA ALSA SoC SoundWire audio driver // // Copyright(c) 2021=20
> +Realtek Semiconductor Corp.
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
> +#include <linux/soundwire/sdw_registers.h> #include=20
> +<linux/soundwire/sdw_type.h>

Please rely on linux/soundwire/sdw.h to provide sdw_device_id and drop =
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

