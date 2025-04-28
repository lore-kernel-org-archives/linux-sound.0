Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4005B1FCFEF
	for <linux-sound@vger.kernel.org>; Mon, 28 Apr 2025 21:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745875260; cv=none; b=c3u5i+aaBPU8PcqHWvZC6T8Khgc6ma9WsJhFgxBtHrNh6I7ObFqMu5GN/e0McELIJu0AMhlZQk0uauVGX2lQHnbE2+AbMuDQM4fnZofK6HXbUQmhsH41TTCdBdDNb3SDURJLTDChODbVNdgxQSlsanOOBDvzoDRX4cw89AQYVaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745875260; c=relaxed/simple;
	bh=Tkk5MGAPaZWvRMF34kA/9GkFmW5b1voNin/0nEzEVEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VnLENCpszj4CJTpRgssACKc6I2Z8cT3GXTqYd7SBaVjXc6MUYKhOnO3QKrsdAWGIax4u+e+ZG7KpAfKxTEzsLyH7H3rMJIHg74Rkn4VTk5lWHniy+ytyorWG7Bgg3OuNJokaYKz4jdK8y/eVQRwT3GCrS1+SbJfOX3Hg1XiFaLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHc9ND22; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AHc9ND22"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SCtFtN012966
	for <linux-sound@vger.kernel.org>; Mon, 28 Apr 2025 21:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vxVMtQIbYi7Qcd0bfFfAWSXGBUlXHwXMWO1ADOAGDTY=; b=AHc9ND22HnKrKGMl
	/7NZMmfx3/dqU2A5YAWuHnSxJrhfJtfR/3SMcPrVSYlV+4fGmF+/cQEh2taf20jS
	OcXT/IJvkG5lXjXkOAI3+jngrs6PnnrBNSkTkkiXymqdB4ixVdztWg3gUiNlDFR3
	EC7sDuKwm0vTF10ulFE3j2dr0Its86wzrtb8fw7UpuU5TEi+Mn+rJyKxRvuxrC5M
	GgbHVq936qLfUHT+Eax9D4edpnzfUNApdfhut6t0Vno0G4aUt+zgb8FqYkwo/Xxf
	kCzdzxc4CG2cag6slLlX1ufMHUJxU1iRs6dfykwLNA6QvInSRrJTwP6VcLUlVWe4
	BN1pIg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468qq5hjnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 28 Apr 2025 21:20:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4767b8e990fso4780561cf.0
        for <linux-sound@vger.kernel.org>; Mon, 28 Apr 2025 14:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745875257; x=1746480057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vxVMtQIbYi7Qcd0bfFfAWSXGBUlXHwXMWO1ADOAGDTY=;
        b=LpgC8Y8gtgPiwOkb3MwDAOoZYr7GL90jmN94xpqQPY+aWkud6iHlG/JBtBUcOXUF3g
         dOuBg3xsVGn4QM0uaitx++7wiOoXn8mk5YPBWDWEaz68iLQ+b3bY96ckukidVfaKklCG
         VWYL91T0PxY461X1iNUJvpo31ZbHHg8+CE6FOKiqeMtBnQL8CoPDUDS68FS/ArRG8I7x
         mzTDMBH8tyyh/6tOpuLF3K4a3YG8sIHmfZWRbCie4Aco08WomjRvFJ7NTX8PnGJ0gokH
         LB2W8wZPVF61gHhFUUFRHGij3o3N3jhvwJ0mo66PA23zIcJ4jrhJMDHEEZFYqEeahpcv
         DDig==
X-Forwarded-Encrypted: i=1; AJvYcCW2iKZxX6f4/Re+r1Tw6RPvmXm00xN9klHhJlNGUDelQLTdpMdDlvNosfmK6NU7SPrY8++btJcsS6B3Jw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKoTi4mosS9/jYNJL9ydfLPhyQuIC5Ftuty3ZKAtLsdr53jS+E
	6Pm1+FfGVkT13OQFpG8XdXOuGOH6uNUOw8y7bxKA3fSyMBTeL9XLhsqzCxjFHdZLf9h2BgZilEC
	sEPpx+Fs4KdgMHuiSr0IiZwtEcCFkPNWW8YvOhIbPWtZWVT5WOfQGc0+YVbzLLw==
X-Gm-Gg: ASbGncs2x/Pdv8kJrN8RRgjUdW80FmLNcBSV+UR/XryS4hio24gaUOi1WxAj+1L7qHI
	/BrT8WzS9i5m68FqQuZuaPNxpXFkOXHl6mDIKmAbOfsUVguNRVDCmLlwzoPnnvhqXjkbhMvm1d2
	ZPuW7SAKYesjofUcCfvtH3vKrN8q9e2gHKnLfRqtKm2s5skwV7gRg2BNHL0nZluH0kSORHlo07N
	tVqvrzdz/FW5JN+FXNW1LNpx0y10Hsx9ZZFyxPUmox74VQIMc3+sMRRdy2O/m9qDcdTX8NlwwG+
	CbX+c7dTdhwa+nSpZomtK6F15ua7TDmPpReNxt1LspOiJixhXHtKjALwchUh2ZxY6g==
X-Received: by 2002:ac8:5e46:0:b0:476:addb:c452 with SMTP id d75a77b69052e-4801c98384emr67635801cf.6.1745875256933;
        Mon, 28 Apr 2025 14:20:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwFlUGiKJqtoSSSMgEbasdl1dq9bofa/6X3soNz43ekcNfED3Fjt1UCrbZacjbXAHMx8UTaQ==
X-Received: by 2002:ac8:5e46:0:b0:476:addb:c452 with SMTP id d75a77b69052e-4801c98384emr67635671cf.6.1745875256586;
        Mon, 28 Apr 2025 14:20:56 -0700 (PDT)
Received: from [192.168.65.47] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7035462c2sm6323065a12.58.2025.04.28.14.20.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 14:20:56 -0700 (PDT)
Message-ID: <c2b490b5-9e8d-4da0-84c2-8c68d78920ca@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:20:53 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm7225-fairphone-fp4: Enable USB
 audio offload support
To: Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <20250425-fp4-usb-audio-offload-v1-0-f90f571636e4@fairphone.com>
 <20250425-fp4-usb-audio-offload-v1-6-f90f571636e4@fairphone.com>
 <5c4ed073-45fe-4938-b25b-8979d96b456d@oss.qualcomm.com>
 <D9I3OWQF8T3Y.1Q5U9E2RI5YZX@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <D9I3OWQF8T3Y.1Q5U9E2RI5YZX@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1DZCLyJwqiEF7-a7Sa5XRkFM59qF32wf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDE3MSBTYWx0ZWRfX1NYjfBta6+vS 9piOdUJsKNvTpk3VOrARYnAjyTO0nnsFNny8UYBlPO2knRqLObR8vByaK0lY/uYEF7MPf4LYMWn Ey7VgFeNvKvtFwpPQ/EsuDN15ui/Sn+Dhs0EuF9CCI+vHJUdMN+nxuRF2RNTDpfBdQXmqmqluEL
 a41OrP8DuccaSF/O9CFo/Xxkhu1wqpfT9Bnoj+bOmYMBQYPwSeGNmpjrfu/KXIwyb4AbEHAYI/a aoAUKTWJ4clpkKdYA+d1bRiEDG7EECNVtfCoXfbWd5Pwos2s16jNJYRWdNVXsN1oNxealUms+9r jDYA0Nt7uSPfByTuOE/bJcSgTTKb+PrUksUaYd/dqRejCE15KUajZnYHrGUKaTMar179YPRgvSd
 bK+PN168P4jxCzk4M9JQ4kS/te85xTfEC0HYFgcORyLjAehwRri/nc9NZMZXuGsbzz++j5Gq
X-Authority-Analysis: v=2.4 cv=QP1oRhLL c=1 sm=1 tr=0 ts=680ff13a cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=ZSjAytOJdz4hxISQkR8A:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 1DZCLyJwqiEF7-a7Sa5XRkFM59qF32wf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_08,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 clxscore=1015 mlxlogscore=999 lowpriorityscore=0 adultscore=0 mlxscore=0
 bulkscore=0 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280171

On 4/28/25 9:41 AM, Luca Weiss wrote:
> On Fri Apr 25, 2025 at 11:06 PM CEST, Konrad Dybcio wrote:
>> On 4/25/25 12:44 PM, Luca Weiss wrote:
>>> Enable USB audio offloading which allows to play audio via a USB-C
>>> headset with lower power consumption and enabling some other features.
>>>
>>> This can be used like the following:
>>>
>>>   $ amixer -c0 cset name='USB_RX Audio Mixer MultiMedia1' On
>>>   $ aplay --device=plughw:0,0 test.wav
>>>
>>> Compared to regular playback to the USB sound card no interrupts should
>>> appear on the xhci-hcd interrupts during playback, instead the ADSP will
>>> be handling the playback.
>>
>> "should" isn't very optimistic - I assume this works for you? > 
> 
> Yes it does!
> 
> With 'should' I meant to describe the expected behavior from using this
> since most people are probably not familiar with how this works.

ah, ok!

Konrad
