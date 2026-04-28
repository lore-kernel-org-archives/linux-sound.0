Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C2A327C13
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 16:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394399; cv=none; b=hwCjCaae62hVp78VD0DMMPEIN4B5xOPKD9Jlgw5x/1b7mnP+CIcirjnqImYCqAZ8lzklupBXNF3v1Hfpj/Id808y2aHHM0mddWF+leHH0l+A3+BCLD7pIj/1olWXLEG8WB8MgBKErxrJGWEwIJWWSUwPVNkRql54cUs7wRFwFoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394399; c=relaxed/simple;
	bh=qZzhuuormOf8Rul9WUs1IcMncFOwAXE+8P8hcP9siEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V5X8Te9tlpHV7oMysRTS88Nbcq/805a5CxUPoL1XZNlxe7qCvOe75I4RQzNVYrURxjh/W0S2yjaVU6Gk3CzmlL2iccFupkcFR0i29/r0VE494TfUgflPSQRNMTjF8bHFBs5slqLKBCl4E4HCXe7g9fnnIbx6EVzppRbziFGN+5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7SzQjo2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PYkd7M3l; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7SzQjo2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PYkd7M3l"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsZnW4070724
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 16:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=; b=f7SzQjo2A6gvPSWl
	4RSvhk1zwSXT5U1plZ2fJ5UTix3BYVLRUWvlmwud43vB0Z+JYf/OqNXL/5AbOrrG
	8mTZis37OGV2svwSeXhojxzhKhDvnGF3b0NiEXfvTbiVqOxmmpWe0YZeJUfcimO2
	n40R+UEiqXUZsBVkMiItGY+y6VBrQ/XMMw9sIwJ7f8R4Fx0xZhUcwQ9k0dURvFK0
	GOw8air9IRe8GaiBlW3fY3MeOVtlGFz5MVK/HPDRUIrGLlxSkYc/7l2YnYrMRUU2
	KF5YlhvY6ijYL26viLxaEbmRPQepuH9rTNJD1l7hW2aLWwIXa0ExsIIEXCCL58Lr
	gpo/pw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtttjhj1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 16:39:57 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2d93379001eso28039702eec.1
        for <linux-sound@vger.kernel.org>; Tue, 28 Apr 2026 09:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777394396; x=1777999196; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=;
        b=PYkd7M3l2rol7qbMxfQktGLF9kkFmuNQpkXpinnffGbsC1qXZNJk7uSRfnxgQKPVfC
         rHq6CLx/9kkDCpOBNHoyu1q11eHWl9A2kVRampazY3cVLo1zowGy7HHGHAd4N4sbmJKX
         yquzHKnc/lYscara73DVETctt+Qq0J029iAplhnZ9jfIfE3GB8u3/4X1EmtvnrAPJQ4Y
         qPj7RjEph9ryUgsSAw+Ymu/t+fOPOMpFo1LewPm2fujRmtUfINf5bN34coUk/A5ubaFS
         TrjRy9vG4oxbYYtTa5uM42ArxgdWfC61tjcZQHDrz0b1W+wdwrOGWS2KPp29wFHwUP8M
         lVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394396; x=1777999196;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vS7MZwC/c/EdYfGyVktKa95cOMof7DSqpzppE9rq4aQ=;
        b=NQUXfV1gu+sO/OxXQYic2UrHv+rqFiNSAy2H3QwbPTeR5G+VHZ+adf2X42n0XDmaF7
         dvZZFNXS07fZKzVq+IUOkNUEQjT2o0rzWZ7xZf21oqUjjSFdGg5Nmm2XFvh6fcihIMIM
         mF5JTlEXVW2AgkOzylOV9yRRdn1EDOcUVGWnwFt++9djLsUxGLIWagfgZacLlI2UG0wa
         CTcxqbSQiFWzQJOB2wQZB8NzOgXbc4aVTICXGZNTcHfrwRg0AMcRpyp4FG7cMK9HGrF9
         kqJJ9jrHskIU38MRmKsOenfcXY8xEShmcRy+yxMdV1mWf6bSv2sPF0gQEy3Mx4HZO9ph
         cduA==
X-Forwarded-Encrypted: i=1; AFNElJ9SD4uc7NjQ051awPsJ9cQFj9ah4N2uqI0vkBvh91pG6AlDxcyKuPgeoIHv0nKZb2JkIdEv59H4O/ofFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsSoLIttj0zR7RKNWXELEXyM4aM1Wor4JXPtX+eu38hLZt+czB
	j8MtVCz4Bz3whr2EL5cTwM7/sa9bnK1rlxlEGx+bxjj5Ur/La9251CghBGn1P/kL2nUpRLg6nCy
	caGpzvLdX6elimzbn44FwvXOn9cnMccNLQZ49Rtlgju4huGeAim6Fohr9DA0leXf8bQ==
X-Gm-Gg: AeBDietx3EGnZKSIcoIKy0sSGjcI4lbMnScFsAFdnwbY4rhJp1p59pukWUpSUVfAhN8
	Khut87iQJgKxcpksDuoLyxcRTlxq30KgGAtKuO5XEdU4iSexGTH8EWQyZ5sP9bi4lk6waCDyWxa
	ZEwCMPU3SECOgHCQDBAaiKssH3PfI1MBbkgkqPqshSS9LsygW3o4pbvRTxr1RyFmim//1e1bVAd
	t5hiFsJuBsoFMfl634MRomdhxv2qP7ZywEpjx6o036HOekJDFglmtOxBE1HorNtxmHtNLVWygLt
	amix5a3TEfvuVFJ4mWmSw7p3svhGQO/uET+4g2clZiQsJIgBLpZ3i+XO9q3/uBWA5rdBrfHBxla
	PABSQ7Qaor3q5SD+khatlgeJuKmS7WckFRb+OcskhSMV6tk64eUAjP3JoDZVmkRBpvOQxDYlP8/
	J+P29+XTWCdhfD0n1T94UHKmDp
X-Received: by 2002:a05:693c:3006:b0:2ea:3370:6e51 with SMTP id 5a478bee46e88-2ed09fb0d22mr1787699eec.4.1777394395802;
        Tue, 28 Apr 2026 09:39:55 -0700 (PDT)
X-Received: by 2002:a05:693c:3006:b0:2ea:3370:6e51 with SMTP id 5a478bee46e88-2ed09fb0d22mr1787668eec.4.1777394395038;
        Tue, 28 Apr 2026 09:39:55 -0700 (PDT)
Received: from [192.168.1.47] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a0ce878sm2622054eec.16.2026.04.28.09.39.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:39:54 -0700 (PDT)
Message-ID: <e8c37614-354f-40d3-be3c-983f45e5bb3f@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 09:39:51 -0700
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] wifi: ath: Use the unified QMI service ID instead
 of defining it locally
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
 <20260316171419.2619620-3-daniel.lezcano@oss.qualcomm.com>
 <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <51e28a7f-8362-4bf1-9b9a-9af9cda1d748@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2MCBTYWx0ZWRfXyVB4wMlR3Cjb
 JRV0MBXXTPmywozZdrG41UMOsyVSIkKQtRD/cOvBLQ/yITxgimOic1IKOySCwgWs5eT10KU4zSI
 jxqGjnffj0gBCpSAsullNjf14jnwpAlqBpDUzFaDu/uGx667e2qyIiOdnC+fW0QRJggSw1pD90+
 28CQn0CJ5K4OvwneVIvt1azGOy7bHkUomDkBruhITQxmX+z7aG8vhFujt8OJAeQIAlE84HoS32G
 Zn7fQghnb8PYBOf0akBf5dYMrAa3v6iwb8ohGOi12FcBWJqEa1NFbRnWQ/pX4srCLaqWBABMvG7
 otCRtzKsAfT5zqoFPw3njESJsRk8Ldi6tTSTlU+iv93HkNibvEwBEQuOJkKdY8xcr8E6jv6tlh1
 KI0RjQf5xX5hYIYu+nlSfGoM+d+Dhw6E44rCjB8rRGEkwyri65M6bFoNZc17T8Ddlb0Ean0UzcG
 u700XhVEya15ozeSfZQ==
X-Authority-Analysis: v=2.4 cv=TZKmcxQh c=1 sm=1 tr=0 ts=69f0e2dd cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=yneryZK0HH5dXzgVxAEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: AhcDIsbf7fhE8tJYV2GAsIhe09yuMkgk
X-Proofpoint-ORIG-GUID: AhcDIsbf7fhE8tJYV2GAsIhe09yuMkgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280160

On 3/19/2026 7:26 AM, Jeff Johnson wrote:
> On 3/16/2026 10:14 AM, Daniel Lezcano wrote:
>> Instead of defining a local macro with a custom name for the QMI
>> service identifier, use the one provided in qmi.h and remove the
>> locally defined macro.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> Bjorn,
> Feel free to take this through your tree since I don't think it will conflict
> with anything in mine and it will take time for the definition to propagate
> back to my tree via the normal workflow (which I would prefer over merging the
> immutable branch).
> 
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Now NAK...

The definitions have now propagated back to my tree, so I'll now take this
patch through my tree.

/jeff
