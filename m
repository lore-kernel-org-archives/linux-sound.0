Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2351FF7B3
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 05:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773725277; cv=none; b=Xi4dqsgwM42nP6+y+6lHqbLiP82GKD9+iLEQJsn6RrQHW2G7BpTrf4NWNOLDhQKCBqWCxXoGUn+9dg6UbN1o4nv0HLqtelV/8RPWqjHi5ViTHmVXDmq98yUJYiYgxkYWdo73OombiY46pfj4xYAbyyfE8csV/Mf5d0Z9rYTReuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773725277; c=relaxed/simple;
	bh=oLN/kVlfSxwbOWn5YqOBUNzBd5KMlbrmgR65un0P0C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jt7pyOtc8SrGlmlpc1L0Y8jvmSc536eV8GfJtQ0N7Nwm0GwpcxHUYCXc0rOu7cp2OCSvNhjZyGRbDlj5eGKTvX6t43e/SUL4CmUJV5O1U18HA3WDPXRxhVCLv/a12hbNOqhqWywh4GznC/PdNBvK6iejticHOPVpuLUSgTn9I9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VBZGQ7MD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E1qOjw8h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBZGQ7MD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E1qOjw8h"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GJCLoC1622547
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 05:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NJ4Dm26PgUHHxAqegK0ORGtS5RM3siTPO7DahKF9/4I=; b=VBZGQ7MDa3G4SSvJ
	D+r5o0YIaq4XhjiRnAjjcJ0XxwslLcUTScNLs9ERd7sTWf/YiFKpjNB8xWp4g5ZB
	YGRHTL11bfhFHmE5I/99ziG9OuG3flinhHu2J8ocrv+rT8RHKm+yfX5tmC7D7/te
	i7QQDwY3gRTj1Q7XEyXCdiYnpkDpkCgwXWgwF5dOJ2Ie2KWq6TlOG3BVxs6WWCUe
	qQrzTbSToWG3OQ7KxUZUNP/O0jxFzFEhRO+LxdaIalsJXbrzEkiRtYv0KIrxQBOO
	r4mt1qigwC59LqsUSMvQ/3fNaU+GEUS83KHMTHaLkPjOCdxPCB2C60k4uY4UgrYw
	5aXUbA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxhyek2k0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 17 Mar 2026 05:27:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35a0998a441so34043911a91.2
        for <linux-sound@vger.kernel.org>; Mon, 16 Mar 2026 22:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773725274; x=1774330074; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJ4Dm26PgUHHxAqegK0ORGtS5RM3siTPO7DahKF9/4I=;
        b=E1qOjw8hux1T1iepEBJ8kArzNOPhzehqP9eIb7IS1drdbVV6M/wXnSZWgilML96mi2
         cPZk3HSnIKjvYDKVRWUq3XudA741iAEN2kP8blYMHyyhJ42YTHjr09/HOmCbUxC4IHX6
         brMN8LIozKTOqYdxAL+mL0VhOkbOAkgW9yPE2uwq2B8ffY3JumzWLK2/RfW6QNAGn4dx
         sfpjXdTXmm8wIEe4q15ExTQSju4EeCFd51kLXyqi46jNvATPZpg+nQONM14qsszD8hEu
         yvSiFos9iXFyXbL8BEF/aMYuLJ5v5xt+maj8MaKSjHAsP3qDlQb8DhIRPmiS31xkwmxf
         xcjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773725274; x=1774330074;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJ4Dm26PgUHHxAqegK0ORGtS5RM3siTPO7DahKF9/4I=;
        b=qo/xIKn7HYxErfC3HiMDdu84vTT4bDGN66um3/ktUztAgRZN2iyoUOjVUUPZEFlJpe
         oRKAjyDyNuPVubrb7r3SJ2I4WqRS025+JV5IBcQBY7VjAypxFb9m4XtJk2aO7A/AJIUe
         CL0CSBt0yIRfskxtmbzmAHAQRxBS16nNBtDU0y+La/lyPCBSdIpwdEv7ms2VICjc2vB7
         WMP93umt+32n26kRTGJ2r0ZFzNWAe7bMOZipPVud89gQvTvZvo8gok+fiu6ozjGUVBhY
         um8hrHcd/63+DWNc2mqAnPlETZCwUyQndg66FhfDW37gnNNMeedLhcNYINgSDxpqQ9+F
         kZBw==
X-Forwarded-Encrypted: i=1; AJvYcCUlNb9XhPWG64OgA+zuOgArPtJiRLQGH3PiiPzcD1TMClEWUs5JH5ZzJJxMsULOY+T72ksdf0KgcU6n9w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9cSF72v8aRYtyv2bkR0q/s7qGppWsasgbVCrL7WWTI+annC38
	6qcixIB7jovF6JPgqsZSYwQPbVRjazVUeusWlALy8vE2IriDjRrHmi4CE6zpdvfCCUHlcSAWEov
	xxZJs9UVxvdZKb/g271R5OfrMMJBmVtOciN1Tqp59rc/Jgp0WrCXNNVawdhUpL4PbSA==
X-Gm-Gg: ATEYQzzEMm4sdW20B9NMD9RlvvwtIbh5lymuJ+wC6LoICuihFargqKSWE9oZCo1bCwF
	HPrDwo+5tsw9rS0lG22O2zbNu++FiVzyKARPhfh3ojSMdj6TEmaCAxOn66LCYmuscUy8byLiazT
	WWpflE9c32XhEWL8STqPL/JAkbfB5lRDQIzugALnFxPsMFmz+2cIGVx1qNhzFNJqlFm/3wnsLEi
	T9TW1FCKCs7I+tCjhItLmBmvQ2otsGopahw49wI85B9HJVc80+lc/ECfLYlvb1mMRvNgCTK5nnb
	htgDO/W4dy4z6X0VDDCuBLySzw4rjb69OzexjiJNccZTlN5Jr6TBxnuCNQkCs1dUz6IyaY+hMCt
	ZcVqTqEtgJYwVNrX7ikWVNzWhcu5yjxwu9MWhYxat3Jln2fwaBDT6ZXiEGuO+
X-Received: by 2002:a17:90b:1d49:b0:356:24f0:af0c with SMTP id 98e67ed59e1d1-35a22003a84mr13527381a91.17.1773725274178;
        Mon, 16 Mar 2026 22:27:54 -0700 (PDT)
X-Received: by 2002:a17:90b:1d49:b0:356:24f0:af0c with SMTP id 98e67ed59e1d1-35a22003a84mr13527341a91.17.1773725273695;
        Mon, 16 Mar 2026 22:27:53 -0700 (PDT)
Received: from [10.83.99.36] ([106.192.46.228])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bada470d2sm1845295a91.7.2026.03.16.22.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 22:27:53 -0700 (PDT)
Message-ID: <a7e7f32e-e365-4504-8ce9-1aada01bc52c@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 10:57:44 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260309111300.2484262-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260309111300.2484262-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260310-crazy-screeching-angelfish-297bab@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260310-crazy-screeching-angelfish-297bab@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 0yEplCxfhUVFYuRJSXxgnJjGFy2mmPuW
X-Proofpoint-ORIG-GUID: 0yEplCxfhUVFYuRJSXxgnJjGFy2mmPuW
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69b8e65b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=dEIGAuP7kbcW1LL0Y9bFPw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=l86ZLHr8ISoCRvqyY7AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDA0NCBTYWx0ZWRfX8FmJ9XLZ0CkL
 ecSPqn0i9Y29AfcXBenHrZ2XFiSyMIvNS5uu86BCD+xmEUBb50HeaWxvAT3KlaBKD4v3TPjvXoh
 ekFU/LwURLeQYvg4JfbIxnevSuWQWuqZYQu3Vqv5UVmwkAAqrYfHhW4v9V9fk9dkhxh/IATnPyt
 o0oOlyWGEI3XznJbsfBhBixz8fD/7h4urL1I9KQycJORCsUxnJobF1igeQxVTfImb7l3uXzVtRa
 L0SO6fNr9j+Vb+4DbOd9aC0AOa0Mo/yhUvevIrQUDViTWnZfC0Qj9AV6bnoh8AZ5QpbHvWjpRs6
 wXmgLcgBIZ4yWT9aMIRSF4u+hCVoSwmfqedjnaAZ6o5OWW7/Lqg57pY9PdLulNshAJKk/k2Pwir
 6m3inW1blB3OLaiNcVX+yM4nC060iHTpVBvpkw8sY22vC89HyY66V76oQHEY8tViQS0wkxwnTJX
 U/0xVuGEd2md0FNQDNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-16_06,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603170044



On 3/10/2026 3:25 PM, Krzysztof Kozlowski wrote:
> On Mon, Mar 09, 2026 at 04:42:57PM +0530, Mohammad Rafi Shaik wrote:
>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>> describe Digital Audio Interface (DAI) child nodes.
>>
>> Add #address-cells and #size-cells to allow representation of multiple
>> DAI instances as child nodes, and define a dai@<id> pattern to document
>> per-DAI properties such as the interface ID and associated clocks.
>>
>> Qualcomm platforms like talos integrate third-party audio codecs or use
>> different external audio paths. These designs often require additional
>> configuration such as explicit MI2S MCLK settings for audio to work.
>>
>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 41 ++++++++++++++++++-
>>   1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> index 2fb95544d..1d770cbcb 100644
>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>> @@ -21,6 +21,34 @@ properties:
>>     '#sound-dai-cells':
>>       const: 1
>>   
>> +  '#address-cells':
>> +    const: 1
>> +
>> +  '#size-cells':
>> +    const: 0
>> +
>> +# Digital Audio Interfaces
>> +patternProperties:
>> +  '^dai@[0-9]+$':
>> +    type: object
>> +    description:
>> +      Q6DSP Digital Audio Interfaces.
>> +
>> +    properties:
>> +      reg:
>> +        description:
>> +          Digital Audio Interface ID
>> +
>> +      clocks:
>> +        minItems: 1
>> +        maxItems: 3
>> +
>> +      clock-names:
>> +        minItems: 1
>> +        maxItems: 3
> 
> No, this is just way too generic. There is no such syntax in the kernel
> and this should stop you right there. You are not allowed to add your
> own style.
> 
> I don't think DAI is here a separate device needing its own resources
> expressed in DT. This is still part of ADSP so you just described in DT
> internal routing between two services on ADSP.
> 

Thanks for reviewing.

I’d like to clarify that this is not intended to model the DAI as a 
separate physical device or to describe internal ADSP routing.

Requirement is to allow the kernel to send clock‑voting requests to the 
ADSP. LPASS MCLK routing is not enabled by default on the ADSP, so the 
kernel must explicitly request the ADSP to enable the relevant LPASS 
MCLKs, which is a real hardware control requirement.

These clocks are LPASS‑owned, and driving them via a third‑party codec 
is not appropriate. The intent of adding clock capabilities at the DAI 
level is to allow the kernel to associate LPASS clock votes with a 
specific DAI instance during stream activity.

While the DAI itself is not a physical device, some DT representation is 
required to describe per‑DAI LPASS clock requirements.

I’m open to considering alternative representations, but removing this 
entirely would leave no generic way for the kernel to handle correct 
LPASS MCLK voting.

>> +
>> +    additionalProperties: false
>> +
>>   required:
>>     - compatible
>>     - '#sound-dai-cells'
>> @@ -29,7 +57,18 @@ unevaluatedProperties: false
>>   
>>   examples:
>>     - |
>> -    dais {
> 
> Why?
> 

I renamed the example node to bedais to mirror the node naming used in 
Actual DT (q6apmbedai: bedais { ... }).

However, I understand the binding does not require any specific node 
name; only the compatible and required properties/child nodes matter.

The rename was done purely to align the actual DT node naming used in 
practice and improve cross-referencing clarity.

>> +    #include <dt-bindings/sound/qcom,q6afe.h>
>> +
>> +    bedais {
>>           compatible = "qcom,q6apm-lpass-dais";
>>           #sound-dai-cells = <1>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        dai@16 {
>> +           reg = <PRIMARY_MI2S_RX>;
>> +           clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1
>> +                              LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
> 
> So one entry, not three.
> 

ACK,

I will add three clock entries for better clarity.


Best Regards,
Rafi.

>> +           clock-names = "mclk";
>> +        };
>>       };
>> -- 
>> 2.34.1
>>

