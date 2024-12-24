Received: from out28-76.mail.aliyun.com (out28-76.mail.aliyun.com [115.124.28.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CA43166;
	Tue, 24 Dec 2024 03:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735010366; cv=none; b=byUsMt6xwXGpYqj5B6+Ynt/vRvBvpTv26SDOAssAaWvcNYh+ZI65ZjxnppieaCARuF5tVMEjefXBdRD6S1Tm1vl5eFBGg/UsFESdwnAVkI42PETvuq9gRH+uVMmogi0wOdVpz3rH5LMBNAFFRwV48fjlh6ixVvDAdEOLKaNo81Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735010366; c=relaxed/simple;
	bh=kFzYWGvNuH62cBmZzCb7ubi42H27Y13gmSyHNMj1/4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WVqjNVSjpzJdm41pM46tywPc22ysGij/2tDx+EBO9q1D8Ua+cxaXaj5y+/BRqEt00Me9VDTvLwixaJgwBhaF/8jModlcEvFJ+q1h6MXTiRQCZotA2oTzqObJJLAApkPr3CCN04M7rPJaJc3POwh/DrW7T4dkueH1jope1Zwuaho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.alWru9m_1735010338 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 24 Dec 2024 11:19:04 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ivprusov@salutedevices.com,
	neil.armstrong@linaro.org,
	jack.yu@realtek.com,
	rf@opensource.cirrus.com,
	luca.ceresoli@bootlin.com,
	quic_pkumpatl@quicinc.com,
	herve.codina@bootlin.com,
	masahiroy@kernel.org,
	nuno.sa@analog.com,
	wangweidong.a@awinic.com,
	yesanishhere@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: yijiangtao@awinic.com
Subject: [PATCH V3 0/2] ASoC: codecs: Add aw88083 amplifier driver
Date: Tue, 24 Dec 2024 11:18:21 +0800
Message-ID: <20241224031823.363777-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Weidong Wang <wangweidong.a@awinic.com>

Add the awinic,aw88083 property to support the aw88083 chip.

The driver is for amplifiers aw88083 of Awinic Technology
Corporation. The AW88083 is an intelligent digital audio
amplifier with low noise.

v2 -> v3: Modify function formal parameter type error

Weidong Wang (2):
  ASoC: dt-bindings: Add schema for "awinic,aw88083"
  ASoC: codecs: Add aw88083 amplifier driver

 .../bindings/sound/awinic,aw88395.yaml        |   2 +
 sound/soc/codecs/Kconfig                      |   2 +-
 sound/soc/codecs/aw88081.c                    | 333 +++++++++++++++---
 sound/soc/codecs/aw88081.h                    |  43 +++
 4 files changed, 323 insertions(+), 57 deletions(-)


base-commit: f07044dd0df0c9d0ad177c3098b62ccddb735a2d
-- 
2.47.0

