Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF50212B17
	for <linux-sound@vger.kernel.org>; Fri, 28 Mar 2025 07:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743147949; cv=none; b=IMEmvmaE51hIg2mxdK53xig6t/KH3cC17IXA2OKmwEWNeL1tvVZHCQmaF/SGqKV13hBYV0zwA6BqQXOr7uP4sbak22nt57neFOsDjomDm1ttAlV0k8d4wGgbG4vSaVKWOPNCIwdW7e6Jr6heOB+53BKrRK8pMhWZ/vQMgze9wvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743147949; c=relaxed/simple;
	bh=jhd8eqeLqKtgOMegJHXn9/RBH+p95nA916u23Bs1/xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g5T2aZGBroF/RpHU+yiKAQ35TPf+f1+J0bU/VmoGACJWQviNygG8bEpNpBQ4ZFfpr04U8nuWobELgZ5m5BvJmJjteK9H+w2sNsffz6tNBCkqoU/hr3VCTj8VFd75siQtjWDM38fxwNfc7pD85/B3sGP+pGhu1lcQi1IUaxG53LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yoQpUS5G; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yoQpUS5G"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-224171d6826so47857535ad.3
        for <linux-sound@vger.kernel.org>; Fri, 28 Mar 2025 00:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743147946; x=1743752746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cju4PP3BDwNUuGXUxlhnczSfO2O+sRFjPqYxZUsY/Fs=;
        b=yoQpUS5G1WczIvAr6LZUddcvjI2Ojd88Y/vPHrUHg4KODVEnxp4CDjPh5nN/C5lkl6
         4KHSVb6atT653sH9Vet0J5t6AW/HzeLjLJdE+EBhMzxU/DdQ2q9B72iULBdgU51ZTzjF
         MjnZu25rtaYV6ksKxvNcHC4jtyHZ09IJjwk+gEnK60g7mTOvzYvw+DoJV9Mo7RwQQFnM
         GqjPR78lvbPD3S3bAMjUM2cfq4Ibap6ZQMqXPLc1V9swCmoZHXprFEhUKL94KXY/7Qgm
         EKQL6G4LXXkl5lbhnEJGzxH6eRGeFTlWNUiBp+4yHOTz9ZsS05wU4lN7dzTbXJ1M40+3
         RUUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743147946; x=1743752746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cju4PP3BDwNUuGXUxlhnczSfO2O+sRFjPqYxZUsY/Fs=;
        b=tYudXmku/HKq6uuwGLYTrkjklLN55EYGW6kG8xZ2793l762mU8E6hF/xlT5JWbL8sT
         Sfb4txhhQwn+9Mg4XiokGydkcjEkxBzS91qjNaob0q+STeOt3pF90lp6hSFiN1FWTtFA
         np4k1/qOo/YUlpXwD45VAAVecMTCGTZ20WefnEnSfEUIcuOT4pbJb6aRY3y7Gi9H/elX
         2FElvO89o7hJdzTnCGIdUxAz05o9ajdISvqNWGoC74Lb06S3z0VBtL4afqXOHiBRlV4T
         qL4rLO/BRl353Gj3fuYCtnKEM5W+YT9wIfFq5f14bIsySsDRtsSyOOCj5bDHh5OOFq46
         DAXg==
X-Forwarded-Encrypted: i=1; AJvYcCUSZD560N2LK2YoVhbtVjlwKGcsM6JLTTYTa5DYWFU2gic8Z6IuRqH4o1sW4sNeu4aZUrGCHf6Ugr2voQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBbXrUfpkKRDpam8VdoV7O9iL4PDK9YYsDUac2GSGwmIZwGFin
	CCQdxQETXWPmVfm8cuSX6o2ZfDw9fRk6kUZ7rzLG7XxRwVVx1oAkJZZfO90oBUi0PAd8pntyHFw
	kbGgI+PESBVgKRZThKye8Ec3wnB37vAdbnmr+
X-Gm-Gg: ASbGncspNbhjQheh3x9lNTl9BJeaEhcuVbC+KpNWKiyNaKLkBBVbJzuvrXexQwreCM7
	4hWK9C9CfM4c0xnw6PphWIVhriOn3PouAdDojMn8IVPrr+U8KchFPrnQVBA2F3Kw3RfrP6uefhn
	SuI1T4GoNKysU0iEXQNeU+bR1sn77okwiRmb3sZg7AH+5oAHkLwf1AHLFV
X-Google-Smtp-Source: AGHT+IHOrcw9DisHzvvGCzWpEdMq/2DuAlul4EC/64JuosmYAwms2YN5mduIbPIPWnfzDcFKN8g6PnqvAgOWYqzB4tA=
X-Received: by 2002:a17:903:41d2:b0:21f:7e12:5642 with SMTP id
 d9443c01a7336-22804855243mr78114555ad.18.1743147945996; Fri, 28 Mar 2025
 00:45:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250319005141.312805-1-quic_wcheng@quicinc.com> <20250319005141.312805-5-quic_wcheng@quicinc.com>
In-Reply-To: <20250319005141.312805-5-quic_wcheng@quicinc.com>
From: Puma Hsu <pumahsu@google.com>
Date: Fri, 28 Mar 2025 15:44:00 +0800
X-Gm-Features: AQ5f1JrxKR_5At3wbtVqdesBrs5EjD2B83PPzVhOxlnkDOQEImF4VUCzY3fgoP4
Message-ID: <CAGCq0LYNn6VZwKpvvf=N2ra8ZJcSso80ZDpirByHO9ChBZv3eg@mail.gmail.com>
Subject: Re: [PATCH v36 04/31] usb: host: xhci-plat: Set XHCI max interrupters
 if property is present
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, mathias.nyman@intel.com, perex@perex.cz, 
	conor+dt@kernel.org, dmitry.torokhov@gmail.com, corbet@lwn.net, 
	broonie@kernel.org, lgirdwood@gmail.com, krzk+dt@kernel.org, 
	pierre-louis.bossart@linux.intel.com, Thinh.Nguyen@synopsys.com, 
	tiwai@suse.com, robh@kernel.org, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 19, 2025 at 8:54=E2=80=AFAM Wesley Cheng <quic_wcheng@quicinc.c=
om> wrote:
>
> Some platforms may want to limit the number of XHCI interrupters allocate=
d.
> This is passed to xhci-plat as a device property.  Ensure that this is re=
ad
> and the max_interrupters field is set.
>
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>

Tested-by: Puma Hsu <pumahsu@google.com>

> ---
>  drivers/usb/host/xhci-plat.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 3155e3a842da..6dab142e7278 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -267,6 +267,8 @@ int xhci_plat_probe(struct platform_device *pdev, str=
uct device *sysdev, const s
>
>                 device_property_read_u32(tmpdev, "imod-interval-ns",
>                                          &xhci->imod_interval);
> +               device_property_read_u16(tmpdev, "num-hc-interrupters",
> +                                        &xhci->max_interrupters);
>         }
>
>         /*
>
