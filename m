Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B908326AC3
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 23:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774653048; cv=none; b=J25D7xdsNQZAu5MZ/CpDLgP69tWLKEMjkKCnBC6CZ2TXHtlY0xJtyxgNMb+cOsGPq2nz0oZueYzODtiqPExELLa/T4uslS5ZN9mRGxuiN2tar9BMj5DWhX63dMySgJsi7lZoT3ENvIS8vHDDOJAV7ktZOphQ5XBEmW7G2Tkayu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774653048; c=relaxed/simple;
	bh=IV2breW7HXa75UZ3WNuTkArQvzuvOeqoV9aEZYO/h4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rv9cUntXURAq9AJcD1lI59vP1+1T2Cma+iQWCgBZd1a/h+2DdHRzuesRzn4aqTLLxa3nigExs+ebfotORgDlvK1KfcyNteEUlff2mB59VWQwSP8b53BrRoLJJlrMyLDIfo2m5DayR0ZKBG/xCMOnYPBvTwRXj+G48NThBA31xJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SLwd7zGG; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SLwd7zGG"
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-60328aa10efso788012137.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 16:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774653046; x=1775257846; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ohBYqVfLJAgKr1QiTzTqzvksNDvmVbO3G8pLKB6WFqk=;
        b=SLwd7zGGn9ziY2z57mcv+mywklHr9xP2bdXh3d/3JdNPWNFtx5dSmiUI5i5jS1PjMY
         J41Z8Fwqc5yKknqe0EtcctrL0wDlqyZRuStNJ9AX/Z2ZRqUvJ3g2obKI4kakzEjyayUe
         hTcqvpAGu1KsSe3V5a2bHdrk4mONrgSpceeCDgG6Hd7VPMn9U9l6ynDar7iJkf/29Vr2
         dyZ2rvSTm0E/vy0YsP6zupkouSzF7BwjGcdfHFnU3iuYoYzBpO1NCsUMgmR5RxkC7+VX
         NuIRiQqBRbuQ/AD+RhIwaV1eoytDSxlZeVQUt8xZmOkdeyzu/1Dd1G46c+3P+i+wtL/k
         ZXEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774653046; x=1775257846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ohBYqVfLJAgKr1QiTzTqzvksNDvmVbO3G8pLKB6WFqk=;
        b=PnFQTStETIhWLZankh9Tq4DibFZ2DL/QiIlGQGo8JCbI3bNImKVHlPE4l7Q5DL+Jce
         DmGzuqiI8CV9r7AOdhT7H97/CH8n3hmjHEQTPyklWF1kxXep41wBQXxHLQqxD57bDQUc
         zPaHxSWl0FijWQbx3Kk/iPTrqzLohcCxtWY7RX5D8MPFLpoghWAzziSdVMF7mj3N75CF
         hixp7B6fRNrlD8sTZkknD0ZcBbj83Sl5Gs5cM38UGxLIzZCBt8OEU3o9O55jUNjYDRxR
         73j0abAKFk7VnOeYF8d2aCRieZgkQgoa+A2ad5xc7sekJlAFrBeFsiele7h4A0JTe4H0
         mAmQ==
X-Gm-Message-State: AOJu0YzkRKdnXlejn7qTKvcjw00lmx7i2DO67eHtAxHCebpmARYv7fXY
	KocyY985xaPWAj4eyBwSphtq7XGpjUHh3dKi/5J2Jq1H11sgv8H06jRx
X-Gm-Gg: ATEYQzzxv4ocr+78/1IYSd3GnuSB/Tb8iInftz0Y1Oe+0HcllwqUD1P2tcmnKzKpYX+
	G6gA/+lD1eBZmRQklZHSkAW7mF66H4RGAAaAMnWJpvtdBlzDQhrwv3Sup7I2OjUwMzCeBJ6P20q
	aV+uOFx1VWADtPy5ZuniS7DCOqoVWhAo7bF+if4swXPEAUD0688s8fcWY5yVb2pAb+LOAtNb53m
	x2PaYvONLXxQsVriN+LMvVYBc+ceNDup8X1UNaR+FgT5Kc4zBcbR/MskNQz+h2G6XvfJlJ5e/Hz
	5euVdfKQmNty7EStimcqo6RdQunclkX2vMAP55qMKSV2qU70+6UjDPWEdWdxL203hQ9qM6rjjmy
	VElmXodmiS7O8BISgZFm9eCNOUizFPckVB1z8qHOwxQSSAxPFSUBj+XxRE7R6jVKXcry1Bk9ZX+
	xu0F99Kl503Q==
X-Received: by 2002:a05:6102:50a1:b0:5ff:c831:b986 with SMTP id ada2fe7eead31-604f8ffcef0mr1872009137.8.1774653045599;
        Fri, 27 Mar 2026 16:10:45 -0700 (PDT)
Received: from geday ([2804:7f2:800b:eb1a::dead:c001])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9539e2e7926sm547978241.7.2026.03.27.16.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 16:10:44 -0700 (PDT)
Date: Fri, 27 Mar 2026 20:10:37 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Phil Willoughby <willerz@gmail.com>
Cc: linux-sound@vger.kernel.org, Yue Wang <yuleopen@gmail.com>
Subject: Re: [PATCH 1/1] NeuralDSP Quad Cortex isn't a DSD Device
Message-ID: <accObDQDuDTab7my@geday>
References: <20260327213318.5338-1-willerz@gmail.com>
 <20260327213318.5338-2-willerz@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327213318.5338-2-willerz@gmail.com>

Hi Phil,

On Fri, Mar 27, 2026 at 09:21:01PM +0000, Phil Willoughby wrote:
> Signed-off-by: Phil Willoughby <willerz@gmail.com>
> Cc: Yue Wang <yuleopen@gmail.com>
> ---
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
>

Please provide an appropriate commit message and remember to Cc: the
relevant maintainers.

Thanks,
Geraldo Nascimento

> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 4955cbe3b60a..67e812bd9113 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2361,6 +2361,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>  		   QUIRK_FLAG_PLAYBACK_FIRST | QUIRK_FLAG_GENERIC_IMPLICIT_FB),
>  	DEVICE_FLG(0x13e5, 0x0001, /* Serato Phono */
>  		   QUIRK_FLAG_IGNORE_CTL_ERROR),
> +	DEVICE_FLG(0x152a, 0x880a, /* NeuralDSP Quad Cortex */
> +		   0), /* Doesn't have the vendor quirk which would otherwise apply */
>  	DEVICE_FLG(0x154e, 0x1002, /* Denon DCD-1500RE */
>  		   QUIRK_FLAG_ITF_USB_DSD_DAC | QUIRK_FLAG_CTL_MSG_DELAY),
>  	DEVICE_FLG(0x154e, 0x1003, /* Denon DA-300USB */
> -- 
> 2.53.0
> 
> 
