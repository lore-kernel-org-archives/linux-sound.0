Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9896937269C;
	Wed, 20 May 2026 16:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779295075; cv=fail; b=cbq5uamMirPxAUGd6CZwun89naMy/koi/d7Nt5VUZhg7MUQ/I0CLgXHbM8d/2FDcEd1rS1wF+E8XDNT5qxKuLL8gwg3gNJGwNHeb00KAufu8FwixGH8+gew/bR6Xlp3oW+zzEwP+XBqVR8eJQ/v/Mms3k21AStl985Qs2LmqFJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779295075; c=relaxed/simple;
	bh=NDzq6XF8fyshVzWuxmwp2sdJ2kEtwjk11NjVGUaRxlw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qwgDZSDu8GY9+KV3voqyhKhfOjR+JK/84r0uqLpg9PBMmRACj/2buNpVjHr6c4B2FXA0/YXdjMo1/Hr+FY5b/LGMovYw7PlgYwj5uN+UzZUoGO1x5+XtF+xx/q16FB0FIi6Z6gykKEeC654zGsD/vfonlHgIQQIitFHWJeIGVVA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=a0w+xZdE; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=vqShfgDI; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="a0w+xZdE";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="vqShfgDI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KCf0EZ1071208;
	Wed, 20 May 2026 11:36:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=+pUzBoTpzvgSRVLvXqIY9dGKSO2eMViOL59AE95V7I4=; b=
	a0w+xZdEQikurH3myJVwD5IkxSWp8AIAOEnwESk9FOa1lZarsJWa+6Ke4mRpy0uj
	5ZzB7mGH7ScxqAKY1s8O2IA6s0SIMJ2c9iLec8MN2nvNWiY1Rap8oVNujRi6Oi9r
	Z4btF+olPdUxcy3x32N+UF2bTEn1vLuWgUoC4NGmtcKRQuEEPJDUck5/UZt5+JBQ
	5009mmUxobPEZ38VUHIWmwlD8CIm2bf3bJRkXN0pqo02NCmZzRrQmUVf1kaRqbbg
	aigh8tI/BfNnNLaPeG0THKuEv6KB6Va2zmYordsXIfjIboqQBhL1X9jpG/AcX0Mv
	I6kwbwvxpEBZSgCIafnTGA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020104.outbound.protection.outlook.com [52.101.46.104])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4e93xch42h-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 20 May 2026 11:36:46 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=miNIlFVnqFvsLAHNdk+v76bLHqIlnmGvN1kceUHveKY5Y8chC5GYaNMxVVll30Wu99TlD5MgY/EgJzWOqonnsYP5/rwXGHtu/NCl93X4oQ5sS8hPXMeb43NpLBJ5nN0unqp+sROfW14hz6nF0jdwKNVYJb+J/JP8UPkhMP/duDpqz09UimEyLNjKXLJ+UcZq3kOMXn7CTVbxWPzJIqmKRQsK79O49MB5LbuG0NdyjBjbi0dXCH/5dVf8eqjuaxbMIl4Ky+LCkOHNnl62BRx+Pzdt/RMcA9Q4FEEMlZWxdu3ztjDfS3Hpz3KcokSk9br9l6X4xXN4pmcJlWejMjCfiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pUzBoTpzvgSRVLvXqIY9dGKSO2eMViOL59AE95V7I4=;
 b=cCGm/4BeqJBs59Ga/DH7aPbojPo8LtA+UokMAUD8maDY+xh2lNZVQQpJs1z9wT/+Uxwo63VrreatD5Ef9jU3EiqwuB1W84nbtD1w44d2WdO4HB6hCO3gOTE3UVGO29HuR1n7vP9gQfK4YIECUQakUyd7kRCkl91OHMn63zHJm4iTPYGFI2oPKys+yDCCsGhmYc6s5IDPD49AmeUt6VHwlc56aikJ3muj8k9mT+pKHH2e2k4YbD0QRzuoNjcSN8JPT+/ouP9vXjJ+SGA9XfODJUYLSWlyuDajJbhjy1VAw752ril5WRa989P0ZildfiUT3Bum9l4su77ieu0sTCJsFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pUzBoTpzvgSRVLvXqIY9dGKSO2eMViOL59AE95V7I4=;
 b=vqShfgDI+EvGzupB6gWOIEtI1X8UPODxNQpOiQ8Q005qfy0+7Pe8LCUXHFZl5A0lbEUsx8krGUr6DJ4z3NLdSTxKBXMG0ff+SLPT9U4K8RE9avQhuplIlMNrCPj5KWcy4hz1xi1iNKt2xqTZXyRQv7gi4qZXDutHs7HVKk9f4ms=
Received: from PH5P220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::6)
 by PH3PPF4FB38FDFE.namprd19.prod.outlook.com (2603:10b6:518:1::c1c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 20 May
 2026 16:36:39 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:34a:cafe::5e) by PH5P220CA0008.outlook.office365.com
 (2603:10b6:510:34a::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.16 via Frontend Transport; Wed, 20
 May 2026 16:36:37 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.11
 via Frontend Transport; Wed, 20 May 2026 16:36:36 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 4923E40654A;
	Wed, 20 May 2026 16:36:35 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 2DDE8822542;
	Wed, 20 May 2026 16:36:35 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, peter.ujfalusi@linux.intel.com,
        oder_chiou@realtek.com, jack.yu@realtek.com, shumingf@realtek.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 3/3] soundwire: dmi-quirks: Disable ghost Realtek devices
Date: Wed, 20 May 2026 17:36:31 +0100
Message-ID: <20260520163631.3300102-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
References: <20260520163631.3300102-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|PH3PPF4FB38FDFE:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e66be463-f3dc-416a-889b-08deb68df61b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|82310400026|61400799027|36860700016|18002099003|22082099003|56012099003|16102099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	4XXRkm3fQh2BMqOnBmqU2lnL6W3sL29YxhrsiN8o9IptKkI48v7CgJTXe/cytPMxbAcrsQwOfrM4Z2n+42igPnixnqk50lBEjqqYnl8BlitnhnqyMJ1ax6828A12D83Fw68UwvPcaEPCJt6OOMZfE+A0Fds1IuldX2PjjWPg0MBAYvZE0rOCPH2s5I2b3VMWwCxevnl1cZdQA1s3hFznMlgArf6l9tbYc1IXifW+YAUF/T0p6zwgvW7xvXX3KGRnhVRhm3z9ICDj1Hhs25BY8qGuop/0OaiWWIgLdoMIP1yj5+gPJzaq/FHW4MjQAliwvgb+TxymZ3MoQgjgNYKrCheZkofZihAh5I+D8O8mvUunHsALOz2Z3nqNzSBgjqHPODvJACdOBST0lliv+vDNKIr4Ur0foqkRehejdFF0bGKcgXfeg/0g6xDp2lvrG5jJovMw8vQjtbXFN64tApwmFtRCJRNbTC7hxxWpKBsDaCSdPnVUQRn/Z0cNbFphVtDfqHS/RYxlBzHFQ4RN5DW6JHPrbuoOX9le93g9pjRwC3aWSFxhUk2mztCMuaE3gqKWVGZ3D16kbwN/HCV4HgpBEeQNLLcwWQugDDgfq3P9jkS91X+6hvKN2KvINBtI7JX+6xPFB2bx0h/a9Rm/aSl4chXO5WW5U49D433RZsI6lAdDFqauhHVjJ45ZPcs4J22V58V3wH4x/76GhYxr4gNrgWGh8mAat7gYjywqPsrHGFs=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(82310400026)(61400799027)(36860700016)(18002099003)(22082099003)(56012099003)(16102099003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	I+jNv4C5yIX/8L4Z/4X8pWH5ei7Vs6vn0tC0UupNg4qzPxipgeEVk2oIMqbhtRAwbebrQcyHcQxYCjZSSlcfljF4I+7+N3v8dpKofgXwHzHSpZwL0xsk2tyrcxzd1svqO/0cjth0N+NZK3D53cvr41UgjyXJuXi4BoFBpKaijwGUJrls43ZwG8lpw1RPwdBxe9Tb5LtA0g2JWzO3sflowEFIX6WtldN5Ad6ck8gTpVK534B5V/DLWHdoerTfPU9mltveVfrFzeEBLKW8fRJV8/6AoqFnUqcIaVXi/HtZtqaorC1U10iyxdyFLn5l8G6+dvHm4sytgSATCskMVk+qeTO2fuJw6FWHzjBU91d0ktwYBZTKRbGucYUVFBSHMnKlFwhhPYpzH1I6gtK7cvY619bYXpK9L98onVhWPENutqHHs00t4qAFVkG0ACBZu6Un
X-Exchange-RoutingPolicyChecked:
	YxjwMCMSIhT2ee/lpVXPHsgBIACi/LOygQ2k1C0d3J9nOg26Rpc3lKq4qDPhCSmtkEL0I9BhRSkxiMiddIseBA/rWiX8gn/VOv92LECFT7aN+vLJpRDPgFk8/FdhEpKvtRTyminuP0Swdnpi9+n8dfGlkJntcH9CKzi7dPR+3pMvh4H+Omxzb3nXw75WInlaffuTJm9r1VOchHrG4aHtGziS6kTNFPWqvBdhWWht0bWC9LFLknRalUib4WbD6B8nsgfskaFPPvE3i2qamm5TW5o5zkp730CN2muXnhVHzXuxcLdMrjhEmTrPTol83Iq16C1A98B1q9SXX41FfntJ1w==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 16:36:36.5938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e66be463-f3dc-416a-889b-08deb68df61b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4FB38FDFE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDE2MSBTYWx0ZWRfX/rEbrmRKo/jj
 S1182HDxjxoqxqx6zCtO8IBFf9rDWazwCIeqHSl5e/zmDBDTxPd2V47iGaquZKyFY1YDJfTF03t
 3ZmYuSfc1uoUw43PYwIkSUb+ID2RC9gfbuDkJAnKQ9IGve42jaBXQgiSQ0Kc84DKqb6bf3JyjxJ
 PQ7LfgR0PXXJxN+arSk6LYnAV/tKAEVb37gH69dEolkc8V23xOUxdkMfPXxHABtezelnb9oEfLl
 lA9UL5OgBNF1oNILiWzbXBgHG6v4j2jBjxK4ZN8hIbkAs0wb0Tj3g2yOXCtEnHIGXbmd5kJK06k
 A+QnDpuoN328SmoqK1bhVSLk/1U/sywyPnrcZbz7swh3Vu1UPDxkS2OljA8HzKmefCogoaGAVpk
 unPnPB9VZb0qP95EdTZT7To2fbzBcUFQIOfjNXGA8Y9czH8dUikATLos1T3Um17GO0EKmjmpJoO
 qt+2Gm/jYXTb9iqBfYA==
X-Proofpoint-GUID: PQ-orQamo-HnvgYpmIY_0NZnZjl3vi3f
X-Authority-Analysis: v=2.4 cv=Wrgb99fv c=1 sm=1 tr=0 ts=6a0de31e cx=c_pps
 a=y/6OeRevqtbd3HODipuDjg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=Zb5XEA37cf-f1xfAQQ4A:9
X-Proofpoint-ORIG-GUID: PQ-orQamo-HnvgYpmIY_0NZnZjl3vi3f
X-Proofpoint-Spam-Reason: safe

Many systems ship with a Realtek audio codec in the ACPI that doesn't
physically exist in the system. This confuses the newer function
topology system that creates the soundcard, as it builds the card based
on the ACPI information.

Whilst we are working with the laptop vendors to try and stop this
happening there are quite a few systems where this has shipped. Add a
quirk to disable this "ghost" device.

Currently this patch should cover:
 - Asus UX5406AA
 - Lenovo Yoga Pro 9i (83SF)
 - Lenovo Yoga Slim 7 Ultra (83QK)

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/dmi-quirks.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/soundwire/dmi-quirks.c b/drivers/soundwire/dmi-quirks.c
index 5854218e1a274..32a46a2d90f7c 100644
--- a/drivers/soundwire/dmi-quirks.c
+++ b/drivers/soundwire/dmi-quirks.c
@@ -90,6 +90,19 @@ static const struct adr_remap intel_rooks_county[] = {
 	{}
 };
 
+/*
+ * Many platforms have ghost realtek devices in the ACPI that don't physically
+ * exist, remove those devices.
+ */
+static const struct adr_remap ghost_realtek[] = {
+	/* rt722 on link3 */
+	{
+		0x000330025d072201ull,
+		0x0000000000000000ull
+	},
+	{}
+};
+
 static const struct dmi_system_id adr_remap_quirk_table[] = {
 	/* TGL devices */
 	{
@@ -164,6 +177,28 @@ static const struct dmi_system_id adr_remap_quirk_table[] = {
 		},
 		.driver_data = (void *)hp_omen_16,
 	},
+	/* PTL devices */
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "ASUS"),
+			DMI_MATCH(DMI_BOARD_NAME, "UX5406AA"),
+		},
+		.driver_data = (void *)ghost_realtek,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83QK"),
+		},
+		.driver_data = (void *)ghost_realtek,
+	},
+	{
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "83SF"),
+		},
+		.driver_data = (void *)ghost_realtek,
+	},
 	{}
 };
 
-- 
2.47.3

