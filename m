Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F823C1D64
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 11:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791457249; cv=pass; b=XUnoC9m0/dGCSzgoPEdXvCmlNQ+jTNx/zRnAp7J7vWiQ2aDT6l2LfG4DddZDBQrODC4vJDiU7g1OSRnoeFPu6uTPXwcYIqng77thduLGhKsQhxuTFqEkFPiJ9UC2iiXC5wkl5Uax1Eg2D7Pe7hDvnXaubgG7gtcSyLQDgzOFcVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791457249; c=relaxed/simple;
	bh=PwHZM9ypG7ivy6DiyvJAIMcoKpqU4Q9ea2Q0SCuiZzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Oo4pVnAaqssYQTd892qx3Y2fxbqadEgNCl07cjXdhYXmZEkw+7s3qs9sFfJPcaqdvjgvwUESqpefqRmCnMajHAY+bbWAvGlhzP3wp3I4n/1lH+HPs6a6IyO+92YB0vJWO2GadSoujf9/jh5pLfCWDHAdMnRe1b3iE9ZQrXredNY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nMPboJC6; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nMPboJC6"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so4578326a12.2
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 04:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791457246; cv=none;
        d=google.com; s=arc-20260327;
        b=PFsWqCmv8C5glvij2AHgzn4rZpoViJX3SDTwtAhdoetGFXQd3WU5OXCCSlwtb4kP3F
         WDDlVCPQGYLMzEODy+WEdAYSZdYZ7IdDcBLJhGTN7QVap14E26yVC8/oQTYcT4KVceCc
         5hSTLSjxZ7mEVMs01WhuJAad9klSshFyShV5OXp0fAfxLXQaA6zN9U+d5EXBq/KptL6V
         NjU4bFoeJTu61h13DynFCSf7lS6lsDzn4Cv2vhVHAl5tYcLtoOv8if8+OtablN+/nLUM
         NGdQt97kC373Ev6K5UeHKMnMR9wNneEOwqEABNqW+w6iYiIMim3mUyNaksCu9vlm0wXB
         O8Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=eIepTPV7DS9Aylyj+4CBDzvdvhaffPGskWIagcgTxBk=;
        fh=yXqpDO58a+9QyO+ZpA+4cgdqAILOGVEtrjD+Cj1FrN8=;
        b=TLwNVwBxM+nRC7NX6E7xYGhFx1oa6epnnl+6eAP5ZitIZmVSjp/Ib06J0S+Q0J66ZU
         VgWQpT+MMzu7l/HeFkUf1T6Xg05NNGil6/GNHtOAOmRQUthupaC0zKkhnHENKlB8I7DK
         bUVmqrBsxO9JJdzzQOQzoMkzvvVCU2fYVnZwZ37OaMCc15N/4vBJw/32CaPDXO3NydA8
         0XS4uIU3rjd3sREYPPLEuF/cxX441FD06XsJqNYEtOfaQfy5TjBd23FcLK4nBZz7O248
         vo3xUjAcR8N7H81gQtTZ9mUY13jCu1wrQJx7KKMgV/3OrItfaaUqYVrrNNQ1nx5pfFQ1
         tMYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791457246; x=1792062046; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eIepTPV7DS9Aylyj+4CBDzvdvhaffPGskWIagcgTxBk=;
        b=nMPboJC6mbtr5yVf1HywZ8TL0EQZ28IKn8EBIfVQdbnb8rwU3r3S/e/QF0cMQdM6Ry
         Mg+W54JbmFDBWb/+3iZfzWiU5MlX74RN0bLLU3a4SqaPz/RJ56QBYKz/+bdU2AJAPBUi
         xA8lYP/UE3eovNzjXMFB8PU9PHox0VrHqsgXWXhccAIT2nQVGbxQllWiAVsuskcK4yW6
         aD78/Ku8hcIfY9s3LFHZqxWgH8VP8D2R1Fz7MGKnX/rEh9DWJ6UYc9upZQotzO4Pdhof
         1KasENyt+KLrLieGG23BMRvARkCLzg++OK8qcxhelAa9lU8pJQcm3o6KeuBNm3ZTJGJF
         R8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791457246; x=1792062046;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eIepTPV7DS9Aylyj+4CBDzvdvhaffPGskWIagcgTxBk=;
        b=Nb5cYwkTTGBkJKBI7NtE1a+as6TpNGUJ4eLPkoyPYiE9q+uNMK1TIakdaSuyjjBolF
         AQ9/aTJPwqdYTc3At59QG7pgWJVG31GzA1MHcMVjWoTbt9G+m9wUjmuZMO0Ip3IBT4bV
         cT3KWOkQw7mFXfifXPpWrCcGO3/3tn7PUaAqFKJ0F8foRWgkFf98UyehtBug+q28oYmp
         jjxkDnQuU5fkmtSjg6TqaVCv17EdqiH31kTsyME0uUx8tyoO0rOOzgvAq99Z4DtN2R8M
         I03BaFN+VVRr7/VOKILSnEEymHsWyW+iR3GY4KeB+s64UJxGIBPjRGQLYVZV051251yC
         YQjg==
X-Forwarded-Encrypted: i=1; AKwUvBxhoDt+8ObgCvSswFqZIOYRWO/E7dL5Kj6OHvIsN/w9H3I+zOJjqvddm66P0D6alPxbD+SoJnXU4ER0sQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kyqUeA5TWb9P5b3Zfh46INCIU0IxMJGFhjsAcOtH7ILyYZmIVu
	GHIr9sWLdDeQThan60U++aWQmAaoDdm10OQ4kZ3Qvw7amrFH1ChJQ5w5kjyh8DBdNCtcoPClVT/
	R5dp1N8WAC0VA7F+9+myHJBAIH9PDTUA=
X-Gm-Gg: AYBFou3kNp/kjer5aRiyyIaE6b5yHaFRlxTGd2p3LJhp/q8WrlX19xWmgtZ6R0K0F3K
	oZjdAarj/os5kqBS0pXjpns8dxx9bXGPQCvS5H6aVlI0m+UTljk1n/cZSBZ5RmDwhckUeAEYPxL
	EIsAzYVsRMj0vodT2FJHJZwxFZBgRgQ39sYFRI6sXxarCznaDy9GK6Dk77OlVPA6DCanEnjnEsd
	NJa6tZW/7zZTFCr231eTIbD6h5Hv2XfAR4nwYKtYoYlfiS6uMqKEwxb0q+lpoZ7Ib5hImY8pyg3
	f37hkzeomgU+1gT76T+AvuKvv1ESKwi09zRWHsOk1ZlgyZz5oi1i957/8pzKPG1xzADqSwgSbrJ
	mSaZnkv9mEX8jAoeV8zruYSk4ehkrt3tsQJ+FtwaVoHUYsjlPnyrYLKBw3uijucN4xuU=
X-Received: by 2002:a17:907:3f9b:b0:c26:1648:a062 with SMTP id
 a640c23a62f3a-c317be58e90mr502991266b.29.1791457245712; Thu, 08 Oct 2026
 04:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-11-phucduc.bui@gmail.com> <fc7d2b73-e0a4-4a36-b6d4-8080ebb883f7@opensource.cirrus.com>
In-Reply-To: <fc7d2b73-e0a4-4a36-b6d4-8080ebb883f7@opensource.cirrus.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 8 Oct 2026 18:00:32 +0700
X-Gm-Features: AclHuK_K3qxrvyLSGGdbMZG2p4PEMizBkDvUHEpZw0j03bz-I49nzoxH95pIpWQ
Message-ID: <CAABR9nHx1Uwket5-co+e-LR3j=0Cww0ZqZgZsUbiDmHTEXp-PA@mail.gmail.com>
Subject: Re: [PATCH 10/24] ASoC: codecs: cs42l42: Ensure the DAI is marked as
 started on success
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, 
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	povik+lin@cutebit.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrei Simion <andrei.simion@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
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
	Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>, 
	Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, Bo Shen <voice.shen@atmel.com>, 
	Vinod Koul <vkoul@kernel.org>, linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-rockchip@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Richard,

Thank you for your review.

> Is there any reason why we can't change ASoC to mark the DAI as started
> if return is not an error?
>
>
> int snd_soc_dai_startup(struct snd_soc_dai *dai,
>                         struct snd_pcm_substream *substream)
> {
> <SNIP>
>
>         if (ret < 0)
>                 soc_dai_ret(dai, ret);
>
>         soc_dai_mark_push(dai, substream, startup);
>
>         return soc_dai_ret(dai, 0);
> }

I confirmed this with the maintainer here:
https://lore.kernel.org/all/CAABR9nEXM1OSnV6L4=N1YCbtWn5yMNr+OMEZ4p8h3WMaQXbgmA@mail.gmail.com/

It seems that the other ASoC callbacks consistently use 0 to indicate
success. The other call sites also handle the return values correctly.
The issue is limited to callbacks that directly return the result of
snd_pcm_hw_constraint_minmax() or snd_pcm_hw_constraint_integer(),
where the positive return value was overlooked.

Best regards,
Phuc
