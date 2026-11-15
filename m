Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794739570;
	b=esNeMndJPZ4S6qA0gOPYrWqw2nfXJa+40gJ/arPftpEffQX0KIiKT/UPJk0+UV+nUVE1
	 85eLFGvlQP4f8c84tTrfdClYHuH8CNUVr8AfhiMAIlVo9WyxTOB6XJQwtUg1vx7+99NAB
	 LfwzkHClopBrum99NM7sEZx3HTY5BH0RSJ17UcUzYAcoquIWHjfPEyyZeFzl0E570Cl7b
	 k1dRKw2pSXqGK2fZdnbU80ZKnVM3naZKjMjwOwzko505L0EO0O6OdxzHLhtYqnM7ft/X5
	 jnXT+MTin4FY3zAVLKaaZdfh4wcBEk3uxRz/KmE932yCRvLdIu5DOzOjgN1pmMIEqfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794739570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PW1CLbvqlr5fSy5oyi5HAW2alm1vh7L9g9nCvQTuD8M=;
	b=HpGTw2dlLNboeWRX9tervqekQ4PN3RH/Q2u6Y4jjO4pDrwfPIahgS5PR+VP/Cpgy4d69
	 7UWDHCukAhEWrGWZwPryQFWK3SwQI7y63Ys5wnaeYesXB17coscLA0rYedacoCnOOQqg9
	 3VqaX3eSmkDdplAzqt1vcLZWNCsFpunlUr/XrSegD83s1z9Pr3ZJTd+xXvpye8efFEZbT
	 65YWwjAC/9kjcl3PIQYjfoZ2eLG9Eo9fL3R82npwnxe89Rt37UQGt9JIN81ZwpFLZ1bAF
	 s/5ZFML4tHp/YNGqEHlQ0CePyBo7buMois083mFfzU97TABiSXnR9VYYvfmuEcbBs0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P2iEYOho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hjbB4m8Z;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703D5606A323
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 703D5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P2iEYOho;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hjbB4m8Z
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7wAPr236316
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PW1CLbvqlr5fSy5oyi5HAW2alm1vh7L9g9nCvQTuD8M=; b=P2iEYOhoA2tNINKg
	8aTX61BSPTfyw+BiPDwHp0nP625gvjraAsP5qviHMpoWdIHYKZXV639cIqyZuZO5
	ZK3dllqGC1MGzubpk2iysopC1rAISiYobRF+GgU2PbzFVW6NCC9U4K0IshcFvazo
	ms1LYgSQzTsmImLt/SJBlRnYlKPwAhtz5RGoHkdzoj9aTcyLZ0hHHNrOqLqSMcT2
	5eph79ffTwrKqXGSAs4TIcmShiY5F6qK8zEFVu/NYBmgAK1zPR9kJvhgq8pTvvAl
	uNYzPUaY55h37+edRzbQxvc/bQB5EA1vge7RK0FQs+/fRYkyode2X1LwywKGXZsq
	xnoyow==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj42tcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:46:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94967c6d4f4so80496585a.2
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 02:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794739567; x=1795344367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PW1CLbvqlr5fSy5oyi5HAW2alm1vh7L9g9nCvQTuD8M=;
        b=hjbB4m8ZtsUhHX3BAU08P5bccBpSjaJ7KBCuA08ijOudcWvZoqdLCZ6J8Pg20PsvZJ
         VoVW/lNMXC53rlfVFUISij9W/svKs5qPHTvnJ18ApGw4+pyJ2KyJ0tEqHywX1mrnF9R/
         UlJXLYNgxn/FcGOlK9dSSWXL5l6315z6TkNPhKeCXVy7I3cyJVD+hRLEvZupP/5NYZg3
         pI43Fj6uel1geFcgaRM8Zkm3iv9j0Ztd3BtVAGXcBiaQWqp2lplMENXcHEVQaSkg4lck
         JrE2m+46dJEZVuPDlqUB4ENdU30zeNBecSm56oroBDnJ8iqCzM1TJZzUjduzIjxoWC/A
         i7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794739567; x=1795344367;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PW1CLbvqlr5fSy5oyi5HAW2alm1vh7L9g9nCvQTuD8M=;
        b=kadrUaCoz5BiGZTa5qFzH/VuqRtJ1eqZpAHoQLSgfwH8OOXcOSB+rgmupSwu3wgBTc
         sDAyUCiZDTBzmyLTz4MauZhLaI4+dWCMBjLjiT5yGdK8+Hk0L2W0UNTR4Bc79N98GPBF
         uuG7pUDgla4hzX2mp5UoXbM3qFfZm8nn21sJBmrUlKzJMf/J+zd5daXbX8ZoyAlVA+Rd
         ed4PHCWRhP2Y8G803OivMOPzGD04ysM5BqokjQ6t1Fi/BsjtBqvY5DuB9TqDzIUkmMBJ
         YIlEsW4q35pD5adt1thHmocm++rtHDU2JeO6WiF7kRasqENNqtwsV+HYbPVkdGktI2HY
         FX+g==
X-Gm-Message-State: APuU4Z9S331Wb3q4Ob4CFCk1nrod5hq7PnK9o4nWb9sLtgXhvdv0QCKU
	tdAp2pBcJThknL+vlWl0jD/5Nzxjn+Pnc4OeW5QXNzbHTVXD7wSJ0g10ATau41MV+x4gvkrlFXL
	BcLsDSv7CXYcKaWIzEknBiLx125A9b6ii5YxVaz2ONpj2E7IIktT2Q9JnmoenMSQAwA==
X-Gm-Gg: AYBFou0WoQgdr/3DoLNCJ3A4LVAT+qhs0XQeZzfBrGplIJLHoubFYWkI3D/Zxue8Zrp
	LBto0OhtXvqGWBwt/hhP1vIJrSd5jC6BDjkvQPMwWeOh0MGiIyi89iS758J3lU28SwNKJpQy4tQ
	eYBBnArSpDgSg7ZBKuXWqQMb77ancIDNafUnZBPUSynWyynlbtCZxfmGimbrCOQp1JL7Iu1DBYu
	trAroaaeBgZgNE/l2WQ8Xdind8baff92Fiiw2TOT6DCoUIXqEaZCrAD1CzrZxDBi64cU+tHBIJu
	eUNGX+hVhEgmQH1Mw9bo/oypmO+7N53uDlbX3j681v8fu0d/eBBnEZWIhC2+cYr3BBdh43JKnp8
	jwb38cmrtHC8k6tTe8ZwFGBUMLCF1B0sK2oORNdatWI9aLOHVyDzXuA58zpcgTfyWux2moQMx70
	r8am9sCCWR6Q6ujtzNdg==
X-Received: by 2002:a05:620a:1a09:b0:948:e2fb:c00a with SMTP id af79cd13be357-9494bb892fbmr1229212085a.28.1794739567440;
        Sun, 15 Nov 2026 02:46:07 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:948:e2fb:c00a with SMTP id af79cd13be357-9494bb892fbmr1229210985a.28.1794739566963;
        Sun, 15 Nov 2026 02:46:06 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c21b1b5asm3069071a12.4.2026.11.15.02.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:46:05 -0800 (PST)
Message-ID: <f172af7b-f5a1-4375-a62f-6e389b1a2508@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:46:02 +0000
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
Subject: Re: [PATCH] ASoC: qcom: audioreach: apply volume changes to a running
 graph
To: marcht@proton.me, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111-q6apm-vol-live-v1-1-be85eef649c1@proton.me>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111-q6apm-vol-live-v1-1-be85eef649c1@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MiBTYWx0ZWRfX3S9r6ZHm5FXz
 FYybX+v6B3kd436uXUME9TsKY1iNZA+f3Ph//Xhw2JLWe8HsMdcmVePqu/cNJmB2UKP/7XORCyx
 S/MzXIZEkJx9GWtCdyXEGig2C9YyiphPmsd50V4GGwaqgrTjDozPxLwS8ehS6hIkyvVaS4VPJzy
 D3Di4raO+c3HYi0bx6lerEu4vz7zrTNBsL5FwCDWGXGRZxMi+JDUvE5IiG0qeiyVQg3L25Y9v1d
 tOvYENpj4l8YI7ZAPeKZ6u2DtD4ccBnscW5QuJGqOR1EN5Ym9XujD+oR55rBYjKOHUWIzpL7Vk0
 CAIqIz0ot2LsJmFhHm+wJOQlHY+YiGvEi4WZHVVc+5fDx/xOm+gKacg7TPwldaYVLeZ1l0b0FZ8
 ZMXbBhgXENmw5achdFk9lLkO1dpWQIUsWLGMORYdxdo3YNHm0hfptBEfqkVTUPPAFwx6d250oOT
 h3KiaH16hLtUhN5F/tw==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af98d70 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=fBJCkzpva8F84h5TpLsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: blLnQw3lNHdvIVHBq5mtOcqnqnbFKtkh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MiBTYWx0ZWRfX7mNynE5S/ExL
 SjIzYdUhv//oUTvpvKej2w8l+QGtruuGYFPNioefGT9Q5NlaqhWQbrtr9vH1p///Ns1uBhyYgWH
 qMlL+lF+bspjipzWFmvJKaAHF0TVWFo=
X-Proofpoint-ORIG-GUID: blLnQw3lNHdvIVHBq5mtOcqnqnbFKtkh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150042

On 11/11/26 1:49 PM, Marc Herrero via B4 Relay wrote:
> From: Marc Herrero <marcht@proton.me>
> 
> audioreach_put_vol_ctrl_audio_mixer() only stores the new gain in the
> module. The gain reaches the DSP from audioreach_pga_event() on
> SND_SOC_DAPM_POST_PMU, that is when a stream starts, so changing the
> "<stream> Playback Volume" control while playing has no effect until the
> next stream.
> 
> On QCS6490 (Radxa Dragon Q6A) shairport-sync uses this control as its
> hardware volume: the volume set when an AirPlay session starts is
> applied, but every later change from the phone is ignored.
> 
> Send the gain to the DSP right away when the widget is powered, and
> report no change when the value is the same.
> 
> Fixes: 36ad9bf1d93d ("ASoC: qdsp6: audioreach: add topology support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Marc Herrero <marcht@proton.me>
> ---
> Found on the Radxa Dragon Q6A together with the two fixes in
> "[PATCH 0/2] ASoC: qcom: audioreach: fix S24_LE playback and route mixer
> disconnects", sent earlier today. This one is independent of them.
> 
> Tested on 7.2.9: with the patch, moving the AirPlay volume while
> playing changes the output immediately; without it nothing changes
> until the next stream. Builds on asoc/for-next.
> ---
>  sound/soc/qcom/qdsp6/topology.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
> index 612d8f03e6e9..5b3378fd29fc 100644
> --- a/sound/soc/qcom/qdsp6/topology.c
> +++ b/sound/soc/qcom/qdsp6/topology.c
> @@ -1323,8 +1323,19 @@ static int audioreach_put_vol_ctrl_audio_mixer(struct snd_kcontrol *kcontrol,
>  {
>  	struct snd_soc_dapm_widget *dw = snd_soc_dapm_kcontrol_to_widget(kcontrol);
>  	struct audioreach_module *mod = dw->dobj.private;
> +	long gain = ucontrol->value.integer.value[0];
>  
> -	mod->gain = ucontrol->value.integer.value[0];

We should make sure that the graph is started before applying this, if
not you would get dsp errors.

--srini
> +	if (mod->gain == gain)
> +		return 0;
> +
> +	mod->gain = gain;
> +
> +	/* The PGA event only applies the gain when the widget powers up */
> +	if (dw->power) {
> +		struct snd_soc_component *c = snd_soc_dapm_to_component(dw->dapm);
> +
> +		audioreach_gain_set_vol_ctrl(dev_get_drvdata(c->dev), mod, gain);
> +	}
>  
>  	return 1;
>  }
> 
> ---
> base-commit: cde5523c75f1320a55ac1d55a717ccbb566557f0
> change-id: 20261111-q6apm-vol-live-d6bb1dbec7c9
> 
> Best regards,

