Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793157954;
	b=GGxrPqbpIPIxM5geQFFgBT25olisXqE0mcytCGOYprV4B+VwofT7K+O5UsgMAWQn8X37
	 +Sr1laT4G6OtQclq+A2IvuIF9xCv0mRtmN88ToJwo1YUrfDuxkMm5M4Cxh98dSfUUO6AX
	 jETktz3Ys/hw0YO+WWEKTAWOMGz2B/6CFtFFImNgilsj4p6aksd1dWosNy5TamUnIgp2R
	 e4sZ4Ne2E3zh6phuIKKSMm1kTYymvOihwj5CDGotKlTia52HTTCv/3fYuRDMEIWZTGF2m
	 IV1H2EMLXzBjt5TWzR0VtNSGQXQDbwq/WirV3ntRTOooVXztOEVHFxQ2PrSppyraWCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793157954;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ik1wtcr+NKJTmFtuJsEiILJ0oVc4nKpEh2rBWEmU/Fw=;
	b=Vr9YzyBIrkPnkDkJWizedg6X/PWwOuqVEp8kdmaLmSolMMdgdM8W8hij6iTctazEr0MO
	 4Ez9opX4Q0m+XvLBLC+2Z7oFGzLLiFJa8y+ltJzXVM7QVsuq4Jc+FdZXKiqTwrlZSjwop
	 DZlj1C40FX7skhZv5mpOSA6WpDmSbDhUnGeOI2yT1V9V7CjwYmYBT7XCkrylQhMJb047D
	 7Smd+xgQNgyI07j09YxRFwl0wRpMNsc+XzmHxGDw8OuepoP8jvC0+0bCNAkKBYVfkwUsl
	 myzmnCCq3O/IHOZLqdnX0+vi1LfD5BoTtvXkA7lLw2pvMV3T9T43P9WmhT9D8RbRY5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRMyVG8n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NG0OiBFS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EE6606A31A
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5EE6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CRMyVG8n;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NG0OiBFS
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0is3X3274124
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:25:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ik1wtcr+NKJTmFtuJsEiILJ0oVc4nKpEh2rBWEmU/Fw=; b=CRMyVG8nypcOcvFB
	Ub5r8YSDqCYRKSiPMdEbe/vgfSqdADOpyJINnjrJ57SIZf27qGMrm6UqaCM2JVRe
	QwiJ7UQAYA/CrYSAc6A+ol1JbxUU2q4om2aCa6temfKnz9uJj2u/Ix/8nTU8TgDO
	wfPzM69mgb1mLmPZu4m2lgpprc5T5nEbmAeAgqmz1GkVDlEgfE2QHjEDz02aNlU4
	dwokAFZnqUtjlAGNLrba2HSW2hQYsxuHbeUr+tWD4Ay5YHXxRDrAquSjQ5rPEsvx
	wm66AtoAQG09bTSljoOMdscwc4k9zdkwwiHiAsOHImAR1pV8PPetQDVV5I+YXeEU
	eCZr6A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g28dr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:25:52 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so976398a91.3
        for <linux-sound@vger.kernel.org>; Tue, 27 Oct 2026 20:25:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793157952; cv=none;
        d=google.com; s=arc-20260327;
        b=FffB1Ia70vdySuhPLj/sFKfnFCOebsnVBp1vXSY5aJUq+A6CNNr6WM13270ChWAGPh
         MNONGFsrz8HYamsyiMzRiOkbN7Sgx3hRsNkjiCqiuYQ93Mh7W0ccAi4eYytzqe/M5Gt5
         m8GTwaE/eQbO9bsq7l8Ghw+32De+gZ9hOrJJAKEpEsYtx4/mRLMvwfPmHinndIejE3gm
         swiJdKQhatVBis5rL3o5v1S68T+l8XYZ4T95HYjcK5eqqWoynOB/EHpjzl6B+bcy4+DI
         T4JUh216P6grzwKmyDFP+WivYy/0uMFq9dD0jdLaZbo1NFSTLn43Yg9CUD/95pon10rH
         9BMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ik1wtcr+NKJTmFtuJsEiILJ0oVc4nKpEh2rBWEmU/Fw=;
        fh=j7qE0RlvzNR5Qm6xA4ehUDBqPqcz09gsE3Wa6zaxdUU=;
        b=O3EM7ZeSGXTOXGmYtouwPu+2HzK/7e2ORRs65A9k+oygIejNuqgnEONnVjJLp2yu1/
         kyh53y9yVT+/vvIVgg1VhOkIAe1JMRvVJZz05qrhfjzUA5r4ZDjozpwmk/39Yp10UG5C
         OCGbW3zF7EOZL83xMpUwz1iZFuwztnCcwSJeYbtBri80G9DZ6g/VW+YkpybQIaBmefBb
         Exl5qaTnodi1R8KHoL4eO4h7G3ANlerx3k60WGgknYOc3iOcplAPDSKltfo/GEHDfakk
         u3l+GkvjbwCr026IRSwEkmEw/RbFJhwUbITy8VMuKn1udj+gUedg7PEWTaTyi1nITisO
         xB1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793157952; x=1793762752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ik1wtcr+NKJTmFtuJsEiILJ0oVc4nKpEh2rBWEmU/Fw=;
        b=NG0OiBFSk5oRv/0vsesW/22IqDvhXNq9QYS5jSP3NfmBJuXqxgc4cpaipbNkgn+JkA
         IQndXvNQikzt8jXEecwgxS+2ST++hiWqPjob8/SfxmjdnmpXlljopf78e7SeB5ppSLKo
         YNbU4zr6jx8osdF//rhdP90jg5xIPUhhJHywjFbpoFOYsbyW126GiOAFdLgyO/Ui/gBJ
         7sjAgDPiGNIiDtKfOrm5yq+qL7CWpOe0yLaPxW7UC2pdl13hthL44zjpu/bXHJ4luLLU
         8cPs893AjCwEtyuyE9k87nOWB0vW4OVYvHIv5SdZndXhFk56kmWf5YPCym+qPfqbIvNg
         E9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793157952; x=1793762752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ik1wtcr+NKJTmFtuJsEiILJ0oVc4nKpEh2rBWEmU/Fw=;
        b=FCr7utRSQ0EBnFft69Ijq6h2vjAQh+piwPb11t5UHQU3ResODkuvFmgEjzFxv1a1dX
         OUt4xsyJ8Aoo4yk1rd75XNGtrmdFUZ51IW3Y5fd83yVcQ8BPGLsqSgDos45cO+Qvusl2
         dSGJVjS5G0qfiiwdBIR5RwXiWL36U0+zl2FJNGiqi10KNzqYmqPfmeAKs4jAJLv70CwJ
         le1YEPP3tZEho88h4y7zQ/FtNHnvC2n1Wfbz8gS0mWL22Xc5kXE31CbiTTPYlk9lihCy
         Wlto5SQginI8c5Bl9+1Rh4r9lzdCBBdQyrdMLiGn28BV3MRmpyyrWy1cBBnnPOFP/MPC
         zx7A==
X-Gm-Message-State: AFq9FYKT9k+c/+sAwVbT0Q0EOfq3Nw9O7cfjPwY5dkh38t+3Nn8RL2mR
	XJwiWeCNmaBC3Qmy+ijOODozOm8ihXCToNV8aOAUTQXQtf/gdE6vQqd+PP/n+cg6qH18qm+ufLf
	3DhXP1dPaEz8+PT5lvzpDZ1nQchlXdWL/IOdMOJpr5A69EBjVwlr2AxWbqrLuMM/W0jOZoif9DP
	cGcKAhOqWqd5Y6JKfWbt7h7qJZR/b71MxksXwjuy67jDfL8p/SNYE=
X-Gm-Gg: AYBFou3cric5klG0lMA1O2QBjyEt5+/58yfXlOEEpEhA/sHulHPLNsosmz8Q6qtTivm
	PhoasQCfdULb3bDBAbd2mQAp8yCLhkihdUiJz3DOdr/z2ZtYUGHs+Bq+IstDc16JvfxwDU7Dk8X
	N56aeFxC9qjvtikUmHSMWqJaYSJcbu/LnZb2BAMfdmwgfvVIlRhK6PB3B9sw==
X-Received: by 2002:a17:90b:4f49:b0:39e:6d82:dca with SMTP id 98e67ed59e1d1-3ae580a0249mr776241a91.30.1793157951963;
        Tue, 27 Oct 2026 20:25:51 -0700 (PDT)
X-Received: by 2002:a17:90b:4f49:b0:39e:6d82:dca with SMTP id
 98e67ed59e1d1-3ae580a0249mr776231a91.30.1793157951452; Tue, 27 Oct 2026
 20:25:51 -0700 (PDT)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
 <20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com> <sashiko-outbox-187372@kernel.org>
In-Reply-To: <sashiko-outbox-187372@kernel.org>
From: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:25:40 +0800
X-Gm-Features: AclHuK-X1worEDE-LrizB5KJOhDEFNbcQ4ChFZVOZ7LKlvmZyY-ar17uwMFvve0
Message-ID: <CAFkd8htETPX10Ohkff_e245jzd-JizQMc6nZTpxPwPO51stsbg@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: qcom: audioreach: support multichannel PCM formats
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAxMyBTYWx0ZWRfXwwGj/db2R2k1
 uXG4+CP3symn8XLApAyaTfGLA1fRd+hlZBYacSiOto1c+CKcPZO2IOYAK4/XYnW4n+A0XgdiPOe
 V7JQcqwrbUDNWchTtbsHDaDHSRXWC1OdW7hAxZktb5UnEirJuGOjnJGlpbSkfRsWf4TlrJYnWqj
 Dwj+TZ7UYWE9J/lI9oueqKHnahB0OewjvELnah7vOXybFqzZ+M2IXcB/lM8mVghvlFaYC6LmBk9
 v5TB9SsOjIvIDaxhb/jow7F2yK8/RSHeZGib1161r9quvbMZEw0Ghe9rpd+15SNuFUYs3Q9MdbT
 5DIcKcopt/Xj5X4fUDtaYLn9nQmsshdrjKKDcIazXF9TLP4gIXaR6VE91Glx5WIimeojsfuAPe+
 3QPg0uZk7EmxXc63Vfxu15kH4DrjjCqYrk8lGM3hXiUxB5BG4JB79W2VRrc+PgnYLEpH8pkp025
 eqqoH0HF0PTh8HXq+hw==
X-Proofpoint-GUID: E8qQPSLqkDZItzyzr3hjpMhCKIwmHFhk
X-Proofpoint-ORIG-GUID: E8qQPSLqkDZItzyzr3hjpMhCKIwmHFhk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAxMyBTYWx0ZWRfX7ezCS9QktcqQ
 +TMgjDUm4Sn9hbGDQfn/IfPuFgTVcFGZzGY8qsu9JwyW3SxbzExjezbWl2a8YSxXBnlh4bsJqQE
 QLATBcUGDhwWPGQVljFNGqIq/2HTOto=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae16b40 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KEe7bkdQAAAA:20 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=W4RJyTomHAAiTDpn_5IA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280013

On Wed, Oct 28, 2026 at 11:05=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] ASoC: qcom: audioreach: 1-channel mapping changed from FL to F=
C by q6dsp_map_channels()
> --
>
> commit ec2c026fe429a34883e53d19ea1d90d34c838cea
> Author: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
>
> ASoC: qcom: audioreach: support multichannel PCM formats
>
> This commit removes the 4-channel limit in the AudioReach PCM and shared
> memory media format paths and replaces audioreach_set_default_channel_map=
ping()
> with q6dsp_map_channels() and PCM_MAX_NUM_CHANNEL.
>
> > diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/a=
udioreach.c
> > index d2dc5d37bccf8..e6f077a5b750f 100644
> > --- a/sound/soc/qcom/qdsp6/audioreach.c
> > +++ b/sound/soc/qcom/qdsp6/audioreach.c
> > @@ -306,22 +306,6 @@ void *audioreach_alloc_apm_cmd_pkt(int pkt_size, u=
int32_t opcode, uint32_t token
> >  }
> >  EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
> >
> > -void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channe=
ls)
> > -{
> > -     if (num_channels =3D=3D 1) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -     } else if (num_channels =3D=3D 2) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -     } else if (num_channels =3D=3D 4) {
> > -             ch_map[0] =3D  PCM_CHANNEL_FL;
> > -             ch_map[1] =3D  PCM_CHANNEL_FR;
> > -             ch_map[2] =3D  PCM_CHANNEL_LS;
> > -             ch_map[3] =3D  PCM_CHANNEL_RS;
> > -     }
> > -}
> > -EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);
> > -
>
> [ ... ]
>
> > @@ -1436,7 +1410,7 @@ static int audioreach_speaker_protection_vi(struc=
t q6apm_graph *graph,
> >
> >       cm_cfg->cfg.num_channels =3D num_channels * 2;
> >       /* Convert the physical mapping to a logical mapping of the chann=
els */
> > -     for (i =3D 0, j =3D 0; i < AR_PCM_MAX_NUM_CHANNEL && j < num_chan=
nels; i++) {
> > +     for (i =3D 0, j =3D 0; i < PCM_MAX_NUM_CHANNEL && j < num_channel=
s; i++) {
> >               if (!mcfg->channel_map[i])
> >                       continue;
> >               /*
>
> [Severity: Medium]
> Does replacing audioreach_set_default_channel_mapping() with
> q6dsp_map_channels() cause a regression for 1-channel streams?
>
> Previously, audioreach_set_default_channel_mapping() mapped num_channels =
=3D=3D 1
> to PCM_CHANNEL_FL (1). In sound/soc/qcom/qdsp6/q6dsp-common.c,
> q6dsp_map_channels() instead maps 1 channel to PCM_CHANNEL_FC (3):
>
>         switch (ch) {
>         case 1:
>                 ch_map[0] =3D PCM_CHANNEL_FC;
>                 break;
>
> When a 1-channel stream is configured through q6dma_hw_params() in
> sound/soc/qcom/qdsp6/q6apm-lpass-dais.c or q6apm_dai_prepare() in
> sound/soc/qcom/qdsp6/q6apm-dai.c, cfg->channel_map[0] is now set to
> PCM_CHANNEL_FC (3) instead of PCM_CHANNEL_FL (1) for
> audioreach_mfc_set_media_format(), audioreach_pcm_set_media_format(), and
> audioreach_shmem_set_media_format().
>
> In addition, audioreach_speaker_protection_vi() in
> sound/soc/qcom/qdsp6/audioreach.c computes the Vsense and Isense channel
> mapping as:
>
>                 /*
>                  * Map speakers into Vsense and then Isense of each chann=
el.
>                  * E.g. for PCM_CHANNEL_FL and PCM_CHANNEL_FR to:
>                  * [1, 2, 3, 4]
>                  */
>                 cm_cfg->cfg.channel_mapping[2 * j] =3D (mcfg->channel_map=
[i] - 1) * 2 + 1;
>                 cm_cfg->cfg.channel_mapping[2 * j + 1] =3D (mcfg->channel=
_map[i] - 1) * 2 + 2;
>
> With mcfg->channel_map[0] set to PCM_CHANNEL_FC (3) on a 1-channel stream=
,
> this produces [5, 6] instead of [1, 2]. Is PCM_CHANNEL_FC intentional for
> mono AudioReach streams and speaker protection VI?

Yes, PCM_CHANNEL_FC is expected and audioreach_speaker_protection_vi()
should not be an issue here. It derives the VI channel mapping from
the PCM channel id.

Have checked with Rafi, mono should use PCM_CHANNEL_FC.

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

Thanks
