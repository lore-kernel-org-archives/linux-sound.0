Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 089F737B406
	for <linux-sound@vger.kernel.org>; Thu,  5 Mar 2026 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772704887; cv=none; b=uemgBjJoUYZoURlKDp5nM78Kzc375IkflWBcv2SOHaDnRcY1sMnI0HLF7K2mQd/oEzpz+PTu72iCxbVaMxpnaIFbcdJ57D5yW2sqtNRwRyfZj4eBy3CNVUhKtWBrT7KD/34sDZC9vOshjbIQLpI6uhYyYDCNcf+aF+ruoz186uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772704887; c=relaxed/simple;
	bh=wDLglFX9PA5cLOwAenyb1mY6R8BcHsFLh5owe0fFwrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWvEbGL0N0pBgOxSYjdO9r3XQtM4660zp7+VRBk95V5eDnbpm05QaEAEYX3gCXdezC85RRwDv5pJeaOEzGj9FaYyq41oyu5LdAPWGUMx50sBm7cpZHNqtH2EruvQ0cVkhR3AH9GcXNJ80eeHiEB3Dd5RobB37nAq1WUNMmAyBzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EcmSfzwj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cJQpuFvm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EcmSfzwj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cJQpuFvm"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6258l5xd2665215
	for <linux-sound@vger.kernel.org>; Thu, 5 Mar 2026 10:01:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gHxqPY9FPzuJxFhy7ETC/+90zdEbUqq3ZKx36kD9wGI=; b=EcmSfzwjRjV3Sas2
	SkjRmkUDYgIihfasYP/Mja6WBtDmZjnUYeW2YxgNXjOS3V9yoy7Ie5T4wJU30/z5
	uckV7Wf8lPmlpFOJwP+jr6FmN7RBrUz8mwMlfc+tlpcMUNrLxPzukypOMLmbyv9a
	SC99ivvboChdVAghDfp2NkDY4q3XnK+1yDXRm6+QsWcNWZI2fuVntGLHl4r7EHty
	OASjdEalIqJ+dQDpF6RIquDIZ0Oqjm6Iu3A87CqHE0QCJTkwhpu06m4CTKafPbNd
	0Ub5pWSnutdkASWoigVnh7LapJyzmJwsuq3SC/WPnHwk704A6JZSM/2zRGm1zmCY
	wFaU2Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cpuhb2959-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 05 Mar 2026 10:01:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a063277f7so16712456d6.0
        for <linux-sound@vger.kernel.org>; Thu, 05 Mar 2026 02:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772704884; x=1773309684; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gHxqPY9FPzuJxFhy7ETC/+90zdEbUqq3ZKx36kD9wGI=;
        b=cJQpuFvmJ4slW7iwnVjgxhW8D+NFkhS1Yp+AimT/0w0qvQrXrqLKY2vbG3yYxascds
         Xvp8H4bEAhhHNG1Z2x/JxZPfpxIYfmRlLtEbxKCmRw9cQkHpPJMIXGwqU/s1swhj7o29
         UrMNbYR+rIpJJdwZ7WsSfeHrFxkJ3nYPLEoiEA1c3/7xE6a5xwPJbKq9vlG93+wnOIEy
         hIwD4bZuUHw1jCrayu71ShO3FYDlCtf3o/M63m2F1zIwsNCx1bzxGi1y+f6/4jKJ5tOx
         rs3+UDhaFD8crfLwRF9OKpjEtDPmEd+YmtPdZqnD+5DApQva+LbGRyo2GUjArIE6QMb5
         einQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772704884; x=1773309684;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHxqPY9FPzuJxFhy7ETC/+90zdEbUqq3ZKx36kD9wGI=;
        b=Lz94sDINynPLRVJ064Hw+73g0Xl59oVrHOJtzRI+9zJd+Jwpz/uxMt+cn85WLEDL3/
         0VfwW9sTFgZfkmzgov+RnOTcqeBiXkVda3xsbEojrwV8u36yRph19/siry4JlzUleU7d
         on3dQO0TNIzWWCtt2QXtrruSAgUUVDMq1W/PkcOuEmlv1pliVuXXI5gk3qfLuUo+w8m9
         Z3dOmGRBKq3To5D6ka0AcRM7z5ScZxXm076MSgtsn+3oMpF2lUpmPIpVV0pxOiZfEnlT
         ecYfSUvztJ4nVxUX6G6I1L3l+6+NU7lHK15+cdflvhQ4FTaJXNh9pJSQ3Vh+1yRJtRn+
         HU/Q==
X-Gm-Message-State: AOJu0YwfefGORXy7o8BZ0doyeKtbREWMvcr/0dau9huvefGXz/vOi5Gn
	iuK49wE6E01dwETdGBoEAGngK2MqHbAnnDAvE41m+iHHn53hOLGw2gsbgiYaI5YKyFsvMsBFV/B
	U0iofy1Jj7TbK1dLPW5Nl6bhmSGWObeMPld+fo61cXAsEHTKxek7gOJ3dTLOJ6aI7bw==
X-Gm-Gg: ATEYQzzp4LFfesd4EsyqBOntPHeLZvHrzKyDPxkrx+KRnPa7571mErkmwW9Lrhaey+w
	7YvyV9KtCCoc1Iy1StKhUZ30CdcKTTQGsfPWPw9hgGC9XqDAo8u+lvNX+Zi1+0VRe94bLNs6kP+
	feEWYFXWRZ2K0z7PR8Bflbk1T9App2rmwd83o+ly/QMf8Qfw5NxEJ58CWV8jnSE6fFkgDhVS0Mr
	DPlgdvd6tGCA278C1ONvlMaMNJYYSHPxcyZQoEJQM9DbW5Q684A1TJB4MIlEFmp6JYIbZK1GU9N
	jZ19rKZnHYoYSR4ljlthVXkIx+RwWliLeHdsUOuZVKKiXKZHFjA81OKmMnbM18aZiCNv1rB8I22
	gTO1ppT71t6/20VTNnhmpuZDf8S1QzL/a1J/ESuRJ2OpsIx7LcN76AL7LzVzqWjfWid7tFqaJ7Q
	9pUVE=
X-Received: by 2002:a05:6214:6004:b0:89a:b62:301c with SMTP id 6a1803df08f44-89a199a57d3mr50520436d6.1.1772704884062;
        Thu, 05 Mar 2026 02:01:24 -0800 (PST)
X-Received: by 2002:a05:6214:6004:b0:89a:b62:301c with SMTP id 6a1803df08f44-89a199a57d3mr50520036d6.1.1772704883594;
        Thu, 05 Mar 2026 02:01:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b941461b52esm37668466b.29.2026.03.05.02.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:01:22 -0800 (PST)
Message-ID: <b63a9bde-c2e7-4718-878b-e4161eecdc0c@oss.qualcomm.com>
Date: Thu, 5 Mar 2026 11:01:20 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: qcs6490-rubikpi3: Add audio support
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Daniel Drake <drake@endlessm.com>,
        Katsuhiro Suzuki <katsuhiro@katsuster.net>,
        Matteo Martelli <matteomartelli3@gmail.com>,
        Binbin Zhou <zhoubinbin@loongson.cn>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Roger Shimizu <rosh@debian.org>
References: <20260305-rubikpi-next-20260304-v1-0-327595a4528a@thundersoft.com>
 <20260305-rubikpi-next-20260304-v1-6-327595a4528a@thundersoft.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-rubikpi-next-20260304-v1-6-327595a4528a@thundersoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDA4MCBTYWx0ZWRfX6V7wczCKHNH7
 JSF6MjB5TOysDS3x8O/ndy3L+FD5+rSbyN3ww7/FWIoaNUzKmJEpArilrvtMKXGJKB6aerPTNEu
 ZWirnMjX7tOqgJukbGLLO6MHWqyaIbMi0QAXb8cqmm8UWFCjPrUKmzaiD/LlDZsM6c1PHaJ+6ZS
 CHPmHC/mnXAiCInv/KgpEl7o/H8/2/ACuEThws94mnsFV9CUMMrXOiQxzbHWGPneO/jmbV7QOuX
 ExksstRevR4/8yGksYtFIEi2+GB4caCOoi1wNKzRjsNM/+7KHRu7xp1mHYS4CxaivGeZvbbXCeh
 s8iZdb1FQqYYy/i+0akw2FNtbayPjbjrt3QSQ5ke/jThvu4r57UEAaX4vGZJ/SDf4jq9RS9Hfbd
 kzoj+6Q2Ra4mCI+lmxRapHjrot+kAne47+FiRAmG54OtbXAcnnV4piuTk4a5CNIY3hqkP9rjCCv
 x/NCFmjTmPVY0XHDSog==
X-Proofpoint-GUID: ZwVHbNENHVm7XbxZgPse1tXb_In5439B
X-Authority-Analysis: v=2.4 cv=SqydKfO0 c=1 sm=1 tr=0 ts=69a95475 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=Wdb1h0LgAAAA:8 a=2bRy7qri546BrDWxAXsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=j5gyrzqu0rbr1vhfHjzO:22
X-Proofpoint-ORIG-GUID: ZwVHbNENHVm7XbxZgPse1tXb_In5439B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_02,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050080

On 3/5/26 6:47 AM, Hongyang Zhao wrote:
> Add audio support for the Thundercomm RubikPi3 board:
> - Enable AudioReach via qcs6490-audioreach.dtsi
> - Add ES8316 codec on I2C0 with MCLK from LPASS PRM and jack detection
> - Add fixed 3.3V regulator for ES8316 power supply
> - Add MI2S playback/capture dai-links for ES8316
> - Add HDMI audio via LT9611 bridge on quaternary MI2S
> - Add SPDIF TX/RX on tertiary MI2S exposed at the board 40‑pin header
> - Add LPASS pin configurations for quaternary MI2S and LPI I2S1
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---

[...]

> +	spdif_tx: spdif-tx {
> +		compatible = "linux,spdif-dit";
> +		#sound-dai-cells = <0>;
> +	};
> +
> +	spdif_rx: spdif-rx {

'r' < 't', please swap them

[...]

> +	mi2s-playback-dai-link {
> +		link-name = "MI2S-LPAIF-RX-PRIMARY";
> +		cpu {
> +			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> +		};
> +		codec {
> +			sound-dai = <&es8316>;
> +		};

'co'dec < 'cp'u, please reshuffle

and leave a \n between the property (link-name) and the following subnode
as well as between the individual subnodes (but not after the last one)

[...]

> +&lpass_tlmm {
> +	lpass_qua_mi2s_sclk: qua-mi2s-sclk-state {
> +		pins = "gpio0";
> +		function = "qua_mi2s_sclk";
> +		drive-strength = <8>;
> +		bias-disable;
> +		output-high;
> +	};
> +
> +	lpass_qua_mi2s_ws: qua-mi2s-ws-state {
> +		pins = "gpio1";
> +		function = "qua_mi2s_ws";
> +		drive-strength = <8>;
> +		output-high;
> +	};
> +
> +	lpass_qua_mi2s_data0: qua-mi2s-data0-state {
> +		pins = "gpio2";
> +		function = "qua_mi2s_data";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	lpass_qua_mi2s_data1: qua-mi2s-data1-state {
> +		pins = "gpio3";
> +		function = "qua_mi2s_data";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};

Because they have identical properties, you can squash GPIOs 2-4 into
'lpass_qua_mi2s_data' with:

gpios = "gpio2", "gpio3", "gpio4";

Konrad
