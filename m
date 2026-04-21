Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C171734A799
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 22:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.125.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776809391; cv=pass; b=njt5fxy4Y72mNNr0E6zGqSMjEOR6j8+NTbPMeYGWryfUIkNxkOgCJ+qtS0K0+fFHQyE115MQWltMNAQhENl1AZexd3UnWi4qqgvdxTBLaVVjgwKaTB2s7jiD1q46TTvWtMLCJj4SgCt4H5/uQZgv4Vly7sUS2HLKS73cfoblUyU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776809391; c=relaxed/simple;
	bh=AWeKAl7zUrWIw/VrUdiR+IAcxDzVONtjCc9RHYhrVB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YtqmAFXw0mOxqwFfjzsrLxuaBbD2r+4OKQ095gYGeOBu/srIYR5A/ENr7KzuXT+Qw3hrhjgO+NwU8s7RcTMUTAbUmrttMru4DmrSf6IrjiHV6qEWUkXfE532j4g/dqH3jUWriszM20qaaZaCXKIrNISfWENboE0Wo+1CF/OsX5E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=saPvtT5w; arc=pass smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="saPvtT5w"
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2FDE03FEA1
	for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 22:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776809386;
	bh=PACOTtiGzd884jTMSX+i5K3073zO2x+ORt9G19Oenu8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=saPvtT5wBrUPhRsX2I5cEcUqK7+nkol/SDzlD/YHELQJ9K6YF+MQ3Ticz7yvaqT+1
	 PaO7+OAp80dGe1fDJvxwT4D4XEG8kjWHyNxve/H3ZpXUZuC5Ov7LGf8z5Zsz/zdWJ1
	 9ETwiNCJ8JCCoD3SlkGPdferJsRnC4eRHAcR32Jl4KYF5+8D9InOAweu08I+Tg8LoO
	 X7QTMKx4NXPE9egKc8TMSeoQnCi3ka7Ql16N4vZjYxI9tDNgaPoui6FTaTxdSZeOms
	 BZYB5sLWS9jG2FG88l7S+8ayZ6eeh5O45LVEQ9kUCITKKqa1Ga1/LFBKTWKQwXHkx/
	 rGmo0S2WvVdw4rNx+pi75FiZ6xAubcf4c4e3iOwnkBcmNLmqkKh+BmhN7v78k94cuS
	 1PgUU9Mr820aPk+xurcGS0REN6tSOz5jCzakFUSJ1QgB5hAf1rW/SBsYlUGVMll90U
	 FI2e3iSwn7O7kr3lEPf4KB+MCpd4Bmskmn2hjU3Je96+ENmNyUT2l8oOoRT+X+DUDV
	 yzQESJoqKqiwOHFWj8iKWdoP61OgV1dzg+Hq/Q77QVEriNeFmpOE7nskapdQJn8G2Z
	 8yU5YDHZLzfaMZZt02VWTNcoP+CbGok4FXahbSXiJrdEJOH31PNEXP5JjfgOxsTizp
	 wx5R4b4pdOMWz10SBOKsLbh8=
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b8fbe7a6f41so143845266b.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Apr 2026 15:09:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776809386; cv=none;
        d=google.com; s=arc-20240605;
        b=ZvbMggdpvMEH2Sv8HcY8HOxM07NdEbrFZQQqcaJPJY5uoCkzuvvWxb7STM6RNshB9n
         mRqe3khC2FQTS4Jzfo3yI2FnqpiCjd0u8EYS/brJQXjcdJuNQb/6ZQXPnXD4VwMhz43d
         xQ4nrnhWem++pTzjj4geepNeNTVeE4WKz0Z2H4bg7xXG9bpih+wch6x1JTRiUfoeEtqG
         NHl2WAjPmKAVu+Q8rwERn9y4YRSucDhP6bCn9LS7qEq4PCa6z+QvCYKude9xe0e1dAGl
         fuWtqZSmlbRvw09UK3YWb1Up+8pnBq3C7iPGhqyamjGPOP1qkzwX+ESP4VieOsIb1qNl
         i/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version;
        bh=PACOTtiGzd884jTMSX+i5K3073zO2x+ORt9G19Oenu8=;
        fh=FEHITdJ0amsW44h1kxeuKW5+FJp3mBb9EjvvkSKrtAA=;
        b=LrnuZ+ETPl9SwMRJxUfDuxPs2eIZ7k3Vo2YFhiSrEyx/3IiS0T/JEOeVCtS9/t5nBc
         0Zct46GTQ4xFNl2uMDOpF5JdgN9qbNAtnyO6H59RHg4yMtDIZ7fPpiMp2WxaA+TllB9n
         DyuyCfwKTgvZQ15BL/eZllFk55HeVIbHPrmWMXPD/O3mGgfgjVtWealW2sWgHmfL6xRp
         dFrk7yRqxs5wN/kgpAmRGHpfkhzY7fPjPRt1x+BxJzwOPpXUsZhqDZIpVQg+7Uq1oB96
         /cDnlUHezwysHnBcwBR33Zw3Jfqd9NktskxuHkdlKkXcubICAKf3rjdeXUTqKP0h8myS
         0CLQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776809386; x=1777414186;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PACOTtiGzd884jTMSX+i5K3073zO2x+ORt9G19Oenu8=;
        b=auWTD/4cdDWcnaTZmnlyn3XjJul1AEkaMSpsi4S2XSLZvsDQ+MdsImV52XGTOncCN5
         eT2XUERAW2iudMm+X1V4/oAW6lDha5qOCuVKSKyq6atUB9LF40g9mnp7BC1d8eINyxD0
         BLAILY5Aor8ZD5serP5lNdE4vPLAUGz1EpM0Vf4YAYy+9XXMLY0ZWCxbZ1zeGi4Uic4k
         7cHYTVU0DLscjvEUePAmQGHgVZyt9sq6yYzj6BYA110PP/5wBGFGJOhJksMaKG6fWb71
         I9dO0qnYxJk8eWzwYiwTi7fufAgOoCMcoko7ifdxhR6biZmQFQzaMnF1719UCLpzFiWi
         g+pQ==
X-Forwarded-Encrypted: i=1; AFNElJ/XqhzZtVLvzhnnyxeIWLo5AIBmSjgUgD9AWiNCD28g5J+2aTekvzghSoH7OueNKLUHgE9zrA2T0lcTZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+JkYvJLk8LtGQ3IHf7vIS0743FlUeLd+owdTOwCWbQZGDi2n
	jT5fbtL4te0OURjiVTLmYrlK4CfFTH4YVgI+n5lO/LprX1xSa0+g3GJAiCiTiSUhc31BvgbGODE
	ymMTuVWWU279Fa1+/9CeFArOZ38HK91Nc7GrDfJ08qP3ATDimneke5NzLkyz+HhgItYOp9D23TZ
	30ytE11vpKTiey9YaH5qBAwVhKPXuSG/XujEvee94zdkIec2Qg6aTXg74=
X-Gm-Gg: AeBDieuV8pBN1///1TCKlPwKWmgiocejWiG59xzESlQN9O7cJqn+vti6eb4jCB3scXD
	mN7gM1Wlm3MsiLDjbze48x9VmvC0uK2zC48D8QN7kaorMVT+Xn9TLWjnRJoA6JulsyLbCQVEMmx
	Zbfyx1g1aBTQK/oP9bv95H7JU8aFvoxPHIyHC2ihGmjPZMcQgjmoSkKkwtJOt7epbiEsIsg5GAD
	gvTgQxoauNOfi3czlfYqxrQgE7nOBl0X0lK2kkEawwSx8KGpg==
X-Received: by 2002:a17:907:6e90:b0:ba8:30a6:8b02 with SMTP id a640c23a62f3a-ba830a68c0bmr471906766b.41.1776809385658;
        Tue, 21 Apr 2026 15:09:45 -0700 (PDT)
X-Received: by 2002:a17:907:6e90:b0:ba8:30a6:8b02 with SMTP id
 a640c23a62f3a-ba830a68c0bmr471905666b.41.1776809385157; Tue, 21 Apr 2026
 15:09:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421-asoc-limit-volume-error-v1-1-dcd0102576a6@kernel.org>
In-Reply-To: <20260421-asoc-limit-volume-error-v1-1-dcd0102576a6@kernel.org>
From: Tobias Heider <tobias.heider@canonical.com>
Date: Wed, 22 Apr 2026 00:09:33 +0200
X-Gm-Features: AQROBzDAPWc2rnOSB5E1V0eDME2BjgeJJ93dja-3wv6m0fTVsLEV06CaB-FUuyY
Message-ID: <CAARv3RQ13+J-rbnAPbdjT4E0YGcXa_AZMUZzAp7ZuWW9HgPEFg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: ops: Log unknown controls in snd_soc_limit_volume()
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 10:02=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
>
> When we fail to look up the control name in snd_soc_limit_volume() we don=
't
> log anything, the error code isn't particularly descriptive and checking
> the return value of the function at all is a bit erratic among the caller=
s.
> Since there is no reason why anyone should ever be attempting to limit th=
e
> volume of a nonexistant control add a log message in the core to improve
> usability.

Can confirm this works as expected for the case we discussed
previously. With this I get:

[   19.585906] snd-x1e80100 sound: Volume limit for unknown control
'WSA_RX0 Digital Volume'
[   19.585909] snd-x1e80100 sound: Volume limit for unknown control
'WSA_RX1 Digital Volume'

One thing I'd be worried about though is the number of false positives
this might generate.
The x1e80100 patch we discussed previously handles a  2-speaker and a
4-speaker configuration
by unconditionally adding limits for all of them. Previously the
missing ones didn't really matter with
this they also print warnings.

>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/soc-ops.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/sound/soc/soc-ops.c b/sound/soc/soc-ops.c
> index f966d4e13c7f..94e28fc780a5 100644
> --- a/sound/soc/soc-ops.c
> +++ b/sound/soc/soc-ops.c
> @@ -503,6 +503,9 @@ int snd_soc_limit_volume(struct snd_soc_card *card, c=
onst char *name, int max)
>                         mc->platform_max =3D max;
>                         ret =3D snd_soc_clip_to_platform_max(kctl);
>                 }
> +       } else {
> +               dev_warn(card->dev, "Volume limit for unknown control '%s=
'\n",
> +                        name);
>         }
>
>         return ret;
>
> ---
> base-commit: 028ef9c96e96197026887c0f092424679298aae8
> change-id: 20260421-asoc-limit-volume-error-ca28188dc7c9
>
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
>
