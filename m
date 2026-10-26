Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997098;
	b=Dp8Ka9tS/1Nf59id86phSO+YMaNGPAkXypJHdAHjRVEMRncxNnA6tHSjw+yC0jYW441i
	 2OCxL6O1f4s+PZoNqjtgLfaOZ3QzHJoq48Gxm3qwkZx1fvCfcVDWNGaR49Jx0Sz5I7que
	 Pj7y0HAZ4Sq0dUOOLZRJelMHHLwU2mJvSWUIkqzNqPfuUpejhK4QPC4hksfReiWQyfdl9
	 hAZrh0ShJFFlpIM3SWhERoRgUh0/OWDmLS7BqjnOgORuKSCiGceJxHAPzimuBQzRzCTQg
	 yC5eZbgjbeGBpafmjsfrBVXA5m4TPu6jCaXyuOsrvFbIQriEbwjnKx4r4vJtGpzw+sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=;
	b=cZefsGdqIjVNAOrf7reHrNz4LvflSK7FMHVZWaThfc/ebM1ycB0391Vd5Ud+878F2rH9
	 9jflBqyr5LqhvZNS+cMts2I1P+QXc8irmpmSTDyixKkIm/Kv3eOoP+7JyDm39NIt0zbMP
	 yBL82tR2Y7QQ+AaXvXAgodrYqk0ls7/AHgd8xzh1Pxw9OZ4eT3tKfKY6E8NyTLW9nGlTM
	 vWYLkD0IZVAuu301EujdSatBZ/NTU+tx9j71ciWJPKxfM4K8DUKRJctXNHBFnnR9CE0qX
	 S3kC7laVrxtagGXo9mFtvpHhgvx6pYCl1lhSnovyevtZQpqP4beLrj7P1RqHx/8XD3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ond4bT7d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Eg2Ts8/k";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADDF606A328
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 06:44:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BADDF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ond4bT7d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Eg2Ts8/k
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b8d71908167
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 06:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=; b=Ond4bT7d/9XO2XYd
	D6gexI/f1UnM23NhYQSn0iWE+hyBq1P4Ry9So30XS4D5Xe5Wk/qPglXGJKSMU/Qw
	2tOIKy542Ziy07Q5Gr/LEOblvKVXX1RU+xmD15kwe7ojv9GRGtJCF3WcdBYwZcQr
	zsYekdvvpKfeunB8rDmPPoc5i678Hlr1ffDApQJ18jZkEO5x2D6RqcQ6R+4dqovS
	9fBW+zpweKp8zWTgropoGb2TGd+a+Zxa1gWnYgPj9F/9va42YQn8953BSR1iPXzW
	IGAEiiIkWvzOIEJoa5/4pisnWma7oo/XdpJLPL28/ZuY63yUJ0JepNq0KL30yBa/
	ORDfWg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gn6sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 06:44:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3662e7a9299so13998212eec.1
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 23:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792997096; x=1793601896; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=;
        b=Eg2Ts8/kCe35YzpDLxXXo9pzNZptN2ipaJTOWdzCixkLYC1FIIS2Vm/hKoxrThfcLD
         yQvIdyLrf1w4qkZQQBtkvt6k7rX80scW1dXI1QAR4MHQ+xwh6NuXGUErnIShtrdZxMxg
         ik46YntHTzeUaaZ28fH5SlsID3UXBGc7/pyWPNzI0KWvCMZPkpU50Lfetgaagfz8e89H
         Yz23mtSyQUxyeTZoEmvYhgVy0jQVGviN0mbXyERUibxLlKWd1a361p6zYcneM7R80y53
         nNXLjzWu4ImKS3VU+gaP/+GDX24nM3S8KIGructeMZAmt9QaJVgzFUiny3ESFJRZTcVU
         So5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997096; x=1793601896;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tp1nCMega/EF+yHr95tHvd7b0griIO1bBQflr8/Sdlo=;
        b=b6C9jy5l3PHsDThUovK83mfGqF2xjwoaeYSC/gqUgVzlIZ0pd4gfG66GsHCbiYdyt6
         5rm4wYtCAEn3LOQYxapZxE3ayQGO22stTcgmTFqyA3ditKV7V6aa8dYiCVfiSwTFGWpj
         K/da4r14HRQYRA1DpILOM8jA/o9AUdl5l0Dc/sG/hO27bE858IaGjdVcbqkhka8eus+a
         7yhzVpMNY+20U0AHWWYzAyc8GPKt04AXqzpZk0qCyq7ILB0vlGi25bKmfv72RhTDY1hn
         oZsI7BpW58JDcrX5E48Joe8CqJeDhOOx1fO2p0qOaaJaz4DVAbeAjl58sW4vAEORwHaA
         oLVw==
X-Gm-Message-State: AFq9FYKSWlxaq0SWapT6UNgcN4wcNo8JrMcCCPzJOhSeZoYYiSLEqjJA
	naHfFar63Vf/K1Gp03xNPiz47gqnJNO5/mV8U5bBxEvzq6GX6uc8bN4e6wVVOVx/qZWVcGH0Z27
	yAuLXsA1jE1IfeQ2mCNQ4qMds3v+l2I2PNvzlIm+27pOMn7uwttx8qq+Jfh9obX/sbA==
X-Gm-Gg: AYBFou2nz7fTsoPlYOdr1qCd17WU+hqDh75QAbLqXLn/Mv2Ss76Zfvo7FMOHo5uAN/5
	gPCPqWxYXfKYrGCZtSvZG5iNkc40JCoV5M1ubAb/n9L65XbjYjZfeS6zsUAOQu5i1neMyQcf2X3
	K/G/S8OgKXHL8uq08x3mCx+/OIeHd87LNdqiJY6WsnFB7npnfkyEaL3ivB2UDJ7ITvsLxmwTGMj
	nVj+qIhPmLfxEEsDa4BA/m3LKT/VNB3UzlRSKTZy3pcBhwFNEac2yatlzFTw5WZ3ABWgG72DBWx
	WnoiolvBf2SAaR/V4hMWYrbSXa9m+GVlJvNK2R5BPGVxxj0W0kEuK/loUWjpAb54D/m7BQhXe2F
	ktzQ22sx1gIc7oAMzbK3T
X-Received: by 2002:a05:693c:8357:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-369e850d25amr9097266eec.31.1792997095518;
        Sun, 25 Oct 2026 23:44:55 -0700 (PDT)
X-Received: by 2002:a05:693c:8357:b0:35c:85fa:5a68 with SMTP id 5a478bee46e88-369e850d25amr9097225eec.31.1792997094810;
        Sun, 25 Oct 2026 23:44:54 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f44bd644sm14677674eec.15.2026.10.25.23.44.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:44:54 -0700 (PDT)
Message-ID: <4a520c07-faa5-421a-913c-f75227491f08@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:14:48 +0530
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: qcom,sm8250: Add
 shikra-iqs-lt9611uxd-evk sound card
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-2-karthik.s@oss.qualcomm.com>
 <33ee0863-3e11-44b8-8d66-9a2e0e6b1161@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <33ee0863-3e11-44b8-8d66-9a2e0e6b1161@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zqxInJNj1X3MJNVVMkdujL0bV81QTorU
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adef6e8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=orbn77WvMtTVaJTH4VcA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: zqxInJNj1X3MJNVVMkdujL0bV81QTorU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfX4/6pkgqmF8lP
 I3w+1/DEnMJaQjLIyJYs6B+9rJhTd1pn02z/K3VPIExG3coUFPNqPY8TTQ1/psuJjaTefN+0vZD
 0ozfVa3oP9ALY0J3M+rtU/GyxE9v8ibbWAHuEqZjaMb7CJimnSpWKALoMl/oGuBD3vgsnCaeTmS
 Tr5WasQYO93ASopd7TK3BLb027IHQhOpu2GO8WTwQLAzJi7KETlPDIJP15fxGshVoEUtJIsU1pw
 h+R/pyAkfJDqdOmvJldzd9GG5a4fxlF23zfPyvTe41iPlMTsDjuAbk9geLQzlqPdJ5MokhBHzGB
 nFTiE8jGw2uj20Er8p1AHnShALoiiV2XTbRtGZnyMtiTbw1U7J2AMDFeuBuFRZEFCKUOYC2h9N2
 ioJGaPdxYMbsQWxK2arNv1IQGrQVGuHCrehGRwD1HvjQJk2FLKgjf/CsuVXzZRPpe7VSpOu8goU
 4yHzvnKGSGYyLphrAFQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfX9AMeFW0da6+u
 UtGBLSpsj37U4gvBEHyAdfVAezXBv88m80FyIK7HpkjsguIvNRrSXGOMEysYcErMbRplybnbNt6
 fiQYA0hnBFCJ8FMu67p+ACdkaUFLlRw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260026


On 10/22/2026 9:47 PM, Ajay Kumar Nandam wrote:
> 
> Nit: please keep the compatible list sorted alphabetically
sure thanks will update in V2.

Thanks and regards,
Karthik S
