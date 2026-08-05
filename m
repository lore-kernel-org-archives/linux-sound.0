Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281533B47C4
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 04:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785904853; cv=none; b=dPgh5O0hfTbR4V20K8UoPIMZtBuFP1uJ+GgBjkC9Mnbsl6FxvOTisngQVcYgu+KXO+TGuZkeJrzb20RBxbBFoYQtU687843fKf57Jjrps3sOaT66NkHmPcnwW4cnmmlAPb4dI2/x3QCbv2JkGW74JyioetVVLVUTxpIyJxwIkLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785904853; c=relaxed/simple;
	bh=wER8YsqarG4t6cQsloycf4Pe11T8bsSMBoAy9hE4X0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yg5AlvlCcXF9EE+F9KCn9+CP3NbZ+ykoMFPjlMUwSta4URzRaOnyT9AI+SQP+5J5GyrsyYmr8p8Q/Ec/AiUEWq2t9cjxG6FwU2yfuZIZJB3MNSDl9U/LWmcf9YLPCuifDTXrKmvFyrdsptuussiqG4ynrg74/hi3I+Z4HEGfKM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCQIehpR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g68xxw9T; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCQIehpR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g68xxw9T"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6752aioI1255713
	for <linux-sound@vger.kernel.org>; Wed, 5 Aug 2026 04:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K9qa4ya2ytKUYxrJOZ+HvpuKdqth52UmBz7Oxmrfc2s=; b=ZCQIehpRVGWRbFqR
	SmyXf/YAu7tHhgfejJQtoUrdkbD1mLp96uPIcF6wklAe+8YAPOXqCMLtATD65joN
	RhWb6x2ST5knVnlqwY9GOqHSg4qoj64e893s42SBozQ4fBdlRZJzArUvjamBLyes
	JW+19qteXY87FIa3ArvSkC954qL3nAfh0eJbPvUUjyxk21+ZH+4AE6rHAPZc9T9m
	ef3T4q8NLET4WYXcqiKv6zD3XngXuIsDMZ5uGRUdjL54+KZylQOi4teYoRzpxlOZ
	AzGS5dwf2rgSu1Hp1GbQKIydP6jru3aPry12UYexI696zv5LRibi1uO0wyePjyMG
	l/osUQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fuk9u2w9q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 05 Aug 2026 04:40:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc88e22f92so13554085ad.1
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 21:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785904851; x=1786509651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K9qa4ya2ytKUYxrJOZ+HvpuKdqth52UmBz7Oxmrfc2s=;
        b=g68xxw9TaHBgcVHZ9BCAlAVYN04kMyggo7/TGnewy7lf3hTdolT/l1kjjegOfI5HB1
         5hDys+TIK/Bx2UcZk5iY/xaTFULfM7/Byh2kPwC6YozEKHzMqKXLCeNetIaNGioCMyig
         /Ub1eBw/I2+5VWgJRaD8n6NvQJGdhHCqxjPemGqXVCMMDYG++xLLVYvDiurgB80qdVTS
         UpWpd8SU4JcP4TOcPBpd5OArXSoupVPTQBQU7j+0BoCx53yRbtn8s4nU6frZ7iCaqnex
         XE/ll5n8WdjZI9kBYmm06phENV1G2CzoODKABTGjrrUFBOSzc6reAwqTNjRCHEFDHlIh
         s/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785904851; x=1786509651;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9qa4ya2ytKUYxrJOZ+HvpuKdqth52UmBz7Oxmrfc2s=;
        b=aoS3Rrlw728PG9i03oZRT9BQLFs/LXLgRBeHURvIp8tFm6bzcCKA3R7ggjYMLPa3pD
         dH4n2/z4/jIkPwBZmdeVK9RtwWiSg3sdp+PxvqvtHhiTAgrJ1N7ojOAzwyufgHfBi0Za
         XcjXzvQCIZS99ocEwoiJnIXaJFoiaLyeebvzx7LU1ICGVue0D7n2h1NHS4Uf+5b4wC/O
         lP4Ly1qZ0R997olOtHaIOU9wwUdsZ7VjRo7I0eXXRGOY35ENYTTM7v6lLyl2/QSIB/01
         5ayCCYlaLcSyjafa0vgEQtiFjlosbw54OHiLybXlZK71mZUT1TsT8d7zgqnLRiurqQcT
         /hcQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbG2gCfnt5Og/dlRp6VsHcwhey3tDc7sOBzPOXhtvTZ1n0pAOllxBMFaBect3qJq712/OaUYJeZMeA/g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwtUN6GPXjxxpGez0X0CLa4vZJoJAo33h4hgeX3OZyHPkUTABUP
	e1cv+2peTDYpvZM+BBRelu31eAy9Ywl0XI3NoKhmaWFxsXW4Cm90uoE/othDazv1U38OPwsWdAe
	ejzWkBDEeh3/t/MziyPMQO2BLALXXNqpDCDtjkAG1N08BRDuA6cMBnQt6AyP+vLn45A==
X-Gm-Gg: AR+sD10wk6yOIeRijdLZoMZRxo9j8/j4ErPsVUJinmLI6exLAAwPCmLbIAHphSNQ/vg
	Lko/gZ9mtSgqQT8SV3BZy4XIsr+MNcAnKUEdDNw2TjNwRF6a0EaVCXI0TGYQawY/kiCOJpf5G9i
	gg3mOO4tBrr48iwfYlXfeDvrKWhZyFQXXO5BdRSDss7cW0HakDJMeKdW5JmHpSo+HhWZt6tg/hR
	TukIkfvdlY95B3xRvKVgzqmH/DzHSaCl7t/W2VPFUe/sFcbDLUkNE0wDhATBBuh2U7yXbW9tOoR
	rZB2/X5fQtV6vBDykQAikJuavRgAedveVfJST4IM61kh07Lm/PwbWRG7dhduvd86wvtxHqgSDns
	j9ml4SEY/c1tmqTFjXHDhsDSLRpAI/fpuICY=
X-Received: by 2002:a17:903:240e:b0:2ca:f8ef:33e4 with SMTP id d9443c01a7336-2d0ca9444femr43882405ad.17.1785904850795;
        Tue, 04 Aug 2026 21:40:50 -0700 (PDT)
X-Received: by 2002:a17:903:240e:b0:2ca:f8ef:33e4 with SMTP id d9443c01a7336-2d0ca9444femr43882035ad.17.1785904850409;
        Tue, 04 Aug 2026 21:40:50 -0700 (PDT)
Received: from [192.168.0.100] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867a96e4sm10496339eec.26.2026.08.04.21.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 21:40:49 -0700 (PDT)
Message-ID: <8e362b9f-c19e-477b-b01a-74597858edfd@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 10:10:43 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add
 Audio IF clocks
To: Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260804070307.117119-1-prasad.kumpatla@oss.qualcomm.com>
 <20260804070307.117119-4-prasad.kumpatla@oss.qualcomm.com>
 <20260804201645.GA1781336-robh@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260804201645.GA1781336-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NInlPU6g c=1 sm=1 tr=0 ts=6a72bed3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=y1gZZZBYtMqdAonGNrYA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: TqsR63Lz8S_O9DI-2ytzuwFRPzQihnFN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDAzMiBTYWx0ZWRfXzcWBj7a5aVVl
 tyv8e1Fx0LuLautO8CooMEaPU1PNqLYzvuDRSfyTbaMnTfqs+cAqd8pcDdKW37c/kYQvDs5XIDi
 nMN21YRBqPDQmtJsxe5VuD6/WRKdQpk=
X-Proofpoint-ORIG-GUID: TqsR63Lz8S_O9DI-2ytzuwFRPzQihnFN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDAzMiBTYWx0ZWRfX8b+2xgc3jL8I
 uaLjzlJUAunS1Ww+KzdKnnQtz8SyHHJnDnh9OmrPPdyaZolgLBp2dWIcZ0YVzUp7KwsmifH16C4
 okeSLhVG2iGEWssSZqIXjIHGVCH5tzZQpmbpnNfWBc7GlTvkEhWeb/OmqOwM6gGlM6coRkPekL3
 w4c2GMa2J1vXpZ55Zb5OyeneDHLSRsVRTj2/dvh+FuaAWfmxabWpCYSz2i0EJCAkhmdJMDzoCsL
 +mXzFvoXkOE6X+z3gvYrrP1H2UF/STWG0fBrEQU71QexN7dc+Pnd0KKUKK06jjqocpkD9O0/wD9
 4J+2MSRZ9XQL0ofBpp8pzq06/KY1KtisiDXUAoJXzyF6dnV+8iAsA8f5LViLH/3HGSxuNCBVkJf
 P0paWIYTL1ebaTKA20nND7+ID5cOTHN6eG3Iwrm2sezshW4r4G+timE54YXuDLLy9q1c0N9fyl0
 SBrFfrTaWdLOYcOtl9g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_01,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050032


On 8/5/2026 1:46 AM, Rob Herring wrote:
>>   #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
>>   
>> +#define LAPSS_CLK_ID_QAIF_IF0_IBIT		71
> LPASS_ as saskiho points out.

Hi Rob,

Thanks for catching this. The change has already picked, so I'll send a 
follow-up patch to correct the typo.

Thanks,
Prasad

