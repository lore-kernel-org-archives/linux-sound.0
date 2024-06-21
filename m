Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C5A38DE1;
	Fri, 21 Jun 2024 15:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718983093; cv=none; b=IZLMtvY/Yi9cXa99WoBJuMK9MEKh87z/oLx9HhVzhZOT8KQCE8VvzLK5WdnMna2UMS/uS0u0cUKuKajHcPH4a5z3mk1huaRSHBvpNWUChYgFok7Ci5yrlFkWD7ev51pSAy4G+Exd6HfdvQpUf6i8Pe+8YPx0BF1WBHFC7P5E+v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718983093; c=relaxed/simple;
	bh=BDPkZ/sGXCnVXpaKTsftEsOFVNVsMzEK9dHKbCyoWuw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=d/nWo05v67DO2DTlkg1+pa0eLFkCMa7XQ8dmFsoAU7Wy5wWFUYvqU0b+OrD3J/AnezJuaJ3WvR+H17riE0O+6MQ9tQCyOe/SizTjGvcYX6qrmfGtRAUu2+qNzPnICZosIS4haCoazpzaC0IwSo9fpaQ3OFYm9W7X3BNixGe9LyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kM9rmFn3; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kM9rmFn3"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45LESPNS030752;
	Fri, 21 Jun 2024 10:18:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=emRvTTmS9i1CMa+H
	XO0/uoZ9xmOptbh6766bNwWSoMo=; b=kM9rmFn3EFBRnenxb+MvfxmWNr/uMr43
	SeKLykewMxqFYEsZx9r3xcwVkACzq5kgAn9KYupDXDauGLuL7ZT1xsoiwLtMxzTO
	FZr2gTPxf/379cPnql/0yrPmiMxw5yOD2TRH4IqvNEAHcgnHZAizhq1X3JdLZuOF
	0soanTlJ7+WwBf2bhWHowtQ6NqykcuMLpPU7pXoy1oERy/XB4NcssOXOyvxMpDeo
	LqyPsFtXq1uAdI5M2vhLTHfFYUjDQ+lVAm6XSQtEqUrAVo0sdD5DE8qlkDfdQ8bn
	QAFrwz8p0bm6CnIM71qpzKSVbsFK9PhQm5NMYV77anfmp7z6hRGxwg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ywbafg1y3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jun 2024 10:18:02 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 21 Jun
 2024 16:18:00 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 21 Jun 2024 16:18:00 +0100
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id B3F18820248;
	Fri, 21 Jun 2024 15:17:58 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>
Subject: [PATCH v6 0/2] Cirrus Logic Family of ADCs
Date: Fri, 21 Jun 2024 10:17:55 -0500
Message-ID: <20240621151757.1661265-1-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 5w3wF0HmdyG4nYGkfSA2Wm9xWF-QDBxx
X-Proofpoint-GUID: 5w3wF0HmdyG4nYGkfSA2Wm9xWF-QDBxx
X-Proofpoint-Spam-Reason: safe

This patchset provides ASoC support for the latest family
of Cirrus Logic multichannel, high performance audio ADCs.
The devices that are supported are CS5302 (2 channel ADC),
CS5304 (4 channel ADC), and CS5308 (8 channel ADC).

v2 changes:
- Use sizeof(*) instead of sizeof(struct cs530x_priv)
- Utilize i2c_get_match_data to simpify code.
- Use unintptr_t instead of enum cs530x_type to typecast
  match->data.
- Use dev_err_probe instead of dev_err in probe.
- Fix gpiod_set_vale for reset to the correct logical value.
- Provided full name for maintainer in DT binding.
- Remove | from after "discription" in DT binding.
- Removed unneeded discription of #sound-dai-cells.
- Changed supply discriptions in DT binding.
- Changeed underscores to dashes for DT property names.
- Added ref for dai-common for DT binding.
- Changed additionalProperties to unevaluatedProperties
  in DT binding.
- Changed the DT example to have the compatible property
  first and the reg second.
- Removed typos and blank lines in DT binding.
- Changed adc to cs5304 in DT example.

v3 changes:
- Changed cs5304 back to adc for device name in DT example.
- Removed dev_info for device id and rev id and added
  revid to dev_dbg along with device id.
- Set ret =  dev_err_probe and passed PTR_ERR value into
  dev_err_probe insead of assigning PTR_ERR to ret and passing
  ret into dev_err_probe.
- Moved dev_dai allocation to the beginning of probe.

v4 changes:
- Remove regmap volatile_reg callback since it is not needed.

v5 changes:
- Add MODULE_LICENSE to cs530x-i2c.c

v6 changes:
- Added missing Reviewed-by for DT Binding.
- Updated changelog.

Paul Handrigan (2):
  ASoC: dt-bindings: cirrus,cs530x: Add initial DT binding
  ASoC: cs530x: Support for cs530x ADCs

 .../bindings/sound/cirrus,cs530x.yaml         |  85 ++
 sound/soc/codecs/Kconfig                      |  14 +
 sound/soc/codecs/Makefile                     |   4 +
 sound/soc/codecs/cs530x-i2c.c                 |  72 ++
 sound/soc/codecs/cs530x.c                     | 966 ++++++++++++++++++
 sound/soc/codecs/cs530x.h                     | 223 ++++
 6 files changed, 1364 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml
 create mode 100644 sound/soc/codecs/cs530x-i2c.c
 create mode 100644 sound/soc/codecs/cs530x.c
 create mode 100644 sound/soc/codecs/cs530x.h

-- 
2.34.1

