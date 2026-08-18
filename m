Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F8B3D2FEC
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 10:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787050252; cv=none; b=bNbz5Kt/gWkxvwZn2h+j1EKMIsdufAz71FnqPl9GAMqefIlEGV8b3P9ZUGzi8Ehd25jAilNA6JSI7R5XB0ArItkItnjproq85agE3+gslAysL1FGzujRd8Nywfkb4/L8QRpfXMTikDWyEqBfWwLRRgoPMabU8uOeLljrhyWCBBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787050252; c=relaxed/simple;
	bh=1y79ymj5dd2m8Bm3DANiV+fpQlH4mdx3t+K93XNVtrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d+69xUlgd3hijs6Plq6aNN2Jbgj4uN7yDixj5JFjZdpNidRXvolTIOfQCjdFpCr0ww71OQhv3ogTz5/HDiHM3bna5pV3GErnpNbkkaCCTu3wmD3rIUMco6NFcvGhHnieL5AzhK9hvqM8EwZhutdxPL/fxVRlkt3PPewpoPYWucI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OP8p+9C3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Utdlsrzg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OP8p+9C3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Utdlsrzg"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABX4V581260
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 10:50:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2jF0ZOeN1fb5iTAN1T02dkgvczfududo32WGzeSbJ1I=; b=OP8p+9C3f5JMLys9
	Q05SxH46tWGqiNTa3wFJqy/gWSdqaCynz99m3OaerMqn0fRbIMYwVzVpX5S+L+k8
	MV3QpSp0vMmE7jyAoxxhlC9NOZXga8ub+nJUiddMlg48AVBM8xYTQ8xWNMBm6orY
	nyWCS1SqrkfH7maw9gxIq0nmLsiSzSUfOzeG9pdNsSVc2Gnhsvg2FkR1Uhm93SvK
	P7cDapEqICt8dcqAnEdMASWeSSADYFukYQdRAXm0B7y+rECDMr0bAISmp/boGEp2
	y6FGi0w3xZT3JK1JHdpOWPWWmgQdlDhAo1d8ynvl5h5KAKP7scYlpTK0BW4aorDE
	iqU6FQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba9s3h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 10:50:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9349ba88188so115651485a.2
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 03:50:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787050248; x=1787655048; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jF0ZOeN1fb5iTAN1T02dkgvczfududo32WGzeSbJ1I=;
        b=Utdlsrzgg7KD9U5zLphSI70YZA5xsw3OUMgA7GCHtZUs1mB9tOCeaPmWoZDQKidcP0
         /rSP/b6yutQDT6sOPQPoAAEDUH9Pw1T9BlvO+lWiWsMUua1HeWPHzplfyFkmD4wVYNsg
         dKU6lgfycBF0FuDI17jSs1bOf0y6XjXJ3IFbJoHK6HmkPfLyLWbBdkWa+klajghWGHNb
         1mNevP/7oTcPuLtCp/JYacLY4pGiNOMw6auVT20P/p1I5r80t27G6jckjzuFEFOaAPQF
         hN2/oIISQzsmo8A4rrD3njZ5rRSvM7zQgjAApMVwavqr+HVr1emRZq6n/jaZAEpFpjsp
         kd2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050248; x=1787655048;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2jF0ZOeN1fb5iTAN1T02dkgvczfududo32WGzeSbJ1I=;
        b=UppoBPL+3Qdc857NMBq2UoS7VGQWh/iXAHTaXF05R8CbArM3061v/he/TwNgBb3ub8
         NedVhBKpFRp+NCc8vDQoVSzcobIcm5Om69kONN6+Kt6WMKg51a86lh1zxEYr1TidHcyW
         h4Fl+ir1vP7k6NdhRFI0ud0o/MgwAjJSNKV7PoRaC9YhveBfkjXsb0ZdQB1Eml7GCfma
         xlAWkD7HSp6zM6qv8Z587IfvDBpSBVq0cwQXHkCa0qZzHCp5ZEHoA1p8b6xzeatocvWk
         5fh5Cg013VhyyuzIxTqTt/iaNk4mxABVUj4gZQ3QWFBg3B42DEbNmqmtW1+DGJqhgGbP
         XnjA==
X-Gm-Message-State: AOJu0YzpVAxuTlnkUtUU30P+koHKIl/keSSd2ozS9ASGCZ4DDxfrVE97
	WwwG+KerHlYSiNX09ZagJEyd0Vwh52v/RkDS2jHRZSzX+5d1B7bC/zEFvnRzHgKvcbKzKbAbewl
	C2nmooj51A54f53+o8zNWOMB6T6Lu76WlJAHd5Y03l+MBmi6DJ9mU9Bd5Tjyv+c9ciA==
X-Gm-Gg: AR+sD11EEf9OJH8wwf92mmHd9ZZZl8axKtQd/EFjQkBqjwkt5vamSuTa2U5TawIpv5W
	dWKNjanXZpZdo9j/6AzCX9Go+1EgTwmnv5TE/pPnU85zmhgVaoQYtK6mrZoX5dc2ch8ONYOLxR9
	sq8fvIWDzLqarf//8zjs67a23wD569jqHBdKvVsKESxe0qVZK0DDIpjLjRdFGrpe1RClU0VNp/f
	54XEl0zWLyHw+AG1guUyKPcRlogn7+GxEHVLC64CKy2povO0MIjhpoLyc7KM14Vh8JqdR//EoJj
	im8XQ662giM+iuNMj6sfivcmW/jfdlc4acbdBrBH6yAikCcsvQccUm7ETyQUNCIzR1bBUF9BCXR
	0PlbQxxTgwMzYWNF0YefDPwoh
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2268342085a.0.1787050248431;
        Tue, 18 Aug 2026 03:50:48 -0700 (PDT)
X-Received: by 2002:a05:620a:6846:b0:92e:5272:4e3e with SMTP id af79cd13be357-936d1f0a69cmr2268340285a.0.1787050248073;
        Tue, 18 Aug 2026 03:50:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fe7bf4fsm166717066b.5.2026.08.18.03.50.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 03:50:47 -0700 (PDT)
Message-ID: <cf3935fb-2aaa-4944-b879-9d7ef4927bf0@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 12:50:44 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/3] arm64: dts: qcom: sdm845-oneplus-fajita: Enable
 speaker codec
To: david@ixit.cz, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260802-tfa98xx-upstream-v1-0-4dd55cdd658a@ixit.cz>
 <20260802-tfa98xx-upstream-v1-3-4dd55cdd658a@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260802-tfa98xx-upstream-v1-3-4dd55cdd658a@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfX4iQ6XUWMzR1a
 8Uli7Cfwjk+yNJEYLDSMoVc1/Dg+b/m7oeER8pOlxOIKcKqPrVizmWdcLXgThMhb6+kC2FXMHjl
 pgKqGNEf8Q034lkPqaAiibtGs6LLSNA=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a843909 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=xXM3z9AiURNY_ivmdoUA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: lXwnGyf0QgRnT23HyuwJup53h2HuTEiF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA3OSBTYWx0ZWRfX8pCCqqn5hlQS
 mbNWQ5xxIsE/hEgoTj20XnTYQe+VlUXbRMcb9gw/DSfo9D7gsUAbDbByxoLtGt33M5oIN7dOw9e
 Yfx8tblb3BhrJQSwQHOb272HgYrJfyIHUcO3wIblx1E7RVxJxczgLoLoqKnXfG80Fej2pZCxhUK
 Cwf3HNaAnZYXM4+jQ8fKsiYlDkkH3a3e7Ja0MAr/bBAXfH8jvmZbIsSTR6aZ183mCeU9XqKfToJ
 M0B6N2pI9Q7tbk7t4cAi8GH5K5C8TgiQfi4tE87EdFRi69kmqlwCqFv7j1Zb6fsGuCFdYSN+MtE
 wBaZF5y4qqBCk8voJrr0WFtkZBJ3ckFkOa/eGBEfNSuUDsJKv41EQDTrXcdpAhz88tQEnUeGg33
 Yfve9kImBHV1Jd6/0uqGPb1/bGg1dQ76Jl2WZLcCb50D0GHJTl7degSr66irBxvImJafdeee12g
 9WkL/znlM7SsGti8kNQ==
X-Proofpoint-GUID: lXwnGyf0QgRnT23HyuwJup53h2HuTEiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180079

On 8/2/26 2:42 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> OnePlus 6 uses NXP TFA9894 audio codec. Enable it.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

[...]

> -/*
> - * The TFA9894 codec is currently unsupported.
> - * We need to delete the node to allow the soundcard
> - * to probe for headphones/earpiece.
> - */
> -/delete-node/ &speaker_playback_dai;
> +&speaker_playback_dai {
> +	codec {

I'd rather you take a direct label to speaker_playback_dai_codec here

Konrad
