Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C78D384CDB
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210548; cv=none; b=qcheKofEZGTRX43vNBwAOWSPTHEIPX/23sZu6LHpaK6b5C93eVuV176h8seNkmV+K2gKjs3XS4h+rueQYF69DRu6Xnd1C3GYoCPtF5EnHFeKyh6tsDxFlLQFBWPARd9v/Nc5Pji/0VDLbtbxEVz5GyMeJZlev65ytqQCW2Tq+tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210548; c=relaxed/simple;
	bh=5BeooA/HmNqloULEYf/wilQjkc5AtSPEwMHJP3yQY9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GoetSj8VdUS1OZuIsw4QZLDZ+/3oOM++k+4nQO7JO5TyLZh76bmRqlgeSWzDItotacEDfKJKbEr/3fZEjjgd2VZaW23sEQSjDViux2AL/03iMJe0GjpNctxNFRiXG4AGl/EtXgNAiZINsjJlUyHSZWIJ9C11Ol5ogpuI2uxVck0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bl7a4t6y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G/baFOCJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bl7a4t6y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G/baFOCJ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NA3Iw9952871
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:29:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mmwpieETH95MW7hPYU1i6Ak6k7x0cpMpKx/vncfVnf0=; b=Bl7a4t6y2hTBiqbv
	u1Ff6R9K58hcJ+32rq1CnXS3ucTPIsgHDI9YYWFffcOhMZeQL6sIlT1l1SRsM59w
	1MbxBdQufWnrBc+bV3KRpuRp7wYHi3cHAiAcwhx+bXUF3XXhMqd5CULN9oHTFjHs
	0zMdzzaHYs3CKqbpd+3PEJD8KCAx/sqyMV7/lWW2Hw452Wtton3PmN3TTNn+W+qW
	xuzVl3PKCh70fw26eo5F2LvLFdO3MHFO6Jpl26xXNLAz+0/qsikB37LqqkADcWXr
	PA7YMcqIYztnMpjd/FpMfN4yMRIIThvJQiytIUbYAGKakNOeNvW+JpgfI1LbMsAx
	J7Ln7A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28r3np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:29:05 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8de715f6ebfso13218306d6.2
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 03:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782210544; x=1782815344; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmwpieETH95MW7hPYU1i6Ak6k7x0cpMpKx/vncfVnf0=;
        b=G/baFOCJ/oKwZuTxTOqUQxa1GbPZQzu44cXw1jozckj1Ega4IudU/o+AO7Ps3XyA8s
         OXBKXZsxiDUHv4uuXjmNpj0xS3GpcWrv9oVaHT0YyxjULRSOC2ZJRWQJS3OkYaIZcGGv
         dNrW2zXJ8PkrcFQXVShuKkwXXvRMgLtRkXZ6EOW1lUSnJj1P/JJjr//J1OHvSzF2aQUo
         419TBuH61KXRkBJ8KFdBRMTUVx247YPS40Up1oU8RMtsVe9q64yY2SGBOgzdXWUGz8lr
         kvZU+vfOowu2ADSIDJuwScrRuwL8WqMJO/mdxN3fO6DgmQK+2YYIyOcI1c+idqGXyMZr
         5p1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210544; x=1782815344;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmwpieETH95MW7hPYU1i6Ak6k7x0cpMpKx/vncfVnf0=;
        b=QQ5Ithe/VJPASDBDGmytDuLD8O7oVSZ+DCMbKzSWh3eJNBnGtJg46RuoRHJvgDjd0E
         MegMXSh5yCvT7JE1bqLDEVmlpa5XD7z+l3cEFo2yUPiFrXTcHs+M2ioDht4tiwUg/FmC
         X573Nn5eA8U9q87dNpjGjkWbfYNENYxQyoWz8F2iY7gxiK++FCPZNFvdyNhCd7edRObI
         15yBh9/k+Uhk0s6xlZoY9lLfGl3bh+tzMx0v/oVLdFBttmfFjJ42je2G8UOI0PUlKht5
         HS1feMg4VmCrlTa0LIrN+88yjMsY0NNIaEZ4oI0j8IKQz5H67Hu4RFJpLhm9YVo4oHuQ
         /0wg==
X-Gm-Message-State: AOJu0YzB3tJbXWuIsg9LwQtfAmiH/KF61sDDUo94aMFMz9hJMGtlIzxw
	HFzRfoD8u5NxVcd/oYvzMEeYCgfmg/Y6ZqkHCp0f/QXBbD7BOC3sT8Hiavd/wmFTIq8Jd0VokOp
	nXlfZbtntP0gvs/UBovNGk8kThsXpFhS9wB0Fj21t4P0NHvthGumZkKHFLIUECE5ksw==
X-Gm-Gg: AfdE7cmxrUaB24NdspMa+FfRnbdt6kwDhyWmlPaey5J/GShEwaKfwaSdTynGWkpuzu2
	vyHlHaWiz+0WkbdKlDqOMmNI2yNjCorDi5TIUJlogcYLuxYL0E35iD1oBMQhOPlEG5ovuxzS52N
	gOH87Pkzxju5bPtICaOiCPQtp2tXs6D2dkG9APmUcAIBKdYqB/F37nJAB7mA0bu4UJLGkdaVWgH
	Oa30LC50ccYMD1rbIE/DO0iayMnEpe1dt9/H/7fpnn+HP3Vw7QJKIdhO6LQTg4J8BibNyiRhlwW
	DJzOv6s7r2dfddd7GWsBeg1BNe1xg1Gb+zqdVvTWPjUCb8w8m/DLxXIC6u8pOTBe7foAn7uCsgd
	Sya6oBjhb6+83ZgUv0VKa5HHTq4fcU/LbQ40=
X-Received: by 2002:a05:620a:1791:b0:915:79da:a898 with SMTP id af79cd13be357-925cbff2a89mr398145085a.8.1782210544610;
        Tue, 23 Jun 2026 03:29:04 -0700 (PDT)
X-Received: by 2002:a05:620a:1791:b0:915:79da:a898 with SMTP id af79cd13be357-925cbff2a89mr398143585a.8.1782210544215;
        Tue, 23 Jun 2026 03:29:04 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6977be5ef8asm4280364a12.25.2026.06.23.03.29.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:29:03 -0700 (PDT)
Message-ID: <7dccd968-6a58-4dd4-8ef8-5aa3f8591bf3@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:29:01 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM
 clock framework
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, broonie@kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623071708.2822269-1-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4NSBTYWx0ZWRfX9ibZEnjDrFq/
 AfDQrGaZTwvXbO1kpGS1o11SRqbkCFvhgBtzlWSkC33ssFpRF8rJUnboOWLNQpE1wI6W3ZkTfAY
 TmQpS9lEi1NXt4mHKoLcCAgpCEj10G4=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3a5ff1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=1QvXDvejAMkk24zzBIMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 6Ne5SOYNZ_HwQy9TdsQgShC8Dv8uW1Sp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4NSBTYWx0ZWRfX1eQEkztf7PSf
 uKK3u2FdsNXwy1u/n2CMZU42KYwibC16Gue6Jqe+YNmoctve9sAI5WV10FlmZO0OXB77dsLwhvn
 8S0HPoCIzqeBB80xP15kDNay798f57iMpz1yN9GnTtyZZMhJasJF62yAMBzzzrOoW9OQjh+tPGJ
 3fFpI78FcgH3Lhsgcxy1cDV+NOqDsRtlD3zdlal2dIMc/reDsc+pwqsspiZguUt45cc6TaAtCD6
 RjbhCZhpgaJNfnKGuR5xsBCIy6nUTrg3WF8457w4q6hIHUoonEtF180i7pBo4LyUWW0bEYxmTyP
 VPmNkqBF4HB3FCTApmbPxBXc02EMsJL+btlyoNwQPxWxp88NxI9VUMLYCjtDy2qiqqVlNhrxLXp
 7cc8Tm+Ce10MN8fpszgD8wKbMzf/BQ==
X-Proofpoint-ORIG-GUID: 6Ne5SOYNZ_HwQy9TdsQgShC8Dv8uW1Sp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230085

On 6/23/26 9:17 AM, Ajay Kumar Nandam wrote:
> Hi,
> 
> This series converts LPASS WSA and VA macro codec drivers to the PM clock
> framework for runtime PM clock handling, and keeps WSA MCLK-output clock
> registration resource-managed.
> 
> Changes since v5:
> - Rebased to current linux-next/master and regenerated as a standalone
>   series that applies cleanly.

Switch to using the b4 tool (https://b4.docs.kernel.org/). You sent
all messages as a separate thread.

Konrad
