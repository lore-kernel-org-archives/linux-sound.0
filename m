Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55673590AC;
	Fri,  9 Jan 2026 11:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767957902; cv=none; b=YNWwd4MCJGkBHZdICebUOCj3cGM9cnePnPNP1wSB0wnx/UjFEZwS3VJ9gIKMriGsziNVZyV9p/QSjS/kmlhkv+gK6snwKhmeBkE8f3/fQV2YmsAVxMhwdY72LSgLDcEZ6G2S/ZEoa1gBHBOR76GHCdVu8LF16V9QMfxX369Qc4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767957902; c=relaxed/simple;
	bh=WlNxkvkdjOTjSHin1zd37sq0CbGgqers6PSsfoWOC9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPRB8D95rCiTLfTRE/vThfqiDRIkdsJq5S+sZAF6IMkdJFDNtKFj4oKuL9a2cztPM8dJg+6zHkemEcBdJEE34sEaTWdoGcp7UZz7EZ6HbAf6BaWFUSY+NP9EStj4fmSioDMZN6NwpxRuXQUPliV3uYjSdfN+QgBA0H5evjsl1Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaIHdKyE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaIHdKyE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E1FC19421;
	Fri,  9 Jan 2026 11:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767957901;
	bh=WlNxkvkdjOTjSHin1zd37sq0CbGgqers6PSsfoWOC9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MaIHdKyE33svaE87eB3JpQjmvn/q8dZnu+LXF65siS2TM2ipsbhei+P2MxGOP8m5a
	 NYCJDIM0+6KA3upnF5xJ/dLHzhvjwuEI+OU3P/tvPe/7GDmvtgBazyV+vOZpTkIfED
	 wtAUzFSDbtfigQQi1bunsAWV+gynnjpu90x8+qnyyBsqzGLZxgyi56TUXfAYtErLNa
	 oVMPOUldILQRep8QgAKohQd3n3DyNP4iIxsL8Hh/twboWMFSBDGy2PQtWqa7CwFLE/
	 i8UuKDluee3eGlukW5EbdG8qBSUFGCPnnczt7lxr60DPopw4YUnSpIIKb38JqHHUFn
	 Gh2smHqRpuevg==
Date: Fri, 9 Jan 2026 11:24:56 +0000
From: Lee Jones <lee@kernel.org>
To: Maciej Strozek <mstrozek@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 2/3] mfd: cs42l43: Add support for the B variant
Message-ID: <20260109112456.GH1118061@google.com>
References: <20251219100235.1247053-1-mstrozek@opensource.cirrus.com>
 <20251219100235.1247053-3-mstrozek@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219100235.1247053-3-mstrozek@opensource.cirrus.com>

On Fri, 19 Dec 2025, Maciej Strozek wrote:

> Introducing CS42L43B codec, a variant of CS42L43 which can be driven by
> the same driver.
> 
> Changes in CS42L43 driver specific for CS42L43B:
> - Decimator 1 and 2 are dedicated to ADC, can't be selected for PDM
> - Decimators 3 and 4 are connected to PDM1
> - Added Decimator 5 and 6 for PDM2
> - Supports SoundWire Clock Gearing
> - Updated ROM requiring no patching
> - Reduced RAM space
> - Each ISRC has 4 decimators now
> 
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> ---
>  drivers/mfd/cs42l43-sdw.c        |  2 +
>  drivers/mfd/cs42l43.c            | 70 ++++++++++++++++++++++++-----
>  drivers/mfd/cs42l43.h            |  2 +-
>  include/linux/mfd/cs42l43-regs.h | 76 ++++++++++++++++++++++++++++++++
>  include/linux/mfd/cs42l43.h      |  1 +
>  5 files changed, 138 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
> index 023f7e1a30f8c..c09713fa2a218 100644
> --- a/drivers/mfd/cs42l43-sdw.c
> +++ b/drivers/mfd/cs42l43-sdw.c
> @@ -178,6 +178,7 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
>  
>  	cs42l43->dev = dev;
>  	cs42l43->sdw = sdw;
> +	cs42l43->is_b_variant = !!id->driver_data;

Tell me why this isn't super fragile.

What if another variant is released?  Does every other variant without
driver_data get labeled as the b_variant?

Please add a proper define.

>  	cs42l43->regmap = devm_regmap_init_sdw(sdw, &cs42l43_sdw_regmap);
>  	if (IS_ERR(cs42l43->regmap))
> @@ -189,6 +190,7 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
>  
>  static const struct sdw_device_id cs42l43_sdw_id[] = {
>  	SDW_SLAVE_ENTRY(0x01FA, 0x4243, 0),
> +	SDW_SLAVE_ENTRY(0x01FA, 0x2A3B, 1),

Not acceptable.

  git grep \\.data -- drivers/mfd

>  	{}
>  };
>  MODULE_DEVICE_TABLE(sdw, cs42l43_sdw_id);
> diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
> index 107cfb983fec4..38a4d46cc9680 100644
> --- a/drivers/mfd/cs42l43.c
> +++ b/drivers/mfd/cs42l43.c
> @@ -115,9 +115,14 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
>  	{ CS42L43_DECIM_HPF_WNF_CTRL2,			0x00000001 },
>  	{ CS42L43_DECIM_HPF_WNF_CTRL3,			0x00000001 },
>  	{ CS42L43_DECIM_HPF_WNF_CTRL4,			0x00000001 },
> +	{ CS42L43B_DECIM_HPF_WNF_CTRL5,			0x00000001 },
> +	{ CS42L43B_DECIM_HPF_WNF_CTRL6,			0x00000001 },
>  	{ CS42L43_DMIC_PDM_CTRL,			0x00000000 },
>  	{ CS42L43_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
>  	{ CS42L43_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
> +	{ CS42L43B_DECIM_VOL_CTRL_CH1_CH2,		0x20122012 },
> +	{ CS42L43B_DECIM_VOL_CTRL_CH3_CH4,		0x20122012 },
> +	{ CS42L43B_DECIM_VOL_CTRL_CH5_CH6,		0x20122012 },
>  	{ CS42L43_INTP_VOLUME_CTRL1,			0x00000180 },
>  	{ CS42L43_INTP_VOLUME_CTRL2,			0x00000180 },
>  	{ CS42L43_AMP1_2_VOL_RAMP,			0x00000022 },
> @@ -155,8 +160,12 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
>  	{ CS42L43_SWIRE_DP2_CH2_INPUT,			0x00000000 },
>  	{ CS42L43_SWIRE_DP3_CH1_INPUT,			0x00000000 },
>  	{ CS42L43_SWIRE_DP3_CH2_INPUT,			0x00000000 },
> +	{ CS42L43B_SWIRE_DP3_CH3_INPUT,			0x00000000 },
> +	{ CS42L43B_SWIRE_DP3_CH4_INPUT,			0x00000000 },
>  	{ CS42L43_SWIRE_DP4_CH1_INPUT,			0x00000000 },
>  	{ CS42L43_SWIRE_DP4_CH2_INPUT,			0x00000000 },
> +	{ CS42L43B_SWIRE_DP4_CH3_INPUT,			0x00000000 },
> +	{ CS42L43B_SWIRE_DP4_CH4_INPUT,			0x00000000 },
>  	{ CS42L43_ASRC_INT1_INPUT1,			0x00000000 },
>  	{ CS42L43_ASRC_INT2_INPUT1,			0x00000000 },
>  	{ CS42L43_ASRC_INT3_INPUT1,			0x00000000 },
> @@ -169,10 +178,14 @@ const struct reg_default cs42l43_reg_default[CS42L43_N_DEFAULTS] = {
>  	{ CS42L43_ISRC1INT2_INPUT1,			0x00000000 },
>  	{ CS42L43_ISRC1DEC1_INPUT1,			0x00000000 },
>  	{ CS42L43_ISRC1DEC2_INPUT1,			0x00000000 },
> +	{ CS42L43B_ISRC1DEC3_INPUT1,			0x00000000 },
> +	{ CS42L43B_ISRC1DEC4_INPUT1,			0x00000000 },
>  	{ CS42L43_ISRC2INT1_INPUT1,			0x00000000 },
>  	{ CS42L43_ISRC2INT2_INPUT1,			0x00000000 },
>  	{ CS42L43_ISRC2DEC1_INPUT1,			0x00000000 },
>  	{ CS42L43_ISRC2DEC2_INPUT1,			0x00000000 },
> +	{ CS42L43B_ISRC2DEC3_INPUT1,			0x00000000 },
> +	{ CS42L43B_ISRC2DEC4_INPUT1,			0x00000000 },
>  	{ CS42L43_EQ1MIX_INPUT1,			0x00800000 },
>  	{ CS42L43_EQ1MIX_INPUT2,			0x00800000 },
>  	{ CS42L43_EQ1MIX_INPUT3,			0x00800000 },
> @@ -269,6 +282,8 @@ EXPORT_SYMBOL_NS_GPL(cs42l43_reg_default, "MFD_CS42L43");
>  
>  bool cs42l43_readable_register(struct device *dev, unsigned int reg)
>  {
> +	struct cs42l43 *cs42l43 = dev_get_drvdata(dev);
> +
>  	switch (reg) {
>  	case CS42L43_DEVID:
>  	case CS42L43_REVID:
> @@ -292,7 +307,6 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
>  	case CS42L43_ADC_B_CTRL1 ...  CS42L43_ADC_B_CTRL2:
>  	case CS42L43_DECIM_HPF_WNF_CTRL1 ... CS42L43_DECIM_HPF_WNF_CTRL4:
>  	case CS42L43_DMIC_PDM_CTRL:
> -	case CS42L43_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43_DECIM_VOL_CTRL_CH3_CH4:
>  	case CS42L43_INTP_VOLUME_CTRL1 ... CS42L43_INTP_VOLUME_CTRL2:
>  	case CS42L43_AMP1_2_VOL_RAMP:
>  	case CS42L43_ASP_CTRL:
> @@ -387,8 +401,16 @@ bool cs42l43_readable_register(struct device *dev, unsigned int reg)
>  	case CS42L43_BOOT_CONTROL:
>  	case CS42L43_BLOCK_EN:
>  	case CS42L43_SHUTTER_CONTROL:
> -	case CS42L43_MCU_SW_REV ... CS42L43_MCU_RAM_MAX:
> +	case CS42L43B_MCU_SW_REV ... CS42L43B_MCU_RAM_MAX:
>  		return true;
> +	case CS42L43_MCU_SW_REV ... CS42L43B_MCU_SW_REV - 1:
> +	case CS42L43B_MCU_RAM_MAX + 1 ... CS42L43_MCU_RAM_MAX:
> +	case CS42L43_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43_DECIM_VOL_CTRL_CH3_CH4:
> +		return !cs42l43->is_b_variant;

"Clever" code needs a comment.

> +	case CS42L43B_DECIM_VOL_CTRL_CH1_CH2 ... CS42L43B_DECIM_HPF_WNF_CTRL6:
> +	case CS42L43B_SWIRE_DP3_CH3_INPUT ... CS42L43B_SWIRE_DP4_CH4_INPUT:
> +	case CS42L43B_ISRC1DEC3_INPUT1 ... CS42L43B_ISRC2DEC4_INPUT1:
> +		return cs42l43->is_b_variant;
>  	default:
>  		return false;
>  	}
> @@ -597,15 +619,22 @@ static int cs42l43_wait_for_attach(struct cs42l43 *cs42l43)
>  static int cs42l43_mcu_stage_2_3(struct cs42l43 *cs42l43, bool shadow)
>  {
>  	unsigned int need_reg = CS42L43_NEED_CONFIGS;
> +	unsigned int boot_reg;
>  	unsigned int val;
>  	int ret;
>  
> -	if (shadow)
> -		need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
> +	if (cs42l43->is_b_variant) {
> +		need_reg = CS42L43B_NEED_CONFIGS;
> +		boot_reg = CS42L43B_BOOT_STATUS;
> +	} else {
> +		if (shadow)
> +			need_reg = CS42L43_FW_SH_BOOT_CFG_NEED_CONFIGS;
> +		boot_reg = CS42L43_BOOT_STATUS;
> +	}
>  
>  	regmap_write(cs42l43->regmap, need_reg, 0);
>  
> -	ret = regmap_read_poll_timeout(cs42l43->regmap, CS42L43_BOOT_STATUS,
> +	ret = regmap_read_poll_timeout(cs42l43->regmap, boot_reg,
>  				       val, (val == CS42L43_MCU_BOOT_STAGE3),
>  				       CS42L43_MCU_POLL_US, CS42L43_MCU_CMD_TIMEOUT_US);
>  	if (ret) {
> @@ -644,13 +673,20 @@ static int cs42l43_mcu_stage_3_2(struct cs42l43 *cs42l43)
>   */
>  static int cs42l43_mcu_disable(struct cs42l43 *cs42l43)
>  {
> -	unsigned int val;
> +	unsigned int val, cfg_reg, ctrl_reg;
>  	int ret;
>  
> -	regmap_write(cs42l43->regmap, CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG,
> -		     CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL);
> -	regmap_write(cs42l43->regmap, CS42L43_FW_MISSION_CTRL_MM_CTRL_SELECTION,
> -		     CS42L43_FW_MM_CTRL_MCU_SEL_MASK);
> +	if (cs42l43->is_b_variant) {
> +		cfg_reg = CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG;
> +		ctrl_reg = CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION;
> +	} else {
> +		cfg_reg = CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG;
> +		ctrl_reg = CS42L43_FW_MISSION_CTRL_MM_CTRL_SELECTION;
> +	}
> +
> +	regmap_write(cs42l43->regmap, cfg_reg, CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL);
> +	regmap_write(cs42l43->regmap, ctrl_reg, CS42L43_FW_MM_CTRL_MCU_SEL_MASK);
> +
>  	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, CS42L43_CONTROL_IND_MASK);
>  	regmap_write(cs42l43->regmap, CS42L43_MCU_SW_INTERRUPT, 0);
>  
> @@ -740,18 +776,27 @@ static int cs42l43_mcu_update_step(struct cs42l43 *cs42l43)
>  {
>  	unsigned int mcu_rev, bios_rev, boot_status, secure_cfg;
>  	bool patched, shadow;
> +	int boot_status_reg, mcu_sw_rev_reg;
>  	int ret;
>  
> +	if (cs42l43->is_b_variant) {
> +		boot_status_reg = CS42L43B_BOOT_STATUS;
> +		mcu_sw_rev_reg = CS42L43B_MCU_SW_REV;
> +	} else {
> +		boot_status_reg = CS42L43_BOOT_STATUS;
> +		mcu_sw_rev_reg = CS42L43_MCU_SW_REV;
> +	}
> +
>  	/* Clear any stale software interrupt bits. */
>  	regmap_read(cs42l43->regmap, CS42L43_SOFT_INT, &mcu_rev);
>  
> -	ret = regmap_read(cs42l43->regmap, CS42L43_BOOT_STATUS, &boot_status);
> +	ret = regmap_read(cs42l43->regmap, boot_status_reg, &boot_status);
>  	if (ret) {
>  		dev_err(cs42l43->dev, "Failed to read boot status: %d\n", ret);
>  		return ret;
>  	}
>  
> -	ret = regmap_read(cs42l43->regmap, CS42L43_MCU_SW_REV, &mcu_rev);
> +	ret = regmap_read(cs42l43->regmap, mcu_sw_rev_reg, &mcu_rev);
>  	if (ret) {
>  		dev_err(cs42l43->dev, "Failed to read firmware revision: %d\n", ret);
>  		return ret;
> @@ -918,6 +963,7 @@ static void cs42l43_boot_work(struct work_struct *work)
>  
>  	switch (devid) {
>  	case CS42L43_DEVID_VAL:
> +	case CS42L43B_DEVID_VAL:
>  		break;
>  	default:
>  		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
> diff --git a/drivers/mfd/cs42l43.h b/drivers/mfd/cs42l43.h
> index f3da783930f53..a0068f6572e2c 100644
> --- a/drivers/mfd/cs42l43.h
> +++ b/drivers/mfd/cs42l43.h
> @@ -9,7 +9,7 @@
>  #ifndef CS42L43_CORE_INT_H
>  #define CS42L43_CORE_INT_H
>  
> -#define CS42L43_N_DEFAULTS 176
> +#define CS42L43_N_DEFAULTS 189
>  
>  struct dev_pm_ops;
>  struct device;
> diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
> index c39a49269cb7d..68831f113589d 100644
> --- a/include/linux/mfd/cs42l43-regs.h
> +++ b/include/linux/mfd/cs42l43-regs.h
> @@ -1181,4 +1181,80 @@
>  /* CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_REG */
>  #define CS42L43_FW_MISSION_CTRL_MM_MCU_CFG_DISABLE_VAL		0xF05AA50F
>  
> +/* CS42L43B VARIANT REGISTERS */
> +#define CS42L43B_DEVID_VAL					0x0042A43B
> +
> +#define CS42L43B_DECIM_VOL_CTRL_CH1_CH2				0x00008280
> +#define CS42L43B_DECIM_VOL_CTRL_CH3_CH4				0x00008284
> +
> +#define CS42L43B_DECIM_VOL_CTRL_CH5_CH6				0x00008290
> +#define CS42L43B_DECIM_VOL_CTRL_UPDATE				0x0000829C
> +
> +#define CS42L43B_DECIM_HPF_WNF_CTRL5				0x000082A0
> +#define CS42L43B_DECIM_HPF_WNF_CTRL6				0x000082A4
> +
> +#define CS42L43B_SWIRE_DP3_CH3_INPUT				0x0000C320
> +#define CS42L43B_SWIRE_DP3_CH4_INPUT				0x0000C330
> +#define CS42L43B_SWIRE_DP4_CH3_INPUT				0x0000C340
> +#define CS42L43B_SWIRE_DP4_CH4_INPUT				0x0000C350
> +
> +#define CS42L43B_ISRC1DEC3_INPUT1				0x0000C780
> +#define CS42L43B_ISRC1DEC4_INPUT1				0x0000C790
> +#define CS42L43B_ISRC2DEC3_INPUT1				0x0000C7A0
> +#define CS42L43B_ISRC2DEC4_INPUT1				0x0000C7B0
> +
> +#define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
> +#define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
> +#define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
> +#define CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION		0x00117E0C
> +#define CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG			0x00117E10
> +
> +#define CS42L43B_MCU_SW_REV					0x00117314
> +#define CS42L43B_PATCH_START_ADDR				0x00117318
> +#define CS42L43B_CONFIG_SELECTION				0x0011731C
> +#define CS42L43B_NEED_CONFIGS					0x00117320
> +#define CS42L43B_BOOT_STATUS					0x00117330
> +
> +#define CS42L43B_FW_MISSION_CTRL_NEED_CONFIGS			0x00117E00
> +#define CS42L43B_FW_MISSION_CTRL_HAVE_CONFIGS			0x00117E04
> +#define CS42L43B_FW_MISSION_CTRL_PATCH_START_ADDR_REG		0x00117E08
> +#define CS42L43B_FW_MISSION_CTRL_MM_CTRL_SELECTION		0x00117E0C
> +#define CS42L43B_FW_MISSION_CTRL_MM_MCU_CFG_REG			0x00117E10
> +
> +#define CS42L43B_MCU_RAM_MAX					0x00117FFF
> +
> +/* CS42L43B_DECIM_DECIM_VOL_CTRL_CH5_CH6 */
> +#define CS42L43B_DECIM6_MUTE_MASK				0x80000000
> +#define CS42L43B_DECIM6_MUTE_SHIFT				31
> +#define CS42L43B_DECIM6_VOL_MASK				0x3FC00000
> +#define CS42L43B_DECIM6_VOL_SHIFT				22
> +#define CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_MASK		0x00380000
> +#define CS42L43B_DECIM6_PATH1_VOL_FALL_RATE_SHIFT		19
> +#define CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_MASK		0x00070000
> +#define CS42L43B_DECIM6_PATH1_VOL_RISE_RATE_SHIFT		16
> +#define CS42L43B_DECIM5_MUTE_MASK				0x00008000
> +#define CS42L43B_DECIM5_MUTE_SHIFT				15
> +#define CS42L43B_DECIM5_VOL_MASK				0x00003FC0
> +#define CS42L43B_DECIM5_VOL_SHIFT				6
> +#define CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_MASK		0x00000038
> +#define CS42L43B_DECIM5_PATH1_VOL_FALL_RATE_SHIFT		3
> +#define CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_MASK		0x00000007
> +#define CS42L43B_DECIM5_PATH1_VOL_RISE_RATE_SHIFT		0
> +
> +/* CS42L43B_DECIM_VOL_CTRL_UPDATE */
> +#define CS42L43B_DECIM6_PATH1_VOL_TRIG_MASK			0x00000800
> +#define CS42L43B_DECIM6_PATH1_VOL_TRIG_SHIFT			11
> +#define CS42L43B_DECIM5_PATH1_VOL_TRIG_MASK			0x00000100
> +#define CS42L43B_DECIM5_PATH1_VOL_TRIG_SHIFT			8
> +#define CS42L43B_DECIM4_VOL_UPDATE_MASK				0x00000020
> +#define CS42L43B_DECIM4_VOL_UPDATE_SHIFT			5
> +
> +/* CS42L43_ISRC1_CTRL..CS42L43_ISRC2_CTRL */
> +#define CS42L43B_ISRC_DEC4_EN_MASK				0x00000008
> +#define CS42L43B_ISRC_DEC4_EN_SHIFT				3
> +#define CS42L43B_ISRC_DEC4_EN_WIDTH				1
> +#define CS42L43B_ISRC_DEC3_EN_MASK				0x00000004
> +#define CS42L43B_ISRC_DEC3_EN_SHIFT				2
> +#define CS42L43B_ISRC_DEC3_EN_WIDTH				1
> +
>  #endif /* CS42L43_CORE_REGS_H */
> diff --git a/include/linux/mfd/cs42l43.h b/include/linux/mfd/cs42l43.h
> index 2239d8585e785..78af989feca48 100644
> --- a/include/linux/mfd/cs42l43.h
> +++ b/include/linux/mfd/cs42l43.h
> @@ -98,6 +98,7 @@ struct cs42l43 {
>  	bool sdw_pll_active;
>  	bool attached;
>  	bool hw_lock;
> +	bool is_b_variant;

This is not scalable.

Why not just treat it as a completely different device?

Maybe capture CS42L43_DEVID instead and match on that.

>  };
>  
>  #endif /* CS42L43_CORE_EXT_H */
> -- 
> 2.47.3
> 

-- 
Lee Jones [李琼斯]
