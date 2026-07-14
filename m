Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEDC3DEAEC
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016346; cv=none; b=Jrp+K8Rxs0aE2RW3l/hUx5SsZM0+kajQisIVE/TySlz1aoFS8gwuuEKFo9NsU8n5QNaJVGW71LhE5fase0L4kxRnGrzmvZwAYUaFEczAHIUGHGd54LXaVyls38B5pG2Erq0etZIZHyh1h5ZO1e/B5/4sbz7I9y66ru8XeYXmhfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016346; c=relaxed/simple;
	bh=Q/mAzAEnyUzdm+8TmcejPmSQLuet3VLkLdeBrI5eKf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uSDMmgqgJMcn/G+F1budmJgxf/IjJbNd7wUNSjzrIlRLnKBK3iGUwdC9589LQo7Ex0gyEb6RX3HNkOw45KdqMA5yDsxtZ2/DhhU2pjyeKglQbMh/9bWUBPsIqKuiO1m7ijY8XK9zMAKc4k+FwjHsiD0NKNLJG40AEQQk6XOyS1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlpYMD2e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hjWRcat0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlpYMD2e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hjWRcat0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SVDF3743739
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:05:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wllpo+Ct2E0PJkevq3rM61R6xvtSI8oIVPJOoNCBdyk=; b=BlpYMD2eAEdD3amM
	uVrb7n3swLYHkr2oSD1CFHrBa78CpTbdZviu8NHrZzAKapoYBasmUuK2H+Ykeelb
	b7tqxWY5iHwfbwM4WkXOh9Be8Zw9qGTW9VwN2R1l0e33F52tID1q079i+O4weyeR
	WbihyXu3wHm9juJcFx1KtHNICSwaNm3EPDnqy5g1ktLU/NjJFdLK30Cm9OUFsEKy
	ySvIrYdEMbMOHHBKwOY96dy/lLYQ6/8NCe0knWm/YR3e8m/WkEngy76H/Kz3U1lL
	nS4Deg4EVUQTuZq4wYUUyPZ6z3oMjpWF1UIKqBEwb7Xt9Q+GMKa3D9M0sB1/YDpp
	gMTWEw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44p2pab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:05:44 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so90715691cf.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 01:05:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784016343; x=1784621143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wllpo+Ct2E0PJkevq3rM61R6xvtSI8oIVPJOoNCBdyk=;
        b=hjWRcat0C7Gx5uZ5o08zougUkjtNrplu1OdZ/mJHkt+E/8L+xxlBXog1cyzhdT4gmy
         xE5rmb6+oy4NMRAGFHnE30AOWwSW/PlVuOpYciQHHAl4B/m44JoHQ8sfI1Kem0xDUIHL
         JYg8wxgDDmW0Ru9eAe9bvTQ/lhxjaVZjN4o2Gtmhhxte4mM7LdT/NRSFr6PAfbQdGMoA
         8m68RhD3fXwYDeHoJI9CDbNb2oyeBQ4w/GZerXCpRY+Xe7/ZxtelL4f6ekbs+DQ18bVW
         a+h7dolCN9zS5epUSQ7htdZ415tkYM6o39qYeHVPl4HgbyHQ8M99yJqGK4CG5EcnL4qQ
         jvXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016343; x=1784621143;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wllpo+Ct2E0PJkevq3rM61R6xvtSI8oIVPJOoNCBdyk=;
        b=mRke64eb4cA9QqnXIY00HtlZXU3ouUcMEQEvIU8J58TME+3SN8P5okDFhdoCgSg0v5
         EWYOukJoiP6Jz73FBjjOrc+N8Wj6cAYGHPADZ+TgC45PDgdbY/so0XMPS6pFOFMnabdx
         6Cwy3Dd6wKUFAB3d5CWiWlxUlaKpLb0NoFrw/GUBKXGIJMSwbwOjiH5SAGqJ6RiL7Lz/
         OzXcg8GZrZINApiBydtF/pO48XobyV0yVxepKHEfTxvqIo/VAydFAXYfXhFrF4ZLJGlJ
         6hpODKJrr1W4l/UxfhUJM9geKF6CcR9H3w1plLyLLex4TiU5ZxuCu2GfMRvSNJxnLVHM
         EwpQ==
X-Forwarded-Encrypted: i=1; AHgh+RokNxs2UOv97BIGenZVrSxmhzZ0HggAdpNQTx8BZqkgsyMWpjSwhD5ER2diyBvTs/y381R6e0+6Zl56Iw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjKz1GacfllY55HTBh1H9+TUkonrvNTKjD2xbZ8wYHdJ8LGa2q
	W1G90m0bjmlahDkQoRjMjonVwj1qMevjNc+WvRA4lI0Pw0syJFEs/qnVNIXacuB8hX5qGFvwF+s
	OtSg5arVJypKQL2sL0iqDKlg2l2Rf9ydfK4KhxWYMen4+MUvbU+05p0yhGyKeG4lrjBdZKYQtOQ
	==
X-Gm-Gg: AfdE7ck8P8g62k+zgrTgtgdf5OPvSG3Zr7QzEasdVuJpbj82X2WDDgfstvyq2uqhlYV
	QgPEOQjYxedatkhO0GiVYLLE9SD/XyKDkEKW+bG2BMO4d9ZNvBdz4w3rcrZbmPFpsdX0ptMWskf
	DV10azLpySdPjxR+yAJ9UGWOzzc0LhGVdkFcS32kh+dTu4KVVIUK32HbgKoH/t8iy0kaOkdK56f
	FjzVMAx6QxMCOIdHByDTBTpsG11v/98nv1PfGYAA0cozUrrPUAFqXg6QpA4wwpxWx8Z4aCfp7Ly
	Yi8OQ7onQqqpfWMdIsRR7/XCW5HbZFeWR6YENPRar99szjIXiuE4mfXtYFqSGtKl2Gb0lJIDZki
	12D5Qzm1gKEvVdAjzDChrbBqpFs3SqyPTGS5uRQ==
X-Received: by 2002:ac8:6f12:0:b0:51c:730:a587 with SMTP id d75a77b69052e-51cbf2ee752mr123336311cf.63.1784016343284;
        Tue, 14 Jul 2026 01:05:43 -0700 (PDT)
X-Received: by 2002:ac8:6f12:0:b0:51c:730:a587 with SMTP id d75a77b69052e-51cbf2ee752mr123336101cf.63.1784016342931;
        Tue, 14 Jul 2026 01:05:42 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1665727517sm53979966b.30.2026.07.14.01.05.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:05:42 -0700 (PDT)
Message-ID: <3492f6ff-84c2-4694-a677-500320cf1f5f@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:05:41 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/14] ASoC: qcom: audioreach: use C-style "/*" comment
To: Randy Dunlap <rdunlap@infradead.org>, linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>, linuxppc-dev@lists.ozlabs.org,
        Charles Keepax
 <ckeepax@opensource.cirrus.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        patches@opensource.cirrus.com, Srinivas Kandagatla <srini@kernel.org>,
        linux-arm-msm@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
References: <20260714014445.569992-1-rdunlap@infradead.org>
 <20260714014445.569992-14-rdunlap@infradead.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260714014445.569992-14-rdunlap@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX9+PfdBCIk74n
 m1tHXFOCTp1SJm62PrdRrhXUv7qd99YeVktw14f5rCC7fls6BdmmbDVnkIuEZDL4obCWNyrkmiM
 dzerF+RTNhKs916qUkEFJN1CEKilvHo=
X-Proofpoint-GUID: s33uID51CzVNaw4XE9PIlIHbZcIrxHud
X-Proofpoint-ORIG-GUID: s33uID51CzVNaw4XE9PIlIHbZcIrxHud
X-Authority-Analysis: v=2.4 cv=BZroFLt2 c=1 sm=1 tr=0 ts=6a55edd8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=7jdjDwPJLlZbICA8FagA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX6FTHvfY5L4v0
 5Ru0KHK70V8BqJ0NKqd65nGZPMr99g2BCn26pcsgUtXugRgzZQyJZD3a914/94tmixlU0bg3Ckq
 fR70T7NPJdt6HomjBSRDWrDiFV3ajDx4z1d3dgun+25/M43Krcvoep2ky5tVM25uyqV6lRMH2pB
 FprULlX6U4XX9DowrVMQv2ztHlySxZ9gjpvmo3RwTDXX07UVRGyRkfGNVEdTQo6Piu6fLKyEbxM
 NgVzp4joYqkCZlfZj2XNbpZn17ejeTO9IgnPyzUuFovV9a3MKQbL+QEoqWuwGZoPvHjOlhY+U43
 4zZ/GFlqrOTbq/HusOc1+avfsoxPZlz5G0Lp6U+HjoTv8Bl87wSwFTYVNsiHhRlEwV/b+MSjBHO
 rS4TL3LZxp64rPi3cfBKv5jLfum8tFPdesqdk3/EtleirUcK11PQLuB+2JxXcyoPWlD3RkFzJ6q
 ++JwtI3jzSQzjSSuEiw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140082



On 7/14/26 2:44 AM, Randy Dunlap wrote:
> Modify the "/**" to use "/*" instead since this is not a kernel-doc
> comment. This avoids all kernel-doc warnings in this header file:
> 
> Warning: include/uapi/sound/snd_ar_tokens.h:61 Cannot find identifier on line:
>  * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:           Sub Graph Instance Id
> Warning: ../include/uapi/sound/snd_ar_tokens.h:62 Cannot find identifier on line: *
> Warning: ../include/uapi/sound/snd_ar_tokens.h:63 Cannot find identifier on line:
>  * %AR_TKN_U32_SUB_GRAPH_PERF_MODE:             Performance mode of subgraph
> Warning: include/uapi/sound/snd_ar_tokens.h:64 This comment starts with '/**', but isn't a kernel-doc comment.
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> 
>  include/uapi/sound/snd_ar_tokens.h |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> --- linext-2026-0710.orig/include/uapi/sound/snd_ar_tokens.h
> +++ linext-2026-0710/include/uapi/sound/snd_ar_tokens.h
> @@ -58,7 +58,7 @@ enum ar_event_types {
>  #define SND_SOC_AR_TPLG_FE_BE_GRAPH_CTL_MIX	256
>  #define SND_SOC_AR_TPLG_VOL_CTL			257
>  
> -/**
> +/*
>   * %AR_TKN_U32_SUB_GRAPH_INSTANCE_ID:		Sub Graph Instance Id
>   *
>   * %AR_TKN_U32_SUB_GRAPH_PERF_MODE:		Performance mode of subgraph

