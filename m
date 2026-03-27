Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6573F075C
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774617407; cv=none; b=kO6qHaqXD6rAkmK7sUz61SwlitGhxyFxHWhrc/FEXQ3KzCacz+uquASA0SEnRXbo7Zoyclo+CwbZU/uupOXl1QPptR0E81QkaH8KfoPgt6Xedn8E8uqWeICqe3OcJPM/2Pon6FkkI0lX42kaP3V/rWAo1s49gZZNN5N2u7GLHdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774617407; c=relaxed/simple;
	bh=x/cmZSWCcD6wb9H0/VWP20ys4A9Qw+ipMcYqa/COYmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C308QgWAdkR6SC+D61G9j6Ue42c55kbcg8FW+XqaBQXoefo+B65xqxMo8TsIkfYDp3Kp02fxjuYsGNx4tO6LYzJZUzfobrg2nn06DtrJlTrxa3HamR2BZff3DwhI1yADw6Hfb0LGUTZwlzkXsTQiddtdbqpvJaDDD7NvDJx7UuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JV6U7QGK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ekUTrFb7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JV6U7QGK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ekUTrFb7"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RCSwM73587840
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	48flgpO0aR5KD79Tmzojq5EAq3TiDNYsvETg/Nx85MM=; b=JV6U7QGKfxN8Z0oc
	JbXrr5m43oD8HBXp27+nRKJElILyQsQQlM+eG4qTOptmumIPhniIbENNl6gNGMXI
	ULHl1JG/s0dwGeL70komvRNsEa1zezIoCCtTkIPnuDmEO2Aejn1EtYxdD3xhvXO5
	TwMYJrzr9pcNlD3vUE1/e7mUhxlGaTK1G2Tqp/WFsSgqcJ1SurJF8HPwXBVMyX42
	/kRvAuAs/aiUrJIskE8l07bAXwuDh7Hgg6zvPNNR6pw2gPXAVL90c/QFS9lygYAX
	tXPPR9HDSoxF3UmteqGmh/sQHSHYeLqxmrl2HtXpBOffmi84kX9Wa55BZUxlkAyC
	i73Q4w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhg4ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 13:16:45 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35a032cdd78so4235058a91.1
        for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 06:16:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774617405; x=1775222205; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=48flgpO0aR5KD79Tmzojq5EAq3TiDNYsvETg/Nx85MM=;
        b=ekUTrFb7HkXC2XaxG2eKF5XZ2TRbNN03fl2UbcPwMm6nm0NX5QMNWWdkdHkRsvvDI0
         gkPxxtSKIvsRM9vFd1F4ypx2Co4oXtuj+dnkT1cORBR5WURXuC+nmcdHBPA8wDCdAaeP
         +snX/4wAWWjkMhP+WOKMuD75/FHGE6QOU4de+g6ATBvYMu6RrAPqCOQcy+oQWCiHSMCo
         pEMVO97GTqWnI6TBow+8ktJEm++N7L9RzRrdSGBC2Zm8+/XVFj8MxMJBtOlpaf1CkNUi
         mcJiHv/vdronsUSHIPFD38YMuvAIufPs+Ck7v7J8Xd1cRo9lmQApFzQKoPC6t3axS2Pf
         GZgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774617405; x=1775222205;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=48flgpO0aR5KD79Tmzojq5EAq3TiDNYsvETg/Nx85MM=;
        b=pprDkvryEiAD3Cfzema+cCHu9nI1ZeEjO5+vjWST634kgxEnPrL5qXnXy12jV7Mhda
         cCswo0xsQgPaOFX+IgroipSvu70tZq5lML99tnhdv0JE98/c/65sT2Wduj8hdPHqxnZV
         W2CgPi18Bmk0GtgxkZECk3A6DmNqlQq6xXLBdeqp4VSVGvahlYi9sU/vSP+D5Z6V4wzS
         j7vMsTUnJn1fzJnd3o5eW6U1VSZjwVEJI+ylBvlAihiD6c+/hguMgkysbxH/Bd4WrBgj
         wyjzLSAr4JUIzGsRRZQK52D7Rz4BLF0tBy22Cfvd14THtP9i7TYGc9F5RksmqSjg3CdS
         1pDw==
X-Forwarded-Encrypted: i=1; AJvYcCVVBGIYdRmnnfE4FKNHCSLPpA9/yjUcazobug3vIyqM563H2dXr+F/hpd17fqfGwApI+t2Mma5KTdHLYQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQg3puVBatsLen4SPhp1+MyQoGiDzyCLgQjF+Szd/3vhGsfxQF
	R3jeLdmf6y4I6wP1i8paWzzOXNEt/0S9TycZgv6Tr8YBpCrlT/PAjjNl6UB+TCNjzVWIRvK1fF0
	QZgYezDQ+7SNrLWMxPfKJPYvxheR+BAKw3DYjB/TAauLk+37nlPqlwmBMJKiWhwuPqg==
X-Gm-Gg: ATEYQzx8cCRedjGBHve19fP64eMP6zrke6/fBVJpBlSew8Blap2qheLYFhFWZvlTR7M
	hl8iEnTy+PrHGQqfwzpH9ji7nYXJ/j4yRewgd3sDhQXpqq7tJ18w30id4pvSEUPeGK2YuX2Ejxb
	HOiRRoI4HDNU6u9PDdQkZ5LFFisM22QMfFYtRmGfQ4HIP5sKmUXfDAfa9a3Ui9856iUyAdhh4ox
	0BWhgXZpEKMAGx1kxHx2pY5Q8vt0p40UHEdO25JLdtJ/fI3uZ7CdeK3idmOriimK1XC92osGReX
	j6OZOq2k9ZlQq5RXA7czM4aIo6tp45z9NmHmWUXBfL2/lOmgW32hDD3cFRHmAL9FsvHfio5WTkc
	XMTpO4J0tY830bHqJH7Ll6ZzQK2TJYKmhcYpwr6xzfOJIZpQcIjZ18H3uliA=
X-Received: by 2002:a05:6300:210c:b0:366:2447:6778 with SMTP id adf61e73a8af0-39c87b7a637mr2713693637.53.1774617404450;
        Fri, 27 Mar 2026 06:16:44 -0700 (PDT)
X-Received: by 2002:a05:6300:210c:b0:366:2447:6778 with SMTP id adf61e73a8af0-39c87b7a637mr2713635637.53.1774617403804;
        Fri, 27 Mar 2026 06:16:43 -0700 (PDT)
Received: from [192.168.1.5] ([171.61.245.35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76739311d1sm4796243a12.15.2026.03.27.06.16.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 06:16:43 -0700 (PDT)
Message-ID: <2e03441e-4353-4927-8630-aa7730c4033e@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 18:46:36 +0530
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
 <a7e7f32e-e365-4504-8ce9-1aada01bc52c@oss.qualcomm.com>
 <fc9e0399-dc24-48c4-99db-f9e39a79cda7@kernel.org>
 <138dee9e-56e7-43a0-bcbd-0e4db4d5b5af@oss.qualcomm.com>
 <376ad62e-e6b5-438b-a23a-0988b6489e5c@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <376ad62e-e6b5-438b-a23a-0988b6489e5c@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c6833d cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=uQpbphyD5Ctod2HTVTDBmw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4GqzFmwoONYO7NBBVQ4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 9OgAn3tzP05bnB4e8Nj6e-371x0eJTxM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA5MSBTYWx0ZWRfX5QJfPlHwN29h
 KJfXzxT0sib/eMsobOGmSUs0UlrC8xUfzSlA8AeOLWRpsn+e6Y/xhS1qORHsPeZdEOpUaBuWjfS
 dm35MV7wbLqu7R/Niyk3S49GArsihm6GY8NGUrrPWNp4bB75v8ebRw4ZZ81n/OVo/RTLFRs5M8d
 XUDn/XNtiTP1/45uKjZEoouqPTwmMPeAxkfcylRrK7cWT816dZgQqbrsgRXYRFO1qCz9w8kcSvU
 HWk7tDWGEJKMmHVVvhLnk83IkRfcnuzTWXsAYr4+3FFFIgagDXkIdZQAcAMTagI7ClGgUQp6yDY
 8viGzycMeF6X3A9QV7wzfOPV9hBkMm2Zf/CV8tluELy7lI1QOWBfjJiqFkWVmZornwwzntIkXQq
 CKzRAAMTJX0LhyX2YQ4QP33Sqk8XyRnxeyqprSMU9qikTGrUUdU+OoVQV1HxGaGiv88mE+WN8t2
 WLsn9J7jrdKtaA+E9HQ==
X-Proofpoint-GUID: 9OgAn3tzP05bnB4e8Nj6e-371x0eJTxM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270091



On 3/26/2026 3:40 PM, Krzysztof Kozlowski wrote:
> On 26/03/2026 10:57, Mohammad Rafi Shaik wrote:
>>
>>
>> On 3/17/2026 12:41 PM, Krzysztof Kozlowski wrote:
>>> On 17/03/2026 06:27, Mohammad Rafi Shaik wrote:
>>>>
>>>>
>>>> On 3/10/2026 3:25 PM, Krzysztof Kozlowski wrote:
>>>>> On Mon, Mar 09, 2026 at 04:42:57PM +0530, Mohammad Rafi Shaik wrote:
>>>>>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>>>>>> describe Digital Audio Interface (DAI) child nodes.
>>>>>>
>>>>>> Add #address-cells and #size-cells to allow representation of multiple
>>>>>> DAI instances as child nodes, and define a dai@<id> pattern to document
>>>>>> per-DAI properties such as the interface ID and associated clocks.
>>>>>>
>>>>>> Qualcomm platforms like talos integrate third-party audio codecs or use
>>>>>> different external audio paths. These designs often require additional
>>>>>> configuration such as explicit MI2S MCLK settings for audio to work.
>>>>>>
>>>>>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>>>> ---
>>>>>>     .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 41 ++++++++++++++++++-
>>>>>>     1 file changed, 40 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>>>> index 2fb95544d..1d770cbcb 100644
>>>>>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>>>> @@ -21,6 +21,34 @@ properties:
>>>>>>       '#sound-dai-cells':
>>>>>>         const: 1
>>>>>>     
>>>>>> +  '#address-cells':
>>>>>> +    const: 1
>>>>>> +
>>>>>> +  '#size-cells':
>>>>>> +    const: 0
>>>>>> +
>>>>>> +# Digital Audio Interfaces
>>>>>> +patternProperties:
>>>>>> +  '^dai@[0-9]+$':
>>>>>> +    type: object
>>>>>> +    description:
>>>>>> +      Q6DSP Digital Audio Interfaces.
>>>>>> +
>>>>>> +    properties:
>>>>>> +      reg:
>>>>>> +        description:
>>>>>> +          Digital Audio Interface ID
>>>>>> +
>>>>>> +      clocks:
>>>>>> +        minItems: 1
>>>>>> +        maxItems: 3
>>>>>> +
>>>>>> +      clock-names:
>>>>>> +        minItems: 1
>>>>>> +        maxItems: 3
>>>>>
>>>>> No, this is just way too generic. There is no such syntax in the kernel
>>>>> and this should stop you right there. You are not allowed to add your
>>>>> own style.
>>>>>
>>>>> I don't think DAI is here a separate device needing its own resources
>>>>> expressed in DT. This is still part of ADSP so you just described in DT
>>>>> internal routing between two services on ADSP.
>>>>>
>>>>
>>>> Thanks for reviewing.
>>>>
>>>> I’d like to clarify that this is not intended to model the DAI as a
>>>> separate physical device or to describe internal ADSP routing.
>>>
>>> If you do not want to represent the physical device, then I don't think
>>> it should be represented at all.
>>>
>>>>
>>>> Requirement is to allow the kernel to send clock‑voting requests to the
>>>> ADSP. LPASS MCLK routing is not enabled by default on the ADSP, so the
>>>> kernel must explicitly request the ADSP to enable the relevant LPASS
>>>> MCLKs, which is a real hardware control requirement.
>>>>
>>>> These clocks are LPASS‑owned, and driving them via a third‑party codec
>>>> is not appropriate. The intent of adding clock capabilities at the DAI
>>>> level is to allow the kernel to associate LPASS clock votes with a
>>>> specific DAI instance during stream activity.
>>>>
>>>> While the DAI itself is not a physical device, some DT representation is
>>>> required to describe per‑DAI LPASS clock requirements.
>>>
>>> DT's purpose is not to describe software constructs, thus DT is not the
>>> answer to your requirement of mapping clocks to specific DAI needs.
>>> Every person adding software properties made "some DT representation is
>>> required" claim.
>>>
>>>>
>>>> I’m open to considering alternative representations, but removing this
>>>> entirely would leave no generic way for the kernel to handle correct
>>>> LPASS MCLK voting.
>>>
>>> I imagine that, since this is software construct, the software knows
>>> which DAI needs which clock. Clocks are strictly defined, thus driver
>>> should handle all this.
>>>
>>
>> No, the MCLK connection is not fixed to a specific DAI.
>>
>> The LPASS MCLKs
>> LPASS_CLK_ID_MCLK_1 … LPASS_CLK_ID_MCLK_5
>>
>> are hard‑wired connection, each physically routed to an external codec
>> on the board.
>>
>> Because of this, the clock that must be voted depends purely on the
>> hardware wiring, not on which DAI (Primary/Secondary/Tertiary/Quaternary
>> MI2S) is used.
> 
> If they are routed to external codecs, then they are already present in
> these nodes and duplicating them here is not necessary.
> 
>>
>> In other words, DAI ↔ MCLK is not a fixed mapping.
>>
>> Examples:
>> On Talos‑EVK, the speaker is connected via Primary MI2S, but the
>> corresponding MCLK line wired to the codec is LPASS_CLK_ID_MCLK_2.
>>
>> On Kodiak, the customer connected an SGTL5000 codec via Quaternary MI2S,
>> yet the required MCLK is still LPASS_CLK_ID_MCLK_2.
>>
>> Instead, the kernel must vote for the MCLK that is physically connected
>> to the external codec on that specific board.
> 
> No, the external codec driver must vote for that MCLK.
> 

I agree that when the MCLK provider is external, it is appropriate for 
the codec driver to manage that clock. However, in this case the MCLK 
provider is the LPASS/DSP subsystem itself, and the external codec is 
only a consumer.

LPASS MCLKs configurations inside the DSP can be lost or reprogrammed 
during DSP power collapse or subsystem restart (SSR).

Without visibility into LPASS lifecycle(SSR) events, a third‑party codec 
driver cannot reliably perform clock voting or restoration, resulting in 
broken or inconsistent audio behavior.

For these reasons, MCLK voting needs to remain owned by the LPASS/HLOS 
drivers, which have awareness of DSP power state and board wiring,

Thanks & Regards,
Rafi.

> Best regards,
> Krzysztof

