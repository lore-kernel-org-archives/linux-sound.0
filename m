Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C82C185955
	for <linux-sound@vger.kernel.org>; Sat, 31 May 2025 18:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748716332; cv=none; b=avI9VG8RaBFyCw2zyLcR0YbVYYu2ev61t9VjRW03L9djCcDemw4SmLE6jpZNFQm1ASn+Wb8bIyMQ9zIC0BKaR+ARpZH8Ri/kuW69Vj6/NEZUYXe02/AnlZ96ESh4TiNEDWw1ywSkZ1fR04vdsSFD5lqSIGf3QCbg/Hy1CeOs4ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748716332; c=relaxed/simple;
	bh=PiF6hqUws/uXK2z2qLpJr3JuiGcUxwlTUjPFuJp5SPU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jaD+H2PQL38sLNlfUdqlZPDSzy86aVNb+C92TqMxMptlS+vLSchzKTOhTT8H9kOBv0+AsBZMu+o8bW+wpNhjOLvX76HGesHMVPj/pgMwXWDgyu3dsYah7AZ30WjLJcw0IagGUzQ3P5S8u07xu2TT96RR/6J2D3N7bF7sP4JZpG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SjkU/YuU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SjkU/YuU"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VI3YsG004127
	for <linux-sound@vger.kernel.org>; Sat, 31 May 2025 18:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZHCTS02b52liYmEagWUc7peB8KjJ4JVv3poNupxDf3M=; b=SjkU/YuU2tgu9LAc
	lpXpv+zCBHDyUnast/fSqKYDa1PdEFc3KcOPd4NGYFlWIWlBSEy1/13XQwqVGbgX
	wGfch5cuXzyrHHdj2i6ULQJrSfkZ845+Q95wQHu9EPxhBMencNNVTzIu3sFpD+q+
	yc3gfXM7vH9galL04CfSLwF/j6hlKMnVKr/wgYXzFIJr64GpF/vs7kqaZEL8FRiM
	9p5H/SekzhMDBnDFgsY3GW9XIrVFJH3iW/K7HJAVX2DKEy6+rNu3SaExMD6l94mW
	mrvVR4acb2nY6pr4RlorNreZn6fZd0jjbEjqkdPfq/Cr2SJrrat3dUXqAZUqXx6/
	PIWDFg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46ytj0s5ym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 31 May 2025 18:32:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09a3b806aso66651585a.0
        for <linux-sound@vger.kernel.org>; Sat, 31 May 2025 11:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748716327; x=1749321127;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHCTS02b52liYmEagWUc7peB8KjJ4JVv3poNupxDf3M=;
        b=p6jAvk1MsUcB1UyeYCDfz4wqChUI/df3lf0cEolsMMAMclKmGHfPRUiXB2G2vFTm+r
         yeG6tahM6SsauZrfUJWRjDEGd7JWlYhuDe1/qdLxxoIR2YtNAb+TrQUxCqVXN2TtECic
         67vRzSoN3Dlor6Q0HIFF4m7CgeabVToqni0bGNsPsqyeJme/r5jealRvO/nqOauh6ujg
         oPrMAByde8UgiJwKLdYi+f/VsPUxZ6gyF7UsiqMXJsSawW7lz07KId9rpM+0QuKpr/wd
         sPlZt+PL3yf5Kyt4ZYjvYNDrXwoFVDtOZEATYw2+YVHpfnL+9RtkMipjYkK0aIHHSYmG
         6OOA==
X-Forwarded-Encrypted: i=1; AJvYcCWiDhAB+S61glD4SmScCbtM8jKrtQdj10miemOfaWIRjQJf5uyAYBctersfdrFwMlkJsjpyFsK/P80+oQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyFpbbfxr5NpI5E//rsqQdw2A8yPni5T7AIF6UhrWfXBWTTYnsR
	8kdu5ihE+ucsEKulYrJzUKzVYIM/B8NJKZU53M+CTUPN0kRbIzV7eyKIgsiOi1qf5F4N9rSydfh
	5+mIyJwXyx/WqUKt7cjnr+zsyurss7lE92SbL/mEKw6OvsPEowwg6Jg3CkfR9xSozGg==
X-Gm-Gg: ASbGncvP9IClu/JjDfPXeAK2FEM4irz3g3g+JnT45yL3MlSWfIv6UMmvcUJGcIsOPCR
	uRnVb724Bm2D1tpsXSY3P67rcIi9z0c36moV0ZKiofWIZRVgqvJwtprWtdpimXVQvpcH95sux3y
	7TMd2uWR9GeRNQzGirgPQdT54+M3AwMnFaCbYD95t4INMCCIuvq0CzvCzjoKKfyB/Iaw5ZqDORi
	XaVO9aV+ui5Lx9xorSQ3/qqF6vTq111Rd9IHN2PDIA7+cikEr4l8M5WquF6Z6IzM0qIlVDjTRcy
	7w4G+rNtxC9ojDRMy+Q/aTWAX5FDiipPMDexI6ciJOIH6wRE8MtKMsXDhZPa/CIhWgoK5HG4xr/
	5
X-Received: by 2002:a05:620a:44c1:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d0a3e12576mr385234785a.14.1748716327481;
        Sat, 31 May 2025 11:32:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKHQuo7PTOJi1tD+3r4vH4UDMjXZMCtq0HBjSd2NTJ1pkGxJ8G662rVF3hH5fenX9J6ZKNqg==
X-Received: by 2002:a05:620a:44c1:b0:7ca:d396:1460 with SMTP id af79cd13be357-7d0a3e12576mr385232685a.14.1748716327088;
        Sat, 31 May 2025 11:32:07 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82d773sm534600666b.61.2025.05.31.11.32.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 May 2025 11:32:06 -0700 (PDT)
Message-ID: <14492412-d340-4c9f-9597-39219712c0f5@oss.qualcomm.com>
Date: Sat, 31 May 2025 20:32:03 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] arm64: dts: qcom: sc7280: Add WSA SoundWire and
 LPASS support
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250527111227.2318021-1-quic_pkumpatl@quicinc.com>
 <20250527111227.2318021-4-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250527111227.2318021-4-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDE2OSBTYWx0ZWRfXwa8Bif2SM+1s
 CEpja4DusxziSd4ybt8a50R7yh+q2WhrYcB1DhYjAk9t+uC2GDx7LpHagKe8K0mVBaWdHr0lUvP
 ACahEs6pUEtD6PqsEpAThV9Kq5GPiMNYIuJKOapVMcpbHrIom3WDqVq3VmOf8ev0E1cCXd7yjyC
 n92aBqjJGy/muhSzV0IElueJ+AEA2lAiAL/EIQ7fX24HjvThmdSm7iqpKZ4umJPEgX/U94OVoJp
 67vtuuAbf3HdR5U8e0cERa61wumoxcYH68UWRl/37EvSgIEaTZfMy4fBJ5arbb3jkB6G8hVT7Ug
 zYDA9KhI3ToOC22I9/V9FVGl0wXOyd8QGZe5TkHUSukwubYB6/R+3A1ApJ9OjMKVRgdVKVmFxZT
 8p3o56yUGpL2mcnMOTnd+vYmBJbQ3D7qNGNsH+fEmQK55pQfZB8Lulsi4gK9Zzn8r3isfCu5
X-Proofpoint-GUID: GfBCLaU0Zn5654h1e_Ro1iQjvcxY3syu
X-Proofpoint-ORIG-GUID: GfBCLaU0Zn5654h1e_Ro1iQjvcxY3syu
X-Authority-Analysis: v=2.4 cv=dc+A3WXe c=1 sm=1 tr=0 ts=683b4b28 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=RWuSP1-prhlrjYyZVaYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_09,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxlogscore=907 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505310169

On 5/27/25 1:12 PM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add WSA LPASS macro Codec along with SoundWire controller.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

[...]

> +		swr2: soundwire@3250000 {
> +			compatible = "qcom,soundwire-v1.6.0";
> +			reg = <0x0 0x03250000 0x0 0x2000>;

0x10_000 for size

otherwise:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
