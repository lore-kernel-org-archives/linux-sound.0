Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F280A314D13
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 04:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791865122; cv=pass; b=f5zKwru8akeGyEhmvgW3QfzkTNAN5M6HtmbChvegMiYj3zi9Ly5Teq3s0jWGW1IykUGcdLB7rk3v8Bn0ohrCUMvT7VPZU2pBv1Nz2vgbS3TS59g3KThRdyRLh93gU/zfyQ9lVKH6yn7wjDQqrXPEJK4WSx5a6CHzMGW/+eYAYYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791865122; c=relaxed/simple;
	bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ftBahvTLq5QCZ11RrMwlvP8JSkMeSvwu8b0pDc91Y6ACeL+49igD/mBS9yRg6niCmuMfj4BuhGZ6pVq2902sFBKENpafVas+uRjjp6FLZOb0lNT6QkBIM8pPK6FnC1pCjdoqdYgTC4sjAVrayOL4FpnhHAr0huuvGJmfAGTTW2Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gAnGxwWW; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAnGxwWW"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ccce6d9abfeso1377208a12.1
        for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 21:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791865120; cv=none;
        d=google.com; s=arc-20260327;
        b=HEoW9AsC9xzKJA2/NCeKNcJce/DvS18OWIXq/MtFmMW55isc5EaCz5lul7hTcrJveI
         q9ftFJ/3es9tKLN5Jn55JFkvdU1s5bSn8Aws88rJa48hHY1l1BH4SSk1heFb4LeAg7pI
         7MkgdD01uoBaWFYo4nXZGJP/e5bMqfTPmFr0Be+F8sUukJnJU8ZFFUEmI5hzP3kYFPi4
         iroFFBwBGwL20PcwLR/r1XYFmf4L1LHaGnJ5CMPRQqN+v5sg8Fx0eegTjfdvAX5ZTtzJ
         srMJ4IJB2MZUloZKegExYf0g+YSLJRl8OWcjgrMX9h3YrLIKtxM+JkjkluVS2KA8tRr1
         3G3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        fh=4KY/GzYrI6Moo2JjNFMT9Nt3cSiI4RpvRS/aYtKOAMA=;
        b=qdrQhwGmUk198dab4psbemzsBYDWzbR7/hz+sYoqMRhVJUKnkPI9VeqXwJae+MrPI1
         3UyfxAqDefA8cBFmk5cMVpnsB6IjNF/Rs30osyGybQZedZim6lfzBoH6mqoUeKbe26I6
         /5YjGolw+BphG0A+2GEwiLreJC/ZHg1cAWUxA1hz6OFxhkuuLoOPNGrnFW/OWsOsDhYZ
         KKL+w+mP7f1mKtHFJSMdSXz1rrCrtJEqiakR9rUt4vDY7txQaLVPtfFLO10nEFcbSLiZ
         MPZtH6i/s1cApzT3HdUHHyHDHAxpQNZaXubBnsheiod6ChSMuKPw4/FfsbzV/YkXDpC9
         yJ8g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791865120; x=1792469920; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        b=gAnGxwWW1NaLFGFjjBnWuN9tTcCkvKmMsKgTYp6veCaJKVQsFq8Bo4JlG/FVhatgGp
         2e2cIiPAGB6Qb/MIIA3ZWwBoAGg/ZeVaucb08SaLqLszvh52QBG5vD087h18Dvxm6SJ8
         +R+HNrAiUOKoQwJSAZtrGhhXqcvbBNJiia+Fzy47GLEXCwTJ11PkKAv850DxYnirs6tv
         qsbdxYjd83MqOKRm5qRCwUMGQRmoJkaDp8HRpK/PSW7Y061ASPNTrzWLdH/0PLAfDyab
         PY+ujhonpKwMOnSGLXKjMfMxvpLtjbXyoi3BoRIKNtCojJtFG1FJI5uNdCebMM/aYgH9
         WR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791865120; x=1792469920;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RXTMOQ3s/A/fpHZbZ7Z1yCnaHYebzC4eV4sd40V0Aoc=;
        b=QT5xI0xxVLdb2eFrKtsgJRAkXUlEpXKxDv2Q1P6AlvAP0UYQo1NIPtMdgBoGIJlZwX
         yw69Vo0D1jIxscu4+yKYlWaHGAsDbgWQYGzMhMBAgndfQcsL4/RWCh0OJJ691LBUX2dv
         oRkK4NhrpMjb/xV5shl1bfDwDq+FdZorN3lb+izCap4ziWpihE1jBjiJXlQOEQipqWdU
         EnCMe/4LCkhGUWb+CCgWcIw8Ss4RQrOSaKCLOzIq6W2qSO3me8u5jklJJZhu8D70G6Qq
         pvCaOUlAOM5yKJu6R3F9Q+HK02jLeOTpYSQgmR7z8oy20xuZ/Uw6ePZ3i3JNGKsnhhs6
         w6PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwCBJOvBPFoEOwIR/kwLICgZ23B+B6a/LxlnZGatBwrGcPZEBH9k/FtFRgLosS1Z1E/JqJ3k6lT++RrGA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKitw4V4PD0PIIJOgprRJSlkjn/iuMaSSkhFgUxeci53oAwZ7HW
	yRuN2UrciMh9D8SK/fFgxlEktuDR9wzjLcyp7SFGPS+VlQEr3ezXd/d7jc9xLElCAC9jTDcgO1o
	ad/xXcmDvbkezhojCyEk8QIesQNOHxgY=
X-Gm-Gg: AYBFou1RUjLRxtBi4d2/k6fkQG3zX0uAwkhWE9DLXpHyg2s/bHF2sOwWUtFoGE0cAsy
	q7+IY3yTxnM2/RK3fugX6gO9iR5PDnvoTrF3RK8mRSxXhJuEPTdEoQZYSyYbhXYwrj1c9suVUAA
	sjhjFkZdFo5z0Q8ovYtcDsd6lnAamxGDpzu3PZtanX8FjNGmTYxQ9ISkf5oH8qq/eBat8lFgTYL
	Io2ByabLNzQH+rbNh/qMvMxlZQvGwlXRJ6v+q3OFDMuPBITWewpbah4f7OCnpZ9NO3NY2eoJKr2
	Wb+P7vbsVeYhjonE2JXI3fIbMIIRJUtg570zzgjmvoostnhLgdotLNP9SqBhGYn7TNYAxDSduiP
	hdTAnWvFH2PlkPfAo52UbhGr+bsw0l28N7HjQk0Re1oLHaPTVnrxQ+ibuOK18AnJy+ls=
X-Received: by 2002:a05:6a21:4eab:b0:3e0:de06:126b with SMTP id
 adf61e73a8af0-3e16beff287mr10686193637.66.1791865120247; Mon, 12 Oct 2026
 21:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 13 Oct 2026 11:18:28 +0700
X-Gm-Features: AclHuK8E-95w9dmy_Nn8Ii2RGxOq8D0J-l4YT38o4WK2kAtoUqqhMqA48tZbgYk
Message-ID: <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrei Simion <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Heiko Stuebner <heiko@sntech.de>, 
	Kees Cook <kees@kernel.org>, Syed Saba Kareem <syed.sabakareem@amd.com>, 
	wangdicheng <wangdicheng@kylinos.cn>, Chris Bainbridge <chris.bainbridge@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Neo Chang <YLCHANG2@nuvoton.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, u.kleine-koenig@baylibre.com, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Hemanth Selam <hemanth.selam@gmail.com>, 
	Md Shofiqul Islam <shofiqtest@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Zain Aboobacker <zainaboobacker33@gmail.com>, Sang-Heon Jeon <ekffu200098@gmail.com>, 
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, 
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, Bo Shen <voice.shen@atmel.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Morimoto-san,

Thank you for your review.

>
> If so,

Although I don't have MSIOF hardware, I tested this on FSI hardware.

I added a .close() callback to fsi_soc_component and forced fsi_dai_startup()
to fail to trigger rollback in __soc_pcm_open().

When fsi_pcm_open() returned 1 from snd_pcm_hw_constraint_integer(),
 the .close() callback was skipped during rollback.
When it returned 0, the callback was called as expected.

>we would like to have such comment to indicate such background,
> because it is not intuitive for people.
> Otherwise, someone (maybe me :) will return to the original code.
>

I'll add a comment to explain why the return value must be normalized to 0
in the affected drivers.

For MSIOF, I noticed that snd_dmaengine_pcm_open() already calls
snd_pcm_hw_constraint_integer() for SNDRV_PCM_HW_PARAM_PERIODS,
so the call in msiof_open() seems redundant.

Since the first call succeeds, the second call should return 0.
Would removing the redundant call be acceptable?

Best regards,
Phuc
