Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794740110;
	b=cB77bj/YgGdmdFqCVwbn5VYz82OCkMERXVfZk1Xd9CqMkXNvgpFJyeI/gYLiT8hzjuai
	 3zBe+D72VaRMyD6RQFFO8Ya209x1nUtmCEuSeU61fkK3EuEj8UYqIexyuz4hIFnNWthsN
	 pRuAQBwnh4Zz7J/rFOEZeuV3nOM7ihqm822Ls4DPKzEiYplr1N4sSAz+gyK6ObAW6Ko26
	 xcfxE2KZMS3mXMm4F6pvn+dpqry5XOJBwIWuaTSMcoJW1bPxmS4zMtjtrdNKDHNUZu65i
	 f9iXjWjHbLS6R/RcTpvd5AnjCo0dD4aE7zpekck7cc32wAJP4JcsGJuhvUhYhQoE3vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794740110;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ovcT9sSS/yXB6ADFT1wuSi0b157OSQhzyRchARiron0=;
	b=kJ3eLueThN9iTBOwW/+AQu7VcogoD2d9cg1RqoP+KCxmOrwS5g4qU/pcmXwc1iuCJzfd
	 lskQ/o8DR5Q/y4B+JerkYl/PVb7/kdQnJO5J1MsyHbhWxS/FHH7/JEmQNs9sOeGKe4XHF
	 Jk2OKWqHB+UDqxMfTD4bByFKiSqwO9AB80dvpiN1v0cdw1/DIma9lupkiIKYmsAe27aRB
	 4qAORE+I/t0nzh7UIEu4nLDfRL1QfaCu56yqS+9RsO/Kjzr7bE41wL26JpVMOejomS7zK
	 Icca/fEmotsyPrH9QJ3GJ+rr7mKN1Vp/hwJgw4QdfB08apDvIUDOSMoFS3BH/NxR0Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FvV394V/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tpoe5N9q;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA69606A31D
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:55:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DA69606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FvV394V/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tpoe5N9q
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AF7w1VX236017
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovcT9sSS/yXB6ADFT1wuSi0b157OSQhzyRchARiron0=; b=FvV394V/Htd9cog8
	Lt/hOYFr3tfmzCwX4jhi4TAUzV0bKEnr9ZD0UxMUstJkDdM/NBfv73YLkG2/ouph
	/UE73ISwr9ueOIwa1H0c+rlTEgXkwDWgRplFty+X5PTq1OXdOFOVMEDxDC6OJwfH
	TL29SxnbzUhcpIycSBdn651NqVi6oXW4eh0ob27RD23PFkOxWbxpqXIUn9dmVX0U
	hV5XclG/kxpbuZBL/7emu6Il6zS/8rovVNYsQz1/dWVWWWvZCyV8iGx0PzuIHFmE
	XYCmsEH2S9cSVy+m3C9BqzUQ2zRuIaoYG8EBOv9v2YHTvypy1+hlkXyqOzM96bde
	Cu6rtw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj42tre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 10:55:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944138ed63fso401872485a.3
        for <linux-sound@vger.kernel.org>; Sun, 15 Nov 2026 02:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794740107; x=1795344907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ovcT9sSS/yXB6ADFT1wuSi0b157OSQhzyRchARiron0=;
        b=Tpoe5N9qdfhTRzJGBJJCuYU2S92B7Hcp9c8QhGd+6HUkzQZlO8nqZwsJhul0RYIRsK
         in6zfiWQu0ANb9to8fTxtU02DR1Vbred3FblWw01jLbuo/Z4FjqnZXFt59dBoBplJTLe
         UeMqSeB7JFdocrV28agIBbok6o0ouQjYNqLcVMoy2KC1c4DcWP72m7xET75niCiD7FzV
         m+sXkveBltIXQmVgO+Utxe/hyRIcGKej0DN7ymH3k7g9YVMSRrsqt/z5tIo8WCxNC+5N
         QLexPUe2gRecnz4U5g87l6y52bs0KibkpISaHpwFJOgYhzHf4fdrAmrhcM7Bz8ixwO7i
         UR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794740107; x=1795344907;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ovcT9sSS/yXB6ADFT1wuSi0b157OSQhzyRchARiron0=;
        b=ow1EfxQKucBKHvPgHm3kOQZgDqmBT+xVTQqW+1d00ebjJUoTS9s/wqqcGgy86JkCPb
         6yqk9j1h94TV350hwkKFIlEbYiMRsrvW9k9+ec9udiz0AXjdWQPb17lB9xStVkyeKAO/
         nz225qo/sIL3Tn41I/DAhEC9RqLO6NJKDWc3EZXUfzRd95FDtSgNXDgllieOlhUlsu45
         Jryh3ZTs5MwgiIs4rPTxfvDAhuGdCY/w30Ubbkss3dao9lR8JI12TrQI1zlHOK/USTfP
         xbZuup5YPK+p7cl6axCjycPZ6SA14ym9RTBEXGPN3MQ/phFx7n8zvdSRVIL6wJRUrwit
         RLlw==
X-Forwarded-Encrypted: i=1; AL+hErHH1sIIMwDoikROkdvGEODkkwk3lu+SU+tUtIMzV2I9Hn0YX17woAjH2Fx1Ecj9jyAOnoj4mGVk6IdTUg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+GcMOhBva+ZxJ7fa5JOm7vNIk3TteVDmu6hI3h2wZMMOWPa6tF
	Jx5u8Eq3oCk3LOg8Qh0zcqZzChWwxIHmmwtOi0ZBzUbWqUnA5njbI6gXE4i8qTt71sbUhVTGpL+
	27fFQVKpMqf+75t8mCPJdkeed3VKjTME/ohLc9BtlJscwoHVuOCkvBhOIhdBzDU9iFg==
X-Gm-Gg: AYBFou3XOwnif3ydbnXWl1n9/oeqkybxBvMEolxRl7hU8CDsXzbOaB8BvBYhbz2d4L3
	xZW5x1XlCpWJBUExabd0F4Pq6dnUObu86ylBHqaYQ0GyqzTPLFLlB6geY9zch9vyokw2t0vzHji
	IJ9dPDVEGqAvczKPYjIUr+FnvJ5FyE1jXpFCExDtsqNM6Rdyr09YkBbmnkMenT7tjDhv7iBbapW
	OJFUHr3pfVWgMlv8qlKxoYh7UQKGEL64vHMUkLRzdqBt6pJN5Pf338+VM1aI5pJc5J0gDqBcKY/
	drUWk9ozS8WRyhN/azmgXH7pZcsswZmCQYgUfLUCNWnoI4OqJkZZWsvo5JhDfbxT8Rpku297yTL
	ySOyErZsG0ZIR/leduD4DOLYcRMeHrf1bNPk4vbu2zYfpHbUNxq2QVEJ8y3RwUsmWBF05i0W1Vh
	OperviRgtypgetGDP+Uw==
X-Received: by 2002:a05:620a:6910:b0:949:76ca:ff30 with SMTP id af79cd13be357-94976cb03d1mr118495785a.31.1794740107309;
        Sun, 15 Nov 2026 02:55:07 -0800 (PST)
X-Received: by 2002:a05:620a:6910:b0:949:76ca:ff30 with SMTP id af79cd13be357-94976cb03d1mr118494485a.31.1794740106831;
        Sun, 15 Nov 2026 02:55:06 -0800 (PST)
Received: from [172.20.10.5] (82-132-234-47.dab.02.net. [82.132.234.47])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c50d97cb956sm21842266b.24.2026.11.15.02.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 02:55:05 -0800 (PST)
Message-ID: <5d8b5bc8-0937-4ee9-bcbf-4d35f05bed0c@oss.qualcomm.com>
Date: Sun, 15 Nov 2026 10:55:02 +0000
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
Subject: Re: [PATCH 1/2] ASoC: qcom: q6apm-dai: reject compress rings larger
 than the DMA buffer
To: Julius Bairaktaris <julius@bairaktaris.de>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Vinod Koul <vkoul@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261111080624.244291-1-julius@bairaktaris.de>
 <20261111080624.244291-2-julius@bairaktaris.de>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261111080624.244291-2-julius@bairaktaris.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE1MDA0MyBTYWx0ZWRfXx+/4I2o+LfYM
 qBF3Zb7YcMpti5UFENHeasld0L98KNqC6sTo/b7OYSyN0f8wcr53X2PcpVwf+55qWgPxth4zGnF
 PHWls7AWrSOpg6GFw7BsSO4IHz03+Q2ju1byOlET+z5ZR7Z/tRmHounuBo8kKbjT2ZJEhwXjw7D
 As1LIzFvJtY1rpkdYaHxi3uUml24OMiE5KQC6q+LFqq8oIjGoijVOFo3Y8otfe6u1LXPm+pYDaZ
 BSG1L1ZrXM4sfC4wPbMLwL2fjKiN8XRJF7788WpQjKKzpshRsZkrRlCieuB7VjLE0iLbFjWdfCv
 SI8TAMLCgvIfjfDVJeMNrgaioRJRr80ICSLV9n4AzDUrUULhJBnAmyPdKQ+kdxCqUh+yf6ZZpOT
 G+e84vVq7HVKMld/kl6aJbXGNc6uJdtH9Jkoolp/BU5luqZx6WQOWRL7z3qXVQtJcLNzPys9vvQ
 dm0U8/y+6dFHWmdbQWg==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6af98f8b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=AI3hfGQ59aOwaD8qyfpUrw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=dN6ZHlLifVicRFT-rNIA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: jaxY25fz5TZCkKdDClNlgMjrDlZlgpH7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE1MDA0MyBTYWx0ZWRfX77ujWZqZDYmY
 uPDU65yT3jSGxlupc8CZGETHo6gtsp1ZH2FOq+FMJZHMLB2ct3oGojrXPsjoK6uWWrB2vQcCQHm
 C4jNUSf+vtWaF2znSQfj0l7Ynk1/2qU=
X-Proofpoint-ORIG-GUID: jaxY25fz5TZCkKdDClNlgMjrDlZlgpH7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-15_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611150043

On 11/11/26 8:06 AM, Julius Bairaktaris wrote:
> q6apm_dai_compr_open() allocates a fixed 8 MiB DMA buffer, but
> q6apm_dai_compr_set_params() takes the ring size from the fragment size
> and count that userspace passes to SNDRV_COMPRESS_SET_PARAMS without
> checking it against that buffer. The compress core checks the geometry
> against the runtime buffer only for drivers without a copy callback.
> q6apm_compr_copy() places each write() at the stream position modulo the
> ring size, so a ring larger than the DMA buffer lets write() copy user
> data past its end, and after SNDRV_COMPRESS_NEXT_TRACK the copy starts at
> the next multiple of the fragment size.
> 
> Reject a ring larger than the DMA buffer.
> 
> Fixes: c317d148a2b0 ("ASoC: q6dsp: q6apm-dai: Add mmap and copy compress DAI callbacks")
> Cc: stable@vger.kernel.org
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---

Thanks for sending the patches

both look good to me, but I would recommend adding a dev_err() so that
its visible to user if it fails.

once that is fixed.

Reviewed-by: Srinivas Kandagatla<srinivas.kandagatla@oss.qualcomm.com>

--Srini

>  sound/soc/qcom/qdsp6/q6apm-dai.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
> index 58beaf906b9ff..80b837992b429 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-dai.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
> @@ -990,6 +990,9 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
>  	if (!pdata)
>  		return -EINVAL;
>  
> +	if (runtime->buffer_size > prtd->dma_buffer.bytes)
> +		return -EINVAL;
> +
>  	prtd->periods = runtime->fragments;
>  	prtd->pcm_count = runtime->fragment_size;
>  	prtd->pcm_size = runtime->fragments * runtime->fragment_size;

