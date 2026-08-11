Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07E7453A58;
	Tue, 11 Aug 2026 17:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786467990; cv=fail; b=J4DzZx5R2VClrH/IcEYve7wScO8ZMuak4zJAS5XIcdJbn07YLZ7DTeDsodVahPlSZ/PrAEmhfyPamP6iUDYuL+Jvk+Oot7U/K8JdR1SP0R2o3D8wvBlOUdVpzGRpUSulomGpzhliClF8dX6QqtroPFsZxzz0cshA4r7ciw0sJ10=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786467990; c=relaxed/simple;
	bh=ebLgtyhRexm6K9SDDBIdhAOfrRJcKcPOYw9g0mZIKM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l36yJeXAapt794LifF+kKkQTNb+gM5toEFpzjwsy9YuOTZTVCmvrOPDWGjMI+PFqpFMedfNIGYuaHg1CAafoY9swmGqpC9XNkjbHmuwxFn9zKkJyQfBZIGG4eEw3KDjaUtQ8wm7pxnrq2kCr2UKfcnnAU5bHNIwD1EXJTeAa8oI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=hiQJi6Xq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CyZ/PNqc; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="hiQJi6Xq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CyZ/PNqc"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDIc4b1537319;
	Tue, 11 Aug 2026 12:06:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=/Kh/S52QccfVU8kps1HIK2Li6lpXniNGnBDYLQuygaU=; b=
	hiQJi6XqkfS9ot+z1Bz7xzX3W5PJXg1vzmQMEeG8KcK+LgN4O7GCFkmUth2whGWS
	SGQaajJTBZGHhi+HtEDoAkVCEY3A+nsJATMjUeP61FLEBaWlRya+wcHRHkErZ/dx
	CIjO2Z+FOtfb5lcek4iRTzQYqklBUwB4D2oHcoRSZvxasJniUVXJMpJyFe0RbwqV
	zLzeeoWWL5/SS0oV5LDkDWjk1C0/8Hqch8azDu0xeCs3uj8rnKxn2L7+E0s+8SUP
	WWPPV8mo3iI1xOIA2O78eHXkoDVLGQDmSBmS2dofEgnZvO3VRjFCVBbHLLUqB1+S
	Zrp3RDICzu4QwLdkqjXtEg==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023097.outbound.protection.outlook.com [40.107.201.97])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4fx1v0wns0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 11 Aug 2026 12:06:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgIJklf3gXP4vtkmvIL2A3xKpFkT9j8LcB4bq4jL/vAXGVv+pYCrZ/YYHjczG8Lz201hkRIgjvTBRtDjaKgB0drxxcwDt8WxQS/29yXwHLfH6hOLKduoSEVpTWRODQeK/5pnumZdsRZJwdEW7H9hcD1VME6+RgCTuHguLXpUgK0j4B5VVLijMV57r2RUreYJsQ2+I7a/AtYXiSNYfbMKwLJtaqYDv+y8ZY/AH2l2teVuGScRCWBfinU1LJO+35IWvJQyIhEapp5UGleyHDk/urDnbJMfq6SIBD5PrvjSHwrqozdzU3zWF4BRD+j8xcEXG0bFJ4ZnHxB2sbLUrLeWWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Kh/S52QccfVU8kps1HIK2Li6lpXniNGnBDYLQuygaU=;
 b=dzAfL2yS5HQ98B0aeMca8nMXTRR5FZa9XO4lSaGjq7oMUVZ7b7hw8zE8i0xx1XNhquIlF5YTSOSDCfoY2Qx+DFfq5Y9Y3xGbzEh+wo35BRDlPOU67O8ZoccPSeNZ1FylxNxr4jqwtHlbzPdaeGr5bqISo0qvHxba+JG6/F5k5iBaTIofy77054g8EH6wAPn6+72VwVh9jcdAZbPW7KS7QdN1FMp/6LV0vj43Tos1H4RQyS/86Zi1JTr2+MjKO+lDMTTvTMK5eFWLdj1IlqBhOHCP+QTiUqGk6V4otIRKu/O0GJZmdnydvw8jgt2TLvkh3cHeqPtIwbrKfo7aLD1xwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Kh/S52QccfVU8kps1HIK2Li6lpXniNGnBDYLQuygaU=;
 b=CyZ/PNqcubbEH3EhzSXcDhKbbnAT2N9l3ylvSPYpZvoNC4wGoYlV86+QOklG55fRBzkTMdAiYFyiPhnGrj+o2Ygcnqj33+844qsUdRzgcxF2tLkFnQfqar/hMjGJFSmR4li1fxHCTfTifq514OqFIgr8c5AtEpBH2yI524v6l3Q=
Received: from CY5PR19CA0017.namprd19.prod.outlook.com (2603:10b6:930:15::10)
 by PH7PR19MB7384.namprd19.prod.outlook.com (2603:10b6:510:274::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 17:06:19 +0000
Received: from CY4PEPF0000FCC5.namprd03.prod.outlook.com
 (2603:10b6:930:15:cafe::91) by CY5PR19CA0017.outlook.office365.com
 (2603:10b6:930:15::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.12 via Frontend Transport; Tue,
 11 Aug 2026 17:06:19 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000FCC5.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Tue, 11 Aug 2026 17:06:18 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AAD9740654B;
	Tue, 11 Aug 2026 17:06:16 +0000 (UTC)
Received: from ausswws06.ad.cirrus.com (ausswws06.ad.cirrus.com [141.131.145.33])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id E6D0C82025A;
	Tue, 11 Aug 2026 17:06:14 +0000 (UTC)
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
Subject: [PATCH 1/2] ASoC: dt-bindings: cs35l45: Adds SYNC properties
Date: Tue, 11 Aug 2026 17:06:02 +0000
Message-ID: <58ab05c07319b1db14c55499feaeb95d369f9255.1785855013.git.rriveram@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785855013.git.rriveram@opensource.cirrus.com>
References: <cover.1785855013.git.rriveram@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC5:EE_|PH7PR19MB7384:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d4d86b82-2db3-4491-09ea-08def7cadc48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|23010399003|36860700016|376014|11063799006|56012099006|10067099003|6133799003|3023799007|16102099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Hmh5aEWa5tAWKk2OU0JVqfYo3kqaTUmLwJAgt+ib3bgZW3Gz9Wl2Z4eY0wPlVQksPtuUZKbQscsZ50bfQM8YkVAIJnF2pBIjn+Eha57iW0N0Zrl/0qACkcSroV3A+LYissJ723HF80yup7zbwmyPsZ7cqP2XfwMMR30zPXOMx/y+lfkvsm35Q+qu4gd+mCsVhkz9BtSKZ7gMtpVDqJiFbGjEZ5N8geFO3jkhf0v7u9c7XijiIOsWzZH3DO2+5Q60tH4jakGVYwOsfMi5oiH6w7whW3sK7ArBLqNo7lSI7cII3eOuZ+3/DWrY8ZowJ7KKDKW/52QqHwXfQcBa0fhD6VfAWqX/W0OykXb2WfP+KysmL7aOQ124uewBCzvxMYlYYcH4XRAnLFsrTkau0VuBjsAtTcrgPbPaFVuvxKWwnOBK1J47OWcDzpEw1t+4lno+L3fAUKSb4/OT/eKluy7O8057UfiPj8o5BObipP/MNFqi1yXYtAigm1T0a2QE3mI4AeP5lH4S5hYELJh10ZqD3tWHewknCB/uz+EM+8FlZHmSy8eUtOY4/uThVcW+VdsyQkFfN/TcrECpIEQjVoRLpExSDEO2MVmYSdVoeLHXGpjKtPPFujWdSDp42yhJxVVzBm8x/3/VmZEVxdMg6ts6cNinX2Uz8sTn0zFBGLSo82EFw0rJ87Hm/vqCq9z39CZqjBU3tgZgbQhatp1SSa7oug==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(23010399003)(36860700016)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(3023799007)(16102099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	X2GnVtVHNIaniwv41G/NgcbpXifuJTrM8CR8TTAK/znrpydezVWnCUkXriB1GVQYsDcDHP9BJf12lOKpKDLxVNJFgHQ2L5O39xUOnZhXNGcT1oRbI00tcPn4VbOYtmmQQdXoEJiudkeyP+/G8P5E3O7UZvA0QZSRU6n+9G2D3Js5p0jSMox139r2pyv0ZR3XMSWWORB5AeHoH3Ggtz4EJ/m6Xew9zbWi7xCDWOYDZFwG2n/qRVidBwOyDUsSuYKjT7bo7FRsOh5yzY8JTjxGvwSARgQHKTl8vrtyJYLWqstN6sjR+bDBLXxUAVMmHtx49Rz3fj9KkTyIfFIl+nCxmUaco0rsLQapEDn+JCCsX2MgHx2aNSPGk++IQJQc82l6rHZ9EoxIHpQNu9mUfDC5tKK4D8NQqIpvar1ntqHq55wUk7OtDMxKKoHjW//6CMiQ
X-Exchange-RoutingPolicyChecked:
	YeFeRtbgjAkNDwgd7H5Z6ba5+aI3B8F3elHetdF98OlQdxZolE4mwnKS3S9RfQ09xSzMIdKXP0eanJKddmTCsZLlgvliPCM65KkBmf43NYiTeaD0XwIkrQePVGvRCD0jqekX9O4YdwOCqXjIqC2P8gjjWyeW6ooesVfiXEQz0+RDlc3lPNBvuf7MS7ui8pnJurcogoMZPvcLfQUiaDJq8DhUNY0YoQwcdigmBjNJe5nwQW4jXAV6baXIeA0gnKFUyheZ1rgM8QC7LifP6UStdex9Fv7cVkvLLPob2RVuEUaDPnW3Jsatu4VVZNY/cgi781pgQ1ivPb7AWFxEDH6wfw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 17:06:18.1438
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4d86b82-2db3-4491-09ea-08def7cadc48
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000FCC5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB7384
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE0MiBTYWx0ZWRfX+XHpQE5zJZfz
 wCrGC2KSBhenNMVLmeCH0+43L9BoVTe4awdTsdfgtJ0Fq4h8aSWZnrGgODlJ631+9Eze4QxDCic
 uW97uOqjWeI27w3kcRFCeQ9iDlHfNwI=
X-Proofpoint-ORIG-GUID: 5QFpkeijVI1lOS1tn2I0ROCnGdr_GOs2
X-Proofpoint-GUID: 5QFpkeijVI1lOS1tn2I0ROCnGdr_GOs2
X-Authority-Analysis: v=2.4 cv=ZMrnX37b c=1 sm=1 tr=0 ts=6a7b5690 cx=c_pps
 a=XVr+MSEQQxWnM56OsALW2Q==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=KBitPqK-shNkJ_V7GXcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE0MiBTYWx0ZWRfX2xra3pnJhRuK
 lB8Jd/waXNFNX9YE8FpE9mkhsP3V2Y/xjR27yfc10gQlBjh0w7Spd3UwyAZgJGghkl5gPMNd6oy
 G0MFDAHcGB1me/ubQHk0Eec2e33xxu5UZAqJN3jAujYWcQqluSXTTuyjBHFbEN3BOdQ8v4T+MGF
 71XfEHDx2Dm6D8qfb+3O4S6O1CIGjEwNfX9nO8GQc+pSXm/VC3kLY4pMG9Hh0pD11nOpyzMd8hz
 zxW8RsEvSANhaAgbolw43hIM541tgWyspF7KSJkMAFLMUl5oe5oJh776oDhCvc9vq3qmZwkLTHl
 VEWoeeBMcpPXSkX85VJ5P9TTAjVndG7ZtmAY0+8l/q2pIubl5wn7+OeUGCTHGWsOpCPylLR+0Bb
 3TZlpm0phsfFuJJ8o/hxfH2G/+UYdVBhu3fPVMGDf7bNmVVp3978FCI2MQ5ZsnueASEB1vNy04A
 lBjJN9SxQzd5s3zOYPQ==
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

