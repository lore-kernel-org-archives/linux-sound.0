Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8294843FD18
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 15:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790092663; cv=none; b=JkSn7R7obi1TYUyJ23wVqIoyzodONkVC2Kw462i9xrzxNxhll0lUqLKFXtNq8ma07cH5tDml28ZATFAEAJDDePDqebVAIlgtU65d8zaiL7ufSrWglh/yc+WCwXc4881umtxa/vS41mPoOHugdPnNYdJF5SJq+CwQRTZtz82EWK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790092663; c=relaxed/simple;
	bh=w/1aMUrorD3GhsnwRGoM5GNBpZYYzxfteJuw9evNJ/g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K2CEVwy0VpyL7OtKhaOZ2UZvEptRKsvos1NwwpkZNI9fcxwU76ylfu8/cg3oTAOp8SkJOf7SLhUJmkcmnrkZ81U8UlqY/7aIZeCZ07nfjnd6Ub2T9msqwgAzgc6LKp+EjClw0sUs03v/MbZypfvO6Li+jRcGprbdhZ+n9DA/cKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cfKTD6l4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ESuVLKuR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cfKTD6l4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ESuVLKuR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MEjMwv3307549
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 15:57:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EoVjOh/L5bJN9JqPUfRk2X+zSPYfrN8HTxLTfYK2UCI=; b=cfKTD6l4I4Uy5Ybz
	LCN7pmTckh4u1zCr/c0vjlKAiUPMIUXztpVs9upp4YMhUN4XyW0tU9ldqiQpVCLD
	no38JWJd44YIIQO1Y0tGAG6XVa2LfsisvUwSgNq9bWyL4VAE+cjaJmcftx7qtcU4
	tIMr5jN4CV0J65GHhW5Jli2m7dYtSkSJ5VdsiE7syHsPwJjDpl2Sn8cnrgkdA/yu
	6pDK+6F6QHN4xYfMxDsXyhZMvESmjZLlH+mmrJUoxC1pS4lbjASOIbw4Bchn/eM/
	JXJn4jRtnaa5Y1KrQle9+2thq/HPpo2vEqRM/yGCND3F60nR7XM/tiaaYmrSBErG
	UbzQwg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guj113073-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 15:57:41 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c82f9e26ebso239633e0c.1
        for <linux-sound@vger.kernel.org>; Tue, 22 Sep 2026 08:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790092661; x=1790697461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EoVjOh/L5bJN9JqPUfRk2X+zSPYfrN8HTxLTfYK2UCI=;
        b=ESuVLKuRYM1Hps38jv/CF3u3ubpedxE3Zxe+wsrshCvu0SZTvTLTBkzsjV/v4saAlY
         OfTdxOofFW/ON9mu6IUi4CW9Luz/ySHU5xtdOny8iiMppPAYXZ7H97h+EQQ66jTiy6Tf
         GzJHnBf5yUhm4RtcjBDlCJknxNifDNDZUQ4pxpyUuMV0fsmeBmG54sWFT8D5YyLFzTdX
         sXBqVcrviy/xCSlvX5lkVgMgA0ObDMJB+7ctrYXyddP73ehxIHQ7dcARiG5FnVscom4P
         4LVudZJrAzLGpaeDocBcTatWgiFFnjNmq3gDrrFM5s8LYNglc6BVm/USZjeMNmwfhKKM
         yl9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790092661; x=1790697461;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EoVjOh/L5bJN9JqPUfRk2X+zSPYfrN8HTxLTfYK2UCI=;
        b=HXC1fcS/2Fj06Ur5itmV7gQj8XL36w66OtuUb5hqr+rEkk4pv4tg/Yk6VhQ7bT26nY
         E5hc6K1cwxkngexzwrVbRl5b8B1ZM5u8mJGAwMQqNaPTV3b93vE+mlrozxX+iHquBPOI
         ycYu4oFhFzGdKfFE0zGXo/e8gy87QrHcz82onYcLhVSMGM3gTLCtBDdmkzuBsuN3zm7g
         rKRWbRwN1kSg8SEd0KPCE7RjTaKz9NNJLXAbg0XVrHaUyYtoJhu9fGWagat1QtmQLpQt
         jpKoz6qIrUFCt5OFkDnLx5NQEsNpVtvNPROfS2e7r7CRx1jzhCEvx+IjYBG8v1VW0TOo
         duhw==
X-Gm-Message-State: AFuF++nVMxx75CPv7WG+Zja2TVp7HNwFkOGplL43uhXQ1lpjxMYQDWE/
	Y4iyHY1MQErenFGKahbsb+IbKsosn8bOgSoD+3pH7C7hE3K6AJB2xt09y6uY/Q6gmRWalYwLDFD
	G8II/tc7nLAcG1id1V3GvwLiXFstVmJdwF7UzUUfCsjvbzS9aQAg3Szz3Vl67JE+XyQ==
X-Gm-Gg: AYBFou2fZ3HMpb7lnBIe/glNZ/OJSx05ZYIsFVWB09vTO8VqeOAx5fStSvnNg1YrIhG
	4cgFzBDP/dIqzWjnJBQTjgarTY87ho9bZyK2S/O8VEzsrbwWhiwDlHfPnTVaxjJ8heVlQdfsf01
	rr0zo9ksIf9fgtXnuwhbts7Rt9c/gXWueEj4RPo+G3+m23m48/WrSYB72mkWnY/QEKTjVr+wdX3
	58SNpGmGgvP9ISP5iY+TzXybPt/jVQYPUXZLKZsNqXvXkrZI5rGQR2Yb8n+Dyj+qDLEqz8jnwM3
	wB1YZOXoMDYFXZcfKWZNW0L9SZ9TexLSaZzytpHq/CdlGbn24MQiD/cHLXPt/qZGUPD6+/BFOCx
	dPQ1JT+VDJDMlcyw+3JfG+g==
X-Received: by 2002:a05:6122:4a4f:20b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5c9b86e8c7cmr7634466e0c.0.1790092660839;
        Tue, 22 Sep 2026 08:57:40 -0700 (PDT)
X-Received: by 2002:a05:6122:4a4f:20b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5c9b86e8c7cmr7634436e0c.0.1790092660464;
        Tue, 22 Sep 2026 08:57:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aaa450c50asm1274129a12.21.2026.09.22.08.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 08:57:38 -0700 (PDT)
Message-ID: <97cfc107-e00e-40c2-b20a-8288b74162f1@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 17:57:35 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] arm64: dts: qcom: shikra: Add QAIF CPU node for
 audio
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Harendra Gautam <harendra.gautam@oss.qualcomm.com>
References: <20260910231642.1794948-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260910231642.1794948-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910231642.1794948-4-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5kPBkXHhjC1OWstn0JOvAkJaPJFHfNZX
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDIzMiBTYWx0ZWRfX8XlnSxiu7Vna
 Q5/H09ZR99cypskoIgOYlCBVgMfkLiyaH+F36HFuoycptGvWsHPdmIkhTnA7AOQrxSuiZb3v+kB
 Kf0+nueitwDB4eof5WQk+6G1pu9q3mQ=
X-Proofpoint-ORIG-GUID: 5kPBkXHhjC1OWstn0JOvAkJaPJFHfNZX
X-Authority-Analysis: v=2.4 cv=atQnmiZV c=1 sm=1 tr=0 ts=6ab2a575 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=o8yTP1-73JeV65lf4HsA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDIzMiBTYWx0ZWRfX6SYELhNQ7RQr
 J4t2yjUJ/lEIMVKT+5qJnPYY2EeqfsN98ct9A58kclqTPRPw2Fm585Z94qTP2yh7cfde+lEsHG5
 SIpPDwM+GcE7z5e/Z9YUyhB3zBwD2qpuCqgZuZpVqQNmXAia9Yteb9+T/QwlOwGkKUqSCPqkmDg
 FUGFPMIC+GMpqXbk9GZDRzvCaZbuLcd6NzUvFZ9BX0bb6WT1sk3D3wazr65V+p2NZHVFu6Ufgfv
 HCea4EqEJkYw5fmQ9F1lM7rQOB718IWDBEMTNwNgMqTPTpPRgxv2Dw8CMgqyA1yxKaK4P/5CpBq
 TWDQv3R66BxH0dkiD4jpzFd5FyySGwc3XdRlcyoei2mKSBq+juTHMZUZB5wg6GD/hDXFx+PxqWb
 wzjSs+fEUQuvVQ/nRatvPzOFBcuertZRdmRhhlzM4dpVAT92cAQgYb9Q0R8ZVa0I5ohBbyLHRFN
 R3mOlNsiDwPJPFUBnDA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220232

On 9/11/26 1:16 AM, Mohammad Rafi Shaik wrote:
> Add the QAIF CPU endpoint in shikra.dtsi so board files can connect LPASS
> front-end links to backend codecs.
> 
> Describe the MMIO region, interrupt, IOMMU mapping and required clocks for
> the QAIF block. Keep the node disabled at SoC level; board dts files enable
> and consume it in subsequent patches.
> 
> Co-developed-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
