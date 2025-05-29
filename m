Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25C322F749
	for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 17:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748538775; cv=none; b=YHsnFh/N/D5IO8hhA/oKuRga+bocs889BED84K3EWizxvxKV2BUnMoVj+hg+ANdsPkCWCspCslLbS/1wFdT03nE5EIvP+o8iUEsXP3QrDh07kVql6t2J1f9ZMh2z7HVSXS3KcWGXdsY9m5wgJUGzTTz3v4MTNGvTmkBPlBn5bu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748538775; c=relaxed/simple;
	bh=Ug2jIoRzLCA5oUM8D+OSRBMvv7WFUOA/cp+F1k5Cq4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AwekEd0gs7SMlIxEmyzGqCbJUHbA+pF3QRZOjEGvBOW/iaIth+KLB2IfbaLL5GwmQHhd1vVDZwLmwWHNr66kdLQfr9bceFTCj4/I87M/HnGt8NqaP2I+iYvFrPbgbr2s53IcZn1xkehV5u4YC3JtiizaQqVANP05FY8KkX0WCzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lQDMahUK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lQDMahUK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54TC1cF3005033
	for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 17:12:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ys2JmP4bbvIcdLdQv1yBN6mYrOG0ArjDO9LWrdrX7ns=; b=lQDMahUKRG5MwAU8
	TalKAq/XrTZrRm4pLM8EGdHxgqUDTVUsMXkJsuUtPHKbvF3/bhnmOb719H9KJbxJ
	2L8ihzNBBM4NEKk/4bNw1b4Z5bD4w3zc8oEaEuaOiLYumQt4/1Ac1iKqjqevXv/k
	Yimik3EVKrO9BQ7edxg1+sT1WuSWGZGRGHiCmqHF9GqAdy0GnG5rMqLFosFvpx3R
	eJBNpLpqL/00atL2+VMk9YcnvTXTIY9tH3PjSZb8n69aXAHrEpf/lpFyh6hVf4Va
	pEhk+e7SP7iUx7Fk4luYLWEPfD1qAAci5HFyjUH4aDcm06W+RmDZhHHVRMpT1ImD
	tyBmsw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5ek69fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 17:12:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so24943985a.0
        for <linux-sound@vger.kernel.org>; Thu, 29 May 2025 10:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748538765; x=1749143565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ys2JmP4bbvIcdLdQv1yBN6mYrOG0ArjDO9LWrdrX7ns=;
        b=P3UcvCMwKkHxjI7EA0TrHOQ6Z/n0KovXTEPoL7X9VZ6ehfm1wUpFB6S+frDu9SOKEZ
         G2zGvD8cagbmVtskJud0GLK6uhzpjVF0O0D+5sRQ9+e2Y6xPsx43DyLonLE+HbeIfN5B
         vzAyyxRYW4iMwBo6jUF7BEYnV6/KknJmqGI/E1CXl6mIqrpDrY4yNnEjMmdbKXuNjm9J
         EWNav6SYlSdRdgcC4CwA9UvvcBkAGKYUP6IuWgHmDyG5KzPMQa919ayK1db27W9eqJec
         C/UoyxnyyRq2aX8ejJjNgw/zitR8ot/m4SrRPXVL/18J5C22NxnwmWSBisgjJLqpvp3s
         KzGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgKg0DPrQs50GDF9OqKEZBq4ePEtc4UEKiOWrNCfl/zrwH2Dpp8Jh6HFPsuzuTi6q4YMfu382LuHvuBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwP52kql7ff2OG1mgI2G5TQhto75VK5k5K362IjrlU4wIGFNRyk
	KsiMTvZBZwRuaWeMjm/ig+yzp25X4f3+w2efKPn2Ry5fEmh6KTDFwi4SqNMq5Ki/M9ijm3eYq9i
	/Xm31usHbqXHQbVXmtJBxKruhxOdZuVZN+Od0fotz8N0yL3NZyY6MQlRoU0kxe4qTIA==
X-Gm-Gg: ASbGnct0NjXD0Oin7hAJ1v8vUyjTZdg79pE/wo258LqfTiOiJ+r//Jq5Yxfkv1QdPz9
	l+E7jyAqsBmE7CW13ckVrfArByeokA6fYQu9eEghoh9ypwpbMxA6CkOKYpdhBzYSqAFMFAiexjz
	CcLU9UaK1z48SsZVDXAHJSVFmDBdJKe+jwYGE7Yo3rJC7pT1/Zpbj76yVXT12xq8544aQEVZqkd
	nYChruj9rm8VnjpuTvQrB30rI3GD+zDTtYqAVWtbPXk1hlT3VRd6tCd/zjsJCwvoToXyI66onS1
	fKkwbI29fWJSpzb9vYfwyNoVw9mQooX08wMiORZTAeP7eAKStGaCyHfXfndSErQt0w==
X-Received: by 2002:a05:620a:2908:b0:7ce:e72d:8d34 with SMTP id af79cd13be357-7d0a1fa6ee7mr16074785a.3.1748538765301;
        Thu, 29 May 2025 10:12:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnHYWW2OFnp9a7ve3itNdjg5U8YXwmFgEwtPb5z3CzLgcPkiN+vLMT8pOGqxmuto+sCPYqkQ==
X-Received: by 2002:a05:620a:2908:b0:7ce:e72d:8d34 with SMTP id af79cd13be357-7d0a1fa6ee7mr16071485a.3.1748538764700;
        Thu, 29 May 2025 10:12:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5e2bf051sm172255866b.122.2025.05.29.10.12.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 10:12:44 -0700 (PDT)
Message-ID: <d02dc31f-1031-4950-b8e4-5df38b8806f4@oss.qualcomm.com>
Date: Thu, 29 May 2025 19:12:41 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/12] dt-bindings: arm: qcom-soc: ignore "wsa" from
 being selected as SoC component
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-2-9eeb08cab9dc@linaro.org>
 <20250523-fancy-upbeat-stoat-e9ecbd@kuoka>
 <DA7VC87A0OMF.1X5XEWVCHFLE5@linaro.org>
 <7938374e-85fb-42b9-893c-ec3f7274f9c0@oss.qualcomm.com>
 <9c8fe115-97e8-4966-b332-6de94015f832@kernel.org>
 <b4235317-97c0-4225-b6af-f79358cbf508@oss.qualcomm.com>
 <a0b381ac-3280-42df-bff1-1998e0b9c154@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a0b381ac-3280-42df-bff1-1998e0b9c154@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIgIEvNK c=1 sm=1 tr=0 ts=6838958e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=nd4FsyV9s3kkAaokxrwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: K6BgAj1x9jcpcvgMqUi1lYSg1CoqZRLK
X-Proofpoint-GUID: K6BgAj1x9jcpcvgMqUi1lYSg1CoqZRLK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDE2NyBTYWx0ZWRfXxriZOCR1f3ai
 Nv8MYZvpBDZPlema52gcJX8EtioN01Gdhj0WN8odUc1iAexYiku9jANNKMQzoH/2JXohUMcjS0x
 W87nv66VpsK5s4+S6tSkfaGgO5Gnd+LhEcqmsPETyx90B2ZUflXDFJzMAm7SEvdOAt4pW1ZwZvH
 AOtfC9rcMQ82FJWu4uhxwdMBQ+Sdo+mCwRiIGxZEBxHdI+3p1xWofMYc8Mvwr59xnI5sZnhBT0N
 mPqtDcdAQWNv1CNLj5IyVlQTgBcSdgq1wzPx4BgRUMI5vVXkTRArSY2Bu8UXcNEGgrF6Cv4xMjL
 q4h2coAgvO3twIqbCh6U+Fy667g7wkM93kqSiO+HnoMs7c6nHhaX7CYCC3F8HPFuYKUlmBKHeah
 U7vg/krfFgUqe74MCs5pmtIFfbx5eOovFvxYalUmOWtRYnnIW2MyPcKtBB1Z/C3s6g9Bel6C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_08,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 phishscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290167

On 5/29/25 6:58 PM, Krzysztof Kozlowski wrote:
> On 29/05/2025 18:34, Konrad Dybcio wrote:
>> On 5/29/25 8:58 AM, Krzysztof Kozlowski wrote:
>>> On 28/05/2025 18:58, Konrad Dybcio wrote:
>>>> On 5/28/25 4:37 PM, Alexey Klimov wrote:
>>>>> On Fri May 23, 2025 at 9:12 AM BST, Krzysztof Kozlowski wrote:
>>>>>> On Thu, May 22, 2025 at 06:40:52PM GMT, Alexey Klimov wrote:
>>>>>>> The pattern matching incorrectly selects "wsa" because of "sa" substring
>>>>>>> and evaluates it as a SoC component or block.
>>>>>>>
>>>>>>> Wsa88xx are family of amplifiers and should not be evaluated here.
>>>>>>>
>>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>>> ---
>>>>>>>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 2 +-
>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>>>> index a77d68dcad4e52e4fee43729ac8dc1caf957262e..99521813a04ca416fe90454a811c4a13143efce3 100644
>>>>>>> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>>>> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>>>> @@ -23,7 +23,7 @@ description: |
>>>>>>>  select:
>>>>>>>    properties:
>>>>>>>      compatible:
>>>>>>> -      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
>>>>>>> +      pattern: "^qcom,(?!.*wsa)(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|smx1[ep])[0-9]+.*$"
>>>>>>
>>>>>> Why dropping front .*? Are you sure this matches what we want - so
>>>>>> incorrect compatibles? To me it breaks the entire point of this select,
>>>>>> so I am sure you did not test whether it still works. To remind: this is
>>>>>> to select incorrect compatibles.
>>>>>
>>>>> Thanks, great point. I tested it with regular dtbs checks with different
>>>>> dtb files but I didn't check if it selects incorrect compatibles.
>>>>
>>>> Maybe we can introduce a '-' before or after the socname, to also officially
>>>> disallow using other connecting characters
>>>
>>> It is already there.
>>
>> Pardon, but I don't see it, only in the 0-9 group
> 
> Then maybe we talk about different things? Because the one to fulfill
> your request - to officially disallow using other characters, which is
> part of the goal of this binding - is here:
> 
> "^qcom,(apq| <snip>  |sc|sd[amx]|sm|x1[ep])[0-9]+(pro)?-.*$
>                                             -----------^
> 
> That's the hyphen after soc name.

Aaaah ok it simply wasn't in the email context

Konrad
