Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269E146DFE7
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 16:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650774; cv=none; b=C45cYAZaitlNtEiZDgMWYUYZtV+eIHao/EOLUjGH6/kVOkkcRbFA/7Ow/61T99ZnYv7u4PBqXsnZq11YEDZhgLapilZTof24v0toNNivkHee65qsBLUKILdgv6cFmN9Y9BD/eki/WaJ6fhjc/rWBCQHWn7e8BrMSBzq7ktgAG8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650774; c=relaxed/simple;
	bh=GD63EepOL1WUVqIWbQ/pkPgIFcUhv0ajMSyu8YwE7gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O6kpT3wV/qWltrq9BNKlHMTSu+KmecAPHPESEp+YstY+sE5wKFNk/u9Dame/aTm5Bpx0i+dEsarQdgtRwWOEP4hwbC7KMzvwJvuG680cCjYXYD/k4tv4ygp0FB0vsgUc2C/s8ydCL9zItyx6nCviqyYcAwd2uwfqcNbsaL7pJEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DvvHRGoL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TBWqntUY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvvHRGoL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TBWqntUY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LDfxBl1707330
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 16:19:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dTV6MHViCvNQyXCxsNNT5/4KQPDVAbuTpKtQfF4tMJ0=; b=DvvHRGoLDn4/ZEUY
	cm/d2ANvj3Ft4nNNFwuJSRO8WjuRUUCCMEFP9scVMvKffLEtQZQVfg3uEERJiQW8
	FoI0xuJSAuk0LBUSQlIaH+qFJmqf3EcfgvAkZClXoqVitdy3PjD+4jmuap7O5e/7
	Ul64BFk1MY4W8597sS7Rp5/Z3eXX0P2SE7c68upSk60ZfIdVjBlXLwfhvzgYEN1/
	Iy18V5f6P73FgXA6FfaLbE7ulT2i9iXuwr3o/JES+c++v8kdTwGN+Jdhqj0i8O1D
	h/AyAu+PzIG/uZzdUv6f2mBhG2McC4bxSb2LIJqCG0cP4yMRuBo5SHLmnhKxkNlx
	CQZGKA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9ae903g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 16:19:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c892143db7fso7098463a12.1
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 09:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784650771; x=1785255571; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTV6MHViCvNQyXCxsNNT5/4KQPDVAbuTpKtQfF4tMJ0=;
        b=TBWqntUYIqiLic0nsIF6vguhkFPZ+DVsMXy2E84glt4WMSp+jzJGoKKO4eWbAg3gr4
         p3Z8rWJs9RRU4goexBBGIelEgQaWV0T1bZGc+EerT/3KhU9yXuqOKf99yDBB4Sg4xP7m
         icjOuCHwvs/lCBdu3qJjjNh0ca24dRfg3quQ2YY8BH22TQFmUGIvVVY60sHeND6GtAqd
         BqqVzc3BBrRw1kRHnlfbcE0YYOw1U+pzZMgrlOw+m6l9QGvQxlcXFzxAOC6CrsdEzD/R
         /V7Ew8M8HaXnfZyq9mY/wPaP8AG5UxkY7o9UZ//v+82yT6HilPsvlLJA+01JEWnrBOCs
         bt5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650771; x=1785255571;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dTV6MHViCvNQyXCxsNNT5/4KQPDVAbuTpKtQfF4tMJ0=;
        b=qZvKI+ljaqNfwZJFneT5urghS00UmqTHNhfJvBprGdArJg/vxvdwqTCljDn9U/uQ5d
         S4/8eqNlVCfSISiljBjZRNydzXgWyg6ZtIB9ch2oAfm9W7pP4hFpBlTe2cUt0fuM85H7
         3KrKObkPPirBQzWBZFkAN9arH/HtFGh2PE6D7oo2kKmBtq1VIW1YVxaeqsdRO8hGBRNo
         NKFpePvWKpxk+6KbvePFCCtq9DPgKZTewYUyAYwvBulMRft5gjlGPui4qJRHWoJLJbQu
         C5u8DI4hV97yNTJjcTEjBeP4cTACjFWDTLe6a2H/Lffx1NMvO6ROjrpP2MqzX49NFluB
         WhVw==
X-Forwarded-Encrypted: i=1; AHgh+Rr3rfRkai2xf4kHeDh492dxnaaW1wX5h3Y7iNW4YH2o3yxLYnVrrr3W5ZV5tfzXJl6GbSu36s9b+FoEPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+cDm4Mgrk7OWsW8WJ35HoesV11vm151DrRcOMcRAX2Iind+6b
	GtXRgpHyHduCRAce9ZHJ6mrtGzmZq1VV8rPVXVBUVC6vqPIcS+A+diZp7cNDIjqaAimb8Y76lYR
	j3P++M6KEUbe8SOcyyBtTc95XNbegC7TM9J18JLOJ6jjVpPhTweLXEjkvS7IIVysDgg==
X-Gm-Gg: AfdE7ckozS8Fw9cs/mZjY8e0PmAXWynLrAga5VMmmwiODTEp7huXIkY5cypgUMQTEWx
	CPNwlMy018z0Hp01nTcQlgwDFNGrWJVsbrr3K0zPRo6XYkgsllV3uFAwrWzp1u3aLuKkXtuatfa
	C7ugk5Etrgc1JuDe1bq3/piipUzaKmctVX1Og9WlYknrc8yV/3nBsrxY8jtxTBF1r0Xn1AFFTxG
	SOJ9yFfsd2hoRFPA1wRNsX3JbyUH/NWv4PQgYjW72TAaQSJIBwBy15zJypAMK+ogl3HMfevdDGA
	7jijEuYH7EIwejcjCfXApPG4rcQvlx5CyD4BEKTSj/go62cOpvFYOaAPT63Syk/gRung6Zwqrqa
	3F2fBtq+M6oOA8IBgimgBL+CjeaDRfwsDiJo=
X-Received: by 2002:a05:6a20:d52b:b0:3c3:9698:daff with SMTP id adf61e73a8af0-3c3ada42d88mr19050792637.68.1784650770803;
        Tue, 21 Jul 2026 09:19:30 -0700 (PDT)
X-Received: by 2002:a05:6a20:d52b:b0:3c3:9698:daff with SMTP id adf61e73a8af0-3c3ada42d88mr19050752637.68.1784650770221;
        Tue, 21 Jul 2026 09:19:30 -0700 (PDT)
Received: from [192.168.0.105] ([49.204.17.188])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e07000fsm792534eec.21.2026.07.21.09.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 09:19:29 -0700 (PDT)
Message-ID: <2d87ed0e-e007-4372-a535-6111468179cc@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 21:49:21 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] ASoC: dt-bindings: qcom: add LPASS LPR vote clock
 ID
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
 <20260720130511.493295-2-prasad.kumpatla@oss.qualcomm.com>
 <20260721-proficient-witty-curassow-e203a6@quoll>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260721-proficient-witty-curassow-e203a6@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3fMwrkt-PrsTuhB1pc2abULFncOQ3Yd3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE3MiBTYWx0ZWRfX0aJhhFCeObaS
 0lB93+yrt+mRtzUxS3aHEEc8pD5ffTX8uzinRzSam79wU6FYKmuq5+y8xRROcmAhQh0tSnVjbs5
 /SVxl3fwoKfKtLRSaQhFApgqpTlpEe4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE3MiBTYWx0ZWRfX21CveInBqeP1
 +EyDBAkwpbjumVZiFpjV8PEyP7Z6el0DKevlV1MnmxyN7Cf35R3XNQ+CcdeESahUlwIX+CWYFrC
 g6lo3SnP/ib/8nwdb2pdjqNx0LvbmYpoYwLfVBRPYn4d+qx3AKrw3rSlvu4++5rO1kNhKY3AVB7
 T+iGhMffhojev0L/c9PikH4vIpgtsoBMZIl2uYCUACPAaP6C6cLEuRjs6rStRqaZxDHW/tpdOFj
 U0xJlnaT8CMVhas6KM3pMKWq/+jJqCSwCwnf2tBrSJ6XU+Rh0kiEQ+yKgRUfKbbX0R4wz9yDPk3
 FV8nw3KQEIp1+8m8Ao3gIEbDoHLfuhHaqJRM2vJ1UqhzmwVT3km+1UyGknc07abAS1bU2jncDn2
 Rx6fLr433NloH79mDVcLfZDR38AYc4BJfQhsgNXLrCXH5oogvkiJl6P4kJS5Msn9Z05JnZnYA53
 l9IFbT1KZ5r9UKjoNRA==
X-Proofpoint-GUID: 3fMwrkt-PrsTuhB1pc2abULFncOQ3Yd3
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5f9c13 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=/JTPBhwEQko7YaD0RKblyA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=886e80D7AWrxDFE_gbcA:9 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210172


On 7/21/2026 12:28 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 20, 2026 at 06:35:08PM +0530, Prasad Kumpatla wrote:
>> diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> index 45850f2d4..ce5e8589d 100644
>> --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>> @@ -236,8 +236,8 @@
>>   #define LPASS_HW_AVTIMER_VOTE		101
>>   #define LPASS_HW_MACRO_VOTE		102
>>   #define LPASS_HW_DCODEC_VOTE		103
>> +#define LPASS_HW_LPR_VOTE		104
>>   
>> -#define Q6AFE_MAX_CLK_ID			104
> That's a separate patch.

Thanks for pointing that out. I'll keep LPASS_HW_LPR_VOTE
as is in this series and move the removal of the unused
Q6AFE_MAX_CLK_ID define to a separate cleanup patch.

Thanks,
Prasad
>
> Best regards,
> Krzysztof
>
