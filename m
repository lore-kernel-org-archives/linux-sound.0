Received: from CH4PR04CU002.outbound.protection.outlook.com (mail-northcentralusazon11013010.outbound.protection.outlook.com [40.107.201.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DBE3D5C1D;
	Tue,  2 Jun 2026 10:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.201.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780394778; cv=fail; b=V9+R4C3vGdsAwhgNQMuOkjr0n/nTdoc0+8zF4Pj9UrsuUtoUwbiCOZLwchX983l0owuo0FlW8PHbNZerEUeKtRnlAJbgLUU2VtcvLILcdYzYM3IyRqA4uNeQ9BopG8uuR6P0nhZp+x31eZlIZG4wfvCFhYhco8idx4KCij7fKdc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780394778; c=relaxed/simple;
	bh=guG6Thmb3ueln2F19iZ4vxD/jQUk4cdiXPJjqC7mu/E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZQGGx8Va3stp/Bb/0y7Jewxf3Bp8DEeWWPOlr1bdATOxTyT987OwhgyrQNYJnqjTdFBZ32O6/zHPaW8Q4lugvRntEEVFLRpaqXYJtXfNre8pK+1SCYG080hgyLtM37EztLHvCtEt5/rOOMdmYfk2U2Yq1yqH06tgXCF/vJGSBSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZR7RQFCW; arc=fail smtp.client-ip=40.107.201.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZR7RQFCW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lkLbPQI0mZaQ5anVPFCVpm5bSb4vzPe3KMP1MPm2NSLqZRZJ9zwdmYlDkYIP89ET9JwhVfuUlBEgS60TVXFH+e3EPFtTIfCOF3S3DXWgraqqde+eBI3f3qTXDGZ/HkENwTQZrD1GixYIcJ6UTSV+y8ALVGtojkuDlq+VLjLPKUR44Whj8Mr4cFBgC4E0SGZloOhUHBlPHnfv62DvdT/MuIvyEe/m5lTVwtJpg6LtH5fHwr9WPz1YHZmlVuN2vrxrzK4nA86ZVlmHYvmKZavMohlZb4Ql1Ex+Xb0imk5b33+xQ7uFG7z84KVJRJadWU1Z++Ewe6s9vlZhliCF4kPdoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZM7mrnWjp4/A6xQN29z00/29u2LgvzRXtzV6/yR57LY=;
 b=DwnpgPAeomulQ/w8FdJnAkkPvFAJJDF8/llUKkUeGleIuq/8yD+mUrdAshjpa3+mdRbEG6BqvMlwjm8QNFNWDwkn41J9NzF0+CYtc9PFTH8QR+TIDq18Sll054D12RqsQPc6iFotoYmzLVTTt+LS2w3CHvkic+DWc7Kd6R5r+GQ+41wVDIjmvYynBoqZJWK1lENJNpwz7sZ94920v9ewwZ66Phy7gqWRXUAdlfSpJdwHloW+8addAVE/yo51hTPCZKo8GO3v9+Ka2PgIHfPst2XIFDKecwLu9h5kg7Hb99pNd3KK6DbPXlQKHKnAL0Xc1NKqCJ+pYPG5Ijg9hUFJvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=google.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZM7mrnWjp4/A6xQN29z00/29u2LgvzRXtzV6/yR57LY=;
 b=ZR7RQFCW763oYnEtnjhZe1beEoNOFDaES1jSFJTblb+M5xDw6cqDG8VdoRGHgUPhDPOEfTm09WbZ6rBsnr67Z9FDOcaStsQelTJ8gEaJS6zNUgkG85TGIzNWsT3RbHANRiOiid4wBf6za+K03Bc/sMM1HPpiblJmkfAz6ffup5E=
Received: from SJ0PR03CA0046.namprd03.prod.outlook.com (2603:10b6:a03:33e::21)
 by SN7PR10MB6497.namprd10.prod.outlook.com (2603:10b6:806:2a4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 10:06:13 +0000
Received: from CO1PEPF00012E64.namprd05.prod.outlook.com
 (2603:10b6:a03:33e:cafe::28) by SJ0PR03CA0046.outlook.office365.com
 (2603:10b6:a03:33e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 10:06:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E64.mail.protection.outlook.com (10.167.249.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 10:06:12 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 05:06:06 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 05:06:05 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 2 Jun 2026 05:06:05 -0500
Received: from lelvem-mr06.itg.ti.com ([10.250.165.105])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 652A5uYS3539205;
	Tue, 2 Jun 2026 05:05:57 -0500
From: Baojun Xu <baojun.xu@ti.com>
To: <broonie@kernel.org>, <tiwai@suse.de>
CC: <andriy.shevchenko@linux.intel.com>, <13916275206@139.com>,
	<shenghao-ding@ti.com>, <baojun.xu@ti.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <lgirdwood@gmail.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<k-yi@ti.com>, <henry.lo@ti.com>, <robinchen@ti.com>, <will-wang@ti.com>,
	<jim.shil@goertek.com>, <toastcheng@google.com>, <chinkaiting@google.com>,
	<riyo@ti.com>, <a0393308@india.ti.com>
Subject: [PATCH v2 1/2] ASoC: dt-bindings: ti,tas2781: Add TAS2573 support
Date: Tue, 2 Jun 2026 18:05:31 +0800
Message-ID: <20260602100532.6463-1-baojun.xu@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E64:EE_|SN7PR10MB6497:EE_
X-MS-Office365-Filtering-Correlation-Id: 5195ce67-9e6a-4b22-ef88-08dec08e9395
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|7416014|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	t1CV8zssF2y1B6oHwEsmZ7bkCHM6vD3UVS/hsg1oAGFAKrX3rTQYPdaWkF2a1rZa5ZKPY1WH7FlDSR4S7b7342t+1IiBZ/RquaW4c5rs4kNtTe/nq3mn/H6zeDrj5id/TKBSzO144m3f/1qYo4XQDw8bY3IxPJ7mZEuLf+1W6t57R69LGfRmy6IbZ4dnmmQDlWfyy6ElmaEtWeKCKZES64pSyWsmO3OcHinKY02ARdetKrS+hidJxqhXDMZMR8w2mJbIx6yBAfjPevqE7GcZ0Cc/Vjt8DePIJk1dnv1wA70QnMULEM96xg/ugG8wRyzksq8l2/6lv2nSA7IIR8RT17EUyn4Z1EqtJ3TIPquoXjEwrmMIJdZ3Ejufm07x0dubZzF98ITlVILVxYadKA0BG4EBiE2lx5s2ZQ6xDXLRQOE3pv79dzyjBr+CS9ijdIxVjO9D6cFE+RDq8Y+ZoSE8KKwnPx9b/dkc6FPAnmRwcp12a6TXKNEX4qbW29i86VhEoc3qevNJEMm9yH3cw54SEUY+Cc37jxR/3vA0SxFu4WLNtlReO/5NI6X9prsS/0CmE/g5S5Wev/ncyvvhXtXKZsJQhbTWrqn74lPZffx7Oc5Ej3/qiS5WZzmlNW/vrPb/uiC3gjmKGqAWTH6nupPjwBj6EpmfTvL7TDVp0jh04gE+DG86XPuzOrQEoE7fmtapEKHCfo9TH/HmqrtDenHU1MZDz+tKrKMmaKNBGDDGMy8=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(7416014)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lMp3BTQserixhaEpyzIwsHbS6M6ILY9UON3nZniSSCI2YUafQAq/shi7wTumkKDtyAF+HvsomD+8YRJx/fkaiya/dhFBuOMsGSP3D881U1smqVSMgo2Ddr9t3vyYFRDu6sxmYkY2umFugajHF+xhfkU4vGdQoGcPWXFLnjOrTQD7pwxQ0ATmVXnihFx/qxYXweEnrSUcvbIYrrlnREQcj3LWb19QLro2bfNgBbb80ovOBs9HCL9CWiFpl7myCNTHLhaLD+/u5h+CSCViWRgkOKnrx2BTt1xl+kCCJdRJUSnfSfnaWEkc5CCBW3PmJEgwwn2PwReVMtLut0gALtKNUZ689AuYqixV6WCOmlJ7d6N2dTGfITf9G4UyVngNg1W7NkI1Lza42AnyZjrUm2/Q1oopqlGHd+GLXH3BEGycuxhs9bO6CWzw8+chDbUZFhBR
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 10:06:12.5829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5195ce67-9e6a-4b22-ef88-08dec08e9395
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E64.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6497

The TAS2573 belongs to the TAS257x device family, featuring an integrated
DSP and IV sensing capability.

Signed-off-by: Baojun Xu <baojun.xu@ti.com>
---
v2:
 - No update.
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

