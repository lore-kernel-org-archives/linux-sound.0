Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776649;
	b=DpcOrneEv9HmMuooMmWUkzP35dt4R1/BqvAgcKEXbhBwI6t+pApnzV9isNl3DUxuqMOA
	 EFL+ydhq+gQrosP0KziNofkwM/1vvOnrlCm2Xke+QRkAM8GswiDW1+I42NUK9isbtJIbK
	 pNdTqBeJIn2yy6xE09UdoYEgiwCdH3uwZxo752QdIojhSHynsgVeZ0+e8mH1TaKgJrS/o
	 5O0x+xqL9iEXm2zMRVwh5VE3fHnof2qOHRBdFcjYOe44+eWhYjoMISMyo9gbNLbeiY+Yz
	 2Cn+aG6/Q6lIeqtacGOLZeO5rl5YnYxkWJOg9EXG3GUQ2C5BHtB3WrVVVbEPq8ap2BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776649;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
	b=SbvvRfQaCLY1WCHdarDLHh+tOZObS/+SyAOYi+N8nY2rZERS8lvMhGBYB7VQoqJRc8II
	 8lfFJ3oOU/90hbfmaU5kPnJB/sw7b+8uIqrZ3iY7oF0/2ZpWk0/tqygRd8Jrguj8wxu0I
	 n0aBZNf008TOFHp1KUuWyWPtm8jMFufBMyQC643LzvfMaESD2kg0Mh1rWbCs1ztNrg6v1
	 AXbhVBkt0+Vq3mvC7BcBa7U6zzhYcaKsj+5c2m7qnLdr1ggxukTbQWX9Evy8hxfZGkfOG
	 QTo7YOAyy98d4/tZEIfMgHfFOO/s/gG8k8RqfEUamqfGAaa4sA7Y8syY6VekrV1OeWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZ78Q9ba;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MXARMSj/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F374606A331
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F374606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZ78Q9ba;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MXARMSj/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIRj1n3485775
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=; b=nZ78Q9basjtzbufb
	bsGuc5p9DB0g1PCj+faIJPTKWjoMfCYXmUiPHibTlP4jWRRRbiTTM3ubyUQaiKuQ
	ygGtlWFw5d9Z9zSmkTB/6WrZ7B4QM8cUdq6ECTiyasT57LQ9Rn//EliSQ9b3XqB2
	3kylkqLUMLEOca+6q5ypWJoTC/enUbrZ3qpS4OyVxqvD3xCh3WUqBsZicI6KuZRM
	0ELDEvMNwzP/VjZbChoQcwZI57Ov3ctC8DC6r7a+yiV5AAf+9qYXUjVirIrRFJrq
	J73jJRDWNUJ1+5JtpJnL3hUsQQ0noyljMJ7R89a7wannUyX2m/C1mQJ/A3qUJtQJ
	eu+zxg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk23sah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:08 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99e13604fb3so570403241.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:04:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776647; x=1795381447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
        b=MXARMSj/UQW1iD14BO3VGCZEZbg2RKbFpYl5uOVBayL92sueDW2Gbjj04+HOnpWK+V
         kj0p6rhUHC9XWZ6ktOyvB61Fb78qvOWg1T2UDAWFA60Yu+wKIjP4Yby6dCDLp4g94OaU
         WeR/NcSP6drn0brwqH0AUyhWsURVFdRMZA475jIj4qpVnGp+dcswko0RuQ+gQwVg+rJZ
         uQtuazvQwS1RjWKDOiMdRzxIqlrVUDw5W9m/QcQKp+HrEqV7pIkSYJ64kL7oizuDN8l0
         pua14L0/BAhNXG6J4Mi5OcNxQc7O10vbCad5AMbLmbtcOvalYveMygL4JanJDR7tjvKl
         i30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776647; x=1795381447;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xF0N7wIrKZN0ZDKjgQRiE04//Cg2OzQF29jjEwloBSQ=;
        b=j0PtdK+NASiIRVIrJHI2LCP+dAUpVczirk8daVUOZxX5x8Rh/aRvdhQfJ3kh7eXBLe
         tkhVExpEo6IdfXVdi+UXauD2OmDDds4z4I9hPrFTZJ1S7e/eJAzULxj+OL1qO7Sivb94
         jP7qYdq/2+zyShGJYF0QpKM54cyfJ7dLKziXKIt4deI3HcuiaqvjOIcAJHTXgPqo1S3+
         /GAi9ylt6cZ3Uhe3mjQxECr9FLyP3T1ij58ENGcxYXP8SH88DC4AYakelGx1wy/4eqHQ
         a1fmJabNpYGSj1Riz46k6yb//0mc/VwxqAWxtnOFFDSvgxv6qmYEme6f4aDq7dKiPXy+
         bhow==
X-Forwarded-Encrypted: i=1; AL+hErF7HclG6cxpLSzYVoCg4dnutQWaWsD3SSVePA0Ae9HVpsiVLZZE3QdolShkeAiHL9OEdDzGVCzzXqJRiQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/TZjThr0LzBCI075okCRxt0YO/Hc5hWM8BjK0BkRmBq9fcPBju
	cEXIR39iIibNAf1EEbAgZ/TWHSDR2UDeDdXADGRQs+N6weGD2IcThbWa7Vtge88o8QQI0F2339B
	mXAIikvCGgPbU5FikwaImvaFmUEsK3+347fyzRZhqVmn183HlqmmSu5YU1HwJQ48yng==
X-Gm-Gg: AYBFou2E6RA0SzHmVO9rgjVA3TaYBuzq5RacIBoQnQZsGwNWTX5wcGzU04gy0FovcOE
	dG79MGYSKIti8W9UeZwvN6wg4JTwS/fkvi2fwYB2y3/JHVRD/a4t277nhSWt9ZIJDa7hO0HtEko
	JUX677OpQQWPLG+Ih6vTSYX445q23QfYWxd/vIeYHznfi1yv7l3RLesFUXXbXoawlt/tIzSD2cn
	CMYEdURRqf4YnWK4sORLMX3aJxLNU2fKpXegYWr1QpxSal+MLZh1OkIgToWjBjOookg8D2g//7Q
	Km1Pv5hUdPCUUa467sFF/Omw5pWI4nPvUoXdbSOiGSW9uPt03qSOV3G9Kf6bMNdTPbTaFoNkwJv
	e7amCNM7yGzefw12jzlmpBoS6o8rC53cJFuws0wBTy6KWoA1FH3u4r3IjSRVhaVdKSEZULAxdZW
	Fb
X-Received: by 2002:a05:6102:a4e:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7d64d43bcc7mr3103473137.2.1794776647528;
        Sun, 15 Nov 2026 13:04:07 -0800 (PST)
X-Received: by 2002:a05:6102:a4e:b0:7cc:2086:34c9 with SMTP id ada2fe7eead31-7d64d43bcc7mr3103456137.2.1794776647090;
        Sun, 15 Nov 2026 13:04:07 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:06 -0800 (PST)
Message-ID: <43da6a90-3a5d-4a2d-b2ff-7f007faf7abe@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:04 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 08/23] ASoC: qcom: audioreach: run VI module in
 calibration mode with per-speaker events
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-9-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.6938504071664790577.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416982.140154.6938504071664790577.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FXD84JPmLZvI4--_a1IQf0uPM7Aur87S
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6afa1e48 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=tHvR0g-A6sjxE3NzUXEA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX97sJdal0xImF
 xTJOeJ6dTzvF2PctvDTzShlrI0Tg8rPjwnudYRe0+dh3JD3Se33/m4mE6piSdkBslWt8g1pSKHU
 e/vd0JHW8i+yqSCD1rcGtI7Cjfc/rOBrr9Vr0J5iiipJUMX4odrzyQIAk75tatoxSxaSewGRKts
 mkjXr38FPWyFEXNIM7EkvPEgNhMpWhzPNteet5NlraXQ0qIJNS67BvSMWEHOU69Etp2I21QC0oh
 ufbCfcW6yRlUT9mXxG4mDZwaQpkybpYhIQ6UB46OvkP3Kh12LixsahLIEtD25NbLsP/Wv5wwhE2
 CuSFIp/FARhz4kacthVkkJQoQXhStNp33QJtxB7vrqqR9I6WA+D+Kx0j9bmgsBP907c45R+OsU/
 T+whVHdm+sOTCyzghd8Ius7Xl2kihzBWZfSnxEpRv7wWsPQ/sLo66abTElCHTMOrB51x68TH7sd
 DaGel9gGrcO3GfjKuHQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX+uGte8g9TBBT
 EAyARHUlYRprcag9SiJ5FfosdndoWWq+F7pzDVRM3hUJgkY/yGJUAJ6Hc5QGoJBhx2Fo1O6kM76
 3kRfkl3umUz8fC9DvJ2v27f+ADK1n+E=
X-Proofpoint-GUID: FXD84JPmLZvI4--_a1IQf0uPM7Aur87S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> Put the speaker protection and VI modules in calibration mode and
>> register for EVENT_ID_VI_PER_SPKR_CALIBRATION, so each speaker's state
>> and measured resistance are reported on their own.
>>
>> Number the V/I channel pairs consecutively, as the VI capture packs one
>> pair per speaker without gaps.
> 
>> @@ -1483,9 +1513,20 @@ static int audioreach_speaker_protection_vi(struct q6apm_graph *graph,
>>  		return -EINVAL;
>>  	}
>>  
>> -	op_sz = APM_SP_VI_OP_MODE_CFG_PSIZE(num_channels);
>> +	/* One 32-bit V/I word per speaker, so channels == speakers */
>> +	num_speakers = num_channels;
>> +	if (!num_speakers) {
>> +		dev_err(graph->dev, "Error: VI needs at least one channel\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	rc = audioreach_register_events(graph, module);
> 
> What unregisters these registrations, or does it just not matter that we
> do this a bunch?
These events get automatically removed after the graph gets closed which
is on every stream close.

--srini
> 

