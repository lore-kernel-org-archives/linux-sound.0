Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423FD36A00F
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 11:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772622684; cv=none; b=psuZG7NPOreVbkFOSvBF6dOd2PPj771QX+0UCswHgmUPozT6m2SodNYeP2+UonTbuVggLZe30+QqhZnyBnIxVFD7ql/6AmhafiI3NqpIAwfNwOirdhYJXm8qAPzZDziEhbrDFgYj/B7PCP/2kd5ZMIbKZ8qmnERoxHb73lhyT3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772622684; c=relaxed/simple;
	bh=JIuIKTH+GzYh8O8NqAoxb+Doi8Ewuu7b9VzXx/kXQ0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hwsqsDE4SgYD6acrIe+QJbSV3PRfeJndUUuWEU08wpXmDubYd4ewzNS7FW4kEmRtEF5KoGrl+pJfSMETpeI7u2FnUAG18vZRDEoTxe9lg05f5D9xSuCgAOIOkIypB5Hwcgy2fUokD8so1PiCUmVHtmb0VPc3OY/yib1hVnJJdUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=je1u1I/1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SljtjOOA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="je1u1I/1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SljtjOOA"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6245SVIa2275166
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 11:11:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yhiCehhF6KyRk1DM1/ckSVrTa7WGu4u+Er1d5fBuqes=; b=je1u1I/1fY9eKfWw
	mXgbU5Np/+fDawyu9yI/dnCPWwQoU34RLV3BygwZoRjVlBstRQ1DKtLtvwJtw1K6
	FOylK+OdRIJA2eroWmB4I1ZP9sohZ11rvQCl0WYeHciAAiMeOgQTCWChl9kw04aR
	QgChgZ6p9pLp6JTHaCPOM2hJMxvt2dhdtfjWpBR6rjSm65Gbtt1e7DK1MjX88xP1
	djwAtOS0edvusk57FaXTWqf+6YiGAc4NZOJEmTigYbn13O7ogCwl/QTFZ5TPvQ6T
	ciRThTtn/sRnEf9XL9lJTOJpDc3W4lZzcmD8CKZfcn26BxxyxpnAVOvFIvrVqDWK
	zd7kPQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpc4msk6q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:11:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb6291d95aso172885a.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 03:11:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772622682; x=1773227482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yhiCehhF6KyRk1DM1/ckSVrTa7WGu4u+Er1d5fBuqes=;
        b=SljtjOOAK3SJlxEQHOu3mGKxcW0SubJ7UojKhmwueydDpqUIYHr3MgLnckBV46rZ3d
         JgKU8kqnsx7cB/EtURmjk9sFz7Vdnw3+jwxrKkTTcpNkR8n82/bpd5JYX9NWpdOEgY2e
         Ehq13KUdVVv0DHIFPv4nX6sJF2RDegupRhpM3taU1mPQyXCvYlooSVidfx9johd1c2aJ
         0aOgcVONxVqfcu2Coihwr8IfBCoLrnc6ZICF/dwcqBrvD/fsBH13QYGNOZgRMatpx8Y/
         7SwaN/I+terS+JCMc5UKPDweMo3HjgnDV6BkOKC7GVaPYhncH3PMSsMJKva2JxAqftzO
         crDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772622682; x=1773227482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yhiCehhF6KyRk1DM1/ckSVrTa7WGu4u+Er1d5fBuqes=;
        b=cakTTZg+Zr1L+VHMjgTnAAYLXUTv/sibxWx1N9x5Fem5EDsqpDsQ6yuFPy/H+DwH13
         EpbgHSxGDFvVFWuq1r+V+mivbe/Z00floYTI7WST8FUkF/nIHhZxZhxWP3d9cteeri0v
         cT9XzdlRpii5q991m+w/lLJNYy9vKB20ZlistXpJLXQHrP+i7nwhofkV32fAAbGr1oo4
         OIDhCy9zls5yJw3I4Pz0jWWSo2DyFmJ9dLAs6x0iEXBwf0fNlITuz+3+5dAOx7WMVJyR
         zQ2Wq//5kpa53Q3vzJPWpK8PXsDcoOkbE7NPsZgYVZbINGgAUZUi3pfQNBn1srYHJj+k
         PHZw==
X-Forwarded-Encrypted: i=1; AJvYcCUAPXmnxnZLQh3sqDai/lg27NmybQCajMbC/e4HfW3B/FH0cI/nN6FjSAZqojruBKGPiF9xrpwKUNAs+Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1dNJ+QpJaPlco+C2t66x+Fw1U/BM3vVeeoLk09WIr6z8blddm
	mMrkY6UTQK7uGaxMD/6JRqFeeK0Hb6TR+ZGlOwJV5/Qnrsp32MEdITLFkJZvNJ4V0YLI+iLO6et
	LNTy4iP23VIR+TziybrVZb8XtZ404gxGEQg1O5BUbvgW3g8UH+IJzhWjihFYFeaYv4g==
X-Gm-Gg: ATEYQzzRe0mJU/AW68YTVXK5DG8+0T/XrZRgRr/4H8cjOjkQH1twR/DEFdLfHswVVRd
	du8b7ceRI5e2PEhJkf+qO1j7WsIkvRjhHFLkPkpUzsNoR3alB3eCXv3ZqVmd4kETB2Awvri84lC
	OjTF58sHlO+dH/7PNsLbhnzaSAYwKZodOEf1YTBOGI/AIBXVtrEZUmekkM0rLjHD9h+br4GrTky
	tzvxOiAFSkL4UAPe/7d9sWEKTNKyyjeelEmbBL9tMM9CuS6y7bqMfMMuNaVMzL+zj5UKTpRIORU
	I+nYypPkOu6pWQbph1OK8wnyCzpKGa0nSDGm99dz+l5N9aeFJ1GsRd1Q1MIBQAGYutfqKUWQmxo
	olISOTE3Xl/AAxqjXKEtLE+d/LFNgJaIqAAmb2kdRhsSqPbMu
X-Received: by 2002:a05:620a:1aa1:b0:8cb:4d64:e993 with SMTP id af79cd13be357-8cd5aef76a9mr181362185a.26.1772622681651;
        Wed, 04 Mar 2026 03:11:21 -0800 (PST)
X-Received: by 2002:a05:620a:1aa1:b0:8cb:4d64:e993 with SMTP id af79cd13be357-8cd5aef76a9mr181360085a.26.1772622681103;
        Wed, 04 Mar 2026 03:11:21 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4851ad25a17sm7990115e9.29.2026.03.04.03.11.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:11:20 -0800 (PST)
Message-ID: <263d4c1a-caa8-4870-b95b-fde7a11d2a6d@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 11:11:19 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] ASoC: qcom: qdapm-lpass-dai: correct the error
 message
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, broonie@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        srini@kernel.org
References: <20260223180740.444311-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260223180740.444311-12-srinivas.kandagatla@oss.qualcomm.com>
 <c6ceab84-899d-476a-b2d8-e57028cc91dd@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <c6ceab84-899d-476a-b2d8-e57028cc91dd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iW2lCSX1fv1ghSDisHxEd3Ebp5_9Rfi6
X-Proofpoint-GUID: iW2lCSX1fv1ghSDisHxEd3Ebp5_9Rfi6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA4NyBTYWx0ZWRfXwN7FbY2UbLfx
 ciSxAVwcr8LjjIV2CFL5ciGX7iuE22Zy/E/MlfS97+dAJyaRCBPKtCtTtZOQLLOWqfMJzJRomAw
 akXBvjWNFmPcvO8cP6MNPTnmvxArJ0q5kzitfbsNAOpMUy/QTx72MzqNMjBMAFqTDwX/3hEI9/X
 cXq/ktAMreElzFEt6f26cpZWLwa55u8U2m6UsoeVmC9zyMdLd44MQb9alIK7zWhYQjHpo58UrIB
 M/vKsvYhZblB6SjiYdExe9RxXpgt0+QZGJhmUk2UN28ZUXOO34sVOio6P7jAzTjg2ZXVKJdqX1J
 wvmjgnD5Jsb4NHb0Hdqo31ftT766jAB7ykt5vaRmcoUCqBlkxjdKVmm/3lcX+XUIpbuG/D2BT/0
 vfbhNq9u8n6IaV1ansDOKADUvFIyH7UAQUtURL8xzz41SnzcA5xkLGUi4l3c4WA3gtw7WtZcWCT
 9kXWzQoGX6raiuNeXJQ==
X-Authority-Analysis: v=2.4 cv=C67kCAP+ c=1 sm=1 tr=0 ts=69a8135a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=D-i4kdfbrcmCuYzmauAA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040087

On 2/24/26 10:12 AM, Konrad Dybcio wrote:
> On 2/23/26 7:07 PM, Srinivas Kandagatla wrote:
>> Fix the error message to reflect the actual graph stop error
>> instead of graph close error.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
>> index f68d4b4974f3..fc246485e326 100644
>> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
>> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
>> @@ -150,7 +150,7 @@ static void q6apm_lpass_dai_shutdown(struct snd_pcm_substream *substream, struct
>>  		rc = q6apm_graph_stop(dai_data->graph[dai->id]);
>>  		dai_data->is_port_started[dai->id] = false;
>>  		if (rc < 0)
>> -			dev_err(dai->dev, "fail to close APM port (%d)\n", rc);
>> +			dev_err(dai->dev, "fail to stop APM port (%d)\n", rc);
> 
> Might also make it "failed" while at it?
> 
Yep

--srini
> Konrad

