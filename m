Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADD33FCB3A
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 09:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800257; cv=pass; b=eO0nctqqEWFOEGBRGSENMPqhtLRMpkrP5jz8hF5U+YoIxx6iqR1kzyFcOs7wrI9DKtV1xwrbM8bnUY2VmrBpNjgPb2LpbsWHRuUnTLDsS0eMwS6yfMf/gD8DmZjEthGsB8pCCO+cNqCIW6fsYZTsRqrcM/FAZP2L3eUD1Xv903I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800257; c=relaxed/simple;
	bh=l0nK+u4xvd1US7TRZ1Ho7+ymO/AKnq9a8Ro6WLBZ8LY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XuMiK4Hf4s0twaxCyY4KAicZo4gkZwJqja1FtlMesIP/Fm+sTJ1RyYRZMBqmKBiYN2aVTuDwKh6Z/Urz0sUT5/Yb8ggoO/pI8cWBh4mXc4/AnaTAFeiYi9+K5UTiCm7hfjz1cHSFoRbtuKCSg6Pymy47UEB650p5TAqLmyTRLWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OMZ7G0nu; arc=pass smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMZ7G0nu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cacf197759so6842065ad.2
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 02:50:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784800255; cv=none;
        d=google.com; s=arc-20260327;
        b=OAHmRMrEvjwLnGrRE1TxokcQOggbJiUiEQvYVKSMjWJAEUC82KvL46OQu7L3Ncfp5B
         C8fTzrz0UbLykbpGSALxMIWCwGlctolP8SQPcZyxOG/jGECY6RutJZ17Ihy5pQAa+9hm
         AyUlWsqpDuXsIvPK/dxhXm/kO2oFgdVi30yjIB36hAp7fYiprqBPUt1AzSMm0jiQETPO
         kvMxQw+dFu5jx0QkNhuN1S8HM8AcBbDL5WzxXQioca2MWCDLiFQ9zoZ8xoaa4F9k6q5/
         UbADgA16YnNrQSDLepv5Ki9DMx7uXtjbbjfh22GookJgQ2NI6WWb+BjUDxgs8CZBTobM
         l+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l0nK+u4xvd1US7TRZ1Ho7+ymO/AKnq9a8Ro6WLBZ8LY=;
        fh=T686mFavZof6mYxySw8HkIjraNw002ISWNQxWqaymCc=;
        b=EExgCQYdmnkuHQ+mY8RnfBwCOUIoC9zWUnJp0cEdZ3af11LmLYctPKgBYvzezG7brS
         7SOD4uQyVSBEItwvlrtZQg+4Pq1lRmdI6JO5YNtUXtIjgjyR7Wc0xC1+AWJ90C/KrHoF
         u/axflgEOyCei6xzpOGetZAcxF9xNYKUn3QDo+NJ1JuAtPdsI4reC3EZSCy7KnP8tbfs
         3SbMmeS8pgk7ObIno8YEriPTKBrfAYfhPY8qxp6om3LkrPW9T0ZCX6kKzOxDlVZgH5d0
         bGIQn2HgyXS2sAW8aqVnX9ZyhGrzR7NZns5Bv9tWvQiWN6jOjLiFNY3WozgcRNjF0Ves
         RvQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784800255; x=1785405055; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l0nK+u4xvd1US7TRZ1Ho7+ymO/AKnq9a8Ro6WLBZ8LY=;
        b=OMZ7G0nuen6zyzcpE/ErJHtzEcyekpyDI8qsaW+nB2u0WLGn+ty6uMVOMR9MI3HCoM
         iu01bT0XHWsqOM/f4vyMKMPylCLfvXqhXKET6wfixVOa8oHprwQ/J2AhZmdo4+UiYCol
         lXSRNWQWAitA3hK6xypTfA7dMe81oIeV4n9N07kNfisWGPzjUILId8aismutcOcParfF
         EgbHQIxNZMqrEaY2QvbR193LIqHfr014PFCYQNiqSyLEtk9V5kb0OAfSxK68g6XQWv0x
         /nx43+KSD9ySe3mU1RmEGk03dZCG3c8AJG0j4TxpLRriFnoRWXzw1m25AHJwf56Ehl4w
         p4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784800255; x=1785405055;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l0nK+u4xvd1US7TRZ1Ho7+ymO/AKnq9a8Ro6WLBZ8LY=;
        b=RCBoq80Qa+MgekVSmFq4ipZHqdm8TUkbOB2FwM/FKf5zGVKytEIS3OhmvB4iZpCO3b
         xxolUPM6huzIalNoXoTzBUnYz8iwouteL3VfGqXf0Z59Bh2MJKPbCtvWjBc09QmI3W+c
         vHtdsNpIAvex/CwOTFTFBv57yaW3P8U7yCeIXA2ZERYBtA49kJ+tDOaHbTfmJEU4CeKW
         0pOZypuF95mHRdlJ+dhVTmfXhDCCJ6a/woO7NbC7E/bgzXFQRMc9WHEGXEX0PyqbRPoS
         8vY4Qbj+QCJDHoFtTPoW/ELDMO02w7jQetiZMPtm+xMXP7+8L1FVkPFiPvo+IcBmAAQf
         4o0A==
X-Forwarded-Encrypted: i=1; AHgh+RphjC0L24wefVKn9LrUk1OZWvew6ATDhxA3VaWc6tlpiRI5VcXUBhUTmSZGLEzQDIzhR8KWuu+ofWgAXg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ6X7CASR/s+rALLjkHBaFLk3Y+WQjAey6uyeWcBx6+FA5/u03
	M3lPVApnVC/EcXuoCNVVi89HkGeCGQCJT5iaaaMFKfHI57gLJIP8B3JBUZUz9RXXyn7u23PZoUW
	RaWuQpxiSdSorGDYBdmVPahi6NtRQUZw=
X-Gm-Gg: AR+sD13da8tmijSHBOoh3ZUxQvERo6/zii1LzU0ktUevqpm/EnpNjbMOzGLgENblifk
	C03V1+8xWGrtYq9XRV9AYd2XjoBlbeM8yE/6m6iH/74IYDURKoh/wDprQRtTdMYVqLZL9kSsglQ
	WS0v9h1wdE5s8LPLaz1TlpVAVuc88h5sWJOvF+4b5GwMI17UbBjQxazbcGyfqX6tAepP1cklLIk
	L+7daFt/mARRUb1oVS7pRcwwb0WQBzqGXjwEyy1sqlRjrCQUlxCxr2FPus0bFcMFNKhzRDvFj9a
	862TTN1VKPLoAGpq
X-Received: by 2002:a17:902:f68b:b0:2c9:e9c4:82c1 with SMTP id
 d9443c01a7336-2cfa7488680mr27492565ad.26.1784800255414; Thu, 23 Jul 2026
 02:50:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723045327.28260-1-phucduc.bui@gmail.com> <20260723045327.28260-26-phucduc.bui@gmail.com>
 <3eb2eaee-85dd-4dc2-8c6f-397cfedd6946@opensource.cirrus.com>
In-Reply-To: <3eb2eaee-85dd-4dc2-8c6f-397cfedd6946@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 23 Jul 2026 16:50:43 +0700
X-Gm-Features: AUfX_mxM44ZVP9jV6XaieOqLwYCtTn-0wrj5JJ4vYZFP9uceKJcb-13MlSsTyFk
Message-ID: <CAABR9nG_vhiRjYHtHRL0Ltk79RXg3OKa-FBw9iGAyD8LG6TChw@mail.gmail.com>
Subject: Re: [PATCH 25/26] ASoC: codecs: wm_adsp: Use guard() for mutex locks
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	u.kleine-koenig@baylibre.com, Thorsten Blum <thorsten.blum@linux.dev>, 
	Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thank you for your review.

>
> This has removed the mutex lock but hasn't replaced it with a
> guard(mutex).
>

That was my oversight. I'll fix it in the next version.

Best regards,
Phuc
