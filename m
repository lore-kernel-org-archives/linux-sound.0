Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109422;
	b=PJOZPYqAiwCqI/n6jZDWyB0I3XLahhZswSrcImx7VWacAVmEiGp36CPVv2OF1aTV0EsE
	 PmmnliTpIFh2eHPd5mYZeD0MLePTT6JPig7op+PdWMUri1Y323QYm+p0qRFZKgrN3k91n
	 QxeQITpTCvf6s1iJqtAcHR6qg9GC3CKFjIyg9DyUx0T3kZwHq7gwWqyhXTfWFZvTVMDAW
	 blzC0zWnugjajEL+fj6Hq8JgkoxHHBGL7BTnC8VDi64v00ndtyY3zA+/NmZywSF2B1+D8
	 +muZf0WbRpsEDYZZySBsh39uqOGmW4oQuYnEUQxj30wAIlRv05KZOuyrdSFlVqgBzrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109422;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eGxUCtRGlKme+ehFGQNa/Gef806lpWSevfACq5r6dV8=;
	b=cidnXUBF+hQsgIi8xmy229Sp1OgFUhXBbHlAfXqw7E5a/TfvFeLYZnjQ1rM93m9uE7Sa
	 rMTQqbuFVWyjJX6gYhetaQ5wiVNClpIiDT3fAvcRglFqgpWfvTobmc6zkJngd87V8SJy5
	 6EPlc4aDK6vjKMl13cA40875Y2mxPpF8u7Ff6zgJ+IOGIAu3Q9eOwvc9pBiNqNUainoKj
	 nQSmgsRJzyzvIjCdSXIWJg0RrK1nZGihxB3W1gSeeIm3h3mKzeuXlQeFOMxp5P0dVzIJK
	 cXW48sk3LFrGViZxm1oqDuUOcplRMJG1779d2EfBq2AfD5G3t4FqGIU+vaFMSxr5W/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SBzDW7w9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=el72giF+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BACF8606A31A
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 13:57:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BACF8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SBzDW7w9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=el72giF+
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDo0DG2344166
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 13:57:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eGxUCtRGlKme+ehFGQNa/Gef806lpWSevfACq5r6dV8=; b=SBzDW7w9EPZSc9IB
	65tzcXMcjsf2Y6rKkD3TdMnxWYF+J6N3keLNG+NmBNiu/oY/dmhWQCY1GjwjFZCo
	KbRx0abceszlduC5i32dgjkQGUo6JQNEiqOmtpkSviCB78WdDnJesmeYeQ+dOvva
	sdXya2OhgNTXkgo0MiPPXmlZH70cjrSOMW67w8MqNW/GjDVbB2ZDI/eyxWMjIxy/
	WKJKi3jShDyC+yQ6wiXw3W5AO/mK94zUcBLF5lHT5P4xkfPkm5YVS6I/DaAIDWjY
	8qYgz4EHz6Y8SrVWXq3YSVyY9UOdS0DDf/izbkAKpuCHeyplpb+l9enEah9Dwp2D
	4WtHlg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq696fx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 13:57:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179743a76eso25902586d6.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 06:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793109420; x=1793714220; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eGxUCtRGlKme+ehFGQNa/Gef806lpWSevfACq5r6dV8=;
        b=el72giF+gGAKLL7v3838X0LfcF7z93zg9MawtBE9dkPpw9mu2Gf340godP48k5y2O9
         v9SSAfJThBWNR9aGLYnYJJE7K7WpolzdzOC7n/0DJDwGwUlJ3f5rdhRrcpOcdsaJaBNd
         jKHOsiI8dViFZp+QNa0rS3pbU7moPuxj9Qmqm31xUjDpB1uIQWrRA/oigsUhUZofUsNQ
         awYioGuii+TU4niggEpPbwkO8ABunuu21zPRwigvQNx3sCML34rrApKj0DufV2T0OeE5
         8DJH5YRccLqktXHmlKdGjtHIMu1BSex1DdShIJ/4IXRL6xbhhxN6D7JWQgA3QZ/z62Zl
         WixQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109420; x=1793714220;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eGxUCtRGlKme+ehFGQNa/Gef806lpWSevfACq5r6dV8=;
        b=byWgo9yuy/mL0lj65oxuXhn5Fic473EZw06dH1ZXTAnn5QxWTj+ljjfua/x0Y9Zz26
         CNWaqNqxQ0FrD3XPqjfoSgISDAehaQt35+LxFuTF8Q5nhDV8zMg0XvMtvFZK5oBHGeQB
         v71ygiiRiSyvYl0+aOuAU4dGUtcgp4zji9DRVF1Oq8HTl7qybEkv2o3krRCxG32WJTaC
         pL5OuI61eJKdZxWAQ/xaH5xRN+Xrj0obZJEFgQjHdgP6sjv93vu13hqX3gH+ueyz4ffU
         9IDquFTtF3JFIdkwQijGtCZKvZ8sbiD4kfg80bNevzdUuI7X92x3SZpgPxoLKTxPmpMz
         cYtg==
X-Forwarded-Encrypted: i=1; AKwUvByRM5wLeY9UFwMn5Z+Mf7a9mKzrR/MemosBo9fDU04osjOQ6El3cq0IUmr+YFiuP9le79j+0rMhZrPPZg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJSADJb0lSVtNRydGKxGeZkM5JOOHWZZNd4gw0cwOUhHUvHdp9P
	MDvRZ1+DSujjYQpE50xKAey7bb4JrUDd5YVrhd2hkuqiLCjQvIpx+ImccQsPWTbDjoLV2trtSDn
	a0mywcPsFAzJ9fN5gkIj2Yr+iYI7TjgByGl33e8UrCgdF13Ezl9Kr22ghx2Diug3UVw==
X-Gm-Gg: AYBFou1HEdivnNsKDjZBpUdpHMsp8jdOSo2jPXkCt/+PbsPotQSMhpMUyo8PqyL1Scq
	OVlO8Pj7N/hc3MwSzfl2l49MayOt2DEU3UPqkbT+Xzm1/X/cunTrx/JsYbGHOC4Ym2JWwksrtDJ
	0TUeuGagy3NzrG6Ie2+0IGlb/tNgwIWBasL7/rUOzk4k4ik49B4AWD7nokF/Fw6oknYd9ZD6U9p
	m6fg1tQ+JaSm9GGMz7Xeud03zf2V6pCZu/X6Sh1pivy2mL0meC5OZ53ZgePfx0+D0vysBaqBnhE
	NhgScydnYnHlBrFG7snQ/UJD1gB9ZtnxjQFIG+cTfUKHBYEIfUawxNHgGLSnUL2RKzNuoUErUqF
	2HmOAkO3SFwj/UWd9yqMsV/X21Q==
X-Received: by 2002:a05:6214:2622:b0:919:5896:e93b with SMTP id 6a1803df08f44-91c6d30d225mr47556526d6.19.1793109419886;
        Tue, 27 Oct 2026 06:56:59 -0700 (PDT)
X-Received: by 2002:a05:6214:2622:b0:919:5896:e93b with SMTP id 6a1803df08f44-91c6d30d225mr47555996d6.19.1793109419252;
        Tue, 27 Oct 2026 06:56:59 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-91c6158e404sm58349196d6.10.2026.10.27.06.56.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 06:56:58 -0700 (PDT)
Message-ID: <45815874-941c-4e63-85ba-e93fca6b2b70@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:56:56 +0000
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: qdsp6: fix device_node leak when parsing
 "iommus" phandle
To: Selby Mashiki <mashikiselby@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261025190340.449613-1-mashikiselby@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261025190340.449613-1-mashikiselby@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0adac cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=wKGBcDPARhIGGqfS-jYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: HeGf_Zssiak1ruiwQ6ZzYzNVhA9GxJZD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfX85veNuLHxQqS
 I0kYXEA7qm3+9kR6trP7DYQ0b771av28g3Op0LG/dNtbP2XGU4nchatnVkPzFG0IDOPfCvMTdha
 LjnFXCliO3q1bnXiCTjvNIgfWzdWwEo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1NSBTYWx0ZWRfXxRMjG86jKxjw
 U6rj4OTngjCS+agk6Tn/aFtrnc0L3XE9TIKElspQxLnwvRfDdraVQf+b/gMWx4jaYMrMyvfXGtB
 Q7L6SsSPV3teMK/od7gLpBmP2b7I5Wx3KBC2BE5/k38A/y7i1TDvn+zNvFWE/N0fcKCnZSkLMCy
 +sMZ1BSDc7FJsPfl5d8SrV41TtxNwDok+5d/kKKMZnzn6G9W0XCoK2+Pw07uBejsT+ziLPR4jL0
 gtzmcfzH6aqFxQe4gjIWqgmsIMgn726wSwEPDUV3eTt0NEi/McVZPKBg7FB+7KUUir3Z7ArJCls
 sXUx2pUdIMDZ+4o724PqiqtvNC8zQVnEUqohNNZC5eNjgbQPhsEzVDDaJVBaXIp8BvDftfMmRQu
 k7s9zux8kUUpqY5VdSvQjN95Y2H+eAJqpZLlauwWLOWwTfQgzu82+0tb7grMUHlsL9KtJcLJ83p
 uBg7vnN8B4lKoxXe9ug==
X-Proofpoint-ORIG-GUID: HeGf_Zssiak1ruiwQ6ZzYzNVhA9GxJZD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270055

On 10/25/26 7:03 PM, Selby Mashiki wrote:
> q6asm_dai_probe(), q6apm_dai_probe(), and q6usb_component_probe() call
> of_parse_phandle_with_fixed_args() to parse the "iommus" property and
> extract the stream ID from args.args[0], but never release the reference
> acquired on args.np.
> 
> Call of_node_put(args.np) after reading args.args[0] in all three probe
> functions.
> 
> Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
> Fixes: 9b4fe0f1cd79 ("ASoC: qdsp6: audioreach: add q6apm-dai support")
> Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
> Signed-off-by: Selby Mashiki <mashikiselby@gmail.com>
> ---

Thanks for the patch,

LGTM

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/qdsp6/q6apm-dai.c | 6 ++++--
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 6 ++++--
>  sound/soc/qcom/qdsp6/q6usb.c     | 4 +++-
>  3 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index bf1f872a0..49bd0582d 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -1030,10 +1030,12 @@ static int q6apm_dai_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
> -	if (rc < 0)
> +	if (rc < 0) {
>  		pdata->sid = -1;
> -	else
> +	} else {
>  		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
> +		of_node_put(args.np);
> +	}
>  
>  	dev_set_drvdata(dev, pdata);
>  
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 4f09fdd40..f09856ee4 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -1309,10 +1309,12 @@ static int q6asm_dai_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	rc = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
> -	if (rc < 0)
> +	if (rc < 0) {
>  		pdata->sid = -1;
> -	else
> +	} else {
>  		pdata->sid = args.args[0] & SID_MASK_DEFAULT;
> +		of_node_put(args.np);
> +	}
>  
>  	dev_set_drvdata(dev, pdata);
>  
> diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
> index 6381b289c..5888bc41a 100644
> --- a/sound/soc/qcom/qdsp6/q6usb.c
> +++ b/sound/soc/qcom/qdsp6/q6usb.c
> @@ -382,8 +382,10 @@ static int q6usb_dai_dev_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = of_parse_phandle_with_fixed_args(node, "iommus", 1, 0, &args);
> -	if (!ret)
> +	if (!ret) {
>  		data->priv.sid = args.args[0] & Q6_USB_SID_MASK;
> +		of_node_put(args.np);
> +	}
>  
>  	ret = devm_mutex_init(dev, &data->mutex);
>  	if (ret < 0)

