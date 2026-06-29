Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F34836A023
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782742820; cv=none; b=XLrSgaXWSiM662k4fYmbUXPrKlJ/WbMkxOwja53KLRgvSS8TugXjJX736/T1y51155gXdGeZIcIlrge51g9n08+pLh1XcRlOQUVsuPrB2N1YeO/BDw3cGV4CQL28HJj7oSkEaEulgkGbmg55cbTzCYwv+M0nGrhTgSJewHhz2tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782742820; c=relaxed/simple;
	bh=MQh+JXfosgRnp2N26Os6WR38uYswed1Wst4QmxMK5Tg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQ9GQzh4PKSMgpeXjfB3PkyLZzI1PzWwppmVbil7M8mRo3m0EtUxF2nTRupdDfJctd5Hqsh+kWLhrW6c+xbAQOnz52RwMx5SroWfi7V0yHJlpG29FAr3eRYXLerrE/BYZaLpTt2knrIEjdlHEi+s+2z+0AgeGRW/jpMQMbl7OoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dqx9fx2P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ex+lDoR0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dqx9fx2P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ex+lDoR0"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASu3J2640837
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:20:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YcbBWRwgvOfDz0077NvOLOZL5oIr0SL2V9Tnm8G3NhU=; b=dqx9fx2PQAOvAON0
	JjBJ0NIs00NhAoOl8X0upWn5qL9M/6W0Aut5eOYg7/7UnqkfTH5vlFcDiaK359hZ
	pkdSCZmp13RYcD2hsYQUYJAtAEFSkgTbAp7hPCq/iA/QMXnevPZRsDsgm9Fa3tzk
	z4PZ0aNKLdsTh7y/i9hJqPwexJ5FatfArLMbpQS/UxT99O+70cfYn9xzZjvLrMlQ
	Mobo7u7Z2maSQiFxf1KjNxMaNbG5wWBGQhG4LM9tKDptMvIIiUE1yE5KYnbX7oMm
	CDpOW9re3f+U3M4sAgmRvRmcPsJTuvLts7NAsUm+DPxpzwL6+Aujf679t9Be8Y4b
	tvcgxA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s1cu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 14:20:17 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7386e55c63cso40962137.3
        for <linux-sound@vger.kernel.org>; Mon, 29 Jun 2026 07:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782742817; x=1783347617; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YcbBWRwgvOfDz0077NvOLOZL5oIr0SL2V9Tnm8G3NhU=;
        b=ex+lDoR0PcBtq+QrR1TGjmlvtviQYQG9TSmPlrQyq5dKIiQhirpzjoKPcFVgIXotiN
         HE1ER0BewaXuFx+UXByl+OT1bzxiLjMCbJK9XzcKzXwN5xjwvGJIldh2XIqHUFUS3E2j
         qoGi2RH0kZJ+/d6opjEAfEvz7+cWO0rrAWDThBSzUiVboKuoi3p61UsfzhZtPnCq+T7U
         Svp+3hAKXNrXh6Xy8m4Jip8omLjXRV26b9I/8PG/LSYYtk8D8JMmbbdldABzT1MlBOkg
         +7+DbvvgLTJZJ3hhT+ICMkiKLjMntNLGZWEa8b0RZvJDyOijS9elZWFql/3cc0jHjPfb
         FrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782742817; x=1783347617;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcbBWRwgvOfDz0077NvOLOZL5oIr0SL2V9Tnm8G3NhU=;
        b=K+OeVUw8+fPRhlhRBJKYokpw0Y/bNmvgWIeTJiymTrviNlJpIr8WJ5pKnXEXfF0fRR
         LiRX0rGOQLn1D85D8vJ15RRY5reYzgl+evz96FbNzDjlJB1B2X9pN5uHbvuuLpvQ6oBd
         XcdJTs6Jj/h7UWLx82rwMALZ+qGOsS18Bv3VCjZqJC7Pe0NEB2iUkmqCONYFXSbUk8LA
         Mw3gfoAfgFNw3VwXpzI035Yy0eEMVmVQ5tKSizh2gK/TbZ48DJKhoNQ77Yz+q5t5vSyv
         lJpst67mt93ZNvUaujsrpb97ExXNtarpd6CnzYe0X5hFczy6SbwcCjElfgvSL8VjqNYb
         6sFw==
X-Forwarded-Encrypted: i=1; AHgh+RqHQpzOyplvbYbEWths0LoFR9NGyXmalAEkywhC6A45TvNITk7oGS9Hr/8AOhog/FYsVey29W0A66xYMg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdcU3jq0ove/IkieSRDCRyHzmzykY7SlyPb72TWlwWDnBaM9Jk
	lnLae2riYcBqdzxKTEt51fcBbXZUk5n3Y9Z7bRChQ5YVwC1TQP9T7vQdFmVdPIzlw6jYxs9ozsH
	veUgQXo+T2Nny1jb7XkDVTvF4vJhhU87NHuCucuVyXzocSYu66GIcRlLZ9bT6i7XJhg==
X-Gm-Gg: AfdE7ckf001ujV7MmbSbH/nE6Rvj2H7ZCNZYRADNzaoU7lJGnZdZQvgXzZSniDmwsK4
	ysn7acqT5FRIB4UMY3MZ95K38sOqlTLQokU50KWA3T+SK04Sn5A6LKjCFcGG8Qcc1BhJsUjEgUW
	ViDV3dWZl7XYfl0qQUJeATukdsTGHiDm5tg5hpY5yUT91MddsRzjOY/KjVD0VlhOYGggEf7kWGD
	o3MJk+CdUihVv/M+lpDVCqLlmqPe5mfxZ0iArHfCB+RGRsol3labHPZCgTFiPXBy5jhrVqRLU66
	AV5f6ECBOIftMRQhYoR0IdfLgOVCzXZT1qbJzcMrDg5s0xMt7CcNGCPUWhkOCFVeNFaZo2QrIC6
	TvNElozIh3jFKk16fVcIpvk6kgt6Qsqtybd8=
X-Received: by 2002:a05:6102:4423:b0:739:de1e:6c28 with SMTP id ada2fe7eead31-739de1e81fcmr222973137.0.1782742816497;
        Mon, 29 Jun 2026 07:20:16 -0700 (PDT)
X-Received: by 2002:a05:6102:4423:b0:739:de1e:6c28 with SMTP id ada2fe7eead31-739de1e81fcmr222966137.0.1782742815983;
        Mon, 29 Jun 2026 07:20:15 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69847322ef9sm3615315a12.5.2026.06.29.07.20.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 07:20:14 -0700 (PDT)
Message-ID: <17b655b0-708a-491a-8a7a-93ebdbf1770c@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 16:20:12 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Add MDSP carveout memory
 and update APM DAIs memory regions
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260618113509.2025881-1-ajay.nandam@oss.qualcomm.com>
 <20260618113509.2025881-3-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260618113509.2025881-3-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfX338oMDR1bdRK
 eishiY2uFAGfMm5oYF7zD8tgh8osR4mZmX5TubgWcKWKE9Q6cHqg9SUXjzYdh2xWmkbDHRwRfY/
 43o3TMpx/oUvQC3hZRdtPeLtoG3DFQU=
X-Proofpoint-ORIG-GUID: GxQzMHUzMizvynbUU1j2fmLBkszwhhZ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDExOSBTYWx0ZWRfX7+p5JUh9F8qO
 Y/zy/fhYBABtSTNLLs0ly59FSm0KH5yYBkBpgE+tK5A2kcslv+gR1VDbAWB4/m97pbaTRAe1vFL
 LOyZDPhxOMYaTBaQryNGIu53saptP6bNHLkHdQjTJqyw1QOtwg5WY0/xFOqloXs82LCEBNEeSc6
 V+l+ojgz8UNOuP9cl4fZKEp/YHondUci06IUF4+jzoytg+/tjAyUNYQN87Pzxj7awVxD8dRN58o
 Gs0d1LyiYOzjVT2Ex0t2eMxBGr7Ux8b+rctgIrtRcji4uaY7phb4+2WPMbGeiHyFT2Z4FrGcMZf
 OKAheK6FfngoZe1Z7WessIRGENdVAkXgb0n+m+70LcMD7qfRyyRrwTegqQNT0kaOKS8qTUEAqa/
 DdAhTJlw8fuHJ0fNm7EI5P4V66ZKdO3+aB0mlVcRWRlDPvalbIAWGzu9I9yesZs/AyBWtiHhNEK
 eakAO7SCqemKlMGxrBg==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a427f21 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=02jZw4jujDeG9Hx5Bn4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: GxQzMHUzMizvynbUU1j2fmLBkszwhhZ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290119

On 6/18/26 1:35 PM, Ajay Kumar Nandam wrote:
> Add a dedicated MDSP carveout memory region for audio usecases on
> Shikra and mark both existing audio heap and MDSP carveout regions
> as shared DMA pools.
> 
> Update the Q6 APM DAI node to reference multiple memory regions,
> where index 0 is used for control path buffers and index 1 is used
> for MDSP data path buffers. This separation ensures proper memory
> allocation and access for APM communication between APSS and MDSP.
> 
> Also add shared-dma-pool compatibility to the existing audio heap
> region to align with upstream DMA pool usage.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

So, would audio not work with the base of this patch but without
this one?

Konrad
