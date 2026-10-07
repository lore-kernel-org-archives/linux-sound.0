Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F0B3C5DD4
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 18:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396295; cv=none; b=mXqqCJIbW/55NXX2On4zIEhJf4gxxlMIuzxgIzHLcPHfOi0LqSTIHVOsaPvYbG2FNgDvFRHZmRFDYmOQVtSUrpQ5rayxCbtzyGE9E1pyS3mD4KVQAtyE5SLECaS0v8S9+dX+Kth9fnsToGQtNf/0648MK6T1+OA5Ru4P3u9NDpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396295; c=relaxed/simple;
	bh=Ixyh7XRyhmFYgTn02FEN67Vl1z80KRiOpAdNf/DUBjc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xt1/y/em/Xr+VredRJTJPqv/PJgfC7q+6l4xnS5eeQXvPQ0/bPT5aRd9UikQNQEmXFFgFsADB8Dbr0LVHvElNjP2Ko4c34Y4P+y1c59Sy2rkeSffBoiLrVHhZA7/zbsN4BkZaoHOnuIMfRUoPQVri/T60nJjK9ZuguRwh/V4MG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SzgIWJSP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZaHuMMJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SzgIWJSP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZaHuMMJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtQZh557450
	for <linux-sound@vger.kernel.org>; Wed, 7 Oct 2026 18:04:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JykGVcXyDXA+2TTRuO2/QCItxRpkTMleFSqXf8Cjqh4=; b=SzgIWJSPJjjem8nE
	cushvfrvkg22fkrce0c9vfE72gWIUGPdOIWJTPKKxKMcIBBucr2MxZxm1667OsHF
	YBbItPv71AJx0au1yTR3JPAyG4j2mb9aZ81plf0pCTVykpWFrE3dSqZ5MZl24vul
	JdPijzTq4P6H5i9a/RF9uo1nTnv2oB7/5CxbhZX5RdgHICjlY9MskRjks/Z/NPcI
	b4sIlrdd2kxVvPlJuw/FxTeOQ+bly1FuHRhTgaMT849TsCV5m0Ujd9erIi6Sb58B
	mfxvDzpFx5lHNnJb50slIBd6pV+23qGsBCHoKT9vMMqJ3Tp5YgCVh31nnEQz4hxE
	eTYXTA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrtkae-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 18:04:51 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39533bb224cso5165573a91.3
        for <linux-sound@vger.kernel.org>; Wed, 07 Oct 2026 11:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791396291; x=1792001091; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JykGVcXyDXA+2TTRuO2/QCItxRpkTMleFSqXf8Cjqh4=;
        b=eZaHuMMJEHHEzntjdYTtwVAaf96+Cff1NM2wTvYyoggo04BVWioY42sM0WE7hk9sxL
         ORqqtVuW6t+esxDZzqGDASczFvHDpe/CVtC6UoXol2QaqMKmN4MRqm3rfG2htOeFo3yv
         Ph9TBr12oCVm+FXNr7UiqHmxjGzYfqrVP/Wz8Pvy4BmCvqkttwO9LJIm243cQToXbms5
         pd3YGQECsOywCn2Z6RL2UKMYxgVpsBGJkXbOOwqGChyNHtS5njAoQs68sI1Z0Gdy8F+F
         hLQ2gQ+PYbUeBq+CD3/+lwz5LN5xUEiYfbYaHhHaaKj9XLFMGGa4eySN+rrJTX2ZmrJz
         hZQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396291; x=1792001091;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JykGVcXyDXA+2TTRuO2/QCItxRpkTMleFSqXf8Cjqh4=;
        b=rjHZuPwZ3ts6zg9j9eZbBGpEo9YcH7PIBfCiEA0ThxrhSKI+aqIOJ/hxgyjRnUSb/u
         kkRwz7IHi1KvlzlLgjgE6jTvVuzt3VxxPGGAnytwyc4GT/xIQvbRwAYzxoDjSBX6wFOT
         oOQsb4zRNG1D0DBkZapnYCBYjWgQ/5DILp6fiUn0/rvShE0/U3o/qTQ/VPn/e/9E7skP
         SDJE2nlkPv4o4anm0cIDyvh18ebRG+JKKA7dUk40kPJzfIX6kDHuLV4vAXmgLs3UQ6Li
         DLkBkwyrloKwwgtOPi73fz86gtF6J91rsr7MEz0spC3KHIvescBxZ+mOG/1oEaZZV7sc
         OtmA==
X-Forwarded-Encrypted: i=1; AKwUvBwrwmKJo0ype/jRSVtSXIx2dxZVH9L4oz4rZuv0ZShreRjp9+DLIVhOlxzdDQP67/zyGBNjZQ1c8vDWRg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIMYyw6SbcZnNKeQEshCsAs6CLjTJirKU2Czd9keVGyKaht4k+f
	3ktwbctN8OfqbL3DPnSWNeK7QAF4rlHVOT9pjX84IzAy7DH7s1SX1Phk5FQreGwT2xA88me/08/
	qNs7L8Pf6N88JZ3fiN7tdY35m7sFlh5aXacVUxprqcloiP8IBfKxR9l05T7v3Zh+8EA==
X-Gm-Gg: AYBFou2mc0130x7RKRCZnFlvmyYAv3e3qqFvbp5gATHc69H/lMLKgw4kAC8TBXZKVKi
	XBUKw5C7DQSk5tW/7HrsI8dkFcKFkN2kmV4XgwIFXccloVirHAbCoJLu9LyRLiRxjg5njJ4eBWX
	IZvr5cbbHIGqsC6voZdTysClyOt692tU8XSl8I56YsULRHXe//7Rgw/tdAWV5NzUCtxO2DesRjt
	ENaqx3VGxqtyyiOk5s2Z86B88ZbPdk6T7l0cZWL+WitfB9P3k0q5qCYSmoiAISuY86L5I6Nd45M
	Xdzyc1Nqha1BZiOlX/ftZg0IEzSHQN7ojL23/d6C99uQlVYqP8hDNTet/dXxdNDb0YP15pWpT3T
	4h0cjtY+9v4JhucRcz/JSOiUEOw6X
X-Received: by 2002:a17:90b:57ce:b0:3a4:fa1a:2b1d with SMTP id 98e67ed59e1d1-3a8a1c3ac39mr2378599a91.62.1791396290987;
        Wed, 07 Oct 2026 11:04:50 -0700 (PDT)
X-Received: by 2002:a17:90b:57ce:b0:3a4:fa1a:2b1d with SMTP id 98e67ed59e1d1-3a8a1c3ac39mr2378577a91.62.1791396290508;
        Wed, 07 Oct 2026 11:04:50 -0700 (PDT)
Received: from [192.168.1.12] ([223.230.93.214])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a2508csm605492a91.3.2026.10.07.11.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 11:04:49 -0700 (PDT)
Message-ID: <a166844a-ba68-46b2-b37b-111ce54dbba3@oss.qualcomm.com>
Date: Wed, 7 Oct 2026 23:34:37 +0530
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
To: James Calligeros <jcalligeros99@gmail.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
        Neal Gompa <neal@gompa.dev>, ajay.nandam@oss.qualcomm.com
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>,
        Sasha Finkelstein <k@chaosmail.tech>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac689c3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZXy6yrx+fn+bJIgs5eQ1WQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=NwbpVL58AAAA:8 a=dOLNmq4gAAAA:8 a=pGLkceISAAAA:8 a=291MuZCLWqhcjKYDPAcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=tNWvAHffTtQgx3ZTRG8Q:22 a=_m6CO-mWuQdSFutSHjXj:22
X-Proofpoint-ORIG-GUID: Kxej-EjQHagZ3Sggq_mYPVq87_yIBMjl
X-Proofpoint-GUID: Kxej-EjQHagZ3Sggq_mYPVq87_yIBMjl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA3MiBTYWx0ZWRfX5eV4YRDkibAY
 7DaOjL1FblRFVZPgxHbtV0u9UpW7wldp4cHG8ZYoSCbXAJR/tXArsFnhNAj9I8DlZenvkNrH5vN
 DPoO+yXUJsGlDdjsoU6Zk5448uXIk2778e+RvihPiTLWmS/iLMSyCCedsrzBifxqHSZOEhzLFgV
 2JBo9TlLzaRU+mjIQp9nCb+DbgjDfBv+D75tUvD3KHwZQEfvTBg28Rr9vnT/VwiIvEQOAx45y7L
 hIWgSA6yG9XwUZGFu4p2IVuE6VC1DjgZE828a5MTfbJ81NhRU2pvdOKxhWBY8XNRdd46ujVxqMX
 TOCyvfkSTwqwi5LEMp0NiEkjx3RDmUNgT+duAgiK21dWVua1KPBpykUbfqKozMThz1n4SDryBrj
 ecMdPraIZqiHgQLPE+fJNL6MwJMkXxNjo3MwJn7NwHRExvXW+yoLmtdx3y8IfVEKUaBN4T1IHu8
 VQaxDboPpKBKhInKOnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA3MiBTYWx0ZWRfX5W7IIPPpw/63
 D8mP/1ArB71R+P62/QLhznX0kiWy1KPzht0TgM2m4uRslOaoOB5EqKpHAIAHormhZG4bzPU17cY
 H0dyeEylx/qKverWDSyfqIprM66+I4Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070072



On 10/4/2026 11:33 AM, James Calligeros wrote:
> From: Martin Povišer <povik+lin@cutebit.org>
> 
> Apple Silicon Macs have a complex audio subsystem consisting
> of an I2S peripheral (MCA) and multiple codecs of various
> models and capabilities. Some machines have a basic mono
> speaker with hardware downmix, while others have a very
> intricate stereo system consisting of multiple codecs and
> drivers per L/R channel. Some machines report voice coil
> voltage and current information back to the SoC, and others
> do not. All machines have a headset jack.
> 
> Add an ASoC machine driver for this platform.
> 
> To express all of this sanely, we initialise the correct
> combinations of codecs/I2S ports as DAI backends and link
> them to a synthetic frontend. Each frontend is linked to
> a PCM, one for the headset codec and one for the speaker
> system on the target machine.
> 
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Co-developed-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Co-developed-by: James Calligeros <jcalligeros99@gmail.com>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>   sound/soc/apple/Kconfig    |   18 +
>   sound/soc/apple/Makefile   |    4 +
>   sound/soc/apple/macaudio.c | 1699 +++++++++++++++++++++++++
>   3 files changed, 1721 insertions(+)
> 

> +
> +static int macaudio_be_trigger(struct snd_pcm_substream *substream, int cmd)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct macaudio_snd_data *ma = snd_soc_card_get_drvdata(rtd->card);
> +	struct macaudio_link_props *props = &ma->link_props[rtd->dai_link->id];
> +
> +	guard(mutex)(&ma->be_link_mutex);
> +

This is in the DAI link `.trigger` callback, but I don't see the
macaudio links being marked `.nonatomic = 1`.

The default PCM trigger path can run with the stream lock held and IRQs
disabled, so taking a normal mutex here can sleep in atomic context. If
this state really needs a sleeping lock, should the affected links be
marked nonatomic, or should the trigger path avoid the mutex?

> +	if (props->is_speakers && substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
> +		switch (cmd) {
> +		case SNDRV_PCM_TRIGGER_START:
> +		case SNDRV_PCM_TRIGGER_RESUME:
> +		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +			ma->bes_active |= BIT(rtd->dai_link->id);
> +			break;
> +		case SNDRV_PCM_TRIGGER_SUSPEND:
> +		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +		case SNDRV_PCM_TRIGGER_STOP:
> +			ma->bes_active &= ~BIT(rtd->dai_link->id);
> +			break;
> +		default:
> +			return -EINVAL;
> +		}
> +
> +		schedule_work(&ma->lock_update_work);
> +	}
> +
> +	return 0;
> +}
> +
