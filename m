Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1EF37C92B
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 09:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779356765; cv=none; b=c3+AnR9d6hXzgANs9Z6IG3khjjm7OwkFhDRumKGbcok9XcuOwW8alsfCuCqZriSPtpwsksy5mdbbWLJENuJcAPJqux0hcszt/8jDWJPJ84zgCcVz0LgXUDkMyngK+zYnTf4MVlmjv6lSF+DkEMc2CXqgsugtfKQUowPvh2FqZ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779356765; c=relaxed/simple;
	bh=hGtbYwpPIlm5fk4l7eabC7OuZYdGNrVAZREmsNFz8l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=db0NMt/yw8WutSS/J2bpOgwOxbA4UHYc/I1R07apzHkR0PVMaxDFuc/u65UpbB0NItJjQxH5XwvnsQcH1ZvhzUoRGA7NjajVWwBMkKnmz/OW788GNZksQYBRDFs+z3hxMDfXClw30VZd4+n6hIH6zrlhxzxsJSCzWMxS32t2N/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCNT7r9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dgvm0YLh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCNT7r9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dgvm0YLh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99iEg3527261
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 09:46:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XDNmhELg8EvsuYL9gAVqpBedxk2dH2CUpsHmIoks+ns=; b=bCNT7r9NExZr52M7
	2Zo0HAtBKV9IT+aNbPBHUU33r7wZQWY4U+BGgMX+LwmnnrxadSiVyaJA9qkVU7Qh
	vYo6uFBp082W5jWc67ehvuNCXEu6hmM0bdroY3xJ3kTFe6dZO887yKI4UvUQe1m/
	4wYkbbdN/9J7oZs8snLXTyzsKVkOpdZBu/k6uLBXtE/fyXlH00l/9jegHhJoel8o
	vzzhKTUTsxzzd1snfzeGUaV3LuitTgrrTgkLE0aLZkovMVAwCk+jjEE4sCGQvELb
	2WPFz1EUFn5qEvs1fPgp46RKaA6ktZOnpRT0W2BrVk5MGEgvtYy7sk5UNQyizqOU
	ffXP0w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbgwm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 09:46:03 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8b7a066ea52so23405676d6.3
        for <linux-sound@vger.kernel.org>; Thu, 21 May 2026 02:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779356762; x=1779961562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XDNmhELg8EvsuYL9gAVqpBedxk2dH2CUpsHmIoks+ns=;
        b=Dgvm0YLhdsv2t57qQGvPkKYbjb7Dtj2vLSLiYA5I+IF/hK0we/I/lWwDNaFzvxM0Dp
         WWoIx4Gn9U8UseaZi8GCw9R9sh+AVA6ijE5AYVu0VhgZkKDBJ7DvHTQDMwis8pR8Fc0Y
         8uefzV7TrUlqYp2Rx1tUYsJC2BU6exPJ++GMIkkqIUEi11OpMH/lkt5hrVx4QC/Y4A1X
         r9L9xDp3Tpv9/pc1hanvgKVBUlCyaupK34jFJqxOK724VfYEWXqjgBSK1tD6aAlSNjlb
         LNCSx0QS8hnizjU9kHdB4mZIpvNg1jdvcAmIg48mqUCfV07O4HFsKJQF9Qck6EnDMjye
         imhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779356762; x=1779961562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XDNmhELg8EvsuYL9gAVqpBedxk2dH2CUpsHmIoks+ns=;
        b=XT05ulus2sDvC4FD89loI6bC4Wf7K7KlX0o2Q4oe81E8c0pjJwJcuUMmeI/itrhutG
         tIpqwVe2CnTmGt18PrugEMsTfLggGOSFMbfTu4TYZUK2eEENz9pR+R3V6Cxr5OvZgvUd
         8866duCjmjdZopO2gyZILqRcSx/O+hCRw4abBv/aqXw/e6xvSnEebXIdttADSDUepXPz
         tdNzlpXQqxMq9F56ZOJpONBYIht+PrF+sJi357ES4hMS8RzxWShYsqpAJPL1MxPl/Mmh
         4bzuWAd4bVSZ04296B3GN22yLGp7AEhxpHwg1mj4r3hxV/t6MdreAtakCnVR7n50KCN1
         N62g==
X-Forwarded-Encrypted: i=1; AFNElJ9GoXBNc0sKHRT3aHQtEkC9uWBqS1YpvFapS71RABlZIVgfSj2HPPGcxezGJCOcIYRcccTfMl3QEOSE3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXhrzsZrrgNtshSYIQ8u6oItNp4aoFL+Dzz4c38MdDp+Yf5e6A
	9381jU6rbjpSvAQXcpeXWYXWBao8XiEeXGDt/uVc3TZZXfZYEL8ktONRn3ak9UNnCvQRA+H0+zw
	GchE3BSaa0ZUBwbr4fE7ztskPY/iFsm7n/bk1LrlOj2e4SI4p/z+BwkLhu2Y//8Wukg==
X-Gm-Gg: Acq92OH1HNZqNXb8BDbsrH+YA81JwC8U0tEttc3OpgJ3lwLT7+YQtDCIzlv4y4mAlvA
	0BvFhc4yZ/0h4IGdoZ+703tokF5mlOGWliRBeJXiZ8ADZxy/FPLt8lrTAHUoemqUm7VZ7TseER5
	eObVLxlhPa1g50vF4it8i71ZBZ0wZmQRKqc7y5TC36E3unTDmrJzDLDj8oiam1WZNLqwKBXDW03
	e+IdtKPfatoFzTuLwXzz9E+FaCd6OgHHgidGLA7rzMkip5s+561pGcs4natZ+XGYjlLklr7+tUh
	M0GO8tBCRXzqq87JvCEVJRXVfcwiqbRZSQaFkYryeX7x67ow66g44ub6VdFWNCEib+fSGUYa+eM
	4YBvbYirTCnJ3Fj7TpjX+enNtj7sBlwPpZMbPMLRCeCu+TRqjGYbhvxWsm7e0WGSl1tYpqHYtw+
	kMm14=
X-Received: by 2002:a05:622a:5909:b0:50e:6311:7380 with SMTP id d75a77b69052e-516c563252fmr18310521cf.6.1779356762438;
        Thu, 21 May 2026 02:46:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5909:b0:50e:6311:7380 with SMTP id d75a77b69052e-516c563252fmr18310341cf.6.1779356761999;
        Thu, 21 May 2026 02:46:01 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc8a40e102sm23330766b.40.2026.05.21.02.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 02:46:01 -0700 (PDT)
Message-ID: <3381259a-1deb-460c-bbde-a97263914e15@oss.qualcomm.com>
Date: Thu, 21 May 2026 11:45:59 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: apr: Check response packet length by
 router type
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        andersson@kernel.org
Cc: srini@kernel.org, konradybcio@kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260514155051.2593354-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260514155051.2593354-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260514155051.2593354-3-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA5NiBTYWx0ZWRfX84q6fWhu2rrI
 fhzffjyS1Hz0jWDEgSZqwDC0Kx7wdGofrcOMnmhXuc0LkwNYmHoZ1lCbzpeKdeKfCfeiWT58UEE
 x4hhFeHsxFF8YJqJXCE3qD06J2j05yhvH8avGHsbfiH2wWaqIZnhlpwoUl9sle/eRfKaFYHjwwu
 wGyF+0cF+JzQH5c3K6pmyzqLjai6BRnfwwCUDinYYHN4rLwE+F1aWIatyV/5HfWF4CA33mj22FU
 IKrdpQfALbPoc6uNMRxVNVexl2SpqD/6Lk9a4saaHwLaJSAIUe7OHdofDbKcvlslIZmhkMtiEiN
 Dc0wItHkoododJnqyZt15nLdEGN125ePIE3LuGLxY+PL/pSMHpzzCH9QARz1p0AIuhUZSXRT6HB
 l13VDXz54Q+3VntRDqsmF4xD54zhb0kn3ErG6ayPHjnOWwTR6tEA50mvozlnWWcmNm/fN830vWV
 mkxbqXWLKE5vnPgl7sg==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0ed45b cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=LHNn7dHNAcYXqiuR6qgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: zfFWYvCsR9FB521Wrzm-SrXvY75qb6pN
X-Proofpoint-ORIG-GUID: zfFWYvCsR9FB521Wrzm-SrXvY75qb6pN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210096

On 5/14/26 5:50 PM, Srinivas Kandagatla wrote:
> apr_callback() currently validates all received packets against
> APR_HDR_SIZE before queueing them for the RX worker. This is not correct
> for GPR packets, which use a different header size.
> 
> Validate the received packet length against the header size matching the
> packet router type before copying the packet.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/apr.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/apr.c b/drivers/soc/qcom/apr.c
> index 127204c195ea..68b357462438 100644
> --- a/drivers/soc/qcom/apr.c
> +++ b/drivers/soc/qcom/apr.c
> @@ -165,9 +165,20 @@ static int apr_callback(struct rpmsg_device *rpdev, void *buf,
>  	struct apr_rx_buf *abuf;
>  	unsigned long flags;
>  
> -	if (len <= APR_HDR_SIZE) {
> -		dev_err(apr->dev, "APR: Improper apr pkt received:%p %d\n",
> -			buf, len);
> +	switch (apr->type) {
> +	case PR_TYPE_APR:
> +		if (len <= APR_HDR_SIZE) {
> +			dev_err(apr->dev, "APR: Improper apr pkt received:%p %d\n", buf, len);
> +			return -EINVAL;
> +		}
> +		break;
> +	case PR_TYPE_GPR:
> +		if (len <= GPR_HDR_SIZE) {
> +			dev_err(apr->dev, "APR: Improper gpr pkt received:%p %d\n", buf, len);

It first says "APR:" and then "[ag]pr" later, please at least make the
case consistent

> +			return -EINVAL;
> +		}
> +		break;

Switch seems a little far-fetched, unless there'll be more packet types

Konrad
