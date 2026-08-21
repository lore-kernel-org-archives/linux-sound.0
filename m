Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB3D4A33F6;
	Fri, 21 Aug 2026 16:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787328625; cv=fail; b=nwuDUzmV00vFJd5cbMl40HJJVOHwl2zQu5R8Qq774w9P/GuOQetB/oJmwg4KH6mxSuJ4wE2ynrTUU0vCS5S51U9X6y4VOKoptRuPf+Z2i8wfuXmvvMgrsS2CiHt9umchM27B3exwQQKMMozeJC5GQPL8GwGa1h3zi7eFjTT0a6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787328625; c=relaxed/simple;
	bh=m+BV2j0uQc5dG7SHocPsAoj+PP3WrpqdM2j4Hz32Dnk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XB7FGTzgIZxBQzQ87quNELM3mnx+ctEDm5izUpJWT8ujzuO9EJaMfcUPIqek9Cw6CWgNy0BnYO6HK9BVxpHit07UwEjkLBEzfvatXXdTk2Ppedt6LwvpkIe9+26aYISjuowZqK/0ztTbbZ2eQtHJK2vMxyTUvNKhcbHmnUT9x4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Sf9GAzKB; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=RoTkQs6/; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Sf9GAzKB";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="RoTkQs6/"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCuJea4001337;
	Fri, 21 Aug 2026 11:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=2Mp/dLx5ZFQBRxvG
	GQ266tTBG7bXNJamDVX63xtVMDg=; b=Sf9GAzKB9x9qIRZeqUegk9L6vpDqkPrb
	9yW971HFneKZOzwCywGlDFPy/BVdUcNYCawZp9P3+QRsMjwSaqlEqB00soqvWJPk
	xOYFSyTjQLXAqU73rDbmmTnBPF+xhLAv1yZWWm1bqoI7c8RQPMzHM3rD98qFlO+P
	LQjNA2iko3ExbRC/E9xUgFXmjZXxfB37BNApYtetuU1U/GvC8H4/1BdRWhn8zP3n
	DkZnJzSAxiv2NGDpkBrSwiLOGw3/7ljMflfoTGM7JtnxCekrjxknQjkSIJgnIP5R
	197jkfyArT3k36OotV0SiRbp31o7hedz2p12bB4rP5AnzLk0Cn2YSA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11020105.outbound.protection.outlook.com [52.101.201.105])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4g4ydaw4sw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 11:10:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1+iChF+McPsWanRmib9Pq9zSvE7lGP9jte7DixAwEGXGe4G4sbR7L0ygQunopJ2YoRdPIMP6lr5ajQQPUp7yHmHwiFe3tFFOUPpQ+qY03qFz3ndcNRCPQwsWCF7NIWttb227RCaqOL49KLTMQxhIr9NfX6IV6zPfyrsLwUTzPBkzhDfPZ0PLSb5unfO6YJvFItY8I266ljM1EBttovzv7Mk0zVzwZN3mqyADgyv6xvSWtJJj5IAgrtDPNbvvKaPWIQvGYaNjAtgPmb+SfOCxKHzqGbWH2Tj+6ACMHYhoieqZ2OFRuZRov5MM4Bim55PoFEayIfm5H2NUN9oLBIg8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Mp/dLx5ZFQBRxvGGQ266tTBG7bXNJamDVX63xtVMDg=;
 b=RWlaZkMPxPa680uRmXPrQFVh8Duay0VUVGb/WWl/8V5f590Gb2QhhY4eW56CWtIuMVFEaCvw+9LTBvta5BsI5LtcSz1ZUcwJ3Ysa9K3wcKZwgYBT3g3sxVTjNRM5hcAqz48328wp5etxlKjXSF+lcLIzwmDLlFMLH3S9k40HAgJXPQvs+0Q4cBSoMtmgDG2cmtu01XdmTyMUC89g33OEQzSAtuogJoa3wAuTpUYVA70634dEHxSKAxK7OvHmM2dTuV7EYk/K23E7iytcL414+U0GcCX+7STX/wKN4phx2zgYu916MbbwlukJwq2RDYtTXz0QOzEZBXaTzI1zVr2t/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Mp/dLx5ZFQBRxvGGQ266tTBG7bXNJamDVX63xtVMDg=;
 b=RoTkQs6/8WkdOolA7VLhmbhEyz7dvUldm4ZBkqPlg1wi9HOERZd0O1Axppn4z0ZqvFiAvD4T4RkqjLocaKTWXHBXegUDZOhN1c0/Yqir47ZmA/ZdRjL0pjuyFo+p7n3dL9xqkVsxpTfYjGdqml/6cw93UVxXLzOLduXeifNIrls=
Received: from BN9PR03CA0132.namprd03.prod.outlook.com (2603:10b6:408:fe::17)
 by BLAPR19MB4401.namprd19.prod.outlook.com (2603:10b6:208:294::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.10; Fri, 21 Aug
 2026 16:10:10 +0000
Received: from BN2PEPF000055DD.namprd21.prod.outlook.com
 (2603:10b6:408:fe:cafe::57) by BN9PR03CA0132.outlook.office365.com
 (2603:10b6:408:fe::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 16:10:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000055DD.mail.protection.outlook.com (10.167.245.7) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.0
 via Frontend Transport; Fri, 21 Aug 2026 16:10:10 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7101C406543;
	Fri, 21 Aug 2026 16:10:09 +0000 (UTC)
Received: from ausswws06.ad.cirrus.com (ausswws06.ad.cirrus.com [141.131.145.33])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B71FF82024B;
	Fri, 21 Aug 2026 16:10:07 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] ASoC: dt-bindings: cs35l45: Adds SYNC properties
Date: Fri, 21 Aug 2026 16:09:42 +0000
Message-ID: <20260821160946.95258-1-rriveram@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DD:EE_|BLAPR19MB4401:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: de2ff629-6f45-402a-9f3a-08deff9eacf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|36860700016|61400799027|82310400026|6133799003|56012099006|3023799007|10067099003|11063799006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	FTCq/q0oTS5jLlzlg9ubIPsmXSoJoN+VsdZal6H2F7DrE4kdfHHzlMJF2NFNCuGpATzGQEqjuKwK6t74+amu73X4TL0Vw4ZOP/iz4IIop//8xjMBqd1vp1VKryj0GxhcHMLPZ0v5DQwiODTbxAx7TsJivOCP1JGMaZjfjqNsVxeKrFZgvXeSS2N/2YUOdP258kIulVSnvbiLRzkapUHRPnX1CSVF4Eepv51DEwc0OM6OLnLqpuCQ/04qSBOse8C9/SXq8Q+eVG4qP+t6Cg8ld1fPclzA3BxScyBWMtZ6L9aKYPcidX6rMzqDKCeQwL3UgFhKM5SO28elbUHLnzvcGw7cvGrtbalcEglvcIs7FP5qvLpzFrMY4h9WDnSpLEtxRD7eiRPR+omyxcZLTF+avd665pLZ7nxLeMfLVSelxatWcmVSJWjC/A27rYO8GxFpx2SuNkSuZdSV1MVWTY77GlyTU22Qn8hpXrORFQox4PUBEgxLb02s2xhVt/U2sOvNssGBstx6bJEOhBwU0h6O05j0KFRAj6OKZR+gJZ1/5kgIQRXbw+qaQJYCep8DizxozVnoLuJqiknqfZ2xShqVk5Jl2Scr9HR4fN3bqi3lU5s9x6NI30vrPshlmGlIKtQPHToc1AndKCZfQqaATZapbCOGyi0kWrnamBe1oCrx81jvVYkU8QtYbFLFYhAYwi+ELu69hqOULc18ndjdFKkCHQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(61400799027)(82310400026)(6133799003)(56012099006)(3023799007)(10067099003)(11063799006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iXRrY/S21Qdu+MVEDKo2IHsOSiL8Sum7FoW6KBSTLanqihXipLEEIeBl0uQQLoVsnvC0ECMjbDPgN8rgv9vHXzPMIjmyQ/w7ejk13mpF/9TZ79S2Z6BAyvMqX68NbCjOpl2YlheOXdIruvmWxt1GH0Sml8G+UDVOnBU/P35FVy+/ikJdEqd5OJX1lxU1vCtoZE10xnRy59CsB1buvqB9HCiMxj2DBzNAt2t7uaqGCLfeB7k7X50/5H/cYf8t+fInwoz50C2TflR8ieXtqQ+xtQ6Uxh2PpoXEeMGVk5X6bHEkqxfMGV/gU0rBVrkcQ6gl02LMAuHP6OEHE3PXqdVog+ot6FZV2hcLpvdjyrihXM86jcsq3FB3LjNpz17ZXxAsq48WF5zZyU4SsyDQtW3B/JGNT/h0BKlXFPce0oFrBXqTZiPeLcV1padcS6RodKDg
X-Exchange-RoutingPolicyChecked:
	poE+SJ9JdfPKgsvVVzCRZ6JJJfROduYDKp3ikzjQuqqrVuvkTatGXXwK0MMfcg077+AzQ5hqb8n3TgklC5ZapPZ/CWDjmAUc9A8XIMZdTetdHNOkDRJREM3WNn1d/leb3xD6Oj3By+m38EfjLStkyeHz60WR5yxfYoDshHBVjXPIcbWYL/OPknJh9lyBaPd8sYWiS/T1KjKAPm1UcO0wOzcGo76KBhgBiJQ82ZvY+tg6IXqBfoAF1JGLFmq0ed4I9BmEcV7cpu/rRB1yowA7YCI/wTbnrRd4DmLtZXPM07IY4GlOUgmuTo41lK/+qLQAYJKfV5li0wAym6A+Jmn30g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 16:10:10.2675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de2ff629-6f45-402a-9f3a-08deff9eacf4
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000055DD.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR19MB4401
X-Proofpoint-GUID: _Hk-R6i95XIV7I1nCFUv1eGM5ubHRcA_
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX1rFwJGu3IREa
 591VvA8YG4PxLh8UVIDhssAKKiiZKlM7wBIKZvYy1HJoDZQ/UZAiIZv7wVdYAK1calqIsnoq5sm
 lSiLT158ItOW0fxpbAXoASkh8EUEg7s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX8uZg6c1tUk6C
 8KT8MvUPBt6bBLCjpbE77oR25IvE9aJZ5GE8YTavkeLZ+4duzZ1J+oEx3KmtLvN+w9YO2mWAIU4
 rNkelRU0vx1wA8Ykx6+F1RFV0GKr02y6qs2I2AYdQVLH4F+ZHRHYV/fh6PX78b0LdCxwdKA6ZuE
 j4+1sIDpY9AjXFN1roG/nN3uwc6J3wnAbT8b/8NhxfSrAMPDLrUE0ODKUrKdj1V9G2Ew5MoFJuw
 u2Yv9y41AUizmv7rcmDNtaBWTi8XhLOpUiK10MGMCEAQxsW7qkEZTAMvpgUilbpZttnkHft+m0o
 C8q4FSZhfkZ0VLRlGofWqXutYgv6KzqGcJEzIxUbNDEYHGblEaYAJk+dbtzP/ZBOilpDhbrMlIw
 TTHc+jAnCiUgZkLBKF9M0fkn2/3YXn49P6gW4ErBc8xLm5NkR4rdHVpAsW9f3wuDDdlnn1G5oH9
 +BDuw5mjEbj5DCx8LsA==
X-Proofpoint-ORIG-GUID: _Hk-R6i95XIV7I1nCFUv1eGM5ubHRcA_
X-Authority-Analysis: v=2.4 cv=Hb4kiCE8 c=1 sm=1 tr=0 ts=6a887865 cx=c_pps
 a=46TtpZuQ3CNvjEMd5q8peQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=KBitPqK-shNkJ_V7GXcA:9
X-Proofpoint-Spam-Reason: safe

Introduces support for the multidevice synchronization (SYNC)
bus. The properties introduced allow for the configuration
of the device's transmitter IDs.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 .../bindings/sound/cirrus,cs35l45.yaml        | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index 70f6c62aedca..20d758dc442f 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
@@ -53,6 +53,29 @@ properties:
     maximum: 3
     default: 2
 
+  sync:
+    description:
+      Multidevice synchronization (SYNC) bus configuration
+    type: object
+    additionalProperties: false
+    properties:
+      cirrus,sync-lsw-txid:
+        description:
+          Transmitter ID to use for long software (LSW) data packets
+          on the SYNC bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 7
+        default: 0
+      cirrus,sync-sw-txid:
+        description:
+          Transmitter ID to use for short software (SW) data packets
+          on the SYNC bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 7
+        default: 0
+
 patternProperties:
   "^cirrus,gpio-ctrl[1-3]$":
     description:
@@ -155,5 +178,9 @@ examples:
              gpio-ctrl = <0x1>;
              gpio-dir = <0x1>;
           };
+          sync {
+             cirrus,sync-lsw-txid = <0x1>;
+             cirrus,sync-sw-txid = <0x1>;
+          };
         };
     };
-- 
2.43.0

