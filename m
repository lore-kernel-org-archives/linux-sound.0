Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794748384;
	b=pfzDMtH1G4kpmAkwB4orotRE8CMW+JPjEmfgQGTpjmtCDM5b6DMXIpUsOWRSCmIhYSzK
	 t3LqJ+aV4ufq09cAkDq5lR5ULAUEHgozH6jgzS46gDtn1G2DMuTNirxXf/J9bJUVh5x7j
	 E6t8wH+guWIwP5MKMgAH2AUsdYw/qHY0500DJgZxhNGpEFeaI9zDUq9HM14k5/aNTdMCK
	 4H0vI8LMX1TMNB5f3xtvC+Fo7q2jkglTcQTEI+UWsoODlwFoQFozEUqye5RID+ltOpe/O
	 Jvqvw7HEBfqyVlAGFFPmwkUPuiqX56a1kFC2E+6hOLMASbkvCtod6yL97nwNqH2yKNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794748384;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JQjoB2ZHZRRJweGWv1wI3MaS4jOgmtg9sYHKam8Rcas=;
	b=FBIh6FRzmfKJ3sDzyj18oIAPtACWbGjth0IJ/Ij4Y+m5Y2zvQrqlvVttVRAD9xFHeuC8
	 N70VrjexrQh8Xm8W346lPCTxPn+6mTxdvb/1HSoSkcXgHqoEQUo+Wq3tVp39EsiZ4p/o4
	 EIo40Je+MKwQQ5wLI57lT0zH6SdJrdy2YfQSKsNMxCkoggsgjNkWKKKU2lECEkkQOvF0i
	 p+w3n833OMoqENwR+Gj8bynhJQGXiRIhh1gFU5n0LRZJM9GrCnj+4Dgan9Er1gB4jFkLi
	 1fP+ucj4PSsIjX6RE9TVBTpMJCNtsaLtTPb/a4UjS5xc2i7yHYRlG74RUAaKaZiqzSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+QyI2ud;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jErUdXLY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5466E606A330
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5466E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+QyI2ud;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jErUdXLY
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AFBm78Y2227916
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JQjoB2ZHZRRJweGWv1wI3MaS4jOgmtg9sYHKam8Rcas=; b=E+QyI2udavkSrFUi
	L4JzfVx+8N2zYT9gz85ib0GN4n6eZGy9LWl6jKKlXXwFPazdt39rR3r0r7TI20DJ
	nWDla6ALzWm4dd3Hyn2LgCg49V+kQDlrZX+ZQd42jFWuuqvbRPEBGLR/Z/2hxF4M
	diRICaxcf0XdK6plytfS5pKqPnwwpbNSC5NXl7Stcht298TbD7NfKNitgUmif7KH
	hMzLWrya1qoLyLtBtWxpFMTS4AGsUQXRyfdVtj17lW5RAWMmHy4KDgLr7HbsMLbK
	6IM8HV5c612lhANcL4QnZyCwvK5JlG36OjTpvjJXyxT999sAVc1Tw45eVECneFTi
	D/+xMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhjqk3pe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 13:13:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so87962185a.2
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 05:13:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794748382; x=1795353182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JQjoB2ZHZRRJweGWv1wI3MaS4jOgmtg9sYHKam8Rcas=;
        b=jErUdXLYWdmCH5kzl0N9zuZC79aFwIs87DQV9sNS82vTHfAjJ3qS+H9l8Azrff59wg
         bHekdD1uTeqB98e55gapW3apI2brLik2NS8N/qSDz9Jt/k78qzy81Q+Dc2qnm7kUK0jg
         D2sh52B7RUioQTQoeNX5DsdCvmLJH1p8JrCb4FQwAWdaqrx9GySi53+FunEh6DoSSBMC
         MUfCitK/iHYXdSQTmprngwdbSAKIhiqfrsMr3N10A9MXV4dJ4FOGum8rEt2ZiZi1QUQv
         kVUC37IA4mIN9OZQOLZYeYMtFhKy/S3VuH0BkcRIt2ntMgwADxUzBRrvnYsSIPXCf/P5
         lP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794748382; x=1795353182;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JQjoB2ZHZRRJweGWv1wI3MaS4jOgmtg9sYHKam8Rcas=;
        b=jd2Ki+Fes4a8akJfDIt1Lq6HgoNnLLFbUYRnhYdXsKcyHFZfmTabOaINEzegBQS7KN
         u3s3PdGaLjiOZ5aXN5qViHkZhJtew7HP/JlNuR18Bv60aTvzl2wEhl3bJX6NxWU524HB
         zZJqbqoXIgPJvOHjsfdz5o8T2inIa98JCkZ4GsLvV1YYMs/ApF83azrU3K7gCj9NS55y
         41mRf0hYGo/Xf52rCu44jGUnB8u7nEE0pLvnS2CEC62QCKixujXODSQQAUWf1XSuC2wz
         Jsqi6ux+PUiP6VI6H7JHTvVrlWLOBPJdphk/pLrEW4tvtekGuQXtUTRKH5oFL25Y0Vvz
         Idow==
X-Forwarded-Encrypted: i=1; AL+hErFRZbwmfDgozumeFtnEQGfFQqvDvE4jDlBZHmVhxo2vz4vpGbvt6w5xNQrKcxN33PFYLwxklKIDToae7g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+zC9i1Pd9CY8aPM3hF4CCO0+0UU/60W2vxJ84kaDIt303D5XC0
	z5F8jccu26giwu6N4dm+VDY1G5BKmYHcNP+aswt2RK75YB92deOH/PM5y6kES15Z7S80m2oc7fK
	GKVe7lBMQCDDa6mQ4y8csJVk9/2VS6gHz2+WEzZUXgLjCYMTTQCJSE9Cvof9pqwhGww==
X-Gm-Gg: AYBFou02p46nmaKNt/JjdpHz3+vD1H+xH0uD63B7Qry5n1m+A+4dJzyzmjnigocZbdi
	Ut2JlCTzIg2EUkw2iYtzGRuJfnxG6PuPbnpJJCFlfmJIDqH5S00k10e9WOsolbSnRljkGSLuLL6
	fTq6TAhUUUDICPYGaEyLn8YU49Nu2e3AWEWxM8BZAEQ5f2OB4aCv1fnnmtCMV+J7qUf5eQ/5h2H
	5U8dujA8uBmpYbnL+tlXrAzT+U1dxPXubOcDLHhrvfXVEzAa6L/vwE3/ER68O7auCqj7q3vC72w
	zqm6r0bOB+Emu/E/nHzWFtxtAigYuJ+bDAe8OzvKoh682PtadY8iomh8+pwp9KtfPL0KgXvH3Ar
	sS4+e6bJAc+YWoaqw0awtdx6bwi+4VO3E41F1ALtLUyRrjiVyvbskG+fM+IJMl9pJJHNi+OBRLg
	==
X-Received: by 2002:a05:620a:8908:b0:93e:c12c:f128 with SMTP id af79cd13be357-9494bb75b18mr1184736985a.67.1794748381167;
        Sun, 15 Nov 2026 05:13:01 -0800 (PST)
X-Received: by 2002:a05:620a:8908:b0:93e:c12c:f128 with SMTP id af79cd13be357-9494bb75b18mr1184731985a.67.1794748380464;
        Sun, 15 Nov 2026 05:13:00 -0800 (PST)
Received: from [10.2.86.50] ([81.145.206.41])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e47sm13552466f8f.14.2026.11.15.05.12.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 05:12:59 -0800 (PST)
Message-ID: <16b8f649-f464-43a3-b372-868351df9117@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 13:12:57 +0000
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
Subject: Re: [PATCH v2] ASoC: qcom: q6asm: Correct the 24-bit PCM format
To: Michael McAllister <me@michaelmcallister.org>,
        Demeter Barna <me@fromdisposition.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <179355993304.51321.11135059681945648585.q6asm-capture-format-v1@michaelmcallister.org>
 <f3485a790ffdafe635b84b5d68730dad@fromdisposition.org>
 <179416102230.53258.7301268454500974217.q6asm-pcm-format-v2@michaelmcallister.org>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <179416102230.53258.7301268454500974217.q6asm-pcm-format-v2@michaelmcallister.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KelHIgYD c=1 sm=1 tr=0 ts=6af9afde cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fwrcM5CzGZKsB7byFkzpzA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=Tt5JBQAfAAAA:8 a=JwJ85b4fAAAA:8 a=EUspDBNiAAAA:8
 a=KK-cBfr6XyHYnu9rJyAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=kpHMOrJS8sLNr5ru0mYA:22 a=qg2vb7sgHZQYDKbllo_a:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA1MiBTYWx0ZWRfX1VzfCd2xinsf
 4NZNsLKv2LXpYIgfMf9MiJgYMxQicOCcp2xR6ta0Bnt4FHeOWXOLAAxj9xpLhBOKQJ4R6BuSTn8
 988uCOnO5NjFu4kqSnz+w3vBxkQRtLI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA1MiBTYWx0ZWRfX0TgS9VmxOtyF
 DkbZO2BqXbCSkTpmFd6cbDFm47JppNsnwIITidqHyNYWwU3f4y57CrwujYET9XL+5OysZKkFybr
 8EbrxrcndRc83IVSxug+bJ1Q2OjZFYEPstyZ9SuR+N5C5FEj9zLfW567X4qREfgVzxbhiETITL5
 I8TdfxV0W1ZlQoXRiiR6ohr2hlEvwPd84xOxcVeH8uReonrMYy4Vt+DlsDhcVnbDcl6k3i50WbB
 zZjJpLruutaAOq3r7k/PbU5Hcy5F+XcWAB5ESrYWuDM5NP2RIzedEfTul19BwX8RFFFnhIqJ5KU
 cduB9XBfp0AQQ1TOlOYZPvkUbIoZk1dW+waT5okpU6c0TRQ392ZNAVWz5GpUpkF0BCccQV6V0kP
 9Did75BlBid1u1sUzpzIoALGMbYTWH3VguYYi71gpgSZKiPO/3OluuYR/jfjmQt3qQjFWFNY6Zm
 QhJIx/XINlvQOJTCYLA==
X-Proofpoint-GUID: XyhYmgPyID48L3vzr7dp70ydIs7cwHCd
X-Proofpoint-ORIG-GUID: XyhYmgPyID48L3vzr7dp70ydIs7cwHCd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150052

On 11/8/26 6:03 PM, Michael McAllister wrote:
> Recording in S24_LE on the Moto G10 produces badly scaled samples that
> wrap at full scale. Playback has the same layout problem and comes out
> barely audible. The PCM V2 DSP interface uses bits 31:8 of each 32-bit
> word for 24-bit samples, but ALSA S24_LE expects bits 23:0.
> 
> Replace S24_LE with S32_LE for playback and capture and constrain it
> to 24 significant bits. Keep the DSP configured for 24-bit samples.
> This matches its native layout without converting samples in the kernel.
> 
> Translate S32_LE back to S24_LE in the APQ8096 and SC7180 backend
> fixups so that routing and the physical audio ports keep their 24-bit
> width. The other Q6ASM machine drivers already set the backend format.
> 
> Raw S24_LE requests are no longer supported. Applications using that
> format need S32_LE or a converting PCM device such as plughw.
> 
> Tested on the Moto G10 with direct ALSA and PipeWire playback/capture
> at 48 kHz, including reopening streams and testing after suspend.
> Direct S32_LE playback now matches the S16_LE level, ALSA reports
> 24 significant bits, and S24_LE through plug conversion works.
> 
> Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
> Reported-by: Demeter Barna <me@fromdisposition.org>
> Closes: https://lore.kernel.org/f3485a790ffdafe635b84b5d68730dad@fromdisposition.org/
> 
> Signed-off-by: Michael McAllister <me@michaelmcallister.org>
> ---

> Hi, thanks Demeter! I was able to reproduce this too, and I've included
> a fix for playback in v2.

Thankyou both for bringing this up, However the patch seems to be done
to fix the issue in wrong way. This is the dsp configuration issue afaiu.
we have ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V4 which should allow us to
specify the bit per sample an sample words and also alignment.

Can you please try this change and see if it helps. I have not tested
this myself as am travelling atm.

-------------------------------------->cut<--------------------------
Author: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Date:   Sun Nov 15 12:56:59 2026 +0000

    ASoC: qdsp6: q6asm: use MULTI_CHANNEL_PCM_V4 for correct S24_LE layout

    The ADSP V2 PCM format block (asm_multi_channel_pcm_fmt_blk_v2) carries
    only bits_per_sample and has no way to describe how 24-bit samples are
    positioned inside a 32-bit container. When the driver sends
    bits_per_sample = 24 the firmware walks the buffer using its own
    convention (packed 3-byte or MSB-aligned-in-32), neither of which
    matches ALSA SNDRV_PCM_FORMAT_S24_LE (24 bits LSB-aligned in a 32-bit
    word, i.e. 8.24 / Q23). The result is scaled/wrapping samples on both
    playback and capture.

    The V3 PCM format block adds sample_word_size but, per the ADSP ABI
    documentation, with bits_per_sample = 24 and sample_word_size = 32 it
    places samples in the *most significant* 24 bits of the 32-bit word
    (Q31 default). V3 still cannot describe 8.24 / LSB-aligned 24-in-32.

    The V4 PCM format block adds endianness and a "mode" field that is
    exactly a Q-factor / alignment selector. Mode 23 means "24-bit packed
    or 8.24 format" - the latter matches ALSA S24_LE: 24 valid bits in
    bits 23:0 of a 32-bit word. Use V4 with
      bits_per_sample  = 24
      sample_word_size = 32
      endianness       = little
      mode             = 23
    for S24_LE and defaults (mode = 0) for S16_LE/S32_LE.

    Note that the MEDIA_FMT_UPDATE opcode stays
ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2
    (0x00010D98); there is no dedicated V4 variant of the update command on
    the ADSP ABI - V4-ness is carried by the format-id in the payload
    (ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V4 = 0x0001320C). This matches
    Qualcomm's downstream audio-kernel implementation.

    This keeps SNDRV_PCM_FMTBIT_S24_LE advertised and avoids any UAPI
    change.

    Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
    Cc: stable@vger.kernel.org
    Signed-off-by: Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com>

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c
b/sound/soc/qcom/qdsp6/q6asm-dai.c
index dc5230f13a97..930080e7c7b4 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -209,6 +209,7 @@ static int q6asm_dai_prepare(struct
snd_soc_component *component,
        struct q6asm_dai_rtd *prtd = runtime->private_data;
        struct q6asm_dai_data *pdata;
        struct device *dev = component->dev;
+       u16 word_size, mode;
        int ret, i;

        pdata = snd_soc_component_get_drvdata(component);
@@ -277,17 +278,32 @@ static int q6asm_dai_prepare(struct
snd_soc_component *component,
                goto routing_err;
        }

+       /*
+        * SNDRV_PCM_FORMAT_S24_LE is 24 valid bits in a 32-bit container,
+        * LSB-aligned (8.24 / Q23). Set the DSP accordingly via V4 mode
= 23.
+        * All other advertised formats are packed (container == valid bits,
+        * default QF).
+        */
+       if (prtd->bits_per_sample == 24) {
+               word_size = 32;
+               mode = 23;
+       } else {
+               word_size = prtd->bits_per_sample;
+               mode = 0;
+       }
+
        if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
-               ret = q6asm_media_format_block_multi_ch_pcm(
+               ret = q6asm_media_format_block_multi_ch_pcm_v4(
                                prtd->audio_client, prtd->stream_id,
                                runtime->rate, runtime->channels, NULL,
-                               prtd->bits_per_sample);
+                               prtd->bits_per_sample, word_size, mode);
        } else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-               ret =
q6asm_enc_cfg_blk_pcm_format_support(prtd->audio_client,
+               ret =
q6asm_enc_cfg_blk_pcm_format_support_v4(prtd->audio_client,
                                                           prtd->stream_id,
                                                           runtime->rate,

runtime->channels,
-
prtd->bits_per_sample);
+
prtd->bits_per_sample,
+                                                          word_size, mode);

                /* Queue the buffers */
                for (i = 0; i < runtime->periods; i++)
diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 3f9f2448eb32..edd1ec066765 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -40,6 +40,18 @@
 #define ASM_PARAM_ID_ENCDEC_ENC_CFG_BLK_V2     0x00010DA3
 #define ASM_SESSION_CMD_RUN_V2                 0x00010DAA
 #define ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2     0x00010DA5
+#define ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V4     0x0001320C
+/*
+ * V4 PCM mode: "Q factor" / alignment selector.
+ *   0  - Default QFs (Q15 for 16b, Q23 for packed 24b, Q31 for unpacked
+ *        24b or 32b). For 24-in-32 the default is Q31 (MSB-aligned).
+ *   15 - explicit Q15 for 16-bit
+ *   23 - Q23 / 8.24 format: 24 valid bits LSB-aligned in a 32-bit word
+ *        (matches ALSA SNDRV_PCM_FORMAT_S24_LE).
+ */
+#define ASM_PCM_MODE_DEFAULT_Q         0
+#define ASM_PCM_MODE_Q23_OR_PACKED_24  23
+#define ASM_PCM_ENDIAN_LITTLE          0
 #define ASM_MEDIA_FMT_MP3                      0x00010BE9
 #define ASM_MEDIA_FMT_FLAC                     0x00010C16
 #define ASM_MEDIA_FMT_WMA_V9                   0x00010DA8
@@ -99,6 +111,29 @@ struct asm_multi_channel_pcm_fmt_blk_v2 {
        u8 channel_mapping[PCM_MAX_NUM_CHANNEL];
 } __packed;

+/*
+ * V4 PCM format block adds sample_word_size (container width), endianness,
+ * and mode. For "24 valid bits in a 32-bit container, LSB-aligned" (i.e.
+ * ALSA SNDRV_PCM_FORMAT_S24_LE = 8.24 format), set
+ *   bits_per_sample  = 24
+ *   sample_word_size = 32
+ *   endianness       = 0 (little)
+ *   mode             = 23 (Q23 / 8.24)
+ * With mode = 0 (default QFs), 24-in-32 is Q31 / MSB-aligned, which does
+ * not match ALSA S24_LE.
+ */
+struct asm_multi_channel_pcm_fmt_blk_v4 {
+       struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
+       u16 num_channels;
+       u16 bits_per_sample;
+       u32 sample_rate;
+       u16 is_signed;
+       u16 sample_word_size;
+       u8 channel_mapping[PCM_MAX_NUM_CHANNEL];
+       u16 endianness;
+       u16 mode;
+} __packed;
+
 struct asm_flac_fmt_blk_v2 {
        struct asm_data_cmd_media_fmt_update_v2 fmt_blk;
        u16 is_stream_info_present;
@@ -191,6 +226,20 @@ struct asm_multi_channel_pcm_enc_cfg_v2 {
        uint8_t   channel_mapping[8];
 } __packed;

+/* V4 capture enc-cfg: adds sample_word_size, endianness, mode. */
+struct asm_multi_channel_pcm_enc_cfg_v4 {
+       struct asm_stream_cmd_set_encdec_param  encdec;
+       struct asm_enc_cfg_blk_param_v2 encblk;
+       u16 num_channels;
+       u16 bits_per_sample;
+       u32 sample_rate;
+       u16 is_signed;
+       u16 sample_word_size;
+       u8 channel_mapping[8];
+       u16 endianness;
+       u16 mode;
+} __packed;
+
 struct asm_data_cmd_read_v2 {
        u32                  buf_addr_lsw;
        u32                  buf_addr_msw;
@@ -953,7 +1002,7 @@ int q6asm_open_write(struct audio_client *ac,
uint32_t stream_id,
                open->dec_fmt_id = ASM_MEDIA_FMT_MP3;
                break;
        case FORMAT_LINEAR_PCM:
-               open->dec_fmt_id = ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2;
+               open->dec_fmt_id = ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V4;
                break;
        case SND_AUDIOCODEC_FLAC:
                open->dec_fmt_id = ASM_MEDIA_FMT_FLAC;
@@ -1121,6 +1170,60 @@ int q6asm_media_format_block_multi_ch_pcm(struct
audio_client *ac,
 }
 EXPORT_SYMBOL_GPL(q6asm_media_format_block_multi_ch_pcm);

+/**
+ * q6asm_media_format_block_multi_ch_pcm_v4() - setup PCM configuration
(V4)
+ *
+ * @ac: audio client pointer
+ * @stream_id: stream id
+ * @rate: audio sample rate
+ * @channels: number of audio channels
+ * @channel_map: channel map pointer (optional)
+ * @bits_per_sample: valid bits per sample (e.g. 24 for S24_LE)
+ * @sample_word_size: container size in bits (e.g. 32 for S24_LE, 16
for S16_LE)
+ * @mode: Q factor / alignment selector; use ASM_PCM_MODE_Q23_OR_PACKED_24
+ *       for ALSA SNDRV_PCM_FORMAT_S24_LE (24 bits LSB-aligned in
32-bit word).
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int q6asm_media_format_block_multi_ch_pcm_v4(struct audio_client *ac,
+                                            uint32_t stream_id,
+                                            uint32_t rate, uint32_t
channels,
+                                            u8
channel_map[PCM_MAX_NUM_CHANNEL],
+                                            uint16_t bits_per_sample,
+                                            uint16_t sample_word_size,
+                                            uint16_t mode)
+{
+       struct asm_multi_channel_pcm_fmt_blk_v4 *fmt;
+       struct apr_pkt *pkt;
+       int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+
+       void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
+       if (!p)
+               return -ENOMEM;
+
+       pkt = p;
+       fmt = p + APR_HDR_SIZE;
+       q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
+
+       pkt->hdr.opcode = ASM_DATA_CMD_MEDIA_FMT_UPDATE_V2;
+       fmt->fmt_blk.fmt_blk_size = sizeof(*fmt) - sizeof(fmt->fmt_blk);
+       fmt->num_channels = channels;
+       fmt->bits_per_sample = bits_per_sample;
+       fmt->sample_rate = rate;
+       fmt->is_signed = 1;
+       fmt->sample_word_size = sample_word_size;
+       fmt->endianness = ASM_PCM_ENDIAN_LITTLE;
+       fmt->mode = mode;
+
+       if (channel_map)
+               memcpy(fmt->channel_mapping, channel_map,
PCM_MAX_NUM_CHANNEL);
+       else if (q6dsp_map_channels(fmt->channel_mapping, channels))
+               return -EINVAL;
+
+       return q6asm_ac_send_cmd_sync(ac, pkt);
+}
+EXPORT_SYMBOL_GPL(q6asm_media_format_block_multi_ch_pcm_v4);
+
 int q6asm_stream_media_format_block_flac(struct audio_client *ac,
                                         uint32_t stream_id,
                                         struct q6asm_flac_cfg *cfg)
@@ -1387,6 +1490,58 @@ int q6asm_enc_cfg_blk_pcm_format_support(struct
audio_client *ac,
 }
 EXPORT_SYMBOL_GPL(q6asm_enc_cfg_blk_pcm_format_support);

+/**
+ * q6asm_enc_cfg_blk_pcm_format_support_v4() - setup capture PCM
configuration (V4)
+ *
+ * @ac: audio client pointer
+ * @stream_id: stream id
+ * @rate: audio sample rate
+ * @channels: number of audio channels
+ * @bits_per_sample: valid bits per sample
+ * @sample_word_size: container size in bits
+ * @mode: Q factor / alignment selector (see V4 fmt_blk struct).
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int q6asm_enc_cfg_blk_pcm_format_support_v4(struct audio_client *ac,
+                                           uint32_t stream_id, uint32_t
rate,
+                                           uint32_t channels,
+                                           uint16_t bits_per_sample,
+                                           uint16_t sample_word_size,
+                                           uint16_t mode)
+{
+       struct asm_multi_channel_pcm_enc_cfg_v4 *enc_cfg;
+       struct apr_pkt *pkt;
+       int pkt_size = APR_HDR_SIZE + sizeof(*enc_cfg);
+
+       void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
+       if (!p)
+               return -ENOMEM;
+
+       pkt = p;
+       enc_cfg = p + APR_HDR_SIZE;
+       q6asm_add_hdr(ac, &pkt->hdr, pkt_size, true, stream_id);
+
+       pkt->hdr.opcode = ASM_STREAM_CMD_SET_ENCDEC_PARAM;
+       enc_cfg->encdec.param_id = ASM_PARAM_ID_ENCDEC_ENC_CFG_BLK_V2;
+       enc_cfg->encdec.param_size = sizeof(*enc_cfg) -
sizeof(enc_cfg->encdec);
+       enc_cfg->encblk.frames_per_buf = 0;
+       enc_cfg->encblk.enc_cfg_blk_size = enc_cfg->encdec.param_size -
+                                          sizeof(struct
asm_enc_cfg_blk_param_v2);
+       enc_cfg->num_channels = channels;
+       enc_cfg->bits_per_sample = bits_per_sample;
+       enc_cfg->sample_rate = rate;
+       enc_cfg->is_signed = 1;
+       enc_cfg->sample_word_size = sample_word_size;
+       enc_cfg->endianness = ASM_PCM_ENDIAN_LITTLE;
+       enc_cfg->mode = mode;
+
+       if (q6dsp_map_channels(enc_cfg->channel_mapping, channels))
+               return -EINVAL;
+
+       return q6asm_ac_send_cmd_sync(ac, pkt);
+}
+EXPORT_SYMBOL_GPL(q6asm_enc_cfg_blk_pcm_format_support_v4);

 /**
  * q6asm_read() - read data of period size from audio client
@@ -1471,7 +1626,7 @@ static int __q6asm_open_read(struct audio_client
*ac, uint32_t stream_id,
        switch (format) {
        case FORMAT_LINEAR_PCM:
                open->mode_flags |= 0x00;
-               open->enc_cfg_id = ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V2;
+               open->enc_cfg_id = ASM_MEDIA_FMT_MULTI_CHANNEL_PCM_V4;
                break;
        default:
                pr_err("Invalid format[%d]\n", format);
diff --git a/sound/soc/qcom/qdsp6/q6asm.h b/sound/soc/qcom/qdsp6/q6asm.h
index 6fafda5bd849..36601a055381 100644
--- a/sound/soc/qcom/qdsp6/q6asm.h
+++ b/sound/soc/qcom/qdsp6/q6asm.h
@@ -107,6 +107,12 @@ int q6asm_enc_cfg_blk_pcm_format_support(struct
audio_client *ac,
                                         uint32_t stream_id, uint32_t rate,
                                         uint32_t channels,
                                         uint16_t bits_per_sample);
+int q6asm_enc_cfg_blk_pcm_format_support_v4(struct audio_client *ac,
+                                           uint32_t stream_id, uint32_t
rate,
+                                           uint32_t channels,
+                                           uint16_t bits_per_sample,
+                                           uint16_t sample_word_size,
+                                           uint16_t mode);

 int q6asm_read(struct audio_client *ac, uint32_t stream_id);

@@ -115,6 +121,14 @@ int q6asm_media_format_block_multi_ch_pcm(struct
audio_client *ac,
                                          uint32_t rate, uint32_t channels,
                                          u8
channel_map[PCM_MAX_NUM_CHANNEL],
                                          uint16_t bits_per_sample);
+int q6asm_media_format_block_multi_ch_pcm_v4(struct audio_client *ac,
+                                            uint32_t stream_id,
+                                            uint32_t rate,
+                                            uint32_t channels,
+                                            u8
channel_map[PCM_MAX_NUM_CHANNEL],
+                                            uint16_t bits_per_sample,
+                                            uint16_t sample_word_size,
+                                            uint16_t mode);
 int q6asm_stream_media_format_block_flac(struct audio_client *ac,
                                         uint32_t stream_id,
                                         struct q6asm_flac_cfg *cfg);
-------------------------------------->cut<--------------------------
> 
> Changes in v2:
> - Cover playback as well as capture.
> - Remove the unused S24_LE case and update the backend comments.
> - Add Fixes and Reported-by, and document the raw-format change.
> - Rebase onto sound/for-next.
> 
> v1: https://lore.kernel.org/179355993304.51321.11135059681945648585.q6asm-capture-format-v1@michaelmcallister.org/
> 
>  sound/soc/qcom/apq8096.c         |  8 ++++++++
>  sound/soc/qcom/qdsp6/q6asm-dai.c | 15 ++++++++++-----
>  sound/soc/qcom/sc7180.c          |  8 ++++++++
>  3 files changed, 26 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
> index cfd6438db..b7030f7ef 100644
> --- a/sound/soc/qcom/apq8096.c
> +++ b/sound/soc/qcom/apq8096.c
> @@ -6,6 +6,7 @@
>  #include <sound/soc.h>
>  #include <sound/soc-dapm.h>
>  #include <sound/pcm.h>
> +#include <sound/pcm_params.h>
>  #include "common.h"
>  
>  #define SLIM_MAX_TX_PORTS 16
> @@ -19,10 +20,17 @@ static int apq8096_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>  					SNDRV_PCM_HW_PARAM_RATE);
>  	struct snd_interval *channels = hw_param_interval(params,
>  					SNDRV_PCM_HW_PARAM_CHANNELS);
> +	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
>  
>  	rate->min = rate->max = 48000;
>  	channels->min = channels->max = 2;
>  
> +	/* Keep the backend at 24 bits despite the 32-bit PCM container. */
> +	if (params_format(params) == SNDRV_PCM_FORMAT_S32_LE) {
> +		snd_mask_none(fmt);
> +		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
> index 4261c3048..cd97ba2ff 100644
> --- a/sound/soc/qcom/qdsp6/q6asm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
> @@ -90,7 +90,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_capture = {
>  				SNDRV_PCM_INFO_INTERLEAVED |
>  				SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
>  	.formats =              (SNDRV_PCM_FMTBIT_S16_LE |
> -				SNDRV_PCM_FMTBIT_S24_LE),
> +				SNDRV_PCM_FMTBIT_S32_LE),
>  	.rates =                SNDRV_PCM_RATE_8000_48000,
>  	.rate_min =             8000,
>  	.rate_max =             48000,
> @@ -113,7 +113,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
>  				SNDRV_PCM_INFO_INTERLEAVED |
>  				SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME),
>  	.formats =              (SNDRV_PCM_FMTBIT_S16_LE |
> -				SNDRV_PCM_FMTBIT_S24_LE),
> +				SNDRV_PCM_FMTBIT_S32_LE),
>  	.rates =                SNDRV_PCM_RATE_8000_192000,
>  	.rate_min =             8000,
>  	.rate_max =             192000,
> @@ -139,7 +139,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
>  				  SNDRV_PCM_RATE_176400 |		\
>  				  SNDRV_PCM_RATE_192000),		\
>  			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
> -					SNDRV_PCM_FMTBIT_S24_LE),	\
> +					SNDRV_PCM_FMTBIT_S32_LE),	\
>  			.channels_min = 1,				\
>  			.channels_max = 8,				\
>  			.rate_min =     8000,				\
> @@ -151,7 +151,7 @@ static const struct snd_pcm_hardware q6asm_dai_hardware_playback = {
>  				  SNDRV_PCM_RATE_12000 |		\
>  				  SNDRV_PCM_RATE_24000),		\
>  			.formats = (SNDRV_PCM_FMTBIT_S16_LE |		\
> -				    SNDRV_PCM_FMTBIT_S24_LE),		\
> +				    SNDRV_PCM_FMTBIT_S32_LE),		\
>  			.channels_min = 1,				\
>  			.channels_max = 4,				\
>  			.rate_min =     8000,				\
> @@ -377,6 +377,11 @@ static int q6asm_dai_open(struct snd_soc_component *component,
>  
>  	stream_id = cpu_dai->driver->id;
>  
> +	/* The DSP uses the high 24 bits of each 32-bit word. */
> +	ret = snd_pcm_hw_constraint_msbits(runtime, 0, 32, 24);
> +	if (ret < 0)
> +		return ret;
> +
>  	pdata = snd_soc_component_get_drvdata(component);
>  	if (!pdata) {
>  		dev_err(dev, "Drv data not found ..\n");
> @@ -505,7 +510,7 @@ static int q6asm_dai_hw_params(struct snd_soc_component *component,
>  	case SNDRV_PCM_FORMAT_S16_LE:
>  		prtd->bits_per_sample = 16;
>  		break;
> -	case SNDRV_PCM_FORMAT_S24_LE:
> +	case SNDRV_PCM_FORMAT_S32_LE:
>  		prtd->bits_per_sample = 24;
>  		break;
>  	}
> diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
> index bc5a18883..dd0f8eb99 100644
> --- a/sound/soc/qcom/sc7180.c
> +++ b/sound/soc/qcom/sc7180.c
> @@ -13,6 +13,7 @@
>  #include <sound/core.h>
>  #include <sound/jack.h>
>  #include <sound/pcm.h>
> +#include <sound/pcm_params.h>
>  #include <sound/soc.h>
>  #include <uapi/linux/input-event-codes.h>
>  
> @@ -425,10 +426,17 @@ static int sc7180_qdsp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>  					SNDRV_PCM_HW_PARAM_RATE);
>  	struct snd_interval *channels = hw_param_interval(params,
>  					SNDRV_PCM_HW_PARAM_CHANNELS);
> +	struct snd_mask *fmt = hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT);
>  
>  	rate->min = rate->max = 48000;
>  	channels->min = channels->max = 2;
>  
> +	/* Keep the backend at 24 bits despite the 32-bit PCM container. */
> +	if (params_format(params) == SNDRV_PCM_FORMAT_S32_LE) {
> +		snd_mask_none(fmt);
> +		snd_mask_set_format(fmt, SNDRV_PCM_FORMAT_S24_LE);
> +	}
> +
>  	return 0;
>  }
>  
> 
> base-commit: c937f492dd40a8398d955cf0f4f9e11d7268bcb5

