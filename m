Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE263E3167
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 06:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787552934; cv=pass; b=tubv3Ts2S4pCXcsFTYx8Lmx9W9IisDKaa7VegaAmSJTvB2WbSv/fo3GD/+F1nRGCzHkMF8TrUYgmp8p0EPK3NtPvhojx0j/LTbeYzCCOG4+4GXo1OdZrhDQz0ORgyCQEi6YyJmshC6fMGg/7qvPK528+vioKQLDdnnAvooXTRaU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787552934; c=relaxed/simple;
	bh=8tQHV/73xtSPfe3J7XUwOfa0NijqGvcWe31f0juGljI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MHLearvKx3kVHJu6a0YSKZsx3doKxE7+SWcN07JZLBR8sNn5qH/sKkH3QU+G6s4N+JmG5JVGBP/tx0AMAfBYMDDyEgXxcwfp3lffqAeumD74G25vltaNQgwRzYbvxYi7I3ztqQhZUvFW1HtIQ4TmC6r5khGHlbTf0Y+xfR72yRQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXZO3xgC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Sk+t8rDz; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXZO3xgC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Sk+t8rDz"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R7qK2392097
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 06:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7lqGvWnslH2LeHC0QphtHUs/rofAEdSxXz59GB1W6g=; b=oXZO3xgCTEnzRx6O
	DCDjysNfCLa7odGctBwh7MOe8QIg27u7XXeWwHMucWEMPu4OA369rNwOG88oVJE0
	8TZHCxRnjx418fatitk1eFIgLogkBD4GQLGgpWZWvjNKZfuUrR4pZUG0pxtuOWhp
	wFksQVkIvhuME/8azW/Tfxtdu4LZ+mJj2xaHVozMfL8OBn7GiWC65sBODI4qOiKy
	2ZwA2+ho6HkAK5f0VHrgfABnnvcWSFHLgei9eLLsiV1EmTF0XI8J9oIqrFDwgm8L
	U1F6yBgwDTUV1sIDG8OrNr7H7JhNvaFEIMTyrBjaYwg5OqSB6s6l5Fq1IZKkFqCK
	xJqiZA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740a5r3t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 06:28:51 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8422f73d5caso20527447b3.2
        for <linux-sound@vger.kernel.org>; Sun, 23 Aug 2026 23:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787552931; cv=none;
        d=google.com; s=arc-20260327;
        b=BKiD8YoRA6GAn0T2ZpmGL4eHDs0ABaWm53oA3PvDxe1GisrDmP0lYOg+vZx39RmFrq
         DGoOlM1yXJAnw7lAcgUKYLWH+/H+dKywbT/7O2hukPWI3ykjlfW73uuWqwy89Fq52qqx
         pdq0UKIyRFsqnZvc5L4GgY2IRDS5XpfDGg9nItQztCvd09YfGNHQKv+yiwisfaBy5u5t
         HLrLfzGAdCi/ATeS9abTd/d/8NoAdB+fWqJBpuw5pw4l2EJD2R191T7t5K9RaNVxXpXK
         dzEoNjh6nyoB0bWXwRU8t5uY2XZ8xeJTtO7JXBc7nE17vi5OqsCsQKCUTBC2IDZqBPiq
         emzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l7lqGvWnslH2LeHC0QphtHUs/rofAEdSxXz59GB1W6g=;
        fh=zTUjrkA75oqjXo5yBf9RHDEqEWsoqdiWuNqnBW4Xy6I=;
        b=IjkfCDMz2HqbIccQITilon8GKupEkoa9ZNCXF6CbV53612ssBaGn3BbSDHuxCvbWef
         L4Hne14ujglKPFd35KZwAjTCgJK7cKuuWYyAECEyIaI/2WjtMDNeNQzH6TbiKORT/qlW
         UopdSi45I0JgwJiVB8hDN4rgY8Yn1S/7Cq8bItm07o8jEgoS79Jwcy1SzpdP1bmZWxot
         jorwqWBf/D2ETgoF0kCQDvXGG8FZfcsn/RL6KaZwE3akIKEWvyMHA+eBRH3wz3ujw1zG
         nQliANeaF1AftFymTndAOPeAWUcCEM1F1cPBx0NMR/nu1VQQJmRFMFJbf7rCseLeuzXi
         I85w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787552931; x=1788157731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l7lqGvWnslH2LeHC0QphtHUs/rofAEdSxXz59GB1W6g=;
        b=Sk+t8rDzmotXBF+5QueUhLnqGpjLN8Jy0XVxSYZPffnGFUHHNdSBvtbh2siYrSwtPy
         rmWXvs7aC5tYH2C9Vc43vUZtkioU+2opu44VFKcZiQnoJMFl4yONkojsIG2i6Q4avxf3
         sO7h7L4XiPfckrngiTP8IhR1rRMbwG2gFIVo5sNve1HZg6XqPzo/a5t9d8HMoyTTIDSX
         yRlGqHV3i0yjwBnLLeGZLNC2FutPqdpUW3Il553N+UcMx2tCI4UqyVwERFQ0y/bVYIC5
         U8L9PEn8evK4j8D7533Bfhteq6ToLlnesz//+lgtkPl8NmehLqWwKG/9UnJ4/av+nSIy
         AE2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787552931; x=1788157731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7lqGvWnslH2LeHC0QphtHUs/rofAEdSxXz59GB1W6g=;
        b=pwkM8LkbtsiWueJU9+3qUTRbTtEdXM9XpKzKRKdpFKeK8NOum8WM1yr8QR8CoV2K7K
         t9Wcyt+jVbtNZ6hPGcrM5vh/mQwWWzbz2uBb/ciPzUgmNeEP3/YqZUbcSOYD9z2Lakn8
         rDddX/wtkT/XR/KHMr+lh2ioY/geNepf6heTsChkKC/872OZJuQCWLhPxr4sP8CC1qp8
         53kF5tm9JlnD/gnxUqcsk96S3rMt3xkDoY5Co1LLZ6oyB9lTbWQSuDiP5EOIUdBhgGw4
         OkRMjtHKsgaIsHJ0T7OQTotQUintN278YgfS1Ab+TJKq+tST7Ib4D/fwXdlL3E50udJY
         PctQ==
X-Forwarded-Encrypted: i=1; AHgh+RrRevKxqdKfnNVlmYiLmIzgi4FH8gVZbPW5ap1yhe4lXQTjhKJVNYBtJTtjZhkhM/Xy6p5M1v0sI2n8hw==@vger.kernel.org
X-Gm-Message-State: AFuF++m9JyClTC86jOTd3EkRtZU9HwvQAZ076FWu11hXU5liAwBeByWD
	f5qlYuLtb/PHjZt9PpK1YlglFx4X6JzORiNMaAC+1ENG0aPuVNF8yHDa2aOsEgiALTN5EwDCZqc
	K1mD+fXIDa1UL87ehfUgT7ARVNNKUFgrrCZ/O0Lr2ZG/xZEIrTYL1qOjPfgQhfjTZDH8sVpG8uH
	BqL5sv0YR4Pm+1VloIHqhgERU1yaHuWfwO0c3U0JuD
X-Gm-Gg: AR+sD13drei9pj9v/MqHeuhfLG501474V9GjaeVsj2FLhck+pJoRgZERVOdvM88ljj/
	Nud4CwBNskQT7MaZRvwOZXKRWYkUXfZDhIeEYWjWodRRuJqRKbETGP+189BiVB+LnLxnKLqhqse
	A5PxDDxaoHFMw33lQIUtNNaZIxySFwa0KZAqiV88bH30hASObYWzFpk19X23g=
X-Received: by 2002:a05:690c:c386:b0:814:5f5b:6378 with SMTP id 00721157ae682-849f15b9f28mr79525907b3.12.1787552930635;
        Sun, 23 Aug 2026 23:28:50 -0700 (PDT)
X-Received: by 2002:a05:690c:c386:b0:814:5f5b:6378 with SMTP id
 00721157ae682-849f15b9f28mr79525777b3.12.1787552930314; Sun, 23 Aug 2026
 23:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701105757.2779738-1-harendra.gautam@oss.qualcomm.com>
 <20260701105757.2779738-11-harendra.gautam@oss.qualcomm.com> <20260702-invisible-caiman-of-current-4f9baa@quoll>
In-Reply-To: <20260702-invisible-caiman-of-current-4f9baa@quoll>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:58:39 +0530
X-Gm-Features: AcwNN1UpF6blUC8b5vWuOX7xBCKB2F1efjn6d5UhHwQGZr16LeDgxEiVtbFWdHc
Message-ID: <CAC-tS8Ct2tSuScAr_cD0_LWSY4HnwaxLnONY4-P=r1o1JF48-g@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] ASoC: qcom: Add Shikra QAIF support
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfXyzOO53pg1218
 b0byuKhL64j8S8D5eyCJ+ic5UF1tC4qwE5ETaxuhPMKhBZ/02pdU5yEviD6D48t0YsuvxigmEod
 OVtwBNJ3AHlDuHTokdzM8MXHNfFSsX5ZyKqpc1QF2lgIoUmd5dGQkNEQx+yLO0BhH5tPHKsPTaT
 rscWscQLvYwZGoG4qN8lKTNIu6G/6/dbI4hgyPgI0N8JAZPHVeeYh21c3mEEYqhJ8OVZATUX9kt
 NX/9b0bdda5HVJo383uiO1qKZ5QNYt2YoL+1TZoL6YUFcyXEcgGwtKdMhrgL7lTjis4bxrqrtpw
 lVMINo5RxEj49Pp+3+1EAf6z5VU5LajeKdvh90tTdDtfqXYEUNo7HUzouRlZCKDQifdVY2gGyWB
 LEvSKl9oPhFMVsdZ94Cc6MPv1VFiHSKFQVFNvHgKaOelSpS/vCSI+CFrzCqDZ8bVl1BLh732Ove
 jLkyWArRZ7t6VrCfkzw==
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a8be4a3 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=aHnwCF0JnfQvHnxt_YYA:9
 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-ORIG-GUID: BBYjybvzVYTUtL9Klq5hH0LRHugadJg3
X-Proofpoint-GUID: BBYjybvzVYTUtL9Klq5hH0LRHugadJg3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA1NSBTYWx0ZWRfX0RzgiYmBGDnj
 OjGZm8s5nnrLImMRFbL4WXXWZDHniaxatITLzbIQ3PXSknla90EbVLimKHs69RW9ztgB4YBQt6w
 RnJfqcT87y6uUPbKJBcyklSlJ24ZOMk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240055

On Thu, Jul 2, 2026 at 12:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Jul 01, 2026 at 04:27:56PM +0530, Harendra Gautam wrote:
> > +static int shikra_qaif_free_stream_dma_idx(struct qaif_drv_data *drvda=
ta,
> > +                                        int index,
> > +                                        unsigned int dai_id)
> > +{
> > +     switch (dai_id) {
> > +     case QAIF_MI2S_TDM_AIF0 ... QAIF_MI2S_TDM_AIF12:
> > +             clear_bit(index, &drvdata->aif_dma_idx_bit_map);
> > +             break;
> > +     case QAIF_CDC_DMA_RX0 ... QAIF_CDC_DMA_RX9:
> > +     case QAIF_CDC_DMA_TX0 ... QAIF_CDC_DMA_TX9:
> > +     case QAIF_CDC_DMA_VA_TX0 ... QAIF_CDC_DMA_VA_TX9:
> > +             clear_bit(index, &drvdata->cif_dma_idx_bit_map);
> > +             break;
> > +     default:
> > +             break;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int shikra_qaif_clk_init(struct platform_device *pdev)
>
> I do not see any response to my comments, so my previous comments stay.
>
> Address the comments and respond to them.
>
> Best regards,
> Krzysztof
>
Address comments, will raise as part of the next patch.
-Harendra
