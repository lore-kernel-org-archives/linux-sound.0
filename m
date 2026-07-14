Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5ACF42B310
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784018219; cv=none; b=FxcQX/mAdj9276Wqtp+m0oT3VmhxfSh8CwcLJukV02PjsqzGfQMrYeGJAtlvxbKr8Z5aX5K4AThOpSRoRu1jy21D7sMkgjtIX+lCn8trFwIjeTwMtiGv3HetZTKsrCQc+lvz169nhcJRhn/jtM7Bt/aDWH7HR8qUBtstnGshkig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784018219; c=relaxed/simple;
	bh=5kwAURwLzKnipG3wH6US78oa4XN2T1xv3YpjxSgBCz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MOC+TxoSB8uCKwbBzPi8gUPvGk69xAgIYc3hVACvAllfuEbL+EZtG3WQJm0aeD+Z3nyiind9wwT31Niwh3askyyPuMgwvDb3t5hZZbai4TrTc37hpJyVzGnNkPjEk963kFdw2PR+M3MVeW+3qn1L4MLQ/KHV2k05KWDCeHAJf2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCgoSYeH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bdJepPXB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCgoSYeH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bdJepPXB"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SUjU3929135
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UwBNga795puXbc3/E3BKT1/MAXsIt0OOfx/O6w3VlJk=; b=BCgoSYeHHGQgkdkU
	G90Lbo5hriKaL2CdV1bqdo/Cbfl54IPm98d5a3xMsSxoQbkynrXs93oDRzZb2eN9
	xtflhwqtNJ8/Yt3vDFmj1cyM4GtsSRIU8YJpOQZzQOABsea0djY2Gil25H7aBbS7
	rmMHl8xSz6oTRlEshnDgCClxDVirZm3IEYCT68SHaS2lqZc2QZyHkC34nROPOY29
	fEs0ZAfXKm+4IeZYScqUBRUUuKhkHoEmcO+kmkbwpWiuyTLgvbkpKgqGO99U+deG
	88599Al0HV9UdOEt9XuDVx1xAH2Wpn2zSMjbezKbVjNVwMEDtTTZ34wZlINu5pFj
	Wku0yw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd37xb4fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 08:36:47 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bec738909so34239501cf.1
        for <linux-sound@vger.kernel.org>; Tue, 14 Jul 2026 01:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784018206; x=1784623006; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UwBNga795puXbc3/E3BKT1/MAXsIt0OOfx/O6w3VlJk=;
        b=bdJepPXBU1ua7kHJkiFvYcoLKMP6OXaTtiV+Mhuvnf56PjygC1JvZhhBsRdu1q7hAp
         +OLViTLdZVRGp1XwYs5SCdGntkhmsfB3JoeAmhA0rkce/zaQmm2nkQc6KTsekwuRC/6i
         ZUcC/80zhp2DZ7BwF5Nj6yc5ONHJekgBu5f6TYNd+bv/z/PphuYFBXZrzsket+TUyWde
         enhGVj0jvZ95bAIFTcM0y9QF+2aBDL1X+qhBnz6KTPm1b+4aYt3IqT7vRKR+kqD6skdd
         mzE7pxoqTcX7jvYJk1Q4GKqG/5Yg4F3MSVfK6+hi8/QEsczSXscDt+JgoEvDbRoonmuX
         Yc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784018206; x=1784623006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwBNga795puXbc3/E3BKT1/MAXsIt0OOfx/O6w3VlJk=;
        b=QMMzSX/R78FdDLMu5VfW/YpxzlVELykNUSy6pXU0qG1LtwfqLN56XsdIiDMRkRJj7+
         k3TIboSJV6W9kNXQijkIwB8YbuX9JK0yzATpECH72Eql26v9WorXGZD0BBR41DobG81a
         /jbvhNEU5vSS3wmLE9cwtZ2Bk5UVe+4Zwu6GlYu93eU3bUTwgipEWKn8NvQaedJjKd+H
         hyA8KmchrASGbvbOpNuPyyuoCpFFob+M/hlj5kIHNZSn3c4cD/HE2NE0KQVR1Q/7BQ3s
         GBNqbAanscGKwwLP1rBH8SBYnr8JMn97Sutinrxg3gfciOyyu+IkYFttp/fNJ2u4RhTv
         h/ig==
X-Gm-Message-State: AOJu0YyB5umEcz818SmbAXFLQFmPDbcO08OIlAO2vat4H7DTUoAft4F/
	HRV2h/L2yfTZkwT5dymM5xl+l/8yl0Yi5B9v8J/pHRhqyWoffyHvVKgMpNEGKIi5giiYhjeU8r7
	oSc3OjlWOlKnoVm4wadZmek2x50B2Sk7HGlLvqAJ/WKTdcrJoidzyeWKc+yOGpZgj6A==
X-Gm-Gg: AfdE7cnAZ9N3JXkDrPMmL8eHBDCpvelXqh3kWtEg3284KZDr8ibNhwlgLTqrFZzaz8W
	OHfg5bQAVd2frI7JmQTZkJipAgo+giH+db8s/JqlB4S6yqynpAyxNdk2JcwY6s98jk5l7q/mdt4
	KzYLJLjNBBsWi1wwIt+UsOC5KWlCo/Duumm4Ld/lAOcmsQy0CJZQMlCG8Ln9ybvBwFpDdT/0ZoE
	ZXN5gi3TfvxHSmR/gK7id18LylsEht73wM/liV5PFUj0V3bZrnG+qrFOkrwHvqPNXp9eH4gjwOU
	xb2u4w/idC1FlgMmvFhEiMWVztPSzA147KmMg0OaBpO5ZIil7iWTILdM7vKgQGlbK6VmIAO47SM
	Jh9vXm4c86IIaJXTDlhvxF67RK+TjwkZhdD1qJA==
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5feb with SMTP id d75a77b69052e-51e424c5b37mr9038131cf.87.1784018206063;
        Tue, 14 Jul 2026 01:36:46 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5feb with SMTP id d75a77b69052e-51e424c5b37mr9038031cf.87.1784018205689;
        Tue, 14 Jul 2026 01:36:45 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47f464a974csm7946955f8f.18.2026.07.14.01.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:36:45 -0700 (PDT)
Message-ID: <5f5287d9-1991-407f-a3d8-7649f41a99bc@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:36:44 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] ASoC: qcom: qdsp6: q6prm: add Audio IF clock IDs
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260712134110.3306763-1-prasad.kumpatla@oss.qualcomm.com>
 <20260712134110.3306763-5-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260712134110.3306763-5-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4OSBTYWx0ZWRfXyT2+oPArLl0k
 GjUeYwGuXXZkdW9vM7bSzjrGDU5TUd94ptEB3oYxghdxLAnngw0Og+ukUx2SjUPRbRw866xPdsH
 ciaEvUU5eUT3PbdrsVcA2fjt3xnqiQT9dss5UEtnaibTWoiU8jZ3fcE60ZaOZp8gYuowRyg/wz6
 5ArgsY7Jn2O2zFjnB5fDBGZ9w9qm8uDxGai7NtEZYh9OUbmTaGLFvmVTUvkIlYBfdeRnUksXQ3B
 j61Z5nUeFAucSC94AIBPBwk6LvfRpYeuwiw4nW27JRz4+k61yuEqw09pvL/JEeAW77SJBTsyUaH
 CCJKp0ORapO99rKNQ9bubcYNB5A8EXWubq+y9dxsSL5/CxPTWNuRTyevlqP51C74SN3UutNQxsK
 P6xjxT1MXdjsWfjs3zN9+Y980ncidv7gsX3MRatGqOqr4dDtn6FW0NZgTZtym17VI1R3tDrLzEc
 xgZfPUQb5V3bAcW0MKA==
X-Authority-Analysis: v=2.4 cv=BNWDalQG c=1 sm=1 tr=0 ts=6a55f51f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=TEPkYXQ_7zv5l7E6eUIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: mo5p57EQSV2vQgmZMxP1Horw1sD4EcIv
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4OSBTYWx0ZWRfXyeh98TDygjSG
 9AXf0gw55Ekivz7QY6SqKy8ydmSgXxEizZZIWEea0TDGejIVgPkigG6i7nDCZ52DVeLDfL5+kSS
 n6/Cs/R5vq070tm9CEVRlnzOr2LoOu4=
X-Proofpoint-GUID: mo5p57EQSV2vQgmZMxP1Horw1sD4EcIv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140089



On 7/12/26 2:41 PM, Prasad Kumpatla wrote:
> Add the q6prm clock table entries and internal DSP clock IDs for LPASS
> Audio IF backend clocks.
> 
> The public binding IDs map to q6prm DSP clock IDs starting at 0x500 for
> Audio IF0 IBIT/EBIT. Add the internal definitions and register all Audio
> IF IBIT and EBIT clocks so machine drivers can request them through the
> APM clock controller.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

lgtm,
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
>  sound/soc/qcom/qdsp6/q6prm-clocks.c | 28 ++++++++++++++++++++++++++++
>  sound/soc/qcom/qdsp6/q6prm.h        | 29 +++++++++++++++++++++++++++++
>  2 files changed, 57 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> index 4c574b48a..38354ca8b 100644
> --- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
> +++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
> @@ -59,6 +59,34 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
>  	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF0_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF0_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF1_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF1_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF2_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF2_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF3_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF3_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF4_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF4_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF5_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF5_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF6_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF6_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF7_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF7_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF8_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF8_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF9_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF9_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF10_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF10_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF11_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF11_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF12_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_INTF12_EBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_VA_INTF0_IBIT),
> +	Q6PRM_CLK(LPASS_CLK_ID_VA_INTF0_EBIT),
>  	Q6DSP_VOTE_CLK(LPASS_HW_MACRO_VOTE, Q6PRM_HW_CORE_ID_LPASS,
>  		       "LPASS_HW_MACRO"),
>  	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
> diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
> index bbbe6d368..1593f6bd4 100644
> --- a/sound/soc/qcom/qdsp6/q6prm.h
> +++ b/sound/soc/qcom/qdsp6/q6prm.h
> @@ -87,6 +87,35 @@
>  /* Clock ID for RX CORE MCLK2 2X  MCLK */
>  #define Q6PRM_LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK 0x318
>  
> +#define Q6PRM_LPASS_CLK_ID_INTF0_IBIT		0x500
> +#define Q6PRM_LPASS_CLK_ID_INTF0_EBIT		0x501
> +#define Q6PRM_LPASS_CLK_ID_INTF1_IBIT		0x502
> +#define Q6PRM_LPASS_CLK_ID_INTF1_EBIT		0x503
> +#define Q6PRM_LPASS_CLK_ID_INTF2_IBIT		0x504
> +#define Q6PRM_LPASS_CLK_ID_INTF2_EBIT		0x505
> +#define Q6PRM_LPASS_CLK_ID_INTF3_IBIT		0x506
> +#define Q6PRM_LPASS_CLK_ID_INTF3_EBIT		0x507
> +#define Q6PRM_LPASS_CLK_ID_INTF4_IBIT		0x508
> +#define Q6PRM_LPASS_CLK_ID_INTF4_EBIT		0x509
> +#define Q6PRM_LPASS_CLK_ID_INTF5_IBIT		0x50A
> +#define Q6PRM_LPASS_CLK_ID_INTF5_EBIT		0x50B
> +#define Q6PRM_LPASS_CLK_ID_INTF6_IBIT		0x50C
> +#define Q6PRM_LPASS_CLK_ID_INTF6_EBIT		0x50D
> +#define Q6PRM_LPASS_CLK_ID_INTF7_IBIT		0x50E
> +#define Q6PRM_LPASS_CLK_ID_INTF7_EBIT		0x50F
> +#define Q6PRM_LPASS_CLK_ID_INTF8_IBIT		0x510
> +#define Q6PRM_LPASS_CLK_ID_INTF8_EBIT		0x511
> +#define Q6PRM_LPASS_CLK_ID_INTF9_IBIT		0x512
> +#define Q6PRM_LPASS_CLK_ID_INTF9_EBIT		0x513
> +#define Q6PRM_LPASS_CLK_ID_INTF10_IBIT		0x514
> +#define Q6PRM_LPASS_CLK_ID_INTF10_EBIT		0x515
> +#define Q6PRM_LPASS_CLK_ID_INTF11_IBIT		0x516
> +#define Q6PRM_LPASS_CLK_ID_INTF11_EBIT		0x517
> +#define Q6PRM_LPASS_CLK_ID_INTF12_IBIT		0x518
> +#define Q6PRM_LPASS_CLK_ID_INTF12_EBIT		0x519
> +#define Q6PRM_LPASS_CLK_ID_VA_INTF0_IBIT		0x550
> +#define Q6PRM_LPASS_CLK_ID_VA_INTF0_EBIT		0x551
> +
>  #define Q6PRM_LPASS_CLK_SRC_INTERNAL	1
>  #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
>  #define Q6PRM_HW_CORE_ID_LPASS		1

