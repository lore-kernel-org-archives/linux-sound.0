Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9131552FD
	for <linux-sound@vger.kernel.org>; Sat,  5 Apr 2025 17:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743874075; cv=none; b=RMdjidEkv55KIpL0iIW5T2pvEL/qgvgLCQc53Z1dLyVXup3uT32FQ+aBXplntGo+E8UTzNVrhtZgxskqunmX/841aKZJvMQh91V5XnY85OZwtHfjW1kRlekRSCxDK00sQ4IQnLst4VMggNHexB3C/5pNJ84IrDpU9q294JLjBEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743874075; c=relaxed/simple;
	bh=WzPNIG8S7EkLyB4wTk65d9ihG81GOrOkBB58wKZnCyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rk6wpYD3VXs3CbVVwtrABUqVtkVDKfGC6QY2XYzx4K7JGy/1PlbURjAUONktZ/LeFCNTWJ78ZcbfMtbz27n+ppKPErGV1JUnDc0h5ilPodmI3GAyAKzB/pO/ehnncH/Zbn7cBY8kpWijrwnUZ0iil1HzjxdCy2Hx3ahRWWftmvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1QBDPTC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1QBDPTC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 535Ce4XF015136
	for <linux-sound@vger.kernel.org>; Sat, 5 Apr 2025 17:27:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5UrBqYYL10LEBTum6m4Xhl+Wzvt7NLtyyRegDCKdfw=; b=X1QBDPTCvrcB4Uzf
	nvoFTh9+7tiHbmPvw0HjUvUEMEljd+Oz/kM4lfoP2eJZe4IhLEBU872mub6V7AHK
	/Ewp64+Mx4MjcB1eUYnq4K3L9D/Aj+i6QKFek5jcTjmSns09bQ90uzE2Ue0Vy5f1
	I+JPnjomlG+V6ZdphbPjNnVPMegL+QFVMszxT64z+MsYMz3VE//rrfHM2hfguR9v
	WJjRwGkyBGi71VMTt2LwL3mEG11nSiMjjgCDZR3sbOhA+BZqx+kxXZSZfSaVXLVo
	CpeTojgQRMJWNpyuXMlUP7E4jyghOVen222GQrqXnaxBs24//c/I7HEQmqQilCYc
	8mrl/g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpm0shh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 05 Apr 2025 17:27:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5ac559cbaso588661385a.1
        for <linux-sound@vger.kernel.org>; Sat, 05 Apr 2025 10:27:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743874070; x=1744478870;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C5UrBqYYL10LEBTum6m4Xhl+Wzvt7NLtyyRegDCKdfw=;
        b=gsFzSLizj9ftOhJu9B9kpiM5z484H7Jn3+nSDkuWYTy4sINrD1d/Y/ZLcYZhTj4vdQ
         bR4pO8Jy+aFtek8/l/Ll6Jvf7PRVqjjXltbPhByJ+MjhQKTFJMVR2EHBXdVOis12TF9E
         PTnIdwal/Yb3vB4UDuyRIG32J4UAK93bPOHQChpCoyQWSNOYYxz9K5PPjt/p1xbinffM
         7ADAeLWbhXkioIpqHjfrVy+ArWLtJiD3gTq0X6DBMEXLmPFecqPc1sG/mmR9wTjovuuu
         YZ+u1AGlko4W28lMSslcZGWLSyjq5FwLnKdFMDmAaTB8nJs7eE5XIMXGklT4ZABBy22z
         FdIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw4TIcvd2AeVe+7NGUqg4uScMgfJq1XjGriDjAjrhILcRWrqNzYSLYj7Khplt3YotktvRCZ7pTE/uPwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8X8Kz2j+nu42zPGAqa9pnwAD6fLkwmJVjIz06RIPpEWXB4OTB
	koXDpdAYVC7rPqbE4kNzlh28IfbTRbFoWH8KhX9T80ESlc4haJIOd2hKGb/5eSw7AV+ANeRYbFC
	U5kCT/w8BBxryMtqZmXVijH7DRDlIPj2suG538yRe2mIAhS71sD1k/HF2d7cr+w==
X-Gm-Gg: ASbGncsA2CxgFyRR33cwx+fdjyC0FkbzO364I0xHIL8VHpmVJFevKCiIqyE0OpdahMJ
	9pNpsQUxvgtXzMVEMjGgem9OKDLf6YlpQTVSinFzjTj6JdiZZZmEUuCDm9fReerdtQG/A/iycSU
	WHeMM6Dwln4+qTqHQKeOf99Hq6bhVu37H4bL4g2WfCCbEOIbVRUP/7mzFwy1SIuDE7uMmysOsbP
	nuN/y27GEelO1mk4tsIzSNMSAeVub+EDAnySkU+nLwlHhwLr89D5xLfPvBQWln1o5FfCFNpe/SM
	sSD0HkN3IM/WYGwYocooZhgnJM/903Pad82IgiT1xtPgJn+adwRnf+5RsxQ0JzBES36U
X-Received: by 2002:a05:620a:440f:b0:7c5:4711:dc56 with SMTP id af79cd13be357-7c77de01d44mr567519285a.48.1743874070508;
        Sat, 05 Apr 2025 10:27:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHafMbZ8BW3LW+4OJQutAKH0ZMvi8+bi8/F+SD5nICOagJ0fwxXZbQOXQE2zRrHoVp4J93XJA==
X-Received: by 2002:a05:620a:440f:b0:7c5:4711:dc56 with SMTP id af79cd13be357-7c77de01d44mr567515885a.48.1743874070163;
        Sat, 05 Apr 2025 10:27:50 -0700 (PDT)
Received: from [10.160.109.143] (87-95-81-170.bb.dnainternet.fi. [87.95.81.170])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f0313f2desm9387941fa.28.2025.04.05.10.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Apr 2025 10:27:49 -0700 (PDT)
Message-ID: <6e135e55-b5e4-4ead-85ba-29c2cd6aa7a2@oss.qualcomm.com>
Date: Sat, 5 Apr 2025 20:27:47 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/6] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Johan Hovold <johan@kernel.org>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
        krzk+dt@kernel.org, ivprusov@salutedevices.com,
        luca.ceresoli@bootlin.com, zhoubinbin@loongson.cn,
        paulha@opensource.cirrus.com, lgirdwood@gmail.com, robh@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, perex@perex.cz,
        tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
        Christopher Obbard <christopher.obbard@linaro.org>
References: <20250327100633.11530-1-srinivas.kandagatla@linaro.org>
 <20250327100633.11530-6-srinivas.kandagatla@linaro.org>
 <Z-z_ZAyVBK5ui50k@hovoldconsulting.com>
 <8613cf45-d202-4577-868c-8caf771c7bc4@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <8613cf45-d202-4577-868c-8caf771c7bc4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1XOyMEi_H3NwuUGRBAHX_Kv4BFMslU-r
X-Proofpoint-ORIG-GUID: 1XOyMEi_H3NwuUGRBAHX_Kv4BFMslU-r
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f16817 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=YfwyiRVFF7VR29Me/gQaHA==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=D19gQVrFAAAA:8 a=gjPlNVnwJrpBRyZBAVEA:9 a=lqcHg5cX4UMA:10
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=ImwWUX5h3JJ3gRE9moBe:22 a=z2U-W3hJrleVIN9YIjzO:22 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=W4TVW4IDbPiebHqcZpNg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-05_07,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=900 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504050113

On 03/04/2025 15:19, Srinivas Kandagatla wrote:
> 
> 
> On 02/04/2025 10:12, Johan Hovold wrote:
>> On Thu, Mar 27, 2025 at 10:06:32AM +0000, Srinivas Kandagatla wrote:
>>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>>
>>> On some platforms to minimise pop and click during switching between
>>> CTIA and OMTP headset an additional HiFi mux is used. Most common
>>> case is that this switch is switched on by default, but on some
>>> platforms this needs a regulator enable.
>>>
>>> move to using mux control to enable both regulator and handle gpios,
>>> deprecate the usage of gpio.
>>>
>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
>>
>>> @@ -3261,11 +3276,26 @@ static int wcd938x_populate_dt_data(struct 
>>> wcd938x_priv *wcd938x, struct device
>>>           return dev_err_probe(dev, wcd938x->reset_gpio,
>>>                        "Failed to get reset gpio\n");
>>> -    wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
>>> -                        GPIOD_OUT_LOW);
>>> -    if (IS_ERR(wcd938x->us_euro_gpio))
>>> -        return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
>>> -                     "us-euro swap Control GPIO not found\n");
>>> +    wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
>>
> Thanks Johan,
>> Running with this patch on the CRD I noticed that this now prints an
>> error as there is no optional mux (or gpio) defined:
>>
>>     wcd938x_codec audio-codec: /audio-codec: failed to get mux-control 
>> (0)
> 
> This is not from codec driver, mux control is throwing up this.
> 
>>
>> You need to suppress that error in mux_get() to allow for optional muxes
>> to be looked up like this.
> I have a plan for this,
> 
> I proposed some changes to mux api for exclusive apis at https:// 
> lkml.org/lkml/2025/3/26/955
> 
> This should also allow us to easily add an optional api, which I plan to 
> do once i get some feedback on this patch.

I'd rather suggest an API to switch the state without deselecting the 
the mux.

> 
> --srini
> 
>>

-- 
With best wishes
Dmitry
