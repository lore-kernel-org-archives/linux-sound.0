Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14116353A9E
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 11:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791978160; cv=pass; b=DK/XXlvuejH3r1jPumySLU8bSaNB51mwGH+2CFdJkfySu1ur3ktKQ5wDfDe99mzeSuqVai5ydqASVzW6QJ1AG+WirgmFHiefx29k0967d9gPPG/h1z9c2eQiaNTeOoYglVedmUSUssjV62lBeKaZs/h4MTeYJ2FVwelZZBDg4BI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791978160; c=relaxed/simple;
	bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SGX2VCcy7fvW9yUTOFRAcxwrNKUBvG+xBqK4xC9mmu2xNG04vOvIVcmZQ22Yaz9MB7VagagtG5/zyrIX2dVx5Xyl0OuFD2wVCL+N19DYSNsevxPxIVL6H6VT5bvZkW5Xn/xLurAMkWyNN/SY8eRROoNWaOIFYdq5yNbwR+v3lEk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mf97EB9X; arc=pass smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mf97EB9X"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e5378b281aso21605595ad.2
        for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 04:42:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791978158; cv=none;
        d=google.com; s=arc-20260327;
        b=prhw+CaZ1BpBB0YOLqOLAdtnX/D1R796NGHRiA6mV4H2TfezQqEnMJefevTxRZocu6
         Lxm686pQ+qweX2E2pKt8eScuKV37MCk/pyavQL7i5lumIjrg4s6UHAMNc6wYglno5IvR
         iTYiuaVO6tk3dZA2R7y6yXC9BkgyXpwQKyNKrfWkSqOHfm39dH9BWoWxB3gZIG4nPLmo
         Ia9zF10hnx+PptP+1e0FaHgqZLrF9EuXU7Kyi5/vv3glDCzmx5orem0N34GpVHr8H+SA
         egkuOlUnnloWK6FJ17yyj/hgxHg6hoJPUaWHqFA8LPKPyYKXbRxzUmrdAoUFLlLO5D3F
         tEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        fh=jsyp+y7QR9EXVSw7hURNrzVx0BFQ0vMp2ZSQ32bUNUg=;
        b=NGJcTy+ECYC+KskJ4TpEfLoUZm1/2AwMzxAMk7dUQ+GENWvjZCgDWf3XO+uJCSuajH
         KIWfaw9QS+6J4paGX1PFuOa+CSb7kgdZz7xYOzW4l4MWyVlgJnU7BYOvTxuo3yhv5vkr
         Wu/QwOT/wqqH6lRSzR7XYTqE/DBs4VRs5QOCov7Ad8zI+vBDxjRViLmZaK/DhIUFznkY
         m5MXoGMtkqTn3FzTaZVFJzoOIsLs0LWTo6NubdxdzRvwWkZHP76pxbYLVGLqiBLv92R1
         ch8uKDwECwiwYFDICLtsv/H3kWzWL5VEZQ6GaifcVqMBA2QGMadizQebGuKIgWVzftCK
         +Obw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791978158; x=1792582958; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        b=mf97EB9XXjAUVxl7uljK4wA8rth/C4fEFPhm1Vb2vVo/cS1SUrKaaMsc//aapgR+Br
         ySXZGuSfxZrgVC8/I0c9uUBzH412QPVKhHOWW+OfyMu8pGR15bXGjiKk8duJ1goLkzGj
         5imewuu03MeJFacvj4/qEZe/5wGZzVQ6WOOEy7LtvZQC9TgPuAacgbrqgGhAygDqCXNI
         EByFzOFd+5ZVHuWua21GJkP/ARMDwh2wAtkLyROFC3gsJYPm+TH2ay5k/TxbKdDHOQ8G
         o0qyKhSFE8DMC+NpQaB80NNhvt8wj+wzAh/M2b1tlKragu2GtuYKNMG/TKMXb1Yci+fG
         eOng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791978158; x=1792582958;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SExSlJOtRhRzpIj7eRr0FWRac1iKGklAYskw7N+LI/0=;
        b=PwFuIVvjRy/yPwL2UDf2LlDcNstdV6UI35BUXBrFU/1hXHVjAYWoySEThJP3+bG8RO
         6LkHzjnz2RFx66wOrHjLSfp8ihHJXgONmYwZCxrTo7HqEC9DmHlxCRj5yX+umKBQfIq6
         tpb+/xbebtBHmBYrBo0eK9okJT9GsgVgSgaId2et09jIHP5TP5jQDhwKsgLLqnaD89zX
         MIYWMyHu8F4DIfKJzpw6xtYMnG9ATmULu5Pj1sNJEtaoYqHibYKyBA/1SRWNOUqFwMov
         2eDwW+xQxRgo7PzzRLNinkxe25DBHZX3cnXZ0CUSFPl3ZETgf7wFot81cbsn7GqEE2RE
         4yKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxm1HSmquoZPGuqWj3KBciUMW0k5nyxyWb7m1+km1+TpHCpOSwlaOD58zughca4LjdhkWsou2AP03/AFw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKnMwgqFOT477yZXQHT3IAoGYDfFL/8H57zB5ey7PTSm2wslISD
	qJmuGwsNFD/zBX0Eg7sg820zDnzNEJ77fMEIjvjkokDrcrDtUunv2k9wLz4fx0VZGGLxIWlY/lt
	cpY8RPlqz2+OmIJ5Vs3X384G3aAAFHjM=
X-Gm-Gg: AYBFou1zj+pU3Xa91aZGgebOkxHmkUafyBPdYyZOF4Ei833Uud47aT0JPgXnRhsr6cz
	wFaiCU8UHJH32L+RGoT71pl0G22w8JXNjHbSGUoCokgxGWZoXlCi8NekVIGXjwaJJjI5Q9fITdQ
	b/cC7J8jNV7N/OicG+bFKxw8CtPlTzNnXmQWc5JuBGPENwJIC662kAhdFCGMvEUxTOJwRF/MBde
	jcpI1mUeC9gbc6QCtpKqNuMUThHLSdva6ZQKuWcQPv+ySpGgLSBnRfgXF1gNLKmu+KHqxPncLlP
	TN9o9CYf2Tvde2cCmI416WUtq4CQRpnZD+tE1+sl1ljQl/jjXTvhhhm/ulbMDqgmRd2qjzwLCke
	f5NPnpvlNefFTnVGBNS9J3MQoUa/gryofcG9skYqW2sGPRgNyxrIGA0AIKH3gQQFsYv4=
X-Received: by 2002:a17:902:db0b:b0:2db:3b35:1ac6 with SMTP id
 d9443c01a7336-2e8427efd9dmr151731365ad.5.1791978158291; Wed, 14 Oct 2026
 04:42:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-19-phucduc.bui@gmail.com> <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
In-Reply-To: <14bbf027-4a16-4bac-b530-d4654ed38d4a@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Wed, 14 Oct 2026 18:42:26 +0700
X-Gm-Features: AclHuK--pm1YXW-dAVCk4mePmFKUqLdOhzguEaV2jSOsxf_MJ7HFDWxjeVZGb_U
Message-ID: <CAABR9nHyso5GHpc5Gg-KLF3hJkCHQCYz_mK_i3_0fWDEimLEtw@mail.gmail.com>
Subject: Re: [PATCH 18/24] ASoC: imx-pcm-rpmsg: Fix imx_rpmsg_pcm_close()
 being skipped on rollback
To: Chancel Liu <chancel.liu@gmail.com>
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

Hi Liu,


>
> Reviewed-by: Chancel Liu <chancel.liu@gmail.com>
>

Thank you for your review.

Best regards,
Phuc
