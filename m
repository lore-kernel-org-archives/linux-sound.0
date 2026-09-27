Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C7C4279E3
	for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 17:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790531744; cv=none; b=N2CDZX6opcQExQOsTScJju1mrM9nC7UnPLePFDxiy212PrOuO7OYd3Tw9ojmJf7CP9xQ+B4YKo7cMZLxQh8cqGtKsgJ7uMwEbSSoGjdGYuOTaTJsixkK7TtljNCMe6gXjjuviikfWhFqvfu/LMBf7tU1rDzRrbLG5jRxUfGxrh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790531744; c=relaxed/simple;
	bh=uzulCFmfSKx4L2uI+AawFiAkCbCZ9nYjgV+Klw292bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ELh+ZW252wTXB18Y4ciX8Xj4Jyi48Pz9LimOKpJik3F14qcXB8DEgKKzoWte8BrIJXiIp8xQJRVmhHqBk+/zpK0SzZeo5ByZyiGI7XixhbCK/djq6vl+fNZfEF0UtMHUCs/FZR0GplcT1KcnIM625gd7H8lRcNWQaJKco0i1g0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TGt0TzC1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=au0sNVU9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TGt0TzC1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="au0sNVU9"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RGmbVT3167999
	for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 17:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eYTBzgG20csW2zfR3sxsuXAX1IOCeJol8XD1eAHh4xM=; b=TGt0TzC1W+DHwGVw
	W6Ou9mO0ezipe8xZwRbureLRbkcGzR9g4nF2P6i7aD6nnNpsftwQxK98gCRkYRZ9
	gDq7TDk35Rmf7aUT3h80U0+Zv2oAJ84er1BoOrdfZlF6amZt/oZSyT4ktBu3O99X
	6GxM9w5oIWukMXAq7qWNgnpABMhyrt5lWDNmrW0B17K0/BE4NvZcaCU0+urDDxXj
	rEFcpGiRzhV3K2CqcTCnZFQq9ifnXHbw/76+ryCAd0oHCVoS2kP1av87eF1UkxfX
	NHd75BVCj2dZR83xZpvUE7Zr+6Ow7RDvqsDciKXnqYP/hDmgNIaSrxECxIWgTLC1
	LmPvNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx77jua9j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 17:55:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939f3426a7cso567901685a.0
        for <linux-sound@vger.kernel.org>; Sun, 27 Sep 2026 10:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790531741; x=1791136541; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eYTBzgG20csW2zfR3sxsuXAX1IOCeJol8XD1eAHh4xM=;
        b=au0sNVU91100p4KEVo3fPpjlp/apx9zBJ8fA1wOUNPPcfd5oAN36xSh+V+ENw/wFeV
         OpHT5wMkJ7b1ZzBs7inY1fR3Z3gCMVe5avJCCX12MoBUnbprQ50Q5yh7GN7PBcRez5in
         up4Zgqb6WD+0Kz9oEm5E/682JBfuAleRalnSFr9N92ZM24B2rBEt6/Hiq4DBYh/KK7l+
         /jBqFLmrpNoZvj730slpfxLRi/H48mljTRFbyuZsDvltfUaxcqJVbgv03oOmq1M08uO2
         kf9slDWtoja7VW2o+C6gSupnwZ0IW6N0VVf2Z7JwFkUsvkg6zNck/MS8I9j+0oy/25x2
         UyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790531741; x=1791136541;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eYTBzgG20csW2zfR3sxsuXAX1IOCeJol8XD1eAHh4xM=;
        b=jX+s/3nuUSzLDengYrFyJrsoRXmWo9EdRNyNQ7cPeZJ5+EbM+2xLs4NCyAkMLvpwE3
         geK3OomMcmn+oorlIOqnzk0N4SnqyW6usVX4NfwtsmF8dT4BzPSSe4A2KkUMktO4sVw7
         BKt4MUp28t/WOX97bfdaZdSs8aBsNtI04dfwK+nfml6mXJUbffwZ1AHKr3WA+wBnr/CU
         YJDoBU8iS39vvx52qZuuWzSfmjzuymLod4ANoS3YHQKxlq1AVyaCNEHJMSYZm/p7edrB
         0msxgkYvGX+FOaCs0CmJMRHkB2eOn+mjPMfUU7PcyYgF4R6dCXTH6JTxYxRzgYNhz0Oz
         sJxw==
X-Forwarded-Encrypted: i=1; AKwUvByeT/2xQfG4rAnxv0H8jQCvsNoVGLPXrMMBJYNIFp4icFkrvjBNYiSR9KO98RU5qJdQ3QFza5pc6wAglg==@vger.kernel.org
X-Gm-Message-State: AFuF++l3KGo1KXsIih/hnga26nwCHgXriu6ZjLiOn98vJxOVC61GvVQX
	ps+z3S5goLRRK26nJgP2W3ehp2ssXQjj2zO30NRhcnX2oKlA73IU0ksvtBqXP4NWHUY77fHk7Mp
	C2MS0KPpktc8/RcFc855kT9L8NL+v3kLb13W5AkKDFv3aqbYpIoWCXTjCpBsu5qBm1Q==
X-Gm-Gg: AYBFou2bmjfw64IvGLwTbxzDSgiGBV6hpgJDfAr/sxlLjMhe0kRtGq7/PCgONOrmEex
	mS3u1HjePf9quZvnE/sLq5WVkH53RKRIYrFltOcKxlnQ9o2jt78CGBkrE0N8RZfw/O0oXs+OJeg
	m/6M2IzlD0NcF/6faeQ9QovTCuCylBU5lmSathnTMYjtyHRQ9sf/XuyFWIT0HP8FeOEVymTfneV
	oh0pBAKsM2eYgQBaW0oWLipUFOdgUoAcQLFJEfqdJmoJTD65E1Hf2dQIoCshi0XuTdjeRyoPund
	rllT7d3gdeYhAVZ71Mh4lMOuXMjqDHhT+DBLmC2YqGF0ux/orRkhCLrpXInPdUFVLp41InvkH71
	gTt5mQcjzKtOlxCAjhu/SEOk7hQ==
X-Received: by 2002:a05:620a:2686:b0:93c:208:3d9b with SMTP id af79cd13be357-93c43cd656emr1657227385a.41.1790531740766;
        Sun, 27 Sep 2026 10:55:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2686:b0:93c:208:3d9b with SMTP id af79cd13be357-93c43cd656emr1657223985a.41.1790531740248;
        Sun, 27 Sep 2026 10:55:40 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a00179c729sm116866795e9.15.2026.09.27.10.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 10:55:39 -0700 (PDT)
Message-ID: <9f76e45e-5b0e-4a79-b4b0-a41795d9d025@oss.qualcomm.com>
Date: Sun, 27 Sep 2026 18:55:38 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] ASoC: qcom: lpass-cpu: use DAI table index for
 playback constraints
To: Zimeng Li <me@lizi.moe>, srini@kernel.org, broonie@kernel.org
Cc: lgirdwood@gmail.com, tiwai@suse.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org
References: <20260927010911.51980-1-me@lizi.moe>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260927010911.51980-1-me@lizi.moe>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI3MDA3MSBTYWx0ZWRfXwb0+s7PVR7lh
 L0SebtjJewsSHOZzZQb9YcWxOIYEW48vilNnhYmJjEeeMG0juo10C5vcDf4ippWO8c95sgJ6U0e
 3z45B3cBFTrP+3eMUmbQC6fc/QeG27Y=
X-Proofpoint-GUID: qrW-ZCpI22qcXjsd5D6inUn_GJ8G46LY
X-Proofpoint-ORIG-GUID: qrW-ZCpI22qcXjsd5D6inUn_GJ8G46LY
X-Authority-Analysis: v=2.4 cv=J8U/fwnS c=1 sm=1 tr=0 ts=6ab9589d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iDUYOmZZWeky2fLdnAoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI3MDA3MSBTYWx0ZWRfX9N+0XDZQx74n
 0dw+Hc9Gfh5yVSRcNeevTa8AqAwxXHNmudKIHTOqWY25NF9VlJQbnvSpE7qFNnGclhdpnB02jg7
 FHDz2iWo1t0KONl0LXBlFTByh3ExjhfADZxIrigdngk55dz/F2w40xPqXMua5D8Wr7GtdvYAK0j
 rbJXt8/eFP7LSGxgnQX8Zzb2jDfC7Uf8JjQ+vgHqkdT5xJ9UtV+okrKeJe8yVB8cT3R7BZyrSUn
 LrbYwF2zfSVB9vh5RCLFypSfccUirZZv+nxo7nnMQENfdMyLZxAuwbkAlEO0PK0pkNuI4ZOMsGQ
 ukXAaj94FmNjSkvQYnBB9YtADx/73k7CL50/DOwcMlRx3YUQxbTPF4ugwjvXFdVMWyQUa48a6Eq
 /gGn5KQCdVts1QPurU77Zu+EzMXASV1G5/uCpmy9rEICH7TsrXd1HcgIbFXx73JYiFUZMLmG4Jh
 4ELrlXMni6nfxu7bcOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609270071

On 9/27/26 2:09 AM, Zimeng Li wrote:
> The DAI ID is a hardware port ID and is not necessarily the index of
> the corresponding entry in variant->dai_driver.
> 
> When configuring a DAI with LPAIF_I2SCTL_MODE_QUAD01, the probe code
> currently uses dai_id to index variant->dai_driver. This is incorrect
> for platforms where DAI IDs are sparse. For example, the IPQ806x MI2S
> DAI has ID 4 while it is the only entry in the DAI driver table. If
> that DAI is configured for QUAD01 and probe reaches this branch, the
> code writes beyond that single entry via dai_driver[4] instead of
> updating the DAI being processed.
> 
> Use the loop index i when updating the current DAI's playback channel
> constraints, while retaining dai_id for indexing the hardware-port
> specific playback SD-line mode array.
> 
> This fixes the incorrect DAI table access for platforms where the DAI
> ID does not match its position in the driver table.
> 
> Fixes: c223f41c1a52 ("ASoC: qcom: Add four speaker support on MI2S secondary")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zimeng Li <me@lizi.moe>
> Assisted-by: LLM-assisted source analysis
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini


> Changes in v3:
> - Describe the assistance in Assisted-by, no longer name the model.
> 
> Changes in v2:
> - Add stable to Cc.
> - Identify the model in the Assisted-by trailer (superseded in v3).
> - Clarify the conditions for the IPQ806x out-of-bounds access.
> 
> The code change is unchanged from v1 and v2.
> Compile-tested with LLVM for ARM using multi_v7_defconfig with
> CONFIG_SND_SOC_STORM=m. The lpass-cpu.o, lpass-ipq806x.o and
> lpass-platform.o targets built successfully. Not hardware-tested;
> the IPQ806x example is based on static analysis, not a reproduced crash.
> 
>  sound/soc/qcom/lpass-cpu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 242bc16da..079177a6d 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -1234,8 +1234,8 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
>  		}
>  		if (drvdata->mi2s_playback_sd_mode[dai_id] ==
>  			LPAIF_I2SCTL_MODE_QUAD01) {
> -			variant->dai_driver[dai_id].playback.channels_min = 4;
> -			variant->dai_driver[dai_id].playback.channels_max = 4;
> +			variant->dai_driver[i].playback.channels_min = 4;
> +			variant->dai_driver[i].playback.channels_max = 4;
>  		}
>  	}
>  
> 
> base-commit: 0ed6f7f62318a581fe9698f8a4e98c7ca01160e4

