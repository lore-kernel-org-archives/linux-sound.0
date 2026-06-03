Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEC7377560
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 21:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780521518; cv=none; b=Uy09sgRGDg4ZdYucLx66cNpw22/LgOfw5CUbcnnjDV1w+FAdp6p6RKEpw8eg+IWQ4m+LZ4jFxFOh9h03VmZDqCcVutjDdEKTCAdJeUweD1cSfxrpi/FJjb3cKd219qe7MGHB3GUzbRKpHySlKzbjxRZsCD5P9+1wtHyrff+P4Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780521518; c=relaxed/simple;
	bh=FYs3q8G+xh6dcVBnTbK6lYHdKSeSNuDSgS8esTlbB2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JQMLWlI7b6ctnLwU8ElvSyWnTWyICjqSq6xvinCduS8WPTsWROPIW7bA8CTl2AuLvNv5GsnLxqPthwl+D+QhAYG1LypJOYdDmGm4oTLP9D4xRoCAKJIZtmw9jYtrLK7EOoZLJ22P3TdbrnpvYr0igh096axW1dTfqgTihnr6PgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QIceRoD2; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QIceRoD2"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-660e9ea23cbso24288d50.2
        for <linux-sound@vger.kernel.org>; Wed, 03 Jun 2026 14:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780521516; x=1781126316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pzyYhNmAG0JLb+2CSXOC2IMpG1b50U9zP7xKhZ4I6zc=;
        b=QIceRoD2zE8q+qgDh66ldDnGoB6y31wWmmO+4ch//UFhB8eKEU8wDecKIH4JKOoa+t
         2RTAVgSjA7kkytMmOAOxrBHxs69ePsupfKy9H96sK7ZMzMoBvVC/YTbRullsAMTLEIZi
         iPuAEPXhyvMWMenpZ+N4LFdNUq+FyRpFo8lRLfa49VnQHSnmPyJOnrV7lEwIkg7htYrW
         wWB92+MJ0RtS30YUkiuCfqWWfj7Y98ipsBjXeEApExwtogd53UMTCBK+6UnXGTWox7h+
         gHj9/mvSr+cvTTmH75AESuw5/oLDnKYfO7POLpPIy7y4g1bTu1CielrEbGuuAgUfQlDS
         ydEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780521516; x=1781126316;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzyYhNmAG0JLb+2CSXOC2IMpG1b50U9zP7xKhZ4I6zc=;
        b=OAdyUyhT3Aen1W69k/8bCmyQPxeoNUC3FWjuQk0J2FfRAf9lRcXTx7lw9eJajfxGSn
         P53dj0/7qF3nHEnBQZ/1mTCgGT8AIMVpgg54vZWRg5AGHQ7w5wUKADEBwRSvnPHEJzcs
         LANrar0+UFoETNscGuFlnd9nRvCEKnJwrp0w9tpaqmBCGxoVqCl2DBC0O3yZ3GsZwiPH
         3HjBBoNq5j7Pz0NouhbbHBufBl4oFGR2pXjrYgyIhxFYNDZUNPr/EsZYlMaNZCbOAQfU
         K7tyzT0YFImF1gU7YTNe+VAR+IsAqJjQV7yU6FEyqHcJ1cDKOzxZIZbFVUiVx8uQ5VMz
         EhqA==
X-Forwarded-Encrypted: i=1; AFNElJ9f8/0DFr6/E7Bxt1k6esDVJSaa5vkRYh4uydD3vghRpJnMRTbFJ48fMEl/RRhN6e1o2i4uv4RKmizRew==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLoPL/giTCHhDgBOF6RjacwdK9xEufuaJQb6rVaz3w/NXcEJpE
	jYV/stFGLTcj140+EwMK9eDQA1oEzv+Ec7mKnn5q5ofAiCrzF5w35UlY
X-Gm-Gg: Acq92OFqQNIrxnQffFDUrPaXxu8+8IIShr0cILkevzO02dRRvvxCu6VwNBvjSiMQN8i
	q3msEODv7yukSWlzmzClvYTH6kD/SbVSFIWOSK6B8/hQX+OZiSX6Op03JnBTCa6FmjK6m1lKEVq
	xKT7hwrdLrtKyDcXwm2Ju+0LxAnkzIH73tmk54yiVu/7b00n553u6kF1nnkiTNadh9z90xXobSe
	Ceh6TZmSt+jpJjspRaSpeZijC6gSTe9SO6pUgQcPILmF79p98Z2AH5quT0F8OGPcD+VEa+3W7ex
	rwgoIEqHieB7DcwOariXKJbAlJJlq1PAy1elt6vMUAUBoi50so0leYdg/Yk/VTjkTTcX2j109tn
	z+pngXcOk5MvMpaOaM4k2T2W7SYubx87pRTsPnkGPyHbgGGDRo31DUkhTzdxCC07Uf4UykhEKz8
	1zgHqMSoSzw3pLKILdSqrDEB9PQ1hYE1U=
X-Received: by 2002:a05:690e:128b:b0:650:4a79:f3ac with SMTP id 956f58d0204a3-660dbe992a4mr4624959d50.9.1780521516126;
        Wed, 03 Jun 2026 14:18:36 -0700 (PDT)
Received: from geday ([2804:7f2:800b:8bcd::dead:c001])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-660d6488b1csm2673313d50.19.2026.06.03.14.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 14:18:35 -0700 (PDT)
Date: Wed, 3 Jun 2026 18:18:30 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Andrei Faleichyk <andrei.faleichyk@noogadev.com>
Cc: tiwai@suse.com, perex@perex.cz, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add quirk for ASUS VivoBook X509DAP
Message-ID: <aiCaJlTA8j9oahdt@geday>
References: <20260603210118.4240-1-andrei.faleichyk@noogadev.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260603210118.4240-1-andrei.faleichyk@noogadev.com>

Hi Andrei,

On Thu, Jun 04, 2026 at 01:01:18AM +0400, Andrei Faleichyk wrote:
> Signed-off-by: Andrei Faleichyk <andrei.faleichyk@noogadev.com>

Please provide an appropriate commit message.

Thanks,
Geraldo Nascimento

> ---
>  sound/hda/codecs/realtek/alc269.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/alc269.c
> index dcbc66984..18dec3427 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -7379,6 +7379,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x1043, 0x18f1, "Asus FX505DT", ALC256_FIXUP_ASUS_HEADSET_MIC),
>  	SND_PCI_QUIRK(0x1043, 0x194e, "ASUS UX563FD", ALC294_FIXUP_ASUS_HPE),
>  	SND_PCI_QUIRK(0x1043, 0x1970, "ASUS UX550VE", ALC289_FIXUP_ASUS_GA401),
> +	SND_PCI_QUIRK(0x1043, 0x197e, "ASUS VivoBook X509DAP", ALC256_FIXUP_ASUS_MIC_NO_PRESENCE),
>  	SND_PCI_QUIRK(0x1043, 0x1982, "ASUS B1400CEPE", ALC256_FIXUP_ASUS_HPE),
>  	SND_PCI_QUIRK(0x1043, 0x19ce, "ASUS B9450FA", ALC294_FIXUP_ASUS_HPE),
>  	SND_PCI_QUIRK(0x1043, 0x19e1, "ASUS UX581LV", ALC295_FIXUP_ASUS_MIC_NO_PRESENCE),
> -- 
> 2.54.0
> 
> 
