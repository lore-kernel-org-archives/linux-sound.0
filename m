Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B604D2E9ECE
	for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 10:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759140592; cv=none; b=mf0XbSwZnv4haRcoi0nQK7n86m/5Pf6v98HzurWwtONAIUadYgkz2vtIFTNA9atHl/ZGjbY9bD+IdAwo6kxw9LXgAWbUgK6TMyiFrlyOZ7L4nzhQmqJyK6KDM7JURpEvcBnOvAItE6R7OvTRPTebss9JrzUZ4JAYoOgeX/068HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759140592; c=relaxed/simple;
	bh=06Ux4I3QO/gu1GAwm5gqNsrEmJdX2MdFND6fwSh05LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T3H7gXUgDjVoJENChokb0ov4FMXRcKxQqIF0RTvrbelYYXlVF3yivS3GsYENdOp5BfzPptb/DwJSi6VyVu2i2YgI0LfUQdA/l05ehUyzTi0RoY+tzvAAQcu6XuZ5LW9sLn9QAz+RE1l3SDSacguajNW4laHwmlsNo3oOhzmuI6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oDLZz7Yr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oDLZz7Yr"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58TA8r7t029715
	for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 10:09:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ukuFX1CzqOMg1c7sNCM9NZcKqMaOkjZqvA7bpG2anlQ=; b=oDLZz7YruYMhFIVW
	u0zSPMWgmzitP/ZUBUKnzAqqqsF0Q2jifaFbAhuXRu/MDRX569pqun4SRSdv/FtK
	3qMOlOf3Ta7qBCHSF7UwArgxkZhfOtWtLc1cYpEHHzsbNf/McPHURh5/bYHszbOo
	LvWGN9E/5M3q20M6BGdvEvChy4z2Yzg/lwyWynyHCaxlBiFIV48S+D2Lrgig8gW9
	8/q8Qkp04VLiIXsUHPJgGw2h7WDT0EGZxNRiTW25HSy8ML8gYmhJKfx+g8IwDama
	LvYBv/QTA7JffWiw8oi8cLun1RiuY0CaEP5ZMXiO0uhbXqdjCNFnwylLXZoytDQH
	Cqi/cw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8a5vt6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 10:09:48 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-77f2466eeb5so3763974b3a.2
        for <linux-sound@vger.kernel.org>; Mon, 29 Sep 2025 03:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759140587; x=1759745387;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ukuFX1CzqOMg1c7sNCM9NZcKqMaOkjZqvA7bpG2anlQ=;
        b=gh8L0qn+AfVmLivaaXDfM4iasg1AzEqt6lILK4vP3AAYqp1x+NZt8a0yNH5GjqtnRA
         4H3EVeT9xjY8wHj5vy/aRpZ/FIRr7ADFsWDbDc4bjQDBJBBRmoePkP6QgoX/r/nSe27a
         oQLrWwbjEKOoVRpjjW4o+a/9c+xu6SlAgczLHpY3jYGQvN7VF6N4yAi2KGBlHzvscPQE
         aL2rP/yt2GbVlBqLazuKHYxMiyczjut2wILsd/4dL7mTPKY8G66CxkG000Y8nRwSR/dk
         HlYkyahadRTLO0xt/mC6MWFrYN2xRhKjxSR6ZxRjf7mrXTYJnw+8JvglsSg/V+U5cc54
         9PKA==
X-Forwarded-Encrypted: i=1; AJvYcCWyLPOa7zLD7acJPMHeXOMrfxXpyigpyp+wwTrSePpye3CvWkrpOedawQDroDnr9ZmzNbwUTiHFLJZEJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdL10qNP+cgOnWS4JKSqqMZPMWz6oMfuGRoYiM4lIYBfd98Kly
	QuTHrzQHtBpvfI1myuBOn2PQScDbmzdIxACeQGFvRSLRSKlou35L9UvLjlWrDv3ggP36H1Dpoh/
	zVy6kfzd3NmRe11V3mjEbpXQ2QAFzOI4lsKx86HCMMKT0nAUr47VXD/O8z2V5CXcA6w==
X-Gm-Gg: ASbGncvVVar6OK1KZ9XP8EQHQ1GjpEGkAFS9gqPiBsYQzHBcDDpLtTOjYi87LwO1uPu
	fMzjATwqElMnFj1kGmop/W7GTpSUsrfjdnOeoYxfco/EJmZiK+XhOWpPPpsshirMe7Q9XabgPf+
	LBrQ2l/RIFNdAHbkw79dONEdiufpT6wCRFLEoYLCj1rFQWGhw/PEfD/TIyxfalSNEnScAlIkDjo
	k8haESFfBD2uzwN2ULY9Jh+wWJTn9FzTcMnb+QiI8ALBYcv3YRntM9YLP2qh3a27Q25PYR2Yb+I
	De6X50wS7H4PWbfFXYf/iQkeNGZ4+wWItcg0yWrGwJ/qhfMX2nELX+w/f8aZYzIyVVzHLhQOuA=
	=
X-Received: by 2002:a05:6a00:1892:b0:781:9ae1:1be6 with SMTP id d2e1a72fcca58-7819ae11c98mr7578413b3a.6.1759140587362;
        Mon, 29 Sep 2025 03:09:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFEONG/QNzmtooig6eHCxhIPb/wc02QLjUsMZtIaO+cmgm4v5/5vvNhS/Dl4PpsqvI5jOEbpQ==
X-Received: by 2002:a05:6a00:1892:b0:781:9ae1:1be6 with SMTP id d2e1a72fcca58-7819ae11c98mr7578378b3a.6.1759140586881;
        Mon, 29 Sep 2025 03:09:46 -0700 (PDT)
Received: from [10.219.49.214] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7810cfdb99fsm9344624b3a.31.2025.09.29.03.09.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 03:09:46 -0700 (PDT)
Message-ID: <809add83-ddfe-4fa1-8947-76e0f49fc6a1@oss.qualcomm.com>
Date: Mon, 29 Sep 2025 15:39:37 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] ASoC: qcom: sc8280xp: Add support for Kaanapali
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu
 <quic_srivasam@quicinc.com>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20250924-knp-audio-v1-0-5afa926b567c@oss.qualcomm.com>
 <20250924-knp-audio-v1-3-5afa926b567c@oss.qualcomm.com>
 <ru7km6vtbxwnoqtt2zf24si5envayqh7qy45mc5molevrgt5pv@g32atkcwqyan>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <ru7km6vtbxwnoqtt2zf24si5envayqh7qy45mc5molevrgt5pv@g32atkcwqyan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RZKdyltv c=1 sm=1 tr=0 ts=68da5aec cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=P4kkzRDHVV3rFGJAm7gA:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: S9aNqnl9l_vvtmRimfWSBNPTjNhuW6eb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzMyBTYWx0ZWRfX/k2jmxkyc3I9
 AJJGTjXiYoVOkEIL8bNS1Ekn7S71uhVf+Oh9ZZKhze1DGdfejvacf5lrJRZw7KPdFtzcQFyQ1Ch
 s+jpblhSyr1jdRvmSHaYUB34b7Ow7T+Hh5jeuzDK7zikEkKm9zEv6tJ8AQmTeWSsaxJamlUWX1Y
 mbEQ77ZpidPDK3by7hMrrZlv2DdrPanPSfNfFZTHOhejlw8Gewp2yRoyz6j3uHidOqMCrVGNkWb
 ScS0YXPoBbL7tmMq5ugp92nOqgF5mVKB7bHsA8N1tvshPTTU7aw7s/48TkdVgL8xgC3BDYZwtAQ
 3+Qgtz3oCBmJm4UZfm4KQ0BeZk3SrshF8GKV3jLy3suP65cNGNd4bVVXHCtoeQIpt7HlB+VhMO3
 iUgHzWt2tquFxW8PEHCif3+SptuR4A==
X-Proofpoint-ORIG-GUID: S9aNqnl9l_vvtmRimfWSBNPTjNhuW6eb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-29_04,2025-09-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509270033


On 9/25/2025 8:29 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 24, 2025 at 05:01:17PM -0700, Jingyi Wang wrote:
>> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>>
>> Add compatible for sound card on Qualcomm Kaanapali boards.
>>
>> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
>> ---
>>   sound/soc/qcom/sc8280xp.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
>> index 288ccd7f8866..e231112175d9 100644
>> --- a/sound/soc/qcom/sc8280xp.c
>> +++ b/sound/soc/qcom/sc8280xp.c
>> @@ -198,6 +198,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>>   	{.compatible = "qcom,sm8550-sndcard", "sm8550"},
>>   	{.compatible = "qcom,sm8650-sndcard", "sm8650"},
>>   	{.compatible = "qcom,sm8750-sndcard", "sm8750"},
>> +	{.compatible = "qcom,kaanapali-sndcard", "kaanapali"},
> sorting

Sure , will update in next patch.

Thanks,
Prasad

>
>>   	{}
>>   };
>>   
>>
>> -- 
>> 2.25.1
>>
