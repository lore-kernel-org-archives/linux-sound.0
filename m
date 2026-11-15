Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739844;
	b=gE8MzaPb3Ul0oD2CmDPDtbpi3eaUNCUidCkt5CjxPJWWz2lieU48Xx0wajptALKba4hi
	 Qi4wNMabcbNmO+I+rFY/bG0cV80dM5aTv0uARFXDHtE8xEOg0ZRf1rBP9/xAI6g5VdsT1
	 G4rRxafd2U8IqwnkgRoSFGr8DD5139gcTUqnDEQUMA8aeQYhJQ4YqJ8xSxQk9W0TjiKiY
	 Z4V86598aCLg03WM1lO6JGw/0xKM28MvXTSbPHKJc9WXMeaH8I+F3twkYCSPhbss2mG3L
	 rgCSw7iyJ7t7HOEQ5s3B7m8amzbK2OJU13j0uOYrgf3qTrrb/3bn7oLH3uiuCS1nV2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yop3kT58qwR/Xl9syoWFG9U+E8lkKWEQu0m0TSWLIwI=;
	b=vRtMbejTvtpj8X7DuhqROIIkglhwMHbelVs0pFt505tZ2D6G3Kf5RksAYySfLmyquuRi
	 tNrZMU8D8rtUpZ6oms0RmH1w3HRENr37DUF4z34nFPxcIYJHUxVXSIJoVZ+axnHO8flFF
	 78pRmwLXkYazlJ6W9Ts2VYfyt7fLFMk065z2tZJdLMxY7Ta03Cv5gpJ2TSLdW6Q0G3JXz
	 sF8FjZoVnEjABGLrIewn3gpHwYhvbramKN0K0gUawl+oCKi8UVXc0gfgklKSSEiMOq/m3
	 NugIRQffW6npWGeyllddDMrVmgfHNnRdkofsHIoxeJWFviT5OTzTnGqrrPDs86Po75w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ijrvIHpc;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y3Yv73kt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA6B606A31D
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CA6B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ijrvIHpc;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y3Yv73kt
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7whp71196882
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yop3kT58qwR/Xl9syoWFG9U+E8lkKWEQu0m0TSWLIwI=; b=ijrvIHpcx1qBsm/w
	KRn/rKQhmJIZZITCLfJn+vXLjrNa2aSnNocDk++/FFjH8WFcKFnJZmvTkHV8phHo
	yAZRwMNRh8D24gGbCJKSGCx2qfN5ykE5WBjtaONIySRe4rV8dn66JkE4coiUAhzZ
	r7uctxYvOOLF3Bm+DaVZ0IcWMtcIEMIFx0CfvnBkAf+7XXoeTB4ztux2iYFKSjoN
	C6NPO+7OQoB1srHqlrsVtKkF7JTCroj6nK7BNo47n9V3pNhnN0x36cgRf0O32VFD
	N1ioCfIXFOPcve9Ncw6f0cq7I7BXsrvfrHtPD76rptnj1/vQ0MzMKT4WI9y8DJ9C
	eDJosA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhjsdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:50:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so749917285a.1
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 02:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794739843; x=1795344643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yop3kT58qwR/Xl9syoWFG9U+E8lkKWEQu0m0TSWLIwI=;
        b=Y3Yv73ktyBlryfyygYNaH8G9mu7fuR/HKeKj/XBwmDXFnjO96byQy3FHuxR6xRs++2
         ts3CuhlfLUUkr9QwiXqU4FBcY2Nj5EvVAWnV4Q8Z8AEloUeYD3HjVlep4OmmoAI5TI/5
         F9TI0UzZO2VqCdQ+Gfckvwgn3F0UiGO4hxrmwmj1hQRufmZk+Phi2zYrpKP44yr2gX81
         58WC50y80efXQjIaG9lM0V2WWdNhbF5P405sU4XADsFiESbM0FrsDTP2Yrs+iHAn+6Fm
         EXu2ZE+jwhiGZlCWOEHiQOuGi7cl8R1aMgQwQnUe75amxrK1gJLrIX7mDJYUo1EPZLB5
         TtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739843; x=1795344643;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yop3kT58qwR/Xl9syoWFG9U+E8lkKWEQu0m0TSWLIwI=;
        b=T3nJqBonQu6INzB4hsBiqCfL0uf1LYPgzp4YZTm0JfVUqmlBjYSKOzAwYy+MfCPcZX
         X06xcRXqcseSqi/LpMGU4r5Oe6yfFJ0uoJbUk6jQqOROY9Oll21LTpigYXvxPtiz2GIC
         sscTVL7nZ/kaMBPZeJCxOgkp4oV42Zq4DrN3cCTRweUsG1qUMOIqcWDPx0MmKyQZXscx
         LXna+g5rztkQCOxRtCbeFpkvhw8y93IQv46ENsU+jdahzFF8OKppVfdE9imDAU+WJEVg
         wwz12ezhRf+BNjkVw3VwmtDvpCn8jZVMU/Durm2sxuoi/Hkz/W+4+0ckLa9Z6RtQ6NTl
         g7Cg==
X-Gm-Message-State: APuU4Z8ycs4P0QGBcLzz9A6FiRb8xA72IB+cEVo0pLrLzSmGkcX7j9vb
	H6Ex7tTrIEZ/5jBMHAxd3x3y6SteTT36vBoBYsABLGNPZ+D0ZtgcA1i7bMipctJGTeaLfedPYGo
	nKP6XxxKFtxH0q6Qq0pdkygnG1QtGht6+uvF3DEZsxz/dtg1WPGtZrq7dPbfALXQeFg==
X-Gm-Gg: AYBFou1cH7Sg/WSlrZ4zztQG9pWkXB5fuNfCHKJ5PBjZFntuUssNCO4lFY9yERLlQmj
	eyjw+SugDZxooJzM5hLlNSUy6F+8Ia+fFyoyYKO/VqyQfDNIxV/ibzCckFp4jlT0Vg3Y1ZWDAef
	iSQBaAMQXJ0AbGHAkmmhFcjLtwv4wzG5+StqDACoxN1WczZNCBWhcYCXx2b5t6bKledDzIyYcnm
	3xb9jMfb/TW0fEK/NsaKGTJHXDloHmcAYkLIYvXw93AHkJ1Acs9JWv4kTpYsyShKI56RFq2NSNq
	4KIbdtUiCMbvMwVP+IlfVuiE8P76O9nEdg8JY2P4F/6wZtTv0NPShURqmxsrovCMpp3O3fk7Osz
	cEuQBP5x6hNhrUOkMCqxM1manLNVWNN+MtvWgZJkrdTw7O/+r62ii4zg1K3+DKO1KZPdPP2hURD
	XtoP21Ld3xXBd10AYYqw==
X-Received: by 2002:a05:620a:1a04:b0:949:74d8:4713 with SMTP id af79cd13be357-94974d84d61mr209325685a.49.1794739842839;
        Sun, 15 Nov 2026 02:50:42 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:949:74d8:4713 with SMTP id af79cd13be357-94974d84d61mr209323785a.49.1794739842409;
        Sun, 15 Nov 2026 02:50:42 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c2361242sm3272377a12.12.2026.11.15.02.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:50:40 -0800 (PST)
Message-ID: <f8d9be2d-b8a3-4f54-803f-dd9c974280f7@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:50:38 +0000
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
Subject: Re: [PATCH 2/2] ASoC: qcom: audioreach: only disconnect the route a
 mixer control owns
To: marcht@proton.me, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111-q6apm-fixes-v1-0-1beb5702b372@proton.me>
 <20261111-q6apm-fixes-v1-2-1beb5702b372@proton.me>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111-q6apm-fixes-v1-2-1beb5702b372@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QcN94glDzlu5FiXklqlNz0wVCGxhnjuX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MyBTYWx0ZWRfX4YKRm3h4Px4E
 GseUuJhwvxrWTtPvEfbrd7SGV2F4YVlQQOZzxlGNs8bLTK0ub1FDVQHi7HZwevl4mIc+V5UC9jk
 CNVuIF/DAFPkG4Z8NnfMsYDEGcB7Gvk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MyBTYWx0ZWRfX4HmfLfpzeytt
 ZVIr5uDHRXZtu2U35B0Pp+8gKowqU5kNMoM8OehsdzGFVUmnA0dtJ9BYXDDZm5MmR2FNv61qXbX
 cyYmHujNlwXvvR/YtXG8MRgnDhlVn9lPP/UxhW0hUSTQ9bSR7hapXqiIVHs+ZA25OOLiDTubJr1
 0BV2R1RZzSmQMYv6B0gvFQBLBslCMtk/kIjLVpqE6BpRBb8uTLL7JUrUCeI0tpP/v/Z7mQxdKfn
 QFWDz9lQgs1R7USmJGz3g+vTQYkVNJXUVVP6En8oD2ez3Kt9Pyvp+1FMIpB0MaYweD1eHJc0qCf
 VjJHzox81TzZJgauyV4qRj3ivtZooxpNCMvgvR0ewmfBeLxoEEPoAq/k/RpIzpcGFZKb2lOrH1i
 2Ydl58+RBxdAg2o55rfpjni/s+Nd4dj9rtcuEAvhfYTzkwzJ2VqZm2Vx7wgXU9iPLPfWWKldGbq
 2T9uwcNg6cr5JTr7mEw==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af98e83 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=zknksMb4cIbI7LntptQA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: QcN94glDzlu5FiXklqlNz0wVCGxhnjuX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150043

On 11/11/26 10:54 AM, Marc Herrero via B4 Relay wrote:
>  	if (ucontrol->value.integer.value[0]) {
>  		audioreach_connect_sub_graphs(data, scontrol, dapm_scontrol, true);
>  		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 1, NULL);
> - } else {
> + } else if (audioreach_is_vmixer_connected(data, scontrol,
> dapm_scontrol)) {
>  		audioreach_connect_sub_graphs(data, scontrol, dapm_scontrol, false);

move this type of check inside the audioreach_connect_sub_graphs itself.
--srini
>  		snd_soc_dapm_mixer_update_power(dapm, kcontrol, 0, NULL);
>  	}

