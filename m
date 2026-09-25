Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568FF4483AC
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 20:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790368137; cv=none; b=Ueu15T9mLaEI7gyh5GXFjVaRO1+6xxXsKn038WjCM/7Hu1DcN/EEc0knWeiF3948qi+VZ9jgNOgbCCRzaAv2D4FT4iaZRADrbd6witbOJp9vut0FctytkDYPtcM9AVM2Eegs61bqYrVCbcuHUoJe8cslC47OZTx1seMe7uKqa9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790368137; c=relaxed/simple;
	bh=5fShnnoriXDSFjno6iUPpU5yLB7IRZwuhDOkWk3b+s0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MkyJ1hGFwNvggBxgxhSgCCxskLkTM3LMo6ijUMaBweg18hmVl87L3ikinv6HH9iDFSRUDRPrWp9u+/6o8u3wOHAGuy5qoVmb5wkBQwXdt4MuVoHnHZBMobfJk2j8XGEECYxxvmVM0z/XjOYE2hsFCzTC1Z4JgLfhwo+mG/NFYwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SByuu/Xl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yz5Adm8a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SByuu/Xl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yz5Adm8a"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PIoG9j1733396
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 20:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oSB1zv8lUGPCqbfvSMMMcjcivsocAtHZ2FPmhXQguZ8=; b=SByuu/XlXUq4LIC0
	kpbi3Xls2siw8g50yiMRNoAcQtdLo10qPuFYYPNkQc9jb5N1E16Ck7mN3+QIE2CM
	gDWvR+XxL9JlmuJ+I2HSWDXfIwWIPj/2snxyCS/CMhuMNXwrM94ZK2sH1g4KKRPn
	X44pubMD8YWL7Ucy4gzzxKwbVlKWefn9bQtZ1Z0frnVgAZ1UV63bia/A+y5f4wT4
	JQqd2J2hVDmNOqwGjIpDm5EzgUzv56yuYBZ4xvvsqFJVEl31MyXH0o6GynlSy5MG
	SPmoEHijcWrj13J7mVc3IWUhIW64xTg8Urb2aeSldJFjN9unQ3TtxIOnHaXzqx99
	shbYXA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvnt6fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 20:28:54 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so273025385a.0
        for <linux-sound@vger.kernel.org>; Fri, 25 Sep 2026 13:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790368134; x=1790972934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSB1zv8lUGPCqbfvSMMMcjcivsocAtHZ2FPmhXQguZ8=;
        b=Yz5Adm8aG5P0Z8SDxt6n8hVAlboW3LONN4nxbFZxQikMf7a+LHZE2orW/JNWinLSne
         KGiD9PRS4+7h/K6Hoxa9uE3dLo21v7JKby08uoIqV4F+ZpKdytiZF33fjsHOd3IvwASI
         Hidn9WciWBls2WOLOU8Ch1lz3qivcb8Rd/P2RDwhv+hDPBYnYIKgoJ2O6DsGGzfhGxJb
         dUup8mk+ALZ1ObluoGoes/1M89Iziyfvgu4etyooYJgZFE9k1cfn6GPBIW2jktExviml
         WDxLHrGbLbdoiJRTrVnecBxFJD8jieeBidNSuqoIb5/+WxUG3qhMnBNPDaUKsGwCwYVn
         24RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790368134; x=1790972934;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSB1zv8lUGPCqbfvSMMMcjcivsocAtHZ2FPmhXQguZ8=;
        b=2r7w9vWHs7YHiad1GiZQthQP0iLTTJDgDY8GQlg72eyw+FdzmnAK/SvnkP4pvy6zpi
         x/Yu2wuCgbgmIT3FluL5mj0i4sJsdLHII888WUWishuL9yxYka1Fk3HnN7ydWmwR444+
         hb83jNsC4XG3irw/En4TEwnHFltp3hrwKxchk6GAzNuDGNimkVYM3V2NJHP8XqEGHNpm
         P/pPyp6xhPHj1XUJwZ2uYybGee2gRBiEsc9XCHzhas/1+II5UAEovNFLbhb6w+lLsYP+
         KaqiwaqAqLLZBLIDjIz4kKvREMgw8kOCueepMI543mEyB6i/LA63KWMabB0YCzw4EHrJ
         q84w==
X-Forwarded-Encrypted: i=1; AKwUvBwsTAo1Mzo7ttSDQiAzk5sCBORkErXtFRVGmzhzn6fqyhEHKaXAVdWQk/NTOWeYJqmkzkSL6xuvcUJENg==@vger.kernel.org
X-Gm-Message-State: AFuF++kFpQkmCweTcHsnGySAzw40JPXLl+eyfUQFB4BdSavus1m7GWfk
	N82MW5kyVceav2kGhRJ0cSQuYH6BG8iWyoM0YDacr2Fbi5n1+VIrf6hsF6H1Jk+PhSzLf3zVPds
	0CmSV9Zo8iKdCesWhLiMUvWgmlvlDX/0ulQE4/jOYEaU+rl//ccI0XzKKLPitq8WgTg==
X-Gm-Gg: AYBFou20qp3WGuIXjlvVdxBPIZr8JEQPE/dPcnDmoj/9DAswN+CIHdxG0HSUFK5egjq
	jt6vutX4b8IacIKx8izqVZA4NOR3dgfhNccbpJ6/QbfKe/rPq3cF1PNgRMCLkcJxrjqtPVqpcsD
	2vbPOQKBaVy4qA2OtFZwcskluJwHI8sCGKldYwPk9XVNRwBzxbohgBYh9afzX8uOk7Lchy54Ibu
	F9qFGeO69bvGb2lnwlTYsVv/OKGWuwTQrXi7y60gyim+EvMhoDTcySfM7r+qWW6/pb4ZYbJPdF5
	1oEQluij9lVj+5XBssFJ4oEvHsdnbvVRNh9fhMpPY+rFjFJF79MGzHdsdXMUD/piEcDNiOMqBoc
	PqPN7m4z835Nx/sYlF4VEuT7cFQ==
X-Received: by 2002:a05:620a:4692:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93c43be3c72mr685814085a.25.1790368134198;
        Fri, 25 Sep 2026 13:28:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4692:b0:939:c1d4:e2e1 with SMTP id af79cd13be357-93c43be3c72mr685809385a.25.1790368133755;
        Fri, 25 Sep 2026 13:28:53 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49fe5dfa6a7sm275845885e9.12.2026.09.25.13.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 13:28:53 -0700 (PDT)
Message-ID: <43a45cca-e214-4f0b-a026-14da8b33b3f8@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 21:28:51 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] ASoC: codecs: add Qualcomm Tambora (WCD9378) SDCA
 codec
To: Mark Brown <broonie@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
References: <20260925161049.758913-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925161049.758913-8-srinivas.kandagatla@oss.qualcomm.com>
 <e3797f4f-2e46-46ff-99ff-6ba9324bb427@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <e3797f4f-2e46-46ff-99ff-6ba9324bb427@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KNwWyS_JFuYB949yilIaHNhFdl_5a6OM
X-Proofpoint-GUID: KNwWyS_JFuYB949yilIaHNhFdl_5a6OM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA4MSBTYWx0ZWRfXz4p0R22SUBdj
 zyCWEA6Y34Ti/bHjzOrwQxMwp8GK0n06RyhVcfh6sPx1cXfRXMj/JykNzi1z0nlk3AOaGRYTdb1
 1k0UJYUh/Q45IX1RAj/kiF0Ts7h9Jlo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA4MSBTYWx0ZWRfX+efUGg3M/RTz
 onuxU6kecn3rUJ/zMCtSUAidbF2FfxEAzFdy3eA21RLSUb6xzx7J8uX8CDilT2wfdpLxK3ut1iO
 /OjJPb5IHOMm+81xgPSr+qtAmxUDzziwAP+XsDAz6BGZyiqMgJeIhfKF43ezz52lcOxypXtXdCV
 dmqOt6gkI5Wzavn9bPncBsWk9zyF/2MM9HIE7pzCAYPdvMex3lB4uk1GPhsvXD75orxQl5haXNE
 Ql9VG+arX9m5BzN+fRfV6R8S/3vKWTDjmIvhwMAh8G/5jmmfldthYCAgxJ8vjEoGKUGJDqJzq7D
 eEGnrUukiV3DvH8oB6KOWStgBHpXblwalQeULgY+mYMQ4DwK+KSe2LzvP++qvwxkc9tQIpsV03Q
 Uguf0XfuC0FzJHIwVvazWkAqnx5v5eYfUQHKVlMEz+he3kr+s0Bub+3GR17fv8FR19fL/N1Nghx
 I/WM89WPQH5ruwiSQLA==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab6d986 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=naP4cl9ZAa0KIA1VvjkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250081

On 9/25/26 6:31 PM, Mark Brown wrote:
> On Fri, Sep 25, 2026 at 05:10:48PM +0100, Srinivas Kandagatla wrote:
>> Add support for the Qualcomm Tambora (WCD9378) headset codec in SDCA
>> mode over SoundWire.  On ARM/DT platforms without ACPI/DisCo firmware
>> the SDCA topology and SoundWire port properties are supplied as static
>> data through the codec driver.
> 
>> +static struct sdca_control entity_fu6_controls[] = {
>> +	{ .sel = SDCA_CTL_FU_MUTE, .mode = SDCA_ACCESS_MODE_DUAL,
>> +	  .layers = SDCA_ACCESS_LAYER_USER, .cn_list = 0x6, .nbits = 1,
>> +	  .type = SDCA_CTL_DATATYPE_ONEBIT,
>> +	  .interrupt_position = SDCA_NO_INTERRUPT,
>> +	  .has_reset = true, .reset = 1,
>> +	  .label = SDCA_CTL_MUTE_NAME },
>> +	{ .sel = SDCA_CTL_FU_CHANNEL_VOLUME, .mode = SDCA_ACCESS_MODE_DUAL,
>> +	  .layers = SDCA_ACCESS_LAYER_USER, .cn_list = 0x6, .nbits = 16,
>> +	  .type = SDCA_CTL_DATATYPE_Q7P8DB,
>> +	  .range = { .cols = SDCA_VOLUME_LINEAR_NCOLS, .rows = 1,
>> +		     .data = range_fu6_vol_data },
>> +	  .interrupt_position = SDCA_NO_INTERRUPT,
>> +	  .label = SDCA_CTL_CHANNEL_VOLUME_NAME },
>> +};
> 
> Why do only these have nbits and type?
These are the the controls exposed to user as mute and Volume.
Looks like asoc_sdca.c does not use type and derive nbits, it directly
uses control->nbits. We can add the conversion in framework, if that is
something preferable.

--srini

