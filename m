Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A787D13CF82
	for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 01:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792028385; cv=pass; b=gdgrk5VCAIyMzurtLDErgnVaU7CcD0WjS+rkEpG3QLs4V2JCy5cBdq1uMQKsHTj02+ML2JI5YT9azg8RNosFKdoGWjBPTrmHfv7/szC1OAzL3D5YpcBE6O4pQzSYLcdPGG9WkFZfHdaeL1LONTjE1APDRAvUihP5FlJtJkFtVTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792028385; c=relaxed/simple;
	bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQaptMtqmpCjlXWkGcpE0a9bPrFcbMKkFvXmVXFNLpjlrDUObdQLo78KZSwsgYM3FsyIecXjlIaoPlWwQzLaf4Mxglj7ew92uC9TN07F54AGAzLsxzKZKSN/IY8Hs45Op7p6LwCeEBDWaOC5nkKjDzDdQHWG56Cp2sHTZB0p4Hs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i1n/68Qs; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i1n/68Qs"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cd6028ff33fso1918039a12.0
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 18:39:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792028383; cv=none;
        d=google.com; s=arc-20260327;
        b=aEe5ZbiDqGtvOHTUDkOLHzJo1tf/0ewltUgfcVitThNxfe5DZ5UjzyGpDN54smgKZH
         OXUUn1RMKMGHS7+rB8uEBf4Osfae5JXJ9rItxiMnIpoTB/DpgB32VSm1ShndozoU95KG
         0MaTghNhjl6seEagofOYqA3EKRmfEGvsgpNO/+8nhhvKPlLD3rbLQ79qdy2fjtakQmLc
         mzhO9rqjJSrRBHxPkj4g6zyUschFvtgSy6gm9VcTVcW4hrmUrT0I6SPW64Sdn2rdygRA
         1175e/Mf/lKcXcDW1op7pipKSRXy1zZU6nFhT2NNz/RDNbo3N20Q2GVvbtPlpAIEarBl
         8HRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        fh=Qw4n2klS0ZsgKCp0ryoddA9QzPuXrT76aZO8T0dTGrY=;
        b=PzTvChJBtnT6Rye80pKGMP90M/d1LpURTqkO69OFX/kro1EhLNZgYC+Z6VPN6y7bWH
         CwKoSAd1lc2OwOXbXI8bGYgfwgwp3LG4iW+DNG4yGDlcLTlMOQcU3JTshmuY9OCrGyzv
         YhSnzw3FlAX+u3nslThh22cSGVHbxp1MN/R78Vjnq5H4m+bDhswIOM6spfLAxniXgJjZ
         wYcGlxCuo6+t2dm8gC0zPQ32Y7Gsoru10lHUGF1gVBfDZ3UpKqsAb6ENh9cHfdAJ71IH
         +EMKUTM4BL62CVsdA+3FAL7xs0IG6jzxpolZ09KmuTqWiBhjAW+C5DwS09C/hwlmf3ph
         vD/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792028383; x=1792633183; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        b=i1n/68QsX5mSayOSTyq612muWvig38beYybjN53xxBowSpgKghyZ6wLe5SrKRhhFLN
         z7VEKfLPkGfG2/zX+ux25IZEL7f9Xi3dx+zNQtEhna+Fld8jir/Y0appgbtwM9AhTyTn
         cFtf5G0MM3ZtF2rOfVXOL9T4tCmaBtLml2ExD+NrV2AsIUd0uiADbe6TMwAseyl0fs0l
         ME3EELltZr+tcP01gHbOPNZmdvrjYY17UkYzSdaZZcxx08jvN5RXef9ZV5nyBLR7zKsL
         a0OiB70a0Z73i6ukXnGBCyjqZIjM66xUfkL5i1e5QHQSTD2ujy256iZQHFetz10tWtyS
         hxyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792028383; x=1792633183;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7UAKkSVFiLjeCKqwwiBA8/TCsyeb/yPhvR9ZVVpCVjM=;
        b=V+Xm7d0E4bQnD8FEb/DSQBUv3fRb81ArkdB8Y43qqPmkKXRPDjOUxFG5EuE2+h4X21
         1wAZYfRm/wQL7IJ8Q+5MWsBIRh/GJzJZDd2qcsRTtKEuuIl2+oh72G6ChV3yAp+Gfh9e
         t5S8MmbuBX6BDH/RrACoHzGGWwzo8YHU1kFzLiLExlps5WBmXWBz8ASJ99+F6JiIRjBg
         9bgHlFWfCoMEptAUEkK76L9PaPbN6nU6FsehNxFyzw6Ay1OjB+30EyUfRodAkievdHzE
         5qaOdtW5N1XbTdbeq1rGz+bfrVmraqtBw8+QK8VYO6ovqc63QbxieQF3Lzdj4TOoAt/V
         7v8Q==
X-Forwarded-Encrypted: i=1; AKwUvBx9dcMiMmZoc+Eb2+ozydnJzkjyRnLqq0lPD/W+1lDCPjlwrPAsnfZUYgEEmp4MGzaLAKo8osZ7RPbBaw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZ0Azcb3K8hsd2UrbpkE8c/Ek9H5i0/YRKf0a4vU1IDemgWeOE
	HBWN9Q7YXVgbTNmAez89bx02QVs27BQE+O11/ICezQ5f4qf7V1ykcpJxbkKDptH+DOEOfLrqePN
	PaetPrnaSIHuCCaHp1B20VcvA8CnKmxY=
X-Gm-Gg: AYBFou0Ow2tXRmdsFe9th/ytjeYV6vIMmqgrm9k4lHQ3hTvFxSgo1KsbKTiiRajS0EV
	7g2X31ip55f7CFBTMF+Gmpym4o17S/9sObB+1F6beZEDGeIkXajR7s8MF2KZxa/Hl8EjGe73kec
	0zdmPv7loetRItG+QH0WwdTSiyDfo7LAZ125YbSe5uHurUNmyMPsAwwWQJufqmLJG6qVeXnQXey
	Buxb8CtuPumvv0DmGD8Y03/ymqt7dcJ7TRNSgdwlZ2hDzUz+GEcVsLKenwVsmlYkPcIYNN9T2qg
	6fDlgv28VQqbj2EYYiWRdq1dowRFQFg0a7kGp6kgTuc07dHzy5e29544F18u/qGHVUAPrIgaGWL
	PiDqrtz8iHFg0VMrvZhpP39Na25+aE75nWlO1TdWZpthp6ksSCQtv/lk9tDtK+YIZgQs=
X-Received: by 2002:a17:90b:4acc:b0:3a0:e1f7:9b04 with SMTP id
 98e67ed59e1d1-3ab3a60ac9amr16312045a91.12.1792028382966; Wed, 14 Oct 2026
 18:39:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-22-phucduc.bui@gmail.com> <87o6cyxyau.wl-kuninori.morimoto.gx@renesas.com>
 <CAABR9nHvCfabGfBu85bm1r=hP3b0ZiCsgZfShhOv3gNUfjjhGg@mail.gmail.com>
 <87se2aw3ot.wl-kuninori.morimoto.gx@renesas.com> <CAABR9nG-YJZEdj6pVD-gbGU6J2EfRMQYsKd7u0UTgfrWOyAPXA@mail.gmail.com>
 <87qzhtyxw6.wl-kuninori.morimoto.gx@renesas.com> <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
In-Reply-To: <3a6759c7-84bc-46ff-93f1-965c7e8dd4d0@tuxon.dev>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 15 Oct 2026 08:39:29 +0700
X-Gm-Features: AclHuK8C1u90VDPCucQhY3afyuLfcxP0SCIJrlA3M2hLxVwcjMsqinLCGr2nhSI
Message-ID: <CAABR9nFA5p=5hnMoxFHLtmGEj4kvfrN6M6UFPnm9hRQv_CAP6Q@mail.gmail.com>
Subject: Re: [PATCH 21/24] ASoC: renesas: msiof: Fix msiof_close() being
 skipped on rollback
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Andrei Simion <andrei.simion@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
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

Hi Claudiu, Morimoto-san,

> >
> >> For rz-ssi: in DMA mode, the driver registers the generic dmaengine
> >> PCM component, whose .open callback already applies the integer
> >> PERIODS constraint via snd_dmaengine_pcm_open().
> >>
> >> Could we drop rz_ssi_pcm_open_dma() instead, and keep the return
> >> value fix only for rz_ssi_pcm_open_pio()?
> >
> > It seems fine, but I don't know detail of rz-ssi.
> > Claudiu, what do you think ?
>
> That should work. I'll test v2 once it's out.
>

Thanks for your help and feedback. I'll send v2 now.

Best regards,
Phuc
