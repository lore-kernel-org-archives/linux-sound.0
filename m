Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E7A367B8B
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 20:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781035369; cv=none; b=CeK7hm2BtLJJr81PDqauWjHrQLMeFmyNzlK4MvKRAlgneIWh38l50DdO1h0jHSMZktLoTUOOKbCiIyNyGJCeJavDyU3wRyPtN4bCPj7U/pi5YuF3RHZekMxbz6ArBXy287WIMqeaS1+9GIQITmIj38nOWsftU6vItOWRw6P4fts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781035369; c=relaxed/simple;
	bh=vTH/srESL7tpS+ECPCB7v52KdDC9EcXkC0ey3n2L7To=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HSsKsq/K4Enx1y8t3TsdvIqZ68MEnCaXWjJPqUjjgigYf22KQF3D8nZK7WhGLlq84EcAEt7KrXimO1MfLe2M33ZnrZM8fv/altPygUYhIuRY+hguPF81SuK31ZcJJBNGZ0pb8VL30ab9AYpOJ1fn/Qlrnfia8WJ2cUQmtNJtkPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+BTgVb5; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+BTgVb5"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cc0ef7c306so55966376d6.3
        for <linux-sound@vger.kernel.org>; Tue, 09 Jun 2026 13:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781035367; x=1781640167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+TCKI/Z6pxJHU8K9ghal+V4w2YNU/rhZJK7YynAhpYM=;
        b=j+BTgVb5jYUQXYC5DyCk7FV4W8YhXXM4BJY3+7xwne1CWmHkVAoSwheH8YrM9yohJ8
         vmX94wMAtdgF75zZU+i0nJyiwyDNB241oLb5S+qnCfvM1aNmJikgS+X0dpPz1m0ZxFba
         w3w6vAVQXSF6ozhu7Z63ve6gJxWExgEoxBjccgJba0n8XsXkDpDbX5x7lg4Pgz3Tzo/e
         xLQFMn8s9D3SWODdN7T2VqLuPM3RlJkHezKgwpCxeBot0CXCUa3px1w0+ZMhvBNzAIyQ
         hq2csNIWcH4jcnhj2K7FKZr/E1mQfFS257Y3srMSRK0c8fZF4mYm/xzeFlpPMyqYJaPK
         Sdnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781035367; x=1781640167;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TCKI/Z6pxJHU8K9ghal+V4w2YNU/rhZJK7YynAhpYM=;
        b=Uz7d3305LGoLCB0UT6Yrc57UVaC5c/5WowO70yBGERjEnFkw3EeP6LlWwf9hThHq/s
         7Xy5bSlGVYUtadskNN6zAGoYmS+OG4oSUDYlpAIvYbRtxHJwhOaHNZR70ZXP896WQqZA
         wtDEPIoxPfLZasP+5ugXhyVbPN4DCrW209xv3uAgCHRP8gLw0YV3BxPae5Q8gNjIsx1O
         PUF7uF63db8QCfqNWG9Jw+ZIDuLX6v+Pulf+Uusqz3YAhV5jRdBNcMA9HFVHDvY83m18
         miWnofsh8lAraP2FbY0s0Jjx509ncmyblWNyWOCDNG2akRLQamyqPJEMMRD0tApkRAI8
         uKnw==
X-Forwarded-Encrypted: i=1; AFNElJ97e/R0ofqvQ5otSUkMlhjiSRUK1ThRoCGDMBDQypOwHf1AO9+1C230uP+imTXuEpoTMY7kVIO72jYbqA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnOWrhmZeCWo0QKVZ7WUuOR4Wd7jNFtwL26IjnuIQwAOCa0yOz
	33G121eVA09cGTGwW4pjKgBMoMSHkFG0BSqa6N9s0/+QmBdfFm7/Jthk
X-Gm-Gg: Acq92OEelxhnlMc9uOLJkxowA9fx4+Tx7Ch9xd6oSbHkLtTsXUE/gI2ic5adbhNrJWR
	hcRpk3J+GS76YWJkBwkSyXWYiG26CCXiBoX54Avpp5TL4B27OP0F8rczXUkXH/geq1cN/55mgrW
	3KEJRxHTmraHVVsoajmw1GmLKQG4dDZ7Itv3C9kb/8s6UnJQk3LmQLOEM22ngJ/Yht1zKd+6hGs
	+x6MNPEMfzdrQSwfX1cceasMqh+wh4P2NG4EutHhO0wWIbiULzoBUpbo/G59amQ8oyfqLZxxxuU
	im8NxFvZHn2zSgjBnYUgl4MSFpCSLKoNRjF3PnfXLnMzicyjT0DNXQ2XltbH7MnMCVnZI+X3aIX
	Smy1niR+JdeBU6O1Z7WONT0E2NemPZhVFkhq1jwJTZVJVW4A242HJuT7Vl119o46QAtIgvafw12
	eArhReZbUM+hFgFOiLV3Qo
X-Received: by 2002:a05:6214:451f:b0:8cc:f175:3ac4 with SMTP id 6a1803df08f44-8cee626eec5mr343689936d6.43.1781035367250;
        Tue, 09 Jun 2026 13:02:47 -0700 (PDT)
Received: from geday ([2804:7f2:800b:dd29::dead:c001])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd2629cesm207659566d6.41.2026.06.09.13.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:02:46 -0700 (PDT)
Date: Tue, 9 Jun 2026 17:02:41 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: furstblumier <seal@furst.blue>
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, perex@perex.cz,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for HP 255 15.6 inch G9
 Notebook PC
Message-ID: <aihxYefWRPyf2zK9@geday>
References: <20260507202754.16114-1-seal@furst.blue>
 <20260609195443.498879-1-seal@furst.blue>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609195443.498879-1-seal@furst.blue>

Hi Furst

On Tue, Jun 09, 2026 at 09:54:43PM +0200, furstblumier wrote:
> The HP 255 15.6 inch G9 Notebook PC (PCI SSID 103c:8a1b) uses the
> ALC236 codec but lacks an entry in the quirk table, causing the kernel
> to fall back to a null SSID match (103c:0000) and skip the necessary
> fixup. Add a quirk entry using ALC236_FIXUP_HP_MUTE_LED_COEFBIT2,
> matching the HP 255 G8 which uses the same codec and fixup. This fixes
> the mute-button LED and fixes an issue with unplugging and replugging a
> headset jack not being recognized as an audio sink.
> 
> Signed-off-by: Furst Blumier <seal@furst.blue>
> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index 11d0ea8ed..08c8b17b7 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7063,6 +7063,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x89da, "HP Spectre x360 14t-ea100", ALC245_FIXUP_HP_SPECTRE_X360_EU0XXX),
>  	SND_PCI_QUIRK(0x103c, 0x89e7, "HP Elite x2 G9", ALC245_FIXUP_CS35L41_SPI_2_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8a0f, "HP Pavilion 14-ec1xxx", ALC287_FIXUP_HP_GPIO_LED),
> +	SND_PCI_QUIRK(0x103c, 0x8a1b, "HP 255 15.6 inch G9 Notebook PC", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>  	SND_PCI_QUIRK(0x103c, 0x8a1f, "HP Laptop 14s-dr5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>  	SND_PCI_QUIRK(0x103c, 0x8a20, "HP Laptop 15s-fq5xxx", ALC236_FIXUP_HP_MUTE_LED_COEFBIT2),
>  	SND_PCI_QUIRK(0x103c, 0x8a25, "HP Victus 16-d1xxx (MB 8A25)", ALC245_FIXUP_HP_MUTE_LED_COEFBIT),
> -- 
> 2.54.0
> 

The body of the patch and all metadata are now correct but you replied
to your own message (that has been previously ignored) with the patch.

Please don't do this.

Please resend patches in their own thread, with the RESEND marker.

If in doubt about the kernel process, consult https://docs.kernel.org

