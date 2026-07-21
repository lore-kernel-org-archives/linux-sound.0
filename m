Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038C03EF0BE
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 11:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633894; cv=none; b=bPeuCsh00/uCJqp7fWU2RA0S77Ewlaw0UWEtVjaal8xRB7zcMHvBeEEUnh6rOh1OsYxwmHgFpKUp3YZNrNVHPT6EJaZAZqAqZjBzyq+IqR+wdveZxYBo7/owqCjrIRtb0Uf4vyGkYWHGP/GW4p8N5M/bOaKvqTUFj/jnFUgOA/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633894; c=relaxed/simple;
	bh=J5+dlRIcGdEBIMh3/R6fcjXfPbiVgnNn/3o+ZMwkvLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hBtsXnci4MSCVMvWC6n2LRd0onWpQm/hfQchOrHfDlMXsUrzdX/u8rwheaaYnIS2VXOCoUsjOshoxKIi1mjhqbvg705FtFLcxlNH9Cb9YACWrOoOSdn//s84tQAg3kxJVG8WSlkDpw99MXOGHQa1C5k+KnaI5HNJVxljvYkypGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8FLkf5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QOrIPVpE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8FLkf5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QOrIPVpE"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARMew1482121
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 11:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TqJGlr8Kz83Q6EIkPq2Cky3r4CDJupsLgkqPRxSx25Q=; b=V8FLkf5+YYyljXR7
	xCOxkgLFeD6d556f8ZWaW014/LdxfWAAF9Y+W3Is21iFI6DgcPhqZApi4hKyGzB3
	Dv/BkjF4XyKENHWNnQg1TOggOnUTSWY7OJwnS/DG/buovcZfVPxMkE33GSPHweA5
	ZHAGdXbolS061sNBoku/X7NsTQDmSLWQR5wJIp7d+F5PyCLrc3nIkGo1LL8YcwdI
	Loe8WzsSPKaFIq7/E0zM5+TCds6L4gMxBqbxXHnTH/BvNSqqGDSx5ko+ZIpnFtER
	JyoZMUKH/KFUFHhSERUNZ6fKi1vXSAloJ6/Yzv9/iAteSWgAcoXyy8S6Kku+g9ao
	H0ybjQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqnb22m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 11:38:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so197595981cf.0
        for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 04:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784633891; x=1785238691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TqJGlr8Kz83Q6EIkPq2Cky3r4CDJupsLgkqPRxSx25Q=;
        b=QOrIPVpEc6QtHqdgECXw6ukJxyjF75ncakddZVVVuNe0GBCz9k3E74xgppHLQbVQKO
         8dfwS9Ca7Ne6nT6sVPJfbJjFohx1yhizTvgzV0Q/AV9hrxOSkBLISwqgJvqJWoS45gDH
         tuw6Rnp+BIyPN6kyGvevNBJN6VSSlP4F6MAEiPy5FYeIAXGiGN9qtHAHI6G7ius5ybLi
         a22vjo184UNvq8nq8ghaqfskvOyLmdfQpscarespLnyZpX+/nEJYMtmtGK23Je3jikIO
         tmF3Tm1DkJQ4xqRSwRWFgseAZymueLGkWtNO1ottRDw9giFPWHE0RZx8ve8djLX8dnfW
         WSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784633891; x=1785238691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TqJGlr8Kz83Q6EIkPq2Cky3r4CDJupsLgkqPRxSx25Q=;
        b=hGactYUtFhcpRWWhfjNuJUsi6BGV5ftv1n9FS1g72Ef+wLLsdWzTwj6LbvZtNZ5RD1
         AxeMHKMgHwfXp8qrpE5jaNw1gsxC3weVnK6HJusdnJ0ItfqFpiVVNH/UCEqETSqs2fL7
         dnelquWfazsYn9e3tZz0i3NH01CgZimUaHMduOVC71TX+yw1r6x9chTW9/ivG0B5GmUN
         FSSiMlWUPD2qMyGJ5TIocvAJrsa0gDHhGnTiYkrGuypmqftFKWrFr70s3rtDJaW5ah3M
         2A2t4JkeveSmDMVRpYBo4c56SE658cWg+FfY8dqCXHDeOSoGAsmit3f1ckuL+raxUvOD
         2aPQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTCjO7k0BsnIMiE2TjZfZYKG72aZ4MxAJ97xMDFNdjudEME9LnTFWbN1zY7ImIKAdmvjvZSAWARSXqiw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0V4Wr+awr0o7hB3VBk7moEuIuf745kt2wc/W0HyBzCZs40kY1
	54Ft8srC9uC+BNvBW3l5rbFH9C+QVwXDD6EqEKxydRHchM0uuYJSvFGr14s1VFz7ppaywyjf8Er
	W+esDF/NXYPEQRgzSEjwBiu8eKSREk8JuzL7bK+gbNDlgPou0B/4HIS4xj1U8VD5oTA==
X-Gm-Gg: AfdE7ckJHvKq7BFjBMJPfMgqHhrvPqvRgNyBRx5+0g3kZceX8h9tuy5qUoN0Cxq9HKU
	Yu+ihc5etOv/ThXYZYxKj5zIjyyEzwFLqiJeyUHuPagSMozeYMyiNaU6YzBNlBZmKv5otKJHTni
	BCwcRCHqXdao5z/CDJ7p+09iw9EY3DG28orIyxyhfhefJn2olQtQJ7kiTVX5FqXbbAXb/WerRUV
	6jQ+DMSCXlq7u/MRSzDrtyQMA7OtjAHUdS8sGkG9SX9OgZIrlI0pf20KMUhWEMKuxUgLGzmMqdL
	GSgB0jhAGiNx37uawuaa5+ie9b76TaxqyuTTXk96NZp8Gxf8jULU0AmkTWkzoV1aUvkRLM5aOgr
	6Asl2obZzzx2N5I2tcqEEJuiMtr0=
X-Received: by 2002:ac8:7d0e:0:b0:51b:e991:92b7 with SMTP id d75a77b69052e-5213c2018d4mr158323501cf.29.1784633891358;
        Tue, 21 Jul 2026 04:38:11 -0700 (PDT)
X-Received: by 2002:ac8:7d0e:0:b0:51b:e991:92b7 with SMTP id d75a77b69052e-5213c2018d4mr158323331cf.29.1784633890849;
        Tue, 21 Jul 2026 04:38:10 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f63e496ffsm37564253f8f.3.2026.07.21.04.38.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:38:09 -0700 (PDT)
Message-ID: <850593bb-a348-4384-a034-19f98fda9197@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:38:09 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] ASoC: qcom: preparation for Card capsuling
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <87qzkxi0j5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyMyBTYWx0ZWRfX0ohkx2iXNdkG
 UJPfnCA69G8Zt/i/R3Ndkm3F8tnQl9zpayV9qPq4gAUBnpGeSQGsMlK6AGIH9ZsKBwKCCpY8Q/W
 i0LLNWaRg7m8xe04caJR7RxELTprvRFE1a2VbAzSL5KQElWa/uqYQb2W1/1QMSIN1D7oe5sUf0n
 4ywOwIUBJG4MhM/i3VRqIL6JfdjIyu6bsG78XTfLQMj7b5lenVONO03Q+dZLjM5RK1rXZdD52/r
 9kkwSrp4stqb1FPxtmoZ8P5E7FgkEVFk5Aaq6jX7IbZ1uBnyqKK7qPSbILZ0syRRS8n8i/swhU4
 QLY70yLg2TJuW4BvqJvHhIpbIKly5W4CKRMkonpAez0zgQSGlLPD3zIzw6bOC+qJ6290aKdVIoG
 4WMIFpo3G9/kHNVHTOELT7Lm12+ANqsDUmcr7QOXTuiiaZTPWNorWCMsxPfz76hAQ5HenTMR7VM
 vjWaoEQLq/1j1q3rDMQ==
X-Proofpoint-ORIG-GUID: Vl5P7N9hr0x_AkyKL1BsOQElh8oNQUk8
X-Proofpoint-GUID: Vl5P7N9hr0x_AkyKL1BsOQElh8oNQUk8
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f5a24 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=aXA5RslYEjuksw6KpowA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyMyBTYWx0ZWRfXyVne1+EHplPu
 gZWUvXSu4wgARYACdMkbrrAButE+RcK5AV9yqi+8M+qf6WeOl7CAjpTAQ4GAukpYCuho2t4iqtG
 7tepROaFFCwjFyccpAbMEfophsW63VA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210123



On 7/21/26 2:39 AM, Kuninori Morimoto wrote:
> 
> Hi Qcom developers
> 
> I will post Card capsuling patch.
> To makes its review easy, tidyup meson drivers to reduce
> un-related diff as preparation.
> No functional change, but is preparation for cleanup driver.
> 
> 
> Kuninori Morimoto (3):
>   ASoC: qcom: common: use dev
>   ASoC: qcom: sdm845: remove unused card
>   ASoC: qcom: storm: use dev instead of card on storm_parse_of()
> 

LGTM

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/common.c |  8 ++++----
>  sound/soc/qcom/sdm845.c |  2 --
>  sound/soc/qcom/storm.c  | 12 ++++++------
>  3 files changed, 10 insertions(+), 12 deletions(-)
> 

