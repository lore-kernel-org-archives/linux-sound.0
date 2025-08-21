Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F682E0407
	for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 11:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755777400; cv=none; b=buvXMtsNX/q4FsEBVRgrArcu5q9EmW8wObCMJYCXds8F2JWExPh9jhIYPP/Y1tzSE58Y4C1X6eyDTl4Jb0h+GYa1ytCv2fYDrESPqM0Fvfen4YrD8140N1yqFuZEESlbcid1YPFwcwCdXhyEt5VltypAgLJd/s7sxQUcXGghNmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755777400; c=relaxed/simple;
	bh=uf6vS3Gl2AuJ7xqaJiaRJedxS56Xesptizd08sfMens=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usc8p9XtumkvzduJsqLUvNsEPEBvpLC2F3fgR0F3M6YJTBtX2bFIz1jXn/h56DqaFpOT3V3DO+g3Eu3O5CyCxLd2BPDad/V2tFWDrpZJY14E9YCiKgg/QJkLUlTknV/WLgJAhMwXW7MBaJP3Cbavw1divFpGxe3C2yCvoaSZxKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VM7mxTvl; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VM7mxTvl"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3354aef9829so3371151fa.0
        for <linux-sound@vger.kernel.org>; Thu, 21 Aug 2025 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755777395; x=1756382195; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NTRZmz9b45Hl2bTm1apFpY/NlVi3bfWcm6ULUt78zN4=;
        b=VM7mxTvljui9g3lu39TOLUk1ZV6pCMH8OG9CoturI99lwEeKkgCehLIJXnFI4/vOQc
         Xfv7eVzvCp7gInSOBUAbKzyCXFHGSOueTtC3cCcSR7wiAwxx2tGtLVVhGe/kiivOKwFp
         IQXHPxpy+J7zMIWq4oHb1H8j55i5msEMt2S8QlNV+wlIqPKD353nNI5w2rEqAAQ6olKV
         SDdC+kFjxAF46YbZJLE2f73+tl5D39nhSS/SUjUPFsFENoN6BuEwradO09gEt8+gTHUW
         euEgTAZc7VOvIBaJPDt6XMqfceDOhVrWPWLB8QEyrZvVj7LXb8plg7+C3LdG5v9SVrka
         bj6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777396; x=1756382196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NTRZmz9b45Hl2bTm1apFpY/NlVi3bfWcm6ULUt78zN4=;
        b=m9HRC3Z46S9gYOyII9Xad39013brMrri8bvOzSRwo7jxuhu3Bj38RAPM1cHybHGH2b
         WYjjlFXkWv/p3r2PhNff2a1OndvCiKbTm7Gpp5TNd+JsZ/42Fvo7l6jZDW2E9S9c5Upd
         A78bU6xaZHEp7daxivRufgVdcb6AD7c42/bmXgAdUMvZgMESF7vORWubTAua7PCpxwj7
         MWNjB9XkWPigS2P2rzLc/3sqOSZEsK814HTGI23RYt6QQMqnf6tnW+TtSV4BYhKCLhfQ
         lTmmaeyKOykkXYW/+T8ZOBAc0lTyCSxczSGeAf8Ux54F6H6GX8eMH7R1YbuSX8PkAM13
         4k7A==
X-Forwarded-Encrypted: i=1; AJvYcCVeZti2zwCHpIWn3YSaJqQkk/cLZgO2vGNXuvdQ7thnwMNnstV9CoIkiwkUnvMUdqEHav+a35wipaEKZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcz5S1cpE5y3iL/OGd5zgiHGwJ5GP2kHuuhe2A7kWAOHEbWnZA
	whqf2m87LHuhKFllYdPvNfyD+3WIBxOAcFQjHTXJmhK53SIJ1WguReeBc2g77o8RFJpveQQ7JnA
	GVVyAB35TKXq5fWr1rlBBdiX6Q2aPrMA8SJKFFuRtsw==
X-Gm-Gg: ASbGncsNnzaDVzPxM6Muu9cXJ0RSY9gAPOtexED8Dhgsb0cKDHfPGEDBhw/xalHh/YM
	5LwGLapXrkv22mN707lov933FD/quzLyqVP4HIYrvbEfEPAaM3VjO/nCye6DM1r15H0CNUAlMmF
	/YFgxF5BUgk5W03Z26A528lZBQU9l8Kc59AEIu2T3VtBX7AJZzLFsD5bnW2QY4n3JwwAQS6w/cB
	7J8fh8=
X-Google-Smtp-Source: AGHT+IHLNT7GNgIK+Yc1AUKtRsJ+Pu3qxvF99KQLgmBORucS0GzpXEZZoUCuuB+z9QVIQwaQ+MKKQAluSVZweFngFeU=
X-Received: by 2002:a05:651c:54a:b0:332:57b8:92eb with SMTP id
 38308e7fff4ca-33549e7e81dmr7293611fa.10.1755777395492; Thu, 21 Aug 2025
 04:56:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com> <20250820171302.324142-14-ariel.dalessandro@collabora.com>
In-Reply-To: <20250820171302.324142-14-ariel.dalessandro@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:56:24 +0200
X-Gm-Features: Ac12FXxjp4iK3cFyWU_S6p_GaEq9BIq8dd_UPbgZlXscJTvrfMnMiNgyqvjOGHs
Message-ID: <CACRpkdbpKqKyebADj0xPFq3g0biPh-vm4d6C3sd8r0URyfyYRg@mail.gmail.com>
Subject: Re: [PATCH v1 13/14] dt-bindings: input/touchscreen: Convert MELFAS
 MIP4 Touchscreen to YAML
To: "Ariel D'Alessandro" <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, 
	broonie@kernel.org, chunkuang.hu@kernel.org, ck.hu@mediatek.com, 
	conor+dt@kernel.org, davem@davemloft.net, dmitry.torokhov@gmail.com, 
	edumazet@google.com, flora.fu@mediatek.com, houlong.wei@mediatek.com, 
	jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, 
	kyrie.wu@mediatek.corp-partner.google.com, lgirdwood@gmail.com, 
	louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com, 
	matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com, 
	mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-sound@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ariel,

thanks for your patch!

On Wed, Aug 20, 2025 at 7:17=E2=80=AFPM Ariel D'Alessandro
<ariel.dalessandro@collabora.com> wrote:

> +  ce-gpios:
> +    description: GPIO connected to the CE (chip enable) pin of the chip
> +    maxItems: 1

Mention that this should always have the flag GPIO_ACTIVE_HIGH
as this is required by the hardware.

Unfortunately we have no YAML syntax for enforcing flags :/

With that fix:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
