Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CF7435A92
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 10:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784110022; cv=none; b=IDQAJBGcT0NMlYU6Qx7ziEy57aqXtk9hWclqJS0pP1Cb0MNcJA6Pl3VjpM939efJQN/op80/bebK/vcFeLfnY5vaH1VJRjjm2jBcwtT178SqX5iWia003oSLqzxh5ejlNKIpgvnnZVuaqo8JZQ3XXb5YCkwjUgm8cX6SKQmUecA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784110022; c=relaxed/simple;
	bh=HAknQiUL7XmRLQU4Bw0HEheq0vCOHeI8MTqdQuWXrJY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bE62jpica432FD/qZaFHlyyfBg3hNcRuDffhoSyDsPEuVuzoAM5KIrQN9CtiWNY1RpU1BFpfE+vTCSd7s7wZLEdBR/kBWUspAEFt0+AamqIRNjdkaNnz7hhs6lxxCe0e4pqvKIYf2g1N9XkxOP0R4dkW9a19Tr94L/WxAbTa6OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gOQitf0p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CagMcTMP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gOQitf0p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CagMcTMP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66F9RO6O3144480
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 10:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hQuytmltyngSmdwciRLeAa8lJF709BV73bAM1g2asUs=; b=gOQitf0psHkK472z
	B58sZHZ3a2Nv9ynQxMuMekcpdfsA3KJH2kpv7IGqX0THVoyE54smidNvUzZadzOS
	AavaQ8y8g60KVbAvZiKOONpzyVMJvnbjknY8/JMwX41q3JLOtOOuMFHqVeK4vHzw
	YT1fSfciLfydzVICHzu5DNVzLbijH6uZT7mgea5jHW7VIpuZr5YzSXmbO0FwCID2
	rkrmkWkPlCnZitEfKoDTtCczy3lBmyM1eu/xj7+ibC/RzUL0V3ZQUgASLn9pRjK3
	Hs4yNkFWDQ2VBqEsL7hJ2o0bc+hujiUVCFzfTfAjehxCCrA16cwZo9hSjMVEo/YU
	2HZd6A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fe7ka84xy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 10:07:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e69a569ffso104244185a.2
        for <linux-sound@vger.kernel.org>; Wed, 15 Jul 2026 03:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784110020; x=1784714820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hQuytmltyngSmdwciRLeAa8lJF709BV73bAM1g2asUs=;
        b=CagMcTMPWgpOsSPKkfnG7NjBmht7eVaP5xGxOluTTG/E/657KIvceGEwOmum40GvYw
         K1NA+O6rRp1MEPTugo/+WxMtdFPFLXmd8zApRdW0aN8XZrCMJzjUAzo2vwv4LMzeRjnc
         3pwYSmEgQglqCDo3FPSdI5Nz0/GjTDzLi5nHbMak2e4ctG13A0hzxgxsPljU1UVQwGkm
         5eAPetzSX0OLAVwA+5pj5iWDjMWTaS50q2D9h5wSKwKH2ztYl07bnBSJmX8Zo1QzFeAl
         noNdjVR1MSRIwwZI9vnOlvnsYaJidg7wjYDVwHWSP7Yj0COcqlR0jyX2Lu0BlZ6flvTG
         9OdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784110020; x=1784714820;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hQuytmltyngSmdwciRLeAa8lJF709BV73bAM1g2asUs=;
        b=eEa/ngq6ktnyiL6dn1qB9cymWKO13CrV6u05X6QY/dWsRJqYevbEyYqO4qIWR8R93g
         2qSr7tnf8Mia2xt4CmOxpVjwy+DTgV3Uv5DXf/ACptvwNAXvo+oNE6FPTnI7YuThGro0
         6hOmqkvx1BTS4Wx8osUwsYT8t6N0LMcfriCSK6iyCG629qsmwlZQzTck9LAZdLNnS979
         Ul5ILnj9HI+okek/udrn1igFWPjwMYl83j6uz/UNb547uP0wO9SuiNCynI+4x5f2fRWX
         VST/Pr3OhBvxcB/Gpv0JG/hIaPRtrP/Kb3QHWW+sJWHekx4894gSjZfedRRCq1IOpAMv
         1Rmg==
X-Gm-Message-State: AOJu0YxE6PMUDMsEfaLQHrCMQyJru+Nqk4jggWB+JwX4vkuXl8Z4neZ5
	qEl+W+FUlQdyWwoXR40HSZlS7POo2dBQPZqEdRfs5mi1mcBRzisrBolwRL8DTq0wE5iys+PRqA1
	NYx8innozLII5bL2UbUAazReASJqLGJzkiIEjzRma/flGpjT+Kwygg0B+RXKcrblU3g==
X-Gm-Gg: AfdE7ckZZx5m1pbQc4aAgaNliqQQJ4EFIAdotj21KlDym2jwxk1hJjraaGvKnQf2iS4
	I9WuJg2ne010fOViTKblKlPiDcPVVAUhAHE1p/48JbX+EGKWs9Of58h6s3mHYGQSCntT2XopbTt
	qYPQbX0B7xw6xDnMkNEu8S92E3VchmGputa8AakVAmLVc/EUM60v60SARJEZ7A2TGuPOjqS/umx
	EvSQOUo68kCSf981/fjyYHx/e0OUDhEpGINrhZCVqZQwLTEsZI0dSys+y2C/yEG19XvThYeO94r
	eg+6EMsdmfeHM0akkwoZGIeCGd+3UGpptTrqumKQFZvDO/y/Uy4iWybsF1Vg7gxkKQ10OZvehgn
	W9cr/nKL7oFPRuq77kUuErFuDuFGRzbDvX/Q=
X-Received: by 2002:a05:620a:460c:b0:92e:5023:78b with SMTP id af79cd13be357-92ef2c1a94amr1335844185a.5.1784110020077;
        Wed, 15 Jul 2026 03:07:00 -0700 (PDT)
X-Received: by 2002:a05:620a:460c:b0:92e:5023:78b with SMTP id af79cd13be357-92ef2c1a94amr1335841085a.5.1784110019543;
        Wed, 15 Jul 2026 03:06:59 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d4bffdbesm1081919566b.45.2026.07.15.03.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 03:06:58 -0700 (PDT)
Message-ID: <b2c4659f-efcb-47cf-bf91-f87ad1faae5b@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 12:06:57 +0200
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: codecs: lpass-va-macro: check clk_set_rate()
 return value
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-0-f0c713ff0b4e@oss.qualcomm.com>
 <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-2-f0c713ff0b4e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260715-xo-sd-codec-wsa-va-clk-set-rate-v1-2-f0c713ff0b4e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TMF1jVla c=1 sm=1 tr=0 ts=6a575bc5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=YT72Ugdk_NjNlKIGY0EA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 5wqV_R4399qGzHY7YvvI-hszV7B5UQOu
X-Proofpoint-ORIG-GUID: 5wqV_R4399qGzHY7YvvI-hszV7B5UQOu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDA5OCBTYWx0ZWRfX8eI0d1nKGDtG
 hHwuSZKhMLvGTLH4h4GfF2P1bnestcdWHb5gmvueoyvnqT7cMPomUjinCiIrlV7hng9+L3FxKLS
 6piAat6/LLq08OrJy0oxQSOGZdWdy+E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDA5OCBTYWx0ZWRfX7aykuWEZ/mc/
 r5fiuQGcMJsFJMOgkctOpIkUaHi+tkyk8jracoWeRbzGg/EJS2naBQD7dHE2HODoHsUWOlD2YEe
 6M3aci+h8Jc1h3bDc58Zj5cCvQ8nE5oNwQWyNlnF4WT+FeHVw+l6TSmf4dGwjYA9WR2yrYHJJT+
 BIpgB+V+S0TQkefN5Sh04+xzTmXAd2rSBMs9kf8vuGzDUTUXl+B5GWoYeaZinChBlDLNNHC3UnI
 27hiq/KfcyY0BTQzAsRTOlBjMnTMcfzTsG98A4OmiooCZ/GMOACz5zKLxXyuKBdeiUo6r4Yqn8/
 FOYRqt/hX5NsRk2RePPJ+QQ93iKvwkjujDHYOjfh3HAKMW1fdYVTz0RoBDp8IcnHdhPxidAyXUm
 uhxRcVdMggSMctNzb3FE33Hcbe4U0bdLVsXNGbIOEIpwxGXMfMP+BXz2ogMww1kakjZP3LvvqTt
 dlJVFCWZwRXycdnPU5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150098

On 7/15/26 10:29 AM, Ajay Kumar Nandam wrote:
> clk_set_rate() returns 0 on success or a negative errno on failure but
> the VA macro probe function was ignoring it. Check the return value and
> bail out of probe on failure.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
