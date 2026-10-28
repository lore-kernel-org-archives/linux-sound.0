Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194699;
	b=BHw0hMpjFqKcRC7Rifa2MtBAk0blZIjFz8QQtPQyharvfoYds9xFRId/XIaG7s/XvesJ
	 OtsRngYfwDj8DyHc2b3TezP70vQNJHugZ5qWJaIoZJSKR54hRRDcukhc5+95sdwrC9VVJ
	 qoGONol4Y6bmEOX+yJ1qI5bBxMWpKIkZEVrmF5+jpES33gHwqIW2vrvyAMccfaE/l0+fe
	 /1NsBJpF31lshdiyDLXyd1JEAo9V6ZO2CTw/M/ZA4rcjkptE4xzAKZxsE5k+qZUNMjjHX
	 LP6uJMAdgZLrzC3Rio2oFHTHvZoIeg9uqSmQr9GXQL8H261joEojPmS+hhzqlFTmkHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194699;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=;
	b=jIKCis4evKsFGPBEMInZhcQ4gK/bke2ybAH6vtRUPFZ+TUOSzDdOEJ7yYsoDsgQM3eTx
	 mC+wJqJEctS0ekFAPfQ3lOBE0PEExrUBgk14hwf1xtxptYb+K3ZKR3Jhnz/BEpklMyDnI
	 hBIZcE39tntFkKOowVNjnbjfHOJo08TVv3MHkBiwgYBLbzb3osEvr/BAZJ5jLR0D2relw
	 TCtN15LkT5468o3d2TpIrPVMMm7BQcyVN4WBWqIWFPBkdInOR2vvS0vWs+Pn7/vOxkJPM
	 6DMm25TtqMiZR/r0/TGMNeOMGS0ePzgq0D9Kf6mxVb6JnSiOp/uMmzpfj+doOMFWRBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kybmvRQ/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djHwWfUg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C46606A31D
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 13:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6C46606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kybmvRQ/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djHwWfUg
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe24l691855
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 13:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=; b=kybmvRQ/e8UryMBc
	WTenpDPQ1WXj2/WXl6n6Bq5zRTSaoMiIq1oHOfYCQs2rjN60Az7tYyL1caLBWoyS
	5uqiCf81wrK1zFnWSOQIieq+99Mp/7YDDAtU0NWqbMGq/yGOIG9i+KiL8yiR4GXi
	X72Lp3p5GyAH7Hd+atC3W3CIHzw89ogn8shdErygiC+Cx3+/ZCnIsh+o3RgASQYw
	nA5ake7yV87wcaPewH//Urw/AUqpqUwOlaJfT/+j3Xs0s89eDvv2Z5ivMRoET1iX
	xdHmIFy9DRmjwRxZPsUiPxJtNp+hFSemWqCalsL0lyhFkkCT/d5doiVtaFhagvjK
	fB74Bg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be2p4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 13:38:17 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so87790e0c.1
        for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793194697; x=1793799497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=;
        b=djHwWfUg7mpzu1uq6nHEi2OX/T89tBmMQmOfLP8QKR4P9N1VvL5X46Bo2yMkSmQvyF
         E+lLCfzhIe1dkpwgf4pdm1irvUr9+x6OVG+KPfmYaE+q/x468oFI96WGhtGLdRe8fDz8
         YGXT5ODIgq/ncLSNHLAEJjqMssWBDnTplw/oNePBO5sXq+sji9xkpfucYH/ihqSA7Etu
         y0qyC6DwlQVHM4CbCgApVUb5Y2amtDvHw1u/Y5BmvCKIuHv9vS9jXiYVUfFlq+3GtJ4j
         cGyD0/e1GbMOhB54JrkGghtvqZ1+ru4qF2B18UknNyanPGimm1B1p1/PdXVU3GNM76Ni
         KkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194697; x=1793799497;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=;
        b=p/xeDXOKmmDPKeDKdT1ojMBnxLPS1SDb8zznirEEpO1F3WpoojBIvsdBVwOBbYtaTl
         XgYAxTsNqO0McqdjsFd7+n8akdDXBNlhAHvmSIw5Oc1ac25vvbNQ69lOp2ZW6fpALKMH
         PZz2LOEAHVd3vFOpjAfc4ChOgQ8iBb9NtHGGX5yubze3yP+6MuxkllT7P/QxgHrTk46a
         y4EjqFlgljFEM+5Z4euGX+XkFHfSbPkgBN41TSP8ziO4ctHt6PIj53Ym9u6jr47Kbb30
         qOFLqMf9TV5NFpgO90K13tss4MVMV0wmA91rU96voKDgy+7Vg0InMeCuzq7MKuK/MvfB
         aMFA==
X-Forwarded-Encrypted: i=1; AKwUvBzDDqtlBMEe9eUv4delwfoZfZx6IdQ8e8llukXfTINGdmAYlq0Vuw2jvSMQWKqEjzKbwo29sG+Hhq5l5A==@vger.kernel.org
X-Gm-Message-State: AFq9FYK5qqIKVcbsgZzlwPJXoVxdFD/vX9ft/nNm0j+6OqDmq/1DZ1/q
	s/GxXe330f8RlNx6gsoM97KGcNOueSpiajNeA2MhkD/0Vk0PVSnXLy+9/OFrCNfUxTtcIl2a7TW
	xVIOvXJEHQFY2d9VIaVFCXbGcLdCh7EO6RalJbx6FaP/mxDHE1V+/0HCwC/ZidYEzlw==
X-Gm-Gg: AYBFou2H5Wn7bZbXs24NzA25ulFCUsxH/M3OVbtSw5ek7NGYUPwJ+qiiVD1nZtzHFBf
	EPX4w3vPQwlhq7Gq5NHFrGhQx94t+jAnxiEWiGZIIPatDtpO0LQ+n82Vw3nDngUMFXgIvGwuTUl
	gJ8um1KOVeedjInRuSWTgyNdpbklL80hi1cBHYMG+ppRvhKbzR+/qg0twkX7YdKeDLdJ+zXiJoa
	ZX0SvHRVhVOkbf4WkKjEEA1UiAIV6dMYMBA/jLRvLa/sUhTSMBrfIODMYS0ZvTAdbKe9UxTVuzQ
	7QXcWtULkE3slI7jLcI25hB4GmgHn0BhqPJs+RlN0/p8gzCWJ2yOwB/QdmukBHMgZX2KsVwXdsw
	UVP7HEdrUJ77p6i+WIp+aGPqs06bx/TZPUUi41o5CWlQYINCo5GAB/6tYmLTqw/3FXeLnNj8=
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr1020173e0c.4.1793194696847;
        Wed, 28 Oct 2026 06:38:16 -0700 (PDT)
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr1020137e0c.4.1793194696325;
        Wed, 28 Oct 2026 06:38:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3d9esm30451071fa.26.2026.10.28.06.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:38:15 -0700 (PDT)
Message-ID: <0bbe4db6-0c47-41e3-838c-37d880869ea9@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:38:12 +0100
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
Subject: Re: [RFC PATCH 22/23] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
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
 <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3RCSljRuvgEHzbsxUDVV2JZT33ffULRK
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1fac9 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7ERdoP64vwSu8KGZOMAA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NCBTYWx0ZWRfXyZo0a6PTvoEj
 hcLxqpeSvjJ6fyjabldQZ0vDUARaQOJxuoiauHv8ojTHKyWWNmnFpY/GksT5eSyCa+EimsDJ/S0
 NQBb7jMo2hO2tdpb9Msck2rFpJ0vw2M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NCBTYWx0ZWRfX091Jq8KgDZ0+
 HfxRSeA2RBzh5pbVSoIoAHFt4kKVXfujElVVWtk2xvhZLKOLpdDqg1Ly06uGbFxPBA9L7qg3r/a
 S0sOAx/oejjEgY+TZKZZCLjwJSSgqgIXXc0ofMIlEIoTCNyQ4aNCPy4A2WQPaSAVhSS4F9AivPN
 4CnB1OoBbp+znbW++Fh+g9sruaNTHkbXABcFSBGfAFcwLXzOZaLVsALOQshcOQimZwfgVUf5PXt
 4bCl6bmn4JqELXC2NVRdrkR2dLvULvBgATAseDSZsQbfePg6LH5RkGBHN15regqjyLM18N1HAmF
 s1JpV6KiGTDA8Obcze+0LQceYLhKHFSWpuHPr87aKxEFxcbau9ulSzvZc5badNO+H1djraVSLvo
 c9qkGChzE3HK6X0qTqA/czQi4R0Ug1mRXeOYaZvmAEg0mlVt+ia7StKHlZFv6Sox04lDW333c/R
 ehokDk4UhYkgW6uyHSw==
X-Proofpoint-GUID: 3RCSljRuvgEHzbsxUDVV2JZT33ffULRK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280054

On 10/23/26 7:14 PM, Srinivas Kandagatla wrote:
> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> 
> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 58158b51fe29..fddc76f59557 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -256,11 +256,26 @@ cpu {
>  				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>  			};
>  
> +			/*
> +			 * WSA SPKR playback-side codec DAIs plus the WSA
> +			 * speaker-protection VI capture-side DAIs on both
> +			 * WSA (left) and WSA2 (right) buses. One MM1
> +			 * playback open brings up both chains via the
> +			 * machine driver's multi_direction_codecs flag;
> +			 * the SP<->SP_VI control link in the tplg handles
> +			 * the DSP-side pairing.
> +			 */

I think this part belongs in the commit message instead

Otherwise, do you think we could bind the speaker protection
channels in the driver to avoid having to modify the DT?

Konrad
