Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739D63AEF53
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776076100; cv=none; b=GYGLEnMe7VR7iW2AgO7QKMuQFzXyDlNJjGEHtvnYEdf1zkVHWerbM7vo7u/kgfT85l7JYDT7Jqzli38Y0vVaTgEaKPdcLC+D40oAo4ZbfgtfuR24tgy8bIHvYZjstSYSK0xbyjDlPJLuI5zXvw8aMwwg2uYR7b4jgqf/5XpWUAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776076100; c=relaxed/simple;
	bh=520HCNzNl1sWOG6nBPlnTcUG1Z5hSl2ONS7atA+WwXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=awH51oAVmsgegdmVzYS0rKAh7d2F89Th/cdUJ0gjXLXvfaeJGopitdFbFv9cHNhI4s0g5T/8hLutMyjiN+4NIZPvLQPQ6aL3YFZFp+z3I816dzbRLe4CSk6z61mp5MnqVHkqDSeggiTPuIPO4LX35UgHLJSkcLd8oNsp5eHUlus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPTLfc6i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WWDOJVv4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPTLfc6i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WWDOJVv4"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D602bi543317
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 10:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POTznDhCFEZb5zSxtLI3VxuWht6Xmf6BEG55kx/hiMo=; b=JPTLfc6ihCvUXklV
	zPsQByhevPPGW8pbJThF21oDNzBTXVf0tTaUAmT5EDIr3ax/BKyTKOVOMk2HP/pe
	Awi3MU84hjIPqg1ioEkOIFOzMUnt8PhK00wDXQjqjiSXDResir15DCzbUteae/l4
	/VCbMjoJr8B55X3NL21uZNXIqE00vBGThzuXvh95g/OQuqynQWENXV60EZ0zrMqJ
	nEEtBx8uJ8exF3zW9wsq/uoat1CyvptM9FWj5vY3hcSkGHgNUEb/TrGu9qoFcKgt
	wzgUKbd9jcgKqnHfnlPcSLBKLsnki7VxM0OFQprO6jGG1wdQQLU+Jprn23GFvfG6
	F6ilXg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfexfvwby-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 10:28:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b9074bd42so11612011cf.0
        for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 03:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776076098; x=1776680898; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=POTznDhCFEZb5zSxtLI3VxuWht6Xmf6BEG55kx/hiMo=;
        b=WWDOJVv4CgWY3L4toCFM3LKlaZQ5V0+pJpClckX/6Qu/Oex/O0eLYqD3BPqRXX4r31
         +8w5wzfaTfHseZWwdzrbMAZwYkaVGe3lKv2t1KavQfJvkjVccPXINUvt8QDFEdV+F4+m
         EvimDLj+gcflKj7orZywrdgsG5zMGACW6O3W/2QVdGbcQrk11ODA4EWzITu37UVCfw8G
         pW16IerHdj6ZatNCwj6naP7aa3Z1jhpEqBdXEkaP5eYBHYdFSF+cqw/PGIvUqE/HCk8F
         RIxbBcqmXwRnzrFFkEbNoFEc/fN8mBAqymQS8HbJ0rCH1DPoAdhMiUETX0YM6s5+G8R9
         6rFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776076098; x=1776680898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=POTznDhCFEZb5zSxtLI3VxuWht6Xmf6BEG55kx/hiMo=;
        b=iNXxUT16BkB4IoHuX2raQNhQE0vHt++g8jnpqyeqPAGWTOmId3k0nr8Py9o5v0OTYM
         iX2oabU41Fd1wSIhFYY3oE3WPpaZ7bvXjRhK6jmaFQwnFA9WqYFEjsmmZ0KzjafxW2qX
         p02LzTVk0jcl7z3QNKaWNnDkxVpKtCC1AOlQRybDnBpl0E3PZaP93Rp1v4WEgq9nEALm
         oJwFM9v4p7PvbdSpyFw0wntlciMRnKLPaAuZIya8Hm7Fi+an9X/zhSIQlrJTqtKCQGtf
         Lz4RcktVLB9AxKpufY94ikWe4O/bZcpRLadOmeYJ7lr1awUoI/eX33Ug277+N7fj3zHM
         ksJw==
X-Forwarded-Encrypted: i=1; AFNElJ/rdvkFrSZ4CeOTGjSoP2XCLlbl8Js+gi1xTlg/dX9QktdBJMJCe7LEht1HbU0+D6Hj8qSZFIVKkYMZhw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs59FyDEYpvoIDMKjGSigucoAo9oUKrX3DXK5lsUxDW8MlqUIa
	EA5x2nnb+EnJNpAJ87DLO8/7uKaevYXeocaltzbhzx9Gkq5LIdpeOxn34q3CImHKP1P2c0vbZEW
	bF6axSeGZ4TNlSZXo5z5ulCeaEhpN65uOY0XtViZy/uaup2ezRaA0iYh1RCnhPWR/zg==
X-Gm-Gg: AeBDiesH/d+Qjd11Evv9KTusPUqrW9/5iKVSCpRBEL/x8iCXQvDjJ9L7tI1jTXN53XK
	UkjTAufT58KaNKpItMD9awpJjTvrYWmjxDW87DPVjwmI35cM87QW2l+ZsD6x7XoY+gyRzdLkBzS
	9fcPSeVbxQrzaxFF28nyg9g488xXGqi0mjAo8f30aitZor2IrSkg6ISCEkr4d3P7RjAUiKLz5VX
	drcN8CWCPtUQTcfGmrGHnmzm5ddjtWKjiEOnl9uYSq86UDkaELLynfNATdHrO4aXRZU6f/T+aZ+
	+tTKlVJjgbfIBdP8pRwUtLXQ/6oCrDcHyjjt47NewaV7y8Ix7KLqH5l0Ffy1nmE7Q2ew90aDz1h
	lQvXJ1WZgLJMHc9GsYH6Xx8/zaB3eIsjHQASUjLPtihYZRBPImy7IUU42Lta/U3zMnQe04nSGQR
	pOeRw=
X-Received: by 2002:a05:622a:13c9:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50dd5c80b59mr136426491cf.7.1776076097876;
        Mon, 13 Apr 2026 03:28:17 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:50b:92cc:f879 with SMTP id d75a77b69052e-50dd5c80b59mr136426291cf.7.1776076097418;
        Mon, 13 Apr 2026 03:28:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1765sm288699266b.56.2026.04.13.03.28.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 03:28:16 -0700 (PDT)
Message-ID: <17466128-d838-4621-ad23-21b0975d85c1@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 12:28:14 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Enable
 USB 3.0 and HDMI ports
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Judy Hsiao <judyhsiao@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-sound@vger.kernel.org
References: <20260407-dragon-q6a-feat-fixes-v1-0-14aca49dde3d@radxa.com>
 <20260407-dragon-q6a-feat-fixes-v1-3-14aca49dde3d@radxa.com>
 <eb745e3f-4bc6-4713-97aa-1a1a584c9a9d@oss.qualcomm.com>
 <63630053AE2A689C+fc86c1c4-8daa-4af8-bf64-b432fc8dc1c0@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <63630053AE2A689C+fc86c1c4-8daa-4af8-bf64-b432fc8dc1c0@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: USj65K-XwAAQChIqCH6JuY92VMWlQznQ
X-Authority-Analysis: v=2.4 cv=OpZ/DS/t c=1 sm=1 tr=0 ts=69dcc542 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Asw1XGY1sTAMn24vslgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: USj65K-XwAAQChIqCH6JuY92VMWlQznQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDEwMyBTYWx0ZWRfX7dhh8U3xWEyb
 l/+nTjjnTypQSbAkSiX6aKbkg2io+9BuaXCC9Bh6bKIkS5JVLUHh5IfivGHFdQg7Wry2i62ePtf
 LH+5h3diac7VbqL2QX36/a4HLa7kCXlfO5/CQFznZ9oJyRO6Hw6NZuo3vouuNszq7MIouA/qYOd
 nYStg7iOrN2pmF1tZ7Xl5lRQ2xNVqFU15ObccpRYYL9dL/HqJGrgcYm4T8AAbtzjV9AC5EjgHJg
 7twiSQk3t3DAAONsRZf1dduCzIOKMCn21l/O80omGHQ/BgEC22ZsEw9jW/YKpnJs1Fwtvunf3t/
 Cjc2WrzwfluIQ7YuLNv8cvo6ETFmUNpU3ZFm7MMwesyWVNBF0jSIdKrAOyT5MFGAddZseRp+iqr
 VVqyFp/8zsn9sL9ZBPg0DqlwTwMUMidbXZicZ+ekVtw9Nmj+d1Zm7dlLgTpVEhkdg18EER9Lto/
 abyEYf46e0yZWXCG9+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130103

On 4/12/26 5:14 AM, Xilin Wu wrote:
> On 4/8/2026 5:03 PM, Konrad Dybcio wrote:
>> On 4/7/26 5:19 PM, Xilin Wu wrote:
>>> This board doesn't feature a regular Type-C port. The usb_1_qmpphy's
>>
>> I guess the receptacle on board is power-only?
> 
> Yes. The Type-C port is power only.

[...]

>>> +&mdss_dp {
>>> +    sound-name-prefix = "Display Port0";
>>
>> Hmmmmm.. other platforms call it "DisplayPort0" (without a space)..
>> But I suppose this name needs to match UCM..
>>
>> We'd also normally push this property to the SoC DTSI
> 
> Actually I don't think the name is used in UCM. I can rename it and push the property to SoC DTSI if necessary.

Let's do that

Konrad
