Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294975;
	b=JK44GHoK8ZPmwLhOC7ydUfBnu3Zlkdne7g140qhouA2pja0GSXiOQfA93lYVlXM+7DKz
	 2Gf+c5pxmllYklqffzdgcqEJqlA0e0brEw2ismUCvqC5gLxGYWEl2j7I8/n9/Map06PUz
	 HwqF4Mcb6gBsAsNjyX2g+fEtZXcb+Wx+/kIJnd/r1wXAYq6LEZDG6ie8vF1rERHEY7SoM
	 waizK7fCObN3+vDFE8HKWm5FB88Tdy7yGu2hrirAY1Px4HTElIExk0rDY1ABbJ6K42jLg
	 B7RhC/yy25L2k7ebk81R3OSqP920lVkDHSbuIzFNRzvFhqJTj8Da5kRtRMyoRXlXO7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hxmzuO9OtgbaXD0ktYtWzy0CyK8952jBK6ZqziabIvg=;
	b=BkRX2tBoZU/5pRJzEpIE2kQ6JtcXCyn7mvODh0o7wjyszOguJaeeqIjW0f7gqiUcIMo2
	 lCeWq1TSmKfPedJJW26ql4ueTuEMS8GU9H0fesbnYBjbbyAAPqsLb/0Jag2leg0bpix4P
	 KRMG8GZ6qMDUMDakw5OQKZhe8QWB27b23opwOVYbjfeNGzdVSUZlhHzIZ2a9gGT6iI+GB
	 4c/cxi/tGFvvjI+Qtb3M9lK5VZtVvsnG+mIcL7twDKsoTd2ORscsron31XwCZauMFzg38
	 hC0x3m+1zl5UVknFWHYXIVSo1MTa8rBVwF7mF0c2lK807ORgEi4zgmdS9fIPlj6iyhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfdJGf3K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="UyzzEDp/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70A9606A322
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 17:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C70A9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfdJGf3K;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyzzEDp/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGDBMo1143729
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 17:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hxmzuO9OtgbaXD0ktYtWzy0CyK8952jBK6ZqziabIvg=; b=ZfdJGf3KiMt+tNis
	GFHP/jceO7rWXyXSjC6YBKZZh7yO2wARMFUJki5uYrIEIefxQvLc1/LdrmSsRZRw
	lrLmkoOLc0+m44rJ+CcizXxXrcdVm+/5NDrdR9GP0Y8U1ogA9lRVscOitejxOqje
	mnOIFf7b8bXNNkXM0HwYCaVNZsl8ZiElKHEpqiVDH1mKpMBdJ9eWIStvn1JVmYBi
	vla9XtCQPfMZJusOjGDh+QqKQNNn8lzvHXtN9puTrDmCqGmMwxRZ5Q9ukQbjoEyl
	lBwyP+RqZnaG4JtPcg0jRkGcncj6k1M9gy3f4rMD6/ITpxzEqZwfwb78t4rbTOCA
	e/Y1xA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm76chhqp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 17:29:33 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1ac19c6bc71so4849c88.0
        for <linux-sound@vger.kernel.org>; Thu, 29 Oct 2026 10:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793294973; x=1793899773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxmzuO9OtgbaXD0ktYtWzy0CyK8952jBK6ZqziabIvg=;
        b=UyzzEDp/760D3NykvygpAoESDrkFN8YtTduncyNgA6kKtqj1LqB9yYGd5657ynJVOa
         APzXSdJKm6Ob1RIHPzCMjSFSM3CQEcrMSFtbXyIJl3F0nf00ZQDeuxOw4RB61QQTORvi
         ZcJdS0YSjouGc8SCY479dvOkPkFE13v5SbdQJ6CLqbk7M0mOG2fgl5tWJC3bQp8fW8Ey
         aXc31tzClAlz80gBJoKEYRJCBTdYtxYEflX5Bw4SWf6hms3yT2FVA7NWRrp1kT1JqqSd
         eVAoon5e4LYRClrfjMem11OgyJ7NFt7u5jVTMZKedkiQeNspgF+s+JmSZW6nO8rgdGKd
         w1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294973; x=1793899773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxmzuO9OtgbaXD0ktYtWzy0CyK8952jBK6ZqziabIvg=;
        b=Cw9BU93wcN5UwMXfTLqugbmxllgolyOWmPpCu3SJysUyAgGMbNlOHHm2BES+dG2ZlO
         Uzt4ce40toenJ+UvEwD5jNqhG+4uOIiPciSKmHTPE2c8AWGY2OhrDNaBqNdbBRpNj5Jt
         t0r66T8ImLMiobUFMhllkem1qrnAZ90VPUJJLfyfSfsea1DRS8gefxQSo86Zolv4ux9L
         HaykY34qZit/nrfmAUypiRkael5SLVoHSWtV5pI0zc0/z0l8ZZ8h0oP+BBKMpwyi+Leh
         IudbykC5qEbFcCZiIO4XnB1h4/473xOw7yDgtdUwqlWnICmsLHbK2y8NCRXb+fP7o+x0
         /AXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxGuvKUW2ZSOb/V6LNWTzCe9lF17FKhRh7oTXYG9BohPggfphm/REL7htvGEDC4+hehbBI2uiivEX2lQA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLrCHqbhPh8fFgd3dy373twi0GH5FuSQi7f0Qn8Bz58r4bDfH7/
	PtZgiC77rCc0OEwO1hkX+IaRCwWYy7MXB8msPqVmT0Hd7OIkE2gndXG4N6CDofzUNGj60D60TL4
	gPd2HUNX5ixT26G9MqtsfCXXSqfedI1OMWUKiR//mK06tLN8IVpcEMD3N/A6UWgeNhw==
X-Gm-Gg: AYBFou3FRAGyDhOSYLTK+n5WpJd5CKHyC7xTcgGRmE7xB15WeK002x8FK+o5CRckoql
	CERNKMyP4hZxwcjt+ZT8ECpbOc7DPDa0/jHGYnSbTXHkLBWoiqqR0RKR8YDWElfNREXbeufHNHm
	ppSe/YamD8HcT7XI3331x0MqZ7OjN+bI0UqkUEBoVK0RHGgZ10uYBszFK+XgldthzNRUgWz7BW4
	xZGLHy4wSVvO4xNTzwb0BKm35trnNJagea+r2rEX858nn+KIWyxOG24g8nF5auRuTU7UR0SepUf
	OrkSen+KIKdQr/V2qyRCxLVhq+oM+H0FTCQ4aaJ0pyrx4F9XFaZuWEHDqNe6TVcW592Yh9pCzd1
	fJik47YKKCKhhfJpfbc7t5JX+07a1xjiLuYiZn3TXKBytEC+QPDpj1kSQ2TZxAgJsUOMZc0w27e
	uFyLgPfkgJ
X-Received: by 2002:a05:7022:3a85:b0:191:17d6:ccdf with SMTP id a92af1059eb24-1a6cd499501mr8224226c88.8.1793294972533;
        Thu, 29 Oct 2026 10:29:32 -0700 (PDT)
X-Received: by 2002:a05:7022:3a85:b0:191:17d6:ccdf with SMTP id a92af1059eb24-1a6cd499501mr8224181c88.8.1793294971752;
        Thu, 29 Oct 2026 10:29:31 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1d4dsm136995c88.3.2026.10.29.10.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:29:31 -0700 (PDT)
Message-ID: <c28ddf94-9bfb-4ed2-977c-4b1731a03887@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 22:59:25 +0530
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
Subject: Re: [PATCH v2] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261029022340.591372-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261029022340.591372-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1xark625QZCQjeE9xcQsNxmXRefBJyfu
X-Proofpoint-ORIG-GUID: 1xark625QZCQjeE9xcQsNxmXRefBJyfu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfXwgiD9nEGwS3O
 cTFd/M+rb/jBWK8d0nIsrwq752J8mMl2xdGBFe4gNJ0SJrwjopaO6FY1E/nzNI+HsZD2zqKdJ/P
 NLm3cHh6Baxrb/YBaN2IavfGLNlGduU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfXxmLhKGDWSzaR
 uI0LiM2eNGNTkfGZwEwae9tX3bwZKtBvmOu9sPQaSYUxLZYXO3vMgYuLrAYLB0XtNDcYqIfl+DC
 16bQf4OeFXQ+Iwqp/T4pzfiw3XyXtidRGwmGlfeP1QCLugEksFrEP0qHkhq0u1lNP+6sspnI/Lm
 bEBxEjTar1HgX8jSZFi59fPKcGtLBfB5bRvOBzzvXQi+hBqrBmGTx2A3GeITwjHVA6eqnD+vhjY
 B+E2sRG5o3TgB4mNU4VjWsFr0LkHguNFyLEjdo+9mKIQ4l5u+cRtgsp/aic28eahvnF+z6Hd9IH
 I85b0uD7AmGVlISab3WZLeRF9jiok8fBePbIB4FV56y7RNLl2RVwnoLTiZeY7QAhMT7g4XZ+Wpq
 V14eREuD+fumoeL7tnCksXw8CHQn9A==
X-Authority-Analysis: v=2.4 cv=NPtAaE6g c=1 sm=1 tr=0 ts=6ae3827d cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=tgxUJJewBViNwYeMPcMA:9 a=QEXdDO2ut3YA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0
 suspectscore=0 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290068

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 9aae6aadd43d..f5b147962afa 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   	channels->min = 2;
>   	channels->max = 2;
>   	switch (cpu_dai->id) {
> +	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12: {
> +		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
> +		unsigned int mask;
> +
> +		if (qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg))


qcom_snd_get_dai_tdm_slots() errors are silently ignored here and the channel count falls back to 2.
Could we distinguish the no-TDM-slot case from an actual parsing/configuration error?
This would also make invalid TDM configurations easier to debug.

Thanks,
Prasad

> +			break;
> +
> +		/* Same slot mask selection as q6tdm_set_tdm_slot() */
> +		mask = (cpu_dai->id & 0x1) ? cpu_cfg.tx_mask : cpu_cfg.rx_mask;
> +		if (mask) {
> +			channels->min = hweight32(mask);
> +			channels->max = channels->min;
> +		}
> +		break;
> +	}
>   	case TX_CODEC_DMA_TX_0:
>   	case TX_CODEC_DMA_TX_1:
>   	case TX_CODEC_DMA_TX_2:
