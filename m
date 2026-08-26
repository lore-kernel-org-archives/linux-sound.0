Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92673E1205
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 09:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738147; cv=pass; b=AjMjj0ewtHc/KlCuPB0j+7QRYc7JqdfqiiBJkdbgM5Ajkhkzw3j4pFIYQ6VuzTERPHTf3aC3Y+nWv7fsKzRNWqnhUeOoCPke7ZEOWAzm4psxizpNLfGBafH5zCjFwwSyb4RxDsI6FzpxRm1Yy74olIe2RKR9FGERhtXV9A+vheA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738147; c=relaxed/simple;
	bh=b3ei/scJgqf6mMPZy0JCl3AJkVZk5UcyBZq61g3/Kfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RhAT/TSFAk/jPCqr6EFnTIwd6n58dkvK210fKt/82KMYpA4MRKzM7xXkLbftzXL51SRtobYWB8uZBdYdRzbXO6uVao+fuF/kAr1+47LeN5kWVvLwyKxCkfMZTkw1LY5QaoslhGS6HtAyRmKvQ9xH2Y4w+mN6xSrM/YYmEI1DLtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=h/2GLpI4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/H5M3vp; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="h/2GLpI4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/H5M3vp"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9CU8L3502036
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 09:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2bWbTkVFAgOM74BazGMrLdyQn6F7QMTe6rJKc2GfOA=; b=h/2GLpI4/WKJvtw/
	YGFKEd2wE1FIgXMBc8uz9Oa/LQNNavC/FHWVsU9LHeSx5xOuxTTNO31BXU1udSK8
	ZFhZzyXSonIO7y/DDZmJ+2WvjzKuN4ldXt/YXkz44Uah3R/93D1VPtM9CTIdHGMR
	y2s0lNnsKQ3rQbuNw+EOUMTBJoSKMTkDXI9Sl1aXPWnpsLzlSu3BHtw+04yIjzhd
	XY5HpIK8dvmJkjNyOHm7ele3ZJL6FIqEJB+wV9rEA15AoEO2N4h6n15ozB8xSdOm
	AkB3ZcAFKLX4M8K3oWE1Y92h3GBlQOv8wZL6bdStvJXkG2xqGjpgsU/u2t4Y58cQ
	VxBLJg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9uthrjeu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 09:55:44 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-857d9ee8a5dso20132257b3.3
        for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 02:55:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787738144; cv=none;
        d=google.com; s=arc-20260327;
        b=gnGE/YigjeYf0H1/Rx+ujbzzXWQfUsBaL0+6PAqZkQ+Jrm1CkN32Uv6zxRFAC0D1Hu
         d5X4ujYqvLCNyvL02CGxXIfYn2JkexYfO1rJpIMykOHNCU2SJ3kg7vhQMjZ7aGP9Fc2l
         FB1rhP5F9YPwMRNsDW7DDDvNv3sT/iUGuPuoYfoJ2y0r07PVzossOLrI1hyzI2ciO8UV
         tgmFgjmDejQvdiwpcnWDJGxPNzzbBgdn3Y+A+fOSJbV1FdAZVQzSXmTOq7iDyDNGjetY
         cjSHS4yP2gRILJCOeKftaUFxZxBlgW37+Nhxz2N8cBQRddtL2YpFnCN6uMz/xmDoqGCx
         2wsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M2bWbTkVFAgOM74BazGMrLdyQn6F7QMTe6rJKc2GfOA=;
        fh=C7DTWQHQ0P42+sDHncVdQqE9JxyUGUGdF7YEpQJSDGU=;
        b=eNFO0pLS8t4HRBtK7Nf0yZQjI3cxzUEgOwvz7m3mgrZa4mdYBzeQEXxyGBaLwrpiLn
         IAwDCAdi3yyJDFYy31wg1gQHy/0q4eMzojOu1hwbW1T3jWCs4auXaEBjXEeYWI1aAAx4
         C5ofTsLjpTJ4vHAxMkCCtT4vAxs/lb2B7MwN93c95q5hWXf11llKUFHJzE2mH/TnakzM
         IFE8jQ2A/I9eZukYvSNfqBKT2sFOXXMyQPw+mk8/a4KqiJ2hOCJh01oeQXDSoykqe40D
         rvmqXUuQT7N7cOt+3yU3gVLI1UWfDFdjcz3KxZaJ3yDbp/bBWkb0Yb0THGPFLuwvo8i3
         j1Xw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787738144; x=1788342944; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M2bWbTkVFAgOM74BazGMrLdyQn6F7QMTe6rJKc2GfOA=;
        b=i/H5M3vpThyjlU79GKxyirLZk1P8shfB4u4a68LnUlavO7lsALAdlKL5E9yAaTPFvv
         NnMliwPgy6E0gZWpbVC+fOpzbORRUsIZlTxN63DRAFKfMSmkeT6d6KjZiTAyjmLibug7
         +iEsegEBF2rJuhk0r4GfJcxN0KycO3RL2Wh3oXrIMZp2IcPN9oujwBT9wFivAmm74FJa
         EMb2igHafr59OMyWzhohmybYUnQYuq/AybmEkvK4IOcI5ASNactmtFWE+ZrSx77xI3Yr
         +etlLcIjUb3h1tEmBZJSAQjvrnMAm2ZuII/Vyi0t0jscQttnpnwj7wWgHMfnAHAgoLJp
         N/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738144; x=1788342944;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2bWbTkVFAgOM74BazGMrLdyQn6F7QMTe6rJKc2GfOA=;
        b=ZLu70lwX+bzBis2qVA86e0ESJPq90vyt2eUZlI6suxDrG/+dbktuej5oAD9VzXEAXa
         spgCNjJLJNEuEsqIXKJltdC/eD4rYOsFSl+G8/5NRSJGFzFufIrE+ZWjbbUnuR+8hfUK
         4olLEWqVllijhQDsOxBmcszD++hl0P4zszfp0ckHEN3goovJz7Rj2TLKqGf77YExevfr
         3E6iwghdVrBJsEweNkxzRFiiq4du88uFzsgeFmxAYtE/31fu0c6EPcqfg5o0VffnBgDo
         M5wBW541pnpdglSwNNK7ep3pPwSIZ5Mum0brOdVqzsTB/XC+aq3pZlLUhN6U0xa0uWBh
         8ckg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7aiqITx8AbP8Gnxy6U6RtYqTT7eFt4dV3RYSjY/KiV2aox/cvgTQY8ueWsd9tkbfvmMadgoYJupPoJQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kygcLw0MPCXZkdGGQh+vD2GkUUmQRuH2oecm3Mg4NclSRzR8Z2
	ZJ+uroA0SiQAPTwSINZn60K8kh/j6wtrh5LctB2Eez2/V61BqoV9FMHI5W/oh3/SKrs30Yr2fUg
	hRigbwz+dDEunugav27kcCzTWyjoa2aQOrQAYnbheA3fT3wX5UoqzKed3fS0ldxqSC8rJFReLII
	ADXbHMKRIVNHSA4XWBQ9rdTKvjIf2ufW1spBOzVwMN
X-Gm-Gg: AR+sD12ApMx9a4GLktqWDFB5v/8782vbckk/zDNztOJaDkdFDwtkSknnYvOQYHN1k7z
	PYe40vYTcIHL+t6jjD2lmOMB7xUVxp60LEn8BehoLzZfvcenF8eSCB4XBjoYrWA8omsj7FAKvyp
	JKqXBqjZw5NDWDFEHHfu/+hlhpHBvGQ97OI+jHFyirpSa1kg9uqSqfEc9U2g==
X-Received: by 2002:a05:690c:4b8f:b0:816:b469:ccec with SMTP id 00721157ae682-8573cfbda13mr22928627b3.15.1787738139184;
        Wed, 26 Aug 2026 02:55:39 -0700 (PDT)
X-Received: by 2002:a05:690c:4b8f:b0:816:b469:ccec with SMTP id
 00721157ae682-8573cfbda13mr22927347b3.15.1787738135581; Wed, 26 Aug 2026
 02:55:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
In-Reply-To: <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:25:23 +0530
X-Gm-Features: AcwNN1WVFRPvlQgvshmc0r_etw3NSt1fZg4y_jOiN4z4411feqSqHUo8KXSuovQ
Message-ID: <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EMA2FVZC c=1 sm=1 tr=0 ts=6a8eb820 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=0RC-DErAFZYGOsEwKv0A:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: VbsCg-8RP9pe3JoslFyD9qqXdNm6zAZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfX3hcBSHGK9Tlq
 QSTDCIBWYEhTAEraqCsWreiGjz9mXgLaPEEtacAr9tCgHoipznvmIEMOkGrDNIADPcm6EJMbnd2
 y8lniW5rr2H3e5PRGrBDozDXnM68VsH1sSM9ECLmojLwynSbtGoApExgndEYOooAIAumI+X0Vpo
 144T5G6o1iOC59mN9VxD3epWepSFdQXjbYdb3afpfp9F1N70Gt5sLkzYLyAgezNbIxvE8WXiby4
 QvE+64a1uk1/8OSh3JvSB3E8gdoW9e+5vldRibw8B2x2Bwd73jkRuAlsmjJliQgBrIN3tO0WHIX
 k0dRkDgYpAHgRoC1BoKDxqMbCkisNBRi9iUBDy0o650N3kWTGNUCC34Or5Fa7dHE9Q7dI3osi/2
 suCLrEZQ5fuNdOGs9ObUs1cFJuWl0FaWyZTL+FI4RhTeUAmzyHZmTGB9Fc9omTtrhgkurIDP1YI
 aPNKXWWciOKDnGkRmow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4MSBTYWx0ZWRfX6ZwUaVZ0ctsg
 Son9oiYNlf/H6PDqxSIxaBOSVgEn1qX6Pd3dQJUDFNxYRZsRy/mVzoUuPAUVToGIcex1dQRacul
 YZ3Xtg/Vkpo1KvIP/NsHGC0QgDJYgZI=
X-Proofpoint-GUID: VbsCg-8RP9pe3JoslFyD9qqXdNm6zAZ7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260081

On Wed, Aug 26, 2026 at 3:13=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
>
>
> On 8/26/26 10:39 AM, Harendra Gautam wrote:
> >>> + * CIF (Codec Interface) VA TX DAI IDs -- capture from voice activit=
y codec.
> >>> + * WRDMA channels collect audio from the VA codec and write it to me=
mory.
> >>> + */
> >>> +#define QAIF_CDC_DMA_VA_TX0  246
> >>> +#define QAIF_CDC_DMA_VA_TX1  247
> >>> +#define QAIF_CDC_DMA_VA_TX2  248
> >>> +#define QAIF_CDC_DMA_VA_TX3  249
> >>> +#define QAIF_CDC_DMA_VA_TX4  250
> >>> +#define QAIF_CDC_DMA_VA_TX5  251
> >>> +#define QAIF_CDC_DMA_VA_TX6  252
> >>> +#define QAIF_CDC_DMA_VA_TX7  253
> >>> +#define QAIF_CDC_DMA_VA_TX8  254
> >>> +#define QAIF_CDC_DMA_VA_TX9  255
> >>> +
> >> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
> >> card registration to fail.
> >>
> >> Check sound/soc/qcom/common.c, as the current indices (246-255) are
> >> beyond the supported LPASS port range.
> >>
> >> Best Regards,
> >> Rafi.
> > Thanks for pointing this out. We can either add the range check for
> > min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
> > qcom/common.h to validate the supported DAI IDs across Qualcomm
> > platforms.
>
> You should add these ids to
> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
> conflicts with common code.
>
> --srini
Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
Q6 DSP involvement, would adding QAIF IDs there not be misleading?
would it be better to update the range check in common.c/common.h to
accommodate both LPASS and QAIF DAI ID ranges instead?
-Harendra
> > -Harendra
>
