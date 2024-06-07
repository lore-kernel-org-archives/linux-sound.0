Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C3214EC5B;
	Fri,  7 Jun 2024 20:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717792056; cv=none; b=HbufU9epxeJsJJjuYsRTElNvBxNrujPXfDtW9bX+hq+5n3qLQttmnQ/lPgkwLWiZdLM5XBgb3fhx4yC7xiyLYfV6tdl8JfYiTScKmQBzY4Sga+3Iwc1HaxSAENOGwPqV/Q/dRnKdbqwVf5aehb4rb7ssfb/u2w8bG/ICaOgWaUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717792056; c=relaxed/simple;
	bh=hAgy4mrPVii2uqJ/b8Qs9bT1KR7R4yt8+p1r/IVJlLI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PUM7LdfaBWpkLpFUsv5i4E5O2VmgssJrBQvBwMkCsXSBoO76pFx4IpRLjOtqOeBLy1wwIf/whtMskdxBVFDTgFqHnR0jQ0uN39pdNb6dOF3F3CGPI5HZIRSS9SDVsx4rmxNsnc2Ukop7VS70otiMtlbA5VOHUfWKPBLxloEiAA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=n4Fx1Sc2; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="n4Fx1Sc2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457HDVEt011571;
	Fri, 7 Jun 2024 15:27:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=TI9xo4UpTu62M9QE
	tU5ioOcNSzatJpBxkeRlctUWSPY=; b=n4Fx1Sc28HAJ0VhLSmHCFT8KIbBBcnnq
	jyF+dhdKuS4KzLdjGvTuZZckBb664td1qMmpbydml/0g9wW9VGGW4kKN/b33h6ZL
	LdRSLb2/5oj40GLCqc126mkjNfS9ZrnYEDYHmEXI9mDvn/BaE0ei9vdXF3VuB0kK
	L17QB63NOuAJwAcqDd1YytYCTvTaadc9F/Pqk2r8mO54m9QsxVv8mgmEJt48d8Wq
	qJ3Inm8fnJS5qaj6lKW460fLSkIhvNITHln0t0wVdcVqf8nNZPwbC9CEsFreS4FF
	jDCzUReuXbxqbVyDyLsW4WjRxbDrhwRMc3Ah+CmP6fwJrmlwHqItBw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yg11xxvcr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 15:27:23 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 21:27:21 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 7 Jun 2024 21:27:21 +0100
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E378C82F2A1;
	Fri,  7 Jun 2024 20:27:19 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>
Subject: [PATCH 0/2] Cirrus Logic family of ADCs
Date: Fri, 7 Jun 2024 15:27:06 -0500
Message-ID: <20240607202708.335752-1-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: aS0XWRr0yrKBVjMwclyaDHwQUiFGFoHh
X-Proofpoint-ORIG-GUID: aS0XWRr0yrKBVjMwclyaDHwQUiFGFoHh
X-Proofpoint-Spam-Reason: safe

This patchset provides ASoC support for the latest family
of Cirrus Logic multichannel, high performance audio ADCs.
The devices that are supported are CS5302 (2 channel ADC),
CS5304 (4 channel ADC), and CS5308 (8 channel ADC).

Please note that this driver only supports I2C control with
SPI control to be added later.

Paul Handrigan (2):
  ASoC: dt-bindings: cirrus,cs530x: Add initial DT binding
  ASoC: cs530x: Support for cs530x ADCs

 .../bindings/sound/cirrus,cs530x.yaml         |  83 ++
 sound/soc/codecs/Kconfig                      |  14 +
 sound/soc/codecs/Makefile                     |   4 +
 sound/soc/codecs/cs530x-i2c.c                 |  89 ++
 sound/soc/codecs/cs530x.c                     | 991 ++++++++++++++++++
 sound/soc/codecs/cs530x.h                     | 223 ++++
 6 files changed, 1404 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml
 create mode 100644 sound/soc/codecs/cs530x-i2c.c
 create mode 100644 sound/soc/codecs/cs530x.c
 create mode 100644 sound/soc/codecs/cs530x.h

-- 
2.34.1

