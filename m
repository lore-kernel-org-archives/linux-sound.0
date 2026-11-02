Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793643543;
	b=Vh/HAsy1tmsgRR8YiehjZ+X2I7qN2J0gaP9i9AsOqRpgvELwPI+/K6tCWCo/F75B0XqX
	 wp78kYCr9c0AzHCKrhrRrAo1/Kk5jTD9J8BvoHxqW/bZeiGLvBBPAuZJC57M/mQyDkVmy
	 m+VMVqXFcV+CSdKfRPUlMI2/RhKWmdbdwvhKdx/e06j8vMROVOl+0pGtX3bHOs4VDMtEo
	 6QO1rzE24XKeONzBlBOeEJINYImnLu+OSzS9NvMqe+duW7gQ8H7MoMvgFYC2ckQtQOCSb
	 boQUCj/ur7x9suo+RnSgzX1W6TIVNUPSX7lH2ZsuDMCU7OTvmhAl0ACmW1J1yJL8f8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793643543;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FAS8BXcBA8/EPZoLWk9kokZHBNdUTosyZVtpQQ+63GY=;
	b=Aar6CKnv+LZ9wwKKSMW4vWQwagWgN4sgCt9F7RAtI+0RNijg9QI8ULX9tGNq0ZHFsuCx
	 o4t/vIDtQFuuwLJMgQ38p20sm5dbtDLNFUHloBRmYRhpMjSeYZdxepOrSxUW8vu522+pE
	 rEchS/H7mBI2dtVUs1uSbFLctMfN7BsZ+8lcRQa2kY3qNmVQqfpMfPZ4USzacNFU5Uvar
	 HkWt5ecxXpWOoDrbHOZKytyav07AtM2GklPtk8ALcbKRnMssPoeydbpNkjefl4ycSjbqG
	 22tY2pRrEogMUMpWiGsxftOuzdPmI9RG9w4qklMzqRUwOE6UuRXAuSHPqyRPG61CLYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Psaml/0I";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4020B606A32C
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 18:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Psaml/0I
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A4E41F00A21;
	Mon,  2 Nov 2026 18:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793643542;
	bh=FAS8BXcBA8/EPZoLWk9kokZHBNdUTosyZVtpQQ+63GY=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=Psaml/0IbFz+disWXY7njNzne20wWDI1CgC61mTwMTKeiLZQqh8moJh/y93mXFElh
	 LX6Qrl1luJBSVRXEnJSNi4eYx2VHWaQ0nhdkTxHn9dsBaFkM8zFwHz1z1hlEQC0qQT
	 dMzCel9we40DcKVpdWZfFcuYcwImFEq93KVfJB2mHIRW4Pc7rUz/pI6ECS4Hv5dEnk
	 G2yoB6hPkoFjGTlo+MJZ9961OQYJtP6TYPUmBmLq90g9eZA4HUqy+J6v88pnBlMWBL
	 16F6uoY5vybU3Fz11FdC5u4zew3pFXlyogFviILtnvJfXYelrN8kTlzxcINBsCQpix
	 UCLnqpGjVSTog==
Message-ID: <sashiko-outbox-193923@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] soundwire: intel: Define stubs when library is
 disabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cezary Rojewski" <cezary.rojewski@intel.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261102181042.1922005-2-cezary.rojewski@intel.com>
References: <20261102181042.1922005-1-cezary.rojewski@intel.com>
 <20261102181042.1922005-2-cezary.rojewski@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 18:19:02 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] soundwire: intel: link failure when SND_INTEL_DSP_CONFIG=3Dy, SO=
UNDWIRE_INTEL=3Dm
- [Medium] soundwire: intel: sdw_intel_acpi_scan() stub returns 0 leaving i=
nfo uninit
--

commit 36be5679dc6f7a17f83bd829bfffe5d60fd5b81f
Author: Cezary Rojewski <cezary.rojewski@intel.com>

soundwire: intel: Define stubs when library is disabled

This commit adds inline stub functions in include/linux/soundwire/sdw_intel=
.h
when CONFIG_SOUNDWIRE_INTEL is disabled and updates sound/hda/core/Kconfig
and Makefile so SND_INTEL_SOUNDWIRE_ACPI is only selected and built when
SOUNDWIRE_INTEL is enabled.

> diff --git a/include/linux/soundwire/sdw_intel.h b/include/linux/soundwir=
e/sdw_intel.h
> index 9710f2dc04e29..83021cc0f5b86 100644
> --- a/include/linux/soundwire/sdw_intel.h
> +++ b/include/linux/soundwire/sdw_intel.h
> @@ -358,6 +358,8 @@ struct sdw_intel_res {
>  	struct mutex *eml_lock;
>  };
> =20
> +#if IS_ENABLED(CONFIG_SOUNDWIRE_INTEL)
> +
>  /*
>   * On Intel platforms, the SoundWire IP has dependencies on power
>   * rails shared with the DSP, and the initialization steps are split
> @@ -384,6 +386,38 @@ void sdw_intel_exit(struct sdw_intel_ctx *ctx);
> =20
>  irqreturn_t sdw_intel_thread(int irq, void *dev_id);
> =20
> +#else
> +
> +static inline int sdw_intel_acpi_scan(acpi_handle parent_handle, struct =
sdw_intel_acpi_info *info)
> +{
> +	return 0;
> +}

[Severity: Medium]
Should the sdw_intel_acpi_scan() stub return -ENODEV instead of 0?

In sound/hda/core/intel-sdw-acpi.c, sdw_intel_acpi_scan() returns -ENODEV
when no SoundWire controller is found, and only returns 0 after populating
info->handle, info->count, and info->link_mask.

Callers pass an uninitialized struct sdw_intel_acpi_info on the stack and
check for a negative return value before reading its fields, for example in
sound/hda/core/intel-dsp-config.c:snd_intel_dsp_check_soundwire():

	struct sdw_intel_acpi_info info;
	acpi_handle handle;
	int ret;

	handle =3D ACPI_HANDLE(&pci->dev);
	if (!handle)
		return -ENODEV;

	ret =3D sdw_intel_acpi_scan(handle, &info);
	if (ret < 0)
		return ret;

	return info.link_mask;

With the stub returning 0 when CONFIG_SOUNDWIRE_INTEL=3Dn, callers such as
snd_intel_dsp_check_soundwire(), hda_sdw_acpi_scan() in
sound/soc/sof/intel/hda.c, and avs_sdw_probe() in
sound/soc/intel/avs/soundwire.c will read uninitialized stack memory from
info and treat a SoundWire controller as present, causing subsequent
sdw_intel_probe() calls to return NULL and fail probing with -EINVAL.

[ ... ]

> diff --git a/sound/hda/core/Kconfig b/sound/hda/core/Kconfig
> index bfdcf6384c521..f91053dd9f589 100644
> --- a/sound/hda/core/Kconfig
> +++ b/sound/hda/core/Kconfig
> @@ -29,7 +29,7 @@ config SND_INTEL_DSP_CONFIG
>  	tristate
>  	select ACPI_NHLT if ACPI
>  	select SND_INTEL_NHLT if ACPI
> -	select SND_INTEL_SOUNDWIRE_ACPI if ACPI
> +	select SND_INTEL_SOUNDWIRE_ACPI if SOUNDWIRE_INTEL

[Severity: Medium]
Can this cause a vmlinux link failure when CONFIG_SND_INTEL_DSP_CONFIG=3Dy
and CONFIG_SOUNDWIRE_INTEL=3Dm?

Because SOUNDWIRE_INTEL is a tristate symbol, "select
SND_INTEL_SOUNDWIRE_ACPI if SOUNDWIRE_INTEL" bounds SND_INTEL_SOUNDWIRE_ACPI
to the minimum of SND_INTEL_DSP_CONFIG and SOUNDWIRE_INTEL. When a built-in
driver selects SND_INTEL_DSP_CONFIG=3Dy (such as CONFIG_SND_HDA_INTEL=3Dy) =
while
CONFIG_SOUNDWIRE_INTEL=3Dm and CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE=3Dm,
CONFIG_SND_INTEL_SOUNDWIRE_ACPI is built as a loadable module (=3Dm).

In sound/hda/core/intel-dsp-config.c (built-in via SND_INTEL_DSP_CONFIG=3Dy=
),
IS_ENABLED(CONFIG_SND_SOC_SOF_INTEL_SOUNDWIRE) and
IS_ENABLED(CONFIG_SOUNDWIRE_INTEL) both evaluate to true for =3Dm:

sound/hda/core/intel-dsp-config.c:snd_intel_dsp_check_soundwire() {
	...
	ret =3D sdw_intel_acpi_scan(handle, &info);

This causes built-in code in snd-intel-dspcfg to reference
sdw_intel_acpi_scan() in the loadable module snd-intel-sdw-acpi.ko. Should
this use a boolean condition instead, matching sound/soc/sof/intel/Kconfig
and sound/soc/intel/Kconfig:

	select SND_INTEL_SOUNDWIRE_ACPI if SOUNDWIRE_INTEL !=3D n

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102181042.1922=
005-1-cezary.rojewski@intel.com?part=3D1
