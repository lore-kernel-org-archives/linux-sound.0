Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFE63B95F2
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779446549; cv=none; b=nE6j8SR+u8di8B7fJT3WVn1rfBAu9vRIb3ufvZ7NUqDrCaJTR5c7rxyKA7q9k2aPpontsu4CSDZwU2BF0Bg1KxCTSbP47HRtdNlGCuDJzK3pBzK3Afm6YzGdWDQVzqxOX97TATSEfOzE3kl1o0pFn3gZk9eG2Oo2SZRlM4b3Ds4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779446549; c=relaxed/simple;
	bh=aUSi5xoZRGRs4JsHTX1qc3p6aeHbyhlKHdEGsBEloBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=peqV+H79zK/cvpHB4NBgBg3FnFGdJRh59yCysl3ijzRH5f9RZoBScK90aWIhgNhzPa/MJ1kV5ZIFO8iLokFTQnF63AOy25xAr9XYJ4KIqeuWZpPb7oj6jJKa210TtcGWIp0NcrDbtHmojK10thTqEJaGlJ5eKK9JAqxjg6xqFQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GgaE6qT2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFkQYdsD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GgaE6qT2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFkQYdsD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA49ed3947391
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9DqJ7TcwQLXud+3mI+dE7yiH4fHIlTZ5Kt01o+nXWQ=; b=GgaE6qT28IQAD12x
	0s3JT9kpF/NrbTG0oICEcG3mqchXlytX5CECmdM9TtrmbkpI4eTarLvT1y78TcG+
	AkNO2MmZr0f5oMuOYQAt2RZkYzSFGjvHjEtUQvl4L6wATPlF8z4K3eCp/ijxYj6L
	1hoIdh/SgvNXCezQFpDsI9ErT6y1OFBTvp8t/R99+zQwRDMLVeokcwqoE0N5cg14
	t8919ak6pvouVbSn2c/jQcvM77DvTA7RPtVBkkmXCRFFGqeoeJU7ADnNMyIlOtWr
	6xKGswyUE0WXT0wLvpYQ6qdwRVHbbVwKFxAitvVo/qJ4YFT97Wmvaz0c475ZQwjS
	lrKhTQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ean2ng4f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 10:42:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-914b56f450aso21083185a.2
        for <linux-sound@vger.kernel.org>; Fri, 22 May 2026 03:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779446547; x=1780051347; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f9DqJ7TcwQLXud+3mI+dE7yiH4fHIlTZ5Kt01o+nXWQ=;
        b=SFkQYdsDOypAhCb1ays3i4KTCwc62V7skkJiHyBkPs2Q8Tehro6cK9g7SMHospCu9g
         DpbmII03LyeUMC3HPkVJkZ360dFgfZW1CzMuLASdpZ6k/lMkAwRI3oOod9iy3aEGIWo5
         fRQR5c10YiO2TIwCPlIq4X9hWNir0xbIGh96abKUwH2shhh0DRZS/A5oRkKGBcQ8sHM5
         RiAMqRA0sk0xPM+D8medtG9vIn2CdrYEEqzieE+JUpI9CouAhdrlaCjd7BHfQb3Pl7J7
         c+kN5Ut1H9FOm+2vmkv9dIxerR5ZSgb3e0j4J9R1usC/yZRTIYMz9q2ui8q5GVAQ24sd
         SRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779446547; x=1780051347;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9DqJ7TcwQLXud+3mI+dE7yiH4fHIlTZ5Kt01o+nXWQ=;
        b=i/FMVeLGXW3U6R3oUMqn4lbD7p8LmHZvOD7JxjFMDYTmfIKnlCys+W7FBmC++fTTWc
         cAi/FeQ3x+bp9akLhejxSh0h8RlZ526ffJznEtnF3Ni/NR1E9cGA8Y85a0tsfSgp6x14
         V+eK6ESWvxPYpy/L6J40DswW+U/sUqZl0DxfDxt7TPcmTatlgMg9rC7aMHld3osb/mMq
         75lQHkAQXDSb6OctHZZ8vxMrDEk3qaIiP+dQ5ZkSVvS3c74SuKbo2GripKt4SOSzX/DQ
         qXu/md7ATPOZm1kiV0n6/3WKGhtX9kpAJWxaVO3jieLYOZOf9/lG1fH6vv8djdlqu6dz
         pIXw==
X-Forwarded-Encrypted: i=1; AFNElJ/o3xR/mut10mi7qKIm01R7roOTCj8rpOLkTVRtgtMtPoWgYy4rz7PbBXrRy29cHCc0UJ5AOIh3sWUj5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxM6WVzAhAoTUyNPO16Mtwd5+cLQM/8oD/gpUpbXAt49wopdRAz
	CfwMCLOlX2XSVGVBvu+dqlBfB5hUoXpOH4aQXCrtW0i2tJI5jXXaZzY+r8/DSgY3lt7jXtJTxIi
	u6d8TKowevBAHcOZA/Xligf28M5MGz7D3iLBOjf5GVupqZSUNQ2B+7eSeF9MRt85+Qg==
X-Gm-Gg: Acq92OGx2Ccm6nG+aTljHeaN6wCr3kIR1qjYyFs/eC9nXono8peIy1AAewb8N3RMIyP
	V5wCGmYfhNk0K3WTlHRej1ZicMI5CB8CEHqIOGFlSNVe5fy8B/vG9lRif0WsqTphsoEFUeJKjNP
	ojPVXkZf+gMoXbiENeZYMjab8W4Uv2t6C17SzqzAl5JW8JQ1ftQ+ElhQjpCRbzLFt9m28wPuAlu
	0TVFUY8nMXTkubRe6X1YZ7bG9HB6IsPYo7t4MMIKzXl2tctBV804wGjk2rjIcjcKKYD7FApJ7Q7
	W/km4WTDvDNxO0+cR9q3VlxABuTT8MX+3gZ1ph8914DWOZlesNqE5dEyVruaA+szv5DZnkB8eRB
	8V1QcCbeaol29E9DCP1F9FLWWKW6QHFQ/9FkB9s5mePRJDg==
X-Received: by 2002:a05:620a:2813:b0:908:a758:baae with SMTP id af79cd13be357-914b49fdfc3mr291353885a.6.1779446546933;
        Fri, 22 May 2026 03:42:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2813:b0:908:a758:baae with SMTP id af79cd13be357-914b49fdfc3mr291352585a.6.1779446546515;
        Fri, 22 May 2026 03:42:26 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bddc264dd45sm42661166b.1.2026.05.22.03.42.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 03:42:25 -0700 (PDT)
Message-ID: <1b499f23-213b-46d3-b4cc-3b5aae2cad7c@oss.qualcomm.com>
Date: Fri, 22 May 2026 12:42:23 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Mark Brown <broonie@kernel.org>,
        Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com
References: <20260518081738.2453957-1-ajay.nandam@oss.qualcomm.com>
 <20260518081738.2453957-2-ajay.nandam@oss.qualcomm.com>
 <c2223ce4-0e9e-4fdb-b289-4e98e64f8e95@sirena.org.uk>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c2223ce4-0e9e-4fdb-b289-4e98e64f8e95@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XvDK/1F9 c=1 sm=1 tr=0 ts=6a103313 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=knVCPYfzRBhieiZ2OR0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: mKQn7OX_HsQ4YsyIpGMbe3ELsoJRnS_P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEwNyBTYWx0ZWRfX3bqAXdmz5O+r
 4pKUKBFuA8kBVJ2JYwrBXzxGSi82IxzF3OKVYKTf9XVgSpSzKAsH3Mt7C0I7I/O35n+bYKLYoSl
 JI0DhLguXSD6kosCPnrrOMrICPAL1xzp9fE8PD+2LEaAkFGi4iC6O3tcBTVvQVCFmQo7ULaqkHY
 gMQxCkF9+Ex02E6NJ6rmJglGRNGaEv2yaUPGJgBYFQep5uUQ2cm1ZPtBObyrhNGOpO+uYHb2tPc
 ExKIiA5ooH3KmvU6JT6/zzmimLjdRD4W/BRY7V9OE4D3Ngr1czy60KtwB94mgujCtha9nKFsJV+
 xzE3KrPhawn1nCsX+vxGtqkSdHVwTZTVzSb9KQYQJiSDh7i6dhxlAe0GTtJDoFHk1tUAKtmMVfd
 4Pk7ajjCOTQ2UcIcnRJKWDzID4gyCZx61qtI5kQPZ2QCS0YpLXoXRXxHthGcpUqtsSx9wabFpH4
 mI43YcOlqcNfHNnkwmg==
X-Proofpoint-ORIG-GUID: mKQn7OX_HsQ4YsyIpGMbe3ELsoJRnS_P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220107

On 5/19/26 4:33 PM, Mark Brown wrote:
> On Mon, May 18, 2026 at 01:47:36PM +0530, Ajay Kumar Nandam wrote:
>> Convert the LPASS WSA macro codec driver to use the PM clock framework
>> for runtime power management.
> 
>> The driver now relies on pm_clk helpers and runtime PM instead of
>> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
>> clocks. Runtime suspend and resume handling is delegated to the PM
>> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
>> PM callbacks continue to manage regcache state.
> 
>> +	ret = devm_pm_clk_create(dev);
> 
> The !PM_CLK stub for this just returns -EINVAL so if that's not enabled
> then none of the clocks will be enabled, the driver needs a dependency
> adding.

This goes for both the drivers

I don't think I have other comments with that fixed

Konrad
