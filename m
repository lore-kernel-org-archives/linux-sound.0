Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0917382365
	for <linux-sound@vger.kernel.org>; Tue,  1 Sep 2026 08:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250015; cv=pass; b=iorcdpuaZhlC8OVIGkzGH5PNSFtEJ3rgEdnI1p6ggw1Pk37Mo46xGU8HEvBdq7faijp3wjc4W8G73oK56odVqZaWAryJBq494zKUB4eRdJs4Lak/BUUxqt6/fnThmpXhcgvmXFNeiSwx5bjRzLNeMaSlGs73veFyf8793UUadu8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250015; c=relaxed/simple;
	bh=3mauDt/3krkR1odRMOOidZDtXzlE4qNU9pWDtPfeHE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TC6MVOtgJLGzAGG8NvMknB+S4yZgHWYpcoIB5zOAxWc0ebeFASXWaDRDEKhYdzJWMQePq0iXV1zY+Dc62KCayYWv2LWPFYTdLOMUCYWyHU+1NjJcwssfcHc6H4RWjloRDqJAiRFhtdf1lXecLKcRSwZsxAnt85srHeqZPibWVD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgBzkLz3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QvuVra0G; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgBzkLz3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QvuVra0G"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179RCT2322015
	for <linux-sound@vger.kernel.org>; Tue, 1 Sep 2026 08:06:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jDBl9H6dewCwJQNERd8Hsn6H
	z8VwyR9WYLsgYH0ezrA=; b=XgBzkLz3MlJoKyfrHtpS1De9Q4QNV2702ypZzShb
	qfVcVJNJIobk/+aupqNbdMcLvAMN8tZUvWLGHnEhXQonYP/jS4vzv2XEuKIX8Hnp
	cJ2+e1LbfRl94AqjpSAiQwKjt0wG8g8PGcxqJWNweDJpcdCFT6EcrCzVxxdDnaea
	6OevVZgo/OTELdPXyA4SSJ19IoTsj63sUDV10kQ6v/mKVT3/uq8kJTRWSnMnicqW
	FTBRPup5aVE72p6Rx8A10MtY5gl5OtArnFCusfiLWIe/n97WXncebuH3Y+kx99CK
	ee9msLtYQuh2Y9y/BO6NAHZDTt5SRb/1E7TZBpBqrk1MJQ==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchatxb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 08:06:52 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-66d309b367dso4199795d50.3
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 01:06:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788250012; cv=none;
        d=google.com; s=arc-20260327;
        b=ksFcparvTRa0mw7IaL8k4AXznd6QRIFBtqjLDVCywxVJ2SozHqjzr9P4aT2/yZhX8r
         WxZ93TGEXshmCMpj4Op2njTSpew/JQ927aXEXMZPCUIoFy1Zm+x0CyprU2cGwFN80ScY
         oP5IvJd6SPddoCI25cJWigibH9PDQSkDfJjJkyq2sJy1GdQnmeB036fagsdns9is90ex
         fI2uyBwYh7U3RfVZho8eO+Jx4s1lwPFLbaBUy9CxoXvdaVftaMTpcuL0MOucaaohwpQ1
         a9MzF8EO0rmF91bx1Pi2ax+0vDW/Cz0XwhEujU6fTxoctXoyLzNeHRk9+LR/v4ISD5Px
         SHag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jDBl9H6dewCwJQNERd8Hsn6Hz8VwyR9WYLsgYH0ezrA=;
        fh=pRyfg5656P+nRds2Nennfk8ST1mZ0od5tz2VkGOZcqA=;
        b=W3h/bjuPk4QoSPT07D3zZKgct56yYU5IscP5TIPiplqXoUdFXYEZBufiQu5qwgRADT
         eBSZf+HnvOMc8ON915iHINzOpo/Ij4IUWRrwMCjE4zSDa3KN5gGuNknNCskzQ26Uc1J2
         nQFCMCSpac2erLk24tLC1jy9Gw9/wA4LeBRP8lu+kOJpKGsDbXLVMWlu0FYdICXM4lU1
         f5/i9yyU5TUIqBYFs53MQF6/tTjUEbboT3ahblgZvTWo5kWQHcqXzvLoobHxUigaVtNT
         ahco+eu8R8QAN+5Z7FEK5V94b/vCFLX7dx54IKyBE2+ou/K/ZEA1ULoh/ovn3KQbmhKm
         3hHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250012; x=1788854812; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jDBl9H6dewCwJQNERd8Hsn6Hz8VwyR9WYLsgYH0ezrA=;
        b=QvuVra0GoXnR1TwUvIJM0O+I1LSe7deVvUNEeyCuswNAINd5yKJkMU6FCi3+PBzMGd
         bxiBUoeyuxqgBJKkGtCdw1h2mTtNM487SjS6H5AVTuuNjmivolSgNpdojbMmbiCBD1RT
         Ec/4hQ3v777XkHEuP+EfEathhHA8eLw38ES+aKP06pI0V21ydvvVAsiOIXX9V3OWSy8q
         4TSLzoXZ/PXkpyCIMd22EbdOMGnCSt5YhGBJNcmmD5shsuRaQguguMiUS1r95EeQsOW1
         m3jxUb3xIEM4YmTESwJ9kBX2Aa3wRMwblEUi6/4r+o0aOG6Vax3A+I7bwRykNJ3htMgN
         h5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250012; x=1788854812;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jDBl9H6dewCwJQNERd8Hsn6Hz8VwyR9WYLsgYH0ezrA=;
        b=YyZ0WwBEggDFxXg9o+e16JvUDr/OfkkgFmyo10mWAluogN+huTIXz7LKXaV7ViAN6t
         +ZN9vEatiRZfnJvRl9wo7ymeHuA1aXpk0PsPg1KoXhi3ybz8K5jRJIhes6TD/eRZbf1c
         Bvf0tpygMztIHBxaCoSoD4S0AP6eiJVs6Pn2aA/cJ4JWsYOJtAWZvmWyDdOu+eq5GaY3
         VD77R90rbU58fwXJkduf7fHI+L0lFbc99KTSRNkSWc58dl0j6qJQYAcgiiEFkKoDT9/U
         zS3Z2a3y15A62yaxeIs0XkqwQTSsGREFF2CN6hksckDJVP9N4gcH8A1Uo7hANLJopg5I
         l3Rw==
X-Forwarded-Encrypted: i=1; AKwUvBy6g9AZldV3MZR3Zvz6af79xMsZro3dGMkLQZUh2mR+KtmTKJZY9gfG7YpNjLanxmRtH2pl5rNs+fZWAQ==@vger.kernel.org
X-Gm-Message-State: AFuF++njw6IvCVPwzizktFPY/6Yf30bPg93k5NEZE6n7a6ZlJ9SD9vC7
	G0VGHAK8Qh4+qNOyhq+2qEotxu68FAraK6K//iNn2RiSgRsnT/S40Egu5Y/nj0qWOkf80OcyVV0
	t15yLBwqRJXuL0nZ1ilUyePrOhTWsVU32zQNZQTRqE2ROKqyzhyGW7JtH0prUAMSkCGX5yFdSf9
	rQzxoQywn2ypaKhXqPa4s9C1gTpb+/exvEX7NbfbKU
X-Gm-Gg: AYBFou0g/eUk38REy6mEzulJELLtqvlwDrcJu+s5lf8Mw4FgE7socFNwC4lupgQDQu3
	GiDCAP5dTvvjjlMydcfTMqXQXh+AXXsnFOzHIU33q/wdgv3Ef8O8KQX92DX6rPLzfsOphBuBAun
	2z0LQVOJLMMiJADSW6doNAMd+Fg1aKjPV8IMyKGHBRw8+uT/y+psjbls+yiw==
X-Received: by 2002:a05:690e:b41:b0:66c:c1d7:4c5b with SMTP id 956f58d0204a3-66f87439adbmr2317472d50.16.1788250012394;
        Tue, 01 Sep 2026 01:06:52 -0700 (PDT)
X-Received: by 2002:a05:690e:b41:b0:66c:c1d7:4c5b with SMTP id
 956f58d0204a3-66f87439adbmr2317463d50.16.1788250011999; Tue, 01 Sep 2026
 01:06:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com> <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
In-Reply-To: <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 13:36:40 +0530
X-Gm-Features: AcwNN1Vrra9J9RcWBYUJJ7qw5Bpw3Tp2UKjVq7_wLN77WCaIz4OfWXHftpcjZXg
Message-ID: <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: F388LqzXsR5xfqvYbEOA63CUEtB2SXCG
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a96879c cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=qe6_PsajVfZEHvrFN0gA:9 a=QEXdDO2ut3YA:10
 a=yHXA93iunegOHmWoMUFd:22
X-Proofpoint-GUID: F388LqzXsR5xfqvYbEOA63CUEtB2SXCG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX9R4ssth+vaXy
 zS6eUMd2qFJL9onVBLWOwwG0IW5rNTr7MOpc97y1EmUlrQtqUdqKF1zEcmUYQW2l5JwEuEbWz5K
 nwb93tPVtBaXZg1FmSaKxZVjSqq/BTw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX3EsEApxg0NHI
 MdwKnDjiDNCQEpiucf1R4zrRQDxNc0INPYvm9dOC1+t2L6K3EbKDt8b5ye01nmvaYworddXQB6l
 9CPF7L5zzvte3uL1GwCGxAz5vnL0bBduN85qV0iN/Om+ZEoHnc/OiEvfQ4Js/Oxfxy7GQhYUdTs
 9VF3FAekzyBJZ6a7IU92Qxh76Ivt1wuce2+ub2wvOrqdD5fYG027WQM3eZfsQQlHfvZeKuS9C43
 aSPDyHoZgaXo/5gyNB3Iithci603/iGUK1Qc51cu/KyI3bG+QhKSFUBxmF/dRvav7v3JNlGWzDD
 BAWEOC1nGDDNdlNm0ju/rPor3nPyxplU+ICSGhGGN1JSBSqNMcPFm8xJqeug1363rA1YXXU2X7I
 XH2uyw14uO43v7zaxA3/wF5yX8rEXuifu4WBgUAHzgZI5xlZiSQJIPqNdNbTGgs99f5Hgr6gLRw
 NVo6Td8mmOanTdz5mpw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

> > +        qaif_cpu: audio-controller@a000000 {
> > +            compatible = "qcom,shikra-qaif-cpu";
>
> The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
> Usually DT binding filenames are aligned with the compatible string for clarity.
> Is there a reason for the naming mismatch?
The filename reflects the controller; the compatible is
variant-specific. This follows the same convention as
qcom,lpass-cpu.yaml.
>
> > +            reg = <0x0 0x0a000000 0x0 0x20000>;
> > +            interrupts = <0 331 4>;
>
> Could we use the standard GIC and IRQ type macros instead of raw values here for readability?
> Ex: interrupts = <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
Will update the example to use GIC_SPI and IRQ_TYPE_LEVEL_HIGH.
-Harendra
