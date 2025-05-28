Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5543E26A0F3
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 08:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748422013; cv=none; b=pj9N6t8bC6PtqZ/OciEImAjqs/GJqJD/Gnsho8xY5TFxF8xuGS///hUJi1dXbV1XvNjjhhXoZTJUNrtfa97uIM0C6UpdyED9oLSf64TjLnOpeHWQJnTdt2hP2cWBhM5Yas3NdVLRypBznJv2MRN4E5QbvhivDM6uOlnRvqAu7LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748422013; c=relaxed/simple;
	bh=Fi+QiGSJC8uF2K0X5kt8vPGp5bckmVAYGE46xxU1R40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Me8iov4QRANRRrbf1s2HOOjCtmTpkRDLFbTF9WNulHg4aY3mHudgAosYefCmRkcAdTJXnBm5ZmwREEoR5C5tdJMt0g4R1xfX4At/URSW9DdehD0BFQhy0qsvOlo22CQbkR38QeSCtyeWP/t8koCW4IQzqwFGWYlSQDpqTLveII4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NYX8fy24; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NYX8fy24"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RKuxco018912
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 08:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DRzWkDK3ft+iwkKji/GjVMzB
	ocQDwCbSuP5DIc/EUys=; b=NYX8fy24OEESH86jLxZM9FLzbN+nsk41j6+K93rW
	ueBNg7KgmhdpslFMbhhc4lTXjuX2liHHDZxYeQ/+t5uz9RssxOwPIu4W9c2tZM+J
	CGtb5ziTFEhYj5WTXFiQn5KrflxgZV78v52nlevTu5N0Jjc4c+qYaCk8LOv+Tn+X
	X9OkFAJ3pBEtSkNYly3WQ2nZCCsEO0I5MNBO/kIJSpabr4MU67xuXpVyT/mgYo2N
	NHHOxlvQLJOx7rtO0uWJ3xj2jV7gU37aeb1yVu/1aXV7A4de+16hUocYKszCct8r
	MsQgCFogJEUBfWNdmeQitrcpH8XZeyPrbMesdFQBdkqzXA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u549hkg7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 08:46:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8e23d6657so72300706d6.2
        for <linux-sound@vger.kernel.org>; Wed, 28 May 2025 01:46:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748422009; x=1749026809;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DRzWkDK3ft+iwkKji/GjVMzBocQDwCbSuP5DIc/EUys=;
        b=JuB+CcV7fFq39cGWccCbUjEEDkWierrrXVixmE6hlssJetz/uiotv+LzfSoybzZjoG
         jVybqsUVWnMjgvDrhIaRYL1T8lkPxjNCGluagkec+3F+7jkN79zCk9nMQnzcQBfL8gBu
         QveCfYB584PW+xxgbhruFCnBZB0ExSsrYRZJ/JCW0bixs7idIdzo7c538Cs1Wy0ZXUiF
         mlpv/AMToVPOD+5QbkBCkuVwpw7rg3nplicz9MWCMvcVyZR93Fo2ZMpQczLza0oWGQjY
         3qC8K6J9x3N3Vql2C0BC2cCIrt5tXZmBUlr0KKYEqDUU3AfNibYj95dZ/lf/jZbT9aJV
         5NgA==
X-Forwarded-Encrypted: i=1; AJvYcCUUM09zxu02qzsiTOabtUM6v2oN/IfP30K9cm7ORigZ6unG2js8W8D3fj4H4knwwxUmSDXtCRmlkv5tlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxEfg35le2S4h+3mJvzZI0M9US5A38ay+kaHXkP33lDncJvk212
	pyr2721FNQtL7dDP1qqwxXhv/b8TYSqt4P/jKB8RY3H4xdbfbvg6emYiyO9Q8pGoYDUje/9SVfn
	XVH2NyfdwYTweJMp0AWq8YV77kALEl1KQAwSnyHS2JZifoUgCdIK1K87Gqbs3JVUknw==
X-Gm-Gg: ASbGncvpAm7tW4ueUQwcgXYP1oIh7Es+qDOL8FxS5Uj5KWdRRUj+7kKY9I0eoThzlDJ
	hAccob86YTA35PTYRbWeue5x42JZEhDB2g51UgmSmS59d7eetPY3yNlGKmbJri+c9LuemBjpdYg
	6UsDy4pb4waYfcahYHwycIhoOuSa1M8qGeMIa6TZx0IDnBbP/jJB/7lLCRkPbxMQDjfWXkLaLq7
	lJErqKnpZVPYZTUx0bmrmKEI0IC07LyoLCLxjfqtTvv17px66ICnMatWhD8FZA1tVIlarEdgY0h
	cQk+3nm46b0q4hRobQOKfq+47wdeK3L0xacqwFut3LJAcC1UiBu36hQHd009DcpByLAhnJc20BI
	=
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008616d6.23.1748422008954;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGo9qqoQrF01ykPGF/17EjYHoPs6gmbavsSE2zy6sawKd53Clq0hMx0BlOXLpAzfgtNG6M5ag==
X-Received: by 2002:ad4:5b81:0:b0:6f8:e367:8440 with SMTP id 6a1803df08f44-6fa9d0330admr302008336d6.23.1748422008535;
        Wed, 28 May 2025 01:46:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f6b3e3asm182752e87.234.2025.05.28.01.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 01:46:47 -0700 (PDT)
Date: Wed, 28 May 2025 11:46:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net,
        kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com,
        broonie@kernel.org, jbrunet@baylibre.com, neil.armstrong@linaro.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.com,
        shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
        nicoleotsuka@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        srinivas.kandagatla@linaro.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
        kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 6/6] ASoC: qcom: Use helper function
 for_each_child_of_node_scoped()
Message-ID: <vjtgxpbpaowlz7ftryudf44f35jyaislvkckuzrzlpj25z25cf@vytjvui65gec>
References: <20250527082446.2265500-1-aichao@kylinos.cn>
 <20250527082446.2265500-7-aichao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527082446.2265500-7-aichao@kylinos.cn>
X-Proofpoint-GUID: 5ZaSOZGt1VuMOD6bRj_K41p6RSo_AE60
X-Authority-Analysis: v=2.4 cv=E9nNpbdl c=1 sm=1 tr=0 ts=6836cd79 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=uJ6pKfArofpzZCl0i4YA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA3NSBTYWx0ZWRfXwrnZlkKkCZn1
 Tx5LznUc0eDyPlq73Givk9FHsMDd00NtMLwGEP5rKt0IZMqqOf3LDir0W/7VO9OJj3syv17IYm7
 LRT3v/f+wGdmJ9sXH3koIO5ECi0kMugtUybuGBwBkFp7sHkb7XA/7+xAVsB/ugkfeYlEfyGUG9e
 vBN2rmPfaLmPKOVZDVln52op/HuqtinmwegbeXHp9mqViLoS/co8cFah4EgEWODhA5Gqz6yfMv0
 IjvEmNFvtyqhf/qnu6Ma0l6E5Jqh5o6Lt5g/zyAFx8Wddx/v0DKGhkO7G59bJ26UQE9hMLL//Zz
 OuPpZXZ89YsVImEzUeNObmkLoXn6OyTZX1fu6NGAnA/9dhkxU8MK0O/LA+L3WOgv/ZmzHAOBqSz
 vpa38i+QURWgO4GIT/FYcUPiU+tn8fN5lvlR4qU08u6DTL/qThMmuvKchMaGE3bhO0lrDJsB
X-Proofpoint-ORIG-GUID: 5ZaSOZGt1VuMOD6bRj_K41p6RSo_AE60
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=459 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280075

On Tue, May 27, 2025 at 04:24:46PM +0800, Ai Chao wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.

There are no calls to put the node. In the patched files the nodes are
already automatically put by the looping macro, there is nothing to
cleanup. Please stop sending this patch.

> 
> Signed-off-by: Ai Chao <aichao@kylinos.cn>
> ---
>  sound/soc/qcom/lpass-cpu.c       | 3 +--
>  sound/soc/qcom/qdsp6/q6afe-dai.c | 3 +--
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 4 +---
>  3 files changed, 3 insertions(+), 7 deletions(-)
> 

-- 
With best wishes
Dmitry
