Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463BB46D57E
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 08:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151353; cv=none; b=uqGyrVA+CmswSaPS2+5K4HtS/TXDCPUR5nII9UawHoWvWSnAMyHO44RP1QeKyIqG+aUIKv+mgPoiTWY9y4VbkEJr89HSBPouFYQIlCT0QWquGaEgOn/eCHKd8o21ldFjodSmjTp6jnje18hX5XA08XoqIoJ1d0jZKl1lgzzlKaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151353; c=relaxed/simple;
	bh=Arm8zT+/JUhQkGb7yad6BvTCVvWlZBkot9k6kvbpgZs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IaK9GuR2BL352Fsz+ALbLKZZzwNm/OpjIHnKUkyQvuvdgeIS+X9pSX2Nr8MWdF/uzNkJDyfTrFP+osF0LYh1bcmQJtQeiTY3uMOWUg9y8+mMiABpX6Agtl0tLaz+oOYMDcDIwfBaBCAXPXAAmpyGE85gdZDeOgR2UoGv03C6kos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GCx6575p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fOtjS6Ag; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GCx6575p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fOtjS6Ag"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N7A0L31874596
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 08:15:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EgqVn5JCTg0Wh+1+T3L2Kw7No/Apzuy2f2xoTJEufq0=; b=GCx6575puVozFU4f
	I5EKrRfK8kuUJkac1Vm+uvx2r0babcdryEhpN/h583+8jtloZDVr5te0hA732sBb
	UTsTnPEJtRYTnQmeOXJ8NQpRTifYxznjKrQCDRPZRZFcPyIb2xxwj2vK6fuM7waM
	Jq0SL1xSS9PbACfMVS3C2v34oIN3QNjps/GbMIa5j9+Kz3VA3IYPN5UZaqWEeFMo
	Yoi7LXXWUoO1TLgEnk+FKwGskzbJjVEMTqIFibsw+Y188LtsQltZALvthNo15r0Y
	/E6Hq4ZBohHi/xRGfHbqp0DCsCUa+kFZOKdREKa6SbujOQmenMQ6wb0NoYi1ZqTA
	VWNpAQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c2yu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 08:15:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f248907fso68906885a.3
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 01:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790151349; x=1790756149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EgqVn5JCTg0Wh+1+T3L2Kw7No/Apzuy2f2xoTJEufq0=;
        b=fOtjS6AgXEougG2a279yT9PqetxT1JkHH6iELjC0MDPLmoC+b09InBaIeKVIwnCCpR
         r/m+MgaHoeSHR5TImSWtCNAXFcSwuFdB8N0JxXzc2bXfQt6m19ugdSgwX1VwaOAXpDkE
         KvTGbR6552VsvqovQYuNUslIE3i+fY9ScjzuxWIoHrB1hOLfI4jY1W04NNF6Urr3gscp
         n0JFHrViDgtnsrKP1Opd6lp3qvy5xcEPXzKmhpvDaU2xcHzrV1nrDcMnhaPoyhbIIT7f
         r0IRYZnr4+5FeNrJcWD1+QB7AKfCBAa1Mk65ltz2DgcXMBN5OEzc/wXxz6UrN3ALGY8Z
         TykQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151349; x=1790756149;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EgqVn5JCTg0Wh+1+T3L2Kw7No/Apzuy2f2xoTJEufq0=;
        b=o/p2gtSSr4hUhwO6m6NDaFjpOr5hYHrEcibQJXfX1Ckmfi4lnSvDrGkMcVEy+/sOhx
         1NtXtgbF1QNaHuyJZ0F+y/xWAosePvfaRMq/N+HLahOu7CdEoGehLhoIuqQvnh/63Acc
         l4NdPqSqv2adS/zM/ftp4Qu48bUORB0Pnih7fsBmb4iQS6qCMbQJd1l8DhFMQKFP+Kbg
         +r6fr+ptC1Zan4BLfN9vXRggmjWvXTFQxndVf/LykUc0OfN86dMjOe+pvKIWWRGIruKP
         SJQlSJOmHnWGEx+SDJBuw4OLj7FMkjnqz14GFuntn4KfDNf0kO16tpDIss3NPJgsAGPF
         nrwA==
X-Forwarded-Encrypted: i=1; AKwUvByxBTIJxPIsARbNgqPIisDjgmhqfoKRtQo4WvuF8IEVxRNUvUrJqyZETf4uaDBXGDtSmHmOcZ9lha9wlQ==@vger.kernel.org
X-Gm-Message-State: AFuF++lYQXt2QKnCMUIFZlwuXLmlKFjbZibRqTIgHzlrshYvv5tDIIgb
	Q0D+O01LYKmvCgPT5JZM1w0D2NNQotKVEvUlPG33/FULQdi2gmqZHPKGBZd/gheGBUg3O5uJhkD
	zxnTlHZRcCM+IJYD7FnyhtJMTVbX+NW5wBAi0OXBkyT1qN0mmWm+EaMQjjjI3keYRFw==
X-Gm-Gg: AYBFou3WaJ244uHFkZFjOqQ/3u4JpY8B5s01mdD9j4z9T6DRJKkTY5fB8uzio6GRPNP
	e94VtpKA84smZbTsxuyogzs8lnIpQyxFOmZmAXKAfOdr0+Yu/fbLzv5wwKo79GAEICiZrvIFW76
	6Jr7cqgmzk94N/BgPtxksvoISR6kJRQZ5mjs1gmUFb52UMftXQRqPQKoKp/RqVUTUogEETWu27p
	s7XR7CLxDi7v4JetzCa9Yz6wfQLQ9B90Q46tKKs15rawubl4xogIZDJZP08UHe6Sug3Vz6gqohm
	ysGoRvzURomDv8T0ljEHs9mwxfzBo+Y6Fgdv35Yc2wAFY3QQsjnU011ysCBYH6rl0CCSm7msXbd
	2PHAqkx9zAkcB4Ui9f2C3Ph79D2i3uNJT3Z8Cz0AcMfGT2L8=
X-Received: by 2002:a05:620a:438c:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93c251af1b4mr282502785a.34.1790151349418;
        Wed, 23 Sep 2026 01:15:49 -0700 (PDT)
X-Received: by 2002:a05:620a:438c:b0:939:2d77:d6a8 with SMTP id af79cd13be357-93c251af1b4mr282499685a.34.1790151348996;
        Wed, 23 Sep 2026 01:15:48 -0700 (PDT)
Received: from [172.20.10.5] (82-132-216-202.dab.02.net. [82.132.216.202])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe0c3731fsm42528615e9.2.2026.09.23.01.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 01:15:48 -0700 (PDT)
Message-ID: <8b62c6b1-3055-4787-87f3-1ea990f8b546@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 09:15:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/8] ASoC: SDCA: allow building without ACPI
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260918131914.681588-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260918131914.681588-2-srinivas.kandagatla@oss.qualcomm.com>
 <arKDa69Aggoo32CE@sirena.co.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <arKDa69Aggoo32CE@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: EVEzDyx59c-K1Dvpvm9lA_VT9exEW6tM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX/DVJBmoelW3E
 MpwFFjMawDuq35EUErXeG2iM3tZecyT7eCRuk3Y5Se5ZZ+nN9c3cjzu6VJDGYYxbga25k5+3ZcF
 Fdy12EIyaenSsA97V/IXZxaC14VRLDY=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab38ab5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=GdRps4uEH5l7/IE9oLSJdA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=vW_vOncweQm3iN5ZsRUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: EVEzDyx59c-K1Dvpvm9lA_VT9exEW6tM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX0Ode+jMhl3eD
 pfvGZ2SYAq2pHCvMkIOZ+NkxINIFIMI8wEB9R/LBuMOT/mfT2wel+A/LbB9qFoVAHm2UjXnZTrm
 X/BDTBQa4p4ok2XUBZOATVnQL+uTSbTe+70PZca45W06LCoEQqkRSpNAEjFsJdQhX3Jx7HrNoGE
 HI6H+U1FPudfsSdT4+/RXrNhZZWJCo+ayA79rhT/vi6j1NrKbSLKl3eda4k8CUpIpqR1tD6xoiB
 H1BvN6dYThHb1MplrAG3sr6HYC+lgayNUYUIV2QBQ7FlBt7BJtF7xbTRRKdl/i6Hz7WHsc46jyo
 WQAkRrYOg9l9sOaD322UHCgwxgnf5m1aI4iu4ZPVTCRJSU+y2KU1kTr9FhuYgWLLfskaBn0XM14
 rqgJ/PK4ZG2KamGTjGipMvFy6PV8XuqDLIhd8ts+RpNIV89ab3s8yMSuB6BrIHDHlDlnwoxLxve
 +ojDdREE7HkOyAVCP5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230032

On 9/22/26 2:32 PM, Mark Brown wrote:
> On Fri, Sep 18, 2026 at 02:19:06PM +0100, Srinivas Kandagatla wrote:
>> The SDCA class driver is useful on non-ACPI platforms where the
>> topology is supplied statically via sdca_class_hw_ops.get_function_data.
> 
>>  config SND_SOC_SDCA
>>  	tristate "SDCA core support"
>> -	depends on ACPI
>>  	select AUXILIARY_BUS
>>  	help
>>  	  This option enables support for the MIPI SoundWire Device
>> -	  Class for Audio (SDCA).
>> +	  Class for Audio (SDCA).  The ACPI/DisCo topology parser is
>> +	  only built when CONFIG_ACPI is enabled; on non-ACPI platforms
>> +	  (e.g. ARM/DT) codec drivers supply the SDCA function data
>> +	  via sdca_class_hw_ops.populate_function.
> 
>   $ git grep sdca_class_hw_ops
I will remove this sentence in next version.

--srini
>   $

