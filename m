Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792739430;
	b=XWdYUpdRfx882MjyQlPl3R95cAGmlU5KTEI0wT4NqLA3r2xgJjdwZhOuHq4dzq5KyJBn
	 iaxWDq25GyG7tddengNWa35OIP4DVMAgxA69Wuog1dgItkctDOrnUNuCdZ+beO7S3hzrn
	 K/rr1Xni+qsyAj6Pkv8haXyidhjjgZ2+bA7fMD+oPU2GXFTg85rOfspPShVj6qOFk2/pa
	 dc/PxPiAOIWep9q7LLozTAyvxdw4sCCG94m2aFQ6hvFu1kUMGFLNR4SbRVawu/Q6eiQHW
	 yUKtrXqsj+U2soaTs25xu5SRaqwQv98Gr3S92BG/+y/5lk5DRSjijsPEGCYKYMBGhMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792739430;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=KBARloAUessdxX5u4q7nuRxqDR+y8JK+WYio1RnDsiM=;
	b=Hbzjjy+BYjcDbxC5btjeSlZMkYo1XooTAM8zee7ZWw2wMDd5a6ZyV+J+LnCiMZY7yb0g
	 A/GrzcMXg90I7xfQqMFBoAlAOBg80yn8cTwCkSYbQmFb6wG+QuiP3DnbNKn6I8w17ZGRL
	 24lWe56A98KxtTs7WBxYiOu43BjhKp7cbQrk+JiNrgwAO9bmJ0fWsFclFqJY06P21Jpso
	 SL30hzt/VRnQVbjpg0wj+uBUa8LTKDSjnRKnvFw8NxUvGgakkfZa2u9f8dEzMe9ew0uh1
	 1OQXTS99V/AN5y5njx1bPGMIeNGlerccmbcRManK+fCCgdQtn4wuVMgCBcQ28OEaMaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2Bp3Ica;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B69606A31A
	for <linux-sound@vger.kernel.org>; Fri, 23 Oct 2026 07:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Z2Bp3Ica
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370A61F01825;
	Fri, 23 Oct 2026 07:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792739429;
	bh=KBARloAUessdxX5u4q7nuRxqDR+y8JK+WYio1RnDsiM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z2Bp3Ica/xe1AHJiyzqg3bB8op6HIsLaXwTIFJtijC6oRbF/27DguTuRNGaO63wlA
	 wsbt7R0gTxOd5G5cgJHc43runUfYR/wLrf7hvNs3p5/Y4cfMsFSxL/7DbtUPkI8oq1
	 LH2/mCd2k7Q98J3iKvSlCSECaffp6tv2JQs5UvDeQh2KNCsmX7AILH5Uo5x2vgu85w
	 PrmqCNQtRLLmblSRL084JGuAggJtTh9mQqwgyhHt6OuhvZCX4O0fWYQr+w6DRr1POo
	 0qZXUqHzqMXdT6UALASMzmyT+zu6CDNFeUxhpywydyVXle7oDdA5TB2pjs4N3Re0Yq
	 TiNW9BoyfWP1Q==
Message-ID: <sashiko-outbox-182386@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/13] ASoC: amd: acp: add DMIC components string for
 SOF SoundWire machine driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vijendar Mukunda" <Vijendar.Mukunda@amd.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <20261023065216.3473883-8-Vijendar.Mukunda@amd.com>
References: <20261023065216.3473883-1-Vijendar.Mukunda@amd.com>
 <20261023065216.3473883-8-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 07:10:28 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ASoC: amd: acp: missing asoc_sdw_mc_dailink_exit_loop() in mc_pr=
obe()
--

commit 418fccdf2ffaf02e2c03c094859e73443fbe31c7
Author: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

ASoC: amd: acp: add DMIC components string for SOF SoundWire machine driver

This commit appends the DMIC component and mic count string to
card->components in mc_probe() when a DMIC DAI link is created by
sof_card_dai_links_create().

> diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp=
-sdw-sof-mach.c
> index 5c201d0b3bef9..4c171e52410a6 100644
> --- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
> +++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c

[ ... ]

> @@ -489,6 +489,17 @@ static int mc_probe(struct platform_device *pdev)
>  	if (!card->components)
>  		return -ENOMEM;
> =20
> +	if ((sof_sdw_quirk & ASOC_SDW_ACP_DMIC || mach->mach_params.dmic_num ||
> +	     amd_ctx->pdm_sel) && !ctx->ignore_internal_dmic) {
> +		dmic_num =3D mach->mach_params.dmic_num ? mach->mach_params.dmic_num :=
 1;
> +		card->components =3D devm_kasprintf(&pdev->dev, GFP_KERNEL,
> +						  "%s mic:acp-dmic cfg-mics:%d",
> +						  card->components,
> +						  dmic_num);
> +		if (!card->components)
> +			return -ENOMEM;
> +	}

[Severity: Medium]
If devm_kasprintf() fails here (as well as in the preceding allocation for
cfg-amp), does returning -ENOMEM directly leak the SoundWire codec device
references and software nodes initialized during sof_card_dai_links_create(=
)?

Earlier in sound/soc/amd/acp/acp-sdw-sof-mach.c:mc_probe(),
sof_card_dai_links_create() invokes the endpoint .init callbacks via
create_sdw_dailinks() -> create_sdw_dailink(), such as
sound/soc/sdw_utils/soc_sdw_rt711.c:asoc_sdw_rt711_init():

	sdw_dev =3D bus_find_device_by_name(&sdw_bus_type, NULL, dai_links->codecs=
[0].name);
	if (!sdw_dev)
		return -EPROBE_DEFER;

	ret =3D rt711_add_codec_device_props(sdw_dev, ctx->mc_quirk);
	if (ret < 0) {
		put_device(sdw_dev);
		return ret;
	}
	ctx->headset_codec_dev =3D sdw_dev;

When devm_snd_soc_register_card() fails right below in mc_probe(), it cleans
these up with asoc_sdw_mc_dailink_exit_loop(card):

	ret =3D devm_snd_soc_register_card(&pdev->dev, card);
	if (ret) {
		dev_err_probe(&pdev->dev, ret, "snd_soc_register_card failed %d\n", ret);
		asoc_sdw_mc_dailink_exit_loop(card);
		return ret;
	}

Should the devm_kasprintf() failure path also call
asoc_sdw_mc_dailink_exit_loop(card) before returning -ENOMEM?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023065216.3473=
883-1-Vijendar.Mukunda@amd.com?part=3D7
