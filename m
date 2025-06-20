Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F6221FF51
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 18:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750444545; cv=none; b=rzClL8ri59nUa+P/deaT92lqNlKTq2OicFaqWYnCs4TL/oML/utu9wCuHaSmezj91O7DHnI5SHCP0rSgPXRyLvU7zhKW9hcgIj79+PY7RSHo6qkQro2c0oWizocX9hsB/89OQ9punZyJEJELdc+ufu9l7aS3hRC2HCOWiGy+OGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750444545; c=relaxed/simple;
	bh=JWMSYzBtLnLZCvwsZk3KkGLaQqwSbdl7evbVSyyidtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wb8eaZLW5z+REC11cX/GFAohw00SbSOGaLcDPl3z81yUL7rMJOAp2BIzxn/ddRW1KuJOUU/QLtLFKJfMlCbZqtIq2uvHauP0paF6ne7sc51VBG+Iv9gRR4ojoYTUJ98K3jxJojrhW2AfmNCLNty0rZy+baf7w++4Fl9qIFeKfnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5nx7/Gr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5nx7/Gr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KDHdqR017879
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 18:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJw9p79NQp28rgL0YjqCtfjNT9ZaiNa7ynXf7QFlFhE=; b=X5nx7/Gr7MmRCnEu
	ylS3DFsjLg6Dqq3SlAo/V3lwIKBV7b1RxrEClRzwr7TloClwe3i3vX1hRNTY20O0
	lltwffkVdYLQYVcoP51FkX7yBVYgwGWFV8j09CNuUWVKjpaa51WYwOQMDwiOZEux
	1lUFguT22EJv3rd4mMGu/LYPAjC2sYMHxd01+T6xUUAx3Gxs6CF8RimcXXzYeSyZ
	ZD2VcC5CJiVw5ZGvX1R/XdzA9kIPNxvgDL7YFboE4Gi7K/5KaAY4v6XU8tJiq5a2
	SRJJ2gF7NBP5vOtA6dw1LgPkl/GNwb4otu6qBuRAwN0KTGIph8WMJsI/ooBcCcfe
	PmmcNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47d0pcj84k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 18:35:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5cd0f8961so420090585a.1
        for <linux-sound@vger.kernel.org>; Fri, 20 Jun 2025 11:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750444542; x=1751049342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJw9p79NQp28rgL0YjqCtfjNT9ZaiNa7ynXf7QFlFhE=;
        b=kNY6NTaWCru7tm3OqUfmoDrL5qQVDiS/sVlK4oRnJ/O/qQ10syq1KviXDLTYsHYDWs
         pjbZvat5h2xdSxDdtME5RSPxXj5XODthWuOIlu1v2Y1BWwsxouNMHwakBezUrZ31eZr7
         QdiV4VesofS9iyllGn+RLD+mAEmcD82pOGtzS4X3X0s8+3aQtSMdxyY3IpxcOewZS4y3
         wcP8FkCrVuV/reO0sUgNgUFZEwWXp06OGmE/tAyiQ1I9kpY4NDlkl16I11VSXG9GimL0
         9BoqVR0YMYZUb3IqLmFtGn8l3YyzYZ+3WeEQtR0dplNDV08H13nZdmqnkwN71KAw7lul
         fEQg==
X-Forwarded-Encrypted: i=1; AJvYcCXv2BSEtijocndUXfdW9S+65S9/h28u0nv9mZ8l9I+7U0Sm147ck125McdnDzMtic+ZPG10QGpozvaPog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlm1D50Gt+MUQvmamLQfRSv1pDOOA/UbeM3AMJzwYdznbwkWGk
	pZ835bGtfQJSZa7G+aXnzNrHbAT8unTWSkojTHLfOYsURvUTT9iuYou8q/GvnwgNaD5D3ej53nK
	NanKE6tZMSJoIMNtE4QVNLMUp1OlcCabsaPli7ukg+wrMw9UZ7OTI8pd1G9QrwlCerg==
X-Gm-Gg: ASbGncsgb2V3SNFOuYgxAVdwXKE0CabO7CB4gY4So9KhVZtT4IlzlatQTaCervtNM4t
	15EMhvFkQKos8Asum7f+5YTRsWC5LxO9jUX6+zMw6fppzmav8DQ76R6BIpPBGuDDWkP8io0I7DV
	GUzYRRh6JzDcThWVySYZWVydLQh3X6Yo5Cy9nXjB8+dkD8y8gm4YrkccZqZ8uDPFDhwP9Jc+U06
	CV+2e0IGUnm4vdkD2dqTnyCqvfB3TFbrP0UYAvpklcAKmVZHqSSOwz/k9+hhLVbmg4XiJDUTpch
	UpgNdhiFLmWnNaXHmEd0TdWPiVsLw/cJnALoEfuruqf1YIt7nyZ7tPaXKgHevwtb1iQC2D7zOpq
	VuODAVMTrwaJ03m5ukppx4rztBRFUoxINgcVdbh+PLB46kDXvOzXKz3bmZ7igsNtv3BCrG8+tOV
	Q=
X-Received: by 2002:a05:620a:7003:b0:7d0:a1ac:e83a with SMTP id af79cd13be357-7d3f98e00bfmr464036485a.16.1750444541652;
        Fri, 20 Jun 2025 11:35:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsuEvU180uOuJG3lc80Lg0/m23ATne7omtzgMrhGIFzbRZsPZTYyD0LPioJVHR3t63qkWJcA==
X-Received: by 2002:a05:620a:7003:b0:7d0:a1ac:e83a with SMTP id af79cd13be357-7d3f98e00bfmr464031685a.16.1750444541092;
        Fri, 20 Jun 2025 11:35:41 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a2:64d7:15aa:a456:4eca:f826? (2001-14bb-a2-64d7-15aa-a456-4eca-f826.rev.dnainternet.fi. [2001:14bb:a2:64d7:15aa:a456:4eca:f826])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbbe4sm369113e87.110.2025.06.20.11.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 11:35:39 -0700 (PDT)
Message-ID: <f9f96bf0-3539-4e77-8d3e-b87ddc561925@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 21:35:37 +0300
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vnWl7kdyKc_x1fMkSJVotBgILwAdShO1
X-Authority-Analysis: v=2.4 cv=YKyfyQGx c=1 sm=1 tr=0 ts=6855a9ff cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5BTet7WxsRtOupFzBhsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: vnWl7kdyKc_x1fMkSJVotBgILwAdShO1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzMCBTYWx0ZWRfX4DERtfgSENAI
 OPbexN+n6j0xyyEN0RMOYTKQ1wpSOv600JnZQOmksPCn/gZ6wCPdmkz7Lq+jrwt2ThzfbI/6vUN
 px3IZyhIEh/meQVeaOCFzTHvPfPoAgYkBre1nCEzKPIebxGt/cJvs/J08Y+ro9GGqccoesvnT6O
 BI1AcKv0fb1ihnHpY70s6a/TkO9Gk2yNiGxYRnimwocDSCD0f9nw6RePO0Ro6cyPiuAk3sX8OyS
 ccpYdRN++9mq7PwgXF1YibPH6wJ9ZeZaQyKfCfoAcdDv38hcgf0EkEHcBKxg3spp2gnL1IDguiV
 XsCH+7DhCDyxttO01G8/N9ZIuSz+OUkIvxoTkkd1zJrAm1pH61FnbArpFsfucyNK7tg9j6OH0RF
 /HzJPKx36w3hVWKs9uT1xiR0MgzuPGk5tngcw1/qBfQEYQan/z1IC3lsvAY/1EtMtzUO1r/O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=729 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200130

On 20/06/2025 13:30, Mohammad Rafi Shaik wrote:
> On some Qualcomm platforms, such as QCS6490-RB3Gen2 and QCM6490-IDP,
> multiple WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
> To handle such cases, use the reset controller framework along with the
> "reset-gpio" driver.

How does this handle the fact that resetting one codec will also 
silently reset another one?

> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   sound/soc/codecs/wsa883x.c | 57 ++++++++++++++++++++++++++++++++------
>   1 file changed, 48 insertions(+), 9 deletions(-)

-- 
With best wishes
Dmitry
