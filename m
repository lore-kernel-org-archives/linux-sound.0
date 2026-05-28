Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF5E32B127
	for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 18:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779993264; cv=pass; b=Mp515yXGe4XS3RWt9Q/ozBIjfwTBNPw8V4MMV6jOXLbY8j3edFXprHuqzLhPEzE9Y+rOrHFXO3xv54+kCwxpAdNtwb+LiUKtczDtEFx6DXu5wEKUfzs84EYEOgiMR7hZvY52hQPqwv4zEUmrlVF5TIeUh0SCl6uzJOanwYT5MCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779993264; c=relaxed/simple;
	bh=RvYJkPej8kvuJr33nbRsyphgqNU0YetKiUL1T9mpyNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gyEXfyK/nRqf54LqEzNj+awi/OF2rTeEz95dxBpYfpSnpHpLc/f8cyD2o3fN9oM43ozAu0SEW19TYP7GIkTVVmZj6/+qRcVuzXSFH3VSjgwKqOV+12txB1JHgegYjDBhPWTJqaY1ZD3pMBQc320kXcWqtDQruTQn+dad2RLuiRw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gCDWH/Mp; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gCDWH/Mp"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a858881ad2so16229880e87.3
        for <linux-sound@vger.kernel.org>; Thu, 28 May 2026 11:34:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779993261; cv=none;
        d=google.com; s=arc-20240605;
        b=F1wbolNQsrfNICKgZfAq6cXttProoEY1m7nQeaA38Av33HmraiQfiMb1+q2RAdkV5u
         91xCnN1GazqPGpmW2QEA1ShZzCnASc1DrCM4jq7+gil9aTLb5TknwocoI+X4HaJRiUkM
         RqkGS8TezVTqcGQfu2uB/ZZNqx2cYgPR5qSrxiu5CY1xf1dCt+rfQv9Mpt8pCBMgbqPx
         HnuTUs3Pz3Pl/3Pb5Ja9gzoGqS338delOEhJ+6fVUr9hrNz/qedCWpojPsUupHvGojpZ
         zhfmSnm5AGMbzhNzjah1Wa+yhbesdJNApe12nqp//1qA/4k01K5d+YJ8lKdNYhVUdX4o
         m7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dtYa4ePwYbBQJ91c8j++TGUt6F41suH+/FHOvZqTF5Y=;
        fh=2wwbskFqdvkN9p7DzqxAuhwTkCOzj6CKqJ5KKuAnb1U=;
        b=CAZTNtJE8Eh12P6/b/6tRiGkVggPZPnx6u28s00JRsFClZgM+wnEk47cxv7nN7PHVx
         ru6DLOwMqlQ2STRqwIjDOuss2u9FasYqY/z7qn1QV74Ado2U+4ywhcesNU/RAM5Mbq00
         9SK8QO1G8CFP6WXDYBWsRDYSxMk7hEKHN3qJKiUVhxhW+8/AhjPHRsfvKea0WvNge+dI
         ACIpFBkhke4Hzv06AzaR9wtB+7/9VXg3RjWG8XRuNYwv+yUCuUBhYiJZKoEokL9irUY/
         0B0Aubu8ataZ0kuArvfQm9xXFs1+Rds6F/nBZvizAVgf/x71qH+eP56JYBdVdHjaPdvA
         tOGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779993261; x=1780598061; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtYa4ePwYbBQJ91c8j++TGUt6F41suH+/FHOvZqTF5Y=;
        b=gCDWH/MpMZW14y2TP2X4nJvjrEQdKPSOujjArrTi5fgG7TEScyzRgyC8sMqa4RzCBp
         sPSExA0Zov6By/OZCvsg967R+QhRBPYw97R1Q8L4fS5taTAZTWk0basUC5qg9pWIPxr3
         0q5qDVCdjuHfJ6ZWSriJ/J3ELo6LHsn/9OVDF931A5rBey4BmSkwQ3c6hk0a48f76JBY
         TtBJSnbLdrE13x0nONf6km9fygfSORdGB3bEx74xHcvCwCVkZbENQlcKqosj5/9Lu2Rc
         k1EJThrhrLOJJxULQSE900L1wLWE/dtyPcd8OS3m4K4GmntCYlz5Z9b7mhN4QZQQOGDh
         g3zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779993261; x=1780598061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dtYa4ePwYbBQJ91c8j++TGUt6F41suH+/FHOvZqTF5Y=;
        b=aPdSDImHQVtG0x1KaX96ROHa1kVSnZ/ep6inNL8nXZ1+zOTgbl6MZClaeIKLqsZOy9
         goUTQSnQMpy42xsYUkbKaryIA64+8oUYLSbjMbw/3c4T7aopLqlIUC8AYAl3tK3ISwx0
         kTlX7N5AXuGpsy9HJaGn83obhMmrd+mXrz7ZivWWwQKwiKNwOitR5xfVnf4NTZCEHtVg
         H+tWYMBFM/XhC/ebV4TphzPvTokbkxExafZB4KANm8DBdte+s76t4Z9hxJ4zjHo3Vv+J
         CE3A/wMna7R5fLh6MJ1ASY5B6JUInKHblUa+rBE/4wGipZa6yRWU1dgoTj9ykfXMoP3y
         Pj0w==
X-Forwarded-Encrypted: i=1; AFNElJ8aG3/Yo5CNLAfo0ho6YaSuBN9EwM0AGNLNird7r4nJODHf+A+reVeh7pTvY60YoxxGCB2gjgkD/7WTLA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Yriw4ta5XzUr8A53zhhdft6kaaA+wZYX7X07AE9hVdEoPLsh
	t1tLy34SSVpda+HPWqKnsVj2KmFzOeRXe0qTLV6aTq+QtqDXxITwVv8q4rMtHpN9eVlcdAUmBFo
	fXufo9OnNIuyLtFURXCXAiZavzXAceFg=
X-Gm-Gg: Acq92OGYiVOLyC6cr8jf2yu9z/jMuWXGNGQ6EcHXgeMddQmsxo/jPhxAIABlyGeN+1f
	4NRG/lDDq7fRbi4GNqz1DlALNIujWPCGgW4dUDLKg7I7wfwWUoj7c/9LCXEt/Cski3B8au59NUu
	a0JLTirNdCB0eRtVK1cjJyDFGAD8M3IUTe5I+Y5Ln40vY7ma1Qyd4hs1zEqKuQy7go2H0GROiCt
	9Z+fNPSEtVlg0m3QdJeHAApQFBK+2baN6C4Y1xeYNsyrGlMtm5I46hQ1LLoo+3Y13iU4KM8mNde
	51SNd1D7SFflYpzx0oU=
X-Received: by 2002:a05:6512:66cd:10b0:5a8:74ac:cf7e with SMTP id
 2adb3069b0e04-5aa57e16a58mr73920e87.24.1779993261168; Thu, 28 May 2026
 11:34:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523213548.5219-1-jmiguel.ghp@gmail.com>
In-Reply-To: <20260523213548.5219-1-jmiguel.ghp@gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Thu, 28 May 2026 15:34:08 -0300
X-Gm-Features: AVHnY4JiGd59qJmKiIKuzURLZZfw6lKLiY9gn0QPxySHLRCQ-J8Smr0Q8aXsz5A
Message-ID: <CAEsQvcsYnjBK1vor3MFKs3GNzn_wAvOP4rGthpW3vYkcnwMxgQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: amd: yc: Enable internal mic on MSI Bravo 17 C7VF
To: =?UTF-8?B?Sm/Do28gTWlndWVs?= <jmiguel.ghp@gmail.com>, 
	Mark Brown <broonie@kernel.org>
Cc: Vijendar.Mukunda@amd.com, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 6:36=E2=80=AFPM Jo=C3=A3o Miguel <jmiguel.ghp@gmail=
.com> wrote:
>
> The MSI Bravo 17 C7VF routes its internal digital microphone through
> the ACP6x. The machine driver only enables the DMIC for boards present
> in the DMI quirk table, so on this model the internal mic is never
> detected and no capture device is created.
>
> Add a quirk entry matching the board's DMI identifiers so the DMIC is
> enabled and the internal microphone works.
>
> Signed-off-by: Jo=C3=A3o Miguel <jmiguel.ghp@gmail.com>

Cc: Mark Brown

> ---
>  sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.=
c
> index 7a637d6b5..a93a7fd48 100644
> --- a/sound/soc/amd/yc/acp6x-mach.c
> +++ b/sound/soc/amd/yc/acp6x-mach.c
> @@ -794,6 +794,13 @@ static const struct dmi_system_id yc_acp_quirk_table=
[] =3D {
>                         DMI_MATCH(DMI_PRODUCT_NAME, "M7601RM"),
>                 }
>         },
> +       {
> +               .driver_data =3D &acp6x_card,
> +               .matches =3D {
> +                       DMI_MATCH(DMI_BOARD_VENDOR, "Micro-Star Internati=
onal Co., Ltd."),
> +                       DMI_MATCH(DMI_BOARD_NAME, "MS-17LN"),
> +               }
> +       },
>         {}
>  };
>
> --
> 2.54.0
>
>
