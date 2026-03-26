Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F6A3BE65C
	for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 09:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774519031; cv=pass; b=CtaA7JpvzrmwijvbVQ867lHv3CelblsQRfBMoUoGjgUux/83CI+pnnApdIKyfmz+6fW0O+j0WU8pnrUWiZAsDu7n3ViTv6CXXpKbZx+P1mUaClEO9pL7+Jxsu0Cr5QcWAPCgiGQj6dmtpXAU6lTJKMIRLA2cFbL4VbTO46rHZck=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774519031; c=relaxed/simple;
	bh=6MN4Yn8s3wkIHEUixBh0hYkNApr0EFnU5l+306EREas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FwkrY+LRKDWxZ9wreWEznuzsiDihBn9HeIcvDOrRmyjxpCCog/crj9AT7QX6XGgPE7oPh6/w00nFM331+bJnimT/nA0SO8Q6TfbZ/7uU3ADtvtKFRVU+dOACv1s+xcKVUWhte3p7oJaVuEcJX+QVWWVXZBvsBGhHP91dhaI0Wtw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qSNgNC5e; arc=pass smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qSNgNC5e"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c741db5d610so409231a12.3
        for <linux-sound@vger.kernel.org>; Thu, 26 Mar 2026 02:57:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774519028; cv=none;
        d=google.com; s=arc-20240605;
        b=CK6BKrQGbKJsnk46BNUVYnD50ZIzbZTMH9HJRRpbVjwc1ilnu94cLzbM/1SUfzTH+m
         bKSw4Uy5DVVf+whkq5fjOwgPUZAK6umFKQUE3aeqoUzPaLS7tYgAbfvKhir9G5OCq+vT
         5OpXq8NpY8u4VkTWOcN2/H169Jph/3IdQuTenDeGTaXK9fSeEJxEjYv0VgZAN+ReYmWR
         ySSQkt2hhMjhkR+CVO4lx9y2xX5FiJI8GO7id/lZv2EkJXe0Kiw87IBME8KSi+fTc6vw
         etNFE/5F6LkmkRLTRXfWRKkEaReR8/jCYk3Z6x9HkMVS3L2oYihds60kjTQ84Xhy5N8F
         OY1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/x1pLpKHYONfL7gyK1YE4XC+xct4R6mewCS7/FCaiZo=;
        fh=JE/RksEPcbgn/8byCKvQ/CabkzqduB8lb0hsd7eW1ys=;
        b=a1OlEOHHx9YNnqsSANOLOmwN6axUuv25vbAV/XRMMFEVfal4Mwcc6q3/G682BbDo7m
         V0wc4njuGloIL3YdeME94kPptwMgyd0XyTrniTfuyG7y7mQ5ZS5ZrfXSItpWeLNuFn7a
         Iol/KV0Ga+GLfNpSuwf8L7H/oTlZ2KfjKo6zWv2mfnbUD2lr5NNu2ZuUo/SYPOH1dT3S
         ErHgNdbc7AtoXnj+ubBWo+NqW2Xm3TtJltoA/xEqTB/pNwmkcZwkocuH5QNDlWaMCyua
         ufosi4p/FjXJv/E6qfhJ6MU6m/3doCglrnvur3dBnyATNcg36n7cntLD69MT/VCaipIV
         2wqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774519028; x=1775123828; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/x1pLpKHYONfL7gyK1YE4XC+xct4R6mewCS7/FCaiZo=;
        b=qSNgNC5eYZksgNSONtfYVEW4vewLkjnEQyLtmVmZnnDQIJl6eCvHC4z8r/RHHmbMlC
         LwIKeC0odkC6Y7GfxgG6D36een7WA/MqXBKDhtPN8DTOVDZMeh5ZhE5jnyFArQG1N7uX
         zqgYdPnPQ3C2Kiojk6EshB/YBh6fuIOxSptQzC7F6DxCB4kz4ri3rx3sSDVzqXvIxySe
         YEauUL9zkOwJpZPnBl2PIXz0JXeOHBVJoSKpFn3dzqsvomgrEeFsH62kHFlLNkUFnkYP
         kgZUIaWFtIG2rMsahYyxfBktkkrYbThWJ0degE5QTDds8cl68wxQ1PlOFVfar6lhnrDs
         MDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519028; x=1775123828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/x1pLpKHYONfL7gyK1YE4XC+xct4R6mewCS7/FCaiZo=;
        b=Mud65I4gCq81nmeuz4uB6F93IHnVVLHRd/tmiA+KvYV2nVG+f9McfyGmRFlB28V886
         H12t+p3dWXMbsnNg2KOpR8bkMGJUnrcx0zEZkauUzLgVtftGziKFB5K3+oRcpz31SD6z
         wwqTPjt+VDo5OobznyHl00dMVd7bxYZwZFQ1PDuo8OcfdgPoMU+iRBHwo0o/m3wyJsL4
         o2V3hTgZfoYF5wQ8Yzn6qZb7ARhbJRO/gDQXW/GGc+WW/Zs4Fzo11kjCnRrtfBoIFYO0
         /dMkMS4sF6yxRa8i5UC52p9FafTlyQRZn5LtpwcwPNhlfl5098xT7lOkTS1YH2QWsFme
         l0zA==
X-Gm-Message-State: AOJu0YxebY51vaI82hmVV5vHpvpd5oSt4ppa56OTY6peReJjwWitYZ0e
	h8UDMqs3eKp5Hwj6DOlDjMwBw0lt7emV3euMq4tzo1FEH58Aj8Ea1UOwRvOnWAYjV8/MPwxQHep
	5Av0EpkzGI/6Ig+h+BQWCQrHBWI1ZX4BthQE=
X-Gm-Gg: ATEYQzyhUTJlxRMwW36Keid6AA4ID2Bd5UxnD2VoJx6anTyRkYnpapEfY8m2ZqTnxO2
	LJK+DnwztH70DXpP2qkHJwyhjdcY6EntZUGvoUv3qy5Rt/lgSsIvNW7THDl5iCyKXYk2aBLPyUt
	o+YeV3OGRRiiboekccWnQknEE/02cQj7muUOmNNeiIhHKxK0XRF2k8bP0lLgjOzaUIju5HuRej4
	fA1OhTwcoUfAFTHHgRqI0tk5dh1b38iwobZ5GrhHMlJ2kgaLgfgHngaIyyuIWZLbxSUjCG5SKHZ
	JidB0Q==
X-Received: by 2002:a05:6a20:918e:b0:395:ce56:4448 with SMTP id
 adf61e73a8af0-39c4ac47b80mr7743053637.25.1774519028001; Thu, 26 Mar 2026
 02:57:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260324205551.38786-1-jihed.chaibi.dev@gmail.com>
In-Reply-To: <20260324205551.38786-1-jihed.chaibi.dev@gmail.com>
From: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
Date: Thu, 26 Mar 2026 10:56:56 +0100
X-Gm-Features: AQROBzBCuGSdAg8rKXmJWnfzlUYtI6fspYz0U1DZHYj2Bgcn2iCtP-2eLE6KoOQ
Message-ID: <CANBuOYoPvheYDTK656Y=NWHPm6EAM4Lg6ESe=S=7wQk8vZ5AKQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: kirkwood: Fix clock error handling in probe
To: linux-sound@vger.kernel.org
Cc: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 24, 2026 at 9:56=E2=80=AFPM Jihed Chaibi <jihed.chaibi.dev@gmai=
l.com> wrote:
>
> Two problems in the same clock setup block:
>
> 1. clk_prepare_enable(priv->extclk) had its return value discarded,
>    while the immediately following clk_prepare_enable(priv->clk) was
>    correctly checked. A failure to enable the external clock was
>    silently ignored.
>
> 2. If clk_prepare_enable(priv->clk) failed, priv->extclk was already
>    enabled but never disabled =E2=80=94 the error path returned directly
>    without cleanup.
>
> Fix both by checking extclk enable and restructuring the error labels
> to chain: err_component disables priv->clk then falls through to
> err_extclk which disables priv->extclk if present.
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>
> ---
>  sound/soc/kirkwood/kirkwood-i2s.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkw=
ood-i2s.c
> index 99bd066c7309..ea734bc33dc3 100644
> --- a/sound/soc/kirkwood/kirkwood-i2s.c
> +++ b/sound/soc/kirkwood/kirkwood-i2s.c
> @@ -695,14 +695,16 @@ static int kirkwood_i2s_dev_probe(struct platform_d=
evice *pdev)
>                         priv->extclk =3D ERR_PTR(-EINVAL);
>                 } else {
>                         dev_info(&pdev->dev, "found external clock\n");
> -                       clk_prepare_enable(priv->extclk);
> +                       err =3D clk_prepare_enable(priv->extclk);
> +                       if (err < 0)
> +                               return err;
>                         soc_dai =3D kirkwood_i2s_dai_extclk;
>                 }
>         }
>
>         err =3D clk_prepare_enable(priv->clk);
>         if (err < 0)
> -               return err;
> +               goto err_extclk;
>
>         /* Some sensible defaults - this reflects the powerup values */
>         priv->ctl_play =3D KIRKWOOD_PLAYCTL_SIZE_24;
> @@ -729,9 +731,10 @@ static int kirkwood_i2s_dev_probe(struct platform_de=
vice *pdev)
>         return 0;
>
>   err_component:
> +       clk_disable_unprepare(priv->clk);
> + err_extclk:
>         if (!IS_ERR(priv->extclk))
>                 clk_disable_unprepare(priv->extclk);
> -       clk_disable_unprepare(priv->clk);
>
>         return err;
>  }
> --
> 2.47.3
>

Adding the missing Fixes tag:
Fixes: d8d11ba56676 ("ASoC: kirkwood-i2s: better handling of
play/record control registers")
