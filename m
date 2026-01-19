Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4536726E175;
	Mon, 19 Jan 2026 06:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768804628; cv=none; b=jDAXeM9N92fcUWQ5lYoZRIwyCZ2quCIcnjTzRfwI/PLU0v2VLfmW2E0MM577JFY8HQUD/fTDxG97QcfgiErg39i1Q/tuLdZ8PaDlHKzK/NdGtNPg1n60lqCrofDeO4hQ11O9IoiRCOVkJyUgtMrnwIKr3I8XSPTed8UM2QuRyDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768804628; c=relaxed/simple;
	bh=98Zdz76JsHMNDUUxqEK63kVu6owZ4whUV/7PPnvwDgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2Sqs6MK4dF5ypRvH319IB4CftvgoMKYpvDKBizcfEz6i9Bi6k5FUPF74wV5Ugc9uE7/9CdllfRqotlKcKNat/4Vt515ewqQQtgsRtwLpwEpYaZoaX14PmeE9ZgKVvTyD/P4Vo85r/quctrgYF/4PJK3YWa8iHpwGZx+e2tISho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SZcPQA1A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SZcPQA1A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE45C116C6;
	Mon, 19 Jan 2026 06:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768804627;
	bh=98Zdz76JsHMNDUUxqEK63kVu6owZ4whUV/7PPnvwDgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SZcPQA1AkLjrpQqiwI2RmL3A9TAEumONofEqxFZnl9IjOejtbegTdm6uRNnMZxhPs
	 O/7xusStj0elWt05wiWqkZ3XJtTSdnUfINLrsU4DyYpCMeqP8Zi8zrFK4tZZfzxJHB
	 NhQUZguxmCzR9d/NF9zjXBqo4KoepWUgUrqTZHcA=
Date: Mon, 19 Jan 2026 07:37:03 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Qin Wan <qin.wan@hp.com>
Cc: perex@perex.cz, tiwai@suse.com, sbinding@opensource.cirrus.com,
	kailang@realtek.com, chris.chiu@canonical.com, edip@medip.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, alexandru.gagniuc@hp.com,
	Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [PATCH] ALSA: hda/realtek: Fix micmute led for HP ElitBook 6 G2a
Message-ID: <2026011955-corroding-unbounded-2cb0@gregkh>
References: <20260119034504.3047301-1-qin.wan@hp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119034504.3047301-1-qin.wan@hp.com>

On Mon, Jan 19, 2026 at 11:45:04AM +0800, Qin Wan wrote:
> This laptop uses the ALC236 codec, fixed by enabling
> the ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF quirk
> 
> Signed-off-by: Qin Wan <qin.wan@hp.com>
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> ---
>  sound/hda/codecs/realtek/alc269.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 0bd9fe745807..49590926199e 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -6704,6 +6704,10 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8ed8, "HP Merino16", ALC245_FIXUP_TAS2781_SPI_2),
>  	SND_PCI_QUIRK(0x103c, 0x8ed9, "HP Merino14W", ALC245_FIXUP_TAS2781_SPI_2),
>  	SND_PCI_QUIRK(0x103c, 0x8eda, "HP Merino16W", ALC245_FIXUP_TAS2781_SPI_2),
> +	SND_PCI_QUIRK(0x103c, 0x8f14, "HP EliteBook 6 G2a 14", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
> +	SND_PCI_QUIRK(0x103c, 0x8f19, "HP EliteBook 6 G2a 16",  ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
> +	SND_PCI_QUIRK(0x103c, 0x8f3c, "HP EliteBook 6 G2a 14", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
> +	SND_PCI_QUIRK(0x103c, 0x8f3d, "HP EliteBook 6 G2a 16", ALC236_FIXUP_HP_MUTE_LED_MICMUTE_VREF),
>  	SND_PCI_QUIRK(0x103c, 0x8f40, "HP Lampas14", ALC287_FIXUP_TXNW2781_I2C),
>  	SND_PCI_QUIRK(0x103c, 0x8f41, "HP Lampas16", ALC287_FIXUP_TXNW2781_I2C),
>  	SND_PCI_QUIRK(0x103c, 0x8f42, "HP LampasW14", ALC287_FIXUP_TXNW2781_I2C),
> -- 
> 2.43.0
> 
> 

<formletter>

This is not the correct way to submit patches for inclusion in the
stable kernel tree.  Please read:
    https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html
for how to do this properly.

</formletter>
