Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CE2157A67
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 18:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747937791; cv=none; b=VWCCZXmHWV8IHjihlPg+nM02nL9SsOko48A9K0mYC9Cf3lwcp0a2+z4+YqlCFSCjykj6AimBp4v0ws9Xn2LsaNRh6IYh+Kmp/KOEpPXdYA6A4j7YWv/NyP/ETEL01RX7QHW/oC2a/1EpQn9T+CY6Hxpi/7HW1Nr3/Hg3Vhr4/KQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747937791; c=relaxed/simple;
	bh=secQdXXEgFxsmOhPWrTAs0k7BqWC8fL1By+eEVP1/k8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tQk5iAOs3qDPBEuuk7HlxnAq/mS/aXNmrefKSE4EYMFkprt8HzWpKpUntmFAveFUzCV6sF54ezv8N6YSqdp9ZEf+rQd87qsYVd70EE/uePhsgYViOF3n91kI18NdKOFVPshIvbAohm4V9/TvUDPZ91IrnKKEuqnFHPhQ/jYuel8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Io9dp5Rh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Io9dp5Rh"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFOiJJ013629
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 18:16:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vd80H0upZK9Jr0k83Vkq4eqyU3PiY5TNFpb8R/4mM3w=; b=Io9dp5RhA7L7TC+1
	vFW+pX18qrmNfTtj/2tCqrg0pn/HnJtkR5o9c+TjVaLOFCN9SfBuYLtNpjje9yMh
	s++10oSTVaAOFwpLAQ7BKfFcM4/VuJsErHNxqiTUbH8q7nBn2DCZ5xKRcOUoMJHj
	dg+V1lnsKGnoh28C6WcSE8Dvv4OvR2AK7iwx6u0mZ6GIR1zuXdOd5x6BM/fyQhFE
	Nj2J1R9fxlJ6Xz7AQP4rmgOKB20Ti3aYHKWIf6tkC8cMSgl9cvegslS9c/3ejJK5
	0W7YXYKaqroxyE0LEK3NCnPZcZ0FXy9CRQnttlGncHqmSYhDWbRuqfSChL69zy0P
	TY6PGQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5fftu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 18:16:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54734292aso224574085a.2
        for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 11:16:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747937788; x=1748542588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vd80H0upZK9Jr0k83Vkq4eqyU3PiY5TNFpb8R/4mM3w=;
        b=eU5l6Dei/nni9XOpnbw+kcAJY4wt0jhodmWQbcsAyw/Ad5jJHz4AfU4DLRjDyaVG7/
         TrK3iVMQAd6/AcJ/Bhxcvemqd20nRm6J1Omg1ZZrwb1ue9kNDoHzHJfsL+p/KrCvPQlU
         dOQ1l0oUPY+EXxY737i5l6go2hfv8uX3THFBd8ynI6FTyMg8YjoFpfnYbWwsVFvDNrt/
         +jFl2ePV78YdD5JewY8DDiDg1IXUpRuUo2hhNB6Xs4ReqZjUcyZEMKwY1hI19F9CzZdW
         plBIvEGLAKPWfojF7mnoYmJHuh75OcvJCDDhtOvRPI7hxWaRbMo92d8Ed12M2g3a5en+
         /H+A==
X-Forwarded-Encrypted: i=1; AJvYcCUOiHOlHk2sm+gF9slIKdFoiCEnwrBnLacC/wZk3tqB5cA3ah83wp2mjAVtGlt0wN9G/eR9QprkTJsHcg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFyIBEvHffucQuJZFfuBsXnr1UMt1vd+LpDQTCfVXf5N4ZkQMB
	LRUbEts+WmVs9UQ8vl0pLAzupXJrDgizP87x+XD8eCRlt4pLo8lg7SHfVvRA97RRmNyBHcmSksp
	+o5XoG1wel0oJ1GkLDk910UBgHsmWO7dmEeme1EpiKvGewwCnoGLjOwTU39ubT0uuJA==
X-Gm-Gg: ASbGncvVhWBJj6XksH6s42rmzDjIwWk6WzjBmJYnCVdTRZfiQtj8SNElVGupB3Tdl4g
	fdV9vgmaXS84P6aMBJNB4ckULfatL8yoOxYmAhozKyw1OorLd5jXFa+lQM1DaRd/XWEKlqPXbzO
	nOrXWEbycxx4vz6YhiY8HbdN4Z+VHk4ZBmKSJ1vVUgFfPTXwH4M5tNBJWYYHJRJa8d5OGaEN7at
	Ypx1KzBmJL2+/8Eg19BVlJS2224z4JTFZK5sxGD5gvkNKlMG/XTY3nC9Y5Zrv9tLWSNXhPUvVhn
	/xjKH+ptGv9jfm4jOkjaFLbJlHLt7vNJtf8HtGdFtS2RQzVwhRRh6ydILfF5c0KfCA==
X-Received: by 2002:a05:620a:27cf:b0:7ca:e519:6585 with SMTP id af79cd13be357-7cd467237e8mr1424905085a.4.1747937788078;
        Thu, 22 May 2025 11:16:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7zzhGT/5VJb4RVwNUci3BKE6HkwyeAUZ42nE2+lAjreHoCnTgE4GqyoQ4ph1hnGhM2Vtkwg==
X-Received: by 2002:a05:620a:27cf:b0:7ca:e519:6585 with SMTP id af79cd13be357-7cd467237e8mr1424902085a.4.1747937787705;
        Thu, 22 May 2025 11:16:27 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d06dfa4sm1119265866b.57.2025.05.22.11.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:16:27 -0700 (PDT)
Message-ID: <fd2b7010-7935-4299-9b72-e12d41014d25@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:16:24 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 12/12] arm64: dts: qcom: qrb4210-rb2: add VA capture
 support
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-12-9eeb08cab9dc@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250522-rb2_audio_v3-v3-12-9eeb08cab9dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4NCBTYWx0ZWRfX+otkuN44Lvdk
 AsBYZhm94EcHYqI9zAv4r9d19h2mPnVGaSFmhLe8HPzwQgKH0pX9Q+ymgZBs+FVfPLjeugAN+m+
 /fZLWpple3OHtbLC/ej4WWgzqYfB6+yd+oFNK0Ro1qQX2IuxaoI8MnKvGICn+OkAWH80f79XLCU
 BHEA0zv+LjDj6IdfBErOi7yNIJekX74tmlAyvMiPpuyXsQwPKObNzmz9DKukKup3zpoGGbptK11
 BOUKZ1MKx8NAdJILtDmzkCF6negY/Ima/8wXCRggTGG48KEK6aNPGggABSlmnKfvZ4Lc2B6hgtu
 QYNPzCOIWh/Um/O6ibyUgTGYaojk95sIPv6uPgXb3xvJ/nXFgZQUxvAx3Iw++6Tdibec8FJnhXc
 ryIr88uoybCwDOtiChUxR5MvTl6MWnXx/4v+9cHlqJ2fjOiVsdvS7pc7ESgfrtVAbU/hx0oq
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682f69fd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=tiHu44C2SuCey4_Rhg0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: -iXoBUmCIPt2rgTl5OVvu5_1P8thhwsK
X-Proofpoint-ORIG-GUID: -iXoBUmCIPt2rgTl5OVvu5_1P8thhwsK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=922 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220184

On 5/22/25 7:41 PM, Alexey Klimov wrote:
> Add support for audio capture using onboard DMIC. It is directly
> connected to vamacro and txmacro without any soundwire interfaces.
> 
> The capture was verified using the following commands:
> 
> amixer -c0 cset iface=MIXER,name='MultiMedia3 Mixer VA_CODEC_DMA_TX_0' 1
> amixer -c0 cset iface=MIXER,name='VA_AIF1_CAP Mixer DEC0' 1
> amixer -c0 cset iface=MIXER,name='VA_DEC0 Volume' 110
> amixer -c0 cset iface=MIXER,name='VA DMIC MUX0' 2
> 
> arecord -D hw:0,2 -f S16_LE -c 2 -r 48000 -d 5 record.wav
> 
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
