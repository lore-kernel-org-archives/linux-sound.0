Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664163D5C0B
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 12:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782217627; cv=pass; b=hPu/6TEtm/tMvDP/30GGasnSLEJaFACmRx/qXsuQu4lfz5ZulcQhAWVAk+4fvdHjedv7Sbbhi+G1s7OBFIg1urJpuE6pYFEnoaM53wYLR5W9VUe1SyKM6gD1YnuBPZMfjWGQyBrvfnRC85Q5rfkNEe/kq6m6I+Ps+B3beKAgN6E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782217627; c=relaxed/simple;
	bh=7/LQftETyHGWgSX2G2vHM1wJ41vU8thaiCw48xx224w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ccc7oLWbUUyiYP/VRQEULt6YP7BfmJSR1ZVCHaP/ze2H1YwTfFcXUi0Vyb8AzMBKqxxbbA06zTTKgXOTiDIMVPKzHH/WlBlSJnysgctAZ3TNXCXSo9PypHB1LkoDKTpmM68oa/FUYZILiQR1z0iBRXBFFCmFztCFgBSwvglxTsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jg/S0uHk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UEi+eZMy; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jg/S0uHk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UEi+eZMy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NBY2pG1156160
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 12:27:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2Peilm5GMknF7DoalP2gFZmK7h0tb+Y4svc63egvx14=; b=Jg/S0uHkeM4A8Q90
	CfDNCsuglEQ2J0vvSLvckFNA+8l+EovNT0g/fuF+KeO0wvAULR8Vn9kNDfCZV+p/
	5Q8ZX1rztepZWg3o0Ooq7uumfRq9uPW8YuaqDauT7eRKfiFyMh+B32VAWX22C4MM
	1m9MGJ+aQl2N+Z3fLQxhkhjPyBVEIUuzF1k/eZgIrBkBgt4nCxtqNh41fAsd+h7o
	qqnOtUGpz4rtoj95J0piBAHb6LGr4mAk/YfZ8FnLXxHifiy2iaWyTG5lXjrUp0nX
	puv4ItQFtCW+mn/n/ehgezFpSdSzxlbVbS3azgvnywNFYI9EG6QBYR+yRhrtMUfv
	yJWTGg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eyr28rgg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 12:27:03 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-7ffa2b66e3cso99105067b3.3
        for <linux-sound@vger.kernel.org>; Tue, 23 Jun 2026 05:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782217623; cv=none;
        d=google.com; s=arc-20240605;
        b=XYn0GFmHOUDKKzszEjHuMUQHjafWTq94XfQ4DaRe6fDAzLHR1Tn9i7tZ5+3/1GPkJF
         xOhGdzj3YmxDB3KVETie3x5Yl2Y8HdC4Rqyg2Xj52lggcgCf+JNX8o1vaHGhbBFY/fnW
         TsYVjMdNJ1yaUhvOKcYYTz7/eQk2d/shh9Wj4m3ZtASwwpnsNmSLg65mBsaiqLxvFd9+
         rw0H8ttgz0Kqi+VWR0vPjrIC8j7g0otRRrmgSnr9+i+TJCDh2+3ShHKhNaZh747JAHsM
         a5sQnhM+o9RHBIMVk2lO5k2hWQ9AQtmsVjTjIM1SmYn4BCCfLGPQ6UaiZGbfLG2s6PEK
         lCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Peilm5GMknF7DoalP2gFZmK7h0tb+Y4svc63egvx14=;
        fh=kK1bmD8itC032Ghy4pstLDuweDTEIMWBmviHv0SLeLo=;
        b=LSd1s4txdCarsru3ObrcLSQcG2fZU9k+CUys03UucHpoWZP9f1guxQvr+7cYKqolYf
         69G2n0EsvUZMr95YVzYV+1JDiFrqUO4uJzhVV4vwS3z9YYEWORr0eIueBYCwQtWo2UI+
         YYTOmvXFlujX3TFwjqNDf0aW2QLlFpArKSFxwYS7B+F3kHW3j1cFKMfbw27EekyfzMje
         DR96BkSwXKZzMkYAI5P2bLZMeWPiDD4kuFiQfcwJCX8T8YZ6IHY0HByTk50d5X0QXgk1
         nG2HAsmfwmaf8fyeR699jBE2/Ri8/sv4pfBB8iInEEj++f0qEAjOdx+NxSfnio8l/kiI
         gcQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782217623; x=1782822423; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Peilm5GMknF7DoalP2gFZmK7h0tb+Y4svc63egvx14=;
        b=UEi+eZMyIKVHYgKb42Fg3hgj33nMuvi5ceyZpZi+b5jqwMr5f3wmZqEoj88AA5XSjG
         RHq0dDwj4kRCQ7jXUTG1NVLTJyIQ47ivmqbFwhBN28qzHhU1rGBqowh99HI9fp5dqEyi
         huBtJKBKlNYE6XBnwf5cUvaGhDrBVWVXo7QiNol8YhBkdiIRg3rCNj6OdSD3Nb6+yBLl
         LcbD2v1OgG03Mz4d9RIBXAgoo2fVA2nuX5nzSSa6I+3MBu9fvO9n3tH1Pk9LS5pvXfgd
         57/EEA+fqwNG/QCx8x7ZCFVOrnUC2uxbG4fz44qI/491Fa0WgwTs0+ZSMe8WjLrFNr/I
         EYjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782217623; x=1782822423;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Peilm5GMknF7DoalP2gFZmK7h0tb+Y4svc63egvx14=;
        b=YlcGdyLi4IZJD1dkWBboiSxHSQ7D6PD+0HybYsTtidA/4JL7FGC6lQWE5uPKlTZXGb
         +FEyZA6ifXJIIcxVjcPZHhSn7GGy3AU447kwvmFVBSfLo6LKO/D64/HlC8Ew8+i+Mxua
         expiJBVNhUJwLoI9I1Ud5ECMAmZD+Zeu6+SEm0PhA8xbnLL/zYASS3TO3wGzRsK/+7zA
         SyYFaJsnieMmHfF9cX5KMw0pAwrg8JzohIFO9mlVGse/WMOY/bvV1dWwtiY3YvAzy2ef
         R6vz1HIfLOlaW5nrueFb60b43HVAqanQ4XyfABWPwOCVQbAHcFRT2bJvS0DDk7AHZAKs
         K8yQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq9jOpWar66N7nKiervjSXH25k3jjk5t1Qu6rPgUhWKhZr3m1z1oSpCY27x3HW9Ayfiw9WPyu2GTzsmVw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0E1DMo8Odg7+8q+I38HOibhzylYvP7h8IbXxWFRVR+MVuc66l
	Vlvofix8DTRmFKUoP46OR0No+l9ht5KdX+6NDDrTtL+Kkh+i7aJbOHLElaNdsT4TCKXIVK9x3dW
	B7lGj7thBGyWpN5cl4ts6MXe9TXgZ2/Sg+5xFAhNrGiMeU/oSdjB4kYoFBkBKILK2uk9CSdh0Dd
	4zqbRFvMjCZvP9+19Gnejm8hMlq7aN4SkjySB2i93B
X-Gm-Gg: AfdE7cmT1SEqTqXeyz0OOglrU2l4lgSoMq5mnEIG/+pqCtLZDN8FtUeW8SGJH5HJXhY
	4vTdwIp2L0q6eHZZXZfFoHBZoRK01e6RH+Rrbr2nmNjA5WBMeI+h+NDXA47dg/yTpj7X5WCV7WD
	FsPi3lVPvWWna22HHjUypejwlGmt2gBIrm1HrG3nUIZRaZxq5J2wDeUHap6Csgl+k/3m8J
X-Received: by 2002:a05:690c:6e12:b0:7b2:1bf1:8016 with SMTP id 00721157ae682-80263fc80a0mr166248807b3.2.1782217622781;
        Tue, 23 Jun 2026 05:27:02 -0700 (PDT)
X-Received: by 2002:a05:690c:6e12:b0:7b2:1bf1:8016 with SMTP id
 00721157ae682-80263fc80a0mr166248317b3.2.1782217622215; Tue, 23 Jun 2026
 05:27:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com> <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com>
In-Reply-To: <3da8b668-1504-450e-bde2-b383d63090a8@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 17:56:50 +0530
X-Gm-Features: AVVi8CdEV3C9R692WZmwmWxoqEuJ-cpwwBH_4E0rGJUcM6b62Io0cU-8ZJp4vNc
Message-ID: <CAC-tS8CuhED2dvne=cuTBUcrL93WXPjNB-nDUYHWNtFF9oVVjQ@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfXxZAWfF72AmUt
 yH0SMIfPhDUx8Zr29p65t3DKHSAE4c0QjVUqynTgORqzmnBbEsvUR7eCNFUZcHUDV4G2hY3f8V3
 Ui7OR0M52mf7r4zlE4N6dJoOi5HWQ18=
X-Authority-Analysis: v=2.4 cv=b4KCJNGx c=1 sm=1 tr=0 ts=6a3a7b97 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=Jg4MX6P3rhpUa4gzTSMA:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: Y_vVbu7vmvZw_SCBdvmNYGDOT9nKgUGh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEwMSBTYWx0ZWRfX/UHiaYgROFKv
 v1f5NHqMWurE5mKOvGegKz+2/hvDkX1il3aaPadM9Vib+OYKU9xAGxD2dCMHB8UFB6j6tnlaIOV
 oxI2dfAy1vt0Dd+NzATWDvhtP+N9lSg8BzGGCvto2Y5p6daEErmzu/3Ieb3TYVDEaGQnuky7WWp
 r+XMAyVMXvpYQGtqfHUNNSFumdtlWv5YlDrZl6vLQQ3pUaODGssKecnhxlsu8LRlFyUWAAC6XJg
 AUTZfIlAsIM/V1GQeKL2zb2xGspcOqe3lBVU4xrFpU1hneNhyrjFziN45eySc4NqiWUPXSRq6EY
 1lBldfm17qQ1hMMDZs6iOqthK5bvNKXMNtq0NstABIOoWDaLMX5vpD9yyWB6vA8ENluIDAVgnhJ
 E89mRsLLlpbPiakNJQS6wK8q31Tk5NhheSFVVmvtbTXti12s/N+lvL37pBKZmsY4O7uRrQaNby3
 0L4JuJfClgvwe6zRmcA==
X-Proofpoint-ORIG-GUID: Y_vVbu7vmvZw_SCBdvmNYGDOT9nKgUGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230101

On Tue, Jun 9, 2026 at 3:27=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 6/5/26 12:37 PM, Harendra Gautam wrote:
> > Add a Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU DA=
I
> > controller used on the Shikra audio platform.
> >
> > QAIF moves PCM data between system memory and external serial audio
> > interfaces through the AIF path, and between memory and the internal Bo=
lero
> > digital codec through the CIF path. The controller needs a binding so
> > platform Devicetree files can describe its MMIO region, DMA IOMMU strea=
m,
> > clocks, interrupt, DAI cells and per-interface AIF configuration.
> >
> > Describe the single register region, one EE interrupt, the required GCC
> > LPASS and audio core clocks, the DMA IOMMU mapping, and 'aif-interface@=
N'
> > child nodes used for static PCM, TDM or MI2S configuration.
> >
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +  clock-names:
> > +    items:
> > +      - const: lpass_config_clk
> > +      - const: lpass_core_axim_clk
> > +      - const: aud_dma_clk
> > +      - const: aud_dma_mem_clk
> > +      - const: bus_clk
> > +      - const: aif_if0_ebit_clk
> > +      - const: aif_if0_ibit_clk
> > +      - const: aif_if1_ebit_clk
> > +      - const: aif_if1_ibit_clk
> > +      - const: aif_if2_ebit_clk
> > +      - const: aif_if2_ibit_clk
> > +      - const: aif_if3_ebit_clk
> > +      - const: aif_if3_ibit_clk
> > +      - const: ext_mclka_clk
> > +      - const: ext_mclkb_clk
>
> Drop the _clk suffix, we already know they are clocks, as they are
> listed under the clocks property
Okay, will correct.
>
> [...]
>
> > +      qcom,qaif-aif-sync-mode:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Sync mode. Use QAIF_AIF_SYNC_MODE_SHORT (0) for short (pulse=
)
> > +          sync or QAIF_AIF_SYNC_MODE_LONG (1) for long (level) sync.
> > +      qcom,qaif-aif-sync-src:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description:
> > +          Sync source. Use QAIF_AIF_SYNC_SRC_SLAVE (0) for slave mode
> > +          or QAIF_AIF_SYNC_SRC_MASTER (1) for master mode.
>
> Should these be boolean flags then?
It should not be, the intention is to define explicitly, for better
readability I can rename these flags as EXTERNAL/INTERNAL, Please
suggest.
>
> [...]
>
> > +        #sound-dai-cells =3D <1>;
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +        interrupts =3D <GIC_SPI 331 IRQ_TYPE_LEVEL_HIGH>;
> > +        status =3D "okay";
>
> status is "okay" by default if unspecified
Okay, Will remove it.
>
> Konrad
