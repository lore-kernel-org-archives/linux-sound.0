Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33A63806DE
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 21:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774302873; cv=none; b=hmY5msdca9IJx7FQGhCAf1TY6Ma4dX4Q4JfW4V/5jzwMe0LWsD9212DLTNPzMSxQgkOsoSPcUUQf6I9moOD8cBq+swmPpJJj4OoCzgcmgWy4TZyJo6di4F00VkmVEC3HZBlwOQBo2XF6+QmLFWZaN54p4K9HztnvgFvF9UehzjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774302873; c=relaxed/simple;
	bh=TQpM8ZYMbSxXZpcqP8xZsRXe9F2SBg0etEpBLmcn9mU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CGFKPmVCFgCzwJNSUHqlZ5NWHeIXs3z2PKLZZ8CbgrhD71hCOZD7Zf0h7nFWanb9dyXmmiebPn58PGLQtDBvB/Wzg4MWyvLpH0SUJMjyvsgEGoOuvqVSUsGJYwRUhUZBdSzaMsEEUg4JThy8tqWqYiDFRlzEEM53CPmgFLM5rU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOEFAbdG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KMJ1HMmJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOEFAbdG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KMJ1HMmJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqhrG3934736
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 21:54:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Aev42t9lwy6Gs0aGpanm8SSlUN0xteCCmPHE0nknkDg=; b=XOEFAbdGZXAoLfyW
	Oa5t+MHsWnHPi5wY2j+LYRqboNaz5D+zdsXikmZ7KAcDVmiO8PyMOIT284MB8dGu
	g3IvWcZJMui8O1VE7qy/SJ7C+2yvy/wh9sbItOMS9E5SY98VsCB9Ec3qLKCuamb3
	7cRY8nyioYPcI5mo84HYlKC8RlnY2uTPP//phP8U1WwWebZscK+lvA/30Hcrrj0s
	FkluY8L1Pm/pT9N5nbcpIQb74ueFJMj/SrFLTUnLIyrZ6tGV0JuOCZ1ks7h9k2nf
	Ruuzdw9lb/w0oBSp2A0Mh1AUEHoseM/60LqxmEbfpHDpKecs8gyvpOFRJJb4PIXM
	ep4I5w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0hf8q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 21:54:31 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-509219f94b0so58381641cf.3
        for <linux-sound@vger.kernel.org>; Mon, 23 Mar 2026 14:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774302870; x=1774907670; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Aev42t9lwy6Gs0aGpanm8SSlUN0xteCCmPHE0nknkDg=;
        b=KMJ1HMmJxoZ6kZR9CCEVXbrIpUZDOns+bKi5V4gBgFSazGnP4bsBGxgGsnAvSjfDuF
         nk3b9MyReALhrWKPbr+CIqjXLmb9dzyWdC0CtYdX4wDPNvJVCGff9Jtqqgjv9fSLIQ+n
         Rde0JExmUI0Yx+U4umLGS0JLwUe0PAV95oKSmSF0zhg/7KCYTNPYBKPJNBZuwVPafd9E
         WzOOacM0Om5xcDkBoSr2aWdL+SFWdr42Tw7HQFgzZxUWGY5UDLOXmccfaOqWu9MVMhSF
         XPiK/fp9JOUR8kULCJ/iapuTBriL8NF+/5Q7JwStIRGxUtBkaJFc0RbDb0HOSxVwpi8L
         CnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774302870; x=1774907670;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aev42t9lwy6Gs0aGpanm8SSlUN0xteCCmPHE0nknkDg=;
        b=VK8Soqtw+HoKcOMzHHdoiOdRrTlBWOHNjrhOe97IjvT4ZE2A0L4svT7d7sOydce/KY
         n+AmdIeNS9qU2HGPnQ0HjHjeRZPNZE22p1/YCEu9aC6k0hDx8hWym9zWo2UtoORnfv57
         dYw5NUrqcS9v/Pm+eThI9VEeZZmLBCZQojVXXnMNItvQ3iwD414lhKyWjFzQHgYaZk81
         u7vKk6tRSEapi7yMmwYnmkz0hhEM4ODoYoPR9VbaDTkdugbSYDZGWzOOcJtcZnQqayui
         3OOeXb4zuh7y0KCyTP6MRzsermA1T7YxVIEhGibcg4ZzTK9IRcPzxuFzojS0FKvslOPs
         WrDA==
X-Forwarded-Encrypted: i=1; AJvYcCV40iqnv0Dx56/pIahJgr1KXy9qOMv+qUGeu0ipMRlfICMIWOd34Rm8EyzVrPzLFFDXEwMwZ8PI3CHtSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYQaRQ4QhhEeP5Dz46z2CRtffWAkGgY/lF9qBgcSyOMmnxrlPV
	rw4ElT8utfio2U1UMqqeZeWi4bVo1SQX08Iy2sRke0Q5TQ0aU1nWZPTbHNbtkW4uaKWHH3KcZM+
	UUt98Kjf+ExNruWPF4m/amzC9KD9b+ue5DIvxg9QPqyrT4LxBnYi+n+O15knKxVa5TA==
X-Gm-Gg: ATEYQzwjxW0/nSpIrLAM9Fy8imPU3xiaE5aJodkC/VebtFatgTBszqJeV6UKKFjvNj3
	msBDkkUkslt9JmQuPAYZBfCDgb0bQ5nM5uctAW77iI0k1wNanivNUKK6FL1lkD1aaFe/VyDvSYa
	Ok2R6TNWVYHQM5KK8s4T/bh4RDvkvyTKijDF/LIWOyY467NZ+hz/s1illyrdQVyoy8JxxE7wZmZ
	weh4UsXncR9Y7JuuAjfpNAdwHwm3Zz3VKI1TVVmWaDB91+JJkl0zOChFpP6M3Q3ge/ZZakq8q+0
	vRVZN89usnK2l3llmKcj+gOfFjkk5VVGs2B3C3J95SoySA2BvsV49uEPbZ1o84WN2KuyIgYtFER
	TzjgWLcv1ClW0m+eG4tyCH+Vo/xcFrEO00fS3Ri9SlvXrsV1u
X-Received: by 2002:ac8:5c96:0:b0:50b:5258:28da with SMTP id d75a77b69052e-50b52582b9dmr118725391cf.5.1774302870311;
        Mon, 23 Mar 2026 14:54:30 -0700 (PDT)
X-Received: by 2002:ac8:5c96:0:b0:50b:5258:28da with SMTP id d75a77b69052e-50b52582b9dmr118724971cf.5.1774302869902;
        Mon, 23 Mar 2026 14:54:29 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43b647177e8sm31794487f8f.34.2026.03.23.14.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 14:54:29 -0700 (PDT)
Message-ID: <0006e814-1369-40bc-81cd-241a08080002@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 21:54:28 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org, val@packett.cool,
        mailingradian@gmail.com
References: <20260320144918.1685838-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260320144918.1685838-14-srinivas.kandagatla@oss.qualcomm.com>
 <73bbc9b3-d71e-4161-8d21-496433c24300@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <73bbc9b3-d71e-4161-8d21-496433c24300@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c1b697 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=1IEi6xrr0DJqppMnr98A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE2MiBTYWx0ZWRfXyGymqLfmTl8u
 gjB09zt3Bwd6C1xqyMUzP57et4p4rqw8kkx5whAiSbLQtjKbqpnrFymq0Uiuu7lpligzvharVOc
 M/feLssAJNiyFsFar8IYkUO4KhfEBRI98bLPBVGn1DTZEWLj5+TWIy/MVVPGwENzHQH/nO6YDCI
 RfIezA0J0M310d6Hi1iYdKi/nOe99eg1tGzu/Yq3AGQLV8Z24mfKzI0OnkM77yx2lCyhUCuEGoM
 3itA8F1ik3xEdP+mgvh+IUTRzEOx2RMNwJ7xjbKQEfoqcpLvQ2nL9Qos+ccxUfrCzX8S624opQ2
 yyUTkR1pCiKGRxT1EqzXeoucSJkhbAm2fsQ4fSZBcIiq1Z8eMLpr4b5Zj0hm1Z7lDp4gVIoE1UU
 +r0Se9oBLDiEK66Mvd1yNuuuqg7FOl61JX2xjTKxH2OnhcgecQCwRYTWKJriUVwG+aEyT1EvW1M
 maPKleHr0gS9pUOUwrw==
X-Proofpoint-GUID: WFzXu1DLPSBW19KaDOltu9hk_tcMqTj_
X-Proofpoint-ORIG-GUID: WFzXu1DLPSBW19KaDOltu9hk_tcMqTj_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_05,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230162

On 3/20/26 3:44 PM, Mark Brown wrote:
> On Fri, Mar 20, 2026 at 02:49:18PM +0000, Srinivas Kandagatla wrote:
> 
>>  static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc_pcm_runtime *rtd)
>>  {
> 
>> +	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
>> +		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
>> +		q6apm_dai_memory_map(component, substream, graph_id);
> 
> This doesn't assign ret...

True, should have collected the return value in ret.

--srini
> 
>> +		if (ret)
>> +			return ret;
> 
> ...which means this isn't doing the right thing.

