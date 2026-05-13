Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB0F3C276F;
	Wed, 13 May 2026 09:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778664419; cv=none; b=RuDmFcAO/rY45x6pLsr7TpLMdv6+kjLy9EpuwwmJchEANAW6J1TwnLSn0EYC9tRsDTPakngD5ALDHTN1nF7R99lh2WgDUTAsJFFKGImwHYJKK0X0LZcapMD4JqRUuMNwUOBbYhESISDG4Z0gl+IPraatWVTjadTnVoY4wbnkcNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778664419; c=relaxed/simple;
	bh=zQa5gqqpFm710+Ixa+a4CQZ7LaEGyB+ZyPR8jBqYxi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fw5Y22glhB+un853WUkugHhgtOm0eXDD3maeLwbQ1jVld1wdOZYF+Wa6iCcQYDWLE2+wFWXKuhoB2ZZThVReCotkmyPsOutrBpfZyP9GWtEOaAka6eai4bdcAOiO9OVkbPYjC3Zh6NaGDjaaQf/0fLG/4NQBcc4BBMsfeVcNlko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=M1qlllNT; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="M1qlllNT"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B5FF828171D;
	Wed, 13 May 2026 11:26:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1778664409; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bcdzzO0MiRGhVsokH/gznJ943ymeZUTjk85Au+buLt0=;
	b=M1qlllNTDV+AoVwRIqLdczp9VAEkyoL6e7uTTvP2YOxUdcqo7/6fHPHUzv0l6kSWjF5UqL
	BWNWDXu/WjLoERQ5kg9fRN0MhVfT/7FVlSZEZ6dAsHpyF23FjTsLZ97tkf3IE+8ZKkL1yd
	IhAJdRuFpgX3Ulo/FxIl3UNHegEZ0hRGFkXXVyuME5vGfUZnblMwqQ3hvos7L+5EvqmIWX
	OfI99NINC54reQUYBB4vJ9TlIEgZwKk2Hx3rUKWPMxT2q+L92Afd4QVnm8X+O5cSdg/+lw
	XkJFdtlwhkdZ39mJSAz+by/paT9T5Rzcdc6WbAqbjIJRAHn4Zxk/D/Rc5Sz6HA==
Message-ID: <541669a6-879c-454b-98c4-3a58c8d2d76b@cachyos.org>
Date: Wed, 13 May 2026 09:26:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH] ALSA:hda/realtek: ALC269 fixup for Lenovo Yoga Pro 7
 15ASH111 audio
To: Jackie Dong <xy-jackie@139.com>, perex@perex.cz, tiwai@suse.com,
 sbinding@opensource.cirrus.com, zhangheng@kylinos.cn, kailang@realtek.com,
 edip@medip.dev
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260513091256.97584-1-xy-jackie@139.com>
From: Eric Naim <dnaim@cachyos.org>
In-Reply-To: <20260513091256.97584-1-xy-jackie@139.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 5/13/26 5:12 PM, Jackie Dong wrote:
> ALSA:hda/realtek: ALC269 fixup for Lenovo Yoga Pro 7 15ASH111 audio
> 
> The amp/speakers on the Lenovo Yoga Pro 7 15ASH11 laptop aren't be
> adjusted by Speaker Volume. Reuse the DAC routing selected for ThinkPad
> X1 Gen7 function to fix it.
> 
> Signed-off-by: Jackie Dong <xy-jackie@139.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 11d0ea8ed859..84aa1d4e7410 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -4076,6 +4076,7 @@ enum {
>  	ALC287_FIXUP_YOGA7_14ITL_SPEAKERS,
>  	ALC298_FIXUP_LENOVO_C940_DUET7,
>  	ALC287_FIXUP_LENOVO_YOGA_BOOK_9I,
> +	ALC287_FIXUP_LENOVO_YOGA_PRO7,
>  	ALC287_FIXUP_13S_GEN2_SPEAKERS,
>  	ALC256_FIXUP_SET_COEF_DEFAULTS,
>  	ALC256_FIXUP_SYSTEM76_MIC_NO_PRESENCE,
> @@ -6100,6 +6101,11 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.chained = true,
>  		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
>  	},
> +	[ALC287_FIXUP_LENOVO_YOGA_PRO7] = {
> +		.type = HDA_FIXUP_FUNC,
> +		/* Reuse the DAC routing selected for ThinkPad X1 Gen7 */
> +		.v.func = alc285_fixup_thinkpad_x1_gen7,
> +	},

Hi Jackie, an identical quirk exists for this. See ALC245_FIXUP_BASS_HP_DAC. I
think you should use that instead of creating a new quirk that is identical.

>  	[ALC623_FIXUP_LENOVO_THINKSTATION_P340] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc_fixup_no_shutup,
> @@ -7752,6 +7758,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x17aa, 0x38df, "Y990 YG DUAL", ALC287_FIXUP_TAS2781_I2C),
>  	SND_PCI_QUIRK(0x17aa, 0x38f9, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
>  	SND_PCI_QUIRK(0x17aa, 0x38fa, "Thinkbook 16P Gen5", ALC287_FIXUP_MG_RTKC_CSAMP_CS35L41_I2C_THINKPAD),
> +	SND_PCI_QUIRK(0x17aa, 0x38fc, "Lenovo Yoga Pro 7 15ASH11", ALC287_FIXUP_LENOVO_YOGA_PRO7),
>  	SND_PCI_QUIRK(0x17aa, 0x38fd, "ThinkBook plus Gen5 Hybrid", ALC287_FIXUP_TAS2781_I2C),
>  	SND_PCI_QUIRK(0x17aa, 0x3902, "Lenovo E50-80", ALC269_FIXUP_DMIC_THINKPAD_ACPI),
>  	SND_PCI_QUIRK(0x17aa, 0x390d, "Lenovo Yoga Pro 7 14ASP10", ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN),
> @@ -8043,6 +8050,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
>  	{.id = ALC285_FIXUP_HP_SPECTRE_X360_DF1, .name = "alc285-hp-spectre-x360-df1"},
>  	{.id = ALC285_FIXUP_HP_ENVY_X360, .name = "alc285-hp-envy-x360"},
>  	{.id = ALC287_FIXUP_IDEAPAD_BASS_SPK_AMP, .name = "alc287-ideapad-bass-spk-amp"},
> +	{.id = ALC287_FIXUP_LENOVO_YOGA_PRO7, .name = "alc287-lenovo-yoga-pro7"},
>  	{.id = ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN, .name = "alc287-yoga9-bass-spk-pin"},
>  	{.id = ALC623_FIXUP_LENOVO_THINKSTATION_P340, .name = "alc623-lenovo-thinkstation-p340"},
>  	{.id = ALC255_FIXUP_ACER_HEADPHONE_AND_MIC, .name = "alc255-acer-headphone-and-mic"},


-- 
Regards,
  Eric
