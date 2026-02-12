Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593536F2F2
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 09:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770890068; cv=none; b=hqsaByy35Q5EelXBVF8gR2PShs8E5rImsGtyKHmA4ityQZiXC+28t1a9eer8lcEMarVO2gKkA+suKB5wpA22qhax0kyurI+67N2UaP/Foqo0x9JR0DAaZVhBk1oO2+3ZGYzemCw2vLM35s/6OQuGl6HeeKS6P/hf8rU+GkTu9J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770890068; c=relaxed/simple;
	bh=GmhjAy/1K4MYt8nIX+HAxECnTCGqxrj7J17FWHTkP7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QSogL6FMGhDo8b7D6oJBcrxQpBpHsp/aLW0D3Ji+pBU4QHABvqLpHyLb/sTG7WuIvK5QVC2+XF5CZKPHy09qtz/9G4g/Y1HBJRSd/MnqjYEzyw9InNmaWdMGkq6p8llFwaQTYNkrrtrVTpHT0XMADVuVsNsN/3JEWzaXRMgApio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZSd9fdc9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGuN0IW2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZSd9fdc9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGuN0IW2"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C3SGae357655
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 09:54:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8lzCCbFGefuY3s1HMXqlLyHfK78uE4GSLWl0g/nFYPw=; b=ZSd9fdc9c/07uSUS
	6+VxZBeDwiq/hOwCVDIBbikHazgRRgs6IleJ/+jKM8kOitokeOFwpZo5F+FHmHiq
	CorT8wixcvkSkl5xjatM+rl2hQftKsTGMcjHRzqiJ4qiHVO5JFrjIZ0W6ygupp/M
	XgXHCs6UuVupIp1N61Ki8XYyKLK/BX5uEMvNy4WZVAMAr3pcYFFZ+laoe7oT7H+N
	Lbyg7Lo2C5oSgTCOCsQIZ+8qdDV6EThNlmzTT/6Ox9SYsBw5h1diT2lG1yi9Nu4R
	13BlO9TitjegoetN0Ao0eHFE4azOuvkNCm+0MGN1XTJsPrUI0LjEdegvCIxf6wij
	ZBRKrQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8uy6b9jt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 09:54:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3978cdb2so5927885a.1
        for <linux-sound@vger.kernel.org>; Thu, 12 Feb 2026 01:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770890065; x=1771494865; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8lzCCbFGefuY3s1HMXqlLyHfK78uE4GSLWl0g/nFYPw=;
        b=PGuN0IW2OIuPyvGS+ghL/dlL8j5O0f8haXEKIDMFXLriYogQI8FGpQhsLk7pc8jaOe
         ss7hFRtfcj+OI4W3J9232kiDOp6uDl+xsTrj+SaJLIARLKk7xFBvSDhch9HvPli6XPlb
         VaqDugvUQ9wwFRx+Yz0rIfbIaS2rqDLzsnh/K0ieiBHIF1jSpodfyDgo711kDOPDYSyw
         V7FzJ81an6zRHF5Fdbj1BUEaDWTyso/Z3s943rC6FcaEwNYtBt+C0X013XOZJ0VPueoM
         /zzjixz+6gc6rVhv+GZPZt/6IV9RZcG0DqEliqFE+h85faPrwq7tfxkUUthcgxa+6Z71
         uTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770890065; x=1771494865;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8lzCCbFGefuY3s1HMXqlLyHfK78uE4GSLWl0g/nFYPw=;
        b=ftDc+1Sy6IRpihOSvfJbxYEC+bYzk7sVIsAGTyDveVk6vE7ySUg16IsOImAzztobWt
         k7DsgHXCL0W4GbCxm9uLbMGudNVnpB5e5ImRBymhVFOt8tYGWKsLXiMhp9vDPXPwKZ3O
         TjtzbvkG5jtuAEI/uLBCqBGp7T3DxElmjl353uFqfkRwFyfHpsSAubpSHkbxC349+5xb
         xds0lTZ/cem92l+11U3UMPwLZYMQfd1E2fbNlCgp0zXCjKxd8gBxraf/Tg1eAb4WAcZB
         QTWQjkhzdsyJ1TuFbP69ydFa3S4Au2zq2be+kcp44I2H2hF7D4SK+pmI8hGcmlEOqXkJ
         g+RQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx68NCEvM8YiQmWdIbxZLO+2pX/K9gbhLQ3O4/4lxChzVTp6SzBwVrxZXPBls1HT8JoEUL9RsiqEiurA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4lNfdsBwUKFnmlEIaa3zLX2OPuCbdBieCXvfo4IS3dn/5wepM
	QHPXnjrDL+gvk43Uf3EEhMkHIM+wFajSxfu5zt9L8VXHMcvhArUHRDgVZbLIXFlra9XQRNsnQM4
	XqTfZ85LcVMs4utKu3a3hwGTMg3irwFx0WAWQXQVybP5OJ1+ziARh3/QlGiOrG1Lkuw==
X-Gm-Gg: AZuq6aJucjM+veCdyn+YHZKLBh+Elxj1LAhzeQY49GVBFtBsxugngAMhxsq1pMklYV4
	g7Wa/q3UM2nHeDIXRSXuLVUXTqbjviSEwmYlUbhbGtMiWNhp5XBBmmjEezw3Hige7myj+kLpLqw
	coXlUsYMdJCSWU15NEm6tI6rjQFrp6I7tb0DiKJHn6KR+utaILEjQMYMRiYDHHYjk1k1zUn5HWz
	qhkstWuKGFz/SFvPpPbRl3Tfms/azqaCYBIiZUobH4fRRlgD9NUn3l2CbJPPwGej1K6KKZfFZar
	huHGbXIz3oG6FLqu558P1RhtybBRV7FQ/w7gPCuSoOnpBibNGXAr2sQ5M2tbyViIWav+P0fsLA3
	ZkBk6tsDgevKhpJ+MbQxRN+9jCaYJhCCBxnW6FAhKlLk2qhIWYHMt8uEzUf8kkNKMQbN+2+A9Dq
	DdYmA=
X-Received: by 2002:a05:620a:31a4:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cb33093755mr205794585a.3.1770890065548;
        Thu, 12 Feb 2026 01:54:25 -0800 (PST)
X-Received: by 2002:a05:620a:31a4:b0:8b9:fa81:5282 with SMTP id af79cd13be357-8cb33093755mr205791885a.3.1770890064985;
        Thu, 12 Feb 2026 01:54:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ecadbdasm143070866b.62.2026.02.12.01.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 01:54:24 -0800 (PST)
Message-ID: <b1a1f449-efc2-48aa-98e1-1646f092682b@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 10:54:22 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] ASoC: dt-bindings: pm8916-analog-codec: Add PM660L
 compatible
To: Richard Acayan <mailingradian@gmail.com>,
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
Cc: Nickolay Goppen <setotau@mainlining.org>
References: <20260211020302.2674-1-mailingradian@gmail.com>
 <20260211020302.2674-4-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260211020302.2674-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA3MyBTYWx0ZWRfX0ytGPatHKJKS
 WlKMaAFKqabdhvtNvm1NJoD9ivcyoIxohIT+CIaQ4yLvJqAqOqvi7gTTRO8zLinBjJK+6noInDN
 ViYiyWlGqLagrYwuouP2T0Wh0ikqdlL4r9hfcMPqctwawotYq0Ygkust/GbmegQze8WjKFiGtfD
 zi2NVhglS1x9juUCQcZQ0sU1gK2B6sJg9T5GSPphjFWTekqlKpx7JLdi9bkGreZNDQXUoM6g1W2
 RW2b8aDZLuVh6yX7Gr+QUAj+4xnLcgY4s7rMbvU0kcbfAUvOkQIZgQllAAfUFlQ0VP/XKD2bDti
 ussh7Dpy9pvT3kLuNblIZ+E1TMkvPih+U/+ygE2rOyDehH4uO2EicqOcnD2mISvIKTBXfXuZLf9
 71bPOwaS5USI3PwnhJvdODJsWHIa+ekebKrQ4bll1DwvOBSak1ZjKOjPKWakhi4SeSaviHdNNK7
 4qsWVCuN41yzTPp5KEQ==
X-Authority-Analysis: v=2.4 cv=donWylg4 c=1 sm=1 tr=0 ts=698da352 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=0K-gYnqzvueuKcCJGKUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: cdXWiDLs2bEMLU750k4St4gZcXPsFIap
X-Proofpoint-ORIG-GUID: cdXWiDLs2bEMLU750k4St4gZcXPsFIap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120073

On 2/11/26 3:02 AM, Richard Acayan wrote:
> The PM8916 analog codec is also found on PM660L, typically connected to
> the SDM660 internal sound card via the digital codec. Provide a space
> for specific compatibles and add the compatible for PM660L.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  .../bindings/sound/qcom,pm8916-wcd-analog-codec.yaml      | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> index 94e7a1860977..c7424d755cd8 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,pm8916-wcd-analog-codec.yaml
> @@ -14,7 +14,13 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,pm8916-wcd-analog-codec
> +    oneOf:
> +      - items:
> +          - enum:
> +              - qcom,pm660l-wcd-analog-codec
> +          - const: qcom,pm8916-wcd-analog-codec

I ran a quick diff and they're indeed surprisingly compatible

The revision fields have changed, as well as the subtype (hmm)

Other than that, there's 2 new intr sources (boost_ocp and lo_cnp)

MICB_2_en has a new field
the TEST_CTL registers changed a little
CDC_A_NCP_FBCTRL and CDC_A_NCP_VCTRL have new fields
CDC_A_RX_COM_BIAS_DAC is slightly different (the 8916 driver doesn't
touch that part today)

CDC_A_CURRENT_LIMIT has new fields

and some undescribed-today registers have new/different fields values
otherwise it's seemingly the same


The digital part has a new rev/subtype value and some new
undescribed-today registers are added, otherwise it's the same


Konrad
