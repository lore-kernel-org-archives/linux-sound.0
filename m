Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530841373
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 03:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749525401; cv=none; b=lJ2vyth9L9m8R8hPGTe1Gv8OC9ybN4zTa2fvSwVQTyu4Kd/Co2amlzeWI5J6gPP/Cpsw+6R/YRdaL2DnuHem0gM8Hz1Z3lYzLQjXDhA0aaVWAAdCa74ixpYlHUqohGRzn+UFPD260t8V8grYYmQOS1Lx0Ku5E/V4CMpefBkJpXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749525401; c=relaxed/simple;
	bh=TMIRx2QTzmiyHVz8igUZYet2ekW7a2j1tirh5YHH5Ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=auIWGlY7C7fSF4L7uYa1WuqMseUtyyPr7MFRBRQv1q6UZTuItOD9dvZDizwQzqe0TroCU76h/jYqdWfd9OjTj8db1vkWIRryE2OUeSN9fd1GTxONWq5T3YBhMN4wqS0midTSh1ijsLBiNgX5O7QqACEf9uzzHfVAocEqXaX5sVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5533303070cso5201880e87.2
        for <linux-sound@vger.kernel.org>; Mon, 09 Jun 2025 20:16:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749525396; x=1750130196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hQ9SJPQEkMqYrrEp1IuigVUEb/GE39wenMQdwgqygXk=;
        b=nYxvMCkyNqy8kQtaVFhOEVu3rFWx6nyTSEbuaDPptGJ3AnFCmI/r11pWTVljSUzCgH
         jf6Hk9A7uwjgP9lLv+nvoqaNFn4Om2ohTAKvDP3Yt2eceVKlRqJXAK5sMKebnOzSjB55
         OsX5JGrgUL/YppZ0uPxSKkzUxuOTY1SWQU5Fj3sCAlHS6CXui7LMEf/V1h2xFip9FsXK
         YUUe5hG9Ya2ScszRZQzny7RzxpwY2WKzXnqmFVLszV16XvDj15ON+xmJ3oBnTg2jqKFh
         rUMY0Kv+PqrqeXo6z+F/hjCBY3psSFY1GgMmR4t/vZZ5iBo05GEO7iDmHS5KYI7n+52u
         SDVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJyXUp4CrBw4zR72o7kpdFctAIrRgNzhw6d6s/etFMJL5WMS1nC+1yBH2ZLiSAKSD2k8jiHR6JARgKoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4R2rzEV/kWY5lLpFwEk/vc/aTyyCp9aC2pKAK5qhvdY8ngMXQ
	79pUXxSO76e+UTmVfDc7MoV2Msuk2hSIGYQUT/fU68gGGY+iUG6pfW0OS41/S5R8
X-Gm-Gg: ASbGncv0FpZAIydMpl4jbAI2zUE42oNzKzhq3g3yLYECiL3kYCsCr6N1tp8iwANI19Y
	NUdefLRLCotT6SNLTCX/ueLXwt61WNDloneGQwzkd9GHoOiHwHz5XcP5EriFTce3SBvVxdE9R+K
	mH4oI+8Pby1qGEU1S4r/7+ugqd2CePBH8sPhusBvOIVwkhHJHMwfJ5Aok1pbjlwBJdQgRzyEsWp
	3JwCPAJr+QLHLOA6PsHO8ijX65hwXpR8q6uLXimp0St9CLTyorRl7Dc+ewwmYn80KvlGm9Vwvbl
	UjIVUNSgVCZNCd813VpJ9L/fiWYvE6mSxi7LWg4kSjhcIu/AMxsQ9n0JHvjTINwmWEGicWmKXKo
	0plj3teqZ8ebeSOq+118=
X-Google-Smtp-Source: AGHT+IGintWIh3TryTwhxiSeuViHs3i+dAG1sUJqKCyqXEBqsAe4ziQpOHbMIo9TKIMlDMrnnuQftw==
X-Received: by 2002:a05:6512:3c97:b0:553:2e99:c20 with SMTP id 2adb3069b0e04-55366bfd4b4mr3878366e87.34.1749525395233;
        Mon, 09 Jun 2025 20:16:35 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772a7aasm1380169e87.160.2025.06.09.20.16.35
        for <linux-sound@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 20:16:35 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32a806ef504so39002191fa.3
        for <linux-sound@vger.kernel.org>; Mon, 09 Jun 2025 20:16:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVktmcpQRLZB7C5hJbd0JzXT513+mkIv5l4wFScD9Ixf3zUJUwmZOIY8go+RpeCd4ythBsc0OQisd9uzA==@vger.kernel.org
X-Received: by 2002:a2e:b896:0:b0:32a:83b4:c13f with SMTP id
 38308e7fff4ca-32ae70d53d8mr34293471fa.9.1749525394835; Mon, 09 Jun 2025
 20:16:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 10 Jun 2025 11:16:22 +0800
X-Gmail-Original-Message-ID: <CAGb2v66xb9duevXtZf=YcUM8WvoopG76_yud8PHXOnYD+i=kQQ@mail.gmail.com>
X-Gm-Features: AX0GCFvFy6lJddOBkz-QwMTYnDXFAYMDGwENiPQTxBKMy1haXyjsyxTUi6K6TvI
Message-ID: <CAGb2v66xb9duevXtZf=YcUM8WvoopG76_yud8PHXOnYD+i=kQQ@mail.gmail.com>
Subject: Re: [PATCH 00/37] ASoC: Standardize ASoC menu
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Dropped non ALSA / ASoC maintainers from CC)

On Tue, Jun 10, 2025 at 8:44=E2=80=AFAM Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
>
>
> Hi Mark
>
> Current Kconfig menu at [ALSA for SoC audio support] has no rules.
> So, some venders are using menu style, some venders are listed each drive=
rs
> on top page, etc. It is difficult to find target vender and/or drivers
> because it is very random.
>
> Let's standardize ASoC menu, like below
>
>         ASoC support for Analog Devices  --->
>         ASoC support for AMD  --->
>         ASoC support for Apple  --->
>         ASoC support for Atmel  --->
>         ASoC support for Au1x  ----
>         ASoC support for Broadcom  --->
>         ASoC support for Cirrus  --->
>         ASoC support for DesignWare  --->
>         ASoC support for Freescale  --->
>         ASoC support for Google  --->
>         ASoC support for Hisilicon  --->
>         ...

It seems only this cover letter made it to the mailing lists. None
of the actual patches are there.


ChenYu

> Kuninori Morimoto (37):
>   ASoC: ti: Standardize ASoC menu
>   ASoC: adi: Standardize ASoC menu
>   ASoC: amd: Standardize ASoC menu
>   ASoC: bcm: Standardize ASoC menu
>   ASoC: dwc: Standardize ASoC menu
>   ASoC: fsl: Standardize ASoC menu
>   ASoC: img: Standardize ASoC menu
>   ASoC: mxs: Standardize ASoC menu
>   ASoC: pxa: Standardize ASoC menu
>   ASoC: sof: Standardize ASoC menu
>   ASoC: sti: Standardize ASoC menu
>   ASoC: stm: Standardize ASoC menu
>   ASoC: au1x: Standardize ASoC menu
>   ASoC: sdca: Standardize ASoC menu
>   ASoC: sprd: Standardize ASoC menu
>   ASoC: apple: Standardize ASoC menu
>   ASoC: atmel: Standardize ASoC menu
>   ASoC: intel: Standardize ASoC menu
>   ASoC: spear: Standardize ASoC menu
>   ASoC: sunxi: Standardize ASoC menu
>   ASoC: tegra: Standardize ASoC menu
>   ASoC: ux500: Standardize ASoC menu
>   ASoC: cirrus: Standardize ASoC menu
>   ASoC: google: Standardize ASoC menu
>   ASoC: jz4740: Standardize ASoC menu
>   ASoC: xilinx: Standardize ASoC menu
>   ASoC: xtensa: Standardize ASoC menu
>   ASoC: renesas: Standardize ASoC menu
>   ASoC: generic: Standardize ASoC menu
>   ASoC: kirkwood: Standardize ASoC menu
>   ASoC: loongson: Standardize ASoC menu
>   ASoC: mediatek: Standardize ASoC menu
>   ASoC: rockchip: Standardize ASoC menu
>   ASoC: starfive: Standardize ASoC menu
>   ASoC: uniphier: Standardize ASoC menu
>   ASoC: hisilicon: Standardize ASoC menu
>   ASoC: sdw_utils: Standardize ASoC menu
>
>  sound/soc/Kconfig           |  7 ++-----
>  sound/soc/adi/Kconfig       |  9 +++------
>  sound/soc/amd/Kconfig       |  3 +++
>  sound/soc/apple/Kconfig     |  4 ++++
>  sound/soc/atmel/Kconfig     | 11 ++---------
>  sound/soc/au1x/Kconfig      |  4 ++++
>  sound/soc/bcm/Kconfig       |  4 ++++
>  sound/soc/cirrus/Kconfig    |  3 +++
>  sound/soc/dwc/Kconfig       |  3 +++
>  sound/soc/fsl/Kconfig       |  2 +-
>  sound/soc/generic/Kconfig   |  4 ++++
>  sound/soc/google/Kconfig    |  3 +++
>  sound/soc/hisilicon/Kconfig |  4 ++++
>  sound/soc/img/Kconfig       | 13 +++----------
>  sound/soc/intel/Kconfig     |  4 ++++
>  sound/soc/jz4740/Kconfig    |  4 ++++
>  sound/soc/kirkwood/Kconfig  |  3 +++
>  sound/soc/loongson/Kconfig  |  2 +-
>  sound/soc/mediatek/Kconfig  |  4 ++++
>  sound/soc/mxs/Kconfig       |  2 +-
>  sound/soc/pxa/Kconfig       |  4 ++++
>  sound/soc/renesas/Kconfig   |  2 +-
>  sound/soc/rockchip/Kconfig  | 23 ++++++++---------------
>  sound/soc/sdca/Kconfig      |  3 +++
>  sound/soc/sdw_utils/Kconfig |  4 ++++
>  sound/soc/sof/Kconfig       |  2 +-
>  sound/soc/spear/Kconfig     |  4 ++++
>  sound/soc/sprd/Kconfig      |  4 ++++
>  sound/soc/starfive/Kconfig  | 12 ++++--------
>  sound/soc/sti/Kconfig       |  2 +-
>  sound/soc/stm/Kconfig       |  2 +-
>  sound/soc/sunxi/Kconfig     |  2 +-
>  sound/soc/tegra/Kconfig     |  4 ++++
>  sound/soc/ti/Kconfig        |  2 +-
>  sound/soc/uniphier/Kconfig  | 14 +++-----------
>  sound/soc/ux500/Kconfig     |  2 +-
>  sound/soc/xilinx/Kconfig    |  4 ++++
>  sound/soc/xtensa/Kconfig    |  4 ++++
>  38 files changed, 113 insertions(+), 74 deletions(-)
>
> --
> 2.43.0
>
