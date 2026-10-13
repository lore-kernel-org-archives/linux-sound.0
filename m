Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1CF1F91F6
	for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886373; cv=pass; b=OSa1eGosnrSsGZ/XwnHwK+NkNgDhyvmxcacdO11lzhDXNt3mQAomYLpKg0k4V8sEUd4htX9FHfVFbRlZgbdFzrJtp5OBt55BU0vtlK4iFJO/mResuDplvkzV8/tQNXaxIpPkfKzHAza2aFpk/9zoUGEhW9nCj06rQ8/fpV7J/Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886373; c=relaxed/simple;
	bh=oYpuymV3tgk09qaaDkKOhd9dg2Zp4VCoofN6vnpJl7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tenxQSjPzYr0VagwkF+fdUVgbdClEe6LHSy7QVqvFhVXzfxs1FjsYPMLZ3oVBbX42hHNHepEt5iwHIzWG8ASFQsDRVIlbvLAq6QDYd53WrCxzGDo7RCdGDfhO2grw9QoNVk6aXuhldT2OTwRPsNXBa5nLCBgEp6VA1Cai5tdKlU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mud9Rva/; arc=pass smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mud9Rva/"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1170412a12.3
        for <linux-sound@vger.kernel.org>; Tue, 13 Oct 2026 03:12:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791886372; cv=none;
        d=google.com; s=arc-20260327;
        b=WyI1/1F6NH0peZ3S36Mr+tRKI40Y7nEIGQA90oRmLh96sxuJfayXfM8m4XuOYGk627
         xMzDsb5GWFh9lEIZylyjaFNmJfOXe7lUsfv5OFigNQ0s1AdJdHoennlumt5MnPd3d+tz
         zoU+FC8/k10LDbOcF2+6oTn5YPyczbo1BqWGYxJ4h5U/O6+9+znXP0qGqMDFQFYiUkNS
         Rnu2DcObURe4gFNlkGLOSX98p8K95k8LIXo9ggqRVzpsqBdAJNSWUrh/nSBkrTUdPYSo
         u/mhQcMz/NgRdkC0Nb/3I54NnBqrXCHkFLhmtWZq99dhRyxoUYDxQvVJxm+ajEasL6yU
         SzPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=oYpuymV3tgk09qaaDkKOhd9dg2Zp4VCoofN6vnpJl7A=;
        fh=0inOPCq64uMq1CotFG+Mfb7kzcGu7b2Ov1vs7rrp27M=;
        b=OHwre+nEh7OGk1EXoCV33meC0rIxJY99OALtsDJJTNCSzNmtiHyuNvPy+ykyH/9kPE
         BDEnMXZy1Ad1tAYJhi2CzTbo47QSZLg75mxEdghcadlfksVJapYFsNNoifVmw9VDXpAA
         +FOOAHJudwqNZNtZ1hEk69Pm2YT5WZxpkaMmf1Y/3Tb6flSAau+Jfkb2geb5GZl3SvXL
         4Nrv7et0IAC48TxX2n9MpNiWVkt1h2g/wZ1Oxb1iiRFqxByJnomrKJseXVskPVn2FvhE
         uzvAxPlfxEazl4V6HXNwj5Q0WFJwuz5ZpRVq2vtDngpgKpn/2ERlPF3ocbU6+0tUNWFJ
         jQ1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791886372; x=1792491172; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oYpuymV3tgk09qaaDkKOhd9dg2Zp4VCoofN6vnpJl7A=;
        b=Mud9Rva/LeFOnCDUIiPjQjYUmvHzEcsos0QGhI9WPySVqDhj55WYp3CBIAwIMT3wu8
         BxAgAi2Npnb6ADK75WkHPfYilGiZdZxXO+G73cim6wmjKUFEdskTCbMYSD34GXpm5SAN
         mQG0vwhMmUXSXcEPSgdLeO2iPPbdL70aUwzWj/fwSw6DbzB1v4ADzDkfkCdTDZYJQydR
         BrRHp48uDD3uCH45AcsVXKfCVbr2QBrxzpBfiKy6z+mVzcD/irRXIYh+IR+4jv5qnlYp
         laOfSmBrQPU2WDs2vLkw10SE9eH4rWbv8dd3VZu0OSzditr6UqsMCBepCaX0ZNYeiRDU
         CAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886372; x=1792491172;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oYpuymV3tgk09qaaDkKOhd9dg2Zp4VCoofN6vnpJl7A=;
        b=JZqGfg+3S/dpAt+IQi9M4SNQ6oOcYBXUKYLmrtDJdkaSG8SEVPGFhDIwUBVIC81JF5
         whBUI9O5LsxexSv07g9GUutkTKQdqWYVkq/ltEUAb9XDWhYuZvg//az7kjMJ/CB9KeBp
         sXmDn/6DNRM0T9IYAKX9iIBYDi1RU+emU8xVLHARVWKIsWDdoLbgcuA7zb3IjU5Vq8at
         JHaZWoBYK4WSNwMO9E8JeZM0Rd2Mr5H3l1tlUj7PXtzXlUG8jRcJuXAOEVu0fZ8DuC7r
         TpkAPGd2cSoceyFrU7gLeAOqxCMhpBuT/qO/KljDppGb+kAQEB7E55xFXtXCdgeeGN0a
         n0yg==
X-Forwarded-Encrypted: i=1; AKwUvBy+9jxihSM8CjGGscdo6RyNAT0Rki/VWDmM4946O/urfML4EWuFwRl5V2lGlTnhrLAGITz81Ifvnlpl+w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2MtUsgPAoOcbiXhwKI3PMvfaA9xLWLhvT26UXub9Zu4mBsK24
	QjQZ7TNrh2cyat92u2/X/z6BZMct17e4mDSEva4NFxZZ/K5JifIj0NXVJP8pcWyP0xZwR4uugOX
	AYCuOU2FjImI5ZbJECxJXL2Fi0HtpCf8=
X-Gm-Gg: AYBFou2iPpu0JSLRR75XrgaT6VZbU+1O4Y36l6VqfK8dPhihElD9xHelwbHIx6P0V+l
	HJQ1J0vBQdirrdewKHSOylsWgGk3Qrp3iM7mFuEG+9bbssBgtdHkZutSxymB/qCPPpVG5B/J21u
	WovVIryw6WrwwtlvW5Sk+75Wvwx5gX0KY4dO3H3oo8Iws5vh93mGFvAZ6KZ8n7bYf26czLJGTrD
	6p2zUxCjU9BfZNxlbgx1iaMHfiXuzAm8c8RoNVIl0rze+mqr4WO9uI0fKoLBPRBBt+6W7JxJS8r
	2H31uG2IyLkMSMkDun6fYN+KFlkzV577IKkyYwJFNYeGy3s99BhUeirLNexM/kSYRZQvIJ5scRJ
	rJeRCns3CcOWrHAqk/kfMWq5Avgiha6uFbzNbnhUYdLwnSbBuzTJww8uuZGJQtvhgP4Q=
X-Received: by 2002:a05:6300:6bc8:10b0:3e1:9071:acb1 with SMTP id
 adf61e73a8af0-3e19071d79emr3692539637.89.1791886371799; Tue, 13 Oct 2026
 03:12:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com> <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 13 Oct 2026 17:12:40 +0700
X-Gm-Features: AclHuK9ysK1Jav05byu2z6c82z-Prt9juV9RV67s1OGQmeMH_qLrceJ2TQNxX6U
Message-ID: <CAABR9nG-YJZEdj6pVD-gbGU6J2EfRMQYsKd7u0UTgfrWOyAPXA@mail.gmail.com>
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

Thank you for your confirmation.

> > For MSIOF, I noticed that snd_dmaengine_pcm_open() already calls
> > snd_pcm_hw_constraint_integer() for SNDRV_PCM_HW_PARAM_PERIODS,
> > so the call in msiof_open() seems redundant.
> >
> > Since the first call succeeds, the second call should return 0.
> > Would removing the redundant call be acceptable?
>
> Nice cache, yes please.
>

For rz-ssi: in DMA mode, the driver registers the generic dmaengine
PCM component, whose .open callback already applies the integer
PERIODS constraint via snd_dmaengine_pcm_open().

Could we drop rz_ssi_pcm_open_dma() instead, and keep the return
value fix only for rz_ssi_pcm_open_pio()?

Best regards,
Phuc
