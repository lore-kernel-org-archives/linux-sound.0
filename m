Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA0B2361659;
	Sun, 15 Mar 2026 20:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773605424; cv=none; b=dHZQENsmSBuQHShodqsqxkdYBWgdc8i0zixFhH7S7NMc6TxJ9t/VcWEVEKv+ge8p4UBv0Xqg7foVoMvHmmspP/nczDVU91/ayUqL6sxTHzp/Gvoipor6Uwa9nH6sh5W+2a7u2YX9xTW01CvYIzec3RRF0bUOPGfCjaIvmGw+Bew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773605424; c=relaxed/simple;
	bh=SDoksOdlLg3ZcwcLkZUv/IQe7dGwv2/sgeIQsX8BNvk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OyYoY59k4ynutdrRVvOhio4n95wIhy5Vfcs69BvWM46jnWs0EcCT0CDcDtrEAfTjkfU1wWDqFwcyB1pQhUzwjpXCFJbGdCIANfgnGFkewzvWqiPrwpghPkXiAcsHTSANXMqcGfb/rSIUTauK8ysv8ETJq1RFacgzwHFNZmPrD9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=kdeXGrqK; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="kdeXGrqK"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74CDF285F7C;
	Sun, 15 Mar 2026 21:10:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1773605421; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=d92Kc64VfMDP2wbxe9TYhFlX2CfE7ZiMziVYBfSt67A=;
	b=kdeXGrqKhWFlAlI3ZtFJjtJF2qVl/3uw7EmDPMJBQDLQRfgOre7JZ+YKBYn30lEA7epXQ8
	+S/prTg+hosJufrk9leUSp5UNumDkdR3IJGqq7PLrDutlUNb4kjFJJLuLAEcagOGnuTpfg
	N/ELhV5hIf3k4v+pM2Ags/v/9HTZdJyZ7HXcPHEib/HykCodup0qPK8AqTHgVCBLho2kO2
	I6XwaEjma1TuiJEBXF+q14+aB9FCCsU8LO9FIxcpxkaTsy/x7jQbJ/yQQX7iTNq2tKr7nC
	dFqaw4ulsSQ/9h7l8rdpC8n0xGkBkQJQvfWvMlfGF2vLuDlzUS9XjbmXAm9idw==
Message-ID: <640ef064-3f41-4642-bf13-8800d8f7adbb@cachyos.org>
Date: Sun, 15 Mar 2026 20:10:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ALSA: hda/realtek: Use ALC287_FIXUP_TXNW2781_I2C for ASUS
 Strix Gxx5
To: Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260315160939.191265-1-dnaim@cachyos.org>
From: Eric Naim <dnaim@cachyos.org>
In-Reply-To: <20260315160939.191265-1-dnaim@cachyos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 3/16/26 12:09 AM, Eric Naim wrote:
> These drivers were incorrectly using the ALC287_FIXUP_TAS2781_I2C quirk
> leading to errors:
> 

s/drivers/devices/

> [ 18.765990] Serial bus multi instantiate pseudo device driver TXNW2781:00: error -ENXIO: IRQ index 0 not found
> [ 18.768153] Serial bus multi instantiate pseudo device driver TXNW2781:00: error -ENXIO: IRQ index 0 not found
> [ 18.768476] Serial bus multi instantiate pseudo device driver TXNW2781:00: error -ENXIO: IRQ index 0 not found
> [ 18.768899] Serial bus multi instantiate pseudo device driver TXNW2781:00: Instantiated 3 I2C devices.
> 
> Use the correct ALC287_FIXUP_TXNW2781_I2C quirk to fix this and restore
> speaker audio on affected devices.
> 
> Fixes: 1e9c708dc3ae ("ALSA: hda/tas2781: Add new quirk for Lenovo, ASUS, Dell projects")
> Closes: https://lore.kernel.org/CACB9z7kjs8rhLstEc8fV29BCTb5dd881JwGozoKdO5cwCb=YwQ@mail.gmail.com
> Signed-off-by: Eric Naim <dnaim@cachyos.org>
> ---
>  sound/hda/codecs/realtek/alc269.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> Hi maintainers,
> 
> I'm changing the quirks for a lot of devices here, and the devices that I know are affected are only
> PID 3f20 and 3ef0. I hope someone can confirm that all these devices are using the same amplifier,
> and if not, I can send a v2 with only the confirmed affected devices.
> 
> Thanks.
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index c1791b136620..98d29f4cc81b 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6999,12 +6999,12 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1043, 0x3e00, "ASUS G814FH/FM/FP", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x1043, 0x3e20, "ASUS G814PH/PM/PP", ALC287_FIXUP_CS35L41_I2C_2),
>  	SND_PCI_QUIRK(0x1043, 0x3e30, "ASUS TP3607SA", ALC287_FIXUP_TAS2781_I2C),
> -	SND_PCI_QUIRK(0x1043, 0x3ee0, "ASUS Strix G815_JHR_JMR_JPR", ALC287_FIXUP_TAS2781_I2C),
> -	SND_PCI_QUIRK(0x1043, 0x3ef0, "ASUS Strix G635LR_LW_LX", ALC287_FIXUP_TAS2781_I2C),
> -	SND_PCI_QUIRK(0x1043, 0x3f00, "ASUS Strix G815LH_LM_LP", ALC287_FIXUP_TAS2781_I2C),
> -	SND_PCI_QUIRK(0x1043, 0x3f10, "ASUS Strix G835LR_LW_LX", ALC287_FIXUP_TAS2781_I2C),
> -	SND_PCI_QUIRK(0x1043, 0x3f20, "ASUS Strix G615LR_LW", ALC287_FIXUP_TAS2781_I2C),
> -	SND_PCI_QUIRK(0x1043, 0x3f30, "ASUS Strix G815LR_LW", ALC287_FIXUP_TAS2781_I2C),
> +	SND_PCI_QUIRK(0x1043, 0x3ee0, "ASUS Strix G815_JHR_JMR_JPR", ALC287_FIXUP_TXNW2781_I2C),
> +	SND_PCI_QUIRK(0x1043, 0x3ef0, "ASUS Strix G635LR_LW_LX", ALC287_FIXUP_TXNW2781_I2C),
> +	SND_PCI_QUIRK(0x1043, 0x3f00, "ASUS Strix G815LH_LM_LP", ALC287_FIXUP_TXNW2781_I2C),
> +	SND_PCI_QUIRK(0x1043, 0x3f10, "ASUS Strix G835LR_LW_LX", ALC287_FIXUP_TXNW2781_I2C),
> +	SND_PCI_QUIRK(0x1043, 0x3f20, "ASUS Strix G615LR_LW", ALC287_FIXUP_TXNW2781_I2C),
> +	SND_PCI_QUIRK(0x1043, 0x3f30, "ASUS Strix G815LR_LW", ALC287_FIXUP_TXNW2781_I2C),
>  	SND_PCI_QUIRK(0x1043, 0x3fd0, "ASUS B3605CVA", ALC245_FIXUP_CS35L41_SPI_2),
>  	SND_PCI_QUIRK(0x1043, 0x3ff0, "ASUS B5405CVA", ALC245_FIXUP_CS35L41_SPI_2),
>  	SND_PCI_QUIRK(0x1043, 0x831a, "ASUS P901", ALC269_FIXUP_STEREO_DMIC),
