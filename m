Received: from out28-218.mail.aliyun.com (out28-218.mail.aliyun.com [115.124.28.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AA418A6D2;
	Tue, 31 Dec 2024 12:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735649794; cv=none; b=MA3G0Fnuvq6s5SiSBrRHSCWZtbALMeAgKZTxGMVvMgZ7b8fzs3KjuH8/ccgy1SN0hhjAvV65PIEYEMOrgw2W/6EJ+3fwZLPS+2YJ5xPKp6tkLIJABXbmv4BFVyRfbPJ7pu04RC+8UDmRTKu+3WFqfMpEfF301J7WjPcKU+xa004=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735649794; c=relaxed/simple;
	bh=4wt8VL9amBHmI+/2IYc76qNjosOUc6rbGV+WO47DXHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NF45cgCRcN1af823qSyougCAFXXUJ6rJCPNI+CAY5QAyCfPHCmX2ZInXnqr4j+0fDFGjhzmowYuyanZgM/sf+Qh0GVPEFOvpjI9F4L0sHInlsPwQiqy+vh9+DdRsOw+RcUxe3ZkqvTF3E8vLTCsNKfpn/cPnQfHCR9OSnWvYW64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.asDhTeU_1735649771 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 31 Dec 2024 20:56:18 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	jack.yu@realtek.com,
	rf@opensource.cirrus.com,
	neil.armstrong@linaro.org,
	ivprusov@salutedevices.com,
	luca.ceresoli@bootlin.com,
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
Subject: [PATCH V4 0/2] ASoC: codecs: Add aw88083 amplifier driver
Date: Tue, 31 Dec 2024 20:56:08 +0800
Message-ID: <20241231125610.465614-1-wangweidong.a@awinic.com>
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

v3 -> v4: Modify the commit message

Weidong Wang (2):
  ASoC: dt-bindings: Add schema for "awinic,aw88083"
  ASoC: codecs: Add aw88083 amplifier driver

 .../bindings/sound/awinic,aw88395.yaml        |   2 +
 sound/soc/codecs/Kconfig                      |   2 +-
 sound/soc/codecs/aw88081.c                    | 333 +++++++++++++++---
 sound/soc/codecs/aw88081.h                    |  43 +++
 4 files changed, 323 insertions(+), 57 deletions(-)


base-commit: ccb98ccef0e543c2bd4ef1a72270461957f3d8d0
-- 
2.47.0

