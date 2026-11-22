Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364096;
	b=QOyW0XrQWKGiqZFx6OTmI/EyAjBnUbydJqHRIQeWadAo6NVi0AhW/J1YZxWTFFM/Z7X8
	 PdQX+3AYfjGQoLanP+mjqIFRk3D2/zJd6L2nGGqftN82w4yqL59nj4R0WnkRnedb62c03
	 njKlgsNhHwrqUlPzfIElOzgaXusRQbMtE5q37cPhzBpFqhevvlbun0zIA7ioHunCi7ssY
	 V5VN0wU/auPUlonXf/qLk3s3IkIc8GxIwDnFRvb0EvAzV92l3w837xWOgQjR0DPdz4nMt
	 SPNLWI4hBJzTcJH36DQfRRKeyRSnKFHWjd6spNRYKpuvfZZkEeOZukYXSCS/wRyHE5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364096;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
	b=ced1szI2WwPTmy2CMyFFflekrVl/G4SsJN8zdIkecO+587l3Ofb1DXcNOQ/sbAUPy5wM
	 /RBEJVA8K7/qraLHE0D5ig1vwWyN9LwAOUcjueY621PLAPkZ37z6sjKFaqabI9MRIFiui
	 mlJu/4pUo21Sra3OUQkOExfmc9twCFtc0tVGbSllFJZLDwUZOFQiO4R4oBOQq3q5/C6K5
	 bVaEbG4x7S6zbhfwo/r6mB9VbM6cL/zlOU113PVYduDHG8gdlDeL26xr0rPaW6UKojKwK
	 6Hm5DnOmoY4VuzhQ28XKcNHUZ9Q8XLIbGnMb4QGwfwxCJ+PXeA+urkUPyA8f9h1P0pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EQRtFRUA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGv1bW25;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F66606A69D
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F66606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EQRtFRUA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QGv1bW25
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMFQGk93382274
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FZNFp9/0dkT
	sTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=; b=EQRtFRUA42GVrHwo0ldgQX4I3GA
	PAZx8Os3MMJfGEcsywP+egPL4DbHxJYUAmZgcDzK7sWLMMPnbJEG542RgH5Tw54z
	NAlON/htb8L4E1TF+hopzK9kjf2wBDjsetwXs7DkRN4KytENZf80qNO6cl0mFC26
	Ohao35go4UajhGtLaPIKj/se7cSCncqrizmjy8agWQqBcCWypUMFvybR355Jl+C+
	xqv9yOUTjGTQQDaEDHZvKz/GXxR15WM+31vlZUHh+mzMkuoNB+Pj8iaXjz/9YM+T
	rMjx9y8Rx4X/i6xltwPZ1HLlqYuvhctKkL4fkMf5pLcrfe7pN+sPHDI+IVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7upbf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 16:14:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94970ad532bso409339785a.0
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 08:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795364094; x=1795968894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
        b=QGv1bW25xC33LD76O50/YzWSkmxkQd/HhumnuKIFW67bE+j6l5+v6Qo7jOJc246tAf
         7nYLzkFdI8h2nNwUoThw1wyYziVnHQY56OSkjFBtEWZnb50ALHXOZM8VFxE0vkcm6Ap0
         trCbOjf9rRmL8GlyjvPd6JVeznMXxbrPDIQavEkftn/RHg3N1IWvHqCEz0sfzT1UOrRu
         Sdvlz1KhZImwgjvHmmx2sJx2u+0WKKC2L/QoQDWmW5kYfJgh/dpaHH+LPWIjLe0JrKnI
         jF12kfiDjbRE54kXIrqSbbcZLRTawbslKcf6/7+agYeqfLKcjRBCo+43wpPOJnj5VjM8
         FHZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364094; x=1795968894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZNFp9/0dkTsTM2vE8nJ7VD6L24rajS+fM2LkLOrbGA=;
        b=z+A7x584/ffQpXh6/C/Znvn58+ydLPbiaCWBFr53o2l2ENM4A7oCgUf+oyoxS47VY9
         GIUjY0YirsrHS7PkkQSBu1Rd2tegGbAvBVjJUmnjWoiqFTFkMLjB4EsskadxYRiA/Ns+
         We5XnweZnU8EQp2pYz+7SR62cbSy37VkkvFqW2onhSxus2VHmj8OOESv6GndNQc4T6mX
         VBSOrWn0UnAU4w3oGn6n2vfRUr41NuelqkPnsVCcbUUPE8aMtQDOx1cCEQ15l1OSv37h
         UvivKz1f8/MWDCw4hin1fVRytx6Dfeup84uFCKmnfkX6rfjHAAAONMR8joJPVVyMEi00
         t48g==
X-Forwarded-Encrypted: i=1; AL+hErEp/pmeba/fMPfZkM//9eZJkrkYPvRg33+fZ9BhxBo7pAmk7WTlo7Tg6VRUIvr8WB3E/9bdZPWtbjp61A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/L3zjDOEOW3EbxrjRs3Owa+jwW1sP6M7xV2D+HvkPaLYrA+VKJ
	Lb3UlyeN0TOJxDhEYZtU7TCDxDnr4eB4WZ9hop1aWzjOS5euMUJEtTVjwDquUhdqMAU+3rfJ4r/
	IQM5fHrVCAFQT8oRPNsqNaEujlXjqnjizrIVtsc6E4ADfKE2SLXZRwexPpuC2AiRK+A==
X-Gm-Gg: AZFdTZdJ6va5fwwNIwmVAIa9LyuV/zhdxSn/PcbcMuUKsrcAOIV2xbxTqZvsCAbW0BZ
	GFbzjVmoJoSIBhgnkz7jbwVTpj789q3xr0HZPDVHvg+WHcYM9dVZlIzWVmDFiVW9WDz0AUpP/9o
	tkp4bJiOvMpopK8te2gO3NIeHZHRCFqQSdbSYANUagiU8QmpYewBVHBwZe/w8/BAFZ75KncGtxF
	F7aj6TiIGoa4rAjMA2gKSDgJITT+McKJN1oVEFtXjzHgvA+XITKUsiCBbgOOdPKP+YMElPuSFYt
	8DI49HdbW+icHtmpKBvc12MgJW3HsvlbJRsXqF6ijbHBOUFJ9el+GvmiIle0EvhEoDF8BPJm5Qp
	zuFDVRXNe/Wi4sHxONLpPMPvwGAUvKEHevO6HX0ot3mC+sNr8ikxIqUhzjibSrNsV
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1412218485a.0.1795364094249;
        Sun, 22 Nov 2026 08:14:54 -0800 (PST)
X-Received: by 2002:a05:620a:4607:b0:949:7acd:3c31 with SMTP id af79cd13be357-949ba6b3d57mr1412216185a.0.1795364093887;
        Sun, 22 Nov 2026 08:14:53 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm239042665e9.8.2026.11.22.08.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:14:53 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 03/24] ASoC: soc-dai: export snd_soc_dai_stream_valid
Date: Sun, 22 Nov 2026 16:14:16 +0000
Message-ID: <20261122161437.5994-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b0314fe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=cE0UM4t--Vybx2cbpv4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfXwfK9CR6PuQes
 3YDWwfB6JJdaGc3wLgeNIfQK8tc+sooFcTvoxSgBab4pKCtTRFwMCFPXU9W93+lUYrcam5fsokp
 /dmwPJF2QT/yLYBKUkjmWK9fNXvEWGk=
X-Proofpoint-GUID: 0_w7RB5X_D9ChoIyDzejpnH0w6oHst8U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA2NCBTYWx0ZWRfX/WczrVl7r+oR
 x4mSV8dgqnR1QgLeq7p2U3/Par4CarYzOuRo/cIyox0vF9gCKhjxODOyNEtdT0LVkCshAuhnEHv
 PfOJkyjO8WZ39YD0Kr3aLeMfPLn5HIm53FSoVpHPH6lj+EXHnHlfIdcif+xACNptCG2Is4j4v1c
 zkVlFWF5BREQ5qEiTkKHO2X9jXwi+Jw5KqUFaNdfk8e6396ngsGU4gibXgumb+YHGiG+hhAum+D
 EWeyUzf05zHJB/PR+b1aCy4IE5+GW2ECJUUPCblAROLnWZmwxZLYFUNo1aEdsj1WqBE9tNk1D1Y
 3VsbLeyJiEu166iBJlYAA142PjbUk/weknsuClrqacAHBMxgpn3R2bIALwDLFvIyIraGY6Yl8fQ
 u/la31l6QwboZaaTel27K4OCKIbIId0tmUaRjdJAZ/oWBxCrxHNeXKCx2pAMjfZfvJK8VQFqPd/
 vxhnWlwp6224PVJ6ENQ==
X-Proofpoint-ORIG-GUID: 0_w7RB5X_D9ChoIyDzejpnH0w6oHst8U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_03,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220064

Modular users outside soc-core need this helper to filter DAIs by
direction (e.g. the qcom SoundWire machine driver, which iterates
codec DAIs on a multi_direction_codecs BE link to handle each
direction's stream runtime). Export it.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/soc-dai.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 9e34f34eac3d..5d6385b02719 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -706,6 +706,7 @@ bool snd_soc_dai_stream_valid(const struct snd_soc_dai *dai, int dir)
 	/* If the codec specifies any channels at all, it supports the stream */
 	return stream->channels_min;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dai_stream_valid);
 
 void snd_soc_dai_active_update(struct snd_soc_dai *dai, int stream, int action)
 {
-- 
2.53.0

