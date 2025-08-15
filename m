Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86090308F1C
	for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 15:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755273380; cv=none; b=bex0STECRihVAAh7v84WjT7ceC9XZVykF7rz6quo+hy4Pey4gKt/5NCptT1b+UXnVNi/YlieE6rsZR+MB/YBxhfGiAga5fkSAw84VRjIPHVvwIb9mOmfy9eza4ZV4tUVqkwrcZYrMLjwYLj6rxnxek26ilW0G0NUaPo1s4LkG34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755273380; c=relaxed/simple;
	bh=e7+CGkK/0jqNBy9iBfYp6tx5BNZdLcVWKqrNfa0ZU4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+yCgkWXPLN1aU6peAElm3xCxF2b7OWdLsnJwg85wJUdwk8AiQLrqyLvY+TONGru0/DJ2X4GCpbpXImjJUENSg4XNblg5z8FwsG53a+85JcSaM8zAKwXseLRSMGO0jNCWGBCcViwBTe2FfeV/+re4NpD2f8M3mMgyyY1i0K2QTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kXUOjzFB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kXUOjzFB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57FEIjvI005362
	for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 15:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GtvmFet+EnxdEYln5wMNyOiKR4CMbOkykWsS9Ngo+rQ=; b=kXUOjzFBxlntzU8A
	86bHzjkiz7aanX11+w2mlv5XOEplOIn1LUCcM+RBikxrgrT+h850jcpjRb3RA9uX
	17oyJZe/R6bnKnsjms2jnnWLVMVqVS867sbzTqjLymeWS6/JL5ZSrlboF4k1PeMt
	B3E8CR9upuxVXqdKJVsThs9QUDBKiTtyvvReDuonUSXWP5InJ84Xr4cgTR533zfh
	NHmb1SdBjCrT9vTqSRuSQIRC/aGiOkSRBXtSqaPjSrTxKEs9bcvJrhsrKUm8RkyL
	JVuFRgZlxZdv9zkVyRWTT6ta40Dpy/0GN3IySj69qZWpJmEVHQLW/mQaoZFJ1Dmc
	KC1CGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fjxbpnt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 15:56:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e870662c1dso505621785a.2
        for <linux-sound@vger.kernel.org>; Fri, 15 Aug 2025 08:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755273376; x=1755878176;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtvmFet+EnxdEYln5wMNyOiKR4CMbOkykWsS9Ngo+rQ=;
        b=trRrmxAC5WCh1qt1VfPFQEt657ZDw0cCpdQrmBZP6YU/HOmXZagvyH/8aDRWsBuy6/
         WOQTb+uX/gl/6nT45RvGnbNaPGkiXiZpoUhkRbdygaUcqAkGVF3qQdA6epQZAy2pxAuT
         gVXEz4x7kYNjX75WM7EGVWE9lOqaknHv3kMQNcODPPuxRxLGITZWzLsrxEhpibA3dZY/
         DvTGgE6yRXjI9mUMt3cRLCn5MiT5bMKnuaAsrYr3lFHqguJBEPIZxOQQfFuaIaKJ7Cwr
         A3AM8LrqyBNgdgW9ebFP1Lhy62h7pkOroc5k1ujFR3sfXRXva9CMueVUIfnfaru2KmjK
         lGmg==
X-Forwarded-Encrypted: i=1; AJvYcCVux6MzqKeZxOTMkTcSWtLSvvrexRh1VT5fKuRek3sH186V9ZnmdRSFKYdC/UOlvFNZ259H54Q8P9Uitw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9FfTUDIpgdC6XCSHzZ3BTabe56Qhl2lGD+g7DdpVgaY4swXpu
	nPS3HzntbEfPTBHPKpuXnejwX2qa5jaoFbq2ZdCvN4YZoxVlgeHuo2wet/RD8n99vrRTPPJUmTT
	q4WKcEY/Op02ZqxYm4sQ+DV6UC2imAxoeFTNoKqZeR2Oysl0G1DzgH3FCze9xp4SlvA==
X-Gm-Gg: ASbGnctncyueKRkG+oe53IV7n2yoDBpTjnCamf6lWVQqxnbQwc5v00u/7qzn8+FWcz3
	dfMnGPuOgiqiptZ+lC/yweEUUa2pmWVAb+ZhNM6ntk5gGqQtqrQoTystrNJbmOpm9dMY2S1uY6b
	CQSFyd9HLHXV54vWjW/cl+p76Hz5lZGuHl/XTl5Q18+aKY0BVdQNk7VxjBHk9B3BFV4fhRt5E8v
	AzDpZzMbp3PcwPPLzPsxO2QlcpV9odElzqpoIWv6k5FzLFW/ye/reWKHjonByC4R79Y6v7Kk8xI
	NGOaiFoEnqk6xyPtCnnr8EjhjnxqxQ3wjtSn2EMF8kLxKFY2lFS08gZMtGbiY8x+Doo=
X-Received: by 2002:ad4:5bca:0:b0:709:f305:705d with SMTP id 6a1803df08f44-70ba7b2af45mr33465376d6.19.1755273376121;
        Fri, 15 Aug 2025 08:56:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGtYcJDcq8eDAcw9IfvaGVDbxDIvlbsBTnFzsMFelmep9vUCDz3Uun21UXZH05EtZRqi1hgA==
X-Received: by 2002:ad4:5bca:0:b0:709:f305:705d with SMTP id 6a1803df08f44-70ba7b2af45mr33464886d6.19.1755273375617;
        Fri, 15 Aug 2025 08:56:15 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45a1c6cd044sm66417085e9.9.2025.08.15.08.56.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Aug 2025 08:56:15 -0700 (PDT)
Message-ID: <70abcfee-e4c1-42d9-b623-266140aa2ff3@oss.qualcomm.com>
Date: Fri, 15 Aug 2025 16:56:14 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: q6apm-lpass-dais: Fix NULL pointer
 dereference if source graph failed
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250815113915.168009-2-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250815113915.168009-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=G6EcE8k5 c=1 sm=1 tr=0 ts=689f58a1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=eip7HE7i84Mfdsj7TkoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA5NyBTYWx0ZWRfX0dhm8A+I8J7E
 ClfNJSH9YyT1ki3sLy/4c/SYukGNAxxuASDKB84CvAgxbCI1mbqXXtnTTzm1QeDs20hP6PN+fgb
 bYWIGcDjP7M6Rqskqh5JVPml5xL0YhJflsdms2OZ89zszgKxKhyLN1pyFo59E1KTaqd96fbSifc
 P5cqvHHskLrq7F+n7y5hVSWowHhlWCofPDW04OL/udo4y63vYbopvXXcEg3xfjyALqmYjkjA4MA
 lC+IwLO+g6/xfpm/MEU5ntH72MdDYg3QWx8DyGGuiwQqcV4mZiSc0Zfr5DDPMAbq9UP1/LyxV1V
 iLcIQxnwYnI62BFd+PAvU34eVLw5YWpddgge7oyRt2cWUfnKtnn7to6mb1KKuKnD+nXmqtnWZYO
 o283fiYI
X-Proofpoint-ORIG-GUID: oEGov4ntgGXkZwNy-54dazdJ00RWbrL6
X-Proofpoint-GUID: oEGov4ntgGXkZwNy-54dazdJ00RWbrL6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-15_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110097

Thanks Krzysztof,
On 8/15/25 12:39 PM, Krzysztof Kozlowski wrote:
> If earlier opening of source graph fails (e.g. ADSP rejects due to

I think you are referring to the err patch in prepare.

> incorrect audioreach topology), the graph is closed and
> "dai_data->graph[dai->id]" is assigned NULL.  Preparing the DAI for sink
> graph continues though and next call to q6apm_lpass_dai_prepare()
> receives dai_data->graph[dai->id]=NULL leading to NULL pointer
> exception:
> 
>   qcom-apm gprsvc:service:2:1: Error (1) Processing 0x01001002 cmd
>   qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>   q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: fail to start APM port 78
>   q6apm-lpass-dais 30000000.remoteproc:glink-edge:gpr:service@1:bedais: ASoC: error at snd_soc_pcm_dai_prepare on TX_CODEC_DMA_TX_3: -22
>   Unable to handle kernel NULL pointer dereference at virtual address 00000000000000a8
>   ...
>   Call trace:
>    q6apm_graph_media_format_pcm+0x48/0x120 (P)
>    q6apm_lpass_dai_prepare+0x110/0x1b4
>    snd_soc_pcm_dai_prepare+0x74/0x108
>    __soc_pcm_prepare+0x44/0x160
>    dpcm_be_dai_prepare+0x124/0x1c0
> 
> Fixes: 30ad723b93ad ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index f90628d9b90e..7520e6f024c3 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -191,6 +191,12 @@ static int q6apm_lpass_dai_prepare(struct snd_pcm_substream *substream, struct s
>  			return rc;
>  		}
>  		dai_data->graph[graph_id] = graph;
> +	} else if (!dai_data->graph[dai->id]) {
> +		/*
> +		 * Loading source graph failed before, so abort loading the sink
> +		 * as well.
> +		 */
> +		return -EINVAL;
>  	}
I guess this is the capture graph that is triggering the error, normally
we do not open/close the capture graph in prepare, we do
stop/prepare/start for capture graphs and handle open close in
startup/shutdown.

Can you try this change and see if it fixes the issue, as prepare could
be called multiple times and your patch will not give chance for trying
new parameters incase the failure was due to unsupported params.


--------------------->cut<------------------------------
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index a0d90462fd6a..20974f10406b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -213,8 +213,10 @@ static int q6apm_lpass_dai_prepare(struct
snd_pcm_substream *substream, struct s

        return 0;
 err:
-       q6apm_graph_close(dai_data->graph[dai->id]);
-       dai_data->graph[dai->id] = NULL;
+       if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+               q6apm_graph_close(dai_data->graph[dai->id]);
+               dai_data->graph[dai->id] = NULL;
+       }
        return rc;
 }

--------------------->cut<------------------------------

--srini
>  
>  	cfg->direction = substream->stream;

