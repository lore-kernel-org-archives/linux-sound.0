Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB9BE226CF1
	for <linux-sound@vger.kernel.org>; Mon,  7 Apr 2025 08:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744015254; cv=none; b=YGNdq+cCjbSvyJY/T2RCXA1e64U/VLNNv3yRoLBls+XGpXkfc/o7+P7lDkn5vwaUuwMjRv7hv3n5fNfyoqG3g+SDI6BXQ28IuIORedPgZBDXd5mps5fAYpuPh+DtJkTdFpg1Np+DpQi/sVpf3hpRb2GJJJrmrRxYatYQSw/565Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744015254; c=relaxed/simple;
	bh=onZLseSQqRpgk7xz8fY3EmUBMLegLFqoFajCvjWiZiY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZpXyHC1g7b9fjuB65sNuwGjJJxiwpeWnlaMHTibw2yMHkQJtk9Jj/UH1GGXJQJvsMP+h9DX6lgaiI6NNAAPfrFVOPnJ6bPzGHrJXx+FqrFK3hVn321Fb7zfXBdSB7LLu6k5btKoJQQDiOresnHgXPcMKF17PlZ0pCt/JwS/iXsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VOIuQ/Fg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VOIuQ/Fg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378dqPh015748
	for <linux-sound@vger.kernel.org>; Mon, 7 Apr 2025 08:40:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwWO+kRWwZtdaXCwtTkeE3DeChgwl5XhdMAVcSTTaXs=; b=VOIuQ/FggEfjWtaZ
	sbpFY8lSiISTDqAh4/iH33p9nKWCwqBojDZncXN1d7lKC/GMYMwaN04l8YuciECG
	Jz4PBjMNxhhHexDA3eKwcl1UcPXdUUBwJ60CPvb7THSMneyBUJCGeOCNGWlAOP1n
	5iO8NsydiQmiEBdLeRqHbzOe+QLDL1d338LfHCLGikqROvO5YeKGzW24Qds+1KgC
	YqnJPzCxD81xNfyDaRnFL8wpQ0/gE34xXzUVxidOEmBFzXZpuyaQObJ+9b9as7Xg
	KSvH2+hloaN+vWc+S7HSD2dtiBNiNgfbkAaZliM7RKlwyzGUoGJrIuWK1uydZlNw
	etar+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbe3mjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Apr 2025 08:40:51 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c552802e9fso110989085a.0
        for <linux-sound@vger.kernel.org>; Mon, 07 Apr 2025 01:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015250; x=1744620050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cwWO+kRWwZtdaXCwtTkeE3DeChgwl5XhdMAVcSTTaXs=;
        b=TAeD2EnDNWfaa0UqNwSh6Rqmevw7rUsU+J5G5NZHk+HNoHO/jT/90KPssjSI8d8sFr
         SFCUoTtx64CMDPwDOl+x73nNIfOUwtq2Tc1cceBuRbBb+yv/D94gC3MnPdIVAHBMdZTJ
         xE2b0aB0PQVHuoemHs9RvmSJY/Gw7eWzlJHGD1+IjKiBBhhIGfieak5R/XmGIlsH/VdB
         dVWOC4BsUJJeDFIlq0o7MCiHRWG4Y2qKshUm6QCQGNLQ7P9Xw9EfYDe4IXcn+iNZt7cF
         i+HE06971dw8xEWmgzxNRG7EWP4dlyOY5ymcV4RHlRuIlg68upSGNrF2IPg1xPkDO14c
         KZlw==
X-Gm-Message-State: AOJu0YxRT0wXqxPpsxJfM48eltv2zZiVuwr7EYS8ryq/IP9z2ZiNdU9L
	0bO+JNiv+/kazZ5g+a6G0fjj+Tlbl5rrf9of2EwWvi2t8irI4fSkFGJYmIQoBiNMTtYXA0p4RiG
	snI7+JnlUNlMqewNAA4jSkvc0puKmfWZ96CX7IN78QJcJf+Ii48XwGEoouPiqKw==
X-Gm-Gg: ASbGnctci90cPDmkehzZaTo1lZAlSwzrPP/HrF1Q8IqL6BfzGiwdQAzO9T5gyrCkQfH
	MeboIlZvbegcs8/OEZHl6znr4/afzqTiFfKOV1eqvNe+V0+Ic20L8ZsqW4PXOsq61hNcw5qhzDf
	bTWd3/ZhdY9LHZ1blLVRmG01LS/fww5077csw3FAEECMehhbtCW3cEVzkS5ChuBdUD/lL2EIbG/
	LAz+OypBh5rZGHvpqAeYSL9huQi+LONmUM28s0F+lNDFVnmuoYVyB4ePz0S+3IgQQ2kNHDLoM4F
	C6QLqUJxlYR175wfH/wgS2W718/7jATJEy+fM+K8qoqVLeEOuhGBLXYvBprOHdIp9ARb/w==
X-Received: by 2002:a05:620a:2849:b0:7c3:e1ef:e44d with SMTP id af79cd13be357-7c774bedaf6mr590208585a.0.1744015250616;
        Mon, 07 Apr 2025 01:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETuFZ+vsD5+Sv9K/PkFBkn5sgkSbEsPdKQDRnhPrYiuCM1GOPeod7sM/VUOp7RK+3maRUJxg==
X-Received: by 2002:a05:620a:2849:b0:7c3:e1ef:e44d with SMTP id af79cd13be357-7c774bedaf6mr590206585a.0.1744015250316;
        Mon, 07 Apr 2025 01:40:50 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7bfe9ae46sm723668066b.60.2025.04.07.01.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 01:40:49 -0700 (PDT)
Message-ID: <0c374a5b-b2fb-410f-9d2e-3b42e8eceb0f@oss.qualcomm.com>
Date: Mon, 7 Apr 2025 10:40:46 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sdm632-fairphone-fp3: Add AW8898
 amplifier
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Weidong Wang <wangweidong.a@awinic.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250406-aw8898-v1-0-58a2d554693f@lucaweiss.eu>
 <20250406-aw8898-v1-3-58a2d554693f@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250406-aw8898-v1-3-58a2d554693f@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Df8EJ_E5-e63-LpMi0UvmMfRzMbFa2cR
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f38f93 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8 a=RC7kgf61jvLRIQ5xqpwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: Df8EJ_E5-e63-LpMi0UvmMfRzMbFa2cR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=816 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070062

On 4/6/25 3:03 PM, Luca Weiss wrote:
> Add a node for the amplifier found on Fairphone 3, receiving sound via
> I2S from the SoC and being connected to the speaker.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
