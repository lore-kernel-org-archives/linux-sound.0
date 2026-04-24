Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A303C6A2B
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 12:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777033406; cv=none; b=SOZP+7DZ71qS21FkPYQLF3vyWo8WdCwNw4Fs/TyJzdzQZuYvDqjuNPa3+f8JBANBE8yIk88dMHACMJ9SDGPplcAZa0tsgpTQyIwPhZ3is3py5GHdKbbe44KfKUiRxFlYApk65bXH9SFsdrXq/Vb2WzxZEU0ORm1P/WsTQiPYxgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777033406; c=relaxed/simple;
	bh=dVnzfYNahGsZdHPE4ZftptE+eRQBcaAuFjN3VuEZhOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WvxNmDcHUAzJJ59z9TOQi5X+90NsiBTaxDCazqPnr+WkLekpB8/hJR74/JRkY1mrRLhHF6IVoCp7cPDI1CwuEvxeuzPB6M3rI5a4i0YQe3YIFVaxKp8kP6HREQW95oVHo7PrR3AefS8iZCwTV1og6wFH9a3fZFf040Zz04hnUFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQM1R4m1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DKFPnSmx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQM1R4m1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DKFPnSmx"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O83EoO1888545
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 12:23:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1WKQIL/F651Mu/H5x/G1OQMhd42jvhidBmjzn4/OISw=; b=fQM1R4m1ZklHAzh2
	4LXb7NF1Krk4HpQ50F/K1sFunMWzc7xw/XbB7r0VsIey881YD9DhM3dpKo+TyS2h
	4/hU0KlX84MPFSjWGrP+Vq/FUiFcg4X2WLZxd71BycjsvG88OEqQu9mHQIguKdRj
	Jr2fS6WDKJeLHrBQpMlZeRpZUADG6fvHssCFGW/l1UAOLwiiTkr2V0olsSEnIbZO
	rKA0bcF+PpmStJXDZ726Ukxe0N1RPXii/2rA1iTbKU5r/5QoFPF44A+DEi9ttU5o
	/FQRmP8i2Rlzli+SK1tF0y1f4KAjTV2SFV8cD7xUeqqndi28iNofyZChS5ibBftK
	BYtnXA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqp9dvnhh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 12:23:23 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8aca281aaa4so13501016d6.1
        for <linux-sound@vger.kernel.org>; Fri, 24 Apr 2026 05:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777033403; x=1777638203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1WKQIL/F651Mu/H5x/G1OQMhd42jvhidBmjzn4/OISw=;
        b=DKFPnSmx0qsa7Ry8jbbXuN51JFQA0I6beZB+ehe+NtT4L9s3rRM7tbkUrf4d1HyoeJ
         vHwaS562/qnIU68/X4yOS1B1/E2GiOg2e+3kh6pl3Axyo/1XI3/w1LotVJJiP5XyNX0d
         QckcRkTPQE7hsclmx1QX4sxo0VbQAa/oHqU+EtrMF23gSby6nj/POr5fMVRsG+h9LUjg
         XRagTHubtJBctz70pgI9Jy7n/r4SUm+02Xh3hgvugouf41ne3WrUOmx6+tWiK0YGdp1w
         okMR0+b8pxDQvcwd+/tFmdiSlIA8yruvWL+FZaGdPtu5fELHR6H8fGgSen/L6r5tzEbd
         Qufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777033403; x=1777638203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1WKQIL/F651Mu/H5x/G1OQMhd42jvhidBmjzn4/OISw=;
        b=Y0qGmEq8WJWnP5ug1P5AJtmAGeeL0qn/j5m/dLHSOFk86+oy0WNStzpg3s/7EC2Oce
         qpGIY/A2oGgxWa2vnOLk5A8tcpNEynIInz+V9Phjg5REXiQASzmqNSY1CdELdag9XukR
         je2WIolL6Jdge5fmIkEE32cq/CWaFzgIu4M5DXmvm0SRQrTcKEWj+kIM0RgOM7XO5Osr
         p8PvGhxZ5MUGor/UUG5dcMzp0W5a1FPgMicojMTKj0Rs4B+WzOIFu5R0eP6tvaqtN1Et
         OrfGp25a+8AYBZw5rlD5L7Gzpv9TktCXVjAc0MOCm2osvKhJJygYJayMCss1RclibATX
         LgHA==
X-Forwarded-Encrypted: i=1; AFNElJ/+JIgNXMulkxUV9YaXnf4EFstKPkd0/68GARRyKNwaDlAcVVtMoDFZDlGIRy8VQ8du1rO275aMw4Lb3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyC+euIjtoGvEhDDhg/m2r7Fd3WyjTvbu7hrgqQD2AKxGDPR0Rn
	Y2z68N5rAV9/kOZx3xoLaTnnsoM2qKfeIJOEU2m+B5ZT4Vaf8MYPYqzz+QXoE/2RG70idc0QQTr
	ire8wZRvqUmXUjbUNA13LlqqKp8e3sVIS1W7TEJNXreCVXLZUHZkl/K07VrS6uDgVkA==
X-Gm-Gg: AeBDievCWoopeW2HpwWm/bDO/H59CkU6WTM6UixaDZUz9J6ELKCE4abBgOz7wI1n80V
	Jc0AfUx/1Wd6yXPy9oLN5FC6i8198bCQN9gtoe7Nryz+QoGIaQ0fWf/6KqcWjlg90kNH+gItz27
	7KSb6/NJr4FK2cvyXVW/eBLYBG4dCUFtMkQBSbdCBKaNIV0NaXFYEv/lARh5i3lUdd3qIEtqIMX
	3qiIqK4j+kndbGzuuYE4xAbHR5szyz2J5CtZHEHXTuV8GU0zaKhc0U/E5ijPnOqwt1p0ZQIOqxP
	jlo0kRCdl+JWsuz0fh+HxbDVmDmAKRfk5pQMGdHzermtkgIbeMycRRBfuimk1N8TDJWXkASWigE
	Pd0Fhrxp6TrZmSXknOuBfGI93/sidwdCq/fYGyorlxVvbym/Zcy2O0pup/nboegpyGDsNdnWeFI
	Hcj0ihdXuUzA8u+w==
X-Received: by 2002:a05:6214:1c05:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8b02818faafmr337500066d6.3.1777033403177;
        Fri, 24 Apr 2026 05:23:23 -0700 (PDT)
X-Received: by 2002:a05:6214:1c05:b0:8ae:6380:8fae with SMTP id 6a1803df08f44-8b02818faafmr337499686d6.3.1777033402670;
        Fri, 24 Apr 2026 05:23:22 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455046429sm768141366b.50.2026.04.24.05.23.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 05:23:21 -0700 (PDT)
Message-ID: <e3702cc0-4a42-476a-bdf1-6d984e8ad7c8@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 14:23:19 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Align
 reserved-memory with latest firmware map
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
 <20260407-dragon-q6a-feat-fixes-v1-9-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-9-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GAxwSLmGVvqkL5j_MKKJ_mhQItHU4Z_j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDExNyBTYWx0ZWRfXyfONKXqS4Xh5
 pOpB7ENfmkGi0/M6ku4buQooQKuoz34uam/Ka189uUMQKy8nOI/GbD0mg/Px/ajNIIFdkKKSqM4
 vDxKAZedSMUU2MmLeP10VVElF7fjm4ViH2fJP9ArwXPxRupCcDUUpOImXrGWrf0M1niAiKNpaf9
 gcXlb4STFx4CCaB16uJYHlDXLEkEFsZPss1f+LJ0jEaYoYdtj6Vp0yRI7mrgDhGGnVv5jWIcGrF
 m+ND4sjuDEKJqrTnpZDRSM1KtY1dq7X7YyE26Obb8wwVLZc4m2BXx1jwQVEE27EI8gUlU8LZBNg
 jSg4vQq2wTE6WtJHEErWM7qeAYN4nDDlU3hIdk86Azw1op3cU2HnymB8JvwFYB7lCaDs7W1SyF5
 dNCCg919ev8Jb3x7vawVkgqsyOffl624Uh+6+oIlJnqbZCP7r/dSqpHYa3p2YiayF0DcnTCgRvr
 C+ghVLVmGGT7AYKilAw==
X-Authority-Analysis: v=2.4 cv=fP4JG5ae c=1 sm=1 tr=0 ts=69eb60bb cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=ksxQWNrZAAAA:8 a=IrLN4Iwa3TR8ocU_hn0A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: GAxwSLmGVvqkL5j_MKKJ_mhQItHU4Z_j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240117

On 4/7/26 5:20 PM, Xilin Wu wrote:
> The current board DTS no longer matches the reserved-memory carveouts
> used by the latest official Dragon Q6A firmware. Update the memory map
> to keep the DTS in sync with firmware expectations.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

[...]

> +		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap@c6500000 {
> +			reg = <0x0 0xc6500000 0x0 0x800000>;
>  			no-map;

Is this a fixed cutout in your memory map, or is that dynamically allocated?

Konrad
