Received: from mail.ptr1337.dev (mail.ptr1337.dev [202.61.224.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC1327FB05;
	Mon,  3 Aug 2026 07:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.61.224.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785741720; cv=none; b=tXO5Lqu0Fom59U983V/gleK+4hNd/DcJVM1Fm65qcmFyV5++zam3uY371dexgzQbmMdptxB4RTdzyqdzF9oSHmYAw6UI+VSmhJa5rrrqUoDBsMWnFIoXqOt1LeNSWQv7t+DQmRfK0sRjqFEsGfN4RXdW3O4C5BHCeBOkQKEOYCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785741720; c=relaxed/simple;
	bh=03XrbWLWiYTeday0LemMheeukBjb/TDoGwNljhgzHMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IxZsvb/H+bOMwRDBsQVYEYCvP+JmlOSWcWz1YzWE4pXADdXRKPSSS+h6aaW1566rwbUjlSONfaXlR+L++5Xrz+VowwmKHrFhUzn129Zxik8g2eanw0Cv9RowJxdMdDI51fkCc6bFkWG/Qq4bZaqLuSHLuGKuFZeXu8oVQWziNFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org; spf=pass smtp.mailfrom=cachyos.org; dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b=kbgKbgeN; arc=none smtp.client-ip=202.61.224.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cachyos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cachyos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cachyos.org header.i=@cachyos.org header.b="kbgKbgeN"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 94A552807AE;
	Mon,  3 Aug 2026 09:13:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cachyos.org; s=dkim;
	t=1785741195; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i+XoH05sHbJo/XhNKA1RrgPBz1JS3BPx7wzIlsOURhQ=;
	b=kbgKbgeNqM8FXMLHrNaeAnrG8RtlzX5KCOfVeU0ehIvtWgwOTXrGHtI3eslgLsjVGBRin5
	PBRYXkL64aEtyixUmN9fM6W4uReQa4/KNip4E9M41HobpHGAk3dllKxwhFufVDgsrUL1jJ
	Ksb/FfMbMJ/tw5OdJALaH7aa4KixVZAbL0akLVVrdOq5Zn/uYtZKgvz1BQr3zbrsD99BAr
	KtH7piq62ABy7CDOaFoI6CZnk91KNQI+AMVlx3J9ukwMi61N5eQ6yMh+WVUYNNc4z3BYQy
	2J6zoguG6KPzIgVR9pqt0Xhsy3xjoDdjIoAjRQy8OqvXnSRuycfji3Zhk/Ai/A==
Message-ID: <74989ff6-1f15-428a-8620-a5101d3f19f1@cachyos.org>
Date: Mon, 3 Aug 2026 07:12:00 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ALSA: hda/realtek: Limit Star Labs internal mic boost
To: Sean Rhodes <sean@starlabs.systems>, linux-kernel@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Zhang Heng <zhangheng@kylinos.cn>, Kailang Yang <kailang@realtek.com>,
 Damien Dagorn <damien.dagorn29@gmail.com>,
 Chris Chiu <chris.chiu@canonical.com>, Lei Huang <huanglei@kylinos.cn>,
 linux-sound@vger.kernel.org
References: <be87292613b24150d6321adac102b4b25d00e9e6.1785532385.git.sean@starlabs.systems>
From: Eric Naim <dnaim@cachyos.org>
In-Reply-To: <be87292613b24150d6321adac102b4b25d00e9e6.1785532385.git.sean@starlabs.systems>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Sean,

On 8/1/26 4:13 AM, Sean Rhodes wrote:
> The 30 dB internal mic boost is too high for laptops, especially with fans. Limit Star Labs internal mic boost to 10 dB.
> 
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>
> ---
>  sound/hda/codecs/realtek/alc269.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 379e1458f4ac..42756a3f3f8e 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -4188,6 +4188,7 @@ enum {
>  	ALC245_FIXUP_CLEVO_NOISY_MIC,
>  	ALC269_FIXUP_VAIO_VJFH52_MIC_NO_PRESENCE,
>  	ALC233_FIXUP_MEDION_MTL_SPK,
> +	ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST,
>  	ALC233_FIXUP_STARLABS_STARFIGHTER,
>  	ALC294_FIXUP_BASS_SPEAKER_15,
>  	ALC283_FIXUP_DELL_HP_RESUME,
> @@ -6725,6 +6726,10 @@ static const struct hda_fixup alc269_fixups[] = {
>  			{ }
>  		},
>  	},
> +	[ALC269_FIXUP_STARLABS_LIMIT_INT_MIC_BOOST] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc269_fixup_limit_int_mic_boost,
> +	},

I guess the reason you're creating a new quirk is because the existing
ALC269_FIXUP_LIMIT_INT_MIC_BOOST is chained to ALC269_FIXUP_THINKPAD_ACPI.
This makes the quirk identical to ALC269_FIXUP_THINKPAD_ACPI. Would it be
worth reworking the existing ALC_269_FIXUP_LIMIT_INT_MIC_BOOST to not be
chained and then create a new ALC269_FIXUP_THINKPAD_LIMIT (or similar) for
whichever devices that need it?

--
Regards,
  Eric
