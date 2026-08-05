Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CDE32E6BC
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 06:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913097; cv=pass; b=SXxdBKv6mKZ6X2QEFphhrRxz+v670mQzSFguOmxPkECNVG9dRV/WlUqHSTSxAyEdWixKtqx5S931aH0JcvwKtYrqiYrbwqZ8ZoXkaGnQ0TRA9Scasm+FSlaXYDHNdBH1YBdqEiu8tksDN/dQIjpRWqrNXKqiwcTZ7rFDH2YAAY0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913097; c=relaxed/simple;
	bh=OsodnEMx+zgh9b3FFSBCG8xEUSroGixsC/QWoJUzxBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sDjrEKWg7n8j4S8IRLodk7bYWOcvKr+HvbNvHvB0siftVbYGOL9+BJwFrGeVz/K83TjfCbFyREb6EyFSzLoy1vYPI5VHvX2lv13B8iss7VzlwqPZRdyS6jEOKWFGpIgj9q/55qGEn9Onks70T/YYdUrKlUHRplAvw0MlvlL0XkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=okFpB43U; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="okFpB43U"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceaf8a1265so10630105ad.2
        for <linux-sound@vger.kernel.org>; Tue, 04 Aug 2026 23:58:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785913093; cv=none;
        d=google.com; s=arc-20260327;
        b=i/n2gg1CgTFrt1+fIMNhqx6LUwUgIVHiXHSQUclzAKjIriLy8WI3VzrimZO/BqDv9x
         l0cgpuNpTHnAQK5wrn2XVtVWtH60LVoHaBbcHOIOkrBZjAK4Y0o2TuB6BSCvfQvUZ4Wp
         Rteu1IbfaQJZf1PhYAAZiQsd/wgfj5vrDYE7Ggo7IxfabFOM++VUuKMDf5RBwgz/TlQI
         ccL1G/ZW91XsV3jLTe5dq8WuZwF8hq4Z3eNbjyJIW75Hnj8YrsRGs13xaVZzjnL9K4gr
         cHqo/mljh44FlGC8JRngULg/tc1exvFsp77aYEHdGDTBFefPURT4s26vF41yZugmbvTF
         Buzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DS3y93XU+UV4dALPduKnv8HEZ3Qoa8U7PDzyKjP+lKM=;
        fh=+o3TUWaaU+69PCBgysnfztHZcfapWGcPS69zDn9AbqU=;
        b=lrZRlWnO1z17cvdfTX1yhSfUT4GN76Do8j3gn4AUZrIkW63fUliLX7igfE0aPDrARA
         fhCOkbkpGlEooFE1WMdWgo5gVeyewPXzj4TnXanegqOHp5qTKTF1h4DjP3t6A43E7G9+
         E47G5JMb3Fmb773z1ygNThPqCbttYjWEyueqSa4Wn9OW3K2yeKtsD3BPDNpgoGoImST5
         XD9H/+07A3MfeleW7oF8PtwkVKOhkPSOrOxzBbqHfUtPanRwW1utQTd3CiMA4mZyVKyx
         yUCA/t2DQJ9tbLlXbzmxzOr3E6z7Cw1i6jphDwfQJ8TF24REJ2RVY/FK380/r2bkfoKt
         +Xzg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913093; x=1786517893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DS3y93XU+UV4dALPduKnv8HEZ3Qoa8U7PDzyKjP+lKM=;
        b=okFpB43UclaxuPZwZdH1OeHkRZtAOUIy6z0dKIyqHLafML6nGL4mQpeyrK7s5/3z6a
         JWjdgntm+bkY2v+cBGJh72bE3VvwIM6gu6Xl2fK9rHNVBFO5dxk7hAHuk+Z/HNl+qD28
         O41DVzcNLy2AEXWMfH7Et8ADiIelxcf9+V5oYAJxHwcLoXaszPnNl83fejFxYPMMu2MC
         +INLGWAzBgAB3Zh2rDBJqUGz25zdySwS4jLKwBo8scfmtCc4J6/oqDMdxPYID4l1omxG
         5zQ9iogLOdNjrDFZr4m7q6FJ5YbH8vRdk3r7I17zsWsVfnZNHp2P8V9F+qGLYqG2KOh3
         3D2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913093; x=1786517893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DS3y93XU+UV4dALPduKnv8HEZ3Qoa8U7PDzyKjP+lKM=;
        b=ouhdhiis3/KGnzYihwCPv4X4c6ykP6L8Yj4+mBwEB/wEhNmqkjTwwfADy8azQUMOIH
         9ARc9XZOo0X7Bdvr+5oxzhg+Ehjxm6NRX0qlWs0qKXxzfmDeeuQH9RYxcUbD7KmNAzx0
         tiJCjdQQx+Z0cHwZvJVGNrvQTKNI378K7S9MrfRbAt+SN7Xb+7a/oo5qX64x5+VeQv/l
         TxcYlHNn3avVqYKX7SiSju1YHPERpjzKlLf7WsBvokNxerHda/mnR8Ekolt2wEZb9OuX
         GlyVKTxopGPlefcrg4e+1ZgUN0sHpMfDHGKHWucVaUbvGaH/FcGSZrHv9CodLkguHBel
         IkOA==
X-Forwarded-Encrypted: i=1; AHgh+RrstCB2eLA9If+8+kTNRM6/Hbtfk1kwsE4Nq8bbB7c0h6RH/OrMcjkh87NCew7eZudXjtaU6vpkSwZcWQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4rNdbbprVOzHKrLwKvkwQInn/yCw06uBTPCokoEpkMtfUEtld
	S9Z22v7K9Xt04jjN2eRcWIR2Ml/B9MXAGfln7Q5RXKME0CDg1sEcwr9Kc+mChg/cEPdAUKyFJSW
	44avWAU7WEDlajH7yKXpqIT32+EdLH/0=
X-Gm-Gg: AR+sD10VRBuVytcbBBQ1zgGua0rTxN30lne9Tp9d01Xgnj+uji3EIf5CI+JL4lfuCZR
	voQzjUjetG5HXm71DDas/nt4cWn3mGexHn5j3wSCLTVcv4ZbtQcZlw7TPKW0+QfB72qiz0uIwvb
	jvXC7Qb7NVNyXZqAILuspA3Q/k1/s4oy3xPgqm8rXsCQiUfZvibYQOHW8hteU8tEqyEDnxexH15
	6+IelZtvtupxDIlC7inI45lHuV0P09Z6pJRSAJ0OTnla+pIbDs+PSlsIYKOit6v8Jf+vIIDhxmx
	7EUGGl/ZfQHvXbmIlK4bECDyo4I6tOvpAP/RoTGx6Pul
X-Received: by 2002:a05:6a21:3a48:b0:3b4:61f:1fec with SMTP id
 adf61e73a8af0-3cb85df12ddmr5759243637.2.1785913093306; Tue, 04 Aug 2026
 23:58:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260804100218.49587-1-shengjiu.wang@oss.nxp.com>
 <20260804100218.49587-2-shengjiu.wang@oss.nxp.com> <anH5i7y3JkB1moee@SMW015318>
In-Reply-To: <anH5i7y3JkB1moee@SMW015318>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 5 Aug 2026 14:57:59 +0800
X-Gm-Features: AUfX_mxtqJzMX_WVEhniuKHoKxDYIHB5iQVu-6lJu_NKLxZB1goSegJJZEResBc
Message-ID: <CAA+D8ANCoc5qOUvTQPRNkvrfqAY3n6x_fbfUveP8Sfv+SL1NVw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: fsl,imx-asrc: update port
 binding to support multiple paths
To: Frank Li <Frank.li@oss.nxp.com>
Cc: shengjiu.wang@oss.nxp.com, lgirdwood@gmail.com, broonie@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	shawnguo@kernel.org, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, nicoleotsuka@gmail.com, 
	perex@perex.cz, tiwai@suse.com, linuxppc-dev@lists.ozlabs.org, 
	Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 10:39=E2=80=AFPM Frank Li <Frank.li@oss.nxp.com> wro=
te:
>
> On Tue, Aug 04, 2026 at 06:02:14PM +0800, shengjiu.wang@oss.nxp.com wrote=
:
> > From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >
> > The i.MX ASRC hardware supports up to three conversion pairs (A, B, C).
> > The existing binding exposed only a single generic audio-graph port,
> > which cannot represent independent conversion paths when multiple pairs
> > are in use simultaneously.
> >
> > Add a ports container that enumerates up to three sub-ports, each
> > representing an independent conversion path:
> >   port@0 -- conversion path 0
> >   port@1 -- conversion path 1
> >   port@2 -- conversion path 2
> >
> > Each sub-port references audio-graph-port.yaml as before. Hardware pair=
s
> > are allocated dynamically at stream open time; each active stream
> > direction (playback or capture) on a port consumes one hardware pair.
> >
> > For backwards compatibility, keep the old single port property but mark
> > it deprecated. A schema constraint (not: required: [port, ports]) ensur=
es
> > that both forms cannot be used at the same time. The binding example is
> > updated to show the preferred ports form.
> >
> > No existing upstream DTS file for fsl,imx-asrc uses the previously
> > documented single 'port' node, so this change does not break any
> > in-tree device tree.
>
> if no existing upstream DTS file use it, you can direct replace with port=
s

That is to avoid any downstream use of the 'port', so not directly replace =
it.

best regards
Shengjiu Wang

>
> Frank
>
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  .../bindings/sound/fsl,imx-asrc.yaml          | 45 ++++++++++++++++---
> >  1 file changed, 40 insertions(+), 5 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml =
b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > index 608defc93c1e..67d2826eef3f 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > +++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
> > @@ -78,9 +78,19 @@ properties:
> >    power-domains:
> >      maxItems: 1
> >
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +    patternProperties:
> > +      "^port@[0-2]$":
> > +        $ref: audio-graph-port.yaml#
> > +        unevaluatedProperties: false
> > +        description: port for an independent conversion path
> > +
> >    port:
> >      $ref: audio-graph-port.yaml#
> >      unevaluatedProperties: false
> > +    deprecated: true
> > +    description: deprecated, use ports instead
> >
> >    fsl,asrc-rate:
> >      $ref: /schemas/types.yaml#/definitions/uint32
> > @@ -125,6 +135,10 @@ required:
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
> > @@ -180,11 +194,32 @@ examples:
> >          fsl,asrc-rate =3D <48000>;
> >          fsl,asrc-width =3D <16>;
> >
> > -        port {
> > -            playback-only;
> > +        ports {
> > +            #address-cells =3D <1>;
> > +            #size-cells =3D <0>;
> > +
> > +            port@0 {
> > +                reg =3D <0>;
> > +                playback-only;
> > +                endpoint {
> > +                    remote-endpoint =3D <&fe00_ep>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg =3D <1>;
> > +                capture-only;
> > +                endpoint {
> > +                    remote-endpoint =3D <&fe01_ep>;
> > +                };
> > +            };
> >
> > -            asrc_endpoint: endpoint {
> > -                remote-endpoint =3D <&fe00_ep>;
> > +            port@2 {
> > +                reg =3D <2>;
> > +                capture-only;
> > +                endpoint {
> > +                    remote-endpoint =3D <&fe02_ep>;
> > +                };
> >              };
> > -       };
> > +        };
> >      };
> > --
> > 2.34.1
> >
> >
