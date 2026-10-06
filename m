Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE7C3DDAE4
	for <linux-sound@vger.kernel.org>; Tue,  6 Oct 2026 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791275727; cv=none; b=DcYmMMxkr2AdQVEu/C7edu4DOc5xa5oD4ZfSEvLeyJ4EdIln6acmrgHKH1uXq9Q606Lp2BAycyYXSeZPRmhnbIwz0FqUvZ1zjEvFbf6S8DX602QjIrN8KIHJ6MOL76d8QSUMU6Z9PDzkvREqLChMfFMy7d6yLpMhs9xmlx3CLmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791275727; c=relaxed/simple;
	bh=EkyRhQuPMwAhaoX9kduyyF5/JKDntQkvvetRV/W6idM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pUWZKJy+3MAk1ss+EChLaatW4+cNWD5YHxay98LtWwlJ+PC+Io7Emp3g33sSDWoO6sPfyCauIC0e3IGrgF2FlHadmO+Knakt+XGRCLWGXNZLMRePwr60D/XjpSzfXZq/2uqEtEqrJqpzAk0yUSnmnBSZ3mv0LFxfs3KhBtzEUhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e2i9BEKJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZqYs5HZO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e2i9BEKJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZqYs5HZO"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966eETa4103759
	for <linux-sound@vger.kernel.org>; Tue, 6 Oct 2026 08:35:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hjQVznQngwTAd6AOQaUCpR7BgY8+xO3PfRyaGGohqM=; b=e2i9BEKJXT2T9yZT
	6DC41KanW2kiXVHas/w0ggKtZvcHIK4MurGvsLuW6KHZO/jowXmRt2Svn5P3TI6I
	/NSUCnlFxeBWZnvkH4W1FrQxtBCgIe33LaUQIu9NKKeKTEMq4twly0g55GkNSJGW
	q2Cm9U3IJeEcNWTKAS/hgdxa8S7GodV8Qmaj3d9QeTzI4TVv/Yr6gpt/YLzBIxcL
	1BuOayjPTk215rxrsRZ6+IW3OBlQ7AVwUgrIBnNS/NvB2KxcXHswKF5FcEV9RavM
	nNZT0PPhY3aUlarenXMEx56FOp2qMixU4ItrlW9sFRHROqzaQzwPiDeP2jHQlQuq
	O9Gpwg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr0arf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 08:35:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-88c768885b0so2022809b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 06 Oct 2026 01:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791275724; x=1791880524; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hjQVznQngwTAd6AOQaUCpR7BgY8+xO3PfRyaGGohqM=;
        b=ZqYs5HZOKhm5yGXGLoq8iFdS7pnEWMQTZFv+HixCWwedHXvsLawVosKLhU1AwbmgjA
         lSHxI3rIkQh6ANTa5kjbV7GyZspWU78Fa9W5HM9NZ5Bbrr0TdbY/7YfxvSovKT7GkUKS
         gjidqEupkG+kHtqfvFJiCqlBuHLuM+OoEc8zZyOJZk6DAa7gbR47Wm62Y7OL/wBZ/gzB
         njYqXpD3xG2OEgyujygqpuSZNRMrT1dZvKbvbKCBzeEfsWzvwpW03qzMv7vbHfpt7uxi
         70RulMHLfhDDk5/TrrRFwSfp8NVJyKEqabULBZIIk0PUdoSINumc3nilRMlJvi02CnzI
         iQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791275724; x=1791880524;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hjQVznQngwTAd6AOQaUCpR7BgY8+xO3PfRyaGGohqM=;
        b=SNfUzyp8NhB3MYpGSJYdOMF6dIxnsE+GFByIX8I9Xs/yh5fAqfjsZXXrMbX0a/94aU
         kxQa1wOgvQelxlwyqQHgFIM/aw3JfG7rJIL0IjzbD4kxUvH268SIMnQAfLTNotikKvXj
         EVsjFxDoDUa1F6V1pkf2QGOmPNlPQMwtvbomdPLa4M7I8Tw2HcjjfN8X4Hab6BoT4yvq
         +nk1+bxZxid2P7zbUMsFPsIVpkzbWtiZqYlwPwwg8os5oovpLDNW+3JBvHsVy1JSCZya
         VlH0KN+1ixkBufge7xqKbsYcy0yznrthtQd6Bq9vU6eXV8yXCLnhnRaG9OQS/un1I4Lz
         ILGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxzYUfrkVaAj2mdnYElWconsusxJSIyqNKqqJSdUY7gS1TS41eeHYY3aAYr0fF41cAzSl0S6AJBtEc6w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIRdX+vbRGpi5EJ2cmy5ir1k7cMa2DAJPoDXi8166FgCMnx00ry
	KweVVqtIxa19fdSXmeSoP/vp9DyS3pLajynuKgRkr2hANWIogqTXxaId5iJWsdloomQdVn4lcB4
	yteOhd1KICFt36ybOd2ySXWnu9UJOPq+dW4D4B+qVb+wfRR203wjjhq7LbKkaDtYS3w==
X-Gm-Gg: AYBFou2im1bLiptnPrdXsT4XaOjoMPdWCE43IpFCP4GXsGwWmLe8bO04YZfVSp1+84H
	isafdtXqTlUKv3NznXoz4hToQQmrk7DYTN8WwjxS3uU1l81o7UPlqb+vbkECwU6a9p3Wh2UCdmv
	91Kf3PwJjL0y5pNONBinq7DX0wtnL5BAJ3k2u5qSkIif1q7eWnFNz43llPfhWhTVnlVCHycKiBG
	vCOVZWNTfdfTmdiP9mtY6OktaOqRqnV8xbzxN4ZiFPw6NV3PGel1y9AMcqj/I7Uc7UYBsfk1Wgy
	c3AoxGmp/PX8hcw+SIJFYWj3jXSOLEaFSoqDucWWk38aZvS51ZM6GslJTyJ/MnYeIcfCuSgBeJD
	ExmA3CtUo5yS5KxmnKoP28SlLwKU=
X-Received: by 2002:a05:6a00:1d98:b0:88f:9fd9:3779 with SMTP id d2e1a72fcca58-890ddd02234mr639467b3a.19.1791275724323;
        Tue, 06 Oct 2026 01:35:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:1d98:b0:88f:9fd9:3779 with SMTP id d2e1a72fcca58-890ddd02234mr639449b3a.19.1791275723900;
        Tue, 06 Oct 2026 01:35:23 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0c79273dsm4462425b3a.40.2026.10.06.01.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 01:35:23 -0700 (PDT)
Message-ID: <c732b508-ee0b-43c6-81df-1070c8460bfe@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 14:05:19 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: defconfig: Enable Hawi LPASS LPI pinctrl
 driver
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261006053717.3455143-1-prasad.kumpatla@oss.qualcomm.com>
 <20261006053717.3455143-4-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261006053717.3455143-4-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNCBTYWx0ZWRfX6FVybCfd6p4V
 iMaYhTRX/KxsLG1ytbeCbnDP5WjE95Nh1OsO6dUziE25J1KfdY09TiPx84wQO4HP6EMSvb/mua3
 Js8JpzkVVKZbXLK/7ZfSYjoOhumFje/ll7co+H9KNHHzS/81mCTLHJYZDMjvJmWjpiz1nxw+ajY
 n1quisDqJvtXB3riB8SfeXRyCOvsqAhwRSWCgDya0jqRPUC8E1dvMiACcm/w5xa+x6z0bhGkgiC
 /dhxlbIw5SRN+H31k0NrYqJ/NpGCuya+YZ8pKj9aj4npry3PIsMFUZd1LqpLMDo9rBwLMWAeegw
 dWNAaE448MVLlIP0rfp+ueIC5A/vc8H0sEoKoGVrGt0gLW7+uVSdZyGmckUVk0e7fw7EC1w/rYS
 MF+ve3aDXrgvSk8Bkm2Utpzla+FV2DA6ADuop89fT528M/vosmjYEAOD20DLy602oddmwe8+N9u
 wPt/36dMWDhN87/V2ug==
X-Proofpoint-GUID: 9woy_wTSIJaHgdTGHwqEn04uHnQ1zwLK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNCBTYWx0ZWRfX2F9hGvpG9iJP
 afb8zpQO8QsUE/ct0uMsHdtoEq754EZ4YVvkylwEM6+pWaFIEt4y3uFr1SD5B063ltqmbWAxCyI
 b/xPhYwMBAJN0/E4MZp+/M1NZZUk+Yk=
X-Proofpoint-ORIG-GUID: 9woy_wTSIJaHgdTGHwqEn04uHnQ1zwLK
X-Authority-Analysis: v=2.4 cv=BrQIUoX5 c=1 sm=1 tr=0 ts=6ac4b2cd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rcwA5kG5DHYTcFEa1nEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060034



On 10/6/2026 11:07 AM, Prasad Kumpatla wrote:
> Build the LPASS LPI pinctrl driver as module, as required by the Hawi
> and Maili platforms to control all the LPI GPIOs.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

Thanks
Ajay Kumar Nandam

> ---
>   arch/arm64/configs/defconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index fce418fe6ff6..2a8e94b4d09a 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -704,6 +704,7 @@ CONFIG_PINCTRL_IMX_SCMI=y
>   CONFIG_PINCTRL_IMX91=y
>   CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
>   CONFIG_PINCTRL_LPASS_LPI=m
> +CONFIG_PINCTRL_HAWI_LPASS_LPI=m
>   CONFIG_PINCTRL_MILOS_LPASS_LPI=m
>   CONFIG_PINCTRL_SC7280_LPASS_LPI=m
>   CONFIG_PINCTRL_SM6115_LPASS_LPI=m

