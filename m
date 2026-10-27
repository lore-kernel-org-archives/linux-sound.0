Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793094933;
	b=ySdNabRCYnDoN6sD98l6g6gMDqJzJgUJig+0jX3ruNKkHPQjG3APCXBPViYXMq0hxe9M
	 q7J5IrVoQgUEV/JfXXZrANNN9lxEmZMp62hTA5L8JHeS2Rsz8MlKYpJjys66W/dSQ7sdZ
	 6z4dqHdGQv0JQpdSKfFWHOht3w29c7EsnwqXVGCcX4+oOSlTA89bjYTU837aFN2gYBx8o
	 QcrKfQ4+zJD7s2vhG+dofbhck7NOvIKDjhq2t4BIPqiq4XD2HdK+U9+Q0sNT6jkw8B0zl
	 D9rSXfrheEaB30kFJQ8avXVBXiFGWjF4l8t4n+x0Adb3oL4aw53ES9AW3YI00I/NGOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094933;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=;
	b=CCLhN4LmeDx0vnQLuScRddjOhZEjsBlPWly+QLzwvbfonOtXlP3H4mW4bGp2iXAe0H3J
	 8hsjCXFXAqnAn/QQaQbDzZ3HtLv/+JhgxllVT0VYqhYc3c1RGj7ttFgYdKE/9G3SyTxX2
	 cWux/jE/ePSsJAoZ8WASHAQd+MGX+lZbF7n+R+1OFUOw579U78va4UOgjvJrut2RyE94p
	 esSu5vLGHAkq/zKo+VyucHdQnJNYqCeAL0oxjTicNTezsw1gJAgHNmB7xEzX47F/p53ar
	 XBypHTCISe/assAZy5CdkgBbn/c0r3h9w4QuMiJixmECPXd/ubyd9nf7fVqPlL1YC5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGVU2z5X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGNsLpU4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C272606A323
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 09:55:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C272606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DGVU2z5X;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jGNsLpU4
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gKgO1162775
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 09:55:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=; b=DGVU2z5XeSNhYIKS
	yfThQ5W/Fl7cOogg4qMa3jOQq/I+zQT+KPoV2DKRfPcrezlaEn7C0o9fTN28zDhi
	PzSOmZLvRy6m7W8CVlvWYDOvD9J+RLilyLePhVUlpl0UwNrXhY9+nUPDI74EQaI5
	WlXuqbwRTVaa0ZJZlR/KRwSuF9BNMpZtGzKRwJ2ERQ28p2bXgey64lnYMCZHsA3C
	o7dAUptj7m4UdfjxDFlU97ObXjRPKovx2RjLqvxmYd676bo135AXu7z1aKGmHEiK
	zXlmrUdqLcS6/SD4ad5OwId9hlFKa8jTSNl70Gx2w9STJJ7AmcaR7hulguh4wzz0
	bWvtpQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjbmmb0ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 09:55:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9572e892dso33128975ad.1
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 02:55:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793094931; cv=none;
        d=google.com; s=arc-20260327;
        b=XovaD+uVL2DJC3Bm2qhRUwQtQ43CbGwbRcJZ+3/Jze0DCrPWNiYyzBWyTF7Km+ZVdd
         xkrIlgFik1PphzsSGDr5x3qJrXY5DQRHpw7D5WXBDsQfUr1rX7o4rNiUA1Hg2C0La3m7
         Sjd1hu1hvwVD5PMxvq/Gn4SqojdHNhWqSufM7l3ydRDLy5xaARszl5dWn4PEE9UsDdqS
         BAMbsN+342/gXcbtmoGf4dl9QQSotzKtCR0xEu7UjVKVlyPNanlMcNglOrKsFXGm0yq2
         nxE8NengtTtvzjDUPo7fGNAsuCYO2f0j4nxsINAnsXzbLvJ3wBJOriYRK5Kp5HbTtdvU
         8cag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=;
        fh=MV5H9Fi0UaWQbqcpR4CTbh/9JZ061PuZy6GcQlFC73k=;
        b=XYeee3WdtZ12wlEWqywb6hK4bVW8l1H3kzHSOd5k9bk0GAGd9MOr8AkuPxRb1/IuQw
         3Vu26dlTpSTYJr5HmNQvGURXTJBASy+qkbfIZbB5X0piD2ibN/puGpddqNwP4FCfF2+b
         YXHshMtzIhDDO4TCcY9R7Kye5WCoeH8KjPr7bYHDE/gZRw/YrpbKqcm1tB9vaTeS8XzE
         N13zq5TrQhYFPL7whb81TxwEvepgauojpmUMnI4fqWhBU6dMJdn7z6RlLFZ+60bLQ62z
         xiT5Sp9jkv5eT6ecM+g8U8wsNpa3SttcLJlYnPqEIk1LR/rnEQx59BHcelgoC/sdg+jn
         w/Aw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793094931; x=1793699731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=;
        b=jGNsLpU48rqrrwG81MHZyHUAJA42yblEaFr5aCfLBH7GAfOEMXyf9AfuB6xmO3mALd
         pO6FCh8akvkJLsyrYGA/OxN2yKX79VicTdnRWN2FtUxYCb/lUQu5T6qo7dobLJsO0yeT
         S9xwmbH3Oxsht3L1U7qIanqqzT1bjLfvmczjFyr+YdLFx4TWU3zqK8dkGxQ/0Xpm26hV
         cdJf/xYFwer1LfbaKbGYWJkngbHhHbY2Zbrv3/lv23RjU64HfRoBniO0H3SaKntf9Bp2
         7Nae9p6df+qDkAKbQAy3akgVAII7wRzN9Z4IxndvUVtAA3ijfNFX4EVBUTUkvMvFEWHy
         4mHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793094931; x=1793699731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sxQiH/Ki4Jylp+jmDWYLu+Y8BvwceqLxwB5Qv6lykoI=;
        b=wzGFXTneGPyqsY8O8LgJJlwkbB8F47K4j1xjzSK1w4KlYsRfgyfGeqJiEOh3V2mUr2
         tQjIa7AWr6qpJzvrwIYfLFB6/FkqyaG4kGzUQePaWN82qA/PLcEL3l0t7vbZ3rbz5mjj
         J/fkilUs7UGZQsNiff4qM2JLADJ9wSLFLsetfq7/2QD8PdpXbcvLA6v3yuxrmCopCo41
         uQUfLmHhPGZ5+EksOAJmvRVCiq02M/pZiVpxWC6VbrlZWRCIt941sn9IHfKB9kH4FjV7
         NXbD3nI2dqERWXPlbDQbZBV2/Q9dqMZ9CrEPIRv7GvPbkLX+9hNWWTHM9dhiaM36WxPD
         pmEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwAqZTOyvDq7uOFCyvRiRozktSmS07jIQ9wf370OEUyGOPQRDqHCfONKK8gyTi5Zk/SmZBPUo2jqZrt3g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+Z+upmiChliK7crrDEZulvdkfji9yelMJC/w9o3JnzaHsGiHP
	OkZwnTzD3qup6aexDcH9sg+NSKaDwoY74llHnxcZY81hERoHILo3s9XLdRzkxMibS6O+hhUJE4A
	SsG/QBwIKb5O4vqCABpJvFyeQAZQQ052rXHQt/n2bSwgLG5HAUoTWMyxE9wfvt07V5u+mkII9Bf
	cJ/ki2Z+e6OO5E4YlwX9kOkngK8aau4czC2LLUPpjq
X-Gm-Gg: AYBFou3rW1rJwx38/RlF8030KdVhUsLcB+n76ayu+oED0Y3c83wZRmC+pxNnwpNbB/7
	0/zv5fLXxqeiO0js+x9PQDBTbvZnU1UgD5X6uUjrWlM1ZU5EQqd4lLD54AOS+aOEdYaVmewNLkB
	xjDYBy2GiMdTl5b80nQs4pq/ukRvdDL1rtLZhiYRPmZj2QVwOc/JcZrqpLRQ==
X-Received: by 2002:a17:902:d50e:b0:2e5:c563:c0dc with SMTP id d9443c01a7336-2ea9c87db90mr82695285ad.42.1793094931010;
        Tue, 27 Oct 2026 02:55:31 -0700 (PDT)
X-Received: by 2002:a17:902:d50e:b0:2e5:c563:c0dc with SMTP id
 d9443c01a7336-2ea9c87db90mr82695055ad.42.1793094930556; Tue, 27 Oct 2026
 02:55:30 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com> <2936b4ec-3203-4137-9d29-7f95f22186d8@oss.qualcomm.com>
In-Reply-To: <2936b4ec-3203-4137-9d29-7f95f22186d8@oss.qualcomm.com>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:55:19 +0800
X-Gm-Features: AclHuK-sZwvsBwYWTk7rZbRPQQgivUTPs2rn8QH7Aeck6ZgfXa4-Jadwu7F_w_8
Message-ID: <CAFkd8hsoWa9t6ySWM4o-xgm=mO=_RFuWJDVrCb1u+Zg-eymTJQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM formats
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Mark Brown <broonie@kernel.org>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfX8sN0KK3MvLb7
 JV1KG5BgaW9q53QLbrYog5vmcMl0TM/VWHtC6K0oYEhR2UsL4v19wlE8ybC09yCh6lwxBtre4kQ
 msw982KQmeGdjR45uTLOh7lJPwpOP/I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzOSBTYWx0ZWRfXyyI6Bx0kFO2J
 56oxlffIz9vnpXbvocVJKf1uYfB9BeW25t4lzK+Iy1w2XMFKs2PRmzngNlezFtqmDH4pr8/aORc
 m/ncLnEcsn4+AYndBAp4f1MCMgyLshFBXacBx1a8WlFNkus2kFV42fvqSPC3HQrAMbwOoDAmH5w
 xKVWiN+8mnRADjVFkVYHN9CAKrR/ORLbEGovvCg9g5f/YSQZF86w64XZF31ig1NsRJw7fVqPf9j
 3RkjrXeQ1BmMpCkG0HfKJswY2Z0rQ2S+cuqiAgen2iQlVA22hvl7for60JzOBgvRjKnMrAcTq07
 zZ9azwzhMy//eX7awkvwUS6YMiuC/bVE4iSWcLDsmkevlQ5rrlBrtHiTj+A60svifzBDbKJ2Kv9
 u/1NlAl04epIjo203S2375+C6dNzBo8buCauts9QO10rTQOCJiyP7hiZRG851n3IJ8NZnc6TGBA
 4NOREDm97Un3hybDAaw==
X-Authority-Analysis: v=2.4 cv=PrkG/AM3 c=1 sm=1 tr=0 ts=6ae07513 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KEe7bkdQAAAA:20 a=EUspDBNiAAAA:8
 a=hVUKjqsWo0eiZm92ZjMA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: XDxIAq1FiHNnzsTKVclmbiTTXesDPCJl
X-Proofpoint-GUID: XDxIAq1FiHNnzsTKVclmbiTTXesDPCJl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270039

On Tue, Oct 27, 2026 at 4:46=E2=80=AFPM Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> wrote:
>
> >   #define DRV_NAME "q6apm-dai"
> >   #define POS_BUFFER_BYTES    4096
> > @@ -344,7 +345,10 @@ static int q6apm_dai_prepare(struct snd_soc_compon=
ent *component,
> >       cfg.num_channels =3D runtime->channels;
> >       cfg.bit_width =3D prtd->bits_per_sample;
> >       cfg.fmt =3D SND_AUDIOCODEC_PCM;
> > -     audioreach_set_default_channel_mapping(cfg.channel_map, runtime->=
channels);
> > +     ret =3D q6dsp_map_channels(cfg.channel_map, runtime->channels);
> > +     if (ret)
> > +             return ret;
> > +
> >       if (prtd->state) {
> >               /* clear the previous setup if any  */
> >               q6apm_graph_stop(prtd->graph);
> > @@ -1007,8 +1011,10 @@ static int q6apm_dai_compr_set_params(struct snd=
_soc_component *component,
> >               cfg.num_channels =3D 2;
> >               cfg.bit_width =3D prtd->bits_per_sample;
> >               cfg.fmt =3D codec->id;
> > -             audioreach_set_default_channel_mapping(cfg.channel_map,
> > -                                                    cfg.num_channels);
> > +             ret =3D q6dsp_map_channels(cfg.channel_map, cfg.num_chann=
els);
> |
> |
> |q6dsp_map_channels()| changes the mono mapping from |PCM_CHANNEL_FL| to
> |PCM_CHANNEL_FC| and does not handle 7 channels. Have these cases been
> checked and confirmed to be supported as expected for AudioReach ?

Yes, have checked with Rafi, should be PCM_CHANNEL_FC.

Also confirmed from audioreach-engine
https://github.com/AudioReach/audioreach-engine/blob/master/modules/process=
ing/bassboost/capi/src/capi_bassboost_utils.cpp
  case 1:
         if (PCM_CHANNEL_C !=3D format_ptr->format.channel_type[0])

https://github.com/AudioReach/audioreach-engine/blob/master/modules/process=
ing/Virtualizer/api/Virtualizer_api.h
  uint16_t channel_map[0];
  /**< @h2xmle_description  { Payload consisting of channel mapping
information for all the channels. \n
                              The channel mapping is specific for
specific number of channels \n
                              for 1 : [PCM_CHANNEL_C] \n
                              for 2 : [PCM_CHANNEL_L, PCM_CHANNEL_R] \n }

About 7 channel.
If hw requirement is there then we can add right.
Currently no qcom upstream device is testing 7 channels,

For example, RRD 4 chanels and Ride 6 channels.

Thanks
