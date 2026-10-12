Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E673D439014
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 06:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787567; cv=pass; b=h+ORGP1mvJXmH7KUGm2p9I7KT582qI88sohBMRBHsu78yXZjAUqv3ftfEK7lim54UEKPl5rb9o9qXUv/tB2XlUf1zHzNY1b5uGH/DXGz3cgs27eYUw5mMVXhSxBECIX5ez2x20Y7gTRkDEsOw0PkxVSIHpk6DvTlakFX/iDWaU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787567; c=relaxed/simple;
	bh=mN+1knXYNtngeeWJgfNsIN5o5VTXNif7Wc+A2lc9JBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgNqL0nYj7K7lSx0Y6pX6k0uzkxqiCwrWLnylqHO8/NfzsTmSwncU+wobFVBtq8UtIJ4nCuVL7nRYt8MKZvWMUZIog72LNcGTLIssYshpWq2hy+a0qLKxcx0+8Z0flSgzlseQInUGyPB5hF1nkC3ic1bavG74PlRmV8BsWdMNFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iMmL+GZe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PneTYvbY; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iMmL+GZe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PneTYvbY"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C56OOq1003102
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 06:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=05mRSC4SMhgre7tJEuCkEGqI
	JCIZwKO88R6uiRwMZ10=; b=iMmL+GZetnGmQafs0KDkpH6OunxOR3dffjKLwsE1
	H98384Mww4/3NHhmaI0uIR2UShGlGnUnF6LGuLtIVXy7FZmdeM2qQkdbhR9DBbsg
	Ic2C6HaC6jzhbQP+S3/SIJPn3u9Tmtdd7sTrLf3+5TAxRbHz6QHRUcf/KxKXrG7l
	p1EzyjfYSXhb5OHwoeK+hVDozz0R0vO2CpoxsZHtQa9UF2HQkFctg0CozUNHuKhh
	2kS0cg2KGKN9r/Lfu6QWDoLfoYo+uMNlxgEKt918g17LA/h5dYKKd6gzaXGQWNCL
	PNQtD2M1756pYb7dd6PRYkI+DG0UuAOky0Rzg+J2ereueQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkgmfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 12 Oct 2026 06:46:04 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-836c416b236so19801657b3.0
        for <linux-sound@vger.kernel.org>; Sun, 11 Oct 2026 23:46:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791787564; cv=none;
        d=google.com; s=arc-20260327;
        b=Szs+SzwSjauBfvZmE/TESCHzBZUxCNtmNG/PqGaqxKDWBrV04OOylUfdecDSRqUQhZ
         beYiElM4h/D/Hk6azJ4UE38QCwXLGEMyO0CegN0X5sFdqk2UB/+HbTFE1tf6RsGrUP44
         iRUzuw5x1czA6AGKqMAYd1WyaJBPZdTP23lLSeQLkJ+pGNqGI29OpphyP6NsedkbOpkQ
         32pZD/9L3jFY1Z6/yirNfpoZtjLgA0iWQDLSl7J0w3B7XnbIcaUIf6iD7ntNcq3uT8Tl
         PQuRAqjB0cXfbyyJ9fEkkAPANJM+ZyfxcQNUJDV+y4gGkKUNzlsS2eXGCUndsDtm2cQW
         iDEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=05mRSC4SMhgre7tJEuCkEGqIJCIZwKO88R6uiRwMZ10=;
        fh=Lv75eziDwvsmpSpKPQfsVwUnIIhggOtQHIYgTGGF6Jk=;
        b=X0YYTGwFh6KUGm5glqWj1uYRS02cG++iquUewCAlyVk/hYmPSu4gVOivz54AA8As48
         FsJs/Ntg/4VSSUYk75pM68mh+LyIs+fme293MOlmkfjvl0AehRHKI/t0903e6UsH6Q2a
         W5RtXqS4OgUUzi4iAIWIELOn1Hsoi0I494DTvxqblk4OBKyOiVdS0USBUlaJ/jLeE7yb
         rVwTdU2levRIOuQjQfKHhdRykQewpy3aiww5naZETjPX+SeubzsxTqdtjy6JUUE7a5Mq
         8RXvPAqSMK/8+ZlJjmhENSoKQJq+8fdI+aw5HfIgI5EsencBjkCHd2j6A1lWAlfL9dkG
         Wpcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787564; x=1792392364; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=05mRSC4SMhgre7tJEuCkEGqIJCIZwKO88R6uiRwMZ10=;
        b=PneTYvbYu+0tJEmuwhtylgHOAaNmDcToMIweu3O5qBBCNfXdy6uEBCZphu0KvIPTtt
         pi4MOSfS/ImMoSAHj+0F9qYp9+MMo1DAnHCHOxBdg9YPsaDAzIqCxyuPYZlqqbJlzDeT
         rPfaU2tKP3ecbxOABzq9QybqoHPISidnwJ0kTKF9HVmMszbU5V9/UBdGqLM0CtAlA6jv
         oltir6Wp0TNfFhrQ97u99SbiN77eje6K46oUCd+H03WUBwnLxA2fM2hacEnpWqoftzVp
         pNKqQCdueP5hWehLtU5K2uVq25c3ZVgyg0UwT6oB/ciwKPRHgBqqF3ItjbyWsbLSyqsv
         Chdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787564; x=1792392364;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=05mRSC4SMhgre7tJEuCkEGqIJCIZwKO88R6uiRwMZ10=;
        b=A6jbxYpD68Um6Lz1bIbZNHWSW87XFaxLGGAQ4dZx2L1SdbNhTZ6FvCSHlDarhQSJGt
         JpzzkPj56OdJiEW0p5q8OPURGPqvh0VMeNVKPwRIdumrRyjSSZ3ST6ZOT0w6FtnJ78Nd
         w31sUIKdQJsqLfHO2wsN/Ri/FCxvHo44xWU6vvNPkB9cw7sCS0AB/UPBwdUxcEO8zGA9
         aczl5iJOe5FEDo2ABhtmKhqQpZDctDVIjhJzNb3sTqOj7TIu7MYT0VagkqbRE7we1qYk
         p836bIc/XKo7rznXL8qH1BYHfKidLSCEtggQYhNQG0nRLeJOJjcPQY9gXYp07gLXbmEt
         ek4w==
X-Forwarded-Encrypted: i=1; AKwUvBxqJSAq8ZHVzO3CZXNlxp7TFaY/SmpOjMLMhbQ0VyiKRSacF9hfNlJ89/4Ja48HMJzmCQ0V5lpq2XsPcA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7ECqbUOLdhX4eC5374/oCNISa1P37dAYq6pPVedEeh6qbPPRd
	KUnWIlVtTglYLNVwMKWxuQYVxJB+krzZSqZ1MEGCt+L/h0vwSz1FwXZeKPY67/rOCt6TS12ihDg
	yZ/GxRD8mn9L3HYiXFqJPHHmm7LbJUvzx1OPOG1//hDa7TPHpiJEeM0yO1ebPtM2sK0ZajbOhHu
	DsKiqVZ74F1rafIXPWoRlj3Y50JfwzTuB6Qw1jbG5t
X-Gm-Gg: AYBFou20RwNtoJZG/ht83YeC8T0SAeplvFSRIpHX9EXdlM+yN8AmWXLQpC+PIWICocF
	80MRwcoDLXAx3oZp6J1PmsCSqD2yElKPi/lW4pfek5O1NRtMilW9v2Img2tnVxMGewBt+Aokz1b
	yoO90TH0eineWOw5inA/kMom5V8FBjDffPopiFE5LU26pr9DkNe57Jj3htG+s=
X-Received: by 2002:a05:690c:6987:b0:8b0:a1d3:3823 with SMTP id 00721157ae682-8b0a1d35c71mr7405087b3.24.1791787564368;
        Sun, 11 Oct 2026 23:46:04 -0700 (PDT)
X-Received: by 2002:a05:690c:6987:b0:8b0:a1d3:3823 with SMTP id
 00721157ae682-8b0a1d35c71mr7404927b3.24.1791787563981; Sun, 11 Oct 2026
 23:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928-b4-qaif-shikra-audio-v8-0-ac618057fe85@oss.qualcomm.com>
 <20260928-b4-qaif-shikra-audio-v8-1-ac618057fe85@oss.qualcomm.com> <20261006141620.GA1950759-robh@kernel.org>
In-Reply-To: <20261006141620.GA1950759-robh@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:15:52 +0530
X-Gm-Features: AclHuK_Pj0noF1c11z_Dxs3SIV9mM7Suyi8CwWbvl8dTMFkFuJ253BEfSkuBVG4
Message-ID: <CAC-tS8DzW88Lu_k-yKQtyfYc8u5-rh9WKTSanJ6dq6Xo3wp+kQ@mail.gmail.com>
Subject: Re: [PATCH v8 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Rob Herring <robh@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX1CPNwNS7UoNW
 i43Yk/uYbHx82SZpSCoNdEn+iSCKOqOZ8P+sODFFvrFx973IPQLqJsh4qWLRUzD6N45y6dSCqx/
 +o7C9wukuuSzQzc8YS0qF+zSbvFcUoYA9kSBCsCqXsHOJH4GhnPIh8J+liseB22+ttwG/liZKcW
 cHvDFYN6vZtKB4uFw36TLsRficF8ON1DyjLSy3T3ShSG/WOsmaO9QtY6mMnvB9HxV/QVETXH0fq
 wu3wTFI8e5dpSKEF/YZc/R6e576+6ebt/f9B0vIUUiMRP6IBYwemkAtmaMJTnIXfREDFkhYX32u
 o3tgghw0KvhVa+newZO71OEdkBhVSuhNTTXtEKKlOiknLuE9+rm3Uj3mD2ds8WscJGxmVw/O3Gm
 VoNkFWB4uUxaUxXtX3ouRQvK3NzBY2zGiMmZC6uFpytkOXx/rib1pqgWMogDMT2rlX+KwfIcYOu
 yga197eKE589L+YBQ2w==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6acc822c cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=IkqFnPuR7rtTU04AMzUA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX9Sa7Nw3T/DbJ
 xNeCZStLwonfMmtBmy5TzStKx57tVyRbXkMg9H7MSy3oulLdTCDrtxRAoYFALR5lkcUTrfb4LtJ
 vC+DP/kpZiEenVUGURk/l2DrwMe8pGE=
X-Proofpoint-ORIG-GUID: s5DPdJ1-09Fu1Ih4aDHH70c_LhYO1lf7
X-Proofpoint-GUID: s5DPdJ1-09Fu1Ih4aDHH70c_LhYO1lf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120026

> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: QAIF core registers
>
> Drop the description.
Will drop in the next version.

> > +
> > +  iommus:
> > +    maxItems: 1
> > +    description: Phandle to apps_smmu node with sid mask
>
> Drop. The exact provider is outside the scope of this binding.
Will drop in the next version.

> > +      dai-tdm-slot-tx-mask:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
>
> These are all common properties. Don't redefine the type. You need to
> reference the common schema (at the object/node level, not per
> property).
Will update in the next version.


> > +
> > +      qcom,qaif-aif-lane-map:
> > +        $ref: /schemas/types.yaml#/definitions/uint32-array
> > +        description:
> > +          Per-lane direction map, one entry per lane starting from lane 0.
> > +          Use 0 for TX (output/speaker) and 1 for RX (input/mic).
> > +        minItems: 1
> > +        maxItems: 8
> > +        items:
> > +          enum: [0, 1]
>
> Can't you use a single uint32 bit mask for this?
Here intention to keep this consistent with the other tdm mask array properties.
-Harendra
>
> Rob
