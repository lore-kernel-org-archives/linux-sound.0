Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2478E370D51
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 12:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403395; cv=none; b=FsXhtAr2Mji681UtmLIveUcrBzoHOZR7/n0W3J5UMoCN/c8vDRLKYztKmfWmcNlhGHSbx3NvMce33iftKByHn5HKJkvNDmmJMSbzJQvorNZTRLFa7FZFs4tqyq17M6NxBZrbUx/Kk+pzjcUHTwqUi4DyOgmOh6vyDYCVzgK0hWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403395; c=relaxed/simple;
	bh=6iZUXRuQAM45qmlglS/W2kS8kceFJuoO3QVeAY7yUJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bxfp8aq9RbU3vHDNKJQsJ6pJC+J6xqs4DChaMFa74yuAehhxk8Tl5Uybbt48v9Ko+UzyJyuCNhKH/plJZ6UzCKEKabLrFIqrw6j6/RrRVXePJ4jM6rNlIvg6iLe4rXy8w5UdDaF/jH0HDK2DyDLFDJ7xw6FYOIPJsorDXVvpHQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPxfVbCT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZPLKwJ38; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPxfVbCT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZPLKwJ38"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tggN3229964
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 12:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yVc/AQHc8e1tqRdIVfUMouFrDG6IHPRjwgFSqudTOg=; b=CPxfVbCTYDkTvdh/
	X8WDiw1rzy+dmAghKYd6d2aHqtveDIz59+BiXPrE9jY06MH6OpXLJINseL96F52L
	C24EBt31WeHtT820tHoA2kqPxiOI8aNf9oViXqsBD+aX7Mb2jXV7rVdfCRSR7wU2
	XmlZqCT05UhqlSVLxLY4V4E4EnN6p0/GfJtizjifO8jy0+oswUHGo3NWOi4oVwjK
	46O4iO65kXs5dXN0klof2zq8C0kY4gbQ14ckPhTrOVvUSZ2siKMRGvXR09vEmdIU
	NZPW0fR7Y+s9gVWhwpAU6nKn1Ui19wjH4O6y5Wm/o5yXpAk/wXPSq0fd9D+jVFQV
	2Ic2Ng==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7j0e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 12:03:13 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-41718a3ad0aso1748223fac.0
        for <linux-sound@vger.kernel.org>; Fri, 13 Mar 2026 05:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403392; x=1774008192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3yVc/AQHc8e1tqRdIVfUMouFrDG6IHPRjwgFSqudTOg=;
        b=ZPLKwJ38aRWGxznMfsSStP376AwEt+Gm1Iccga2o5xRYGmyUU+WSHZomxVwsoRSQq9
         Z0yPqzjdJhLncmoP7Aem3PfRaKsEq6966XLOAiyLFkp49Oe9q7sUMr2ptBAZJD1CS60G
         b9kDSCXYIvgOywAx+/BmGWgQg+9JPNZ8WS+pbABE8tA0uIF8bb4PBC9U4XvJPY0ejSc2
         vJCsl1lOyBR+vtpsPMiRQih/DifsiTyBljLq3O5Wp+iZXlvMO42X7Y8sdHck5PG+kgpg
         EVrkXLY70gb/Zx/G2bpqWC7oghj7m27MAHwJfnDUMsrUxMETGAVc+LYbdHSWSvqGF5Rf
         hiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403392; x=1774008192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3yVc/AQHc8e1tqRdIVfUMouFrDG6IHPRjwgFSqudTOg=;
        b=WgEqzhzfp5xYkUldFtSaoY3V+GaA8qUtcBjUHneXyZk4FHT4N0nUz28QcCxyMxjeu4
         lBl6Uoyje0XE4Qy9jWzsa7l6f5oX/GdMlTV7DBnjkJdGqcuMJfFqrcPZk4EN7gbCMhrw
         J/19F77wDWdAxUF4yMfRWqImXPX4ZO2A8WqTUWFESjTGA6p8ngSDC6o3wUUO8/XvBuRr
         q8Fa++/oUSPd9YWqKr9vRiNLaA+Pa7xnRcuMo8gV7a1k7X5G/TPCUalBlgYh6dbaIhsd
         gxcILmc0V8kxzT7Xr39V9Rmrg9Au10rorKhUMkJYfaVi/NRK0/kgnr41iZwxH6qvZvcL
         5MeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1tbjfvNLyVgqNq3+v83C7uKWWjk8vl1WLU1p7lRWaDV5L0M2dwR4n1wMLQCUcFfsuroHv8YFPNjF8kQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzndBLbRoGT9chUrOoRifaAFD4YxaT8YLw20+E9x4hhUdDtpQUE
	kOIdDoew/z2bkvo1MWmsFzzGY01ub/k1Z19wfg4Zu+XWc3za/VA8JXSm++ezygu9EbTTQ0fZas9
	gXtTf+eXClas7ag8nU9VRoKzj3zK/QGssA3RNPwg+NsZHuQsG4dTrTLaxST4ahdXVou7+KO8dUA
	==
X-Gm-Gg: ATEYQzw/tLWIUUnyX2z5c/wXtQKknwJFBLKFXsvsmAH1oeHDyMSl7ti17RdZbKHkgkT
	lR+Tv9ByFF9u1r5fMKA6QMtVMxnBM+Qd4jiU1LfigyKaD/Q6t1Ee1VjNW+ByzJu2BtkBlAcXAuo
	GGI+Mu2yFPNqPCYsWWPy5p83toYJeNBrh90yaQB82DwJvw707Km9vM2Lrj1yfi+tG79eYVpuOd2
	EJWe+WtpnV5IQyJmhJVjgN66GxID0gIczKPVSJIGVOSrKBngsGGwIcwXizv3JZNHVXbMUQC6e/+
	O8pxOxERra/0RwJf0kxsRw7o8PL9Knx46K7/avhPg7MNx193EbN/cLg4pW9+TFDiDMYobclfpM/
	kPMuGaYCfss6lTVUTrYBw4tKHiEmEzgH3PNrhVLpsBWm2hrxVAOao/+aNG2+q0F0Uk/tLuMyJNg
	1vwmk=
X-Received: by 2002:a05:6870:2188:b0:404:2e44:18cc with SMTP id 586e51a60fabf-417b93e2d7fmr1270140fac.3.1773403392449;
        Fri, 13 Mar 2026 05:03:12 -0700 (PDT)
X-Received: by 2002:a05:6870:2188:b0:404:2e44:18cc with SMTP id 586e51a60fabf-417b93e2d7fmr1270084fac.3.1773403391665;
        Fri, 13 Mar 2026 05:03:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d096d58sm40840066b.62.2026.03.13.05.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:03:10 -0700 (PDT)
Message-ID: <fb08be02-e73f-4efd-ac55-85ebe60a6e18@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:03:08 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom_slim_ngd_ctrl_probe: blocked on a mutex
To: Tj <tj.iam.tj@proton.me>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <f1a1e72f-318b-4888-b03f-4f38ab4cee6e@proton.me>
 <7672009d-7b14-4df2-b057-1ca5ef4fe79e@oss.qualcomm.com>
 <539a5f37-e06f-44be-abda-3afa69397711@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <539a5f37-e06f-44be-abda-3afa69397711@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 7ryQTixnbKDOvbLiAJFVTW1vcSYPX-bT
X-Proofpoint-GUID: 7ryQTixnbKDOvbLiAJFVTW1vcSYPX-bT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NSBTYWx0ZWRfX0/DypDP+60ni
 CpHSGJTHZfR4kwq1vBhwqyBKGlrmGoSGmVMniyru49KzHwLG/LrHZdSkMqu7J4XideZ7GPYpiMC
 4tlsWTuSzJCF6UnG29Fpw9bikczE4Qzpk5rHXZVfL+M7WQHoJlc9at/Fnf54LQmXsrHjjtdMxOP
 ne7LBDY4Hwg5K7ylUBYStKmbK8/cwVicLmqxGjiiX/yyE8HNAC+iAdtc1JNUO+AEmxSbOludtiU
 DQLGuVlMUmfwMbIezBHyXKLJIMmTiyhNgRkTLK9Cj2ELMJ4C3NdpZdhZ03fe8ZpZ9bB4zz8LBuw
 1NVe/d7HpTSZEtIDFx1Unpbmz7IlnxgrMtnsseGZlE1pqIWpG9UomfMnQsnLJy9+CstuzgjsQ1k
 UTLuD7JLyhxsazyoFOkZngLQzVBfcvQj5TTVtSn54XWHBLN75YedEP8RX6k5lSotkHpPPnHsLbr
 1qEeDN1+cKpsK2hrPMA==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b3fd01 cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=unwBlSNg4wIqc4wMQw4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130095

On 3/13/26 1:00 PM, Tj wrote:
> On 13/03/2026 09:54, Konrad Dybcio wrote:
>> On 3/12/26 1:14 AM, Tj wrote:
>>> Currently working on sdm850 device (Samsung Galaxy Book2 W737) and
>>> seeing kernel hang early and never recover when probing qcom-ngd-ctrl
>>> platform driver.  Only able to capture a photo of the stack traces as a
>>> result; I'll try to transcribe the important parts here. My diagnosis
>>> suggests that the module is calling __platform_driver_register() twice
>>> and may be the cause of the hang.
>> https://lore.kernel.org/all/20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com/
>>
>> should be able to help with some of that
> 
> Thank-you. This morning I'd just resolved the platform_driver_register 
> issue myself so now seeing
> 
> qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM SAT: Rcvd master capability
> qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM controller Registered
> 
> However the order of registration of the two drivers is important; ctrl 
> should be last, so I'm surprised that Patch 1 works.

Please direct your findings to that thread.

Konrad
