Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AB2365A14
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 09:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984879; cv=none; b=ZOirNPvt2G7zBnrFWHGs0T+Tl2bHIWG0vj4GHWqsKfb5/9a7c8fxZIlxkeX7PKxKS6rxLAJ47r8T7SWfJ3MePqTO5z3Jp0zoPUfXwH/USA2zxGgANcYlZ0gLQDgB8QpnL2YozFM1w9cJT6uBlZnVZlIUm2vwBj90CamQJw+GfMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984879; c=relaxed/simple;
	bh=n7l+5jzdQyiCyusjj8NDrxlzevGuy2iNMKD5LMtnzQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b6C5W9iTGce8ZOyK2XRZiRK+Z9G8NmMyn3Ekgo0zm/urFRoxNC7roS4GPSBDCxjUgziq4r1RFC6xtL8mzL1gNkNRGYG9VLXgUR/z+XXbn58mfL5uMnZnF5HPsXNmfcsJYqvBx0FMUNljyWx46Qo8u+dx5CQ1KrkyEHrPejsI3uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4dTigox; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZvIFYof1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4dTigox";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZvIFYof1"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628K5vh3050714
	for <linux-sound@vger.kernel.org>; Thu, 2 Jul 2026 09:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gxx7zK9/R8weBQXf0t4G5EGLWcX/GGlVzWsYqCxWD0o=; b=d4dTigoxGqVrK/bn
	Nd/9QdNmeqvLO5jFzpNrsf0u34kFUuuy5LiAaEQJd9A2Vl+z0io0/dXiejJva6KB
	J2x4Tb5VqGI464Qo4/XB++Wjy4WnwRvV6kn8De4ZT3MAxYhra4C0Rj5GPK13fldk
	3AMbKTFP+LGC7AX8eGLbGErspBGW7BEq7w8aRAWqmQOOh4LfeanTKGIVLiA1lwjf
	TEj3UOnezz5NA+4eicGytK5YLgxDvMy0xMrJ2p6VPGmuBhLR6/njSNU10Pv5Sgbu
	1+BV9bgVx0UmFRYMe/GX7SsjEFWWfGUXs6yAEBOfaLxbAx+ZWXZsYo9KIFZwVdUW
	JBPYjQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gpubn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 09:34:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c298a1b20so2975411cf.0
        for <linux-sound@vger.kernel.org>; Thu, 02 Jul 2026 02:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782984877; x=1783589677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gxx7zK9/R8weBQXf0t4G5EGLWcX/GGlVzWsYqCxWD0o=;
        b=ZvIFYof1/FkdbuKdEU8YpxuKYrGUWHB/CYZehh/GtRpOkPUuxuhzN2frQXZAqSb8AZ
         ngvsYk+ZU8l8kyN0lDPzm/aySBzyDEsDvqRfD9nLyydeSa/SFPZkRz6hVUy9nd1UHVrs
         KAllv9wDt1Ufdi1Dv13n4ky25iT8agm6NA0mH9BX0LBUxZ7/2/TcR4VzFuvlGTIwSwga
         2DQOaWOb50qPc0qTbZ7Pyu45my8dnoojzTfKSpZT2xLVQzSWO3IabqFQVRj33jaT9z6W
         AlgaRjt0kEqNZWPwkq0ZsNxqIoD4Fk23uy+b/F5aGjESohF3RPGAC+evad4etEmtPW5x
         lSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984877; x=1783589677;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gxx7zK9/R8weBQXf0t4G5EGLWcX/GGlVzWsYqCxWD0o=;
        b=oW8r/J08k0sg6+oqexgHEAyWjzAtMDEM9qq583pdOs0o17//ujroDseo/tBa9YkPlE
         Bk6iyMBtB2/392uPxM5+uNflBDLxahWUm8zvJPKmJ33EV98fkVtyvcQF6bsCJcwgvhzF
         LSG8CnotsvixihlwcFx5s7LVAF6F4FIHTZkEk7WxXcQmBPXoeFolcxWLSLRogst/r/VK
         DsjfJs1OI1qJJpkulWWajg9rjVQG9XMc0dKCXXvI/ypfR5KsTdXB+Y2q5PVVusscL1M+
         vNgM0XS2Hg5EQ54ZslxXctbAUZh6bCnmMc/YSkrGx3pE0SZZnyBoyEKAzmD4J4iPQeVN
         Mc8g==
X-Gm-Message-State: AOJu0YzCUBsKyf4cQpCGxdhh3m02sxTu9a4TUE7tobhReiG33G7qRzM5
	cMepkdx+PYqm53CRXmXKw7wK/YdscIgruTk/lPfMz7mlNFJHBRX2ce+gLFGGBrY2LTv5xae5R3+
	rMRoxgF0O1dMpxPbVUHsL+KwJYtz461bfT7Di4CiKOxwf16cHDvKO2V24Jteb/kF8bQ==
X-Gm-Gg: AfdE7ckKa5u1EjO5g23CwFa3P1y7lPa01vLMQ2EUjBiJ4R5XPPDVxOXReKvTvSvibec
	pTuJ07t92Dbo33FkHJ+8e30gDEVMEDd6/udJsf7NDyRaz4QlqRcPht8FENWgi4t1U5Xtbc02SXc
	8Li7hWAokUwFyZQ6jDkebiwdnpzMk8UD+CIRub7l1dmX160la/H4BsWMU/Cq2lRh856YDbtPMrZ
	l7O22eGN4FA0DNpmcHgPd8BJeNWlw3jXfVZX0gRD9axVIIqtHvyXcXVR/Inh5DujY4WI6hnqVMp
	Qx6PP5WxwgdojDYiA6Mp8sJW4LHatabx7euTa857gW44k9ulUx6Hiql4nhEYFu0Jh6Lt38cYtaX
	0pXST4KIwhSqK+LRqJoJLlY/Sy0p9Dp2RgZs=
X-Received: by 2002:ac8:5a86:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c26a5611bmr44626001cf.2.1782984876915;
        Thu, 02 Jul 2026 02:34:36 -0700 (PDT)
X-Received: by 2002:ac8:5a86:0:b0:51b:f9e0:87b0 with SMTP id d75a77b69052e-51c26a5611bmr44625911cf.2.1782984876551;
        Thu, 02 Jul 2026 02:34:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-698ace16548sm698758a12.3.2026.07.02.02.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:34:35 -0700 (PDT)
Message-ID: <df15f50b-ba43-4b9b-9894-576b9d2427d0@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:34:34 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
 <20260702-xo-sd-codec-v7-b4-v8-1-d39d0fdb7859@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-1-d39d0fdb7859@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX6QnH4DdwbK5k
 JGOqwgiRKd7Jdr3u9BilHW8/h+PD3+iRNqr8e8BvSGjG0872g1t2L0pWfO8Q5Tk4vvMp18sjAgx
 tbYLyDL07yzVLrvpTlT6lEvHPtxiEpY=
X-Proofpoint-GUID: TkiDIh9hzCvaLo_FkPvfb6c5-0pyLSW2
X-Proofpoint-ORIG-GUID: TkiDIh9hzCvaLo_FkPvfb6c5-0pyLSW2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfXy9H8RLD3CqiB
 5btJpOeYbCO7aRWTYkoQ3r4GBWqc92am/sizM8/z3/6MIoIA6uPj9SgRkGL82kCOXuoDqXPUTDL
 7LoO9kP4e62SxKsV69BSTLIcUc2QtrTep1TPTycNsmbTG+xr1O3Po3jK9LiIaR/LzjKNGZsuH19
 nWu7EuNRQeP1S8K2cRSF7qMKJP134KfEnWJCMVuThABMmPcDM59e/3lIhwOXhl/7J9KHU7DnM+n
 h2biSuoQODAVDSaItjDVTb/OjbBrKaHm/83kU3h+qErPDJqWNLieIB+yR3KhSNRMLgZXioUAEG+
 HIcOJOaC4JmBLreXFfhZ+GeDBRU3mpnd39t6QROWdS+H/laRl5ptg6tgE4szBT3o8FmsonlOikr
 1E71Js5NkDRCNbSzCHoVedzgmTGxpqvFPVs9n+IGRwedNTwRs6k7k8uOZ1M9FUDp02hHdF9Y/Vu
 6RllL8vQYA214znru8w==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a4630ad cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t2ZNzEmchGV416yE2bcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098

On 7/1/26 8:44 PM, Ajay Kumar Nandam wrote:
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
> Suggested-by: Mark Brown <broonie@kernel.org>
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
