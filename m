Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10614579837
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965973; cv=none; b=p6pVYZvHV77pDFmPlSmNH3i/17Jw8fjETwBwvn3aQp7fAq6KIZ37qCkEttksWeakhGxB4cQRKOU10KGkijkx3htp6BoQd/sO5/zccqg4TcpIvBb+HzT2N9gv9E0maBZjbyFeo2y+19i4F4+qkmczTFLgNps+PlXA7rpdMO6ZzEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965973; c=relaxed/simple;
	bh=drY8kln+BrxQaXWQfZyFkLzaCoRxh9DNMq+5RNOp4Tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teRE4yUF8qPBJKiazkYAt+1yn3BxMZY7ppfTzSuKKzN4h6KfzSHZSBluPJDVWHQFD6TmBBlz9PMYdrFL7TEhvAHUkxk/PF9/IeeyROhhCsyry0Nrx9uX9gTEMeY+jZC7ISCRxNaFw6AMGJsR8Wc8VRZ0Lmt1YLZPG2IQNl3R9SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIq8wfEd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hciY6m5u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIq8wfEd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hciY6m5u"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2qC1810036
	for <linux-sound@vger.kernel.org>; Wed, 9 Sep 2026 14:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e54EbhbbjxbNn3hH0o0iVyQp
	ZJxdrsa3hetZg+vrQVI=; b=gIq8wfEdEzwY5g240avguM89X3tRMzosuKP6mN38
	GF7zqYjStaHTOeGgrPVFCksIW+B0IICzq3HloEZHvkMw9V9YTa1cVvSgWmnlDjWb
	LNLafD5QDt3j3mGaScpGu2pxYY3uK3TWmbmUThMTMETFKVXlKHHdhdKQBI2BFwY9
	VTv+XFmE0Fbi25lYKakrnvpJ6POApDBnmjBz6qR8KFdSbrZxDH6vPo+xfmhfKFvT
	j/U5/MrJWXThTak7Xo1YLBkdMRy6SxBThe6mxCMpMPLxHmeVbLAzfWkgCLHNANco
	/T1w5hPh2NdyxzKMOtGrYOZNSE4GFM4x61T0G5OATuL1CQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk4xj19p7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 14:59:30 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso2846861a91.1
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 07:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965969; x=1789570769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e54EbhbbjxbNn3hH0o0iVyQpZJxdrsa3hetZg+vrQVI=;
        b=hciY6m5ukxAsKtpnsecDmLIV30eM2fHX8K7lJXBRZkKMiwKDg7Ha6R0jwbcGOPX6l1
         pfdbWTFs7u3kUfkEizYrP9bGD7oKzzWsD3LlQVDm3OV2eH6Dbc2UtTQftq6Wry3ZfzSi
         uNgD8uVzU7CYhxlVgwJWDgcB5wVY7nApAWXS5hT6SIMrySMT7casnurpCIxajPyQXBqK
         cpEH/X36/1oSFp1TvEir4TIN8Nu0WcHbF8z+S1bd+Lq+4Ih5TJewo8L8+6Q9LQY6UdF9
         J2TOo4CRk1DtWSnmC08pHxYEwCeqDCBteHBaU1vZ47H1unIeOL3nM6c3W8mv7HL5PLv/
         NVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965969; x=1789570769;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e54EbhbbjxbNn3hH0o0iVyQpZJxdrsa3hetZg+vrQVI=;
        b=MezR3ES/s40QsPwBsPmM5D8J62z8Id8T9QHcE36bv9RmiqTFyMQd2F3OtiZ9x+aUEd
         GeYqBkXkda67AEv6s7uJGE0dvYzkbb6IogUNSlN9AaEq2zzY+ze1tZQWaUYeQ12uBvN+
         DlNEhZbtS0PhKIR1PV9yEUWre16lX55NqEPE9nzo4eK/WWHBMpopQc8hVhSkqEtOJAGY
         S6pjNyAY4F0qdGB+ZeF7IC5eyWDcADHTjy2AWQD7x0FnyhKD9x/iU9b9e8DxM+QVlZA3
         wMqtwN1PL0p6mo6Jkaw1PN+HnCuo8094pORlu5j+LkLaE/gDauwtOW1O2Up+WjfLw6Bv
         LkPw==
X-Forwarded-Encrypted: i=1; AKwUvBwltKyVwvFlT57ImT/PCxqosIXL5Be42E5uEe+mkL5uCGjrZVoaiFWX/wSnFhV929YhYcpJGurnrwTh9Q==@vger.kernel.org
X-Gm-Message-State: AFuF++nbm9gHQxJ/rFdirbtXVJVrFrslRLSWgb9cHaxKBlkKKe+CT9ct
	0uRF+/JUCHr5T3ifT45Hu3G89k2ygjFq/ruKZ3FwLNOfKNUrjtIgW6c+xaIRm99Q133HtowT9/G
	LV8T1zUzxXK+DsOS1eeH5ejtmfxe1/4iWWQMlg2LgJxVNlqP0rhk3O7Ut7L036jSY/A==
X-Gm-Gg: AYBFou2HgmtNLdML3mHMm7HjB8jaPeb+Xq6jZlb14AcObRqu28v6zQzlV0u+7DsR3Gu
	tr6+o9mMicWnRzjSfdS3g+GatRyK168p8AN27tiRswPQ3e3/YbdJLQIxJD7z8bRMycOwoOnbwLj
	pOT2kA+/SgtvsONLC2ino10/b38stFvR7gkVo9WtFrAYmic1TTk/AVN/HwQ/xrw570j5D62Sz/k
	c67++iiPCqLCXffxy9SahQqdVcPnxlUswuEQl9nZZbPwU/pVhFGDIwQhcDIEdbCNVF+upwChWVj
	636s2yv+Fj6EzlZXNMms0J03LepLdmUgwmiep7NB8TnJ8x5zN1vd2X6De8p2ojgo7J7fkJuI0qo
	Rbj3dG0/hUKrxS1ye7ORFTqM+P1AnNimOznhmhzcVals=
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr54355551a91.1.1788965969471;
        Wed, 09 Sep 2026 07:59:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3c48:b0:398:e436:384 with SMTP id 98e67ed59e1d1-39b260d335dmr54355467a91.1.1788965968764;
        Wed, 09 Sep 2026 07:59:28 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm32456833a91.13.2026.09.09.07.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:59:28 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:59:19 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 3/5] ASoC: codec: pcm1681: Enable system clock before
 regmap access
Message-ID: <aqF0R0FVrnC3hi6K@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
 <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-3-997d3b20cf43@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX0cZp0yWVhYVT
 4KFfjJFJlcKGLkPuUvPkgv3o1RV77l3S2rGq9QV8p0XMsl8mm6sWpyY2EyHBrAErksE0VLdW4v2
 1zquQlenEVfA/GIxvihXHbAN2LNmVFY=
X-Authority-Analysis: v=2.4 cv=J52aKgnS c=1 sm=1 tr=0 ts=6aa17452 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=0Zc5S7fWRYNTRwHQfoIA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: b23XaWpDlWJCniYyh05CERzXZ0IfFJPn
X-Proofpoint-GUID: b23XaWpDlWJCniYyh05CERzXZ0IfFJPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NyBTYWx0ZWRfX1vI3wvqtMALS
 USiQ+BuZtRUpDbaqhnB1Z1WkcZuYR+U47KGmEjBsnkD24IzSZZHdTxEyuf9DbQndsZ9HSlc+EEn
 BaZ6fFAVj6TGFv89curmsS0q3OTKBMF0MzkZYdSezkKyepROK3/T4VYnIEYt4c8tL683iNtOJ23
 rsGPZXx78js4j2XZt3HDIE3ceARg2Yq2BXR++eq0a6QKM6sEjN+8MQeNpCwZHAjSMccSt7fTvak
 0dioH59lDdG/D2BFXj/mAfdtxwV3YEFKdEtQ5n8DRcLj0XyY5xUrKGQI8GmlAEuTsYKR/YS8kyt
 UPnAUCEI/VEb5mhKm5/Z/ey1Wt6YkIimXa1GxY1F0s8XXXorJbAsN4hW1Fmx1UAlC4NEpjUmllX
 s2ZsaZDksruQcn05L+zHsGYL+E/Eho/3nsBDKIA5VccVnpqEoU112YKABJlnyhC/Fmr6ykihQOh
 Ahhd5SJOqLa/bZLY6Kw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090167

On Mon, Sep 07, 2026 at 11:39:44PM +0530, Mohammad Rafi Shaik wrote:
> The PCM1681 DAC requires the SCK (system clock) input to be
> present for proper device operation. On platforms where SCK
> is provided by a controllable clock source, register accesses
> over I2C may fail when the clock is not enabled.
> 
> Add optional clock support to the PCM1681 driver by acquiring
> the "sck" clock, enabling it during probe, and registering a
> managed cleanup action to disable it during device removal or
> probe failure.
> 
> This allows platforms to model the PCM1681 system clock through
> the common clock framework and ensures the device is operational
> before regmap initialization and register accesses occur.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/codecs/pcm1681.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
> index 60fdbe5c4e05..cfe549176d14 100644
> --- a/sound/soc/codecs/pcm1681.c
> +++ b/sound/soc/codecs/pcm1681.c
> @@ -12,6 +12,7 @@
>  #include <linux/i2c.h>
>  #include <linux/regmap.h>
>  #include <linux/of.h>
> +#include <linux/clk.h>
>  #include <sound/pcm.h>
>  #include <sound/pcm_params.h>
>  #include <sound/soc.h>
> @@ -74,6 +75,7 @@ struct pcm1681_private {
>  	unsigned int deemph;
>  	/* Current rate for deemphasis control */
>  	unsigned int rate;
> +	struct clk *sclk;
>  };
>  
>  static const int pcm1681_deemph[] = { 44100, 48000, 32000 };
> @@ -311,6 +313,22 @@ static int pcm1681_i2c_probe(struct i2c_client *client)
>  	if (!priv)
>  		return -ENOMEM;
>  
> +	priv->sclk = devm_clk_get_optional(&client->dev, "sck");
> +	if (IS_ERR(priv->sclk))
> +		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk),
> +				     "Failed to get sck\n");
> +
> +	ret = clk_prepare_enable(priv->sclk);
> +	if (ret)
> +		return dev_err_probe(&client->dev, ret,
> +				     "Failed to enable sck\n");
> +
> +	ret = devm_add_action_or_reset(&client->dev,
> +				       (void (*)(void *))clk_disable_unprepare,
> +				       priv->sclk);
> +	if (ret)
> +		return ret;
> +

All three calls can collapse into one?

	priv->sclk = devm_clk_get_optional_enabled(&client->dev, "sck");
	if (IS_ERR(priv->sclk))
		return dev_err_probe(&client->dev, PTR_ERR(priv->sclk), "Failed to get sck\n");

Also, priv->sclk is never used after probe, so drop the struct member
and use a local.

Shawn

>  	priv->regmap = devm_regmap_init_i2c(client, &pcm1681_regmap);
>  	if (IS_ERR(priv->regmap)) {
>  		ret = PTR_ERR(priv->regmap);
> 
> -- 
> 2.34.1
> 
> 
