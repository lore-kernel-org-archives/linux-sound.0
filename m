Received: from relay11.grserver.gr (relay11.grserver.gr [78.46.171.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AA93587A0
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 09:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.46.171.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767865417; cv=none; b=Q2hKCMj+ERNWHEwfseNDH+zDCPyiVLBlw/876JXOov9+CzMdOg2GrOR2XXIe9IFtLnum4U6NTpHEKN3+88oR4AhFkEin4K5Rz7AV5SnCjwZUDvj1RCioLApJqGjpKfHE2pfO7g4YLLlU+zHkfE5eNeuh4To2aIJKBSDD3TxtY3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767865417; c=relaxed/simple;
	bh=T/YyaTdcu9Q2dPEDTBWA257lGsUEkmz/nCEEUKJjjpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DHHkbu649FLxoTl3CBSSAdZbygvz0N/HE2AqTCNXHkL1xAEIc3rFDlhQQZ+L2KN+dMa5onaGcyzTW6mC34xhqK6CyZreGobCAol72wmM8oClLVrdJDnaR1BTQSzVGug0aM+DMV+3GvPzyMn93YXUSqEP1WlK2wowJHCm6nv3c9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=cS5DPDsB; arc=none smtp.client-ip=78.46.171.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="cS5DPDsB"
Received: from relay11 (localhost.localdomain [127.0.0.1])
	by relay11.grserver.gr (Proxmox) with ESMTP id D3F8DC388F
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 11:43:25 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay11.grserver.gr (Proxmox) with ESMTPS id F2BE1C36A4
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 11:43:24 +0200 (EET)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 46DEA20235E
	for <linux-sound@vger.kernel.org>; Thu,  8 Jan 2026 11:43:24 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1767865404;
	bh=mXo0irbNY2IXfVrun0XMX+jYxeQRfUkfceORyt5hAfY=;
	h=Received:From:Subject:To;
	b=cS5DPDsBurAutp71GAjnHqhaw/JAc1u1MgMcc9all/K+thevBT+SDewLUiSwGRU02
	 7irlieiEO/j8++CA9aTha/o+KhE9Y0dHJUqTjA/3GmcTTsUtWIORGOw2OwsSBFRRnb
	 bdzNOZx1Xwug/biy3b5qzhuQp0LT4jjATgHpvt+lH53ws5x8mRIgI+c8BCUOSABtkE
	 eJNHmqMxW+LoLZl21D3FvVNzV9XI7cWJU+IoUdvUL+VY4r/E99X5bvW6lns/Oas+ch
	 T41s2+5A1B6G/GvAq85/jTBYVkGc/ILtzGNF+nU8AXT/FNqsyxbE8dC/N+onGnugNo
	 oAkUjHQ2XhKcg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.208.169) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lj1-f169.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-382fb535b73so17159101fa.0
        for <linux-sound@vger.kernel.org>;
 Thu, 08 Jan 2026 01:43:24 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtshyPSY9m1ghcB+51yfOyxKIRvURje3OWPo1GFAuwyiRBkRZTU7dhZ6Zh2GOXok9zRBwa2dmqsWO3Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz1UPKNVZ6WzrqFQDdENuYuzTYjV0GUpAbyW1V50hikcswbwvX
	uMuLAWh2vHnms3DQYZqkLOJY9G9CGCueLI4cR/aUOdacrLaqJ91wff++7bAySHUE5nCJ9AhRFEX
	vbEUFBfWE2qEccxEsnKhAdWnBKVetSas=
X-Google-Smtp-Source: 
 AGHT+IF4HOWqyM6OYSnApZIwhGS8Tpvn/fv//n5t8s0zNL6cCKPTjt5V0lEQOYi4Dskh8u++YjG2TinHQMVgsik1tfg=
X-Received: by 2002:a2e:a581:0:b0:37b:b849:31c3 with SMTP id
 38308e7fff4ca-382ff86a815mr16959911fa.44.1767865403830; Thu, 08 Jan 2026
 01:43:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108093650.1142176-1-matthew.schwartz@linux.dev>
In-Reply-To: <20260108093650.1142176-1-matthew.schwartz@linux.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Thu, 8 Jan 2026 11:43:12 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGvibcndLz-Qd1awQ_E3SybbZ5--aROWZYJJrHTw1iOAA@mail.gmail.com>
X-Gm-Features: AQt7F2pFolTlntfZHnsAnr0DeAUdzyoG9JqA6J9pZFuOHHITqqRddXu39Nry8WY
Message-ID: 
 <CAGwozwGvibcndLz-Qd1awQ_E3SybbZ5--aROWZYJJrHTw1iOAA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Skip UEFI calibration on ASUS ROG
 Xbox Ally X
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: Shenghao Ding <shenghao-ding@ti.com>, Baojun Xu <baojun.xu@ti.com>,
 tiwai@suse.de,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176786540451.2367382.14648423176295711733@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Thu, 8 Jan 2026 at 11:38, Matthew Schwartz
<matthew.schwartz@linux.dev> wrote:
>
> There is currently an issue with UEFI calibration data parsing for some
> TAS devices, like the ASUS ROG Xbox Ally X (RC73XA), that causes audio
> quality issues such as gaps in playback. Until the issue is root caused
> and fixed, add a quirk to skip using the UEFI calibration data and fall
> back to using the calibration data provided by the DSP firmware, which
> restores full speaker functionality on affected devices.
>
> Cc: stable@vger.kernel.org # 6.18
> Link: https://lore.kernel.org/all/160aef32646c4d5498cbfd624fd683cc@ti.com/
> Closes: https://lore.kernel.org/all/0ba100d0-9b6f-4a3b-bffa-61abe1b46cd5@linux.dev/
> Suggested-by: Baojun Xu <baojun.xu@ti.com>

Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>


> Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
> ---
> v1->v2: drop wrong Fixes tag, amend commit to clarify suspected root cause
> and workaround being used.
> ---
>  sound/hda/codecs/side-codecs/tas2781_hda_i2c.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> index c8619995b1d7..ec3761050cab 100644
> --- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> +++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
> @@ -60,6 +60,7 @@ struct tas2781_hda_i2c_priv {
>         int (*save_calibration)(struct tas2781_hda *h);
>
>         int hda_chip_id;
> +       bool skip_calibration;
>  };
>
>  static int tas2781_get_i2c_res(struct acpi_resource *ares, void *data)
> @@ -489,7 +490,8 @@ static void tasdevice_dspfw_init(void *context)
>         /* If calibrated data occurs error, dsp will still works with default
>          * calibrated data inside algo.
>          */
> -       hda_priv->save_calibration(tas_hda);
> +       if (!hda_priv->skip_calibration)
> +               hda_priv->save_calibration(tas_hda);
>  }
>
>  static void tasdev_fw_ready(const struct firmware *fmw, void *context)
> @@ -546,6 +548,7 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
>         void *master_data)
>  {
>         struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
> +       struct tas2781_hda_i2c_priv *hda_priv = tas_hda->hda_priv;
>         struct hda_component_parent *parent = master_data;
>         struct hda_component *comp;
>         struct hda_codec *codec;
> @@ -571,6 +574,14 @@ static int tas2781_hda_bind(struct device *dev, struct device *master,
>                 break;
>         }
>
> +       /*
> +        * Using ASUS ROG Xbox Ally X (RC73XA) UEFI calibration data
> +        * causes audio dropouts during playback, use fallback data
> +        * from DSP firmware as a workaround.
> +        */
> +       if (codec->core.subsystem_id == 0x10431384)
> +               hda_priv->skip_calibration = true;
> +
>         pm_runtime_get_sync(dev);
>
>         comp->dev = dev;
> --
> 2.52.0
>
>

