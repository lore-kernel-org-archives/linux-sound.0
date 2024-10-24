Received: from out198-26.us.a.mail.aliyun.com (out198-26.us.a.mail.aliyun.com [47.90.198.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DCF1B4F32;
	Thu, 24 Oct 2024 09:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729760634; cv=none; b=l9HhB9alCd4Ob8DEv07DlldNelQhIEQUtJXkoTjprwMWMMXHotet7p/GIX5kKhY7GPuscBstzzUBTdjIphJ7CNF4JZuQj4L4g6etFDCyHDZp3Gq1wqXI745g9NksRqLNi9zSKy4W4gEEqftlnjid4XOI0ql431zuhZKAIy6py3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729760634; c=relaxed/simple;
	bh=Mio5m8DqUhJwOfgpWbjqiiGom/IeRSKtu2AJkhAcOmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r+UceYnjsYipuMuBLHNlOM0QwZBAHwfJXlJhyOkBUbt2L3xM1KY65nchYBJtfQzzrZ2fZ6NfyaOIrDC+GlNj6AcuQOFknw8eu3MJHOzgxY5+t+x67H56zT+//6vqwW+QCd/x4X/eV3jdLTjfgKboJ+YM6oF59TkNJdhkAldwy+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=47.90.198.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.ZrObrhz_1729760609 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 24 Oct 2024 17:03:35 +0800
From: wangweidong.a@awinic.com
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	pierre-louis.bossart@linux.dev,
	neil.armstrong@linaro.org,
	rf@opensource.cirrus.com,
	arnd@arndb.de,
	wangweidong.a@awinic.com,
	luca.ceresoli@bootlin.com,
	quic_pkumpatl@quicinc.com,
	herve.codina@bootlin.com,
	masahiroy@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: yijiangtao@awinic.com
Subject: [PATCH V2 0/2] ASoC: codecs: Add aw88081 amplifier driver
Date: Thu, 24 Oct 2024 17:03:22 +0800
Message-ID: <20241024090324.131731-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Weidong Wang <wangweidong.a@awinic.com>

Add the awinic,aw88081 property to support the aw88081 chip.

The driver is for amplifiers aw88081 of Awinic Technology
Corporation. The awinic AW88081 is an I2S/TDM input,
high efficiency digital Smart K audio amplifier

v1 -> v2: Modify the order of properties under the compatible node
            in the awinic,aw88395.yaml file
          Modify the commit message of the awinic,aw88395.yaml file
          Move "struct aw88081" into .c files
          Changing the order of header files
          Using return 0 as a function return value
          Modifying strscpy usage
          Delete useless variable assignments
          Modify dev_err_probe usage

Weidong Wang (2):
  ASoC: dt-bindings: Add schema for "awinic,aw88081"
  ASoC: codecs: Add aw88081 amplifier driver

 .../bindings/sound/awinic,aw88395.yaml        |    4 +-
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/aw88081.c                    | 1087 +++++++++++++++++
 sound/soc/codecs/aw88081.h                    |  286 +++++
 5 files changed, 1390 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/codecs/aw88081.c
 create mode 100644 sound/soc/codecs/aw88081.h


base-commit: c2ee9f594da826bea183ed14f2cc029c719bf4da
-- 
2.47.0

