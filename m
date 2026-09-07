Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6133F31F996
	for <linux-sound@vger.kernel.org>; Mon,  7 Sep 2026 04:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755811; cv=pass; b=ajN/+E1CcA3Xi6T+gPnjQO2ReRvKJ0jOqHZrjw03JNVsJN12ua93vfHLCa22kB40odiEq/gRPPD4yKXWscn7EXZMc49jNKW//gRs9a/yCb1IEyhtZhPxPXNbRJamWj113xciF9LY3PU17JBWGB2vUqOydtCHt1Tuqy6MnsyRrWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755811; c=relaxed/simple;
	bh=hUnGH29frAUOv/0EuRdjA8PunMlslRH8ulu+jotd78o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hd27wZh9S1L0usrzNAVAdlBktKqRWa+/O1yS19EmXiulZq9wDtTQ+VYx+GvqZPLpqM7y2eLs7NHGGNzY5+VP2BBxmYhiX47eAVEMkvuowg0zRI+mLCM1Dmgymqz/SWOZW5TxsbZfy++nvDAOZEZGX9i05x2JAAPAZhZyyTXfElo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FiljLwxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H8XR9sEP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FiljLwxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H8XR9sEP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l4d41699721
	for <linux-sound@vger.kernel.org>; Mon, 7 Sep 2026 04:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=; b=FiljLwxkZ+eG73E1
	RsvV7XSB2GVymZn2gg3R9KWDIAmbOy3hiL0PJT9up2MxSTuKpkyfzZXeHRhY5jZH
	mHBO2/NAqLIppSNvzn/Hl4/KdGdT2WPjFr3w+dJcyBpyJG6M+BWO/0Qk+mgdNAwX
	lrXC/20md7FR0ZW6PNiSuX4+a22ElBT0sOb6FTMQBKL/6r6uWCn4z2CD03mvr73n
	1NbX49uAYrxydeEGCjfuv+w2cLLwEHkNhrKQd1yoWWSO3xjh/Rb2vNtt6RJxDZW6
	WC+AuTSBzMOn/Nn/VcwawEtjkhRWSKRalQYGTqdrso3+BFStYZr1AVJWYxiLYy6f
	11KYHg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jcwvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 07 Sep 2026 04:36:49 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8648f12d52aso39179157b3.0
        for <linux-sound@vger.kernel.org>; Sun, 06 Sep 2026 21:36:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788755809; cv=none;
        d=google.com; s=arc-20260327;
        b=EiBJnoDrFgBOWXjj0k3VcDePfc9WepkHxvIFzm/UnREt7HSrbFPfRm0O+R15kx5XBz
         E1dgakfV1+AndB/zgrTR03MV89h7cfQaZbpHzT3vhFaveC7aOs6VppdkktwF94/ONnGG
         3ZsqrFhYubHC2TbX7wRsi8L8wQVUcMQ/g8qj9IhMtsv1Q80wraupJ632cdosBRQHFJx3
         BADh/4PhDRgcyNl5epvB2MEXMwSRdEr48A8Y2vYM2z/6bSWoYHsKxCpOzGWa1+deenGp
         1yWtaxjtcXZsTjioolxlbNoiEtDoZq7nuxymJOKDSUspF+x2zy2dJna9vXIsTwfJjBIF
         mF3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=;
        fh=mxkcBRn4ugDbgqJQxNMwzFBQGNEdorb6CV84YjSCIvM=;
        b=ERN2hYWwDpQbjAC5bkFKe3IvRaUZWhtPisX7e/btEoDTdCOy0/TZ191VJG+BPoLdSp
         w3jPpO3UY0sZYJ0o3smj2PollrC8Q03iXNpYLQcth6tXJvbD1SUd2x1pc7Rdf4oqDzgw
         5wWUK/NBx5jnH00C/BP97Hahw+pfySxOHgaXWvMAl6mdbgr/JgvI13L30b15dUOCK21x
         Tpom6V3KZT5sHHtdTtjw8qVNHUC7IQOG9ePM0aK9W4bF1qy4N73O8PlQlJiFpoSbgqqE
         XXOmRkYY+EFjB9I4FE5jTnh93FEwpovyDYzEabPBMrkKXlF2cU5rS854zN8llKFA0n2w
         fOsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788755809; x=1789360609; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=;
        b=H8XR9sEPNuAdIztPqIeF6oS7KntDjPjj5DRqiZwCiHfJ9BnNhQMFdSJ4VI6pbouHyk
         Zqwnj5+gJtGlNx9u7T8fNLjVTfDvGJFm5CqPb/TdYUXr+Fzdej7GXjjlZ4N0qGgD18eR
         FyhuKJkMYxfGsgUAPuDekZI2imqmUx87r/FMppCn46jrheyt1bo3LiKRmDeTHIBvsMQK
         CuGaZJ091I4HdtXpP5X+yBdd3Hhg24zmqct/Jtq8lKp5AUwNuZoa1mhrURtZAvSMa/RB
         mHtLGeCz3IiUyF17QmamBT12bbCxjoSVpIRsAZIBjcDI7B8IeVZFjfuX6fkhNT2iEjeE
         RcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755809; x=1789360609;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXvOVPq/0G9Af1iQjBbrByfRCSP5jsO6db1GgQhts08=;
        b=G4nhU1TR/sa1IvIqS3Ce30QXjzKnMlU/inOVQlQrawN/f6VdiAT2odHgU8XofgBuJ5
         x8RifNcYgTqSSXcgkLO7NgmZOUyPrZQqFNmiVjjiCpbKnXVk36ZSptELv+DN+9EIsmYE
         fcN9ixoh+M0xHZh7Y9SNmJLN1OG2jwqYh7dDQEuFgeUCKV2FcXDBpn1Io0zSY3h6/Bhr
         9Z98gMVdF8TFSaRRB3sseTgaKSiCLNGxX+HUxT9xIH4hrQ2LDj0C7/3H7P5FGqNJM2XR
         OrifbDtVXC4cNdkr9A4OIdFsV9sDU/MPl1diIqcQwjdVDUNRS63IUAUYeIwLEmMvUnuk
         rftA==
X-Forwarded-Encrypted: i=1; AKwUvBySrer0VewbjJfgzrb891waLyCGgcfdY4sPmq09fMN0Xeo9SC/MskPTZI4rdEvHlNypWbpuFqE3DWQIDg==@vger.kernel.org
X-Gm-Message-State: AFuF++k5bo4FqVRtnyOEJ0TqsvDoFJoTFMA0kw2Mi9bTqYMr0SAKGF89
	dyoYJWWoXzDIcA2vK8IhrXrBa38sQ2Tr9gA7pOem3aAkvQ1gYtNh5c/kdyEfdwz6CGj1tirERzW
	B1HBDUbPhw+ICpxfQPnKu01Iskm7byRITkVTHYpR8Qcyh67d8u6O6VVW4hjQ8+gTgEYZHNLFhyb
	S7YZBhBuK+T3TQgNLjJNuUPOmweKB64J9xczfu1f0y
X-Gm-Gg: AYBFou0TueBzsHxOGWthb4imWmGdFNER86cuvXRIZq6flRRzvH2xfI/9WbwR+r8xsm+
	51szNBy1+jrNiKhc348b6WHlXoINZq+I80+a6/jdhnzXps/3rH0smTWpdf0bPHqMA3oH/DiQnG7
	U5ToCFbKhwVNVSkkTCzStnYe69xuiKW4X3xO7neGbBj5l0XflcEkk7PY7JNpI=
X-Received: by 2002:a05:690e:4508:10b0:66f:c7df:1442 with SMTP id 956f58d0204a3-66fc7df14e4mr1070536d50.40.1788755808740;
        Sun, 06 Sep 2026 21:36:48 -0700 (PDT)
X-Received: by 2002:a05:690e:4508:10b0:66f:c7df:1442 with SMTP id
 956f58d0204a3-66fc7df14e4mr1070527d50.40.1788755808367; Sun, 06 Sep 2026
 21:36:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903072902.3870009-1-harendra.gautam@oss.qualcomm.com>
 <20260903072902.3870009-8-harendra.gautam@oss.qualcomm.com> <1bc82ff9-87a2-45b6-88cc-43acf92c84bd@sirena.org.uk>
In-Reply-To: <1bc82ff9-87a2-45b6-88cc-43acf92c84bd@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 10:06:37 +0530
X-Gm-Features: AcwNN1Ut4lERX0ImtklUb__wwFFA1e6nLSim3GBD2KDrKci5MjcsTbDpGSY4jXQ
Message-ID: <CAC-tS8CccoonxXUEeGhEd9Ct=DuQWALJJr6S52fonPG+SRoNXQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/10] ASoC: qcom: Add QAIF PCM operations
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: wJhRqb4-93JkmCpIILMQuM877jxXoA_M
X-Proofpoint-ORIG-GUID: wJhRqb4-93JkmCpIILMQuM877jxXoA_M
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA0NiBTYWx0ZWRfX0+3fz+kKvF3X
 Al5hGnG1ySd9HpUAMppp4Xaa32ZsBHFcKhC55G5+my7XjZTKYDg5Yac60bfQVmXwFkym0AnijEM
 J1VLf1tToEAQTK8IZFQ3B2fV4liqX1nnb1etw01PYiSuEjplSamXu4z6CQM7YpWfYBd3Onxahr6
 YAEKw7zMSZ7z/nF58RHjkQ/mBfhq4GP+VWo108+A97KQcZrjVl09jcGIaw+yHAj/lotINcq9VHs
 BCNvXR0hcw5nIjThp3O+rowWG2LhON5I+m5V9U2qE4hzILzuLDAMovNllgigwMn0g6zXZKdR8kM
 03/ddxf0IW7OwEZhgHmclCVjtxkvTdZIUBQEprhfW/qgjuHKGN+eVucGCS07WAzsnEBOHICNBzY
 piB2tnB6u4fBckU8MMkuykX3fUnE9vKax4Yl8rUzGNROmaSwj42+Gn3Lx5FgvSPlvCIbTUFvwXe
 c5I3nSRBixFpC+f1+QQ==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e3f61 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=WyqP0FlduNzGPyTG3yoA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA0NiBTYWx0ZWRfX6UXIGBDZEJfn
 YV1lts/+FxDUYhy4++8GRlHVMuzEiO7W0C6npjPgnVuWaSy3JMNqEMyYrH1rz10fOGqvk49O1bG
 OLt2o4kh6SDvRMCzKzfgXTbNcT+l7p4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070046

On Fri, Sep 4, 2026 at 1:04=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Thu, Sep 03, 2026 at 12:58:58PM +0530, Harendra Gautam wrote:
>
> > Add the PCM platform callbacks needed to use QAIF DAIs for playback
> > and capture.
>
> > +static int qaif_platform_pcmops_open(struct snd_soc_component *compone=
nt,
> > +                                  struct snd_pcm_substream *substream)
> > +{
>
> > +     dma_mem_info->alloc_size =3D qaif_platform_hardware.buffer_bytes_=
max;
> > +     dma_mem_info->vaddr =3D dma_alloc_coherent(component->dev,
> > +                                              dma_mem_info->alloc_size=
,
> > +                                              &dma_mem_info->dma_addr,
> > +                                              GFP_KERNEL);
> > +     if (!dma_mem_info->vaddr) {
> > +             ret =3D -ENOMEM;
> > +             goto err_free_mem_info;
> > +     }
> > +
> > +     mutex_lock(&drvdata->stream_lock);
> > +     stream_dma_idx =3D v->alloc_stream_dma_idx(drvdata, dir, dai_id);
> > +     mutex_unlock(&drvdata->stream_lock);
> > +     if (stream_dma_idx < 0) {
> > +             ret =3D stream_dma_idx;
> > +             goto err_free_mem_info;
> > +     }
>
> Shouldn't this be err_free_dma from here on?
Thanks for pointing this out. Yes, you are right. This I overlooked. I
will correct it in next version.
-Harendra
