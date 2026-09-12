Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8A330FF08
	for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 09:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789206540; cv=pass; b=E91Bzq265is0AzyKFziQzBq8ObFnaj/K6h4VPTLCtLhUk+ZpQxRp1auf+eiz3t0dEuxeeXI280p0CipsFhLtCxD3JgiDuFN7rnt9ip9D1Kzgcsr60JcHMaF9cFiuafYWTP753fNh8Tc2CAk9spIvfZ3GkUwaCDfxnCfh6S/X+OQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789206540; c=relaxed/simple;
	bh=tOkStd/mWkFI/IXF5B+77hyyTGSkxBMR86AliOsJmjQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pXxNBrJHGMxuWAK1FtOVdUuUsTp9VqlAhfh2M0ozVgp5i9f7pHuzEvyXHYdGG0CyTpRfaq5j2Aj4I4lTplHia6/X7t0YV2wr19H6o3mCFzWgCezuLpHvtMcmFHZo6DnLdFYYMoJjhnS7MTuQUm9qka9jq/U1dKHc0CzCxxa4fX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikitakoval.com; spf=fail smtp.mailfrom=nikitakoval.com; dkim=pass (2048-bit key) header.d=nikitakoval.com header.i=@nikitakoval.com header.b=JfudbTsv; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nikitakoval.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nikitakoval.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nikitakoval.com header.i=@nikitakoval.com header.b="JfudbTsv"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e56a1b327so443333d50.0
        for <linux-sound@vger.kernel.org>; Sat, 12 Sep 2026 02:48:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789206536; cv=none;
        d=google.com; s=arc-20260327;
        b=BSFCLKWTrzRNC1lUWlw12etYgVE8cOKZcUNfl6oGnWJ2n1f8HlK4glZ7VCDdA7Qjl4
         jkcr3q9zZMZVBafoS5t5c95If2Kcn0LxGc08FkF+beB5qZ0xLxtk3uzMvAynamP9S3NZ
         EWuNIBVsUpcFbmCjHdhtLKM1SZiVz7wyRy3+SVA+4nfzjcTo47H68lkvoB0r7nH9OeNN
         cGV8eMhfo5EOThrKLwnNZlhBWsHG5wyzJWq+qbJQCthhZxJZFmpBCh/FtdfO1Iz7ioRl
         BBlhkpzLX75Z7wYz86MULqS4/We5Hss5+ctxfUKtaQ08y8G0QB4EP9HIeOhzLky/YACo
         q8oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7SQZSfNQllIVLt8a7TFjmgMkBy4Sx5LA0ye67+aROgc=;
        fh=Xy9DrOfVUyxfEA1JOU7+GXLyWMuAJEk3ThSLgmXUml8=;
        b=ltxP7YqJHpPPCAQE/m7h7pFtzaY35CpuZx+frAzOpcFjgV8OvoQoKFPtFZUJUzl4nf
         MU1s84MsonhAfHfIjBM+1gyt0eWHjk+b49aEXHaxXZJorNw/lveztQhLQ9hzzwu+dpZH
         XKxNY8dkvUSiBcwBMi7nSOnvE2jajfqdVWTlJgh9PDC+HCorMlCzyoyrNTkglg71DsXs
         A3sNNMaZNYb2Cw9LsF1QKWUvJOEz0TMhr9dPdd/tzezdRPyqiYYRNZ3PSVGpiSSUu4N5
         reZr0ifDk4zKkDkl8gURtlbYOnzAoSZUNIL1qJDVcQJq6zgTm/urPebaDnLgrUkyPBB9
         6e7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nikitakoval.com; s=google; t=1789206536; x=1789811336; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7SQZSfNQllIVLt8a7TFjmgMkBy4Sx5LA0ye67+aROgc=;
        b=JfudbTsvORGfQPV9mPpPBeLALOsGl7HNXjr0lmToYcZnAufJPP4Fl0Ppyz2YdH+x67
         c6ydIXe1iIjeWurx8+U2Alijiq4OM9SKSUfWEC/uSFywALLzxDAknrIG2ZzX/z1PVDcj
         qFaHtSGKB+2xFnb9mMG2ZErJK48WHxBCsSGf5o7aQaf8stLEFLXDe+iaR8Z05iq+atWx
         awl8YVPQEC3UYiFa3Wz+t24PCX+nfMWtIwIsqPOJraW3Ro1OqfWpARkXTx0unCQxPyo6
         NLRFkoxuv69WTaLrzr/NKpqP3SYewB2t3tfAShbEz3i/GJ2oxZ2xDGlbsMNSsFFZoQVt
         jRKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789206536; x=1789811336;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SQZSfNQllIVLt8a7TFjmgMkBy4Sx5LA0ye67+aROgc=;
        b=CDaSGAwLJ5+9S7g7Sv3V3jFz6oOKEFd6jEtEUnyzZNktW12Quz/reC7Jlhn9jFyXrJ
         DDF5vhQ4lMd1I7joHvFjbJqTWXPzaFTp72GRPwaGm7lBYfw1Ug0lfSSdIBcVomKgFoGi
         R2dhCW6yGhxJgTiF05y0tR1EIKGxuH3/4D2CtOhuv8RzSCgFUtcgbreUQ9HZlIycscrZ
         0HGIeqBoQ72t3VxcCZvAhgGLZPOb/TKpJP6C+Sklnfpk0/ZYjI1m6g9Eeq9TEeCNHtVT
         idoecxoB2m9QF739xJkWC8obgyIrwKmns52o3IuA2U5BcgDqLVdgNKbQ9ZqCeIGhE7wa
         fsrQ==
X-Forwarded-Encrypted: i=1; AKwUvBwxMa7Dezc1nO15xzpY7qHxunXAmZ5EvjItBNuhN1XaBOxheypSzYtz0XhZgDR4VSp9sLGx3HEbCEO5QA==@vger.kernel.org
X-Gm-Message-State: AFuF++nIbF4h26RANUM9jPeJ3gJGijXOjsOSlMC3IPh5F6D5wfPFT6OV
	1gNX2yq3IoSHZw35EswGKkz7rvUOdkrBMQba5yXrNrToMAYhqnr9RLzMNvCYemNphOt9R8ghl+7
	MUhikcuBilCyqm4F9yGKrDPnAVyMAkYkd/0M9ul8VR0o=
X-Gm-Gg: AYBFou2fDaybfJ18NMD0TfFbA/IW6vqs04pZ45cdsm7hReF3OO1uHO6EVASGmEQ+Omp
	Yf0BSibh+ea/LtmaPe7pZnwrUkwtXUwwij2re7GKAlUNP9L/DMsfN8DZWXmxw3vhP86pz96qm0H
	G8ItLlGWiUKbUCiA1OLngV7+cDVhZAeHsdI6wSdCT+4FgpTXglyVQzRUFYh9YGfyPLaUuJGL9ei
	KemOz6NWWyfVdLTlVBvy54RocXZek7dr999iDvjmfNIqi327fNCZk1KYoW8+17szLWWRgnEFrV4
	GTUb7KZaSYuXO6bGX0rs9JB764ca5MM611qp9+Ti6sL1cFAAuPwHwMvD
X-Received: by 2002:a05:690e:1aa1:b0:671:1aa3:778d with SMTP id
 956f58d0204a3-6712476530bmr2752474d50.43.1789206536274; Sat, 12 Sep 2026
 02:48:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911122050.42453-1-me@nikitakoval.com>
In-Reply-To: <20260911122050.42453-1-me@nikitakoval.com>
From: Nikita Koval <me@nikitakoval.com>
Date: Sat, 12 Sep 2026 15:48:45 +0600
X-Gm-Features: AcwNN1VkldqIu7hotAC8DGfzzqaah4zbSc0z7fvc358nr9nbPY51PTR18oXz2SE
Message-ID: <CAGY4Osk8R_C6wNTL3CkJO-TUytL+8RsOQvsBNBZkTuUyQ2EfBQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: amd: fix DMIC detection on Lenovo ThinkPad P14s Gen
 6 AMD
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please disregard this patch for now.

After removing the out-of-tree test modules and performing a full
power cycle, the issue is no longer reproducible with the stock Fedora
7.2.4 kernel and the same BIOS version (R2XET41W 1.21).

I had also performed an emergency reset on the ThinkPad during the
debugging process. This may have cleared some persistent EC/firmware
state, so it is possible that the original failure was not caused
solely by the ACPI values addressed by  this patch.

The stock snd_acp_pci driver now successfully registers the PDM
microphone as acp-pdm-mach, and capture works correctly.

Since I can no longer reproduce the original failure on the unmodified
kernel, the proposed DMI quirks are not sufficiently justified.

Sorry for the noise.


=D0=BF=D1=82, 11 =D1=81=D0=B5=D0=BD=D1=82. 2026=E2=80=AF=D0=B3. =D0=B2 18:2=
1, Nikita Koval <me@nikitakoval.com>:
>
> The Lenovo ThinkPad P14s Gen 6 AMD with BIOS R2XET41W (1.21)
> reports acp-audio-config-flag as FLAG_AMD_LEGACY_ONLY_DMIC.
>
> This causes the legacy ACP driver path to be selected and results in:
>
>   No matching ASoC machine driver found
>
> The firmware otherwise exposes a valid PDM microphone device through
> ACPI, with _ADR 0x02 and acp-audio-device-type 0x02.
>
> After selecting the snd_pci_ps path, the firmware _WOV method returns
> 0. The driver currently treats this as disabling the PDM/DMIC path,
> which prevents the internal microphone from being registered.
>
> Add DMI quirks for the ThinkPad P14s Gen 6 AMD to ignore the firmware
> ACP config flag and the _WOV value.
>
> With these quirks applied, the internal microphone is registered as:
>
>   acp63: DMIC capture dmic-hifi-0
>
> and capture works correctly.
>
> DMI:
>   System Vendor: LENOVO
>   Product Name: 21RV000NUS
>   Product Version: ThinkPad P14s Gen 6 AMD
>
> Tested with BIOS R2XET41W (1.21) and Linux 7.2.4.
>
> Signed-off-by: Nikita Koval <me@nikitakoval.com>
> ---
>  sound/soc/amd/acp-config.c |  7 +++++++
>  sound/soc/amd/ps/pci-ps.c  | 14 +++++++++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/amd/acp-config.c b/sound/soc/amd/acp-config.c
> index 2d50be819..0372906f9 100644
> --- a/sound/soc/amd/acp-config.c
> +++ b/sound/soc/amd/acp-config.c
> @@ -77,6 +77,13 @@ static const struct dmi_system_id acp70_acpi_flag_over=
ride_table[] =3D {
>                         DMI_MATCH(DMI_BOARD_NAME, "8EA2"),
>                 },
>         },
> +       {
> +               /* Lenovo ThinkPad P14s Gen 6 AMD */
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad P14s Gen=
 6 AMD")
> +               },
> +       },
>         {}
>  };
>
> diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
> index 729f9aaba..afb8c78d3 100644
> --- a/sound/soc/amd/ps/pci-ps.c
> +++ b/sound/soc/amd/ps/pci-ps.c
> @@ -10,6 +10,7 @@
>  #include <linux/module.h>
>  #include <linux/io.h>
>  #include <linux/delay.h>
> +#include <linux/dmi.h>
>  #include <linux/platform_device.h>
>  #include <linux/acpi.h>
>  #include <linux/interrupt.h>
> @@ -401,6 +402,17 @@ static int acp63_machine_register(struct device *dev=
)
>         return 0;
>  }
>
> +static const struct dmi_system_id acp_ignore_wov_table[] =3D {
> +       {
> +               /* Lenovo ThinkPad P14s Gen 6 AMD */
> +               .matches =3D {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_MATCH(DMI_PRODUCT_VERSION, "ThinkPad P14s Gen=
 6 AMD"),
> +               },
> +       },
> +       {}
> +};
> +
>  static int get_acp63_device_config(struct pci_dev *pci, struct acp63_dev=
_data *acp_data)
>  {
>         struct acpi_device *pdm_dev;
> @@ -430,7 +442,7 @@ static int get_acp63_device_config(struct pci_dev *pc=
i, struct acp63_dev_data *a
>
>                 handle =3D ACPI_HANDLE(&pci->dev);
>                 ret =3D acpi_evaluate_integer(handle, "_WOV", NULL, &dmic=
_status);
> -               if (!ACPI_FAILURE(ret))
> +               if (!ACPI_FAILURE(ret) && !dmi_check_system(acp_ignore_wo=
v_table))
>                         wov_en =3D dmic_status;
>         }
>
> --
> 2.55.0
>
