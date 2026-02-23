Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FF2214A8B;
	Mon, 23 Feb 2026 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771838483; cv=fail; b=YP+YoXBR1zzt3TslTi1HMbc1/C9OerT+iorNOu/aqiDamB4OCbWBZ7Y1+0SAzpR7NDUwB/5x08u56J/Roo/LwKFLU4WSlBMw1V9iRD0ZnHJwzZ/AkKmomKM1oeOvcD6IccdmvW2D2E/jfj1vGVBK98hbuZ9jdzPPmB0uFxIn8jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771838483; c=relaxed/simple;
	bh=irF1MC3KreFm86xfWBqHJAQNrtQSys1o8k7yNx444a0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=fyNLpKqIqyoPofhPq3+h39t1DNUmCpnl1zuBuyeskA7HAZ8+Nd8sW2ChcKzoMdxuIw1HtRe0ZpqMIO4xldw5veuXg9zT+zN9NeDYw7FgKQSHL6IoHV9jHkD7NRRhszHw70nXUxiX7+XTfwM0CDapE2+j6jrFOUquMpiPh5DauS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=X/2SJKrP; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mJKO5cf1; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="X/2SJKrP";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mJKO5cf1"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N5K9qs1041203;
	Mon, 23 Feb 2026 03:20:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=niuYGvBqEWJP3SL4
	dk9pRHD4mS7VWv2n0DWibZN7Bi0=; b=X/2SJKrPv+14hHBOiOrQMrEz+OHNpzNk
	nUpP8x4oeIXBceJUwGAkBFfH+v5efMNAtpNORq9YrhjqQ3oN1YFkCFlf8Sdncwr/
	tiTbtxyz2zkRV9DxLSQ77g1TaUegtrQW8V1BzgTD/gYgnT+6YnJHxs7uZjNwDHLb
	7++Z3N38feNyS2XaSQYjx7A6SQxzvFoNFUP6TonyhLAYhDL2lt5AhGdePTAWEolA
	8fiMCadI5N5g3prxPgd54uWP95nILW1VfEqW4aVm0ksVeICjBQa3nNOLxK8IzkpM
	QDn8+FhdY5KR13GByx+ziMRyfKObn8eJ3UouPnOxtOFmnkFfPpwL3g==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022100.outbound.protection.outlook.com [40.107.200.100])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb019are-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 03:20:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NPTcvvi+ka973VNofaml6BO9HQO/cHPYJVHeV0RoHJgT4jGyjJ8W8XbOxGs3t/xGQAahV2xbBKq2DzeKMY4n1oSYoetRV2xN900Ok5Tu8eah4dBFRgM8xk4vV5kRE1LvsOMPqEKoUwzuurAIlYFtORcojmt2ChgEwZUZ9i4Ztmp9Hzs9w8xkM83uYCW1xSqWgHV+nYtxxUl+Lf2zv6lJuHlogQcyi/9R4tDF4kz18miR+dZe6dIi4akrbo/CBzTcX7pBtBO8z5K7XgBLxC8Es2VnNF/5QUR8iG3q1Aj2qmTEqswE3MSZ+P4iFZjQboCdATZ9/G2QFwhCdUcn+2NPTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=niuYGvBqEWJP3SL4dk9pRHD4mS7VWv2n0DWibZN7Bi0=;
 b=VsZc7k/BzxmDTdqHbQ0aSlAbDfWzjZQmJuy+GfNdWL/YnlNBPDqAd8AE51QIMdaGwBNgxQIaXWNUvrb/Q7XGPguY0V/3iFRRF3LOpbwteVvUfLSB0AhqHJ8zUSa0wZdMpYf/kI9/55OYlgPX/pyVVYypODNSmiVj2a65X0PAAmBFb/bA7afs8LbiduL90MP5mPovSPkPQcREmF9Twax4YZ/aVzO4X2PgMZQqDDbddKx4SKbeZ+qCmMAl4ORKykchv/lZMdC8VM8d6lilV9w3qH47XmKTSKq+ggnOO2K6ajpYq8pNdWqIcfZ0DsZzzxSgnyiMpSJiobMrfiWdx6Ygnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=niuYGvBqEWJP3SL4dk9pRHD4mS7VWv2n0DWibZN7Bi0=;
 b=mJKO5cf1DLzctmyS6xARRfkPIv4wK4OAzNAeKrxeJBgwr77xaUMPnmhMhxm9BZy2fBRgMRylz53caU+SJVznahiXPy6KSX1b3m+qsMeCwBNtyjc1N9KKV3c+hwPeX6UvLz4pSp6JPn4iq5T0U/br17bR6wlEnQpHn1ec5DXiqcs=
Received: from SJ0PR05CA0168.namprd05.prod.outlook.com (2603:10b6:a03:339::23)
 by SA1PR19MB8927.namprd19.prod.outlook.com (2603:10b6:806:46b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 09:20:55 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::73) by SJ0PR05CA0168.outlook.office365.com
 (2603:10b6:a03:339::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend Transport; Mon,
 23 Feb 2026 09:20:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 09:20:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5DB05406543;
	Mon, 23 Feb 2026 09:20:52 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4244582024B;
	Mon, 23 Feb 2026 09:20:52 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: slave: Don't register devices that are disabled in ACPI
Date: Mon, 23 Feb 2026 09:20:48 +0000
Message-ID: <20260223092048.3695135-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|SA1PR19MB8927:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 1d2fa01f-fcb8-4dac-c7f7-08de72bcd887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yXIgyLp9OEQyXoVn5M5XzrwsKqvdSa03/suGKeRjN0skorksxgKNTVZyj0CC?=
 =?us-ascii?Q?ACXWEbnFw+Ds70xq4CYn4h42eZIXkreCPsElMp7KlxoA/IiKCc4vJ5fTCMbW?=
 =?us-ascii?Q?eHqkfS8sm97en2LNonUiagrM3xKOrt+pVuh1/t0m5XfjBDbisAZ5SkrLCfLe?=
 =?us-ascii?Q?4L8mN+86XG0VsKozkpSbLQx5rx25O66pOrrSk75sAAJfZK032ECXRGxrMX3U?=
 =?us-ascii?Q?br2rbsfPkaGGRKb/aLFKeDxfW2ANKxr8RRAqYgnVUDcSRECgtt9WGwZ//LmE?=
 =?us-ascii?Q?3kRPm0nATRkjRaWLorxJRdqxegUfu0TYUrFwB/QljUIo00Ex3VipIx2SyfJT?=
 =?us-ascii?Q?ftBZA/bC3Wph67V2jYZV19hiTaFwFgKZRsY43VjQ1QdBlz9yTmivcZXEpaZk?=
 =?us-ascii?Q?iO53b1LmDfEbWosIViOms9bgMvpufzp3wK1AKe6yg1ZYPzjHzGHm5mb2QZL6?=
 =?us-ascii?Q?JbnzWMHDIMTPNiA/+Gd2OhCYmcBRPTqtGMPOapbfho9/Ep45Bru+gSqzGxcS?=
 =?us-ascii?Q?C886ZV95gOGwHGuM+NoKJWkNBZMkc399g90yKpWO1G2K9do0bWrhaaMLGvYq?=
 =?us-ascii?Q?k2/7Mbrpsy2r2Ys45zKdI3pRLsyxiJKU71yTzY2D+R1bFGyQSRbEprr0FceT?=
 =?us-ascii?Q?32mjio/zLidSbSzTMpdpRBEkLAIlMBKiZMVsctKDH9h3sxVTnZt6ju6EtT+Q?=
 =?us-ascii?Q?PRKwDTOmwCrBjPDbiLbjusKdY7xMXrOHSI2CasjM54G/gxu65eTCHUSBscfK?=
 =?us-ascii?Q?xacLa+8hlGJQiUGaO6rhG5sX6rC8IjW1KeNiL9gDd5VQjMBi8K9Eyazq3vq1?=
 =?us-ascii?Q?P2xe9XmBOw0QGBFaKV9sskjxWUt4wgVGKeqDCmoZSr3+BwookNw0X+PvXcrA?=
 =?us-ascii?Q?YKYnk8b808gggI8ioGibiB6ZBNaxj5WOtCk0ngHF4C3UEMBz/7Yrl6/7rRlX?=
 =?us-ascii?Q?KhTIRbPFRIjJpg2XdJMGNHFoqROH79A71jgaUFbY/s0s5R3UHQyUkvyN9ObJ?=
 =?us-ascii?Q?rqfdc7TqYV/efiwxp5PlpbaTbrZ3gUc6VL5mlGT7g7CCpZD7TJIXOZnmoCgj?=
 =?us-ascii?Q?j52KzSArwGzlK6AkVMbYbbsdp0eT2aaVdcjCr0JLtXkxrtWFJqOi82UnqDlA?=
 =?us-ascii?Q?2KWaKE/FE/D/VDFlnpntSxlG65Kto/JSkoAOqkL8lKrNNPZkGl0XQMYcGtDP?=
 =?us-ascii?Q?pV3W4gtjBb2Cg67XytLhHaDnj6MJ5q8ZEmdh6J51cdJi+yYXQSCMhdj1Fs3K?=
 =?us-ascii?Q?7A/rFRyDUyo5Wc/LolYmWz/VshD9iFfHmQAuA+7TcA7qiRhXWT0jE/5okTK2?=
 =?us-ascii?Q?NMuPHje95m/3tfYEiOBYd2j3nMiRAyGzr0ZFItVJiGyeKLEytY1vNniigXYt?=
 =?us-ascii?Q?yexrKr83xzowFtop4Ud5+L0I1Tj3ECj4uQt8evhPaDJ/yGoJ6jw+w5DrCJA1?=
 =?us-ascii?Q?TCmavSapXBfZAIFkGLp5BN8LLrlIuznMdQSvNOo6G157Pl+Lv2I+R2RUjGwv?=
 =?us-ascii?Q?a08yvN3I9YEXA++w1OtqdekM2vhuYHLeyXjSZ92VAKDLOp8fTMVis0pB+Y2J?=
 =?us-ascii?Q?fa8rMp0glQICFI1DhgNCe/8CQS8wQ0s0Ynbocxh0fadYsu+p4d+uUcHE+ycV?=
 =?us-ascii?Q?O+XgwJmEh6Y+LDCR7M+pqDgkj+tPcCebJFf7Ll/dOh3/3EwfOgBC7xkf+tKp?=
 =?us-ascii?Q?4Ry9Rw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	9k6YaxU9fdikyXBU4EgQAfxdsFz+Row8nLI+ZlLF36lhum7MZgVb9d/U8GYI816bBtM7Q1JAJtwPNMq5sUobOLwJFdoRUu1NyLxJjc/3za4Yol6SL7FbORAkQILfPLr8nxK/t5tmz9Wtfyw5LhpgenDwjWpcY348Bz4hNgL2tj5+q0YYy5iaxeGqMpzTUkyIkypuf0AjPdW98nXJgH2QWUSLTZs8+r63qgM14cD/olHQGXD6TMYQh29Gwt5foQd/WoDcgiqWR45nIe78CWdv1IqWrahEH+bl95vGr9NaCS6HYmOZb9sCjIsFPGOcyp/7ZHk8gnWXMG6PU1TcfCsQudk0xiKw7yL0/+oS0lH4jM8cruXU6RQNYymlXIsmk89d8V2snO+hyH7/GXkrt2UV9TBi1b+ydHtWKibZzC1Aox3aWVbvfK0h0kSRLSEJfYlb
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:20:54.2061
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2fa01f-fcb8-4dac-c7f7-08de72bcd887
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR19MB8927
X-Proofpoint-ORIG-GUID: 0qZa_b7AZdQNJJxv0kYiBJSmKptMp6U_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MyBTYWx0ZWRfX+obrBQOsUJlr
 VuKBnmvsJfB4+HGD9Zf2Tg5mlBPRVQCtTUGqEFGWuXhFwyxKndEPk5ub4gGdWmmyJDoxnTl/faR
 YrB8zBeF0tRRm2u4/TvARcHmXxxxgD9eFuPHqD0ItIx3vzogh+ueVhXHtI3a/yK+THR2haJdBQk
 cXEpjMeGqpwwnBrKozzfj51zDRL42+UNqCTqNdE+pxw5z4XnTp+UOSuYW/VWk9tjstIcIVKWKua
 FM/3gDroLeKLylADzf+0W7y6YeKahkunPg57sy6SbTp/uLApL36NqBvP8TzWo/QFc2zn7EyuiHJ
 v/GiTcRdWrPoCqbi5LAnW0JzEexgxA9nZOoGgjckpdP1hSoAOR+3AjZkudReHX0VMWNMGu5GXWh
 T0AaByl/BffR+dKCW4//fBgf9BG8fiJBmrxULuR7v/ynX84Q5VRzgFwSszJ5zXvH+y2JE4d8BKj
 xD6nzbhmfa5yUB9SCVA==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699c1bfa cx=c_pps
 a=eFEjX9j3IP+CJDDqlGDD1w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=3GjxeR7P91oZG_ob4NwA:9
X-Proofpoint-GUID: 0qZa_b7AZdQNJJxv0kYiBJSmKptMp6U_
X-Proofpoint-Spam-Reason: safe

If a piece of hardware is disabled in ACPI it shouldn't be added to the
bus. Add code to handle this similar to other buses like SPI/I2C.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/soundwire/slave.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soundwire/slave.c b/drivers/soundwire/slave.c
index f5a3ca3b9dda4..ff763b692078d 100644
--- a/drivers/soundwire/slave.c
+++ b/drivers/soundwire/slave.c
@@ -115,6 +115,9 @@ static bool find_slave(struct sdw_bus *bus,
 	u64 addr;
 	int ret;
 
+	if (acpi_bus_get_status(adev) || !acpi_dev_ready_for_enumeration(adev))
+		return false;
+
 	ret = acpi_get_local_u64_address(adev->handle, &addr);
 	if (ret < 0)
 		return false;
-- 
2.47.3

