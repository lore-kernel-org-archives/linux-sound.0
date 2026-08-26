Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2533BBFA5
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787739973; cv=pass; b=URxtJ2T4DqoDULeifWkj4i6ujqlvv86ycODJtOhhlqVCfUwPIqEYmYtzmf1aVjyb5aUHHLoS6T/03ypkCnLX1G/bjlGk2qBQ0C4v8ojG1X9ivHKUbiu6xR4Ybpx/oP85RHkxOVRmDortlHMQHr8OTXdughKH71HsrMRUESGHiDw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787739973; c=relaxed/simple;
	bh=BB4I9qT32mEHJGGxtBN6lIUg3w4qc7wbOQ30js8tGOM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WnUzRjPtI/+CU64FTSlP6hH7YZsrn0msyANkN7SVH30Fq2uptGOYjNRtd/kLWHbDHw83cZo5OT/8RlsDvdbFVNQgXbRlhv9tzkK1GKRAL25tmKB/CJjsHcWVrvzVjGxe0BABdejpMDENCnCPfPDNHkU5wIEJiBAonLmMPaAINKY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dEdIsTRI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ohn/C95d; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dEdIsTRI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ohn/C95d"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QAGakQ017335
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKv8BpWJYJhT8iWpWEJQD4f+6SF8Bg5QPvkrk4vvVys=; b=dEdIsTRIWfbcs1r3
	+cWfkGJvi5W56c+fcDC86FubbrNajp2EBjifv0GBSv56cvww6p6LF80Thc9iR5Tm
	wrHiFwvTFuaCkfBiKHtwmdzcrI4vK6ew47ogYZenAvyJjfMkJYP0aXmpbusf9HzG
	RlGqt6xcLdYsGDzRMvSYBG3XneXTbURI5cSvSSrPReecHv9fqyrFpGdDDC52f0Mb
	pXAkCEWozFv7RIeNrvKbea0V4TXUGura4db00SzYfAgBlvBZfgsoRgX/gpPesqP4
	HfIYnlz+udgmNU8WruiDYcFKAFF20DpWKSjrZ+KkIg6H2VW65kFoog3PnXbx2hSL
	AXQfqA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn3dnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 10:26:10 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-853a9c4c99eso24182687b3.0
        for <linux-sound@vger.kernel.org>; Wed, 26 Aug 2026 03:26:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787739970; cv=none;
        d=google.com; s=arc-20260327;
        b=bXr62niWgZhZcj/bftuEo8t6AzoN8eC5PlW/wM0MSV4NX0h4MyhZ36rAH6NkcXoxkJ
         83e5Vwp8cmtrvClOJ35MltsZUUka6Y8nkaP1LSz2N4p6JDyCjip06TpcPhF5GXFgEcdc
         goMAzHN+jYFaPnxTpxPjBSVMhjO2faj7K/lFxjzzV9FV95PTfWJwtiSz2uKi9YUlwxbB
         VQq0iwRspc+TajMd41xfF4PGFKtz7AxFIL9PujmuSabnwoOiGVsUf842GAb9amVXAhIl
         SU1zZwZuAxBbnLojDA+IoC/Wb9VgXc6zQDsset3ZGi1DVCrFWmC9n2DwKbs7mMLDYnQO
         K4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tKv8BpWJYJhT8iWpWEJQD4f+6SF8Bg5QPvkrk4vvVys=;
        fh=VJfS0HPEK1P0ntbsO3YOqkDwA++qvQqcJPHG/AibLaU=;
        b=M5h++EoH7u2NzZ7hjKezVwCrwedTYotOdJ6+LHSq6AuJ1cYftc4kX8dl/swAxgBIFC
         5RGfLZZLdsE7d49Fj1b9BUpZa3//m5u70h9gfOEk8JRkvomS3m5vcUMQMmbRiqAdiGMV
         RvQyHRHp+U4mJ6+f3+lz6H8CajaKgzGluLA1Idcs7nv3MMYzhJG5rkDLS4dCsNgt9Tl9
         t0jWwzLRjo1/9N+GtidqUbfVZFot4tkwUjw8FfTH2uNHXpwiNEu2BxjAakPYft+tg6pA
         WaGLZYQ5uWx+jlwB35F4MvDlKmHeG3Ob0A3dSeUX3Jy7jdCX7Bpil/Kjr/hOzw2byEJG
         YBtw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787739970; x=1788344770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKv8BpWJYJhT8iWpWEJQD4f+6SF8Bg5QPvkrk4vvVys=;
        b=Ohn/C95dzsb+SyPWu3i8MLJ+EMEqVS2a+fCqUOtnI0uof+5XFlQplcmdkCH2fyRhTE
         vxXhK//l6spD8VBmDVaCOkRJJYpNtxMeJcL+Zc1kOhEuqm7YmKzoxrbbCnJyyHeeIo7V
         uyfYZdQJggVSkCBcxKeRlvccQ+aZ8b6D5GVfdwQ0v2tuJStace3TBttjqIAE9DSbuU/J
         Vz2eZcJbSBjDo1v0Tp6uPEYt9feFtfQPGKlw0qHHpgI8Q91sQrPihqUVXkB7kdlKvnuO
         ma0X6WnJO8l06Z91tYt0fJN9k46ZrPbrYg/zwEitix2xWRAugSGI/+AP1eCc+jRfkgck
         eEeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787739970; x=1788344770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKv8BpWJYJhT8iWpWEJQD4f+6SF8Bg5QPvkrk4vvVys=;
        b=hSSpIF6qvQ4xCkyJSCfpx2M+uS/cX1kA7KdAjhP/RA5srIZRI7CVH7Ct/tGfD0lUca
         6gPj7BcwUExgX/GSOaoUl3DdeEbVGYiW7vtwrUGyd0NDqjQAYEpWkRzrHHnyQ+GpLAUr
         ceVLCNUGXLweXF1Rn0R08g9pUO1Qp6+mzajCoZkxuIu3kPvBAVLTEOZ/2XcFWWVCCUqy
         aZmDZ1ven9f6BCnMpYyBSjqpgYajotwK3H08hM6lLYvTHC4XcdxLt9FqcudfTcOMg+9f
         nC2Z/4/EAHfgD0W4e0A2B+3jgvaoVeIg6qt62QBGmhWk+2X95equNmQdcwBapBRAD+Hi
         FvUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrOGbSoSW0q0Dp0OFLnbZ8QlIGhAl8HO6pNtKH97PQXDvSclslnQFN71kGivhRF/WOjG0oyQtzZtSvE7w==@vger.kernel.org
X-Gm-Message-State: AFuF++lXpb4aohcsUX7EEEQ/R6fMGTGThGPTkvcC9UnQ0s7NW53EFGI+
	dluWJp51qMWo8p93Uygc5RWuXo55A08WwXgIHq17g9IAqtWm/DEwUzOH56ppjXR8svpmqRVDYoE
	ScPc6yUGOL+krKmcRPdw+5m06QQfXWsfZ0PMyQLFx803EyGPnvtsmv1CUFwstS+UMhElPeZGT3h
	A+5ya9IRtDsxPABQuSXyqkFaywuljFVrFs+qMuO0Qv
X-Gm-Gg: AR+sD11IfRVoVKBrt54u15WiUL/yT9ChEwKf5Cg9Wv/uzB8d4LzFerQ9AcBL7h8wRSv
	rker/Ev9y6AMqlrvpj7xXmPbsN50mtGnIatP0PXjlHty7TTR9ETOx1j6Yncm+pbU3ypFP8KRc+A
	/7mZmueDCvosdj9BasjomAbYt6XdVJPUuwjk7/0Gd5BsvGgvVB5aDh6SnzQg==
X-Received: by 2002:a05:690c:e3ce:b0:857:c27f:692b with SMTP id 00721157ae682-857c27f756emr13858277b3.28.1787739969763;
        Wed, 26 Aug 2026 03:26:09 -0700 (PDT)
X-Received: by 2002:a05:690c:e3ce:b0:857:c27f:692b with SMTP id
 00721157ae682-857c27f756emr13858077b3.28.1787739969294; Wed, 26 Aug 2026
 03:26:09 -0700 (PDT)
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
 <137d4a06-4542-488d-91e2-d338ffb9d47d@kernel.org> <CAC-tS8ACnv2rb0k5u1bLR=EeVtZFXiByke1TFhM_n-WBqJ+dFA@mail.gmail.com>
In-Reply-To: <CAC-tS8ACnv2rb0k5u1bLR=EeVtZFXiByke1TFhM_n-WBqJ+dFA@mail.gmail.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:55:57 +0530
X-Gm-Features: AcwNN1VMs14n7hTOaRexN1JzZTDb-s2xjShYdfLSLJ5Zt-pE_g4L-meUMRCHfNY
Message-ID: <CAC-tS8DYkX8iTfrqqOAXMgczvoDozrVQYT1otu8XH06rXyXvRw@mail.gmail.com>
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
X-Proofpoint-GUID: fOgial2hAaSrehF1vFrOZ4lZNClyV2w0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX16zbAZPXNUiV
 9d7l40Ct6fwhbl5SOQ4E/8FDoj9Jp530XGSpE+0OcFFLYxZzMaasP59LXqvV8lfBbK0ctcq8ewx
 dUy7qr380DtjgdYFUahv5dKHFZP1LPs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA4NiBTYWx0ZWRfX5lFIyiscaHPV
 0PmeXQ8WlzLtFADA8i0EUMvMfxNs/xJTOYa0bLShxX/ECg8PvYGWlZu/CHJF8YOPf0CJsawyNfU
 U+FiRB7piG1DWIFivL/QqDQJ1dGefWyFgKajVH7yadv1d/q08Ka0uD9+N1x7Jo+ItSn85YoAYrs
 G18EvxgyOp+dgE2z8+Ru/O+dlceoC9d26drw393yCI1Vr7Fg2rQ2ffnub0nESUT1qnvaI9boHp0
 dxzSLJ9ZkMEY6svWoOrqX8QcCfcdSsgjIoQ4y5kgM6ZhxIq2DQDeoSRac4nlubOcBIV1rM299aL
 S0zS4YRRJSz8YkAt28Pex5A8GZok7AG6jagY/ABNfOqEKM1HRqkht93n/PHasoXw1ltF2PX9Erh
 P9SFLYjXQTnyH0kZJH3FCcxXWxmHi5HPdAR1MdNx5keuGM6T0/2DEWU2EGdfRF1Cu2xl1UtWJ+6
 TH/7UdaDeeVgQ6QthaQ==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8ebf42 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=f6IBhYKpExAqpe2A64UA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-ORIG-GUID: fOgial2hAaSrehF1vFrOZ4lZNClyV2w0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260086

On Wed, Aug 26, 2026 at 3:36=E2=80=AFPM Harendra Gautam
<harendra.gautam@oss.qualcomm.com> wrote:
>
> On Wed, Aug 26, 2026 at 3:31=E2=80=AFPM Srinivas Kandagatla <srini@kernel=
.org> wrote:
> >
> >
> >
> > On 8/26/26 10:55 AM, Harendra Gautam wrote:
> > > On Wed, Aug 26, 2026 at 3:13=E2=80=AFPM Srinivas Kandagatla
> > > <srinivas.kandagatla@oss.qualcomm.com> wrote:
> > >>
> > >>
> > >>
> > >> On 8/26/26 10:39 AM, Harendra Gautam wrote:
> > >>>>> + * CIF (Codec Interface) VA TX DAI IDs -- capture from voice act=
ivity codec.
> > >>>>> + * WRDMA channels collect audio from the VA codec and write it t=
o memory.
> > >>>>> + */
> > >>>>> +#define QAIF_CDC_DMA_VA_TX0  246
> > >>>>> +#define QAIF_CDC_DMA_VA_TX1  247
> > >>>>> +#define QAIF_CDC_DMA_VA_TX2  248
> > >>>>> +#define QAIF_CDC_DMA_VA_TX3  249
> > >>>>> +#define QAIF_CDC_DMA_VA_TX4  250
> > >>>>> +#define QAIF_CDC_DMA_VA_TX5  251
> > >>>>> +#define QAIF_CDC_DMA_VA_TX6  252
> > >>>>> +#define QAIF_CDC_DMA_VA_TX7  253
> > >>>>> +#define QAIF_CDC_DMA_VA_TX8  254
> > >>>>> +#define QAIF_CDC_DMA_VA_TX9  255
> > >>>>> +
> > >>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause so=
und
> > >>>> card registration to fail.
> > >>>>
> > >>>> Check sound/soc/qcom/common.c, as the current indices (246-255) ar=
e
> > >>>> beyond the supported LPASS port range.
> > >>>>
> > >>>> Best Regards,
> > >>>> Rafi.
> > >>> Thanks for pointing this out. We can either add the range check for
> > >>> min/max QAIF DAI IDs in qcom/common.c or introduce a common helper =
in
> > >>> qcom/common.h to validate the supported DAI IDs across Qualcomm
> > >>> platforms.
> > >>
> > >> You should add these ids to
> > >> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h instead to avoid
> > >> conflicts with common code.
> > >>
> > >> --srini
> > > Thanks for the suggestion. qcom,q6dsp-lpass-ports.h is specific to Q6
> > > DSP/AFE virtual port IDs. Since QAIF is a direct MMIO driver with no
> > > Q6 DSP involvement, would adding QAIF IDs there not be misleading?
> >
> > These are IDs that will be reused across both dsp and non-dsp solution.
> > So it makes more sense to keep it in one single place to allow the
> > hardware description (DT) unchanged across different software solutions=
.
> >
> >
> > > would it be better to update the range check in common.c/common.h to
> > > accommodate both LPASS and QAIF DAI ID ranges instead?
> > No, that does not make sense because these numbering might conflicting
> > with other ports in future.
> >
> > --srini
Just checked the code. If QAIF DAIs are added to
qcom,q6dsp-lpass-ports.h, LPASS_MAX_PORT becomes QAIF_CDC_DMA_VA_TX9 +
1, increasing q6afe_dai_data, q6apm_lpass_dai_data, and afe_port_map
by 56 entries. Is that acceptable?
-Harendra
> Thanks for the clarification. Will add QAIF DAI IDs in qcom,q6dsp-lpass-p=
orts.h.
> -Harendra
> >
> >
> > THat
> > > -Harendra
> > >>> -Harendra
> > >>
> >
