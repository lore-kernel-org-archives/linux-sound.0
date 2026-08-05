Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67E8351C0C
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 14:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785938947; cv=pass; b=f+RpbYQMMtSucVh6CenyTXANDGOKHiPUgtjlNdEWM0aez4RhvMD6pRTZJBu+sPsKE/lZ0QUxUJY39uFzgCBwqAqx/GMgTUl/qrMPKaD5rQjy82n8YGLI/zDwrWZPrYDWrTAba3WPibq+9lx5554hGVQJJPrGuhWwSZcPxn0XQ8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785938947; c=relaxed/simple;
	bh=xemyfSPp9pwMFX19YwknZw26xsatniLD0Lp8dnh1cZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XFn6WeznxeLh1yTImzkppwCZjnyY5MtFuGK6KPuOwnEn1gIA5xsQiKjfgvt44LQIQTI/Y5qt1e6K9E6hwCoRabWEtcvT5Q8A+ba/3TsAi1x+AxGRMOr06XqIyIBKNAtrZ0+aeeTk7hdMHw8eJHuwrkAxxR9YSKTLwEeH1M/YfBw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZUOfbXw; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZUOfbXw"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceaf8a1265so16330255ad.2
        for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 07:09:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785938943; cv=none;
        d=google.com; s=arc-20260327;
        b=VnfZKsAlPHJ9EHCCZfPJVa6V7qkU/jjwiDnFRRKX4p8AXdwaX+/zkN25RgC3wVmpNt
         YU8Z0SvJlH+l2L3eJAZ9QI7EuxFip3uj/p9DH4PaworeB1h3m7YeDUEXkB79bVAXdYSZ
         sgr4c2KjsPu6ZrgbKIdCcifsz+e8qRFdxrdePxK77K8Zqkzl0IGN/ig+dAh2TQfyRxg0
         bsx0GxfnkZ935rXZB1mE9Lx6TtJvN8OEcBo3wtrzIzYPG8hVyqNPHCKkdCBQTsSCBV5B
         Vk/S9aSw5ggW+2gEWUyR2FpFqWCCHlIQkIknomGn4NxCc6I5hmhEr1VaB3kLjpU7v2Zm
         GZtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xemyfSPp9pwMFX19YwknZw26xsatniLD0Lp8dnh1cZQ=;
        fh=WlHEFU5FfxDUFGDNS0r9117D7P5XkXjSpMR+aYhAa/Y=;
        b=LTPXUeNL2cJryTblcvoYVlXZH/COXUvncUQT4iZ1pXN7KTtBmaZwVtn//rWGl4DlrC
         +pxfW5psKGc4p6MeDDGYwHaEiG4tLGyX2zdj906Dp4CIyMBoaUim12ZIiRqgTmtgH2v5
         BF7a1cjuhvXkqaSpIbN7efUogyGe7WgUHcIDHbf1P+TWcVfIXYqpISFdhQ5aHN2DDsmg
         Ksw9QSGsCCx1KJIeoKRI2KiVCmJgJMa5rSHO78wkUoR4mEwVwW58EGvpMOxrvZ6SrM10
         CZ7D2YV+Pyxtj55cJmTBxtcyJ4ZNj7UjJcN3XZEGbIAP0kd71pgnNFisNh0FNmXzKlRz
         7hBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785938943; x=1786543743; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xemyfSPp9pwMFX19YwknZw26xsatniLD0Lp8dnh1cZQ=;
        b=EZUOfbXwkyHaFXGNu2LftpHR/B0Vh/IiCqnOAymgXdrPaQ5mp4n2TNm7nhKnX/UtGK
         P5aBV+y2ZFFeTdKtdF5XDYveKHLFbgySk1hsaY6kByxgz4mTOSqp49SkwHd2DA8rmZ+d
         y779n94u5+K3YvJg2oIRSaQyd2kk07gMy33t4KmSuz/eWn8fXbUfSPpIVqo0aC49fVOH
         Rl0bi8K3/hvj/bS2rq13UWQBdoAuKmx3XohB1dlC59HVDHLWVyHEqwlBxC7ZICyYdTaG
         n80aeIANYjX24OepiMV8QuprYoa/2MGYS7UUb504mjq5N562krRQKQ0IlNcSKJ0UAMC8
         A54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938943; x=1786543743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xemyfSPp9pwMFX19YwknZw26xsatniLD0Lp8dnh1cZQ=;
        b=fwYvmlOiT/lC91kIo1Z5rBPeeJv3qqVPk1hgOdOEChtnNueMxk0PVzoqHpXsTyRsC8
         TZifaPJGnkFQrFb64MQodssAzpY1dZSvz+I4NJ8x5BciDYK02pL+ix5rLufQqeXCxw2S
         d/oziKtNJpELyRAPJFJ5IgKvOIpoL9jZrSsuZ0QKyugB1ckAZ5ocoQ3iT4rbrGQeXL9y
         uRcQLvXCSg/h4NHZOQwJzCvoPwZElmce6093XdfJA2PdQRaQ3N+t0PP2X2Vpt131Utez
         DsbaNtiKqrafDMOJExJQhrnik2dFkmkNp9qGNkHf+1BZxRovyZkuLRsD78rnZF9WI1yF
         /UYA==
X-Forwarded-Encrypted: i=1; AHgh+RpowJbOxjbiNUXU3ooAtj1KZQoz+cV6qgMz4xow3PLd6jPq/zowRI0i+jtAd1aBL56My+6h2gjr5gyhug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqD01nuh8k2egGslSD9S/QPd66FlTKxkIgMfE8nVYLXYQrrfn5
	YiCsstR+qpgzNBiyJPL0iR7d+mWVVU0SV83N+j9qPTSQe5YOb5y4AZNacBiH9tkNEc20K97a3k1
	Fm96dsH1dKV7Jfettc+aLu+NlFEBhBUA=
X-Gm-Gg: AR+sD10YTQpZzN8YYLMFds6SSrv9LpcXkQrQy5TsTCWHxOjjj6+LDUrGjtPGRZOzuAc
	y8fSR46XG+8eUzlUkwumj3fNIZ0Qr9W90kXFaHBMvKSZ1OuVzq3G4j2tOirBa/YB2C9ATn8khMv
	JdMGFaLzClgEG/sVjyKiscV9q5Bfw/pRzWyzA88tjkiJC2y+TzPjyXBIM6av+kkNlJAGAV5tK/1
	kAHnWV5xSGXoDCriHw9IezgbVkTvSFkPfbquZ8osQpkiD+ubRLYg2XAMjDn3epdV4ZI0Rx0Fvfp
	0aUcuWEhBAofL3IkVh9HZBm/JTUipOsPAR13EFdYVBJXAXk5WP9onqWGv2FoyG2wTRtOU1ePJ4/
	Cv3PtijjQ5NaLW2CMGE73n8/N37VNV9Ncqx4fgTMiZQ8j2EOAR7PmcFyTqFB2tgUDBIBjS8WE2H
	lF7qflxrayU5Yh1+0=
X-Received: by 2002:a17:903:1a10:b0:2cc:f5b8:4c2e with SMTP id
 d9443c01a7336-2d0ca767b88mr93568555ad.9.1785938943593; Wed, 05 Aug 2026
 07:09:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714120042.491712-1-phucduc.bui@gmail.com> <99bc4c85-5f5e-42bc-8799-eaa7ef5d1257@intel.com>
In-Reply-To: <99bc4c85-5f5e-42bc-8799-eaa7ef5d1257@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 5 Aug 2026 21:08:52 +0700
X-Gm-Features: AUfX_mzOqWTlDFK-96ZrRtf69s7sJAXD3xbqxGluQl2H8caDAyUMbDoCuVVOjKc
Message-ID: <CAABR9nE2-BTBNDrkAxd0Jg9RYwe48wfFynRQMwK55D7J1WeZSQ@mail.gmail.com>
Subject: Re: [PATCH 00/10] ASoC: ti: Improve probe error handling
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Jarkko Nikula <jarkko.nikula@bitmer.com>, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thanks for the feedback.

>
> Which obviously you do not but the impression is there nonetheless.
>

There's no way I could hide anything from the reviewers anyway. :)


> If there are no dependencies between the 1) and 2), have all patches
> belonging to 1) lead the series before any 2)s pop up.
>
> Right now you have three outstanding patches in the middle of the set
> that clearly differentiate from "Use dev_err_probe() for error handling"
> pattern like if you are about to hide something.

From the earlier guard/scoped_guard series for Intel, I learned that you
prefer grouping patches by topic rather than mixing different kinds of
changes together.
I'm not sure whether other maintainers feel the same way, or would
rather prioritize what's more convenient for the developer preparing
the series.

Thanks again for the suggestion. I'll keep it in mind for future patch series.

Best regards,
Phuc
