Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66ED3345EDC
	for <linux-sound@vger.kernel.org>; Fri, 16 Oct 2026 01:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792115583; cv=pass; b=b4Qd2q1q6HumcB8pnYJdpC8JP2poj1wZOxYc38uiJiTRDN5GNMdqYANvasXPbViop++pzjzROlDpOgd4OOMaPBCU80LeLzalW7lW96bOWQSLtU48Hd5tbkK8PiD613yepv6RGr+DwOTr2syGSJXNZCvmc93ERJd2rMpKTMXXOnc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792115583; c=relaxed/simple;
	bh=Ia+9qnQFXuT7Qa703XqyFy/Lx1I20mduDC3TrKVaE04=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tkQ2kvSQNd30IGgcnW1r95gxOqZ75xRLcePxqOSdKatwA24Cnnnqcah9UzTDLyanXV7aJjCLPTEpxbxYyDGiuDfP3Y0gFvsLMuIdEtcRmhArsT/etPpcs9XSf7ZPGXJJSBWIjMaJzbvuwIr0hdS9BKWNLllIE2zP5YleyYHy2OI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Op0eyiit; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Op0eyiit"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e95b3b52f2so8016195ad.0
        for <linux-sound@vger.kernel.org>; Thu, 15 Oct 2026 18:53:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792115582; cv=none;
        d=google.com; s=arc-20260327;
        b=N5DIQr7AWU9exo1WS4mGT207wEycVFw/sxDkr/cGHUW5lZ0tLmRFEaZHd9QnwdCNHs
         H5SrNEsA05fIRb39udsjhagT4ehKDaH+SdMEC7y29yRCCo1LQKLjzTQAn3W8ux2PQoFH
         xPNLFD7Jr9+yOaDv9aL66b+k2YdNtA7BqmqlKLJt7AybEem9aWmMGrz2QrU+IG2iOGDg
         S2bdgwscREGVughfEnRoWqA7TKv5avh+fRDBw17p0P0ePTg6/JNH+M7n+L5Yfo1atpbn
         aMQqOInYIqWycxSDZ4ia9QJJjzxa7ch5SvPj2C7j9GPTDZe4ULBH38/4z4pEeTEXopWi
         RIuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        fh=QGg0YW47v4E5J0e94PssLRejjDCCxpY/QAvHh/Lu6hg=;
        b=gBPbMzYvPPBIbFItHeH6OHBnk8cBuzWl8X3jkq6LjLLbqDlC3q7FB8wbG8UYhoiiOq
         zT9DaVfYr+9K0E/uFdUvolOdsgDjJ+qIZsD/r+xbfcOZ8rUKulnTWPSpw0IHCDvwzSJs
         lZChge80ChiYqeA2u1GVMuENcR082YPUQAHEJMfFXbXopAqcvzhFZZ875NTJoKuzxQzH
         nNDUuNkb4zzbDuY6rjozMVZC6jygW1OLNjQOEvgPs2SkjfjLX8/7xiKHHC6PQOpg0yyl
         rrOU7FauhwelRpxzhiJgJnj9VQC7V2H1bn/UvbqKXTRVRX8d1kHyJJ0x96xKr//vHKc1
         //SQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792115582; x=1792720382; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        b=Op0eyiitNEQ9ES47jArbONvej3eRBF5KjtydwZxPxVl1mc+bOWWPhdC05xKTeFLMmz
         q99SeUeotiGXJ8mNibarU/ufZeGdSwlcRc46/KvgrJUTPnns6FJhMcnUi/mI8AUDS1c4
         7HHqvb97Td8c1ys25ubxhuq8k0LNuGKCrYp6lyV2KkdlRu1k961YEQHQ3rGiowy9n3J3
         yxfMN8tAlTxVfrjuU7vIpsM8AxMPL0+iJfGuhxGrNgYBjZR2K9IqKYbCa8d4Oh+Duz0d
         IuU+lz6A5Gasr8oJ1NZInlII5/H8q4exLKfSXBg1A8r3Z23hqJtffW2lWJSVt1tU30XU
         vjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792115582; x=1792720382;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QzWh/mXf6G5Fr5INTJvXRytqPL/zBujlCdMkS18GyKQ=;
        b=DPRWqTr7/4EOmBoWvrlwgpRlpAuf4LVBL2eqirgCzjHZODlwBB7GjSfe8tO/tW68BF
         M5xGyn4pxQfcoKWJLoiUYeBrRThQ89MV7ekXjn/EeXGJOsiqiFzZJqJ6KIP1llCh5U/N
         Z0mRnBQG8qMrimHmD0081BDNAZKK3/40gI0faqUJ2j2bYSzyPqskeyKHFSc1T1gofq59
         u13ZZJOtoUrzfytJ7xzFvuYaY5dw0PqgafSbHbgAF5U8ObbWjAnKrFrCvhnk8GsiVq5P
         eobv5DrafJ8vFsOR7/fG+U0k6JSR8Wgzl2tN23UhBYVBV/It6ncBF9ND7yFQML6BtMiq
         dr0w==
X-Forwarded-Encrypted: i=1; AKwUvBz2QE+oEilT5TO2S+EPHzsGQcRpPu34/nrsMlDtUZpfxT3auGgWqzoGYxvJWZCLupmc5xbBnR6ZVR5w9w==@vger.kernel.org
X-Gm-Message-State: AFq9FYICv+24+R67v7Z4V2nUpV3ot4Hqd6cv0Nj4JzJrS1o98X30IQJM
	krc7XSSrKsEoOkUQ4nNCJh/xPrXQIyFolp7uslStbV0j0AfEqrb0hxZLQ8DIUBSQiHfcAXb/Wng
	wkQcHY/NxEP9VZ3XLID4TGq44gq6CpjA=
X-Gm-Gg: AYBFou3jWyQ6VenqnKCK/XjP3Lc41uM6AodU6KmyF6c1KLeFZFJXwjo7RJQ76j/e1QY
	9VoRm7/k7QY/b7s8DgMQmulA14z9tt8XTK16lcCd8dohHhKi9BU3K8XW4GuNgwVjHvWSv6UIjgX
	A4PouPqj+DOuDJ4pC6LCD+Gvz0N6Wr4FYtQi2W2HGmugdkdBBewUrOk8Lh5wRitutVPeH4SgAaX
	F5/PVnW5GO4JfoQQQjZnJpixY3QLQL+jM6yqgujUEZ87mQjjAi3w0jDWamwzvOqZbJskwS0Tnks
	qGvfPgwfn/sN9DcEeiPyxPPwn9WfKxhEEyyo/LXKBDncZ0ekchIEoKbvI3ERiCo++BiX4nK/wsL
	WmnzTwuKLAGh7IRCTS6hfGoyoenX/B8yaQAUNqz65EAWOhNo/g3xOvNWS9S8pgFaHh1c=
X-Received: by 2002:a17:902:f641:b0:2e9:5714:608e with SMTP id
 d9443c01a7336-2e957148bb7mr48721225ad.49.1792115581670; Thu, 15 Oct 2026
 18:53:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015014324.5569-1-phucduc.bui@gmail.com> <ad722297-5ca5-42c5-a07e-59fa958387c1@sirena.org.uk>
In-Reply-To: <ad722297-5ca5-42c5-a07e-59fa958387c1@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 16 Oct 2026 08:52:48 +0700
X-Gm-Features: AclHuK85_RuY5Eq4148HpcAJND7CX_R3cPSTmudMqJuFIrc_MXHUz5ZN3dyw0W4
Message-ID: <CAABR9nGU0qW6iMadffrXw86a=ty=FVhw_Ypoa4rQtwOCbepVWg@mail.gmail.com>
Subject: Re: [PATCH v2 00/25] ASoC: Fix constraint return value handling
To: Mark Brown <broonie@kernel.org>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, povik+lin@cutebit.org, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, 
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
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
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
	Bo Shen <voice.shen@atmel.com>, Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

> > Changes in v2:
> >  - Add Reviewed-by tags from Vijendar Mukunda and Chancel Liu.
> >  - Remove redundant integer constraints already applied by
> >    snd_dmaengine_pcm_open().
>
> v1 was applied, please send incremental changes for the differences.

Thank you for applying v1.
I'll prepare and send the incremental changes soon.

Best regards,
Phuc
