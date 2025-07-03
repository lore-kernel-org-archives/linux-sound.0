Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5E22E49B0
	for <linux-sound@vger.kernel.org>; Thu,  3 Jul 2025 12:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751544980; cv=none; b=btoJZ6TdmpWB0GCoGdVbGAHna3zL7KC9aynQZhzTuiOEeCSiPSbhCxgWMVMp7ZjmQpgfYzQRcLp8yFNKFgJhsSEEp0hjAzGYKiNErxwMRw9s7hv0c/di7e3AGDsqBkA+gz+KXakV72ZjKVrTp65w2e3afBfvAQMBUwRcn+r8A2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751544980; c=relaxed/simple;
	bh=wqz04Db6LoZ9YrCmc82vhkASDZs0DPlOdRoUbKw44cM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uTH7xQaX+IhThiLJBgT+1FWhSrlR+ShhNeJqg9rJYnPOUgcKlbLE3z7Hg4EyAzaXLxPfM/ZKxRq+gRRLTX7uot0ndkgP/I2Z7VAu3kylFNxk6B4+LhCrxAoQeL9ds4CSNNUgLf6BuvZaCT3KnGLExtklGW0qBx5IqvqovXJE0eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ICjvnVjY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICjvnVjY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56387YLX008123
	for <linux-sound@vger.kernel.org>; Thu, 3 Jul 2025 12:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VkKzD5qOAqZJdTLWvOv7/OBA1XDD5p0ax7HN7SWd3zA=; b=ICjvnVjY3rSvxC8H
	Rs3oOg97hLP4jbDcnW3srMrXJhYLCnNFqdph63UBFw9+gHvVoKmQGbaGNlFTluMg
	CGr03xkjJ5VMFrzoeAT6k7P8OAQSV+I7YFvJq2jJERMCpGrbC6g7DM+WRvfEa9FA
	Sr/cE8OdD/9H5q3awv2RBv0HyWaVdbG/lxKRkyjkzKHwu9GQUqIa5rjBt954qZ2C
	PBsq9xKgJYmga65O1ouiAZPrCX8unTLBILn7J+soMoyQgNSxa4OviYq/ehZZelWJ
	ZZpBI/mYiJGOGTPGSySVdr+OKG22UY6xyS1RQKT7PlQdAvR1zUbVpYm3/C/dZ66R
	Aqfmpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jmvh2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 03 Jul 2025 12:16:18 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d097083cc3so202933185a.3
        for <linux-sound@vger.kernel.org>; Thu, 03 Jul 2025 05:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751544977; x=1752149777;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VkKzD5qOAqZJdTLWvOv7/OBA1XDD5p0ax7HN7SWd3zA=;
        b=BqCYyr+pWvV+yf9FocljqGAXhazYhg0HyrQMn6OeuM6e7MkiFPYYizn+8B9sG/wecK
         VwfkLBgBo5wbO4z1KvFkKIEG8onelhoskQykh0SS4IfAfVD5A2xVmXatzAY0vK0n6QKW
         e4olhbRFy3koIjAJhylLyYQaWgrhaVk/3IBi4ep/HJts/dCyXXBKaoGhwl3+W9B+Jh/y
         w2H8QgeSaIjMx3NzFZW/6eQC6k946sCzioeOpQKuEtY5QFtjxX+1zjTZrvvluyOV64qm
         Ll8NfreduKQQx38I0ffpxDjAGNQPnecayo23WjvLWAYHim+sDkwjvY8dtXpsK77DpQ5l
         iXOw==
X-Forwarded-Encrypted: i=1; AJvYcCUA1N4yGDGrVLAi45iTGIccdTFMXUdhmHw+jTUp+L1LOV0hVeUPU52rAQYdGKMkORqMI87+uGXnNq8cCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YytmppoFv9s9lC6aoW68e3PTTB4R7YiUpsMzw1UqI7tVkXkXKYw
	go0UAdtNqPzuxFWTmILQRmRA8raQhT2Z1Phx82RUMGlm2hpvHrTxHgyz3/anRI1pHnRUF5zTE1l
	GhQ8TtMBVeY550Y0GxV6GeqRQ82ePx2H/KM1TkwamWF1hgDruuId/AbtLVvoiW2jqAA==
X-Gm-Gg: ASbGnct/UzKRo3KoXbVn4JNJfmWvVmnrysTvNUNjUK2LJ0dU1Gy2COeIfFDO/F27SE6
	BE4JY8rU4FTRQXYVhUAQPDwsHNaNjapyQuDDJpMmaGuFWNhHXBdEgEaqhtRFYGiNCHJ05JLlwbg
	vI1vU5R5pYnRHUW/tp2/cazTnhchTxIehp/iQbos5tGLyz8+cTVXqQGbyHjHERLfTkhvNGo3Opl
	HJ8eAW775rYPaDxf3xsPQaPxlCCjzUqPRp+4ADEFPPCHmosUy5lr+oIE8GWIsV1e7iX/XwyEd2n
	7PWnikznjcfu9HIcoRNU1idDFHi+/xTSfYIniL2eAtiUgoKHSz1K2ADIYBrE/3r+t/4kURdTDgL
	UdtfAiv6F
X-Received: by 2002:a05:620a:4553:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d5d3edaafemr103809285a.2.1751544976972;
        Thu, 03 Jul 2025 05:16:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUrtibPHvr8N2yWud8azUvDMAXwVyMTTd9CkJd3HPkF5mfJT5kEni5VZ3YyZtkHv1BLI2AFQ==
X-Received: by 2002:a05:620a:4553:b0:7d2:89c2:eddb with SMTP id af79cd13be357-7d5d3edaafemr103806385a.2.1751544976513;
        Thu, 03 Jul 2025 05:16:16 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3d0351285sm179677866b.23.2025.07.03.05.16.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 05:16:11 -0700 (PDT)
Message-ID: <185e2398-e804-46c6-ba94-44c42cce684c@oss.qualcomm.com>
Date: Thu, 3 Jul 2025 14:16:08 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 9/9] arm64: dts: qcom: qcm6490-idp: Add sound card
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
References: <20250625082927.31038-1-quic_pkumpatl@quicinc.com>
 <20250625082927.31038-10-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625082927.31038-10-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=68667492 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=m2XL-mgSGVCMsbPKemYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: RwfUdLYlC835tsbsVRtfcnvC9By3mDmn
X-Proofpoint-GUID: RwfUdLYlC835tsbsVRtfcnvC9By3mDmn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDEwMiBTYWx0ZWRfX45lUSiexStkv
 FZazCQD6dia09NH+2o3lZg+QHWiERfw0/ebhPRTHHRR7xZ/tFoQj3nxThTCpDhOHckSzXVw+J2b
 Sre3Mzpv4VnwLQT5jtRxx25oFSQSBzf6qd7mAka195ycASH/LcSg1ACLmrWUKzwnXcQSGwPv+0a
 mBBbYPIauSp2nLflaJSbUW7/0/5h8cnIfNYQQ3JeLXZWn+I88ZqVl+5qLKLMMF+HaT5fNDWr1xJ
 fT+A0Cl/jfufLp3LQWNEssgcZRiGl9teWFJeJyRM8VscaaZjKJI0MhU2/XjVU5gc3undJIFsW4Y
 B/tthY3zFmh6AIvDLxqKXxcjEs2ABLcI1GFhrjtBg1Y7NTfNZK7sKqltt20E3NoVGd2GjVHUMvv
 oULms12dglGdlnmIn2W/bJB4+crNC1liYutw3Xua3A/7muqWW5v5S8IK95V71+OHR+GtnV8U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=817 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507030102



On 25-Jun-25 10:29, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers,
> digital on-board mics along with wcd9370 headset playabck and record.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
