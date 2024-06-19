Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 541C71D545;
	Wed, 19 Jun 2024 14:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718808676; cv=none; b=KZ3rUSEGs31xmQXX5jJi0Z62LSqRQAsRgRwZT7otK1/S1dbru47Sa6q1BqIO29WHnaXUjVAlxkUWntX6jr1tSjqeeCeC55J8rohtoGgrxx18KoiDnumPXpet8x0Og8c6iOsisHdYbEHtxIcjutoBGWYjyFiTxhsCpy27x8jqPDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718808676; c=relaxed/simple;
	bh=EtmxSZjL8mGyRg8bDiesXwtUpMPijBWfm8ALk/mgan8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iOQ6iI4Hucv7wRni5j3qETRT4XNQlJIRQ4G5Grb0h5dCCX32RnBtME0JFiL+DS/SXbUWgnG4MImUzElB6lt2xaGLStWeYcTDSb0efLJcwlP3Q1/i2tVD6TbsW+c0wyH6ZQm0rsuNfCHzs7EsK8p7G50qwSargksEsSj/hs0Kzb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=NVJeuPLC; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="NVJeuPLC"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J5ecNN006698;
	Wed, 19 Jun 2024 09:51:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=5l96H0uoA+zwgJmW
	v/Gdxjd+uqpALG7XTijG6E3dQV0=; b=NVJeuPLCSrsUllzX0mwJl1Yu9KaW4HFS
	88RU1vzD+tF8C0ZrnWZzKMD1+Nqc+5AxKeTXtcXEmAN/YkDO8ue/k1b88k5qtZ/0
	CvqfmpwqNSihL0ebNWOFe9MP5Is4yibaZs3x7Jjqn/jPQJC8OTBhUAhKmDtXCkBf
	YscVa14uV4VagXZXuvzoqueniStiOYFuIJLksfgDbqmtcO0O6vLOWyjpYmKFaJYy
	q2MTMLbcERRQUke2Vn1BbL7K8xRzMVWtOsLxBbyXnbAB+pR3JR+NB1dmZlQci4zg
	sKCMXxTEpEvI8cB9cqzIr3kTXod8X4EptwZwIaIUnzDXqy5c3MXOUQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3yujb10t10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 09:51:10 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 19 Jun
 2024 15:51:09 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 19 Jun 2024 15:51:09 +0100
Received: from paulha.crystal.cirrus.com (paulha.ad.cirrus.com [141.131.145.123])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id BD6AA82F2A2;
	Wed, 19 Jun 2024 14:51:07 +0000 (UTC)
From: Paul Handrigan <paulha@opensource.cirrus.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <devicetree@vger.kernel.org>
CC: Paul Handrigan <paulha@opensource.cirrus.com>
Subject: [PATCH v4 0/2] Cirrus Logic Family of ADCs
Date: Wed, 19 Jun 2024 09:50:53 -0500
Message-ID: <20240619145056.1379266-1-paulha@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WhvLAmXuBW_CRUPsMZM09hcMQXDqFsvi
X-Proofpoint-GUID: WhvLAmXuBW_CRUPsMZM09hcMQXDqFsvi
X-Proofpoint-Spam-Reason: safe

This patchset provides ASoC support for the latest family
of Cirrus Logic multichannel, high performance audio ADCs.
The devices that are supported are CS5302 (2 channel ADC),
CS5304 (4 channel ADC), and CS5308 (8 channel ADC).

v4 changes:
- Remove regmap volatile_reg callback since it is not needed.


Paul Handrigan (2):
  ASoC: dt-bindings: cirrus,cs530x: Add initial DT binding
  ASoC: cs530x: Support for cs530x ADCs

 .../bindings/sound/cirrus,cs530x.yaml         |  85 ++
 sound/soc/codecs/Kconfig                      |  14 +
 sound/soc/codecs/Makefile                     |   4 +
 sound/soc/codecs/cs530x-i2c.c                 |  71 ++
 sound/soc/codecs/cs530x.c                     | 966 ++++++++++++++++++
 sound/soc/codecs/cs530x.h                     | 223 ++++
 6 files changed, 1363 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/cirrus,cs530x.yaml
 create mode 100644 sound/soc/codecs/cs530x-i2c.c
 create mode 100644 sound/soc/codecs/cs530x.c
 create mode 100644 sound/soc/codecs/cs530x.h

-- 
2.34.1

