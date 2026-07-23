Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B47144162A
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 13:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784813301; cv=none; b=FPpoZDFZ0+AQvmOOFg4G6Tixe1nXqUVzEwe81pNjGiiSlpycR7IPIPG5wMA5dMDsdDqSM6uQRw4ug/2/Nmlf55xIgF95Gyfw5WHnaHxGWR0yZzSIoctp7A+EsP0BZLlpZf0UBeOX8wRl0vxbNvVG29gixo5EdTH7okFE6bgna3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784813301; c=relaxed/simple;
	bh=Z2UrH0wyQBTZ917v/3gXQdeCvruhadYDbZbcpPU/kSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C6+litutNwAO2mBeFr/TXbe9UfGkJ7y0vjIOSCBczTfecBaHurzS+TyVmJqrGs1QOD7PRg/Aj4Vgp3es+CKOVSNWUwbexY+ALP99YIG8IJJn734zwlmlORfgbkGR4RRCGlhhCltirII0M5jlMaZ2SFcjqvN4XF4EjiH3Ew3aCf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcVEBWCu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HsSXRki3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcVEBWCu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HsSXRki3"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NCvmUD4050244
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 13:28:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XIgmdf54NbogG/48l7NlCZuTIEYiNwBZtthxtqWw4qo=; b=HcVEBWCuCZ1oJMnq
	06sYT8ragu/lECaIKsJyRqh+jOAe836k2EKTs17/uwqU8Q98DTDR0D6YCLXYKZDm
	rH1vOcrXwlKKiSm1IOb3Y6PiqMxfoMrNz95WjHrskTe8zkX8nSmGvfV5RXHdpP4c
	DrhEHxW0gfkIuqfH4n8gU5GrJvBdG73BRMQROKpqXeUifrV4OAH2T8+NM2H2fmE0
	HToP8nlekWTAFGcpcdOwwz0IfMgHxhruapjthWnhRELb3VCl9JyWuGb5ylSTQaj7
	lZ/NDpSM/9BnaeuLc91M6KtchlMZA/+E6Fjf9OUlBZjnAbPhwNUPPxOQ2/ygWJod
	hmDEhA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk28vmau4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 13:28:18 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c075c1e25so10207151cf.3
        for <linux-sound@vger.kernel.org>; Thu, 23 Jul 2026 06:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784813298; x=1785418098; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XIgmdf54NbogG/48l7NlCZuTIEYiNwBZtthxtqWw4qo=;
        b=HsSXRki3k0O9rIGDpPUfGaztqWtR5rNyFUJ6GagvQWDGGvHr9Uzs4OyZnoa7IeDZdb
         fQShMIS684M1k9HcqvqruTJIntC9Gr7ZNnJsiFgQEYQ9YNAjoZ5iYOz01onY8NRK0zTH
         N2qe9/KJNCaqQPv6PyHSIozMBi/nTIR6SgBgLuQ5inT18ODOMJxWI+xuplgn3dlEJSZV
         +J1yyhQIvogYTXTEln0kZ1QwixMLo156TEtATxbW26vj1HguE5QHi/wsEWaMrLUjhVMK
         mWcLO/D6/MQjbgxTavzZMKaLj0lAApcxf0lF9zFcGgHISGL0tPPr07O5Y/6vvr8ugasz
         nv0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784813298; x=1785418098;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XIgmdf54NbogG/48l7NlCZuTIEYiNwBZtthxtqWw4qo=;
        b=Cp+tQjJGoVsmDOGeuETw+2Yni+v6Sy1AMOI7qgKpnGC3v6rMDmWhTQFI1Pw2ab53d3
         Yvln9c8OCpS7zkzrO2U+USgUN8mxkoEyPEb0y2x5RJT+nkLVP+hr6oCmC4sO7tCLgajd
         h/cj6Bd8wJbB8ZwpR0x2DadXUgdCXJyj1obWuBIgy74mZeajsLEGXsE6hwKfRc59AYS5
         alfq45KVuy5P/BYgNCcnSKIdGZ86GVHs5ezikqd9cRinantFZsNCn2Qyngc/wnKo+LWg
         z94oz0WZN92q6j2jMaX37NrD6x4W39Q2WLEgLmR2gWjqlxO3wXjx+/z2HMPGSXjnNBEM
         o1MA==
X-Forwarded-Encrypted: i=1; AHgh+Rp+J9X7NXmNpQW2vTlzYO/weFvpcUrlgT1V7mkJ8mhsnWs7uG1q/mrAltRjUh7ZnDembF0hO/Tx48E0Sw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzd+myRfvlc4AqyBl5RPXaxIYRTnED+0hdlHlL1GRHErGeIJBg6
	9Zl2HIuLkzrKL3R8/6TCpGRsmoZO9xlWuxZp7bavHs+eMu7cHYIKBuLZrbC601VsX8dRhM1bM+N
	XBS/YHRDvTbAfAXNU0a2PrrSTLVsAsmvWNNtM8ssfbXlNnZTi1HEaQ3xOFSxXmodjKg==
X-Gm-Gg: AR+sD13Xjm9UQE8sCu+XckVgTp6go2b/CdOs7GRcptBHIDNMghGaxBG4B9ZYEsfqSgL
	WZQZzIMGTyZaZcR2amYWZJNxpE5m1C6EPiP52E0vmAIVh86TkTcYyWxCullntr8nNPtnMomzWNK
	CSakqAB9wZU/k1qRxHktdUexH6YJnaQOL94y8RuGZ1GcEfcTJ9kv9sJLxQP32AJjXkDA7ZEWrMn
	YV54qe4vXgT7FkHhPyivO3xj6NN0gnwKOFwuFcMJG0Ow6aPdD4UusFNJsHl7XRfR81rGKIY7kk6
	SFf0hOHyLGrRcHabr5KMnvtn4c606Bm0fta74li+UjmKeqMPG87qMLiB07J5LKiyLm/cUdIpQeI
	IcWfmql4qJ83ILquAXnn923qv+KI=
X-Received: by 2002:a05:622a:580c:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-5283df4fe14mr26721601cf.65.1784813298103;
        Thu, 23 Jul 2026 06:28:18 -0700 (PDT)
X-Received: by 2002:a05:622a:580c:b0:51a:8c9c:7f3e with SMTP id d75a77b69052e-5283df4fe14mr26717821cf.65.1784813292870;
        Thu, 23 Jul 2026 06:28:12 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f85c6e9a2sm15724988f8f.35.2026.07.23.06.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2026 06:28:12 -0700 (PDT)
Message-ID: <8d7ee8d0-66bb-4420-9e1d-615557dac277@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 14:28:11 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 7/8] dt-bindings: sound: qcom: add Tambora WCD9378
 SDCA codec
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org
References: <20260722234221.884765-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260722234221.884765-8-srinivas.kandagatla@oss.qualcomm.com>
 <dd22171f-7444-4c17-bcc9-f337fe9677c3@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <dd22171f-7444-4c17-bcc9-f337fe9677c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEzMiBTYWx0ZWRfX/M1UFdgFq/7R
 3OIIS+tQ24cFNvKv/ScA7/Xtu9sk3Bx9+AFme2ikBpwl/+J54u8Jpkie73WU2FY0FmSMmKsodG8
 Pwr21ROfT7X36YwO9sBQY5JGLvzeNeg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEzMiBTYWx0ZWRfXxW4x8H1jXFWp
 jbIwOWoqWZbbE3x6W1UkYombYSe5ki0fQn8T+Zj66OPjqEeocBM1cbIcdx99hxKn95DQCrpjphG
 aM8VIU845wYiJjGnxcmwEwGuaS0+z/2+1k+PgoGElVUE9vmoYW69Ga1Q+cbbp6079cnb2TChcx0
 UNolfFOB7RErgqHGh8u8p0IYOxGuB5IR+/Wc1NIP7SX3F6624w3UOWMCq8qkxyCM6VJQzamUPbi
 Tnh4KZLkntdLmVdTfxnZy3Z4SWPjno+V0xVgzV3WKRYGWWJ6JsFm4fn6tr1APDxYwYqUxf43eF7
 w7oN11AWRdjdMpcje5udH+dj0ni7oIfGVIFbbe/z+iinez/PEETQUNvp/DZCfVj3YCM5W1yMJk8
 EVKUZMoncVe5X2/NgBAYFiUaKbj1SEkuyYT1WVJyZr5tjccxe8W9mLF+V6BRk5PGz4Scb3omVBj
 4Q+eNhydOABC/QH4mjw==
X-Proofpoint-ORIG-GUID: CIzB686U6ovhWWsZv4mLlBjEgKDb5yR4
X-Proofpoint-GUID: CIzB686U6ovhWWsZv4mLlBjEgKDb5yR4
X-Authority-Analysis: v=2.4 cv=D4V37PRj c=1 sm=1 tr=0 ts=6a6216f2 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=S3N3vgEnnI5FTr6QbakA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230132

On 7/23/26 10:14 AM, Konrad Dybcio wrote:
> On 7/23/26 1:42 AM, Srinivas Kandagatla wrote:
>> Describe the WCD9378 SDCA peripheral node (compatible sdw20217011000)
>> driven by the wcd9378-sdca codec driver for headphone playback, headset
>> mic capture and jack detection via the SimpleJack SDCA function type.
>>
>> WCD9378 codec can be wired up in 2 different modes.
>> "mobile mode" on phone/tablet SoCs is enumerated as tx and rx device,
>> each of which has dedicated control and data lines.
>> "compute mode" on compute platforms such as Glymur is enumerated as
>> single standard MIPI SDCA class device.
> 
> Does this require a different hardware wiring, or is that just a
> difference for the driver? If the latter, can we choose whichever
> mode we want (i.e. use compute mode on the Fairphone or use mobile
> mode on a laptop, depending on what the OS supports)?

AFAIU, Its not possible to change it because its fused and this also
brings in some physical bus level changes to soundwire aswell.
Ex: on compute we have one control lane for 2 soundwire masters driving
4 data lanes. on mobile every soundwire master has dedicated control and
data lanes.. Bottom line is its not possible.

However w.r.t to driver given that is same IP, I wanted to explore if we
can have a single driver for both.


--srini
> 
> Konrad

