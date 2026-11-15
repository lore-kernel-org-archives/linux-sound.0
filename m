Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776674;
	b=AHWlQVf0rYyAU/kUWt8oBqCK8Mp5tfQ/PZiXck2kML1/yhhfo4HA8pX8fDLBr2tSGsaH
	 xZhe5DqQU3KgD+MDJlm/oKvLuQbTiHNhLDDlFC8nyXWhA1vb8D4rcuezz9zn81n83g0UY
	 Dw7DObdx14hlssA8FuY0mDMXLotn7Mpq86XAF3P5UrodvpNZGlI+bS5SX+8ZMCmIQ65JM
	 NenPQF6VdCyBC+204L1DhLpmr1Nqddl2gB/Q4UEdRB0MzXLhGGuJE4+7wCqsgKPbpwgHx
	 HKZHV847ts/KwdPCN5DPLqnlCCxLdmgTZFRn3Dj4JbG2kHz6Mj1lWeuydAIGoZJB8Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
	b=30gvFHy2dCGQWbHtbGAyb0+U/5uMVkRBRH9M+IjgJhqivWr5NIPPOrunZg5VAKJOGYhQ
	 sWfOJ6a1h9AU0gq4QE2ef2sj9NCAi/TKMlPbovQv+6+j6zxS14T73qX3T9cdZ+HIpA5H5
	 0CtfJff1kkVtGJSMZlsp1thOfdqlakZCkp4XqOfNkv2xKtuV76LSmu+XPIrmuPlMiG7fq
	 Q6b8DxYql6k8vaZgTpvQH4Xaeg2d4CXAmuxTqcXQlAUcDIeyyebUHDeTbzgcMtcrWbq86
	 uh7oiKykXO4b6xy53KEeZ4297QMYwNefyfYjo25edaQIfviNl4F6urgbLAszhxWQjhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="oF/0+aqw";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jE2sUVLj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B7AD606A329
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B7AD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oF/0+aqw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jE2sUVLj
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIRPk4865312
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=; b=oF/0+aqwESMrHQKj
	1sdeu3kSMD22w1XiSlcthjvvll0gokTqAWQcduUSGxstXfrbk2ZG6iFfUbFOyjQ5
	aTKZS6S5OXZshv1BZ5J4zAic2u9Jh4sgnyJKIYDDlpOIbdQJzKgz+jG9DwC8Eann
	z5bjts8xnIiZi37qGDud9gLYe27NQTu1VpLkg1Ua1g4KqAOiYI1QCxgQ/Q/CCl2N
	w4KDO4LXhXvFFM76iN7aQ+GAGWHR28RPg5eXkEBJTT7Vmc9W4DQ+4isg9tAuFCCe
	Dr8UdlI7QApi5P9Gsx5ig5h8CYP0vPKtYja5HcCGUlUrN81DSNoleZkw3O1HzZ27
	4cSdPw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8unxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:33 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7b206156cc6so795154137.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776672; x=1795381472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
        b=jE2sUVLjro28N5J07WPmzPg+d4dyrX9o7S5lYJ36+bWzIqOCnn+JAG8URCv87DeueU
         O3KgQLaR+9iHhZzfYCdLJ6Kz5nzIHa78vYBB+h0K6jwN5buxMZK7ROktgT0Wk0ILRUZg
         5d9MHjEw5+JkxPn6EkZW8WT+fD5eRZNbvrV7qLTTgIvkpvXG0lhS06SxYFpdIxm3RY4s
         lvsVg775gN7/4QNeWTcnclD3HVySas0NzGbXUwF6+uQJEDd2niWaKNTOCpG5tcNdyyqd
         xmUY2oTslNh2WaLPKQvtPVGv1c5Q/rAAu/LCMyMl+571wKlqoUFy7UAAAIyw1sktYzQ+
         trVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776672; x=1795381472;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAsdR8JeA6Mm7PMj+bK+NMt/Bx72LJN38yUyqwA98j8=;
        b=zO4yvJl3ClmMqGPmSB+z6fLfVoQIQuKLhyEpzK9miVxxXkyuhpShSRSnnpbjgg8mJl
         AQZkEfnGH4Tx4tlV8Y9ctPg7sw0XjF5FBKg5DnTYD5fdnpQFt1yLQBEpnleq4mRgsA0n
         0oSgten5MWr3FrBMRUb/mXAn6zc76qQL2XIhgr56xXMtX4xIlGAsw3yeI/lvTTsJVCkO
         kLubXLkLFtqQXNp3rs+BK7CFxmjscZObXmEndJW1PAh+K9zkySlHElQIvhUdNISbAMi7
         UoArONjuXdI1spdDGzz1U38wJMsVhEyNutka9SfGNQfMFiIh9+ALyofwXhZ1jqEVmB0G
         Bo7Q==
X-Forwarded-Encrypted: i=1; AL+hErHracIyJWATqFlpGZbIdC8xHZItqMIxQpQNdZ+5wd6rjxHyYOVqTa/Zbbw94ztM2SeMvTwWXDwEAAd88A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+wJWJ9bp/3MCdAythEHgBf30hsgXMGDVpBVabm+joRBUitRxxh
	3ORS/8J5T9wI/ZZtEBpzU4RN8R1Zf8N35uZCLy4oDefQsTlNFfqdsYcFRrsGIGmYKny2nvYN4Ki
	CgO3DNZVTqvA8eeYr21Ws7N5nYknHYM1nbIAEjYRKrMIr3LZuyN4lYAppfP6yADqy4g==
X-Gm-Gg: AYBFou3F4p098GSXQvTL+DsvFDjd5jhQV/CMf6Uni7gOYyK7jSmzRMbLlnVNyO70IWS
	cE/VZ2t0uTP/NzD0SANzN4g3+ymm3SOL50LKSXJIVN8k8IMxX2Y5sQXE8iTjafqUaiNW6y8OpRP
	QzC15BBGiVodf5PWuMMLtn9Wuh2H7EOb2pM9Q0Dn6+Ta6lWff3dHjNhZhXaxVIUeTSlHOdogami
	QFRtQjTWf28+aZEuQOTtZ86i44AdTrBRxog0OPb38K40iOR46+sKn3RwMRTdwieolqVTCvx4MMi
	0Un4/yrc2WPsnLxroR72C//ZKNtepAQF3DpO8yhjNcCvbnswWMrDwlU++v7JLPt5CHHP+dp4wu5
	zrieYyo+9KpZlZXmz+9u+F+VOuA29p0EUkp3E14Q0cNPs7rknzXAu4O8ESnub0UABlH6qjUtwo5
	k/
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr3128285137.32.1794776672563;
        Sun, 15 Nov 2026 13:04:32 -0800 (PST)
X-Received: by 2002:a05:6102:580c:b0:7d2:7266:2c8a with SMTP id ada2fe7eead31-7d64d8abb61mr3128278137.32.1794776672148;
        Sun, 15 Nov 2026 13:04:32 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm231653655e9.15.2026.11.15.13.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:30 -0800 (PST)
Message-ID: <e0757b36-cbdc-4282-a30a-4e5f4866cbce@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:04:29 +0000
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
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: Re: [RFC PATCH 03/23] ASoC: qcom: sdw: add per-direction stream
 runtimes for multi_direction links
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
 <20261023171433.820092-4-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.5480409059266128218.b4-review@b4>
Content-Language: en-US
In-Reply-To: <179476416982.140154.5480409059266128218.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6afa1e61 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=YIG-ia_FBqWyFDXOZ9oA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX5mQWO2lSfGZq
 X7puGlQAfURu44mKQtCXqY8OQDSA+Z/VCrl5RzQaV59UL4zRWdy79JRlvw0MY+rfmVHyabNrAMQ
 IG1iX1bnc4c65OU4bSSKOiFPCTZJ/ao=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX0L6X7DcRHq/S
 LWaq9YjPS6V+Lx+8z7foZWK3zQJbkGyQDrqA+1TeGI3UqpCgiCA+0feOZblIaY1divrVQTnx1jv
 5oHQkSzNmT6AVsvv2E7Q9ofmNt70QME4juc3khIghFHV9LD0B5jmR31niZWmkjpEdwUsSibt9ZM
 ARpuRFsH0wpwrXiMHhO74qjb2MK4aDGp7MdsS+lJLU3CDm5qNQq3iVBPti+yQEPQu1AnDdbHhNd
 BhxyXqoMZGuWNWUDhAy9sJA/YxweYtZRJfQCIhN1LgiLz31chcXHV/Gf1K2iJcdIcAHi5TKPSJc
 xlecY4dFXkB3e69LPcPLWAI7QdZ4y6+DD4Ku+utIhZPy3IU3bnPuzld5ZSG6GIAcPEARg2B0JZF
 pDAxlIJPN4qh1lPaksEz1fdHRgXYAIdsmEgqJdQlhHJpYIY5Bq0JzHegdMREvWz+BnKsZGo5xeM
 7PVRk3Gty8Ag8/AM4Gw==
X-Proofpoint-ORIG-GUID: cqj48fQ83GFXQRltWYiM1eEGsBFn8kEM
X-Proofpoint-GUID: cqj48fQ83GFXQRltWYiM1eEGsBFn8kEM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> A SoundWire BE link with multi_direction_codecs carries codec DAIs of
>> both directions, and each direction needs its own sdw_stream_runtime.
>>
>> Split startup, prepare, hw_free and shutdown into per-direction helpers
>> and run them for both directions on such links.
> 
>> +/*
>> + * Inline direction check that doesn't require snd_soc_dai_stream_valid
>> + * to be exported for module use.
>> + */
>> +static bool sdw_dai_has_dir(struct snd_soc_dai *dai, int dir)
> 
> This looks a lot like snd_soc_stream_valid().

Agree, will fix that in v2.
> 
>> +static int qcom_snd_sdw_setup_dir(struct snd_soc_pcm_runtime *rtd,
>> +				  int dir, const char *cpu_name)
>>  {
> 
>> -	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
>> +	sruntime = sdw_alloc_stream(cpu_name, SDW_STREAM_PCM);
> 
> Both directions will end up with the same name which won't help
> debugging.
will add "Playback" or "Capture" Suffix base don dir.

> 
>> +int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
>>  {
> 
>> +
>> +			for_each_rtd_codec_dais(rtd, i, cd) {
>> +				if (!sdw_dai_has_dir(cd, substream->stream))
>> +					continue;
>> +				sr = snd_soc_dai_get_stream(cd, substream->stream);
>> +				if (!IS_ERR_OR_NULL(sr)) {
>> +					sdw_release_stream(sr);
> 
> sdw_find_dir_stream() (there's other copies).
Yep, will move to using the existing sdw_find_dir_stream()


> 

