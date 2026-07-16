Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C43342378E;
	Thu, 16 Jul 2026 15:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784214885; cv=none; b=AtowrTCp+1OgTj8aTG/x6WQAYnITbzbmF++ANaPjGikNNpNXxsDKXFD9ezjtQdOdcaTkwUTpo1NTXfLycjuUYfz1Vva5B1BRPZQRXHTS4JytJcP32xsJOKX4Rzo726b9PI3veov0SxW6NJDAB1+RHVU14JeDTvjxGFEmt2q8z/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784214885; c=relaxed/simple;
	bh=LYiTM1CF/TrLdFmwaanmX65laDK7qBcF5V8oqeZiejk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwu2UCkJyFYH7smh2cWI+hbeFNhw67sjl06BsIKF1922qxbdynWJS9DGqph1KuVuPLD2UUP6LyTQIbY/dVroMnapfrWgdb+5z1JbH57mZ5J9VQ/fyJ5RmW++8QT+6IDxEFFFq73eln+58v9xn9RTdTF/4a++3TInPBJdpYR0e9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mf88Z91R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mf88Z91R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 745CE1F000E9;
	Thu, 16 Jul 2026 15:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784214882;
	bh=lyckIQgvPZ++5I2/mc596bXRbQABhclTjhBponrC+bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mf88Z91R6DDgUxWB6NwIueY9q5Y1itVyW3X8jrE3ndaF7uPdo5x4uiuHCa4Je8sMp
	 /23NxrzmVDVnJ6m6aZbrqfcsawgs9l0pxj0t4IKWz5na5kyVjiNnLMlRtle1vc4y2m
	 r/MI0Wx616TH4lYUt4gGsFSAhRRNhfeJNg2oJQOhj3LrjtYcku5JdMMibriK46d/c/
	 D8nfD1c8omggpjJ4v1dOfzUQBBAxndes7+/CrjTUCAZPt4JCqCkc8/EvhrL+mjYWzL
	 Llfp0rIWQYsF6yAEZEL2y2DDCH7hi5G9RDrMtpkpzfhTDvM1TqcLW8HQuUa/+VZXtl
	 2+1l87XpXUGQQ==
Date: Thu, 16 Jul 2026 16:14:37 +0100
From: Lee Jones <lee@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, lgirdwood@gmail.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com
Subject: Re: [PATCH 3/3] mfd: cs42l43: Add support for new cs42l44 variant
Message-ID: <20260716151437.GA1409595@google.com>
References: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
 <20260708140039.1993489-4-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708140039.1993489-4-ckeepax@opensource.cirrus.com>

On Wed, 08 Jul 2026, Charles Keepax wrote:

> The cs42l44 is a cost optimised variant of cs42l43b. Add basic support
> for this new device.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
>  drivers/mfd/cs42l43-i2c.c        |  2 ++
>  drivers/mfd/cs42l43-sdw.c        |  1 +
>  drivers/mfd/cs42l43.c            | 18 ++++++++++++------
>  include/linux/mfd/cs42l43-regs.h |  1 +
>  4 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
> index bd9752d2cfc34..1af878c7a20b4 100644
> --- a/drivers/mfd/cs42l43-i2c.c
> +++ b/drivers/mfd/cs42l43-i2c.c
> @@ -59,6 +59,7 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
>  static const struct of_device_id cs42l43_of_match[] = {
>  	{ .compatible = "cirrus,cs42l43", .data = (void *)CS42L43_DEVID_VAL },
>  	{ .compatible = "cirrus,cs42l43b", .data = (void *)CS42L43B_DEVID_VAL },
> +	{ .compatible = "cirrus,cs42l44", .data = (void *)CS42L43B_DEVID_VAL },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, cs42l43_of_match);
> @@ -68,6 +69,7 @@ MODULE_DEVICE_TABLE(of, cs42l43_of_match);
>  static const struct acpi_device_id cs42l43_acpi_match[] = {
>  	{ .id = "CSC4243", .driver_data = CS42L43_DEVID_VAL },
>  	{ .id = "CSC2A3B", .driver_data = CS42L43B_DEVID_VAL },
> +	{ .id = "CSC4244", .driver_data = CS42L43B_DEVID_VAL },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
> diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
> index 6ccfdcd3f6698..81dd19df53685 100644
> --- a/drivers/mfd/cs42l43-sdw.c
> +++ b/drivers/mfd/cs42l43-sdw.c
> @@ -184,6 +184,7 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
>  static const struct sdw_device_id cs42l43_sdw_id[] = {
>  	SDW_SLAVE_ENTRY(0x01FA, 0x4243, (void *)CS42L43_DEVID_VAL),
>  	SDW_SLAVE_ENTRY(0x01FA, 0x2A3B, (void *)CS42L43B_DEVID_VAL),
> +	SDW_SLAVE_ENTRY(0x01FA, 0x4244, (void *)CS42L43B_DEVID_VAL),
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(sdw, cs42l43_sdw_id);
> diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
> index 33479ddd539a6..d6027fa4de705 100644
> --- a/drivers/mfd/cs42l43.c
> +++ b/drivers/mfd/cs42l43.c
> @@ -959,6 +959,7 @@ static void cs42l43_boot_work(struct work_struct *work)
>  {
>  	struct cs42l43 *cs42l43 = container_of(work, struct cs42l43, boot_work);
>  	unsigned int devid, revid, otp;
> +	bool valid_id;
>  	int ret;
>  
>  	ret = cs42l43_wait_for_attach(cs42l43);
> @@ -973,19 +974,24 @@ static void cs42l43_boot_work(struct work_struct *work)
>  
>  	switch (devid) {
>  	case CS42L43_DEVID_VAL:
> +		valid_id = (cs42l43->variant_id == CS42L43_DEVID_VAL);
> +		break;
>  	case CS42L43B_DEVID_VAL:
> -		if (devid != cs42l43->variant_id) {
> -			dev_err(cs42l43->dev,
> -				"Device ID (0x%06x) does not match variant ID (0x%06lx)\n",
> -				devid, cs42l43->variant_id);
> -			goto err;
> -		}

Needs a fall-through statement.

> +	case CS42L44_DEVID_VAL:
> +		valid_id = (cs42l43->variant_id == CS42L43B_DEVID_VAL);
>  		break;
>  	default:
>  		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
>  		goto err;
>  	}
>  
> +	if (!valid_id) {

How is this nor handled in the default branch?

> +		dev_err(cs42l43->dev,
> +			"Device ID (0x%06x) does not match variant ID (0x%06lx)\n",
> +			devid, cs42l43->variant_id);
> +		goto err;
> +	}
> +
>  	ret = regmap_read(cs42l43->regmap, CS42L43_REVID, &revid);
>  	if (ret) {
>  		dev_err(cs42l43->dev, "Failed to read rev: %d\n", ret);
> diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
> index 68831f113589d..4c00ceae8b461 100644
> --- a/include/linux/mfd/cs42l43-regs.h
> +++ b/include/linux/mfd/cs42l43-regs.h
> @@ -1183,6 +1183,7 @@
>  
>  /* CS42L43B VARIANT REGISTERS */
>  #define CS42L43B_DEVID_VAL					0x0042A43B
> +#define CS42L44_DEVID_VAL					0x00042A44
>  
>  #define CS42L43B_DECIM_VOL_CTRL_CH1_CH2				0x00008280
>  #define CS42L43B_DECIM_VOL_CTRL_CH3_CH4				0x00008284
> -- 
> 2.47.3
> 

-- 
Lee Jones
