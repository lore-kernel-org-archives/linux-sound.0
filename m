Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80460221577
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755852021; cv=none; b=Kq7jZcyjUmUQGHKmXljJZZ06+CXOOa+x7SVaj0JJnJYV9wUxi0M7yUHuqovcUaXX2gUMqLJDvIKnI9tkL9nO1AnZ4I7XKq5xWlHAukylGmWxZD2acErrwExaIZjyvFaCZIA+lHtPQWvVoTY50W1sxc8p+xgVbzQWXYyLORT6kzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755852021; c=relaxed/simple;
	bh=mb67csx0rQLNQeSWXRZ2vFVehT6wL67ynUdXZBSzucM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sy1jKW9EO8w3z2ALW5aobrcjlLaXbJOvzIw8KeVbgQyl9WLnn9WNbkwN5ls5sDUfg5/zExUKEUE/DJXJ89K5ANHuvh2KfsUnwfZGHEsrJfpCwxevqR5ZJXgyt47Wuo6AP+vO0gG8MWP28mHd3eoTi+g4cvNrRMGnWYiTZJQLorU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VUQfQ34I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VUQfQ34I"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UMIr011161
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 08:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f9hz/vg+2+0Zh06awR2OHdW7Ksz43krhVxNHP+uFT2A=; b=VUQfQ34IjPY/rfGT
	QP4AsEJSWDd7nhfPoma3ljT+SYt/A3CPE9P7IQ0vdyNGegjH41BuaavrBxaRl+gr
	1uko0eQHc/1sOEmS/YXULgFV+8ALKyTvKG4QniQ1VZWr+46i6HNmFx8aVKC5XbMI
	JKeF8yyNohV3FcwFpR/6uWDUUCPt66Lr+bK9hXU+ffQO9tXElDlQVhPX7onrg7Oa
	+aT+syMTyPXXJBtUXsK8JDlIoFT5IUFRbbS1sUJTyImc40JMknviMK4y2B/x+09R
	CSc9r3oYjkGbU+CUDkrmucHAEmOZZ0D4Huv/j0dWNBoubFhgCgkekJZzpkki42EQ
	ecAuoA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngt8eb3c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 08:40:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-70d7c7e9732so43620976d6.3
        for <linux-sound@vger.kernel.org>; Fri, 22 Aug 2025 01:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755852007; x=1756456807;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f9hz/vg+2+0Zh06awR2OHdW7Ksz43krhVxNHP+uFT2A=;
        b=vK8t4+/wLWTZoGB+B0TzKvW0DkOKp+bX4K1EiA20PioKnia8FVClyJclcGYvgPdEby
         5KbmD9KtT/AQIIj7NOVWbKAzJY2xfgIr6IFEm2vGpdZQ6GsyFWeHZdFl1+lhTG5bsWPN
         VVrvzh39AdwXuOVuV2eNRpnY8gXX+ZGx9mk3UDmBbYcXG0q30xWZsRdQl+TnjWir7jl3
         f6D1A1/iaQHplcbUfb1MdlUJZdTyLelY/TIIqU4zhv46ystK39lUUyWJj4W79QEGGUry
         EDeDE4o+EsznyrB5ncTKiHS/ek2ZrV9vVAFC/6Dfs6PzVwzXk9S1KOIQuILBT9SgCGf2
         kiNw==
X-Gm-Message-State: AOJu0YyU63Es8BEaS0KI6fsinz8aDgCv7Kw1zmOOez0QKB7Q0CCS+s7y
	Kx+rVy8D+iJZyZIw3CAUzCcNDM6+KM7rICNQCYv1WkQ+vquseZ+JJqysKi0E8HqF7BvbkMDd9YJ
	TdfA+lxBCXK2LBBRB1t+9HAkX4aVlRFoQReqB2XeF1icd5XmJQXzRYZO+n0CToCG02Lk69AOT1A
	==
X-Gm-Gg: ASbGncsgycSL2byIqx4do0693Rc/29M9H06Mx18m77WQcZpMBWOroE08UJ8wIPzHKMF
	vW66HiNfmnP1NRUqtmKOdfO9VycnESa26UFvJan3OWpaaeic8N/Cc/2pEGB2amOpQm88j/mHL2w
	tLC0BKUC9uK7xIb+5CSLgK4DkfMU5MyT8mGETWdlXefAg4jf5WtWlOEda5QBxG5ROCRkXGHg+P1
	ftZyF4gWmjudgpR0BwcGWlwK87Fjgg4TdsPPb0/fK7GYv7WTAIc9IXoIWZfBBMOGMDVGNwNTMZ5
	SJSyOu+H5xq4j2DFzgkFNzEv21KHnz0ssTl8HKiO6+gFYn7d2XO15YjydECc3oa3IgA=
X-Received: by 2002:a05:6214:2aaa:b0:707:71d9:d6de with SMTP id 6a1803df08f44-70d971e391dmr26871996d6.36.1755852007272;
        Fri, 22 Aug 2025 01:40:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfUMtbFDiChInWQ9i2TM95jtYzQfgX3J8Nckz6ZE6pp0LioKgt7caLZVHE3UOsrPCkRo2ggQ==
X-Received: by 2002:a05:6214:2aaa:b0:707:71d9:d6de with SMTP id 6a1803df08f44-70d971e391dmr26871776d6.36.1755852006506;
        Fri, 22 Aug 2025 01:40:06 -0700 (PDT)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45b4e877e3fsm31175175e9.2.2025.08.22.01.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Aug 2025 01:40:06 -0700 (PDT)
Message-ID: <776a6942-d310-48ee-bb17-7308a8fdaf51@oss.qualcomm.com>
Date: Fri, 22 Aug 2025 09:40:04 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [bug report] ASoC: qcom: audioreach: add support for static
 calibration
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-sound@vger.kernel.org
References: <aKglWJPzKWWXwp_b@stanley.mountain>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <aKglWJPzKWWXwp_b@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNCBTYWx0ZWRfX+Vyxagf2iD+y
 zChSbCWMStCYL/E91xs3Tlj4fOyzDwrN4FMnKmUkHDd8t/SDJKZD/R+WHHUxYRfIPsUPHdwifwT
 9Z6xcnbVeblmAVHS3UyKS1XC+0OJxTMj7LcJ3mdB4Z+KYKU+vjc2tLtParFe3aMsBwkJ/pQcbAW
 7WW6+FSD2Sd5Y72/sHMY4jVg2zbm5yfxH1ZqOdBz1cDQmfzeSVzU6j9jHKZ9T2i2P04iNoD9QXE
 kJgIGJjb+XJm0OZYdTUST2JeKvSxmsJlyaRWgCQ2+RffQlAdZWwyOLcxWJEmbXgPRxKBQ9R7wMh
 6itaIGF5ktWMBFLhyshAN2wq6IWRg4HKPRhJosQjSeoy43U4cUYSr7nuPFSeIeYCvjo7c+8qsVj
 sXGD1C+ELDP4UW5t9pIG4oPXilt1aQ==
X-Authority-Analysis: v=2.4 cv=c/fygR9l c=1 sm=1 tr=0 ts=68a82cf2 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=-1bWs780wuwMlbN_1rkA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: 5qbPj1TJgg6eMBDu4UTEU_pAUDr15KYZ
X-Proofpoint-ORIG-GUID: 5qbPj1TJgg6eMBDu4UTEU_pAUDr15KYZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200134


On 8/22/25 9:07 AM, Dan Carpenter wrote:
> Hello Srinivas Kandagatla,
> 
> Commit c7ed4c2debfd ("ASoC: qcom: audioreach: add support for static
> calibration") from Aug 19, 2025 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	sound/soc/qcom/qdsp6/topology.c:613 audioreach_widget_load_module_common()
> 	error: potential NULL/IS_ERR bug 'mod'
> 

Thansk Dan for reporting this,
> sound/soc/qcom/qdsp6/topology.c
>     591 static int audioreach_widget_load_module_common(struct snd_soc_component *component,
>     592                                                 int index, struct snd_soc_dapm_widget *w,
>     593                                                 struct snd_soc_tplg_dapm_widget *tplg_w)
>     594 {
>     595         struct q6apm *apm = dev_get_drvdata(component->dev);
>     596         struct audioreach_container *cont;
>     597         struct audioreach_sub_graph *sg;
>     598         struct audioreach_module *mod;
>     599         struct snd_soc_dobj *dobj;
>     600 
>     601         sg = audioreach_parse_sg_tokens(apm, &tplg_w->priv);
>     602         if (IS_ERR(sg))
>     603                 return PTR_ERR(sg);
>     604 
>     605         cont = audioreach_parse_cont_tokens(apm, sg, &tplg_w->priv);
>     606         if (IS_ERR(cont))
>     607                 return PTR_ERR(cont);
>     608 
>     609         mod = audioreach_parse_common_tokens(apm, cont, &tplg_w->priv, w);
>     610         if (IS_ERR(mod))
>     611                 return PTR_ERR(mod);
> 
> The audioreach_parse_common_tokens() can return either error pointers or
> NULL.
> 
Yes, its possible that we could get NULL if we have a corrupted or
malformed topology graph.


>     612 
> --> 613         mod->data = audioreach_get_module_priv_data(&tplg_w->priv);
>                 ^^^^^^^^^
> Only checked for error pointers, and it could still be NULL

below change should address the concern.

diff --git a/sound/soc/qcom/qdsp6/topology.c
b/sound/soc/qcom/qdsp6/topology.c
index ec51fabd98cb..62fdcf433cde 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -607,8 +607,8 @@ static int
audioreach_widget_load_module_common(struct snd_soc_component *compon
                return PTR_ERR(cont);

        mod = audioreach_parse_common_tokens(apm, cont, &tplg_w->priv, w);
-       if (IS_ERR(mod))
-               return PTR_ERR(mod);
+       if (IS_ERR_OR_NULL(mod))
+               return mod ? PTR_ERR(mod): -ENODEV;

        mod->data = audioreach_get_module_priv_data(&tplg_w->priv);


Will send out a patch for this.

--srini
> 
>     614 
>     615         dobj = &w->dobj;
>     616         dobj->private = mod;
>     617 
>     618         return 0;
>     619 }
> 
> regards,
> dan carpenter

