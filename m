Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827BF143C69
	for <linux-sound@vger.kernel.org>; Fri,  4 Jul 2025 06:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751608867; cv=none; b=Ek22md8T049Ke8y8a5PZb02DQv59oHQOTMcSMQzeNgX6+EC7xoBoza/7WpmuXMQgCVM3KjRaKKTErbyMyleBX3odXg8I2d19PCcrb58PBvpXsqnze0q/9wb/Jtpvr8BTuIjxqXCMJQW6klWND7rhm3udlKuWACIu1GR0EZScgeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751608867; c=relaxed/simple;
	bh=iN+eRlhHdorWDunPr1SoD4iJ2i8XICBGACpYA1baHPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EKRh+xHFPzBmstONZyGn+IF3u5Kw2MAx6NQcZSVlZLBPvMD2L5REQ3/JVl1XgD1Gz7y1+n6sXm4LsN6OdNIGUxQcshvXl5+o/PtEOwvjZ+salY2lQEk7hOn+i/nwbwzlWYUSFW8JCmrVDeMfn0GQszNCnz9yG5Oob85Ng4iMnKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com; spf=none smtp.mailfrom=foursemi.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=foursemi.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foursemi.com
X-QQ-mid: esmtpsz11t1751608835t91668ce4
X-QQ-Originating-IP: zM90GZFMZI7yfyc+xZqfOjC303VrdAtqXt8If3sh2j4=
Received: from localhost ( [183.17.231.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 04 Jul 2025 14:00:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11170763768269666623
EX-QQ-RecipientCnt: 13
Date: Fri, 4 Jul 2025 14:00:33 +0800
From: Nick Li <nick.li@foursemi.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, perex@perex.cz,
	tiwai@suse.com, xiaoming.yang@foursemi.com,
	danyang.zheng@foursemi.com, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/4] ASoC: dt-bindings: Add dt bindings for FS2104/5S
 audio amplifiers
Message-ID: <2926FE7607C477C6+aGduAY1NTfY9T4lL@foursemi.com>
References: <20250703035639.7252-1-nick.li@foursemi.com>
 <20250703035639.7252-4-nick.li@foursemi.com>
 <9c75041d-a06a-49ef-92d1-011faeb39496@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9c75041d-a06a-49ef-92d1-011faeb39496@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:foursemi.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OO4+H9IUzQaLVi8UwV0yAjTgd7fSDKRhuKBsVRC7OnQDglf4r8o8FkDr
	SlZFUtqRF9zz5lfcZ8gtU6Si/3w7TH/qMaWsbZWvGXRvQ0ug8UFmowI+ZN9jVzMTcSKXLPE
	jbn5KNDsWqXg2Qs1kd3WCjqORHq30CbSFAGEto3+F3rwN1xMHQMu2Xq7P/7w4Dizaoj+WLC
	+fz54AWU6mKK3cY4Zp7UzD7gCWrDnQBBRAgq/sKK70QbcQkbAum56oYRUL6HULHM5oDg8x6
	1RM31ZIHYSvil+VB9fFww1hRGmqhleD6+ZX4GT0H8ahL4Zgk9PzLgO0IWLSv04aeQNH/47Q
	2BqNU84YK5ubu0169pfedmZM30+9io4hxGO7SGfqkxfDhRox9Tibw6xDHgJJXoMEm/ojIYP
	BNIO814G9zV0afTjzLKD1M6OFFU/8Rwi6efUbdoimxw5tnhqU46eMyWTCoDw4qlCa95HYC0
	K03Nb/rq/1bzplgmRbXnsgVXRTASl0EnwLmkWqhBYWii3u20rC2RbjxW5Wy06gkiIm/1UMp
	SThnYd34Fw7f0M4L7lDh9FM0YcuvOfDTCN6XwKfmk9uAmbnUrekuHy3A9O2ov2k9+pbUqEY
	P0nfFJlhYUWme2EW2IIZfPdrNTDcAOQJGT8wxPw2rNIfktm+72nJGw+gXB/VoGLUXY+cpMB
	DaVBOGMBBTEwSQz8B6kzysgQ01PsQjfKOZ5SuF/oQSlF0Um9Zzz1g1ejGKgLYagTIXU4RVt
	sYIRSjpQOQIJ9nuy0LH7uXuD/aWCZpgOmQwgwJGKt+AP97VpKyI8MJKdqK3chzTSGChs92m
	/XGvfEDFdDraYCDKzFpUrGypkv0w/3b+YeglXJjQyIEolojmJNwPzKRBTl90jMrR81/pQZf
	eNUGpIT50DOIS+Rq9CzJaBxrcooUFpxzhGjOHojt5phPG+2couTs8/zoV5/tuauafbx45c1
	c/nqtmwYIii6BZa3B4i1CAw7JwU+UflSprGHcHeersU3kTeZgRuRUvQFcIeLQUrWMiZiWRL
	SL7T+SYgDeB9kZJk1gz4c04MPsX/1IWYQkqzQOhu35FaLMQa45oc0FzlkkPwSv1haGqqzgB
	Z4IZjQp6F13SvK7M4a6SbnkQkUpFNLls8prMWZO2Xf5
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

On Thu, Jul 03, 2025 at 08:36:42AM +0200, Krzysztof Kozlowski wrote:
> On 03/07/2025 05:56, Nick wrote:
> > From: Nick Li <nick.li@foursemi.com>
> > 
> > This patch adds bindings for FourSemi FS2104/5S audio amplifiers
> > which can support both I2S and I2C interface.
> > 
> > Signed-off-by: Nick Li <nick.li@foursemi.com>
> 
> Your patches are not correctly ordered. Vendor prefix is supposed to be
> before is being used. Bindings are before their users.

OK, I will update the orders of patches in next version.

> 
> > ---
> >  .../bindings/sound/foursemi,fs210x.yaml       | 95 +++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> > new file mode 100644
> > index 000000000..3a1aba9b8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/foursemi,fs210x.yaml
> 
> Choose one compatible as filename.

OK, I will update the file name to foursemi,fs2105s.yaml

> 
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/foursemi,fs210x.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: FourSemi FS2104/5S Digital Audio Amplifier
> > +
> > +maintainers:
> > +  - Nick <nick.li@foursemi.com>
> > +
> > +description: |
> > +    The FS2104 is a 15W Inductor-Less, Stereo, Closed-Loop,
> > +    Digital Input Class-D Power Amplifier with Enhanced Signal Processing.
> > +    The FS2105S is a 30W Inductor-Less, Stereo, Closed-Loop,
> > +    Digital Input Class-D Power Amplifier with Enhanced Signal Processing.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - foursemi,fs2104
> > +      - foursemi,fs2105s
> 
> Your driver suggests these are compatible, so express that with fallback.

OK, I will update these code to:
  oneOf:
    - items:
        ...
    - enum:
        ...

> 
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: |
> 
> Do not need '|' unless you need to preserve formatting.

OK, I will delete it in next version.

> 
> > +      I2C address of the amplifier. Refer to datasheet for possible values:
> > +      0x68/0x69/0x6A/0x6B
> > +
> > +  clocks:
> > +    items:
> > +      - description: The clock of I2S BCLK
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bclk
> > +
> > +  '#sound-dai-cells':
> > +    const: 0
> > +
> > +  pvdd-supply:
> > +    description: |
> 
> Do not need '|' unless you need to preserve formatting.

OK, I will delete it in next version.

> 
> 
> > +      Regulator for power supply(PVDD in datasheet).
> > +
> > +  dvdd-supply:
> > +    description: |
> 
> Do not need '|' unless you need to preserve formatting.

OK, I will delete it.

> 
> > +      Regulator for digital supply(DVDD in datasheet).
> > +
> > +  sdz-gpios:
> 
> Use standard properties - see gpio-consumer-common

OK, I will update this property to reset-gpios, and update the driver.

> 
> > +    maxItems: 1
> > +    description: |
> > +      SDZ(Shut Down) pin is active low, it will power down the chip,
> > +      and then reset the chip to shut down state.
> > +
> > +  fs,fwm-name:
> 
> No, use standard properties (see writing bindings)

OK, I will update this property to firmware-name, and update the driver.

> 
> > +    description: |
> > +      The name of firmware that should be loaded for this
> > +      instance. The firmware is gernerated by FourSemi's tuning tool.
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +
> > +  fs,dai-name:
> 
> No, it's already in dai-common

OK, delete it in next version, and update the driver.

> 
> > +    description: |
> > +      The name of FS210x DAI, it can be set different name when
> > +      there are multiple FS210x devices in the system.
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - sdz-gpios
> > +  - fs,fwm-name
> > +  - '#sound-dai-cells'
> > +
> 
> Missing ref to dai common

OK, reference will be added:
allOf:
  - $ref: dai-common.yaml#

> 
> > +additionalProperties: false
> 
> And this should be unevaluatedProperties instead

OK, I will update it to:
unevaluatedProperties: false

Thanks for your patient response very mush.

Best regards,
Nick

> 
> 
> Best regards,
> Krzysztof
> 
