Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E0F3EA6D;
	Wed, 10 Jan 2024 09:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="VslPg97f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1704878784; x=1736414784;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6l/GvvMpHgayoh6ULHhITSaaXsxIDKvf/cwj/tXMf8I=;
  b=VslPg97fzZawPlKMmA7SpjM26oHXAD7WH4mBal4mnKTSmTuS7zOP9pyJ
   opNr2II95v9eirBP8cWzOyv2/siKrPRe1REdj4+3NRIClligkJPOpAQGC
   Ic/jILo99EVppkIVQ6MYFv5Ps4Q32PvIcdFT95ahlxv8M/0Pa5IruB59v
   tbQol9wSmIU/9TSwhwMIP4a/RCRVoisbWxTVieTYC8UPgNJ1Ja59bicg0
   VNXEmce807izC42mkub3JU7WTzGsdin+W2T6+LryIblew/28pQ2113fvk
   xEK7yZhg1S7c0kUWKbkyyQJof2FHrjxEKt5a4OnuNXKgl4UGZMHZK1qIa
   g==;
X-IronPort-AV: E=Sophos;i="6.04,184,1695679200"; 
   d="scan'208";a="34823920"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 10 Jan 2024 10:26:20 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id C2A05280075;
	Wed, 10 Jan 2024 10:26:20 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] ASoC: dt-bindings: fsl-sai: Support Rx-only SAI
Date: Wed, 10 Jan 2024 10:26:20 +0100
Message-ID: <2928386.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <e97d0273-0827-4510-ba23-3d09642a234f@linaro.org>
References: <20231219122957.3358149-1-alexander.stein@ew.tq-group.com> <20231219122957.3358149-2-alexander.stein@ew.tq-group.com> <e97d0273-0827-4510-ba23-3d09642a234f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Krzysztof,

Am Mittwoch, 20. Dezember 2023, 16:48:34 CET schrieb Krzysztof Kozlowski:
> On 19/12/2023 13:29, Alexander Stein wrote:
> > On SoC like i.MX8QXP some SAI IP cores support only Rx path. Allow
> > specifying only an Rx DMA channel, while omitting the Tx one.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > The feature list in reference manual IMX8DQXPRM Rev. 0 05/2020
> > section 1.1.2 "Features" explicitly state that SAI2 and SAI3 is
> > receive only.
>=20
> Why aren't you constraining it per variant/device? If only some have one
> DMA channel, then I would normally expect allOf:if:then narrowing it for
> each device.

I'm not sure I get what you want to constraint. In the very same SoC there =
are=20
SAI IP instances supporting Rx & Tx while others support Rx only.
The feature list in RM IMX8DQXPRM Rev. 0 05/2020 states:
>  4x SAI (SAI0 and SAI1 are transmit/receive; SAI2 and SAI3 are receive on=
ly)

An actual example can be seen at [1].

Best regards,
Alexander

[1] https://lore.kernel.org/all/20231214150243.1991532-4-alexander.stein@ew=
=2Etq-group.com/

> Best regards,
> Krzysztof


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


