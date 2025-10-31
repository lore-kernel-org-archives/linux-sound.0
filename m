Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B959A347BA9
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761911405; cv=none; b=oNrWBx1rCySjKRhamZ+zfcleRTkfETI7py0XsK35l+Ez/H3Hd2U32ZRIDD82e5k8AqilhCb3n4v/kFeolMR2HeLSApnHKFKY4n7RLqjTcqygfcp0Rv1dU4NcyUruDK/vFJ1KLTVRD1+DjAgReCLdFfjuy5oEdQbNJsLt5ariNv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761911405; c=relaxed/simple;
	bh=eoVbHo7aC1vVS9/BhWqWBi4mcYDKQTV0DCH1R1NJ3jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p2BgTdhtm+E0zzLG6OE/7rho8oEpPeTr2M4mdNCP/2Gj5lq3cmsPhWbXdUK7WTEVjK0qXR/XKnl/fwRmRkXLv+zzkjmwyucrxJTnpY+tziOpgn6L1L+w+R6N7LMCAXGUjATYmGcI/40gwaUWdmB1Xnlj+mDDSfDcLywrQrYeK4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p8G702Ah; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K2kfGk89; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p8G702Ah";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K2kfGk89"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V7oLG5872685
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gLRZg0S+AE6oEph0CbBMONDhQ2wpbW+QzzCe2qY2NRc=; b=p8G702Ahp/V4Bhu3
	jwFIha0OnUWN1QfNncuJ+KkaGHvLHpZxP9bZ5A+OjRtOTinXZJQFg3qp59evVq6Z
	yuHk1IV5mo3WMwfTR26n4YH/l06MjGYCwm5t+jPeKtcaUITGqHlcdEaHuT2puy1w
	Y8T16N6yzpwl82kqsFCnC4fNnKA5YLgOTn6h7qparFGEzXpOC85ZrltzlYeVeUmg
	J4B4oaq8SR3NpADgp2Wa+FN9WYfHiW82E+48xvI7saAMh4Dv25FlqfV/+3uuyoTf
	mFd7vzFEXsnSUsxxMWj4FuhTfh/DTHfCae+KvBoHGthiZ4SEeearGBqiqVB1yUFY
	DxdESw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4fqn20tc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 11:50:03 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4eceefa36d0so51324661cf.1
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 04:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761911402; x=1762516202; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gLRZg0S+AE6oEph0CbBMONDhQ2wpbW+QzzCe2qY2NRc=;
        b=K2kfGk89uM4+5ot93ZlaPj2T5eA4vRXKimViNuhyhHLa/aVZA9PK/K6kzOIgmWld+s
         tT3e80WEY/7SM7Wa7piho5Q/pIerb1wCFax/leW1JWhhhFL2KnkaDYQFsU7rsaBQKudZ
         zH4GXgO07+FavLTc+R6XWWYPRvUrT1sqxZQ+OF1uxSgku9I2RdJTkkoxVxPTPZbGg7XH
         5w3pduQJgaELqNleFMAwmDjxkpYceASWiFGBo9pk2S4eA6WEt+XvqFCXTbWm8yiwl/2f
         hlst2g3p6t1r4GKs1lgr4xpobVT385H0xt3ymop5fsv+MlLvoKT+KsZA6jQ31t1F4726
         rL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761911402; x=1762516202;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gLRZg0S+AE6oEph0CbBMONDhQ2wpbW+QzzCe2qY2NRc=;
        b=nCtuFXb9CV9jBSPWGOGE4RZRSfJKANZK9W5e4TGw/Ex7XMhw13t/4cclM/wKbLuR/1
         ZA3j0fX9RVxkbPGyVn28fQEGW7F7/+6c6Cd9qW30wtYuWmR2esANgBKnr/yO4QBROuvg
         FIE00MsFL7ZAMhv+jItPqfYK+zvgsZbqvTjuVlCA7n7M3gEn+li0HAdUWmrIky9adu62
         +E5fqZcaJFeIZx7lmC2Boi3cL9X/ahxleIYIWqdiB4E2hW+NsaI1FcGdWerCpyBG1LGu
         FZXpIcOejaRPiSzTm/+RmFN69V/KZN56FD9iKiuDxaxo98yXrKaAprBN59ypUc+ySmjl
         MS7A==
X-Forwarded-Encrypted: i=1; AJvYcCVLHtcpuqAgzDJUQ7Kh1ZTNd2lqnzSNFQtT29h4AUqO/yvhisRV9ItX5os0PTkaB3lLjixUvUMOQp1dKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ECgKGvODb13vhjfh1dz0osFdO6Z+zYFJoh3FgEcRAABb2+Jm
	oo3nw18QVkTtmV7rmlAqNA39CaZxbuZ8r1F/W3xCbZs0DfqUq7wqF8o0Ms/n3ODa1nKanaXlvlj
	/XFloEXUH8qM98PZAFoGUW4vRRbfVpvErOVlhI78pojXA+c9a7DgcbPdFgSRfb25FLg==
X-Gm-Gg: ASbGncsJ1q9+dBIyLTlQULHxZksKRzL20aMjkoXTlCaV4ooM90coAwtvN22YDRmAZii
	chToW/1DR67fbbfrbSKBL9Ye22YAYRskpWXNyMlRYWBoB9sgFrjMzni7ZIYWpPE/Mp8TkCylSSg
	O9cTFr6abu0vfBPrQFzSSLxLkHll3VuYuDVTegc0VrU+1PUn4uVV2nXavEYT+KE/csmZbL4miRo
	8oCHOkOIvW8R8ViC9hzw5frV1z47LBpP8teGd3xcocGoIythDiAzbxcUeGf4rxDmnefMuZZF6Ku
	Hvi41oQVzkIvRkxiyugsgYlBAF1msfXgcsyUx2j8x1UsZ9Y0RuDzU2uRqpWlB1UUFfLpbpB+vct
	MR3Xwiu2LNrKsH4HHpH6vsVCi7A==
X-Received: by 2002:a05:622a:20a:b0:4e8:b446:c01c with SMTP id d75a77b69052e-4ed31009474mr37044881cf.58.1761911402025;
        Fri, 31 Oct 2025 04:50:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEWPfCzEgB1x7tlVV25/AaqTH5SPGouZCDNOaKdIMjMHxQEiVR/bwWZMHsFaO3q/nxJufbjg==
X-Received: by 2002:a05:622a:20a:b0:4e8:b446:c01c with SMTP id d75a77b69052e-4ed31009474mr37044551cf.58.1761911401600;
        Fri, 31 Oct 2025 04:50:01 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-429c13ebfe8sm3170057f8f.35.2025.10.31.04.50.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 04:50:01 -0700 (PDT)
Message-ID: <c3120458-e493-43a8-b5e5-0de62377ca29@oss.qualcomm.com>
Date: Fri, 31 Oct 2025 11:49:59 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/6] ASoC: codecs: lpass-tx-macro: fix SM6115 support
To: robh@kernel.org, broonie@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alexey.klimov@linaro.org,
        konradybcio@kernel.org, Stable@vger.kernel.org
References: <20251031114752.572270-1-srinivas.kandagatla@oss.qualcomm.com>
 <20251031114752.572270-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20251031114752.572270-2-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RL2+3oi+ c=1 sm=1 tr=0 ts=6904a26b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=bqFBmpm2teb5LxhVygoA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: jkHvRIlP5R-EZZ8iV8CyChDc62LDRXht
X-Proofpoint-GUID: jkHvRIlP5R-EZZ8iV8CyChDc62LDRXht
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDEwNiBTYWx0ZWRfXwnmjaVVQ94Cv
 rq48yobHrFJoF59pz0KWmZKmDzPaQuU+Fc7ma9N55lqgg0mmkCWUOIdy/rBfI1XBXo34VTJazv8
 AuymleeSCC0drWmxH5kSaPFQIRYl5ajod7nrQqA0RSUQtdtuqW2Knj2GJH/mVEckXNgBQz0FPsD
 BFFc2ZBYJH8KiB7M568OupqYsUomDNHc1Spdj74IeTtcBa0f3y1ltUlhzhLk+fY/GnZx5Rr6Wd9
 7JVXXDX5b8OSYmmbJTtamgTUXe3enbXhhYp3GpaCguD0qO08Ywid1+1rWV3Q/VhSRT2mvm97BUq
 J77Hcj1Vosoq3xxO+RRCwASWUSpNi9xlEyLCrCjaH2iYyXIFd0TUSzw5lyWMH/ouqveUs5t+4f6
 vHfD7eoLLN0IyA38fNLFLW+wU3KDfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310106

On 10/31/25 11:47 AM, Srinivas Kandagatla wrote:
> SM6115 does have soundwire controller in tx. For some reason
> we ended up with this incorrect patch.
> 
> Fix this by adding the flag to reflect this in SoC data.
> 
> Fixes: 510c46884299 ("ASoC: codecs: lpass-tx-macro: Add SM6115 support")
> Cc: <Stable@vger.kernel.org>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/lpass-tx-macro.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 1aefd3bde818..ac87c8874588 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -2474,6 +2474,7 @@ static const struct tx_macro_data lpass_ver_9_2 = {
>  
>  static const struct tx_macro_data lpass_ver_10_sm6115 = {
>  	.flags			= LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
> +				  LPASS_MACRO_FLAG_RESET_SWR,
Looks like send a incorrect patch here..
will send a v3

--srini>  	.ver			= LPASS_VER_10_0_0,
>  	.extra_widgets		= tx_macro_dapm_widgets_v9_2,
>  	.extra_widgets_num	= ARRAY_SIZE(tx_macro_dapm_widgets_v9_2),

