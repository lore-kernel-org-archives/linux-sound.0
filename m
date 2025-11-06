Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2062E3370F5
	for <linux-sound@vger.kernel.org>; Thu,  6 Nov 2025 14:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762441114; cv=none; b=K9mslaHvP1ivKCUvC7S4nX7o5gV9sQCHOHo4cLQ/SyHzlFBEdMJJeDjkX6XL/lUV+YLJ4aA/gRJuxhGgBizxuWQFwE5cop2peVCbIOfbedyyIIc96aW75iObAfQLjmft/wb1OXfBmZn2popez7pneqhgSwGxXTgYXbCf0qI4qj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762441114; c=relaxed/simple;
	bh=wHjCF8IEFhlkHVeBtODMM0Twhtinbk9jVlqp9J8Ua4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYg9k+UeJ0EInDrT/pv+L9uUBzX6OhyXIGOcBOEt/VlMouTA+NxeC4MdqrZzIro71es/RyStBb9ThzGfXZeJH5IxgOEH52se32jnDfXTMjOdV3GSchfURzZAC2/t1P81XlkgoMF8FdAn81v0GyK8NDVaX0xRa8N/YSrVjjtOD1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ErN99+zn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VC4p3Ra3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ErN99+zn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VC4p3Ra3"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A66rB9e3361967
	for <linux-sound@vger.kernel.org>; Thu, 6 Nov 2025 14:58:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0f0Yt6BImgfsLX1VnK160zjY+hQZVBZMn8DoklT0x+M=; b=ErN99+zn6TORx8P5
	MbP4jS6yu+eedDMXyYq61cyBKDfeTwTOxwr+McB+MnXCSX/Yvrt0OQEFPoeO785M
	R4e+dPTDHba/WDlqZ/MRn9jxR9/3ZOOAkYNRBbRraGUJF8d7O8syCaVLHJj392/i
	JYNuLKgWa71i4iOMQW+TDcjoPU0P35qOOAv9uJepBbjBFo04WNVCvznhwD4eCBlq
	Fm5PQ4aZJqCclbG1pIb3TVrCZqBvf34uWZsSzgZgVZBqkDUhA6sq/GXE/9Gdr5YD
	2N5sQXdYmKnT8Krs/pTNh3SVejMpc6ojFj/lqC/mrKuFMa/iDA+kesQq7nH1S45o
	gLtSBg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8pt59b1f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 14:58:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b184fa3ffbso14905385a.3
        for <linux-sound@vger.kernel.org>; Thu, 06 Nov 2025 06:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762441111; x=1763045911; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0f0Yt6BImgfsLX1VnK160zjY+hQZVBZMn8DoklT0x+M=;
        b=VC4p3Ra3JNEYPtI5yUy1/INqfdQzX7YtoM/JJmVu8ZFvhBJZLF43Ky80K945phFGBl
         nPotlKhHc/HQhx9xrN/D5lstEOj3YcFiHovw2CtdHEBkZmY2tQBfFnw1yMSsihdv+WIC
         9HzHBHHR0Lc7GCWJlK1qG+BgXs49i9msp8uuZBXVa6imncpKANtVtlaODxDT3BElTvi0
         ZSeG3PGZxsZvM0zziTVogeOO4hHSxGLB3HdYOOG74t5lOroOCJB/0iy6YRKGMKiFE/oU
         WuXGO2vQc6Ts7FCYaR3qp6R6PsHlTxr6r+vDmfvJomod+WaPVgq1alhFhU967jhnL3/p
         SM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762441111; x=1763045911;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0f0Yt6BImgfsLX1VnK160zjY+hQZVBZMn8DoklT0x+M=;
        b=acfFlmq8RybpMYDdfFwDC5455ATurmZrrarfDZnCBkhUO6E3+JLydnZzgm96aTpPUb
         wHt92lpqRmOjJD/EKlINa1nSVq47R8ORZOopjwP7fE9pVJcEwcMSHfxyy1lcjEN0bqmz
         8+9pT3/l3f+5VfApBnaS7rbGra4HHt2jJC2dOvK8B/M0CrWwFc1mKxPPSGyIXKvy0jjR
         aBfTmBVlGYlwy7UEXmLRcG9ddBg5BunNNog3WlEPltT1HKDheZ+aYIi0BRyJzTl2N/Hj
         15eYZW/lIItvvwp6e15PZ/SiD/vq5jTGqiskPKEqX7w3m9MDsSUi5OlHfO/2jKbI6/Cx
         Orfg==
X-Gm-Message-State: AOJu0Yw2pT/RJ2PR2ZfHDSVPfIxJh5OvCbf/AMWvojF7Tr7elKuwuDzP
	iSD0ZABL57W24T1ZtF+5/O07tocLT+UQj00go96nGTdVuZGdLksQlBtEXNTWhrauoi2+PrwAQz7
	OG+7RA8c552rXJH2eT/qNOHw4UOS2fag5wpbvFC01rnG+XNICOdP/CzAmH9JNgyEufg==
X-Gm-Gg: ASbGnctpXqa2aXExBl3iEDjEYII564mIDpDR4FWn124Exq+5lNdEVAhGjkczI73yMtu
	KaZUq52cKQRh5a9Gtu4OeWyvwxVZmIw/5M0RGEnOY6gbaAtSFzPu6fUf9JjPoUW1w+yO9o2cMKc
	2aDpleeyZSe+deG3va28s3EES4zn59x0LGEiALDgd9UuB/LMwwnj+HjgoKnC8UA0ekp3hfTumJW
	6yx6clQzwUTFo967E8buh0pL8JFZeedN6oynoLgtwh7XKYrAzCsUSklPDsxT/rukI9+6woWAoB4
	6SRrlQNd+H4IYvbzwSduCshZQYm5PDov6gnqpcNZ+7VqbONBfk7b3SWallXNj4mg0ueVmn/wo8f
	UMxoksgLzb9+bLUZCxZyVPDdo9hvTgzEg9EwPtg3MWUT9crKw4XEfouQC
X-Received: by 2002:a05:620a:4542:b0:8a5:2246:bc29 with SMTP id af79cd13be357-8b220ad7018mr654836685a.8.1762441111183;
        Thu, 06 Nov 2025 06:58:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIAGacM18ZhwI0THFt+BtjFFO0RmYpDm0B1ry9GZvpBjnFxTd3iqjoXH2/KEvfgGC8+bdwYg==
X-Received: by 2002:a05:620a:4542:b0:8a5:2246:bc29 with SMTP id af79cd13be357-8b220ad7018mr654834285a.8.1762441110580;
        Thu, 06 Nov 2025 06:58:30 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-641245fb967sm1379654a12.20.2025.11.06.06.58.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:58:30 -0800 (PST)
Message-ID: <9b024347-21ec-426c-b783-1a9351fc248c@oss.qualcomm.com>
Date: Thu, 6 Nov 2025 15:58:27 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: va-macro: fix resource leak in probe
 error path
To: Haotian Zhang <vulab@iscas.ac.cn>, Srinivas Kandagatla
 <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251106075055.555-1-vulab@iscas.ac.cn>
 <20251106143114.729-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251106143114.729-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: W3dlsfdtyVnItRYOyLkM6AOtXK7mRINl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA2MDExOCBTYWx0ZWRfXyV0Sor4fXmN2
 zErtgRRpoRz3CfoWyXmQg5djapIqHMDPa7q3/plf14Rsd1jP3H3ZAk1Q9suFrQ1ZeJf4fRYZhbK
 71w7u3YIS5cjqVkMDfjYRWQxvke0vVnSJR4jSWNr6wQX98nd0l4jmJmVZBYTN0PI+zM2eCP67uu
 ETbsDcMqbTR/9fnfM3KPk8r2+pcNyrpQzfIxAEdqxq5kbbOXzg4aOjFlFY5CUbHegOklYGX1W7c
 wYv1jSwjU64L1hoFbhl9KfDuhjZZwn9Tzl1Sjc0doiz6ZL7g86OoOaQHjl64h813Q9WfOpIW9qG
 r129ObqYo6PDc2HForRvRmXFu3z/g5+QywccPVb1g5t6CVEcpxXZSA/8nxPE4kgFimAK2hZyuRB
 lLprdlNXGA3MN/0cX6bzdYGaOBXN0w==
X-Authority-Analysis: v=2.4 cv=XNI9iAhE c=1 sm=1 tr=0 ts=690cb798 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_CcdfDJzPmikts8YXegA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: W3dlsfdtyVnItRYOyLkM6AOtXK7mRINl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511060118

On 11/6/25 3:31 PM, Haotian Zhang wrote:
> In the commit referenced by the Fixes tag, clk_hw_get_clk()
> was added in va_macro_probe() to get the fsgen clock,
> but forgot to add the corresponding clk_put() in va_macro_remove().
> This leads to a clock reference leak when the driver is unloaded.
> 
> Switch to devm_clk_hw_get_clk() to automatically manage the
> clock resource.
> 
> Fixes: 30097967e056 ("ASoC: codecs: va-macro: use fsgen as clock")
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

I feel like that's a little much given you found the original issue
and I only suggested a different way to tackle it, but regardless:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
