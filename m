Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095943;
	b=azR1p/RE03iIOa7DjRR9nwrmRhR+GVS7LpqdFN2B/jLTqs5DTMJJ1hiRnoohPAPqsk7q
	 AP3IHh4VP75Cudyx3KwFEA2jgKyap0u2iqhfMGbvCzfIepbFeeuifRu51zsXPfJ61ipQb
	 wmgA/8gaFNaYpyFXqhjAB2Mf4nFpIMxQAnqKjpBMNdHYKzn1gRYV/HJmv6iIep7Y/fTgC
	 hB/uteDTHfkY3X3zyvtmMwssLL4zAIE/0eotx4M9Nfm4udnGZ7s4I8G3lyjW7qmwTMTwy
	 kkF0AVHMtsg2h71IW5ND0jtDC6MpFnHUPiadgPfGr43NWMcHnimcS095aNXB/PDe7qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095943;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dZnFHrUl+Gj/kFt3fJT8/StQYbFIpGVV57CGxmYbwtc=;
	b=DH7PDgPLvXQq0rBo80dvV2QpxK3d4JOWFItEUYUil2ctFxGe+Wx/QnM5cEgi3a3QAXOs
	 AhEDGpd+EeUeIVGG4Io5pNh5oPSVyqoA03zGWRzc7nvz5KZwWjNy2jQ3tIjrY1OM6fFPF
	 6uOzttOkjiRatNct13RA8rYbwPNDFuHS+SmisL5/nf+ximWQHCa18zEHCGiAccxQG8Ox5
	 18YIemmQ2H4Y7UPIULGmTsLcvYQKc0008vhM5sr+Ck3PpIqUbtFPhjS2RYpSw9DI9LfPN
	 rkKHLT6TmXeLkb9cZlaZdmZtanpVo2H5wyTy7oRarjJvNXcy6DJxqBIWuvlUav0c9bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLSBDTaN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=akr+87RG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB47606A31A
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 10:12:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CEB47606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fLSBDTaN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=akr+87RG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8g49d1672062
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 10:12:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dZnFHrUl+Gj/kFt3fJT8/StQYbFIpGVV57CGxmYbwtc=; b=fLSBDTaNKRLh2hEr
	yvyVAWGqth6HKonr+sPGzLCqrP94y6OfJVrcQOb7vtsi8pwTKEGTU7ZPRP3le/+h
	yB1AEwd2EC6jpgcfDUBWBKtZq3csFAAkwFs4BswZCNdCOTHwPJX+pmiGhIjUGrh+
	n/vgq6LStHXHpVxWp0cNwCnC+uvgL3SKUjEgwZgu3RAyBXvybGH1e5TLvp/pv1Bu
	HffWM7TtzD+VgivKG80LzGqKzNAxjCDY7c9oEoqnfx5NN9icM54jplEZKTGZrE0E
	2Vt6LgFs/wuL1lSS+r4nsCOW1k+nNMvHixLWByJGRtQraiGlFGjwyaRRXFGZ30GU
	66E98g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavt9yn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 10:12:21 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cd66551e02cso4239249a12.2
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 03:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793095940; x=1793700740; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dZnFHrUl+Gj/kFt3fJT8/StQYbFIpGVV57CGxmYbwtc=;
        b=akr+87RGh5+qXhfPHP3Rc+Wxe8dIyairNR+xYvf+E0FnpVyXauNn4cXK7KCPj5Mk9v
         KnNArUR3pqWz8hc8j8wCTwXjlxzf+9yUerjU3GuVA4vg67MR1fczxAhl4e/J5rZdpe4d
         RrZyqZnxgsgMfDXfkY1VdL3Avfjf6bnZ15SZ5L5YuXPlEN8CqU9ABbuD7yPiojWfR9wr
         r16dDpJzWoPLkXe+TM88PPPzvpcXbEbgE6Z4M8yulxHOf/KR4VFfZK9S+oOaC9OK2XmY
         e2GutPTEKhI641/i6aTf3Q08bMihlpOgpj9cf3uB4Vdzb5VWszusbtIHkIOYL/p9TZQo
         kKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793095940; x=1793700740;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dZnFHrUl+Gj/kFt3fJT8/StQYbFIpGVV57CGxmYbwtc=;
        b=fXhBx7D75HzYYSLWery/XGHXXs/DTBSM+B9CK0lwM7bcm5wbejvpfdGl3LEPAiW5cp
         y8eCiWTVkB7dV3ZNd2/cbabjh9geMxqiConkmuKFBQKaLaCkSCUengWzBHjI/WsA3A9T
         Zf8JmYa7CR5oZGdf+/ZRItNvJ9PKsQqczv4e+lMHzpbeZLw/II/fQYWNn3/zIB3OnktM
         /O05gdXmZ2S0n0mO59qE8nx5h2jejIlu8+pFuIVFNozoZxR8iAr616JqbHAA7grEZS2v
         hzjj5SVaArj8zmWcwVUX5rBG2agzLqI3XJZLpOwesXv+CkD4tmbBEvbLtoYJkkZ/vTW6
         LFjQ==
X-Gm-Message-State: AFq9FYKEM0ZkyQgcyeCYMcS6KH9D56PqyI3nGvgE0r1IFPES40Uy9Z5l
	9ezmQByZpKxq26z/0DjH44Dpcp5Lk5hJHvA7q7dKx2lK9XV9HUqZxlB0spzRqFtPozN8KzNBs4F
	cZUiEKW9jOQ3djZXJMkQ76dqQJCs06Z2oh73R+0Ij9e4wibSx6gp8dr8HPtC0339NSQ==
X-Gm-Gg: AYBFou0xf/tmjA88KMulU3MtDwxe98co6JNqUaoGUJ3bTXHQ0QioAZwXn29tN+2e0Rc
	nTJtkLhzHLGDdVzAonA1xzaf52+u7FPrVnhYSJ6M+q2cPAvCj4/Afh6LKQQGSdBAd1/G9ZegCMH
	CAU6eRSMQPwNL/7qMhlidqCvJLd+L+WYPe/wT073VvInSAPTOeN/BgFe1hZCze9d7MC1TZjiTON
	ZUNB4odpcJA8R/vK3wEk5OsNZDlX0f/0Ur0crYBS7r3kzAUj6K90xDI4U9Jd9TuK1JHBjRb/hzE
	d74Ocn3ratuy9B/3dOh1H2YynlR50zrd6EraoRVUe5wtyE4GNgpvoXn+v5U3NK85NubhwcAGkIW
	XtkRcw/B0HeN+ldMJJXH/CcFFBRTjvPUmm4bGDBcmz7Yc709ch1CmGBYkl7nCeDl4GI1iYtLiSM
	1ngtYAeQ==
X-Received: by 2002:a05:6a21:35c6:b0:3e2:3392:53f0 with SMTP id adf61e73a8af0-3e7bfbdbcb0mr6810830637.14.1793095939954;
        Tue, 27 Oct 2026 03:12:19 -0700 (PDT)
X-Received: by 2002:a05:6a21:35c6:b0:3e2:3392:53f0 with SMTP id adf61e73a8af0-3e7bfbdbcb0mr6810815637.14.1793095939506;
        Tue, 27 Oct 2026 03:12:19 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc666d1sm2442498a12.16.2026.10.27.03.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 03:12:19 -0700 (PDT)
Message-ID: <7f405774-f6e4-40da-994b-02c8dfe8d648@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 15:42:14 +0530
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
Subject: Re: [PATCH] ASoC: qcom: sm8250: Limit RX digital gain to 0 dB
To: Filippo Falezza <effeffe99@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-sm8250-rx-gain-v1-1-386ee6d971db@gmail.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261027-sm8250-rx-gain-v1-1-386ee6d971db@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: M1GQnyvZnBzojIFvM0JietWfF7vZnXPB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0MCBTYWx0ZWRfXyjML9szhlbd8
 5z4h0oOFnPbOESe3lmTs7kBnCAyc5lutE+GZqWZvPE/rNyTlSoOUEkbp8rrthKe7f7Mnr7jOA7R
 Qtkm2aSK09JIrtG0WnvDK+JpdW+yRm4=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae07905 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=PDEUqFOJZ0MzX4fEFhsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: M1GQnyvZnBzojIFvM0JietWfF7vZnXPB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0MCBTYWx0ZWRfXw9OR3FFWwnom
 FbED5Rhi+e+W305uV60WnpwC4ouBCEvNN57Wjzv7ZHdSPR5TBsnd4KSmotoqxvnRi/wnqTd0MAz
 SGZV9b2UVtCXAVbSjXqeeyI2VisrtH8sOCy282TrlLGjYmNlZ1cdb4L3C8xJdcrDw0zY8+z0klI
 TWyI8hpm7AB08fF8wcwLTggpcQXbod17Y9yiZscaAjwnWautbwLvDzyfWDnS/n5n+zsTqgXcE38
 i4G2++jqM+9Lprkn/0tq14ihQIdfkLDQH2Axc7B3P6uHVB7BpCaqrp4MoQTTI5I2deg4xCRSO9z
 GY5wJzPGgBbCnjbDOanVtN0djPXsMhbi3yg1Y7/GfqGti8cgZ08fev+kWX8C4hAosegmZP1Tt+G
 zqaeW45Dk0Suq5QxETIV9J+ukKnUjurrwMN2PHgjceRF3CK6YWAlzvWGOeY7KMdmvxfQYTDqYdN
 o3zF75QC4NOIpZ+22aw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270040


On 10/27/2026 7:03 AM, Filippo Falezza wrote:
> The RX macro interpolator gains ("RX_RXn Digital Volume") run from
> -84 dB to +40 dB. PipeWire and PulseAudio map full volume to the top of
> a hardware control's range, so a UCM device that uses one of them as
> its volume control plays 40 dB hot at 100% and clips.
>
> Set a platform limit of 84 (0 dB) on the RX0, RX1 and RX2 interpolator
> gains when the RX codec DMA link is initialised, the way the sc8280xp
> and x1e80100 machine drivers limit their WSA gains. 0 dB is the default
> of these controls and the value alsa-ucm-conf's rx-macro init sets, so
> existing configurations are unaffected. A control that does not exist
> on a board is skipped.
>
> Signed-off-by: Filippo Falezza <effeffe99@gmail.com>
> ---


LGTM.

Reviewed-by: Prasad Kumpatla<prasad.kumpatla@oss.qualcomm.com>

Thanks,
Prasad


