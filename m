Received: from rtits2.realtek.com.tw (rtits2.realtek.com [211.75.126.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20691305067;
	Mon,  1 Dec 2025 10:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.75.126.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764586728; cv=none; b=MSdd/k8usGTYU8pRfWMltSRfPSeAdpm/CvawpETkzgG6lpkeH9Ffm7Ic2bj2ZUuYU7VKcCYDPFO613kO2Epkr//AePguSZak+ZRAgUkDxKT1ZcsN/tEFJeGDEql4o+ZmDcaQls/jnHKSU4ttMuOVh4zA8Bf9Xqf+SPo5yUBI02o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764586728; c=relaxed/simple;
	bh=8r2cz961nsC0cNe19rdESv9XFy7If29g71vEelE+Y/4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=DvT/A+WW5r4wP1RboRWXFT6YAPto9igXOO5/t9APrAuqrhgfnDGuGgEhtAseqcSpBzlLAuG9GslKKqRnSwi+NoXSSqmgwf1XIgPCxcZfhUPF3BUFgo9S5z31J69NEcB6Ap5cKbcQnFUkimvESyC4WiWHWtuLF3LHERpGTmT3Um8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com; spf=pass smtp.mailfrom=realtek.com; dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b=ExEQ3QTn; arc=none smtp.client-ip=211.75.126.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=realtek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=realtek.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=realtek.com header.i=@realtek.com header.b="ExEQ3QTn"
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5B1AvvZ832042567, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1764586677; bh=dhT0pZQ7+FUA2QobktyRUIDGF0JquEOJ7p/lovReEkk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	b=ExEQ3QTngGrackKUHi2U+YunbV+9cjHQHDYcavE9F9ZWAzhVmKlrgoHpag5buCK4S
	 i+M+sa22U5v3v/MlwEHkik4PLA0GyH25gjsbH11i+C/JnYtiynbyG5LtYvHAx58Ps5
	 DNyJVnIOaj/ZiGtAnUDS00FDVqnwjV+tX8wlvEroZWPTg1kjJ408FwnB2QTnf81e99
	 8WXzfEAbJ45P7gAmRM0hLCYYgtC3rq/TfV9VtA1LuWYzRn9iaIBCDqPRV2xc92l+8/
	 M/Y2elIpZBMpSzbGjCBDTYu7g1CCQcLZCh1aC9pCaHx6IlKwQew2oz3dIN3L4sXtzz
	 rFhBD2uXfC88A==
Received: from mail.realtek.com (rtkexhmbs04.realtek.com.tw[10.21.1.54])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5B1AvvZ832042567
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Dec 2025 18:57:57 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS04.realtek.com.tw (10.21.1.54) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Mon, 1 Dec 2025 18:57:57 +0800
Received: from sw-server.localdomain (172.24.54.4) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server id
 15.2.1544.27 via Frontend Transport; Mon, 1 Dec 2025 18:57:57 +0800
From: Oder Chiou <oder_chiou@realtek.com>
To: <cezary.rojewski@intel.com>, <broonie@kernel.org>, <lgirdwood@gmail.com>,
        <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <perex@perex.cz>, <linux-sound@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <flove@realtek.com>, <shumingf@realtek.com>, <jack.yu@realtek.com>,
        <derek.fang@realtek.com>, Oder Chiou <oder_chiou@realtek.com>
Subject: [PATCH v8 0/2] ASoC: rt5575: Add the codec driver for the ALC5575
Date: Mon, 1 Dec 2025 18:59:24 +0800
Message-ID: <20251201105926.1714341-1-oder_chiou@realtek.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Hi all,

This patch series adds support for the Realtek ALC5575 audio codec.

Changes in v8:
- Patch 1/2:
  - remove the variable rt5575_spi_ready
  - use the multiple compatible names to distinguish between w/wo flash
- Patch 2/2
  - add compatible enum "realtek,rt5575-with-spi"

Changes in v7:
- Patch 1/2:
  - add a caption for the tristates
  - remove the redundant enum of the SPI command
  - add the error log in the request firmware failure
  - change the function name rt5575_spi_fw_loaded to rt5575_fw_load_by_spi
  - minor fixes
- Patch 2/2
  - modify commit message
- Link to v7: https://lore.kernel.org/all/20251121084112.743518-1-oder_chiou@realtek.com/

Changes in v6:
- Patch 1/2:
  - modify commit message
  - add select SND_SOC_RT5575 to config SND_SOC_RT5575_SPI in the Kconfig
  - revise the boiler plate in the head of the file
  - sort the include files
  - use a structure to transfer the spi data
  - use the poll() related function instead the for-loop
  - revise the UUID to the private ID
  - minor fixes
- Patch 2/2
  - modify description
- Link to v6: https://lore.kernel.org/all/20251031073245.3629060-1-oder_chiou@realtek.com/

Changes in v2 to v5:
- Patch 1/2:
  - move the firmware to the subdirectory
  - remove the empty functions
  - remove the cache_type in the regmap_config
  - add the error log in the run firmware failure
- Patch 2/2:
  - nothing
- Link to v5: https://lore.kernel.org/all/20251015103404.3075684-1-oder_chiou@realtek.com/

Oder Chiou (2):
  ASoC: rt5575: Add the codec driver for the ALC5575
  ASoC: dt-bindings: realtek,rt5575: add bindings for ALC5575

 .../bindings/sound/realtek,rt5575.yaml        |  44 ++
 sound/soc/codecs/Kconfig                      |  10 +
 sound/soc/codecs/Makefile                     |   4 +
 sound/soc/codecs/rt5575-spi.c                 |  84 ++++
 sound/soc/codecs/rt5575-spi.h                 |  16 +
 sound/soc/codecs/rt5575.c                     | 375 ++++++++++++++++++
 sound/soc/codecs/rt5575.h                     |  54 +++
 7 files changed, 587 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt5575.yaml
 create mode 100644 sound/soc/codecs/rt5575-spi.c
 create mode 100644 sound/soc/codecs/rt5575-spi.h
 create mode 100644 sound/soc/codecs/rt5575.c
 create mode 100644 sound/soc/codecs/rt5575.h

-- 
2.52.0

