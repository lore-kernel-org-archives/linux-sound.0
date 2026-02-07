Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321313033F0
	for <linux-sound@vger.kernel.org>; Sat,  7 Feb 2026 09:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770455830; cv=none; b=O2KAL869GNJIKyHvBPm3Cuh3usIdsmjWeaUC3Oz/2a48hPdICoHos425RHtbMst3JfzTHfkQ7nP2qpDV/27DiJpYGtp5cMpRQKWGQyMiYSxB5AuBHVmWgz1VCbCPx43cZC+946k/bDpPdS04rDW9x0L10Y9dY9/6yRDbviRb2/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770455830; c=relaxed/simple;
	bh=9NTj8bze6eCT0gE44OzOQat7Pe7A3mxPsta0j/QPQbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sm4iQopbfiuTLJ0FKAJuAmDEJhFS8Vaaaoahe26sL/covgYzgtH0O4yeDutbYZnRePZilCxlkUV9ojMHrFkBZnbC7QRtvp3uIFArs2PpEjAopt4dT1KW5jgF95KBvg4wKTUkOy1G9n/S3s5x+RAxEnbTCzZ2klZvJ7j7kikwcTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z2wAH+CH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ibd3xx/G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z2wAH+CH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ibd3xx/G"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6174NJ691117558
	for <linux-sound@vger.kernel.org>; Sat, 7 Feb 2026 09:17:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=YDwncRQ168ONlLDkORs7Ecnl
	lvkOETKSKd/v3Pe+RYk=; b=Z2wAH+CHV5GXOnQAn6e5aNvaVwV9hKHnoucdD0fl
	WAkYpYb6KpaAPQj0WgxfwuFN1aBET/jgAh2lrBOmQMMckgZQO1U/tsZLXPGfYzqq
	s5ONSI/h3f7ZJOEdnwJkEjmr3symPMvLIYrZcp5z5YLfzrDcdKx/4xdA/H5NI0qh
	PSoCShabfnGrD0CxJHT05cwlQZRv5/KmplmXOHnpK1+8D2rqUKGiZ4/c3AeNgaQq
	XU/1Kb7raBM5hrnaCA0PMSkTCI+EpH22y+6ZzC9Cj4ingc7nIy0ypOcAeyvLikB5
	4vBQg9VVLI/hAfUHiDnNcxPIr/sVONHmf1GsF/Dq1KgWYw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5xamrdsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sat, 07 Feb 2026 09:17:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cff1da5so722777885a.2
        for <linux-sound@vger.kernel.org>; Sat, 07 Feb 2026 01:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770455828; x=1771060628; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YDwncRQ168ONlLDkORs7EcnllvkOETKSKd/v3Pe+RYk=;
        b=ibd3xx/GQCkUVLLxD1eA++Mt+5FKEhjD8G1S775JOdek75kxLB/xVwfp4UKvGv9BLZ
         8NAE4hIZAnbsu+x4MF2s4Ag00zhwS0V+w+3CyCB0nvFGrkx5ZHaTJDdSvlwDbQNL+R8v
         D6KhnY1WuT8uHDYe6f5j9CKilvmoi1EglBimtX6N/N8CQX6ZHF13GqAfU6VhJArHiTAb
         2ux0BffePt4UO+XUzsxqVwsBIX7WIpNzQFsS3Xizum96HwlGBElGKMGLEe33ISzN1Jnn
         2GOquFyALLDzeYRSz692b8SnRKZ2SvmH88Sm+ZloIQg1nzIA0xSPivO362b2mG+XCoSh
         Id/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770455828; x=1771060628;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YDwncRQ168ONlLDkORs7EcnllvkOETKSKd/v3Pe+RYk=;
        b=gxi3Bfk63ZNjSPipIIPOAtvJh9zCJPasD00MeQRqvqp8AOh9rZTsGJrmcKNb3UD6SO
         W4us1TvsbAHj41EXLqPuwgEdGSoZmhKSvPIQ4ENaanFT/4qiMwYu14sfvQpvZ/g4Q1ch
         f+Y/OBJiJtd1wEHwnX4eX1nC2CTeZfq7LaSCqGNxoh75DpTgju7u2ICN+CCW0bVOYwf/
         rHR2gsdKbNn34tpZYO00Ip4kpatR3DQMh7/odUE1/kWXv5hmfhaHA2zEFc4d0B5s0jOK
         rnqNOSZVrHirJwsPHRBqVO3p9luZpSgHkIrMrOl5chjj0G6IxOy3SeLbtVXADI7zbuwF
         cIgA==
X-Forwarded-Encrypted: i=1; AJvYcCWUjtGihzBb8ekD0E9q57Tsu2QGKGveeqAA0msz5m4SE2t1n8aVO3Copse5yskTVTCGIO1i/F7WivehZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yydxaj83NjGcN7b3fv/6fRbVG3VI6uNlQ7cCRlg1RTyjdz0U/Zg
	kP/LObnTlrCHHYJciZ1sEmc5ykjQI1JrAUI0a5qauRAoCtN/Ye5q4jXB3rSFALgpQtcsNsm7ywj
	TWVmPu8gxwk94V4ytp4hYUkKXhyd1OS2F0md6VDm2WNEUJ28jkvKmW1jmz+57GwQw8g==
X-Gm-Gg: AZuq6aIaFKL2YBbT4KXwzfPfDI7AMIuReVgOzkI2I2GD1/cNahc0Kg23uQR4ss1/I0S
	HqJzQwEwn7WdDEHmNeQxgBu0uh6/nBKtEQ1rLdKYjK1+Zm4l4GBaX5I7li53FPmsO0X/gAfpJqF
	qUyJ067lGZ01mRybfKuK6KLhhfCIEvi0LiZP8OVAszh/YCRtqTO7hMk47nln3yqCU0LxvUA/nRL
	0DBvC2X6iRBqmeSbZy0Ly6uHvxIRr4IcVjtjiFH7fpzSISkdre7SEYQtdkKTcyTApMG8gTbQTE4
	0MJp9bRUpcq+ymVAcuuH7CEvBD4TWiqPwJDWS7EPXr56rM96XrFrJhKSfbqqQvkfFUqYhtdyFQE
	d1TBkC+82ywMDEKTpBpR/V3XLSV4nciGTlPFepoLau9ipCiTWo+N0lk6DkQrluakzzMFGnXGx8a
	olCGi+D/KPGWaHnqYSGAI+IlA=
X-Received: by 2002:a05:620a:390a:b0:8c7:1b3f:5eab with SMTP id af79cd13be357-8caf17e3d13mr709723985a.60.1770455828411;
        Sat, 07 Feb 2026 01:17:08 -0800 (PST)
X-Received: by 2002:a05:620a:390a:b0:8c7:1b3f:5eab with SMTP id af79cd13be357-8caf17e3d13mr709722085a.60.1770455827958;
        Sat, 07 Feb 2026 01:17:07 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-386b6158615sm10860231fa.0.2026.02.07.01.17.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 01:17:07 -0800 (PST)
Date: Sat, 7 Feb 2026 11:17:04 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org,
        krzk+dt@kernel.org, cnor+dt@kernel.org, srini@kernel.org,
        perex@perex.cz, tiwai@suse.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, quic_wcheng@quicinc.com,
        johan@kernel.org, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stable@vger.kernel.org
Subject: Re: [PATCH 02/10] ASoC: qcom: q6apm-lpass-dai: Fix multiple graph
 opens
Message-ID: <62fl655uwn4fevonuuhxs7rplpmcdgkghrivaihhptz3e6empc@snkbjhydc3mu>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205171411.34908-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: q82o4dA_QtRyfDveKdiZB3IXcsKIblXo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA3MDA3MiBTYWx0ZWRfX+kQDsRGaBSWx
 5GXD7Tw8/DvqzYhKcmuXjDbEf9z+Vi+PuJQbvSmiv6of4AShKktUOvLp4UH2n9Hu6g8WASVkkOp
 +GyiMCh1eqdR3w8apOspRerjDoNWjqiUAJZl/YBeiFK2k6PNBnWe17Lu/HViBbc/7tS5fV1AY+C
 BngIRVW606XpVWQXXOGKvmRrdmMFHSju9VZkI97QumnqvGJPrj6HSBi46CiNIo4OUr1Qf0khhOr
 9F1Li6w3C6ItCsiGiFOQ1e8s+pLhKYV0Nzdf77rtFFRAhiT8TfSa2LP8JVR6MqAd22bbk01Muy7
 mKyL3kZ0pVogA6ja03GU4/lFnr0FLrqEeU1YjmwfNHy0loUWzKs4pzfoL2Uwu7hCkBluV1Shyoi
 WLYR4syCpN4RFPVROQ06cJ+QsadX0j8htVOBE9apIvmz7Xer8HlYYp77/KqTdXUPPzMQ8eR6swR
 z0xxxioHZexAqrCCDpA==
X-Proofpoint-ORIG-GUID: q82o4dA_QtRyfDveKdiZB3IXcsKIblXo
X-Authority-Analysis: v=2.4 cv=Or1CCi/t c=1 sm=1 tr=0 ts=69870315 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=wNLNz8utBmpzwjt1yvAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_05,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602070072

On Thu, Feb 05, 2026 at 12:14:03PM -0500, Srinivas Kandagatla wrote:
> As prepare can be called mulitple times, this can result in multiple
> graph opens for playback path, fix this by checking if there is already a
> graph instance.
> 
> This will result in a memory leaks, fix this by adding a check before
> opening.

I think, the commit message should be improved by removing the first
'fix this' sentence.

> 
> Fixes: be1fae62cf25 ("ASoC: q6apm-lpass-dai: close graph on prepare errors")
> Cc: Stable@vger.kernel.org
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 528756f1332b..f68d4b4974f3 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -181,7 +181,7 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
>  	 * It is recommend to load DSP with source graph first and then sink
>  	 * graph, so sequence for playback and capture will be different
>  	 */
> -	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && dai_data->graph[dai->id] == NULL) {
>  		graph = q6apm_graph_open(dai->dev, NULL, dai->dev, graph_id);
>  		if (IS_ERR(graph)) {
>  			dev_err(dai->dev, "Failed to open graph (%d)\n", graph_id);
> -- 
> 2.47.3
> 

-- 
With best wishes
Dmitry
