Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794880302;
	b=sk0THqLOfQKJ+pFqM4tx8CNtC1L8c7xBZ5Skhxt2qLrl07N+ve82545AC13RoSKaWG4z
	 4sTKEW+hbkEW8fP+Ah82Mxsm5vfdkTu2bDqgQnS00W9kRw408NzaqxFRat/26+6ruBaL1
	 NWP18T9St8ka/LnmRONMHf6i643eg8rGVvMvk+tDy9lTP8+lZuDBJCOMxC/m5c+VcIIzh
	 7Kz+TgaFh8MCJY0Ba2PUDdMICPa5NxRnCTJlpsBDX8JQqes6NQuuatvzQmSTEtH/gG9CW
	 6VtNjnkVtm5G7+lBjgCiEyX5H9CZD46+1r+KSFUQmUEK8RysfzmWXDqOdyQRb5h7IRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794880302;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a7JmCAT9UkxVgJmExFr8QBQQ3/QrKUYD7GeAz/3xZOE=;
	b=fe8OM9KnWC4XR0NS75fvg5JtBZa0KJs365HxfOVqlfqnj1k+PL5cSKCVQGKJ8VN8+MJT
	 pAzdLf0CV33mADzYhCFIdb2YDJZxcnJCU1ekwEJJuYefrEUgbohepJGS1cfHNXAxRthMP
	 /ks0O4piaj5FR5XRmdRVBRf4Bs9gKrxKzvvGLqV5fYCPCn0EEx+tHGn5A9IL/e+nkMCDT
	 LaFeqb5+xiWeWWusBIguZ92dnsKgxkS8pDv4AwGLbchIyoUy7+vqYbrxS/D3G1aqxzPFJ
	 lGX941LHfYJUq4N9rkwJrvrLj6rlIBjpVwAHlZmKvuBfbT1xuRLIJyRgZxZYHMZprJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dc4zzvvm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2105D606A323
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 01:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dc4zzvvm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 927D01F000C4;
	Tue, 17 Nov 2026 01:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794880301;
	bh=a7JmCAT9UkxVgJmExFr8QBQQ3/QrKUYD7GeAz/3xZOE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dc4zzvvmoLEvAai9kX1di8+ah6B7dNeiXyUQmAT39ZMKnP61W6zK3PWKqroN1vkWH
	 judydL9JKeGZm6IfG3tqC37PYyufpVsePEbqOlt6kBI3wG3CSDWiInAGb6+xBa+5Z0
	 +YSZJdVRK3JmJEbTiHoNdUHJsguUy+dhL00X0/FUItaaHTlLTC2rsEwITy0hkdZhnF
	 QEwEKXyOB+fQZmfPKuRP+9dwdGr+maPi9bedbkUYClDBHT8BbjEYLbWiYepapK9Q+H
	 w76ambN89F103fqJbjWKKlJ8xBTayzST/+JuPgaKKmdVetoGDbnV0fEBpiNfh2+VcQ
	 0Rz2iNcZr/T/A==
Message-ID: <sashiko-outbox-218058@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: sn624x: honor ACPI DisCo when MIC SDCA function
 is absent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianghua Wang" <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261117013558.1790310-1-qianghua.wang@senarytech.com>
References: <20261117013558.1790310-1-qianghua.wang@senarytech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 01:51:41 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] ASoC: sn624x: sn624x_sdca_amp_function_init() fails with
  -ENOENT without table
- [Medium] ASoC: sn624x: sn624x_sdca_disco_has_mic() breaks non-DisCo
  DMIC fallback
- [Medium] ASoC: sn624x: sn624x_sdca_amp_function_init() skips init
  table on re-attach
- [Low] ASoC: sn624x: missing Fixes trailer for commit 12d9c9f8679c
--

commit 153fc2fac552f6999cee2b2fc0a8d624ceaed6fb
Author: Qianghua Wang <qianghua.wang@senarytech.com>

> ASoC: sn624x: honor ACPI DisCo when MIC SDCA function is absent
>
> Some laptops ship ACPI _DSD DisCo for Senary SN624x with jack and
> speaker amp SDCA functions only, omitting the MIC array function even
> though the codec might otherwise expose a DMIC. The driver always
> advertised the DMIC capture port and ran DMIC function init against
> registers not described in DisCo, which breaks bring-up on platforms
> that use a minimal function list (for example some Panther Lake
> designs).
>
> Look at the parsed DisCo function list before exposing the DMIC port
> and before running DMIC init. Apply AMP function init from the ACPI
> init tables when an amp function is present, using the same pattern as
> the jack and DMIC paths.
>
> Link: https://github.com/thesofproject/linux/issues/6012
> Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>

[Severity: Low]
Since this fixes bring-up on platforms with a minimal DisCo function list
and wires up speaker amp initialization, should it include a Fixes tag?

  Fixes: 12d9c9f8679c ("ASoC: codecs: add SN624x SDCA SoundWire driver")

> diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c b/sound/soc/codecs/sn624x=
-sdca-sdw.c
> index 081858689430c..49efa429b4268 100644
> --- a/sound/soc/codecs/sn624x-sdca-sdw.c
> +++ b/sound/soc/codecs/sn624x-sdca-sdw.c
[ ... ]
> @@ -1055,6 +1058,43 @@ static int sn624x_dmic_apply_defaults(struct devic=
e *dev,
>  	return sn624x_dmic_oem_fallback_init(dev, sn624x);
>  }
> =20
> +static bool sn624x_sdca_disco_has_mic(const struct sdw_slave *slave)
> +{
> +	int i;
> +
> +	if (!slave->sdca_data.interface_revision || !slave->sdca_data.num_funct=
ions)
> +		return false;

[Severity: Medium]
Does returning false when SDCA DisCo properties are absent break the
non-DisCo DMIC fallback?

When slave->sdca_data.interface_revision is 0, is_sdca_endpoint_present()
in sound/soc/sdw_utils/soc_sdw_utils.c returns 1, so the machine driver
still creates the sn624x-sdca-aif3 DMIC capture DAI link.  However, with
sn624x_sdca_disco_has_mic() returning false, sn624x_sdca_read_prop() omits
SN624X_PORT_DMIC_CAPTURE from prop->source_ports and
sn624x_sdca_dmic_function_init() skips sn624x_dmic_oem_fallback_init(),
causing PCM hw_params on that DAI link to fail with -EINVAL in
sdw_slave_port_config().

> +	for (i =3D 0; i < slave->sdca_data.num_functions; i++) {
> +		const struct sdca_function_desc *desc =3D &slave->sdca_data.function[i=
];
> +
> +		if (desc->adr =3D=3D SN624X_FUNC_NUM_MIC_ARRAY)
> +			return true;
> +		switch (desc->type) {
> +		case SDCA_FUNCTION_TYPE_SMART_MIC:
> +		case SDCA_FUNCTION_TYPE_SIMPLE_MIC:
> +			return true;
> +		default:
> +			break;
> +		}
> +	}
> +	return false;
> +}
> +
> +static int sn624x_amp_apply_defaults(struct device *dev,
> +				     struct sn624x_sdca_priv *sn624x)
> +{
> +	int ret;
> +
> +	if (!sn624x || !sn624x->regmap || !sn624x->slave)
> +		return -ENODEV;
> +	if (!sn624x->amp_func)
> +		return -ENOENT;
> +	ret =3D sn624x_write_sdca_init_table(dev, sn624x, sn624x->amp_func, "am=
p");
> +	if (ret =3D=3D 0)
> +		usleep_range(1000, 1500);
> +	return ret;
> +}
[ ... ]
> @@ -1104,6 +1151,40 @@ static int sn624x_sdca_dmic_function_init(struct d=
evice *dev,
>  		return 0;
> =20
>  	ret =3D sn624x_dmic_apply_defaults(dev, sn624x);
> +	if (ret < 0)
> +		return ret;
> +	ret =3D regmap_multi_reg_write_bypassed(sn624x->regmap, &clear_status, =
1);
> +	if (ret < 0)
> +		return ret;
> +	usleep_range(1000, 1500);
> +	return 0;
> +}
> +
> +static int sn624x_sdca_amp_function_init(struct device *dev,
> +					 struct sn624x_sdca_priv *sn624x)
> +{
> +	unsigned int amp_func_status;
> +	const struct reg_sequence clear_status =3D
> +		REG_SEQ0(SN624X_REG_AMP_FUN_STATUS_CTL, 0x61);
> +	int ret;
> +
> +	if (!sn624x->amp_func)
> +		return 0;
> +	ret =3D regmap_read_bypassed(sn624x->regmap,
> +				   SN624X_REG_AMP_FUN_STATUS_CTL,
> +				   &amp_func_status);
> +	if (ret < 0)
> +		return ret;
> +	if (!(amp_func_status & (SN624X_JACK_FUN_NEEDS_INIT |
> +				 SN624X_JACK_FUN_HAS_BEEN_RESET))) {
> +		if (!sn624x->first_hw_init && sn624x->amp_func->num_init_table)
> +			dev_dbg(dev,
> +				"sn624x: amp FUN STATUS 0x%x, apply ACPI init table anyway\n",
> +				amp_func_status);
> +		else
> +			return 0;
> +	}

[Severity: Medium]
Does gating this fallback on !sn624x->first_hw_init skip re-applying the
amp ACPI initialization table on re-attach after bus reset or suspend?

When the slave transitions through SDW_SLAVE_UNATTACHED,
sn624x_sdca_update_status() clears sn624x->hw_init while
sn624x->first_hw_init stays true.  On re-attachment, if amp_func_status
still does not assert NEEDS_INIT or HAS_BEEN_RESET,
sn624x_sdca_amp_function_init() returns 0 without running the init table,
and vendor registers in that table are not restored by regcache_sync()
because sn624x_sdca_volatile_register() marks !SDW_SDCA_VALID_CTL(reg)
registers as volatile.

> +	ret =3D sn624x_amp_apply_defaults(dev, sn624x);
> +	if (ret < 0)
> +		return ret;

[Severity: High]
Can sn624x_sdca_amp_function_init() fail with -ENOENT and abort codec
bring-up when the ACPI amp function omits
mipi-sdca-function-initialization-table?

find_sdca_init_table() treats that property as optional, so
sdca_parse_function() succeeds and sets sn624x->amp_func with
num_init_table =3D=3D 0.  When amp_func_status has SN624X_JACK_FUN_NEEDS_IN=
IT
or SN624X_JACK_FUN_HAS_BEEN_RESET set, execution reaches
sn624x_amp_apply_defaults() -> sn624x_write_sdca_init_table(), which
returns -ENOENT on !fn->num_init_table; unlike the jack and DMIC paths,
sn624x_amp_apply_defaults() has no OEM fallback, so sn624x_sdca_io_init()
aborts before clearing the status register or initializing DMIC.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117013558.1790=
310-1-qianghua.wang@senarytech.com?part=3D1
