Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCD715E8B
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787738786; cv=pass; b=VLKewLHgbxY5wFXPBaRi80mado9omnBW1OuAbUvcE1y9CcHnq3/k70poRwhUyWyrhPBlQY7ZdVtQBmXWBKUy4bGwxQCarLLmVa0ZvQ7INXqlEgq1EbSWBf1qPMxqk2QE5hDq5g2DTxLD9VNNbd8HRSHmun/G9LieFklvNc96KQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787738786; c=relaxed/simple;
	bh=nfELzI6wU4evonO0YYA+RMq5+zcUXrzVSFYbXEchPEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T06Eb/6zBGv4KFYgMZIWRSLQjFR2U3adpg4ClgV3h+9grwP/VJoczOlfrDssBLMM5H77Ur7Ed5HnZR5wnvchtcSgGx6epq44YkkiJwPnXDdp31LbfDDWNQtoGYNDU3kAv7wZSHWXC3HUqO+yEQpmqpb0uddYe/kpZlV1+hhkIOM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XOs7roEY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JWu3KN6M; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XOs7roEY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JWu3KN6M"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q9Cob9279610
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:06:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RbBqoVCT+i35n1aDZvg1l2JvcEYCQIUQpQ62IsExkuY=; b=XOs7roEYF98cF8UA
	EBClHsfAsyb/XmzpzgmQr6MO+65KofxyZJhEjs5s8456kU5/m59bMv7mEUMxJep0
	FK5K8Oycx5yRJz89PpUVs45wx8xVyOvAVdoayJuNPBtCmjPfXryldHfnElMYye3P
	eDZQEkWw2HWKjioth0UlIQa2BNe/JC6ltJ1FQtL8IqcThiHJ0DNqsOzT1nYmydfx
	u2kRxdrp50ypyk/oDIdbD5fnNqwfeh1p7zYQ3NL3zL8OQh8kNMHVe8GHrzTm5hJ/
	YYIlKP/5MKdCNnCFyxRj8YfwI7yLtghOTUL1VJr82RqLJA8Rm4dg5VlVUXI7Ewx8
	IWTkkw==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fceuba0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:06:23 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66c70f5abc2so1079094d50.1
        for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 03:06:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787738783; cv=none;
        d=google.com; s=arc-20260327;
        b=EpB4cxG3wD8s/hL9qiuzPOLUIEXUvn2o5kzj3MUdasd4FkD7FeZABrxlXkQLfIMlaj
         xyVAocNQgd1KWhJLPXRdZGVK854ZeLe/ZSHOvIw+wjkiwSM0bNDsBli9W5hoBPo2rRaV
         WGtvb60pfRB7xQqOLfZGKvWOGnNQ4gZ0vx7ISkkchFBB+vUa6IluOF/3M7qEB5ufoinV
         hwd/5Qy2jPVo16QPV9dPMKDqMgQ5nkaRMcuNdr+kE7y9o2gzD8knuEOW0EuROurSgDtW
         lNgIJWZSeCMTVxWRRKln+eupCLUQsE561+jaZQb9d2sEFI2Qs9cqxDMQ0xDPclM9BcKd
         xovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RbBqoVCT+i35n1aDZvg1l2JvcEYCQIUQpQ62IsExkuY=;
        fh=Z6t5vmPOwS/ZVvU96wo3c9KOJNw30M3GF621naJN6K8=;
        b=YVyTfRljxEbLv0amaBzZj+PH9ELXLzpfEvAote2/HFfshMXFo5+cLLsUXkw8Qw9ag6
         jcRQQUkStJh4Z7TGpN211D+eS+gDBBqMRYv84s4p09gvLTTGuwXKWvkBZB3OSEi0JpHx
         8BoAMlT29uGdsR+cYmkxdnXdtk/shl+hr0NudYbCSRU/ZjhHUVUGQVoGuI25jlIkCAP0
         Px97h4SyhPujsItmd9W0ftr9j0Bbdf158y/cwajxEQkweXViKpFTtrDpQaMMbCqGru0g
         ejdnbHay//5X0fwN0asB/DUGPLs7LykCB1VeE55RB0WgkJzyyNwAZAPlNnd34Ig4IFNn
         K0ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787738783; x=1788343583; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RbBqoVCT+i35n1aDZvg1l2JvcEYCQIUQpQ62IsExkuY=;
        b=JWu3KN6Mzkw5AMc+Sb91XBceZOFE+I2GZDF36z8SnOG5dSj32+eLXgLiPqU7EfcEyL
         cnT/Sy/fm09bbm6dEV8gfXvtKwWQ0eVU+c/PopAJOlT3FmDm9Q/03gnhYn/N8VNfc8Ts
         Vcm2QpA0QqI0IorTh/C1lgpt5LZJK9+/NStLfd6cIhP0+kNKx5wboQmNp1NgUwZ10skw
         H3TsOoj0vjctnfK1H22Wmd40j/7fwPXf1soblB1E7/Gw5cmUJT0T558dCB90a4xDbLWc
         gdarKZF6YyveJxJ4fZq9QrPXblHp5OX27L5fpJnI7eF9/B5W+/iXmItGwFGrZiZRGFGJ
         YRJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787738783; x=1788343583;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RbBqoVCT+i35n1aDZvg1l2JvcEYCQIUQpQ62IsExkuY=;
        b=pMaWoAIP2p5upbJ+P40pfihd9kX4AWj2ZpNL0KD4V6e8jU9z0Lc1+Hlr9s7g6Nm5e1
         +iEHNadYQUoRvIP0sQBVd9LqWJ79GiEHi6EMg4eG3fuML0GQXiPiW9QyxQtsgt/CQrYy
         c/SZ90YccG4zrod9VvlQoE9r8f0xwJi/j7UKktVeRCeM6Vxaur/8NLtq1w4xqSEC9OlH
         gktcRCUamV+30IUrBDn1Q4+Lb1tWZPqofxEhS7i1SJiP4vubawd81zL/Do6I4UHWP8U3
         GxVuAQKo2XQtiwgaiuY692/cmE9Ty8V6X8DUSNndRausIWdqqbzge0Mvp9/CSb7wAOGG
         Dyvg==
X-Forwarded-Encrypted: i=1; AHgh+Rq8UESpr1y3UOSmfS/BKnIJEYqIMm3+tQQAqWxzDc0pYodcAaOPACrlpRSTGpohZMNiG2keEHW/0OJILQ==@vger.kernel.org
X-Gm-Message-State: AFuF++nGCKS+pV4ZB74ANqwx7e+eCz/QJIGpgselEG6YjVahujarK7Zg
	MOiwAtnZ6k60Tb7yzFshx1K4/Nsl+Fez0pnT0be51OzLFWUPDd06laX+ujGbmyDei6xWA891KCc
	cz88XiGeeteDYVSCU7Teo/Uhq+bOm+5WrshYzxczerRxwmxB1YFQKc0yHNH0f8TXH83lqfJ0H/Y
	0rF2RZTUsJU+Zb2vEZbdpd7xd7UeGoN4/t6q0ZsPBc
X-Gm-Gg: AR+sD134mjrehPSFzEuW5GkcSToBuiAH1LfzMdNmcv2rBzrvPGDrB4xyLuLU4/xTnJC
	I+WBE6WSArBtdQDOMARNlfDKh7gGyG+qWCUwfvrLQD9ChbRc6dT1yPMHTkU2y2IdYWM1dMLCCxS
	Y+yt1qu5c7t2tHBjilDJw7wr8XXCKkFmspaIw3RO/PScv0K4Azq5wySjne8w==
X-Received: by 2002:a53:d642:0:b0:66d:26f2:6e42 with SMTP id 956f58d0204a3-66d26f27338mr1101839d50.30.1787738782741;
        Wed, 26 Aug 2026 03:06:22 -0700 (PDT)
X-Received: by 2002:a53:d642:0:b0:66d:26f2:6e42 with SMTP id
 956f58d0204a3-66d26f27338mr1101703d50.30.1787738777434; Wed, 26 Aug 2026
 03:06:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <CAC-tS8CaVN8YgkUHJVvLcU1xWB3V5dOgS07CHVOBUnPtMjNxTg@mail.gmail.com>
 <08b6fd88-84b3-4b3f-a8c5-dd6bfd39403f@oss.qualcomm.com> <CAC-tS8CtA+wRuucDskRXSc=AHgNdbuq+khj85pFmCG8dGS3Njw@mail.gmail.com>
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
In-Reply-To: <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:36:06 +0530
X-Gm-Features: AcwNN1UcHyQxyDgxCtp2jNw1Hyii6iQM8K7os2ERH6A2exggOEYymSFD-EPOOdw
Message-ID: <CAC-tS8ACnv2rb0k5u1bLR=EeVtZFXiByke1TFhM_n-WBqJ+dFA@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=a8AAM0SF c=1 sm=1 tr=0 ts=6a8eba9f cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=f6IBhYKpExAqpe2A64UA:9 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NCBTYWx0ZWRfXyJvoj3BMNhe9
 fRPa+7dGOjsr/zY3hLgvdzCN+04lcsMXUnwxrCothGQih1JoeR+A4C4srdev05th0BwnAibD/cM
 gpISc/wOqmML35mYGSZ1cdVYfuYIvuM=
X-Proofpoint-ORIG-GUID: ezHZVvvMcvLM_pNNjR_24QrjIw4kq2EU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NCBTYWx0ZWRfX34yfZR8A5KFf
 lkd40L3oaZIxOIo0y/RgdfvhZI+zH+S/ZCK9C0dFbXSfedvmTuJcdwCY3zD+K2JVcNrgWPfMH3n
 cwoY0aH8oIvh2MXuCGgKyAc+brgTJbr9Ozj9pvfoB/3JaTS7jMpIiEd4xDqgr0HAEubrcer1Wac
 hf7HqmGmwKVZwcqzlOwIpRPhspBrjFTtQRNrZWOaDgbpL5goM6PVolAzjquVod0/xnNfUER94Ba
 xJ2zL8nW+XmyUIkbbgBNrwnNStOZdCqoG3Nvsg7obtT6NeBlhjX1r1BemwGTskilpmMa+Fa8rhm
 bh/UBZi2l5YBb3LTL5cEjVJ7w34hQ1Cm/WlCfwIECjjSM8BX7fhdQDISzKh9hyYBVDrVXhMun8m
 /+Co/7+TXFXZBwv9ngJKjEtxxNWy2Hbu+lVocilQNkbESWrQFY/LrIt2LU3+qBmySJR3yL0jD4/
 Fm0vtGJIqbjDQk7T1ZQ==
X-Proofpoint-GUID: ezHZVvvMcvLM_pNNjR_24QrjIw4kq2EU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260084

On Wed, Aug 26, 2026 at 3:31=E2=80=AFPM Srinivas Kandagatla <srini@kernel.o=
rg> wrote:
>
>
>
> On 8/26/26 10:55 AM, Harendra Gautam wrote:
> > On Wed, Aug 26, 2026 at 3:13=E2=80=AFPM Srinivas Kandagatla
> > <srinivas.kandagatla@oss.qualcomm.com> wrote:
> >>
> >>
> >>
> >> On 8/26/26 10:39 AM, Harendra Gautam wrote:
> >>>>> + * CIF (Codec Interface) VA TX DAI IDs -- capture from voice activ=
ity codec.
> >>>>> + * WRDMA channels collect audio from the VA codec and write it to =
memory.
> >>>>> + */
> >>>>> +#define QAIF_CDC_DMA_VA_TX0  246
> >>>>> +#define QAIF_CDC_DMA_VA_TX1  247
> >>>>> +#define QAIF_CDC_DMA_VA_TX2  248
> >>>>> +#define QAIF_CDC_DMA_VA_TX3  249
> >>>>> +#define QAIF_CDC_DMA_VA_TX4  250
> >>>>> +#define QAIF_CDC_DMA_VA_TX5  251
> >>>>> +#define QAIF_CDC_DMA_VA_TX6  252
> >>>>> +#define QAIF_CDC_DMA_VA_TX7  253
> >>>>> +#define QAIF_CDC_DMA_VA_TX8  254
> >>>>> +#define QAIF_CDC_DMA_VA_TX9  255
> >>>>> +
> >>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause soun=
d
> >>>> card registration to fail.
> >>>>
> >>>> Check sound/soc/qcom/common.c, as the current indices (246-255) are
> >>>> beyond the supported LPASS port range.
> >>>>
> >>>> Best Regards,
> >>>> Rafi.
> >>> Thanks for pointing this out. We can either add the range check for
> >>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper in
> >>> qcom/common.h to validate the supported DAI IDs across Qualcomm
> >>> platforms.
> >>
> >> You should add these ids to
> >> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
> >> conflicts with common code.
> >>
> >> --srini
> > Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
> > DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
> > Q6 DSP involvement, would adding QAIF IDs there not be misleading?
>
> These are IDs that will be reused across both dsp and non-dsp solution.
> So it makes more sense to keep it in one single place to allow the
> hardware description (DT) unchanged across different software solutions.
>
>
> > would it be better to update the range check in common.c/common.h to
> > accommodate both LPASS and QAIF DAI ID ranges instead?
> No, that does not make sense because these numbering might conflicting
> with other ports in future.
>
> --srini
Thanks for the clarification. Will add QAIF DAI IDs in qcom,q6dsp-lpass-por=
ts.h.
-Harendra
>
>
> THat
> > -Harendra
> >>> -Harendra
> >>
>
