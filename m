Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06ED433A9F3
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639016; cv=none; b=tgg/u8WxyVM58698uU4s2Qia69W0XZuy1fYuPk5XcILXy6TXM91pTrOcL/s2JEXENyX3Hk2yPWBqfXYt9f8eSt33aNeXAe4pBIKgH9/SIqHbCP4YWXmJNqCLoEGjadfEMo/jvXj088AZQmwDosvd+JeoAoUN2Uegcd3njOAs4AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639016; c=relaxed/simple;
	bh=qtAPjHtFy1QC303UWp4Zog2Y2bK1zbLKgGJf+EO/B7o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K/qZTPmds5rcl/yo09WofCl3cQFkryzA2JvPQ4+kZGTknYXT3A0ikxfmfTspZGUNGBB6g+AAUKCTigyYyK+O4YBpijrxLkiUBYj8uPeUcC45+qH7Ncc41ouVHR8Y+4M6dN6KkFQnlap7bNgmvB6v0Mmc3T7//lu0YJ+3Hp3BzQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DYtO2rbx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qn20aqs3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DYtO2rbx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qn20aqs3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387XkIg1259505
	for <linux-sound@vger.kernel.org>; Wed, 8 Apr 2026 09:03:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	05pPQWXmaZE21YSX9k5MuQB/rWL2A7Kfjn7tOONZ45I=; b=DYtO2rbxtHz2pFF5
	PIngN4TlEZHpKonzDXkr+1s2VI8Jst/07SYylqihmDycwXxO/Hed1+Ldc/cTNasL
	eUWYgAt4ACycPM25rKAoW+2smJqf9JRRsVTiN/h4KS0V8UIk8SPdLXsc4YVfatkC
	cLH/IiPKTfqqMbzXjUTLmzH5KUPTGDay4DUk7q4c67NGHeK5m4lKruEl2kgffxnw
	pY5kts+4SfeCa8kbN073I6R/3znaINUHOhWnIYjtnFdifHPPSMzOOk9JT2LFQsyX
	qaZP5MtZdOTnpCOZMCXbgUKX6DmPt6BMe7a2J/hgJCWP2684E/qKFyUu9Aeifgib
	cpsVuw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttsrmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 09:03:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8d63aeaaedaso118974085a.2
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 02:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639004; x=1776243804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=05pPQWXmaZE21YSX9k5MuQB/rWL2A7Kfjn7tOONZ45I=;
        b=Qn20aqs3JJpqPa7t+03mk0eGP89+wpMqTjRk/4GCbbwkUHRtv3hfLf1/MWAJi8Ultm
         ASxfPEnNKREbGbo+cjHbuhYrxn78U2IVKCMr3KPXQgspPW1d4piYYpfXcAR6HG/AIV+x
         oy/mr0oF4sBX9Bsh0b2CC8R/7+tmgHysTJzoo3pZgg0t8m1/zFFUB4dmueaBxy380OV1
         MlOHX1d1TqyE6qXTYw3gRhg/tCs9kEDl0mKh1uxQIzAJVlmJyrTgpLIGICGmhZKSohxU
         XS3bpWa3tWbmyAFWlb2BP7uH7JHEKQH/pdiF3dPgPrrSn4S4tGvKkl97JlSrwzCJzHx5
         Y2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639004; x=1776243804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=05pPQWXmaZE21YSX9k5MuQB/rWL2A7Kfjn7tOONZ45I=;
        b=iMb5M8Rq4yEZ8TYi4ctqExfLddX7UtmJ7XKRPyReIkIn8lFxgBZtPHK3fwatKolTjm
         AijeG+ejVLJM2bVL3rLdlc7iih50X2ksDjsumeIaIxUXVe8j4BB7ZwLDm3ZlWK+NAYXi
         qZeYvT3GTVI1OUfxs30koIUvGy3FoULiGwY9ASs/bffTe74R+Y+z+VCJm5bndw2oF/q8
         EIGbRxWb/gIImRkPRrEBBVBaY/VlOu4cuLAQMRTUofmoOVSJC28chQpi0f1XG4BkdiXB
         H1gQ9zPEPasF3XZvV1NPUNfIEixddj9ieLPX2nDu1ln6jdYdaMKQ9QezsiEiI2YZ1R2c
         4PHg==
X-Forwarded-Encrypted: i=1; AJvYcCVX6YZYYrIC3PHnn64g/qIir6EjMxA3quFoR7vYhIu/AgNPXurjX9BZCPTZjKtCmgNmgct85tKv14t1ZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOinAGGuCUeGd8jwPzCOOSnNc6gWGFjUAaEJ0IiCaphLOzwpEp
	f/CL9uL3tuHEFHN93v/WJQzl1UO+ZWj+QjcMUQVNHqXR837HvTsyIH9BK/Wb88TudsvwuIAwFPJ
	zUzeHDpekW/AkCc0z8BQkghWFJF5G7QDbkwl0W8imoac9QadagmGUiLMVFnzXnQvEXw==
X-Gm-Gg: AeBDieszjSdk7O2xxnrdsqMBoaQFwUVG7vqZRm2DR++Ayv2HWwRSWMAUJX+ZciIXWQu
	o5ZCjh/3hAzCDcH6v8fj/WJSWnep5gYKfS6tGdvvUrcBvPpWSLJ0ElEmW4S1CcuFc9kdZTYJsNE
	LMVgab/YbytG7vW75zmoUy4qBgSqZ9m4piX5EPBKBsyUSqiiVD2pL7P6HHk3D5zLLKrZztYnJL1
	clQvpiK5Q3mxjIoTiVnoFs36mhyyrDS6j4ZESnCHRi2v9P9oN4vcKWQNdfE8wYklKVidqHcmZHX
	NH4n5VlY7fWKJPQC9EiKKUn1/usKsD/vlSmC9kXkuANiDqghM6sN5Yh7yYCr3AhfHZYaBJfdTuX
	pT1yfweKDJyWxQzLVAkiURus2b4yU5O15NuJmtgEgkVHJ3+hOvde8qCOiAmI2gENzO2shLKaGgW
	cbZCA=
X-Received: by 2002:a05:620a:7103:b0:8cf:d5ca:adde with SMTP id af79cd13be357-8d41bcd66b4mr2065924485a.8.1775639004187;
        Wed, 08 Apr 2026 02:03:24 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:8cf:d5ca:adde with SMTP id af79cd13be357-8d41bcd66b4mr2065920285a.8.1775639003741;
        Wed, 08 Apr 2026 02:03:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e06479211sm4714624a12.0.2026.04.08.02.03.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:03:21 -0700 (PDT)
Message-ID: <eb745e3f-4bc6-4713-97aa-1a1a584c9a9d@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:03:19 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 USB 3.0 and HDMI ports
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-3-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-3-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 0fNpVvNTBcG7FbciHg5lEdeGB2JyYxuG
X-Proofpoint-GUID: 0fNpVvNTBcG7FbciHg5lEdeGB2JyYxuG
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d619dc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ksxQWNrZAAAA:8 a=t79OCOewZTQouAeCdlwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MSBTYWx0ZWRfX2ZUXUWidKKe8
 bBNn9inMzWONZSobe557Eq71ItSb1IbbN9sW7PclNNaQHNmYANwjpAX4nwVbjkqVRePvj5r2NFB
 FemYHcIlQyxVhV0c/k2RZFoYaLPhsw+9P022eHtC8ny5ADYxsO8U0YNjRkNyTtqeu7bAf0PkNU/
 CMnzUkhDx8mzapHyQcjKlc41C8UbcNSQV/lITqexeoDmhEr0djhNyOIY+LQc3aQ+cqkMmaagSfZ
 xv8YC7HYxFBivZTGpVFJvcTqbef5DaUsLZzWKZKSbNnimfxP4rlHFUpcgaM6AMZ1mI3cduzV1Qr
 wdPirU3rHn07XmT5vMlYmy6OmTQcP+GutX/vjKShX6ezFxDm8a50PR/B3PTIeQRsKvTUVaY1CaQ
 SwY6tHaiQBSIVoJk95uZRICsWJvfPvPh8o3TWnTGW1EOJkdbexn677xuMmxfFea4bWCnfpCYrYo
 4810s9EUjaGPUqLPzcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080081

On 4/7/26 5:19 PM, Xilin Wu wrote:
> This board doesn't feature a regular Type-C port. The usb_1_qmpphy's

I guess the receptacle on board is power-only?

> RX1/TX1 pair is statically connected to the USB-A port, while its RX0/TX0
> pair is connected to the RA620 DP-to-HDMI bridge.
> 
> Add and enable the nodes for the features to work.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 152 +++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index c961d3ec625f..8d649b3a1cfa 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -111,6 +111,71 @@ usb2_3_connector: endpoint {
>  		};
>  	};
>  
> +	usb3_con: connector {

This label is unused

> +		compatible = "usb-a-connector";

No vbus-supply?

[...]

> +&mdss_dp {
> +	sound-name-prefix = "Display Port0";

Hmmmmm.. other platforms call it "DisplayPort0" (without a space)..
But I suppose this name needs to match UCM..

We'd also normally push this property to the SoC DTSI

Konrad
