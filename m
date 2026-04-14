Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0819D3E5ECB
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 11:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167925; cv=none; b=H17UScQVNXm2SBPLRMzkrb7XF7q+AgSxJcLUwsfeLaZxum2diDdnteWSkYn2LpA2Rbp7KnWFBfg1sVRb++EK27SdeeJN62Rxz1c+bNGeV9jPUvtPR6LYv8uH3reDiehs+tXnehKMMNC/OuGNPX7y4ucdj/qbyzVWbIx9iZhDGVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167925; c=relaxed/simple;
	bh=EEFObfF/Tpk7ryEqe5WG4MfQjoGFMoxAfSFegUKj280=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rG5qML99r8nWrZW+C9cfeENvPLAPm0sNx3aka73r0bYiDf0PjT3h+haWwRUy3FKjK6ck7o1TbTkrgFWm4U22HfYJcjc8Uk5NYhmhc2n1rJeBekxFq16HEMfWV3YdkxVdMLkFUlz25cGWNaK2rDfRCGlujdXZvPjV9Y7xIMSey1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCkcZuQI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EFUXdD+v; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCkcZuQI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EFUXdD+v"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EBMfAg3683118
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 11:58:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDilR4M9sLaIrKdGwKTtDzaVfHUGw3MciLQMoFnkS/U=; b=PCkcZuQIsktbyp5q
	IRuvFaQR0gxX0Bl61kMFDGGSE19hkpxiE87+A0dGLE56bRs06akUveHADWL9zXQK
	P3Kr/G40BAmrHBx8xQGcxEAj9srSiMGecpOvqygF4+qDy/tvTvEnDyIqSNIiMFhv
	XQSnSqUH3CH+e+EPLbk4Jsqxf113i1yaYF3/shNEt0QtGXc305i5fA+s7EtsD19R
	ZsO9aGWBlI9cMUpc1ofkgLcO/kHxesmO8QlEmrtaqnxfFfAkICe7ytugp57SFhe/
	DcMif1Vn9FlGgVfeXaMoZHSgWs2uk4k+YtaKaWhjqBWtJ8Ean5GShqkLA9HSIgFD
	nAGm7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d2jgc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 11:58:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5073ed1ec6fso14523291cf.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Apr 2026 04:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776167922; x=1776772722; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDilR4M9sLaIrKdGwKTtDzaVfHUGw3MciLQMoFnkS/U=;
        b=EFUXdD+vwrw76LFks3ofuP0zCTR8mIYHdbuvht7cESKbtwr2GowmV4eElhDuDWThF+
         K6ulpJ6v25YKTJg2nxpYHnwrN9HVn9rbwfnV58KLYfWRl87rJz9bzZZZntQBdv5Mv72O
         umqv0rxFS2advQV1QMrYIUgdmsPH5bD7v81pum0baoiX3uAclbO1OHjeOcDL6IHA8ClC
         Iwi51x0kcl5HCVuHgoDtDm1aFgUv07NnAoeRM1QgedSVxm7LZ9iqR6jAcGzrdlgBKWw7
         2GYYS9gc1Dt/b2P05WZwxBQyAT3KsGA63lviGswiP2aoUix8KMHVsnb/w4zvnyC7mrVj
         lCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776167922; x=1776772722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDilR4M9sLaIrKdGwKTtDzaVfHUGw3MciLQMoFnkS/U=;
        b=Qf+r/ws/JMfSGmPuMqV2nSCOzDueeTajUl+cjkYGRiLUEag+D0bRhB50ikoCbn7NTG
         jmx8J84g5xQWVmXRSe/PnG/xApVeyA+foQvFGE+/DpdTNsnVejjhFM9c2bQ7pBs6V7hX
         hJ4mTkGz3f2UC9bPfmuImSZEYs/RdydQZwD1fmY68jb/r0SmM5n8ovyFdlP4nmg1Ub0E
         7crOesGrZe7MrtkJFajcFJwCRU2drmVjburTCheMobYCL1a3ZV17zuOMLImZcaLJKAGa
         fJqc8+aIykCJpYYVwVMgCJ+MN7/ZYbQFWslIyqAsnbt7jvblxV+iky0wAWGTt0XS2Z3g
         wl1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/O8dZNr5XJo2zgkn72y1B839xKITrjR/m7PaErX8s/6d2Vx5hup79SPUstU8luQFh2tOTmiVBsgOTGdg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5nKsi33xdO2VYtuVuugNw4tFv4xbYoS2wJAqzd4Ae8u7etGb1
	ayz2vVFkZuXy+EhGH69dSKVeOqR9aIKavqQQtBZIDGUeFGby9gG6SokohWj/iEJ4mcZc/Bj8lJO
	7LBwSNt4Ghrl3mXnTOjBGEpPpN2RFNDqoIXrNVxCswtumqYihbZdy5dOVZY5ROeeazw==
X-Gm-Gg: AeBDievPa2AExi/UL1ZYSby45uQq+aLOTt+tpyLnqfjVatYPDy6EgJE/zFKsv/nuGe1
	dMY53xUJMvvyqiyM4IkR6SBi6ZA30apZBVnytx8MVT9xutWHO9MRpY6E3+xqCsNPHu5RbmiwehG
	yrlnd9UcuHOqIlagt+xvkGAzy/9w2mGt6AogmVMRdjKHTmLOWjJzzqaU8RVSRc7QVs7l3NiPAwG
	OVWP3r7hW0kEEeAzF61qRPCEfEC+137Rh4D3TDih5Rq9MRzqZijAzPdGdDCYUcR0vlkFXawWJxB
	RfHew8jYtTXgG30heMjJNRg/8vxAj7+SVvVdBVgwHI2S1pz7h9Nw+JcJBDFCckJ8g0lALB7ftMb
	WQQMlWkX01OXkiVgflysila/E4twyRcaB4RJik90bpMSJwiL+bssGr90h/cOqiMTpIumk6TPz5y
	V3SDVfMYraO3sxPQ==
X-Received: by 2002:a05:622a:44f:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50dd5b0ffcemr182739041cf.2.1776167922349;
        Tue, 14 Apr 2026 04:58:42 -0700 (PDT)
X-Received: by 2002:a05:622a:44f:b0:50b:6b21:2a7f with SMTP id d75a77b69052e-50dd5b0ffcemr182738731cf.2.1776167921894;
        Tue, 14 Apr 2026 04:58:41 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67205b178f9sm150130a12.29.2026.04.14.04.58.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 04:58:41 -0700 (PDT)
Message-ID: <19079a5e-655b-4099-8cf8-650e8d743e49@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 13:58:37 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] arm64: dts: qcom: Enable secondary mi2s
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260413091937.134469-1-kumar.singh@oss.qualcomm.com>
 <20260413091937.134469-2-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413091937.134469-2-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDExMiBTYWx0ZWRfXzrdiGS11ImEu
 yc0ZhoqDHllmtY7vtNuLkV80Ab7BC7OclvBzmsDjEDfwR/5KBKkNGVhPxnOaFEQOOlDISHaN8R0
 CGTUTRLwerQk6GacRTIhkojBK57owN2Oweyo/Be8c9PKB2CrFaeR82EXMzGVeZci+Dij926zVuI
 +1DKKISNIfGN31myklRZDpGx/35SLzQzT7ubBT2uDEY6Vube+Zi5ueCCW17jy954S0pbFUQqiLK
 /xKpPWrQygkm++m188E513u/m/l8XtNcOPVEVkxf2y5M1ENJF43Zcuod0XNrslxSHpY/Tfo8RSi
 4Rx20deC70TiZ33STxm0wWcBFUCrrPTSJ+oiGftWIuOqi7GS815cTFqVpEQjWvBGaZXc+ppncMy
 m/7sMWEqqptHmBL9kEgNkESGQvkN1leLKDP3s4DST+t+kdQr8eJ9athodQQ8guU2vo15vZQlylG
 ctC0NVgg5WO/RcN/swQ==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69de2bf2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=4xeVu9ZCkff-2oTzBxcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: E7GYYBTdYSUo_hryOjOhtYmHQevcyHEq
X-Proofpoint-ORIG-GUID: E7GYYBTdYSUo_hryOjOhtYmHQevcyHEq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140112

On 4/13/26 11:19 AM, Kumar Anurag wrote:
> Enable secondary mi2s to support HDMI audio.
> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---

[...]

> +&mi2s1_data0 {
> +	drive-strength = <8>;
> +	bias-disable;
> +};
> +
> +&mi2s1_mclk {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;
> +};
> +
> +&mi2s1_sclk {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;
> +};
> +
> +&mi2s1_ws {
> +	drive-strength = <8>;
> +	bias-disable;
> +	output-high;

For these pins in their "mission mode" function, do we expect these
pincfg settings to ever change (i.e. across boards, will the drive-strength/
bias/output properties differ?)

Konrad
