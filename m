Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997323;
	b=grF5tPfJbbzGhWRs68UdlcGPU6eed5BpOtlIvFRKyAwXt1aNyL6iD0/pgmx1CYLCbAa4
	 84BsR/AOaBv6agWHRKKWqs0UmuHXg75ZL3gU0TM9ZyauBPVSySyloYJEuJY4MPfsRe/UD
	 P/OFbVpfFg5OPKwISBf839H90RdVLnwmz2EH4iGf+2JZas04hR4mh/Hg+D9vlnpPIgB6m
	 5tHiH0NbgWF6iOvKf6crpBT0yU1KUMqkkxh5LMLL0Q8lpQMw+mwoFASeWqXH86IhZvd/4
	 LwguXlOVdadWtdiP4d6ZAi/w52xnK1H399yR8Bh4vxzbWXlN2iuN+uJuxBLfXirsX/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997323;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=umk1luZ7XsKUroA5aUD5mENUuDaKJUgj+/jjMchHMTI=;
	b=PvInY66eAwC5D8Mx2qEwzpMGCXKXCrFKUc4fbaFFNnqRrCvYADb4Z4pQAEKKXZhzchx8
	 bwXWZaYXZvESuqvzpciUxkTHCXucPN2oCZvz4msTTiidFA9qGnHn/tznsJW0Xdg3ivMBP
	 9TluWAUnUKyEc+IvdMKzRYmdkvUK9Q+fkKhII4jPcfrpOxoVMxgE+PdQvuWLsQ1Da7hCg
	 Pb7G3Wxd9RJZYks0UM1gmJFooJ+3+QtEouAKzvXFsUrFr1f6uE4AKKZ/kfLPKMnSo4mxA
	 VAqgpn46JCCkhdyq0Q+U0wqJvnjShQ0wRSgocVz77qTloTZBSmFNFG8kfBfdodOmikg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="bEYIwf/H";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgVki5Wy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1818606A31A
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 06:48:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1818606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bEYIwf/H;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WgVki5Wy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4ahx31708828
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 06:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	umk1luZ7XsKUroA5aUD5mENUuDaKJUgj+/jjMchHMTI=; b=bEYIwf/HuLuugK+4
	f/v0zBXJeHH4oNelfp+4L8Aba2LEzen+zqGJsgS68v5/SrQXERUIlEY7xg0XF8Em
	ksvEBfxY9y+7ytRl0mPJZBiU35NW3+MRC8XQDCCcjLmJy1+mgyl88QJ6zwp6kV3d
	ppFlZWtyElUZWP6LThosNYdXZ5sX0cLxJHMTsLZtrKtcqNQUpa/rUiE3yPA4gY7x
	Xh4fXXi6Tg4wq3wgd7a48NvxplZaoJ1IgHtTN3KsIf80h5wEwPSqLmhbbBMhTBOl
	az39aRswkWQT/OgAqw8Axepg+gw9wRoyKBAzP4WtQa0tTDWedXKpnWkyXxB+PdzE
	GR4deA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjd9751-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 26 Oct 2026 06:48:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso5169470eec.0
        for <linux-sound@vger.kernel.org>; Sun, 25 Oct 2026 23:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792997321; x=1793602121; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=umk1luZ7XsKUroA5aUD5mENUuDaKJUgj+/jjMchHMTI=;
        b=WgVki5WybWcW6sEL7UvSDBc5Y4kn1oIqQWuqf9BBxjWi65ygpYa7axZautqx4H373G
         rkoMBz/iEms0LGG+FF5DRRIkXzqyitNtN9aeOJqNOX6ANiHcDHS9MUsxyb7jUYdBXARt
         vF7xOfIZGJYYOenzXV8EREfqrSrSVLH/XJVQupjcwFKye6YnWz340Y5mviM/NojkBXpE
         rh6/AGd9y/thKy3LghiwyUEJP539bFNpry0DoTGu98f6T1bw79a/hVHN4iSwFKdR7uvb
         HrfQOXQFA3XVbtNrDhcZY+KZgemh7aO/qskKtcpv7QCUhcT0KHDusOdRPtkuXPlcE8aw
         IJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997321; x=1793602121;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=umk1luZ7XsKUroA5aUD5mENUuDaKJUgj+/jjMchHMTI=;
        b=vVHN6P09n/Xe1+pvEvTIAs/p88s08iN35jvlSDFe98bscitHPwL+H9SlSp0FiELyGd
         PnunaSSJu7k9ylLoQO9PFZp0y+cH8EZSO5ANCWsRUHFZ2Gp6tO4kzrRFXhbdgb5TFToe
         +YLTXl1XJOGe0N7/HlqN+7k8mGpwUzUMzEZ5dlHvOHY8duj2FIyPp4WNmW+UZoYNWZQX
         7Roe52V0cSrY7kSbU4Gw6FM44ci3mrd98J8e3pPwnW3oxJLDHh8nOKnqVV1++X4MRUlT
         TQhvOhVxVzO4i3cJ5ZNPbnZlxegYNO4S/ix0bzTdTrV47h21tQe00q19ZbwB6XlQQach
         qnhw==
X-Forwarded-Encrypted: i=1; AKwUvBxxWkSszLLOT1xu3i5L/H6ErFgCs2ddLJZ65hUshEvKJZdfxfxrRAkBPA7vrS2c6gjoIsYlgYvIWHV5fQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYJnoO3EkdhxYFcSg5MeXOWhU6Hyhon7L8aQvkzm+UQa8H+mBWRU
	6xfd+RVIOJzuiEjthNCjrn58NENRVcfPgRxEfTlT4RIP0WGQHTlzcCIFkfxY7gAlPVDjmyvvxoi
	MEKWB6OyGYbVwADxtzayQzYPHKWDdCT5SjjGCitbmp4yHRMJOtIr6mAyY8Z4EoflFHQ==
X-Gm-Gg: AYBFou1hdUVsN1lDBkmVaFJwPjFAkVjKucN2nawRXe79u6BFOruN+urvL7TYbKcFG6i
	MyBv+52G5eqzHrmtSN5NttcHR0WQTAktlNFPwlMvs3DubF4mQ8PkSLwi3Rap5y5gsVSCMHWhqrj
	+4/wIAT9pmabxX9UPCsBdMBSI97hPHua7OVpDcxSXOCChNiaB6L1luwJDMR+Pt4XNhMqvWfuj4R
	sQn1bZgjg/McWb+DvpewJAtdido0UIvWN0iWN3rXLVDR3erzo1nce9+h6XKO0WRtciSp684m95n
	9nv/f4jtEImYSic9OuO/pqSYdWMxOCr9rMK/KBX1zGb2dWwNyKnfzZcyiEEiNlxEkKUAfcKUM80
	f+wVSIMZkA5Z4fGslrHkN
X-Received: by 2002:a05:693c:20c6:10b0:367:a092:3c73 with SMTP id 5a478bee46e88-369e84b1cd1mr8538758eec.12.1792997321061;
        Sun, 25 Oct 2026 23:48:41 -0700 (PDT)
X-Received: by 2002:a05:693c:20c6:10b0:367:a092:3c73 with SMTP id 5a478bee46e88-369e84b1cd1mr8538723eec.12.1792997320290;
        Sun, 25 Oct 2026 23:48:40 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm12718581eec.21.2026.10.25.23.48.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:48:39 -0700 (PDT)
Message-ID: <2df45439-fb12-4668-9b42-383d5975a902@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 12:18:34 +0530
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
Subject: Re: [PATCH v1 2/5] arm64: dts: qcom: shikra-iqs: Add LT9611UXD HDMI
 audio overlay
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-3-karthik.s@oss.qualcomm.com>
 <b7kzeykjxoiuf2m4klkga7rnvtri5vs6z7qexe2uskrcpsh65s@dpkzcc4ykkiu>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <b7kzeykjxoiuf2m4klkga7rnvtri5vs6z7qexe2uskrcpsh65s@dpkzcc4ykkiu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y-wflUAUZXD1v3yXBV_MMYzJNdF1Ig2o
X-Proofpoint-GUID: y-wflUAUZXD1v3yXBV_MMYzJNdF1Ig2o
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adef7ca cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=RYTj8pPuvwbYsVMnchwA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfX/g7CgLuQQ9Lq
 ms44HvcVAl5rNkI1GOkwewI3wP7xsvkGs9Qh0cCX5UyriZNVkZW4VAi5hoSV9vOR1iRxctzCPeZ
 QVlx5NA4LbsWFjXH7YcpND6fJXHXwjU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNiBTYWx0ZWRfX9XUNbAzleLXV
 4F08fOaX0hxEnEag4nwKew5PNOb2WDYZOkmOI7t7xrbokziWJyhPt/SghElJwlmqdEgQyqw4iMj
 kn33hsUGFAqNnmbGCdC4y3rg2bAFhz8Bnr3QXuUfZd0xXrEXrovOVhsaJ+Nl7tsEJhn2kRfmZeE
 QyATQ9W1WRGljtEKgI/Qsc6CWubiM9dmupo17hPd8WtbtsllSKKBfjmTdpbYCqkOcwTpnfU2pdg
 aHDUOqtXTdeG9V74YBgpn1Cuz84UxJeYUwbbR05ID+nzO6oYh7SSOSPUAMehy478SlB/sFyRtii
 NdMaGCAwojngOGrQhuF9bfllQdgGfxeej6IddFmG65DDGgRM3jU8BexsASR46TxSr8D63o3G4rZ
 oYlB5CWOZXqj4+VcIR8puVy5SPjdx2WMDyAxGdjx9xrdKoIY9e7cOzSfR55HDrT3xpkhshpRTqA
 wogtxWJQq3NltjTufkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260026



On 10/22/2026 4:01 PM, Dmitry Baryshkov wrote:
>>   arch/arm64/boot/dts/qcom/Makefile             |  4 +++
>>   arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts   |  2 +-
>>   .../dts/qcom/shikra-iqs-lt9611uxd-evk.dtso    | 36 +++++++++++++++++++
>>   3 files changed, 41 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-lt9611uxd-evk.dtso
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 1c86e7e98f55..127c5c345eff 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -339,6 +339,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
>> +
>> +shikra-iqs-lt9611uxd-evk-dtbs		:= shikra-iqs-evk.dtb shikra-iqs-lt9611uxd-evk.dtbo
>> +
> What does this overlay mean from the hardware point of view? Is it some
> hardware variant that requires reconfiguration by soldering? By changing
> the jumper? Can one use max98091 and HDMI audio in parallel?
> 
 From hardware point of view, there a physical dip switch which in "ON" 
state indicates max98091 codec is available and in "OFF" state indicated 
the lt9611uxd bridge chip is available.

Parallel use of HDMI audio and max98091 is not supported.


>> +
>> +/* Board subtype 0: LT9611UXD as I2S audio codec, no MAX98091 */
>> +
>> +&lt9611uxd {
>> +	#sound-dai-cells = <1>;
>> +};
> This should be a part of the base DT.
>

sure thanks, will update in V2.
>> +
>> +&sound {
>> +	compatible = "qcom,shikra-iqs-lt9611uxd-sndcard";
>> +	model = "shikra-iqs-lt9611uxd-evk";
>> +	audio-routing = "VA DMIC0", "vdd-micb",
>> +			"VA DMIC1", "vdd-micb",
>> +			"VA DMIC2", "vdd-micb",
>> +			"VA DMIC3", "vdd-micb";
>> +
>> +	pri-i2s-playback-dai-link {
>> +		codec {
>> +			sound-dai = <&lt9611uxd 0>;
>> +		};
>> +	};
>> +
>> +	pri-i2s-capture-dai-link {
>> +		status = "disabled";
>> +	};
>> +};
>> +
>> +&max98091 {
>> +	status = "disabled";
>> +};
> Keep the nodes sorted.

sure thanks, will update in V2.


Thanks and regards,
Karthik S

