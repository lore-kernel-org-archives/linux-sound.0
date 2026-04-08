Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 373BE39DBCC
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 08:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775638774; cv=none; b=D5Jp/YyqobX8UkmCelDc7U/01lwhkLuDEz0QS6cSXae59nld6LXTD0VGlI01X/zUoCmtd8T5k6jMoZ1WFfSfLnaLZRvK3nM+BNnN5Xk3rR6v3RRn3b+5I/k/Idj6NIDVSIb3b2FYSmgRpPBYz87vfLqlTy4GvhYRZc377IqBGrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775638774; c=relaxed/simple;
	bh=rFkZf2w1nBJ9soa4SB66gP4TV9/XUpL9rJLEEkiqYr0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QxvGRQh802V5o+5y9jTjBTyCCzeKURyFS6RY3trrKIgLz1o14EaqayOot9hk9lGwafxfJTTIoG+8gCcdqt1reiY5l5xqurzaZSfnmNQCEabrnbAxxsaI0RVoYqWySuZMBKi9jqybRZmvVdFysQjiAyHs4Wv3frLK+OsMw5s/OWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lklu30Ub; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hawqrtZc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lklu30Ub";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hawqrtZc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6387YPtb1259479
	for <linux-sound@vger.kernel.org>; Wed, 8 Apr 2026 08:59:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUyxIW/i4xT3N34Xx3dygSkRm2tUQ3zinozI33xIahQ=; b=lklu30Ubr2+bgqCN
	k+TLL6RWeQvi6XjctS61beAZ1IEPVmQ9T3JsG7u/6qKfLkKf3aietmLZ/3gyRage
	8lnBS+UCs8AtgMC2l1D4+WRY17YCAtkp7yBgPWjT4PXyWhaF1Uv8rp/vlVRVX2aS
	91Qv1bNnH85LNCTXlfaYWraR8hvFga9g2wTt6Oq4PvwMIsit68rcKimPoBRcKLVd
	Y93AxcqHQPHSY5Q94Hy9Hofkr1yw3TFsJsEvehhj7od2NUgVB+xbTI11sjCmzGHD
	AB/8MTyF6URgR6Ps8fpYbL9A2Uy5WpAWORkfvmI/wvkU95JAeerFL+dDks77TDkc
	KjHDig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddbttsr1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 08:59:32 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d8c183c2eso30048681cf.0
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 01:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775638771; x=1776243571; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUyxIW/i4xT3N34Xx3dygSkRm2tUQ3zinozI33xIahQ=;
        b=hawqrtZcDDHLxmwAEPug/TftEpPG+Oi4ac9rCk42QIGBnkh1M9gSu0fkNhH5VLhNn7
         ezSN8XFvIIgxIu4icks+gz4FkrkHG4YcTwHJGV6JNIYwiznGEV5Qtwg08km1e1V/JFtG
         T8eIrzdMGxYtfVBRfyG/yz2qfqeVc1sYByEROF1nsWN8pHb0LS17gCvFC8xr/bK0907t
         /MmRZRTANWxtoHz3Owm6uBl7/u2TZh8pqPUgA9euioSMdalosiNMAIPC1OWPXbs6U2VC
         K5TOuW576NJiBKs8+nyUV5cNVup/OI6UcbrznIXPrflmVmqiMShyq50pBjASmwVnRG9y
         uvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775638771; x=1776243571;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUyxIW/i4xT3N34Xx3dygSkRm2tUQ3zinozI33xIahQ=;
        b=ddKQWGr1uEeP+jwlGIO3DHEAIWlME4YJUkOK55iLbOlKKqmxPvcNQr2oBHvZcBSacY
         Oe8EDj88ilO/UpERiLpcuA6oCPFpdK1iQwOPZF7b04lKzxBl/1I9fa0XJFlDzYKeqwcp
         hSOGfk15W+K9ZmC5ekXzz3i20iSTzCNigybobbLXdgs1tIoTaTOUReizGz4eDF4bUfG/
         Y3kkFKWSHx2JaQH7MO+ba6AfMd+6yR1NrB5Sc57yWNn0nFrEbuxG1Uf9ubQh3b7A8ADa
         QHTQ+dh4IkzP7PZ5EM0QrwAQc6d/u66RLeDUPKrTp7G6TRHkEHzAeJYSRsSJjl8Sew+n
         F1mw==
X-Forwarded-Encrypted: i=1; AJvYcCWLglZzHIyVPhCUsUbO4S7MtuhCxs/PgNMYzleANtwaHduT9pTZcx+6PKqkoRiC40hZRVqQmAp4QH56Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzS/kMOBoXxExlDWFuMcLY+l1edGNvcmT+0nOuokg9npQfacN6g
	lxUlvBp25dmtGPZVlVPq0C8WNdlmA+kJjScbGmiFAbUxjSOmCy8sev5TPVnweLCxwTlCQWsqzQy
	AC4dMn1qBTWOGkVBG/tR0jskrz1TX1ILAWZWf4mx3fdkABsaW7huzejBR3OJKIUgKKxd9GUaUJA
	==
X-Gm-Gg: AeBDietBTuXxJYqZ5Qf/y4aLQekDO7d5cD8hie6pRCQIjM5Skmy4SuX+a6DNFCaskGl
	1G0PhW1TJf9JexaQ8espee44Lpk+gxIMWM4Rqn75WpvjeNdEs4gNhd6JU8+tVQyF4DtK3IXsqtF
	akNlYXevL9il0UV52R3FL5nq/w5eN8rlBtfezXuFXFj1YIXA6Pa7u4ljtKAKpnrFA5TuzN1Ycaq
	pFdmMx/EXq7m5SUcbSX7wWgMFjsESJZIR9tSv4vmpcg7pWe0vquPE10QXEcASOhUAsbizyTFGIv
	Jc7dHppMZJ6FdrhLeiL/rQ6mkw4nqy/soOL638L3I+WEU212SqK57pHhMEGo7VdwPnUkICpv86o
	Y3UKo15tGgdRKrXGJufjR6Q9EGMFuOhbqmeuGykTbxsQI8NU5vA5fd2qjUGpefyJzaCbos4/IO+
	bYlRQ=
X-Received: by 2002:a05:622a:260b:b0:50b:5286:f756 with SMTP id d75a77b69052e-50d62c83682mr219884181cf.6.1775638771437;
        Wed, 08 Apr 2026 01:59:31 -0700 (PDT)
X-Received: by 2002:a05:622a:260b:b0:50b:5286:f756 with SMTP id d75a77b69052e-50d62c83682mr219883931cf.6.1775638770970;
        Wed, 08 Apr 2026 01:59:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3ba180ffsm2935966b.35.2026.04.08.01.59.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:59:30 -0700 (PDT)
Message-ID: <bb21b9b3-7432-401a-a0d0-1b1970f27770@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 10:59:27 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 UFS controller
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
 <20260407-dragon-q6a-feat-fixes-v1-2-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-2-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cx9qqpW7HaatUEuT1tJmdu81g7gOTLrn
X-Proofpoint-GUID: cx9qqpW7HaatUEuT1tJmdu81g7gOTLrn
X-Authority-Analysis: v=2.4 cv=TOt1jVla c=1 sm=1 tr=0 ts=69d618f4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=JxrhfIILcghro0na2cYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MCBTYWx0ZWRfX2M/0o5EMV9R3
 P8JZV0qoz6cB6iVdDknqQJTk4lxwFYsH/vaXECBqf74bmYQZl7yFs4t/RdI96FI9r0EeZk3qm48
 KhOrmcRhfG8Ev9uyNkQEuqD5HSHlFrBh5Gaf5+uicSwx4f6Z+EIN0slo0vcFxK7yNKF3kXqaSGM
 /UEo3N7KG/H5MmsYaww7yoiT5dA8PP7C52PrQFgVmhSoWZrckyqvCb3AR7dqm1vQTMvwsUGzsgQ
 +zP++f95ncug8rwBswtYhxbh5XniOq5X0GxaItPEwrJIvjDJFof3iUZf7Gs0W19BW60GJQSb5OB
 NicLR/4zzgYVgr1fn5rMSfzs1LW2uD6lQgOcpC9lJrbbf3vPbBarW7c2RjuyUe/DsD5C+fSS/nS
 pQfvyYMmP2SJ9N/FwY82HnmafInUpr2kPiytwIIGgLgY9IkaGmbmCMi044gY2xcjuImtvCEf8C4
 uuArLpqBT1Svxgt2N7A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080080

On 4/7/26 5:19 PM, Xilin Wu wrote:
> Add and enable UFS related nodes for this board.
> 
> Note that UFS Gear-4 Rate-B is unstable due to board and UFS module design
> limitations. UFS on this board is stable when working at Gear-4 Rate-A.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 23 ++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index bb5a42b038f1..c961d3ec625f 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -959,6 +959,29 @@ &uart5 {
>  	status = "okay";
>  };
>  
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
> +	vcc-supply = <&vreg_l7b_2p96>;
> +	vcc-max-microamp = <800000>;
> +	vccq-supply = <&vreg_l9b_1p2>;
> +	vccq-max-microamp = <900000>;
> +	vccq2-supply = <&vreg_l9b_1p2>;
> +	vccq2-max-microamp = <1300000>;
> +
> +	/* Gear-4 Rate-B is unstable due to board */
> +	/* and UFS module design limitations */

/* it's a bit weird to add two single-line */
/* comments near one another for a single paragraph */

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
