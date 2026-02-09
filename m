Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9F23093B8
	for <linux-sound@vger.kernel.org>; Mon,  9 Feb 2026 08:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770625711; cv=none; b=TMOm9AZtVOA5l0QT+XAlmLB8mxi0VG8Hoa/DfSaYs7xmHA+FNRvBCBRw0fnfKwtFmgSYKXRRxHk7wEhpa7CfDGzDip3vB4obdZezExQLgQyhkoYhvNuCEfWO8fp47JUdNfJwgcyRET4WGoKS55U4R1UB1xjHnDFBoBhcxjCHx2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770625711; c=relaxed/simple;
	bh=BkI3l0nh0UiTnME17fihmo4Jvy1q/3Qwyo8KCCWvClw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tDIf16TbJzFcAQG9+txFKAcFtyExSg+nC11KFyz2Ec7cWJuvcmBUb8J1/D1qUefZ2ML/RoBKpl9g1t1XADsC85y7tYNox4nZAIT0iOwT4b6JVxoppwAVSJxSyD3ObnuoXWtBIendMohRmnZTsnmoo9mLsk92ThOY2b1lFfeTt6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Kd+cXXlN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MeAhUZ6m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Kd+cXXlN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MeAhUZ6m"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61983YFF2970480
	for <linux-sound@vger.kernel.org>; Mon, 9 Feb 2026 08:28:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSTng/cs6c95cVizWIkJzmj41GBBd9IVw6pXtCrOD+g=; b=Kd+cXXlNergRcSUg
	wUsdANhXGSo/9T7B3C8xYrfqTxPja8S857kzHUzGH3mnhijJP+wIP0YpL8pgHsb5
	Ze1ybcDprMEIp2E11mQt0rcewDSz3BLbYrYWjEl0ZCxZMkkYoQFzCtKP7i2zB8v3
	YOuX2eEuv/BSdxyYqCNe+AklkrIm4fXy9em3ranB9cNKh5J3FDa+12BkCwsgPec/
	Tdkk8VBC9wzp0K2Q5zRpBvIQ4lJxraGBVVoXky3JN177S7KTKCoZ5fTH8tf+v9xk
	zAsoTnP+CgqazS98roehjqhBQBoheebA9XOrJMQJFcsHjS17GzCMnBmgGo/A6C8e
	z83XYw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c6g65apb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 09 Feb 2026 08:28:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-896f35bc8ffso11545616d6.1
        for <linux-sound@vger.kernel.org>; Mon, 09 Feb 2026 00:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770625709; x=1771230509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSTng/cs6c95cVizWIkJzmj41GBBd9IVw6pXtCrOD+g=;
        b=MeAhUZ6mJST01YQrrdHBmlWBs9XRCiMqPlGIigjAh/EWYJzGF+9v84j+mDDTT4gjFA
         g5GldI5jl9NGm37RVSXUYE38REnhCRA4oMXQ/PZqN3mG4gHmNXxoxdx2cOFIV0+IGHNN
         5yzQejEYeDp7BrVG6L7dD9CHu3rbmVkPS1XNWov+lSaS7yPDgLwn9DX0VMijdjhUlFp3
         wbN4Pj5nM8W41HXgedF9Qd+8sKWPgecKE3/DWJT2y0VbBub9NWn07kr+Teyxntm1grJZ
         3TlczLcOXdr5BW+FmB9qo18gNWz9fzBC5gAJG2AnM94gSKfrVhYmAIxEhV8hscrYqmch
         EkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770625709; x=1771230509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSTng/cs6c95cVizWIkJzmj41GBBd9IVw6pXtCrOD+g=;
        b=hKCESNC5i1d+2shWFXQpDH7ZMX+QtHe9uqx9Z3jbogR9/FKDNVxXQp4wRQ1iHOu+2M
         2ofnoI1QIHN+pYD7lSIPWIBLpsIasy+L0AlYFEDAL4tE8FXb8IIwFZpc9jnsKoynFYdd
         UXPTiXZMo8VAjaCO4EOtnZQsFsatSPvZfc1As9dEFfDu4EFdn6ZPn04ERQNxL7HC5nsy
         RQcjdsStQVlOn7ZGzN/tV4I/7fCmviz/bmm2n2lD9tC/97V8kqMZddOhhIkhadMLMuzZ
         Le7URoXMoLOBzjC+9aAZ+e8nXSF4PwaAOkCUpkcpObhSIytezB82oY4BNriCsdlg++fC
         +rqg==
X-Forwarded-Encrypted: i=1; AJvYcCWFtwJMl//jruU78IGpOxQgOG0WxgBnoemitz8yqlZIlbCBfFK8lfFn0+WZeJTjn8KZv6HlwC0mcyfRbw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb6v1lKfXHNK7TG8Jv4xc09AB1frQgjlGUiwHxVJlGvhoA3GaZ
	YlwGnJrI7uAMZpnBLFX1JpNhR0tbhM2f4kPZOjs/TYvN0DxDGU0dG3ZjDcSf/c6dSrR2WzAKyXh
	2G3vnjDqikZ+pgEvmUIWnrKRq8if3Lbk2lnM4+F2xTgJfjzTGPr8zLWujy4Me15cOig==
X-Gm-Gg: AZuq6aK3huvCbMjvNF1sxwBNZeDvZqiAFJdbTXqfwTWOo2tJOBpBesBZqc4+WR6fx0a
	+eftS4Npv7hx0a4XvB7DWUlZfQD1wWMSHJfRVLiohSIqOvIUM3TkOZTCoLVT1XmwV8dk2RycTlU
	bsu2/vyNsxNFJF0oquPVJUIKdGAfVEdFzYaQFiKsbUsvCMC1mqEFibDITeR0x2TMM8iSQNOBNIg
	u++8s9K2OWz7549QuhWhkUFMEUksMEoGdf0AFqedPofbYANOnlheYMcX5Rgwg01SSPIH+MFQdOt
	2EVt3DyZ7v9rkL7NEzMp/W1nMLWzOga0fPHcbpU64lVYa7Zu72zi+XiCPTGVWesWGPnBkpbPiCe
	2ZywRa4QnU0Q/uXCI1sW8oetFN/WflsFbBDqWdjn7PgAtv+vNDKrcW8zPIRjxFdHjLJs=
X-Received: by 2002:a05:620a:2953:b0:8b9:fa81:527b with SMTP id af79cd13be357-8caef6e95fbmr1084475985a.5.1770625709369;
        Mon, 09 Feb 2026 00:28:29 -0800 (PST)
X-Received: by 2002:a05:620a:2953:b0:8b9:fa81:527b with SMTP id af79cd13be357-8caef6e95fbmr1084473485a.5.1770625708900;
        Mon, 09 Feb 2026 00:28:28 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8edacf1540sm356073666b.56.2026.02.09.00.28.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 00:28:28 -0800 (PST)
Message-ID: <cdc9fb39-3966-46eb-9182-fcb2c3c56dde@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 09:28:25 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add
 Senary MI2S port
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, cnor+dt@kernel.org, srini@kernel.org,
        perex@perex.cz, tiwai@suse.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, quic_wcheng@quicinc.com,
        johan@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-7-srinivas.kandagatla@oss.qualcomm.com>
 <jloqgua3e2lub2daplqlie6fhrsxntwepfwoa5csxdababstib@lp7b2uy3jqos>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <jloqgua3e2lub2daplqlie6fhrsxntwepfwoa5csxdababstib@lp7b2uy3jqos>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GqNPO01C c=1 sm=1 tr=0 ts=69899aad cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=iexO-N7_dcyycZ0WZvUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: 4AKc1Dh_nG5T92eKLZ9zDRBxATZ_kmq-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDA2OSBTYWx0ZWRfX9u7KDc7qsse8
 Vtj8k82McYrpd1rbfWmygWFRSn8ZFusVNIzVB+5jrTCutgrJVLvPBM540J/hmSedgiLnPHYMemC
 cIlIXrs51ppvtUHY6m8Ec3X7vWUW3FcODADXQh8oNr5g3y0HDOZG1U5DVFw10EmOYJ7hrqJ8CAL
 dpLOnjP8I/qS+4sCrMhRzqJh5jaJtEurQhZHxRRRGtP6zoOTgS3mwakDwVMBfOyR9LSw8Fy1YTX
 CpvBsuHHHEjkpcgx4Z4mGeqJ9D0mDg2p9e36A3zlhQJNzYV/09jCEsaZfMdubE3gmqc8/VNPXHx
 3iMVNISVrgHARs2UPDQn4Z5rIbipBfVWQPcl1DJjTsfSa8vz1YC1u2DeFs6M/EMQ38EMXZuHD88
 n9Y8Ii0mD3moSs7MU5KknJbesJTJ1XsqxdGj43CzD5hlfuFfm+K8srKsWO1TYVdjvDOIb1HZm3N
 LEFL9ziUPcYgo2XGIHg==
X-Proofpoint-GUID: 4AKc1Dh_nG5T92eKLZ9zDRBxATZ_kmq-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090069

On 2/7/26 10:19 AM, Dmitry Baryshkov wrote:
> On Thu, Feb 05, 2026 at 12:14:07PM -0500, Srinivas Kandagatla wrote:
>> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>
>> Qualcomm platforms support the Senary MI2S interface for audio playback
> 
> What is Senary MI2S?

primary
secondary
tertiary
quaternary
quinary
senary

Konrad
