Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112260;
	b=1Sv67yeXsZICkXbzFvMExcezUPGmutZDYtxqVA+uIhNsSr3wDjqVNomW4qNFrVckBsk/
	 NcwNcJRec42T21joK2vO2eS6DPUctkNKc48gHs73s6dFjmDI5Fe7IBWw/HCfeI2XkcLfr
	 XJBXPrNbF1WLsY2lklI/zx5cf0nHfqhCud3noj0ulxmWorKzPB6HO5aDaOflWPD/P4JBC
	 6q7E89PiSQZzXJTWDeSzpFHMk/hC/abTFZ/FGYuc3E5fQLkvHLysGgreRs+CxeE/iC2Uv
	 P8IMeQeDOS9ZYY8upmDHPXQXVFkzb8CUhzQIcue03pHHxshkMUhazpyuZJ5/b5hzPEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112260;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HAA7AZo00Ddvj2qqPV4fEpM3+Jj4PA1j/BqBRb4SlQU=;
	b=OKAAuama+zhII3bhCoyY/A6MYyavJxRB+FwwiZA7bg2GNigCYCRhp36MV2VzwybvpDla
	 F9wLHtpMuSz7sdmgk7i092Af4QrkJTROx7ZMbxBli74XQSEBJWOhiJzeVxUpqVfcCRyzi
	 kxdJ/GkVYQyy0Oc6qeUEBYD3jHfMRdyls5zLSCEttdY/QdGYYX8498KWoXQ95Wjd/e6P0
	 htdxqTDbGQ3L/VHadPe+B9MdU/WOkICI477gVHep3G17VAdCsR+FMV+WzEMNfVe290XJ1
	 1uPeyCwI/q3m3/LvWWf591wMLnhYf6oKmIXqm9m/kT5tNWQEJTFAFH0Xz+iDn5QoP8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyTYxZdG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kkdu4xpS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED522606A31B
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED522606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OyTYxZdG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kkdu4xpS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoPvr2397395
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAA7AZo00Ddvj2qqPV4fEpM3+Jj4PA1j/BqBRb4SlQU=; b=OyTYxZdG5+M2clOm
	mpj2PFqC20PW5yT2WKOHbRjUQd4kjm1lHHI6h7rvY7k08UybYm5zCJcslMNG8Wdd
	6dSg3QSVjxaV5v67NV7UJlPFHifZsFihgctUVQ8TOibpdjPE8ex6jgcPiY999ZZF
	QLRo1Nt+B6xgDoJj9OGyEHhqTE2SLxQ2DhYJn0yHhKKkunbxCxJKKbRXTXILjfPO
	YiD8za+0ifXd+ziLHf5VtO/xKankz40QRfDl0FP0Vf1bRbVOR+qzzbWA3LYjv6bE
	aJYmbkhzGCRhyEB3sjS95d7yDnMnM3J/UFyBwtEHHmbC0loqY/DT984+SufrEM6h
	8H7Uvg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1h462-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 14:44:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f62934ef6so681431185a.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 07:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793112258; x=1793717058; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HAA7AZo00Ddvj2qqPV4fEpM3+Jj4PA1j/BqBRb4SlQU=;
        b=Kkdu4xpSycubvYo2VxZEIvDxRi8LwhL9BdwTQxbJICH3Gna7MCt4YhYIVVN5XKW1vq
         MydGVrA+aI5kfZxCErCCablQfK8klS9a4bp1BEF1FyVoX0++q7NRlY8mkD05m/YHvLJ1
         rgxPsXeqzQ8DJuqPxs0d3tqwxoe9tCBGvKtcimMSLYrVpBTPHnZMVGA+n3h0bX55pB/6
         /s7fLJEpPBgwkXp+yhcTf1+cSzUACbRC/PDzYoej2R2kwcCTCqDvnLCMwY2XINLYYqgz
         oyCXKxS5gTxSVsYrAHfSscex7Ja0uCorYn/Du8kPS6kYUIlJpKvs4/mAoZC8tCImxzmC
         v2AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112258; x=1793717058;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAA7AZo00Ddvj2qqPV4fEpM3+Jj4PA1j/BqBRb4SlQU=;
        b=GdPXM9tObOG+cMxbC3ESkUMC0xV8OZrgi8YZrR81bQeraW/dIkEZu8Opct0oTouCRF
         ISaNIbuKy/+g3wsKW4r8mdJM/ANUhaBsO6ytX6LTBDtAV8aOTgZkwCUA2hbMRr9cTHBZ
         Or0ph6e+HKzarc6x3mShLT7oP1ejeJA4k/twiwZvcbExmgpw4HhGzLbzjKFTtiCCLt1F
         vfD8zfTZ0kjfnGGH9wEIiOUfRTUNJO4R0V8TJZdkmfkvWLNasyteeHXmgPvyBQzlwo1D
         hhfeZ9T/CGHZFKTV7dPTB5BK5Ko/DmenhmIR9PECBxtDY3jGW7Tv1NH3T4QtyG6Xvp+n
         TTpQ==
X-Gm-Message-State: AFq9FYI5bgLtyu70ztpKbJVT6kNR1v1TEE/F3Dfs08t0hFP4ycESmNZD
	THgT/c2XEyrA1JEPBksl55XiqtHx3s6zhdjtZljbGrY9v/lNIJYM5k4a6pdcXrKgM3wK4SO92+Z
	xdmZ4V/Gd/yt1FsAIZoqKbiKgACi0cdwDnDgZ/fnC/utA5mPz0G+rmetXQq+C/pX8dQ==
X-Gm-Gg: AYBFou3GfKD0cPlGhRSlAsr948bLwrlBN8uBC6Q0NsjP+cqWelMtjFAIY2mrP+uizit
	mZFCVKA57OgxJojAfrt7ZZtYlOJPMSQVQsom3EeonUwgaaiuxMaMajtEgyYSZa2Vpww9dQ5eipm
	erTU2usWKiXle6yf+nU0nQyEHobfTPDUcYIHaQdCX91GaJK7dagnm8R4rvH4P/hl9Z+A+f5v9mR
	upeevTUxdOLJ72WRC3Lqiczq5O2qSE/WUhC1ayRmpFtfjYwN2IZ+JyYJU+0HJGXDlEEK2ICxGCi
	GskJatJhNTh7CpMM9o25FxTcb8+IozQE9BIuklQS9a2Q2IJnkzd/iOr+gayc6lHb9fGCW1bw3M9
	I/ocKfs6uFGDxWJZt33NaFChnHA==
X-Received: by 2002:a05:620a:4042:b0:93e:6325:ae6d with SMTP id af79cd13be357-940ef8db90amr1645247785a.40.1793112258138;
        Tue, 27 Oct 2026 07:44:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4042:b0:93e:6325:ae6d with SMTP id af79cd13be357-940ef8db90amr1645242885a.40.1793112257631;
        Tue, 27 Oct 2026 07:44:17 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a359ff2189sm319234895e9.1.2026.10.27.07.44.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 07:44:16 -0700 (PDT)
Message-ID: <6078ca7f-a511-48d9-b5fb-a7b3339c8569@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:44:15 +0000
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
Subject: Re: [PATCH] ASoC: qdsp6: q6routing: Fix memory leak on probe failure
To: Tang Bin <tangbin@cmss.chinamobile.com>, srini@kernel.org,
        lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261025080242.2572-1-tangbin@cmss.chinamobile.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261025080242.2572-1-tangbin@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0b8c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=R5C9hjxsAAAA:8 a=1_uBrm5jZOM9LsB7CMgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0ffiNN8f9tJoO9WaVxYE2jv5fmg8u5Tm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfX3tt8+s7selUY
 LidvA5Q+gwwT3XuLg6aMpxZ7H1asn5tS27QyoGBKoqabbVfcXYT63ipYEaQxFw8xuDFlHaJBR//
 fRVyM1bCqt3K2oOCbyLPkvJCDL61gTk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfXwc0skHhSOX7U
 m0I1QCaZf3idFivd5vVlTAffvZlFp4UzeS8xvOHKblTInPrS1MLx/YoEm+BcvTZTDei7LoMwV79
 P0M2VmgZFPRWyLfjiC/jr3Z9cfu8xrhPnalEGzELoUwAauwHzp1+m/+zSK8qO8yUV9emlNdT1zm
 if2lB+FmJV+VDZ+zb+OF9V8k9lCSGUbM6IPSKFHiu+UPkCD5hJtVAcekbwEht7KbBpzlRLxG/B3
 MCTmb8Bz5VJpwoZyudhbXYyiG/WSC5RJ9rh4MwV82Sb7yErSXwdEpRrhQM1JafAPMJpyPAGTU6x
 amGfU6XyzIN18j6WC+Igq//Qn4xfbnLJM/TzVYrIsVMl5CtonxEqp09bgcseu50x94kQVpiT2FZ
 aixHaLCrM0YY++V+h4Pv8O2z6teGKleYMa3SlwqtqA+zT1Oegu5dR4RK0dj2m2V2ebjMGpSXlN2
 vrngJRQNYZagOxeyjsg==
X-Proofpoint-GUID: 0ffiNN8f9tJoO9WaVxYE2jv5fmg8u5Tm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270058

On 10/25/26 8:02 AM, Tang Bin wrote:
> routing_data is allocated with kzalloc() (not devm_kzalloc) and stored
> in a global static pointer. If devm_snd_soc_register_component() fails,
> the probe function returns the error directly without freeing
> routing_data. Since the remove callback is not invoked on probe failure,
> the allocated memory is leaked.
> 
> On a probe retry, a new routing_data would be allocated, overwriting
> the global pointer and losing the reference to the previous allocation.
> 
> Fix this by checking the return value of
> devm_snd_soc_register_component() and freeing routing_data on failure.
> 
> Fixes: e3a33673e845 ("ASoC: qdsp6: q6routing: Add q6routing driver")
> Signed-off-by: Tang Bin <tangbin@cmss.chinamobile.com>
> ---
>  sound/soc/qcom/qdsp6/q6routing.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
> index d076c99f1..fb633efd8 100644
> --- a/sound/soc/qcom/qdsp6/q6routing.c
> +++ b/sound/soc/qcom/qdsp6/q6routing.c
> @@ -1208,6 +1208,7 @@ static const struct snd_soc_component_driver msm_soc_routing_component = {
>  static int q6pcm_routing_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	int ret;
>  
>  	routing_data = kzalloc_obj(*routing_data);
>  	if (!routing_data)
> @@ -1218,8 +1219,13 @@ static int q6pcm_routing_probe(struct platform_device *pdev)
>  	mutex_init(&routing_data->lock);
>  	dev_set_drvdata(dev, routing_data);
>  
> -	return devm_snd_soc_register_component(dev, &msm_soc_routing_component,
> +	ret = devm_snd_soc_register_component(dev, &msm_soc_routing_component,
>  					  NULL, 0);
> +	if (ret) {

how about something like this:

diff --git a/sound/soc/qcom/qdsp6/q6routing.c
b/sound/soc/qcom/qdsp6/q6routing.c
index d076c99f197f..4816d4b9a48c 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1209,7 +1209,7 @@ static int q6pcm_routing_probe(struct
platform_device *pdev)
 {
        struct device *dev = &pdev->dev;

-       routing_data = kzalloc_obj(*routing_data);
+       routing_data = devm_kzalloc_obj(dev, *routing_data);
        if (!routing_data)
                return -ENOMEM;

@@ -1224,7 +1224,6 @@ static int q6pcm_routing_probe(struct
platform_device *pdev)

 static void q6pcm_routing_remove(struct platform_device *pdev)
 {
-       kfree(routing_data);
        routing_data = NULL;
 }



> +		kfree(routing_data);
> +		routing_data = NULL;
> +	}
> +	return ret;
>  }
>  
>  static void q6pcm_routing_remove(struct platform_device *pdev)

