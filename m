Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA9129B77C
	for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 08:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758876620; cv=none; b=eTh6hmdd3E1ViIvMPKL4Ra+yBbhu8/Pu+Vf3HqBm27RollAjA1tDp40ZByJGS9xRkyyc4cB6XiJ9ehA/WVI9WWsBoNa+mfOTxT865FNl1+67HV8yoV9b36xugcoC4aP8us69700Cv6P/9voRWaD5fowtS/3RQG81M/vl/pfXfis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758876620; c=relaxed/simple;
	bh=DW5PR20rrpRjozhjmQF7SX9wg6GFQc9bhuXeEh/lm7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tNdYrzEAipbWDDAkYBiGxAhMMqp7u6Wx48UFBLWM0AkILrhCdrktNam6rf/xGnviXAz9bcMXbzC9dKFMyTcA3i3bfICHZtVgNmdkS74FaMesGjJQ2vrf1zDUCWIYVBhy2sxUl1BZ/UA4C81CVPtf7ixT6kLgvJDqKHmBSZy42mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQeg2Vsp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQeg2Vsp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q71L2F014304
	for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 08:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hAvJmzrwoSb3evK5QrOHasbm0i6ySDURtAIAeME4WEE=; b=KQeg2Vsp8pY7kAkX
	m6rMUbmJSMEIKwgoIERa7LulLjSLELt8hiu1+IYMv00GPc5ieNf3NAF40MP3wS7w
	dTFRo4CgdmzXsaN/3r68cQKzeMyrViYEqU69TrIrqEfIVUDA2OAk9PvPSV75/YRC
	js4NLs2Wi36DbK7EtFjIBXupnVnxtU8IQYHl38HwRIw7hdltPcaksqAF7ahiRnCi
	EPee4tLw52eu2eNitIONh6+DOvniIs5W/h75KjX5gpG5M48EDuJhD6DgXuOwz9qI
	7emCJKiJNJ7AllZQPh2QgkIEm+OEcpYWj/Mw8OXl9VgTZ2Nf8iDDHcAYpx9M3uXD
	KVLVdg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rj5e8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 08:50:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4c39b8cb20fso4434751cf.3
        for <linux-sound@vger.kernel.org>; Fri, 26 Sep 2025 01:50:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758876606; x=1759481406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hAvJmzrwoSb3evK5QrOHasbm0i6ySDURtAIAeME4WEE=;
        b=cC3mGMuDV+oubqhqQ+OCgaG2cJEAP9zRZOWwL4hnkFZ1FctVlXmJuCG7BfPyd9gdKo
         7saXPikvkyfwtokMJIoi8j029Dj+EnUlgjFv+/j0xYffzUU+Xn23yYW3YqyvhI/tl3Kk
         e7OT0dLIu5nMLbPQKMN3Sbwz1MAeOnBXQReThEfImb7HwhnAHVzD4jNPsf/cJmytYd7L
         BFe3CIkQsTwCtTDxHI2jRrT46vvMvaSP6rhvNVw6lMTGCjT3t0O+PhmY+j1bSzlwsOZY
         cAaWB+Ifm8hxI1x15AlXaBA+1oKiWADJ993JTqxtNoUNiIXdMMmtb2xO96gYBSVPYWPe
         eUog==
X-Forwarded-Encrypted: i=1; AJvYcCUQWY1QcwNEP8bWJ08kM0+0bau806A/T4dGRB2enCJFyjaQBg1p0C12fclZ7IXTmNsd4YXUBbAUaxnTmw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAlL4n2YrEtwKVV2IQ/AfEwPhoIq6TtM27+Z9gfgMt9M85wfHb
	dfe1bGDaS6A+f0w5vE2aqaKWAKEOWVfVv0CAjBiCDxwlpOUwB+i87fD9ynaquNtmE1xEOjFPjgl
	Px4TdVTeTcS1W+qfi5ni+G097zLbyC728Tlt8hb1ttX2Q88oqcxZc7usvfu+pIh9ghg==
X-Gm-Gg: ASbGncveC5aoyxYROU+lSpWAuhHgm7r+QSg1y0g0UCBipm+TH7YRqjyEzYkXPgXpgm8
	3LssISKMq9mjslpoRkxqAIXm8LJBARu93WjAECB6sP8lU4KEk+P5WmjSvMMx8re+rXi10YsPsry
	+mwNEgnrQxyvOAzpvcp/uK/V8cnghJFfDRI/vDJIGalFk5XDD9vEE/F0oA3/ORnyLn5bQWhfwhM
	D3zCjkUzxqRKuXz6HQYojqIQkJJGi28VxHo4HmEzCQuS4PcYS69Al9sSA7bLwuX6tFYwEtwySQc
	ki1EzDRIKxExHhRfBVXPYd/DCbFJBRG2HjH6glMIRI42ZC6H5L2tFNvCY3vxVfbdzegoA0zTfcj
	d4N1HhD+EPDmeSFTuZLvPUQ==
X-Received: by 2002:a05:622a:1101:b0:4dc:fc58:c50c with SMTP id d75a77b69052e-4dcfc58c83bmr20483391cf.5.1758876606335;
        Fri, 26 Sep 2025 01:50:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEiWvsH3XhfOSeK3PolvaeTD1lJD0k/Gm0XDb40I/xEqlYRxnruYGzyeye0H22WTBm31aZrg==
X-Received: by 2002:a05:622a:1101:b0:4dc:fc58:c50c with SMTP id d75a77b69052e-4dcfc58c83bmr20483151cf.5.1758876605736;
        Fri, 26 Sep 2025 01:50:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b35446f79besm326034066b.69.2025.09.26.01.50.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:50:05 -0700 (PDT)
Message-ID: <e7843f88-71d5-4f7e-9f99-df06630e02fa@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 10:50:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ASoC: codecs: va-macro: Rework version checking
To: kernel test robot <lkp@intel.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rao Mandadapu <quic_srivasam@quicinc.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
References: <20250924-knp-audio-v1-1-5afa926b567c@oss.qualcomm.com>
 <202509261315.O9CiiXjb-lkp@intel.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <202509261315.O9CiiXjb-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d653c9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8 a=zXO_E9iLSFoZqPovHQIA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-ORIG-GUID: L0tafdgz2cGhzy8pXSssc_tPxkkQY3so
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX7MFWtuNPz5WA
 wN7oC8+pAjxMliLM7xQOGUEvAAUFR8cfLaS372t5c6+mxPZpAHFtZ70I9bhF1YixDXgR+v4ZJDE
 J1fk64O0YWK1/995a2VXRaINVVz594FV7ImrAQW16AFHxdGXtTH8CAl5SRZPdhcShyuji7vDgSI
 M7hPGPNWoMQ7rbaM601/o5cmnwr63zXsgWfJN92dh5pkaKRFAOOp3re5qrTU8F1DkRKSZcnFFTE
 UvpllovxfHZ9XF+uEw3GbR7Lmk/5MeiYoA9QAu49Ta0Eert3T/39TOPGRHg/MhRmIZpvUQ3FTzv
 MDzC5pUZ2b83bc7Wy3OZvfPVTE5kHvL/8QwLH1PyKzxfw3+RmFt6TFHrk7jIsF4v1Dlo41cTQ3b
 JaJfrChw6pYbbZ7j5yJfNrE0PK0Hvw==
X-Proofpoint-GUID: L0tafdgz2cGhzy8pXSssc_tPxkkQY3so
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171

On 9/26/25 7:36 AM, kernel test robot wrote:
> Hi Jingyi,
> 
> kernel test robot noticed the following build errors:
> 
> [auto build test ERROR on ae2d20002576d2893ecaff25db3d7ef9190ac0b6]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Jingyi-Wang/ASoC-codecs-va-macro-Rework-version-checking/20250925-080338
> base:   ae2d20002576d2893ecaff25db3d7ef9190ac0b6
> patch link:    https://lore.kernel.org/r/20250924-knp-audio-v1-1-5afa926b567c%40oss.qualcomm.com
> patch subject: [PATCH 1/5] ASoC: codecs: va-macro: Rework version checking
> config: i386-buildonly-randconfig-001-20250926 (https://download.01.org/0day-ci/archive/20250926/202509261315.O9CiiXjb-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250926/202509261315.O9CiiXjb-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202509261315.O9CiiXjb-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>>> sound/soc/codecs/lpass-va-macro.c:1479:8: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>     1479 |         maj = FIELD_GET(CORE_ID_0_REV_MAJ, val);

Jingyi, could you please add:

#include <linux/bitfield.h>

when resending?

Konrad
