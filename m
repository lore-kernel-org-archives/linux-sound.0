Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F0583F44F3
	for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 12:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782822885; cv=pass; b=ZZUrft5bJ7/okwSmDNPSKqpzw9kmqOcdDDTf4xbT68W2m4zNKnvf39UZShvN1J2nJlaizIkoZ3iK37qbAUds5MbSs1rrcKeYFtqoFyq+De7u9vZq2L2+Xb7r8x6hwc6ZsQTWZYt6pOsriuklTAtJdN1CPFNg7lMc8u18O3WJ/Ms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782822885; c=relaxed/simple;
	bh=iTea2PODuwMhXHvxypo87T8mQ/sR20EabzzD7QApbII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=muZJmZb271fnpLym4jCnqbXGBHz02rjFc911L1egMTmeAi+K0VY3jI/O2KXwVA6kv+yxdsHdm4y5PWfnPYA7HEOL3+lfE7jqRtU3ch7KtxZOg8/Kr4B9/s/aX3og+Rs0dRXHBTM4Q9qvnBu4oAF/XYarcbCJ3b0kV2jp7/kcLPo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UA2nmGvw; arc=pass smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UA2nmGvw"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-37fa06b39b4so2439720a91.2
        for <linux-sound@vger.kernel.org>; Tue, 30 Jun 2026 05:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782822882; cv=none;
        d=google.com; s=arc-20260327;
        b=BaBusrD/yUDNFm0HtD+oqrvkrXSIh2j1v6h6pyWi7pdo3R4zpw+BonyBzknkGuTjoc
         xuvEhh/v8GKoSJtPRSa9/STJrB8U7blw9ErNctH9m5+nuBL4w+nhLYSMykvZNmNpn6Qu
         FIHvcWbdkiYV6BuBw6vF6KonYMC1afrsBCyte4K7pdfK/hMTojLgV9EJ3vmA6LcH74yF
         ulGK81ObjdwdI4z+1VHBDq869Soo2z+6SsA7UbuOCVvp9+WhCdChXDFHZlbA/SrnXaeO
         C1eOghDvUy87tj1sNLBn6MDFrTtyodlZEqFpDwJJOb7/WuO8giu8cPWDcJEOuhf3pqH7
         Blhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8cTZGQWdZGBUbtMIqk3jv7rpPUO86WUjTSNnrFYPk0E=;
        fh=0JH6+ts5j/PouUhCMb4iSYZsNk0QmUsk+FzbqaYCh8Q=;
        b=NdmRGFprMUG6D3L6lQcBa0byUPkg5LjE5wPl8lOCU9e6ReOMwVEoRSXFl1uSKqulRq
         n9rY8Xc1OWHxvw+uBRX33zydqsJWKnZ7iJIdxzsGFT7A9+Cezi1qfXHny3+01j2kAN3R
         ZplW1GBo1iC1sGFLMYLnZdvp6+ve1qYRAYC/x3+v7TQnwKQDsYTdviUdUyOuJWAwvJRq
         vO6svkVgQEPuJyJSX++8CkwRqqm/EZbPr75RFFdQzeABksJMmX+NTmDBcnz/pxpPf7+M
         UVj2Y1HjMDVhua0YIM1GsOk5ENvNrCG0sMVlWBeqxkWtuMsDV8FfSC653pQ+HirOis9C
         XO/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782822882; x=1783427682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cTZGQWdZGBUbtMIqk3jv7rpPUO86WUjTSNnrFYPk0E=;
        b=UA2nmGvwoGA+8HV1d+kM6+dPmbbAHtG+n//Th8G0my53/3GW0LzuUTsfMB8p4ddFwL
         136BlB5patsgkrn/1gIxqZjykkV51cNeeXI4usnijgM0Bb878z4v/PYVFcf2cp56nsxP
         ExVCEF+zvngfhY2Cz9vvNBPVgyZghfgop8KzmbL5o1vElCwfyRRUmkQE2k/BxvE13cup
         qAeEy1LqQh0/3ByHoMl7FylQnbqxbiDMU972Y5cFi9v2vItPJSu77/ZWlB7+fZru3CON
         eA3YqSFTuWqv5S/fz9PRrDTDPQu4bgcpbw1SNXA9lnAbQjEe3BYqAk830WbP6K9UMwnQ
         rmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782822882; x=1783427682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8cTZGQWdZGBUbtMIqk3jv7rpPUO86WUjTSNnrFYPk0E=;
        b=iIG+HE8NRKGEDbW6x5FJ6OP9l5GCOghgQuxEayEjt7ZkY2cJl72306NzAzFIGE4VZ3
         ohrXU0cS3xW/D/oq2wijdP7jmJN/8tnZdiM9HIwFkUc7S+0m0UQEcFPs7UOzPs6YmcSk
         qL7oNq3CWxjL+K/eBptyD4q11cr+WIF1N1OWu9VXQ3xzLqLgIZUvbLCyTwxFMZnrV8sd
         FGBIqL0dG+3SEXFfjN4+/QHy1K26L8q8/d7plOoxct8Sp2mFAFrd/kRcetbkpW6hHBbU
         fD7mEgoAHRLdnLVlv/iNmf1yIcg1A4yw9J8X8gzGg9IKKKotlzTX0q/3pGs/4b/Kfo0m
         xJ3Q==
X-Forwarded-Encrypted: i=1; AFNElJ/KCXto1wSuCaFQQQZqWJFWH/Gc45uAFFA30hmhT+UQngn/fwAQLmZz7TuD4indDxQoW8Yt+tXx3VahdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYOA1WGaAdB8m0yMA9lIC5dF+C5Wh+XeMSCs+GJEV2S5y+9YT
	KLzOyWg95CcSvJWlT3ZswQYxC+MzQkGEhYmObQlfB4qPQ0wufDR3GcxjyR8cIHHCZKRPd0diBNt
	QJCbMfoRLnmsX1Dyl2tvSjxUG2/GRa3OWZg==
X-Gm-Gg: AfdE7ckqNfvsyTCrZuLR37oxig9vF5VSN66wvtNSBQGPnCAMjXeJRStwWuDuJMGI2fW
	BvWBR1xau7NLMqz/YVh9JXpOf6hEhBcj3dl137OiVteDTApHtJUVrtaAty+ivGjbu0ggZhyx/AA
	RR2ht2PPFtbK6jQRWaNj7XPLHuJ+R6/hdVt+/HlrG4xxTznzNNeKNUCCLruIfVxw0r3ukWp+nWS
	rUdKAmleN1yl8HyLkWyO4UGpcwp+whwIN58wF1NFQRFdFBTiDr5ho/nq+yzvmwxPTEC9hpl1cKo
	u+Y/ew==
X-Received: by 2002:a05:6a21:730c:b0:3bf:8604:9a3c with SMTP id
 adf61e73a8af0-3bfdc6960a0mr159009637.28.1782822881873; Tue, 30 Jun 2026
 05:34:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260618023818.31618-1-shengjiu.wang@oss.nxp.com>
In-Reply-To: <20260618023818.31618-1-shengjiu.wang@oss.nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 30 Jun 2026 20:34:13 +0800
X-Gm-Features: AVVi8CfAJzmiJgX_RFr2-7EAvsuYt47fANCiqBHiroPWd01EydFM7sAOdVTrYjk
Message-ID: <CAA+D8AOqc_OBopHQBFDjvLiZLD0EnfpzFsgFcSnb1kdbZxhDew@mail.gmail.com>
Subject: Re: [PATCH V2] ASoC: fsl_audmix: rework runtime PM handling in probe
To: shengjiu.wang@oss.nxp.com
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2026 at 10:33=E2=80=AFAM <shengjiu.wang@oss.nxp.com> wrote:
>
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> After pm_runtime_enable() the AUDMIX block is powered off and stays
> suspended until the first runtime resume. Register writes issued between
> probe() and the first resume (e.g. from DAPM or ALSA control paths)
> target unpowered hardware and cause a system hang.
>
> Fix this by calling pm_runtime_resume_and_get() immediately after
> pm_runtime_enable() to power the hardware up and enable its clocks.
> Release the reference afterwards with pm_runtime_put() to allow the
> runtime PM framework to suspend the device and switch the regmap to
> cache-only mode when idle.
>
> When CONFIG_PM is disabled or runtime PM is not enabled, pm_runtime_*
> calls are stubs that do not power up the hardware. Handle this case
> explicitly by calling fsl_audmix_runtime_resume() directly so the
> hardware is always initialised and its clocks are enabled, ensuring
> register accesses succeed regardless of PM configuration.
>
> Fixes: be1df61cf06ef ("ASoC: fsl: Add Audio Mixer CPU DAI driver")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> Changes in v2:
> - remove the call of regcache_cache_only in probe, rework the runtime
>   handling in probe, call the pm_runtime_put() to enable the cache only.
> - refine the commit message
>
>  sound/soc/fsl/fsl_audmix.c | 24 ++++++++++++++++++++++--
>  1 file changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index f819f33ec46b..2885cc10b02d 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -457,6 +457,9 @@ static const struct of_device_id fsl_audmix_ids[] =3D=
 {
>  };
>  MODULE_DEVICE_TABLE(of, fsl_audmix_ids);
>
> +static int fsl_audmix_runtime_resume(struct device *dev);
> +static int fsl_audmix_runtime_suspend(struct device *dev);
> +
>  static int fsl_audmix_probe(struct platform_device *pdev)
>  {
>         struct device *dev =3D &pdev->dev;
> @@ -488,13 +491,25 @@ static int fsl_audmix_probe(struct platform_device =
*pdev)
>         spin_lock_init(&priv->lock);
>         platform_set_drvdata(pdev, priv);
>         pm_runtime_enable(dev);
> +       if (!pm_runtime_enabled(dev)) {
> +               ret =3D fsl_audmix_runtime_resume(dev);
> +               if (ret)
> +                       goto err_disable_pm;
> +       }
> +
> +       ret =3D pm_runtime_resume_and_get(dev);
> +       if (ret < 0)
> +               goto err_pm_get_sync;
> +
> +       /* To enable regmap cache only when runtime PM enabled */
> +       pm_runtime_put(dev);

Check the comments from Sashiko. Needs to use pm_runtime_put_sync to
avoid the race
of asynchronous.
Will send the next version.

Best regards
Shengjiu Wang
>
>         ret =3D devm_snd_soc_register_component(dev, &fsl_audmix_componen=
t,
>                                               fsl_audmix_dai,
>                                               ARRAY_SIZE(fsl_audmix_dai))=
;
>         if (ret) {
>                 dev_err(dev, "failed to register ASoC DAI\n");
> -               goto err_disable_pm;
> +               goto err_pm_get_sync;
>         }
>
>         /*
> @@ -506,12 +521,15 @@ static int fsl_audmix_probe(struct platform_device =
*pdev)
>                 if (IS_ERR(priv->pdev)) {
>                         ret =3D PTR_ERR(priv->pdev);
>                         dev_err(dev, "failed to register platform: %d\n",=
 ret);
> -                       goto err_disable_pm;
> +                       goto err_pm_get_sync;
>                 }
>         }
>
>         return 0;
>
> +err_pm_get_sync:
> +       if (!pm_runtime_status_suspended(dev))
> +               fsl_audmix_runtime_suspend(dev);
>  err_disable_pm:
>         pm_runtime_disable(dev);
>         return ret;
> @@ -522,6 +540,8 @@ static void fsl_audmix_remove(struct platform_device =
*pdev)
>         struct fsl_audmix *priv =3D dev_get_drvdata(&pdev->dev);
>
>         pm_runtime_disable(&pdev->dev);
> +       if (!pm_runtime_status_suspended(&pdev->dev))
> +               fsl_audmix_runtime_suspend(&pdev->dev);
>
>         if (priv->pdev)
>                 platform_device_unregister(priv->pdev);
> --
> 2.34.1
>
