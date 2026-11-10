Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794281586;
	b=Ki30nll4bRwceBs4H1nIYzNW0NFjQEQU+fW21WUACi3EBZQ++aa0O3daiQks+2biWQ3o
	 UALC6fwypg7Va9sGy6vdhoK9azHCdDmsiVRIjGwhDf9T6CtN4JCQ8OJIS0HBI47Fi7WjU
	 FuOLmW3JOz7teqYtGrvHVPR5RTkppgFhLXhGbzBfsXbLWLMNI9ZRmWXDZmjlH3x66KUTt
	 xuTEaLJQiN3YhEMA1vvmQtL0YqGuZMGMe5IbIwiGvPjz/jC0BxO5HKAGEzmWhBuvFPFeP
	 uZxglZyqn+y50gCGnk42+pvDGUgAgU8qfoVPVsh21eNokCyp7/PpHwH88vHb7W6KC3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794281586;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=fla3tBx0iJu+wOdBCs7QKIpeUnp82Wz8cb4dIrVQ5eY=;
	b=5ZRcNyyn57YG6Vh3y0gu5Zdy/KrWb+PLGh4BKSHLlNAfemec0lQ3jhyra2BZAN86LTjy
	 jsltkPSCuZ7i2d9RCeyYb+56yPmWuqTRIIXZD9E1wjEm37NTtrgzw2K8EQ5kVUrFqZFJo
	 sxwOV6pZLuwLEbvfr1EGIk46ANXC4hgOQU+YjMuR7yvs+3tvHES3sjkilCS74+TJlwC6w
	 2Ef3Gi7+66orOrH2KDMXEPm33wcsk5Ncbj5Lplft2HYSOThY92PkgGH+ayNTRYiy58Agd
	 V92mcXw8104py3diNyJ3pDTMKpUpNDGsKnC5Z242IMK47TNsL9N5z+jqho+5GoInqzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NimtSMMd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74ECD606A321
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 03:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NimtSMMd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0B31F008A1;
	Tue, 10 Nov 2026 03:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794281586;
	bh=fla3tBx0iJu+wOdBCs7QKIpeUnp82Wz8cb4dIrVQ5eY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NimtSMMdwgrUoVQGKvlJoBPVJ00fuzEiNJVF3ux2GcKEGmf1xKj1oF0xd4xLDXYN5
	 eCoq7+LEWv+S6GaAJVaIP+c11iV9ZnRkVZSInZU9e+kLO3PDE42npUEwrJuVGFHT1h
	 4GZCAcBPWUcSQlN9FCVgfnC3Ouj4NTcBlBZWaPLWMr9y2D2UcrbtYnSed61UyhOlOD
	 Irl4MyHm3lt40dXD0BRMD3qIcIlMS9hlboTAAMABO7j5EKcnoDtUTstRpmpv3izIPh
	 Sv9n77+pc49AysJcxmPDWApbYgV3o8cQcjoiHfK8w849Oe/0M1ARh1UYirzOkGSWNP
	 WkB4Wy1ybwdEQ==
Message-ID: <sashiko-outbox-206121@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: sn624x: add support for the SN6245 part ID
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qianghua Wang" <qianghua.wang@senarytech.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261110032012.711191-1-qianghua.wang@senarytech.com>
References: <20261110032012.711191-1-qianghua.wang@senarytech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 03:33:05 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ASoC: Intel: soc-acpi: wrong SoundWire version 0x0 for SN6245
  on ARL/LNL/MTL
--

commit b10667bc93275c45d1fc140d10749355be52e7d6
Author: Qianghua Wang <qianghua.wang@senarytech.com>

ASoC: sn624x: add support for the SN6245 part ID

This commit adds the SN6245 part ID (0x6245) to the SN624x SoundWire
driver ID table, the sdw_utils codec info table, and the Intel SoundWire
ACPI match tables for Arrow Lake, Lunar Lake, Meteor Lake, and Panther
Lake.

Link: https://github.com/thesofproject/linux/issues/6012

> diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c b/sound/soc/codecs/sn624x=
-sdca-sdw.c
> index 65ea90e440008..079a96bce94e7 100644
> --- a/sound/soc/codecs/sn624x-sdca-sdw.c
> +++ b/sound/soc/codecs/sn624x-sdca-sdw.c
> @@ -1769,6 +1769,8 @@ static void sn624x_sdca_sdw_remove(struct sdw_slave=
 *slave)
>  static const struct sdw_device_id sn624x_sdca_id[] =3D {
>  	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6242, 0x3, 0x1, 0),
>  	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6244, 0x3, 0x1, 0),
> +	/* SN6245 is register-compatible with SN6244 (jack/amp/dmic). */
> +	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6245, 0x3, 0x1, 0),
>  	SDW_SLAVE_ENTRY_EXT(0x0496, 0x6247, 0x3, 0x1, 0),
>  	{ }
>  };
> diff --git a/sound/soc/intel/common/soc-acpi-intel-arl-match.c b/sound/so=
c/intel/common/soc-acpi-intel-arl-match.c
> index 1d5f6677bfd87..2fe33280baad0 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-arl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-arl-match.c
> @@ -653,9 +653,11 @@ static const struct snd_soc_acpi_link_adr _sym[] =3D=
 {			\
> =20
>  SN624X_ARL_SINGLE_ADR(sn6242_single_adr, 0x0000000496624201ull);
>  SN624X_ARL_SINGLE_ADR(sn6244_single_adr, 0x0000000496624401ull);
> +SN624X_ARL_SINGLE_ADR(sn6245_single_adr, 0x0000000496624501ull);

[ ... ]

> diff --git a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c b/sound/so=
c/intel/common/soc-acpi-intel-lnl-match.c
> index a9fef394f176f..5e90e17a97969 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-lnl-match.c
> @@ -738,9 +738,11 @@ static const struct snd_soc_acpi_link_adr _sym[] =3D=
 {			\
> =20
>  SN624X_LNL_SINGLE_ADR(sn6242_single_adr, 0x0000000496624201ull);
>  SN624X_LNL_SINGLE_ADR(sn6244_single_adr, 0x0000000496624401ull);
> +SN624X_LNL_SINGLE_ADR(sn6245_single_adr, 0x0000000496624501ull);

[ ... ]

> diff --git a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c b/sound/so=
c/intel/common/soc-acpi-intel-mtl-match.c
> index 704b4e0d205e2..10c38bc4fb9d6 100644
> --- a/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> +++ b/sound/soc/intel/common/soc-acpi-intel-mtl-match.c
> @@ -1349,9 +1349,11 @@ static const struct snd_soc_acpi_link_adr _sym[] =
=3D {			\
> =20
>  SN624X_MTL_SINGLE_ADR(sn6242_single_adr, 0x0000000496624201ull);
>  SN624X_MTL_SINGLE_ADR(sn6244_single_adr, 0x0000000496624401ull);
> +SN624X_MTL_SINGLE_ADR(sn6245_single_adr, 0x0000000496624501ull);

[Severity: Medium]
Should sn6245_single_adr on ARL, LNL, and MTL encode SoundWire version
0x3 (0x0000300496624501ull) instead of 0x0 (0x0000000496624501ull)?

sn624x_sdca_id[] registers SN6245 with sdw_version 0x3, which
sdw_get_device_id() requires in bits 47:44 of the ACPI _ADR before binding
the codec driver.  During machine selection, hda_sdw_machine_select() ->
snd_soc_acpi_sdw_link_slaves_found() compares peripheral->id.sdw_version
against SDW_VERSION(adr) without treating 0 as a wildcard:

sound/soc/soc-acpi.c:snd_soc_acpi_sdw_link_slaves_found() {
	...
		version =3D SDW_VERSION(adr);
	...
			if (peripheral->bus->link_id =3D=3D link_id &&
			    peripheral->id.part_id =3D=3D part_id &&
			    peripheral->id.mfg_id =3D=3D mfg_id &&
			    peripheral->id.sdw_version =3D=3D version)
				reported_part_count++;
	...
}

Because 0x0 !=3D 0x3, these ARL, LNL, and MTL entries cannot match an active
SN6245 codec, causing ARL and MTL systems to fail machine selection and
fall back to the HDMI-only HDA machine driver.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110032012.7111=
91-1-qianghua.wang@senarytech.com?part=3D1
