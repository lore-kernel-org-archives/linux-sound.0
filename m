Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6172D7803
	for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 17:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761932413; cv=none; b=mxaPkeb7yoOV0cVn01VyoTolKWQIz5ntGF+dvudfjqZYwuUWD5n/h7GM5XN8G5bPYjVa43pL1Pkw1Frm+kzbWtvEx9Bp+oEAazz1O6Aro9mtDmqlCJArEWvVJxkzEzR5xwY4f6IA3SWvqQOnDMDjxaNYIZsFBuqQ8pUMu08dDcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761932413; c=relaxed/simple;
	bh=1T93+sMv5tPAVfplzHfP7R8MyhMUaOzEKPRnkR9FHMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yb/6ww8cjKOaQwH2eItz2k72YvxdVSAnK1bvBD1kLuJRKV7ZU2wzYp3ra8MlQXw5c+gZorudrLvFbePl2cqq0oipfaCNV1etQry7FMkt9CZMCGfnoexj9t4mXGu5sgA9n3PCmkthlyGmGykb+3gsd9iUcmtmjVeE1npsFSdCbLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=JsL8uDP+; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="JsL8uDP+"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b5a8184144dso382727266b.1
        for <linux-sound@vger.kernel.org>; Fri, 31 Oct 2025 10:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1761932410; x=1762537210; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0MslenNMNRz9hncNuGH0nUy8fkx7bjabprrZbRn1I0=;
        b=JsL8uDP+OgQdf6ItZ3aXkyVxMLjGnTHdDoY3RDhd1GYhVtnx3ais10nAVFUEdeItnu
         1XJMd1j+jDyR8rHAO4CEPcSfMh8pMv1SsCsGvGIMFPwnz08jkcBL2l5dzPVbtfF3gwKC
         69RkNVfVElbpgMG5yKX5xmiE1ZyMNqQ3nLFTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761932410; x=1762537210;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g0MslenNMNRz9hncNuGH0nUy8fkx7bjabprrZbRn1I0=;
        b=EQE75VNOmRM+M7FsDRloKfZJpYjSCuciBh16Sz+39QESeEG4PHJ0ARuaiDVOUaSHwX
         fcFs/WDiVOxTSwJXBjMBLiTSiP39ds85zk7SPKNeZPeu/0ihx+zT05wp+s7ncAfN+8lB
         +4WLO+9zzGA9Cf9CWrmiSfv3e/OPCA8rQbqa1EQwNPvdDNgPTvOiZl5DrE+nKbtuwjhy
         92aBVenGxg2pyJ8A0+A9fxVYCkvKjHAxb6hwGpXj2RYGy01vOAE47HaYJdCdPIxC2yRK
         qnoX9BBLq7ltdGtwj5sMomMJTa2KU2WKyXwRZDtuayww5vpCXHrEjVZDTR7QOhr/bDIe
         Zaag==
X-Forwarded-Encrypted: i=1; AJvYcCUbF9I3Qbs+aoFDIyJj6/FQbF7OgEFnnQCionoDoV3qn+cQz7sNUSpKNYwCHDC1IST2F7QrMq9CXtnzYg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEPG2NtrUPK7X1pE+bP7VRkzKnY7NeokPqSFhMege6Pxi7FWK6
	rVwrppPQNRXtTTi6lzv78+x22YXw3TW+bdYs2do+m3uLdjKbUEfA8r4MzTmR7EB5vtA=
X-Gm-Gg: ASbGncuI4TtdI7HQtVD9VNaqSj/+wvxyYvarhUUSQZ6UyTzhZ14+3i+M/FMlzMkbr9K
	G6uSOGp07iZciwogeCofWE5XATXP7m1huk8CA8haM3zslhc5hN6HHHumdmDtl7faHDxJtRiiLkk
	zcHJk1a3V3YZdN+ocdgG80vy3HV3z4nWGu8xTTopTNCbpkL2DqzuAbXg+QHBSuIHstTKb9FxKbS
	AvDCGHze0bmN/XxXx58zLWCDlpOOeZYiu2Kt84iEp37N6ojp//spDi/FQjd3BTaOfh6H/LASZxd
	iuUYUbVN+hZbMAYVfpUCKuuszBguDZ6fUQlDR1mWJeftTWF+f9M7Quf2m4wlu66P0Wnssa7ZW1L
	3rfY0Go9lTylSun3YRDyeTirmzCgmXkarqv/G6J3fuxju9M1VImCLpWRuDygDOjH7cYWzpzsso2
	ZzNJjTYl0ouj0nq4qbMFyX7A==
X-Google-Smtp-Source: AGHT+IFbOBwf98bBMLnyAAZrOMm+hJ35dRhtFe2UhgAlTZPlhjoRrNX+iSO04sWdZ50B8Ps8qRcs4g==
X-Received: by 2002:a17:907:7e8d:b0:b6f:198e:c348 with SMTP id a640c23a62f3a-b7070630cfcmr467732066b.46.1761932409693;
        Fri, 31 Oct 2025 10:40:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077c82ef6sm227660766b.52.2025.10.31.10.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 10:40:08 -0700 (PDT)
Date: Fri, 31 Oct 2025 18:40:06 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Liu Ying <victor.liu@nxp.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 1/7] dt-bindings: display: imx: add HDMI PAI for
 i.MX8MP
Message-ID: <aQT0dlZ88jDVptLF@phenom.ffwll.local>
Mail-Followup-To: Liu Ying <victor.liu@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-2-shengjiu.wang@nxp.com>
 <aPc9-wYxGB1KYPyQ@phenom.ffwll.local>
 <7e0fb617-088b-4075-9631-e37645b4c40d@nxp.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7e0fb617-088b-4075-9631-e37645b4c40d@nxp.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 

On Tue, Oct 21, 2025 at 04:51:40PM +0800, Liu Ying wrote:
> Hi Sima,
> 
> On 10/21/2025, Simona Vetter wrote:
> > On Tue, Sep 23, 2025 at 01:29:55PM +0800, Shengjiu Wang wrote:
> >> Add binding for the i.MX8MP HDMI parallel Audio interface block.
> >>
> >> The HDMI TX Parallel Audio Interface (HTX_PAI) is a digital module that
> >> acts as the bridge between the Audio Subsystem to the HDMI TX Controller.
> >> This IP block is found in the HDMI subsystem of the i.MX8MP SoC.
> >>
> >> Aud2htx module in Audio Subsystem, HDMI PAI module and HDMI TX
> >> Controller compose the HDMI audio pipeline.
> >>
> >> In fsl,imx8mp-hdmi-tx.yaml, add port@2 that is linked to pai_to_hdmi_tx.
> >>
> >> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > 
> > dt patches need an ack from dt maintainers before you push them, please
> > make sure you follow that for the next changes.
> 
> Just want to make sure I may follow that correctly in the future.
> As Krzysztof is one of DT binding maintainers and this patch has
> Krzysztof's R-b tag, need more ack from DT maintainers?

Sorry for the late reply, caught a cold :-/

No, that's enough, I wasn't entirely awake when I processed the PR
containing these patches. I only noticed because of a a new check in dim
for maintainer actions like merging a PR, which misfired on these two
patches - the r-b should have been counted as an ack (even though strictly
it's better to record both).

Apologies for the noise.
-Sima

> 
> > -Sima
> > 
> >> ---
> >>  .../display/bridge/fsl,imx8mp-hdmi-tx.yaml    | 12 ++++
> >>  .../display/imx/fsl,imx8mp-hdmi-pai.yaml      | 69 +++++++++++++++++++
> >>  2 files changed, 81 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> >> index 05442d437755..6211ab8bbb0e 100644
> >> --- a/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> >> +++ b/Documentation/devicetree/bindings/display/bridge/fsl,imx8mp-hdmi-tx.yaml
> >> @@ -49,6 +49,10 @@ properties:
> >>          $ref: /schemas/graph.yaml#/properties/port
> >>          description: HDMI output port
> >>  
> >> +      port@2:
> >> +        $ref: /schemas/graph.yaml#/properties/port
> >> +        description: Parallel audio input port
> >> +
> >>      required:
> >>        - port@0
> >>        - port@1
> >> @@ -98,5 +102,13 @@ examples:
> >>                      remote-endpoint = <&hdmi0_con>;
> >>                  };
> >>              };
> >> +
> >> +            port@2 {
> >> +                reg = <2>;
> >> +
> >> +                endpoint {
> >> +                    remote-endpoint = <&pai_to_hdmi_tx>;
> >> +                };
> >> +            };
> >>          };
> >>      };
> >> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> >> new file mode 100644
> >> index 000000000000..4f99682a308d
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8mp-hdmi-pai.yaml
> >> @@ -0,0 +1,69 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8mp-hdmi-pai.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Freescale i.MX8MP HDMI Parallel Audio Interface
> >> +
> >> +maintainers:
> >> +  - Shengjiu Wang <shengjiu.wang@nxp.com>
> >> +
> >> +description:
> >> +  The HDMI TX Parallel Audio Interface (HTX_PAI) is a bridge between the
> >> +  Audio Subsystem to the HDMI TX Controller.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: fsl,imx8mp-hdmi-pai
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  clock-names:
> >> +    const: apb
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +  port:
> >> +    $ref: /schemas/graph.yaml#/properties/port
> >> +    description: Output to the HDMI TX controller.
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - interrupts
> >> +  - clocks
> >> +  - clock-names
> >> +  - power-domains
> >> +  - port
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/imx8mp-clock.h>
> >> +    #include <dt-bindings/power/imx8mp-power.h>
> >> +
> >> +    audio-bridge@32fc4800 {
> >> +        compatible = "fsl,imx8mp-hdmi-pai";
> >> +        reg = <0x32fc4800 0x800>;
> >> +        interrupt-parent = <&irqsteer_hdmi>;
> >> +        interrupts = <14>;
> >> +        clocks = <&clk IMX8MP_CLK_HDMI_APB>;
> >> +        clock-names = "apb";
> >> +        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_PAI>;
> >> +
> >> +        port {
> >> +            pai_to_hdmi_tx: endpoint {
> >> +                remote-endpoint = <&hdmi_tx_from_pai>;
> >> +            };
> >> +        };
> >> +    };
> >> -- 
> >> 2.34.1
> >>
> > 
> 
> 
> -- 
> Regards,
> Liu Ying

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
