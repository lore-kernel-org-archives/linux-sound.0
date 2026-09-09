Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281525616DD
	for <linux-sound@vger.kernel.org>; Wed,  9 Sep 2026 14:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965197; cv=none; b=uAZJemjtARn9zJnlVDmZ4h4Fjtj9XCcWVFqJl2qDvA63ElljMLNuIyzHZrTejbW/PDa4Dwi5Ra+o9ZPuMe9LKLLiisrnKnd64dofgWiG8cLX1QguRwDxew37/DwhgmzmribKWR8QwAwhCZSuRN0UGHViThKrYQBeI9izPjSgQj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965197; c=relaxed/simple;
	bh=WHAwSFxjJ9jgZVTN/2aCy/s2cSEyKMoGgPrwH9znzMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kwasxm81a1WQsYdPxPum52vg2OpUhuX40uCFnw7xUWdwNug812aXhpRtFRZisoAOYAbAhPvFENM/KHUQtVgNPfA8/2+I4u7YXQSTBCanM1SSvE1jBR8IUSd1xKO7vAAu7dfkhxtQJPIyD2EQ34+728ivJujW2e1ziD6TGfi0eLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e42Jb5x3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UVbh2iK4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e42Jb5x3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UVbh2iK4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUB6W1723429
	for <linux-sound@vger.kernel.org>; Wed, 9 Sep 2026 14:46:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=reXlk+Vm7ZoMhAOag4Zge8fS
	Skr3m4Ae/zrxil59VGg=; b=e42Jb5x3QIzQNc+9kb+0RqmO2v72JM9MAMlUWg0j
	XmnZEW3ODMLTKv8Ah8vAjnxdnb6N6DnbnDwAelnNpcuf/H5kcNfK5UF0PUT9/BRq
	/C37hmtHGTc6KUbho1410OibeMoTybEllXVQhHGmpVxJFMRZdM/RDyVED3KKdhi0
	JY66JdWtN2mhwgb83wxPeiG28mk3m6MqKy+/Ju2yrJ/L5VZwE/NEzwptBt3ELHRx
	xUTDzNsc4v20pt8cgVqWEwT3QJAiOmkA4fihRv7Fv6vuLoorJEDZLZW8NdWIXKHG
	kA7h8FqkyTe1rgqbtLaQifUhsH501b6gnRv2rzN2hgxVqg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk5cns58b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 14:46:35 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d6f80c76e6so114788215ad.3
        for <linux-sound@vger.kernel.org>; Wed, 09 Sep 2026 07:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788965194; x=1789569994; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=reXlk+Vm7ZoMhAOag4Zge8fSSkr3m4Ae/zrxil59VGg=;
        b=UVbh2iK4vp+oEqvqAcniOgtjujRgJPsLwu/fkCFAtzkwY/fONwrVn7MgiWTaiayDgv
         tEV9owr/y7A4jAn59tY734B4ZG/ZK2MEiAZMxgTDF+gm2Z3jqmjYgQNcFt4E3ywLmt7q
         BC8sdZBmiywHyUFjlLAHGVGZoaw0JFyeITKIsbSb4Dd+cZI6+BOiDrJY3xiwpPY5qF50
         1ExsfqrWAJYMuZHdZq77h9tBFaiFmuOHPSLVuPgeMHnpzYMwbtkbkRFIaPd6gL0pXX2c
         S4HcsxU0GXzHFtw9MRqRok48KxUwSsO/meroGQPE4pnhwhTkZVl2N0Pf3dx4OOLED0Cd
         nUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965194; x=1789569994;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=reXlk+Vm7ZoMhAOag4Zge8fSSkr3m4Ae/zrxil59VGg=;
        b=dr/P6xfXZZgu2Sic0pH6081QAKiOrGLyPj6qVklm42tjRwnN1ubpfzc+Uq3/4HpRkD
         OeMFQwqIOqK3VV05dgzrNNI6n6TVG4hMsC6a09Vs3Ah9aeS5wiZ1XSufkqYFiAW94kUR
         KiBUw/xWLg7hgZYFPzU7YOjbg2U8fFmg2GEDDG/hIWdIPbaP1QtHb1affCyakbQCZzef
         vnIDnk/vgy/pwuIqmf9YHF3kFgUe5TobtLC1gXSlevekQBpDkwuUHzRxyG125+IxJkXq
         J1pnrTrTA7Ts5y7za5Ea9Dh2OsfcJavEPe+Mowbb2EnBG+lncNcy2QAqK17Q9PY5HW4j
         4uWw==
X-Forwarded-Encrypted: i=1; AKwUvBzfIDePl7VUt6hBVqWlN9Okb2BMXaDuTcvBLaMUCn7ANYlFYGVRWtttesDtj5kWYIhPwXehBCq4yR/2FQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nwyol+/HL6bZsCVT7Zd9MjP9XDCamquWT04LepOYJAZqcxnWfq
	BhJaqkgjI973vl8pwZTErtSWe1C9Y0+XPyNyY9eSFRVw0hf/Z6eehMsrCjKfogig9VnCP57L4Mk
	zQO59vnMsKAmc9sgalYipHuedXwv2IJT0l+ukmqgZgSca91uf108guYEqpGMR63LOQA==
X-Gm-Gg: AYBFou17Hoym9GGsXQ4qhermFBscLrShGMp+ogFHEPSNbto3ywcICCOXMnb2hiVmk2y
	0oyGHRgZcDYgiQzrG7WxA2XWo/38pZa5WWZ+JQrbbKxvkcTmULQ9GTQMlyZHfZl19JSqHjFGB6p
	7nEf5Zni1d8KzZDPg0DygW2eJnVYs2S66ENrJ9dh8YQlTvS9qpm3isRbVE8ujLKT4wXWBEgOq/G
	0KVAZXK8ZfZAQo0E/EEmjcB+Q2PeNoIt+QKOoPT+HHL5EjVNaK23GFnLZTyn4w8A5Fgj/AdTrHA
	yokvKtEiKUfHSgAKkQaYKkcvdOGybV7jPJ1xtDKdhluhkPdkb67rJeR+xLr+2Sfmp7FfQbDupsD
	8a6px3+XHtIZxvP83hv2dxjxzQ4rTPqLEc+2LMWfIR40=
X-Received: by 2002:a17:903:2a8b:b0:2db:117e:cf50 with SMTP id d9443c01a7336-2db8d8179aamr90365385ad.4.1788965193996;
        Wed, 09 Sep 2026 07:46:33 -0700 (PDT)
X-Received: by 2002:a17:903:2a8b:b0:2db:117e:cf50 with SMTP id d9443c01a7336-2db8d8179aamr90364515ad.4.1788965193455;
        Wed, 09 Sep 2026 07:46:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db149c15besm76126695ad.61.2026.09.09.07.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 07:46:33 -0700 (PDT)
Date: Wed, 9 Sep 2026 22:46:24 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/5] ASoC: qcom: Add Nord Ride audio support
Message-ID: <aqFxQNkuFsO109t2@QCOM-aGQu4IUr3Y>
References: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-nord-asoc-driver-support-v1-0-997d3b20cf43@oss.qualcomm.com>
X-Proofpoint-GUID: pbpTXDlgosfO4Qw1eS-lrHu9nrgpmEzv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX1GglY7VoGJ9W
 iG7NQJIjVcHRHRc2AlWef9ZhKtR/OFL2s0thbOiEwXexGAHAMfzBTV2TRYM5SWLHh1e98NmLGyA
 PXZZwNq2WwCX39PAgX5hYovYby8ayH0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2NSBTYWx0ZWRfX5HdqzFIYKM8E
 BPsSE9DsI2ibcmio5MeSwsVghtAdkiNQUQu74Vsmi5UUeY/eBo4S2B3apErcRsq917w15T5K5k+
 62lgiWgDajiSY4jbBQcee8VGPozaNZlnVh7pUJqjC6O9UXXbSYcvHEDNAscZLoWdaKPGPW99KEz
 JsH7mU66UM2bfGb0bE9hHGhqDwQAMno4XZGzgBggm+7OQCIIAXzRbgH+XjzgW27M/JnAhJOJxvd
 Gcu7Yw9GpV6ZVnj6Ex+NTh6r20rullhrOop2P22vEas/oVyTN2GJnFd0VPDBY7PAwHZhitMOdht
 LeWfzxYxhiJt3zBg0ALUJ+q+V0fRJf9WFTt5rOz8R4roOIIzkj3TCCd0MTiMxdKcWeQbO8zEzBm
 hdsKDtqUs/xJ6OmB3tPJSy7GNUbQudo0OJg+lCUMQAIX97n2v/iAp1aBsMvZOcq9UH3u3rBtPU7
 wu4utZS2ORc84dp2qFQ==
X-Authority-Analysis: v=2.4 cv=S+jpBosP c=1 sm=1 tr=0 ts=6aa1714b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=zgeMqk5D11JPSKe89ucA:9 a=CjuIK1q_8ugA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: pbpTXDlgosfO4Qw1eS-lrHu9nrgpmEzv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090165

On Mon, Sep 07, 2026 at 11:39:41PM +0530, Mohammad Rafi Shaik wrote:
> This series adds audio support for the Qualcomm Nord Ride platform and
> includes the required machine driver, device tree binding updates, and
> codec improvements needed for the board's external audio codec
> configuration.
> 
> Nord Ride uses a PCM1681 DAC for playback and an ADAU1979 ADC for capture.
> Compared to other SC8280XP based platforms, Nord Ride requires
> board-specific DAI format and codec clock configuration to support
> the external PCM1681 DAC and ADAU1979 ADC.
> 
> The series includes:
>  - Adding OF device matching support to the ADAU1977/78/79 I2C driver,
>    enabling Device Tree based instantiation.
>  - Adding optional SCK clock support to the PCM1681 codec driver and
>    documenting the corresponding DT binding.
>  - Adding Nord Ride sound card support to the SC8280XP machine driver
>    with board-specific audio configuration.
>  - Adding DT bindings for the Nord Ride sound card.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Hi Mohammad,

May I ask to be copied on the posting of Nord patches? Thanks!

Shawn
