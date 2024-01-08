Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CAD524A8
	for <linux-sound@vger.kernel.org>; Mon,  8 Jan 2024 16:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ZLwJkO9W"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4087WATC017577;
	Mon, 8 Jan 2024 10:11:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:references:in-reply-to:subject:date:message-id
	:mime-version:content-type:content-transfer-encoding; s=
	PODMain02222019; bh=e7GrmHXlxvvRAJRgmruAFaDykHnLNpG7widRZqnl4JE=; b=
	ZLwJkO9WnuO4Fd4oeZvNyVH2JuTDWRIcoj8tNrKCtgydDpfQ1IZJ6bL0dJDgMysm
	6or6eQfxRQ8m+0dEMScOP/ai42twSsU/sS2KAJXR9ejt/RLT8x+IeT6chSjkGZiD
	YN3xdl2oUYhNTAEK23yadd4+DRt0vAJqS8VE1NPln42Sgg3wYHm5C2xZLns2cmmO
	SZ3m7UeyG76uuUcUWQpk9NdAVAt/EI1MOXActUWbtydjR//QeydQXyniLgUM/o5H
	olEfXF/n56VBMA85IRB5kQOoefnYpYbnFFFCbuCIUiLA9R39qpoi1QBvS1iVFM9N
	PykfuNrOXNh39ObHkbhWCA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3vf45pjfqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 10:11:57 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 16:11:52 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 8 Jan 2024 16:11:52 +0000
Received: from LONN2DGDQ73 (LONN2DGDQ73.ad.cirrus.com [198.61.65.232])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 47278474;
	Mon,  8 Jan 2024 16:11:52 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: 'Huayu Zhang' <932367230@qq.com>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <james.schulman@cirrus.com>,
        <david.rhodes@cirrus.com>, <rf@opensource.cirrus.com>,
        <perex@perex.cz>, <kailang@realtek.com>, <zhanghuayu.dev@gmail.com>
References: <tencent_BADE40D9A6A1C82B21811A844E5FE3881D06@qq.com>
In-Reply-To: <tencent_BADE40D9A6A1C82B21811A844E5FE3881D06@qq.com>
Subject: RE: [PATCH] [PATCH v2] ALSA: hda: Add _DSD for ThinkBook 16p G4 IRH with Subsystem Id of 0x17aa38a9.
Date: Mon, 8 Jan 2024 16:11:52 +0000
Message-ID: <000001da424d$645814a0$2d083de0$@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQHXTbcUxrH9wZLiUHzw+OBEgS0+e7DV/jjQ
Content-Language: en-gb
X-Proofpoint-GUID: LIaHPWpiVwV6TgoPA_njU6FDO5HjQcUw
X-Proofpoint-ORIG-GUID: LIaHPWpiVwV6TgoPA_njU6FDO5HjQcUw
X-Proofpoint-Spam-Reason: safe

Hi,

> -----Original Message-----
> From: Huayu Zhang <932367230@qq.com>
> Sent: Monday, January 8, 2024 2:05 PM
> To: tiwai@suse.com
> Cc: linux-sound@vger.kernel.org; james.schulman@cirrus.com;
> david.rhodes@cirrus.com; rf@opensource.cirrus.com; perex@perex.cz;
> sbinding@opensource.cirrus.com; kailang@realtek.com;
> zhanghuayu.dev@gmail.com; Huayu Zhang <932367230@qq.com>
> Subject: [PATCH] [PATCH v2] ALSA: hda: Add _DSD for ThinkBook 16p G4
> IRH with Subsystem Id of 0x17aa38a9.
> 
> Add _DSD for ThinkBook 16p G4 IRH with Subsystem Id of 0x17aa38a9
> because those info are missing in the ACPI table.
> 
> Before applying the changes: the laptop only have very poor and low
> volumn with only up facing builtin speakers (down facing have no
sound
> at all).
> 
> After applying: both down facing (bass) and up facing bultin
speakers
> will have sound in a reasonable level.
> 
> But the behavior of volumn control is actually changing the
frequency
> division: adjust to louder
> (which supposed to make overall louder) only makes the up facing
bultin
> speakers louder and downfacing gradually
> lower its volumn at the meantime.
> 
> Wondering if this is related to ALSA or should make further changes
on
> the AMP settings?
> 
> Signed-off-by: Huayu Zhang <932367230@qq.com>
> ---
>  sound/pci/hda/cs35l41_hda_property.c | 2 ++
>  sound/pci/hda/patch_realtek.c        | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/sound/pci/hda/cs35l41_hda_property.c
> b/sound/pci/hda/cs35l41_hda_property.c
> index 35277ce890a4..b1844224123f 100644
> --- a/sound/pci/hda/cs35l41_hda_property.c
> +++ b/sound/pci/hda/cs35l41_hda_property.c
> @@ -93,6 +93,7 @@ static const struct cs35l41_config
> cs35l41_config_table[] = {
>  	{ "10431F12", 2, INTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 1000, 4500, 24 },
>  	{ "10431F1F", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 1, -1, 0, 0, 0, 0 },
>  	{ "10431F62", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 1, 2, 0, 0, 0, 0 },
> +	{ "17AA38A9", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 0, 0, 0 },

This entry doesn't quite match the ACPI that I have access to for this
laptop,
though what I have might be out of date.
Can you attach an acpidump of this laptop so I can compare it to this
entry.
The ACPI dump that I have states that the SPK-ID is GPIO index 2,
rather
than index 1 as described in this entry.

You can generate the acpidump using the acpidump tool:
$ acpidump > acpidump.out

Thanks,
Stefan

>  	{ "17AA38B4", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 0, 0, 0 },
>  	{ "17AA38B5", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 0, 0, 0 },
>  	{ "17AA38B6", 2, EXTERNAL, { CS35L41_LEFT, CS35L41_RIGHT, 0, 0
> }, 0, 1, -1, 0, 0, 0 },
> @@ -427,6 +428,7 @@ static const struct cs35l41_prop_model
> cs35l41_prop_model_table[] = {
>  	{ "CSC3551", "10431F12", generic_dsd_config },
>  	{ "CSC3551", "10431F1F", generic_dsd_config },
>  	{ "CSC3551", "10431F62", generic_dsd_config },
> +	{ "CSC3551", "17AA38A9", generic_dsd_config },
>  	{ "CSC3551", "17AA38B4", generic_dsd_config },
>  	{ "CSC3551", "17AA38B5", generic_dsd_config },
>  	{ "CSC3551", "17AA38B6", generic_dsd_config },
> diff --git a/sound/pci/hda/patch_realtek.c
> b/sound/pci/hda/patch_realtek.c
> index 1dcfba27e075..3eae1a5d9bcd 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -10256,6 +10256,7 @@ static const struct snd_pci_quirk
> alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x3886, "Y780 VECO DUAL",
> ALC287_FIXUP_TAS2781_I2C),
>  	SND_PCI_QUIRK(0x17aa, 0x38a7, "Y780P AMD YG dual",
> ALC287_FIXUP_TAS2781_I2C),
>  	SND_PCI_QUIRK(0x17aa, 0x38a8, "Y780P AMD VECO dual",
> ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x17aa, 0x38a9, "ThinkBook 16p G4 IRH",
> ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x17aa, 0x38b4, "Legion Slim 7 16IRH8",
> ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x17aa, 0x38b5, "Legion Slim 7 16IRH8",
> ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x17aa, 0x38b6, "Legion Slim 7 16APH8",
> ALC287_FIXUP_CS35L41_I2C_2),
> --
> 2.34.1
> 


