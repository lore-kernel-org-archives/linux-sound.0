Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374D637104F
	for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 21:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781214841; cv=none; b=StyPbeT+DxI1NjE+k73IQ9yUhqwQuIOhptGwt5aJnwVq6SlWqyTDwN7CpXDkLyO59k730s47h6PSZorNUbPsqWIFhGMYF9jouy9yriGm07UOHvU7lTZOYb2T0fI9P6v0h3WkuvljzXblXw64Cro57UQZNQluVlspDo838GwoSoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781214841; c=relaxed/simple;
	bh=nhOtX6eMdQnmydn6beGOZAMKXL+8k3sBF8G0cokEhTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UVEUU5ve/HRjJJd98LLkXeZqzzgXU501G1WPKaL7z/PaY+R25ellKIWdeNdR96FSvVKJJGhc8KG+gfg2qZ5OjIGU/NPgQeMMr7YDf+cJum/fQo0MMMLFeP4hGstUfcZ+jB1kfmQ0KkVJ39MlzHWg5SCNypiZ6IdSJcsrpzznhDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEh04Dp0; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEh04Dp0"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-bf1cdcfd6deso33523666b.3
        for <linux-sound@vger.kernel.org>; Thu, 11 Jun 2026 14:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781214837; x=1781819637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FcCaXIiMYeYR4gdycecptRkZY3+5/QeLiVPSt15SHD0=;
        b=tEh04Dp0CB14tlOyTjOpI5H3qWJ128cAd31kE1XjDKS7E34f5h6beXeuGV3EWzNAZ0
         PZ8UB5YDZ7CMIOhiR+zOXwI3w6x1utTcmFbOo0aajQDNAXKYfmNvLVKl71zG3KwQZEpJ
         Qh/qqIkBJks/eEzNAo1WmLMpgWT1YB1xlpJ+ngs/P5pmJ+fDhHCqKLkoVz42ZFXHKzs3
         F7IjORZr7awFpHMxpXHe/ZTKwq7rfmvM7nqIlCO6zL2eE3BdKkg1bdM3+AW2zjTKbh5V
         hyKzWrRplRt056j+JlySY1CC/anS6IGLfZWrLzxlLZoRxcD0mvrz5XQ41LzDeZnF/b6t
         PmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781214837; x=1781819637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcCaXIiMYeYR4gdycecptRkZY3+5/QeLiVPSt15SHD0=;
        b=WWsMBUj0/ub2dF897S4j+S5JqkkxIByPOLuzGJDviV6Jd8GNVFETdm30FLz6oBx75K
         Z/5uCJR8vS5pIq52LxTUXR/yXcQVgQKQ3GkoiZYZGjbVXTYOpAgwUNeof7fkXA3mD5di
         oyhBcjtrlEQrP0s+TdjoYwzf+Gy9bT1cbmt15ovUxC4YZMJVebUIEQe0DBwV8ZyD8Aq5
         2uVIsOWkgz8a/a6ZrDTTXErB1Oc8BJRLtH4acGQQ/nX9DM1PIU6wt76Ba2Lnb1tHNrr3
         jmn8UDWUOh9A1210MBgq4/89GGtJ3UBzLoetSx1OCnIZ9qmgxJ/AHGOK5O50WoDUbD5p
         C5Og==
X-Gm-Message-State: AOJu0YyTYRnfRQyy2UJ2K9XBNiMgIgXA5kgImsf1ZJSB+yvrJsYdZOTz
	XndSNkVjmphXcVMtWQLFimOyyK3Mxh5zdEY1GohzUMhaMPmUvMnKwjOV
X-Gm-Gg: Acq92OGkHtDRqVlHazCuQvPLkxCADmQLyZmGnvuOUQg6EKvsPONLrwwKj/tGIHPQqje
	n7chZWJu9ZRnroMVcGlszwNVQ/rtntUqu4CzM50heBkxCGxsdohfwAvX2idt662ErXu/L+ZMLx6
	z0gxh0OYWzJZVNZQ1nzBl/vgk1xr2bdYAZ6Ew1OI9NZrOqioxMoUWW61szS0dE8Pp/HyT1W7CPx
	UeneURSyX3z5ZpNlVlmTmETQBJ5SGR9hfZZDnJ8SXMNjiaGHSeBpPo0kMYIIY12kdy2lQuMHppH
	LiTBolZ2+SWGlRjlIrXZMLYFwookoD5Z5oh5526kvGxTOXd8yqqoTSZ/Flh50yT9B8bzv1ywd2I
	Kt35EYYmFSQjlO66JP3K1QaRes7dHrTCIJHNxX1v0t1iziwPuOldw0POxkm8hE2xF/hrnYPEZSZ
	1wtfCgcGUbkbkyXFpReY7xi1aC
X-Received: by 2002:a17:907:da3:b0:bdc:8c6b:4842 with SMTP id a640c23a62f3a-bfc87af7c93mr246113266b.30.1781214837257;
        Thu, 11 Jun 2026 14:53:57 -0700 (PDT)
Received: from jekhomev ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4420823sm23949066b.4.2026.06.11.14.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 14:53:56 -0700 (PDT)
Date: Fri, 12 Jun 2026 00:53:55 +0300
From: Yauhen Kharuzhy <jekhor@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hans de Goede <hansg@kernel.org>, Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v3 3/3] ASoC: Intel: Add cht_rt5677 driver
Message-ID: <aispdA0YWglxIP5F@jekhomev>
References: <20260611-asoc-yogabook-v2-v3-0-3128447b67b6@gmail.com>
 <20260611-asoc-yogabook-v2-v3-3-3128447b67b6@gmail.com>
 <e1627940-2bfe-4281-a0ff-03b7dfc16899@intel.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1627940-2bfe-4281-a0ff-03b7dfc16899@intel.com>

On Thu, Jun 11, 2026 at 11:19:10AM +0200, Cezary Rojewski wrote:
> On 6/11/2026 1:51 AM, Yauhen Kharuzhy wrote:
> > Add a new ASoC machine driver for Intel Cherry Trail platforms with
> > rt5677 codec.
> 
> ...
> > +static void snd_cht_rt5677_remove(struct platform_device *pdev)
> > +{
> > +	struct snd_soc_card *card = platform_get_drvdata(pdev);
> > +	struct cht_rt5677_private *ctx = snd_soc_card_get_drvdata(card);
> > +	int i;
> > +
> > +	/*
> > +	 * Reset the codec name in the global dailink array back to the default
> > +	 * to avoid a use-after-free on driver rebind (unbind/bind):
> > +	 * ctx->codec_name is about to be freed together with ctx (devm), but
> > +	 * cht_rt5677_dailink[] is a static global that persists across binds.
> > +	 */
> 
> All of this looks like a hack and brings me closer to simply stating:
> 
> NAK
> 
> as I do not believe the patch has been thoroughly tested if such hacks
> exist.  remove() procedure should not care about codecs->name.

I agree but it was a simplest way to fix a possible use-after-free in
probe():

ctx = kzalloc();
...
if (cht_rt5677_dailink[i].codecs->name &&
		!strcmp(cht_rt5677_dailink[i].codecs->name,
			RT5677_I2C_DEFAULT))
	cht_rt5677_dailink[i].codecs->name = ctx->codec_name;

So, if ctx will be freed (after remove()) and probe() will be called
again, then cht_rt5677_dailink[i].codecs->name will be invalid.

Now I have checked how this issue is resolved in similar drivers. For
example, cht_bsw_rt5672.c has the same pattern with potential
use-after-free. cht_bsw_rt5645.c uses a statically allocated buffer to
store the name instead of field inside a dynamically allocated context.
Maybe a such approach with static buffer would be an acceptable compromise.


> 
> > +	for (i = 0; i < ARRAY_SIZE(cht_rt5677_dailink); i++) {
> > +		if (cht_rt5677_dailink[i].codecs->name == ctx->codec_name) {
> > +			cht_rt5677_dailink[i].codecs->name = RT5677_I2C_DEFAULT;
> > +			break;
> > +		}
> > +	}
> > +
> > +	gpiod_put(ctx->gpio_hp_en);
> > +	gpiod_put(ctx->gpio_spk_en2);
> > +	gpiod_put(ctx->gpio_spk_en1);
> > +}
> 
> ...
> 
> > diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> > index 5e8a1dc84ee1..c719c3ec8314 100644
> > --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> > +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> > @@ -17,12 +17,11 @@ static struct snd_soc_acpi_mach cht_surface_mach = {
> >   	.sof_tplg_filename = "sof-cht-rt5645.tplg",
> >   };
> > -static struct snd_soc_acpi_mach cht_yogabook_mach = {
> > +static struct snd_soc_acpi_mach cht_rt5677_mach = {
> >   	.id = "10EC5677",
> > -	.drv_name = "cht-yogabook",
> > +	.drv_name = "cht-rt5677",
> >   	.fw_filename = "intel/fw_sst_22a8.bin",
> > -	.board = "cht-yogabook",
> > -	.sof_tplg_filename = "sof-cht-rt5677.tplg",
> > +	.board = "cht_rt5677",
> >   };
> >   static struct snd_soc_acpi_mach cht_lenovo_yoga_tab3_x90_mach = {
> > @@ -41,17 +40,9 @@ static const struct dmi_system_id cht_table[] = {
> >   			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
> >   		},
> >   	},
> > -	{
> > -		.ident = "Lenovo Yoga Book YB1-X91",
> > -		.driver_data = (void *)&cht_yogabook_mach,
> > -		/* YB1-X91L/F */
> > -		.matches = {
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X91"),
> > -		}
> > -	},
> >   	{
> >   		.ident = "Lenovo Yoga Book YB1-X90",
> > -		.driver_data = (void *)&cht_yogabook_mach,
> > +		.driver_data = (void *)&cht_rt5677_mach,
> >   		/* YB1-X90L/F, codec is not listed in DSDT */
> >   		.matches = {
> >   			
> > @@ -147,19 +138,11 @@ struct snd_soc_acpi_mach  snd_soc_acpi_intel_cherrytrail_machines[] = {
> >   		.board = "cht-bsw",
> >   		.sof_tplg_filename = "sof-cht-rt5670.tplg",
> >   	},
> > -	/*
> > -	 * The only known Cherry Trail device with RT5677 codec and 10EC677
> > -	 * DSTD entry is the Lenovo Yoga Book YB1-X91. It has a device-specific
> > -	 * driver, so check DMI and use a machine quirk to override the default
> > -	 * (non-existent) machine driver.
> > -	 */
> 
> You are removing and editing (the below table) code you've just added with
> 2/3.  This looks very bad.

Argh, it should have been integrated into the second patch in the series
instead of this one... My bad, sorry.

> 
> >   	{
> >   		.id = "10EC5677",
> > -		.drv_name = "cht-bsw-rt5677",
> > +		.drv_name = "cht-rt5677",
> >   		.fw_filename = "intel/fw_sst_22a8.bin",
> > -		.board = "cht-bsw",
> > -		.machine_quirk = cht_quirk,
> > -		.sof_tplg_filename = "sof-cht-rt5677.tplg",
> > +		.board = "cht_rt5677",
> >   	},
> >   	{
> >   		.comp_ids = &rt5645_comp_ids,
> > 
> 

-- 
Yauhen Kharuzhy
