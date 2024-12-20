Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB4AB22FDF7;
	Fri, 20 Dec 2024 17:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734716159; cv=none; b=l5+Jv8sh4WPciorr7upyP1qSC3swKo9WHDmmkjtIVZq3xzjjqfaXEt7rpDVkTDalc6fx1nhvIh10LP4TLGDlznsMf0OSTvoSCxn4h7woQmjt8+bS/TqiJs+ZkDFQqK2kV7LTcLN1TBwX1pK82ka5Kf675O0re3vlXk9L8Lb/tHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734716159; c=relaxed/simple;
	bh=GWnOkUmLTZNHE+/bXMWrp1MgkIeYWL2zroB6FZydnXo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Lg/uLxPF6FTgPY2w/kJlfwc++W6DF8MBRCNWXZMut0ZqOt8lhTGXlWaLPjdAblp/2WFZIKjS1yFIKOcQ2yVxixzljwLvelu5N/D0PTsjCJc5rUOfslXU/mwEB84m2M52UeVUd8RPJIQ6m7kUwqqF/HetLpsRc3YBGlwvjOApcXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Tn41P38J; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Tn41P38J"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK5g3sk016642;
	Fri, 20 Dec 2024 11:35:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=v832DBdzgsH24BAJ
	3ESwKsvTWps8z8nWhI0IDLOgsWY=; b=Tn41P38Jp1tNwU659HLtkUvLwK3dcaGT
	/rBgInzUGErXmrUOUCKm79YNuSCBtwtpSj612uNCCMtz3BpAA9sl6j9d1HMdNpcw
	0Zm+QdhVBsh5KuAe03SZ7zGNjTPUR3TECFisJqPwn7amwngwjIiQnGRjdx9Q2mxT
	Rn6HcHp5RqkxAVZtQpba7FiYmqxjEYhIizgSArBYDBq2IYF2OmaXuCGs2nWWF4a5
	IO2d1SwpC90caN5OiobqdM6cZEysV5djWRa/C5+v3e3DShmAUYfRHVNNcZaw+f0E
	YforVg55haAP0MXiB3bRWM8xJXuMQ4CH5D8teFZ0XYEsAb5fVLoACg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 43h7akg161-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 11:35:17 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Fri, 20 Dec
 2024 17:35:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Fri, 20 Dec 2024 17:35:16 +0000
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 17BEC820247;
	Fri, 20 Dec 2024 17:35:16 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <peter.ujfalusi@linux.intel.com>,
        <yung-chuan.liao@linux.intel.com>, <pierre-louis.bossart@linux.dev>,
        <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH 1/5] ASoC: SDCA: Add missing header includes
Date: Fri, 20 Dec 2024 17:35:12 +0000
Message-ID: <20241220173516.907406-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: KrWO0kQ1mFWqaWtkHXCl77LWA_kDjr2s
X-Proofpoint-ORIG-GUID: KrWO0kQ1mFWqaWtkHXCl77LWA_kDjr2s
X-Proofpoint-Spam-Reason: safe

Several of the SDCA files don't include all the headers they use
locally. These are included by the point of use through other
headers, so it is not currently causing any issues. However, files
should directly include things they directly use, so add the
missing header includes.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/sdca.h            | 3 +++
 include/sound/sdca_function.h   | 2 ++
 sound/soc/sdca/sdca_device.c    | 2 ++
 sound/soc/sdca/sdca_functions.c | 4 ++++
 4 files changed, 11 insertions(+)

diff --git a/include/sound/sdca.h b/include/sound/sdca.h
index 7e138229e8f3..3eea1dfec16c 100644
--- a/include/sound/sdca.h
+++ b/include/sound/sdca.h
@@ -9,6 +9,9 @@
 #ifndef __SDCA_H__
 #define __SDCA_H__
 
+#include <linux/types.h>
+#include <linux/kconfig.h>
+
 struct sdw_slave;
 
 #define SDCA_MAX_FUNCTION_COUNT 8
diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index a01eec86b9a6..6943df0851a9 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -9,6 +9,8 @@
 #ifndef __SDCA_FUNCTION_H__
 #define __SDCA_FUNCTION_H__
 
+#include <linux/bits.h>
+
 /*
  * SDCA Function Types from SDCA specification v1.0a Section 5.1.2
  * all Function types not described are reserved
diff --git a/sound/soc/sdca/sdca_device.c b/sound/soc/sdca/sdca_device.c
index 80d663777eb5..b6399b773986 100644
--- a/sound/soc/sdca/sdca_device.c
+++ b/sound/soc/sdca/sdca_device.c
@@ -7,6 +7,8 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/module.h>
+#include <linux/property.h>
 #include <linux/soundwire/sdw.h>
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 652865329968..1808e5e7dee2 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -7,7 +7,11 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/device.h>
+#include <linux/module.h>
+#include <linux/property.h>
 #include <linux/soundwire/sdw.h>
+#include <linux/types.h>
 #include <sound/sdca.h>
 #include <sound/sdca_function.h>
 
-- 
2.39.5

