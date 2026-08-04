Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8082C43B4AA
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 08:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785832173; cv=pass; b=uuMjZMB8I8cvhJbqdHmMoaFihxejn1IFm8FF2jklAwE2U+nc5kd9FVe4LpEaHuoHj5duIoQXtQPEwSfRLJm0zi5PYVDi65kr01nIjJSgNfjtH6tdH3TKN+tvD06b25ZPwm34tfYIc4vAsdt1o9nOLppuhsn4NqAH5A0uxobgPqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785832173; c=relaxed/simple;
	bh=JbREwa63WRi45t2mfJ3BlRKqeRupdVkcEIbr80t1Rm0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hs2o4YjI4R7Z/qJS1/1AhN1AFY+X94ymgPiKuz3Vv1nMeAmhBRcA+lCU6Rs04BG+pOphj2ggacbc25fmmDte+yeVYzO2ZsgdUQ+qmxt5xdB0RjeDkNj3vQ2nYiNFlnXtwZmQeN4gbTu9BzxAJ3fnYKZofD6fIxShtaaFjjTiTYY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDxYRrbP; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDxYRrbP"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8485b358552so4458161b3a.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 01:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785832172; cv=none;
        d=google.com; s=arc-20260327;
        b=kWSEZkEw6plmpJBe+OZ/WhtB+pRdfTjM3Cm93W5SqQAtn2SgX2EYVV9eT+vKhCBOOt
         TlnoflGqx+tcVotlAGr5gnHqqDDl+AipfqSv/+cnffR6O1CHZLJzop1r2GuVDZmJu2+/
         vlhttuRz1+YndzJCOevU9FeH8umoGwKSsfeU58E0Y51lXSnM3f0UbkWz781itH+biwbd
         c2ss+1/uTqxm3qsbZ1IiTQbHhFWWrdi6xKx2BiAooHk1wLncePAbubsnlRu5K1Z7ZMxg
         1UhDtXX5d8fRNfGGq6EYb9doZlQkMLOwOH/3VAPNer9JbfpHgO4LetTYmmjvGG3JgVI5
         B/6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KkuWY5Hua0QRTwIBGaEIrRJQVtnuHK0Pb4GBlrZuFaQ=;
        fh=8BlHqGYkMOnAr0IGUsPAtNO8Dg0M65P2AJ98jEMgLdQ=;
        b=L4fh7qYrYYPnoaaZFToQf/Og44b8PfG4rwl6HppSmO6ZyqmsERLkCaFs9l+iIDIbDj
         w5/vYzRdTbexvV9Sn2uk1H9eGWOOhfapEF8XCAuhb98mHrtt+Mdi5oNkiV6c/IM8Ikev
         ZU6CfuGPTqvKGXgd7qTlodQKvQDMqY9jCEDJbKLRBFgDVAzLGpBNF1HzCQtZehBPvUfb
         SpBqorFTKxknT8piwsMBwj/ne/O5KpnyegYP82wu9UJu8BhBg7KepA4xSNOZa10A11DY
         RJkEVJTfvaeJjKxwcSa6Y6MQyO0mke83W9mkPUDSC2ZZo4gf3ILrPmyzvjPA7zkL8WFW
         YFpw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785832172; x=1786436972; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KkuWY5Hua0QRTwIBGaEIrRJQVtnuHK0Pb4GBlrZuFaQ=;
        b=QDxYRrbPpM/WFNH8PONYCM1qVqEfAjRsALpx3OruSVLPavLOYA+r+iWoguu1NM6pon
         dTQNHdI7hpdXhPcggupIhV9A2/CFRTe08mEVHPIKssGnyAzX91kt+L5fRn4v06ewbk8Q
         BnQS8g6VVpj1MAMLxLuDRqR/fFr3iuJXxvdTdbR+Pr0/e38ZR/9AZaWAr1DW4CYx+ILl
         ttBHLoYShg+7bLB8SuEloyLQQ489muMwWiKoV1P+zxVaGwDfYvxLRkwJFn6X3+elureM
         glf6u1QCbjwzNA3NBiXqCt/VeUAvIBNniykG2OFFCeyyPcrI6ooMK22ZcvKKS3R2X6OY
         JtQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785832172; x=1786436972;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KkuWY5Hua0QRTwIBGaEIrRJQVtnuHK0Pb4GBlrZuFaQ=;
        b=eKBFp1MR+99Z2TSzq+XoOJ/HEJcJ8BfPKHl8L//aoj8dnmkDivXTvlTm34VcZelpYA
         3EPjUjY2Fc03s9IV7YQF6N1sfb/UAfLedHJ8nFFpH4h16Z0+VZX876Jb5Yw+LoB016zE
         J9N88BSHS09+c39053bPewuLa+rFAmwyrTgoElOcdXa+6MdnxzOIEOpOuxCA/jIsrqvE
         0N26uobjaRavUYKnXBFuicxMtk8O05rqez2xSiYepUQktJ0D09dZlvbMHTm4/3oUgwNN
         Zk3Xwtvg3mAhO92yxs+GBTHHbi6WRR9hCIUqbAvdncpSYzuadpLL+AqzOcBIVzwSyk2Z
         uWCA==
X-Forwarded-Encrypted: i=1; AHgh+RpOIIVZg2lw7pddYRjgZtbzwb+9BheLTHkFglK+P14HgOnO8Ic+w+IBXEpOCS08jA9aEZuCjS9yUowRHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzlTiVBMNaKxnD8dqQCZ+o1b6YX0vy1kO/OyL4cai5/xoetVO+0
	k6XZR/loGv82XVWgzHALh/gnYxUsAq4QOMJ4PQrQR3GLaKaQw29wPR5vlfbODKiU4DBKkgDj1Rm
	+ROzo1gxGH40Sqdy8zWTeME8re9P+iqA=
X-Gm-Gg: AR+sD12oNElpDi4TGEnvzt1hd2dXotFJSfV3iIS0AGxQkdjL44H1DIpM3Uxp3i0qxDd
	/Z2PmdpbuuQBOuPKw1g0YXv1nPvElU/F49S3HVQdYQLm+BJN9+AM7fDXwKxnZrL1Kg7RrjqM9XF
	dRwEadIPEyu73pYZmQZhrUGypQuMNGjovvFbwrXMoF9Ir2Ad74cTGRnQC/BqH+oxZa3n0YK/uvP
	ciZ916x4SpAQqwpJEth0XzgpOIiGEsLpcwDSETWLfqPqbEgQiLLm6RxssC0nQawONzNzhRWVBrD
	bVIk3iE7UHuOiJO4T0kWhpStsMlPOS/8j6etXBZx2ARraMFazFxXXZI=
X-Received: by 2002:a05:6a00:8d2:b0:845:e2da:91a3 with SMTP id
 d2e1a72fcca58-84ee480ae81mr12824134b3a.30.1785832171759; Tue, 04 Aug 2026
 01:29:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720095450.1618747-1-shengjiu.wang@oss.nxp.com>
 <20260720095450.1618747-2-shengjiu.wang@oss.nxp.com> <20260731225930.GA2098187-robh@kernel.org>
In-Reply-To: <20260731225930.GA2098187-robh@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2026 16:29:19 +0800
X-Gm-Features: AUfX_mwxExGCC8sRpN6-vbVB9v8CNcSex_SykavnhYOluP_E46GIp0w8aQWy9oQ
Message-ID: <CAA+D8AO1D6GJ8xwuKf797rc41ymTZp2d=LD8GEQALHhdpToCUA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: sound: fsl,imx-asrc: update port binding
 to support multiple pairs
To: Rob Herring <robh@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 1, 2026 at 6:59=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jul 20, 2026 at 05:54:47PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent the individual pair endpoints.
> >
> > Add a ports container that enumerates three named sub-ports:
> >   port@0 -- pair A
> >   port@1 -- pair B
> >   port@2 -- pair C
> >
> > Each sub-port references audio-graph-port.yaml as before.
> >
> > For backwards compatibility, keep the old single port property but mark
> > it deprecated. A schema constraint (not: required: [port, ports]) ensur=
es
> > that both forms cannot be used at the same time. Update the examples to
> > show both the new ports form and the deprecated port form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/fsl,imx-asrc.yaml          | 78 +++++++++++++++++++
> >  1 file changed, 78 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml =
b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > index 608defc93c1e..18d252722aa8 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > @@ -78,9 +78,29 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    properties:
> > +      port@0:
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for pair A
> > +
> > +      port@1:
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for pair B
> > +
> > +      port@2:
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for pair C
> > +
> >    port:
> >      $ref: audio-graph-port.yaml#
> >      unevaluatedProperties: false
> > +    deprecated: true
> > +    description: deprecated, use ports instead
> >
> >    fsl,asrc-rate:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -125,6 +145,10 @@ required:
> >    - fsl,asrc-width
> >
> >  allOf:
> > +  - not:
> > +      required:
> > +        - port
> > +        - ports
> >    - $ref: dai-common.yaml#
> >    - if:
> >        properties:
> > @@ -188,3 +212,57 @@ examples:
> >              };
> >         };
> >      };
> > +
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/irq.h>
> > +    #include <dt-bindings/clock/imx6qdl-clock.h>
> > +    asrc1: asrc@2034000 {
>
> Drop unused label.
>
> Presumably the existing example uses the deprecated 'port'. If so, just
> modify it to use ports and drop the deprecated part.

Ok, I will update it in v3.

best regards
shengjiu Wang
