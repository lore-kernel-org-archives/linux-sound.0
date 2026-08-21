Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A707738F64D;
	Fri, 21 Aug 2026 22:41:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787352108; cv=fail; b=jmJBx8ZToaIV1EDBjqJHroy/Yb6+bqN0MWp6KHj2n0YhuMX8cPhvWd0YanXVvewi7Wt9x6YK2xRpLciPRANQeJtv6pMSNJU2C+MdxPuLeElZEkbSIi9FFSUY5KBvv6ALXFqcu4ajMmWPENwfifna2VX/6hPSRyCUTILI7zhmjPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787352108; c=relaxed/simple;
	bh=tHuwHJQuI45hqCaj3tPPjfow3eZtlrzdUMpdXXddoGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oceCm3QZX3+vwAYxczq7ym+jideaZrRT8e8vAgUSTImwWrIqnTFkyHNBxLY6EB63I5yCTFgYaNA3C1GwLW5Dj6uookkjsG/oZpjuGMHni1Pc06wDI3+24kVylbjMfnSKrBm6g89heqg/OFL1Z/qTHDy9NVJcB662OVpOuubfB98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=UmiKE4gq; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=fBjKei81; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="UmiKE4gq";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="fBjKei81"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LColwf1438427;
	Fri, 21 Aug 2026 17:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+ieF3PrmJSNwq8M5fMa2/9reI4763p7xe5R9kPoeqmI=; b=
	UmiKE4gq2UBlLgP+yPioNAR8fZgYGVHPlkjoSg5eZ9+upcbxO/oIvXf1dKCnSpYZ
	ymDfN2TtZy2KmsLZlvaU2RcldzhGTUE43JBUPimf/IM78HrL6v8ppxBT4ID5CRHy
	dRI4DK9vhfRUjuZKiPhS/DuMozKuV6M1+5W2TgBGGbilcGC0Oz6jp/Dhg7VL8NhD
	3u6/HIHS7PTbtruw6epiGTLW3jEa8SbgenZ06KIz5m6+QFRUGEk/0Ceoo/3N3aeN
	G0WSgGY7UUrN+cQgewGFvuQFpstq6bw9+czYn8KdUrAQA4pDs4EN2p6mkMwansH3
	6u/4fAEdU0R8eoUhZtHzZw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022094.outbound.protection.outlook.com [52.101.48.94])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4g4yda5n2v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 21 Aug 2026 17:41:38 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYaaS3+pbQYJreja3cHnPdaFnIN6h156YSzKgIB+ycuvKK6HVdOFZYHkoATMHACjnDNCr6w/OBDmcvq6jzUVDrb6wj5FiJQq4khA0Rpzr5TdRhTFtDILuddV7WYHnP6stCEI56RSyUg59JQBMgJ8V412W9ivPTx1l4mFzC0w1mdJmNZJdKl0Gzs76Qgc6dQkbeVrrt4Vl0iirwBbamaa0sAHRQZR00ZD3ApvpSX8x962sdxG4wrvoJx13KSMxmWmzaOBiMz4DBK2uBxFu4mNhktShWJmt+TvyMi7ys5MTNYeWiLy6IRvTkb7azzlP2DtRdbmZky4513vRVVsXNTqtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ieF3PrmJSNwq8M5fMa2/9reI4763p7xe5R9kPoeqmI=;
 b=SG9QDhrYWYX2+vdu+b2LF5nj3IQLw0Q9/6Jbal9c4EKsX/W6b5CJ16cCxNWTdRm77pjD0sBrt/v8IuRmpXSGGsTrF6APsUpQ/oOYXRtAK9UYQi6EYnj2Wm+NlvTCQgCLL3lPMgob23abwx/CRlTmHrAI1mYEJQGTT/ISpFwdEuZlxIbQjwAtUukp58SNkKKNAcU9oIL6HrbKn4byk/k55yoJyfsNUwf7HO3VOCFhmcK6oY6WHTIsEYalOivb0YjDnVSWPC1LepuPPtc36J9+1bhv0DJps6Oj5oiqOtjfm44uT3RmeyunazH7lcVcMRWjd/JqegC/78J8y+aJK6yStA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ieF3PrmJSNwq8M5fMa2/9reI4763p7xe5R9kPoeqmI=;
 b=fBjKei81zpyHnPsxtM87CqKDGVDiL0j981w+HzNO8sKtvyGua6/unR0cynARdAyrlvOEvMlGUrblFKvGVc+nrrkZkX2pF+TXIjeqLdHzguXuHWkGLZ3sID+R5XTdwWCyWRJTiuQzzi62u4MmadE4ylxJh5iY3O5ybcpAiKvcq28=
Received: from BL1P221CA0039.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:5b5::17)
 by SA0PR19MB4537.namprd19.prod.outlook.com (2603:10b6:806:bd::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Fri, 21 Aug
 2026 22:41:34 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:5b5:cafe::64) by BL1P221CA0039.outlook.office365.com
 (2603:10b6:208:5b5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 22:41:34 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.3
 via Frontend Transport; Fri, 21 Aug 2026 22:41:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 429FB406542;
	Fri, 21 Aug 2026 22:41:32 +0000 (UTC)
Received: from [172.17.0.2] (unknown [141.131.136.144])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 1D84282254B;
	Fri, 21 Aug 2026 22:41:29 +0000 (UTC)
From: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
Date: Fri, 21 Aug 2026 17:41:12 -0500
Subject: [PATCH v4 1/2] ASoC: dt-bindings: cs35l45: Adds SYNC properties
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-sound-for-next-cs35l45-sync-v4-v4-1-20d3a07c3b8d@opensource.cirrus.com>
References: <20260821-sound-for-next-cs35l45-sync-v4-v4-0-20d3a07c3b8d@opensource.cirrus.com>
In-Reply-To: <20260821-sound-for-next-cs35l45-sync-v4-v4-0-20d3a07c3b8d@opensource.cirrus.com>
To: David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787352087; l=1783;
 i=rriveram@opensource.cirrus.com; s=20260821; h=from:subject:message-id;
 bh=tHuwHJQuI45hqCaj3tPPjfow3eZtlrzdUMpdXXddoGA=;
 b=c6bYtg74jGDyFXkEbHOabNf8dzRldAu/VHUNdUs3l6r74PfCvpyDbTvMwTlKtPYe/95rvjsVp
 ZRBvbxebe1ACO/Ni9kiJX7dS4HoSiSn0AxXnPvjM2qJwIMaWmHZJO0q
X-Developer-Key: i=rriveram@opensource.cirrus.com; a=ed25519;
 pk=PWYAqW73jQepp6ORjx3V81remQilskf6ccMx0Wc1wUA=
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|SA0PR19MB4537:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fc600dd-3908-416b-da82-08deffd559fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|61400799027|36860700016|23010399003|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003|16102099003;
X-Microsoft-Antispam-Message-Info:
	WgSFx6Nwh63fMkIxHGfleUgOqyMy3Hdd2zniDZp1rLAId40nFT2bojvhBwEG9cwcHzOoBu5eFzreqMZxat9xoCo1N1qI9MRY5VIj0rbWJIiByYNSRlhBcbA63Q0NM06i21srd8JA7Nq0+CXWMjGPUqEoouw6xsKq15QPuDjhj72eNL0KJLwhbkHF8FdeeimBWiTp+H0FTwQkc2sYnI1IxCZ+kxUEANiabb8Lcgpa+SoSaTZ6wMRIriKHkmi7WaERfoCxeRX6WfsaGnjdyo9ct0fv7DVzkQOXrmb/e6yf+hfR/AteWkkmt9V8AY0ZBPZbL9ypTqvjAq+LsX4ZxJTTmhrZsvhGWb6azs5H3UQFv2tCnKi5u8f2UmPee824l9vod4YnOmkjO+5rns9Ai/n6nydtXn1wAZH+sZzNQhnmgWB+zGCkRmlC7C/egiLdxbCljea6RKDHzTjNpKBj7xYzKcM2L3zwD7wtjHjWkigyASBVLZdqeEpksLzZp/egwgzJ1B18QFjbDCy9hV+k1N9A8i3iK/jQdQfDhIu6QKgzBLnCyWtubefu0N+g2aB+JBF5fRDaJva1RvSMYXIq+nRtlvXJimopmDbdDQLHXTmPHYzDJTM0+0tMXxOd+zCCTz0qOAcpJtvcd4vm33Wvmk732eqwguHhOsgZ0leylW3htNoLdFayBx/PdK2SENi855PHNNmp13ybGEsPAvg6xk6XxA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(61400799027)(36860700016)(23010399003)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003)(16102099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	B+QKPNgTGYZNN7n1SpSLNLi7HsMfJCYZDlN2TtmXA8V5ZTnTeN48gVJ/G4+8x9iegbee7t1o7CxVFurtTwtjRpATH8UOP8q8QUFdbLVvGYAgepBWnqkrYcRl+7v+siHhw/7U1Dvub6t/dmyq5za8vQfEydFbn+TiRJZNvhWO3b4Wep51E8TlBgIn0KaNNtChJKIVoxM1o5wizy1NuioN9tCVwV4p9C/VMbo1bCmTpmRlGeCngJK7fyM62cx/TJ7UKvpaxwLcFTyN5Raxi59jg/bpltxvQEDitS9qR+BI9qU/N+Dp2QO8j5J8Wbx9/wu3Y9ik/snUfLp1Uo0Bqyh0zosb09raC+t1hdaze9a3iDKRK+XpRgBAlAqVbXAbzfeaPJqnQ11nANQSMbhXhCIGguYkKPHyiHP+AWrrpJLBWbmqnItF3OqIZbo9VokVklPX
X-Exchange-RoutingPolicyChecked:
	Ljt2z7gfsm0lYHZN7J55nS9r53gMnw+PJMzMGIOlxVdXpzOSFfzIkN4YcYNkkjvTP5ykUZbwrcOKMu/rR0bVhzZ+2aRt1hYCQUDy9ODxiVhjQTb02ZKn7q9MNoCy1XnXaC3nzZAEFFnnzToOgu8H+5Nh5WjlM9BsvD5vsTZIR5dEH/ruo304Z1Hpk9lIQcP6OPDUl+r2MXpyR/U0USbyw6BPltU2bw6RmqffEHaYE4Qguu0DFjeZuf7FEVfh8gU3pCmqPPlI+FXNSTOf672WXbbJBD81EiHRTZLIm6BKbpjt2pWya20H9qI3T3nVPGpOe7bEKA+gV33D38QxNEvBcA==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 22:41:33.3850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fc600dd-3908-416b-da82-08deffd559fa
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4537
X-Proofpoint-ORIG-GUID: hKdI4HKMVEobF2030fxBj12JOpYzR-Vv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDE4MiBTYWx0ZWRfX1ZwPH3GfO36H
 MB7uJ7lbCpx6rLMYtGvYBWAsQ+VtVwEHuMLwfEE6txQ3d32hjBhFi9r7TasWmifFUYp4rqZ3uz0
 ugIJGNr6grfpX/c2zqXGKkaZzljC297fFhzQOsdAc0A/JOuiE5GGpJ4gZiRgijRv7IEMFzGw8Qk
 +9lRCaU/bcY2niycGT3BNHobWo3msbHkGCpRCSPDsDwI6cuyk3UkWyrDXWoRWKJBpfcQjtN4jpE
 vURkkn0bHVF72MdZiXikXtiPErlaQiNIqvqztUQb+C6gidKv2mCym8105pHdtfiRHGiMbu2Q/9V
 PC76qdxvFks8FHTMUVBNIjHiNV3JJlPmAP4b4YtUAkiFSsJUI/+LcTkJE1zCy2rsdASrZKQ7o5o
 Zxhpt0tjnuhSr7Ee9gHqJAnsItOqrPCo5rJT2fy3itQYtqcIzXEieemelMznJiOhw4yEf88HZS5
 JH+XylKQI+teocFlTmA==
X-Proofpoint-GUID: hKdI4HKMVEobF2030fxBj12JOpYzR-Vv
X-Authority-Analysis: v=2.4 cv=cKTQdFeN c=1 sm=1 tr=0 ts=6a88d422 cx=c_pps
 a=kWDUzu7Sg0boEHrzbzcNEA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=KBitPqK-shNkJ_V7GXcA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDE4MiBTYWx0ZWRfX6eL3lAEHIqru
 XCN7fFRWorsVCxl7iJ1erYdpLf21S6VR/vZxLE4Qf1detGbzsqrD03HUXTQNFJDzxytTfMSrssO
 EblL/aZZWX0Kijq5v1ChvE3Z3JLegGY=
X-Proofpoint-Spam-Reason: safe

Introduces support for the multidevice synchronization (SYNC)
bus. The properties introduced allow for the configuration
of the device's transmitter IDs.

Signed-off-by: Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>
---
 .../devicetree/bindings/sound/cirrus,cs35l45.yaml  | 27 ++++++++++++++++++++++
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

