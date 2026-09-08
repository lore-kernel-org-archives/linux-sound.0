Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D7C2F5337
	for <linux-sound@vger.kernel.org>; Tue,  8 Sep 2026 18:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890431; cv=none; b=cuSUeyKCt6NmMdG0EY7reoOoeckG2N9D4MAY9iy5cyBWpO6+ti4B6Jhjtzr5o/9KVNbciXTLu31dmdfLJGn6GQ1Ee6fbImEESBCHcUnjFvBgNfjWjNdUPoi/XqnhrEy05QY6jo1NmmioWMWtJvsiJf8Re/rAUSNsR/6xPU1yn5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890431; c=relaxed/simple;
	bh=u6wdLrwyQiDIzovivnZzvX58qPuV0kVPxqekCK0IXbI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j27rQVRAWeIRKp/Yrbhuu4JjQw0FkMZtau0Xd7oK3TIL8XYL50CcyEpc0rXotLACuRiYXoyKTIi4vuUyhclgMdDP/rSaX/vwZ9kRY/G+zvecLJ2NhP5rSsH8rqRbzOLcLEFsbxT1UnGxgSLpZdn2fOvjw73dDOkztLbmD3s68OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kW8Trzvj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NxME9Uuu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kW8Trzvj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NxME9Uuu"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Fdn502770615
	for <linux-sound@vger.kernel.org>; Tue, 8 Sep 2026 18:00:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vhI9rygEQ39zKq79+luFBhgAUw/Dcbm5V35+xL/RCJA=; b=kW8TrzvjT2qUPcfu
	rNaAwgnSOWf4omgbMnL0JcwwaNJk2ib3IuRgaJMbQot9CDtjlPRQ7KiE+mPkLChI
	bTeWO13CACG/B9zSVPWyU7xVJpcP7KEgo9HJ5WX5sezviZwANh1RWjYHJWvyG7U3
	F6n0hyqeaq6G8JrSPe6wXKuLygTtreblbatOSxIPmbX9RaZmOfvj75aKv/OoIzXP
	tCVdULIUNuu7GATTgTrWY+lnG92ki36k+vDWXIurtQQR5gudaMmAlgYk6zbuZn1v
	ekCUkWg27fyzJWbcH7EleOYOsEjJFTo4jWQaP4Jwil8IjSk4wGv7/8QnutLq7aVX
	Y3bAQg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvuhfms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 18:00:27 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6b85fefb1eeso2677281eaf.3
        for <linux-sound@vger.kernel.org>; Tue, 08 Sep 2026 11:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788890427; x=1789495227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vhI9rygEQ39zKq79+luFBhgAUw/Dcbm5V35+xL/RCJA=;
        b=NxME9Uuubk1j9FgEiklZu/0KeL0SFgb1/GXHOrIxfcc1mVzo3cJ45azEW2dPqHTRPj
         zNpHoIam2mIPQUwaETCA0mYJXYGrnfDOJFv+6XFVGoS4RUUqXVqzJFTVGvWRCYoV/qee
         UxG1Oz32YiCEgvuAtd5raKlqTXjVZssdNdEe2l9ZB+b5QXeEndguNNDBJezgSNRcSIG3
         ceTVjdiwuFjHCFZcxvQhaSxMMvmOecaNfl+RaUIdFmKoGVRZU7t2WqdKQhnwgzhKZVXf
         Z98Y6G3/QNJnX+y/j6kkX5fRkVDT64slzbJ4Z0p3yxjEJt1W5iGiD1zRLMVc3yaTr71M
         fbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890427; x=1789495227;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vhI9rygEQ39zKq79+luFBhgAUw/Dcbm5V35+xL/RCJA=;
        b=SjaANIHlsRG+2c8ZYyGXCpN1UAuxQHajCx5IB6CsumT+Wl3iJxBUKNlINVn+rLpCJ8
         9PMkLdtCdjr8kUXrlmrhF/+fbIZzqSlZSFovMCXzNL1CuDn7JDhuNXU08uEN1gPIRihW
         VlP/moGLGDy7zvza3PYYCfh6UErgbKvkAintdEENSnD/WLzpViVilKSOshozCQDrRZVa
         KuA/dQssjIlszi+dzcjvYMp9cm3Z2+m61E+1swq2zMzAFAsA5+hQ8fguvsZNhvM9OAmV
         35uYuLTmX17/kaTZPELPkPkUpmUnmFGcrluZrBMpiXM3CgoCZ95DQjBDGeyePa5Zo+Wx
         9MKw==
X-Forwarded-Encrypted: i=1; AKwUvBwDRWQU36aeCAuG/vW6qGzCI9AcumCh6hsZF0s4SOj+5BX1trewi0iDvy8swQNYK3eyai7aHhehUjM+xA==@vger.kernel.org
X-Gm-Message-State: AFuF++ks6OV+d+ZjvB8jjIt8xLp33iBO2xAySTDYCj7azv4xbn2oN0km
	Iv2Cq0L0eHuyMa5adiwukgqEk7QUVJhQ+gxOHd5jtS2hGDN+TTY5SdSjvy9nXzFl0dcM8JS1EMB
	TK0WsLXFQRVG37cVRE55kREAlptACfdfu/82fT1jJoEaxnM+xZD8xwKfLvJIxqjRPHg==
X-Gm-Gg: AYBFou3BntoeS4VbxQGCFDPFp1x6S/bltzLq1pssp2I95dedA29By2A5mPkruZSjMf9
	UGLYwo3tF2VFevRN4MfVTkPJPTdib/wGonBg5xbg0MQxzuhfN49pSdBEUluJyPS+kb56nM1kqek
	LdzSd0/cj8F3fVfLFJMyCztUvtxLyGOIEiIhivpGPMRzHtZYXSQUEGPYMcR5e74o0Mn2qq4zT4U
	6KX7VVj5aVBT9ozButPamGEphvHG2EZRerAItIqIu+hY8tzNEdHKN0hRVxVur5nXYheJEUP1Nu9
	Xi1etWITqfk/sSNdzeugAmjHToD1Nz2EPFUVK3fbZcA0wFtCxoN9oqOH9EchjhQC94+rIvbGO7d
	XArnLtUXiXdARqjWZ8cK+GlJxaCE=
X-Received: by 2002:a05:6820:81f:b0:6b3:697f:9f1c with SMTP id 006d021491bc7-6b6fc7d2ba9mr29068674eaf.8.1788890426695;
        Tue, 08 Sep 2026 11:00:26 -0700 (PDT)
X-Received: by 2002:a05:6820:81f:b0:6b3:697f:9f1c with SMTP id 006d021491bc7-6b6fc7d2ba9mr29068622eaf.8.1788890426281;
        Tue, 08 Sep 2026 11:00:26 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 586e51a60fabf-4760cec8679sm10736429fac.5.2026.09.08.11.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:00:26 -0700 (PDT)
Message-ID: <f1e80aa7-2d92-455c-b7d6-484fb353e01f@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 19:00:22 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/11] ASoC: SDCA: add populate_function hw_op for DT
 function data
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Maciej Strozek <mstrozek@opensource.cirrus.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Takashi Iwai <tiwai@suse.com>,
        Faiz Nabi Kuchay <fkuchay@oss.qualcomm.com>,
        Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260907083727.733705-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260907083727.733705-6-srinivas.kandagatla@oss.qualcomm.com>
 <aqA29pv18mXzTR0G@opensource.cirrus.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aqA29pv18mXzTR0G@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Q7spN61t3GtGOxjyRJG0YPOXcLBldUBC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE5NSBTYWx0ZWRfX/jPORvl86G+U
 ROlTfOelaSjuXFmq/rSAlOk2Uj7E6hwP0+Jbz7H+Xti6elwd/oFMGx5MsKLveeN0c5p/vY2SMFv
 iZOjU9ki00XTc0OWFf5ypYMRWNzM6l4Mnnr6xt3CerTL1149wA/SVnhhNy+aEFOF6xYfutwJuM/
 +g1yifUUx3qdahr3Fq025wGojFiAQZLrzaHcDklGVM3pWSBYI3kKLO4pFsDyu55lSWkjHBGJ70/
 +/tbjI6mcf7AE1QhlQw3LJYLS2R1yTGIq2Bp9EOgomXR2Uq/EgegHPergkn4mEbo3LebC3bFXcc
 jmRHlpa1vHF9e5zSLIOfSEuayBaqIL6O+eT6VwbszqNqmEzBLKI6DYvO1bwZwkVUXAyOmNDcvYk
 0/rLBhf/TeNt0AgTM0k2tI2UHWWD8Vsv6n9ESlDgZA1KEg8EgfWbSLbK75QILlt0SJL11YUasL9
 Wgk/BBGxceIrvAN6f4w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE5NSBTYWx0ZWRfX8gh2CRmkeNso
 r6IvdISYRsadLYpfmq+f0H4IHFAYpJZs40zzIrjPaJc1oAezc2oSVb2e1vfxo1IvXXENNoxNp4p
 8FoLMo+v8wu4LXbTsYdIqzgPKlfFAy4=
X-Proofpoint-ORIG-GUID: Q7spN61t3GtGOxjyRJG0YPOXcLBldUBC
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa04d3b cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=VczNHz_CLEaalHvbfdcA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080195

On 9/8/26 5:25 PM, Charles Keepax wrote:
> On Mon, Sep 07, 2026 at 09:37:19AM +0100, Srinivas Kandagatla wrote:
>> sdca_parse_function() walks a firmware node, but on DT there is no
>> DisCo node -- sdca_lookup_functions() is a no-op and the SDCA
>> function descriptors come with a NULL fwnode.
>>
>> Add a populate_function hw_op that the class function driver falls
>> back to when @function->desc->node is NULL: it fills the caller-owned
>> sdca_function_data (entities, clusters, init_table, delays) from the
>> codec's static tables, matching by function type.  Leave
>> @function->desc alone -- the framework owns the per-instance
>> descriptor, so devices with more than one function of the same type
>> keep their per-instance SoundWire address.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>> diff --git a/sound/soc/sdca/sdca_class_function.c b/sound/soc/sdca/sdca_class_function.c
>> index 10a2b031b572..8bca88865a4d 100644
>> --- a/sound/soc/sdca/sdca_class_function.c
>> +++ b/sound/soc/sdca/sdca_class_function.c
>> @@ -329,7 +329,14 @@ static int class_function_probe(struct auxiliary_device *auxdev,
>>  	drv->core = core;
>>  	drv->function = &sdev->function;
>>  
>> -	ret = sdca_parse_function(dev, drv->function);
>> +	if (drv->function->desc->node) {
>> +		ret = sdca_parse_function(dev, drv->function);
>> +	} else if (core->hw_ops && core->hw_ops->populate_function) {
>> +		ret = core->hw_ops->populate_function(core->sdw, drv->function);
>> +	} else {
>> +		dev_err(dev, "no firmware node and no populate_function hook\n");
>> +		return -ENOENT;
>> +	}
> 
> Is this the right logic here? I feel like if we have a
> populate_function() callback we should call it regardless of if we

something like this?
-------------------->cut<---------------------------------
if (drv->function->desc->node)
	ret = sdca_parse_function(dev, drv->function);

if (core->hw_ops && core->hw_ops->populate_function)
	ret = core->hw_ops->populate_function(core->sdw, drv->function);

if (ret)
	return ret;

-------------------->cut<---------------------------------

> have a node. That would help with the use-case where this is
> being used to work around bugs in the firmware, and
> populate_function() can always call sdca_parse_function() if it
> wants too.
+1

--srini
> 
> Thanks,
> Charles

