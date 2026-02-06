Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DFB4266B2;
	Fri,  6 Feb 2026 17:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770400294; cv=none; b=RRv3O//3suF5QR0vkHv+gWIHxvabI4e8IqVlSBPnXQB8HM5BclHpZtmXllZL59/L5vVSN7Te/SE5Ct9dxbJVYml7p+MNUqUbDr26q0DE9M44fEuJC888lxHWQR17qi3IvmQzkL+684KwfP461JFUSqstQGuoJAB7hjAC6FQlRHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770400294; c=relaxed/simple;
	bh=6FmYQXec3A0oddeQp4QTAriV/djIwaLJdoWWbf8EK/U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZn8i9ew69OFgThpWMDSMmGRLv12W8Cy0RyueWzGpCYIeLhpEyBOtRte6q4jVY7+9fOeSCnDHVbD/VpE8mkTKgGvNjqz1TqtCeEWO3FAsFN5QJYDIMhud0xh1UDc54F//ebosDf3PwjfJOMj/7G9VTtirjx73bZfgUXdTnbtB2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PSGTYgmm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PSGTYgmm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1DDC116C6;
	Fri,  6 Feb 2026 17:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770400293;
	bh=6FmYQXec3A0oddeQp4QTAriV/djIwaLJdoWWbf8EK/U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PSGTYgmmAt039WfmLI/GfVO53kU/4j8uB7mAyjaGvUEZU+KDXpHS494M9g+V1nMbS
	 OJFKLQa2qbcHVMjgGmIaBlsKdgbFuxHpqfv9yjMg7WywKi0XClMniQ9RMurfBMWvdb
	 qOhX086axoU+3p/iZTGFLDRC9HblVGh7KXp9U5rrzRLhMLTLoHa8bCFfvoxCiDE6VS
	 30pbOvsFE2OQWpNRFVfbe+mUQLaE3Dyy1+Ujvi3eVffXrkvSXCP6VImY2CDxfa9Rkc
	 rxMydFlngf/owShH1tx7uShT+fWv9oznJMUBL+NzCM5OD5eOdPaJ/D74aj6CqrFrVq
	 6GnCeGjHj8MnA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 8B8691AC57F9; Fri, 06 Feb 2026 17:51:30 +0000 (GMT)
Date: Fri, 6 Feb 2026 17:51:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Mingyou Chen <qby140326@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: Re: [PATCH] ASoC: amd: add DMIC support for RPL platform
Message-ID: <aYYqIjmPesB_bo7j@sirena.co.uk>
References: <20260205020706.29058-1-qby140326@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2U3jqSPMi1HUPriL"
Content-Disposition: inline
In-Reply-To: <20260205020706.29058-1-qby140326@gmail.com>
X-Cookie: Think big.  Pollute the Mississippi.


--2U3jqSPMi1HUPriL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 05, 2026 at 10:07:03AM +0800, Mingyou Chen wrote:
> Add DMIC support for the AMD RPL platform. The drivers are derived on
> the YC platform driver.

Copying in some of the AMD people - there's no MAINTAINERS entry for the
AMD ASoC drivers, it'd probably be good to add one so people are more
likely to CC you on changes.

> Signed-off-by: Mingyou Chen <qby140326@gmail.com>
> ---
>  sound/soc/amd/Kconfig                         |  11 +
>  sound/soc/amd/rpl/Makefile                    |   4 +
>  sound/soc/amd/rpl/rpl-acp6x-mach.c            | 131 +++++
>  sound/soc/amd/rpl/rpl-acp6x-pdm-dma.c         | 454 ++++++++++++++++++
>  sound/soc/amd/rpl/rpl-pci-acp6x.c             | 123 ++++-
>  sound/soc/amd/rpl/rpl_acp6x.h                 |  90 +++-
>  .../soc/amd/rpl/rpl_acp6x_chip_offset_byte.h  | 420 +++++++++++++++-
>  7 files changed, 1221 insertions(+), 12 deletions(-)
>  create mode 100644 sound/soc/amd/rpl/rpl-acp6x-mach.c
>  create mode 100644 sound/soc/amd/rpl/rpl-acp6x-pdm-dma.c
>=20
> diff --git a/sound/soc/amd/Kconfig b/sound/soc/amd/Kconfig
> index fd35a03aadcb..da2940e94a7e 100644
> --- a/sound/soc/amd/Kconfig
> +++ b/sound/soc/amd/Kconfig
> @@ -134,6 +134,17 @@ config SND_SOC_AMD_RPL_ACP6x
>            Say m if you have such a device.
>            If unsure select "N".
> =20
> +config SND_SOC_AMD_RPL_MACH
> +	tristate "AMD RPL support for DMIC"
> +	select SND_SOC_DMIC
> +	depends on SND_SOC_AMD_ACP6x && ACPI
> +	help
> +	  This option enables machine driver for AMD RPL platform
> +	  using dmic. ACP IP has PDM Decoder block with DMA controller.
> +	  DMIC can be connected directly to ACP IP.
> +	  Say m if you have such a device.
> +	  If unsure select "N".
> +
>  config SND_SOC_AMD_ACP63_TOPLEVEL
>  	tristate "support for AMD platforms with ACP version >=3D 6.3"
>  	default SND_AMD_ACP_CONFIG
> diff --git a/sound/soc/amd/rpl/Makefile b/sound/soc/amd/rpl/Makefile
> index a3825c5be4e7..b1190fcdf1f6 100644
> --- a/sound/soc/amd/rpl/Makefile
> +++ b/sound/soc/amd/rpl/Makefile
> @@ -1,5 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0+
>  # RPL platform Support
>  snd-rpl-pci-acp6x-y	:=3D rpl-pci-acp6x.o
> +snd-rpl-acp6x-pdm-dma-y	:=3D rpl-acp6x-pdm-dma.o
> +snd-soc-rpl-acp6x-mach-y	:=3D rpl-acp6x-mach.o
> =20
>  obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) +=3D snd-rpl-pci-acp6x.o
> +obj-$(CONFIG_SND_SOC_AMD_RPL_ACP6x) +=3D snd-rpl-acp6x-pdm-dma.o
> +obj-$(CONFIG_SND_SOC_AMD_RPL_MACH)   +=3D snd-soc-rpl-acp6x-mach.o
> diff --git a/sound/soc/amd/rpl/rpl-acp6x-mach.c b/sound/soc/amd/rpl/rpl-a=
cp6x-mach.c
> new file mode 100644
> index 000000000000..71a384b9a36c
> --- /dev/null
> +++ b/sound/soc/amd/rpl/rpl-acp6x-mach.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Machine driver for AMD RPL platform using DMIC
> + *
> + * Copyright 2025 Advanced Micro Devices, Inc.
> + */
> +
> +#include <sound/soc.h>
> +#include <sound/soc-dapm.h>
> +#include <linux/module.h>
> +#include <sound/pcm.h>
> +#include <sound/pcm_params.h>
> +#include <linux/io.h>
> +#include <linux/dmi.h>
> +#include <linux/acpi.h>
> +
> +#include "rpl_acp6x.h"
> +
> +#define DRV_NAME "acp_rpl_mach"
> +
> +SND_SOC_DAILINK_DEF(acp6x_pdm,
> +		    DAILINK_COMP_ARRAY(COMP_CPU("acp_rpl_pdm_dma.0")));
> +
> +SND_SOC_DAILINK_DEF(dmic_codec,
> +		    DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec.0",
> +						  "dmic-hifi")));
> +
> +SND_SOC_DAILINK_DEF(pdm_platform,
> +		    DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_rpl_pdm_dma.0")));
> +
> +static struct snd_soc_dai_link acp6x_dai_pdm[] =3D {
> +	{
> +		.name =3D "rpl-acp6x-dmic-capture",
> +		.stream_name =3D "DMIC capture",
> +		.capture_only =3D 1,
> +		SND_SOC_DAILINK_REG(acp6x_pdm, dmic_codec, pdm_platform),
> +	},
> +};
> +
> +static struct snd_soc_card acp6x_card =3D {
> +	.name =3D "acp6x",
> +	.owner =3D THIS_MODULE,
> +	.dai_link =3D acp6x_dai_pdm,
> +	.num_links =3D 1,
> +};
> +
> +static const struct dmi_system_id rpl_acp_quirk_table[] =3D {
> +	{
> +		.driver_data =3D &acp6x_card,
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "Lecoo"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Bellator N176"),
> +		}
> +	},
> +	{}
> +};
> +
> +static int acp6x_probe(struct platform_device *pdev)
> +{
> +	const struct dmi_system_id *dmi_id;
> +	struct acp6x_pdm *machine =3D NULL;
> +	struct snd_soc_card *card;
> +	struct acpi_device *adev;
> +	acpi_handle handle;
> +	acpi_integer dmic_status;
> +	int ret;
> +	bool is_dmic_enable, wov_en;
> +
> +	/* IF WOV entry not found, enable dmic based on AcpDmicConnected entry*/
> +	is_dmic_enable =3D false;
> +	wov_en =3D true;
> +	/* check the parent device's firmware node has _DSD or not */
> +	adev =3D ACPI_COMPANION(pdev->dev.parent);
> +	if (adev) {
> +		const union acpi_object *obj;
> +
> +		if (!acpi_dev_get_property(adev, "AcpDmicConnected", ACPI_TYPE_INTEGER=
, &obj) &&
> +		    obj->integer.value =3D=3D 1)
> +			is_dmic_enable =3D true;
> +	}
> +
> +	handle =3D ACPI_HANDLE(pdev->dev.parent);
> +	ret =3D acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
> +	if (!ACPI_FAILURE(ret)) {
> +		wov_en =3D dmic_status;
> +		if (!wov_en)
> +			return -ENODEV;
> +	} else {
> +		/* Incase of ACPI method read failure then jump to check_dmi_entry */
> +		goto check_dmi_entry;
> +	}
> +
> +	if (is_dmic_enable)
> +		platform_set_drvdata(pdev, &acp6x_card);
> +
> +check_dmi_entry:
> +	/* check for any DMI overrides */
> +	dmi_id =3D dmi_first_match(rpl_acp_quirk_table);
> +	if (dmi_id)
> +		platform_set_drvdata(pdev, dmi_id->driver_data);
> +
> +	card =3D platform_get_drvdata(pdev);
> +	if (!card)
> +		return -ENODEV;
> +	dev_info(&pdev->dev, "Enabling ACP DMIC support via %s", dmi_id ? "DMI"=
 : "ACPI");
> +	acp6x_card.dev =3D &pdev->dev;
> +
> +	snd_soc_card_set_drvdata(card, machine);
> +	ret =3D devm_snd_soc_register_card(&pdev->dev, card);
> +	if (ret) {
> +		return dev_err_probe(&pdev->dev, ret,
> +				"snd_soc_register_card(%s) failed\n",
> +				card->name);
> +	}
> +	return 0;
> +}
> +
> +static struct platform_driver rpl_acp6x_mach_driver =3D {
> +	.driver =3D {
> +		.name =3D "acp_rpl_mach",
> +		.pm =3D &snd_soc_pm_ops,
> +	},
> +	.probe =3D acp6x_probe,
> +};
> +
> +module_platform_driver(rpl_acp6x_mach_driver);
> +
> +MODULE_DESCRIPTION("AMD RPL support for DMIC");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRV_NAME);
> +
> diff --git a/sound/soc/amd/rpl/rpl-acp6x-pdm-dma.c b/sound/soc/amd/rpl/rp=
l-acp6x-pdm-dma.c
> new file mode 100644
> index 000000000000..2ae6d388e488
> --- /dev/null
> +++ b/sound/soc/amd/rpl/rpl-acp6x-pdm-dma.c
> @@ -0,0 +1,454 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * AMD ALSA SoC RPL PDM Driver
> + *
> + * Copyright 2021 Advanced Micro Devices, Inc.
> + */
> +
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/bitfield.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/soc-dai.h>
> +#include <linux/pm_runtime.h>
> +
> +#include "rpl_acp6x.h"
> +
> +#define DRV_NAME "acp_rpl_pdm_dma"
> +
> +static int pdm_gain =3D 3;
> +module_param(pdm_gain, int, 0644);
> +MODULE_PARM_DESC(pdm_gain, "Gain control (0-3)");
> +
> +static const struct snd_pcm_hardware acp6x_pdm_hardware_capture =3D {
> +	.info =3D SNDRV_PCM_INFO_INTERLEAVED |
> +		SNDRV_PCM_INFO_BLOCK_TRANSFER |
> +		SNDRV_PCM_INFO_MMAP |
> +		SNDRV_PCM_INFO_MMAP_VALID |
> +		SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME,
> +	.formats =3D SNDRV_PCM_FMTBIT_S32_LE,
> +	.channels_min =3D 2,
> +	.channels_max =3D 2,
> +	.rates =3D SNDRV_PCM_RATE_48000,
> +	.rate_min =3D 48000,
> +	.rate_max =3D 48000,
> +	.buffer_bytes_max =3D CAPTURE_MAX_NUM_PERIODS * CAPTURE_MAX_PERIOD_SIZE,
> +	.period_bytes_min =3D CAPTURE_MIN_PERIOD_SIZE,
> +	.period_bytes_max =3D CAPTURE_MAX_PERIOD_SIZE,
> +	.periods_min =3D CAPTURE_MIN_NUM_PERIODS,
> +	.periods_max =3D CAPTURE_MAX_NUM_PERIODS,
> +};
> +
> +static void acp6x_init_pdm_ring_buffer(u32 physical_addr, u32 buffer_siz=
e,
> +				       u32 watermark_size, void __iomem *acp_base)
> +{
> +	rpl_acp_writel(physical_addr, acp_base + ACP_WOV_RX_RINGBUFADDR);
> +	rpl_acp_writel(buffer_size, acp_base + ACP_WOV_RX_RINGBUFSIZE);
> +	rpl_acp_writel(watermark_size, acp_base + ACP_WOV_RX_INTR_WATERMARK_SIZ=
E);
> +	rpl_acp_writel(0x01, acp_base + ACPAXI2AXI_ATU_CTRL);
> +}
> +
> +static void acp6x_enable_pdm_clock(void __iomem *acp_base)
> +{
> +	u32 pdm_clk_enable, pdm_ctrl;
> +
> +	pdm_clk_enable =3D ACP_PDM_CLK_FREQ_MASK;
> +	pdm_ctrl =3D 0x00;
> +
> +	rpl_acp_writel(pdm_clk_enable, acp_base + ACP_WOV_CLK_CTRL);
> +	pdm_ctrl =3D rpl_acp_readl(acp_base + ACP_WOV_MISC_CTRL);
> +	pdm_ctrl &=3D ~ACP_WOV_GAIN_CONTROL;
> +	pdm_ctrl |=3D FIELD_PREP(ACP_WOV_GAIN_CONTROL, clamp(pdm_gain, 0, 3));
> +	rpl_acp_writel(pdm_ctrl, acp_base + ACP_WOV_MISC_CTRL);
> +}
> +
> +static void acp6x_enable_pdm_interrupts(void __iomem *acp_base)
> +{
> +	u32 ext_int_ctrl;
> +
> +	ext_int_ctrl =3D rpl_acp_readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
> +	ext_int_ctrl |=3D PDM_DMA_INTR_MASK;
> +	rpl_acp_writel(ext_int_ctrl, acp_base + ACP_EXTERNAL_INTR_CNTL);
> +}
> +
> +static void acp6x_disable_pdm_interrupts(void __iomem *acp_base)
> +{
> +	u32 ext_int_ctrl;
> +
> +	ext_int_ctrl =3D rpl_acp_readl(acp_base + ACP_EXTERNAL_INTR_CNTL);
> +	ext_int_ctrl &=3D ~PDM_DMA_INTR_MASK;
> +	rpl_acp_writel(ext_int_ctrl, acp_base + ACP_EXTERNAL_INTR_CNTL);
> +}
> +
> +static bool acp6x_check_pdm_dma_status(void __iomem *acp_base)
> +{
> +	bool pdm_dma_status;
> +	u32 pdm_enable, pdm_dma_enable;
> +
> +	pdm_dma_status =3D false;
> +	pdm_enable =3D rpl_acp_readl(acp_base + ACP_WOV_PDM_ENABLE);
> +	pdm_dma_enable =3D rpl_acp_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
> +	if ((pdm_enable & ACP_PDM_ENABLE) && (pdm_dma_enable & ACP_PDM_DMA_EN_S=
TATUS))
> +		pdm_dma_status =3D true;
> +
> +	return pdm_dma_status;
> +}
> +
> +static int acp6x_start_pdm_dma(void __iomem *acp_base)
> +{
> +	u32 pdm_enable;
> +	u32 pdm_dma_enable;
> +	int timeout;
> +
> +	pdm_enable =3D 0x01;
> +	pdm_dma_enable  =3D 0x01;
> +
> +	acp6x_enable_pdm_clock(acp_base);
> +	rpl_acp_writel(pdm_enable, acp_base + ACP_WOV_PDM_ENABLE);
> +	rpl_acp_writel(pdm_dma_enable, acp_base + ACP_WOV_PDM_DMA_ENABLE);
> +	timeout =3D 0;
> +	while (++timeout < ACP_COUNTER) {
> +		pdm_dma_enable =3D rpl_acp_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
> +		if ((pdm_dma_enable & 0x02) =3D=3D ACP_PDM_DMA_EN_STATUS)
> +			return 0;
> +		udelay(DELAY_US);
> +	}
> +	return -ETIMEDOUT;
> +}
> +
> +static int acp6x_stop_pdm_dma(void __iomem *acp_base)
> +{
> +	u32 pdm_enable, pdm_dma_enable;
> +	int timeout;
> +
> +	pdm_enable =3D 0x00;
> +	pdm_dma_enable  =3D 0x00;
> +
> +	pdm_enable =3D rpl_acp_readl(acp_base + ACP_WOV_PDM_ENABLE);
> +	pdm_dma_enable =3D rpl_acp_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
> +	if (pdm_dma_enable & 0x01) {
> +		pdm_dma_enable =3D 0x02;
> +		rpl_acp_writel(pdm_dma_enable, acp_base + ACP_WOV_PDM_DMA_ENABLE);
> +		timeout =3D 0;
> +		while (++timeout < ACP_COUNTER) {
> +			pdm_dma_enable =3D rpl_acp_readl(acp_base + ACP_WOV_PDM_DMA_ENABLE);
> +			if ((pdm_dma_enable & 0x02) =3D=3D 0x00)
> +				break;
> +			udelay(DELAY_US);
> +		}
> +		if (timeout =3D=3D ACP_COUNTER)
> +			return -ETIMEDOUT;
> +	}
> +	if (pdm_enable =3D=3D ACP_PDM_ENABLE) {
> +		pdm_enable =3D ACP_PDM_DISABLE;
> +		rpl_acp_writel(pdm_enable, acp_base + ACP_WOV_PDM_ENABLE);
> +	}
> +	rpl_acp_writel(0x01, acp_base + ACP_WOV_PDM_FIFO_FLUSH);
> +	return 0;
> +}
> +
> +static void acp6x_config_dma(struct rpl_pdm_stream_instance *rtd, int di=
rection)
> +{
> +	u16 page_idx;
> +	u32 low, high, val;
> +	dma_addr_t addr;
> +
> +	addr =3D rtd->dma_addr;
> +	val =3D PDM_PTE_OFFSET;
> +
> +	/* Group Enable */
> +	rpl_acp_writel(ACP_SRAM_PTE_OFFSET | BIT(31), rtd->acp6x_base +
> +		     ACPAXI2AXI_ATU_BASE_ADDR_GRP_1);
> +	rpl_acp_writel(PAGE_SIZE_4K_ENABLE, rtd->acp6x_base +
> +		     ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1);
> +	for (page_idx =3D 0; page_idx < rtd->num_pages; page_idx++) {
> +		/* Load the low address of page int ACP SRAM through SRBM */
> +		low =3D lower_32_bits(addr);
> +		high =3D upper_32_bits(addr);
> +
> +		rpl_acp_writel(low, rtd->acp6x_base + ACP_SCRATCH_REG_0 + val);
> +		high |=3D BIT(31);
> +		rpl_acp_writel(high, rtd->acp6x_base + ACP_SCRATCH_REG_0 + val + 4);
> +		val +=3D 8;
> +		addr +=3D PAGE_SIZE;
> +	}
> +}
> +
> +static int acp6x_pdm_dma_open(struct snd_soc_component *component,
> +			      struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime;
> +	struct rpl_pdm_dev_data *adata;
> +	struct rpl_pdm_stream_instance *pdm_data;
> +	int ret;
> +
> +	runtime =3D substream->runtime;
> +	adata =3D dev_get_drvdata(component->dev);
> +	pdm_data =3D kzalloc(sizeof(*pdm_data), GFP_KERNEL);
> +	if (!pdm_data)
> +		return -EINVAL;
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
> +		runtime->hw =3D acp6x_pdm_hardware_capture;
> +
> +	ret =3D snd_pcm_hw_constraint_integer(runtime,
> +					    SNDRV_PCM_HW_PARAM_PERIODS);
> +	if (ret < 0) {
> +		dev_err(component->dev, "set integer constraint failed\n");
> +		kfree(pdm_data);
> +		return ret;
> +	}
> +
> +	acp6x_enable_pdm_interrupts(adata->acp6x_base);
> +
> +	if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
> +		adata->capture_stream =3D substream;
> +
> +	pdm_data->acp6x_base =3D adata->acp6x_base;
> +	runtime->private_data =3D pdm_data;
> +	return ret;
> +}
> +
> +static int acp6x_pdm_dma_hw_params(struct snd_soc_component *component,
> +				   struct snd_pcm_substream *substream,
> +				   struct snd_pcm_hw_params *params)
> +{
> +	struct rpl_pdm_stream_instance *rtd;
> +	size_t size, period_bytes;
> +
> +	rtd =3D substream->runtime->private_data;
> +	if (!rtd)
> +		return -EINVAL;
> +	size =3D params_buffer_bytes(params);
> +	period_bytes =3D params_period_bytes(params);
> +	rtd->dma_addr =3D substream->runtime->dma_addr;
> +	rtd->num_pages =3D (PAGE_ALIGN(size) >> PAGE_SHIFT);
> +	acp6x_config_dma(rtd, substream->stream);
> +	acp6x_init_pdm_ring_buffer(PDM_MEM_WINDOW_START, size,
> +				   period_bytes, rtd->acp6x_base);
> +	return 0;
> +}
> +
> +static u64 acp6x_pdm_get_byte_count(struct rpl_pdm_stream_instance *rtd,
> +				    int direction)
> +{
> +	union rpl_acp_pdm_dma_count byte_count;
> +
> +	byte_count.bcount.high =3D
> +			rpl_acp_readl(rtd->acp6x_base + ACP_WOV_RX_LINEARPOSITIONCNTR_HIGH);
> +	byte_count.bcount.low =3D
> +			rpl_acp_readl(rtd->acp6x_base + ACP_WOV_RX_LINEARPOSITIONCNTR_LOW);
> +	return byte_count.bytescount;
> +}
> +
> +static snd_pcm_uframes_t acp6x_pdm_dma_pointer(struct snd_soc_component =
*comp,
> +					       struct snd_pcm_substream *stream)
> +{
> +	struct rpl_pdm_stream_instance *rtd;
> +	u32 pos, buffersize;
> +	u64 bytescount;
> +
> +	rtd =3D stream->runtime->private_data;
> +	buffersize =3D frames_to_bytes(stream->runtime,
> +				     stream->runtime->buffer_size);
> +	bytescount =3D acp6x_pdm_get_byte_count(rtd, stream->stream);
> +	if (bytescount > rtd->bytescount)
> +		bytescount -=3D rtd->bytescount;
> +	pos =3D do_div(bytescount, buffersize);
> +	return bytes_to_frames(stream->runtime, pos);
> +}
> +
> +static int acp6x_pdm_dma_new(struct snd_soc_component *component,
> +			     struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct device *parent =3D component->dev->parent;
> +
> +	snd_pcm_set_managed_buffer_all(rtd->pcm, SNDRV_DMA_TYPE_DEV,
> +				       parent, MIN_BUFFER, MAX_BUFFER);
> +	return 0;
> +}
> +
> +static int acp6x_pdm_dma_close(struct snd_soc_component *component,
> +			       struct snd_pcm_substream *substream)
> +{
> +	struct rpl_pdm_dev_data *adata =3D dev_get_drvdata(component->dev);
> +
> +	acp6x_disable_pdm_interrupts(adata->acp6x_base);
> +	adata->capture_stream =3D NULL;
> +	return 0;
> +}
> +
> +static int acp6x_pdm_dai_trigger(struct snd_pcm_substream *substream,
> +				 int cmd, struct snd_soc_dai *dai)
> +{
> +	struct rpl_pdm_stream_instance *rtd;
> +	int ret;
> +	bool pdm_status;
> +	unsigned int ch_mask;
> +
> +	rtd =3D substream->runtime->private_data;
> +	ret =3D 0;
> +	switch (substream->runtime->channels) {
> +	case TWO_CH:
> +		ch_mask =3D 0x00;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		rpl_acp_writel(ch_mask, rtd->acp6x_base + ACP_WOV_PDM_NO_OF_CHANNELS);
> +		rpl_acp_writel(PDM_DECIMATION_FACTOR, rtd->acp6x_base +
> +			     ACP_WOV_PDM_DECIMATION_FACTOR);
> +		rtd->bytescount =3D acp6x_pdm_get_byte_count(rtd, substream->stream);
> +		pdm_status =3D acp6x_check_pdm_dma_status(rtd->acp6x_base);
> +		if (!pdm_status)
> +			ret =3D acp6x_start_pdm_dma(rtd->acp6x_base);
> +		break;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		pdm_status =3D acp6x_check_pdm_dma_status(rtd->acp6x_base);
> +		if (pdm_status)
> +			ret =3D acp6x_stop_pdm_dma(rtd->acp6x_base);
> +		break;
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static const struct snd_soc_dai_ops acp6x_pdm_dai_ops =3D {
> +	.trigger   =3D acp6x_pdm_dai_trigger,
> +};
> +
> +static struct snd_soc_dai_driver acp6x_pdm_dai_driver =3D {
> +	.capture =3D {
> +		.rates =3D SNDRV_PCM_RATE_48000,
> +		.formats =3D SNDRV_PCM_FMTBIT_S32_LE,
> +		.channels_min =3D 2,
> +		.channels_max =3D 2,
> +		.rate_min =3D 48000,
> +		.rate_max =3D 48000,
> +	},
> +	.ops =3D &acp6x_pdm_dai_ops,
> +};
> +
> +static const struct snd_soc_component_driver acp6x_pdm_component =3D {
> +	.name			=3D DRV_NAME,
> +	.open			=3D acp6x_pdm_dma_open,
> +	.close			=3D acp6x_pdm_dma_close,
> +	.hw_params		=3D acp6x_pdm_dma_hw_params,
> +	.pointer		=3D acp6x_pdm_dma_pointer,
> +	.pcm_construct		=3D acp6x_pdm_dma_new,
> +	.legacy_dai_naming	=3D 1,
> +};
> +
> +static int acp6x_pdm_audio_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct rpl_pdm_dev_data *adata;
> +	int status;
> +
> +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res) {
> +		dev_err(&pdev->dev, "IORESOURCE_MEM FAILED\n");
> +		return -ENODEV;
> +	}
> +
> +	adata =3D devm_kzalloc(&pdev->dev, sizeof(*adata), GFP_KERNEL);
> +	if (!adata)
> +		return -ENOMEM;
> +
> +	adata->acp6x_base =3D devm_ioremap(&pdev->dev, res->start, resource_siz=
e(res));
> +	if (!adata->acp6x_base)
> +		return -ENOMEM;
> +
> +	adata->capture_stream =3D NULL;
> +
> +	dev_set_drvdata(&pdev->dev, adata);
> +	status =3D devm_snd_soc_register_component(&pdev->dev,
> +						 &acp6x_pdm_component,
> +						 &acp6x_pdm_dai_driver, 1);
> +	if (status) {
> +		dev_err(&pdev->dev, "Fail to register acp pdm dai\n");
> +
> +		return -ENODEV;
> +	}
> +	pm_runtime_set_autosuspend_delay(&pdev->dev, ACP_SUSPEND_DELAY_MS);
> +	pm_runtime_use_autosuspend(&pdev->dev);
> +	pm_runtime_mark_last_busy(&pdev->dev);
> +	pm_runtime_set_active(&pdev->dev);
> +	pm_runtime_enable(&pdev->dev);
> +	return 0;
> +}
> +
> +static void acp6x_pdm_audio_remove(struct platform_device *pdev)
> +{
> +	pm_runtime_disable(&pdev->dev);
> +}
> +
> +static int acp6x_pdm_resume(struct device *dev)
> +{
> +	struct rpl_pdm_dev_data *adata;
> +	struct snd_pcm_runtime *runtime;
> +	struct rpl_pdm_stream_instance *rtd;
> +	u32 period_bytes, buffer_len;
> +
> +	adata =3D dev_get_drvdata(dev);
> +	if (adata->capture_stream && adata->capture_stream->runtime) {
> +		runtime =3D adata->capture_stream->runtime;
> +		rtd =3D runtime->private_data;
> +		period_bytes =3D frames_to_bytes(runtime, runtime->period_size);
> +		buffer_len =3D frames_to_bytes(runtime, runtime->buffer_size);
> +		acp6x_config_dma(rtd, SNDRV_PCM_STREAM_CAPTURE);
> +		acp6x_init_pdm_ring_buffer(PDM_MEM_WINDOW_START, buffer_len,
> +					   period_bytes, adata->acp6x_base);
> +	}
> +	acp6x_enable_pdm_interrupts(adata->acp6x_base);
> +	return 0;
> +}
> +
> +static int acp6x_pdm_suspend(struct device *dev)
> +{
> +	struct rpl_pdm_dev_data *adata;
> +
> +	adata =3D dev_get_drvdata(dev);
> +	acp6x_disable_pdm_interrupts(adata->acp6x_base);
> +	return 0;
> +}
> +
> +static int acp6x_pdm_runtime_resume(struct device *dev)
> +{
> +	struct rpl_pdm_dev_data *adata;
> +
> +	adata =3D dev_get_drvdata(dev);
> +	acp6x_enable_pdm_interrupts(adata->acp6x_base);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops acp6x_pdm_pm_ops =3D {
> +	RUNTIME_PM_OPS(acp6x_pdm_suspend, acp6x_pdm_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(acp6x_pdm_suspend, acp6x_pdm_resume)
> +};
> +
> +static struct platform_driver acp6x_pdm_dma_driver =3D {
> +	.probe =3D acp6x_pdm_audio_probe,
> +	.remove =3D acp6x_pdm_audio_remove,
> +	.driver =3D {
> +		.name =3D "acp_rpl_pdm_dma",
> +		.pm =3D pm_ptr(&acp6x_pdm_pm_ops),
> +	},
> +};
> +
> +module_platform_driver(acp6x_pdm_dma_driver);
> +
> +MODULE_DESCRIPTION("AMD ACP6x RPL PDM Driver");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:" DRV_NAME);
> diff --git a/sound/soc/amd/rpl/rpl-pci-acp6x.c b/sound/soc/amd/rpl/rpl-pc=
i-acp6x.c
> index e3afe9172bdf..9a0d9920ad8e 100644
> --- a/sound/soc/amd/rpl/rpl-pci-acp6x.c
> +++ b/sound/soc/amd/rpl/rpl-pci-acp6x.c
> @@ -10,12 +10,16 @@
>  #include <linux/io.h>
>  #include <linux/delay.h>
>  #include <linux/platform_device.h>
> +#include <sound/pcm.h>
>  #include <linux/pm_runtime.h>
> =20
>  #include "rpl_acp6x.h"
> =20
>  struct rpl_dev_data {
>  	void __iomem *acp6x_base;
> +	struct resource *res;
> +	bool acp6x_audio_mode;
> +	struct platform_device *pdev[ACP6x_DEVS];
>  };
> =20
>  static int rpl_power_on(void __iomem *acp_base)
> @@ -64,6 +68,19 @@ static int rpl_reset(void __iomem *acp_base)
>  	return -ETIMEDOUT;
>  }
> =20
> +static void rpl_enable_interrupts(void __iomem *acp_base)
> +{
> +	rpl_acp_writel(0x01, acp_base + ACP_EXTERNAL_INTR_ENB);
> +}
> +
> +static void rpl_disable_interrupts(void __iomem *acp_base)
> +{
> +	rpl_acp_writel(ACP_EXT_INTR_STAT_CLEAR_MASK, acp_base +
> +		     ACP_EXTERNAL_INTR_STAT);
> +	rpl_acp_writel(0x00, acp_base + ACP_EXTERNAL_INTR_CNTL);
> +	rpl_acp_writel(0x00, acp_base + ACP_EXTERNAL_INTR_ENB);
> +}
> +
>  static int rpl_init(void __iomem *acp_base)
>  {
>  	int ret;
> @@ -82,6 +99,7 @@ static int rpl_init(void __iomem *acp_base)
>  		return ret;
>  	}
>  	rpl_acp_writel(0x03, acp_base + ACP_CLKMUX_SEL);
> +	rpl_enable_interrupts(acp_base);
>  	return 0;
>  }
> =20
> @@ -89,6 +107,7 @@ static int rpl_deinit(void __iomem *acp_base)
>  {
>  	int ret;
> =20
> +	rpl_disable_interrupts(acp_base);
>  	/* Reset */
>  	ret =3D rpl_reset(acp_base);
>  	if (ret) {
> @@ -100,13 +119,45 @@ static int rpl_deinit(void __iomem *acp_base)
>  	return 0;
>  }
> =20
> +static irqreturn_t rpl_irq_handler(int irq, void *dev_id)
> +{
> +	struct rpl_dev_data *adata;
> +	struct rpl_pdm_dev_data *rpl_pdm_data;
> +	u32 val;
> +
> +	adata =3D dev_id;
> +	if (!adata)
> +		return IRQ_NONE;
> +
> +	val =3D rpl_acp_readl(adata->acp6x_base + ACP_EXTERNAL_INTR_STAT);
> +	if (val & BIT(PDM_DMA_STAT)) {
> +		rpl_pdm_data =3D dev_get_drvdata(&adata->pdev[0]->dev);
> +		rpl_acp_writel(BIT(PDM_DMA_STAT), adata->acp6x_base + ACP_EXTERNAL_INT=
R_STAT);
> +		if (rpl_pdm_data->capture_stream)
> +			snd_pcm_period_elapsed(rpl_pdm_data->capture_stream);
> +		return IRQ_HANDLED;
> +	}
> +	return IRQ_NONE;
> +}
> +
>  static int snd_rpl_probe(struct pci_dev *pci,
>  			 const struct pci_device_id *pci_id)
>  {
>  	struct rpl_dev_data *adata;
> +	struct platform_device_info pdevinfo[ACP6x_DEVS];
> +	int index =3D 0;
> +	int val =3D 0x00;
> +	unsigned int irqflags, flag;
>  	u32 addr;
>  	int ret;
> =20
> +	irqflags =3D IRQF_SHARED;
> +
> +	/* Return if acp config flag is defined */
> +	flag =3D snd_amd_acp_find_config(pci);
> +	if (flag)
> +		return -ENODEV;
> +
>  	/* RPL device check */
>  	switch (pci->revision) {
>  	case 0x62:
> @@ -145,12 +196,78 @@ static int snd_rpl_probe(struct pci_dev *pci,
>  	ret =3D rpl_init(adata->acp6x_base);
>  	if (ret)
>  		goto release_regions;
> +
> +	val =3D rpl_acp_readl(adata->acp6x_base + ACP_PIN_CONFIG);
> +	switch (val) {
> +	case ACP_CONFIG_0:
> +	case ACP_CONFIG_1:
> +	case ACP_CONFIG_2:
> +	case ACP_CONFIG_3:
> +	case ACP_CONFIG_9:
> +	case ACP_CONFIG_15:
> +		dev_info(&pci->dev, "Audio Mode %d\n", val);
> +		break;
> +	default:
> +		adata->res =3D devm_kzalloc(&pci->dev,
> +					  sizeof(struct resource),
> +					  GFP_KERNEL);
> +		if (!adata->res) {
> +			ret =3D -ENOMEM;
> +			goto de_init;
> +		}
> +
> +		adata->res->name =3D "acp_iomem";
> +		adata->res->flags =3D IORESOURCE_MEM;
> +		adata->res->start =3D addr;
> +		adata->res->end =3D addr + (ACP6x_REG_END - ACP6x_REG_START);
> +
> +		adata->acp6x_audio_mode =3D ACP6x_PDM_MODE;
> +
> +		memset(&pdevinfo, 0, sizeof(pdevinfo));
> +		pdevinfo[0].name =3D "acp_rpl_pdm_dma";
> +		pdevinfo[0].id =3D 0;
> +		pdevinfo[0].parent =3D &pci->dev;
> +		pdevinfo[0].num_res =3D 1;
> +		pdevinfo[0].res =3D adata->res;
> +
> +		pdevinfo[1].name =3D "dmic-codec";
> +		pdevinfo[1].id =3D 0;
> +		pdevinfo[1].parent =3D &pci->dev;
> +
> +		pdevinfo[2].name =3D "acp_rpl_mach";
> +		pdevinfo[2].id =3D 0;
> +		pdevinfo[2].parent =3D &pci->dev;
> +
> +		for (index =3D 0; index < ACP6x_DEVS; index++) {
> +			adata->pdev[index] =3D
> +				platform_device_register_full(&pdevinfo[index]);
> +			if (IS_ERR(adata->pdev[index])) {
> +				dev_err(&pci->dev, "cannot register %s device\n",
> +					pdevinfo[index].name);
> +				ret =3D PTR_ERR(adata->pdev[index]);
> +				goto unregister_devs;
> +			}
> +		}
> +		break;
> +	}
> +	ret =3D devm_request_irq(&pci->dev, pci->irq, rpl_irq_handler,
> +			       irqflags, "ACP_PCI_IRQ", adata);
> +	if (ret) {
> +		dev_err(&pci->dev, "ACP PCI IRQ request failed\n");
> +		goto unregister_devs;
> +	}
>  	pm_runtime_set_autosuspend_delay(&pci->dev, ACP_SUSPEND_DELAY_MS);
>  	pm_runtime_use_autosuspend(&pci->dev);
>  	pm_runtime_put_noidle(&pci->dev);
>  	pm_runtime_allow(&pci->dev);
> =20
>  	return 0;
> +unregister_devs:
> +	for (--index; index >=3D 0; index--)
> +		platform_device_unregister(adata->pdev[index]);
> +de_init:
> +	if (rpl_deinit(adata->acp6x_base))
> +		dev_err(&pci->dev, "ACP de-init failed\n");
>  release_regions:
>  	pci_release_regions(pci);
>  disable_pci:
> @@ -191,9 +308,13 @@ static const struct dev_pm_ops rpl_pm =3D {
>  static void snd_rpl_remove(struct pci_dev *pci)
>  {
>  	struct rpl_dev_data *adata;
> -	int ret;
> +	int ret, index;
> =20
>  	adata =3D pci_get_drvdata(pci);
> +	if (adata->acp6x_audio_mode =3D=3D ACP6x_PDM_MODE) {
> +		for (index =3D 0; index < ACP6x_DEVS; index++)
> +			platform_device_unregister(adata->pdev[index]);
> +	}
>  	ret =3D rpl_deinit(adata->acp6x_base);
>  	if (ret)
>  		dev_err(&pci->dev, "ACP de-init failed\n");
> diff --git a/sound/soc/amd/rpl/rpl_acp6x.h b/sound/soc/amd/rpl/rpl_acp6x.h
> index f5816a33632e..d470927c1e35 100644
> --- a/sound/soc/amd/rpl/rpl_acp6x.h
> +++ b/sound/soc/amd/rpl/rpl_acp6x.h
> @@ -9,15 +9,46 @@
> =20
>  #define ACP_DEVICE_ID 0x15E2
>  #define ACP6x_PHY_BASE_ADDRESS 0x1240000
> +#define ACP6x_REG_START		0x1240000
> +#define ACP6x_REG_END		0x1250200
> +#define ACP6x_DEVS		3
> +#define ACP6x_PDM_MODE		1
> =20
> -#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK   0x00010001
> -#define ACP_PGFSM_CNTL_POWER_ON_MASK    1
> -#define ACP_PGFSM_CNTL_POWER_OFF_MASK   0
> -#define ACP_PGFSM_STATUS_MASK           3
> -#define ACP_POWERED_ON                  0
> -#define ACP_POWER_ON_IN_PROGRESS        1
> -#define ACP_POWERED_OFF                 2
> -#define ACP_POWER_OFF_IN_PROGRESS       3
> +#define ACP_SOFT_RESET_SOFTRESET_AUDDONE_MASK	0x00010001
> +#define ACP_PGFSM_CNTL_POWER_ON_MASK	1
> +#define ACP_PGFSM_CNTL_POWER_OFF_MASK	0
> +#define ACP_PGFSM_STATUS_MASK		3
> +#define ACP_POWERED_ON			0
> +#define ACP_POWER_ON_IN_PROGRESS	1
> +#define ACP_POWERED_OFF			2
> +#define ACP_POWER_OFF_IN_PROGRESS	3
> +
> +#define ACP_ERROR_MASK 0x20000000
> +#define ACP_EXT_INTR_STAT_CLEAR_MASK 0xFFFFFFFF
> +#define PDM_DMA_STAT 0x10
> +
> +#define PDM_DMA_INTR_MASK	0x10000
> +#define ACP_ERROR_STAT	29
> +#define PDM_DECIMATION_FACTOR	2
> +#define ACP_PDM_CLK_FREQ_MASK	7
> +#define ACP_WOV_GAIN_CONTROL	GENMASK(4, 3)
> +#define ACP_PDM_ENABLE		1
> +#define ACP_PDM_DISABLE		0
> +#define ACP_PDM_DMA_EN_STATUS	2
> +#define TWO_CH		2
> +
> +#define ACP_SRAM_PTE_OFFSET	0x03800000
> +#define PAGE_SIZE_4K_ENABLE	2
> +#define PDM_PTE_OFFSET		0
> +#define PDM_MEM_WINDOW_START	0x4000000
> +
> +#define CAPTURE_MIN_NUM_PERIODS     4
> +#define CAPTURE_MAX_NUM_PERIODS     4
> +#define CAPTURE_MAX_PERIOD_SIZE     8192
> +#define CAPTURE_MIN_PERIOD_SIZE     4096
> +
> +#define MAX_BUFFER (CAPTURE_MAX_PERIOD_SIZE * CAPTURE_MAX_NUM_PERIODS)
> +#define MIN_BUFFER MAX_BUFFER
> =20
>  #define DELAY_US        5
>  #define ACP_COUNTER     20000
> @@ -25,6 +56,47 @@
>  /* time in ms for runtime suspend delay */
>  #define ACP_SUSPEND_DELAY_MS    2000
> =20
> +enum rpl_acp_config {
> +	ACP_CONFIG_0 =3D 0,
> +	ACP_CONFIG_1,
> +	ACP_CONFIG_2,
> +	ACP_CONFIG_3,
> +	ACP_CONFIG_4,
> +	ACP_CONFIG_5,
> +	ACP_CONFIG_6,
> +	ACP_CONFIG_7,
> +	ACP_CONFIG_8,
> +	ACP_CONFIG_9,
> +	ACP_CONFIG_10,
> +	ACP_CONFIG_11,
> +	ACP_CONFIG_12,
> +	ACP_CONFIG_13,
> +	ACP_CONFIG_14,
> +	ACP_CONFIG_15,
> +};
> +
> +struct rpl_pdm_dev_data {
> +	u32 pdm_irq;
> +	void __iomem *acp6x_base;
> +	struct snd_pcm_substream *capture_stream;
> +};
> +
> +struct rpl_pdm_stream_instance {
> +	u16 num_pages;
> +	u16 channels;
> +	dma_addr_t dma_addr;
> +	u64 bytescount;
> +	void __iomem *acp6x_base;
> +};
> +
> +union rpl_acp_pdm_dma_count {
> +	struct {
> +	u32 low;
> +	u32 high;
> +	} bcount;
> +	u64 bytescount;
> +};
> +
>  static inline u32 rpl_acp_readl(void __iomem *base_addr)
>  {
>  	return readl(base_addr - ACP6x_PHY_BASE_ADDRESS);
> @@ -34,3 +106,5 @@ static inline void rpl_acp_writel(u32 val, void __iome=
m *base_addr)
>  {
>  	writel(val, base_addr - ACP6x_PHY_BASE_ADDRESS);
>  }
> +
> +int snd_amd_acp_find_config(struct pci_dev *pci);
> diff --git a/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h b/sound/soc/a=
md/rpl/rpl_acp6x_chip_offset_byte.h
> index 456498f5396d..44994a925149 100644
> --- a/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
> +++ b/sound/soc/amd/rpl/rpl_acp6x_chip_offset_byte.h
> @@ -8,14 +8,114 @@
>  #ifndef _rpl_acp6x_OFFSET_HEADER
>  #define _rpl_acp6x_OFFSET_HEADER
> =20
> +/* Registers from ACP_DMA block */
> +#define ACP_DMA_CNTL_0                                0x1240000
> +#define ACP_DMA_CNTL_1                                0x1240004
> +#define ACP_DMA_CNTL_2                                0x1240008
> +#define ACP_DMA_CNTL_3                                0x124000C
> +#define ACP_DMA_CNTL_4                                0x1240010
> +#define ACP_DMA_CNTL_5                                0x1240014
> +#define ACP_DMA_CNTL_6                                0x1240018
> +#define ACP_DMA_CNTL_7                                0x124001C
> +#define ACP_DMA_DSCR_STRT_IDX_0                       0x1240020
> +#define ACP_DMA_DSCR_STRT_IDX_1                       0x1240024
> +#define ACP_DMA_DSCR_STRT_IDX_2                       0x1240028
> +#define ACP_DMA_DSCR_STRT_IDX_3                       0x124002C
> +#define ACP_DMA_DSCR_STRT_IDX_4                       0x1240030
> +#define ACP_DMA_DSCR_STRT_IDX_5                       0x1240034
> +#define ACP_DMA_DSCR_STRT_IDX_6                       0x1240038
> +#define ACP_DMA_DSCR_STRT_IDX_7                       0x124003C
> +#define ACP_DMA_DSCR_CNT_0                            0x1240040
> +#define ACP_DMA_DSCR_CNT_1                            0x1240044
> +#define ACP_DMA_DSCR_CNT_2                            0x1240048
> +#define ACP_DMA_DSCR_CNT_3                            0x124004C
> +#define ACP_DMA_DSCR_CNT_4                            0x1240050
> +#define ACP_DMA_DSCR_CNT_5                            0x1240054
> +#define ACP_DMA_DSCR_CNT_6                            0x1240058
> +#define ACP_DMA_DSCR_CNT_7                            0x124005C
> +#define ACP_DMA_PRIO_0                                0x1240060
> +#define ACP_DMA_PRIO_1                                0x1240064
> +#define ACP_DMA_PRIO_2                                0x1240068
> +#define ACP_DMA_PRIO_3                                0x124006C
> +#define ACP_DMA_PRIO_4                                0x1240070
> +#define ACP_DMA_PRIO_5                                0x1240074
> +#define ACP_DMA_PRIO_6                                0x1240078
> +#define ACP_DMA_PRIO_7                                0x124007C
> +#define ACP_DMA_CUR_DSCR_0                            0x1240080
> +#define ACP_DMA_CUR_DSCR_1                            0x1240084
> +#define ACP_DMA_CUR_DSCR_2                            0x1240088
> +#define ACP_DMA_CUR_DSCR_3                            0x124008C
> +#define ACP_DMA_CUR_DSCR_4                            0x1240090
> +#define ACP_DMA_CUR_DSCR_5                            0x1240094
> +#define ACP_DMA_CUR_DSCR_6                            0x1240098
> +#define ACP_DMA_CUR_DSCR_7                            0x124009C
> +#define ACP_DMA_CUR_TRANS_CNT_0                       0x12400A0
> +#define ACP_DMA_CUR_TRANS_CNT_1                       0x12400A4
> +#define ACP_DMA_CUR_TRANS_CNT_2                       0x12400A8
> +#define ACP_DMA_CUR_TRANS_CNT_3                       0x12400AC
> +#define ACP_DMA_CUR_TRANS_CNT_4                       0x12400B0
> +#define ACP_DMA_CUR_TRANS_CNT_5                       0x12400B4
> +#define ACP_DMA_CUR_TRANS_CNT_6                       0x12400B8
> +#define ACP_DMA_CUR_TRANS_CNT_7                       0x12400BC
> +#define ACP_DMA_ERR_STS_0                             0x12400C0
> +#define ACP_DMA_ERR_STS_1                             0x12400C4
> +#define ACP_DMA_ERR_STS_2                             0x12400C8
> +#define ACP_DMA_ERR_STS_3                             0x12400CC
> +#define ACP_DMA_ERR_STS_4                             0x12400D0
> +#define ACP_DMA_ERR_STS_5                             0x12400D4
> +#define ACP_DMA_ERR_STS_6                             0x12400D8
> +#define ACP_DMA_ERR_STS_7                             0x12400DC
> +#define ACP_DMA_DESC_BASE_ADDR                        0x12400E0
> +#define ACP_DMA_DESC_MAX_NUM_DSCR                     0x12400E4
> +#define ACP_DMA_CH_STS                                0x12400E8
> +#define ACP_DMA_CH_GROUP                              0x12400EC
> +#define ACP_DMA_CH_RST_STS                            0x12400F0
> +
> +/* Registers from ACP_AXI2AXIATU block */
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1                0x1240C00
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_1                0x1240C04
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_2                0x1240C08
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_2                0x1240C0C
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_3                0x1240C10
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_3                0x1240C14
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_4                0x1240C18
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_4                0x1240C1C
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5                0x1240C20
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_5                0x1240C24
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_6                0x1240C28
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_6                0x1240C2C
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_7                0x1240C30
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_7                0x1240C34
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_8                0x1240C38
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_8                0x1240C3C
> +#define ACPAXI2AXI_ATU_CTRL                           0x1240C40
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_9                0x1240C44
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_9                0x1240C48
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_10               0x1240C4C
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_10               0x1240C50
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_11               0x1240C54
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_11               0x1240C58
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_12               0x1240C5C
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_12               0x1240C60
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_13               0x1240C64
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_13               0x1240C68
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_14               0x1240C6C
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_14               0x1240C70
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_15               0x1240C74
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_15               0x1240C78
> +#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_16               0x1240C7C
> +#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_16               0x1240C80
> +
>  /* Registers from ACP_CLKRST block */
>  #define ACP_SOFT_RESET                                0x1241000
>  #define ACP_CONTROL                                   0x1241004
>  #define ACP_STATUS                                    0x1241008
>  #define ACP_DYNAMIC_CG_MASTER_CONTROL                 0x1241010
> -#define ACP_PGFSM_CONTROL                             0x124101C
> -#define ACP_PGFSM_STATUS                              0x1241020
> -#define ACP_CLKMUX_SEL                                0x1241024
> +#define ACP_ZSC_DSP_CTRL                              0x1241014
> +#define ACP_ZSC_STS                                   0x1241018
> +#define ACP_PGFSM_CONTROL                             0x1241024
> +#define ACP_PGFSM_STATUS                              0x1241028
> +#define ACP_CLKMUX_SEL                                0x124102C
> =20
>  /* Registers from ACP_AON block */
>  #define ACP_PME_EN                                    0x1241400
> @@ -26,5 +126,319 @@
>  #define ACP_PAD_PULLDOWN_CTRL                         0x1241448
>  #define ACP_PAD_DRIVE_STRENGTH_CTRL                   0x124144C
>  #define ACP_PAD_SCHMEN_CTRL                           0x1241450
> +#define ACP_SW_PAD_KEEPER_EN                          0x1241454
> +#define ACP_SW_WAKE_EN                                0x1241458
> +#define ACP_I2S_WAKE_EN                               0x124145C
> +#define ACP_SW1_WAKE_EN                               0x1241460
> +
> +/* Registers from ACP_P1_MISC block */
> +#define ACP_EXTERNAL_INTR_ENB                         0x1241A00
> +#define ACP_EXTERNAL_INTR_CNTL                        0x1241A04
> +#define ACP_EXTERNAL_INTR_CNTL1                       0x1241A08
> +#define ACP_EXTERNAL_INTR_STAT                        0x1241A0C
> +#define ACP_EXTERNAL_INTR_STAT1                       0x1241A10
> +#define ACP_ERROR_STATUS                              0x1241A4C
> +#define ACP_P1_SW_I2S_ERROR_REASON                    0x1241A50
> +#define ACP_P1_SW_POS_TRACK_I2S_TX_CTRL               0x1241A6C
> +#define ACP_P1_SW_I2S_TX_DMA_POS                      0x1241A70
> +#define ACP_P1_SW_POS_TRACK_I2S_RX_CTRL               0x1241A74
> +#define ACP_P1_SW_I2S_RX_DMA_POS                      0x1241A78
> +#define ACP_P1_DMIC_I2S_GPIO_INTR_CTRL                0x1241A7C
> +#define ACP_P1_DMIC_I2S_GPIO_INTR_STATUS              0x1241A80
> +#define ACP_SCRATCH_REG_BASE_ADDR                     0x1241A84
> +#define ACP_P1_SW_POS_TRACK_BT_TX_CTRL                0x1241A88
> +#define ACP_P1_SW_BT_TX_DMA_POS                       0x1241A8C
> +#define ACP_P1_SW_POS_TRACK_HS_TX_CTRL                0x1241A90
> +#define ACP_P1_SW_HS_TX_DMA_POS                       0x1241A94
> +#define ACP_P1_SW_POS_TRACK_BT_RX_CTRL                0x1241A98
> +#define ACP_P1_SW_BT_RX_DMA_POS                       0x1241A9C
> +#define ACP_P1_SW_POS_TRACK_HS_RX_CTRL                0x1241AA0
> +#define ACP_P1_SW_HS_RX_DMA_POS                       0x1241AA4
> +
> +/* Registers from ACP_AUDIO_BUFFERS block */
> +#define ACP_I2S_RX_RINGBUFADDR                        0x1242000
> +#define ACP_I2S_RX_RINGBUFSIZE                        0x1242004
> +#define ACP_I2S_RX_LINKPOSITIONCNTR                   0x1242008
> +#define ACP_I2S_RX_FIFOADDR                           0x124200C
> +#define ACP_I2S_RX_FIFOSIZE                           0x1242010
> +#define ACP_I2S_RX_DMA_SIZE                           0x1242014
> +#define ACP_I2S_RX_LINEARPOSITIONCNTR_HIGH            0x1242018
> +#define ACP_I2S_RX_LINEARPOSITIONCNTR_LOW             0x124201C
> +#define ACP_I2S_RX_INTR_WATERMARK_SIZE                0x1242020
> +#define ACP_I2S_TX_RINGBUFADDR                        0x1242024
> +#define ACP_I2S_TX_RINGBUFSIZE                        0x1242028
> +#define ACP_I2S_TX_LINKPOSITIONCNTR                   0x124202C
> +#define ACP_I2S_TX_FIFOADDR                           0x1242030
> +#define ACP_I2S_TX_FIFOSIZE                           0x1242034
> +#define ACP_I2S_TX_DMA_SIZE                           0x1242038
> +#define ACP_I2S_TX_LINEARPOSITIONCNTR_HIGH            0x124203C
> +#define ACP_I2S_TX_LINEARPOSITIONCNTR_LOW             0x1242040
> +#define ACP_I2S_TX_INTR_WATERMARK_SIZE                0x1242044
> +#define ACP_BT_RX_RINGBUFADDR                         0x1242048
> +#define ACP_BT_RX_RINGBUFSIZE                         0x124204C
> +#define ACP_BT_RX_LINKPOSITIONCNTR                    0x1242050
> +#define ACP_BT_RX_FIFOADDR                            0x1242054
> +#define ACP_BT_RX_FIFOSIZE                            0x1242058
> +#define ACP_BT_RX_DMA_SIZE                            0x124205C
> +#define ACP_BT_RX_LINEARPOSITIONCNTR_HIGH             0x1242060
> +#define ACP_BT_RX_LINEARPOSITIONCNTR_LOW              0x1242064
> +#define ACP_BT_RX_INTR_WATERMARK_SIZE                 0x1242068
> +#define ACP_BT_TX_RINGBUFADDR                         0x124206C
> +#define ACP_BT_TX_RINGBUFSIZE                         0x1242070
> +#define ACP_BT_TX_LINKPOSITIONCNTR                    0x1242074
> +#define ACP_BT_TX_FIFOADDR                            0x1242078
> +#define ACP_BT_TX_FIFOSIZE                            0x124207C
> +#define ACP_BT_TX_DMA_SIZE                            0x1242080
> +#define ACP_BT_TX_LINEARPOSITIONCNTR_HIGH             0x1242084
> +#define ACP_BT_TX_LINEARPOSITIONCNTR_LOW              0x1242088
> +#define ACP_BT_TX_INTR_WATERMARK_SIZE                 0x124208C
> +#define ACP_HS_RX_RINGBUFADDR                         0x1242090
> +#define ACP_HS_RX_RINGBUFSIZE                         0x1242094
> +#define ACP_HS_RX_LINKPOSITIONCNTR                    0x1242098
> +#define ACP_HS_RX_FIFOADDR                            0x124209C
> +#define ACP_HS_RX_FIFOSIZE                            0x12420A0
> +#define ACP_HS_RX_DMA_SIZE                            0x12420A4
> +#define ACP_HS_RX_LINEARPOSITIONCNTR_HIGH             0x12420A8
> +#define ACP_HS_RX_LINEARPOSITIONCNTR_LOW              0x12420AC
> +#define ACP_HS_RX_INTR_WATERMARK_SIZE                 0x12420B0
> +#define ACP_HS_TX_RINGBUFADDR                         0x12420B4
> +#define ACP_HS_TX_RINGBUFSIZE                         0x12420B8
> +#define ACP_HS_TX_LINKPOSITIONCNTR                    0x12420BC
> +#define ACP_HS_TX_FIFOADDR                            0x12420C0
> +#define ACP_HS_TX_FIFOSIZE                            0x12420C4
> +#define ACP_HS_TX_DMA_SIZE                            0x12420C8
> +#define ACP_HS_TX_LINEARPOSITIONCNTR_HIGH             0x12420CC
> +#define ACP_HS_TX_LINEARPOSITIONCNTR_LOW              0x12420D0
> +#define ACP_HS_TX_INTR_WATERMARK_SIZE                 0x12420D4
> +
> +/* Registers from ACP_I2S_TDM block */
> +#define ACP_I2STDM_IER                                0x1242400
> +#define ACP_I2STDM_IRER                               0x1242404
> +#define ACP_I2STDM_RXFRMT                             0x1242408
> +#define ACP_I2STDM_ITER                               0x124240C
> +#define ACP_I2STDM_TXFRMT                             0x1242410
> +#define ACP_I2STDM0_MSTRCLKGEN                        0x1242414
> +#define ACP_I2STDM1_MSTRCLKGEN                        0x1242418
> +#define ACP_I2STDM2_MSTRCLKGEN                        0x124241C
> +#define ACP_I2STDM_REFCLKGEN                          0x1242420
> +
> +/* Registers from ACP_BT_TDM block */
> +#define ACP_BTTDM_IER                                 0x1242800
> +#define ACP_BTTDM_IRER                                0x1242804
> +#define ACP_BTTDM_RXFRMT                              0x1242808
> +#define ACP_BTTDM_ITER                                0x124280C
> +#define ACP_BTTDM_TXFRMT                              0x1242810
> +#define ACP_HSTDM_IER                                 0x1242814
> +#define ACP_HSTDM_IRER                                0x1242818
> +#define ACP_HSTDM_RXFRMT                              0x124281C
> +#define ACP_HSTDM_ITER                                0x1242820
> +#define ACP_HSTDM_TXFRMT                              0x1242824
> +
> +/* Registers from ACP_WOV block */
> +#define ACP_WOV_PDM_ENABLE                            0x1242C04
> +#define ACP_WOV_PDM_DMA_ENABLE                        0x1242C08
> +#define ACP_WOV_RX_RINGBUFADDR                        0x1242C0C
> +#define ACP_WOV_RX_RINGBUFSIZE                        0x1242C10
> +#define ACP_WOV_RX_LINKPOSITIONCNTR                   0x1242C14
> +#define ACP_WOV_RX_LINEARPOSITIONCNTR_HIGH            0x1242C18
> +#define ACP_WOV_RX_LINEARPOSITIONCNTR_LOW             0x1242C1C
> +#define ACP_WOV_RX_INTR_WATERMARK_SIZE                0x1242C20
> +#define ACP_WOV_PDM_FIFO_FLUSH                        0x1242C24
> +#define ACP_WOV_PDM_NO_OF_CHANNELS                    0x1242C28
> +#define ACP_WOV_PDM_DECIMATION_FACTOR                 0x1242C2C
> +#define ACP_WOV_PDM_VAD_CTRL                          0x1242C30
> +#define ACP_WOV_WAKE                                  0x1242C54
> +#define ACP_WOV_BUFFER_STATUS                         0x1242C58
> +#define ACP_WOV_MISC_CTRL                             0x1242C5C
> +#define ACP_WOV_CLK_CTRL                              0x1242C60
> +#define ACP_PDM_VAD_DYNAMIC_CLK_GATING_EN             0x1242C64
> +#define ACP_WOV_ERROR_STATUS_REGISTER                 0x1242C68
> +#define ACP_PDM_CLKDIV                                0x1242C6C
> +
> +/* Registers from ACP_P1_AUDIO_BUFFERS block */
> +#define ACP_P1_I2S_RX_RINGBUFADDR                     0x1243A00
> +#define ACP_P1_I2S_RX_RINGBUFSIZE                     0x1243A04
> +#define ACP_P1_I2S_RX_LINKPOSITIONCNTR                0x1243A08
> +#define ACP_P1_I2S_RX_FIFOADDR                        0x1243A0C
> +#define ACP_P1_I2S_RX_FIFOSIZE                        0x1243A10
> +#define ACP_P1_I2S_RX_DMA_SIZE                        0x1243A14
> +#define ACP_P1_I2S_RX_LINEARPOSITIONCNTR_HIGH         0x1243A18
> +#define ACP_P1_I2S_RX_LINEARPOSITIONCNTR_LOW          0x1243A1C
> +#define ACP_P1_I2S_RX_INTR_WATERMARK_SIZE             0x1243A20
> +#define ACP_P1_I2S_TX_RINGBUFADDR                     0x1243A24
> +#define ACP_P1_I2S_TX_RINGBUFSIZE                     0x1243A28
> +#define ACP_P1_I2S_TX_LINKPOSITIONCNTR                0x1243A2C
> +#define ACP_P1_I2S_TX_FIFOADDR                        0x1243A30
> +#define ACP_P1_I2S_TX_FIFOSIZE                        0x1243A34
> +#define ACP_P1_I2S_TX_DMA_SIZE                        0x1243A38
> +#define ACP_P1_I2S_TX_LINEARPOSITIONCNTR_HIGH         0x1243A3C
> +#define ACP_P1_I2S_TX_LINEARPOSITIONCNTR_LOW          0x1243A40
> +#define ACP_P1_I2S_TX_INTR_WATERMARK_SIZE             0x1243A44
> +#define ACP_P1_BT_RX_RINGBUFADDR                      0x1243A48
> +#define ACP_P1_BT_RX_RINGBUFSIZE                      0x1243A4C
> +#define ACP_P1_BT_RX_LINKPOSITIONCNTR                 0x1243A50
> +#define ACP_P1_BT_RX_FIFOADDR                         0x1243A54
> +#define ACP_P1_BT_RX_FIFOSIZE                         0x1243A58
> +#define ACP_P1_BT_RX_DMA_SIZE                         0x1243A5C
> +#define ACP_P1_BT_RX_LINEARPOSITIONCNTR_HIGH          0x1243A60
> +#define ACP_P1_BT_RX_LINEARPOSITIONCNTR_LOW           0x1243A64
> +#define ACP_P1_BT_RX_INTR_WATERMARK_SIZE              0x1243A68
> +#define ACP_P1_BT_TX_RINGBUFADDR                      0x1243A6C
> +#define ACP_P1_BT_TX_RINGBUFSIZE                      0x1243A70
> +#define ACP_P1_BT_TX_LINKPOSITIONCNTR                 0x1243A74
> +#define ACP_P1_BT_TX_FIFOADDR                         0x1243A78
> +#define ACP_P1_BT_TX_FIFOSIZE                         0x1243A7C
> +#define ACP_P1_BT_TX_DMA_SIZE                         0x1243A80
> +#define ACP_P1_BT_TX_LINEARPOSITIONCNTR_HIGH          0x1243A84
> +#define ACP_P1_BT_TX_LINEARPOSITIONCNTR_LOW           0x1243A88
> +#define ACP_P1_BT_TX_INTR_WATERMARK_SIZE              0x1243A8C
> +#define ACP_P1_HS_RX_RINGBUFADDR                      0x1243A90
> +#define ACP_P1_HS_RX_RINGBUFSIZE                      0x1243A94
> +#define ACP_P1_HS_RX_LINKPOSITIONCNTR                 0x1243A98
> +#define ACP_P1_HS_RX_FIFOADDR                         0x1243A9C
> +#define ACP_P1_HS_RX_FIFOSIZE                         0x1243AA0
> +#define ACP_P1_HS_RX_DMA_SIZE                         0x1243AA4
> +#define ACP_P1_HS_RX_LINEARPOSITIONCNTR_HIGH          0x1243AA8
> +#define ACP_P1_HS_RX_LINEARPOSITIONCNTR_LOW           0x1243AAC
> +#define ACP_P1_HS_RX_INTR_WATERMARK_SIZE              0x1243AB0
> +#define ACP_P1_HS_TX_RINGBUFADDR                      0x1243AB4
> +#define ACP_P1_HS_TX_RINGBUFSIZE                      0x1243AB8
> +#define ACP_P1_HS_TX_LINKPOSITIONCNTR                 0x1243ABC
> +#define ACP_P1_HS_TX_FIFOADDR                         0x1243AC0
> +#define ACP_P1_HS_TX_FIFOSIZE                         0x1243AC4
> +#define ACP_P1_HS_TX_DMA_SIZE                         0x1243AC8
> +#define ACP_P1_HS_TX_LINEARPOSITIONCNTR_HIGH          0x1243ACC
> +#define ACP_P1_HS_TX_LINEARPOSITIONCNTR_LOW           0x1243AD0
> +#define ACP_P1_HS_TX_INTR_WATERMARK_SIZE              0x1243AD4
> =20
> +/* Registers from ACP_SCRATCH block */
> +#define ACP_SCRATCH_REG_0                             0x1250000
> +#define ACP_SCRATCH_REG_1                             0x1250004
> +#define ACP_SCRATCH_REG_2                             0x1250008
> +#define ACP_SCRATCH_REG_3                             0x125000C
> +#define ACP_SCRATCH_REG_4                             0x1250010
> +#define ACP_SCRATCH_REG_5                             0x1250014
> +#define ACP_SCRATCH_REG_6                             0x1250018
> +#define ACP_SCRATCH_REG_7                             0x125001C
> +#define ACP_SCRATCH_REG_8                             0x1250020
> +#define ACP_SCRATCH_REG_9                             0x1250024
> +#define ACP_SCRATCH_REG_10                            0x1250028
> +#define ACP_SCRATCH_REG_11                            0x125002C
> +#define ACP_SCRATCH_REG_12                            0x1250030
> +#define ACP_SCRATCH_REG_13                            0x1250034
> +#define ACP_SCRATCH_REG_14                            0x1250038
> +#define ACP_SCRATCH_REG_15                            0x125003C
> +#define ACP_SCRATCH_REG_16                            0x1250040
> +#define ACP_SCRATCH_REG_17                            0x1250044
> +#define ACP_SCRATCH_REG_18                            0x1250048
> +#define ACP_SCRATCH_REG_19                            0x125004C
> +#define ACP_SCRATCH_REG_20                            0x1250050
> +#define ACP_SCRATCH_REG_21                            0x1250054
> +#define ACP_SCRATCH_REG_22                            0x1250058
> +#define ACP_SCRATCH_REG_23                            0x125005C
> +#define ACP_SCRATCH_REG_24                            0x1250060
> +#define ACP_SCRATCH_REG_25                            0x1250064
> +#define ACP_SCRATCH_REG_26                            0x1250068
> +#define ACP_SCRATCH_REG_27                            0x125006C
> +#define ACP_SCRATCH_REG_28                            0x1250070
> +#define ACP_SCRATCH_REG_29                            0x1250074
> +#define ACP_SCRATCH_REG_30                            0x1250078
> +#define ACP_SCRATCH_REG_31                            0x125007C
> +#define ACP_SCRATCH_REG_32                            0x1250080
> +#define ACP_SCRATCH_REG_33                            0x1250084
> +#define ACP_SCRATCH_REG_34                            0x1250088
> +#define ACP_SCRATCH_REG_35                            0x125008C
> +#define ACP_SCRATCH_REG_36                            0x1250090
> +#define ACP_SCRATCH_REG_37                            0x1250094
> +#define ACP_SCRATCH_REG_38                            0x1250098
> +#define ACP_SCRATCH_REG_39                            0x125009C
> +#define ACP_SCRATCH_REG_40                            0x12500A0
> +#define ACP_SCRATCH_REG_41                            0x12500A4
> +#define ACP_SCRATCH_REG_42                            0x12500A8
> +#define ACP_SCRATCH_REG_43                            0x12500AC
> +#define ACP_SCRATCH_REG_44                            0x12500B0
> +#define ACP_SCRATCH_REG_45                            0x12500B4
> +#define ACP_SCRATCH_REG_46                            0x12500B8
> +#define ACP_SCRATCH_REG_47                            0x12500BC
> +#define ACP_SCRATCH_REG_48                            0x12500C0
> +#define ACP_SCRATCH_REG_49                            0x12500C4
> +#define ACP_SCRATCH_REG_50                            0x12500C8
> +#define ACP_SCRATCH_REG_51                            0x12500CC
> +#define ACP_SCRATCH_REG_52                            0x12500D0
> +#define ACP_SCRATCH_REG_53                            0x12500D4
> +#define ACP_SCRATCH_REG_54                            0x12500D8
> +#define ACP_SCRATCH_REG_55                            0x12500DC
> +#define ACP_SCRATCH_REG_56                            0x12500E0
> +#define ACP_SCRATCH_REG_57                            0x12500E4
> +#define ACP_SCRATCH_REG_58                            0x12500E8
> +#define ACP_SCRATCH_REG_59                            0x12500EC
> +#define ACP_SCRATCH_REG_60                            0x12500F0
> +#define ACP_SCRATCH_REG_61                            0x12500F4
> +#define ACP_SCRATCH_REG_62                            0x12500F8
> +#define ACP_SCRATCH_REG_63                            0x12500FC
> +#define ACP_SCRATCH_REG_64                            0x1250100
> +#define ACP_SCRATCH_REG_65                            0x1250104
> +#define ACP_SCRATCH_REG_66                            0x1250108
> +#define ACP_SCRATCH_REG_67                            0x125010C
> +#define ACP_SCRATCH_REG_68                            0x1250110
> +#define ACP_SCRATCH_REG_69                            0x1250114
> +#define ACP_SCRATCH_REG_70                            0x1250118
> +#define ACP_SCRATCH_REG_71                            0x125011C
> +#define ACP_SCRATCH_REG_72                            0x1250120
> +#define ACP_SCRATCH_REG_73                            0x1250124
> +#define ACP_SCRATCH_REG_74                            0x1250128
> +#define ACP_SCRATCH_REG_75                            0x125012C
> +#define ACP_SCRATCH_REG_76                            0x1250130
> +#define ACP_SCRATCH_REG_77                            0x1250134
> +#define ACP_SCRATCH_REG_78                            0x1250138
> +#define ACP_SCRATCH_REG_79                            0x125013C
> +#define ACP_SCRATCH_REG_80                            0x1250140
> +#define ACP_SCRATCH_REG_81                            0x1250144
> +#define ACP_SCRATCH_REG_82                            0x1250148
> +#define ACP_SCRATCH_REG_83                            0x125014C
> +#define ACP_SCRATCH_REG_84                            0x1250150
> +#define ACP_SCRATCH_REG_85                            0x1250154
> +#define ACP_SCRATCH_REG_86                            0x1250158
> +#define ACP_SCRATCH_REG_87                            0x125015C
> +#define ACP_SCRATCH_REG_88                            0x1250160
> +#define ACP_SCRATCH_REG_89                            0x1250164
> +#define ACP_SCRATCH_REG_90                            0x1250168
> +#define ACP_SCRATCH_REG_91                            0x125016C
> +#define ACP_SCRATCH_REG_92                            0x1250170
> +#define ACP_SCRATCH_REG_93                            0x1250174
> +#define ACP_SCRATCH_REG_94                            0x1250178
> +#define ACP_SCRATCH_REG_95                            0x125017C
> +#define ACP_SCRATCH_REG_96                            0x1250180
> +#define ACP_SCRATCH_REG_97                            0x1250184
> +#define ACP_SCRATCH_REG_98                            0x1250188
> +#define ACP_SCRATCH_REG_99                            0x125018C
> +#define ACP_SCRATCH_REG_100                           0x1250190
> +#define ACP_SCRATCH_REG_101                           0x1250194
> +#define ACP_SCRATCH_REG_102                           0x1250198
> +#define ACP_SCRATCH_REG_103                           0x125019C
> +#define ACP_SCRATCH_REG_104                           0x12501A0
> +#define ACP_SCRATCH_REG_105                           0x12501A4
> +#define ACP_SCRATCH_REG_106                           0x12501A8
> +#define ACP_SCRATCH_REG_107                           0x12501AC
> +#define ACP_SCRATCH_REG_108                           0x12501B0
> +#define ACP_SCRATCH_REG_109                           0x12501B4
> +#define ACP_SCRATCH_REG_110                           0x12501B8
> +#define ACP_SCRATCH_REG_111                           0x12501BC
> +#define ACP_SCRATCH_REG_112                           0x12501C0
> +#define ACP_SCRATCH_REG_113                           0x12501C4
> +#define ACP_SCRATCH_REG_114                           0x12501C8
> +#define ACP_SCRATCH_REG_115                           0x12501CC
> +#define ACP_SCRATCH_REG_116                           0x12501D0
> +#define ACP_SCRATCH_REG_117                           0x12501D4
> +#define ACP_SCRATCH_REG_118                           0x12501D8
> +#define ACP_SCRATCH_REG_119                           0x12501DC
> +#define ACP_SCRATCH_REG_120                           0x12501E0
> +#define ACP_SCRATCH_REG_121                           0x12501E4
> +#define ACP_SCRATCH_REG_122                           0x12501E8
> +#define ACP_SCRATCH_REG_123                           0x12501EC
> +#define ACP_SCRATCH_REG_124                           0x12501F0
> +#define ACP_SCRATCH_REG_125                           0x12501F4
> +#define ACP_SCRATCH_REG_126                           0x12501F8
> +#define ACP_SCRATCH_REG_127                           0x12501FC
> +#define ACP_SCRATCH_REG_128                           0x1250200
>  #endif
> --=20
> 2.51.2
>=20

--2U3jqSPMi1HUPriL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmGKh4ACgkQJNaLcl1U
h9Dhgwf/UNGRKkhtIE6rmVhgDBpd13ExHrw6QFB2ql78fQ9e6FVr79/dFSY23uC0
vwJbpmhUZf37ZIMDq9N0HEKGhyjVs2ozPT2EMytMktYk+c146aj8wq4WIF8OBzjr
aJBDMsxnMYUIaEiaY34jyfwJ+tBn+lESD1xvZAsuqGzgRTkgmsxfaBUMOGvuHeOa
tIOUx5+BL4ND7yvsVnIPKFUkY9m00Lnw6x24eYlmhOa/qyNB5b58RZ0WN4n56Iz7
M/id69LcqfYFatg+Dmz2qUGITp4tcx3xvIhhJjukck2uWz+cMlMSHUX6AgYNQbMX
YuGzWbnOq5zbRDEzZhtUuPpEW2zdFw==
=gUjz
-----END PGP SIGNATURE-----

--2U3jqSPMi1HUPriL--
