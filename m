Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373852;
	b=m9p9tRB69o/G86NafwWqS5Op5sYIO2lkptIoSPEynzcMl+baCHBKKh5fkVPtU9PwzGl/
	 RwyFou/143s/2a8pBeAOnalMl3PWj9U+JMmFfZtYNQx/NDkamN5Mrsa1Ms/tT24Q4xeyb
	 3MggCp8Ma6gXqYkEX8kJl3o+6EZ0JjcdhHUF52PmFUFaqA8Hr83MPlmwA/VyJJU9IhGxA
	 R57OTNU6DBEjNZzGecQzqvfA8UbLlraCTxttpp+LprSaB2iSyd+NqY2V084Hpo4yEFxR1
	 aJ7bxYRfnfILSDMxW1AYVK7fPw9neXwvf3XJZkZehjVcvhZlk52qHjie+X0tfCn3j0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373852;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+WCvDnD0G8/hR3PjpyDgp5O2JKPu9XcP6RViHfEc+2M=;
	b=3OE137JyYDHKmSMvcwU67N1BIgzFShvxhxB8NlUw2yltLfH2Eiv2GzVBv/IKU6CK2vRG
	 abROoWaOj98nLBSl3P5ggLJ1lTKEA9XnnbN4XDYN3ohD/eo5L4Rame4C3+DtjTt5YO8JY
	 8G5Gobd16dyXQ5Pa+vINWD76v4teNjq5kqkSC/nEiBMicA0yR9A/g7sdFxI++wAbkp48g
	 x7jNRKgcpdLN8e479QPeA6ckKasgkGVEgM/QvHK3mq7foZDNxArwoOXF7U2O26T5xrR9W
	 3wwMbJn5Bm1GsyHiHscqBNJ3FUb+AHTaAwH6FJ3fmNAZOQCEanIrX9sTZx0LLHc2s3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hSODg2fd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B8D606A320;
	Sun, 22 Nov 2026 18:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hSODg2fd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29901F000C0;
	Sun, 22 Nov 2026 18:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795373851;
	bh=+WCvDnD0G8/hR3PjpyDgp5O2JKPu9XcP6RViHfEc+2M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hSODg2fdcX2LwzLMhgCoxSdHQqLJkEcnGc0KIDOWPQtgcNH8EDxfvfVqAWgPN+vrU
	 r9kHkS6lkF+ChYGC5FUfHEMqw44+VDKC/vcn+PC+TpQQOXSj99RWTkSS0piAK6iPH/
	 rTGtnT1YHxotEcu1drgSo11pWbxmofvEk7Y0KzfzovWWJTcSK2nwZtVo/Litt6Q0/R
	 WATe6Boj/gt+79LlJW1tRRUFoG0wt/2ALYMqgh2Wg7DInc10IJfEAlo1RqzDZ03SYy
	 fi3/4hBcadpXFLZcT09hfqcQqL/wmyBne5OwWaXsHu0/N2z55eGI5AQdUjTZyUfXMK
	 a8qd2gbjb/arQ==
Message-ID: <sashiko-outbox-228214@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 9/9] ASoC: qcom: lpass: Add support for Hawi
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mohammad Rafi Shaik" <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-add_shikra_support-v7-9-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
 <20261123-add_shikra_support-v7-9-7bf3aa089fc6@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Nov 2026 18:57:31 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] ASoC: qcom: lpass: rx_macro_probe() and va_macro_probe() omit
  Hawi clocks
--

commit b322e6f1ecfd843ff25b62f5054d026e946526ee
Author: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

ASoC: qcom: lpass: Add support for Hawi

This commit adds the qcom,hawi-lpass-rx-macro and qcom,hawi-lpass-va-macro
compatibles to the LPASS RX and VA macro codec drivers, reusing the sm8550
match data.

> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-r=
x-macro.c
> index b3adb32f7d332..09ea4240196c9 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -3997,6 +3997,8 @@ static const struct of_device_id rx_macro_dt_match[=
] =3D {
>  		.data =3D (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>  	}, {
>  		.compatible =3D "qcom,sm8550-lpass-rx-macro",
> +	}, {
> +		.compatible =3D "qcom,hawi-lpass-rx-macro",
>  	}, {
>  		.compatible =3D "qcom,sc8280xp-lpass-rx-macro",
>  		.data =3D (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
> diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-v=
a-macro.c
> index 8ed8420d7185b..8e0c38517a5ff 100644
> --- a/sound/soc/codecs/lpass-va-macro.c
> +++ b/sound/soc/codecs/lpass-va-macro.c
> @@ -2195,6 +2195,7 @@ static const struct of_device_id va_macro_dt_match[=
] =3D {
>  	{ .compatible =3D "qcom,sm8250-lpass-va-macro", .data =3D &sm8250_va_da=
ta },
>  	{ .compatible =3D "qcom,sm8450-lpass-va-macro", .data =3D &sm8450_va_da=
ta },
>  	{ .compatible =3D "qcom,sm8550-lpass-va-macro", .data =3D &sm8550_va_da=
ta },
> +	{ .compatible =3D "qcom,hawi-lpass-va-macro", .data =3D &sm8550_va_data=
 },
>  	{ .compatible =3D "qcom,sc8280xp-lpass-va-macro", .data =3D &sm8450_va_=
data },
>  	{ .compatible =3D "qcom,shikra-lpass-va-macro", .data =3D &shikra_va_da=
ta },
>  	{}

[Severity: High]
As reported by Ajay Kumar Nandam on v4 [1], do rx_macro_probe() and
va_macro_probe() also need to acquire and enable the lpr and
heartbeatpulse clocks defined for Hawi?

Commit "ASoC: dt-bindings: qcom: Add Hawi LPASS macro codecs" specifies
clock-names as mclk, lpr, dcodec, and fsgen for qcom,hawi-lpass-rx-macro
(replacing macro with lpr), and mclk, lpr, dcodec, and heartbeatpulse for
qcom,hawi-lpass-va-macro.

Both drivers request clocks by name in rx_macro_probe() and
va_macro_probe() and enable them in rx_macro_enable_clocks() and
va_macro_enable_clocks(), but they only look up the optional "macro" clock
and never request "lpr" or "heartbeatpulse". On a compliant Hawi or Maili
Device Tree, rx->macro and va->macro resolve to NULL, leaving the LPASS
sleep-disable vote (lpr) and the VA heartbeatpulse clock disabled during
register accesses in probe and runtime PM resume.

[1] https://lore.kernel.org/r/6f2afa91-6355-45f8-b6be-6b556c679813@oss.qual=
comm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-add_shikra=
_support-v7-0-7bf3aa089fc6@oss.qualcomm.com?part=3D9
