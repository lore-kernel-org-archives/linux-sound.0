Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B231DE8B5
	for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 11:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752145384; cv=none; b=TDjnJ4BzTPGPasv0vR0U+KDO0m6InwnOLkTnqo8H1WR3M8k4NPCN8HIO4UeKMmTSUkMK1KlGdy5rYrJgaUtoD0Nb0CuOuAVBztp6oSpvOx+s2mPXcIpDV4Byndpqx5TICAbXkfnCpGt8NfGlBagM4COEgCm9b862U3qEyT308lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752145384; c=relaxed/simple;
	bh=8Ui3NFISKh41ifZ5NSsbM2TkRazd2B/pQ09PgNqnpRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=htRapExmflMpF2hoPBDF1CdQdP/qtwVKIuKvMbQ5qC9uqkpTmsgRLSVpL+YVF4xLq19UbPfMIcjU+sh56iGJFmktZkXcKPVbzwuucAsp+amcyv9rHScqrGsjlMcoUXM0ErOxfyQrywmtkcWC/KPQQKGq0DYny1uJz6+TC7jSvNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UG5CScbV; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UG5CScbV"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-237e6963f63so5000715ad.2
        for <linux-sound@vger.kernel.org>; Thu, 10 Jul 2025 04:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752145382; x=1752750182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sR6dfzdO+Sj8YIwogNSzYknRxjJlas0hZQUfhGRjCgY=;
        b=UG5CScbVu8RMqurYR1OME8R/lK8RwoEJyFWKKsIE3CcT8xQHG0GMJCJ7rw4MNy3krk
         7uc95l3DZdXwdUAHuaDtt1K+mE7iuLrq0fD/8xF/3nseBAMdreoBHQh8A8F8Zz1ByCKa
         GyWI5texd+6KAMPGn3l/7vI/GrKuCcSO3dMJ9X18L/ej7sq5VheenU1nQX0tdm7RLTOp
         F4oduYonyGajUj3sJVm+aP7MLdMCdK6G17T/tjwgLIf3/w1rB3VkQm8qWNutQS3zR10l
         1U0rR+g7mVdCzp8V5JTp8ovbOkb7TW9vJIEdWDQhkMTsB87/0ci6KceknWKIAEqvOj/J
         t3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752145382; x=1752750182;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sR6dfzdO+Sj8YIwogNSzYknRxjJlas0hZQUfhGRjCgY=;
        b=xLxmq8dXROMVcYxS15uC5fJ8j1Qh05aj1fRz20ZxCp6HUWpPe529TPIPyLu8xmOEHL
         gOLtXkT0d2vzaF+uJWUl5i/sjsonnGdkQIktKFhmOg4GCV1TN7OdjzMOfP5mwceY4ziM
         PQzdei6I/uhMzRFvkH6doGPXytJ1mB0tuvM1u4FvjeNI2u5XQHZ/Ydw5moU3AfqH/WFH
         GABuJXuX9mNEgkoj5xS7ExrDhAd//jIMzXlhFnopzIHs/hdjVYuMGf4Uzirvv9pctGk7
         IjN5sJ515cpfqLwEJFVBzqLfaLSW/jaqnj0P0W9Ra2wmlDee+t48hgwpzlkSPN47KXqz
         vfdA==
X-Gm-Message-State: AOJu0YyXAdwrq0A2IotbTsnnkCN8uyoKPA5+mD5jf3iHevgynYYijNii
	DXEG4Pwt0KWL2v8O5k2ZryO939q/lbjFzO5A7PZ8/YEJMmETPeddqoj+
X-Gm-Gg: ASbGncsjQcS+VsM2sn1gUnCU2CLJ28qOVIwRwewlicFjKDeqx/Ilsi8K2JZlXPlYn3D
	k+HUmNBoccgYul/lLKc4arqt5ZdEB5REpNMqUxEF2D+zHvqgkVcBc6fzNOulaJea/Ek8SRA4MDF
	kCrJBGARasjED0HMiB6H/zzsSjdqLFeI5D+5pfjFl/54BMSyE56aFWaHNV05vQtfqdAcw9aWBV3
	n6ThPKxEFpZAGZI5hi6L17sHuatbS4Mp43QnRjW3Iq20D40ToBagQqZ2Ii2ZCqaw85CbOsUBPBF
	3qm14dcQVmfKIvxElXHB91Rc1LEPovHxEctqS2ZFT1fjGRS5qg==
X-Google-Smtp-Source: AGHT+IGJC5fWy6eVka3K7AfLbKb32fsHnfuhAkH38jNYIMN0F+j8+6dNy9xSUr1hV88HRz4ih3SPnQ==
X-Received: by 2002:a17:903:3b85:b0:235:f70:fd44 with SMTP id d9443c01a7336-23de481bdefmr32881835ad.21.1752145381968;
        Thu, 10 Jul 2025 04:03:01 -0700 (PDT)
Received: from geday ([2804:7f2:800b:ccd4::dead:c001])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4359b6fsm16513215ad.212.2025.07.10.04.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 04:03:01 -0700 (PDT)
Date: Thu, 10 Jul 2025 08:02:57 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 083/103] ALSA: Use safer strscpy() instead of strcpy()
Message-ID: <aG-d4bys9tt1jfIl@geday>
References: <20250710100727.22653-1-tiwai@suse.de>
 <20250710100727.22653-84-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710100727.22653-84-tiwai@suse.de>

On Thu, Jul 10, 2025 at 12:07:05PM +0200, Takashi Iwai wrote:
> Use a safer function strscpy() instead of strcpy() for copying to
> arrays.
> 
> Only idiomatic code replacement, and no functional changes.
> 
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/pci/sis7019.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/pci/sis7019.c b/sound/pci/sis7019.c

Hi Takashi,

I think you've missed the "sis7019: " after "ALSA: " on the subject line
for this one.

Regards,
Geraldo Nascimento

> index 42b22f123fa7..3d7abcb31679 100644
> --- a/sound/pci/sis7019.c
> +++ b/sound/pci/sis7019.c
> @@ -868,7 +868,7 @@ static int sis_pcm_create(struct sis7019 *sis)
>  		return rc;
>  
>  	pcm->private_data = sis;
> -	strcpy(pcm->name, "SiS7019");
> +	strscpy(pcm->name, "SiS7019");
>  	sis->pcm = pcm;
>  
>  	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &sis_playback_ops);
> @@ -1348,8 +1348,8 @@ static int __snd_sis7019_probe(struct pci_dev *pci,
>  	if (rc < 0)
>  		return rc;
>  
> -	strcpy(card->driver, "SiS7019");
> -	strcpy(card->shortname, "SiS7019");
> +	strscpy(card->driver, "SiS7019");
> +	strscpy(card->shortname, "SiS7019");
>  	rc = sis_chip_create(card, pci);
>  	if (rc)
>  		return rc;
> -- 
> 2.50.0
> 
> 
