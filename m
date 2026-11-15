Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776645;
	b=QNqeofkTI8/1RpxKlDXmXCLSVw6RSishiHVIPJ5uD5zREMnp7uss9uxQPp5tr8HKk5vE
	 eZ5IgHFk6MqDmDObH5NtBPZdAP4rLzPnqg6u0qlWJtu6pT7z094qJ4SEP7V6JmUu7hFM+
	 dI8uSDxGMg60w4IB7zxhdLkNUdr5a8dwaRq3LkFK62DIKVLUcdhVXPRoikodq2sl33EPB
	 P1BAEjO3jcNI5yaYBxC5yeiiujI0TJINeg/2Zs8t4zMUz9MvBqvFkH9OsncuOoAAUvSHF
	 uqrP225omVAx/Vt1zMqSx6r33lCd7GEHc66nOqG9qLsYH3vfhmFOuDeAJxB0nRo0/iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776645;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
	b=vK2Mux6HFKq/yht4npJTuLRXN+DnOEIhOCY+fToisXFmHmDuMPcJJJTbgHAo1aGG+Qmp
	 /x0gBHretGkQWGCwUtU67lgiofnKhhKXdIBEzpmsN+16dOaq0pA+TNcvOQtIOlsiFZJPg
	 f6jN2x5O4AuKtRbmNHIkSa5XibK6a1/HvassOuvhTK0NyHClwJOee/G19PxfP6n5acfto
	 2Mvtkd1psZaxBJ0qsy4RzmRbEysqluPQv0ctbKmAbHc/51vC44NPrz2ROican114BvQFH
	 59oLlrnknTmtfsuWgKZIR8De1Iuoo2HIcKVSH0Bk0YXt3qQjlf8SRcwUfbqzhnIyalQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIyRG5j3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GlSIT8gE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB61A606A32C
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB61A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kIyRG5j3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GlSIT8gE
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFIR1YB3150253
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=; b=kIyRG5j3dYGOflKz
	T/SJjWzn5BO2NwkWRAPPvcI0paR3tQ9SoO8w2rMVBEPh9gXicFfLqYUkBQdAFUzA
	PjoZQyi9pWqdZ7ia2WQz1JhlYRHQ+d33XHAwCMsfGVg7F50wmOog7dZCe9kBiW+Y
	bBzkCiBFrzx+DfWdPAfM2x00H3xt7TeuQEw+kTG4G9aYI2QDg55JCMAjS2dJ1aQT
	xegBQ8GmK6ZU6lE0+7clSV+lrcXh1XiEhwyqXyR1UTaqUPx5400lLNRZid0ghgn+
	SS7fedKzqVIfQk67OkECg8QBxcZmna/0977iJHgUNhwBsdKDhUyZgVFstZnzgnp3
	cThh8w==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhnx3vtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 21:04:02 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-99089f9591aso364748241.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:04:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794776642; x=1795381442; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
        b=GlSIT8gEX9eSZ261jD8Sq5nbIIktFnSK6z/TuF7GqMC5uazBU+Ptgq2LFTCTb9Wc1b
         QJh09bCMizRBBvBlgA56m7pl7Kj6mLuXR79F23T87wIesd86pSyozl3f8eG/maAKvDHo
         aFPb7PgkbH3i7WuN484k+QxqB55RsfPmh5p2gI6cWZfb6j49Kx4Mtlru0ubC+KT6Fhcs
         K9e8VoPf88HhUjzYvDKgsYzCtrEgDhOWI+/ue/vMWh6lK2y7v8eAMwsxsnvT85dXl+08
         fCyYMjPYoy9/whx9kNPO5hNiawDJXz8trH954TGXw3mhMXgkEad4htegWnrFPRHvNoc1
         iL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776642; x=1795381442;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1BMuPZZADtXOH+BS9eoCo5w3mmHWCYZjVhrpqJ+7oKk=;
        b=x97LFE+akdCXLGiKSqoSZTPmoK9tFJ9HpuyeGftpD1YzfD+297Y1FZE2wy5JVlHjNO
         LjWuPDhwsLeaCMT7ki/+PjXZz7ws06YoEPi8E0LjFJlUPHmZRh1SbEeuXLE/9v9I9OBT
         QEdfb/hpyOdnpLTeOZ+xIKSWmjG4nZQSz/WdWi2BLBEntCGixHKaNcqDeBUe9uJnwnEL
         SMEAeRGH4MuN09Kzz8q8Czk2w7n/XVSuPEWZSgFNq8FlhBd2SUthCtuJQU6GmwV8COOy
         CDREUT3AkHaaTEB1TjuV8dZ+CD8PKKcuIuFyMpb4S+8m1Z8bB9/DOOUfXMQex92s9GUP
         bCPw==
X-Forwarded-Encrypted: i=1; AL+hErElTk6GfuWLcxdoTJbVJGDC6wvUiOIcVD/cJhe1sJ8JzpqnSPQb4Gxy5rbsRWcfF/rygmmedA/8JMaoPQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8bNmGwjI4rpZ9ZrRiHOzGmCVjdD6xq/CFsEzcyMEsqTOWWh2a2
	gy67Vy+2ot8CdrfR0zVOxdy5OOk6NaFXr2ePO/SBOdvF+7TXiZMKnqOsF0z9VDLWiARdCjMMMbb
	40x0mrNo/wio/bYaWPeZMrGwJ8FwNylfA05/0GryKdeGaZfcdqITa3Wxdbn5ASi/XxQ==
X-Gm-Gg: AYBFou3OiAR8mkI1LO8KGo3S5n63CvRST1J5RjoPu2J4J8UIZppoUKm+Zbovbr3cobr
	Xsxl/kLGHbinxpaiCWr2bHqPJV7xThAS5X0Cpcqfo2BXSV4IYauhxGSlmuPV9sKgdkjXBKHEw6i
	407wn4RFE45Rb+Zb9LlyU8wWv8byEf3cd5j4e84DaNjTKRsKxZIqRId3GufH9gWLuANDfn/pcxw
	OTUVk1Q2MdDpJTKMoN2D9r6ty5DjOjyKn+7pS/G2pksEqeao2TquriC5qVz6LyR22SJrkrEzXCE
	fU0cG9cfAocIhVcT3swsyf6or3h6ZL9X7cNDRE/5+bCNbnhHws5wcWNGzrW/GtpOf3kHp/WYSwF
	hWMM0liDfqAOgSzfhWSnRTJ8gbxEFShNnBGRddx7yTI7ocD+mljvPAGxbg85hQzGxcvtoT7b3PT
	RX
X-Received: by 2002:a05:6102:94d:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d64d6ef8b8mr2317665137.14.1794776642080;
        Sun, 15 Nov 2026 13:04:02 -0800 (PST)
X-Received: by 2002:a05:6102:94d:b0:7a6:a24e:8140 with SMTP id ada2fe7eead31-7d64d6ef8b8mr2317658137.14.1794776641568;
        Sun, 15 Nov 2026 13:04:01 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb65ce005bsm156345935e9.14.2026.11.15.13.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:04:00 -0800 (PST)
Message-ID: <c86bb364-0a7f-4c7f-8ace-586f5aa85adc@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 21:03:59 +0000
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
Subject: Re: [RFC PATCH 05/23] ASoC: codecs: wsa884x: add VI sense capture DAI
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
 <20261023171433.820092-6-srinivas.kandagatla@oss.qualcomm.com>
 <179476416982.140154.10822957842494469444.b4-review@b4>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179476416982.140154.10822957842494469444.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX4/GUEVQ0vfaP
 53zBJLAtrgs5dfWTzbDRq72Y0QbFyzxaE9cwLA0fDIY68QDsLeqs18zreQvf3JhMVJKGTyeeF/y
 J7AXAr4XucrMUf+AD+r/keREblAkYehv4smhZNSgIVep6hcRSRLB+M6kBVYwza6CtdoYYOXry8c
 9qil1LaSj3wGxWfJ9EnnatM/PapR2aNWzViD4NMHeLICMDx1ipMHz+Ps9F+ryYCEGVMKhVFJWMh
 60GtWhOzNCChI3U0haw16WXtDdnWmohsneX8+BhGyu0eqpSdrIxX/O5NAqppJo9itHuKnGlJ23N
 4LxZVW5GosTdums05Z3AtYROBZ+Ql8FOtX1FVO7kVkls5BDmOrsFeyInsXiHVbFk6skECUyJPa7
 7v/azIJpsVHukOsAfyoxmVYfVC+ERd8M0jTh8hgjDJHYnZwBw0j0x4mmjWln7V5qhgy8ao0q6l+
 FxuC7byBOrw/ZbCZaKA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4MyBTYWx0ZWRfX6kPNWj4XCQqb
 reRJBDo8ygD9MUL2PC/h72dKdF6Lsl5Bz5B7/TYHO56e/ZGfE2XCXQzA+M7DoDG8jIC7ReajNAV
 X4wWMvWxRkvm8wv+KXUYLxd8n8EMq3U=
X-Proofpoint-ORIG-GUID: TcmbVzSsbz2V50uaiwHS_-ITm6oyVCSH
X-Proofpoint-GUID: TcmbVzSsbz2V50uaiwHS_-ITm6oyVCSH
X-Authority-Analysis: v=2.4 cv=Jr5kP84C c=1 sm=1 tr=0 ts=6afa1e42 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=I4NBp-wbhaHMoEEwmPUA:9 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150083

On 11/15/26 5:36 PM, Mark Brown wrote:
>> The VI sense port carries the voltage and current sense data that DSP
>> speaker protection needs, but it is described as a sink port next to
>> the playback ports and has no DAI, so nothing can capture from it.
> 
>> Make it a source port with its own capture DAI, ops and stream runtime,
>> and leave it out of the playback port list. sdw_get_slave_dpn_prop()
>> searches the sink port properties by count, so pack that array densely
>> now that VI sense is no longer in it.
> 
>> @@ -1795,7 +1826,10 @@ static int wsa884x_hw_free(struct snd_pcm_substream *substream,
>>  {
>>  	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
>>  
>> -	sdw_stream_remove_slave(wsa884x->slave, wsa884x->sruntime);
>> +	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> 
> The VI DAI has it's own ops so it could just have it's own hw_free()
> which would be a bit less fragile/surprising.
Agreed, will spin that in v2.

--srini
> 

