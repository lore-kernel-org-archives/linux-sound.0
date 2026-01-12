Received: from mg.richtek.com (mg.richtek.com [220.130.44.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2DB2222C4;
	Mon, 12 Jan 2026 01:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.130.44.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768181283; cv=none; b=nUVxKpwCvTIoMjIyuH3H2NZL5GZAQM/IPP0f1Grlg86TtrOnz1e6+9NELZ4U+yn18YAvp9Hilc2khpXJh3BJAmUoAQKF07yVw3RKg2nywdfVIA4uTuMUzH5+U8U9OA0ePzwn7VbUDeDN8af8rzkTWJI+EAx8VdaGua3+0afHP4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768181283; c=relaxed/simple;
	bh=Wg4wkBT/js0WaeJs3ZBDgQXges2FzKTQWIBLGsRt1FE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=b5XHXIFCUzMVZz2htYFcfwbvCk8jSj7c3uQdnS6qHhlEM8WbhrfPevJ0KhyIuK4WN9f8q33C7GFMB4VZI3+K5+4m0YTHLOw0SjfowFuJykTuv4rLS9P4mFiZnTHQS+LGdRmpdTMdH24G/0+LdaqyRdX338FOnRAU5xZhMn4YUm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com; spf=pass smtp.mailfrom=richtek.com; dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b=ypc9hxce; arc=none smtp.client-ip=220.130.44.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=richtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=richtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=richtek.com header.i=@richtek.com header.b="ypc9hxce"
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1768181274;
	bh=SXZw86rvTkxXSjfCndhdnzqknSWDclf7M8wNf6bbH+c=; l=651;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=ypc9hxcegkz9ZpqwJlv5a3+hKvgJXf9RubQ6XK9lvmUkkRCxrVjZJpz8fhjU7hcAN
	 4cUYX7vfZ1l3JuaINbqbSV5tTvwBGjjgOl52MnZp2k07fps7GXUMklLzMytaUYmNum
	 EPvfLGrxm5IXPqvimqeAeUsc+B3UaLQDksuPFB2HdEmW1Bn+0sc43+8uIDlAxN6lF2
	 8aEbbSjsij/bKOsPCghcBx0t5RaHQeVPyW5FZzWBj002STH2ULVAiCPv5hvSnvIUvX
	 KaQx9F+65Ohyo/Ynst3877xcfPsk66yxvuvvmX5svI3MskFaAEFRSJZDiUpnxFnAgv
	 39NFsaJeZSphQ==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(2572468:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Mon, 12 Jan 2026 09:27:39 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.26; Mon, 12 Jan
 2026 09:27:38 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1748.26 via Frontend
 Transport; Mon, 12 Jan 2026 09:27:38 +0800
From: <cy_huang@richtek.com>
To: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Liam
 Girdwood" <lgirdwood@gmail.com>, ChiYuan Huang <cy_huang@richtek.com>,
	<musk_wang@richtek.com>, <roy_chiu@richtek.com>, <allen_lin@richtek.com>,
	<devicetree@vger.kernel.org>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/3] ASoC: Update rtq9128 document and source file
Date: Mon, 12 Jan 2026 09:27:31 +0800
Message-ID: <cover.1768180827.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: ChiYuan Huang <cy_huang@richtek.com>

This patch series include two parts
- Update initial setting for rtq9128 specific feature
- Add rtq9154 backward compatible with rtq9128

v2
- Fix commit message typo

ChiYuan Huang (3):
  ASoC: codecs: rtq9128: Modify the chip initial setting
  dt-bindings: sound: rtq9128: Add rtq9154 backward compatible
  ASoC: codecs: rtq9128: Add compatible changes for rtq9154

 .../bindings/sound/richtek,rtq9128.yaml       |  12 +-
 sound/soc/codecs/rtq9128.c                    | 114 ++++++++++++++++--
 2 files changed, 117 insertions(+), 9 deletions(-)


base-commit: f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
-- 
2.34.1

