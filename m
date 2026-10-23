Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792780862;
	b=uNHyD7upQvH02q6/+ooPVi4r1wtCaPBZSX4XfsmwCGPUFDrvfWNUtBi5i7a1GQBdh3Dq
	 P0puNQohyvmLRwLbh+c1U65bSwSt7F+uwe8MXzvFyn+GIwyLqSNqKTHgiIjtEXOhLEHG9
	 /82TpJBqDuYn/YSKJ8DG1AKo2Rii7z+vmyPGZo5R3zny2uPDFV7EI4aqe32ZwDglJkTZb
	 ugtNKxquA2fsyKiev5juYBq6lOOpvTQ1wMCufmLlc4A2tbl+tvd9qCtilnhm/8VNO7cNo
	 OjMxnEelTDEXCwuBik6FtddYwCvGyk8ScrY71NxYULea/N57HojKedqGY0/OAxrJMOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792780862;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=hvRwUyJ5wl+Vys6kUOnT5y3rEbSPcjUNYAl4hML2kDk=;
	b=XbZsJxPB5kpq76QgL7A0NpQYZAoDP1Na/oPeSne95WnzXf7cz2nUbPM81KKgYr3xU9BK
	 Nuey8KKSOgln0jJCpXq7iD8xZfHhMn/VPlOgV5xi/MNGdvZI23YR70LCVUl8/zP24GJb2
	 78duzSm/9aGuqcknBPiHfZZvpkKGLRpxAGGki7qCGFsYpopSh+bSCAn4WBPveW4AEPqQb
	 fihpA5TU/veBReri24kQHk5Nrpixn6C1d+Dn5shqxRpGbd3ZS6r7T70rZ0RUKdWrAzY63
	 OS7boHRb+KYmetRO8SbxgPIP5J5ZZAao9+HHI8vC64L7qJlTw25yVNc+8/LpPe7qKuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I0Wjdbhg;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DA3606A31F
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 18:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98DA3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I0Wjdbhg
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so754462f8f.0
        for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 11:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792780861; x=1793385661; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hvRwUyJ5wl+Vys6kUOnT5y3rEbSPcjUNYAl4hML2kDk=;
        b=I0Wjdbhg7XVwj5t+d5yzbO5GWQLgCXYLZdjy10Ji8rNNW3VLtWfGFD8LqqUx1iXKOD
         DiJa4qGY3Xbijfmlub7iZSeDROTwHD/a/wvgmsC4ZUeGTyx2wtFly5cOocBHPYk3aD7N
         4SjTQyuyuY9RG2orwm4FWpxrwVel3MBF5lyY1AzS/r5i2tz1ThsoZ3lhUmrhOi8k4eVK
         0bKfj20ZoClJs19w6P9K2W+yxs13xVXy77mZ98+p6Q1KpVphGuIW3bWBoF/lhpmYCgPX
         5c2fzomJUck2SNNbeXj1bOBExLN0nYG3rKltVtx4hl8dgPvh49oHs73ualcLk3gHT9k3
         4T/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792780861; x=1793385661;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvRwUyJ5wl+Vys6kUOnT5y3rEbSPcjUNYAl4hML2kDk=;
        b=woKl2YNtHMaw+XctT7lD5LzPaDUXVnW3/yuzK3D5FZha86Lb3DUkgmS56gtNajlUZh
         tN3mXfigY22au84TwvBVpLWXXvWufVJnXPMLxpRTjhffsNmUtS7n1kpfHrm1CNSK04JD
         hbTceF5WuzsFxFuPEWPXF9WICtMzEJyzH46/GFSy/F3nPf+oAIUmplP8kxtkGSV+7J9d
         JGmeUPWRnJbrI/BB1JU4RVoEyKLYDvycVnwYKP+n/uMdlVyEICdk+G54B29N8U4ZLwFd
         CFWZkFRxSLlBobPY/BPYNZYymeATBEh8H2U61fTE0eLtEODHfS+K125c7zTLi6jgCmRU
         sj0Q==
X-Forwarded-Encrypted: i=1; AKwUvBzK7ebDZZpoSJvw7btMmVMHRMBlqY1PaJW6VWNOpA2gKhxkeLeXYPbXRNLWnxWDM7hNrl7SrPKMXWSgiw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJwt8/5fZwfSPTIEjBe/LiUVC2NBunMBiBDhMJBUKl9i4bKJVTG
	eF3Wu9Mhen26/mBqcCji7a0nrQ81/0GAwBHfq1i73JbGBv508gWueu7C
X-Gm-Gg: AYBFou1DHW4uS80SpybkJJlHkcmZwLDrDOnFcpMeog+9xsvwBRXw/CiiU5Az4LFuIo8
	5Shvv9Kaeb4bPn7kQ0UStaB8r0Mu005cwqCo7wO4rc4IWMXwXW6pIDxBtXJL+vFxcvysnEzt4C5
	xptADKJEdWTpSDshmplGT08fRgYpnVLsnCP5UyA6BAyH0y187mneuamGGiwOARA/9m8R8Dzm32y
	TqtOSTKQ6BI4Lh5iWog/CRtqIpExVyD0hgAnL3z23fq2CCj6aR1LvvN8PzFOP/K6RGf9/+JuYEJ
	U/boWZ9YXMFtPUmmwpJpEMPZEaXz1jVui+WzqsXjPYVmCnbDnYFuQDO9OriXsnRaEwkk8tyBxld
	5lI9c/dEZESEtMPd85FlHp/zF43Bt5rP+Tde/q447Q5I/Y4mAOSQzBb6D+6bmZmfMEnhlUy6LCi
	2V5DE5LkRnHL8AhrhdguFjNZLd2GjEXiPmI5bnw/J9fqsg/opbeCb4GwzWq/9BVD3ZzoTMzG+iK
	K9b0jr3b0htQFODzM8bwMAa00uFCcWYUzI/m+z4Lv/GA11PjlYN6kJAXsIT3O5OVafA4HHXLfc8
	ZtbdtCtTKDcHU9Tq
X-Received: by 2002:a5d:5f0a:0:b0:48d:ed0e:6bb4 with SMTP id ffacd0b85a97d-48e2d0ff5e8mr12701841f8f.4.1792780860722;
        Fri, 23 Oct 2026 11:41:00 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d3ee6d8sm1432381f8f.14.2026.10.23.11.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 11:41:00 -0700 (PDT)
Date: Fri, 23 Oct 2026 19:40:59 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Thorsten Blum <blum@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= (The Capable Hub)"
 <u.kleine-koenig@baylibre.com>, Zhao Dongdong <zhaodongdong@kylinos.cn>,
 Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: cmipci: Use strscpy() in snd_cmipci_create()
Message-ID: <20261023194059.4e307a32@pumpkin>
In-Reply-To: <20261022164013.95811-2-blum@kernel.org>
References: <20261022164013.95811-2-blum@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 22 Oct 2026 18:40:11 +0200
Thorsten Blum <blum@kernel.org> wrote:

> To prepare for removing strlcat() from the kernel [1], use strscpy()
> instead with the current driver name length as the append offset. Also
> use size_t in the multi-channel branch to match strlen()'s return type.
> 
> No functional change.
> 
> Link: https://github.com/KSPP/linux/issues/370 [1]
> Signed-off-by: Thorsten Blum <blum@kernel.org>
> ---
>  sound/pci/cmipci.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/pci/cmipci.c b/sound/pci/cmipci.c
> index 9d9f784e3a8c..5722b722da95 100644
> --- a/sound/pci/cmipci.c
> +++ b/sound/pci/cmipci.c
> @@ -2980,11 +2980,15 @@ static int snd_cmipci_create(struct snd_card *card, struct pci_dev *pci,
>  		query_chip(cm);
>  	/* added -MCx suffix for chip supporting multi-channels */
>  	if (cm->can_multi_ch) {
> -		int l = strlen(cm->card->driver);
> +		size_t l = strlen(cm->card->driver);
> +
>  		scnprintf(cm->card->driver + l, sizeof(cm->card->driver) - l,
>  			  "-MC%d", cm->max_channels);
> -	} else if (cm->can_ac3_sw)
> -		strlcat(cm->card->driver, "-SWIEC", sizeof(cm->card->driver));
> +	} else if (cm->can_ac3_sw) {
> +		size_t l = strlen(cm->card->driver);
> +
> +		strscpy(cm->card->driver + l, "-SWIEC", sizeof(cm->card->driver) - l);
> +	}

There are all sorts of reasons for not using strlcat() and various ways
of changing code so that it doesn't need to do the string concatenation.
But replacing calls with strlen() and strscpy() is just plain stupid.

It has no benefits and lots of downsides.

David

>  
>  	cm->dig_status = SNDRV_PCM_DEFAULT_CON_SPDIF;
>  	cm->dig_pcm_status = SNDRV_PCM_DEFAULT_CON_SPDIF;
> 

