Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F94438838F
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 09:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787562880; cv=pass; b=sk/BuRGInHDiRtxRJf7lbDvE+mmp+0HU3MPU5NzCS7hV2rdUwkxc/RIIogN8iZ4JXcTvhxkErGvDFJ/qZcU5y/3gnUOYqb2SNbkpR0/i4jQTw4fjFbKTuge0trE6cQt5aphIFrF0Imjs3htLCwNs6Iy4FLeqZnnzuM4Bvmxy2ek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787562880; c=relaxed/simple;
	bh=K8j+qC5sBVeIB0di1b6yfJ6CIicUq5BKlp6j8EN6/6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BkrBWk2ikumhEUp2znr45nK3YP5XmJ6FchHGSWlNenZUibQFVIq2Y7P8gLOXGLckgVNOPfRavzCQlK2QQJjlyPA2HutbHuO6h3dKMopJqDAD2V9F9cjUfaoJVxBUPDCDJ3xmpISfqpm29KYivQkW7A8kEKRETOVgQN2qVWCwwCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQ6fVi6o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G+HvcuVg; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQ6fVi6o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G+HvcuVg"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O997iT2547819
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 09:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tb9ZmJQFRWZ5XYxhh66kYcxvEKz5j4HrCZWhQ6rtpEg=; b=jQ6fVi6o4gesVS8R
	GAtMEjAf92/imkQ9nIq7QKNikOYjpBXmvU9n5RBn+9USmrgAhCaHM1siITXm+q+1
	WNvOxrtk2so9DLtaoIa8mRTj0jKi+0iomJiHKWOgK6LL6eVXmMQjxqZ0Of63nshb
	Baw59FlIGh9wZvghh2dUeiTGQAqfiLEt2W5fJCCsflsrYiRGTUfgioxrOaIs4Dgz
	KkCcPcn6TmoE+PFUuLqz/c/WyTfOCzFcmIPjHPIqGrhcsYASbMVym4qCM4M+kkNK
	fkaafPnfT3cdxC8T9FazQiTD7DIxul5MS98J7c86xbBX45l5pL7ZOazwop773ZoO
	6H37cQ==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7hvjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 09:14:38 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-8200c815489so120803627b3.2
        for <linux-sound@vger.kernel.org>; Mon, 24 Aug 2026 02:14:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787562877; cv=none;
        d=google.com; s=arc-20260327;
        b=Y7oe3ztBByr2Q3QZffmehfg2fFGxNUG6j5M3PLIyWiMtY3aABerTrfMmdY00ZLcUpu
         gjG0AvQpJAE69FCLlPLlIyG3E+JTIDy2by/ltilL/sGq0NrvZJJNRTLqi8yAWo/5JTpC
         rFfJ0f2MTQGGR9QbEDgrjwMLpqjnBKI5vrfQbYjvlOoqq33ltujbez+nzIa1jGuR9S9Z
         njiMtvBT5iKFnvTs5b0uktMg1PUUnqkV7+TrzCiaJ8jJlYFkgozVDLWHOTevCOPFMHC9
         dRESs8rA9bYM83ih+wRGmsvEAEe4LkjDMpZSea3nmgkfkbugcS9Jmt0Tf/NfLELXuaBc
         fd1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tb9ZmJQFRWZ5XYxhh66kYcxvEKz5j4HrCZWhQ6rtpEg=;
        fh=ryUaR7ubHPYWI2IqBxfvd/aH9W2QeFCz3/yGhPweALI=;
        b=Uxu5rszosI4XeRKRiA95ipQ8VAJJJTGkpn5odtEeeCVeDxh7NIptApvHwKA8KRg8QJ
         zOzx6I2WSsf/P1sDGEVKM+3GndxEjsrZw31BDJ/dpFwvunIXxCf3UUaMtTq9QnpOzCGO
         A8o2BVkEX6Rfm164Z4aMzerM2DRHfEC0Oz29LflcHDyKAqnd++eLd2qGriqf2+5tdmnU
         IpMqnD2XdBDSQYAg+LXvwweHIG0qMF1IrgUnnsmwKKhw0FphyIwluy5DCB5qtfVHc933
         RER1hZyt28MF6vhO9APvJDyMkQ/k34SsDhPAY7iuCS+ecx/MMWBu3fHNfznm+aZeQ4E0
         Yrqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787562877; x=1788167677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tb9ZmJQFRWZ5XYxhh66kYcxvEKz5j4HrCZWhQ6rtpEg=;
        b=G+HvcuVgO33qZWmGU5uXummWGx4TWU0umGaYogzTkGI6wY7xDqozd2Ftf1YdlzSKDT
         DJxMpajJxl20H496D1fcSwV6G/F9p7nZSauiiXGYZyOBg6UNgayap4YH1cvzn5hm/gBg
         95FpuRamgrdznV4K2AJGfpOrhR1JxuCFPIkWVPpGhaPPPpsOqCOszW/d60nZtLqdPiiY
         exJEUh6tfDKSs2jRcRtS0RvikyqUv5Z5PfJlw2adnaFH0bH4cQcelP2+SvvSOloP9JWL
         BzUL29eVyngJ4HbepxOsFVwdI/BqShLMZtoNcPB74WUnfj0lyJQOTiUWN4oCa+01aSfr
         OP/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787562877; x=1788167677;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tb9ZmJQFRWZ5XYxhh66kYcxvEKz5j4HrCZWhQ6rtpEg=;
        b=nUK/MzoOOZd8czjY9LxZGD0gpZxtMqOtP9JkX0ol4ypzJ8yooYbYsjaMZeSCywKTuB
         ReScAoQKrx1AtexitzDte/fl4jjaFKEu8mcpS3I1fpFiW5t25ZFBh3N9SHYexln0ELfT
         bwgXaBl+uhPlrelZ6loNdt1Xh+lye+oLmh0sC4Wtd9Zc87vOge0hcWB4RxBveLEpsCBl
         xvLFM1tprWLGXZ4qjj5ZAx0S7qlLRic6mq7w0kIr+wFle0QE9WInIhjmfVFwPLucDGtK
         i2XS6Tf5j9uWm6SYNLlmPu5PQeVNWGd2nJnSd51Cq+Q8oj3zhQN/Q/4lRKiuG6LZ1VYs
         oHrQ==
X-Forwarded-Encrypted: i=1; AHgh+RqmoUe9BNxGG95Z7F1/3JsRu+FeL09xcnm/PsCHT6dk3zV5PamYHdJtnrwjX9xTWEzr+WjeMJMcxtEAuA==@vger.kernel.org
X-Gm-Message-State: AFuF++mu3UqBGgwhsoa2NVM0wuRULG598ML+5V3KYRti3XODCQY8xxQb
	oFkEDpJ6maB0gh5+U7rr32aPOD/LzfFWkkUJBu0s1vgLVB0bHHBfm7IlpWTIyf1ss0TzE4sMI6h
	dBmimHyG3f/IChDHKJdFBPZ5cSAcxE2yW3hHp/TJEUaDqAt/X2I1Jp55sAb0fL32Y+QTSt//OVs
	Z8dUQ9IX5jAnjRfEM7oDwRGzHqrE/6kI3cGQrIZycb
X-Gm-Gg: AR+sD136xnVRhsyrrxxa+MYevo0PGKz/z/EwqWQ3MX9zJ+irQkYBFcNPH6SgJaqSn5P
	d6fXI2nkqbpsNcBtVs2yDqNNUeAHW6hwZtykkSowpTk0ZFIqB7IPCGczys+ZrgEYXS7ODUGl4kJ
	j1o5rVQA/BCJhzPPgxeaaNtYETxaVgB6mXHTX7uHmwhrzYekdW4NqxUjKFbII=
X-Received: by 2002:a05:690c:a648:b0:80c:d342:955c with SMTP id 00721157ae682-849ef49ad1fmr76365907b3.3.1787562877529;
        Mon, 24 Aug 2026 02:14:37 -0700 (PDT)
X-Received: by 2002:a05:690c:a648:b0:80c:d342:955c with SMTP id
 00721157ae682-849ef49ad1fmr76365667b3.3.1787562877007; Mon, 24 Aug 2026
 02:14:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com> <f24970d3ec28f6b8f57e7c139d0daa2cb5128492.camel@mailbox.org>
In-Reply-To: <f24970d3ec28f6b8f57e7c139d0daa2cb5128492.camel@mailbox.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 14:44:24 +0530
X-Gm-Features: AcwNN1VyeWTTevjYtkyJU8B1OqqLSNiUH8LEUOVIm93k3AQStOqmTeqdsZFxI2U
Message-ID: <CAC-tS8CnvdmhRrZd58rDeEmtxbzR3W4g+85UW8Nse-L4J-31JQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c0b7e cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=gEfo2CItAAAA:8 a=b3CbU_ItAAAA:8 a=EUspDBNiAAAA:8
 a=iiTjsVZ8Xzyo1PsM3MwA:9 a=QEXdDO2ut3YA:10 a=MFSWADHSvvjO3QEy5MdX:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfXww9jkKf7o3Zi
 RFSM8Djeb6LCZeNh9Maq4J4nbNWCkBXQHxCZFIY61AFhfcgM+R+o52vNEmFAKfJTCXNgG9Vxkvg
 rDGOCtU3ILKQfk3sGQF+2uXYEycrt6w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OSBTYWx0ZWRfX0qMxrvMYA8Ca
 emTdz3s3GGhjD6clOGmvLzi7ZhtLlSj+wAGZp3x3pNFbT3nHueh77WZE0H3lRzcEHnkf7H214MK
 StGBndtRwwdOzZ0gFsWDZxP9F1KfXmMcIGmCIG0R0MhjsJWcV01RA+Pu8tfdCAg+rBdeCx3K5Yj
 bT+WkrqvdObwME7TyjeElqW0tN3KPK0MiYVByK+8X2M4Y0xszalSYWl6T79GCKYn628ehUja+ex
 F5mSHXhU4SSzTvWIUITcsbTSqCRPZBJ9hkBUoCxA2qKTDdQC43LVjg/7yLkufVeM6uMrDwKqjV/
 wtN8qACjQBrY/L3YF6VH75X5D0UsI4M1uLSq3bVyCENcRu4mF1570uNPHLGYUhU/AMqkkRYMcwY
 4PC4mYfT2Cx7nuzcwiC2mwemNV4Ff99nzf0wj+HtSGYu7+HsfzsRVNdibiitSKFn0Dv0jAHcUkM
 lsp5ohmHkZDsSBOuyWw==
X-Proofpoint-ORIG-GUID: hjojkPkr5Aqc2S-X3pZAFX2vCxYAG67-
X-Proofpoint-GUID: hjojkPkr5Aqc2S-X3pZAFX2vCxYAG67-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240079

On Mon, Aug 24, 2026 at 2:09=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox=
.org> wrote:
>
> Hi
>
> On Mon, 2026-08-24 at 12:06 +0530, Harendra Gautam wrote:
> > QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> > interfaces and the internal Bolero/WCD codec. Platform Devicetree files
> > need a binding to describe the controller resources, DAI cells and per-
> > interface AIF configuration, and named constants to avoid raw numeric I=
Ds
> > in sound-dai references and child-node reg values.
> >
> > Describe the MMIO region, interrupt, clocks, DMA IOMMU mapping and
> > aif-interface child nodes required by the controller.
> >
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
> >  .../bindings/sound/qcom,qaif-cpu.yaml         | 307 ++++++++++++++++++
> >  include/dt-bindings/sound/qcom,qaif.h         |  97 ++++++
> >  2 files changed, 404 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif-c=
pu.yaml
> >  create mode 100644 include/dt-bindings/sound/qcom,qaif.h
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml=
 b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> > new file mode 100644
> > index 000000000000..134356114733
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,qaif-cpu.yaml
> > @@ -0,0 +1,307 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/qcom,qaif-cpu.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
>
> Both of the links redirect to https://www.devicetree.org/
Thanks for the note. This follows the same convention used across all
other DT bindings in the kernel tree.
-Harendra
>
> >
> > ...
> >
> > diff --git a/include/dt-bindings/sound/qcom,qaif.h b/include/dt-binding=
s/sound/qcom,qaif.h
> > new file mode 100644
> > index 000000000000..24706efd07d1
> > --- /dev/null
> > +++ b/include/dt-bindings/sound/qcom,qaif.h
> > @@ -0,0 +1,97 @@
> > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> > +/*
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + *
> > + * DAI IDs for the Qualcomm Audio Interface (QAIF) controller.
> > + * QAIF_MI2S_AIF* and QAIF_TDM_AIF* values are used in sound-dai
> > + * references and as the reg value of aif@N child nodes.
> > + * QAIF_CDC_DMA_* values are for sound-dai references only and must
> > + * not be used as aif@N child node reg values.
> > + */
> > +#ifndef __DT_QCOM_QAIF_H
> > +#define __DT_QCOM_QAIF_H
> > +
> > +/*
> > + * MI2S DAI IDs -- one per physical AIF port in MI2S mode.
> > + * Each port supports up to 2 channels (stereo I2S) over a single
> > + * data lane sharing a bit clock and frame sync.
> > + */
> > +#define QAIF_MI2S_AIF0               200
> > +#define QAIF_MI2S_AIF1               201
> > +#define QAIF_MI2S_AIF2               202
> > +#define QAIF_MI2S_AIF3               203
> > +#define QAIF_MI2S_AIF4               204
> > +#define QAIF_MI2S_AIF5               205
> > +#define QAIF_MI2S_AIF6               206
> > +#define QAIF_MI2S_AIF7               207
> > +#define QAIF_MI2S_AIF8               208
> > +#define QAIF_MI2S_AIF9               209
> > +#define QAIF_MI2S_AIF10              210
> > +#define QAIF_MI2S_AIF11              211
> > +#define QAIF_MI2S_AIF12              212
> > +
> > +/*
> > + * TDM DAI IDs -- one per physical AIF port in TDM mode.
>
> Is this sentence complete?
Comment is written in fragments. Please let me know if it is not
conveying the intent and needs to be rewritten.
-Harendra
>
> > + * Each port supports up to 8 channels over up to 8 independent data
> > + * lanes sharing a single bit clock and frame sync.
> > + */
> >
> > ...
>
> Thanks
>  Manuel
