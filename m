Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99C91F37C4;
	Tue,  7 Jan 2025 15:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736264683; cv=none; b=iA2TAZ/3GRZ9R8ruOO7XVS/QP1DoYbf5tRDI+uJB/oOVCSVPS0BRYNFrbdt8wBsfptasYaKozV2w6uQlirsdLAKjN3CFcCx0KqYj1hBV/sQisW6rJxJOUJcCAW66cAfJPxE6QKO8BQdJ9o6wfBwS1RoXHVppZttteIS2/d5YdMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736264683; c=relaxed/simple;
	bh=kZQnrcWS1j5fg1HT7CO8zLayyLUTVStCKO43pwO9Viw=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZbNfjBGBAB+pxV6hbbqI7ONwotOS96ksfIiCYohSZheYkDLTVzMFyv3/w/CojLu2hFQi+CizLBNzptbjhD5QAOeYxWWVeniY+Lhh3EMdD1QnCJ8H+pys5T0gag1RaaKkOTw0ASHNpZHfZFW9hoCCl7gDkG/ztN8Y1SaWg3qc1Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=KdO06gK2; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="KdO06gK2"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5076siUu007030;
	Tue, 7 Jan 2025 09:44:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=4dAgZIidT2yReTXh
	ghcsdm8ztiR0fHG583aOUAYS39k=; b=KdO06gK2Dn841eVP2Kr7KjZjTpPSiK9O
	aXQVzF8i9xhO3jEiB9WNtWGSrKiMvsJnZrOiHTQuodK4OLTuq+0Ny0Cqrm/SBxJY
	0BTTUDfeLpgG7xutmZphgPzO1SW+/MJa/LULfSx9w6M1KimpfpSIIYHffnBgxw2h
	8pYhIN6aJJLGfL/f81LoDyBqbeCgU12VxD+MtaICj9rVSwbNu2d8m+yrVAqwjjXz
	yQoz0afMyq+sT5gsGDbJ5+M5wv5xwBbtI3REJNoGQ8Tnwfxf7Xc+04AOzrkU3orx
	h6DpZru2h+soqxB1ESiJFoXfHt8x86kb9eXxZ9+NVGPQPHf94Sk6kQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43y29kbjaq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jan 2025 09:44:10 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 7 Jan
 2025 15:44:08 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Tue, 7 Jan 2025 15:44:08 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id D706B820248;
	Tue,  7 Jan 2025 15:44:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <vkoul@kernel.org>, <oder_chiou@realtek.com>
CC: <jack.yu@realtek.com>, <shumingf@realtek.com>, <lgirdwood@gmail.com>,
        <peter.ujfalusi@linux.intel.com>, <yung-chuan.liao@linux.intel.com>,
        <sanyog.r.kale@intel.com>, <pierre-louis.bossart@linux.dev>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v2 0/6] Expand SoundWire MBQ register map support
Date: Tue, 7 Jan 2025 15:44:02 +0000
Message-ID: <20250107154408.814455-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: VRTYiC4hWGnkjf-gV39TuHGhS4YUQgzz
X-Proofpoint-GUID: VRTYiC4hWGnkjf-gV39TuHGhS4YUQgzz
X-Proofpoint-Spam-Reason: safe

The current SDCA MBQ (Multi-Byte Quantities) register map only
supports 16-bit types, add support for more sizes and then update
the rt722 driver to use the new support. We also add support for
the deferring feature of MBQs to allow hardware to indicate it is
not currently ready to service a read/write.

Afraid I don't have hardware to test the rt722 change so it is
only build tested, but I thought it good to include a change to
demonstrate the new features in use.

Changes since v1:
 - Fixed a potentially uninitialised variable.
 - Added some extra rt722 registers, Shuming Fan asked for.

Thanks,
Charles

Charles Keepax (6):
  soundwire: SDCA: Add additional SDCA address macros
  ASoC: SDCA: Update list of entity_0 controls
  regmap: sdw-mbq: Add support for further MBQ register sizes
  regmap: sdw-mbq: Add support for SDCA deferred controls
  ASoC: rt722-sdca: Add some missing readable registers
  ASoC: rt722-sdca: Make use of new expanded MBQ regmap

 drivers/base/regmap/regmap-sdw-mbq.c    | 219 +++++++++++++++++++++---
 include/linux/regmap.h                  |  62 ++++++-
 include/linux/soundwire/sdw_registers.h |  30 +++-
 include/sound/sdca_function.h           |  33 +++-
 sound/soc/codecs/rt722-sdca-sdw.c       | 128 ++++++++------
 sound/soc/codecs/rt722-sdca-sdw.h       |  99 ++++++-----
 sound/soc/codecs/rt722-sdca.c           | 135 ++++-----------
 sound/soc/codecs/rt722-sdca.h           |   4 +-
 8 files changed, 454 insertions(+), 256 deletions(-)

-- 
2.39.5

