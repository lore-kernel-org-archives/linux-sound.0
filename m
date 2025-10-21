Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282F9335061
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 13:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761052444; cv=none; b=mwKZmrhSatlpQpnTibTdEIcqy448ZIchbomn8O8ovhyaCsyQ7m+ynWaPGPLVNWNZRTnkqRRezBYO1fXQToTWkpYeBtq93PqAP8mYIna5LZhAWJLTJkbu/AwdCgPCHNNVyUThI/BWdS94PqWaVyeeRczWa8nX3fUpFkJNInAfh5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761052444; c=relaxed/simple;
	bh=w2i+FxONBXXx3PvM+d1TKTp00ehfZPIgAaTK1j0wkl4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WKrwan8ZBNwx5zXGOJG2nv9LO7h2fB+nudCCf4MaBsLTZEjwb3y9vIp0EFd2ikKa9q0BZultYm8NwUVXKUqTyTyIkrHV+qvvg/sh183gVvDxX6x3WsECI7TeSNT5nKYDlSA6m2JTNZOI3Am9PtViP6vBHT96BBg22tDvVbvRDE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OHYh3WfO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OHYh3WfO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8QTkl020325
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 13:14:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1J3FwMBpLhx8fYWCDWyhBCXacIdXPm0xifRPcXHEaJ8=; b=OHYh3WfONtQnQIWN
	jqNqPFtwtmIP6JuNtltLlO5uECBdbthXS+cv6w0vMPNXrYjgT5OBozJ9FUOWeSF3
	0vVU4zQyf1ABp5ByavV32Z1Yw8QYcFVMMZQMOgSJA9+/jGsbkhevmCz1xVF5rt9D
	dmYUdrckZy/8d/BHg5/j5SvzlJqXwBM9xwMWTRywIVniZ9uSD72wA2TWzyVaXldO
	Tf3ftUzKy/lwH3jKzWcQskpsraeuzVDqItzYJ7YcrrwX54OoOgUSLzxcJ7Gv5yP4
	6jEIIbojQtWjgzoOTtbed8Dg4M/+TVBqcFR6yV0WtdZDRRRDfkwF+rweUBiPzAld
	o4uFRA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3440s1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 13:14:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78e5b6f1296so171479396d6.2
        for <linux-sound@vger.kernel.org>; Tue, 21 Oct 2025 06:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761052441; x=1761657241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1J3FwMBpLhx8fYWCDWyhBCXacIdXPm0xifRPcXHEaJ8=;
        b=RyZcS0jA0gUhD2AtP0NVWLld04N2PBLbQD78edov7fnVjqkDY16gTnvyG8lrsum6KJ
         QxwHfaUDZLmGu1EDwVV7c1p8m2KZtq4LsPrtIj6KOEa5nHXvX2iQ3aB8OeZwJ33P35B7
         cspCMym0Uv4zLsCEEI7g9L/pdfDxK35vNxD40UUqFekpxuvo1lYqFFpMuGID1uD8C0o8
         HdlrJNokfZ5fm5Qt1t6J7lPJkhlTgyOVEIDeVOd5r97UeVOiNXvQro3svm71V32mForx
         NIaB/+FwzLwG4V4VZ4QXfsg2Q5zpAPokZQNFmjMxf9fhV/hzL2HNqz9JjGrN0okjm8Vo
         wOqA==
X-Forwarded-Encrypted: i=1; AJvYcCVYkNzOk/Y3u3RXjwaFs5Ft0TFo8eZzL8k7ZI7m3iEHen41JnIpVfhGlDRzIrHs2QlkVmMMHTnx5Wyc1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiVs/Qqxckf0MELkIM0zZsvebDyBwSvL9luRT6RjL9GWRdy/Pv
	b62o7QnxgZByDc+e+MAFeY5iXCD+MzXLWKXR2z6h8J5aKq6V5nI5h6oHHMrYXkTjCmQZ/UbtzLo
	6zwlHNjESmTvbJTz0RNkTJfVqAhcPtkroNup3KOvXoI4PvvGeBL3U8zMr1fDuX27kVA==
X-Gm-Gg: ASbGncskTEN2SzyGePODXfixfp20XC5xoMyRAzjopsEkrqcKEriuHpGll8XPCk2qLF+
	zaqOeXdkZs6vHoLw6ZfKrbbBXVB13izXwoTnLtk+3pjMEHrtFH3MXSMuscxTwjwcaLv6L8ukKzP
	QF5gq0w4yAF2X3NOl+6uD2fEyVITJy7OEwJqtOj+TIYklaFR3ixaFGaZN1PD6l6PuNi0ljfh0Rz
	bmZWn6ciXldgV/XdShkYIjJQTqYs7bRRfZgkFHEcerDcxEueJ2mEHzGMRSTgi9NPQxO2lYl7fI3
	h7qriy7BWjvsTBE2TKTb0i5NDE2uRyf+byjxtuIZwdeawYJq7Xg5uGmsUJtHVdsbmu3YQWM4UFa
	NT82uXqvG77bVE/FzEYJJnUT2kg==
X-Received: by 2002:ac8:5fd0:0:b0:4df:a3f1:2b41 with SMTP id d75a77b69052e-4e89d2f2d22mr191979301cf.37.1761052440989;
        Tue, 21 Oct 2025 06:14:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMR85aYmO0SlEiPplaQeeABFnTh46S57hFvtLZYcoP7my3aQJA/qcKSdNST7j3T+8HnZ1Sug==
X-Received: by 2002:ac8:5fd0:0:b0:4df:a3f1:2b41 with SMTP id d75a77b69052e-4e89d2f2d22mr191978891cf.37.1761052440479;
        Tue, 21 Oct 2025 06:14:00 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-474949e0a3csm18730905e9.0.2025.10.21.06.13.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 06:14:00 -0700 (PDT)
Message-ID: <450cac8b-598b-4f47-8bf0-43c805038e7c@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 14:13:57 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arm64: dts: qcom: qcm2290: add LPASS LPI pin
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
References: <20251007-rb1_hdmi_audio-v2-0-821b6a705e4c@linaro.org>
 <20251007-rb1_hdmi_audio-v2-3-821b6a705e4c@linaro.org>
 <b6223af9-2d9e-4ccd-b297-79f63167242b@oss.qualcomm.com>
 <DDEN5NSLDIHD.C1IELQW0VOG3@linaro.org>
 <zmi5grjg2znxddqzfsdsr35ad5olj3xgwwt6hvkiaynxzm5z33@gsgrdguj563n>
 <DDO0LYS7UTEW.3A9WGTAA5DKVO@linaro.org>
 <56vmqgrjy3je7omzirxnfxtuocebbj356iaew5thgkagi35464@hh34y7efssow>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <56vmqgrjy3je7omzirxnfxtuocebbj356iaew5thgkagi35464@hh34y7efssow>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: THiydofRyHO3jtrDAjR_sQPWqe4M75K1
X-Proofpoint-ORIG-GUID: THiydofRyHO3jtrDAjR_sQPWqe4M75K1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX3RNNAgj/756m
 qrQdxIqaR9IT8uZbW73refvy2vB6orTRAHJnEklqx8mEeQoxYgna7ok6T7IsLl5b1Y0a0QtqRay
 iIT1Jjuyie1LbZE05IaLgus0ptdanFX//dKIw9Wt9b8lBN3tq+905ziwdyHEYcuaxnFvnf6qBs7
 LT2Fk5OoB2DQFswrPZ1Mt0UsslXu7TuQNbsHzyXav4ZquiIkO65PojLE5Pq0CSl9u1yabeV2uXg
 k9KCNrFG2lv188IYlYcjL88r4l95CCG0yX/Gah6QDiYk4w4tSov7r30Kwp9kaKlG4Xozinu1W5B
 +dRUDwlOUDoloXVlshBMC5LUUY/QZaUTOZNZY7CMP+pEV/mr/BzvT/LNBxi3qMTwyt74PEV6hy8
 j3igY9MSRFLx1xFRHrGuGPkRIdAqdQ==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f7871a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=S47CMrjrQcjTfVtel-AA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-21_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023



On 10/21/25 2:03 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 21, 2025 at 01:56:09PM +0100, Alexey Klimov wrote:
>> On Fri Oct 17, 2025 at 11:42 PM BST, Bjorn Andersson wrote:
>>> On Fri, Oct 10, 2025 at 01:29:38PM +0100, Alexey Klimov wrote:
>>>> On Tue Oct 7, 2025 at 1:39 PM BST, Konrad Dybcio wrote:
>>>>> On 10/7/25 4:03 AM, Alexey Klimov wrote:
>>>>>> Add the Low Power Audio SubSystem Low Power Island (LPASS LPI) pin
>>>>>> controller device node required for audio subsystem on Qualcomm
>>>>>> QRB2210 RB1. QRB2210 is based on qcm2290 which is based on sm6115.
>>>>>>
>>>>>> While at this, also add description of lpi_i2s2 pins (active state)
>>>>>> required for audio playback via HDMI/I2S.
>>>>>>
>>>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>> ---
>>>>>
>>>>> [...]
>>>>>
>>>>>> +			lpi_i2s2_active: lpi-i2s2-active-state {
>>>>>> +				data-pins {
>>>>>> +					pins = "gpio12";
>>>>>> +					function = "i2s2_data";
>>>>>> +					bias-disable;
>>>>>> +					drive-strength = <8>;
>>>>>> +					output-high;
>>>>>
>>>>> I.. doubt output-high is what you want?
>>>>
>>>> Why? Or is it because of some in-kernel gpiod?
>>>>
>>>
>>> What does "output-high" mean for a non-gpio function?
>>
>> This is not efficient. It will be more useful to go straight to
>> the point.
> 
> It is efficient. It makes everybody think about it (and ask the same
> question in future) instead of just depending on maintainers words.
> 
>> This description of pins was taken from Qualcomm downstream code
>> and the similar patch was applied (see provided URL in the prev email).
> 
> And we all know that downstream can be buggy, incomplete, etc.
> 
>> Back to your question -- does it matter here if it is gpio or non-gpio
>> function?
> 
> It does. The I2S data pin is supposed to be toggled in some way by a
> certain IP core. What would it mean if we program output-high? Will the
> pin still be toggled (by the function) or stay pulled up (because of the
> output being programmed)?
I2S lines are configured in push-pull mode which means that the lines
are driven high and low actively, am not sure why output-high is needed
an what it means here as these lines are actively driven by the controller.

@Alexey, what issues do you see without this?

Am not sure if pinctrl driver even cares about this if we are in alt mode.


--srini>

