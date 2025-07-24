Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A49F92D948E
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 13:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753363918; cv=none; b=uirvhxQsXxyJGMhTMW85KRH3lOeJx8Pu+XTyb2sIof3GJYa9knXLY4dww4KuHYTPNlLAc9dJTd4mjijzxwyj+sWgfW1rIX6YGeWdGx6ijQikHZkpbQqA5DLHRmPzLPXQ+drLkFoRhUVvm+rjH3Rpq8nEutpoRhACCsMJOYiFxBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753363918; c=relaxed/simple;
	bh=F1kkTJWWATnergb0steCpxPDq7lIJ4ptvm6nISdTbfw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H421btghOWyEJZK28dPMUFHGUP94sbgG3VvVMdTSEkXwMW8j3hdI/6wFYTdAdmNW2386VS4rc48GyT6YrwmFeruKXZNW8+GSO0KO64Ve9iv2ZoVNgNnesyAySDy57ughSE+47+T/9WDOZ9dIZVlglLxVLqUsvJe4b9HMHcnsDWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NE3dcdpY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NE3dcdpY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9rXcW022169
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 13:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UGZqYstjALDPorUsHq3fkuHRnZDG0CR7bEzEh3y+/kc=; b=NE3dcdpYcFvCY/4d
	zcXa91WKG2/+pNf7gofKhRcFTKw5OBPLCrnaZ3+8toODsHaJ49lWL87WUbAMbJBn
	AK7gO2vvjMf/wA6/MOv5grvjCH/6HPBtktQrrKKi1leRRv5F9QTS+/zs5eb7ZZlV
	VGsqPmcfcBOLkFHxLa1qoZDCuk62DUwpaA7Bw72K4df6gRM+iUYgE3tC49C5+VX0
	yP9R+VrtYLS8pb5pigkDnWl6PscaX/Uhz65sXRIqEbK+z2TrcCAR2VUoIH0AHEaH
	+905GNAXOLNufxJ+S8alB2MQQTd3FcoaozUj2+lLon2sRUIRm/95t87jJ38qfAAI
	We+lAA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044drmrt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 13:31:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70717059030so876266d6.0
        for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 06:31:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753363914; x=1753968714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UGZqYstjALDPorUsHq3fkuHRnZDG0CR7bEzEh3y+/kc=;
        b=PA0zJKd53KPHY5c4vNZVSEohZmEpEwhf30GdilDNUjyUqQbJHzD37Yc4+esBnh4aKJ
         8pJciWJvyWZEljWzHv+QYb0viBLTxjSFblspBCs1jPHfhuxM/FmMER5E79IP1Ip6Qe5V
         JgWfPFce3FQ1pr2qXjC/K4nVgi5wvBUggb/mYUjubBbOKj/DQftubcsQm+SuTBn9djUA
         HwduUsK1TTUcdBj8382aL/JVHZQ9s5PaIrxLCQkeuEqQJo8Uo/A0kXkz+TNOBLUu92z0
         z8Bg4CkQlHWvXhCOmg1oSp0yBUZkbiXGCf+zjvMIZFRTa/zkROKrFTkfQjjgNgKRdnAe
         riSA==
X-Forwarded-Encrypted: i=1; AJvYcCWl1cEPct1Uee7FUvZZeSr6XRf8exaboieJOUoRqkmW398OXZ60y7O1C3nSTQoL8hz/e7LpLjwA7wPA9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk4iTgmb8lGkWflgGNzTvIdwTnpdrvkjTOb4GRBa4Qx9kuVZFj
	+1kwg+spH9AJ8iGyOGMfSrFt/YVpzsZ6nzfeucxcyROLUsT6AWhV0s2edvDdmkNp/DW2JhZUgsk
	ScaH+dRkcmGhqMEwvrJoDGXukR2tULwLy9nWGFqvQKl2Tq9s4mOAwQypSRbpMAFfjcw==
X-Gm-Gg: ASbGncsE7WM+j60Qie5o1Pr1fvyn0+KTlc7Wd6tP/u5x4IA+NWKFwMWMjEG+zInfvf+
	px01Ho6aIaryQ/SmvOaJPzpcUF9TB0ewSNVrCw3CokadvVntH9Ahw9iLnXtnQsMPhnsU3GZ68Pn
	E8PPuTn6O/9fN8SixEIAU7euX6vlIL85SbcEGzdCC34Be2EL5abawshMm+bYXSZjCkHs4jjDg/v
	PBI1UjTI2kUweQ2yv/Xv1CDyxqjZ8T6IPWsxMEQ0lc8DNRggO8Ri+j7C9NtOpWH9Us8u5eahQpM
	oxmiQvJes2rmeduztLfDrOAqtpyI4SS+tXzia6qImy3Z5fSO9RNSc6Sq/RmYluNyYbSpXdiigOp
	y9QnawHL8Ti9HS415TQ==
X-Received: by 2002:a05:620a:a49b:b0:7e6:2435:b6a4 with SMTP id af79cd13be357-7e62a1ea577mr372423185a.12.1753363914548;
        Thu, 24 Jul 2025 06:31:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1LI4SXtUDns1xFXr2pxNw4p8OV1O+xy0f8RV7nH2RnjoV1/Q0cvExqriBQrt6rTZtA+N2DQ==
X-Received: by 2002:a05:620a:a49b:b0:7e6:2435:b6a4 with SMTP id af79cd13be357-7e62a1ea577mr372420385a.12.1753363913957;
        Thu, 24 Jul 2025 06:31:53 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-614cd0f72fasm862314a12.24.2025.07.24.06.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 06:31:52 -0700 (PDT)
Message-ID: <276b7977-45d9-4b37-a4f5-1c65802ac267@oss.qualcomm.com>
Date: Thu, 24 Jul 2025 15:31:50 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
To: srinivas.kandagatla@oss.qualcomm.com, srini@kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=688235cb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=-nCjNjGlNwJnK1JuTs0A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Dvh_G-df_JcUW5vwpjpUqFTd0qpmfiBn
X-Proofpoint-ORIG-GUID: Dvh_G-df_JcUW5vwpjpUqFTd0qpmfiBn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwMiBTYWx0ZWRfXyjWMoqiWCCZE
 lWL6qJTQtOXOn33WYyKi8MCZzToTv0Bo+/OZP3ARDSZrYoKLzZQY4LEiXbe+MRRdMRg3LUlu7JT
 C+Ap7cg0Ng0/IV/K6hhiMw/ZQu/7mNVkqqKcVmSZlAcUx3rlzbPsVNkTShPlP+0tXmUc8nDCUQG
 B+EdwQNwssLKVgaA+3KJDesaO1tRNxrj9nhz1/ObmjAE3czggrZ7trw5zxYCaF2Cw0SUXMb7k2A
 8z5M5aHjGB4xIAdQE7phaVoZ/PH1M8EVcgykm83q0YnXLXMf9SW4mIkHOKE0xHhFbnqCmlRlG5t
 IGziUY52Q+48yKBRA1BGKOj+lDewcwBmkls0VNS7uax/hIa2noEfpVJms2CEH4KLYgxDq1T4pfs
 F+v7d75kOqmlBMTwVsjzIpcg/tHnI7QbJPb3csXqYUZwQoErGGru1z1aKdwocu5+uYeX/mic
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=788 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507240102

On 7/24/25 3:28 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> Qcom Slimbus controller driver is totally unused and dead code, there is
> no point in keeping this driver in the kernel without users.
> 
> This patch removes the driver along with device tree bindings.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---

I *thiiink* this is apq806x code, with 8974 adopting the new hw.

+Dmitry, does you computer history museum require this driver?

Konrad
