Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0DD1E48B;
	Thu, 20 Jun 2024 14:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718893749; cv=none; b=QTjA7+F8pCwEiY5QPyr751k3n/S0KxVti0gHdw6LZtQEz3jzzpbUte32Rr2tFvBwMVvu+4dpowEpyW72wUpCayUHUvYWNDEP1gbhmL0mzz+mfWK9H43AjLOpgNVkygX+0ULvZc+cG/F+N2giucEs04n2wukwqlGmKMDyKkZypIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718893749; c=relaxed/simple;
	bh=Hr/z17BQLVrRRIJX3eOPvlCA4g708g/f2MKCmPlAKjk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oifL+bOMLP221UnoS4+pVteiq9WzXEVaSdy8ncuvrZ3NQI4QYl9gN2AmPDTsjGVkz98gfhKMZ3x4KXJCqbBS99NU9WJVJe4n5JEDwsspQbnBqNzpOhG0HOBn2CK/C8huJTBt3kEb0xqpn2sULYe8FMj2+ls4YOd70jOKQwsOeKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=auGU8+ul; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="auGU8+ul"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45K5O01h008336;
	Thu, 20 Jun 2024 09:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=xn6JQ2dhwS5Uua9R
	GDxfoDvF6rGUmM0WOPpS1e+pLWs=; b=auGU8+ul+VEQ9cuoMTJ5pQkMO/OSZokJ
	6/+PdLqRN/IZczNKe5wswjr0o7uhX1D8ei56DDvNnt05f4fmZYsBzWNJqTed4o/T
	O8V3Xo7bsd1LOgrTQYbjWjOXUuDBVsmuPloM33A4duQWVK60eGGJKGK14cf8xhLO
	9fQuudci1O4DuEfDW8M52SBMQtiQQPABKFbOc1+TibYO3ZgfXq2eZWP5iQSnGHjW
	qSkD5IiV191hL2PxH78SQg/WgvZvizq8PRSJJxA7Cizs5/QBKZ7fGn/8RnJeWKbT
	7+4pATdn6vcp/zsBLMA6AC+fKNQDXOlPQwdIueFuHomOt8zVUPOGSg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3yuj8m1vr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 09:29:04 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 15:29:02 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 20 Jun 2024 15:29:02 +0100
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 95B35820248;
	Thu, 20 Jun 2024 14:29:00 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>
Subject: [PATCH v5 0/2] Cirrus Logic Family of ADCs
Date: Thu, 20 Jun 2024 09:28:54 -0500
Message-ID: <20240620142856.1609250-1-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: It1wE5sm2aZs_DTX1F3ou0zcQT5dVQgu
X-Proofpoint-ORIG-GUID: It1wE5sm2aZs_DTX1F3ou0zcQT5dVQgu
X-Proofpoint-Spam-Reason: safe

his patchset provides ASoC support for the latest family
of Cirrus Logic multichannel, high performance audio ADCs.
The devices that are supported are CS5302 (2 channel ADC),
CS5304 (4 channel ADC), and CS5308 (8 channel ADC).

v5 changes:
- Add MODULE_LICENSE to cs530x-i2c.c

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

