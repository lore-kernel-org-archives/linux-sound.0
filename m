Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794969714;
	b=uHe0FpbHQ39fsYOdnHEYqqt7L8y0wJ1at7bI0PQbtZSe05SC0BFReBWTh3z6Rhe/m27G
	 +bXJdq4uuecr0eS6EjTYiQJsG+YDruMUb2ZxxBE/nXDR1WJpl4qakNBP2KF73GUOqzKF2
	 62z24m0aKcurEE3nUuhE5LbVLFbpieyzLy3oUt1RMor55wzUBICUud7/BEdQ8nKoGeA0B
	 2lmLS6WYEHBlzXOfbjbh6QqpGeAZa9tMMml/7otCpeb4Br+IkBD5gnw0Xvw5bcJzpPni0
	 PL6hd7jVLe0Mmk+Hw2/w2lZx3Rf5hPdWPlsIBINKlvYLW8ncR4btxGKJWqoOQ/l7Nuw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969714;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=;
	b=iaWopv9nsOy9egDE4sHSHFw25PBdgMU9CXl6e+bIuVW3zF9lzjnA0eFIjubGwsKwR/7J
	 D/1v3HB5U4tquErFp74weBnVnOiTb6NsCxC1bcSJSeL2WxiiIpsWBwFs4W3wa6lfAYwpp
	 IMpgMdHFRlNej1ZoANIE/6pzzM3sqDH3Te/4fjQHpCcBLWrsHCHeb0V68cJQlXcxB03TV
	 hAO1sNHpgSO+vJvVjkqjvuK6T7DolqLjudAPBCMSmUaVL4pZ4qaKiWcBV4fzwep086hqa
	 +U41MVC2Zev5wzg5fFzScPs6nlrUtLNK5AvoumKk40vZVseTjP1CSsFvziBYhEsBOpw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VdfiQh9T;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vp7baz0+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33403606A32A
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 02:41:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33403606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VdfiQh9T;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Vp7baz0+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2V2G9764101
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 02:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=; b=VdfiQh9TO143Yzve
	d8LMPHXsMHq66Uhcwgp/xbKf2czRZqOr0IqD7m1ZW4cHfEE/MjlxawqGlxDUvfYE
	3DlWZGT6+wT/qxNkK7NsRmQ/QVhWG7RuFKwt3Q2PM1DHd8ttW++HUS+NFKW4/Bk+
	OclCa0TN6v4RGMtQqUlFGUEedXIVOhk0Uiu+UgT2WwKURV/0Wcs9W5sr6Vg3DGBQ
	pJkkrd6ggcOX9GKX0zZNmmus7oMJh//EphyrsVAA+LY7kgVnBfa4uAcbq+V54z7X
	Vq0BO+nAz17xoaSaQ+PV/kRkc0f/njQ9sQrIUXftxVWWcmHFDTR1o0EBmv3wBzA+
	I+y3hA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvb8rjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 02:41:52 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2efe2a88b7cso2583285ad.0
        for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 18:41:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794969712; cv=none;
        d=google.com; s=arc-20260327;
        b=fmGp4tzJ7vKbY1M/d89IdNLdyuF2yD0DMbq63Yh7UO0ZPzcFMOYXJK8wp1F23n4XLO
         cPaIk8cIKebkxJul60ypbViQxjquFyJwJoJyE8WY6bUtv27zbLonwHVlr4Nn/rCQ95Nr
         CjnO+SZf53PJa64EBVdt/1XcZ+BNG0cQjvwO2vWwydIBbpef5deRV5b61ozXwgs7FyLm
         8qGzgZ/3eBqtjIynZx/+FENZyvao0trNfG5qVWsOIJv3mRtS39z6xaQo0cJWaB6cmESq
         7IrIaidMjyNuoJnPfiU7Ax36P5ti44sMevPooOnYKif1izsGNXtUStAbLA31Vsd/nIXm
         2+KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=;
        fh=hUZCxC4kDmI1P9e8qld3A2blySu/yW00NspUvAhjEYI=;
        b=SGJNveK8ekOS4cSKHakJOJfJqhmgy8PpMiF4IMF2WXCy6F/ECf1zw3knJ6Ot981bXw
         jegoQKye2UBjnEyCmDl7nR0ukaX+Ss2Xw2VlUA3f7H1SOOZKW0vR5El9Eb0n9DxlOCpG
         xt9gQ97qq/PF8ykWwRRK4vVkmOWaEEw9bMx0TNEFllg5nbhztzBFGsI2IARaXzbL/nnv
         TVngQQfeaeRjmmstxDahfpwE2krnvJZXDJnwv94/1JW27I1yASSy/TVNsZluT25cXn38
         AMIVbrjqJPw4p5wsI3CZPW9HJcb07oS1X9R/q2zG0GMe7vqsPuerQaFfDr9Nue2PzZey
         1zOQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794969712; x=1795574512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=;
        b=Vp7baz0+wt1RvyWMBwlrbOmNzuEutbbb0l/oBEFQqq1Nj4Xks1SEPJ6sGmhNQ5PdVP
         mnI0YgQpQFlFArtmj5ac5nWE8af8MHDebRTZIWLkgFuvqgdW9s6GQ97zIrl1IAph9/ce
         LM207zcxmRGWBwVoQc7YxYF3tlzk9BEl6j4QOyGIV7Ad9Ga44pIKwdGLXB0G4+mbWg8F
         YLeZaooH2+ajYjgbIQWdC07G0x8SL0ufPxsVd0xHaKqMlPnPULFvrnmaI1HUUNz2urJt
         SyhEks2+GA+eZUiUvD9MmSWFDEjt77Y4qzYrNlHF5xckQqfX1UpnGVMS1HBa0KURiAzv
         dzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794969712; x=1795574512;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EXpBEUN76Cn3ev1irIMt3vFHpTxfdNZ02V8Sny5G99E=;
        b=ttFHMzrO4v1erbVVhYNNrhz+6KiF+jqJ/9s9WaKvdLjchFXgIQLrrqoh/kw4+hIMG+
         OfS/HeZ8lSV6KUdlRnxWTUBjJ8sVV8sUidEfi89db6XSkl4zCjPJqw43Hw5IAfRPIeE1
         TxhiMC2YHmm2NAsNv/J4MTRnKDiNeJ3/0R61JsDEeRT5O0sQLbalhGcMl+H73ksEFDg0
         ol8AHjVOIxIRvEt4+skqVgEI0DA7vZDiSvbEX7s+f1R9NaC/b4kKS43Ia5gzHyMa3ZgU
         4NUdgwhGyOTr0hmXIi4e/Lr8TeBLeS4S6YNCp8d2CYQZvFOIilM5S0Gb3O4a6xjigZcX
         d6Yg==
X-Forwarded-Encrypted: i=1; AL+hErFLjbOWyoCoF+zy484/n3d5bQGUvCo0ga9sDarEz15lu1PxST5P4YOnRK/D5v/gg35/nk2EvP478smIUQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+r6ao+4W8w2+FLuQTsI3U9hpP63gr7YceO20zdCrsJbulJGXuk
	4s+gOh50cOoOfB/G/mmceutpSiIBnk5fsMspXrxZWLvfD1ln60KY75b5/zRs5tf3B9Boa8NTmcB
	c1oNT8meZBOWeLH/Ogq0x5eLDKujDKr6DG0RWKI08eEJIT45Tmo087zio31OI2pAXebhl1WLuG3
	yhPgtuEiJUzmSOWEpSM6veMDlkmY9IfJKreZ9ChuQi
X-Gm-Gg: AZFdTZdMGZrAP7kIn03wJm+Qv3571n4S8RVdwnnEvb0TYpK6EP7dMqZhymTg4njBE7H
	gdX44z1a0QEBrxF4l86tidMi/QcSFtGwfxHtx5m9z/by6IJ/vaxDSFCMdkwpfkC+QcwmSfDFNXi
	K1XdU0DNwUhpUmNUQrF5nAmdbO27h0/fEQYqB6jy4UWhzW6tja13buuJ1Lfg==
X-Received: by 2002:a17:903:1666:b0:2df:90d4:7847 with SMTP id d9443c01a7336-2eff75188a6mr12050665ad.35.1794969711519;
        Tue, 17 Nov 2026 18:41:51 -0800 (PST)
X-Received: by 2002:a17:903:1666:b0:2df:90d4:7847 with SMTP id
 d9443c01a7336-2eff75188a6mr12050495ad.35.1794969711011; Tue, 17 Nov 2026
 18:41:51 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117050328.213157-1-zhangfei.gao@oss.qualcomm.com> <6410d170-305e-4b24-a20f-3b5e2ee9654d@sirena.org.uk>
In-Reply-To: <6410d170-305e-4b24-a20f-3b5e2ee9654d@sirena.org.uk>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 10:41:38 +0800
X-Gm-Features: AclHuK-VLWBxgIZ0XisTSXibfSltulzootARIxFetC1ERo1sszBwmUSj4N4pF_8
Message-ID: <CAFkd8hs+H6TLg7rCbX=5vtbouDQmW-xRNb3riGZEDmtxSf00jw@mail.gmail.com>
Subject: Re: [PATCH v4] ASoC: qcom: audioreach: support multichannel PCM formats
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: clolBJ7TqlPsg2OTY6uFiCpIJYNQYkY_
X-Proofpoint-ORIG-GUID: clolBJ7TqlPsg2OTY6uFiCpIJYNQYkY_
X-Authority-Analysis: v=2.4 cv=YfgodARf c=1 sm=1 tr=0 ts=6afd1070 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=QqkvHvLY7Ef6vnktetUA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMCBTYWx0ZWRfX3xb+W69761PR
 qJufTkdCPiS8Fg7flbCM/HOq5tAuNfhtDnIn2vBt3fh+1CP0gTkF1aXKB+iyoQ4vVzT7qnW9TNk
 MBYmPWf6APipW4aPKwt3nnGtDc0T47k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMCBTYWx0ZWRfX5IZ3OBdEMmZM
 n03gvvY+Ag5JznQxjuhXbmMGNcvJDfGFn24xAbc/5TLxPed5xd4iNJ5cyN3C2nLHgL2Z7eHP1RE
 Hz3J5ZyhRBbN1X/nSaiyXpwiGvFmBgU4kOwkzEDIDppULQWiSe83NzcoUyTzyYDSjl5X4K8TQf5
 q8XGZKeuQ9H1v30kVOjysnwagil456PrbEbAiZigh9+vCXYQdCxvLuVwmrEihslII4A/RzU49cn
 ojtv2Zbt4QuIaUZF8JKhgVnqubzBpspWVInCT4Q5Dq88cXinmSK6vY1st42AJLygkIwiwif25bO
 zrnszbFtKf25/darST4wAsjmFUiOQvhlq2sMos17j5tXT2HDdX67EyWg6Dwed1e+SofVv45w2tH
 PCE/6ouLNcWhXpzoNtUgCQMNibtQkk9KxvebDWIKcfGWIMCp7wMIf6eqO3O+KoY416jSe6jhxMK
 skwcvhAwQY+mtpXh09g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180010

On Wed, Nov 18, 2026 at 5:48=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Tue, Nov 17, 2026 at 01:03:28PM +0800, Zhangfei Gao wrote:
> > AudioReach currently rejects PCM streams with more than four channels i=
n
> > the PCM and shared-memory media format paths.
> >
> > This prevents TDM links that expose more channels, such as the 6-channe=
l
> > playback path used on SA8797P Ride, from being configured.
> >
> > Reuse q6dsp_map_channels() to support multichannel PCM formats and use
> > the common PCM channel limit definition.
> >
> > Reviewed-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> > Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> > Tested-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > Signed-off-by: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
> > ---
> >
> > v4: Rebased onto sound.git/for-next at 7cd6b1fd8f9c
>
> This doesn't apply against current code, please check and resend (there
> were more updates since then).

Sorry, has resend rebased onto sound.git/for-next at fcfcd6db32adbd.

The conflict was caused by commit 347e02073b08
("ASoC: qcom: q6apm-lpass-dais: Reset the codec DMA channel map in hw_param=
s").
The fix remains preserved because q6dsp_map_channels() clears the
channel map before populating it.

I also noticed that q6dsp_map_channels() does not support 7-channel
configurations.
Is this intentional because there is no single default mapping for a
7-channel layout?

Thanks
