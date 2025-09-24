Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CA492DFF0D
	for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758710287; cv=none; b=d/t+hG/GYO5sVglsUiEAY+ina3QsszXwyWK8C3Qsy1cgeWSZecqTss0y7zxSp6Cs0cLHLob9A4hRg324+fG1p8BDEbA5axeT8pyzEFU2SogmT69gd0feR0D5CEAJCDW+awkw87BWR3RjynQRdKXKe2JR9OnxOmwdREH+/bRbwuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758710287; c=relaxed/simple;
	bh=Toar0gvp2qJ43aKc+/cW7q0AzANqcXizpPzrPHWXH30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ObGQpNupuzk8tyPEI4R5xUCUC1VjxV5G0CFsnxoHl4PT6c+nY9eJAq2h9dJTjFaXLn7mNtIPNlWKXRTJ9WRYvYNblyiF6wFebMp2w3Pf5usnkx0vJ6ctjq9cpxdkcD/25nASlWcRoVqtvcHNlS+M/wV0NWGOFnHJ105zWMyeN+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KCpFnMCC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KCpFnMCC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iDMC002657
	for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 10:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I9MQAHNRQTDWklM4yOpEwiFV6eCi+r3BJBm1CRNI/Qk=; b=KCpFnMCChEFc3DP8
	vbHTSH3gLdgpSwVZ5pTgOA7OY9nU10qZuuJJIn8InaFyesIL5rerjjLWWsQAspum
	ddlvTldnB+CCiUgVcjG2qkF+K0LOgN9qD+ujEhzzB1bdtnH09dAuqXk1gDto/mKV
	XkHYSf3w2WMM224E2gxYiwGLDFLroUoG97Q9K4GgWoQr2TnEIpko25mS8L8KrwBf
	0PHd81Rog3BavLMiplfQQqXBI0i32JwA9eAYzPm9ntIg2BJHfT1pcNCSvVwDR3JN
	7C+zO0sxiqGr/hxNIUHM79q8LUIZQ8nf17eRdiK5f5I1roMM4QzuIJWqpGfdkyCe
	R8qVTg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajexhny-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 10:38:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d38dbc0e29so39873171cf.3
        for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 03:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758710280; x=1759315080;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I9MQAHNRQTDWklM4yOpEwiFV6eCi+r3BJBm1CRNI/Qk=;
        b=IlxEBvYh5EE1X2tBiSmyWj+EYJWSg2bEK2Hrzjnu/M37QWrvILdxeKakSp2sa5/A8a
         skmIojR44jkNVukLWVtUt57KVrWMeQh/jTUKEM1GWiUyOFlmW1YG58ic4NqQbedQNyH1
         e82Oc1SVKTtX/AAbOCJGVWE7CN3Wa9BEMLKgRSr7RPuDZykRWiVl08aEPGNd9IMtDEdd
         womnr11MWuA7GALocNlGkbYMM6UBUgtD9tlewjTx3LTo/TJ/cB77igGmxmqs1TCYBULP
         GS9ioo49L3AtUwyWA/b1T9c3a0cRzSWei5rU5FBBEt2WitsHb5BMB7qqzre+yKyPddHc
         75kA==
X-Forwarded-Encrypted: i=1; AJvYcCUJBGrjXYPlQt0ACrkd+eSllZdfF2ZYE4RWZlcd6+Px3GqABBH674HE/ASWJoIYPATFMw5gwlZS5DhwKQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpxzjpyBe9fnoNyBA/iVsbQcefSYjjskHZ0n+UQfU4gQy9VNPq
	LaEKUHVhaL7S4rv4+HGdt8oMkNT7PY3tA4pnm5M8lX2J63In6RfuSSawI+ANsACzuZ0SP2o2+dq
	VaSAvy9KWx2nN/5v9n38RSGLwNsqCs2mFNn769HHfCWjcI6C9Yz1VxsqPCEIlm8+jZg==
X-Gm-Gg: ASbGnctu3awfCuIy+M7gmgY2jiz/Y32GKkwF5GeVuXQH39FACQ0UKZ2thiA8QlvK8YX
	XscFNm1e8DXcq9c5lxyk9gwEVieC4WDKN+kNyRtC9jhLdp60oxmOfhm79HIcYo2/YYXKGQdvdaV
	Nq44O6DIbrXUI/Aj2AbX/YTVRmG4R7re2GJJAsEQ1zj+jGh57yF9zT/pWmDRSWrlRWwsmRwvcMy
	TQOxSDRIwj1o/X+8VFd6QfMUK3R1NPZwvWqMgaV4Tk8iTEvTBPmpHEOKASkoP76+Vdfag3g/Cko
	ekQRL5YCL3vR2/a99UKrFOE8Lg9H1UD2rqyp634MOGzNuvH/Y4OIVxxIXFpYqodvkJ8=
X-Received: by 2002:ac8:5815:0:b0:4cf:fc38:7ff5 with SMTP id d75a77b69052e-4d370d5e68fmr55024861cf.68.1758710279911;
        Wed, 24 Sep 2025 03:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGDRyLWKTabJ5qvoph/CIwo2q5r7HvHCVkrkTq6bzN60xam0HeMzsPtDkfzIFyr4t9WVi8Jkw==
X-Received: by 2002:ac8:5815:0:b0:4cf:fc38:7ff5 with SMTP id d75a77b69052e-4d370d5e68fmr55024641cf.68.1758710279425;
        Wed, 24 Sep 2025 03:37:59 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee0fbf1d35sm29649231f8f.55.2025.09.24.03.37.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 03:37:59 -0700 (PDT)
Message-ID: <4ec6bf87-f6c8-4080-98c2-e81425c44e4a@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 11:37:58 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH][next] ASoC: codecs: wcd: Fix a less than zero check on an
 u32 array element
To: Colin Ian King <colin.i.king@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250924103334.9832-1-colin.i.king@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250924103334.9832-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OM0eTJbtq2oCWyPuE2QcVHBDyGyuB14i
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d3ca09 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=gChy-ArH425jUgxL:21 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=OLL_FvSJAAAA:8
 a=pGLkceISAAAA:8 a=bwnp8BXZDZf2W2z4idsA:9 a=QEXdDO2ut3YA:10 a=j9o5Av5NI7AA:10
 a=M_KkFZv0jYEA:10 a=dawVfQjAaf238kedN5IG:22 a=oIrB72frpwYPwTMnlWqB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfXyKr7QiacRshQ
 1btmQtkg7cdPIrwwNzRNo2MafJqtrnyW2dUchO03Ajq4lNgf1+IY1KyfCXJsVQWS08gWCHH8+BL
 +PZYclxP8AGIayXl29xGUsQofSQw57Xkgm7Lkr8xTh4bUEnfH466tXjBkPlDHVG43xsuGQzKhPL
 XBqbCJW774r99dArfZwIsEagONFro5p/BU95AnfvB3RFsNeFEEDdrqGDjriP808a/1JMvjMuH99
 hz5EZBNMLiP8PueGxBDhio1i6eZCcjAtzy274Pq1MSWJuYWB0u7kAiJ9IgReUOUEMfwhtdagVmc
 BO9aYfcgRyNhOI1yM6GqrjlyOMaahq2rmEcw5lKIXROZ9VWR4TeXnpSO6sFNdQVt2ziZhY/JATT
 p9AKIWh3
X-Proofpoint-ORIG-GUID: OM0eTJbtq2oCWyPuE2QcVHBDyGyuB14i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

On 9/24/25 11:33 AM, Colin Ian King wrote:
> Currently the error check from the call to wcd_get_micbias_val is always
> false because an u32 unsigned int in common->micb_vout[i] is being used to
> to perform the less than zero error check. Fix this by using the int
> variable ret to perform the check.
> 
> Fixes: 4f16b6351bbf ("ASoC: codecs: wcd: add common helper for wcd codecs")
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---

Dan Carpenter sent exactly same fix yesterday:

https://www.spinics.net/lists/kernel/msg5855359.html

--srini
>  sound/soc/codecs/wcd-common.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
> index 9bbfda828377..9fd3965ed540 100644
> --- a/sound/soc/codecs/wcd-common.c
> +++ b/sound/soc/codecs/wcd-common.c
> @@ -65,9 +65,12 @@ int wcd_dt_parse_micbias_info(struct wcd_common *common)
>  	int i;
>  
>  	for (i = 0; i < common->max_bias; i++) {
> -		common->micb_vout[i] = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
> -		if (common->micb_vout[i] < 0)
> +		int ret;
> +
> +		ret = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
> +		if (ret < 0)
>  			return -EINVAL;
> +		common->micb_vout[i] = ret;
>  	}
>  
>  	return 0;

