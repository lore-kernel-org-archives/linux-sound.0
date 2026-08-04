Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A823B4534A3
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842132; cv=fail; b=fj11bMzBFo4g25Msqyf+RrU3rd5ZnNTpRLEKjTxZQvZhjpvXknJDnl5y1xnR97+Z7IJM4d1zCWi43Qu4PqULSMdmJmAOBFe3YFVu0WpIC2+x+8iIA4idoUOdH3qHkhwwVv53BfeaYVC+bjw6xiqhPcPNIOzvOq0FrbaCw9+zFxU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842132; c=relaxed/simple;
	bh=4NYyUZrcow8OMDPMfiibfmlsTjfxCyiDPnRybCtKhpA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=e+NIhI0zZ+wqdHHMEDwfTWUhaaSQjyTyityQfgTAx+ZigNOXzpceX7xt39Hof1KBKkdRGKfQDVfqOijvhQQ9z+sbEQcKcDWOzB59CteDWQp7oplXE5ZhqRM7+sb0XS4auBezzjrA8jnCyJkvZtTiq3NL4ua/M7t4G4uDWADNNi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=Dpktf9ut; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=rpPjEbFT; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="Dpktf9ut";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="rpPjEbFT"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67493fqh2193504;
	Tue, 4 Aug 2026 06:15:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=4TIqTKIZK656P
	WjK9OCDNtdqm6RJWFAxRa+D9VM2mNY=; b=Dpktf9uthwIom2KLJjmEDC38+IKMx
	E797YplYR2h2BLwtmXUdMgKJldqjKoPcr8CmWsJ2fB6HWBdpX/GukYF/9atjeBVK
	bIWGkReDKR3131wANAiTw1cA/JQa4vrZRqy5O2aJEmTKUySbaOZuDTXLji/YC/yT
	MhrQnu90uAJkoxwxCienYNIP+GVe6Wq6UhHNGhYo4uhMUKRGlLYsFauUFBcUV2N6
	vw09EYvdH28RkwCGmCyrPvR3259v7Al2SOxm5k2dkTf2+lpV1LaYfTe54lPxPyhr
	odawxdIDIoTTtC07bmYj6S+Ikb70cILvyB9uvloVl3ph8PE/aA4eqXVlQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010043.outbound.protection.outlook.com [52.101.56.43])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fud498n7e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 06:15:02 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WuWMvxxrClhJ5CcdfLoRAICTufmOKfl/Cwf1tIUOiLUrXdCYv/dal409qyUaGLwepjXqpLdFqNXWOUNipyc+TW1ySC1i6TB1gDP8GmZMsOt6fup/oV2kRvbTk3CTVu6zTocH7ht3rnYdgnbFwkXA4ccsGb1vs0bwnQEycPzS0Gx0fv/F94qAdpBpXRiEP/iZ23OU+4iad5WbbJ/s1JPGBCybA/2AYhQuDGuC8BrppN8EiBeR06gmH2oB/CfvACr86Z5f55I63i9dpyY4sAf76dZXoQhcHCn6mGTugff/1QjnnYUosno5ojQpQbsSw/NshHysktKWtJNji+ukSgSiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4TIqTKIZK656PWjK9OCDNtdqm6RJWFAxRa+D9VM2mNY=;
 b=EgNOFNzR0M9LNmUNdtkifz2er0lEhN0qtRSfoPXajRgnEsfos+Ti5zgwf7UT9Q3PNFcn02kEk+BFfl26z73tuwISnyRsBkWeTtvkqqhwnNRq59c2DiJRFPRFz0MeN0NKeo9tjnXwVvliCVmjjcUv6nJF+k1PcJQJiA037WJkdbbFv0jXr8fmkwJWvC6WNiOGvmvtVfYM+qCCJ6liqOZ3RWV3H929zOqyLIKqmDxsoh0kYf+pRc1IA86Q2l4drqM52STf+bsZv9evFclJFzoD59pat7TS8zuz10YQbb0d6LnrxzoNCa3NL55+kHjnquJvgNtzpklh9e1W1Yk51h4b1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4TIqTKIZK656PWjK9OCDNtdqm6RJWFAxRa+D9VM2mNY=;
 b=rpPjEbFT8Wg+R7mrzmyB6pL6v4Y8wjifDGtddyG1NSDC8ryFEiRvwLiZuNCOshPw+kiKeufgOxr8v8tRL5roOdWziO3OKJorhLD88Hr+F2fQ9LGUsHnLtCjIO6Q+LuA39Cyj819VUSdzww7T2bWXlfSAeITD/HgoaIuvQwB9PzI=
Received: from CH5PR02CA0015.namprd02.prod.outlook.com (2603:10b6:610:1ed::9)
 by DM3PPF1F8A3E3BF.namprd10.prod.outlook.com (2603:10b6:f:fc00::c11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 11:14:55 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::5c) by CH5PR02CA0015.outlook.office365.com
 (2603:10b6:610:1ed::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 11:14:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 11:14:54 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 06:14:42 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 06:14:42 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 06:14:42 -0500
Received: from LT5CG31242FY.dhcp.ti.com ([10.250.160.253])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 674BEaOv3578580;
	Tue, 4 Aug 2026 06:14:37 -0500
From: Shenghao Ding <shenghao-ding@ti.com>
To: <broonie@kernel.org>
CC: <tiwai@suse.de>, <13916275206@139.com>, <perex@perex.cz>,
        <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <baojun.xu@ti.com>, <k-lu@ti.com>,
        Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH v2] ASoC: tas2781: add capture_profile_id field and update the tuning_switch function
Date: Tue, 4 Aug 2026 19:14:33 +0800
Message-ID: <20260804111433.1148-1-shenghao-ding@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|DM3PPF1F8A3E3BF:EE_
X-MS-Office365-Filtering-Correlation-Id: ff3225a1-666d-4a5a-8748-08def2199c34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|56012099006|10067099003|3023799007|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gJ/3GtHEgzSD0zEXCEVXfA0NS/lTG/w2b3DdxcVWERq+Dyfekynr8zPKUO5G4t1qK5bkyGdKRxUm84jgKpX+whM/CFdbmgYvj8LhorOsefr4YtDk1uM9nCNG/fToYirwmWRIwceXKo7M7a52WDABMzVGywTCITEGbdccXIVKBCGXf9SnTp1TeaIWVColreA4wMqBUh7brzG+mFreejc//Bxy6yrD3/JUtakRvpCr2ScXQG3Sd/U5BmjTyXApHc1ZtzEAr60p0epLWva5J7z49gOir8suj3Tn0EcmyiTzL/465QZ0uLZR2IC7xP83YnWvyiuuEv+pBzTox6YsWGoMXfiIHGRoAXhaiNvNB2GsFBrvH1wOfaFVi75PeswlIVLd+a7x4yGXifn2W9kJpygQJHTibjsf1vJ5079eajYKQctylyF9n2lPRiSYUo+IPcKUUBBfjXLQglOLmBIysoO5kxAz9MBz6+viFvYwgFRjXP8sIcQjMCLAkzWL7OjRnHRh2Q7GO7/bpK9LNN+FsKalGNreNnKpFxQotIrb8No7CXEIFHIayqfDFVt5p/qobys0/fAJwOQmUC/SdGxpp+xrkxg+mMgGVwe0TGWz/pZWpoYAftoXtQTjuvoZr+Bkx0xzt4ZbGfiHY/ZHw2S4SfKQ9cGzHq9nwyFkyKD6DVUDGzMCQ+mRyVkIjKB23k7hVgSl0BNIFm0k+9JyfONLL3Q4yA==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(56012099006)(10067099003)(3023799007)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VFJTmRlhIvS8Yi8+75Kn4zTPLYqHJn1zqMKviWp96O0sFNfJcRry5mmxsrBzuwanaI1mynF9209rZKHBAEsmmQBZQPh4yb3ZMZ7wYC11X3R4Ubb4rywb/xfNi/Zj5lZOQ7oo3icpF3099Anr1odFL3gY4mf7Aozf5NV9gvSTxSa9TbAPQ/fRok4NANh44pYEI/o7w6NGwnMLCzlyYZ747Ja+h0g+wDM4A7zcSZ5Wvkcw5i825nCEMYcHr0fYWwtSJ6QsRAyPYO8TVG7Lsl6b5v+v8ezBG4JqS7iGk1XnaK+bGVJuunmVdrf8TZhB/zaAKIldLJmTKypk4+ZC5kloHaZtz+eIBZITwa3b2ZhqkGN8yH905kNQl6PVwID1Mac73xgBwuSw6Cgum8M1wTsOfOd0KQ2a6Uw3UfFcfTmdPKLAFTcQy1bTWs6eq9irQ07m
X-Exchange-RoutingPolicyChecked:
	kAKefBni/oszN+uH52oT14xP/JUQRg40pCEHwmeYKHR2mKvP61ThQ8MD1nDea3gDj/8WTCSMLzDa8UUu86qEFWr3+itZYX8qKXcjggZ/Ybj3748ikdxOAZwUxIazJoEWPzuUyFt4vtj0SOwC/bcFWKdavI2QzoUEWxgOXbxbkUTSs5tc3UlmBJ/AHFqGHNJR80KuVmLrGHqEyoKx7XQuSkXRjynZYJ0wlemECJ5hHIHd/00UbfV8kRSzTryTxA5m/1+lM1R2+ych8PzG93vbhg4i92IlYC41t+dtQbqypY/Uy6g8jWXrz/N5XSdUuzcagnCrEhPbbuSibhledkzmbQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 11:14:54.1000
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3225a1-666d-4a5a-8748-08def2199c34
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF1F8A3E3BF
X-Proofpoint-GUID: Q9heEZ58tI-LAcE6cDSB39PoL1W_bRJP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDA4OSBTYWx0ZWRfXz1RlsPmDuZRU
 QCe8uNSdF/Zci9D9FOR5YlGnYv/czU6cnEDb0v1tltrWdnsMq/58YYWnXEufdM5AwSXzLTgDiLR
 t2Z67J4Hf1YW7/pxXYHTvI73SgcLv2tvYWK3Q2rsCVzddsiohX/IbnkshqjQqlsn71S3nBTVePH
 Kp6Vac1tmNLjGMd41tWXGqKXlKlfAj0qwMof4KzevpXND4PCEVA94vB/RHeVM1lhKnDWlYLH6h1
 zLH4E0M6szKvjNqvabp9t2Bw69yQwBRwmsFKLB7dU1hNrYLM87maQKtOfWSDw9EoTlSnwNQubTD
 dMoN+QJ+hq2kcCL3ZgX/3Fu5av+GtQeOZRu8WLX/GWgA1kLMDaYVMwTWFPGc4bctzcaLVoM2cpX
 gkh+q3Tb0VoTvaSmJZBDgVW0fiQql8T4lTGDN4Ibc85uP6XCxuAd6tqO65Ggzuy3kOofSm/uNfF
 Qch3FvaklV6uTPL81Ow==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDA4OSBTYWx0ZWRfX5neQkgga9CnP
 ntQzb3sPDT091U/y2tcZc+1YPpA2fEmZVBYkRZ3kKrnl3JdaGvDeIQmg432Oj6mTkEYUZ3xzf/e
 uGPQlIK4OIqCxY0v9WED9LFpEY3Jjgc=
X-Authority-Analysis: v=2.4 cv=XKMAjwhE c=1 sm=1 tr=0 ts=6a71c9b6 cx=c_pps
 a=vO6zNWk7R+xgFy8KGItNOQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22
 a=sozttTNsAAAA:8 a=FBde-OOVe1iwIRc02MgA:9
X-Proofpoint-ORIG-GUID: Q9heEZ58tI-LAcE6cDSB39PoL1W_bRJP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_02,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040089

Currently, the TAS2781 SmartAMP driver uses the same profile ID for both
playback and capture scenarios (e.g., PDM microphone recording or IV data
capture). This makes it impossible to apply different DSP configurations
for capture and playback, which is required in real-world tuning and
production use cases. With these changes, capture and playback paths now
use their own DSP profiles, improving tuning flexibility and avoiding
unintended profile conflicts between SmartAMP capture and playback
scenarios.

Signed-off-by: Shenghao Ding <shenghao-ding@ti.com>

---
v2:
 - Update the git commit diff to include changes for both the header file
   and all modified source C files, instead of only touching the header.
 - Add missing userspace input validation for profile control.
---
 include/sound/tas2781-dsp.h                   |   7 +-
 .../hda/codecs/side-codecs/tas2781_hda_i2c.c  |  10 +-
 .../hda/codecs/side-codecs/tas2781_hda_spi.c  |  12 +-
 sound/soc/codecs/tas2781-fmwlib.c             |   6 +-
 sound/soc/codecs/tas2781-i2c.c                | 133 +++++++++++++++++-
 5 files changed, 151 insertions(+), 17 deletions(-)

diff --git a/include/sound/tas2781-dsp.h b/include/sound/tas2781-dsp.h
index dd6ee45ad096..e845687decf9 100644
--- a/include/sound/tas2781-dsp.h
+++ b/include/sound/tas2781-dsp.h
@@ -201,6 +201,11 @@ struct tasdevice_rca {
 	int ncfgs;
 	struct tasdevice_config_info **cfg_info;
 	int profile_cfg_id;
+	/*
+	 * Used among SmartAMP for PDM microphone recording or IV data
+	 * capture.
+	 */
+	int capture_profile_id;
 	/*
 	 * Since version 0x105, the keyword 'init' was introduced into the
 	 * profile, which is used for chip initialization, particularly to
@@ -222,7 +227,7 @@ void tasdevice_calbin_remove(void *context);
 int tasdevice_select_tuningprm_cfg(void *context, int prm,
 	int cfg_no, int rca_conf_no);
 int tasdevice_prmg_load(void *context, int prm_no);
-void tasdevice_tuning_switch(void *context, int state);
+void tasdevice_tuning_switch(void *context, int state, bool is_cap);
 int tas2781_load_calibration(void *context, char *file_name,
 	unsigned short i);
 
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
index 624db967f17b..8b08b35b1dde 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_i2c.c
@@ -173,13 +173,13 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 	case HDA_GEN_PCM_ACT_OPEN:
 		pm_runtime_get_sync(dev);
 		scoped_guard(mutex, &tas_hda->priv->codec_lock) {
-			tasdevice_tuning_switch(tas_hda->priv, 0);
+			tasdevice_tuning_switch(tas_hda->priv, 0, false);
 			tas_hda->priv->playback_started = true;
 		}
 		break;
 	case HDA_GEN_PCM_ACT_CLOSE:
 		scoped_guard(mutex, &tas_hda->priv->codec_lock) {
-			tasdevice_tuning_switch(tas_hda->priv, 1);
+			tasdevice_tuning_switch(tas_hda->priv, 1, false);
 			tas_hda->priv->playback_started = false;
 		}
 
@@ -722,7 +722,7 @@ static int tas2781_runtime_suspend(struct device *dev)
 	 * Stop the playback if it's unused.
 	 */
 	if (tas_hda->priv->playback_started) {
-		tasdevice_tuning_switch(tas_hda->priv, 1);
+		tasdevice_tuning_switch(tas_hda->priv, 1, false);
 		tas_hda->priv->playback_started = false;
 	}
 
@@ -752,7 +752,7 @@ static int tas2781_system_suspend(struct device *dev)
 
 	/* Shutdown chip before system suspend */
 	if (tas_hda->priv->playback_started)
-		tasdevice_tuning_switch(tas_hda->priv, 1);
+		tasdevice_tuning_switch(tas_hda->priv, 1, false);
 
 	/*
 	 * Reset GPIO may be shared, so cannot reset here.
@@ -785,7 +785,7 @@ static int tas2781_system_resume(struct device *dev)
 			TASDEVICE_BIN_BLK_PRE_POWER_UP);
 
 	if (tas_hda->priv->playback_started)
-		tasdevice_tuning_switch(tas_hda->priv, 0);
+		tasdevice_tuning_switch(tas_hda->priv, 0, false);
 
 	return 0;
 }
diff --git a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
index 4899ea372798..e05f12a0c8bb 100644
--- a/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
+++ b/sound/hda/codecs/side-codecs/tas2781_hda_spi.c
@@ -399,11 +399,11 @@ static void tas2781_hda_playback_hook(struct device *dev, int action)
 		pm_runtime_get_sync(dev);
 		guard(mutex)(&tas_priv->codec_lock);
 		if (tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK)
-			tasdevice_tuning_switch(tas_hda->priv, 0);
+			tasdevice_tuning_switch(tas_hda->priv, 0, false);
 	} else if (action == HDA_GEN_PCM_ACT_CLOSE) {
 		guard(mutex)(&tas_priv->codec_lock);
 		if (tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK)
-			tasdevice_tuning_switch(tas_priv, 1);
+			tasdevice_tuning_switch(tas_priv, 1, false);
 		pm_runtime_put_autosuspend(dev);
 	}
 }
@@ -847,7 +847,7 @@ static int tas2781_runtime_suspend(struct device *dev)
 
 	if (tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK
 		&& tas_priv->playback_started)
-		tasdevice_tuning_switch(tas_priv, 1);
+		tasdevice_tuning_switch(tas_priv, 1, false);
 
 	tas_priv->tasdevice[tas_priv->index].cur_book = -1;
 	tas_priv->tasdevice[tas_priv->index].cur_conf = -1;
@@ -864,7 +864,7 @@ static int tas2781_runtime_resume(struct device *dev)
 
 	if (tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK
 		&& tas_priv->playback_started)
-		tasdevice_tuning_switch(tas_priv, 0);
+		tasdevice_tuning_switch(tas_priv, 0, false);
 
 	return 0;
 }
@@ -882,7 +882,7 @@ static int tas2781_system_suspend(struct device *dev)
 	/* Shutdown chip before system suspend */
 	if (tas_priv->fw_state == TASDEVICE_DSP_FW_ALL_OK
 		&& tas_priv->playback_started)
-		tasdevice_tuning_switch(tas_priv, 1);
+		tasdevice_tuning_switch(tas_priv, 1, false);
 
 	return 0;
 }
@@ -917,7 +917,7 @@ static int tas2781_system_resume(struct device *dev)
 		tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
 
 		if (tas_priv->playback_started)
-			tasdevice_tuning_switch(tas_priv, 0);
+			tasdevice_tuning_switch(tas_priv, 0, false);
 	}
 
 	return ret;
diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index dcbeb9618195..11d1c2ac865b 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -2797,11 +2797,12 @@ int tasdevice_prmg_load(void *context, int prm_no)
 }
 EXPORT_SYMBOL_NS_GPL(tasdevice_prmg_load, "SND_SOC_TAS2781_FMWLIB");
 
-void tasdevice_tuning_switch(void *context, int state)
+void tasdevice_tuning_switch(void *context, int state, bool is_cap)
 {
 	struct tasdevice_priv *tas_priv = (struct tasdevice_priv *) context;
 	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
-	int profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
+	int profile_cfg_id = is_cap ? tas_priv->rcabin.capture_profile_id :
+				tas_priv->rcabin.profile_cfg_id;
 
 	/*
 	 * Only RCA-based Playback can still work with no dsp program running
@@ -2818,7 +2819,6 @@ void tasdevice_tuning_switch(void *context, int state)
 	if (state == 0) {
 		if (tas_fmw && tas_priv->cur_prog < tas_fmw->nr_programs) {
 			/* dsp mode or tuning mode */
-			profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
 			tasdevice_select_tuningprm_cfg(tas_priv,
 				tas_priv->cur_prog, tas_priv->cur_conf,
 				profile_cfg_id);
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 01442fd57d7e..70229e8279a3 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -1000,6 +1000,50 @@ static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
 	return ret;
 }
 
+/**
+ * tasdevice_get_capture_profile_id - Report current active capture profile
+ * ID to user space
+ * @kcontrol: ALSA kcontrol structure passed from ALSA core
+ * @ucontrol: User-space control element value buffer to write the result back
+ *
+ * This function ensures the returned profile ID is always clamped inside the
+ * valid range advertised by the info callback, preventing accidental invalid
+ * values from being exposed to applications even if internal driver state is
+ * temporarily inconsistent.
+ *
+ * Returns 0 on successful fill of the control value, no error conditions
+ * are defined for this getter callback.
+ */
+static int tasdevice_set_capture_profile_id(struct snd_kcontrol *kcontrol,
+		struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+	unsigned int user_prof_id = ucontrol->value.integer.value[0];
+	unsigned int max_valid_id;
+	int ret = 0;
+
+	/*
+	 * Align valid range with the bound defined in
+	 * tasdevice_info_profile()
+	 */
+	max_valid_id = tas_priv->rcabin.ncfgs - 1;
+
+	/*
+	 * Reject invalid input including zero total configuration edge
+	 * case
+	 */
+	if (tas_priv->rcabin.ncfgs == 0 || user_prof_id > max_valid_id)
+		return -EINVAL;
+
+	if (tas_priv->rcabin.capture_profile_id != user_prof_id) {
+		tas_priv->rcabin.capture_profile_id = user_prof_id;
+		ret = 1;
+	}
+
+	return ret;
+}
+
 static int tasdevice_info_active_num(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_info *uinfo)
 {
@@ -1080,6 +1124,41 @@ static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+/**
+ * tasdevice_get_capture_profile_id - Report current active capture profile
+ * ID to user space
+ * @kcontrol: ALSA kcontrol structure passed from ALSA core
+ * @ucontrol: User-space control element value buffer to write the result back
+ *
+ * This function ensures the returned profile ID is always clamped inside the
+ * valid range advertised by the info callback, preventing accidental invalid
+ * values from being exposed to applications even if internal driver state is
+ * temporarily inconsistent.
+ *
+ * Returns 0 on successful fill of the control value, no error conditions
+ * are defined for this getter callback.
+ */
+static int tasdevice_get_capture_profile_id(struct snd_kcontrol *kcontrol,
+			struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+	unsigned int max_valid_id, current_prof_id;
+
+	max_valid_id = tas_priv->rcabin.ncfgs > 0 ?
+		(tas_priv->rcabin.ncfgs - 1U) : 0;
+
+	/*
+	 * Cast current profile id to unsigned to match type with max_valid_id,
+	 * avoid signedness mismatch;
+	 */
+	current_prof_id = (unsigned int)tas_priv->rcabin.capture_profile_id;
+	/* Prevent underflow when there are no loaded capture profiles. */
+	ucontrol->value.integer.value[0] = min(current_prof_id, max_valid_id);
+
+	return 0;
+}
+
 static int tasdevice_get_chip_id(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
@@ -1122,6 +1201,41 @@ static int tasdevice_create_control(struct tasdevice_priv *tas_priv)
 	ret = snd_soc_add_component_controls(tas_priv->codec,
 		prof_ctrls, nr_controls < mix_index ? nr_controls : mix_index);
 
+	mix_index = 0;
+	switch (tas_priv->chip_id) {
+	case TAS2563:
+	case TAS2568:
+	case TAS2570:
+	case TAS2572:
+	case TAS2573:
+	case TAS2574:
+	case TAS2781:
+	prof_ctrls = devm_kcalloc(tas_priv->dev, nr_controls,
+		sizeof(prof_ctrls[0]), GFP_KERNEL);
+	if (!prof_ctrls) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	/* Create a mixer item for selecting the capture profile */
+	name = devm_kstrdup(tas_priv->dev, "Speaker Capture Profile Id",
+		GFP_KERNEL);
+	if (!name) {
+		ret = -ENOMEM;
+		goto out;
+	}
+	prof_ctrls[mix_index].name = name;
+	prof_ctrls[mix_index].iface = SNDRV_CTL_ELEM_IFACE_MIXER;
+	prof_ctrls[mix_index].info = tasdevice_info_profile;
+	prof_ctrls[mix_index].get = tasdevice_get_capture_profile_id;
+	prof_ctrls[mix_index].put = tasdevice_set_capture_profile_id;
+	mix_index++;
+
+	ret = snd_soc_add_component_controls(tas_priv->codec,
+		prof_ctrls, nr_controls < mix_index ? nr_controls : mix_index);
+		break;
+	}
+
 out:
 	return ret;
 }
@@ -1773,7 +1887,22 @@ static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
 	guard(mutex)(&tas_priv->codec_lock);
 	if (event == SND_SOC_DAPM_PRE_PMD)
 		state = 1;
-	tasdevice_tuning_switch(tas_priv, state);
+	tasdevice_tuning_switch(tas_priv, state, false);
+
+	return 0;
+}
+
+static int tasdevice_capture_dapm_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol, int event)
+{
+	struct snd_soc_component *codec = snd_soc_dapm_to_component(w->dapm);
+	struct tasdevice_priv *tas_priv = snd_soc_component_get_drvdata(codec);
+	int state = 0;
+
+	guard(mutex)(&tas_priv->codec_lock);
+	if (event == SND_SOC_DAPM_PRE_PMD)
+		state = 1;
+	tasdevice_tuning_switch(tas_priv, state, true);
 
 	return 0;
 }
@@ -1781,7 +1910,7 @@ static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
 static const struct snd_soc_dapm_widget tasdevice_dapm_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("ASI", "ASI Playback", 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_OUT_E("ASI OUT", "ASI Capture", 0, SND_SOC_NOPM,
-		0, 0, tasdevice_dapm_event,
+		0, 0, tasdevice_capture_dapm_event,
 		SND_SOC_DAPM_POST_PMU | SND_SOC_DAPM_PRE_PMD),
 	SND_SOC_DAPM_SPK("SPK", tasdevice_dapm_event),
 	SND_SOC_DAPM_OUTPUT("OUT"),
-- 
2.43.0

