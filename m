Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794554280;
	b=Wx2Sf2c+DAPQuAXp61ALwgnfZPt9m/PIHJh4CpHAMJREwQ5pg315I2dDeYct8YbI36Uo
	 GVRuLsODhFJW/j11HWPZRrzrE5f2/SD7WQwbQkHEHnQIVZWMgPFBNFHH0MjPgfRckIrWf
	 qKt+VFElunv1nwVFnYdTGfj8DvDd6pTHGHKSZDjFkoZmdUOxc1eHfsKjDU3xtAx7OhNp5
	 046NWrTn8bH2IZwGAL38tf0C8700zN6h+8t51mcHyZkCWKx6b4P7eODe7bkjxUJ+XU/tB
	 wGqPzjemYnCh8Qad1g3RNPfCoaYXqB75ExerwYznqCS4XjiJ+searPL1z/d82Lycryg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794554280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jbKSRLmz7AprKYWxSmdsCwUxL3t+E9S5Fb7xZH5aS6w=;
	b=cDTN2NuXMJuvg9YM9ev882yIkmv0mmGptwpCvZNetbXVmGB26qumDIqLKDalBcvOPkIr
	 PT3nP6AWC49Nj19KwAE26SMU3j5XiuxF/QcOpjG5YsycBQZK3G8VFuAl3CIs6kigkff0I
	 pyf91k5OU8N7YiZispSNUNLvUAZUVZApemz0PP+iT99IGXrYVnyVmmIpTL0zRPH05B4WW
	 U82hz0qQpbU9v7O9fnifCjLj/KbFgQpVMYRhoxJTqBA1iGIqsk3o6db46MAsX8/Wmg+ff
	 OHkGEMIH/sLY36Ri9Xe4meHd92GBgVW2ciwEBMvF/CNgUGFlp2L6rsk+6+1ROOowMTg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sh33LIHe;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0721C606A333
	for <linux-sound@vger.kernel.org>; Fri, 13 Nov 2026 07:17:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0721C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Sh33LIHe
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e9ae391a05so3316655ad.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 23:17:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794554279; cv=none;
        d=google.com; s=arc-20260327;
        b=gI7iOiMD5gOy8Y+TfKBupu8pha0+dLUyfbHCqgbCMR6yY7urz+NmsPdbOGjXa34YhG
         nJkfQ+6ukk0W3wIzkHATEvLtlnnwXTRKOF55QQmqU45htLgQF4EeMB6fekQm6FD0IECP
         E/kX4TUexTXcUPQTKZcGAHB9e0sNAGf8CXMYKaOEiifE3uzpKCly2ru2qG6B4La1EXb1
         jMFLQPKOJswy5LfZD1huDDLusj2noMgjFCiGs1tzVJStlk0zqBIKCH59rvvUUt0x5dbj
         nHpMSTkC4q2z3ONe1Y9mhrX0sO0jGCWaNRa1xyPt0C3cQSHokGFWzo94A2VluWNJmvxG
         RKVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jbKSRLmz7AprKYWxSmdsCwUxL3t+E9S5Fb7xZH5aS6w=;
        fh=NHX24zQkWCJVZyoKzuM8ZIzz5Y9xzHf5/oKeqTwTHFE=;
        b=Jk7QY7YpGWYfJoyEdc2FJ/7dkn0HdwRAeJOzExbeAvaMKNoiIgks8aNsgQ1EVXVK1S
         LR6nhnVKxJXwQW1kAdCP6WV9zOH5K9NBVeUgHzWXygoxgNJha8s6uj35rK+/DrZUOJJX
         JRVAC106NZdKq31u+MwN2wTMuGiA0eFrOp3QjMENodaKpAF/Gr9Ra0zray2YPCMAQdnO
         bKgTqOXNIjBWDANjvZFrywWS0hSg9mSrzk7zzgOzJDzivGeoRiYam8OKoZ9IsZt+W7Ov
         CMSia3368bSctuOykN7kf5JDnpLjv/ysJQz40jicUHjgssDjYqM10U85/aDECGq/hSHX
         3H9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794554279; x=1795159079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jbKSRLmz7AprKYWxSmdsCwUxL3t+E9S5Fb7xZH5aS6w=;
        b=Sh33LIHeO5IhWI+6vT9hMrMHZ2MY8ie+WnxuedyB8mSsNnfXN6G1T4IK5+j3wTRxbG
         Z2rPaIFuMYYXNa5LUbPzizDQhsLc3lhABqmg+rNBEZFXJ+Qc11BV2p0/vp2gCRi0mjES
         S6dFXmAV1McmhOWTMSBHu30g6HJ2Z1erAH2LsY4DzJSPa+PJ6ixLsHTyyCQE6JozUIU0
         HtrMkf2ZFiUNaDtaWecK/8RdOL1wPmvQ4H9wHv+rpLQT/4wWFjHqKVmlT4ZXR65sfl2E
         Bi2YhL1A8IhzGBSrvdkB3ioyxIdEWwYIUwQLi0Cac5g3Udpoj2mL/2Qanpwb1yFsbgx4
         y3pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794554279; x=1795159079;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jbKSRLmz7AprKYWxSmdsCwUxL3t+E9S5Fb7xZH5aS6w=;
        b=GEHY7lXrtclkh2nFns12LB6Rvmesw6hDfcPS2Yr2ffs+g6QFJWZaO4x/39xVtmtFAc
         QD+n530WlGDxnGyKfSuZL53WL4C7TWnoe2JyAeYo5WV6I2M3gHezkPxPHgrcQKUelt2f
         2MxZuve5XoFqeVXjoFOqT7utpEpfK/N02THZpCXJKJ/f5IIG87fnGGEb9qzROAQ3WGR5
         4PHc2qG+cn6QP8KXquhQeSQkKSC2K356g20xn2AlPpxKJB5O+0aFwRmQbmuM54hdnO9p
         G81YGZnxQxKheuXbQToaIW+UMdYoPW0uQ/yYcKp/i7I6OCsqa1C4ZdcXEzIoU9MD0Ki1
         IqqQ==
X-Forwarded-Encrypted: i=1; AL+hErGnbhrbQVP3oLUz+RmQxVABUpeiCOQ+o4qrfWOfdfQ5AcGPj5zNNW+kWiIX7WtnehY3JpiakZMRzKVYeg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/P03zBa9gVWtKJX+bTXnjtwev0EwXAgIpd77QCnmIIuUHEz4Im
	XiPWbJ7VsomXA7G+D09njZe8/O/KJmmUVwOYG6RUpabV1yuzTl6v3FJdZfM5A4aReGij+mzkPeK
	BOQ9GVRc05ehx30TExAJ4yApRgozG/vY=
X-Gm-Gg: AYBFou0+V4PaaaF/n2C7Jo+hZEgGlzbR/AcPaOJ5I+RyiBvB7epc4h9jfYyxRqYrfmi
	HkoQVZS2jC8hB470ObnoaDsi/GsBPz59iqAdYtHwyCa2wLhNuWq576PbZuA91kEFlJf31y2fl2c
	Fkny1HWOF08oNGiaAQhxGrrsZ07vFUHsqzuug6a4KLoxVPmLdUnxRBDtHnhlfWo2WBnywxx3ilZ
	u8ukyGnybhKrweekzYnhB/BSuRtjBN/ciHuCsfU8QRvXWauyAcGTf29v6LkLpKLoInIA6b+xab3
	+HAwcrvDmICKgEJ6uWz39f2uU4Xv/0I0hG/tSGGT9sXadYJlvhHkryUabdab4ojoR9dRa20k8ha
	mOt9D4ICB6WhKXrp8a9r+pCp6Qeslo9T8SwdxgA==
X-Received: by 2002:a17:903:3b8d:b0:2ed:fb0:bfd6 with SMTP id
 d9443c01a7336-2edf1e7b485mr31047135ad.11.1794554279295; Thu, 12 Nov 2026
 23:17:59 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110075841.12104-1-phucduc.bui@gmail.com> <20261110075841.12104-2-phucduc.bui@gmail.com>
In-Reply-To: <20261110075841.12104-2-phucduc.bui@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 13 Nov 2026 15:17:43 +0800
X-Gm-Features: AclHuK8Qa8UhTmu61wA20WzrbFp-wCX63PxUgDbDHkpoSTkKO8stJMNsRt0tw2w
Message-ID: <CAA+D8ANZB6jviDGAdLTc9K1ZGmmfRCSXrkpqLCuy3DVqcB8uNg@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_sai: Make fsl_sai_reset_hw() return void
To: phucduc.bui@gmail.com
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:59=E2=80=AFPM <phucduc.bui@gmail.com> wrote:
>
> From: bui duc phuc <phucduc.bui@gmail.com>
>
> fsl_sai_reset_hw() has a single caller, which does not need to
> handle its return value. The function already reports register
> write failures through dev_err().
>
> Change the return type to void and continue clearing RCSR even
> if clearing TCSR fails.
>
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
shengjiu Wang
> ---
>  sound/soc/fsl/fsl_sai.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 430e896d064e..59c9b8c28133 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1410,7 +1410,7 @@ static int fsl_sai_check_version(struct device *dev=
)
>         return 0;
>  }
>
> -static int fsl_sai_reset_hw(struct device *dev)
> +static void fsl_sai_reset_hw(struct device *dev)
>  {
>         struct fsl_sai *sai =3D dev_get_drvdata(dev);
>         unsigned char ofs =3D sai->soc_data->reg_offset;
> @@ -1421,18 +1421,12 @@ static int fsl_sai_reset_hw(struct device *dev)
>          * Bootloader may leave SAI running causing interrupt storm.
>          */
>         ret =3D regmap_write(sai->regmap, FSL_SAI_TCSR(ofs), 0);
> -       if (ret) {
> +       if (ret)
>                 dev_err(dev, "Failed to clear TCSR: %d\n", ret);
> -               return ret;
> -       }
>
>         ret =3D regmap_write(sai->regmap, FSL_SAI_RCSR(ofs), 0);
> -       if (ret) {
> +       if (ret)
>                 dev_err(dev, "Failed to clear RCSR: %d\n", ret);
> -               return ret;
> -       }
> -
> -       return 0;
>  }
>
>  /*
> --
> 2.43.0
>
