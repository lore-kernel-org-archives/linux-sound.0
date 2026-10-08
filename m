Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFED48E0FD
	for <linux-sound@vger.kernel.org>; Thu,  8 Oct 2026 11:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791460563; cv=none; b=hCll0HyfIKFtYGp0EYnwJoH+KLW/02U2B5IvMKiBnuGfHEM2N2+A6MapUvMokevD+gtfmYnQEUNyTGRETnh+rMkGiA4hY8LDiUUeer8yWb7XMBlCm2hp64A9SYeO64ylNyf9Cg5H8qJKiLw4wg/UxilsPLEfmqGOk5NBsbNX+JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791460563; c=relaxed/simple;
	bh=q9TfCN+IXqW4zgB/T08Oc6m0Lk44S9bVPXzKk4qZCp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rzQZctzMq85Q38QEJ1Lf5zIYPn5wV5Qqs82Mu1GZTFEoBKavQmCs4s1k0sJLm1sBaVakOYCjVZl/IQqqIznEBz3cEYHalyK/REGIWn2NyM7naGC7LuFM6GlF+fNxwzlpElvOnUE06UIQeVTHINAUN+x+Th2HrpwQWUkLHvqQw7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H/eOWCrP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cd9M/EEN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H/eOWCrP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cd9M/EEN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BK8Q42384044
	for <linux-sound@vger.kernel.org>; Thu, 8 Oct 2026 11:56:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=; b=H/eOWCrPhPA2EjlM
	sTpcc099xLSGzL26cEaA8v7aYEBtZwWIBBUSm3KJNeJK5sDIMS95E54FV76NB9+S
	Jkj8ZiQnjShOhOBAJEQU9eJcCzRL/bevrK2RJgRfX4utVkjD36VCr1tv5HIuZgmA
	4wGvGfAImO2jXXtHU3mA8h0rHZaoRAo64uTCC2UovW/6fY02fiJtmS05iHz5i/w7
	qjkC5tVZJN51WCsdWpwWy5ReaEnOj7xeQarRyK/npxeO7U+13H5x+U3CsRz/UToy
	fKjvntqJQvgCfNh7OnF+S1tKYRwBBxu/vTf6rqa7QeCItQ4SAi6CJtp2nfPk6vNU
	bYhohw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe3jud4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 11:56:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d9057fab9eso63440315ad.1
        for <linux-sound@vger.kernel.org>; Thu, 08 Oct 2026 04:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791460560; x=1792065360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=;
        b=Cd9M/EENE4jpMMptHsg+apfXSEn2Fy8PoMrVnVjhP9XPKK6pJoz0VkeKMyiIv/7dIs
         3Fc1h7jLRCH6lcd53BEkKLjzAtVNd+z57QBDm+8FVXgGKbCDsyCZTY0zSyIvGmN7TL8Q
         BwB2+Nj5ZDRBzOS5FGEg2V/jpO2V3kJdml7gCyYHGRPXaexpMPdmar35mOXVOdJvuK+e
         YxahS/fmXplfXTJsG9qfLyp+AULJoRNZmq76vwXOfDtIT7qX+ys4qMXStdIxaN6iTMaq
         Q2GcfOWfEdADD14cCF7mUl61gntIeYzqXLqV/FGxwHyWNATE6tcutXdJKR9A/DZLNS/S
         2CKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791460560; x=1792065360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1PuyHwZHDZR38vL137fr/hIFe3UJ7RrQbC5L38H7rbM=;
        b=IgM+xsS50xP7wLcw9sUGck9Sr3u7CN5KcaI9NQIiHAvfVDqA6E1EidsqBE2Pee0Hf8
         8h/aJEq9e1mBIBqkgSaRayjV85HsT/l7kVm3onZXVMlILuQQt3ZnyoNfud8jcsYJZZKU
         T1eyYr44vAx4+HFWJNR3e4AbM4AIl8hK6l/Ac7Uccyo0n5bmTWylGqYO5rwqrPi7PfHn
         GH1FEWcjKl3Sn+b/XJEOGh3lYitgRI0bwtpQgCEurq6E0AshGDa4S5yDprhplqU0os9Z
         nBJxXM6JzHdybvt8JwDFC7vvSiIcdjSlTN7CbzFT2bAb6/ao/PUJOXRrRu+TEaUVz4KG
         Gjmw==
X-Forwarded-Encrypted: i=1; AKwUvByzYtqPbyxIZAdgUGoa1rW/XczRMLASasGtNe//EKwxxmC23JDX4LW89VMnjaxA49p9lTdqmhPwMhZoeQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKL6KoKMmuijz07NPIGhqyU7W61kzzI8pN7+p4obWhxLtJ58vgW
	VnaHkhZS0UmRrfj5SFWjLQi5jGfu6lmTTdBqa3LKawlR972LrhayGgSp0Y73UrlZ9S905XeqafY
	+iGftR96UDU5ddOS6axVmTOT35xfrx7IDWrU6UlFq+TSE7lpvd8AC++LQgvj+a9sfJg==
X-Gm-Gg: AYBFou1gaGy6qVk0xPVK/RgDhmfztEQ9nFeBMV62ZkKg2kO3Br+bGpkQkm7tteihgNG
	2IdOGIE5qeYFAJynN/PGtGt6tUe7oCk0yp/R4rLIICECOQHDEK0EFJkYAdIiXuwcag9hK0B3Eft
	U74ZJd9p9Vl8JvRvHL7u1fCYLMVIPtJPxM2ArPCtz3eDbTf1yR7wCMviMrREWsq/mifm5bYY5cL
	i18o8H4xMVik2SRKDJrDha34/ymeN/qbGeDv88udg7nlZpjfwent14uTfFnqlPmxAAnLWU/M0AR
	lv+B6hH1sfargun271nk8j9Fu39utPstNG1u93HfaDIo8AyT1r1QBtPXN0P4547V89diQNjrD2k
	8hyisdMfwxGSxgILwZq5il4c0zlc=
X-Received: by 2002:a17:903:acc:b0:2df:9a29:aeb2 with SMTP id d9443c01a7336-2e5ffa16178mr43802735ad.3.1791460558587;
        Thu, 08 Oct 2026 04:55:58 -0700 (PDT)
X-Received: by 2002:a17:903:acc:b0:2df:9a29:aeb2 with SMTP id d9443c01a7336-2e5ffa16178mr43802505ad.3.1791460558080;
        Thu, 08 Oct 2026 04:55:58 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e606da8fc6sm22731375ad.58.2026.10.08.04.55.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:55:57 -0700 (PDT)
Message-ID: <87bc700a-0b67-4791-9065-b4fa4ba9b53b@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 17:25:50 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/14] ASoC: mediatek: mt8195: Fix ETDM startup error
 handling
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        cassiogabrielcontato@gmail.com,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Liviu Dudau <liviu.dudau@arm.com>, Haotian Zhang <vulab@iscas.ac.cn>,
        HariKrishna Sagala <hariconscious@gmail.com>,
        linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261005110257.50145-1-phucduc.bui@gmail.com>
 <20261005110257.50145-12-phucduc.bui@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261005110257.50145-12-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX6aa9PZf+2/6Y
 3oV96AynyudMXWsqL58uNdeMA54o6CvtbEddb2aYQVLzhJTTcvXlL5WBQ2lR4lb/cWdVjtTPK9k
 gzkby4A+EIQuemgchePUR5ss+hePbPg=
X-Proofpoint-ORIG-GUID: ZIEFisWNJd1NZX8YlJ4FxZLk4H7rkkIY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NyBTYWx0ZWRfX9c7AWWI9TNhE
 blHCXvGxCHIlx4QGkM+n74t6OPWg5qEcp59j8ig456htasq3AfjWHLHmvtpa8YfB5IvQoWbYDi2
 yT74ML85iDfhlgETDjjpE5bIUUmiHp2pYoHjGZfDWIgm2lCXYzFASRu33F4O90pX6R2D+yMZSy9
 alq5Y4PQRlw2gEPapBoTS4aBwz2TZlvqaTd8w0bScQ4VO6u0hpEHfbNe7NWc8cKfl0OBBWXI2vH
 rbpAsc97DARx2fyj/Q2lB1uD4l4MmtMJ5H0npMg8MVIQ4dr0VXS2HZtROkVPbhEuVWpbDmPvSqv
 wzOCJTl+dKc7tPlH6oU7vWav2YNcqA+kInuZ+/vHGxI9KyMGLBQpr88l4dSNlPpxgtyXYQIiPPZ
 iys70qiHksIiMyoHoqRTS/VCvi7T3tj7sHKlUDVm2aWhlUP1ZtuE8B/dlRqCmgxaB7bqHozBsdb
 sV62Gs6nI8eVe23sooQ==
X-Authority-Analysis: v=2.4 cv=IIuXmQvG c=1 sm=1 tr=0 ts=6ac784d0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=KMfNbJP5VoSB66bTmycA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ZIEFisWNJd1NZX8YlJ4FxZLk4H7rkkIY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080047



On 10/5/2026 4:32 PM, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Check and propagate errors when enabling the ETDM MCLK and clock
> gates during startup.
> 
> If enabling a clock fails, disable the clocks that were already
> enabled to keep the clock state balanced.
> 
> Fixes: 1de9a54acafb ("ASoC: mediatek: mt8195: support etdm in platform driver")
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---
>   sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 50 ++++++++++++++++-----
>   1 file changed, 40 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> index fba51c552eec..1270fcac6b3f 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
> @@ -1575,36 +1575,66 @@ static int mtk_dai_etdm_startup(struct snd_pcm_substream *substream,
>   	int cg_id;
>   	int mst_dai_id;
>   	int slv_dai_id;
> -	int i;
> +	int i, ret;
>   
>   	if (is_cowork_mode(dai)) {
>   		mst_dai_id = get_etdm_cowork_master_id(dai);
>   		if (!mt8195_afe_etdm_is_valid(mst_dai_id))
>   			return -EINVAL;
>   
> -		mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
> +		ret = mtk_dai_etdm_enable_mclk(afe, mst_dai_id);
> +		if (ret)
> +			return ret;
>   		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
> -		if (cg_id >= 0)
> -			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +		if (cg_id >= 0) {
> +			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +			if (ret)
> +				goto err_disable_mclk;
> +		}
>   
>   		mst_etdm_data = afe_priv->dai_priv[mst_dai_id];
>   
>   		for (i = 0; i < mst_etdm_data->cowork_slv_count; i++) {
>   			slv_dai_id = mst_etdm_data->cowork_slv_id[i];
>   			cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
> -			if (cg_id >= 0)
> -				mt8195_afe_enable_clk(afe,
> -						      afe_priv->clk[cg_id]);
> +			if (cg_id >= 0) {
> +				ret = mt8195_afe_enable_clk(afe,
> +							    afe_priv->clk[cg_id]);
> +				if (ret)
> +					goto err_disable_slv_clk;
> +			}
>   		}
>   	} else {
> -		mtk_dai_etdm_enable_mclk(afe, dai->id);
> +		ret = mtk_dai_etdm_enable_mclk(afe, dai->id);
> +		if (ret)
> +			return ret;
>   
>   		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(dai->id);
> -		if (cg_id >= 0)
> -			mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +		if (cg_id >= 0) {
> +			ret = mt8195_afe_enable_clk(afe, afe_priv->clk[cg_id]);
> +			if (ret)
> +				goto err_disable_mclk;
> +		}
>   	}
>   
>   	return 0;
> +
> +err_disable_slv_clk:
> +	while (--i >= 0) {
> +		slv_dai_id = mst_etdm_data->cowork_slv_id[i];
> +		cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(slv_dai_id);
> +		if (cg_id >= 0)
> +			mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
> +	}
> +
> +	cg_id = mtk_dai_etdm_get_cg_id_by_dai_id(mst_dai_id);
> +	if (cg_id >= 0)
> +		mt8195_afe_disable_clk(afe, afe_priv->clk[cg_id]);
> +
> +err_disable_mclk:
> +	mtk_dai_etdm_disable_mclk(afe, is_cowork_mode(dai) ? mst_dai_id : dai->id);
> +
> +	return ret;
>   }
>   
>   static void mtk_dai_etdm_shutdown(struct snd_pcm_substream *substream,

