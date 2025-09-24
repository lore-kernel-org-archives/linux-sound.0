Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7992A2DE701
	for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 10:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758710205; cv=none; b=nmFU9D9vBihcjsZ3zNk1WOquDcehilqZAnaTapa7RMtr7itKYKrego0V/6ZgpMQ4l8+vOt6SgEJPVee5/1wdxkxYbHfJryJFWA0RgLD5OuvWD0qvykHBHdHGBRidgt7n2P1nWSjfiOSBJ/Sj3tA6akup7D+By2lp3WwRGfFxNrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758710205; c=relaxed/simple;
	bh=TcJuuFO6n0Y9yMEhd3p5BYTjpQ9PLg7J6rBPzBmb53Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HX41NWwSBua0rFDAj2t5ML2613cu40OhYaX8TPx6bEiLE2BtfQiGUBpYFg2aSBEssDbw26eGpyZFhaSaKv2qQTXtI/BHzPKGZlBwM2Lo3pGkmOK4srAUSE8cuq1iiV2/+Zp/Q0V1aA0Il8VVeDCeIHjNdn2zW9c9UiME56/bBd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=crCZxAex; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="crCZxAex"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58O4iSbp024010
	for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 10:36:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/Yl5Cf4yj9MAlJOJXqnptSyyyT3YpEhhEgjwU6fmXk=; b=crCZxAex6fQshZlM
	ju719S9Mgg9yEm1Wmh3Oc4+Czb6/XeUhVpAv7SR66PoQERKkhl4+uGW7Z+oCYfp3
	BW0CnfhXL74teLEy1b9yLozGO1XeNLre0HNo96fhnLro//2Spx2e152WdPkO6D0t
	/mPOdRkbqVwPJoMUsoGuiHc2VLOE8GwlXyzL8GuipP1pWlQU4GGynNS9XMAuuvVL
	s9plhEzvJz/Bktz9N/xhtldwdjENV17YDioseUchtUKrX0bk2ZBWEfcj95ADViE4
	Qe3EdSlN3AU5kAyDQqjrTss2gJeJCcLQASPAM13tBfyOUzm9nmvXQUmsqO7P2Vzu
	KZ8koA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bwp0b0gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 10:36:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ca8c6ec82eso68555601cf.3
        for <linux-sound@vger.kernel.org>; Wed, 24 Sep 2025 03:36:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758710198; x=1759314998;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T/Yl5Cf4yj9MAlJOJXqnptSyyyT3YpEhhEgjwU6fmXk=;
        b=h8N0HGCrns8T9EWxM9VvIhQFD9jEok+bhj6LZ7stE246FF/AB2gGvyACITvBDw0ojZ
         8jarnogQ16dsRKL2/O+e48cAwbhSr58HxoKKRSFUW6wPBMBbJdmtd0FU6KuGoplfkfTz
         +u8QlbhpF3OstqNOrWn/F3PeKmkI7K/DEMjXN+QftJHr0EirUxCByOCvKrEweEe4OkeB
         /QkqKZ7RSJPYT63vZBrEwFVjAN/z2j8Cob5DrsOrZ6vpcqcYVE1585ugpXLSx1pb26jI
         qVH+u8NckmCMAnSPt0z+Wf6pLXx+83WvIuRzz4vuJdWBIhZ0jLP3yO9g+lV981Utu2xV
         GhVA==
X-Forwarded-Encrypted: i=1; AJvYcCVBCGladIdx6/ag0oaoyEAWuoCavpPgsUhrBfFFZpXzODe293njgiJDPbr9lMlOcn8oDsEU0RyrSxG4Cw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzuBCJDPqM5C2egssqEc+WKbhwdSsPP8bVhzVXE2ICNvlcAs/5X
	zAXH7MEShQUC9gPIYU8ZSHqHtyfdpyO+3bUoRiRKzk0Q624CYzoTDedYEzpBNngCaeqVPo6/1xA
	bGwAbvH9Zg51Q4BwJhqd0X/rrLu0YtMRwcwMmkwSKyVY7OI3XXk4s0TI1zdlTicw4Sg==
X-Gm-Gg: ASbGncu+FI1tDOr2WKeEmP8Sg4RyqDHBSIvj74gZdfayMeaa1dWY+Buof5MlNySQrmN
	jaFbwlIXLbG1Hw8IAyN7bysVrs4mZpdVys86I0qQj1drbpXqHdgzb/J6MSi9umfyfgOLrQfwkuw
	WO0eXBagDKNlxPOVzq8AyH9icrpxPSGX5sfo/4qeGNG7r9s9UWV+4ARJt5qccAw2EWgGJec/ulR
	Pi/8lK6hqOMnhyji+fJRp0gwL1BlBJEVq0CRav34N0/1UAKIcIwoU/+aHBD3cejmuzIRREPFxkz
	cpSeLrsTn7u2eNttx5YK8DqOWpfDp6KC/3skjpa2fXGTGnRIN0CYckbUj56cGJbf52A=
X-Received: by 2002:a05:622a:2996:b0:4b6:2be2:e816 with SMTP id d75a77b69052e-4d36879b57bmr67953211cf.8.1758710198387;
        Wed, 24 Sep 2025 03:36:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvc+HULoluES1jwdfkJ75V5AO5mrYzrq/vmxtknjaJtpWE6iUTAMZQ0tm+dXZwSY8DOzWdVQ==
X-Received: by 2002:a05:622a:2996:b0:4b6:2be2:e816 with SMTP id d75a77b69052e-4d36879b57bmr67952911cf.8.1758710197936;
        Wed, 24 Sep 2025 03:36:37 -0700 (PDT)
Received: from [192.168.68.121] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3f0e28c83d6sm22815116f8f.56.2025.09.24.03.36.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 03:36:37 -0700 (PDT)
Message-ID: <59aa38cf-2a57-49f2-85bf-157b1e7e977e@oss.qualcomm.com>
Date: Wed, 24 Sep 2025 11:36:36 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] ASoC: codecs: wcd-common: fix signedness bug in
 wcd_dt_parse_micbias_info()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <aNKEZ3VqJ8js208v@stanley.mountain>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aNKEZ3VqJ8js208v@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KNxaDEFo c=1 sm=1 tr=0 ts=68d3c9b7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=-C2JdNfRTmumDSgDQiEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: G3wJt4a7niZNwJ-wwbCzisPTvtax9Ett
X-Proofpoint-ORIG-GUID: G3wJt4a7niZNwJ-wwbCzisPTvtax9Ett
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIzMDEzOCBTYWx0ZWRfXy8HH+n8pVtRv
 PtXTWzDGuz2nfFZPpCwEKoARsSix78InijH0pevtyNZJF8762GEeddy17t9sGg379yfRWA1DhU/
 Q/72mrqxCF6tosMd566AnYTOIpzXYYyExZ3hxOYh5nhZadvtomtME62XOfsnMWoKoUv8z15oqI2
 JoZ/J9+o5ajHehA895kifiSTgPLyvL87alJHEmJ0YHN8rVCu3Wf1iOtioqD8rQWpvhfg1LqNzQh
 yUKXwp4dOOudnHY2hslfZTn45fDZ7b2p2p3DJE3vKNmoC+fEA8qU+2ki+Bt6Xq3ByGjiuOHHpE/
 I7oLPXo1Q0zx6yEU7glaEVx4J1ckd+W61oCc9OcsG0rR4N3TykO83qrqkAc6xaN4yH5FzI4y6o/
 vTOrfBDU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_03,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509230138

On 9/23/25 12:28 PM, Dan Carpenter wrote:
> The error handling does not work because common->micb_vout[] is an array
> of u32.  We need a signed variable to store negative error codes.
> 
> Fixes: 4f16b6351bbf ("ASoC: codecs: wcd: add common helper for wcd codecs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---

Thanks Dan for fixing this,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/codecs/wcd-common.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/codecs/wcd-common.c b/sound/soc/codecs/wcd-common.c
> index 9bbfda828377..9016e974582f 100644
> --- a/sound/soc/codecs/wcd-common.c
> +++ b/sound/soc/codecs/wcd-common.c
> @@ -62,12 +62,13 @@ static int wcd_get_micbias_val(struct device *dev, int micb_num, u32 *micb_mv)
>  
>  int wcd_dt_parse_micbias_info(struct wcd_common *common)
>  {
> -	int i;
> +	int ret, i;
>  
>  	for (i = 0; i < common->max_bias; i++) {
> -		common->micb_vout[i] = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
> -		if (common->micb_vout[i] < 0)
> -			return -EINVAL;
> +		ret = wcd_get_micbias_val(common->dev, i + 1, &common->micb_mv[i]);
> +		if (ret < 0)
> +			return ret;
> +		common->micb_vout[i] = ret;
>  	}
>  
>  	return 0;

