Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793678623;
	b=frG4yiex/DZSfKOwef5cS9681dNzG8wkzOy3hzBt2pso257QgPBVK80l4E4Ogvruv37m
	 l2EbxPUznrvsrZwSpJVHv/b4zqSqKGn3GaMKo72lB3oAncxaVkQjxuTJNl8EQ+1EQk6Ez
	 GGTnVX4tY3ppXcdwu4Z1cOmgcPlixcUlhSgYueMhlFrNbt8EvlmUxl9L4u+8ikHahUVhl
	 T9V+DuDbso4iTdO+hl64nDhDNTlViKYvkcMiArdbK13hbNopP8EX9jcLyVSBuJ5Dhe4Z7
	 /qnGyL091YbBa+HaLnh3JfOtARsRYcbPJg10pIqgU1kNJTFfL1oh/O71lBdIPIKqrxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793678623;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=uc6MGCe96t+IelIF79mH2+ICsB+mD+kxbZd2yKhQkKM=;
	b=F5P9h9Do9fV6o3Er6AZfmBIvlUnTK6hSiZXE7SEDCbFnr+8Viw9UCDtxnBLgcJ5OQXGB
	 7vYR9kACD1oFhwKvOSNjz3+aGh51RQNIPXd0Gjn+Pq49Q9ngYpeW0QjvXbH1Ro6Cd6wMm
	 fz6gjY6ru2JcJNXQoElTSlYDn8RUhYVI8mJkIAngG2mCdufebWxEuegF2+9q/pSSo82H5
	 l8YjpD0D7EexwMDbDGwdAj4Ite7J0VdcAm9qqD1G+Kw+5Qd6PDq5kUdA+BVBGVCrJV6Rc
	 lCwN6/kQNdm13dpG19w83bTO9M/sI8EUe/gE8b8CjBIMyYdaTJA4t+DJUGlCrT+vSdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nszIkpN1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1500B606A332
	for <linux-sound@vger.kernel.org>; Tue,  3 Nov 2026 04:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nszIkpN1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 827511F000C1;
	Tue,  3 Nov 2026 04:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793678622;
	bh=uc6MGCe96t+IelIF79mH2+ICsB+mD+kxbZd2yKhQkKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nszIkpN1Hs5k9uFPssWJMzhCjoyR8nAHkniM6kaog7uNTELbuOKoU9JX57xvEP/v8
	 FDwTrCmXxtdh2DAc3mAf9pN6pggzKcyqLRMMhqx+dz8GoD8QWX8/9En8fdSiz4rhHI
	 dxoTbarXWEiPFEH4dUajYeDRpYndoudeVkBcXCZu9/JB8BKzKjp6/GSuNgB55HwRex
	 uj1aeNApk6LwB8UYD78jQFWZr8oc/BGYE3APs30bDXRIRK9LJZuxlxX3BEgxtHerXF
	 CgtNPvmye21Vhhs2Xt+CgMxgiZCG5R09BT8gQ72zf1gT3oVnTp0sMfX04S+N+8LlWZ
	 mOaJPHo5LT9zA==
Message-ID: <sashiko-outbox-194556@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] ASoC: amd: acp: Add support for more projects on
 ACP7.0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Baojun Xu" <baojun.xu@ti.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261103034415.1495-1-baojun.xu@ti.com>
References: <20261103034415.1495-1-baojun.xu@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 04:03:42 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] ASoC: amd: acp: invalid SoundWire link IDs 2 and 3 in ACP7.0 match=
 table
- [High] ASoC: amd: acp: ASUS DMI overrides match PCI SSIDs instead of boar=
d names
- [Medium] ASoC: amd: acp: single-link TAS2783 entries placed before dual-l=
ink entries
--

commit f9ad24008c2750b4190c6a78319b12a9228b0c5a
Author: Baojun Xu <baojun.xu@ti.com>

ASoC: amd: acp: Add support for more projects on ACP7.0

This commit adds DMI flag override entries and SoundWire ACPI match table
entries to support additional HP and ASUS platforms using the TAS2783
amplifier on ACP7.0.

> diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
> index 2fb9789cac0ac..473d68ebde143 100644
> --- a/sound/soc/amd/acp-config.c
> +++ b/sound/soc/amd/acp-config.c
> @@ -98,6 +98,111 @@ static const struct dmi_system_id acp70_acpi_flag_ove=
rride_table[] =3D {

[ ... ]

> +	{
> +		/* ASUS HN7306 */
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUS"),
> +			DMI_MATCH(DMI_BOARD_NAME, "1714"),
> +		},
> +	},
> +	{
> +		/* ASUS RC74XA */
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUS"),
> +			DMI_MATCH(DMI_BOARD_NAME, "1954"),
> +		},
> +	},
> +	{
> +		/* ASUS RC74RA */
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUS"),
> +			DMI_MATCH(DMI_BOARD_NAME, "1964"),
> +		},
> +	},
> +	{
> +		/* ASUS UX3408GA */
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUS"),
> +			DMI_MATCH(DMI_BOARD_NAME, "1AC4"),
> +		},
> +	},
> +	{
> +		/* ASUS B7406CKA */
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUS"),
> +			DMI_MATCH(DMI_BOARD_NAME, "1B94"),
> +		},
> +	},
> +	{
> +		/* ASUS CHG01LA */
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUS"),
> +			DMI_MATCH(DMI_BOARD_NAME, "1C64"),
> +		},
> +	},
> +	{
> +		/* ASUS UX3480ZA */
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "ASUS"),
> +			DMI_MATCH(DMI_BOARD_NAME, "1E54"),
> +		},
> +	},

[Severity: High]
Will dmi_check_system(acp70_acpi_flag_override_table) in
snd_amd_acp_find_config() ever match these seven ASUS entries?

Unlike HP systems, which populate DMI_BOARD_NAME with a 4-hex-digit board I=
D,
ASUS systems populate DMI_BOARD_NAME and DMI_PRODUCT_NAME with the model na=
me
string (such as "HN7306EA", "RC74XA", "RC74RA", "UX3408GA", "B7406CKA",
"CHG01LA", and "UX3480ZA"), whereas "1714", "1954", "1964", "1AC4", "1B94",
"1C64", and "1E54" appear to be the PCI subsystem_device IDs.

For example, earlier in acp70_acpi_flag_override_table[], HN7306EA is match=
ed
with:

	{
		.matches =3D {
			DMI_MATCH(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC."),
			DMI_MATCH(DMI_PRODUCT_NAME, "HN7306EA"),
		},
	},

and drivers/platform/x86/asus-armoury.h matches RC74XA via
DMI_MATCH(DMI_BOARD_NAME, "RC74XA").

If these entries do not match, snd_amd_acp_find_config() falls back to
snd_amd_acp_acpi_find_config() and snd_acp63_probe() will abort with -ENODEV
when the BIOS sets a non-zero acp-audio-config-flag. Should these entries
match against the ASUS DMI product or board model names instead of the PCI
SSIDs?

> diff --git a/sound/soc/amd/acp/amd-acp70-acpi-match.c b/sound/soc/amd/acp=
/amd-acp70-acpi-match.c
> index c2f0479301ebd..a6df59c212bc0 100644
> --- a/sound/soc/amd/acp/amd-acp70-acpi-match.c
> +++ b/sound/soc/amd/acp/amd-acp70-acpi-match.c

[ ... ]

> @@ -614,6 +614,116 @@ static const struct snd_soc_acpi_adr_device tas2783=
_2_adr[] =3D {
>  	},
>  };
> =20
> +/* HP: Dominion 16 A */
> +static const struct snd_soc_acpi_adr_device tas2783_3_1_adr[] =3D {
> +	{
> +		/* left */
> +		.adr =3D 0x00023C0102000001ull,
> +		.num_endpoints =3D 1,
> +		.endpoints =3D &spk_l_endpoint,
> +		.name_prefix =3D "tas2783-1",
> +	},
> +	{
> +		/* right */
> +		.adr =3D 0x00023D0102000001ull,
> +		.num_endpoints =3D 1,
> +		.endpoints =3D &spk_l_endpoint,
> +		.name_prefix =3D "tas2783-2",
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device tas2783_3_2_adr[] =3D {
> +	{
> +		/* left */
> +		.adr =3D 0x0003390102000001ull,
> +		.num_endpoints =3D 1,
> +		.endpoints =3D &spk_r_endpoint,
> +		.name_prefix =3D "tas2783-3",
> +	},
> +	{
> +		/* right */
> +		.adr =3D 0x00033A0102000001ull,
> +		.num_endpoints =3D 1,
> +		.endpoints =3D &spk_r_endpoint,
> +		.name_prefix =3D "tas2783-4",
> +	},
> +};
> +
> +/* HP: Dominion A LW. */
> +static const struct snd_soc_acpi_adr_device tas2783_4_1_adr[] =3D {
> +	{
> +		/* left */
> +		.adr =3D 0x00023C0102000001ull,
> +		.num_endpoints =3D 1,
> +		.endpoints =3D &spk_l_endpoint,
> +		.name_prefix =3D "tas2783-1",
> +	},
> +};
> +
> +static const struct snd_soc_acpi_adr_device tas2783_4_2_adr[] =3D {
> +	{
> +		/* right */
> +		.adr =3D 0x0003390102000001ull,
> +		.num_endpoints =3D 1,
> +		.endpoints =3D &spk_r_endpoint,
> +		.name_prefix =3D "tas2783-2",
> +	},
> +};
> +
> +/* HP: Kamo (Koki). */
> +static const struct snd_soc_acpi_adr_device tas2783_5_adr[] =3D {
> +	{
> +		/* left */
> +		.adr =3D 0x00023C0102000001ull,
> +		.num_endpoints =3D 1,
> +		.endpoints =3D &spk_l_endpoint,
> +		.name_prefix =3D "tas2783-1",
> +	},
> +	{
> +		/* right */
> +		.adr =3D 0x0002390102000001ull,
> +		.num_endpoints =3D 1,
> +		.endpoints =3D &spk_r_endpoint,
> +		.name_prefix =3D "tas2783-2",
> +	},
> +};

[ ... ]

> @@ -623,6 +733,61 @@ static const struct snd_soc_acpi_link_adr acp70_tas2=
783_2[] =3D {
>  	{}
>  };
> =20
> +static const struct snd_soc_acpi_link_adr acp70_tas2783_3[] =3D {
> +	{
> +		.mask =3D  BIT(2),
> +		.num_adr =3D ARRAY_SIZE(tas2783_3_1_adr),
> +		.adr_d =3D tas2783_3_1_adr,
> +	},
> +	{
> +		.mask =3D  BIT(3),
> +		.num_adr =3D ARRAY_SIZE(tas2783_3_2_adr),
> +		.adr_d =3D tas2783_3_2_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp70_tas2783_4[] =3D {
> +	{
> +		.mask =3D  BIT(2),
> +		.num_adr =3D ARRAY_SIZE(tas2783_4_1_adr),
> +		.adr_d =3D tas2783_4_1_adr,
> +	},
> +	{
> +		.mask =3D  BIT(3),
> +		.num_adr =3D ARRAY_SIZE(tas2783_4_2_adr),
> +		.adr_d =3D tas2783_4_2_adr,
> +	},
> +	{}
> +};
> +
> +static const struct snd_soc_acpi_link_adr acp70_tas2783_5[] =3D {
> +	{
> +		.mask =3D  BIT(2),
> +		.num_adr =3D ARRAY_SIZE(tas2783_5_adr),
> +		.adr_d =3D tas2783_5_adr,
> +	},
> +	{}
> +};

[Severity: High]
Can acp70_tas2783_3, acp70_tas2783_4, and acp70_tas2783_5 work with SoundWi=
re
link IDs 2 and 3 on ACP7.0?

In tas2783_3_1_adr, tas2783_4_1_adr, and tas2783_5_adr, bits 48..51 of .adr
encode link ID 2 (0x0002...) with .mask =3D BIT(2), and tas2783_3_2_adr and
tas2783_4_2_adr encode link ID 3 (0x0003...) with .mask =3D BIT(3).

However, AMD ACP7.0 only supports two SoundWire manager instances (AMD_SDW0=
 on
link 0 and AMD_SDW1 on link 1, with AMD_SDW_MAX_MANAGERS and
ACP63_SDW_MAX_LINKS both defined as 2):

1. In drivers/soundwire/amd_init.c, sdw_amd_probe_controller() only registe=
rs
manager instances 0 and 1, so acp63_sdw_machine_select() ->
snd_soc_acpi_sdw_link_slaves_found() will never match _ADR entries with
SDW_DISCO_LINK_ID(adr) =3D=3D 2 or 3.

2. In sound/soc/amd/acp/acp-sdw-legacy-mach.c, mc_probe() sets
amd_ctx->max_sdw_links =3D ACP63_SDW_MAX_LINKS (2), and create_sdw_dailink()
rejects any link >=3D max_sdw_links:

	if ((ffs(soc_end->link_mask) - 1) >=3D amd_ctx->max_sdw_links) {
		dev_err(dev, "link_id %d exceeds max_sdw_links %d\n",
			ffs(soc_end->link_mask) - 1, amd_ctx->max_sdw_links);
		return -EINVAL;
	}

3. get_acp70_cpu_pin_id() in sound/soc/amd/acp/acp-sdw-mach-common.c only
handles AMD_SDW0 (0) and AMD_SDW1 (1), returning -EINVAL for any other link
ID.

4. In addition, acp70_tas2783_3 and acp70_tas2783_4 split spk_l_endpoint and
spk_r_endpoint (both having .aggregated =3D 1 and .group_id =3D 1) across t=
wo
separate SoundWire links. asoc_sdw_parse_sdw_endpoints() merges endpoints w=
ith
the same group_id into a single DAI link with num_cpus =3D=3D 2, but
create_sdw_dailink() in sound/soc/amd/acp/acp-sdw-legacy-mach.c only popula=
tes
cpus[0].dai_name and leaves cpus[1].dai_name NULL, which fails
soc_dai_link_sanity_check() with -EINVAL.

Should these devices be on link 0 or link 1 instead?

[ ... ]

> @@ -804,6 +969,31 @@ struct snd_soc_acpi_mach snd_soc_acpi_amd_acp70_sdw_=
machines[] =3D {
>  		.links =3D acp70_tas2783_2,
>  		.drv_name =3D "amd_sdw",
>  	},
> +	{
> +		.link_mask =3D BIT(2) | BIT(3),
> +		.links =3D acp70_tas2783_3,
> +		.drv_name =3D "amd_sdw",
> +	},
> +	{
> +		.link_mask =3D BIT(2) | BIT(3),
> +		.links =3D acp70_tas2783_4,
> +		.drv_name =3D "amd_sdw",
> +	},
> +	{
> +		.link_mask =3D BIT(2),
> +		.links =3D acp70_tas2783_5,
> +		.drv_name =3D "amd_sdw",
> +	},
> +	{
> +		.link_mask =3D BIT(0),
> +		.links =3D acp70_tas2783_6,
> +		.drv_name =3D "amd_sdw",
> +	},
> +	{
> +		.link_mask =3D BIT(0),
> +		.links =3D acp70_tas2783_7,
> +		.drv_name =3D "amd_sdw",
> +	},
>  	{
>  		.link_mask =3D BIT(0) | BIT(1),
>  		.links =3D acp70_tas2783x2_l0u9c_rt712_vb_l1u0,

[Severity: Medium]
Should the single-link amplifier-only entries (acp70_tas2783_5,
acp70_tas2783_6, and acp70_tas2783_7) be placed after the dual-link
BIT(0) | BIT(1) entries in snd_soc_acpi_amd_acp70_sdw_machines[]?

In sound/soc/amd/ps/pci-ps.c, acp63_sdw_machine_select() iterates through
snd_soc_acpi_amd_acp70_sdw_machines[] and selects the first entry whose
mach->links are all found (!link->num_adr), without checking whether other
SoundWire links also have active peripherals:

	for (mach =3D acp_data->machines; mach; mach++) {
		if (!mach->links)
			break;
		link =3D mach->links;
		for (i =3D 0; i < acp_data->info.count && link->num_adr; link++, i++) {
			if (!snd_soc_acpi_sdw_link_slaves_found(dev, link,
								acp_data->sdw->peripherals))
				break;
		}
		if (i =3D=3D acp_data->info.count || !link->num_adr)
			if (!mach->machine_check || mach->machine_check(acp_data->sdw))
				break;
	}

Placing single-link entries before dual-link entries causes any dual-link
platform with matching link 0 TAS2783 amplifiers to match the single-link
entry first and ignore the codec on link 1. In particular, tas2783_5_adr us=
es
the same two TAS2783 unique IDs (0xC and 0x9) as tas2783x2_l0u9c_adr in
acp70_tas2783x2_l0u9c_rt712_vb_l1u0 immediately below, so if acp70_tas2783_5
is moved to link 0 at this position in the table, it will shadow
acp70_tas2783x2_l0u9c_rt712_vb_l1u0 and drop the RT712-VB codec on link 1.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103034415.1495=
-1-baojun.xu@ti.com?part=3D1
