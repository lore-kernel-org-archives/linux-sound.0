Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4805225B0BE
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 10:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158428; cv=pass; b=SSNBv+YaS8mto59vq3w4TqBTfsy+/ppEBa3TiF5IQRfgpA80PSaHwZBynVQfrX/oPwIdmF4p8ZxAhh9z7ZMhSbKwEg0JkOWhSbwFbtGnM+8KST38Utn+eVnDI940byRarcoKaba2Wi0GeBt2ORRV7ySgmjzXk8/Dqu00LaGnKo0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158428; c=relaxed/simple;
	bh=6hNoicvQ9Qh0NY5PAdLmWCgVT7I2KnZ8VwidqirOaVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FO3xtOs8Vp7mO6/Ufo93QLRjIb56IErXItDzHxlPYGyF5/7XqDUcaJjqy07DfTRYekWkGeGJZlJ0asRn3c4cRmtTMRJd+CqttaDTj7XRNL99Hp5E3cCl13gm8RgiK6Ncvr4glZh1LXR0udFNejWVFNFkrXDRSfqb5kv2cYQBJiI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImiwyYv+; arc=pass smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImiwyYv+"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85f0fc1fd8eso384272b3a.1
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 03:13:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790158411; cv=none;
        d=google.com; s=arc-20260327;
        b=M1a/ncup69eZsE9F9qbDshiX8OwYyIEY6FlMiNFJwH338dHIftapEDIJg1q7Y+5Tf6
         NlDmOJPvdL43Q4xvdnbxEmlw+NPTghmOLwvToWbiG2zt3vpsNYtYKl6bGzqVzNZskcqs
         mPZRpBbvBArV1Scjc+Bg17l0Ta4R2NE5pbPB+AU0dca65ht3ZPuVZVc/IZ48+YyK/FEV
         Aqj3LFQthB7HZBZjxENeB7uKzkJ9nT7O4dvPU58nNrXCTYrEdfoHqcnusksvn5CM/8vk
         r2OWl3Ua0/9h5HTBOis5XSiVw15Y9Ghie46Vpa7qWKJmDeFuNB/8DV4qs2tpk9krqjSA
         wJ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T8UPdY8cxlA6aoPjewzNTQu1SQVA5gFWIlU2oGV5oPs=;
        fh=2LLcqfIjEvZ9eARLsZBsdJD+o2Fvf54vAXj0djZY2cA=;
        b=i5XSS8tRisZ9EF6xsRfACMaACSbHkFBLENf//NtQKOGV4wvvFgE/EIN0giwXo89ZhS
         XND2ecdkKPQHYMU48bjNFMzHGizLOq1IKzin1NuxJHpBt4I0xbrgQz48TwQ6UEAuy7J+
         kP5sVS5w7XRrXuUhgpxZpFTQJpink/GwfSsFPaaB2Me78jWYDTgewEXC93POswamiZre
         dP6ha07azdIjfx1PNWOnGoPImLfyZcSlEVXSRfaKCLbi3+/ATrqyRbUFPW55lQdtUXGp
         F168QQwl23QDFKZmYZQgVzJB0deG68A8gz0ZI0RzKzhkRpdJlBd/nYgUSrW9puBFzRFW
         Rn/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790158411; x=1790763211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T8UPdY8cxlA6aoPjewzNTQu1SQVA5gFWIlU2oGV5oPs=;
        b=ImiwyYv+Szy9sBOTxAaUjzR7tF9JDGlVrujEaLSCmW+oKqiEeeyf19vKH1938mB4Ai
         qcTH+2z/VZ88uOi+Q5eM9rml09l/OqPv0YfqHVF0siVgsKDQHSZnOIRFaLdGRAEqcYud
         woX3dF6MUhHv8Rl9uQuG1OyGcWeAuYzmnvM1lRBctLw0lBr1MVOhMijAA0K559uVHXbO
         aJioCmi6Sqk4Jb0/cgD3OpwsMVcjB/BO7x/gQKTF4/s7jxYgo+ctcGcuT98pN0BOeOLJ
         qw74NpXqxq0D/fZojv1q60r/+3eCGAKaWLvqdRB4cWTUaeuOx5J6viMUdUlcdx+olQ7c
         /IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158411; x=1790763211;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8UPdY8cxlA6aoPjewzNTQu1SQVA5gFWIlU2oGV5oPs=;
        b=NIMdyNqt7IxjSk/GouokmJl6LjtPnrKeUGDQw/2R5DEIf0J5GJJPFVCxajyU49Mbqx
         x1RK61fzlIFlUPPaz8arc2+vpp+PvQKsJyczmhcAPpfec98eJ1eoFxJLcKHtCTG0KHgF
         tq92bcMVxryVP5ri7Fzu+LltL3cG6qOQyh6Z8z6qqTU2aoPDF67dqtUlCuK47FmrItyH
         7L5A3HfbxQFrZ+ZW62jBKmS4EJDovgZtSkAi7Ervf+p06hhCPJaB0zs/F0CpdFrWWIsk
         czUERecrJXjQaK6+XSzVRllieK+93A+5NXwwhslzkl/ynTSKyguoIqz1HFWNmLxPkJUA
         5K5g==
X-Forwarded-Encrypted: i=1; AKwUvBwXZ0P8YA9G5AJsqkT91acRls8bqvSVF7RVkdFpDju2sYPSyOP61797HQtlil2eFiZonT3PH1vuo60tvQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k1svHCQuSI0BIlqrzCY4jcrAi9gL3obyF/h4oBiTYNWtbHTQX5
	i8Fv1503rS4yKQQdrDvkTlK78CiKVbrbf9FnlvHdw/CVGwO3sCiDWe8AM/SuB2ycNCF2N6MElf5
	usIhG5Jq5vitoHRoks7wZxJvaP8xi5w0=
X-Gm-Gg: AYBFou1I6hTuEfw+LirnbgTXYKHT6kPtsmXwS3U2UxXq4qCFc9ngkWMnADmBAD29sOj
	SKPLlK9ihidaoXZjRhZvXEyw0Vi6gvYjXhykoaSKYZPpEVAV6A2GBCGxKw4byye6rxrgtycRBFs
	BvHHh7GHJ7xqv+/LqQS4oL6yjpA3qqhn0WZ3NziiTUaO/HpP+6laiyrZcdwGyDlV8+zOpZk+4Cw
	IhQrPsMzIwSUzVjg26zN0/R3tbsPxbTy5xReXj1cr61dKkd0F5IZXl0xZjE3FXBeMFAYWO/vDhz
	jzEtYu0fwqmYiDqGGCUe4Fd2U/3EGYsxaXNDhzYOEMmSs+WTdoWNFpFT1HadVRnOQg==
X-Received: by 2002:a05:6a00:1489:b0:845:ba94:a56 with SMTP id
 d2e1a72fcca58-87d1a7ade4amr1946462b3a.5.1790158411345; Wed, 23 Sep 2026
 03:13:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923054017.93553-1-mhun512@gmail.com>
In-Reply-To: <20260923054017.93553-1-mhun512@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 23 Sep 2026 18:13:18 +0800
X-Gm-Features: AcwNN1XtFHREsFLdPRUiEqLGtk9NvYoAB2IZLiGY3P6QqpB_FT8nAPCPpRvlyaw
Message-ID: <CAA+D8AMQLkprPdOrT=oYR0dMmy0TqDdy1rZ3nXP6nPoigdsBuQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: free IRQ before canceling reset work
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 1:40=E2=80=AFPM Myeonghun Pak <mhun512@gmail.com> w=
rote:
>
> irq0_isr() schedules work_rst on a preamble error, and reset_rx_work()
> touches regmap.  remove() cancels that work while the IRQ is still
> registered, so the handler can queue it again during teardown.  The IRQ
> is also requested before INIT_WORK() and spin_lock_init().  Probe
> failure does not call remove(), so freeing the IRQ leaves queued work
> running, and an earlier interrupt schedules uninitialized work.
>
> Initialize the lock and devm_work_autocancel() before the IRQ.  Failed
> probe then frees the IRQ and cancels the work.  Unbind frees the IRQ
> before cancel_work_sync() and pm_runtime_disable().
>
> Fixes: 1e5d0f106164 ("ASoC: fsl_xcvr: reset RX dpath after wrong preamble=
")
> Cc: stable@vger.kernel.org # 6.13+
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_xcvr.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 9828272..29929df 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -3,6 +3,7 @@
>
>  #include <linux/bitrev.h>
>  #include <linux/clk.h>
> +#include <linux/devm-helpers.h>
>  #include <linux/firmware.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> @@ -57,6 +58,7 @@ struct fsl_xcvr {
>         struct snd_aes_iec958 tx_iec958;
>         u8 cap_ds[FSL_XCVR_CAPDS_SIZE];
>         struct work_struct work_rst;
> +       int irq;
>         spinlock_t lock; /* Protect hw_reset and trigger */
>         struct snd_pcm_hw_constraint_list spdif_constr_rates;
>         u32 spdif_constr_rates_list[SPDIF_NUM_RATES];
> @@ -1617,7 +1619,7 @@ static int fsl_xcvr_probe(struct platform_device *p=
dev)
>         struct fsl_xcvr *xcvr;
>         struct resource *rx_res, *tx_res;
>         void __iomem *regs;
> -       int ret, irq;
> +       int ret;
>
>         xcvr =3D devm_kzalloc(dev, sizeof(*xcvr), GFP_KERNEL);
>         if (!xcvr)
> @@ -1705,12 +1707,22 @@ static int fsl_xcvr_probe(struct platform_device =
*pdev)
>                 return dev_err_probe(dev, PTR_ERR(xcvr->reset),
>                                      "failed to get XCVR reset control\n"=
);
>
> +       /*
> +        * irq0_isr() schedules work_rst. Prepare the work and its lock
> +        * before the IRQ, and register the cancel action first so a fail=
ed
> +        * probe frees the IRQ and then cancels any queued work.
> +        */
> +       spin_lock_init(&xcvr->lock);
> +       ret =3D devm_work_autocancel(dev, &xcvr->work_rst, reset_rx_work)=
;
> +       if (ret)
> +               return ret;
> +
>         /* get IRQs */
> -       irq =3D platform_get_irq(pdev, 0);
> -       if (irq < 0)
> -               return irq;
> +       xcvr->irq =3D platform_get_irq(pdev, 0);
> +       if (xcvr->irq < 0)
> +               return xcvr->irq;
>
> -       ret =3D devm_request_irq(dev, irq, irq0_isr, 0, pdev->name, xcvr)=
;
> +       ret =3D devm_request_irq(dev, xcvr->irq, irq0_isr, 0, pdev->name,=
 xcvr);
>         if (ret)
>                 return dev_err_probe(dev, ret, "failed to claim IRQ0\n");
>
> @@ -1751,8 +1763,6 @@ static int fsl_xcvr_probe(struct platform_device *p=
dev)
>                         fsl_xcvr_comp.name);
>         }
>
> -       INIT_WORK(&xcvr->work_rst, reset_rx_work);
> -       spin_lock_init(&xcvr->lock);
>         return ret;
>  }
>
> @@ -1760,6 +1770,8 @@ static void fsl_xcvr_remove(struct platform_device =
*pdev)
>  {
>         struct fsl_xcvr *xcvr =3D dev_get_drvdata(&pdev->dev);
>
> +       /* Free the IRQ first so irq0_isr() cannot requeue work_rst. */
> +       devm_free_irq(&pdev->dev, xcvr->irq, xcvr);
>         cancel_work_sync(&xcvr->work_rst);
>         pm_runtime_disable(&pdev->dev);
>  }
