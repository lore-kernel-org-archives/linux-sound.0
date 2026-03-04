Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AA6384229
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 11:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772624503; cv=none; b=fQ8tmwqUp0pm8MUZRoEg+kT0SBBpgMtQt5asl1lfgiWRZY4Gle5g6/aqA4CNLl85Jlm5VJhbCjbuRxWQppIhN/+glL7+OyZeRB+jSHwDnk03BOmWsejmXBfxf6/UXjAThpU3ciIOcABMlubseL4q53OWvCFJYgRIrJ2mdx1/aGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772624503; c=relaxed/simple;
	bh=laRKSZzJOcudczEnxyhB7fESAI79HWOfFvz3PT5rANE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FoxWp3EooAEH8hEDN4QWfntQbIqOZq6TT8cl59+7wzBuovpFDzlhL7hqpO5uGG7ZoDp/4jLX+uhNwNvXkE5Ba04rw8Tfd+90W3xApFjKONxiS2p5ID3OrulNRtVt0bdxogwZW4I9/lWhUCI6JIIxPLW9FB8/ApXRcWF5lhKeVdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IaXXvbi6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjuI0d26; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IaXXvbi6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjuI0d26"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6246DWrk1203738
	for <linux-sound@vger.kernel.org>; Wed, 4 Mar 2026 11:41:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wexxM3qmEnj1ox1y5EVG6E+IxokiAs5UcnERO1qkx2c=; b=IaXXvbi6sFOMAtxM
	rsDFi90bod0A0pzx567iMgL7ObYwX8OSyl6VH0cDoWHRb26zpBXnekxKYygBZW/j
	BphhhBhoZq9iNdxun7UGO9b9R/QA6iASDEKq4gmubLq5w6Dt81YYoozQsPbenDVH
	wUyeyXJmrJjQTIcR+AO/vcnptEhv/4oxsKic2t4x4WFN4SIMjZhnFfQcjIOTjr7U
	qfPrujdoCwy3MstfGE7qBU8mmyNg2SXPyX112hwcCi91LHiYiGAC5HN7RHnM+l4o
	vMqJKsyroA16J04o1leOOVwMNrhW9nWRxuSlCH5jZPvYbdtCiWA19K3NrrbYyghD
	wjbzaA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpf9c12ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 11:41:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so694864685a.1
        for <linux-sound@vger.kernel.org>; Wed, 04 Mar 2026 03:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772624500; x=1773229300; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wexxM3qmEnj1ox1y5EVG6E+IxokiAs5UcnERO1qkx2c=;
        b=OjuI0d26YTLbQ2sKj5wo7b8NGN6mVMTdb3cKmrEcI1asW6hM+k5dsukH7pjPJDqplm
         9UsA6GejcX2BuUEIIEE4YQATDj2vtTbpMsM6y4jqjTFjcfbcA6NsN/ua2sjclAl8hTPT
         0xAEnB2cA8B4mZ96GqidmKciCDfgbCSsbXA2l/RCZEMSAZ6tzDwViGh8lt3WbO6cOtqV
         bQNFhxZrYAJeYdFhkSC2a1FO/XbB3lMIkF1pFkTtuciVfB9Hv+kvGsVUNLUCUZVHRouO
         iLlVwdlDltTdbPkAzAGYGS41KYQLJScDdGW7VJA5+6dTd3zOjJlo01HJfVxSZ837eChI
         ElKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772624500; x=1773229300;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wexxM3qmEnj1ox1y5EVG6E+IxokiAs5UcnERO1qkx2c=;
        b=q+cJGFS8+J8w58lhQ4FZd2WxCJ9axRGHBUg0s3Wwz/9YE3ITUU3R62Sytqfj6FqBMI
         /X/eQKY7UXvZzkIdBNnUOGNBSCDOJfawsfeEn3PG0PPh+rsiK8tV62MGc1mxN68liMHt
         KKVdkTdwjQDM7/2ebmH8Ysa6Vtt89u6E1LajlElnYcDKDj11j5FCw6LjmdgIsfkCz8Cl
         TLPJ6vnY0FIRt3yhJZg/SzXIXzkU5O0kRyQND17WuYvfGKTWK7mVJzNe/9nGDdrBpxKz
         79psJ9fwGdFsGV7Mqx3BCgyaLHNdqdbah8lXnsqbHdfrBwkOg9BRWiworh0Pmsu7nhm2
         RFVg==
X-Forwarded-Encrypted: i=1; AJvYcCWGfI1OSzMllIFgs1uoPRx8u1V6yQLQ2h9E0mzqRjxJnrMCBBtmDzSeuFKnPzfMu9SdFF+FWIISklajjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMuD+q0ZJYdWkmgH8NRaBIIo4HdCivfbrsSkrGhvO7EmbVrJL7
	kZJ7w3luAYdMIu3WaTI5D6Fmtk36F86yywU7B9PZNz08V1y+t/ZhxhMYCJ2zz2v731TKa8c8XS0
	xIzVWLBtYPJIJ3rRyVdGCvjtLE7PzDBBkOPlSa8cDo7MiKsUwbUae/TyVe+KJjUzyPg==
X-Gm-Gg: ATEYQzy9mAhuKq9TRk/A1tkw1yn4z7tQVNxD/EbIVTtNv9AMGuunZStPnU00mz03zHJ
	xsjvdO2P1EwX2RaTLiJmHaLwwJQKV1EzVNf2lP+ZtWP442/JnQOSQktyslmx0v6qw8N6Vii05Ky
	hieoMJyZnBn9hRfon6fyFFiKIbLYK1eD0G0Eo0HJjmYlM/xmp8Vp2GkpkjCxwKuTGHjNnw/vld5
	ujeG08IUCPy2H3KrCXgzNHhRlSv9pYKPN+V/GOZQc8cHXtAGXSXLVP5WDoxLcmEU8OJTzK6A3XR
	LL/syQqMZQLWdwn22C8FCpzXRZTKgR3G3AgWOmzwRjZ2KkbdEwPTft3TCskzTDtASSCmK7g0DvQ
	Ui5AvN/ZTfcd8F7i8lGwLpQq2aVP9YBLtKQ9jxQq94gQXy1aO
X-Received: by 2002:a05:620a:450f:b0:8ca:3d7c:e765 with SMTP id af79cd13be357-8cd5af84838mr170854685a.50.1772624500398;
        Wed, 04 Mar 2026 03:41:40 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:8ca:3d7c:e765 with SMTP id af79cd13be357-8cd5af84838mr170852585a.50.1772624499883;
        Wed, 04 Mar 2026 03:41:39 -0800 (PST)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4851a8b3f9fsm13101725e9.2.2026.03.04.03.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 03:41:39 -0800 (PST)
Message-ID: <6c0d22c1-0138-461d-82ed-af0cd54d9055@oss.qualcomm.com>
Date: Wed, 4 Mar 2026 11:41:37 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] soundwire: qcom: deprecate qcom,din/out-ports
To: Luca Weiss <luca.weiss@fairphone.com>, robh@kernel.org, krzk+dt@kernel.org,
        vkoul@kernel.org
Cc: conor+dt@kernel.org, srini@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org
References: <20250912083225.228778-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250912083225.228778-5-srinivas.kandagatla@oss.qualcomm.com>
 <DGJTU2TOFZR7.2MOU6I6J8GV4L@fairphone.com>
 <a814c0bf-e421-4cf2-8b9b-e5dac9b80dff@oss.qualcomm.com>
 <DGPQVOVH3N31.2XHZP30TUC18Q@fairphone.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DGPQVOVH3N31.2XHZP30TUC18Q@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDA5MiBTYWx0ZWRfXytULSsXX0Uwr
 eDTVMc+RMA1kWwHmiPs7S9iuRgrf2cN4akIa17afzs6CO3FSN1d5voHspkbjZbBEHZ16fxDvmCP
 UherDBY2rjGlJJxxlnfX2t+OMNwEk4YNSd3eQqNdi5BvK++LI+wk8rgsLybHBAy9VZK3w0sKdZJ
 pVDZeKfOgeIqjzjHFu0QJhvRaKkNMtnHl4tS/VfQrzDT0d1uwerkBzLzEL64II8QjQ38yjD/mzG
 3esY1AmSJ0BV+fLJApzLHHkmu45IB4l9K3cSteLtCKv5p9m6nSiZbIaQNvTIcCgTiN7h85JObpV
 yqlFVojf1KZuTWRd7QFYtdshc8z80Z0gD5F1MpoamXbYjuS70e6zKGa9h+UNujyjTySNBtKNQgq
 IGs5k9VnzHUj0Zapp00yYMv+pICHI6DJIZHkZtRp8hq5KzBEJ+zBeDg/iecVugBWeNuboDCLOCS
 Q47+7nIs/+lxKvnZM0w==
X-Proofpoint-GUID: FdnyyCk5o0y7BXTI3HypeyFUpgCWxnT8
X-Authority-Analysis: v=2.4 cv=S4LUAYsP c=1 sm=1 tr=0 ts=69a81a75 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=rwViMikarWV9ILQPI0UA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: FdnyyCk5o0y7BXTI3HypeyFUpgCWxnT8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040092

On 2/27/26 12:31 PM, Luca Weiss wrote:
> On Sun Feb 22, 2026 at 10:09 AM CET, Srinivas Kandagatla wrote:
>> On 2/20/26 1:34 PM, Luca Weiss wrote:
>>> Hi Srinivas,
>>>
>>> On Fri Sep 12, 2025 at 10:32 AM CEST, Srinivas Kandagatla wrote:
>>>> Number of input and output ports can be dynamically read from the
>>>> controller registers, getting this value from Device Tree is redundant
>>>> and potentially lead to bugs.
>>>>
>>>> Remove the code parsing this property along with marking this as
>>>> deprecated in device tree bindings.
>>>
>>> Could you help suggest how to correct kodiak.dtsi?
>>>
>>
>> This needs fixing in kodiak.dtsi, for somereason the dtsi is trying to
>> add ports that does not clearly reflect the actual hardware.
> 
> How should the qcom,ports-* properties be updated to be correct?
something like below, for kodiak rx soundwire controller.
which has 1 Data in port and 6 data out ports, however the dts is
setting it up with 5 data out ports only, This works because the data
out ports are first in the array, however if we want data in port then
this is going to break.
Overall getting number of din and dout ports from dt is fragile and does
not reflect the actual hardware. In cases where you think that the data
ports are unused for various reasons, you can still set the values are
invalid for that port for a given platform and still populate all the
port information in the dt.

> 
> I'm seeing the same on Milos, where the hardware registers are +1 from
> what downstream describes, in all 4 soundwire controllers there.
> 
> swr_rx (reg=0x03210000):
>     SWRM_COMP_PARAMS din: 1, dout: 6 (=7)
>     (downstream: rx_swr_master - qcom,swr-num-ports = <6>)
This is just an example does not really reflect the frame-shapping info.

It is best defined or overwritten in the board dtsi.


index 6079e67ea829..4fbf3336d2b0 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2702,21 +2702,18 @@ swr0: soundwire@3210000 {
                        clocks = <&lpass_rx_macro>;
                        clock-names = "iface";

-                       qcom,din-ports = <0>;
-                       qcom,dout-ports = <5>;
-
                        resets = <&lpass_audiocc LPASS_AUDIO_SWR_RX_CGCR>;
                        reset-names = "swr_audio_cgcr";

-                       qcom,ports-word-length =        /bits/ 8 <0x01
0x07 0x04 0xff 0xff>;
-                       qcom,ports-sinterval-low =      /bits/ 8 <0x03
0x3f 0x1f 0x03 0x03>;
-                       qcom,ports-offset1 =            /bits/ 8 <0x00
0x00 0x0b 0x01 0x01>;
-                       qcom,ports-offset2 =            /bits/ 8 <0x00
0x00 0x0b 0x00 0x00>;
-                       qcom,ports-lane-control =       /bits/ 8 <0x01
0x00 0x00 0x00 0x00>;
-                       qcom,ports-block-pack-mode =    /bits/ 8 <0xff
0x00 0x01 0xff 0xff>;
-                       qcom,ports-hstart =             /bits/ 8 <0xff
0x03 0xff 0xff 0xff>;
-                       qcom,ports-hstop =              /bits/ 8 <0xff
0x06 0xff 0xff 0xff>;
-                       qcom,ports-block-group-count =  /bits/ 8 <0xff
0xff 0xff 0xff 0x00>;
+                       qcom,ports-word-length =        /bits/ 8 <0x01
0x07 0x04 0xff 0xff 0xff 0xff>;
+                       qcom,ports-sinterval-low =      /bits/ 8 <0x03
0x3f 0x1f 0x03 0x03 0xff 0xff>;
+                       qcom,ports-offset1 =            /bits/ 8 <0x00
0x00 0x0b 0x01 0x01 0xff 0xff>;
+                       qcom,ports-offset2 =            /bits/ 8 <0x00
0x00 0x0b 0x00 0x00 0xff 0xff>;
+                       qcom,ports-lane-control =       /bits/ 8 <0x01
0x00 0x00 0x00 0x00 0xff 0xff>;
+                       qcom,ports-block-pack-mode =    /bits/ 8 <0xff
0x00 0x01 0xff 0xff 0xff 0xff>;
+                       qcom,ports-hstart =             /bits/ 8 <0xff
0x03 0xff 0xff 0xff 0xff 0xff>;
+                       qcom,ports-hstop =              /bits/ 8 <0xff
0x06 0xff 0xff 0xff 0xff 0xff>;
+                       qcom,ports-block-group-count =  /bits/ 8 <0xff
0xff 0xff 0xff 0x00 0xff 0xff>;

                        #sound-dai-cells = <1>;
                        #address-cells = <2>;


--srini
> 
> swr_tx (reg=0x033b0000):
>     SWRM_COMP_PARAMS din: 4, dout: 0 (=4)
>     (downstream va_swr_master - qcom,swr-num-ports = <3>)
> 
> swr_wsa (reg=0x03250000):
>     SWRM_COMP_PARAMS din: 3, dout: 6 (=9)
>     downstream: wsa_swr_master - qcom,swr-num-ports = <8>
> 
> bt_swr (reg=0x031e0000):
>     SWRM_COMP_PARAMS din: 5, dout: 4 (=9)
>     downstream: bt_swr_mstr - qcom,swr-num-ports = <8>
> 
> Regards
> Luca
> 
>>
>> --srini
>>
>>> I'm seeing these warnings on QCM6490:
>>>
>>> [   36.952517] qcom-soundwire 3210000.soundwire: din-ports (0) mismatch with controller (1)
>>> [   36.952524] qcom-soundwire 3210000.soundwire: dout-ports (5) mismatch with controller (6)
>>> [   36.954285] qcom-soundwire 3230000.soundwire: din-ports (3) mismatch with controller (4)
> 

