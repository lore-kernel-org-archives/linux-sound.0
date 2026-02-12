Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CFA225A34
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770888877; cv=none; b=ohBPzrLXUmb4U8UqMG4D7e5kGtPYHD6yvD4BkFaaeP75cTKud5xyVs/gDxJvekte44EfLL2ha0a0r4RrhkspoljHSTtgF9h5n8m04WC6fbI52/g+6iabO4MdCgXr9cGiaSFKrjCF4vfo7nloSg7TKiJyKt4beti6qDeZMVwHmRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770888877; c=relaxed/simple;
	bh=JKzQsqvvn/QrxTtsk0soO0/RO9MrT9U+hDkfsocgx6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qg1t9UzhskBfIZbzF4Sk30uluoe/TECEPagPkiJmxyiNyLN58UyqBJ/5KfzWYIPsctbX7gHkKkUr4me9tVPrEnszJf8Y4CG2g5wXFklP8Ww9IvgAdAx3g6eNNGs07YHKKJbyHdgw+MqE9AAHKQCmGq5KNc39f9fi3vaBQ32fuiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJSK29ju; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aDm82Z5K; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJSK29ju";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aDm82Z5K"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3SIFP357714
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 09:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uOBJM5I/IbTy0rY+/P6D1iiad7uG276mhGMHYEnpbTU=; b=ZJSK29juPjNW791o
	/gPZ8OUT2BeUeR5+UEGWQkRnGXjqRuvKuBo5HfMykS8+AolbXBcV8XTWyTclI1rF
	/d5mBO8IcpKrEbMhs/XNV+GjWeztj0J8wLDnp2CmxBIw0f+leCV/DZxws2SavqnP
	VgMGa+yX93KERvxFpDhilzqQg1az61wpPv3EA3hJPNnec3mcz+q6MRprGfs9DUmh
	ypw6gDf9PZAn+b4XYB1weesfgpKPB3iPavAGw9tjCQyO17HHyjZnjoYOxesZnzCY
	8Lbfdo1Jy9YeC+YGaIRhVT1jAlXWhWTvdlfEuuBX2lGsGtQdvr4AMOCHmilc46ao
	D/rEVA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8uy6b6g2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 09:34:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6d6b0f193so183344785a.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 01:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770888874; x=1771493674; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uOBJM5I/IbTy0rY+/P6D1iiad7uG276mhGMHYEnpbTU=;
        b=aDm82Z5KdWcqfdpvD9NSId/Gq0d+UUUt8nR4Ut/4rj7sKpGcOa4myBWMUsRJlEKDdX
         vqrGvdTS1/gaqkSvTq1jLlWk+eJStYjl6xAirZ/+QHDD2XSOLY4dB9aj/gnsWlK5gjHo
         +YwJUPeB2btFBkqHljGrzmSdZqfmATmO6bvbixoVTUjf3N2KQr24dsT2kc1NgmTIZvGB
         7SnSMHyZwzubOeYcJ7D5ZSMRAi5PUl/nePqIlToPO+jdyVgiyWPGuJwZU/W5dtu2V5qH
         TLAK+NfudjyBfkSyC5+RUuczt99/U4qPRB98KWhhhb4OhSFAW0b02PG2cLGdvLvXoZQj
         D/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770888874; x=1771493674;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOBJM5I/IbTy0rY+/P6D1iiad7uG276mhGMHYEnpbTU=;
        b=b5cFug2opG+ozsGwqUljRDExjq+Iit3Z35gtiOfvd7esqln3TXwXFhYy7LaTmvgdx5
         ncFoOSooJS47O+1uG/dGhI65IJAtGi/Q4yh97ShSMwbXvSbpWyzeI+SJ3Bof59EjXV8V
         UnQ2DLhWmlz7FuL/wZL6kgnqosEU7QnLs2rCLQWfjyXjukgCuCWE+BUCuC7jpOvfhOHB
         hnWMRypjYMK7cFD8n0zprxQii73hH0PK2SjsQDU8/FuEoyAnN3s13KQAkkY334fPL31l
         hORwhkVpTgrAUPH7OdAbdFd5qeUPJ2uoIDW12KaRxgNvRH+4mu3mfEeR82/Ysm6Yes7s
         XbTg==
X-Forwarded-Encrypted: i=1; AJvYcCWo0zF9HnxIjqxY6ij13xPOF9cofDWdcW+ddpSggfFXQvI9s/unyovrdYcyGpG/xQ0hKZRWY+TahtHcrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKmr2p4eZoS0ZyT36akt8frOywd8VW9nsWq2pTLxf/z/Asa5bh
	zkY7LukptTlcL+nCDkgNmU9+asX4A/bePcbI3abLv/zVEusvp7gGjFpo1fYlreaPMMgMbmNUgAo
	jbykOOfmlBYpGJHAfTgdhBnwy5fe8cWmlNtp3DkUKGXHCBM42KqiWK7F9Gp2fWZ1YLA==
X-Gm-Gg: AZuq6aJx78Mv9nVViSjUuU7Mqz0lyawcigsUeaqhxL+Iuf7LF1x4WPCSEyCcKNo9mL1
	rccBWE6WavwTBZeG/UxSjh5c++OcjQseq8nTw6NGQMApEMiTLknQnLai51JzpIy8BdvaqImc4Ir
	cL0yegBJbBf/5yBfFAua8vyVxrH2WNRqYKKQ04TJ5OSYy4vCKK1BqR30xkpaL+nadLZxG21JVu1
	MEE/MnxI0ugmU0FgAW60SR+Ka5qcd/PQZgR08394vN1VdlAzkP3lrg615JhkCrS1AuRE5x/fppH
	7Ul0UUuvKNW5xaRYQsfUfqrw0IbNpaJx3LuLHRQqPiC9URqhFQWLHb43ZPOezuj1sqo3tyH0Grn
	raN+yYvVtVeN89/dI9r8leZRqvDBehv7OuH3acEXzY48ZX6zMaaRtoP/uOCoxqHcPgZqBmryXGt
	F2POU=
X-Received: by 2002:a05:620a:1998:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8cb33051c2cmr238188885a.1.1770888873819;
        Thu, 12 Feb 2026 01:34:33 -0800 (PST)
X-Received: by 2002:a05:620a:1998:b0:8c6:a707:dae7 with SMTP id af79cd13be357-8cb33051c2cmr238187085a.1.1770888873388;
        Thu, 12 Feb 2026 01:34:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf38caasm1504713a12.17.2026.02.12.01.34.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 01:34:30 -0800 (PST)
Message-ID: <f27ec5bb-1562-4bcc-9178-4ff4d4fe00d8@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 10:34:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] ASoC: dt-bindings: qcom,sm8250: add compatible for
 sdm660-internal
To: Nickolay Goppen <setotau@mainlining.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Richard Acayan <mailingradian@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-2-mailingradian@gmail.com>
 <yxrhmblavwkuhfrfgskujs7tz7cykojnqnl2mfrf365lhdem35@bgqwiaft67b3>
 <20260211-skilled-transparent-moth-fac10f@quoll>
 <f1b67c1e-cfc1-4d23-a24e-4dd342edd2e9@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f1b67c1e-cfc1-4d23-a24e-4dd342edd2e9@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA2OSBTYWx0ZWRfXyfksSuXi6hWU
 I1VJ/7jd4LNQwZCEEqTGpl6Gu6FsaDDg6SEvOr2W+qy81ABAEDmHe5pDWU+TZC60PnQKHOZsm8u
 5gOEGRSWYI1Zn0Hqmai9aA1N7g/SbRetb19eu0Iyrxj0r3JdJzs9dBk8bCzNDKOmjA+WTRCfYlT
 /wADyNZsNyedSbkNju+vWanAcByDXsUaa0hNbjAysqesRGuE9Bm1PXOPlh93tcFyjdlW8YEbqyR
 XVM2z5xr7JqoeATu4JGLd4PzlNPnQHHLSUy+JHjzbccXdez0AgMmJYZ/2R26+i4AhN2SwsyEeaR
 rshgOSGgoqUHTaQ43xVPv3GYY7P/ntwcAX7e7cuLT4ZRbszGrCvI2gsNvv8JOH3s4N/977j1CtG
 H4amUR9QrYxbPSSt1V/mjUuL1q/1mj7fE2g/9+Z3WVTtEzonLCyZyJ+xAilbW5Ag7hKtExjsR2w
 EOn9ae8o5teiyATrpjA==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=698d9eab cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=qC_FGOx9AAAA:8 a=OuZLqq7tAAAA:8 a=rzGM_l7p_Wc7VUtEW-UA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=fsdK_YakeE02zTmptMdW:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-GUID: AzaOKTjSNmd6Ssoca11TSHDwdzPItcOK
X-Proofpoint-ORIG-GUID: AzaOKTjSNmd6Ssoca11TSHDwdzPItcOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_02,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120069

On 2/11/26 10:55 PM, Nickolay Goppen wrote:
> 
> 11.02.2026 09:51, Krzysztof Kozlowski wrote:
>> On Wed, Feb 11, 2026 at 04:11:24AM +0200, Dmitry Baryshkov wrote:
>>> On Tue, Feb 10, 2026 at 09:02:53PM -0500, Richard Acayan wrote:
>>>> From: Nickolay Goppen <setotau@mainlining.org>
>>>>
>>>> Add compatibles for sdm660-internal based soundcards.
>>> Why is it called "internal"?
>> Yeah... I am pretty sure there is no such sound card. You cannot have
>> sound card internal to the soc, because you need the external components
>> like codecs.
> 
> It comes mainly from downstream driver name [1].
> 
> Downstream also mentions it as int_codec [2].
> 
> There's also an sdm660-external sndcard [3].

It seems like "external" means "coupled with WCD934x+WSA881x" and "internal"
means "coupled with (digital cdc on SoC and analog on PMIC)-over-intI2S plus
optionally WSA881x".

I also notice some details about a WCN slimbus channel (bt and FM radio?)
in the internal one.

Konrad

> [1]: https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.8.2.r1-07500-sdm660.0/sound/soc/msm/sdm660-internal.c
> 
> [2]: https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.8.2.r1-07500-sdm660.0/arch/arm/boot/dts/qcom/msm-audio.dtsi#L835
> 
> [3]: https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/LA.UM.8.2.r1-07500-sdm660.0/sound/soc/msm/sdm660-external.c
>> Best regards,
>> Krzysztof
> 
