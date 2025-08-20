Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AF0E2737E3
	for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 17:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755712595; cv=none; b=tcIV5MNZqfD2XCa7jDAt8cJA88G3DotlYs6AmQGBqgOMZcdA0A0ECXnpMyxaa3RKh5Ug+1FMjlmkbFboalYdOoVzbH5zP1Laqw0x17KejoAqq2WI8EC1tlCxh0DmfFJBzbnUUoqKsYRqJGI1oqHLM8ymxPgXWGCTbfC9AsjAgOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755712595; c=relaxed/simple;
	bh=QOcH2g5W2VgD9rWQLuw9eVTUp02n6Q21h3gU4HYGuQY=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=GTFVYxLPzklvM9tO8iaOJKBYmeZP3pnLagfp5Y1hSz65t3JRRYLDafo9kCn1VVRMVoMkh4Vtzefl0hAykt1ki8RwMH8O71qj5Xk6rwCOZLAHnh09RewTzndVrdsP6v7ygq/12XT/8B7s6XyeN0cWwns6GhJI4B0ichC+/fpKSk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/v0STli; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/v0STli"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b916fda762so582764f8f.0
        for <linux-sound@vger.kernel.org>; Wed, 20 Aug 2025 10:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755712592; x=1756317392; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gRaTNaGpOa5Z+hRu1yAnzsNeyy2LG4LK/xZpmXNSsoc=;
        b=B/v0STliWwFwkeILjSqJBTwi1Nz89yvFPHBm4eS+eRnaokpNhOJJ1ZxBwA9BfDw1CM
         GAPq4J6ls+UzCV1yCFIpvSsubXk5XMGBW8hle5Nudp3hH58dbilLkoJGAeQ4hYbrIgK5
         GpN+2/atjzqAUdWGbf7YMFpMgnRObYnXyLfHzU98YC6YeLg9l8DIpLGTsejkmyss/ZOY
         xzWlRwlwQ35AJMDUl1kZ9CsqjSn+YmVTWXDO8wzsmC3c2J1dcY3knCjmg15c489w4Muf
         lxwTeugOzTi2JqVf8ecK2x4ddnNsTYlak82eLlYP+FHgp2kh+n1pMj5z5rnhdjQYV9iO
         SJFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755712592; x=1756317392;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gRaTNaGpOa5Z+hRu1yAnzsNeyy2LG4LK/xZpmXNSsoc=;
        b=InaQkrtB+FxnJK5PCGRnT6xcyewj0jqK4Bx/825gZfXFMHoB47XsyF3HLtX/eApp+E
         HVlr14xLsdUi+phpMIsu+y9/qIU0yiI0tq8dT/1n2OTdUZycnmCK4G0xsXrQa354lunk
         UfAowriWhRpV8igfsQIjxBSF4Ix2LpM0+Y6t/F8qgry2QCLWOLqWDoPJaI1D/4S8cGmF
         B993Xd3qmgqo373zeKtUaoA2uBUyq7sMehxRLTSNuXCwccFiCE9RUWv1hVvzubTDLeX1
         1gxyDahXSYu4+6q0kNOREOMpTarSVuBKRs6YkN1/b/1BpEk36VeMeaeNx3gGJkjmj6wV
         Qbmw==
X-Forwarded-Encrypted: i=1; AJvYcCUOW7hR0FtFsF7jih4fOU8ROTHC20t59ZDr9IeZfywwy3Ws2QTl432RwCqByq1BJGFS9lacmPAJU5t63w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyLyYBNFmIBQRS1duWF6WX4d7r9Vr/INmAZfEcJ5nJfUmrBrb33
	xblv3FOD1fymknmJcVTBEZ134Mgh+LRHFjSVsQrGr0gVqoO2tuc/disb0z146Wq2f+U=
X-Gm-Gg: ASbGncueY5A8mJBjvMCcGbZ5JvpNZV33iuIqDchBcokZ5MdcbsG8de25QF0T4FGGk/y
	OBfOmOD+wlbja+udzGqfNNerXQ0KFbhXxgKWUoi+YM2kttyNXVRqYvGlMYeys00tTp3o2PjVuDN
	pUqP5uYz1EkYylkNGvPldFI90sv5lMiqglsPDaLf7+2Xd8c7xWPv4FZDqlFy+jC16Vix6IGgHiA
	Bi0n+NZ5cFOrWPHkamaDT9Cwh3Dv+9MWvhODN+p5zH8Oke3a+La0+GCJneVzdr8VJzeByssvWBM
	QdMu//iMpJVFQ4s7YWZKt0hvqBmCTgu831Ij3VTTFCrC4diGvLOii67AmdZN+HCCxtQg5C9wYOB
	8GU85vE6L8e1D+nAUX+wFrAxY2OU=
X-Google-Smtp-Source: AGHT+IEnJcBD8HXQkToDE4iC/mSJ7mzWcSv6cC9qg3LBD8IqH8NeDDcwZslRIYizdVu0Cq/R4HhLFA==
X-Received: by 2002:a05:6000:25c2:b0:3c2:e033:3994 with SMTP id ffacd0b85a97d-3c45fe7ccd1mr371009f8f.26.1755712591851;
        Wed, 20 Aug 2025 10:56:31 -0700 (PDT)
Received: from localhost ([2a02:c7c:7259:a00:3a9b:1de2:5440:9326])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c07496f432sm8454409f8f.6.2025.08.20.10.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Aug 2025 10:56:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 Aug 2025 18:56:30 +0100
Message-Id: <DC7G65CXCQRB.3NGHI539I09CP@linaro.org>
Cc: "Vinod Koul" <vkoul@kernel.org>, "Jaroslav Kysela" <perex@perex.cz>,
 "Takashi Iwai" <tiwai@suse.com>, "Srinivas Kandagatla" <srini@kernel.org>,
 "Liam Girdwood" <lgirdwood@gmail.com>, "Mark Brown" <broonie@kernel.org>,
 "Patrick Lai" <plai@qti.qualcomm.com>, "Annemarie Porter"
 <annemari@quicinc.com>, <linux-sound@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>, <kernel@oss.qualcomm.com>,
 "Ekansh Gupta" <ekansh.gupta@oss.qualcomm.com>, "Pierre-Louis Bossart"
 <pierre-louis.bossart@linux.dev>
Subject: Re: [PATCH RFC 2/2] ASoC: qcom: qdsp6/audioreach: add support for
 offloading raw opus playback
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Srinivas Kandagatla" <srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: aerc 0.20.0
References: <20250616-opus_codec_rfc_v1-v1-0-1f70b0a41a70@linaro.org>
 <20250616-opus_codec_rfc_v1-v1-2-1f70b0a41a70@linaro.org>
 <c4d934c1-0218-4147-882f-279795bcd1f4@oss.qualcomm.com>
In-Reply-To: <c4d934c1-0218-4147-882f-279795bcd1f4@oss.qualcomm.com>

On Wed Jun 18, 2025 at 1:34 PM BST, Srinivas Kandagatla wrote:
>
>
> On 6/16/25 4:26 PM, Alexey Klimov wrote:
>> Add support for OPUS module, OPUS format ID, media format payload struct
>> and make it all recognizable by audioreach compress playback path.
>>=20
>> At this moment this only supports raw or plain OPUS packets not
>> encapsulated in container (for instance OGG container). For this usecase
>> each OPUS packet needs to be prepended with 4-bytes long length field
>> which is expected to be done by userspace applications. This is
>> Qualcomm DSP specific requirement.
>> > This patch is based on earlier work done by
>> Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>
> Thanks for picking this up Alexey,
>
> Same, co-dev by should be good attribute for such things.

Thanks. I'll update it for the next version.

>> Cc: Annemarie Porter <annemari@quicinc.com>
>> Cc: Srinivas Kandagatla <srini@kernel.org>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  sound/soc/qcom/qdsp6/audioreach.c | 33 ++++++++++++++++++++++++++++++++=
+
>>  sound/soc/qcom/qdsp6/audioreach.h | 17 +++++++++++++++++
>>  sound/soc/qcom/qdsp6/q6apm-dai.c  |  3 ++-
>>  sound/soc/qcom/qdsp6/q6apm.c      |  3 +++
>>  4 files changed, 55 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/au=
dioreach.c
>> index 4ebaaf736fb98a5a8a58d06416b3ace2504856e1..09e3a4da945d61b6915bf8b6=
f382c25ae94c5888 100644
>> --- a/sound/soc/qcom/qdsp6/audioreach.c
>> +++ b/sound/soc/qcom/qdsp6/audioreach.c
>> @@ -859,6 +859,7 @@ static int audioreach_set_compr_media_format(struct =
media_format *media_fmt_hdr,
>>  	struct payload_media_fmt_aac_t *aac_cfg;
>>  	struct payload_media_fmt_pcm *mp3_cfg;
>>  	struct payload_media_fmt_flac_t *flac_cfg;
>> +	struct payload_media_fmt_opus_t *opus_cfg;
>> =20
>>  	switch (mcfg->fmt) {
>>  	case SND_AUDIOCODEC_MP3:
>> @@ -901,6 +902,38 @@ static int audioreach_set_compr_media_format(struct=
 media_format *media_fmt_hdr,
>>  		flac_cfg->min_frame_size =3D mcfg->codec.options.flac_d.min_frame_siz=
e;
>>  		flac_cfg->max_frame_size =3D mcfg->codec.options.flac_d.max_frame_siz=
e;
>>  		break;
>> +	case SND_AUDIOCODEC_OPUS_RAW:
>> +		media_fmt_hdr->data_format =3D DATA_FORMAT_RAW_COMPRESSED;
>> +		media_fmt_hdr->fmt_id =3D MEDIA_FMT_ID_OPUS;
>> +		media_fmt_hdr->payload_size =3D sizeof(struct payload_media_fmt_opus_=
t);
>
> maybe sizeof(*opus_cfg)?

Ack.

Best regards,
Alexey
