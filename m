Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4041435E926
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789488132; cv=none; b=pvujrOSCG72BxYoz2Mx2eF8q4t2/Oj0VkkEUI3RjoJN8z74AP0ggiVxK+QUR3LCIpXZ0klCgFCgBAWcXFgRzhGFRCw7PKfY+X5HAUCJPh5EL4/BTcsA5Joq92S33qkFYxLTAnLDp+Jpr/dw6PqYgVzW9OSROZ3gk7HBFVM/714I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789488132; c=relaxed/simple;
	bh=NKJuB0TIpLrtUCM0wUQ3aJBmWdnBf3WJenqkw3nEnrU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GAxNn1yVfvQvv486kcnmztTuR3o+5xmjzVlmDtAkWNVIiNIIl0V9l0bNdGh3eWEq49xPXaPK2Ux6HhWiqEWvgf7WHz+45IRdN97ANV9MMxLR6OdcSofii2rRjRAqF/FV5VycAPWNfIMH59LPDfUk0ZMaOhMMLjKJApgmk8PcHpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eycpzX0V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GLZDE79e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eycpzX0V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GLZDE79e"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FFAfRq3567052
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	siGkS8tDMM+UyATikY5KKD95rNCtSbqtQYlyLRx/Exw=; b=eycpzX0VnxykGJNS
	EGyXe31E4ta5U+T4OafNRm4SfX1w/Yy3tHqqklKVLnR0f8SEdqgeBxstJGqnAtqQ
	yu9wKqyYDEDwHcTDeDZiIw5iomem/kVVz7MFsfXzjadCiAXVMMOh8JDPSwSCuryE
	dTS847DBS0+ewmjo1q7xah/LjqiRpu88PjLWJP6ga/BKj8qSGHtu1SlbSdRYMLcm
	eBp0M2Ko0an+f+/+iAMZ9Jr2CpzClirqCsy5qfDgKUBPX1bhEkIiC+Brh5jDrQ3v
	XRoouy2cIZD3f5gGim5wqpDmmS/F593l1GMR1RPK5XAA5aS9pvoJ8Yal/PWS1XWk
	ycCb2A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxydaupu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 16:02:08 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2db3d832827so56834115ad.2
        for <linux-sound@vger.kernel.org>; Tue, 15 Sep 2026 09:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789488128; x=1790092928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=siGkS8tDMM+UyATikY5KKD95rNCtSbqtQYlyLRx/Exw=;
        b=GLZDE79eqAsBTa4Zb5SwepVYwKnF8OiN+EgBISHQXJSG20xYo4EEw+ngUFSVF01zCP
         1g3v1N0HPNr/jxo63y5m+vx4b04MUPo7NwhJZFmg9XyOO+psn9WFRjhtCokV9KC/sPcB
         Dj+On+R58SGzBcGLHq8LH4eMBr9U8G/1/ueB+Jeze6rCcnYAx39P8wKyUcA8NrIbNsOn
         GhVU4HX+/jbhB5XyQiOe8cy+/YfeMtDE3PZjG0TX6vBnwS/7Y5zk+CJoHOZjiqTYH3VY
         3zjUjDmyXn5PnF2GfwOEH3tvORLRLOd3oxfywDCZZ/B0eMZ5s3ZtRjXZCOnGeUqKzNaJ
         sO+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789488128; x=1790092928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=siGkS8tDMM+UyATikY5KKD95rNCtSbqtQYlyLRx/Exw=;
        b=VlD7rPm+8F+2ZPnCBJcLKjqMEWN6zzjiG32Lrvh8WdAo12Rx7msuyIQ87lTD4tcj+C
         tC/yzRuy/o3rXNqaoPmckDWBTIZ+5mdsZzcdX1nG0+lKlACNBNhm0G9BoCjp/YZuXNGw
         leeXL5WC0GwuC8jqKnqJMziQdp1h4Uc/NQfRZySztyv3vMitCfOaPYvT1tcB+6YfZBKk
         z0MW96RoEd9j1K1DHjmfMfr0TDa0onIf65XH5jGoLemOUD1Y/WrYHSyP2tXKsZ1rES9u
         sBvFB5/mjx+XO+HkoWVXuWLOt3Eh09mpyEquI/QEi7D44x5pso8V492ig2nHhO8I8NLM
         calQ==
X-Forwarded-Encrypted: i=1; AKwUvBzAZ1MGUixhhJC6KgaNw+bN2jTFQjoxIVS9+NMlEGuyM72LTTavohSwoKZsaiuqtLT7/312t9tIyrjCkA==@vger.kernel.org
X-Gm-Message-State: AFuF++mfiB9Yv2XdlVOO9LofFaWz0NJTvHIU981LoWfC6V4qc88UFZOZ
	FGGYPtZxJj/cJV+NlR3cWPVDanc5jrdPVYltGywG2mKkXax0SxH4PMQ6fZI7PAguB9zi9api3/p
	/pAmAlsR28EkXnGg9BjB1mSohBSs135Hr7NJL9fd9zAb/QqmP7kPQHYMPFaXOhbkt/w==
X-Gm-Gg: AYBFou0vevS8cOVgkKpRqrt4wua691/ofay4q2OIC3FESqBPeBz5UX1hdVZRqo52a9H
	CCLcaQZFCSSP/GotIbSjnhhKPgqTWTocG7KmcdiI+lTc7awlWwE8U5gTEk4MA1CTy4rbeQenxrv
	1GXNQjL4/3aX9LYBpysiAW6KqbN8FnYviM7hmTqSYda4D2l/mxSBfxbEkScfMdKfRC8Nkd8GqRl
	rg5wHowfzDZVdFGQjbV0jzkKoHjvHGQ3UBNPfPpCWrhXmi3wFRm7gSXJFsI9AmZUx2MfzLYdVCz
	zv0MMmRsMm7rPYiK9AQiS74WqXu+BHXYJZ4NaWAnj8IMKE54LLWbbgJ/BRbccF6uRvyxopH306d
	Zozn3nHCA5cfj8aOKhXJqr9sAtMw+j87KFpqEFTyM
X-Received: by 2002:a17:902:d488:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd6c6c0d27mr138819745ad.13.1789488127767;
        Tue, 15 Sep 2026 09:02:07 -0700 (PDT)
X-Received: by 2002:a17:902:d488:b0:2d7:f0:896b with SMTP id d9443c01a7336-2dd6c6c0d27mr138819005ad.13.1789488127162;
        Tue, 15 Sep 2026 09:02:07 -0700 (PDT)
Received: from [192.168.1.5] ([122.169.220.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ccadb4fsm69974165ad.2.2026.09.15.09.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 09:02:06 -0700 (PDT)
Message-ID: <f67b20ec-4c5d-4fb6-aa91-f3ab616e80b4@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 21:31:59 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] ASoC: dt-bindings: qcom,sm8250: Add Nord Ride
 sound card
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-4-997d3b20cf43@oss.qualcomm.com>
 <aqFzPyDT_va9VP-i@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <aqFzPyDT_va9VP-i@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIzMyBTYWx0ZWRfXzxKkjgCdIpya
 7cKiEK99bS8H3+ew6V/P0einqc/epnISs0YlHTPVVo4gQyD0Fhtf2y+R8mevkgKmoFUbQnAC+xH
 eOyigp4v6Q7WO0DIh/uOdot7n5KmNko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIzMyBTYWx0ZWRfX9JikJlxy2yUr
 BdCy2G5OhNmAf1IkTNMeAXOQ41ERKd0TjoHKnX+6/CNzOYXTMr9HZzSW5Owh80jFKJn7pD+19S4
 OssAMGQDObyFQlC3gLTWWiboj9CE7EC7ry3Ta2LH6Bn8sJy4fhEOt6Z4qh+2n99LqgrXk9sw9/8
 ejZqpXwhxNCJgH9COD/K0BG6OWYHIa2dN2E5Klox4rxkayx0cmZr/gCwKUGTEncV18C6WBOI3M4
 SWT170vFVnwI/+0r6rtzVpks2u6FRKMbwG6BTu8ziS9ZE/umHx0jwdQFx9yAy/V40K8r06bh7Q8
 0govSDoRzhRDOwfSPXSk3yCRWecZcV/sPX+Zx67ZW33s68W+xsKakKpfHdsCUgyfLPbROXhPPRV
 f7Q2P7F3vPxTE1KXV7COKtDgLobZiw==
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa96c00 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ww153nmMuBeTcjqybhOiGw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=xBKF7SBF3-SEUEZML9sA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: PT_cuMhdurSWEBnYUZrDyF7zYG1L7OoC
X-Proofpoint-ORIG-GUID: PT_cuMhdurSWEBnYUZrDyF7zYG1L7OoC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 phishscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150233



On 9/9/2026 8:24 PM, Shawn Guo wrote:
> On Mon, Sep 07, 2026 at 11:39:45PM +0530, Mohammad Rafi Shaik wrote:
>> Document the bindings for the Qualcomm Nord Ride board
>> specific sound card.
>>
>> The bindings are the same as for other newer Qualcomm ADSP
>> sound cards, thus keep them in existing qcom,sm8250.yaml file.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   Documentation/devicetree/bindings/sound/qcom,sm8250.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> index 1536fcd96d68..bdbaa8c822fc 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
>> @@ -38,6 +38,7 @@ properties:
>>             - fairphone,fp5-sndcard
>>             - qcom,apq8096-sndcard
>>             - qcom,glymur-sndcard
>> +          - qcom,nord-ride-sndcard
> 
> I wonder whether we can make it SoC specific like qcom,nord-sndcard,
> so that it servers both Ride and RRD reference boards.
> 

Ack,

Sure will move to qcom,nord-sndcard.

Best Regards,
Rafi

> Shawn
> 
>>             - qcom,qcm6490-idp-sndcard
>>             - qcom,qcs615-sndcard
>>             - qcom,qcs6490-rb3gen2-sndcard
>>
>> -- 
>> 2.34.1
>>
>>

