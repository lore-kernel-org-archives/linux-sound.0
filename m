Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB12E0925
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 14:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753367095; cv=none; b=KWq7w4kuf2y0iApdj1GqW9CZE5Vs55UkMmao6rvOABI9avxBLIpCroKiZl0PLoH6kNBSZwuoE+zzc7XI4dxfXlqzJm/Sg0jdb8VCh4OUNlXqF2vkM1u6/u8oCtWbqhc0yDnBQcOJWhQORlOIp5/EJfS2ABR+cQbyaJT/ca3vUYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753367095; c=relaxed/simple;
	bh=yMnNEljPS2VbnBAe7RDRoMrtiMmabtrdw1ZABRBlKGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bg/+BteHEM4O2AFSM3k3hsugiOzN0C18GGiSYhdnS6sABZ77KatzA9S3cgCQUH3xUQltI8gNy28v1sDyDjQ3pR0OhiOTG696f6UbvBdrXST48w+AtPJDT0BvEVjEJPaJ4blAkWsu8bqB6N1kXY1X5AKtUw5cdaB2uclesMNHHFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K0z4WueD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K0z4WueD"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56O9h7mh001810
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 14:24:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PXQaN2D5/hB531+P97VDWMow
	svbj/zQKvLqKvH8lf7o=; b=K0z4WueD55xwjKU3Se6ihbq/2VCf3zfLo/B7fdSh
	1j+8LH2ycDmyqho6cCtX6qVdGT5m0yRzXD/rNay5RzD3Pd8rxgtfxnVnMdIIGiXB
	uxzB8AnxkzvmqrT/TA+pcDVEzwXolofDxs00ccr5mBKEGw835rbVga89a9YLHUu/
	MD/KsVXTWTRaDk9JsPEnXxHah8TBiG4Nfw5eEgl8dVQKlS2L//1b3/DNSiDc+PrF
	/m3u/2wrsLQ/XhqeA/a/CJ7usS1LqQieYQB05SD5L6iqQ0IwDQvbl1PI88qvBJXH
	u/VpcUbhl48QPg89KA1wwpz8GM3PP7vUGEsWA7PSzqvsfQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 482b1ufm01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 14:24:53 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-4f5ccb416bdso235015137.2
        for <linux-sound@vger.kernel.org>; Thu, 24 Jul 2025 07:24:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753367092; x=1753971892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PXQaN2D5/hB531+P97VDWMowsvbj/zQKvLqKvH8lf7o=;
        b=W/IzvKBN1OBUA2Tb5RRXrHqiQdv8ajVdXrn5Y5QSa0NBXA3wIi9VslNhMiA+g4R+wg
         cz/qh5lsyRustXDX7FMsWjUa7tDPrSSXG+xB991SP5TcdZknPkpVCCgwSL22AVpfPOHI
         tCzJKeJOzyw4E8zMXMtFiKUTmiHg+0lh2+Zi/77swqdM00HaTQ+AHXSzJ0UbPTs2Hjoc
         dc7NfN7elTwBfG/1+Y1/xJG6jbNLNvHMC/f1L2iwBv8ezN5SxyWifYYXZc7y553Zyrv2
         x1xspIehSHA5ea/ebpswj8wpxyKoiQ9NciMl5BXpFL7KYvXaZ2b9ApWnl8EY/rs04lZy
         bzVg==
X-Forwarded-Encrypted: i=1; AJvYcCXsX55XUcm0HnQ8d8CEmYSPiJsT28ThcgXeI1ntXfd3VOC6Gi8NuW4Sa7dGo5jCwDnuUNyvzJEIhcs/gw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxWv+C+8JTcBb9oxQrCFAYDUTO9ps0P74r+ek2699zpDAsbBRWk
	yOfIK10+OBiUVPzKhPOvqDkUO17vvrl86NvltqO3ROLtZrZoQUFdL2Tzxt/S2PQjK7VVGXKQ2CM
	KT2NJFQM+C+imRcs4A0y3LPYVl55YrmMpv0RneLhtQW3wz9vE9RozNn3g3Zefb/CLyQ==
X-Gm-Gg: ASbGncsYC2x1qNpGBxDFBjKJFI0+PMBG9fhyfBNdTaC9+qDRQTn23mUXWzUoNwbJbRk
	NuA71aEJGdTPXdb/ub3aq0AWbMoaz6BN8QPXn+bfbc4ZFO888lzodgQ0iYzBQJMLu6Bfe6ZsL84
	7fqBxmfUdvacMILsKP1SOS60K5/sIzTCA9VHwA1vri/gd1wvmd+013PLPMfphwIMtTqRyhFOrHR
	X5DP+OD/8L0/RK73IlSvcT0hwujb+TIz6wEV0PElhpdmZbuKtBwPL3Qz5gHphzt4nSxhwKcDQUo
	3v+Y90eNkblHTZPkBrfuZHn6MD4IA8MXCw1sXgzlPvhcENllc9Vlb2L0VouUsTONPF2mCQSyMVm
	fGk9RmQigeuEDJco1bN4So8oyUv0B7u4UY248k63dtnLiXmSipIuK
X-Received: by 2002:a05:6102:1612:b0:4e9:8f71:bd6e with SMTP id ada2fe7eead31-4fa14d0678amr3840765137.0.1753367091846;
        Thu, 24 Jul 2025 07:24:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7ps+tMO3iXJTK79wunyZUIPEL7/LqtanKTlXWlbJ0rKzxmD03n3TemWcd8PsIKF5pqv7aDg==
X-Received: by 2002:a05:6102:1612:b0:4e9:8f71:bd6e with SMTP id ada2fe7eead31-4fa14d0678amr3840727137.0.1753367091417;
        Thu, 24 Jul 2025 07:24:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b53b22b21sm382703e87.19.2025.07.24.07.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 07:24:50 -0700 (PDT)
Date: Thu, 24 Jul 2025 17:24:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, srini@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] slimbus: qcom: remove unused qcom controller driver
Message-ID: <mwhxikivaxtz5px5e7jkqtuuk2iz457fy5drsnaj32j4o5qqk6@hwkcjso4jpsp>
References: <20250724132808.101351-1-srinivas.kandagatla@oss.qualcomm.com>
 <276b7977-45d9-4b37-a4f5-1c65802ac267@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <276b7977-45d9-4b37-a4f5-1c65802ac267@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=LdY86ifi c=1 sm=1 tr=0 ts=68824235 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=Q3_JIj6pLLKXvGcXXDoA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI0MDEwOSBTYWx0ZWRfX76TM4HxqF+Tv
 0yRZzJFhDkMM1QIFaXjVYBsg4oagP9+PloSlNUxEajYaaQum8OdmFimPnW0iEP/h08x/XwYCzqp
 pE5fPLgLcBFxS6HMgMyd9w812PcdldIA/li2AjaNca2HuAUwmIsSyRQp0XCcNKNa8G5ZwTMJMgg
 y+/4r9gu30/Tx10Rbw93treFaBFMg2TwILCtJSfwFtYuJmARpoByjejijVSDiCSOfGZAlKQf8Hm
 hgPElEe2xDTiEAyAaQDEKpjEyunuUr3KCnlCpZLGPa+dOPWIurNrihQg9y9/7Dk923luKhOTqcG
 vUoO5zHQtnCXv4Y/VP6KVnykCXx4RXNe6asZtQslLXKzBIbMj/fpo2cFAKspYSlY7CUfNTpd1dd
 N/z3D0EfNQmXNTpUUwRnwFjfcluzwwPxiyHY69PebZak6Ny9I68BxckvlYY7Z5J+rEBpJn0G
X-Proofpoint-ORIG-GUID: Im776rWMnyEu-JoO0N99hYgASojFrFn2
X-Proofpoint-GUID: Im776rWMnyEu-JoO0N99hYgASojFrFn2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-24_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxlogscore=803 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507240109

On Thu, Jul 24, 2025 at 03:31:50PM +0200, Konrad Dybcio wrote:
> On 7/24/25 3:28 PM, srinivas.kandagatla@oss.qualcomm.com wrote:
> > From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> > 
> > Qcom Slimbus controller driver is totally unused and dead code, there is
> > no point in keeping this driver in the kernel without users.
> > 
> > This patch removes the driver along with device tree bindings.
> > 
> > Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> > ---
> 
> I *thiiink* this is apq806x code, with 8974 adopting the new hw.
> 
> +Dmitry, does you computer history museum require this driver?

I never had time to try enabling audio on IFC6410 nor Nexus 7. But if
the driver would be actually useable there, I'd prefer to keep it.

-- 
With best wishes
Dmitry
