Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A018217F33;
	Fri, 23 Jan 2026 22:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769206414; cv=none; b=hltWJlfKD7nseP4BCRc77QX5TQPVAPXgtcvwVN97MW2Y056xVCKJJvkGo5BPkU4oVSM9K7tqX/8Vmw8HHmUWJNPv+Qzl7XCTTeME1U/tTIabrXK1rMBeoR7CjqilAHmrmEPmfOqS7iAx34BUG8n2ww1F3WvhRNHKByKnBtr4WJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769206414; c=relaxed/simple;
	bh=zEAVtWk+Xmd2ZqzGCc3byygqT6GmUWtXPpa5KWHzhfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=flKRuqK8wQHH36/R1W8+DtWG5cq1ZxZ0lVkArwE2xeVw4o/dC00Uxhp6u269u+QwnQYjUF3ZrVxeFmMPPtrJ6BBOOBtfUtr9WikW1Lktuzyh+hsZxcBpsupkr912efBxsyGbA14QUabkJOo3cPG4FTnqC3tdclBm0isEGBp1Rx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=OkSGPG26; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="OkSGPG26"
Received: from [192.168.0.182] (unknown [61.8.159.50])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 62B1C2FC0052;
	Fri, 23 Jan 2026 23:13:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1769206411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tRMoJz3BuIF+ZYjgnoW7uiMLW2+j3QJmdOgh5xE1eO8=;
	b=OkSGPG26m6m+4SbNtxlACx46q6r+eStmOb2r8XTdvF22owLWbHQVLXQeKl5F4Q5c1a4lKc
	aEprLzW+LMS7QhHUf+BdhcZJ+IvZwhS5FbFXIU1IwY2lNBWY0rLGRoY6aRXshakupO7ZeW
	LM11Oij9slLmpPw/CcNhRpuOJe1KqtE=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <f6c817dd-1f2e-4e3f-ba72-5a5cb62f87a7@tuxedocomputers.com>
Date: Fri, 23 Jan 2026 23:13:30 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ALSA: hda/realtek: Really fix headset mic for TongFang
 X6AR55xU.
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260123212909.19046-1-wse@tuxedocomputers.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <20260123212909.19046-1-wse@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry typo in toppic (v2 vs v3), i sent it again with corrected toppic.

Am 23.01.26 um 22:29 schrieb Werner Sembach:
> Add a PCI quirk to enable microphone detection on the headphone jack of
> TongFang X6AR55xU devices.
>
> The former quirk entry did not acomplish this and is removed.
>
> Signed-off-by: Tim Guttzeit <t.guttzeit@tuxedocomputers.com>
> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
> ---
>   sound/hda/codecs/realtek/alc269.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 52b246f811872..17047b87276f4 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7313,6 +7313,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>   	SND_PCI_QUIRK(0x1d05, 0x1409, "TongFang GMxIXxx", ALC2XX_FIXUP_HEADSET_MIC),
>   	SND_PCI_QUIRK(0x1d05, 0x300f, "TongFang X6AR5xxY", ALC2XX_FIXUP_HEADSET_MIC),
>   	SND_PCI_QUIRK(0x1d05, 0x3019, "TongFang X6FR5xxY", ALC2XX_FIXUP_HEADSET_MIC),
> +	SND_PCI_QUIRK(0x1d05, 0x3031, "TongFang X6AR55xU", ALC2XX_FIXUP_HEADSET_MIC),
>   	SND_PCI_QUIRK(0x1d17, 0x3288, "Haier Boyue G42", ALC269VC_FIXUP_ACER_VCOPPERBOX_PINS),
>   	SND_PCI_QUIRK(0x1d72, 0x1602, "RedmiBook", ALC255_FIXUP_XIAOMI_HEADSET_MIC),
>   	SND_PCI_QUIRK(0x1d72, 0x1701, "XiaomiNotebook Pro", ALC298_FIXUP_DELL1_MIC_NO_PRESENCE),
> @@ -7782,10 +7783,6 @@ static const struct snd_hda_pin_quirk alc269_pin_fixup_tbl[] = {
>   		{0x12, 0x90a60140},
>   		{0x19, 0x04a11030},
>   		{0x21, 0x04211020}),
> -	SND_HDA_PIN_QUIRK(0x10ec0274, 0x1d05, "TongFang", ALC274_FIXUP_HP_HEADSET_MIC,
> -		{0x17, 0x90170110},
> -		{0x19, 0x03a11030},
> -		{0x21, 0x03211020}),
>   	SND_HDA_PIN_QUIRK(0x10ec0282, 0x1025, "Acer", ALC282_FIXUP_ACER_DISABLE_LINEOUT,
>   		ALC282_STANDARD_PINS,
>   		{0x12, 0x90a609c0},
