Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FACA43C7A8
	for <linux-sound@vger.kernel.org>; Tue,  7 Jul 2026 17:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783446471; cv=none; b=sQ7BoWgKOFryZaLyRRxz5NMr8a2VylH7iLuOqqjtqhnRabNpqivx2j0Xpz6SKLh+GwiSS9PfYYNuizsbgyid2JRAERTgI4puKLQCM+53s0Ry6z3uwQ6PZHhkvj9evthhAAnm7T5xmiXX4bK1F9m6xLQk4aVthbpk4LtvBgY3hgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783446471; c=relaxed/simple;
	bh=Yn0LLie4tUhwqThdy02nhPDX9BncA9qg0j5VJlJG7oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a7OzDoy6I8qbZjLZziml8ZpR2qHg6XxRllzlDzKzdfyzLJ3zU+5dNO9deh4fHkrBtbOWWCAIV2Jlpuvv9JQKRYSnmTJ3mUJjbD04Mza7Gh/dnpty/gJedqJRIRfubjki2j5g7LjmKmn981TReTNF/kEKdDFkZef9Ei8jxKlv91A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f6LrBzlh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A3y9WaSb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f6LrBzlh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A3y9WaSb"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667GuuH7230679
	for <linux-sound@vger.kernel.org>; Tue, 7 Jul 2026 17:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3RFLK8wUelAM66Kdi3Lc+POH1fepJhsJVRBkyR+7a28=; b=f6LrBzlhge0U9Key
	bm5U5cGElrl7/Mi068JDzDjCSAYDyo6DyvPaiW9t+lb3CowHkre22e2I3z241R+0
	Zax++R9kfzawGPcQGDxlpkVA6gzXwZ73WrTfKMxyZNgH8SRZb9VmkdPD+rWpKSxg
	OabRqNkyxK+TAbeqgLWOgiAojtn5JAxdhT6Xl0DndQ+AKyHIbsdaUdkTC32up9Sz
	eKLGxG4umnvApJ8+yIMtUXq3P1l9309JObRWHE98cD7xYkVAhtvcj308X6b2++0f
	4g10zVX7NFek+MIBXoVWhItk1yum92Dm9VQ+xsI2CGsOwiTvwOmNEiYmQBes36D8
	oAby5w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95e5r7nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 17:47:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c860544c077so11983349a12.3
        for <linux-sound@vger.kernel.org>; Tue, 07 Jul 2026 10:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783446467; x=1784051267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3RFLK8wUelAM66Kdi3Lc+POH1fepJhsJVRBkyR+7a28=;
        b=A3y9WaSbf2ntnkAmx7J7NaHPdayD6IkXsKuc5vC1FuaTLHKXTS5GG5PPHmfBd6ptwF
         AmjB8/laqfeKt9tvNVQiplzxEV6BCmjJTG1TqhnMmkQ+ITlPK59QqLmJ6YGAnheQ1uCb
         1mIBBI7mOelzhewtqPmIh3ke52YXPKsOvvat9Uz7BV+Q0/QiMrG+Z0YpEpkr2gZk8iD4
         Wo6Tgz129FKEFkN3noPG4T+bxV4ExWa32Y3vmmfTjxWN0M56z6CUBA8I+z1yDswJf1YC
         nyA//EAqfci7sD5+AxgoDHUIX/CoD+rnVZXLCIQDbyW1kkBVHfiRLi7MJNX64VWm3sCx
         DPkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783446467; x=1784051267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3RFLK8wUelAM66Kdi3Lc+POH1fepJhsJVRBkyR+7a28=;
        b=pQuDoJjE9UwSPZq9CFdQ5k7iLuQsR/KEO2JXJwHv7Lb58GRS3se2QTnSSr9v0eg56n
         TIYxVQshnVwp1ZWEC0gMz6ktoWMSVt+QGZeO+8PCFPZ2qrgxyNu054J7C3asN4/c/NpB
         4VcKGGgjsN7SHGhFzicMX983CbfXjmxQGwX0wn5cZq4tVp6FGyg1I+jkE1YZlZQKUmjP
         aQiqnyFPj5R5DdsQWAR4bl8zwxaLAkAIBw7wOoKpAWdLQ5hX+2RJz/uG5YQ72JNWCNc/
         ldHLBtoNkUaE7VRSKyk9hVFu+7f5qvP3vK8xBpuHtgBs1BvEWuxrQO1zem9bIhTv1IDp
         m97w==
X-Forwarded-Encrypted: i=1; AHgh+RqMIlzvnqTg8ha6oJiLXIH3PV8UllFYQyH5f5EEYS51kgKcYM9BPgn3CZgrNaqmEqyA8DajaEbj5bXYPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5zcn0GWQ0hn88+BZzrSI6LOFCMWXx8EAmQ7r+JkwqDapf2vmc
	AxO2XWCziCw1mJ7pdI2SNDBvjsrSc1aUC9g98Vr/y8JT8pP/WZaP971FVh9FJGJRpMT8Fs4H8xE
	yXHykAsmHEC8O0pT0qOku/+xl2a/ydU0xrxCyuB0Wz51/+NQL6b+Ly/VlXJ1Z75L7KA==
X-Gm-Gg: AfdE7cn3mtKiNO9wPi0VjB+9hAsZLXX1K23syZtBvTadw1PHz5VYoxdIwJy5SmcRFhE
	FbOjgckJfw5o+qHhkr1xt3P41UEVHn79iHSLCSHKgxVYEoHbCDk7/S8f2cAN0VWUBg35sJQaZDP
	Bv7aghxKN4f7lZHa7FWdICKgF+75KjvvXEPjBrxvsMWwvMNqtdqYrq8tiftXj1KG0FIvUUVxA63
	Z4qKsHrmV2VZbYqUHd5u0V4IH1QlsDFQ2fBFwb0FR/CChjqJAMmAS0zcv9lmzR+gHDCzK6xmTfC
	xYWOeZD8bmINTDrJgHGkx6E5/A+sqBIys83xl03lz1eRX7NTRhMAFZrNCI9qByHkBs6f/jmzeME
	x4tEQRxAvEHG3qUV1zaIDMO0R24MZwTdIoGuDrrIJJsmvnQ==
X-Received: by 2002:a05:6a20:4311:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3c08ece2de6mr6680689637.20.1783446467411;
        Tue, 07 Jul 2026 10:47:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:4311:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3c08ece2de6mr6680669637.20.1783446467012;
        Tue, 07 Jul 2026 10:47:47 -0700 (PDT)
Received: from [192.168.0.105] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a8bc08sm13979467eec.24.2026.07.07.10.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 10:47:46 -0700 (PDT)
Message-ID: <156c3c6e-72ac-4ad7-b489-6bbc9e99b279@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 23:17:29 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: sound: add WSA8855 bindings
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260701135913.1641328-1-prasad.kumpatla@oss.qualcomm.com>
 <20260701135913.1641328-2-prasad.kumpatla@oss.qualcomm.com>
 <96e3edaa-3fac-4006-9941-5e620e61f3b4@kernel.org>
 <9b45a805-79b4-4b9c-b5fc-d9b08a736a42@kernel.org>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <9b45a805-79b4-4b9c-b5fc-d9b08a736a42@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Sc6PM0VZyje8xYZLu6HTRtczJHWENXZL
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE3NSBTYWx0ZWRfX1rs9Y/hvG9tA
 ymKURHMMeYIjPEIaVBHBi2UwSXa1qeo3iKFjvjqGGjepFvAAy06PGHAn8VjSipqxnLBVzggjNZX
 VSeKIudc6i//a1Dpg2xeVn4zcatWrUY=
X-Authority-Analysis: v=2.4 cv=CNoamxrD c=1 sm=1 tr=0 ts=6a4d3bc4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=FCd5T-TvBLVYlDZUGUwA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: Sc6PM0VZyje8xYZLu6HTRtczJHWENXZL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE3NSBTYWx0ZWRfXwS2vj14B+c8E
 hIHGf0boEwJDloOa2zP121adc/48QR/jBZcjhplM8TjEgX6p4lfz5+ez4GL1pJxqCj4mHP4hIz5
 Vah9ETazJlV0M6RtLhnEfcQuTbJf6cJcMh/SPqKqF5rvbryl1VygjMqXLXfrMazIDa9w0K0BOTY
 276VbNTDezd/t83YyAYZPGl0vKkTxC2f1JcF4gz9SHTkWXZZn2XFJpP09+oRDDs66VH+v75YPPz
 QdMs0/HkK2lXZ5Pr/+clWwsJFk/dAGbxchJ+FqeHMdCX/ZMvbxGrlLOEKXUnB5IUYecbLk9weYA
 HpyIc6gEKalR6pFrZGOUsBHiMfdKJSnGI65//8WlId2a/UkJJXDd3JpvHAAmy/9UxcksuM4C9R9
 dyBNntU7PjReqh16jXaR2VcpHHxhFZof7Ug4XV60LYmJFFz1XZTD1pTxc9BSyE3GqOoDNPQIHaE
 1qxylN9T+ciyRIugm9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070175


On 7/7/2026 7:10 PM, Krzysztof Kozlowski wrote:
> On 07/07/2026 15:13, Krzysztof Kozlowski wrote:
>> On 01/07/2026 15:59, Prasad Kumpatla wrote:
>>> +maintainers:
>>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>> +
>>> +description:
>>> +  WSA885X is a Qualcomm Aqstic stereo smart speaker amplifier. It uses a PCM
>>> +  audio interface, an I2C control interface, and a Class-H amplifier path for
>>> +  high efficiency, low output noise, and low idle power consumption.
>>> +
>>> +allOf:
>>> +  - $ref: dai-common.yaml#
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,wsa8855
>> This will need exception and I am in process of rewriting qcom-soc file.
>> I can include this one there.
> Sent here:
> 20260707-dt-bindings-qcom-soc-naming-v2-4-1b7d695be2e1@oss.qualcomm.com
>
>
> BTW, one more note:
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

Ack, will update in next patch.

Thanks,
Prasad

>
>
> Best regards,
> Krzysztof
