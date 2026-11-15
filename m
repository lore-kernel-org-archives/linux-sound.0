Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794780480;
	b=1yFaRtdMZcVmLwZILOJSDWq5CI7drFl5UqwCUaTrU+Z7b0alAVLcYyKQlyauEtlyA5LO
	 4WsekfOtWmJOI7s/Nt4QWBAiz1szYkRvkosUJX4avK7jn/BoDiHH081QhtPYr4cQutOzj
	 wZ4jUnKusS0lnfgUwbI9mS32Xx/p1VAfSmFU+zimPHYfWt/S5DQzzcK++LFDhdLicn6SF
	 nAjI3N32lgWAC8rOOaGPhRBKnSSy5GvmzmHWSx9QByFLIi8Y0UHjZvOrLsJYj086nVNfF
	 4pLMqpftbKzYegKGBjMy+j1cGrIK8gfboUWVwZ6ByYh8f6mnxhwOzQV6gdVJwg/KnwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794780480;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=;
	b=CKCcQ41q5RlqmoUAcMlW4YFPgN/L+j8Yzg26EM6BhJ67SQ5hR0mNmZ1Tbvv2F7NKhFNu
	 QPC6ntZo4KPWWY8aOS4jxh2goHSW+2BXMjzOddyNtXFjrHyXSsjv8/b1XxM2EGq6LQ3Qw
	 P3SeTB/QaFDxfEirs3lM/PxUgztpWgznMQVeS01NDu1Xy7MooJ7n7NlkQbiJ8xVAQd1tj
	 +ZDAVlQS1XZanqal368vKd2XdL7+SqH66SyGwprDLwUUEfujkqHv45VIfVQqzlyTJsl01
	 3aC9jeS21xUWof+P9eaeZsVZKO9xHx9Tzlss/evG8yOj9ucbts+p2X9Fnb5NYWMdSZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cKU4jBb1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwMlpBdj;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B6E606A31F
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 22:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B6E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cKU4jBb1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwMlpBdj
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFLmFQo632955
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 22:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=; b=cKU4jBb1oLOwttr/
	x+PM/xgG4ULXw75e8nVkQtD4VZzNqylIGqUp3nRwM2qXuZQq3TQVpklLE8pDkI6J
	qFCN4F1i29jd30aKeAUAYZhlTqoGR5jUs/9Q1VIjMzqc8k/rbiueb5Soj4Fih6lz
	EODjcHq9QnuRk0dAHzcUaDUtWEwOr62PyLbjSZgBfmPO1MUPHcNSwnnSIM1LKzjQ
	BTdxvficyIc3w3j79Q6qs2d9gfpzqbzbFlm/OcwIcQ4f8vqI4S/7KnkaeRYhG0yh
	TJHKw9ln7huNRG6Qwv1SpLqTMdNX8IR4HL6kwbqN6Ar+H4TigrzLLaq0YbKWMAXG
	5jbM/Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhhduus2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 22:07:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso587960185a.0
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 14:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794780478; x=1795385278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=;
        b=cwMlpBdjKKbckSpfK9lRkulNcgARW/rozdeQ0ZtTFCbnsQwe+ko5dx5br12kCcJvEZ
         EGw1vQ2BNEuo/8Z23F5j6LSgTfUfy/rXTewT2hGclNaTQFQSOkygrv57a4ZhOWNlqodz
         eOEIS+8Kbem47IxV6IKO+0uQIA1UGgrZRpSFdo6FSMI7kMfJqmLM3GOS2YsB08ELntmA
         TGE4IJ6QQVjyE69ERKrxVKzHLVt6wpS+h57bSlM0QaTGwAvk8fEzeHgHnjo4PXkLx3eV
         oGwNXhmQ2mx6XytFYXdYhTRmEzPFMhgmHmzxVnGIX7LBfeDsv5+DqvEFS6oJkJldJJH4
         q1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794780478; x=1795385278;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k9dCgqBsP1JDVCF0pQxP8lz2vqJjfqt5PSS8hR4Mu/I=;
        b=si32Py8yl6fdD/jJ7OTr8GI5mCxE0uES6EiNMuo8l0JmYMvE6RylwNoVaxxoRvQiOn
         1bsuq7EM1KjQiMhWIgm1vl8qpCNBGmb73DvvNP32IncciJvKaEvtgC2lzu6hRiN3XEdu
         UYZcejj3mS6DDEHWdv3YC8/rEUf0j5Eg2odMclQYoVPIeywUSXdVy8pvmflkrxjuQwhA
         VlW3SFnH+Op5py28j6pxjYUTTqXdxhNRdnz4XS7fKZQtH/AkMzZSrJ7rJGB69eb4rQYD
         ofiCpZ7T3u35zpt1e1++MLzK7gS3kwT/ji4HwfyW4iVXSz5UILYki4ifrgSjY5+guYj4
         yl7A==
X-Forwarded-Encrypted: i=1; AL+hErHSmWpkDENpf6bhc5zfzxXQVvJnK01KxEGb86XzplEuOV7Oy8FTqb/CDX5s8sEXJd/VsAyFJNHqwLBNCg==@vger.kernel.org
X-Gm-Message-State: APuU4Z95Wz7/Pzyl3YJXNCBeUhaMoIyY9Ir1p6NdcqhqfI+P9iv2dIX4
	wekwqGQsVfl1sB3nBcvcAPTV6x7b2Sb9Viq7Jl7ixobiXDUaNGmoIgjirrufe3LQtMW2WbD+DtL
	BhiZVvfO1dSdeWDW8c6DlpMPbpzzZFbmdpp9Z2qhVwx0Iu6hx5BoPS2qTggCM0aqsrA==
X-Gm-Gg: AYBFou2ZDy9xgIhZaGQjBp+dP/lnQ0YUpUPDcDbmpd8sUbDQ8twIA4rEr/LT1TVQyiR
	8YbxOmdHwqgCoQLGFiRBVvVagoDjr365Qd9H64huDBLdznU1w0yV4BEKs99nSe981bCS9+a+8tt
	Kc9G2qMDzKHxMBM6ELDsVLJws8JR34DeiQRbqKjPnnVD6RyiBlV4wPUvWqguQB8n9proH+EVnWY
	AJja/Jrkb8fjzXtRtg9TsOBdvKaiXiH++bS/nBNMXJMCY6b2RfTEW6hZvbG5qPsW6RogV/oTWBY
	t37m9WAsYEO34oKoSXrrAd8a9cPOU+9ICvjs8Crx4YkILEcpX8gTIGyBdPyczvsOP/sIKt59rHQ
	FqA9uz2KA9rRE/x00Ch+++VNVlKYZQmiPvn01xqPYwlU9FOxq8RcwCMcrG/Ul+TipmJrSyH3HeZ
	P/
X-Received: by 2002:a05:620a:618e:b0:949:816f:cff1 with SMTP id af79cd13be357-949816fd194mr51588685a.7.1794780478209;
        Sun, 15 Nov 2026 14:07:58 -0800 (PST)
X-Received: by 2002:a05:620a:618e:b0:949:816f:cff1 with SMTP id af79cd13be357-949816fd194mr51586885a.7.1794780477782;
        Sun, 15 Nov 2026 14:07:57 -0800 (PST)
Received: from [172.22.9.204] ([217.110.90.56])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c608cf46dsm19639489f8f.43.2026.11.15.14.07.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 14:07:56 -0800 (PST)
Message-ID: <65e3d2b5-a48d-4ef4-ae89-68a15ae7466c@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 22:07:55 +0000
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
Subject: Re: [RFC PATCH 00/23] ASoC: qcom: AudioReach Active speaker
 protection for WSA884x
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Fabian Renn-Giles <fabian@fielding.dev>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261028163152.26892-1-fabian@fielding.dev>
 <110e1d54-347f-4186-bbe1-6aa03aa8ff3f@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <110e1d54-347f-4186-bbe1-6aa03aa8ff3f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VOVIDNPX c=1 sm=1 tr=0 ts=6afa2d3f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=hzUeyGCwRGS7WCfWEAyTKw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=2dS5UIqEM45N3m7Sd7gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA4OCBTYWx0ZWRfXxwuyVGlUbHtw
 Qg8jiBIYgJsBJ0/GBFf9FGx9JbS/8dD45EqSA7MDsnoZggUARaYOWb3vQFyz5ZcUjOyqTWImTcv
 o5/kKU+Uf3lDW0N3nOAgJt33RK3S8jg=
X-Proofpoint-ORIG-GUID: SIIfMdvYBvpJBjukeA5-FGnv8sn8yokz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA4OCBTYWx0ZWRfXz0h5O6EFTprx
 z6PeKMkF+iJhUrfn8jpDAsEfikaZ9gg+ew/pE3cdC0EB+29EcEfIgbUdZuozqiqiQ6EJqPT0S4q
 auOcxP/RL8DrytXI5JpV8gejy/Dt2ml7SeQ3yQOft9HPZd/UxXDK53Hd7bUbzyNr2YJyZRc7KF7
 DBJruvS0ri8w/4Tbx4IOs+uB2LHcT+cUVn19if8ye4u6jP+Of+AAWJVPKZbsyagroAHBylDCby6
 BYkLPe37ZsU3GrrEGmxgjF9iMPzNUxE3Xe+9XL/cfcoyTnz/UU5u3F2I/70myAYxPdgksj3kPLa
 v87mGNjXg9n8ioeK+HzYQ4HvHbLeo9+M3Py44Eh+K8BL5h74kLXveoyebMS7o32N4XtRD2p5KVi
 QOKxm4DGojqfiKds4OOlVU+04CEBf1zdtrKUFSa+qNg8/VgPrb2IhgDnHGJ88hfjELP12CEfgA2
 18rbldfXrMzDiQ9Rmxg==
X-Proofpoint-GUID: SIIfMdvYBvpJBjukeA5-FGnv8sn8yokz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_07,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150088

On 10/28/26 9:56 PM, Srinivas Kandagatla wrote:
> 
@Fabian,
> My Next target is X1 T14s Gen6 platform, I have not tried it yet, but am
> hoping that it should work.
> 
> I will keep you posted.

I have now managed to test it on T14s Gen6, no changes to these patches
to get it working only thing that I changed is dt and tplg files.

thanks,
Srini
> 
>> The function allocates

