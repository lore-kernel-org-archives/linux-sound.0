Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2162F4EC66E
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 13:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787783; cv=none; b=fkxTkyPvzs7oEq1CF3HSIXQeTVFstYXw2lS6UbYxj4KhUFvoE5gjYU2do26ObZBnGNAp4/GF3JDV2uIjudTsX4gmMIsd7zRFEvG+Z51Xr7Vm4yfkwZG0s3pF32tbFQC2O0wjGxNEfM+J75ayj+aysuGCWhx+5SsOHDnLW8TBTcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787783; c=relaxed/simple;
	bh=jA0VsMUUavJKtE9n5wNLQVqTwGtt9aIsR/LRrizujh8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DcFsYb4FxzD5LLhHb/1jfgbQ8yNRnLUgrmU5P5rZ3SnB3STRJhMEf8vf4iwKxOVMRuvX9LKMf+Al5QAGkXoNHX+G0t5x9jSA5lCT470Db0H24GYUkkk0t5mNGqemOBXFEIWpF1RfwhMF6QXjfLNAiHWWZcUlJ3erTfp+EvSEKZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cRHA0+ZE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAsjK7kA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cRHA0+ZE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eAsjK7kA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amsfs3872704
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 13:29:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KPabHJe2uEoaLCJGTNSlEHvoZ5WHakoD59v+reCVI7s=; b=cRHA0+ZEovS8bpvM
	X8CixLyXCQDok88Mg3xZCWnHCHSVI1liJrNNYoZ0OtSqRjJQeCFHQGhUyJQBeUSU
	q9rELWYXdcoN4TDZoMa/z7meJQypuGDrNp8u2Rh+6yzAeQNw4djBeOPVkhU/gGZJ
	sUo5MdZvBpChqAlXKQyvYK212NPEk3/XaoH1N9gwoYb9LUc5aJ+FtIHpSvwaf6Ak
	ttmDggYOn6gZQz97SmcDODZfuqvcgtOhfptXB7Pnm2wrsn7RTqHMrtVFTEdrPXE8
	6Q2cRLb0Xodg0gzzKMS4kYHF4TaMi0obWiKHy2cMp+XNDFSImt+PSWqBfqjmgND7
	wm0Fxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj26py-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 13:29:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93915f50a5cso908198385a.1
        for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 06:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788787764; x=1789392564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KPabHJe2uEoaLCJGTNSlEHvoZ5WHakoD59v+reCVI7s=;
        b=eAsjK7kAlJcuQ1XY99w/edoG4GsPFU+SpqeAq2adxwn4d1CL6uC0e5Hvz2D2AijPnf
         jMpSVHJwdnWxjUxr85M/UNxTI66GySQVHfRrZa7Wb5LTOXo0Zp+7Ti54mWINmel+WnVD
         veZdDpO/DPbknflmCeGj/rhn63Ol1sX+z1+MZqQtbN6vVT9DBPTiUSkJuLipX41bCZpr
         1l1vWt7HXBQrpXeNYwnIV5jF8EoL8EPnRZOOaZHLbY8KULKTrikVIcX6gL4/UEHqUYQ8
         Ey8ZP42K5pC1yhYi3EfomkblsB3fbcnbqpItMH4hItDNmBn7j8VxHevWaxCsD0i1+w5N
         6+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787764; x=1789392564;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KPabHJe2uEoaLCJGTNSlEHvoZ5WHakoD59v+reCVI7s=;
        b=FbW0v0IbYOMeWcIICK6J4EmpcBRP2Wk3xDiUWTdNGoeXhV+7wmhsjf/aM1naqLa4f1
         Z4/9FWHvVmfe72MDvP3CE7akdUAFJqHfl0MeAZ8WQqVdJeYQHL/lKy20JCe1IyAaxMGX
         /oFWl7Z5wgKgvOk62HBhIw7d9nrHG2XQgQWvb0XyW9DYTsd1cA3iCjZJ5aHdBXhkNG/n
         YrVPCSbFE5diRlcIL3gNwqwINx6kB9z+LzNTGagR+gP2yq4CMwIdIGyhXJWGXJ53IVOR
         Bi7dJ6DegK1d+Ql/NCsoDnzWmmSMcGePsevwmKZ4vaWK2JvSHZiI/anCQG8VXI/dIdoL
         Ufbg==
X-Forwarded-Encrypted: i=1; AKwUvBzYggSFirjx187qCDBUJRU85AS2gvsZlvNf+01GHFvkwRD+7RAtJzUkcsQ1/GK9RZd29s0iAKGtnWdYsQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n6o3ZLJp/Ide+58tAJXma83p0fif3wzlVCdD05UVEzZ0T4dSOn
	Y1RbWPyVFOyxGZPBjqW6g0koF8RgGHdsu8sHF9Z02ZxoEMUj2LeMGxw4fAWWcgLByWY1Tf7q1lC
	CVs2Z+vYCJrOpzylFGy/QFHUH5O0E49kCTJz3JmuPW9j0Plb+EWakteqcSIR7muRfIw==
X-Gm-Gg: AYBFou2yGnh6n0rC7EtyZmvdI5kN5Fj2UjHXjCa/n5kStVmHUmLMI3EC4iUOYFoXyXC
	cquJ+JcYgyDmciqNjWbpOhaQZGVpwPBiVeU08LgpCuQXs/FsOFKnUn0rDr+2HzHUHpSuQdI4mSh
	R3CI4LziYeh5VxfOa94yhqLAER04IehixSmt9dwSbvk6E8aemuxX5wVNP0VafL6k8N75jfy/GQr
	whyJNygfhmeDxUqUemq/d15IEwfsOww1DnZBnl3bZ7rN8bH5nZ/jeN+Lxa5iLzFh2nJe7dhmoVz
	+FQ7A4zYV7LffJvJtzV06Mw6TEypO1WQ/9UEW9L5/RhMCzuyETX6j4vJdfnbOF1ndkjXrtDFlVM
	3Om4OCYHVYhSLuvGtvS7CKYls0dY=
X-Received: by 2002:a05:620a:711c:b0:939:a8b1:3696 with SMTP id af79cd13be357-939a8b13b38mr523950685a.27.1788787763414;
        Mon, 07 Sep 2026 06:29:23 -0700 (PDT)
X-Received: by 2002:a05:620a:711c:b0:939:a8b1:3696 with SMTP id af79cd13be357-939a8b13b38mr523943585a.27.1788787762788;
        Mon, 07 Sep 2026 06:29:22 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e6bf337bsm4257821a12.26.2026.09.07.06.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 06:29:22 -0700 (PDT)
Message-ID: <0fb5ce44-9a47-4566-bd74-20be928ad554@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 14:29:21 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] ASoC: SDCA: expose class SoundWire
 probe/remove/read_prop as library
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-4-srinivas.kandagatla@oss.qualcomm.com>
 <836db10c-8d0e-4882-b0be-3add5069566b@linux.dev>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <836db10c-8d0e-4882-b0be-3add5069566b@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0OSBTYWx0ZWRfX+K0gyAt3BgIc
 hX8Gm7B2WaIuZaMJX3J4BMaNvO8E309xYemW9zhtfZcEzu19LV170gTWdFmnKNJNwcHaYHq42p4
 yoQ0UmuRNOdZEp4mWHNLHf8Nr/lRn0uUuxMYo6+hKe17yjkj7GtxOfVilY/cfWMllHLKdy1uF/J
 AkmBWhLwSabYXST874yfmP4utXdFxpHkbL2lOQWc15LIqmHy4O2G9iiuX2N9+cOsSqa8Dr+rCPn
 pwUN6E2CV6ddvSIsOw+ySPYII44MtZU5WditMUVqC4zEvmyVWiRoIuPRHVjHxafqq1AZ3ZfXokQ
 t0H9zEC4ExNxxdwlysdGAtpu9PucAqDzSGx4xiblcBozBI/63EmVTdvBbdAshe7q2OWiwEffKNi
 fHTJ56kPe+UkbtL2YgwQ7OCxZlmVoRBWdD5rYoRBUf/ZfJK+E3D7YID78DKYhrSDwJp0JopxWt0
 MbTMplfUctCdPZQuZBg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0OSBTYWx0ZWRfX0d2AdDS9wBx8
 GxnTlzy8wqheWc5m+StxgXa15206NEBBK0jvNn1Tprso98fn9MPMa2CGJM68UdGWVjxWZRmzPMn
 o0IsxwpGdbfQZFNYEbdOjHoXO/9lfRU=
X-Proofpoint-ORIG-GUID: oPMnCCOX-9lz2OMtqQ9Fg-wNJFrM1_RN
X-Proofpoint-GUID: oPMnCCOX-9lz2OMtqQ9Fg-wNJFrM1_RN
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9ebc34 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=30GPOdLKL6Ocfv1y0QQA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070149

On 9/7/26 12:31 PM, Pierre-Louis Bossart wrote:
> On 9/7/26 10:37, Srinivas Kandagatla wrote:
>> Split the internal class_sdw_probe/class_sdw_remove/class_read_prop
>> functions into caller-friendly library helpers:
>>
>>   sdca_class_read_prop(sdw)
>>   sdca_class_probe(sdw, drv)
>>   sdca_class_remove(drv)
>>
>> The class_sdw_probe/class_sdw_remove callbacks of the built-in
>> class_sdw_driver are now thin wrappers that allocate a bare
>> sdca_class_drv, stash it in drvdata, and defer to the exported
>> helpers.
>>
>> The exported sdca_class_probe() takes a caller-owned struct
>> sdca_class_drv * so codec-specific SoundWire drivers can embed the
>> class state in their own priv struct, own dev_set_drvdata() themselves,
>> and avoid a second allocation.  No functional change for the built-in
>> driver.
>>
>> This lays the groundwork for codec-specific SDCA SoundWire drivers
>> that want to compose the class-side probe with their own quirks; the
>> next patches add the hw_ops mechanism on top.
> 
> I am not sure I fully understand what you mean by "compose the
> class-side probe with their own quirks".
> 

I meant having their own probe and callback functions to add platform
specific quirks if any, before sending it to sdca core.

> The existing SDCA mechanism is that there's a top-level SoundWire
> device, whose driver creates auxiliary subdevices for each function. We
> currently probe drivers for those function devices based on naming. So
> how would the 'composing' work then?
> 
> I guess part of the confusion is also the recurring 'codec specific'
I agree, I will try to be bit more clear on the comments in next version.
> term used in several patch, but we are talking about functions which are
> subsets of a codec, no? maybe use hardware specific.
> 
those function drivers will never be touched, all the hardware specific
bits will be in the respective codec drivers.


> Note that if you need customization to the base class mechanism, there's
> another option that's currently in use in the other OS that shall not be
> named. Codec providers are not allowed to change the class drivers,
> which are owned and distributed as part of the base OS. Codec vendors
> can however provide extension drivers. The premise was that the sound
> would be 'acceptable' with class drivers, and the extensions would
> unlock the secret sauce algorithms for the best audio quality. If we are
> talking about 'composing class-side probe with quirks', it'd be good to
> clarify the rationale and objectives...

The intention is to use generic class drivers as it is and not modify
it, which is what the the whole series is attempting to do tbh.

There are no such quirks as of today atleast with two Qualcomm SDCA
codecs that I have tried (simple Jack and simple amp).

But infuture if we require either quirks or some vendor hooks these
could be easily handled within the callback hooks.

> 
> edit: I think the idea is really to use the class function drivers as
> is, but with the function data provided to and used by the subdevice
> driver probe. But the hw_init doesn't seem required to me, you already
> have the .status callback that can be used to perform device-level
> initializations.

Now that all the callback functions from core are gone except populate
on, only static table is passed to the core.

--srini
> 
> 
> 
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  include/sound/sdca_class.h  |  5 +++
>>  sound/soc/sdca/sdca_class.c | 75 +++++++++++++++++++++++++++++++------
>>  2 files changed, 69 insertions(+), 11 deletions(-)
>>
>> diff --git a/include/sound/sdca_class.h b/include/sound/sdca_class.h
>> index 15a180385202..c6063f22be7a 100644
>> --- a/include/sound/sdca_class.h
>> +++ b/include/sound/sdca_class.h
>> @@ -33,6 +33,11 @@ struct sdca_class_drv {
>>  	struct work_struct boot_work;
>>  };
>>  
>> +/* Library helpers used by codec-specific SDCA SoundWire drivers. */
>> +int sdca_class_read_prop(struct sdw_slave *sdw);
>> +int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv);
>> +void sdca_class_remove(struct sdca_class_drv *drv);
>> +
>>  /*
>>   * PM helpers.  Codec drivers embed sdca_class_drv in their own priv,
>>   * own dev_set_drvdata(), and compose these into their own dev_pm_ops:
>> diff --git a/sound/soc/sdca/sdca_class.c b/sound/soc/sdca/sdca_class.c
>> index 88a29116a334..b952fa6eb802 100644
>> --- a/sound/soc/sdca/sdca_class.c
>> +++ b/sound/soc/sdca/sdca_class.c
>> @@ -24,7 +24,15 @@
>>  
>>  #define CLASS_SDW_ATTACH_TIMEOUT_MS	5000
>>  
>> -static int class_read_prop(struct sdw_slave *sdw)
>> +/**
>> + * sdca_class_read_prop - fill SDCA-common SoundWire slave properties
>> + * @sdw: SoundWire slave
>> + *
>> + * Exported so codec-specific SoundWire drivers can invoke the SDCA
>> + * common property setup from their own sdw_slave_ops.read_prop, and
>> + * then apply codec-specific overrides inline.
>> + */
>> +int sdca_class_read_prop(struct sdw_slave *sdw)
>>  {
>>  	struct sdw_slave_prop *prop = &sdw->prop;
>>  
>> @@ -36,9 +44,10 @@ static int class_read_prop(struct sdw_slave *sdw)
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_NS_GPL(sdca_class_read_prop, "SND_SOC_SDCA_CLASS");
>>  
>>  static const struct sdw_slave_ops class_sdw_ops = {
>> -	.read_prop	= class_read_prop,
>> +	.read_prop	= sdca_class_read_prop,
>>  };
>>  
>>  static void class_regmap_lock(void *data)
>> @@ -136,18 +145,31 @@ static void class_boot_work(struct work_struct *work)
>>  	pm_runtime_put_sync(drv->dev);
>>  }
>>  
>> -static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
>> +/**
>> + * sdca_class_probe - SDCA class SoundWire slave probe helper
>> + * @sdw: SoundWire slave
>> + * @drv: caller-allocated sdca_class_drv storage.  The caller (a codec
>> + *       driver, or the built-in class_sdw_driver in this file) owns the
>> + *       allocation and sets its own dev_set_drvdata() -- the framework
>> + *       does not touch drvdata.  Typically embedded in the codec's own
>> + *       priv struct so codec drivers can keep per-slave state.
>> + *
>> + * Codec-specific SoundWire drivers call this from their .probe after
>> + * allocating a struct sdca_class_drv (usually embedded in their own
>> + * priv) and setting drvdata to their priv.  The framework fills in the
>> + * sdca_class_drv fields, sets up the class regmap, and queues the
>> + * deferred boot work.
>> + */
>> +int sdca_class_probe(struct sdw_slave *sdw, struct sdca_class_drv *drv)
>>  {
>>  	struct device *dev = &sdw->dev;
>>  	struct regmap_config *dev_config;
>> -	struct sdca_class_drv *drv;
>>  	int ret;
>>  
>>  	sdca_lookup_swft(sdw);
>>  
>> -	drv = devm_kzalloc(dev, sizeof(*drv), GFP_KERNEL);
>>  	if (!drv)
>> -		return -ENOMEM;
>> +		return -EINVAL;
>>  
>>  	dev_config = devm_kmemdup(dev, &class_dev_regmap_config,
>>  				  sizeof(*dev_config), GFP_KERNEL);
>> @@ -159,8 +181,6 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
>>  	mutex_init(&drv->regmap_lock);
>>  	mutex_init(&drv->init_lock);
>>  
>> -	dev_set_drvdata(drv->dev, drv);
>> -
>>  	INIT_WORK(&drv->boot_work, class_boot_work);
>>  
>>  	dev_config->lock_arg = &drv->regmap_lock;
>> @@ -185,14 +205,47 @@ static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id
>>  
>>  	return 0;
>>  }
>> +EXPORT_SYMBOL_NS_GPL(sdca_class_probe, "SND_SOC_SDCA_CLASS");
>>  
>> -static void class_sdw_remove(struct sdw_slave *sdw)
>> +static int class_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *id)
>>  {
>> -	struct device *dev = &sdw->dev;
>> -	struct sdca_class_drv *drv = dev_get_drvdata(dev);
>> +	struct sdca_class_drv *drv;
>>  
>> +	/*
>> +	 * Pure-generic SDCA parts: no codec priv to embed, so allocate a
>> +	 * bare sdca_class_drv here and stash it in drvdata for the
>> +	 * built-in PM ops to fetch.
>> +	 */
>> +	drv = devm_kzalloc(&sdw->dev, sizeof(*drv), GFP_KERNEL);
>> +	if (!drv)
>> +		return -ENOMEM;
>> +
>> +	dev_set_drvdata(&sdw->dev, drv);
>> +
>> +	return sdca_class_probe(sdw, drv);
>> +}
>> +
>> +/**
>> + * sdca_class_remove - SDCA class SoundWire slave remove helper
>> + * @drv: caller-owned sdca_class_drv (the one handed to sdca_class_probe()).
>> + *
>> + * Cancels the deferred boot work so devres can safely free @drv and the
>> + * embedding codec priv without racing class_boot_work.  Codec-specific
>> + * SoundWire drivers that call sdca_class_probe() must call this from
>> + * their .remove with the same drv pointer they passed to probe.
>> + */
>> +void sdca_class_remove(struct sdca_class_drv *drv)
>> +{
>>  	cancel_work_sync(&drv->boot_work);
>>  }
>> +EXPORT_SYMBOL_NS_GPL(sdca_class_remove, "SND_SOC_SDCA_CLASS");
>> +
>> +static void class_sdw_remove(struct sdw_slave *sdw)
>> +{
>> +	struct sdca_class_drv *drv = dev_get_drvdata(&sdw->dev);
>> +
>> +	sdca_class_remove(drv);
>> +}
>>  
>>  /**
>>   * sdca_class_system_suspend - SDCA class system suspend helper
> 

