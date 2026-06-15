Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0E127A462
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 10:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517648; cv=none; b=qQUj3q++/BpQH7wvRhKCC3Qt0q4oe3HB/mR7cJOuGfyMeqoU1xGc4q4CYWOM3MOHT/wjtely2w10c9sk3qiv4TkENcBvZrypbvkDS5SF2nbRbMJAW1epTWLLoJJQMul16naswnNlheYuo99cSyZA4v/kT1s1jjtC6mrbDU5uvyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517648; c=relaxed/simple;
	bh=DZlwvNFhOczSN15iV3ZhEhqrNk3Z2FnJ3q8czGO+XvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hyNrryMMqV8vAt1q368BnGA8isfh2+TunjMP7Jx6E9Zm+W1c0ymrTQz1LZztCc05twp9ISYnSo1u+C8gs6OBVsWaDgaEWc8BLi7wu1H7a/itQyY20oY2eMFKwcCxfAEBZwyZY/22L7SQjSHBEZLsjziLdEi49LnDPECTvCyTVfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dl5VIgMe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M84Uaqea; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dl5VIgMe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M84Uaqea"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F9e9vv3813768
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 10:00:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2AIOFqjx25h1fmAVRqpund2U9aeEiVKZYsg80qRzviI=; b=Dl5VIgMe8zt0RvuC
	Mp0Aiu7J+1B8czhXacbZfIPdBD1gOUrDMvq+fzMZ1Yg5iCIu6KSYHPK037kAvZiO
	br3PCfXR57OHKQl+tcfqKQLHXKgmzyJOyyvCHnR3Zwe29JGM7oAe1lm+Z2G6cU3N
	4atN3XTZUW/V3qbmmy4Af4Cqk69uKyK+AcOiRTK+IbzHysKSo3S8TGKsYy1JEORU
	a2mGXvoNnujvKr/X5rwcW/ZoWwqkyzEB+SK6qtZz9rsgZKoyXVphwBz+g3AwlFoH
	eQG4/foq858KFROP4m8STRRHfZduyRvRVvBeXv9DvqnWX4Yw4744yxkzeLSU4BCk
	XGyOqw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eteyd82q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 10:00:46 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0a99db8dfso30613145ad.3
        for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 03:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781517646; x=1782122446; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2AIOFqjx25h1fmAVRqpund2U9aeEiVKZYsg80qRzviI=;
        b=M84UaqeaCWTbVnxD1m8Wf3SCTlJ5ZpuidCa9DV8TPFe69GyFuV+6Mvqj6TNUjnlDE8
         kmYj1fukbH/93XieXVFS57gOoZI7reLe8R9dR74dFfUCXtNfyG1RAYgQfXsXvR+eZUNM
         B3/+63+o8WRS4NaY3f1hKX2sh5HcL9A3L9LWMbC36cMgZioa0RVaw0kujCeDedHAXEcj
         ibGvvRX/LyOLUamnrVFsk1MO7w4AvmCt3lMi/OGA9wCZD2b5bjxNoIo/a3jusN4MJHbr
         oDf6POsZshnS2v35VvQk8jZff8yPel2e95Be2EvoKqj+m6tdTePZyKdKd6NCklHmYCFl
         SQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781517646; x=1782122446;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2AIOFqjx25h1fmAVRqpund2U9aeEiVKZYsg80qRzviI=;
        b=p4PEel4jGlzRaKDjppPQ6F9tjBKxC+bjE+Mr47i7szaqjQW18Po95koQWZxQGnvnuh
         7yUbBPU73oc0X+vAxFVAOsSA/u+Zg7qijECel9rF4oDUBmpiyJLFJZcuzOA+aqsS1csd
         0oh7mP1QGpVwkwGvms/0vtVxCupyvTEM8Qz0cHNfnuA75ShFR/Qc9Uh1jnRQKSVLZCVk
         2dA8t6ZeMJeMnciU1jIf1nq2p/DkhLtz/W+td+zYIgfCkM8v22TljoPY7pvwEkd9+IRI
         GhQ/dttkuDgb76Gj/zmX+kbMjFsCmU00HtyBxGyhM+gBmOebnOVabRkjNRH4HYsBe50J
         LUyw==
X-Forwarded-Encrypted: i=1; AFNElJ9+O1s8EpafCcLlD1FyHFbvpGnIGiA+3Q2WiBrmSucp9+CTauX7H8xxVR9JwPp5bYxHW379vv4vt0Z76g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIvTDRIH490U4zfyHS40/VJJe2HQIkA9Wb+RxJgNEfzHcvOSli
	p9LdZgfQTA5tctLo6M0EwFVaDd2P/acC8J1Pt7zdGJAWLC3LRw+yq2UZKSAK8Wgins3SVciITNK
	yGIIbR+P8G/J/mL+yfGqsg+2WVArfAVQR3lp3b6TZlasMJY74OQ8TjluPyQ6Zw9pFEg==
X-Gm-Gg: Acq92OFYhsCUaZWF14A3k0BXKFuG5w2TzMNf9xJGr6IPDJzQ1ZYq8yTaFvMCx7XnQv4
	BroSNeh9PCiM0001ZMlq0MHEtSmrcOYya5bPd45M3H5GoycVqnsHFL3aHnUgUDEb6Vy6kzPLOhI
	vTrlOgkVpxh0jhfHzrUtrpjFiHFs/kSM3rgVXeZnaoMxgOEMAsKTrUyOCS+opTgAteVfNZNOBMf
	9khSo15D+w2j83rvsTF/I0bYBmQYWpV0DwbPMKco9kcXUG8/KgBf7EZnZMWAKqayDcsIdESpcTL
	DPinvtx+Jp7nXfQnPRwORMnbyNFx+WBNkjLNMCS04ZkHT966zPOFGAIqs3m0fqyWTZW+xdyl+eg
	8o0c9GPjGxp8tGEY1idKx5ceYJ/x/LBd9sYTKiZaHfiP985XqS7JOmraEZJIK
X-Received: by 2002:a17:902:e783:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c4134ec05dmr144412445ad.21.1781517645629;
        Mon, 15 Jun 2026 03:00:45 -0700 (PDT)
X-Received: by 2002:a17:902:e783:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2c4134ec05dmr144411645ad.21.1781517644854;
        Mon, 15 Jun 2026 03:00:44 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c432c8ce89sm97213885ad.57.2026.06.15.03.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 03:00:44 -0700 (PDT)
Message-ID: <a99367df-7010-470d-bec7-0024b0bb63ad@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 15:30:38 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Add MI2S clock
 control
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260608023011.942228-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608023011.942228-3-mohammad.rafi.shaik@oss.qualcomm.com>
 <e6567656-8745-4f07-9636-7779d32ccbcf@sirena.org.uk>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <e6567656-8745-4f07-9636-7779d32ccbcf@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: MIsFaGc9kEne2gWZcm-EuWpohjOHxZjk
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEwNSBTYWx0ZWRfX5upV3SaXzF1X
 LNqssk8NkAnSXhTqDyadwT4OPFyah1TT8U2mYSPpVIJUV3ZXME6MmuggGiiGN9xrapfa4IjJcOr
 Zg9iUANehpRywJdsmozvnRE4xzeooHw=
X-Authority-Analysis: v=2.4 cv=QrJuG1yd c=1 sm=1 tr=0 ts=6a2fcd4e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=2pCuibHp1YRUK2peGzAA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: MIsFaGc9kEne2gWZcm-EuWpohjOHxZjk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEwNSBTYWx0ZWRfX7DqomGXlAiL9
 iGQQqRQJJXlAGrO1U4fT1KhziH3LLEewHiWPVsmDhSZJbosXIOuhkK1vKEuelzS9bpqk7GSEm71
 sJQFSVrWijUGW2oYWEN1x9gnolPEo+ZuelUVcMbDmSPsvs1KZCksRvNhw7/aTxe2mMlJWz8eR5z
 4zIUM1YL8N/ZtHsBdT53WDXo/F1ciYfFa6ImxRrxG/goTXxMhXjUtobIR4M8qQ9TKSZOjhMbWsc
 NaU7jmRsO/xWTbzcr9oZW6zLtByQRPuG7U1zbfdHnJ9HvUr91FdTe4I4R9kyLBjP7ym7HaWja9/
 gwJ1xzfcvsG2Qb9qSE+SiBbWcgiyl1K55bwzo8Ryu3gt5A8HsJYerWX7F7i2+TauYj9Su+JwD84
 T8mdewdQ8WJl0WWSp0NeJYtpD2zlebc/H3mDhi0/orFYjXCicA/YAH9+oh9s0nJO37n1BQnZ9wA
 i6lQ2WKdYvfnxeFAg8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150105



On 6/8/2026 5:31 PM, Mark Brown wrote:
> On Mon, Jun 08, 2026 at 08:00:10AM +0530, Mohammad Rafi Shaik wrote:
>> Add support for MI2S clock control within q6apm-lpass DAIs, including
>> handling of MCLK, BCLK, and ECLK via the DAI .set_sysclk callback.
> 
>> +static int q6i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int freq, int dir)
>> +{
>> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
>> +	struct clk *sysclk;
>> +	bool *enabled;
> 
> Neither sysclk nor enabled are initialised by default...
> 
Yes right, Thanks for pointing out.

I will initialize sysclk and enabled to NULL and add an explicit error
return in the default case of the switch statement to handle invalid 
clock IDs safely.

>> +	switch (clk_id) {
> 
>> +	case LPAIF_MI2S_ECLK:
>> +		sysclk = dai_data->priv[dai->id].eclk;
>> +		enabled = &dai_data->priv[dai->id].eclk_enabled;
>> +		break;
>> +	default:
>> +		break;
>> +	}
>> +
>> +	if (sysclk) {
> 
> ...but we just fall through the switch statement if the clock ID is
> invalid and use the values.
> 

ack,

will fix this in next version.

>> +	for_each_child_of_node(dev->of_node, node) {
> 
>> +			if (IS_ERR(priv->mclk)) {
>> +				if (PTR_ERR(priv->mclk) == -EPROBE_DEFER)
>> +					return dev_err_probe(dev, PTR_ERR(priv->mclk),
>> +							     "unable to get mi2s mclk\n");
>> +				priv->mclk = NULL;
>> +			}
> 
> Do we need to drop any OF references on early return?


Yes, an of_node_put(node) is required before the early return to avoid a 
reference leak.

I will update the code to use for_each_child_of_node_scoped() to handle 
the cleanup automatically, or explicitly call of_node_put() before 
returning.

Thanks & Regards,
Rafi.

