Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887912D8363
	for <linux-sound@vger.kernel.org>; Tue,  7 Oct 2025 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759832470; cv=none; b=WagcUUdKx9j2hObc845pcU7sWiON6dX20qSU1dPRyCVaIay41ey1pSiF8iSjHjPcXtz/XsoYV4Z8yGNfgdvZ2PsTdCq1sRdv2JWlwe6mmAy2g8gMFISxNJPz1sk+UjwV27JiG6KCFJSD21pKM6BTxkbl3gQ5tTRPe5d8d/aZp/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759832470; c=relaxed/simple;
	bh=KlWcesGR1Y3SWb2Pf+LplrfVxqm952BRg+WXsE+1NQs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z3RbM+2WB8UAh2KLgsACAmIFq1bMr+zqQMnSfgh9fzDT98VNMq/7inclDa8UZhSqyC4reHtrTTk8Q3E2NwLx1xFPYvjqTPlqs+LC+Cft3IQUob18EFXHnJ4exiV1xn4qPhJ/ik3a9oAg8mOWR26Di1fQVoM1ZORvvel8GSW0xFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O+ycNSwX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O+ycNSwX"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597A5gNh006173
	for <linux-sound@vger.kernel.org>; Tue, 7 Oct 2025 10:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tIo3KVM+K+vyiDHJB/HcD4sh2FPBitsVu91g7TQ4ScY=; b=O+ycNSwX3MX0aqxl
	Dkk4gPB5u1MUP0WEYGqTFzZZJtfONNuB46zqc84Q06K4BJW5Act4A3HfY6cyXuFf
	P+GbZ9/TWBJmuIj9IEAAODyXSyswR78fcRhMo2Q5idReHwFP7eUXsL9IFBe9+UL5
	Hq4KZhMkyLmfNbyBPbj9WsU+pLUXzAod/DtugcNqm4Ik8s3bWtr12n+Iin2w8vXI
	fLWD3sKuqmrLGDxXyskJvMbDcNyb31USMMwkk3imLOaWxowwfNpqJqiuGnxhH5VW
	fLe02yE7ffaTyfLNCi9LfPKLuh0MzVZTTxXX6ufpIX8Xbas3a0uyMlFrHzPU3Yh4
	SmPbBQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6xxv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 10:21:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-873eac0465eso22839916d6.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Oct 2025 03:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759832466; x=1760437266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tIo3KVM+K+vyiDHJB/HcD4sh2FPBitsVu91g7TQ4ScY=;
        b=isosQm1tN4fsQ7poN1WuB1KCbWacLoCQKFCjmIzEwaGUDl5G9zTy7oQ6zsXW+3+TdH
         fE+4POPFN1k4KgK67+1Ymrs/s8RSa22mUuCZwn/WnGM7FKWlKOEcID3M0u2684x7YCM+
         zhblW7TAHB7H1s5vOuaiwzx3GcsForoC1+2LxsHWbSHHZptuqjZDv3nWhK3fmUU0m8x7
         0Q+34HSR2iTglVQ3ZRrRd7kfJhB5FpqZWzWn7aCCFXgtUDlk90IbW9DT/uVoQkmbKVRM
         AVU5i796znIGTJzd2ajcYhFq5peAgu2kJadJK4UqdOo/zNb3PxtWRTmcvdhImw2iHo8D
         1QJQ==
X-Gm-Message-State: AOJu0YwNrespcKsAyY7tYZrX9F5KVddFGA+BfwC0Y3RqYkRrEI3Il+yb
	wObyWvZkA3tIeET0W3IjXxxKPzzb8As2tQgP8r2WiUFoyEiRCmzNa2PdXLk+KLmGtWEsw05pz3i
	Ulbeb0KtNbl8tY8eQ2efMeOSP/WRvqTDxRkBlz7QVEUgXp9UEWXHpD1yAGrYCLNvwsQ==
X-Gm-Gg: ASbGncs00Zyn7Q4PQPE8hyiILLZa+qWckK+9/Oqa2hbpE/OCA4xcz3CnND5q+0KITfz
	64D497wGVQHuPftED2s0CJZvXKlqNFf6K/ejfNEHVg7t9CZiXrKSi/EYoYZ1xZ01fxH6fgPPs+l
	YEKOvktghIayjo/dXZ98oi6FVD1W7/nbD7i3+v08pBiZ6JxsQVqzp4JgUgeF5hQD7zMeLTWh0lH
	vf4kcLl2eVfv0rdI6y7As8nRTXh5kQG2+YfoVBjrr/mLoBnWqjp4jYFlMHJwL04h3etpAnD4i+x
	TVB1Nm7Xza9W/G3XQx0LTcMxcM5kDLrA6KVQQj+vTxQH+JBCOm37kM4l4vDbkTNDOO4QHMSx42K
	ivHlW96juwLsgRaoa11NtmWthYYk=
X-Received: by 2002:a05:6214:486:b0:815:2731:3f4c with SMTP id 6a1803df08f44-879dc869283mr128952206d6.3.1759832466057;
        Tue, 07 Oct 2025 03:21:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY3578mf169SfhBSI1JAa+gLNy0tM6jidBQPfZwdM2VQXBIOCyg9olplyRBFv973g54ofICw==
X-Received: by 2002:a05:6214:486:b0:815:2731:3f4c with SMTP id 6a1803df08f44-879dc869283mr128951866d6.3.1759832465465;
        Tue, 07 Oct 2025 03:21:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6394bec298csm9271021a12.44.2025.10.07.03.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 03:21:04 -0700 (PDT)
Message-ID: <6d9af57f-9174-405b-9131-145fd6d63a5f@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 12:21:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/6] ASoC: dt-bindings: qcom,sm8250: Add clocks
 properties for I2S
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20251006-topic-sm8x50-next-hdk-i2s-v1-0-184b15a87e0a@linaro.org>
 <20251006-topic-sm8x50-next-hdk-i2s-v1-2-184b15a87e0a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251006-topic-sm8x50-next-hdk-i2s-v1-2-184b15a87e0a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfXy7mZWsHdIqSR
 RAMWxkdky49v4Grihl7Tb44Bk1IBjIEEmxLt3/u8NzkrdM30VVwHFbC+waUXTjcCueNLI4U+n3b
 5yb2eIGco46phazyVc2hnTzTyk1WOvXya+9RVhVILGclUg2Y9JOSxckML3nT//pvmbYWZ9xEmY7
 mGCyAG6qJV7vgLR2WMrrEIV/PB7kBCyNDPp5r6kXE8iS4vSkhjPBXwrnUXXvu/zvU37Eu5hDXdb
 ucTwzTLLMApq1X0A6Hjpa0VeyNFxMWPKG6El2+tlWbxQ6K3fUmvj7IW7G42g7UkOIIbMtyP83Bu
 Im6+jD+sz5eiPwxcpBn+O2pLoKEpdO0Ym7Jj1WCQpDxzM3CWu8IbuBb2cjVuKlSVmSJCd1HtRYG
 qdWSqnaJ5GeDz7WtGECXyJ8AeSRcbg==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e4e993 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=KKAkSRfTAAAA:8 a=MuNeFZabic1NT7NxDHkA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fI3_Pk56Krp5fdsfdNoyizJ7wBLcSyey
X-Proofpoint-ORIG-GUID: fI3_Pk56Krp5fdsfdNoyizJ7wBLcSyey
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On 10/6/25 8:37 PM, Neil Armstrong wrote:
> In order to describe the block and master clock of each I2S bus, add
> the first 5 I2S busses clock entries.
> 
> The names (primary, secondary, tertiarty, quaternary, quinary) uses
> the LPASS clock naming which were used for a long time on Qualcomm
> LPASS firmware interfaces.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

There's also a senary (6th) I2S bus instance, which there is no reason
not to describe

>  .../devicetree/bindings/sound/qcom,sm8250.yaml         | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 8ac91625dce5ccba5c5f31748c36296b12fac1a6..fd0d7a7ddc7b363a66e1e7bd72c7290666efb511 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -64,6 +64,24 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/string
>      description: User visible long sound card name
>  
> +  clocks:
> +    minItems: 2
> +    maxItems: 10
> +
> +  clock-names:
> +    minItems: 2
> +    items:
> +      - const: primary-mi2s    # Primary I2S Bit Clock
> +      - const: primary-mclk    # Primary I2S Master Clock
> +      - const: secondary-mi2s  # Secondary I2S Bit Clock
> +      - const: secondary-mclk  # Secondary I2S Master Clock
> +      - const: tertiary-mi2s   # Tertiary I2S Bit Clock
> +      - const: tertiary-mclk   # Tertiary I2S Master Clock
> +      - const: quaternary-mi2s # Quaternary I2S Bit Clock
> +      - const: quaternary-mclk # Quaternary I2S Master Clock
> +      - const: quinary-mi2s    # Quinary I2S Bit Clock
> +      - const: quinary-mclk    # Quinary I2S Master Clock

I think a single top-level comment saying "mclk" is the master
clock and the other one is a bit clock would suffice

Konrad
