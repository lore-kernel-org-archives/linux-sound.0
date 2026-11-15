Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794785690;
	b=VE5P9tYH3hnilx/ZQlvqjhiNYB0ZwktMuY90y/RiaT/kUYXxXKSaYkfAmS6lqB+ElCp6
	 t7rU/OBCs57FN0qbWTXSz+lnVBQnwL64VZvARshNCE3S7WcsO7siAsWbXkhDpL7q5EyuY
	 lhosXd5LjXH6J3mgHk+gCYa3Tou8n3im9Nq2Z0xpJGEYI365BRTSCLRDIjiojy7g5s32q
	 6UCt2AlsGGO3XNV2ms6BkDAQddj4gxj+arj5dBx5JBsuMtQSiaoo33cCbn0tfpxBdLQSj
	 w2Xi1aVDNvpfKW8Eljt+X/T0mrxx7M78YNDp/6PxwwYjb+wWYTkyueZjLrkiIVsv6/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794785690;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5MUuXp/jWwXFyLycJlsndeMnklZArS2+loj+TN9ZziI=;
	b=rLc4VCEqj2/D/tCYcEFvMRhB0nPei3R1XjHQiBlYJ/GS8T5ITdWuYiBztBPR1akJk4nZ
	 WhFHSDG/k/Vgzzu4/+9x4tzRU+EN/GDVxHeYpMyz4WLLNfD8QF5bKnQcwnNP6n0WJ9s6g
	 VDYv4zy9M1eOD+PcL//eDPhyFcCbDljA2etwszmP786SH/VJcJxHCMcA3h1ymVnBrDQpK
	 Tk3tTHjFhup8MBpTeFc7ty/pNRnNCd0DKoNuryfVBZMDInC6994oJqfO9xiE4UFjj4m7V
	 hcoqmtR4qHv9AuPMsEGkgHyQKyjlnCr/8Bxlg93le7hFQeo0vERTmVIGDWziCJ1iQqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frlkT2oZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693A9606A31F
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 23:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=frlkT2oZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DD91F000C4;
	Sun, 15 Nov 2026 23:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794785690;
	bh=5MUuXp/jWwXFyLycJlsndeMnklZArS2+loj+TN9ZziI=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=frlkT2oZ0lDAkujlZmbigL0LtDS/zC9Ny+8J/ozx+I1WcqjEoSidBJIowtTyPuO2G
	 LbG/5Phi8Namx+WXSqXSZcL9BywENUbYwRep38YJnfHYu1j8b/qnYDhMr+f2wJrSv7
	 bGpFcOmwJo4p7PTYJMa2+ao9qZYTYxIn1y9JYFpPj4a+I1fZGLwC1+bLeBTD65s4B0
	 U5ZMIMJGffIyUkKbBM0LdEiN9kMqQf2pbZM1UtDkneXJZUvOnAWpn3eXE+HLNpomVx
	 7k9afyLSO2Ddw4YEcDQnas14ZnoVhifeskQc85kKuuVfB8s/ad1ZfNNnne4MH5VbF7
	 dQ0VeW5NjfkYA==
Message-ID: <sashiko-outbox-215904@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ASoC: amd: yc: Add DMI quirk for GIGABYTE EAGLE 9MJ
Reply-To: sashiko-reviews@lists.linux.dev
To: "Adolfo Morales Tena" <spidermanadolfo@gmail.com>, linux-sound@vger.kernel.org
In-Reply-To: <20261115232942.5820-1-spidermanadolfo@gmail.com>
References: <20261115232942.5820-1-spidermanadolfo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 23:34:49 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] ASoC: amd: yc: bypassed AcpDmicConnected check in acp6x_probe()
  [1]
--

commit e897ced0b25eb47667a9260d248834825a1643ca
Author: Adolfo Morales Tena <spidermanadolfo@gmail.com>

ASoC: amd: yc: Add DMI quirk for GIGABYTE EAGLE 9MJ

This commit adds a DMI quirk entry for the GIGABYTE EAGLE 9MJ to
yc_acp_quirk_table to enable internal DMIC support.

> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
> index e14c73e7e988a..f636b5ba5b072 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -969,6 +969,13 @@ static const struct dmi_system_id yc_acp_quirk_table=
[] =3D {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "TUF Gaming A16 FA607NUQ"),
>  		}
>  	},
> +	{
> +		.driver_data =3D &acp6x_card,
> +		.matches =3D {
> +			DMI_MATCH(DMI_BOARD_VENDOR, "GIGABYTE"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "GIGABYTE EAGLE 9MJ"),
> +		}
> +	},
>  	{}
>  };

[Severity: High]
This problem wasn't introduced by this patch, but does acp6x_probe()
bypass the is_dmic_enable check when the _WOV ACPI method is missing
[1]?

sound/soc/amd/yc/acp6x-mach.c:acp6x_probe() {
	...
	ret =3D acpi_evaluate_integer(handle, "_WOV", NULL, &dmic_status);
	if (!ACPI_FAILURE(ret)) {
		wov_en =3D dmic_status;
		if (!wov_en)
			goto check_dmi_entry;
	} else {
		/* Incase of ACPI method read failure then jump to check_dmi_entry */
		goto check_dmi_entry;
	}

	if (is_dmic_enable)
		platform_set_drvdata(pdev, &acp6x_card);

check_dmi_entry:
	/* check for any DMI overrides */
	dmi_id =3D dmi_first_match(yc_acp_quirk_table);
	...
}

When a BIOS sets the AcpDmicConnected _DSD property to 1 (setting
is_dmic_enable =3D true) but omits the _WOV method, acpi_evaluate_integer()
fails and the else branch jumps directly to check_dmi_entry.  That skips
binding acp6x_card from is_dmic_enable, so unless the machine is also
listed in yc_acp_quirk_table, platform_get_drvdata() returns NULL and
acp6x_probe() fails with -ENODEV.

[1] https://sashiko.dev/#/bug/linux-9da65c71-a54c-4d66-b1a8-325c916b74d6

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115232942.5820=
-1-spidermanadolfo@gmail.com?part=3D1
