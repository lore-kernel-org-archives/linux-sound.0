Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F2BE31B114
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 08:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787907507; cv=pass; b=UGzUHs9MqupL7Xuom19EKGxaUKw19xmsqSfe++L+AyYjq1JLYIg96SgnyP7a49JL45+wU94xPW4TtBuBKD0UqyPLHykDgddtlyKtQos00A6hjVqxonZ3v1lxfjNywpxG+A6q6dNgbvDKfN8DtGXgneVZhpGdrln8NJWxWF3H/js=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787907507; c=relaxed/simple;
	bh=1tsOIF7GoqjTfi40uyZxs9Vza8UXlgkEXcU+W5xhQJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+Dn01fVvB5WJ1VPjfmHloF+hcDG8JjetSMFmBDoq1Ve8BRkC10Pq6VJ50F/aN3Tc9CeWjFEyeCMnoosJHV72csHiG+SFyGWpbtirRvBigDw/cmv2fDQdqVvH1ZzBb0WUe8bwMBUrNIFkIpujBW5kBt/Cno3ZZzKBkolIfwxQ+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pXtXKF5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiixQJdM; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pXtXKF5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiixQJdM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66jEw1606147
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 08:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h9qkRpA0u5mykihbpeoCW8HU
	7LRmqZIXoSQrDWLq8YY=; b=pXtXKF5yPk1BKfDBQCYDpjfC5+Ujrkw6ShRTS9M9
	abPLyOFuyzKreu3L1tMX2o+qXkeLAckAhc6+QyMjRnyMLT3fCFP7/1K/T5ty6XjX
	QZ0CjE39GhPmvhFXmCVrHZqpAck8XwVR07KgVfRTY+S+ycIkuIlmXlq1ZpiO5chK
	BxOS4pXOfw/CE/WNov+UHYsngtrgj4qkPsFOTCuin8tSLgUyCZyv9bogsSh+LRaw
	86a68TCzYMqOwLrxfIzd4G69CE5PvOvJg2hFvTa+MIzo/SIg1qhMJ71AuYdafD3f
	DGAy9FSTiHMo6+MJiwbr2bIBtLnDGktmaF/zmNN1vYxzIQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42r8ukn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 08:58:23 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66c767e23f6so1579324d50.0
        for <linux-sound@vger.kernel.org>; Fri, 28 Aug 2026 01:58:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787907503; cv=none;
        d=google.com; s=arc-20260327;
        b=R/bOX9Oo21gLVCevNaZnlszmqx6c8LD498byvoLqumWoxOjTICcDQJeMBtI3bvXoXW
         6tlkwlc1+CWEg1RqnXutjLvEm//VHHP/P52h/41K4Nj2yUJDL0Uoc6qb39DXI3GIn+Lo
         IGO62ciASmApcKvykE2cVYdd+kV1u3IV5f5Ou5D7OQH0u9ln9mnlWhfiQ6DhY4jd2bgn
         GhwYj/ER/yKRyB7U55CvFNLbiNQIRtXTFxvGsMWRJjpGSWy1wirhbonvsA/zpx7F/FrM
         gTD+PYwizjKMB0vEj5tb/5OjgnrVX2rDYm0kp2whQGH6gCa2cs+9l3ZYa0WXEr6wTnVZ
         O4CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=h9qkRpA0u5mykihbpeoCW8HU7LRmqZIXoSQrDWLq8YY=;
        fh=f/uN6OfAFYHJeP3dhvJP7wRbyT1Ii4ZNPO0pbCo0Br4=;
        b=rBNfkxW/FKHLA+uuDeaNNRW8Zwyxru9fNYwXgIefIDCKqNurWe0+8hC6uWmfc9yY6K
         RpXen6S+oVjSjV2EuK6ZVsI4EW6RcpMmR7+zJ8iB9ijr9AVH4zyVD6JuGjwqtiascGxg
         1lF+yN/I3fokBu4JIcIkxZsz2vkZHlgQHW3n/q7NrhUyOB/h9z0SDTHHz53o090ABts3
         S1Ef/f9Tfiw9dPM1/MCRkbbSR4018cm8oZKHJbzMYnd5WYNuG6TUMR3088XV0LqmfDrC
         OWqoC0mczvnrkXwSJ1LT1c3/YAKWSsK+WefzE+WWhAsT1jB1hJn5MSql1oQSm9F5Gagr
         s7Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787907503; x=1788512303; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h9qkRpA0u5mykihbpeoCW8HU7LRmqZIXoSQrDWLq8YY=;
        b=YiixQJdM5fptqa8SZjHzXQn/I5KIYhbs7E7W51MC4UDf8HuHeR6BleBUfibRNLkm3U
         w3bO3mEYlq5YSjD2GEKYFmHyaMGU833QKhGhmS/NVmCSjOH4iqJF9/VZRgj2pf7eZdG9
         KlqmJAV7uqsIL2q0SDRyEqQQm9i3KMSyj0LgCaDaFrp5RlyAWue6NGSbQMPeCDWJjCtY
         xK4CEDYF9BGICuiWpQcXVS0fL15NSJNoNDdRFV/I9pOwyRfHIZVeNJftmmBpo1GxqdJQ
         MHvchYL8PUugfX11cXhnV7NBE+uDpUzIKvkKDUEc6aTQuvW3TpVXHnQsr1Qz0ntHe7+n
         Snig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787907503; x=1788512303;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=h9qkRpA0u5mykihbpeoCW8HU7LRmqZIXoSQrDWLq8YY=;
        b=B2Kd31lDxBdWWhKeku7ZKyhc7Sl7YzX8o+JEvURM117UYpObod4qPLSp66YoOeyxc3
         zcRfhHa2JC9CrYUZOGCabnrf7RLczgZFvgDK8anMApchgdI8y8OHyUq2N782BlUyeQqn
         0x/RTl0YwuSgn3nOYlMn768TslmeSuWrKfQUw6f5K/nDMOj5PMhFJRUHyt/9SSUb3MZ6
         h8uSER+VOv1AtcC1Ikmb0OpNWFmcFBAr2AYdqByrkRLv7nnG0T0N4JpQYVWbk14tJtYo
         FHRSFdTAGXyd0Dz9oB1XwDRmqCxvpgYQBZYBOjSzE/VvlSeMEPG6Ev1F2Dr53rhS84EW
         SEKg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/7cFy9WihAYsHh83l5ZPNHkVwcqo2by7P97xtxPN4Ihd9b1P80fMh2x3YG1QMmHxj3XpW68aSO6oHng==@vger.kernel.org
X-Gm-Message-State: AFuF++lgDqNwI+ECg6BFzQVzT9g+/6PBAv7OwYjnJebKoe1TAtEALb5Q
	RuXfjgh4swc9cNm0ZaZwnpEnP/YVhR2P8HyOH56in+nQsM3g5NSMcApgRYKy/FF5f3OTJjJntzc
	JlVY5gf+z+y6IaWIDZ7WwvLxMhNowu+5eSaqF6xNa46jC4P5LOqkCeqtXG6MWmvYLz/85rUKu4m
	TFReSHMojRTTTSNQ99bnqi6AdSgNgmP7eiVA8DPO1fG/vt6bBwRLs=
X-Gm-Gg: AR+sD11+ThaT+nyFmbJj/QHh0QWz0ExIn6tmvN+8LI2urP96YEms/y4PWj7ALff9pmX
	qXnlgpPyWwB8h3VmCL+4FmqdUf6Fo9k295A4Dzld2kRhIJfxv29hN8IrEVTAbi8cYalV0M2pW8y
	8kAMNLMD6QwNOnlbqD6c2BO9yV+YBjv4umqNYfeW5HSGJCJlbQ/1GPnqtVKU0=
X-Received: by 2002:a53:d0c9:0:b0:667:7dae:8707 with SMTP id 956f58d0204a3-66e4c6007a0mr1146614d50.8.1787907503469;
        Fri, 28 Aug 2026 01:58:23 -0700 (PDT)
X-Received: by 2002:a53:d0c9:0:b0:667:7dae:8707 with SMTP id
 956f58d0204a3-66e4c6007a0mr1146595d50.8.1787907503061; Fri, 28 Aug 2026
 01:58:23 -0700 (PDT)
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
Date: Fri, 28 Aug 2026 14:28:10 +0530
X-Gm-Features: AcwNN1UHIzNqBIGzwT_M18HWoKDt3V5mbkibZsr-oWOmOtjNKEOEnS-AEr9thQ4
Message-ID: <CAC-tS8DbJq_hAcOA3x+mRAihYdPeCDMYJOBng5kqtBN-TaBM=g@mail.gmail.com>
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
X-Proofpoint-GUID: vSRKESAndD_GcH0OHCeWka3m8atWjjBV
X-Proofpoint-ORIG-GUID: vSRKESAndD_GcH0OHCeWka3m8atWjjBV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NiBTYWx0ZWRfX/5vPKolLUL4O
 37d3fvtp0N5cbveadKnFcbfU7gF2BDb1hcqdygDUzYXEg2x+KbDEd2BGSNi6vMnTy70OMADKaSj
 u6Nerpw77WKI9uMMgx6JqKnxOpic0woCTUEGgtNbyijzwhzI4gv5z0W0qzPr4HG0+IHpU4etgES
 z84a0vx1IPaHeFHMhjvZIq/+TeYZUL1BxT6CLy1GPogk6aU1/3OAXdcPLYxEgkUfftsAP+jdUj7
 0Pq0MqNMEJ4cTSshJW6JDrJEgd4D7mxyqF4XB9yZBqU4JVg8V9DebIksUBiWfMRvn50j/gxo617
 pMUcFeKyBqrj54oE/CgkYImmANi8RW4PoQqp6QiKeh+zkuUvWMvGx+EGTTVKvEltY/uqCQFvwQo
 pFkRG2bii5RMTVIf7jbjsl8e9vQIsg5/nqr9+jJ6yXeromWaOt4nAA29lLeDWrAcih20lVHOguB
 JfF2bMgJpMIYnF5q/7w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NiBTYWx0ZWRfX3/I9MCc5v1cx
 6IKSMm4AF0Lzu4gUgrvsq+ecqj5KfFc6DfWnQK7Ubg36FkVdKtw8BSzG+dZa4R6C8MMQF3DVu94
 gPATrRIx/AQLAEU+87D5013vbqBai48=
X-Authority-Analysis: v=2.4 cv=Fpo1OWrq c=1 sm=1 tr=0 ts=6a914daf cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=P-IC7800AAAA:8 a=VRosaQPrOrfO6Z3GwksA:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280076

> >>>>> +#define QAIF_CDC_DMA_VA_TX8  254
> >>>>> +#define QAIF_CDC_DMA_VA_TX9  255
> >>>>> +
> >>>> These DAI IDs exceed the LPASS_MAX_PORT limit, which will cause sound
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
Srini, could you please confirm if adding QAIF DAIs to
qcom,q6dsp-lpass-ports.h is acceptable given that it increases
LPASS_MAX_PORT by 56 (from 149 to 205), which indirectly grows
multiple arrays sized by AFE_PORT_MAX and APM_PORT_MAX in other
drivers eg below
https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6afe-dai.c#L30
https://elixir.bootlin.com/linux/v7.2/source/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c#L21
-Harendra
