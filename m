Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0919F313E0D;
	Mon, 24 Nov 2025 15:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763998218; cv=fail; b=A0GGvSqHhF1Nx9R6XwhsJXBi4dDJhMAh+hGgRu/LrhVVb6cl80lj6iBvfucLFejtq12EGEZGZw8zxEIENHumj7z/XutVLCp1HA6Ea7kLBxAs52KvUWAieotCQlznXuKj63JHo6RuhycwZRcCGfdwC5swffEt/HXHJTXbZHp4zjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763998218; c=relaxed/simple;
	bh=N3fbkq4n6ZHBt2oKIkS84VWUt9lASjkafnps/+brgMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NdbQD1WwCUA0Ic0Vz9/qgOqReE+Cv5jkGWcqHmlQ1BFv4sYW4+GIXe2IsAheak+4XqtDPgwstR+NGLVZX2oOYWsUkHIn6o3k2lNWgImnfXBMqJZYeRF2JaciYNiZiMzbpGJPl4/t9x1yxrpL0q0i9daJV6ooE1m9zQPxrgn3vNc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=YjVhVOE6; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=Wa0xmOXI; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="YjVhVOE6";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="Wa0xmOXI"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOCTS001795437;
	Mon, 24 Nov 2025 09:30:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=iS1NRMskm3hpGTE1
	zK7oONqxw0mLaIaVKoVRl+5pnso=; b=YjVhVOE6qq0Szkq8/hG6x39xnNHNEfic
	WZz+I2xMAQpEqLLB4MyfwddOBzx39KGDOJIeyH8EbuQV0suZo+0Gu1WWHMn3tCTw
	zSQpaf0iAnuhil2TwDqfdYgh1LRqC/lkhpByZAXZQmg2ZAKYaAG+8GQ9I8R92BmH
	PLhG1qAljJML0y9/b6XmyDgnrSP+IcRi9lD6wKjGZupEAv6onmjMedEZQ2j6PdXh
	Mv1l4nMh9iFHsflLsYMwodWioC/zI4R5TNz4GaDibKSIl48yWd7A1MR08BeRxBKQ
	E2IfRKno/5nlYd5O7eWQ9Ir/EN1yu87b/7OUfkDxiZha/+wa90baKg==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020107.outbound.protection.outlook.com [40.93.198.107])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4akbf19uyb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 24 Nov 2025 09:30:01 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uzOudRlNqnHUVjLUvrJXs3yUK41IkSFO46K7t4g6UcVo8E0eWJHGMaPV2Vk/klApnBz5NUM/mBS5mLj3tItG0X2m7cSGg6Wna3hK2djedkLSisJm6zSuBQthPS6zvtrpjNXjr6f6Wn1C0Y9TFTWgYD4aREaj+IKHvLn9qRt6vOOVCiMaE8hYlIwZF4s2SaZC9hvKhrcLI8/CK3JEmOKcI+wrR8NX2nMluWqQc62IqKdHu+gQpopHKeg9vCEL1Hb2B7QxQ/b+NQdAXcmFgNr4G9VFuQ1mBgD++t1HN20sc7eZYBIYQxdg+P3iajvZyhvML4TlJyVYFdaV4lsmv+iX9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iS1NRMskm3hpGTE1zK7oONqxw0mLaIaVKoVRl+5pnso=;
 b=iMX+4kNLub++anNG52au1TS9kU7taaW9OVPgH6l3tXlvZZswtOX04LEB3YhAFKwPWo+jw+JEvf8urALBGhenLEAjOiR6HZ0fKevpUJpsIwqmM7J+wswNjENMBvB6PfUA6mW4rl4Azg9RhKgso79ek4MpzAV4M957qF6pJ14D8x9KBtqapgXvGEOSW1RMWQzM4LFWr0uS8Dqtdwc3d7QDW/t3kWzC3b8+f4rGsHPXL9l7x5yPIAUPGYQX/nlTap4b6LIM6WlYU1xgv876TOg2Rks5iitGKFz6sNwY45t59RV2zF6tDouygQX9dX+GVWIv8KG4bVxAZ1peGVEiIKk6rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iS1NRMskm3hpGTE1zK7oONqxw0mLaIaVKoVRl+5pnso=;
 b=Wa0xmOXIA0X7qJlK3ERAlWbR3BZsnHwEPt5mpDL/j0ceQ6iJxxymYGUAy/ShraN6EfzbcQBOvnn0TDpbI723KGWR1CGkiYRSlWK5JyLhKllghqwFNsbVNitmzzi2gXvodDFkhzD2MU7A3FtMPYzbEZs9gMJA1nWHOKSmpJXddmU=
Received: from DS7PR06CA0024.namprd06.prod.outlook.com (2603:10b6:8:2a::8) by
 LV0PR19MB9717.namprd19.prod.outlook.com (2603:10b6:408:328::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 15:29:58 +0000
Received: from DS3PEPF000099D3.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::ae) by DS7PR06CA0024.outlook.office365.com
 (2603:10b6:8:2a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.17 via Frontend Transport; Mon,
 24 Nov 2025 15:29:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099D3.mail.protection.outlook.com (10.167.17.4) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7 via
 Frontend Transport; Mon, 24 Nov 2025 15:29:58 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D8447406540;
	Mon, 24 Nov 2025 15:29:56 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BF639820247;
	Mon, 24 Nov 2025 15:29:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] soundwire: stream: Prepare ports in parallel to reduce stream start latency
Date: Mon, 24 Nov 2025 15:29:56 +0000
Message-ID: <20251124152956.2293218-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D3:EE_|LV0PR19MB9717:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b1921169-a9ea-4f44-3eae-08de2b6e53ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|61400799027|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?t/1c3rlZ4VtkGQ3cT+CmoTYUghxZN7PpTzn/q6kgaOARIa7keYY/8F/yvrn6?=
 =?us-ascii?Q?TAnAQBlpExcL2v+vcgk8AQdyCKtH/Um5Eq0ZaQXpNwE7k2YBhaoHzfAwvZrh?=
 =?us-ascii?Q?axoV/eCWH8WeRQwbPCDJmMWumLo4y6l8vCDGUwaGcOPnlCjePCeQxc/JV52q?=
 =?us-ascii?Q?fCqh0yZt4Va0MmVrazxk2MFNRN4A8UthUFeqOY6gV9nSQlBmux61+8E9rfoW?=
 =?us-ascii?Q?3TmWaU6CQWtaZNGLZoEzEI2Zebga/ZOIldlPWG3mNtqc7ygABHHM9grRSBK5?=
 =?us-ascii?Q?1PtE2YIaoq+Wx4ont6vi5he8FHB6G6wd2yJJsFzrwL3X7ok+FlTdJE+e/ABM?=
 =?us-ascii?Q?VHPF7cYQql6gUMkdldUtPlcRgfTinQkDlEFBCiOO7MCcBQgJAgGNE6IAs1Rp?=
 =?us-ascii?Q?ufuw/AW6mNdv/M0KU+BF7PRre+Dx7l9N0J+nGtiiBYmOCC9j5+FwZXlPg61B?=
 =?us-ascii?Q?vPuT3t50Vs9Cxr71/vkaoXSTArFhZ4/Kr9GShRPA/Ql0iFnOOjByYnvRbMEc?=
 =?us-ascii?Q?LhBIz1aNlt+cLIJlUJxz+2IUKF7gCPJu24SS0/h3/dwq2+13LFunGBKNbwNs?=
 =?us-ascii?Q?y16BZ3TEewQsisgM3wNgnyOeaHFne6dYBG1qujYwQhQ7N6QeIVX9QPcNMEnA?=
 =?us-ascii?Q?Zl8PeeMQKW5b7Jex+1Ew016ff+DLihM0xct3FVbQAftOb6MCeqNNY1uf38z5?=
 =?us-ascii?Q?R5cjJjkKyDP7ivsGAkpyrxa6rSHGuKlLrYDccaTU2iis6E3fwsibMhlU2LqE?=
 =?us-ascii?Q?brWFfBFC35rfqdvJfJ3r/M+1x3xe0aqp1ZbV0vInaQ8zKoEV0Obbw400N4BO?=
 =?us-ascii?Q?dEXdAU79DKIpqr6Sw0Hrv9652Hzz9MhWzvcO+CseU2F2cf6o2YmI5Ft6onYX?=
 =?us-ascii?Q?aJPdFmTOBICqe/JTn5yTm6u8NiFxs6edxEYwKoUUPM76vstzzhp2eqmULIja?=
 =?us-ascii?Q?RZzoK0+HIXbqYC9F/1t2BxsmE4FePM4yhQGu7xjEmWSlnUg4h+i726LLxB1V?=
 =?us-ascii?Q?OxAyiATZNGLW7MdIaG4qbIaKW7/1t5/6+Zq8gJPGeF+cBrubB/X3TvrIP+Mk?=
 =?us-ascii?Q?qQLZy4Ll/f0LL3CHV3TkpWPv5SGEX+WsEAi37URl6QuHr4CFZq7v+Apl+NMf?=
 =?us-ascii?Q?nisVnVE0YmA1mJH8AebMOdzmDCFt7xrT/YM7xic46E3ZLzuvHkWhA4Uctub2?=
 =?us-ascii?Q?Ni/uQtvziIXBj2HI9BVLCutf3bcjyh5MlGpG559KAEGNuRko5UxdiBhbt7g7?=
 =?us-ascii?Q?Xx2/qnvPA/QGIKbi7+jynzfGVIoinOPM2Fl99bDs3hzmS8MGAOLyq5WGkyIA?=
 =?us-ascii?Q?Cq+jNH6quSm6HhcpAW8z+1rRThyAiHQcgqEAFmRDOYFYK8+CfA3PTAOSwMTg?=
 =?us-ascii?Q?pey5P+4UV3x/o6gfklcBfCfAe4eEDTmzG/u+sJAldZBiZ08GQiAPMa4Sx65L?=
 =?us-ascii?Q?eodox28FJE04B+7FQUs3Ji4uMdWBdCtvXGwS/RgmuQdrsQOZPLTFqXq9cL5i?=
 =?us-ascii?Q?ZZSZXfa5K96saCFkp2/3+6PjLNuHomd/xMdODgzWXThjgW7ifcjTZymENUEh?=
 =?us-ascii?Q?Pz6vFxxplPyCcOJnaYA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(61400799027)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 15:29:58.0658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1921169-a9ea-4f44-3eae-08de2b6e53ac
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099D3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR19MB9717
X-Authority-Analysis: v=2.4 cv=caHfb3DM c=1 sm=1 tr=0 ts=692479f9 cx=c_pps
 a=lpCYFv1dv4XKb4XztGS+VA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=U2mTfj3WJaeVhp2YELYA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEzNiBTYWx0ZWRfXwZNjXFxrAoL+
 1PzDp8UwLpTm51vCAkRUxNttsP5srtnxeSSFthJUmPewMY7k7Zi8OLQ64O83Oq1U03bLi/J5FVx
 rASf98diXrrJrinFgdolSNIM8yl+mPpVdKMW4sjUUIQ7iAozfdcS3CEyGbLbGmhemtO8cM2ago2
 uq+8+7Qu/pPbYZZ1RMZwMDRE3OdmSfTp4Ap9ZcKc+6Nm4BDOhcxdmZqMcWvMtJddXiITS1/DLwG
 dI9AXmjo+iuryz8RzTUst8fGHfQwuwYdbUvctRYrufvSJ3BdZU0NWCTStmyJXnh1nl+RpsmIs3Z
 JjvJj0CXCjTguEUmVOKN3qtrL2cOeovGxO+dmsazL6GkuPZStkXOuwUDs7uXA3HIQ181SPNmUbQ
 zhUXnor9TnwRKRPj/i6G8BGGTI9V9g==
X-Proofpoint-GUID: 3s0MQXWSSQwmxG67ZDy8RTcfeKKZLXFV
X-Proofpoint-ORIG-GUID: 3s0MQXWSSQwmxG67ZDy8RTcfeKKZLXFV
X-Proofpoint-Spam-Reason: safe

Issue DP prepare to all ports that use full CP_SM. Then wait for the
prepare to complete. This allow all the DP to prepare in parallel to
reduce the latency of starting an audio stream.

On a system with six CS35L56 amps, this reduces the startup latency,
from runtime_resume to all amps ready to play, from ~160 ms to ~60 ms.

(Test hardware: UpXtreme i14, BIOS v1.2, Core Ultra 7 155H, 3x CS35L56
on link 0, 3x CS35L56 on link 1).

An initial read of DPn_PREPARESTATUS is done before dropping into the wait,
so that a quick exit can be made if the port is already prepared. Currently
this is essential because the wait deadlocks - the stream setup takes
bus_lock, which blocks the interrupt handler - so the wait for completion
will always timeout.

However, an experiment of removing the bus_lock from stream setup, so that
the interrupt will work, shows that wait for completion takes ~700..800 us
but the quick-exit read takes 50..200 us. So the quick exit is still
valuable even if the stream.c code was rewritten to allow the completion
interrupt to work. Rewriting the code so it doesn't take bus_lock is risky.
The deadlock only lasts until the wait times out so it's not a serious
problem now that the DP prepare happens in parallel.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/soundwire/stream.c | 100 +++++++++++++++++++++++++++++--------
 1 file changed, 80 insertions(+), 20 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 38c9dbd35606..cc469a4a0bb6 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -443,14 +443,12 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 				       struct sdw_port_runtime *p_rt,
 				       bool prep)
 {
-	struct completion *port_ready;
 	struct sdw_dpn_prop *dpn_prop;
 	struct sdw_prepare_ch prep_ch;
 	u32 imp_def_interrupts;
 	bool simple_ch_prep_sm;
-	u32 ch_prep_timeout;
 	bool intr = false;
-	int ret = 0, val;
+	int ret = 0;
 	u32 addr;
 
 	prep_ch.num = p_rt->num;
@@ -466,7 +464,6 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 
 		imp_def_interrupts = dpn_prop->imp_def_interrupts;
 		simple_ch_prep_sm = dpn_prop->simple_ch_prep_sm;
-		ch_prep_timeout = dpn_prop->ch_prep_timeout;
 	} else {
 		struct sdw_dp0_prop *dp0_prop = s_rt->slave->prop.dp0_prop;
 
@@ -477,7 +474,6 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 		}
 		imp_def_interrupts = dp0_prop->imp_def_interrupts;
 		simple_ch_prep_sm =  dp0_prop->simple_ch_prep_sm;
-		ch_prep_timeout = dp0_prop->ch_prep_timeout;
 	}
 
 	prep_ch.prepare = prep;
@@ -518,23 +514,16 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 			return ret;
 		}
 
-		/* Wait for completion on port ready */
-		port_ready = &s_rt->slave->port_ready[prep_ch.num];
-		wait_for_completion_timeout(port_ready,
-			msecs_to_jiffies(ch_prep_timeout));
-
-		val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
-		if ((val < 0) || (val & p_rt->ch_mask)) {
-			ret = (val < 0) ? val : -ETIMEDOUT;
-			dev_err(&s_rt->slave->dev,
-				"Chn prep failed for port %d: %d\n", prep_ch.num, ret);
-			return ret;
-		}
+		/*
+		 * Defer wait for completion to allow all peripherals to
+		 * prepare in parallel.
+		 */
+	} else {
+		/* Inform slaves about ports prepared */
+		sdw_do_port_prep(s_rt, prep_ch,
+				 prep ? SDW_OPS_PORT_POST_PREP : SDW_OPS_PORT_POST_DEPREP);
 	}
 
-	/* Inform slaves about ports prepared */
-	sdw_do_port_prep(s_rt, prep_ch, prep ? SDW_OPS_PORT_POST_PREP : SDW_OPS_PORT_POST_DEPREP);
-
 	/* Disable interrupt after Port de-prepare */
 	if (!prep && intr)
 		ret = sdw_configure_dpn_intr(s_rt->slave, p_rt->num, prep,
@@ -543,6 +532,66 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
 	return ret;
 }
 
+static int sdw_wait_prep_slave_ports(struct sdw_bus *bus,
+				     struct sdw_slave_runtime *s_rt,
+				     struct sdw_port_runtime *p_rt)
+{
+	struct completion *port_ready;
+	struct sdw_dpn_prop *dpn_prop;
+	struct sdw_dp0_prop *dp0_prop;
+	struct sdw_prepare_ch prep_ch;
+	bool simple_ch_prep_sm;
+	u32 ch_prep_timeout;
+	int ret, val;
+
+	if (p_rt->num) {
+		dpn_prop = sdw_get_slave_dpn_prop(s_rt->slave, s_rt->direction, p_rt->num);
+		simple_ch_prep_sm = dpn_prop->simple_ch_prep_sm;
+		ch_prep_timeout = dpn_prop->ch_prep_timeout;
+	} else {
+		simple_ch_prep_sm = s_rt->slave->prop.dp0_prop->simple_ch_prep_sm;
+		ch_prep_timeout = dp0_prop->ch_prep_timeout;
+	}
+
+	if (simple_ch_prep_sm)
+		return 0;
+
+	/*
+	 * Check if already prepared. Avoid overhead of waiting for interrupt
+	 * and port_ready completion if we don't need to.
+	 */
+	val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
+	if (val < 0) {
+		ret = val;
+		goto err;
+	}
+
+	if (val & p_rt->ch_mask) {
+		/* Wait for completion on port ready */
+		port_ready = &s_rt->slave->port_ready[p_rt->num];
+		wait_for_completion_timeout(port_ready, msecs_to_jiffies(ch_prep_timeout));
+		val = sdw_read_no_pm(s_rt->slave, SDW_DPN_PREPARESTATUS(p_rt->num));
+		if ((val < 0) || (val & p_rt->ch_mask)) {
+			ret = (val < 0) ? val : -ETIMEDOUT;
+			goto err;
+		}
+	}
+
+	/* Inform slaves about ports prepared */
+	prep_ch.num = p_rt->num;
+	prep_ch.ch_mask = p_rt->ch_mask;
+	prep_ch.prepare = true;
+	prep_ch.bank = bus->params.next_bank;
+	sdw_do_port_prep(s_rt, prep_ch, SDW_OPS_PORT_POST_PREP);
+
+	return 0;
+
+err:
+	dev_err(&s_rt->slave->dev, "Chn prep failed for port %d: %d\n", p_rt->num, ret);
+
+	return ret;
+}
+
 static int sdw_prep_deprep_master_ports(struct sdw_master_runtime *m_rt,
 					struct sdw_port_runtime *p_rt,
 					bool prep)
@@ -594,6 +643,17 @@ static int sdw_prep_deprep_ports(struct sdw_master_runtime *m_rt, bool prep)
 		}
 	}
 
+	/* Wait for parallel CP_SM prepare completion */
+	if (prep) {
+		list_for_each_entry(s_rt, &m_rt->slave_rt_list, m_rt_node) {
+			list_for_each_entry(p_rt, &s_rt->port_list, port_node) {
+				ret = sdw_wait_prep_slave_ports(m_rt->bus, s_rt, p_rt);
+				if (ret < 0)
+					return ret;
+			}
+		}
+	}
+
 	/* Prepare/De-prepare Master port(s) */
 	list_for_each_entry(p_rt, &m_rt->port_list, port_node) {
 		ret = sdw_prep_deprep_master_ports(m_rt, p_rt, prep);
-- 
2.47.3

