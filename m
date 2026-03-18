Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBC7C376479
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 08:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773822169; cv=none; b=p3iTlNYvmJ8dJ0LaoL+P1Mn9UDfcGemMjKsPGtCRTHIwxKuqywIkmn+TDys+WYy13Yy7M8Kdz0uAV5HWOqczRXR8645q+kzZLgTvFpemG2dpoW8cLQNH8FQpgHU+hgM3XXWHs5Nz1XRnzfdAnkG8v7rOzaNrguakBHULCWpVVrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773822169; c=relaxed/simple;
	bh=OguXmxvgu8+63/765pf6tF3XoGTh0WGjLHU4/cJYNTE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kBXLnzoDXh6t5gR0AeXj97eNxjOy4BCT2L8gh0EBUtJxnGIizgnJ0lE9krT0KhQeO4/WpzJ/1LI2mZafvlQyv9EZIwdsxrqcYeJmWRRUmKrFe3O49gkm8eGklzs1+skVmaXt6WxzCP6xHs3270KfQjQwwEfaxLkyKCvVmoPx5Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iFFACriW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IuRHUWlE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iFFACriW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IuRHUWlE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I7wBHO2789337
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 08:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TL5q8XNKKsr7ag/yXRzo0IkwUhw2QAY4HyZGuvuWFTE=; b=iFFACriW7BV984Vh
	Uv7LZA/ROgOh3+tftAEdJBT7/IZYURWYNQwtPbFFglct1eSrl3KJ7EirsbWXZQ3v
	P20L8soC87ZhEQS59HZfDviC7kwLaPjtprYPSN0LQlbTrHRw0F27rk17gca+ak5c
	/vNw6DIm3yapiruFBPL9fVRkqt1bmZQMEYDw7RZb79RGWKU4rjiCgjp2AZMcHgnn
	S5fYHcjlSJq5zu2zvLKBwB7bnuS88tFWiQpT3A+VUtY+IDCBLA6A+DDXehmgOBJu
	u0R4JO8sBJuU+giZCPr1lZ73jaAngFtBFAI1rwmLhIB7In/2+ESqn5OB+Sx/bIgT
	wT8gGg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyj4g1hjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 08:22:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509162597f9so122083401cf.2
        for <linux-sound@vger.kernel.org>; Wed, 18 Mar 2026 01:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773822165; x=1774426965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TL5q8XNKKsr7ag/yXRzo0IkwUhw2QAY4HyZGuvuWFTE=;
        b=IuRHUWlEJGCDwSNWlIuem8fAwgRr+uTN1Xryxuvv3PK65RRlqNp8ojeRq5yczppduR
         i48PfA6lMW234qa9s71WtxjPTB59wowgo8XqVhffrY/+2m7bw5ljcKoovDZjqNeJNd99
         8rD/9FV57ejGkJWewcTS/XuUjERlNnphOkC/U8t31QhOL1hh/AHj1hOOehRnDNr5owwm
         gEL2KrWRF8uiaj4hx+iaGS0gqRXF1z7X2Wuc2sqxnOqvgp0nJ9WS4uxotuvhj3tJcASH
         U8Ygi60jazVaJei9O4eLzaP6z2+O3itY/1X8tmSbVAPLhhUDXk765kFxW0vq4Z33XxD5
         KZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773822165; x=1774426965;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TL5q8XNKKsr7ag/yXRzo0IkwUhw2QAY4HyZGuvuWFTE=;
        b=H9UjTnivdFIkf7MbTpaVcaH9l+i3L3KSs2xtkTnxVUKZePlJ2654l0xNQdfrhdgxqG
         vA2lmncJlrebA0AWV+kWWFmTJ7RJRYj/3sNZD8n/LWhYqWGmo9oIVK5rOqAYFrZkim5c
         hOKNGiI2P2qLe+khw6PfLNmOIDH2ot83Kd4Ar00R0Std7EVq2VtMuOLh3AyrT3S2lkAi
         jOWwjz+0YjRabvFONQJQjHoVyadPy/6rigTFyIBLxcZI0ypQ4H9x1Mry6CYJX/q9nez/
         wTVh1OITZr3eIIgPAwgB/Dll2pvfWWAsET9vV2ity1ofJSuBIOe++uPGTegW/XfRuUaZ
         gaWg==
X-Forwarded-Encrypted: i=1; AJvYcCWNkunsioP1XRBqUwSJ6kk/QaWT0tSXYu1Y+swf4jA+4hZmXjjLY4oSBqaqKHiu18b1PNMS0pi48SzB7g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj2R4B+ZYFPms4Le8I8wzXaTaavl7fJZRnWjdoVYfaw6XIBpOJ
	VcWZjGa1/ilzOvTk5haUujjejwNfi2Deb6JwJBfpcjoO6DUUocVh/a/bClG7DAP/z0i+ALX8ItU
	QmN0PwVUPPiKP/CCxBgmeQsTJRerS1yEzgOqDAgq4nRtvtFG2InHZPkp2bE8QhZFBlQ==
X-Gm-Gg: ATEYQzzrKC0HPBjKbn1Gch1tzh4Dj5RpLasrh+YuhNJ3idueXrbEL2ZYYdDUKOI2+aD
	ZllVabONeqSGcwn5Us5mDGGzB+MyaaGcSmpUxhfzhL33KXo7b/FHUQ8LaqDgZoYzL7BlOHdZ1Xf
	RgmZnxzeoqiPBh+TrNXtaRKllZdt33DkyuBfHNxRJ1HQ3neLpw4Ze/vJn6XLhl6kMsRovvQ95rV
	XbX8F4+3DWPfzB7F5gTUE7Yny4YxXMeeRfVBdnNoyMUr2M6etqmzU5cjJ7iASZgnCDkwyrQ/VuR
	6O6oVsthsb2J6yPxgYjj2heyu/plw7Px51yauVaCRSqJ63Be45RBbG6EV2Pc2eYicXJ31SH1P4l
	+CChEFkqJzKoisy1FFBxL06UsqE25xrAxCzJYaVvfV5ubc6T5
X-Received: by 2002:ac8:58cd:0:b0:509:382c:1c59 with SMTP id d75a77b69052e-50b14796e70mr28042801cf.21.1773822164979;
        Wed, 18 Mar 2026 01:22:44 -0700 (PDT)
X-Received: by 2002:ac8:58cd:0:b0:509:382c:1c59 with SMTP id d75a77b69052e-50b14796e70mr28042601cf.21.1773822164603;
        Wed, 18 Mar 2026 01:22:44 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4856ea8fb0dsm228715605e9.3.2026.03.18.01.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 01:22:43 -0700 (PDT)
Message-ID: <8370077d-ba1d-4924-87de-91b061c5c5ac@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 08:22:42 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] ASoC: qcom: q6apm: Add support for early buffer
 mapping on DSP
To: Mark Brown <broonie@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mailingradian@gmail.com
References: <20260309065137.949053-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260309065137.949053-14-srinivas.kandagatla@oss.qualcomm.com>
 <a93db619-7539-46ac-b2c0-d4b42a0478a5@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <a93db619-7539-46ac-b2c0-d4b42a0478a5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=TPhIilla c=1 sm=1 tr=0 ts=69ba60d5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=o7bm2iVLjxx3QYpfQvQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: dEaAg7GFNWxfYjYTcQJW7rTqhd4tKKye
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA3MCBTYWx0ZWRfX29wfQhzcYYL9
 iSyz8D5hMEB/A6JWJBPei5WztWyGPG7pVMM4SXeC/DOeI5x/zhM5T3VCRjCPHJC3PtzEHCPAL6I
 9qUhDJNhGNrxPUEQjZ3k10/ANUBefU9bw/g2gwNuMYaDUIChbV5Zwz53XZuAAYALaUhkn4ytkpM
 VGnhr3wKBQpd82LtvMeOYWNGgPxMNbO1vStX184rFlBgr4nX100H4zJjoRgm2YgtUZprOVL3yrO
 t0XZw/PEcI2+sNo4TRkJD3zSvDw0GrJPDBHoPbQbvEPhkYAARbuW8guURuw69TIAcNdIz4Wql/+
 +PiSsC8FA7nIwKK9/XscHKQpD5T3O4cnMt2YRlAl7zlSBB1DS46ZQxsURZ+bN+zf/mBDb/1L1iB
 c8VLOXdDnD+Q2roy6qqCZXIDJrdA6d+KwLpBqWJHPjDyY7IZONcUOA9JMIKz9yMQ4h3n5mtp2Bf
 yzeTfcGMEi0fmy5Xs0g==
X-Proofpoint-GUID: dEaAg7GFNWxfYjYTcQJW7rTqhd4tKKye
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180070

On 3/17/26 6:03 PM, Mark Brown wrote:
> On Mon, Mar 09, 2026 at 06:51:37AM +0000, Srinivas Kandagatla wrote:
> 
>> +static void q6apm_dai_pcm_destruct(struct snd_soc_component *component, struct snd_pcm *pcm)
>> +{
>> +	struct snd_pcm_substream *substream;
>> +	struct snd_soc_pcm_runtime *soc_prtd;
>> +	struct snd_soc_dai *cpu_dai;
>> +	int graph_id;
>> +
>> +	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream)
>> +		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
>> +	else
>> +		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
> 
> This looks weird, we're destructing the playback substream if the
> capture one is present and the capture stream otherwise?  If that's
> correct the logic is very non-obvious, especially in the case where the
> capture stream isn't presenta and...


Looks like this is a typo in the patch it should be

if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream)
	substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
else
	substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;


will fix this in next spin, along with converting the destruct to pcm_free

--srini

> 
>> +	soc_prtd = snd_soc_substream_to_rtd(substream);
>> +	cpu_dai = snd_soc_rtd_to_cpu(soc_prtd, 0);
> 
> ...we immediately try convert it into a runtime and CPU DAI?

