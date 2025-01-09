Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76965216E1B;
	Thu,  9 Jan 2025 10:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736420237; cv=none; b=cwCBJLNixZS7LUGjhtTVBSioq8AHCQHnvTnNtHMYaILPA8UE+Q2G5G6sIqDIykToeY9M7BYdYQ9gCKdkVbrYYkW2BgH8ga9Csp9by6e2ZR8AfcqldEvzUVc1kX96TqAIPUuC0aPkb60vnr6D2SZf/Zm8TG/xRU8bdLfnguWuxtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736420237; c=relaxed/simple;
	bh=DbzXDLPCkxWAp8BgvqnLqStT/P9ZxD2E3/wHBs78W7M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PgrW4osBF5RJfvPoq5mronDKlshhjwGrKQqORs1ZGt/Joe1roPZ2RxrD4lKGaWn33JTVrXkRbmKHXgxu/fRnFVNQLD+SnUAdyerkTmFdunGOpQ5xTXzRLwCwtJDuTPQn19BeZh7LjaVpEH8TIx+Cl/OE2E2KZZseULOA1orqRns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LQlBXNX+; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LQlBXNX+"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5096dfcd004283;
	Thu, 9 Jan 2025 04:57:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=q7nnLr7znGZOm3/x
	dScHwV9WtmbeNHQeMNTRfr7+o9U=; b=LQlBXNX+vvqOoz+NW3m/7QEMW9Ff9mlu
	jJ+d6ZftWAfdYyGNBnGtkdsAcs+uJ3ITlsihQEz6/Rw5zN06zaSXjsZiq9GzvhdJ
	0PqMN64VSZ+TLJiah9tAEWkET12JpQxfulb72npk86iR1Iye2k5SaZileNZ5cTfu
	hzglGp2A7mMGQI1/WHGUJfBt5/5U0HSieINVfqddvmS5qXY0hILwDFsEqCRUa76b
	AC7aYgH8jOx2nGPUBpJ8DKtLmmkd6ezBRb4xZvw6S82SiN3k7811knRAwexdGdK9
	7zAgNkqgVKhf+FJLBVaqntslza3aMqCmCdnw2wFInRkbPNkFYr3WoA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 43y392dt8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 04:57:03 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 9 Jan
 2025 10:57:01 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Thu, 9 Jan 2025 10:57:01 +0000
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com [198.61.68.170])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 87A1E820248;
	Thu,  9 Jan 2025 10:57:00 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-kernel@vger.kernel.org>, <linux-sound@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <sfr@canb.auug.org.au>, Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ALSA: doc: Add codecs/index.rst to top-level index
Date: Thu, 9 Jan 2025 10:56:57 +0000
Message-ID: <20250109105657.96860-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: tf7VfLH3Oc2lv5-LrWA7grGqiTTEJ4Vs
X-Proofpoint-ORIG-GUID: tf7VfLH3Oc2lv5-LrWA7grGqiTTEJ4Vs
X-Proofpoint-Spam-Reason: safe

commit 088fb4ee17fc ("ALSA: doc: cs35l56: Add information about
Cirrus Logic CS35L54/56/57") added a new subdirectory with an index
file, so this file must be added to the top-level index.

Fixes: 088fb4ee17fc ("ALSA: doc: cs35l56: Add information about Cirrus Logic CS35L54/56/57")
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 Documentation/sound/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/sound/index.rst b/Documentation/sound/index.rst
index c437f2a4bc85..51cd736f65b5 100644
--- a/Documentation/sound/index.rst
+++ b/Documentation/sound/index.rst
@@ -13,6 +13,7 @@ Sound Subsystem Documentation
    alsa-configuration
    hd-audio/index
    cards/index
+   codecs/index
    utimers
 
 .. only::  subproject and html
-- 
2.43.0

