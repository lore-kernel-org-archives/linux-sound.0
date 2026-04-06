Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A49C3264DE
	for <linux-sound@vger.kernel.org>; Mon,  6 Apr 2026 09:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775469182; cv=none; b=C54H15zmK5a+9b8T5zab0eu903T5IIUseZzF3DVsZ5MW72B3Ova/NnXE+XWTrtSJCXZu44feLuFFp53Wjpb9MY+aA4wY0skLwi5ml4oF3bos4QBPomh10wkG+u0Lr0ytk+NWrkgnRiSWT64e6DglvWCeM1hM+x9geISW08Mv8+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775469182; c=relaxed/simple;
	bh=R2yE0u8Dx1bDk7pUJGKTfj3Y3/lOtbiFXoXXN0anJmk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iK4JvFz1fBlDQ966wdSjqO14HOUZnuMWIhj5QjNxssGaphg6oOAv08sywfZLBQVYT9OhgJRSxH6eQzuiE/zTNVfefUrJuEU+0bgKWEHv+to1n2TMN5DnUiDqyVRPHNZljb+v4wLI6704NOlwKwGhweTX2HuQTf9qpvgcjLF+5mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHmHAxlB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfZRhxoC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHmHAxlB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfZRhxoC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6367Ct0U3543138
	for <linux-sound@vger.kernel.org>; Mon, 6 Apr 2026 09:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2yE0u8Dx1bDk7pUJGKTfj3Y3/lOtbiFXoXXN0anJmk=; b=cHmHAxlBtVEjpSe+
	sKbNkMUhUAx+Of9ES0K0BvckXhh4JfjMhrAhgCuveyNrUMGkNhWT3RptHLYM9Hic
	ANPfRPe0GUuOTAcC2fyyzgwKgWxlW2CGT92LBtguCzXTLgCzMWYyGPaaGmxhyK03
	0QMqI5hkDmA//yIdXoRjrGOWQNPQLFwblRIZz7IigzCKDRSQ1jvyqZc1Z+CUnbQF
	m1NhXcB222hHpQshpFWLzncWL1Lr3g1LPoQbLINt4p8jMLNHWFy20R1nTlUUrttU
	7a7HAefbREQfRke+Tb8phPI2w5ezLuyEbFF+qDMcT/1tJF5P/vHXbLsAY3nZQJfV
	1RLpug==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv1cnq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 06 Apr 2026 09:53:00 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35da8eb0553so3868538a91.1
        for <linux-sound@vger.kernel.org>; Mon, 06 Apr 2026 02:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775469180; x=1776073980; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R2yE0u8Dx1bDk7pUJGKTfj3Y3/lOtbiFXoXXN0anJmk=;
        b=AfZRhxoC2Qcq3DEch3Filx0V5BhmUOgk0k9a8ziG/jlqXS193y1USpPAS/+Et7mCqT
         3lByF59kmBS3hB4+awNA2mqgqQFB5FdRhZ695r7dp32FWKcjKRiLiafnj3WuxD77EAMS
         1FdfOVAa7ehTduU1b53m5++POIbKN/86sp74Pemaiud9xQFI3GZT9SLSZ3rTxB5/cbSB
         E03Zvebl03HkFQsA98RKDqo7yIDbOxq4asj712X5Qo/t182fi5/N9XP84fLELXpNheJL
         f/yveDgJlJgVZ58NLKVI23YrnZi0ZwkKwTtIS31QwQEnOlJ37+nIN226+4eBTnyNJLKz
         RArg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775469180; x=1776073980;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2yE0u8Dx1bDk7pUJGKTfj3Y3/lOtbiFXoXXN0anJmk=;
        b=W5aSUCOKP5VgfZFkFkyxYqZMhAUmiRGhDB3A3FWX8IRLGPt77ajQG/DYO8gajUXqzi
         Jv+L8hil5LsY9ZV3LUy+NqWlRr3xOW5y9A7D+bb/hv5HLMrbWIJV65DNfrW+d1jlu0LZ
         Dd0Jk3+bIOuVwXPzhKedQ90xu1vzby5RdttwjmEYw6Zo2Tml0Y9mYbqKKOyr0G/HfW7p
         qQ/RWOcQC+nkseYRoPu7x7/5Lk0p6/ASuIW3/G+15fnRXWZjjfOQiOSXP+janAvnPnFi
         N38o8Q5UFoXJ+EglNEWvln1+MR6uiJILyhBF7ygy8GXUEMWKZQToNj5s6wVPzfRp5Gwu
         YFsA==
X-Gm-Message-State: AOJu0Yxn/qhi8ROaFc7fBV9gXSovETS5NSwEaPyQB4hQFssOlPz2C2DZ
	W0jDdqe4sVQ87MQ9XDEacXFclMFGbVSeumgtGe50scRUbXFguCsmuX8m6k0MSAimwfzToovjTHh
	8lqaotX0/RD1Gzyk2u8+MZuoomZsSuedz9lCtV5trbG/4YYUVhlm/JPVSwh36EmvuoQ==
X-Gm-Gg: AeBDietlcOX+3AZ+JHJ95hAk7QAK0DKd83f80w7m91NFaNhJbXO7vVnHmfkbBNeICGZ
	xloe9FgDVh1TOCrfeA0HLuNAMMN1o+FHsZpfx+Khk2xJWPWSVsGryf7Z/NwFCHSKcfDSLwgecFX
	PJw9TbWsDMK1dMw54/iN4FBXNROfFQup6gvuzjrVLtYhOeTjNOsaqb9s5vQ0W0sz40Q863q/7PJ
	2Acq3suLACiYkWWsFlOPNgm9DbZDbXyVEorpsj7QNCqigWMOl3e2xh32JwqCT0aDb2XDgkosmQT
	o43Chqx3O7c9goijNVRDguqhroZPL00Lk8Ouwe+UqjnRKBuEpfrCfX6MUqD4QgsQz5aUp5OKdDV
	X381cYnKIWLWqNO86lCx14/gOP39hTObrbGCGYdzL2qhIUA==
X-Received: by 2002:a17:90b:1a8a:b0:35b:9ab6:1d59 with SMTP id 98e67ed59e1d1-35de5c64a15mr9012198a91.13.1775469180256;
        Mon, 06 Apr 2026 02:53:00 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8a:b0:35b:9ab6:1d59 with SMTP id 98e67ed59e1d1-35de5c64a15mr9012105a91.13.1775469177538;
        Mon, 06 Apr 2026 02:52:57 -0700 (PDT)
Received: from [10.218.15.94] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe9709b8sm17465992a91.16.2026.04.06.02.52.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 02:52:57 -0700 (PDT)
Message-ID: <b54ef086-60a9-4d33-b63e-6fd6499c909f@oss.qualcomm.com>
Date: Mon, 6 Apr 2026 15:22:51 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: codecs: wcd937x: Add conditional regulator
 control for wcd937x
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260402072256.2811085-1-karthik.s@oss.qualcomm.com>
 <ee23daf4-8181-4ab0-bd21-b2ea636168f7@kernel.org>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <ee23daf4-8181-4ab0-bd21-b2ea636168f7@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: H6Hn4McJzfg7hFiXGtFheY3UIvDRTEgA
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d3827c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=cIAgj8qr3_NMcBLshucA:9 a=QEXdDO2ut3YA:10 a=QYH75iMubAgA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: H6Hn4McJzfg7hFiXGtFheY3UIvDRTEgA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA5NiBTYWx0ZWRfXya474X2XrVWB
 v3miewYLc8droUg5GrU//UyD1ifT3kRYQ/MWSsGzgs3Q7Auz+CfHrJ8Wk4UkfrHgDW38JTxRs5r
 7EknL5X657w17CPe9co7Zp890hMiG4Ymn1QxR541tSCyDOg8bLaR2ZvOQxxfWZNjfk78CSoPC4l
 6hwAdq46ShHelRsSVo2FBvViarM0aO1wsQ/63UKLiUvxC5vsZrKjHmNIEmT4vrPn5Bf6CQ5WLaK
 wFZ5uMXg3gytrn2BDrxwUVBSJMAKvS7b+A4yjSZBIEO1C/1eYS2CXrEo/MOapsg8ZaI6te83XdQ
 Qr8cDIjkn8keKCaGytdAW6R7ruJeTzTUki/vfYAk27jzreqDv5FoWVVj2kO98NlAqfK6K250bzg
 WmiQIKq5U+mioxHJVWPtNevgUDsfa/EjQ8JkcWeS/OzjQ/RpcyN7k8rCW2jGb+3Ufp6z5Sm986d
 kk5Nt3YUZUlgMrYf2gA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060096

Hi Krzysztof,

Sorry, I won't repeat this again. will take care in future.

Thanks and Regards,
Karthik S

On 4/2/2026 1:00 PM, Krzysztof Kozlowski wrote:
> I gave you review within 5 minutes and you send exactly the same after.
> Without any changelog or explanations or response.

