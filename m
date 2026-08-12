Received: from mail-m49220.qiye.163.com (mail-m49220.qiye.163.com [45.254.49.220])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B051C8FB1
	for <linux-sound@vger.kernel.org>; Wed, 12 Aug 2026 07:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786518939; cv=none; b=UpB0X3uk/uwfx6MR+cGqNL9TKa0QdNaWprEvOv3xA52X/Yfl6PDgewAtooeXJySywoWfBAfUR2r8G752GvshKg/OpCqqT/k1HjmfoxIJS0LTI/Ac95N1yvDEQQXOLXyDTiUea86OskDCfh5Zp1XeNq2LBKrBwLvcrSIN5TiCJbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786518939; c=relaxed/simple;
	bh=OHUBRutQ8GAII1lRyxcW2X3Y5nU+MdDQQz+NHZr69Iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ed3Z/CFUsbJYUYsOc/EthRsNTisDwdodGk/uUGen2K0TBd1LDoaRtzfEl+ruzo/f25i4an+S+aAMsc2a1+rHVHR63ZHvUw0B89D3wYc89FEM7QoLNy4gZLg5NASoZ2vTUP0WD2xvGDIgKhVW0YmiGIJi8JQiN+RgrXAIq0cfuWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com; spf=pass smtp.mailfrom=senarytech.com; dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b=Ni0Rj7PV; arc=none smtp.client-ip=45.254.49.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=senarytech.com header.i=@senarytech.com header.b="Ni0Rj7PV"
Received: from localhost.localdomain (unknown [182.148.129.247])
	by smtp.qiye.163.com (Hmail) with ESMTP id 49b04579f;
	Wed, 12 Aug 2026 15:00:07 +0800 (GMT+08:00)
From: qianghua wang <qianghua.wang@senarytech.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	pierre-louis.bossart@linux.dev,
	yung-chuan.liao@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	cezary.rojewski@intel.com,
	bo.liu@senarytech.com,
	"qianghua.wang" <qianghua.wang@senarytech.com>
Subject: [PATCH 0/3] ASoC: add Senary SN624x SoundWire SDCA support
Date: Wed, 12 Aug 2026 14:59:41 +0800
Message-ID: <cover.1786511177.git.qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ff4c56ef409d8kunma462499a3e4f53
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZTEpLVkNOSxkfHkodS0lJSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKQ0lVSk9DVUpJQlVJT0xZV1kWGg8SFR0UWUFZT0tIVU
	pLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Ni0Rj7PVFoJILCiIB7n8d4KOw987KK6ceWgKiMSSMyA7otY1EwXO4Z8TMkwENXrjroJhv+v9c8TUAOQEtCcZr+v//XTcvnom2Yddp2J+u+30VOVENQ+0H9loT/7VAQOHnJuqffvDzNAmo6kTdqBR6kqS27CkSDeDnWH0dVDMs08=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=43u+7dPnrH3w+3xlaySnRxlMamHVtYdsil0bN71lDaw=;
	h=date:mime-version:subject:message-id:from;

From: "qianghua.wang" <qianghua.wang@senarytech.com>

This series adds SoundWire SDCA support for Senary SN624x
multi-function codecs (jack, speaker amp, DMIC) on Intel Panther Lake.

Compared with the previous combined submission:

1. ACPI match changes use the ASoC: Intel subject prefix (not ASoC: codecs).
2. MAINTAINERS only lists Senary-owned files (sn624x*, soc_sdw_senary*);
   soc-acpi-intel-*-match.c stays under INTEL ASoC DRIVERS.
3. Only PTL match entries are included for now (no ARL/LNL/MTL).

Patch summary:
  1/3  codec driver + MAINTAINERS
  2/3  sdw_utils helpers and codec_info
  3/3  Intel PTL ACPI match + SOF mach select

Validated on LG Wildcat Lake / PTL with part_id 0x6247
(MODALIAS sdw:m0496p6247v03c01).

qianghua.wang (3):
  ASoC: codecs: add SN624x SDCA SoundWire driver
  ASoC: sdw_utils: add Senary SN624x helpers and codec_info
  ASoC: Intel: soc-acpi: add SN624x entries for PTL

 MAINTAINERS                                   |    3 +
 include/sound/soc_sdw_utils.h                 |   20 +
 sound/soc/codecs/Kconfig                      |   12 +
 sound/soc/codecs/Makefile                     |    2 +
 sound/soc/codecs/sn624x-sdca-sdw.c            | 1873 +++++++++++++++++
 sound/soc/codecs/sn624x-sdca.h                |  144 ++
 sound/soc/intel/boards/Kconfig                |    1 +
 .../intel/common/soc-acpi-intel-ptl-match.c   |   81 +
 sound/soc/sdw_utils/Makefile                  |    4 +-
 sound/soc/sdw_utils/soc_sdw_senary_amp.c      |   80 +
 sound/soc/sdw_utils/soc_sdw_senary_dmic.c     |   49 +
 sound/soc/sdw_utils/soc_sdw_senary_sdca.c     |   63 +
 .../soc_sdw_senary_sdca_jack_common.c         |  197 ++
 sound/soc/sdw_utils/soc_sdw_utils.c           |  166 ++
 14 files changed, 2694 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/codecs/sn624x-sdca-sdw.c
 create mode 100644 sound/soc/codecs/sn624x-sdca.h
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_amp.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_dmic.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca.c
 create mode 100644 sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c

-- 
2.47.3

