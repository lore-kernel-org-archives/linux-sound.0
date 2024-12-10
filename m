Received: from out198-16.us.a.mail.aliyun.com (out198-16.us.a.mail.aliyun.com [47.90.198.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA0A230D1A;
	Tue, 10 Dec 2024 09:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733821889; cv=none; b=al2+BeB764LCecPqje0clG068uHmoNarDoApccznCrA5PoAV5PqTDMmj1tg6Culg5qLAnUDj+SqP4Oczu3/V0z3946/C8Cu9ElOqDOWQtPf42ZQd3YWiIxKeEei/19CfrnbW265gi0NGt0Q+xEX6p7cCjwmBPKkL2yGpPg2wGEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733821889; c=relaxed/simple;
	bh=SI4kyX5lQwa5B5RspyVcIXsS7JFL2r+mg4Y0rcujyN4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QuQjriXyTqsknxVfbs72BWhnzd9k7GFdOB+gB4L66eTqsHTR3BEkX26wsXH2dFwOzDF1V9tAUFEC6BQ73KjhZtj2bo3zgB2Lrvv2Ht8GXNY/JvZ25svm0oN75oczwwE1zsRXa5R+fJQE0OYle1h13HVb2EdUPlrfwqtOX0JN+2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=47.90.198.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.aaFUBjY_1733821857 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 10 Dec 2024 17:11:04 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	rf@opensource.cirrus.com,
	jack.yu@realtek.com,
	neil.armstrong@linaro.org,
	ivprusov@salutedevices.com,
	zhoubinbin@loongson.cn,
	wangweidong.a@awinic.com,
	quic_pkumpatl@quicinc.com,
	herve.codina@bootlin.com,
	masahiroy@kernel.org,
	nuno.sa@analog.com,
	yesanishhere@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: yijiangtao@awinic.com
Subject: [PATCH V1 0/2] ASoC: codecs: Add aw88083 amplifier driver
Date: Tue, 10 Dec 2024 17:10:52 +0800
Message-ID: <20241210091054.88779-1-wangweidong.a@awinic.com>
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

Weidong Wang (2):
  ASoC: dt-bindings: Add schema for "awinic,aw88083"
  ASoC: codecs: Add aw88083 amplifier driver

 .../bindings/sound/awinic,aw88395.yaml        |   2 +
 sound/soc/codecs/Kconfig                      |   2 +-
 sound/soc/codecs/aw88081.c                    | 230 ++++++++++++------
 sound/soc/codecs/aw88081.h                    |  43 ++++
 4 files changed, 207 insertions(+), 70 deletions(-)


base-commit: 7cb1b466315004af98f6ba6c2546bb713ca3c237
-- 
2.47.0

