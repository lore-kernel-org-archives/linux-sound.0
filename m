Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DD8377541
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782210963; cv=none; b=CYM4F+yMqPRi+/FNj4NQ/Qh9Jv0pkTIUc6I5Ed1fGfExp7XBPfalfO2mSnsr+gcOGRayvbkCQ28cOiZcejcUw+eqjL99f+QXj8TMFDQTlBec1Xxu0i7Awg7Ydr+jk21LuKPWpKDnscCcKAcMgFrLiqoYdbBizi9hwU28sokUUpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782210963; c=relaxed/simple;
	bh=Ypjsb7ffJ3S8Nz8NiWmWk48MTEZVL19ewMrVARd79ls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsOWIzZm2PBhpOepWPB82Ow1sFltI8o7KqQaVOtK2BnmZdNfYwEGSFzp00CgvLFoRJg6B30arEmWkG0irjZPgfG4VDDjP8YJ20/fiUyCO6sHTVL8ReqrfVz4gAQB9Yy0R8sFaejBazF/NTjwc4KHzHKfvJ2sYjwrkKVgvbHNKCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pM37HVtD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ff2SJ802; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pM37HVtD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ff2SJ802"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N9KXwR3919066
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SvcgX2Mx7MHm/zXyDT7p8L5HhhnE84M1CKNqnPq4tA4=; b=pM37HVtD4mBBcS42
	4uJ76/x9uB/65PmcWZ9Q+lGRITQLzL+mX8OxlAIRQ2FvG4cOu3JVUiSWgiac5KCb
	e7UVkGwnO2nU2Y+rcqv2KqARDn2LYmeBIwxNTNNcx7s19Clglc0aj3r/Qq84JqX/
	R48GbaR7KZ4qksyZJEaz4IJpzM+oeiDzW+zpx08/z/hix4v0cNJZ6hwEsvcTfAq+
	gv+/j0xvOdDZh6eyYy+tMHxqWY6uCo6TbfxpSe/yQ4fpYczDKqvYYT93fjgLNkNx
	QNbU/o6fQfEDR7kKuAQ2a2k//jrnyS9nXxl6KldiXYmGqsjuSY02s5kDXQwCLQlK
	iZ+rPQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyqe68bvx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 10:35:56 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8df7f21069bso1848946d6.1
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782210956; x=1782815756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SvcgX2Mx7MHm/zXyDT7p8L5HhhnE84M1CKNqnPq4tA4=;
        b=ff2SJ802yoHWHmF3CQ0TV9IiA+1TiwrBfhfPGEeqD+uJvFi/m0pHvBTm7NdUzqGz3J
         bfgroN6pEQVBY5+E3F8ZhhIj4QLw5GquK5gnmuyNCwnSbOTkm16jjNfb3yXkeK+B/ZLY
         hNlPn3XImhZlLfvclZDMRaG25emn180cQViPxQZeyDeyBULDoAz3OJL520IWINQHkmFf
         PuPNvp5PbFY/QIBBsBPVqbnpqcVWKcDaIBP6NJmTG6ZJpFoXPxoH2PEbEQ6mXcQIAcgD
         MCqSwWeGGoegRyBqZoutgzbXChWlBupRP7zoN2XJxRwEv41yIuYaJ7sdK+UQagfsX1mE
         Nhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782210956; x=1782815756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SvcgX2Mx7MHm/zXyDT7p8L5HhhnE84M1CKNqnPq4tA4=;
        b=WJsAbIrPu2E+ZyHq2CPG0GOKGp1RR4iz7Mgz1xGlicznOosfU0EKSGzqs+ozpyEPKC
         PjYl0KtHwbkxOzWWNq6FtuG4kDY36t8T2qPPPUSzY/H8rDmuKV165wEg99N1IuRRX3KB
         gkskzamuQd62JZ/mmOlL627bb/kVK7Lc2GDb2V0jwE7VZYDlz94EVD8phLfe+AVwYkJO
         YugHtmsWgIZYA9KrKuRlASnY69JSQKQSfXQcUgQg+30xEoFKr2bjSHL42fd7Fq3RbZM4
         sXBwVaDDbQTfRFHbD2rq6ongHmenI+oV5QgjuicCnduEr3h+aXSFVPtQSaBZkRzQeE2D
         PB0Q==
X-Gm-Message-State: AOJu0YyU0w4s0V1R56SsTf46RG0+3W1VEcnjQJNI+7i0LlW/JG9jDqeI
	gPeWiwuLfbh7e3ej1JT8r8j0nSVxiyBUN6t6MrXfhKDnfEp2e+W/881sq3nDovDOMtMT5yc/do9
	4wVFE6MNetguISmP4lXb3slUMzZIQLjA/jllFj96LFilQ9qfl4sNU5aBYCGgpEQdbmg==
X-Gm-Gg: AfdE7cmF8nK9t371tBrLsnerceH7TFg56GbMTKlWjnGRDr0z4CXcwmI7rTq2LOx6xwD
	126yKXevk8vFBGR/x3s66ifHgrr+rshZlX8y/diGMAC7kfSf0CpHOTJAW3WldyLDpqhfHgEdgFm
	ztlaM0ZvhiMWg6rrjFt9zz5xU2o1oDik38NjUTBeHM7V7ZhTPZD7+8tlGEyiJ4P4tZ1f7hc5bgn
	su7+0/M3GlRHCnxKaazwzASQunYWjwQE4SFnlD6ohxzoY2qbajBNwiRAFvanaVSxk6v88I3MtlF
	ibWh4Ckspsc5KQAPL6jCf70WuRF4aJs+jKkHIxxTL5tua3TLXfR6snqNC1/AXoIFYRbWm5Uy66n
	Wml5VGeisLPhQzPn8T57TXzmR3AW6IRnyN8E=
X-Received: by 2002:a05:620a:2b86:b0:916:10f6:765e with SMTP id af79cd13be357-921864c4a67mr1410029485a.6.1782210955850;
        Tue, 23 Jun 2026 03:35:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2b86:b0:916:10f6:765e with SMTP id af79cd13be357-921864c4a67mr1410027685a.6.1782210955461;
        Tue, 23 Jun 2026 03:35:55 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c61610bacsm505609466b.58.2026.06.23.03.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 03:35:53 -0700 (PDT)
Message-ID: <a87ecadb-9512-4516-b82f-1855ca3d3bda@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 12:35:51 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>, broonie@kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, srini@kernel.org
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260623071708.2822269-2-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623071708.2822269-2-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: o1LIPaLFkOadp3fJgr5_3yevCo3OxrDd
X-Proofpoint-ORIG-GUID: o1LIPaLFkOadp3fJgr5_3yevCo3OxrDd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA4NiBTYWx0ZWRfXzzh0RrFwFpn5
 G7pVF0VJ8UfmrxEsrA3pl7u4aHiOJg6dNSIggH51RXrYUyHuvfC6eMuee5GfazIC9lPYi/6JCj7
 PPVLjLkHOXmFxEnjP3Q4Q3clUBgMGJk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA4NiBTYWx0ZWRfX1w5TSjBdWwFk
 v2JjvGvb6TRbK959K4oRLRBxuUdoTrfJs7e1VW5E6xGgtnCnW1iBX7O6+oCNfVPbfHLgiZJ/pxX
 OuAIvvTQnnhjtef3cgFKejqdcX+MvDJd0FrHCMD001sfElQo4I/cjai8/QhNAo9pi7DapdP8Uxw
 N/mBmYeaWtLGDAqkoy4sPn1m0/rnFJQp2QofI3PhIMkOIhKiEV9p17nHRL2H5XXuz2b2zMjNFj0
 nAdWgtNCgMU5VYk0hg2NoJIoeyZdZrAxEXeYMMcHQHWMZ9S/gCIHRokIUABUck9KQ7weE+L1QqP
 xUN3ByTAKv8rycEZohvSBQwadOElz2LEosS7QukwXtlHSBbpJd9sUvmy8wdOjKhZHyLXLU4QXuU
 hlXubWN/bzOxPhvfRdL37zNf4KiMlQ==
X-Authority-Analysis: v=2.4 cv=OeKoyBTY c=1 sm=1 tr=0 ts=6a3a618c cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=t2ZNzEmchGV416yE2bcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606230086

On 6/23/26 9:17 AM, Ajay Kumar Nandam wrote:
> Convert the LPASS WSA macro codec driver to runtime PM clock management by
> using the PM clock framework.
> 
> Replace manual macro/dcodec/mclk/npl/fsgen clock toggling with PM clock
> helpers and runtime PM callbacks. Keep the SWR gate runtime PM reference
> from SWR clock enable until disable so autosuspend does not gate clocks
> while SWR is still prepared.
> 
> Set autosuspend delay to 100 ms so PM-clock-managed votes are dropped soon
> after idle while still avoiding suspend/resume churn on short gaps.
> 
> Add a PM_CLK dependency to SND_SOC_LPASS_WSA_MACRO since this patch
> introduces PM clock APIs.
> 
> Tighten error unwind by checking pm_runtime_put_sync_suspend() in probe and
> by restoring regcache state if pm_clk_resume()/regcache_sync() fails.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

[...]


>  static void wsa_macro_remove(struct platform_device *pdev)
>  {
> -	struct wsa_macro *wsa = dev_get_drvdata(&pdev->dev);
> -
> -	clk_disable_unprepare(wsa->macro);
> -	clk_disable_unprepare(wsa->dcodec);
> -	clk_disable_unprepare(wsa->mclk);
> -	clk_disable_unprepare(wsa->npl);
> -	clk_disable_unprepare(wsa->fsgen);
>  }

Can we just drop the now-empty function?

Konrad
