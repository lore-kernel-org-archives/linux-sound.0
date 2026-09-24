Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EEBE313547
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 04:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790225842; cv=none; b=nvcAz1CFKIqggNUcyCcTGGb3nam5AqEeQm11Ru2eLGMYq5OIV69/gzYsF4aqT50es0ahrscRE+HYT0Z9e4NOyiRqHPeBf+JtQ8QV4SzXTwnfrB/0xdrDy99i0tK6Ngr1G/s25nOWyzBWnIDSbqUdmBNnhH3WJrmSpGDfbqFx2cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790225842; c=relaxed/simple;
	bh=Mpco+6yNdH2y+nlCpp5arIK1VEtWdHw1yaMXxUPtWOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W04WZXMG3qW0ZP/fEYmo6YOuEbXVikMgz0PUhxe0drGRZyW8F5v/SXZQBhcfAP3yYfYy05bGhHx6rHOexCKc1py5N5k91vlUg4ofYHxu59XdlDO7I/mdkYxV9paTHPT18LQldXcduI151R2vdHe1/uvTu3tf9mRCWXePhDVtcWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fFiYGhSW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RCSXbeCm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fFiYGhSW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RCSXbeCm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O36jus1416639
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 04:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ut8DVTQEfpH6qJZsAQxJYFs6sRDVv54/ARUFWr3kTyw=; b=fFiYGhSWRQWymu2b
	PSG/AjuiAoXlbs0NkxQmWgI4tCo4OFt4fiFScB94yiFXfGxQRm2LWFkZegMNY2XP
	Dyo1ieW4T3dkXjj3CVgckAAwQih8li0WUZqrVWLHlhyIhFaqtWSTLxUU88kha6+N
	zrKiaaytH73VlTeEJBLo5yMZcsijNGTbT10S+GinUN/Z1jqLH0DhscPBfT8dQYTS
	s05FiE/rJggcmh6ri6VTIvS0d7DDYbSLlyfTxanwRDtAF6c7S7zI5Sua0DKwqww3
	Oy5NrcNd4HFDzyQdDgv5NYjGGnkSqfyS9EAYgbgFeMeVTPmKaFUCQqJ/7LzJgX69
	Cc4gyQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbkam0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 24 Sep 2026 04:57:20 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1416f32fe11so2199907c88.0
        for <linux-sound@vger.kernel.org>; Wed, 23 Sep 2026 21:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790225839; x=1790830639; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ut8DVTQEfpH6qJZsAQxJYFs6sRDVv54/ARUFWr3kTyw=;
        b=RCSXbeCmY5kIV6rLkpryqp7Cjw9oPcTE4bs/KKiG7foUoTZF5rPYr88RN2ekDKmxDb
         SyxTqIV9mQMtvEVnBSSE3697jHqnbzU6Y9jd1Yq7+GlPazbVZXMP0SAhfJLrjoN6ynhU
         CTXuTiFRcn6/GTs5dE3m/g2La4NWV8PVE7NkP+h2fTV67Ib5WNua7bmy2TVHbHJcjOtv
         TzaTE4Vsq8ic9UYOMesqPsP/jmy6BAP1EFF+FMYYfjWHkXKqv9gXnYFItkSYvAJSCgbJ
         1HS/LQmeZpGXw+kaqi/k57u0XufxMMyykHLVttfYSXXNtK08DedUX2EijnbM1uDXKQ83
         oYrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790225839; x=1790830639;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ut8DVTQEfpH6qJZsAQxJYFs6sRDVv54/ARUFWr3kTyw=;
        b=P5jd6vH+wrGVPnmQex9PlbnYVIQBwZiQ6y+cKupmwveXDn098gz48lIBvrYiaHRAM2
         nOvr8GbSQrgaXUFEQ2OTtGj0owHEO34weSoLFFYCGQW2+XwcBHVXXAxBb7o2shB0lWJn
         ttzwU2JbD/TpDIfr6W3KgtlljZTRIOMxhefaDpJgNy/6BTLBnIeWKEZN1ruUkTqaOZiI
         /c10UPF4nWINJ2ssnvTteIxL0PeE0TRgIDcalnbbtDxZwqSYuGnLmEw8uBnO2ECqw/jq
         nczEeIgv8XClWyybdEVR+25o7ugP2cMmV1zFZlAMbTbBdcS/3YSnbl5zECynCqapSCuj
         kn4g==
X-Forwarded-Encrypted: i=1; AKwUvBxfD5A68RYjHKSxO6UXtb9YZvv0cBDJXJWnufobfQiEGy8pJTdR5U3E+F9Fc6Gep18RXIxFj+MtSw4vfQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kTMb9nX0Q4vM7Y8OjQ+H1aJH3oT3O1uHT+Dbv3bh8/qCalSipi
	j0edqxhHt+p+lS13maJJY3VzwOyw/yP0xbf/OhWPFyN1ZOEYBzQ/X+7py/pk6tCdz5LIr57dop0
	PIF2w4Ne1hcVFOgk8Vy7IfVsbPvgOGUArenG0F38BQHicw+chttet6p0t7H37/YF/5g==
X-Gm-Gg: AYBFou1DCOY0N5qc1TBtZzD02pJcPFnS7nG+tDs814BftmjPk+k12qrBaQTSQDP6SHY
	2RcFmmZ1plaszYBUNiFbLcTulESBgrNOjpM3B3KMej/L+bxJMEcgKBBBSZ1IruFC9E++sG6A7Wz
	W24YuA2pNNSjv7a6nWTZxzMAXPrdAm/OcF2DA9FA8exSIUdw19rv+uzGaHLgTPKLoovUn08gJmC
	zjPSGxavBGdVnUiHGtT8pjg2I+vUdWU18lQT2SeVesG0/14wDXgYsNm8bkQygP+wqNvbguEHS3S
	wMdRWw2YixJYuO00Wk44yMuhZJKhe44x6/SIe+5VnGKgK9fTUtO03CdRIDmhMe6WUg3eE1ZzklB
	yuG/IkiGCnZCaBuGIlJxDUG5ZGWN7
X-Received: by 2002:a05:7022:eb47:10b0:144:f480:3541 with SMTP id a92af1059eb24-14503fe8205mr1007940c88.21.1790225838850;
        Wed, 23 Sep 2026 21:57:18 -0700 (PDT)
X-Received: by 2002:a05:7022:eb47:10b0:144:f480:3541 with SMTP id a92af1059eb24-14503fe8205mr1007916c88.21.1790225838269;
        Wed, 23 Sep 2026 21:57:18 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983d73fsm12919002c88.6.2026.09.23.21.57.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 21:57:17 -0700 (PDT)
Message-ID: <92ec9d68-2baf-4b8e-a8ff-74e0d2c7295c@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 10:27:01 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 5/8] arm64: dts: qcom: hawi-mtp: enable audio playback
 and capture
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
 <20260923084627.748920-6-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260923084627.748920-6-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyMSBTYWx0ZWRfXxmIY1WkTUqld
 Zem8VCnZm8290GTZGk+0Sy8My6D8r7jqh3ppjhhmcCmPh9FcC7UaZp1VBYsK8nAf2v85gRQZTi9
 XO5/wPzuLPIhQhFmWIQlLxHC5b3VhZk=
X-Proofpoint-GUID: cGvcElwcfwoRSH6be1UpaXVz3gcxBZT0
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab4adb0 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=xu3tYevT26_x5ihNIyMA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyMSBTYWx0ZWRfX5D+hQqs5nQCG
 1hzrgchREBb/DAaHcS7fCd9nJEqOAAL7RIbAakWJzRCXPRY7fDC98NXw78SDW5A6EBOtH7bKHHZ
 p4azfO2tW3u09szclNCiftpVMz1D/I9Q91eMP0a4agnPdQ8iX9Ah78ZVezhUaayN7CgpsxTLX+j
 KUgBrgA3tOt92rNfJ8hvEYyPletGESMGZP5HH2FsoYEoE3nunAmFEG5IQkIzLwDqqLEuwKwOGdr
 kKUNTwtDMGr00ZayBxinqOddU2PDUEBzgYsyEMvmbLwLys5FrTo/l/d8/Hx1TUrwX39/Iue0cdf
 xtF6jQvKXtcHwtV5+lYB0TokxmR0/NAoYuJP02PzuJc0K9iAUSIIYrvEg6wv6cRJ5oxqns3QJOV
 rJnDKCCpZFgwwXU5Fa73QWopooJftKAp7KR/P6KZFmJP+hSRRooXogsBng19ILbIz/YIcnv78NF
 gCqjb1tWspQT/vRWKKQ==
X-Proofpoint-ORIG-GUID: cGvcElwcfwoRSH6be1UpaXVz3gcxBZT0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240021


> +
> +	vdd-micb-supply = <&vreg_l10b_1p8>;
> +	qcom,dmic-sample-rate = <4800000>;
> +};
> +
> +
> +&q6apmbedai {
Nit: extra blank line here; please keep a single blank line

Thanks
Ajay Kumar Nandam
