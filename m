Received: from out28-193.mail.aliyun.com (out28-193.mail.aliyun.com [115.124.28.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994801E47B6;
	Thu, 19 Dec 2024 12:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734611783; cv=none; b=qr1icpjy7pd8Rd1pcFGmZ7+uz54TQTMwr7oVSqcZ/heLTASrf0z/vPo3NIs1SmdtVMIua6qUsFpRh5tmtUlPJiBgdZieRJ+rutBgkvh+x1q7RPEsjF4IJ0/FURSfIa4ARJIhLRisOeo97mWJAe6Z9a1xuReKt1rnkXueXFhHOS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734611783; c=relaxed/simple;
	bh=xmv9CQmavOXpaSCMd6QFskdr9sZzGVVVz9i4j/Yxf40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dC6ARcfH+L5DO8CaP83stYA88A8hZpEZCUYlrOVa08840anXbgfcC4GuHYpmuDJxWPSp2rOJUrR0UaVBRha4lZauPZOm7GUEtPiSX2dGEE+NUNPwNlvIuntpASX1x+Tt7Vv+My/eP+vmc7F3R+2K3ZyvOGiRDhMx5ZsHnG5LqTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.ai3.2kt_1734611449 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 19 Dec 2024 20:30:55 +0800
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
	zhoubinbin@loongson.cn,
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
Subject: [PATCH V2 0/2] ASoC: codecs: Add aw88083 amplifier driver
Date: Thu, 19 Dec 2024 20:30:44 +0800
Message-ID: <20241219123047.33330-1-wangweidong.a@awinic.com>
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

v1 -> v2: Use "switch" instead of "if else" to distinguish devices

Weidong Wang (2):
  ASoC: dt-bindings: Add schema for "awinic,aw88083"
  ASoC: codecs: Add aw88083 amplifier driver

 .../bindings/sound/awinic,aw88395.yaml        |   2 +
 sound/soc/codecs/Kconfig                      |   2 +-
 sound/soc/codecs/aw88081.c                    | 344 ++++++++++++++----
 sound/soc/codecs/aw88081.h                    |  43 +++
 4 files changed, 328 insertions(+), 63 deletions(-)


base-commit: eabcdba3ad4098460a376538df2ae36500223c1e
-- 
2.47.0

