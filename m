Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C274E1F80B8;
	Mon, 21 Oct 2024 13:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729518206; cv=none; b=qBt+U0u1a1ZoUqtpMqYOkJBquNomtwXb6b5NzzrD7u3EkcSgku9jL7NAxZe/3tM/N3FQI7KGf49w5ibUaLcf+hLFAxEJzrep5nRuwA//7+K8WgX3U3cypH3LU+S71yAaN49+T6WZ5TOr04Ar543NfECN/1EDX/C/RojiIXGhz5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729518206; c=relaxed/simple;
	bh=rDvs1CxqVAzeYVMSGhs2gik+4bnLUS6qsOMHn/0ea3o=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=CRDS58j+cN3hh3Ub84ONFkckQYcGQQzKLMsZCnahNDH0onaj6POlmYWQ0HMrffvnSeZ7ZCPZnezTuPyYTSLRgBy3mR0Ckgy3qPmyNdm+A7ijkLm557erBbLSI2jpYK0Lkr9BqqHSclZKhndr7HcWfv6B/z7h7GbH332het10eXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=OHS5G4qJ; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="OHS5G4qJ"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LC2tGp015881;
	Mon, 21 Oct 2024 09:42:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=J+ShBUz+F3k1OHNB/ky1BEGXz6G
	b4uNGdFMQRWPazGw=; b=OHS5G4qJmIYDST4Z643GQliYQ83kBxzJjctCiYIO6uR
	M85PUsfBQay7IxZ1bXLGTxYjb7uirMldw0sMRUmgJPTxGWngTYFrsmpV5M5nPhVX
	SgM2CbId8fZh5LJVZJmBqvywmRO1ToYnlnR18PDw35agor8gsjyfbcY8PWL2IOr4
	+Ku3icHymtQ/mg30Q8j89aqFqGlLnT52WQgOHS5NbRX56OCKP41y5bRfN0KIMznV
	c5KDzJAfu+Z5p1daf85cfCQkx57SflPJwHv/0mdotSGUeKl2mDi6WXbn0t7fDN1M
	hxYoPF77KWU5c2YRdbQnuoUBuVud93deIWDR5fQxpLQ==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 42dj4vsfrd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 09:42:47 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 49LDge6R055732
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Oct 2024 09:42:45 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 21 Oct
 2024 09:42:42 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 21 Oct 2024 09:42:42 -0400
Received: from [127.0.0.1] ([10.44.3.60])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 49LDgU7W017079;
	Mon, 21 Oct 2024 09:42:32 -0400
From: Nuno Sa <nuno.sa@analog.com>
Subject: [PATCH 0/4] ASoC: codecs: adau1373: drop platform data
Date: Mon, 21 Oct 2024 15:46:44 +0200
Message-ID: <20241021-adau1373-shutdown-v1-0-bec4ff9dfa16@analog.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAERbFmcC/x3MQQqAIBBA0avErBNSK6WrRAtpppqNhmYF0d2Tl
 m/x/wOJIlOCoXog0smJgy+QdQXz5vxKgrEYVKNa2UgrHLostdEibfnAcHmBs8bWds6g7aF0e6S
 F7/85Tu/7AdbGeWJjAAAA
X-Change-ID: 20241018-adau1373-shutdown-dc3d485a7d86
To: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>
CC: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Lars-Peter
 Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729518408; l=985;
 i=nuno.sa@analog.com; s=20231116; h=from:subject:message-id;
 bh=rDvs1CxqVAzeYVMSGhs2gik+4bnLUS6qsOMHn/0ea3o=;
 b=cWvhL9zypRmhbO4j1v1nMpS8xmH6o24HBpjj+InMDSu21EoPDulI6nhhQEF4jYAgtSaEnIsZL
 N+2N3VAzu2VCQTPeBC3LvsXsjyeHdBk4erZO6r62nKuNrS2YuftUuay
X-Developer-Key: i=nuno.sa@analog.com; a=ed25519;
 pk=3NQwYA013OUYZsmDFBf8rmyyr5iQlxV/9H4/Df83o1E=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: TDb83TFkCs9Lej6XcRfs1mdvG17ca_V4
X-Proofpoint-ORIG-GUID: TDb83TFkCs9Lej6XcRfs1mdvG17ca_V4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 mlxscore=0 suspectscore=0 clxscore=1011
 malwarescore=0 mlxlogscore=719 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210098

Main motivation for this was to just add support for a powerdown GPIO.
Then, I realized the driver was using platdata which is not being used by 
any platform. Hence, move to support FW properties and add bindings
docs.

---
Nuno Sa (4):
      ASoC: codecs: adau1373: add some kconfig text
      ASoC: dt-bindings: document the adau1373 Codec
      ASoC: codecs: adau1373: drop patform_data
      ASoC: codecs: adau1373: add powerdown gpio

 .../devicetree/bindings/sound/adi,adau1373.yaml    | 102 +++++++++++
 MAINTAINERS                                        |   1 +
 include/sound/adau1373.h                           |  33 ----
 sound/soc/codecs/Kconfig                           |   2 +-
 sound/soc/codecs/adau1373.c                        | 198 ++++++++++++++++-----
 5 files changed, 253 insertions(+), 83 deletions(-)
---
base-commit: cab655772416379a925af9ea85769a9d3eecdba0
change-id: 20241018-adau1373-shutdown-dc3d485a7d86
--

Thanks!
- Nuno Sá

