Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D280511E94
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789659372; cv=none; b=eW4+b4V5W+6EKF2Neg8hhxj44MbPE9/o07p/U4J28LppSAxfmaPSRuh8icTicjF+/U9rrxuTMnOFhHGET+GEg4hbcPjAR9UwIehG5ar3irab+K+h4RHwQHOuKK27+ScaAg8G0fOzfden7NFver2Yb/HBdxBKz/Cre3JnGqp5yvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789659372; c=relaxed/simple;
	bh=+iHkduZZMvqiS4zbkORDMTsoPplFs+u6nA/atCreelc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p8Y5bgZKS618p1L5ZfsC2UQDkBQ1IvOovyHOY5FUOzxgfy/fYj+ZrKU/2EY3pv8YQFtWvYYhQXw8qJMxIn0nAB2O+BOZw7AYTshZGYBt96c1MAyeRZUjUr61FutRl2ZwsmNPSi4BJAJW3iqPaHZsR1YPNyEXDCvoQ4cvAh46rzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZ786Q5G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IZG2k37V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZ786Q5G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IZG2k37V"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HFA54s2024884
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 15:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1eUp/uF6ojAgjILcRmjqb2zT
	qv0dimYWlgVlrOGW+6Y=; b=kZ786Q5G695b/pL6vZ7QOnUdC/cWpDY84dzlRK4C
	FUGNKVqiM0lbwsNt9427tCsXZQoR/q5Avr46Al0s10NNEm9tquVT1Y/NioDzbUuO
	g2HKXoVUb/SQ/e/QYsd7fRRlZZ6oiD97RoQcnk6X8cCch/eowjjeC2KzzsnGcIIg
	WoMd0MRsaFDXa9kQWaoptXrmgKiuV3UWqi6C4giuhK0TvZ37g/MoUGIIZw0CPpRL
	Xtj9JfvZgdhleGDN3xIVg25j1ClI4GCb2rYvPiGhOlFnXnrTsd18d/BJvvdljntA
	2MsZiMnm8YKXXzHguEXtqAc243tdqyL07w6z2UTo98qsrw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjkt03xe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 15:36:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so186167785a.3
        for <linux-sound@vger.kernel.org>; Thu, 17 Sep 2026 08:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789659359; x=1790264159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1eUp/uF6ojAgjILcRmjqb2zTqv0dimYWlgVlrOGW+6Y=;
        b=IZG2k37Vm6c+y9JD/ofhZkzN1Ea3GamLtMOPvZTYZd55yALWBKtCM5G5CIU13e25OA
         hDKfcEf+lg03RvQoradrRHq0EQSLiKa6/xbxZ2nmRM8uTwe4/INkq0O0LFtQW3JXeKWn
         OWsaAtpEgF8wnLySNeWpsKqdtDZxU9RS5mwjb9YGqCRzkaiJTT7kaspAwjVQbGkVbJCt
         eNocUpnXKypurUj0KV/oAhy2wYRunJFeZdjfsvJKhIKEMrPu3lOS/XFk3qNM7jXEPKnh
         ySBFOp9MacgQ/LlhlDzqb5VgraGpE2WghMAer7aaWcFiM8DSHFCMKrhgIsQH4gDy44Xu
         lduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789659359; x=1790264159;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1eUp/uF6ojAgjILcRmjqb2zTqv0dimYWlgVlrOGW+6Y=;
        b=OTOFl16gH0AE9DqoLqvDILk+4Vm7BDIztfJa7cZCdmBci7rTX7HlIx/WHbk2Uv/Ny/
         qxs//wDDxoGO9t7gMIUThYKogTCcbXofd+0tnlbmY89c+Ed7ZmchGUed7ZAD8c9Oi+OP
         LTkUj0aIippaUDzJvJgYynrS4VnJXjFYbAp6DM/SPWuhuMo5jJ9EHm1V+YMHNguDFSfD
         YawixLyx7s4M24FyjDhbUDKEnXtEhNsMh2QerjL/MC/w0BtY7bLeMikJ28Aotz14HO/L
         2e6kFxnz5zyvg/rZir6+A1ysNQjVgGBVkw9QTMbiM28IX5bFgCnRQfQXXnk74yLwKhTl
         zjzQ==
X-Forwarded-Encrypted: i=1; AKwUvBw7qMJZmYyK75hlHgLB36UBEqgL6s9ESM0A3hLwB7jRze928drWTSRadCSNyRQ+qnxqF+ECRV11cP0tRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++ksOzT+KIr/n4PzH0hOMblaFjhdf+2JtHxEp2Ve6znTwDCZii+d
	4Dx4no8nc5wFEzIKS7q/s2H8wp7aSs04hCeqJA790eb65LXHaQzWnKyvUi+J/DdAgJ1NRcDEHyT
	LlVWMeydtZO8A/KT4Rmg2XHTrDT0gNiakL1gVT54KpWXxMHCd6me8haR3EODGkvS2Xg==
X-Gm-Gg: AYBFou3vPGJdq7Ai+Dv6RGhvDvlb8m1OMZyz/wKfz6TW0BXlz8kHh7dGGzHNE8ICL83
	Nshox6qHrk/OzEzGsYgw5ZVYvRMVUykLIdby78fNYn8vJ4oLVnbBlc+ZzRX3AXbTQysBZOMNh2f
	MYc5tsKw/TE14TVCMmyeTGyRyyVtNyT68kS6SPm3NKsw/WRlsVjwYa13U4BSD2I1qywdrhVQnda
	fripvTxVgtwUzr0ns2eJG828id4yfBIno9L4sx87R0YREDtcrdrG3WT1r6p5u0jOU8SnqHjqasi
	viTrHNk6X5HVzlYvfzSBVlMEQO7inRM9PQZx4o3u4DAecvX2JBGdWA90FUTe4BhsDU5WYaEvDPX
	9SWaeZUmw6aLqig==
X-Received: by 2002:a05:620a:4725:b0:93b:d79a:c465 with SMTP id af79cd13be357-93bd85f0415mr78851885a.61.1789659359290;
        Thu, 17 Sep 2026 08:35:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4725:b0:93b:d79a:c465 with SMTP id af79cd13be357-93bd85f0415mr78847385a.61.1789659358745;
        Thu, 17 Sep 2026 08:35:58 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd24774esm134249535e9.10.2026.09.17.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:35:57 -0700 (PDT)
Date: Thu, 17 Sep 2026 18:35:55 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
Message-ID: <tfjdo4awnnqxnfashsg7rngszkqhcbz3aurpc2zz4nw7vhbykr@knl35b4p2ruc>
References: <20260917-shikra_audio_dts-v3-0-9a49e1ca6370@oss.qualcomm.com>
 <20260917-shikra_audio_dts-v3-2-9a49e1ca6370@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-shikra_audio_dts-v3-2-9a49e1ca6370@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDIyMSBTYWx0ZWRfX13LVg1S1DoEf
 5pDu27ThkW+e3bd9FpXl9C23lz5+uGbGsSzG1jfvXmdlsViXQ0iWhx1YY825W/etzzoGin6Eyjy
 3RQgl0V59cxStH9LgJA0gImhGenIzCTq8IBb+iwlVpi1KRLJ8ewJlORDbPm7XrjayG2NvXNTs3o
 AA9L1vBqpbpjrCfUigT/eTE4RNFdDnesfY570DKeOLdP8cwTMX2jD+tFlIpTuM+ejsJjuqli/Rv
 A8ekA1qJtjOxR8lKfqeghs9dgfOjy5t1Nxqr9U7sl2KM9H1Gan+hcunSWjea/SeRqiYe5q4zs79
 drynTrlYF9v5YoUuBzFpH5g3o7Y+FjeXPoIuGdPp1qxFL6PcuVmccdPq8Q2fyJrT2JVzHAOXyo6
 8AzvQpg42cVXq1cGcIwckzuy2qi6uPHDpf0tvQAufX4LcEkk6F+M9io+Bcx+y4TfW8IRrh+2dKl
 r+GvFFo/vyWbdK3oUBQ==
X-Proofpoint-GUID: tM5Kmy2zCh_wHys4haLfzjspIszX68l2
X-Proofpoint-ORIG-GUID: tM5Kmy2zCh_wHys4haLfzjspIszX68l2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDIyMSBTYWx0ZWRfX5DD1N4sn/3w1
 p6Z9oQjqUUNqMROfzwkgPr7vs4uN6tUtp/cJDSIy8Zr/zKgicLe60tJEvoFgf6lhXk8Mf+O68EW
 XQ8W9JsmIFVglO1PUpNsTlwj+H6fTXk=
X-Authority-Analysis: v=2.4 cv=Y/VtIReN c=1 sm=1 tr=0 ts=6aac08e0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=mXbM7gEZnszqHwy1qK4A:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170221

On 26-09-17 10:07:31, Mohammad Rafi Shaik wrote:
> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
> front-end links to backend codecs.
> 
> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
> the QAIF block. Keep the node disabled at SoC level; board dts files enable
> and consume it in subsequent patches.

Don't mention subsequent patches here, please.

That is not a good enough argument to disable it at SoC level.

