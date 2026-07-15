Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E4E443318
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 10:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784112171; cv=none; b=iLWhSAHC+WkdyCpL24cUNpmsWTyCSXLyXypldADJjWJdlhYUDYCgJcTIJhJD2pr01FYTrkENYTo7jMCBAAT9yBa31uR7k7hiJ4JzJQuK85imrvVwD2nIM1zlBki445Y9W30fFsQ1UZAZQiTrM/FVZ2/qAcWtfvzjCdnPe9F1pNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784112171; c=relaxed/simple;
	bh=9NO6Xg19eD54IlnB31oIGDBM5eDI7zAlqt9sPpTxg+4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S09tsK0+xBsEn8PHtgWAZWkppAh2ZYnH+mrUrVL4OaVVrmZ3S6914tS7ftp9IhPjfLP7V65sG65w6Q3Yn7imJug7tLXS7IL+BB8pj+dPTbGVhu40zXY9xynh0NOm79wh0CtjdGlDP15jTjXwYRVyW5OReMh7KVR7a6JiN7FaVgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJfSX9gJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+y46wyz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJfSX9gJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+y46wyz"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F7mRSd3142996
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 10:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J+As9bESBQai7rgQQOUtCb8gV2xuEelvRsENnvo8bHM=; b=iJfSX9gJMPaBvTKD
	xCzhca+FTeRnhIar5PP9UyGp732a49P2vJwWm3kJksIhkcqu9tZcb3EmUxxkOmnP
	wiq+QZ6kQk4ehZHRoxxDhX+nKZGT53xOHtrluYFFK6lmbp9fxH2qqGgmRUOOWKsM
	9Y/9wVfNg2sHOyGkKswPcm8OvRDEynf8cweZlgwaLpcFBAnByv7GSiFk0DsGJ7MD
	jrd7a+NTfgxrHZIWyPK7z3N7hvMdH2IdyzreoB75+C8Wog3j5BAwRdIWRby+JE9b
	1+La9MwcEqdaQ+UdP4DMZXhwcKmmWq1Qj5OgCKDS5gKSsdFIdiRciprfSAIwb2ui
	DkAs1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe6528mvd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 10:42:49 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e59d97df1so79360885a.0
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784112168; x=1784716968; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+As9bESBQai7rgQQOUtCb8gV2xuEelvRsENnvo8bHM=;
        b=f+y46wyzCIcRm73QkS/HhYpcvqg5AgrMD+/Ll4irD9XNIRJVkkyNk3h6Y0wkWu4dU/
         3yK7KeFzBPEdpmre/rtZVOtPrVkulpP4cLEuvKi3I23m6xmcD66YfJNqjeJAScX2ctRJ
         J79U6xvImhLv30kwE/nJ0q+orlgifj4Xw/AowduKJWXyrjwlI4MoBfmzuuKQpPtiLycg
         7I+EyB5Kqh48FQFOCpibQ0eu8szrtdyXRUV/hPss3/w3CG1q9d5bZyWxP8BTU38FErHx
         ptH1oXLu6wT8NrD1tqiQ1erx+Hm07XW0WOjUQ8QTdaSErP2vdaV8lufgKl7JATYvemG5
         FSmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784112168; x=1784716968;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J+As9bESBQai7rgQQOUtCb8gV2xuEelvRsENnvo8bHM=;
        b=PjihmBa88V+XJ02cgyjoucRiwze8o9EtQLz4fpy+PEoocDqJit/TxB9YkQsRDA0IxB
         tRhS6eQSgE72tt4iKHECe+uLiCUmBWCp/JjWZkijccCvKcW6QYJFxRutCHcyoTx4o2py
         hXQH4n/XdWjLQACq95dM+6RPxQd3FsUrpWB1tglo3CfuqJwhf5Hfaz6LwaOY3KeIvxwQ
         ty8aOE7QajVM+Eefx5N3h6vvo7M0vFigLtmmIywRnGPKybb9kSAXm6FWjm5mp8PVrwvT
         P6caTfJClwg3F6tJnTD13dof+IJgrYuZ7pdboEkJ/GOLjvHV+w7EGDYuCDVlqNUzPJYC
         3tLg==
X-Forwarded-Encrypted: i=1; AHgh+RrcszMr/IiwVTvACw17+7JZTPo2AWuG5vwxASXJPVNDDUASQPF1vkxDh1WhEG2Eeja9oLOhbtcpwOc5Kw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4tnOcDDXuUyuo9BfMqh9az5EsJdp0HiCAeIhvLmH0Abx40squ
	8jDvJSnrazll5PbIRJec8FsqgIi91DP/KAtDzk8P2dGxakfCrXHppuCuxrp+Ax+OaibNVjV/b5k
	1atjYT8BTUsNp5dWV3j71E9Bhi8MEeQtwFjQfvyWmi1v3IOoNgDLJq/O0o90GF53QgenUL1vHEg
	==
X-Gm-Gg: AfdE7clN7yyJgzfrD3cAiR5aNcVNfUqMirC5G8rfkMg8rLtIRqkJdJlE28nodxRdP9U
	oYecZN8TxxTHImukHAtrBCsFfLrT8CwJtB5VbdLgWcvQPKLp5dSzT81K+R0RuFYdNnMYAr+uqUI
	x8FNHuZd+nzhOCQJZ+d0mjIosTcDR/rb/6z80HkhEFtcXULo4HJ/s7jyQ9Fif3pU2L9P7o2BzGj
	pomevWUWaRNs0rrgkCsXzvFvQGlDqFmJx3FCz/+oKuQmTxZGdRswJ94Qv3fmrInd03YQhBUxCJ7
	aSzhOOQPe121Wtj6ECHUe8eb8h4yggMiOPoBjKLg8kJC6CGBuW57GJ19OFpnMwDh7hxzaI1SoRy
	UHRx40G0XX6qai3ht6SU5W+qB6R31Oonhgug=
X-Received: by 2002:a05:620a:404b:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92ef2af8da7mr1347437285a.2.1784112168524;
        Wed, 15 Jul 2026 03:42:48 -0700 (PDT)
X-Received: by 2002:a05:620a:404b:b0:92e:5ef1:9072 with SMTP id af79cd13be357-92ef2af8da7mr1347436085a.2.1784112168078;
        Wed, 15 Jul 2026 03:42:48 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1687171464sm2801666b.19.2026.07.15.03.42.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:42:46 -0700 (PDT)
Message-ID: <53354eeb-21da-4a9d-868e-970a6c4331e5@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:42:43 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] slimbus: qcom-ngd-ctrl: fix ngd register base address
To: federico@izzo.pro, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260710-qcom-ngd-register-base-fix-v2-1-0bb247c954c9@izzo.pro>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-qcom-ngd-register-base-fix-v2-1-0bb247c954c9@izzo.pro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEwNCBTYWx0ZWRfXzyOnerF/IX2L
 +gHVGfkg94HrX+a4V2DJCjq2bLbexlp48Abfd26bHbWMsziSpHNYXdcP3HzJLJ7ryGxQgJJSliO
 9+fcNseY1OtqckJLcdUA19yLeQxZxVYZtmdsJDJEwRwytcFiHLGdPfrRn3Z8234vAR12i4wHTH9
 8PNVeG6jnOsTLh3PhAx2D5iyyKdhYbl744Y+q+0aE8yb+O8ENaY3keFl8J2XP4+TpVjuvYqXNvN
 tpvUPDAlUPDZDmvXXcWbd2dOIUz1kEPEzS4DjCEQ1FKdkbrpUxJtXQwf6+IIZiRBU47eGzO/Yii
 Vy5T5si6CgcdjTwBx+jmgSD0GqLZnLPyrkUuNM9rEVY2k9EaQUPNzqNHPIigqxigNv6HJhS7Phi
 RNVhKGj2WfqBKHE3FnaezZh7wm+9xhGqHpyWpbSn90hRZTVozUSXDCzyf3l6QSgn/Yz9Wwm9it8
 QQ8mJ4d9dk0Wh3In2mQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEwNCBTYWx0ZWRfX67hE8ZDlmvXy
 oNQssjddH/czy4mhQf6bSljp9U0NPjKjzz5iNpmd39BOvjEcgXBcIbMpfx+fPcPopy/8yTliNHn
 7nBjqrKE6ERXLfr++frGAoyXJq+nSUw=
X-Authority-Analysis: v=2.4 cv=bKcm5v+Z c=1 sm=1 tr=0 ts=6a576429 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=W2E--wPkvXKHDmt8G8wA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: TFsJloc0dVJU3Es7HxvBnInDoNCol7jM
X-Proofpoint-GUID: TFsJloc0dVJU3Es7HxvBnInDoNCol7jM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150104

On 7/10/26 12:28 PM, Federico Amedeo Izzo via B4 Relay wrote:
> From: Federico Amedeo Izzo <federico@izzo.pro>
> 
> The slimbus controller register base was calculated using the
> controller ID and the register size, producing wrong results for ID > 1.
> 
> The expression reduces to ngd->base = ctrl->base for controller with ID = 1;
> but for ID > 1 the other factors produce a wrong base address.
> This bug caused a crash while trying to bring-up the secondary
> slimbus controller (ID = 3) on oneplus-enchilada with sdm845.

SDM845 has 2 slimbus controllers:

AUD_SLIM @ 0x171c0000 (the currently described node in sdm845.dtsi)
QCA_SLIM @ 0x17240000 (the one you're trying to enable)

Each one of these controllers has 2 NGDs (indexed 1 and 2), located
at an offset of +0x1000 from the base of the controller and spaced
0x1000 apart from each other (i.e. the current calculation is right)

You do however need to pass the right ID to the QMI message, so the
bug is in this line:

req.instance = (ctrl->ngd->id >> 1);

This shouldn't be the same ID.

Downstream solves this using a `cell-index` property, which
represents the ordinal of the instance of a hw block, but that's
highly discouraged in dt-bindings nowadays. Instead, the recommended
way would be to introduce a struct like:

{ .base = 0x171c0000, .index = 1 },
{ .base = 0x17240000, .index = 3 },

However that would further need a sdm845-specific compatible to bind
the data to this specific SoC. I think we can introduce one without any
regressions (because the other slimbus controller is not yet described)

Konrad
