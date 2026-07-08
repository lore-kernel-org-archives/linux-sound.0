Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A7442F6E2;
	Wed,  8 Jul 2026 14:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783519252; cv=fail; b=Ev8OY97xqzfHowe0OHdCnApa1SC7VFZA5SfiLQ9c/M+LrKZNY7jK4TZJyogjLMM0u3BV4cdejZZRCpfYmY9vszi6RiL1ziX/p49Grv7MJ/rQtzQLBCG7jmF5bSjG3eHixmNuZ28QW2mcD+XJukF13SNjMANrsWCJErmxRq4W+z0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783519252; c=relaxed/simple;
	bh=s/phrJnJ94XQmdpxaDe3K0YLGzdqNND0b2mb1Ua1eoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FQrBQSg7RCPESc8AdXhTLi6fswezeVSdnr8q6KqFNzhcz6pbCWaP1fLPjuwWGCOIHuxJ1iDZhD4yHMxGjsCIyF34R5Lva5kxUCoSC7JGvZLGdMs2RxjcZTs2xLjH+xKbC0Y2m4KllFuQ5N0whn4OvV+uwVUvzQZy0jFyLqfaY9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XbUvgf6C; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=MY3NBpFH; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XbUvgf6C";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="MY3NBpFH"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668CjG8m2436788;
	Wed, 8 Jul 2026 09:00:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=qmel2xJzJuFrsGBViSihoVEnZssy+bRLZoJqxgz5rhw=; b=
	XbUvgf6C2zs0QOHHJ5CLGSupAycYzvbn6GLV/8QosdMBdRuv6Pa9dHzX1QRXsvS3
	mVJTSSGJrTJM0C8MVe6SxDFtsSYz6EUwo+dg2y2Ie7m15DA5Q9Y/Plt/YNQtAec9
	tcAbO8rfJrlllYNqdCoHDswXRJOaVhbHaX8Qr19lQGQsiS4E4txkKYq3lXXzqa9S
	9Z8gTKhPL1cIyyzKcL4TrsGwlE9L+0Stlwv0ZlyPUFs6SWN7cZykAwSZ27UWVmc6
	wnjT9Pfw/R1ckkuJeNnxZROvX6NluQ27/fPyx0wof2DlzG3c84MU+eZGrUY3t5gt
	/BEa0H5JOTqrK4kIjchgLQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023140.outbound.protection.outlook.com [40.107.201.140])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4f6xkjpbf7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 09:00:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nbW99hqqr7NNULffNekvbRkcnYisD1ldhksN8W5XPL+DtolL9smabIl6RAqN4fM26HrmV0q3et9qcMf/usd3njPoleOpH1ySU7Z13n42MXHHGZ0bPdYeBjNDVx2pKTykDURfSXHBgFjply+8zMevlINFVn3a22QLu7/FuzI9TcpQWh3l3XcAiGgeMSC1vdVmAjlh4N4E1iTYz5TuIhOgyvv0Roiz4xYKvrGV0HUBuxNu1Zh+HHLJNAEVsyM22oEytKOGD0PnskfXyL0xhiiR7DlTSp8CIQHf2nmbFrXCoBgnTF6LjotzJ06zekDrKJCklnJrwT67WfwYJoJKiwX8rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmel2xJzJuFrsGBViSihoVEnZssy+bRLZoJqxgz5rhw=;
 b=YH7p6PyKE/rMLfvGyKzEs5ZCHxc17jAoB0HpdQLgEaH+s5aA40X2GmrcqVEcJg4SBVgYhQ0SOcuLMv0vO8Lw+b2init9HzV2I52Pf622NLicakTFcj8xPHFY+Mz6vRfhTH3hqGMA8oQNjRSuv8DbUuXms6TE+86wU3KHL8J1nNef2d67Eaa5PXOvnoc0zwSTuQiUwxXcKanRfsMoVvDR86qlWWGNTF3S1OBHNQOaqjgJCQbPEovOwUog1yretJ+NU81LZh4drRgn8oo8QqNmW2MOpXxSRzx1De8MRsZj4/FAoyV+WuiQyuCdATdXcQ/NOHWEzWXwq5h/Og+qG1GK7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmel2xJzJuFrsGBViSihoVEnZssy+bRLZoJqxgz5rhw=;
 b=MY3NBpFHujbjcA3e14ztMjUtvLuqQ2V9jJNMFYbsVLePYMZSmq5JCspBXDNZ7MOx7M5XaNxLDKC/K15qILx8uxveH5ovZHkWut8VZBA5ipZtWXwxfRTzXfpMBQXWuyHbpZ5GedTZnXERbRbbEjPm3rFT+xMuwrbkGTAHSkJhtzw=
Received: from CH0P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::14)
 by DS7PR19MB6397.namprd19.prod.outlook.com (2603:10b6:8:96::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Wed, 8 Jul
 2026 14:00:45 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:ef:cafe::38) by CH0P220CA0002.outlook.office365.com
 (2603:10b6:610:ef::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 14:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 14:00:44 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 7469C406545;
	Wed,  8 Jul 2026 14:00:43 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.12])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 62139822542;
	Wed,  8 Jul 2026 14:00:43 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org, broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org
Cc: conor+dt@kernel.org, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com
Subject: [PATCH 3/3] mfd: cs42l43: Add support for new cs42l44 variant
Date: Wed,  8 Jul 2026 15:00:39 +0100
Message-ID: <20260708140039.1993489-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
References: <20260708140039.1993489-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|DS7PR19MB6397:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 706efe54-f453-4cd3-efec-08dedcf94e08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|7416014|36860700016|82310400026|23010399003|18002099003|22082099003|16102099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	W5WkUWRcZsVjbiEwCPfp1umV3S0EavgpuIEV4bnDz58CgIekQaBmq34T6tireiiYlq6+LPE7HWaHEtbT6T4PEk96Kh4f7lKGkJ+qnsBnK20ZqnbYMMt7rab6yhvY09J4UO83xDiERiKVX4g4hEOf/oBUj1Hv51ZuTpD2yPVwRglEhliMWIuCyX8Vx2bsOGPcYwXhldIBkPLmXKQyoJ9LomvNlVJJO3fP/gxfVSmln9QgayF9NNotyeCuQ4lOkrXkrwhRqosyxGZj0gDwLZKdpdZ3WD6xcwVx1KzL/DjBxHcRGdO5EAPfVJn/fVlWqMqJYpS4MDaJe3gn7Mb5LzFPjJZBfjp/cvPMX63AkpJBeYJP9kIdGgiMyZtyc7CVyX/kwPlf5QIO8CSsbMMcssjBPiXSD7IiZTo/V31ixz7DvuCaIMKseDTyTfJLWTPtlA8SzUPWRoM9mFKfJDziI+Xfoiq3h6xpUDeEk/4S4pGfg0nw4AagvYQPSX/3f7nn6J7POCn5V7obZlMlMq4jvctdYiilC3IcB40lt5MOTNw/BztZANqTqUkJvrUVXoa+rMQt3AKx8o7kBDfR5PRvPJbPuyUyxYOzIeqTzLjW6MxwW8fF7U56pptE2wb0/QIQFHEufCmpHjV343+0cE3aIJUpYdYebNrxmYH0ysAUYMRQj7mYl5jfyejy8nxu5zHVBxkB
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(7416014)(36860700016)(82310400026)(23010399003)(18002099003)(22082099003)(16102099003)(11063799006)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	H7QWFzwEQ+xQU5m/PLU6GnKQSKofFTzYxPkJHQHBvAS9xg3G1lzOPc+5HBWLbCC1+QMLa+oRLhM5zqtJdHzSimOBPNEgp06wSeABEYGam/n9okLf+lxMrlNdVn9GNeBHE7ZePnxf1W/wVPfAl9qFbpdV5dwopecQeDYaIu98TfJTlYFneeTOjHwKnleSQ2rhQqdGlC+Vc4VBH8XU3407qZ8CKsLMth+DAXY2qwrdOL4FuJ1w9AfptslF4M8r93b8FYzsMEaXzKr2FP3/eX5gAzEec9r5IoTSo3NHoTkdCqW/tGQP4V7wt5CiLhe+ezZrLaTwM489kzmV+ARQyQk+Xb6hquZ0zuN7lhDrvF3dcV4SP8dvlJyFMsolSCaZXiPIN6o8PjXkybUCRWH2zeJvL3FgnoKcf8gvpdPLhS9jxIIEQX32WfZ8TRvHYxHaEh4d
X-Exchange-RoutingPolicyChecked:
	KHpo27rPw7VuLawuyHZXg5GdAkzazTPuUuwKl1eBIqzGF+/i67o9jUFqePuwMBRyk1ySz1yK3GYlMXKRONkDEXf26L0xlaqbjVQE5wNOSasjrar2312rPJvWBdL6YJZFdsAHpYiQIIRqoTUHblrIwLiqx9vcAdhJI3NDM+YAR1YYZ++3lgSBby5U1WgdvQmV2GLfkiJHRdXSqI+5DwVmdJXAJnnlcSoOX7VFfIY/Vgq10w2ReXOfvScYxYnQrCu8EHTteEsvyOItB7Tej427r1gqbBsZSNMHYcPTN7odXhhOQsGC0hxX/IB0Y/Ojm3bT2fcz9OFiMtFUCvGXymvDdg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 14:00:44.5002
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 706efe54-f453-4cd3-efec-08dedcf94e08
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB6397
X-Proofpoint-ORIG-GUID: WU6py3kuJw-j2Q9CiwOFUt4EYg5XNEpJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEzNyBTYWx0ZWRfX9XGIgRavH9GE
 DAPzfPDpaS0BDVXtA+hiNjM5M4fQKRl+wBG/O+nEFT6+jHi8OvQhF0LDcM9jWqGvV2+1QU8KOMX
 b26pzHkHf/um2Ce5XA6mlktFjFiKmuM=
X-Authority-Analysis: v=2.4 cv=YYiNIQRf c=1 sm=1 tr=0 ts=6a4e580f cx=c_pps
 a=DX7yn1dTRzwlA/k+0Vei2w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=60Gvzsy8St7UCt-NZO4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEzNyBTYWx0ZWRfXyfTwhgVpXjEF
 ccZ3DJ+9/dHkjphlCMd5YX+g8nfXHu3+kQY9NiF+odq/1z4AHbs9iohKYu7FFhoQ8nIJ3QbzVPN
 ZGc2xDYfYyBKiq7NGHPMK/oBQjPiiwxPRnpvyfhqIZkd3q4d0lqmRUvegrHFfySyTSBkXduNGyP
 unTT5Yne8thhcozkwz6HoIvSunr0csgAZXjUdIChD9kqaA8xIioymzGicFRA1FVD1bU/ubjDn+3
 E+5ZlaY4ePfr9NfCV3bIbj51LF61HHTBscH2FmAWZ+M2+XDAjUh/TbJ8Fc7GoFAV2KWdbma2N+9
 9o3eOL4scehJzS3WIlWrOqo+fPXdXb9tJadwkMzgw8mePBZEVEtby9HUW0XTRckPcxbIxhYWw0y
 Kgko0oqVa/XXFdC4CYVgRJP+sZ7d365Pc/Gn8iCf9iI10mM97sv01jj3MHphIKA/pQ69587RiTo
 tXYUbw9z5DQRdeEwUJg==
X-Proofpoint-GUID: WU6py3kuJw-j2Q9CiwOFUt4EYg5XNEpJ
X-Proofpoint-Spam-Reason: safe

The cs42l44 is a cost optimised variant of cs42l43b. Add basic support
for this new device.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/cs42l43-i2c.c        |  2 ++
 drivers/mfd/cs42l43-sdw.c        |  1 +
 drivers/mfd/cs42l43.c            | 18 ++++++++++++------
 include/linux/mfd/cs42l43-regs.h |  1 +
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/mfd/cs42l43-i2c.c b/drivers/mfd/cs42l43-i2c.c
index bd9752d2cfc34..1af878c7a20b4 100644
--- a/drivers/mfd/cs42l43-i2c.c
+++ b/drivers/mfd/cs42l43-i2c.c
@@ -59,6 +59,7 @@ static int cs42l43_i2c_probe(struct i2c_client *i2c)
 static const struct of_device_id cs42l43_of_match[] = {
 	{ .compatible = "cirrus,cs42l43", .data = (void *)CS42L43_DEVID_VAL },
 	{ .compatible = "cirrus,cs42l43b", .data = (void *)CS42L43B_DEVID_VAL },
+	{ .compatible = "cirrus,cs42l44", .data = (void *)CS42L43B_DEVID_VAL },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, cs42l43_of_match);
@@ -68,6 +69,7 @@ MODULE_DEVICE_TABLE(of, cs42l43_of_match);
 static const struct acpi_device_id cs42l43_acpi_match[] = {
 	{ .id = "CSC4243", .driver_data = CS42L43_DEVID_VAL },
 	{ .id = "CSC2A3B", .driver_data = CS42L43B_DEVID_VAL },
+	{ .id = "CSC4244", .driver_data = CS42L43B_DEVID_VAL },
 	{ }
 };
 MODULE_DEVICE_TABLE(acpi, cs42l43_acpi_match);
diff --git a/drivers/mfd/cs42l43-sdw.c b/drivers/mfd/cs42l43-sdw.c
index 6ccfdcd3f6698..81dd19df53685 100644
--- a/drivers/mfd/cs42l43-sdw.c
+++ b/drivers/mfd/cs42l43-sdw.c
@@ -184,6 +184,7 @@ static int cs42l43_sdw_probe(struct sdw_slave *sdw, const struct sdw_device_id *
 static const struct sdw_device_id cs42l43_sdw_id[] = {
 	SDW_SLAVE_ENTRY(0x01FA, 0x4243, (void *)CS42L43_DEVID_VAL),
 	SDW_SLAVE_ENTRY(0x01FA, 0x2A3B, (void *)CS42L43B_DEVID_VAL),
+	SDW_SLAVE_ENTRY(0x01FA, 0x4244, (void *)CS42L43B_DEVID_VAL),
 	{ }
 };
 MODULE_DEVICE_TABLE(sdw, cs42l43_sdw_id);
diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
index 33479ddd539a6..d6027fa4de705 100644
--- a/drivers/mfd/cs42l43.c
+++ b/drivers/mfd/cs42l43.c
@@ -959,6 +959,7 @@ static void cs42l43_boot_work(struct work_struct *work)
 {
 	struct cs42l43 *cs42l43 = container_of(work, struct cs42l43, boot_work);
 	unsigned int devid, revid, otp;
+	bool valid_id;
 	int ret;
 
 	ret = cs42l43_wait_for_attach(cs42l43);
@@ -973,19 +974,24 @@ static void cs42l43_boot_work(struct work_struct *work)
 
 	switch (devid) {
 	case CS42L43_DEVID_VAL:
+		valid_id = (cs42l43->variant_id == CS42L43_DEVID_VAL);
+		break;
 	case CS42L43B_DEVID_VAL:
-		if (devid != cs42l43->variant_id) {
-			dev_err(cs42l43->dev,
-				"Device ID (0x%06x) does not match variant ID (0x%06lx)\n",
-				devid, cs42l43->variant_id);
-			goto err;
-		}
+	case CS42L44_DEVID_VAL:
+		valid_id = (cs42l43->variant_id == CS42L43B_DEVID_VAL);
 		break;
 	default:
 		dev_err(cs42l43->dev, "Unrecognised devid: 0x%06x\n", devid);
 		goto err;
 	}
 
+	if (!valid_id) {
+		dev_err(cs42l43->dev,
+			"Device ID (0x%06x) does not match variant ID (0x%06lx)\n",
+			devid, cs42l43->variant_id);
+		goto err;
+	}
+
 	ret = regmap_read(cs42l43->regmap, CS42L43_REVID, &revid);
 	if (ret) {
 		dev_err(cs42l43->dev, "Failed to read rev: %d\n", ret);
diff --git a/include/linux/mfd/cs42l43-regs.h b/include/linux/mfd/cs42l43-regs.h
index 68831f113589d..4c00ceae8b461 100644
--- a/include/linux/mfd/cs42l43-regs.h
+++ b/include/linux/mfd/cs42l43-regs.h
@@ -1183,6 +1183,7 @@
 
 /* CS42L43B VARIANT REGISTERS */
 #define CS42L43B_DEVID_VAL					0x0042A43B
+#define CS42L44_DEVID_VAL					0x00042A44
 
 #define CS42L43B_DECIM_VOL_CTRL_CH1_CH2				0x00008280
 #define CS42L43B_DECIM_VOL_CTRL_CH3_CH4				0x00008284
-- 
2.47.3

