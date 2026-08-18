Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B690F2D1F44
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 22:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787090599; cv=none; b=gS82/OLsPnQSGAGErpBE1L3GK6/Kgz7jbd4R4rRFuV+nhfADJXAtjRLBYSaFm6refPtUw0bQquOH8vi7uLZc8jpJANicKQJvezP9Y5KW1wwal4S/SLv4yo/3J3wNANhoe1KuWqcMHJUC2cKW2ZhiRh6HHZeB0KgTx0qaptpsQsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787090599; c=relaxed/simple;
	bh=2sKosG/PLs0EDAAv9rfdQuiSlXfmZpTH9sM9MaOnMag=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SPL5Mq+ScLrSvP2yJxOOLil+s0kTi01MXQthPMo3DNed8lSqsFjoEvElhJmk0ktXYtbvehm5LSG3sLQ9mSe3AunD1NuFjKBPIlyCnAgkCD0A1CBCvtDmqAp/a4PLVHAWM6zhec1Q6nKoGLv6WDRS27r7zKIwgx/KFREqTatXbXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fhhjKy0T; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGZUWCTG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fhhjKy0T";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGZUWCTG"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ILbvMa2326918
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 22:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o2drbkgZlh4qyEDNlYRs7ZOmbKY3/yfqRkbgXttKS+c=; b=fhhjKy0TCVGLuY/l
	NkxJ/DkN8tjzWxF3DMTCtchQ0gyFeb4YwdxzRM52VlTe4COcHQXEbeqYNPIBwL/q
	tyuUpQw09Oo+RUWw5OHW0TqJnH6D+l2nudk51IaWVsMrhTcFN8W8Wn15++um54BI
	bvobQ1lprFSjRaN5v8SYzQ0CtoMyB0c/LFDNvL4LyTvSF0OMT4tMxj71HgGHLfWO
	/vTi999SA4shtDKFEOH3DWiuwdW9Un9tH3DS/r2KXVbFOrgk+d+PBV2ZhQ37kUJV
	JmzvZmLxmHex5tymVaJeGodWQIuoN4w0DHbWzonnYJPRdcHisPSvMEnRmiJ8lLPP
	YJiZlA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfjg62u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 22:03:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so656441a91.0
        for <linux-sound@vger.kernel.org>; Tue, 18 Aug 2026 15:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787090595; x=1787695395; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=o2drbkgZlh4qyEDNlYRs7ZOmbKY3/yfqRkbgXttKS+c=;
        b=bGZUWCTGmMvgn61dEs1Ce6+OZjs8m2DRVkJLsbF3gjXNVRCJl5DpoUFs6+NKPjgR60
         NAxxDXT1Cy7B28IBfxSSWKJfXTPdEatwiFNm9tPCJxSBu/oZCe6TYr96uh6RCc06RAvN
         iVGFFkKWtCgLI/XijT/HNtkuulBpYy2+cZk4TA09VDJV1T9r4dkTdZPkSHXDtvBhqkcK
         zrmJhAqw8Hn8Yp1mzTWXsTC0wumqfSzst9wbV7kLXbn9LMWo2K4e4HDPvSmPweVTKmhf
         aIbs8mcDfuXskdYb3SgBrwWN7+3ZL/0NoXbnLkXDI0gTQWvED8HSKaPZbT3p4CMMYCRn
         +9tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787090595; x=1787695395;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o2drbkgZlh4qyEDNlYRs7ZOmbKY3/yfqRkbgXttKS+c=;
        b=gY59VzT1Yw2d+1ZB6WBkgP+3l86fLrSaH31sDP0cy2ci+pby166bp3GnHuHRVT5fE8
         ArFPK205nyvMCNyfCUsETNKAdqL/NhZ8v6JhnNrK/dT+MITx3bUTq27nK+Y/cw0qi/aA
         qW1bp5iXM7WbrJfLhZAeFyCCrd1Up0BWploMglOeApoqtP7uTnc06ZOkCZISq7VJ3prE
         diacyRkPxk8ATcei9fui7jqSBEr9tpeB+EgzM7hlDi+BQ6gpTD+tp9U57SMldaXxIbMH
         81kHmWMUY6kttVFP2iKD+P+SO7CfjZSeJsa4Yfn1a6uGmzZkyrQD8sv2uGH5ZeOrMY1U
         6ITA==
X-Gm-Message-State: AOJu0YxoDiQnoMNeZTO6DGguF93dp/tqLqpQZ6Fs/wwI095oHgBLnmLX
	uNaj2DRWq9PurMdBf+Vrg4XIku3ig8P4X93F8R2atS6Uw01R/P4pe2Z8atDAh5vJjfk4wjo9FAJ
	rvdcU86EUsQ8x7q8C9mBrEuF0K+DJ6xOp8w0EEVkBt7YTMxypgNNpagpY5Ii7gx+s0A==
X-Gm-Gg: AR+sD117YYn7N9h/7XJBVbzsYWHd5VIOnnxv9NvGPQAxopgKWroo3Coa3kzURuw2LWR
	3WcVhKTYZ6otzltutrow/WuRFcgwRNU93QqkfFqlqLYFlBsjyeGpKTi0v/Xc7cI2BeOhaCHqtO5
	hG3R6J4vn20xuaddVt7OfYed/mXQknn+a34A31Jht4lrGMPPLg+HVNrcuanPn7UMyNQPzjn8zoT
	8mgFvFTM8joCG6k/mkGGQgQ3PHtPzZYPROzXsw4TIe2YY+q1RY5uhmzV13VUC7/PCoIKzZVsjxx
	zdQr3M86PkOTP6efjmAIJ3DeyvvBYLjz9sIsNQPEJ3ZF2HF8iz7TanfSQYgpj0BYOQVWT3ie+C/
	X2kcUVwxcUzr9Qj4GK7Fd8spT2Q==
X-Received: by 2002:a17:90b:39ab:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39580ed4567mr75874a91.4.1787090595357;
        Tue, 18 Aug 2026 15:03:15 -0700 (PDT)
X-Received: by 2002:a17:90b:39ab:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-39580ed4567mr75803a91.4.1787090594821;
        Tue, 18 Aug 2026 15:03:14 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1416aea2429sm269654c88.15.2026.08.18.15.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 15:03:14 -0700 (PDT)
Date: Tue, 18 Aug 2026 15:03:05 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-sound@vger.kernel.org,
        Vincenzo Frascino
 <vincenzo.frascino@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>,
        Michal Simek <michal.simek@amd.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ
 ARCHITECTURE),
        linux-kernel@vger.kernel.org (open list)
Subject: Re: [PATCHv3] ASoC: xilinx: formatter_pcm: use more devm in probe
Message-ID: <20260818150305.00000a2d@oss.qualcomm.com>
In-Reply-To: <20260814204428.37786-1-rosenp@gmail.com>
References: <20260814204428.37786-1-rosenp@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDE2MiBTYWx0ZWRfX/JJNyC6qspkb
 MKgxwJOR+N8Z7xVtfgONxxjky0sBD38cJ08ULmGUi/oW82fv86cHWG6LIttwum/CCSqyZrByZF1
 1VVPoE+qI4jpSvjNbIyIXAjgSnVJc3IU+JHlFD4kuYh/laTVPbmJNZIlA3WMNPJMgPjg5Yyv9w7
 Zq7xcAlpHEMNdnR78PH2TxglSXFAu1wHEx4xVZavUkaHVZfbMxw5n+yyLN+lpud7u/AWBTEKxBF
 2DFAAXDzvaSiYeqSaWZM9zlirgdsmsHTN4lf60faM6HicYpnu9we+tQQzF25UdBqUaelDpAfHZl
 RslKsj3uFRYoRbxU2pD5Lqe9R5mWboDZQ/oddhbH/srNyuNZWgVPEmt7t2Yo9Xra07bQiuNL3wb
 QbjHxgtEAuriTRCbLErIZOWHyDDKiRyRly+OqfXEoV4KWTnlP9dkjm/xsPc3SQzWWU5RCHlSFas
 WXS2SaLr6Xlt9nWRtJg==
X-Proofpoint-GUID: WE6JQ2kndCAk2ahV1PQHdnwOHICxFRC-
X-Proofpoint-ORIG-GUID: WE6JQ2kndCAk2ahV1PQHdnwOHICxFRC-
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDE2MiBTYWx0ZWRfX2eRTYgpIE6ve
 Qje2pfavPl0URBR4o2HDRi2F6k8eesUFZxbf921k6zWzgJG3WbnRGtUq/SbBs2YSx6ypsGbBo5D
 wgkWuBOhBplOgLnyTZfwyac27AAIhxs=
X-Authority-Analysis: v=2.4 cv=Sb7HsPRu c=1 sm=1 tr=0 ts=6a84d6a4 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=zd2uoN0lAAAA:8 a=7CQSdrXTAAAA:8 a=b7Ee_MopkQ2dvn5odMIA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_04,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1011 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180162

On Fri, 14 Aug 2026 13:44:28 -0700
Rosen Penev <rosenp@gmail.com> wrote:

> Use devm_clk_get_enabled() to let the clock be enabled automatically
> and cleaned up on unbind, dropping the manual clk_prepare_enable() and
> clk_disable_unprepare() calls in probe and remove. As a result, move the
> clk struct member into probe, which is the only place it's used.
> 
> Simplify the probe error paths by returning directly instead of
> jumping to clk_err, and use devm_snd_soc_register_component() return
> value directly. Also remove error message from ioremap as it throws one
> itself. Same with devm_request_irq().
> 
> Assisted-by: opencode:deepseek-v4-flash-free
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Michal Simek <michal.simek@amd.com>
> Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  v3: rebase.
>  v2: add signed-off-by. Further clean up some stuff.
>  sound/soc/xilinx/xlnx_formatter_pcm.c | 71 ++++++++-------------------
>  1 file changed, 20 insertions(+), 51 deletions(-)
> 
> diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
> index 3d6f1e4046d8..5f63fb28ea5f 100644
> --- a/sound/soc/xilinx/xlnx_formatter_pcm.c
> +++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
> @@ -82,7 +82,6 @@ struct xlnx_pcm_drv_data {
>  	int mm2s_irq;
>  	struct snd_pcm_substream *play_stream;
>  	struct snd_pcm_substream *capture_stream;
> -	struct clk *axi_clk;
>  	unsigned int sysclk;
>  };
>  
> @@ -596,30 +595,19 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>  	u32 val;
>  	struct xlnx_pcm_drv_data *aud_drv_data;
>  	struct device *dev = &pdev->dev;
> +	struct clk *axi_clk;
> +
> +	axi_clk = devm_clk_get_enabled(dev, "s_axi_lite_aclk");
> +	if (IS_ERR(axi_clk))
> +		return dev_err_probe(dev, PTR_ERR(axi_clk), "failed to get s_axi_lite_aclk");
>  
>  	aud_drv_data = devm_kzalloc(dev, sizeof(*aud_drv_data), GFP_KERNEL);
>  	if (!aud_drv_data)
>  		return -ENOMEM;
>  
> -	aud_drv_data->axi_clk = devm_clk_get(dev, "s_axi_lite_aclk");
> -	if (IS_ERR(aud_drv_data->axi_clk)) {
> -		ret = PTR_ERR(aud_drv_data->axi_clk);
> -		dev_err(dev, "failed to get s_axi_lite_aclk(%d)\n", ret);
> -		return ret;
> -	}
> -	ret = clk_prepare_enable(aud_drv_data->axi_clk);
> -	if (ret) {
> -		dev_err(dev,
> -			"failed to enable s_axi_lite_aclk(%d)\n", ret);
> -		return ret;
> -	}
> -
>  	aud_drv_data->mmio = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(aud_drv_data->mmio)) {
> -		dev_err(dev, "audio formatter ioremap failed\n");
> -		ret = PTR_ERR(aud_drv_data->mmio);
> -		goto clk_err;
> -	}
> +	if (IS_ERR(aud_drv_data->mmio))
> +		return PTR_ERR(aud_drv_data->mmio);
>  
>  	val = readl(aud_drv_data->mmio + XLNX_AUD_CORE_CONFIG);
>  	if (val & AUD_CFG_MM2S_MASK) {
> @@ -628,7 +616,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>  					       XLNX_MM2S_OFFSET);
>  		if (ret) {
>  			dev_err(dev, "audio formatter reset failed\n");
> -			goto clk_err;
> +			return ret;

Why not dev_err_probe() for this one?  Even though maybe deferred handling
isn't useful here (I haven't checked) it still gives more compact code.

>  		}
>  		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
>  					    XLNX_MM2S_OFFSET,
..

>  	if (val & AUD_CFG_S2MM_MASK) {
>  		aud_drv_data->s2mm_presence = true;
> @@ -654,7 +639,7 @@ static int xlnx_formatter_pcm_probe(struct platform_device *pdev)
>  					       XLNX_S2MM_OFFSET);
>  		if (ret) {
>  			dev_err(dev, "audio formatter reset failed\n");
> -			goto clk_err;
> +			return ret;

As above, I'd go return dev_err_probe() everywhere you now return due to
the other cleanups.

>  		}
>  		xlnx_formatter_disable_irqs(aud_drv_data->mmio +
