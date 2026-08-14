Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2DB1D47AC;
	Fri, 14 Aug 2026 22:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786746932; cv=fail; b=eMWyTz89mZdELNF/qYaQRDfQCJUHP50FtcMjEistxDk6FupXRu03qIgTdledTQvb2d5e2B8c4JkFSwa2JB/gcOhb+9XcO364MVJ1ZHLiGcKqAtImyYFz4evlxi+Mp/zsGBzjmJ/6xQGTxQsuUsadIk+hvwno5Z86uouqi2BpfgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786746932; c=relaxed/simple;
	bh=ebLgtyhRexm6K9SDDBIdhAOfrRJcKcPOYw9g0mZIKM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dS+Jp5vTH+EOJNyDKhUWYNYyvg0LdLfkFP7d37Ejw53uIjfDOcwhyPv5+LluQkuG8ftvKYI7183e+SsTyKYNSBj0QGjLG1gb6dqCLiF3SMEHV+uY0IVeMiCb1haZtMNi/vSvArOkb0VNNPOb23J6+HmS3bEWNugYWRUdFXJFavo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=EmSYvpHT; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Akgp1Yce; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="EmSYvpHT";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Akgp1Yce"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67EKVGJa1989044;
	Fri, 14 Aug 2026 17:35:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=/Kh/S52QccfVU8kp
	s1HIK2Li6lpXniNGnBDYLQuygaU=; b=EmSYvpHT6nMOUesEafM0V4zZ0aH2dk0t
	gufYA3ZWhwVNPQoP8J3SS0jBWfkHyTrCHOq1luEhF1S371fn2Vls/VlYwUZ/Jn43
	U6hwyroHfE9hTAcW6cY5q7BRSGvar9QrcWE2Umr8CmcgLI6LWZj6Z7f++SXbECut
	jwdDyhxurZr+3QPGCZbXLj2oSOycdbsKnP3V8PdKVzqdI9hMG9Ve4FxQYiSi+0Dz
	Z33bFJ0bizYVbv5lctoFSQoJSYczulpfmgx0gRqQERwJ1CfzLuVHONiwMNzP5AYg
	xECAoohqLZkCWNIM7fkRAbKFrSm6QaDwTZEqpt8MPyk5RmwOK6/vaA==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11022122.outbound.protection.outlook.com [52.101.43.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g0msjvyk1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 14 Aug 2026 17:35:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eFOZ3L1289GdqavHXj+1usgJZimb29AhbQBUDZcwRN6TyKJ+00pSJjM1vP+NgFqj2c3lMj4sdcP6/2845h/GVUgCvrkBWNA5OG/rFpr6Z/k+Hc7P0QKMfe0cZ2zzUCUDS4OjU9QU/15WyNbdm+Q+YFsLo12HyOZi5wsdRaxU4kFMLQfL+9QGnveoHUQAjfl3as/GSU4YCIrXsFcNdq53UrCZyTGtF3SsBY1RWDF8lmFKDXuNlFd3LTin9ZmSoWfXs3Bwqa7JFCU8Hxx9kdgLElTms9OFOsCF8S1OCBPX603CRvQ18vtUGYaNgF1ufNyA63j8LhATELgrNfwWmjJh9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Kh/S52QccfVU8kps1HIK2Li6lpXniNGnBDYLQuygaU=;
 b=VHLQN5EYxET5AzINTFCWJNwCh+1qxBd+p41KkXQh8IAiPRpmlWMf8bmQ+rR1n9ibji0X7F2Fv9clYyV74orIsPY700WM5fbNVDBHikeIgKNb4K2URzJQ5YzS05qyG+e1p+2plDh2HjxiMNpI5ctRn9jsLDYSPNAxkiLPBw41hZCa8bBLWGfnfwk0GGe76PCPUxVhzISx9Y6hxvOJqtvuXIjQiD+8pUm7cAP45pcADTmxVyrKpulfH5nNoTUwRIMKVivMspQ47J1WJhaxViSAJHOyS2+19Czvtg/P7DKVtryNotoXpeVeThtKz1EMKbA1Tu7azjsDT834/VdG7GCbQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Kh/S52QccfVU8kps1HIK2Li6lpXniNGnBDYLQuygaU=;
 b=Akgp1YceorPKDj3Pz1oXVMM3yKNwNGjaiiO0O9asE9lmJb1eZ/3+Ad4RGbJb/2Zd2b5ZcNWUisf2n552vhcHi6OnnNal0EhahVp6Ng9KJl+B3Gs6cz0x5rJzRanUDImIo+8nE4RxuQrw1+h9uWyQAQwL7DrwB0n/j+nfuDrbvPE=
Received: from CH0PR03CA0080.namprd03.prod.outlook.com (2603:10b6:610:cc::25)
 by BY1PR19MB7797.namprd19.prod.outlook.com (2603:10b6:a03:525::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 22:35:10 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::95) by CH0PR03CA0080.outlook.office365.com
 (2603:10b6:610:cc::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.16 via Frontend Transport; Fri,
 14 Aug 2026 22:35:10 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Fri, 14 Aug 2026 22:35:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5E57040654F;
	Fri, 14 Aug 2026 22:35:08 +0000 (UTC)
Received: from ausswws06.ad.cirrus.com (ausswws06.ad.cirrus.com [141.131.145.33])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9CF6F82024B;
	Fri, 14 Aug 2026 22:35:06 +0000 (UTC)
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
Subject: [PATCH v2 1/2] ASoC: dt-bindings: cs35l45: Adds SYNC properties
Date: Fri, 14 Aug 2026 22:34:52 +0000
Message-ID: <20260814223456.611160-1-rriveram@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|BY1PR19MB7797:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d5f7eef0-88c4-4fb1-daa3-08defa544c6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|61400799027|376014|10067099003|56012099006|6133799003|3023799007|11063799006|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	H78KLl6uILp8jkdiSo1V1QlE6s8ifwYPFRAoF034M0MFcNqcD689Vljx11yktqk3dO9jAUK+DnnwHhnOOAPbLFIaPHpbAy+33TPz7uzwqtA7lUWUBJOQgoVh5a9KEPQWBCMJcpbaB1H95rLzjmBdH4wDYLXgZZXa+EApEcjF0D/IXoO6sCXQH0VsU7crWTOK77Nbjb8RRif5JU40OLxeEZ0yKyCoVr/gI5bBLXvaDf1MzqzdBPn2rbbtqdhqkvxu4NmbBEtfC9e1jwBSDGbQSlCHBz+bMFAspRqDVcWOypoI+9OahO238QaDMdLXdrBDgs+GFm7aDI1BHBaeX3oYEZ8rXoWI+iWs32AX+eruSCNdY5sv9yzefBmz8kU/XSZignwREQZoy0Czu07NB61kIH5XF8YM7trmqTcYKbaDXHRGD0ZnBsYHLjs2FOzDg8ns4zROV2oekkbo+qFcdSPo7Qyqa20dzNYQ5WUPCJkWVa/FP9Iu64JJbJ5bgfSJuY6g5ZGVadrU2yCSXK6dC6MRYdoke4h+r/74DyVcUor710Nm+QSmckpEgtkFs8QfT8i6sPLtkT75UXtMSlIBtpDC0fOtafIIoBnLHQUFP+1Qlmg8AfperteJYAMdNsgT4QCukzxTCyFzxpOaLrfO8haDqOwcZ9qeaUe2tJr0A7mzMZ5N3BJEB5WQVFQCvrijxTznaCOeJzgXAgSZuGPb0ii43g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(61400799027)(376014)(10067099003)(56012099006)(6133799003)(3023799007)(11063799006)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VomUR6d+A1mKmgW0xZsRoUG657atWzk63j5lT3+07+FprNxFeQ3W3J9VOLLmnI3YQxt4JsWIBCdRZLKgbB3cZIjAgpu1iGkCUkypMBrKqa0+U9Irp9UaIsMZ7pDTgD5OdXzoWaynStNJSKIOxhAT2MJB1V8aOOoJFyOL9k3+N7Lg49FiFDQdZ3FERUv2ef4az9LX+JpHG8wh0EdThrDkFBpuxBf69itWZo4b0F4/N9z/eS4eVNmtoIDNlC272zJCtS22Vi9Pno6m6IRoS/mpX2W04lOYnT5P/g6A1swg2Uie/8IHz6+SZ86YcO1Vd/O6iTAiIk2OZIs++tDPvgQ0x9FslnqlNFKbE5awr7HlkU5DoGUgf9Z/+ve9W+/Wb8Sy78x5c9GjsQEksQqr0EH33TWo0pveCeZMbR/4HqkQdnp6PTMM8BlaKsW/ZIs7DDhX
X-Exchange-RoutingPolicyChecked:
	d1kbaW2Ubzh7WZeH6UO6qXWDyJwCw9EYO7elLnhQ+OUWuobJhkTbfGTxe8G7pVa4Vnzw1U/c72ELdZqPyzGguwTWc7CoPxQNvZfT92picLpTmrrK6V/urasdh0z1DyvykkpZhrMnhLYA1vJADTJgJvsYVvZQ+uumo8FX8W/WQCzrpnX2te+Zv0O2IVT093vFPkFnStO1DPKzsXnAJxzrWPFPYhnBMLFbsdz/2x1iUibpfVhKXYXxXeht707VX4RRNErLkjFCusUmFVTjZJ7mVMi2YCrtTP+xXilabs/L8oEGOZ3xBQvqU5hNxaR059lD+2Xi1SPbM1dr6ItkqxmTfQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 22:35:09.7299
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f7eef0-88c4-4fb1-daa3-08defa544c6d
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR19MB7797
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDE3MyBTYWx0ZWRfX3WFX3PxUkIF9
 Ed0m7FmjpD+W+SqdkqHnFORgm4f/9Ope0ycXT1+yetIo2H5oSodMrfKugincx3o75VjNthffyEa
 enmy5sLNwTIZ7YWhTDxeenp0HhyOMUGYqSfYbaGDzgiR7d/8IHO/ObYN9bjvBpa7Az8dUqTEk4f
 FkN0mzeO95h7tG0OXLZXOIhy681RcKfy5CzLMANt8ehWmLvgh07/POBiqo5oQNvJyhKAbACzFaA
 hgN3vva3LoQU/H5KCZw2HjYg9BlXj/+QxaGGLYGS+jaNLGD+eRbAQX3u0MxfysS0LLLJu89NopL
 EIg8GUeBhUP3J1LAfnZq5f1lxQWILHlpbYGwDIyQrsm+OZDHDWpLnlSjFldB+jEjGNW+0UT6UjG
 R7eV8TctBK5hPFwaX3Wz42ky21tDVJidXK5jCTIESC/TYRjbxnZE+WJZfxkTRKsnudrf4ptScil
 m5zDHIT9ua52Yb0C2SA==
X-Proofpoint-GUID: sY0Sm_Rew0p28YPCve0lXhb0ySI2zc52
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDE3MyBTYWx0ZWRfX5NooLYoaEBC2
 zf30Abj2vmi6JarpeyhVrd7x0NxU+oZh1G+vTJo3muudf5Hk53CgccUd19rLccMo3HxlvNRhFbU
 9CiQ9z/leRTKUyPLZw2/gjl0iq/gH/E=
X-Authority-Analysis: v=2.4 cv=VdTH+lp9 c=1 sm=1 tr=0 ts=6a7f9823 cx=c_pps
 a=Z8bsAIsP1tKwyndEcU5KlQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=KBitPqK-shNkJ_V7GXcA:9
X-Proofpoint-ORIG-GUID: sY0Sm_Rew0p28YPCve0lXhb0ySI2zc52
X-Proofpoint-Spam-Reason: safe

Introduces support for the multidevice synchronization (SYNC)
bus. The properties introduced allow for the configuration
of the device's transmitter IDs.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 .../bindings/sound/cirrus,cs35l45.yaml        | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l45.yaml
index 70f6c62aedca..f64ba8c872b9 100644
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
+        description: |
+          Transmitter ID to use for long software (LSW) data packets
+          on the SYNC bus.
+        $ref: /schemas/types.yaml#/definitions/uint32
+        minimum: 0
+        maximum: 7
+        default: 0
+      cirrus,sync-sw-txid:
+        description: |
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

