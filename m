Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115B43ACF00
	for <linux-sound@vger.kernel.org>; Sun,  2 Aug 2026 12:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785675593; cv=none; b=QGOn554ubuQ7701JldnKGz2XwFGPxabLddm2IsZQkx5HFHk0si/kxr3cGlasfsn+MOsfUPHON9YZuG/6Y/1bgmEXUxuxEHpW+h9KVVBLV5/NDYmnkh+W7RwWeEB8nRXJ61tJUgfa/kS4rba8Hl7/c4A75VEme6TvK3Yzjk7bktk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785675593; c=relaxed/simple;
	bh=CuHn7/L5PxQBgKCfM8JI+iAkb7ick2kdtdjaBpuvX5E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VBEt098T6BXtR043sq5TiyVf2ctYxdCXF2uvY5tIGRSLrNeMuyd8UtL3vg/ZwLB63qyjIGsXHUa/Khzv+8R7zewc/hBDHpjwqd5GXhbqOGf3gy6vMciGKFUGNCXksaNnDT+PIbPOgyFA+yB8SQ7Azo5pzq5Ph0lRVdazHg14ym8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dye5TSd8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XlMSjwie; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dye5TSd8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XlMSjwie"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6gwW1809997
	for <linux-sound@vger.kernel.org>; Sun, 2 Aug 2026 12:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9r8P1XJxuBKrbqEhJM+3LohexrcDf1LAH9J3AH9/QJs=; b=Dye5TSd8BqInoXiM
	hgEGKTCY1kfLz/quipUEyrcMqScFQlJg7RCxvyhQ8U/Y8GgX41RWLCgNg1uTee7X
	ridErwmxtPC7eV+s698tFKbEincGa4AACUpCNILPAaWa4b8hXiwx7uKLPgaJsEEl
	zkWIkLgj1QmOH7naWAMUOoTd+uU3LlSsLVDYKPCSGBvDM8ChBvavg6LO1SsSGqCd
	lnEIPPOdKhLGDFp4pqEkICklCdREk1giHJthRAP8uKFv+2iRl94rCavdJgXwakcU
	pOmttEb4wU5nzh08SRaUtup5ovVq/98JaGf2J0SjsP9C6DfiVercRnMWoz9nY/GM
	HI0W4Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q52vma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 12:59:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so24467041cf.0
        for <linux-sound@vger.kernel.org>; Sun, 02 Aug 2026 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785675589; x=1786280389; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9r8P1XJxuBKrbqEhJM+3LohexrcDf1LAH9J3AH9/QJs=;
        b=XlMSjwiemb//qWdY9EOfbr0CDSPnYLXL+na5k/VQmbInoV95J1IZpp8e1ezJQEfXLK
         9ZlAYgqVe4N9Qbh2vJj3w4wiQYw6k1LvZuLt8Ps1OOZ0UVnVw/gaquyHKa7B8zIKGRFp
         KIO7MwBfHs5Ko13I8qyaCdBOWVPbNOZj/E9C+G18DTcKbuXVjppkxUhNBDR3chKbUKOl
         1sfeT7ZmXaDCQ1C9rsp0+Z7rq+Eydd+UGTpEZfw7UioWowSGGlLefnOQG+nNpEV3py5l
         IhIOe7HWzY5fai4tT02tCkIwthYp3jkE5IXzgy+uzC52HTsQA7ZegoOVsEeHuGiDRrQl
         Stqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785675589; x=1786280389;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9r8P1XJxuBKrbqEhJM+3LohexrcDf1LAH9J3AH9/QJs=;
        b=QIdkot9SvDOVFXyOi8uJv4RraJN5PFBCuBzPnNE2sn9q7f0OiW+r61TpYJt+Q/dEzb
         rZvDb6hyOtqpXKB4JlXEUtPUPKIMGNis+i8A757M+wL4eIFaiyC10GXblmgqblOoVmlm
         ukT2bQIHXPaaVkGyJAQm6B0eh3TfIjJRxVQ22B4MAZFrYsD/ZlRiTTBBg19vHVemwutW
         LKLafI0L8jfHrgHwkW8bHaFfiKt4F/in8sI7IwJqBLFATJ3pqr3h778qEvbeKw/qeUeH
         pAELxZqtJaEKrVIqUAG7ruLniclfeo3Udj3qP6tW+MCKf4MY1zw8KkLTwsdP+l5CbaAd
         CNMw==
X-Forwarded-Encrypted: i=1; AHgh+RrvAelSR1KtBPUPLEzTyI1Uh56EBCjIXNZyfSWm2FVxKDf29j+N9WvG+k4nRQ06bwP+bbxmvx+8YdcAuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Dm3awxgiCo2kOcF+lkZaSgbK2dgxQwWlz2Vlv3K9t4AHMWPU
	0lCiT3Oppo4GsiUh/shglUR6AVdOfoxheXXeANk3RY6TSXDdh2RjsBhb8HjC5Vt3dYPU7htA/+e
	rjaQQGEbUoP6SXDCey3dUAYcWSaSa6tcjPO3SNMWXi5F0AeW2ReoUylV0PPU80XlF3Q==
X-Gm-Gg: AR+sD12GgDYGkPI/PlF5p2n1JmHK08TFrpi+nez7CHdX6UIzfr65KGDFn2zxuY9UVU6
	tGELV7tGBICxiwJE8JEASJJ/VP37z3PYmI59oAt1FqSMy9mN9En/CiJaQQFuZcFH3Q5/Wl+e6Qc
	61x+N81JJeVi+/HaSQ9k8JE+WMR/MLrU9+ZvCi/gUgKR/t0klDWHKa5GOaYO6b1ZNjyY1ALlrTH
	2fP+JY1h8hvpu4PMwDsWjGjlYHAq+5jJTf3d+h/ZLf6P9PSyHjMUqtFg44v/IcQvDto21/Bss4j
	BoeQnG6MrDFae1unLZQ775wxx3RFvj9+1mTk+QK4wEDOraLsDEJ5R23ZwUlWgV39ZXzdteJu0eC
	3UyG/QK3JeYkNUDp4QFGbo7ZBa5M=
X-Received: by 2002:a05:622a:83:b0:51a:89db:95a4 with SMTP id d75a77b69052e-52b56673d6cmr106177441cf.6.1785675589001;
        Sun, 02 Aug 2026 05:59:49 -0700 (PDT)
X-Received: by 2002:a05:622a:83:b0:51a:89db:95a4 with SMTP id d75a77b69052e-52b56673d6cmr106177221cf.6.1785675588370;
        Sun, 02 Aug 2026 05:59:48 -0700 (PDT)
Received: from [192.168.68.104] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd45a0d7csm21053048f8f.35.2026.08.02.05.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 05:59:47 -0700 (PDT)
Message-ID: <ce580ddc-6bd0-4e34-b399-ef2919e6bf6a@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 13:59:46 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/7] ASoC: qcom: qdsp6: add topology-driven Audio IF
 support
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
 <20260801054610.4047089-2-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260801054610.4047089-2-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDExNCBTYWx0ZWRfX6p4S2AtxhCEU
 LR4/UEI/Lgys6AEdCDXEg8kW2bsOsnutwed3zyAdDTn8QfjfJhGbdjTjYt7VUs4bpTQbE1citU/
 PJxFHfIiDOrPFlWehpwa59E8qjhuqn4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDExNCBTYWx0ZWRfX6Kf9qxIZmRw+
 Bz+77NMgOJxQAySr4DmGxS6sUkmQqg2H3Y5qPEUa3zhlbJWEeRYsoaTOV+YcDrbtipVJrhWfqa6
 PqkAGwb4Jb79vxyU3mg+/vWHGKTwAh06JIjFx6DSX76gM8miGV1xHebIwe184zYA3/C2L3JbFmM
 LMWm21hkaWnnw+8bOG6gekSMoqTZLK5xlu99SJGv+5sOgGexDFTs9DHCzF49f2nM2EWo2nztGaL
 FBep3huSNE5mUg2J+g0atXmo0vnp3+QAAXb1zW9EI52mNVvCRmGBaFMbzyayuQWSMuSy0gHEFj4
 FIfs2asPNT2t1cgIe04S0jBuP7JiiUvKt6WPH6/6TLn/JfbqqROA/owM2lw5HVtR+a3XsgcAEf5
 XupcIklNt1CF9jvBsXVSzxe3NTOd9IFjQKgVY3GwL8U7XF3sA5dxJAAOPqra7Ys1u8hQsicesUy
 uOYNEwR0rZBWI6R6SRw==
X-Proofpoint-GUID: sXVYEHQSBClfhO1mn1bsymWAFfnBMAnf
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6f3f45 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Otyo-Ubl5fyQZixybWkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: sXVYEHQSBClfhO1mn1bsymWAFfnBMAnf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020114

On 8/1/26 6:46 AM, Prasad Kumpatla wrote:
> Add topology parsing and media-format programming for Audio IF source and
> sink modules.
> 
> Add the Audio IF module IDs, the required topology tokens, and a dedicated
> topology loader that stores the parsed interface configuration in the
> AudioReach module state. Also add the Audio IF media-format path that
> sends the interface configuration, hardware endpoint media format, and
> frame-duration parameters for Audio IF modules.
> 
> This keeps the serial-interface configuration topology-driven while still
> allowing the machine driver to provide runtime slot and media format
> settings. The same Audio IF path can then be reused for TDM, PCM, and I2S
> style backends.
> 
> The new UAPI tokens (AR_TKN_U16_MODULE_SYNC_SRC=262 through
> AR_TKN_U8_MODULE_INV_EXT_BIT_CLK=276) are added, together with the value
> defines used by the sync source, sync mode, data delay, interface mode,
> bit clock type, and polarity tokens.
> 
> MODULE_ID_AUDIO_IF_SINK (0x0700117C) and MODULE_ID_AUDIO_IF_SOURCE
> (0x0700117D) are introduced in this patch.
> 
> This Module is validated on Hawi and Shikra platforms.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---

Small nits below.

>  include/uapi/sound/snd_ar_tokens.h |  89 ++++++++++++++++++++++++
>  sound/soc/qcom/qdsp6/audioreach.c  |  93 +++++++++++++++++++++++++
>  sound/soc/qcom/qdsp6/audioreach.h  |  84 +++++++++++++++++++++++
>  sound/soc/qcom/qdsp6/topology.c    | 105 +++++++++++++++++++++++++++++
>  4 files changed, 371 insertions(+)
> 
> diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
> index 6b8102eaa121..bda65311cfa9 100644
> --- a/include/uapi/sound/snd_ar_tokens.h
> +++ b/include/uapi/sound/snd_ar_tokens.h
> @@ -168,6 +168,58 @@ enum ar_event_types {
>   *						LOG_WAIT = 0,
>   *						LOG_IMMEDIATELY = 1
>   *
> + * %AR_TKN_U16_MODULE_SYNC_SRC:			Frame sync source
> + *						AR_AUDIO_IF_SYNC_SRC_EXTERNAL = 0,
> + *						AR_AUDIO_IF_SYNC_SRC_INTERNAL = 1
> + *
> + * %AR_TKN_U16_MODULE_CTRL_DATA_OUT_ENABLE:	Enable data-out tri-state control
> + *						AR_AUDIO_IF_CTRL_DATA_OE_DISABLE = 0,
> + *						AR_AUDIO_IF_CTRL_DATA_OE_ENABLE = 1
> + *
> + * %AR_TKN_U32_MODULE_SLOT_MASK:			Active TDM slot bitmask
> + *
> + * %AR_TKN_U16_MODULE_NSLOTS_PER_FRAME:		Number of slots per TDM frame
> + *
> + * %AR_TKN_U16_MODULE_SLOT_WIDTH:		Slot width in bits (16 or 32)
> + *
> + * %AR_TKN_U16_MODULE_SYNC_MODE:			Frame sync mode
> + *						AR_AUDIO_IF_FRAME_SYNC_MODE_SHORT = 0,
> + *						AR_AUDIO_IF_FRAME_SYNC_MODE_ONE_SLOT = 1,
> + *						AR_AUDIO_IF_FRAME_SYNC_MODE_LONG = 2
> + *
> + * %AR_TKN_U16_MODULE_CTRL_INVERT_SYNC_PULSE:	Invert frame sync pulse polarity
> + *						AR_AUDIO_IF_SYNC_NORMAL = 0,
> + *						AR_AUDIO_IF_SYNC_INVERTED = 1
> + *
> + * %AR_TKN_U16_MODULE_CTRL_SYNC_DATA_DELAY:	Data delay relative to frame sync
> + *						AR_AUDIO_IF_DATA_DELAY_NONE = 0,
> + *						AR_AUDIO_IF_DATA_DELAY_1_CYCLE = 1,
> + *						AR_AUDIO_IF_DATA_DELAY_2_CYCLE = 2
> + *
> + * %AR_TKN_U16_MODULE_INTF_MODE:			Audio IF interface mode
> + *						AR_AUDIO_IF_INTF_MODE_TDM = 0,
> + *						AR_AUDIO_IF_INTF_MODE_PCM = 1,
> + *						AR_AUDIO_IF_INTF_MODE_I2S = 2
> + *
> + * %AR_TKN_U16_MODULE_QAIF_TYPE:			QAIF hardware port type index

What are the supported types for this?

> + *
> + * %AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:		Active lane bitmask for multi-lane
> + *
> + * %AR_TKN_U32_MODULE_FRAME_SYNC_RATE:		Frame sync rate in Hz
> + *
> + * %AR_TKN_U16_MODULE_BIT_CLK_TYPE:		Bit clock type
> + *						AR_AUDIO_IF_BIT_CLK_INTERNAL = 0,
> + *						AR_AUDIO_IF_BIT_CLK_EXTERNAL = 1,
> + *						AR_AUDIO_IF_BIT_CLK_SKIP = 2
> + *
> + * %AR_TKN_U8_MODULE_INV_INT_BIT_CLK:		Invert internal bit clock
> + *						AR_AUDIO_IF_CLK_NORMAL = 0,
> + *						AR_AUDIO_IF_CLK_INVERTED = 1
> + *
> + * %AR_TKN_U8_MODULE_INV_EXT_BIT_CLK:		Invert external bit clock
> + *						AR_AUDIO_IF_CLK_NORMAL = 0,
> + *						AR_AUDIO_IF_CLK_INVERTED = 1
> + *
>   * %AR_TKN_DAI_INDEX:				dai index
>   *
>   */
> @@ -240,6 +292,43 @@ enum ar_event_types {
>  #define AR_TKN_U32_MODULE_LOG_TAP_POINT_ID	260
>  #define AR_TKN_U32_MODULE_LOG_MODE		261
>  
> +#define AR_TKN_U16_MODULE_SYNC_SRC		262
> +#define AR_TKN_U16_MODULE_CTRL_DATA_OUT_ENABLE	263
> +#define AR_TKN_U32_MODULE_SLOT_MASK		264
> +#define AR_TKN_U16_MODULE_NSLOTS_PER_FRAME	265
> +#define AR_TKN_U16_MODULE_SLOT_WIDTH		266
> +#define AR_TKN_U16_MODULE_SYNC_MODE		267
> +#define AR_TKN_U16_MODULE_CTRL_INVERT_SYNC_PULSE	268
> +#define AR_TKN_U16_MODULE_CTRL_SYNC_DATA_DELAY	269
> +#define AR_TKN_U16_MODULE_INTF_MODE		270
> +#define AR_TKN_U16_MODULE_QAIF_TYPE		271
> +#define AR_TKN_U32_MODULE_ACTIVE_LANE_MASK	272
> +#define AR_TKN_U32_MODULE_FRAME_SYNC_RATE	273
> +#define AR_TKN_U16_MODULE_BIT_CLK_TYPE		274
> +#define AR_TKN_U8_MODULE_INV_INT_BIT_CLK	275
> +#define AR_TKN_U8_MODULE_INV_EXT_BIT_CLK	276
> +
> +#define AR_AUDIO_IF_SYNC_SRC_EXTERNAL		0
> +#define AR_AUDIO_IF_SYNC_SRC_INTERNAL		1
> +#define AR_AUDIO_IF_CTRL_DATA_OE_DISABLE	0
> +#define AR_AUDIO_IF_CTRL_DATA_OE_ENABLE		1
> +#define AR_AUDIO_IF_INTF_MODE_TDM		0
> +#define AR_AUDIO_IF_INTF_MODE_PCM		1
> +#define AR_AUDIO_IF_INTF_MODE_I2S		2
> +#define AR_AUDIO_IF_FRAME_SYNC_MODE_SHORT	0
> +#define AR_AUDIO_IF_FRAME_SYNC_MODE_ONE_SLOT	1
> +#define AR_AUDIO_IF_FRAME_SYNC_MODE_LONG	2
> +#define AR_AUDIO_IF_SYNC_NORMAL			0
> +#define AR_AUDIO_IF_SYNC_INVERTED		1
> +#define AR_AUDIO_IF_DATA_DELAY_NONE		0
> +#define AR_AUDIO_IF_DATA_DELAY_1_CYCLE		1
> +#define AR_AUDIO_IF_DATA_DELAY_2_CYCLE		2
> +#define AR_AUDIO_IF_BIT_CLK_INTERNAL		0
> +#define AR_AUDIO_IF_BIT_CLK_EXTERNAL		1
> +#define AR_AUDIO_IF_BIT_CLK_SKIP		2
> +#define AR_AUDIO_IF_CLK_NORMAL			0
> +#define AR_AUDIO_IF_CLK_INVERTED		1
> +
>  #define SND_SOC_AR_TPLG_MODULE_CFG_TYPE 0x01001006
>  struct audioreach_module_priv_data {
>  	__le32 size;	/* size in bytes of the array, including all elements */
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index e6e9eb2e85aa..6a11f2932ba5 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -152,6 +152,13 @@ struct apm_i2s_module_intf_cfg {
>  
>  #define APM_I2S_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_i2s_module_intf_cfg), 8)
>  
> +struct apm_audio_if_module_intf_cfg {
> +	struct apm_module_param_data param_data;
> +	struct param_id_audio_if_intf_cfg cfg;
> +} __packed;
> +
> +#define APM_AUDIO_IF_INTF_CFG_PSIZE ALIGN(sizeof(struct apm_audio_if_module_intf_cfg), 8)
> +
>  struct apm_module_hw_ep_mf_cfg {
>  	struct apm_module_param_data param_data;
>  	struct param_id_hw_ep_mf mf;
> @@ -168,6 +175,13 @@ struct apm_module_frame_size_factor_cfg {
>  
>  #define APM_FS_CFG_PSIZE ALIGN(sizeof(struct apm_module_frame_size_factor_cfg), 8)
>  
> +struct apm_module_hw_ep_frame_duration_cfg {
> +	struct apm_module_param_data param_data;
> +	struct param_id_hw_ep_frame_duration frame_duration;
> +} __packed;
> +
> +#define APM_HW_EP_FRAME_DURATION_PSIZE ALIGN(sizeof(struct apm_module_hw_ep_frame_duration_cfg), 8)
> +
>  struct apm_module_hw_ep_power_mode_cfg {
>  	struct apm_module_param_data param_data;
>  	struct param_id_hw_ep_power_mode_cfg power_mode;
> @@ -1042,6 +1056,81 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
>  	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
>  }
>  
> +static int audioreach_audio_if_set_media_format(struct q6apm_graph *graph,
> +						const struct audioreach_module *module,
> +						const struct audioreach_module_config *cfg)
> +{
> +	struct apm_module_hw_ep_frame_duration_cfg *fd_cfg;
> +	struct apm_module_param_data *param_data;
> +	struct apm_audio_if_module_intf_cfg *intf_cfg;
> +	struct apm_module_hw_ep_mf_cfg *hw_cfg;
> +	int ic_sz = APM_AUDIO_IF_INTF_CFG_PSIZE;
> +	int ep_sz = APM_HW_EP_CFG_PSIZE;
> +	int fd_sz = APM_HW_EP_FRAME_DURATION_PSIZE;
> +	int size = ic_sz + ep_sz + fd_sz;
> +	u32 slot_mask = cfg->slot_mask ? cfg->slot_mask : module->slot_mask;
> +	u16 nslots_per_frame = cfg->nslots_per_frame ?
> +				 (u16)cfg->nslots_per_frame : module->nslots_per_frame;
> +	u16 slot_width = cfg->slot_width ? (u16)cfg->slot_width : module->slot_width;
> +	void *p;
> +
> +	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
> +	if (IS_ERR(pkt))
> +		return PTR_ERR(pkt);
> +
> +	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
> +	intf_cfg = p;
> +
> +	param_data = &intf_cfg->param_data;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_AUDIO_IF_INTF_CFG;
> +	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
> +	intf_cfg->cfg.qaif_type = module->qaif_type;
> +	intf_cfg->cfg.intf_idx = (u16)module->hw_interface_idx;
> +	intf_cfg->cfg.intf_mode = module->intf_mode;
> +	intf_cfg->cfg.ctrl_data_out_enable = module->ctrl_data_out_enable;
> +	intf_cfg->cfg.active_slot_mask = slot_mask;
> +	intf_cfg->cfg.nslots_per_frame = nslots_per_frame;
> +	intf_cfg->cfg.slot_width = slot_width;
> +	intf_cfg->cfg.active_lane_mask = module->active_lane_mask;
> +	intf_cfg->cfg.frame_sync_rate = module->frame_sync_rate;
> +	intf_cfg->cfg.frame_sync_src = module->sync_src;
> +	intf_cfg->cfg.frame_sync_mode = module->sync_mode;
> +	intf_cfg->cfg.invert_frame_sync_pulse = module->ctrl_invert_sync_pulse;
> +	intf_cfg->cfg.frame_sync_data_delay = module->ctrl_sync_data_delay;
> +	intf_cfg->cfg.bit_clk_type = module->bit_clk_type;
> +	intf_cfg->cfg.inv_int_bit_clk = module->inv_int_bit_clk;
> +	intf_cfg->cfg.inv_ext_bit_clk = module->inv_ext_bit_clk;
> +
> +	p += ic_sz;
> +	hw_cfg = p;
> +	param_data = &hw_cfg->param_data;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_HW_EP_MF_CFG;
> +	param_data->param_size = ep_sz - APM_MODULE_PARAM_DATA_SIZE;
> +
> +	hw_cfg->mf.sample_rate = cfg->sample_rate;
> +	hw_cfg->mf.bit_width = cfg->bit_width;
> +	hw_cfg->mf.num_channels = cfg->num_channels;
> +	hw_cfg->mf.data_format = module->data_format;
> +
> +	p += ep_sz;
> +	fd_cfg = p;
> +	param_data = &fd_cfg->param_data;
> +	param_data->module_instance_id = module->instance_id;
> +	param_data->error_code = 0;
> +	param_data->param_id = PARAM_ID_HW_EP_FRAME_DURATION;
> +	param_data->param_size = fd_sz - APM_MODULE_PARAM_DATA_SIZE;
> +	fd_cfg->frame_duration.frame_duration_in_us = AUDIO_IF_FRAME_DURATION_US;
> +	fd_cfg->frame_duration.allow_frame_duration_normalization = AUDIO_IF_FRAME_DURATION_NORMALIZATION_ENABLE;
> +	fd_cfg->frame_duration.min_normalized_frame_dur_us = AUDIO_IF_FRAME_DURATION_MIN_US;
> +	fd_cfg->frame_duration.max_normalized_frame_dur_us = AUDIO_IF_FRAME_DURATION_MAX_US;
> +
> +	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
> +}
> +
>  static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
>  					       const struct audioreach_module *module)
>  {
> @@ -1411,6 +1500,10 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
>  		if (!rc)
>  			rc = audioreach_module_enable(graph, module, true);
>  		break;
> +	case MODULE_ID_AUDIO_IF_SOURCE:
> +	case MODULE_ID_AUDIO_IF_SINK:
> +		rc = audioreach_audio_if_set_media_format(graph, module, cfg);
> +		break;
>  
>  	default:
>  		rc = 0;
> diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
> index 62a2fd79bbcb..924e85f4fdf6 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.h
> +++ b/sound/soc/qcom/qdsp6/audioreach.h
> @@ -36,6 +36,8 @@ struct q6apm_graph;
>  #define MODULE_ID_SPEAKER_PROTECTION	0x070010E2
>  #define MODULE_ID_SPEAKER_PROTECTION_VI	0x070010E3
>  #define MODULE_ID_OPUS_DEC		0x07001174
> +#define MODULE_ID_AUDIO_IF_SINK		0x0700117C
> +#define MODULE_ID_AUDIO_IF_SOURCE	0x0700117D
>  
>  #define APM_CMD_GET_SPF_STATE		0x01001021
>  #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
> @@ -544,6 +546,68 @@ struct param_id_i2s_intf_cfg {
>  #define PORT_ID_I2S_OUPUT		1
>  #define I2S_STACK_SIZE			2048
>  
> +#define PARAM_ID_AUDIO_IF_INTF_CFG	0x08001B11
> +
> +#define AUDIO_IF_INTF_MODE_TDM		AR_AUDIO_IF_INTF_MODE_TDM
> +#define AUDIO_IF_INTF_MODE_PCM		AR_AUDIO_IF_INTF_MODE_PCM
> +#define AUDIO_IF_INTF_MODE_I2S		AR_AUDIO_IF_INTF_MODE_I2S
Dead code.


> +
> +/*
> + * struct param_id_audio_if_intf_cfg - Audio interface configuration
> + * @qaif_type: Audio interface type (e.g. QAIF, QAIF_VA)
> + * @intf_idx: Interface instance index
> + * @intf_mode: Interface operating mode (TDM/PCM/I2S)
> + * @ctrl_data_out_enable: Enable sharing of data-out signal with other masters
> + * @active_slot_mask: Bitmask indicating active slots
> + * @nslots_per_frame: Number of slots per audio frame
> + * @slot_width: Width of each slot in bits
> + * @active_lane_mask: Bitmask of active data lanes
> + * @frame_sync_rate: Frame sync rate in Hz
> + * @frame_sync_src: Frame sync source selection
> + * @frame_sync_mode: Frame sync mode configuration
> + * @invert_frame_sync_pulse: Invert frame sync polarity when set
> + * @frame_sync_data_delay: Data delay from frame sync in bit clocks
> + * @bit_clk_type: Bit clock type (internal / external)
> + * @inv_int_bit_clk: Invert internal bit clock when set
> + * @inv_ext_bit_clk: Invert external bit clock when set
> + *
> + * This structure defines configuration parameters for the Qualcomm
> + * Audio Interface (QAIF) block. It is used to program interface
> + * characteristics such as slot configuration, clocking and frame
> + * synchronization behaviour.
> + */
> +struct param_id_audio_if_intf_cfg {
> +	uint16_t qaif_type;
> +	uint16_t intf_idx;
> +	uint16_t intf_mode;
> +	uint16_t ctrl_data_out_enable;
> +	uint32_t active_slot_mask;
> +	uint16_t nslots_per_frame;
> +	uint16_t slot_width;
> +	uint32_t active_lane_mask;
> +	uint32_t frame_sync_rate;
> +	uint16_t frame_sync_src;
> +	uint16_t frame_sync_mode;
> +	uint16_t invert_frame_sync_pulse;
> +	uint16_t frame_sync_data_delay;
> +	uint16_t bit_clk_type;
> +	uint8_t inv_int_bit_clk;
> +	uint8_t inv_ext_bit_clk;
> +} __packed;
> +
> +#define PARAM_ID_HW_EP_FRAME_DURATION	0x08001B2F
> +#define AUDIO_IF_FRAME_DURATION_US			1000
> +#define AUDIO_IF_FRAME_DURATION_NORMALIZATION_ENABLE	1
> +#define AUDIO_IF_FRAME_DURATION_MIN_US			1
> +#define AUDIO_IF_FRAME_DURATION_MAX_US			100000
> +
> +struct param_id_hw_ep_frame_duration {
Any reason why no kernel doc for this?

> +	uint32_t frame_duration_in_us;
> +	uint32_t allow_frame_duration_normalization;
> +	uint32_t min_normalized_frame_dur_us;
> +	uint32_t max_normalized_frame_dur_us;
> +} __packed;
> +
>  #define PARAM_ID_DISPLAY_PORT_INTF_CFG		0x08001154
>  
>  struct param_id_display_port_intf_cfg {
> @@ -877,6 +941,23 @@ struct audioreach_module {
>  	uint32_t data_format;
>  	uint32_t hw_interface_type;
>  
> +	/* Audio IF module (TDM/PCM/I2S) */
> +	u32 slot_mask;
> +	u32 active_lane_mask;
> +	u32 frame_sync_rate;
> +	u16 qaif_type;
> +	u16 sync_src;
> +	u16 ctrl_data_out_enable;
> +	u16 nslots_per_frame;
> +	u16 slot_width;
> +	u16 intf_mode;
> +	u16 sync_mode;
> +	u16 ctrl_invert_sync_pulse;
> +	u16 ctrl_sync_data_delay;
> +	u16 bit_clk_type;
> +	u8 inv_int_bit_clk;
> +	u8 inv_ext_bit_clk;
> +
>  	/* PCM module specific */
>  	uint32_t interleave_type;
>  
> @@ -907,6 +988,9 @@ struct audioreach_module_config {
>  	u32	channel_allocation;
>  	u32	sd_line_mask;
>  	int	fmt;
> +	u32	slot_mask;
> +	u16	nslots_per_frame;
> +	u16	slot_width;
>  	struct snd_codec codec;
>  	u8 channel_map[AR_PCM_MAX_NUM_CHANNEL];
>  };
> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
> index 1f69fba6de26..3dd0a5c29a6e 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -753,6 +753,105 @@ static int audioreach_widget_i2s_module_load(struct audioreach_module *mod,
>  	return 0;
>  }
>  
> +static int audioreach_widget_audio_if_module_load(struct audioreach_module *mod,
> +						  const struct snd_soc_tplg_vendor_array *mod_array)
> +{
> +	const struct snd_soc_tplg_vendor_value_elem *mod_elem;
> +	int tkn_count = 0;
> +	u32 val;
> +
> +	mod_elem = mod_array->value;
> +
> +	while (tkn_count < le32_to_cpu(mod_array->num_elems)) {
> +		val = le32_to_cpu(mod_elem->value);
> +		switch (le32_to_cpu(mod_elem->token)) {
> +		case AR_TKN_U32_MODULE_HW_IF_IDX:
> +			if (val > U16_MAX)
this check is inconsistent with supported range.


> +				return -EINVAL;
> +			mod->hw_interface_idx = val;
> +			break;
> +		case AR_TKN_U32_MODULE_FMT_DATA:
> +			mod->data_format = val;
> +			break;
> +		case AR_TKN_U16_MODULE_SYNC_SRC:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->sync_src = (u16)val;
> +			break;
> +		case AR_TKN_U16_MODULE_CTRL_DATA_OUT_ENABLE:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->ctrl_data_out_enable = (u16)val;
> +			break;
> +		case AR_TKN_U32_MODULE_SLOT_MASK:
> +			mod->slot_mask = val;
> +			break;
> +		case AR_TKN_U16_MODULE_NSLOTS_PER_FRAME:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->nslots_per_frame = (u16)val;
> +			break;
> +		case AR_TKN_U16_MODULE_SLOT_WIDTH:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->slot_width = (u16)val;
> +			break;
> +		case AR_TKN_U16_MODULE_INTF_MODE:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->intf_mode = (u16)val;
> +			break;
> +		case AR_TKN_U16_MODULE_SYNC_MODE:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->sync_mode = (u16)val;
> +			break;
> +		case AR_TKN_U16_MODULE_CTRL_INVERT_SYNC_PULSE:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->ctrl_invert_sync_pulse = (u16)val;
> +			break;
> +		case AR_TKN_U16_MODULE_CTRL_SYNC_DATA_DELAY:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->ctrl_sync_data_delay = (u16)val;
> +			break;
> +		case AR_TKN_U16_MODULE_QAIF_TYPE:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->qaif_type = (u16)val;
> +			break;
> +		case AR_TKN_U32_MODULE_ACTIVE_LANE_MASK:
> +			mod->active_lane_mask = val;
> +			break;
> +		case AR_TKN_U32_MODULE_FRAME_SYNC_RATE:
> +			mod->frame_sync_rate = val;
> +			break;
> +		case AR_TKN_U16_MODULE_BIT_CLK_TYPE:
> +			if (val > U16_MAX)
> +				return -EINVAL;
> +			mod->bit_clk_type = (u16)val;
> +			break;
> +		case AR_TKN_U8_MODULE_INV_INT_BIT_CLK:
> +			if (val > U8_MAX)
> +				return -EINVAL;
> +			mod->inv_int_bit_clk = (u8)val;
> +			break;
> +		case AR_TKN_U8_MODULE_INV_EXT_BIT_CLK:
> +			if (val > U8_MAX)
> +				return -EINVAL;
> +			mod->inv_ext_bit_clk = (u8)val;
> +			break;
> +		default:
> +			break;
> +		}
> +		tkn_count++;
> +		mod_elem++;
> +	}
> +
> +	return 0;
