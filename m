Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F3E179B5;
	Wed, 20 Dec 2023 08:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FLEsn+jv"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E5411BF206;
	Wed, 20 Dec 2023 08:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1703059812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WYCn55L9LYXcsrsa3rckB4VOR65FZbyXhZEd5vzTYvA=;
	b=FLEsn+jvH9dNV8gOGvDfeG0dzegnfsD8OZ2ulskHYPqj7XJWuPqXZ86FyxJE9q+Ozzgr6W
	lD45c5kOYXBphNxhpLxrv/NfvHfbyGODrpSFvuiw9w5C1mAWHM6tgzEtpbtiLihIH/P4u1
	6bVQDyzPZvRWyN09ESlKfrECB65sczsh0Z/7flHjJwHR0PkfVBDbyRT02xZD+920NZH10K
	sSh68dckm0feb5avQdgwYgVTkvpNxhAAcEj4+CoztxW1Pp/xX68SY0ODOkcWB3ocrXK9sQ
	eTUSqqUOQTGPEoB9ahPOh7SVhhgkaILim6vCEcf5/2thagwQlDNcWg1hDeyNHg==
Date: Wed, 20 Dec 2023 09:10:07 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-rockchip@lists.infradead.org, Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, linux-sound@vger.kernel.org, Liam Girdwood
 <lgirdwood@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Heiko Stuebner <heiko@sntech.de>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: Re: [PATCH v2 2/6] ASoC: dt-bindings: Add Rockchip RK3308 internal
 audio codec
Message-ID: <20231220091007.35e62af9@booty>
In-Reply-To: <170302760623.2025074.2958729782154314139.robh@kernel.org>
References: <20231219-rk3308-audio-codec-v2-0-c70d06021946@bootlin.com>
	<20231219-rk3308-audio-codec-v2-2-c70d06021946@bootlin.com>
	<170302760623.2025074.2958729782154314139.robh@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com

Hello,

On Tue, 19 Dec 2023 17:13:26 -0600
Rob Herring <robh@kernel.org> wrote:

> On Tue, 19 Dec 2023 15:54:17 +0100, Luca Ceresoli wrote:
> > Add device tree bindings document for the internal audio codec of the
> > Rockchip RK3308 SoC.

...

> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> Error: Documentation/devicetree/bindings/sound/rockchip,rk3308-codec.example.dts:20.20-21 syntax error

Indeed:

-    audio-codec: audio-codec@ff560000 {
+    audio_codec: audio-codec@ff560000 {

Fixed locally, queued for v3.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
