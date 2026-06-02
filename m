Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010055.outbound.protection.outlook.com [52.101.201.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043FA352004;
	Tue,  2 Jun 2026 03:54:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780372448; cv=fail; b=BT2NmiWhFsT3Z0CrRNRCvHBCUMAgw4lmO72pG7DtD0BPYTAWnyKIITIWHVt5RgI9/hVAs10DYQ2MQYgJMb33k3oojML0nqo0S8UGC7s8DW580Fllk/Z50wXN5W+VbzEN1SdNoqa6uGxzZVnI7RVkcqQbcEi+kJRM8LnwKvS7Bgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780372448; c=relaxed/simple;
	bh=71tSyxMHvcLJBqOaM4eH0Z3KemuBVmtgC4oefCa1Vl4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KKs7PGqqGRq2Su3uveKBBIc+7dAe2VRm7D3wNEDWila08A7BGxlH1zZQWdrOMdwM1p7g6IlzScqh340l77o8xBIH38nR1wQbehfvGrP5zOqqNZ5XHgN4SP9qxGYVGdDWtfrsKPBx768LMZ3RP8ldVR+VL5ObxA+em+BYwFUOin8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=REwkeAvD; arc=fail smtp.client-ip=52.101.201.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="REwkeAvD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8q0WdC+xhKKLbwdGyXkN4sHP60q2/dG2rBRXCZ0izv6kIRLZAPxzQoQ7i2E7YH+NWgeJx1XgVolLt48tyQ2To2dOrtx8bEd69gXYPplfqrE1D/yDwnYj6a0Br0tNMv42QHWhzJtPiMpqrNGrtow+6yKYKd2bFMPwPEy0Uq0mXQp6eC3xWD24e+SMcHnUZi4WLmW9L30HrJEhHmQ/skjDSk+2ZLhgcVqVcZ4+K45ivUaruDP1GNRodIyKfqoFnM3qFCohgIyFEdNEljVKGsb9K5LhLEA0cY27VfIQU2IkdfBDcbATIN7QF37bD6AADpFtG8QmvsSfdlXdhl/bjfQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7wqKkRSwfk9UjlrmFOZ+6UgKWzOqrzFww+cafki+5Y=;
 b=GER1YVCnz6+rFOljlRfd3l5dXhsVo9u5boX6szur5BX4pe87ZQQ+7ZbIFSZ95E4eidsFuvwoLvXA0AvLcTg3LbPNuREbAl9vyMgGcFugRsabTQt9kc7TL13mlNvuNZA5A9Rn8Mdp5j7zmk2Pm1HrW2plDdVG8RlxdltWYGtc6oEcQRiejPDBA5YIVZ49GTJSpct1fD+/p1xDyXHg1y1FWyhJn4lJ4i3DhnTGX6MT9rYhm/P0LycRSvNgkYTWYg49TczsXQZgPjcZ9RiVOPDAGywlPLLJ/Xt47dlrDYaNU6PILQIzeMbUl661TVAWPNlS8p6rcRlYpmjea8hNU2DDpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=google.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7wqKkRSwfk9UjlrmFOZ+6UgKWzOqrzFww+cafki+5Y=;
 b=REwkeAvD1YaGwcMKh4RSO8AiLJPZT+nV1fayy2DmmSMivQfDnucWixBEuO1lTvQgr4d+OLs54PUmwP4U9ECgiJ0JdjDwDDA66gqlXIwXfEDQMzEvqyAlG29qfW+CNmkQyeqShPexSnABbhf+u+AkangPOpCi6wlKVf5ynPgCwiM=
Received: from MW4PR04CA0036.namprd04.prod.outlook.com (2603:10b6:303:6a::11)
 by MW4PR10MB6420.namprd10.prod.outlook.com (2603:10b6:303:20e::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 03:54:01 +0000
Received: from SJ1PEPF000026C7.namprd04.prod.outlook.com
 (2603:10b6:303:6a:cafe::2d) by MW4PR04CA0036.outlook.office365.com
 (2603:10b6:303:6a::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.17 via Frontend Transport; Tue, 2
 Jun 2026 03:54:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000026C7.mail.protection.outlook.com (10.167.244.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 03:54:00 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 22:53:59 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 1 Jun
 2026 22:53:59 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 1 Jun 2026 22:53:59 -0500
Received: from lelvem-mr06.itg.ti.com ([10.250.165.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6523ronC2951709;
	Mon, 1 Jun 2026 22:53:51 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>,
	<riyo@ti.com>, <a0393308@india.ti.com>
Subject: [PATCH v1 1/2] ASoC: dt-bindings: ti,tas2781: Add TAS2573 support
Date: Tue, 2 Jun 2026 11:53:21 +0800
Message-ID: <20260602035322.5029-1-baojun.xu@ti.com>
X-Mailer: git-send-email 2.43.0.windows.1
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C7:EE_|MW4PR10MB6420:EE_
X-MS-Office365-Filtering-Correlation-Id: eb7ac171-beff-4b5e-cb43-08dec05a94d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	dWalagqEdtvRH6EvRfDNEtrdoa8a9gjpxB9xAKnlt1qaSs16qSuDuOdSf+FKDuyGLTcIFvadiulDwb5KIrKZ7IFwLvOAbfOluWWE9NEYwoRzfxyxw10BCg30MKEU5TDBIO2ezl4jI3j4k2PnVRG/boHYYYGTEwdt9ZrtYwD+uceN3e7ZADv7ycbF8fryIMhYpK2XenJ0Htsy5/OwcqAP44foE7gSJXVLhdaXVmnOsx0SEvzuUXWjxlNo8txVPCg+39/a5EN1gRJ3an+H1YKtfvZ2ZOqljR861QM4EX+cUFERmf8mE5wpm6QXNx7pdZ0IA1zyxyTGX/mMEuCv032NcIuIw0NevRZMrMZTGAjkl6i7Ufx8J+QKUNBqpA+wfmW4hFkSaYZbZlF+Go+1iztdoDZBYW7hD3BG7Lle5kDtItzLJwC4JKHP3kiKWKR1ZEVBm595CD5IyTezbnY9lVZeN4/C/VkQ7cjD5fLKfpON+yPwOoHOLb5KqzDFFW8uE4PnY94Hy3m/vrsf1jFVznQK/z3/XDrs8We3HJS1ekTKqfZqJOxsQrlBx1aUD1RrM1cRfrs/nnbvqxWIREZ4pqyuyrKt58LuvKckTw/zhLpE8/7oM/+WViKMepKFZLktnsvSKdbAa2bLKp8B3uCKJybH8OcOF4eNB1OhAxIe/fLPiGVgiNkWa31qwk2jzwcPFbXqpRiPeobCMGTrWud0iCn1GyVtRkTpUPJ5WgZ54waoRis=
X-Forefront-Antispam-Report:
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	5jE7eyJlUMBuHYTh/cxt0kUtwxvnX9wycvyyWncBsz+VN7uFk1+s+HzCWZdhuk4ZukKCC6cnhvJ88/QzWStBwb2AgqUS8URaK2/Pkr0/IAt0Byi0LB6kVep+ksE1CcX2kPtigzkp2X5JPgRex+u2andvYISKiXq9xnDIqLIl4ZCejxFugg8Qouqo3FxZbMi5nOmKuSAILv/RqJEgFtLRbiALcB6VZG65MRqWC936aNiUW6PmEg/LKzNklMENw4Imi49/kGy5a0gbh5WPLNMeuRdsWcnmzieG8kmrgGKudaAYm9SQWi46PQuqYVob9i4q+wnPgBZe1BLkcC2EznVPoGkxVtzgJrb9QKziN5bDXZg5y7mbkFZTY9XFgbjQEom3+p564TaXIB5Qgz8fFRQvRwdwUFfASVJsel8wdPOFWJ+g+MVf5kEE8rveWtnhthax
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 03:54:00.8275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb7ac171-beff-4b5e-cb43-08dec05a94d3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6420

The TAS2573 belongs to the TAS257x device family, featuring an integrated
DSP and IV sensing capability.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
 Documentation/devicetree/bindings/sound/ti,tas2781.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
index b21466bb0730..aa5a317b5a36 100644
--- a/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,tas2781.yaml
@@ -71,6 +71,9 @@ properties:
       ti,tas2572: 6.6-W Digital Input smart amp with I/V sense and integrated
       13-V Class-H Boost
 
+      ti,tas2573: Boosted Class-D Audio Amplifier with Integrated DSP and IV
+      Sense
+
       ti,tas2574: 8.5-W Digital Input smart amp with I/V sense and integrated
       15-V Class-H Boost
 
@@ -121,6 +124,7 @@ properties:
               - ti,tas2568
               - ti,tas2570
               - ti,tas2572
+              - ti,tas2573
               - ti,tas2574
               - ti,tas5802
               - ti,tas5806m
@@ -183,6 +187,7 @@ allOf:
           contains:
             enum:
               - ti,tas2563
+              - ti,tas2573
               - ti,tas5825
     then:
       properties:
-- 
2.25.1

