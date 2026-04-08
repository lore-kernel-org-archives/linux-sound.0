Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6B0C3A75AF
	for <linux-sound@vger.kernel.org>; Wed,  8 Apr 2026 09:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775639054; cv=none; b=PiD5s3eGL2G0xC9RwOcpnGmnw5kxnFzAf8tefd+nB2zsZ4UlgufGJsI3kI+w4mkuk5Vwl+yi8Tl7KkwtW3e9X8YCWXUq+PZYhC53b68cH3brDPiTnZYE4aHT8uFpHaF75VaGEl9FcjyKiwJ0uxpo3F/8e9/8xqp/6J7OjLWHkUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775639054; c=relaxed/simple;
	bh=YdmBNLTrUfcDrdkiR7xIwh20GMEBSDmd65EatB+oU/A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ONIcd62oQpeI+PJIGI52kWyL1RgaKZ2G7RyE5sbdZXoaie0z4pFvGt6NMO2nOZjMv80KDHGW8YSSLyK7sRLzDL+mMYLGDePXGZT6Ja8fx/GXFqYL9w9AG0oGEQgHbJay0EZU6yVwoi27rO7RRD0ARETOiEaOxgOEy0QOjSii/jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UZLP4BBZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U6vxKK/u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UZLP4BBZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U6vxKK/u"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385mlEv071787
	for <linux-sound@vger.kernel.org>; Wed, 8 Apr 2026 09:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0rSsxPoHQdJ2cv0VxA6KAemtm7kfCtF6KLSzW8wGIQU=; b=UZLP4BBZVBOobpJK
	RLM6WBA20uHVoG7PC4w1ck3z3a2AmpiLZnOAJ1pbiOxs641vgtx4JSQdchseagil
	p5WULTMuY5qTLTQAP2t/yxSE3Vejf4uZ6/LHmNeyNvpTrR4gz6pdHdpJ6S170Kf4
	s/Cyg7id7Xz40OsTYiJmm4ztt+at2oZLj0El8eeqgDxTguQuhvQu2gwKMskQaW2y
	zmQMRRwx0DLIjaCcDRef9fl17u2pQu+oix6vNi6VLWZcv4dXCBfTyYOIcWAb2B43
	F+gEJaOS3DEMjl3Bhu7l+yczeQEkMO4bThKAc8ZOIX7xye3XalvUlzE+X8U3QvM4
	O/UJkw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7sxaef6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 09:04:06 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8a18178713cso19802406d6.3
        for <linux-sound@vger.kernel.org>; Wed, 08 Apr 2026 02:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775639046; x=1776243846; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0rSsxPoHQdJ2cv0VxA6KAemtm7kfCtF6KLSzW8wGIQU=;
        b=U6vxKK/uM38yAUV5Ky1G5v12Tsfa6dOPyS8xL1HzPC01wahYrlpjoCqMHRmmB0Vf67
         lKmAS9EjqQqoS9aeZ5y0Tbc384u5gwmBrKTlwVL5eJoPqNu8GEAD4iP+beRxUf2aw6DY
         lTzto3CmfWr/mrEV99vPkdOXG9UeHw781Wb3vTiBn9ivgltWWVTUCiG3HGYqx22AtE4a
         /82ZZV7RqVaYvkcQjyvQIqmTm8IO1HCoV6ImrnaZBQXoxiumI/iOcZd4mewFyKc6esWR
         NG2w497kql5mkietQGrXVJ9KhzsZqe8wGyC0L+QBPl/K7hYSrMWsk+/DswbZhLXKq4YK
         xk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639046; x=1776243846;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rSsxPoHQdJ2cv0VxA6KAemtm7kfCtF6KLSzW8wGIQU=;
        b=BN29+QikY+EC4X4SrOphmgt1KsXfVguZLWlzPW7kOooDzT0M+dTXYYEMzlXW6+W71W
         GuQPjwQN8b1te7Cmm+d9X6B+M8D99h6sdp8oGVvHtOvLnhU+I7jEQM5F8z6ELXh1hqtj
         ireWfuK2Zx0woLuzyGRiNUzDzkBDvz5097l44ZmhTiJk8Sf1hmPdpK9vvnY1TTWbjFAx
         srl/c3zs7oOdxkrCMsNPccE5xLAyHv/vbeGhB51lhStm4w2FrVLVU/UtH0S+yMKphvr9
         vFTrcfWV4DkcVTjSdAxPAQYhzHaqjjjqrtWhgrVzQp2/e1+UPy0SfPfz7W+EK2wi1Vr1
         X+0A==
X-Forwarded-Encrypted: i=1; AJvYcCVI4VbdunjNRF5FDxh8AEpDIHw5vcKFEymNqwATB/UEbO6ekffvE1CQq7UOntbFRco9xRWhDH2dhNZ6VQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpkv48uzzIHpB3xAWXuXbh235oD0CI5o993BihzFVda5OlsC3x
	uYTOkkPG0lfGCwgXPr9BRKD2c2bFSY2w4LFQaJXH7xATwW3pRc/srBHEGyJGQ9jRnaM/1wcJBhP
	daDyPOcVoFzyWX9Q+tFd7i3SukxJwiRwB7fXCLStraxHVIODE8aClervP4UtC4kNsBQ==
X-Gm-Gg: AeBDietlfCXLecgjrcI9cl53HvX3+tiSxUDPK/KMeEOIcVe5BxdasgelmQoijMBLAj9
	nxDM3a9hkwWgH76u9rDKq0O6L0qs6ve1Ds0b5MRVZCUaelBKmOCAJP/WzUImya4dkyzZVwqrTwJ
	QWmYSnwebWbQrZSKhjD/H3w3yHbIHpZ7VAvvNw7UyHbbxZuH80XyVeEzmuPDpap5YYQdybKSp0v
	4lFqoTMIaSpiMAq5l2+8JREBEvdQCXC+CERK29e7vTJYm6+JTNmIXqTRthXc0gNitWQiGoav5WB
	YywsAd1VbsjKk03Zbsxy56O/EWt5gdpL8loM4DzPP4Sce+Z1A67NMY4gOfGG+PQmrGtJ6qJnBdj
	WgUXZfpD5IHYvbFjlQEM+ve2cCDmqkFF1qOK7pOXXo718JiIAHweZGvgAhaiIwdmCbkrwzcYGt+
	vyel4=
X-Received: by 2002:a05:6214:224b:b0:89c:47e4:41e9 with SMTP id 6a1803df08f44-8a7046debb1mr231120686d6.6.1775639046024;
        Wed, 08 Apr 2026 02:04:06 -0700 (PDT)
X-Received: by 2002:a05:6214:224b:b0:89c:47e4:41e9 with SMTP id 6a1803df08f44-8a7046debb1mr231120266d6.6.1775639045586;
        Wed, 08 Apr 2026 02:04:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff128bsm624537266b.53.2026.04.08.02.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 02:04:04 -0700 (PDT)
Message-ID: <e0a4064b-91f8-424a-bf95-599721c56204@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 11:04:02 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] arm64: dts: qcom: qcs6490-radxa-dragon-q6a: Use
 board-specific CDSP firmware
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
 <20260407-dragon-q6a-feat-fixes-v1-5-14aca49dde3d@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260407-dragon-q6a-feat-fixes-v1-5-14aca49dde3d@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=etfvCIpX c=1 sm=1 tr=0 ts=69d61a06 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=p0WdMEafAAAA:8 a=ksxQWNrZAAAA:8 a=EUspDBNiAAAA:8 a=XOjDPPaWi1ddxI8VvIQA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: dfXV_OyUTWLlD6OPWmScIMnyKt7zzimC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA4MSBTYWx0ZWRfXwrL9xuNNempE
 sY3gdK0u8ZOj+eWPrn3DOLarsjj+8fgsrPA5hms796Gfo5UZ4DSaPwGt70bvPh4Wk04Cao7WYB0
 lQ7p+6Ev6ZBZ/3U2pVoysxD0exhhR77bBEtvvqm8+wFYq7q1nV6pYMvMqdYILnJnAOr3fsOYdYQ
 xM+gCmIIc74jCFPaDh4+DhtZtCn8aK9Q3kO0lv/0Z8+XBVhvQNWukTvjWeHq7iuwS+fj4EqW1v5
 a8nrkFbmzsU928vR0uIRyFSybjKMRUpVZAVpO71/jQQ+Pm4q71T/4eBMPx/VN7kdq5kcR0WjXzK
 HILa2rW2UJwhN/GjMxFG5vQgWzlV3/2JOIOvTWCqxwCt/vKsK7u5q9gIc6aaeqjFFGMAcunQmS4
 hmucOqC4FQ2WQiadyrzSMwU4HXYmOJQHteFjDooNcoEpOQ8m9RHCJ8GgV/8+T1TR6KVkOzgci0u
 v6o9BPmKQyWnL7fum7g==
X-Proofpoint-GUID: dfXV_OyUTWLlD6OPWmScIMnyKt7zzimC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080081

On 4/7/26 5:19 PM, Xilin Wu wrote:
> The official boot firmware for Dragon Q6A has been switched to the
> Qualcomm WP (Windows) boot firmware. Use the matching board-specific
> CDSP firmware instead of the generic one so that the DSP firmware stack
> remains compatible with the new boot firmware.
> 
> The corresponding custom DSP firmware has already been added to
> linux-firmware:
> 
> https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/882
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---

It's a little shaky given you say it must be changed to remain compatible..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
