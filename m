Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B70730674B
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 07:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782284546; cv=pass; b=t+abq30HhRFrbswEKOlloRNZdH6YerNzedIJO+0vN85IaBRlVUbrDNGcoVoOwgAiQq4uMvYc6u8Bh4h16LEMB5PL33ZvC9JSK48zK3gwWMrfEuGLi3762AVb9TtYI0JZThN4BS5u3xO7tkr0fG++C2XAFkWkO2VqzLJZXtJJ5NE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782284546; c=relaxed/simple;
	bh=Vk/Kr0B59WlWxBhNqn1ygNxweI0JfOjyXzEGj92jtNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HIVNTvzgYatH6sbaZRmXdfVcxkRNvAAEDsgB5ZLyg5UmsZ63Lb60OrgRJupB+XzO44/5N9OHt4WJ+VEMYBSyUGa8pfhB2DfBYTncEPTt3wZ2Td1MUXWAfjDimBycxSbG1n4nqrpVoKdVJZ0crk63FboM2hmDJ1QezX8stvyB64o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTiRQBm5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AJb3129g; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTiRQBm5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AJb3129g"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65O5u8012555574
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 07:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ayS7d6aooCn+sbxrkdiWnDLcNGrduTqUOe0t8xR3R+4=; b=HTiRQBm5PB2iUwH8
	C6fNfW6biBsHlSRwBOlu4LfYafZEXoLjGRTSo8ZnjGX24S0nn2sAPHY0WZy+54Qq
	MWNn2HKYuGPhydIStlXtjk1vdqPZQSu2008vtU/pRv+9h8T0XDnsAdOq3x3VELJQ
	Ughtq8T6tY7ac91AV1Zjli0tu4ce9oloGScCdpsp5l5Y7c0qPDFNlgg0e21S884r
	69IwU4/8NZZyn5JtPx/GjRe2YddN17MSVUTNRavh4xagqWJapS58a7yYZxFQKwCt
	1YGaeo4E3+7bsluUpJNRk5bN7AkrTbxtlXpER8yyxiWV53LhhCe0ayWFscGVeUVq
	y6tpMw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0996g93u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 07:02:23 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7fe835353acso16218357b3.2
        for <linux-sound@vger.kernel.org>; Wed, 24 Jun 2026 00:02:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782284543; cv=none;
        d=google.com; s=arc-20240605;
        b=KpV5pWvAeoG2XB6WbI6L7lHplMeegh947sj6x+I+0QRpQbWyxaxlpycxoErtCPCk4a
         INSNDhFpVzyJMyyHLdOxzlD1xUF9eApJhvo0bY2yYxZehIG5shiwNgZZuIGQ8hVX4DyW
         EcW6F9XPJG7LwLMPPVqzpyCwf15+4Wis8phQWHx2moZCuyR9JelrzaOfUrliQk3IRBHX
         O6LiROUtUwf57Go63JNo9NqMWdE8E1F9OsmlelbneUHc6rPR/08WF+ehqhHkdpbLeW2t
         IpN7HEytLGEaGDpCrg1QW8CwkiS1tvA5iVwEQRPJ2e7Jv7H1vRQoIm0TpRm/wHJK3d8k
         FQRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ayS7d6aooCn+sbxrkdiWnDLcNGrduTqUOe0t8xR3R+4=;
        fh=X/bPxNxUYrQYoBonlLBNOkIZY1wN22uR9v4Wyt7rNos=;
        b=GvKuwPq/x0ZrpKZOFBvv7xaBW6WTB273KEwzovwN4hoPwRkvDBA6JqowXaZB5xqLWP
         arRcils0wTQR/lPWjiCn1ffnLbtgRXdOw7dOZ3Mieup6i07LqlOiD6uw0Nx7tYHNLc9v
         iyNZvdsyiTKva4tHnvvcZ9/rW++JR5vaUNbxx5oAI+5io7HOwjP4MH4+urQP1yCIn4CF
         VdE6MZjmRoLst8tO4hDN+C5XEuoenYXJfDHWPfMdAKLLTWBYes+cXKjBCmK2oKy9EKlo
         UxkO2MqE7kaxxB4YbHFplZWBTQW3RkO3f1tmvVboPl2fPOm+UTzg6LBMffclmAwn/1NC
         7dSw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782284543; x=1782889343; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayS7d6aooCn+sbxrkdiWnDLcNGrduTqUOe0t8xR3R+4=;
        b=AJb3129gZdUYGVqkDeotV1ud8AgVH/9sw9vSpbxJdaFvAfJpGNhFPHNJh0CPVa8KN/
         tOTdkcXBbXwPW5n7RXM+v+iMiwQ4w1xsy8cGWXl+L42y9wsMCLVnJlffHMbwDZ3cNxzu
         zOdC+/dT5TWl+TqoDHUxmAk4GEtjTrbTfYtNxR/f6lkoSfc7YI+R0fFvpi19vIVgtjRt
         kGFbdrxLljHjbFSFEm/zjlnT8icAxB0lfid6S0SqdOyGqQLeZtjfs9VCKULddY3lsOFi
         p+CVYtBcm0UXEQMDRaEvdo2VIACiqYnxDyzWMnwRQqs/yC328pq0cqMG7S+DmWVAUy0u
         Znzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782284543; x=1782889343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ayS7d6aooCn+sbxrkdiWnDLcNGrduTqUOe0t8xR3R+4=;
        b=RZeTH2WEy0MJgae/2iGDpoUW0ZyN+P0bdAitroz89X860dYfP6h4UO40wegkR1odUf
         sWV3qX5iAu30DOam6Y+zVtOeXIT1tBehe0aL03OQozyQmqdBaKbOys9PHqSk2UP6OCiA
         4uQ61EID/7GCL3xFV2y1Tr641zFqh3d3ic3E1SQ7TCgWLd+HxNWIbp0kVUzV1lZy4Vb5
         niUT1vjmn62S/t1p8zVibueHcmDv5xatxeggodikyVFNO3LI1IT5Hchkhu8x562YjQA6
         /sKUDH4lRD66fYFjgBv9Ns02RAuWZJOxijSbvh5PkrXRRzl8QTxgJaJInrZ1/bUI5F4b
         RKpA==
X-Forwarded-Encrypted: i=1; AHgh+Rolwq94waiLpYHHaT8giiV2sZayG3ky7RzDLrHsGWmcGecqv5sNkvZlRAjXCsGWvpJo3fJlnKbiU37w4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwB9HCSVVWFJGN3VnE0gjHVbjJXobRYx4TlMKpF57hCKlv7PX+C
	j0RyLp6N6DYShuIqS2wo1VMXNMKMFV0EB7XF3Srle1FbOCvsfj/0Z8yfIM/TRmQsMEKHDkjMHwF
	2ofy3lzuHx8miTVVqZnkMTpPompifBBklIo98m17RxcUVJ+iPGv9Ih/Y43u3mQdYggvKiMg7JoY
	II5pI0VN9HbFeg5Abj4FBXyZncyLj2yLHRkmaXvnJE
X-Gm-Gg: AfdE7clMTHRDCknmD6ta8Bm0M37BBciCZg72H4Qdep+qC25SYb4UAitDaMBJ7CA1cxf
	gJuDmmALpKKb6XoJoA76Q3ZNadWb+FjaH7RWsYmowak7oS7i3sMxpSujpF7i8ftg/VaEkkEJBFy
	ViT9AWTaPT+azqoFBS/dd9X1Trs42dMJfsMXkaNPVLy2iF113yB3x1cawashG9wAXFfkcP
X-Received: by 2002:a05:690c:6908:b0:7ff:2f80:ef66 with SMTP id 00721157ae682-807ef727bbbmr20486707b3.41.1782284542907;
        Wed, 24 Jun 2026 00:02:22 -0700 (PDT)
X-Received: by 2002:a05:690c:6908:b0:7ff:2f80:ef66 with SMTP id
 00721157ae682-807ef727bbbmr20486417b3.41.1782284542299; Wed, 24 Jun 2026
 00:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-3-harendra.gautam@oss.qualcomm.com> <a7852d0b-10ee-42ec-b966-28d3f2066bb1@kernel.org>
In-Reply-To: <a7852d0b-10ee-42ec-b966-28d3f2066bb1@kernel.org>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 24 Jun 2026 12:32:10 +0530
X-Gm-Features: AVVi8CeK6XPpyfVlMUz11jEi2RpO6-1U1UJ--fwyTAgiu4KrQOHpgFt0-DV2pw4
Message-ID: <CAC-tS8C6+Za4eZbmDVE2jWK53oi2dhtU5=goTxjhBLUM4KxxTg@mail.gmail.com>
Subject: Re: [PATCH 2/13] dt-bindings: sound: Add Qualcomm QAIF binding
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: muhvT19YDkaF1QpY3_fZ8zJhCQoXOohy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDA1NiBTYWx0ZWRfXyxbEVd6kYsAr
 tKY1TEmT/7yx54a78QcrVRCtzkq/5zcSY701gIszH6exkefy/uQaIsMOWDA0kEIE6StxqGL2/XF
 cuztcxYC3cRHZrH7uutvySQ4fgT7mss=
X-Proofpoint-ORIG-GUID: muhvT19YDkaF1QpY3_fZ8zJhCQoXOohy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDA1NiBTYWx0ZWRfX70/qZoU/QvIP
 dBqwcf13/D2o2D7JKNxQbWgt4OdmH91LcK6BnOudWx1iiMuh2/x3S4i67g+G3boesevzCzXagQa
 0CjAbw+8NsCTY9eYLCg1uKRJHraI7FXNiQrP1BUXYMsKB3GMgLxy+qgcpAgYrr4g5cw+hUl3+4J
 SO3oHJCbBeQ+ktoEdyuB8coJhvKpuph72ZzaBdzCuSJeegWfE9ClsYbBVcSWEwjDM+0o6Tnk/EZ
 TcJgb7R8+NY8bL+6r+8HVxm+32GAQuWme1/aAbtdb+RAxbR1EUQXSuoLn6Bp7ZH06bvJqdb/PQP
 83ee6q0Mt82Pmg12QoNtnkEaT0Gn2vPM7NQCOkMR0ITFviGfW1hcVZGWr8aX9KhTlwfunhgN7/m
 lj1jSGJhvp4c2mtUrSaIDjsy+lwduA==
X-Authority-Analysis: v=2.4 cv=Tv/WQjXh c=1 sm=1 tr=0 ts=6a3b80ff cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=P-IC7800AAAA:8 a=VwQbUJbxAAAA:8 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=zsM4kEk9bMrbwn1mo7gA:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22 a=d3PnA9EDa4IxuAV0gXij:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_02,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2606240056

On Fri, Jun 5, 2026 at 4:16=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 05/06/2026 12:37, Harendra Gautam wrote:
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
>
> A nit, subject: drop second/last, redundant "bindings". The
> "dt-bindings" prefix is already stating that these are bindings.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L18
>
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-pat=
ches.html#i-for-patch-submitters
>
> > Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > ---
> >  .../devicetree/bindings/sound/qcom,qaif.yaml  | 353 ++++++++++++++++++
> >  1 file changed, 353 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,qaif.y=
aml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,qaif.yaml b/D=
ocumentation/devicetree/bindings/sound/qcom,qaif.yaml
> > new file mode 100644
> > index 000000000000..5b385e05a650
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,qaif.yaml
>
> Filename must match compatible.
Sure, Will correct in next patch.
>
> > @@ -0,0 +1,361 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/qcom,qaif.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Audio Interface (QAIF) CPU DAI Controller
> > +
> > +maintainers:
> > +  - Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> > +
> > +description:
> > +  |
> > +  The Qualcomm Audio Interface (QAIF) is a fully configurable DMA-base=
d
> > +  audio subsystem controller. It serialises and deserialises PCM audio
> > +  between system memory and external serial audio peripherals (PCM, TD=
M,
> > +  I2S, MI2S) through the AIF path, and transfers parallel audio betwee=
n
> > +  memory and an internal WCD codec through the CIF path.
> > +
> > +  AIF (Audio Interface): up to 13 multi-lane Unified Audio Interfaces,
> > +  each supporting up to 8 independent data lanes. Each lane is individ=
ually
> > +  configurable as TX (output/speaker) or RX (input/mic). All lanes of =
an
> > +  interface share a single bit clock and frame sync. Supported modes a=
re
> > +  PCM (short/long sync), TDM, and MI2S (stereo/mono). Per-interface
> > +  configuration includes sync source (master/slave), sync mode, sync d=
elay,
> > +  sync inversion, slot width (8/16/24/32-bit), sample width, active sl=
ot
> > +  masks (up to 32 slots), bits-per-lane frame size, lane enable/direct=
ion
> > +  masks, loopback, output-enable control, and full-cycle path support =
for
> > +  long chip-to-chip connections.
> > +
> > +  CIF (Codec Interface): up to 32 RDDMA (playback) and 32 WRDMA (captu=
re)
> > +  channels connecting to an internal codec over a parallel bus. Each c=
hannel
> > +  supports active-channel enable mask (up to 16 channels), frame-sync
> > +  selection, frame-sync delay, frame-sync output gating, dynamic clock
> > +  gating, and 16-bit packing/unpacking.
> > +
> > +  Note on RX/TX naming convention: in QAIF, RX refers to the capture p=
ath
> > +  (audio received from the interface into memory) and TX refers to the
> > +  playback path (audio transmitted from memory to the interface). This
> > +  applies to both AIF lane directions and CIF slot/mask properties.
> > +
> > +  DMA engine: RDDMA fetches audio from DDR/TCM/LPM into a shared SRAM
> > +  latency buffer (SHRAM) and drains it to the interface. WRDMA collect=
s
> > +  data from the interface into SHRAM and writes it to memory. Each DMA
> > +  owns a private SHRAM region defined by start address and length regi=
sters.
> > +  Burst sizes of 1/2/4/8/16 beats (64-bit) are supported with up to 4
> > +  outstanding transactions per DMA. Two QSB master ports (QXM0 for TCM=
,
> > +  QXM1 for DDR/LPM) provide the memory interface.
> > +
> > +  Resources are partitioned among up to 5 Execution Engines (EEs) via
> > +  EE map registers. Each EE owns a set of DMAs, audio interfaces, and
> > +  interface groups, and receives its own independent interrupt output.
> > +  The interrupt hierarchy has a two-level structure: a summary registe=
r
> > +  identifies the event class (DMA period, underflow/overflow, error
> > +  response, audio interface underflow/overflow, group done, rate detec=
tor,
> > +  VFR), and per-resource status registers identify the specific channe=
l.
> > +
> > +  Interface grouping (bonding) allows up to 6 groups of audio and code=
c
> > +  interfaces to start synchronously and align their DMA period interru=
pts
> > +  within half a frame duration using the RDDMA padding feature.
> > +
> > +  Two rate detector blocks measure the frequency of incoming frame syn=
c or
> > +  word select signals and generate interrupts on rate change, undetect=
ed
> > +  rate, or sync timeout.
> > +
> > +  Block diagram::
> > +
> > +    System Memory (DDR / LPM / TCM)
> > +    +---------------------------------+
> > +    |  Circular Buffers (ping-pong)   |
> > +    +----------+----------+-----------+
> > +               |          ^
> > +         64-bit AXI  64-bit AXI
> > +               |          |
> > +    +----------v----------+-----------+
> > +    |        QSB Master Ports         |
> > +    |  +----------+  +----------+     |
> > +    |  |   QXM0   |  |   QXM1   |     |
> > +    |  +----+-----+  +-----+----+     |
> > +    +-------|--------------|----------+
> > +            |              |
> > +    +-------v--------------v----------+
> > +    |         Shared RAM (SHRAM)       |
> > +    |  +------------+  +------------+ |
> > +    |  | QXM0 Read  |  | QXM0 Write | |
> > +    |  | SHRAM      |  | SHRAM      | |
> > +    |  +------------+  +------------+ |
> > +    |  +------------+  +------------+ |
> > +    |  | QXM1 Read  |  | QXM1 Write | |
> > +    |  | SHRAM      |  | SHRAM      | |
> > +    |  +------------+  +------------+ |
> > +    +---+--------+--------+-------+---+
> > +        |        |        |       |
> > +    +---v--+  +--v---+ +--v---+ +-v----+
> > +    |RDDMA |  |RDDMA | |WRDMA | |WRDMA |
> > +    | AIF  |  | CIF  | | AIF  | | CIF  |
> > +    |[0..n]|  |[0..n]| |[0..n]| |[0..n]|
> > +    +--+---+  +--+---+ +--+---+ +-+----+
> > +       |         |       ^          ^
> > +       | TX      | TX    | RX       | RX
> > +       v         v       |          |
> > +    +--+--------------------+  +----+----------+
> > +    |  Unified Audio Intf   |  | Codec DMA     |
> > +    |  (AIF 0..12)          |  | Interface     |
> > +    |                       |  | (CIF)         |
> > +    |  AUD_INTFa block:     |  |               |
> > +    |  - Serializer (TX)    |  | RDDMA: DDR -> |
> > +    |  - De-serializer (RX) |  |   internal    |
> > +    |  - Sync gen/detect    |  |   codec       |
> > +    |  - Up to 8 data lanes |  | WRDMA: codec  |
> > +    |  - PCM / TDM / MI2S   |  |   -> DDR      |
> > +    |  - Near Pad Logic     |  | Up to 16 ch   |
> > +    +--+--------------------+  +----+----------+
> > +       |  Lane 0..7 (TX/RX)       |  Parallel bus
> > +       |  Bit clk + Frame sync    |  + Frame sync
> > +       v                          v
> > +    +--+--------+          +------+------+
> > +    | External  |          | Internal    |
> > +    | Serial    |          | Digital     |
> > +    | Peripherals|         | Codec       |
> > +    | (PCM/TDM/ |          | (Bolero/    |
> > +    |  MI2S)    |          |  WCD)       |
> > +    +-----------+          +-------------+
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - qcom,shikra-qaif-cpu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  iommus:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    minItems: 15
>
> Drop
Sure, Will correct in next patch.
>
> > +    maxItems: 15
> > +
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
> Drop _clk everywhere
Sure, Will correct in next patch.
>
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  '#sound-dai-cells':
> > +    const: 1
> > +
> > +  '#address-cells':
> > +    const: 1
> > +
> > +  '#size-cells':
> > +    const: 0
> > +
> > +  status: true
>
> Please do not invent own style. Is there any binding with something like
> that?
>
> I finish here. Why? Because you sent DIFFERENT binding to internal
> review. Then you made completely confusing changes and never reviewed it
> internally again.
>
> The internal review which Qualcomm implemented is for purpose of not
> wasting community time on reviewing trivialities. You bypassing this and
> sending us the trivialities feels like that wasting time is okay?
>
> No, it is not okay.
>
> Best regards,
> Krzysztof
