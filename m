Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3F7328B6C;
	Tue, 25 Nov 2025 16:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764089792; cv=fail; b=f/6Sqgr1jT+PJMiUiXIVfpO30vY7l/y7Cj7WDojg+eDyG3kXoARPdIcixjbMmYbz7Bw9cZ0eimxYK59q1uwvFKFINuPRvEwv3hKK28G1+Fwjh7P1m2T4tzq2PpgxEWYkTViOhQBtHPmu10DQEhpdYw/CSNG7LjG5zyiGkICW35A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764089792; c=relaxed/simple;
	bh=aeQXlA4gOr9im3OppORAN+YKadi66VX6gF2Uy1ISVeg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IUSu3wo0M2ASpLXIoB9eHz+Bm5TUpody6v3Mant5vYlXt2zYHm3O/ls1sBvcj2RwHK7AYRGnL70AfL8PYkJcu7Ekb0Pl5k2Li3Wk5JN9IvcNOxDR5/g6O8rI0UoCuCXWIcQVOALKg7pEWn8GVWNFuQY3K63g+4E6olctmKgdxiY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Pypk3qRv; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=hS0jMO/c; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Pypk3qRv";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="hS0jMO/c"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AP4gsdA3663653;
	Tue, 25 Nov 2025 10:56:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=9PygsFqjbmO1jWt5
	IZdbmyaouOxcrzSSfbjnXlOnVcg=; b=Pypk3qRv4+k8SI2j8CO5rzkmgBtcdB+J
	pGzDjCveemGSYmg8Kz2Cx1awVBbzz7Buz9A84mpzOF4y/lvixxFcrybdKO+/4R8+
	YfH78UE2DTlaWIfxsTLrF2/YN2PCR0xZKHc6PL/BnfXIVtMHwwLLqb9yO9TE22sh
	/r/x9Pb3BT3OpCR/R1gAReMg1Tmxs4zJ+hWh/iLm/XiAxlgp/UdqhsAlpm7MtIgu
	GVoAOUhc1yAqpZUrEjjHWIzQAdpOF6fzA1bAAjh+CZOrmTD7DoPrDP8FbdKMdrUP
	bUPSgzphmaaqhXepMU6f5On/7zRntpCqpPsSGq1mujmk8qxXx51umQ==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023140.outbound.protection.outlook.com [40.107.201.140])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4akafkbbpd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 10:56:22 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KKYpzyD9evgDPSsX1goV9VO4lLXj13yZ6Qz6fil/c3Ku956GRc8VzsP4C3C1zYRlT49Emmi2muTPQJasJA0UXWIWempKWXBt/YpdcB02++VqYI/N3MfWVaS6Npx9tqoKI7sWz7jRISiIUyBRiNlaCSORzMvn7BlX8cp7ba2qn8LJw1OIlIw1Z5/Hl+pPI+Znqm/GkpKVM58EPciPJhIdQ1pSsgfCCiWN+29tLo8g0aOq5ej/RfGgOTtRvhFbjxLFSyUdijYJTk18XDg2/L3/Wk23o69/fegc8e17ild+/GaSeUxw7/fmB7v1HvKWxPLlezeJNAtQvWAzSaeMglStRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9PygsFqjbmO1jWt5IZdbmyaouOxcrzSSfbjnXlOnVcg=;
 b=xRiXLLOO8VicA3fg7vJA48YNcOqmS3++3RJ4pQ3TGR9rRFKl8O2JP7OBLv7POpLH6YGOzqg0SDQWCtGR3xQoReQLQCJnE0GKT7Cjzlt1vmkYQe8iiOt1/qUB8kB1BWLRlBaGBQV3iI02BHw5r4xDrMUDNVgH75TNB+4bha8Ug7tB6EuQLE87ifDReQYs+JGN4YV9dqZrEQFqT8iUKixACUEELW+chbg+4lai63py+HH7aaWTu6/aOxO6VaHjUK+4PNP0c5ld6a1IpoAgfynqgxmVRjn/VepwDRIlYzftuBhpg6hFjp3dfTxszS/VV6DahnNh4CT34ZA9zvklpCVPmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9PygsFqjbmO1jWt5IZdbmyaouOxcrzSSfbjnXlOnVcg=;
 b=hS0jMO/clzGgdz5FAVi6dy8w9EJhs/9HOIc0VEeVZlVQAR27sPjVURdbAQeCjOSZDFc8ZmMaL/xsxpIeJKQ6LJl8JjOZ2P/CDNhTw+2LT0wO0fIrwrcN9RhMP/LXfvR47mE7QlHvxNM9UstWJKJVT4zG9ITBu46qUa9KGgtU0QA=
Received: from PH7PR02CA0008.namprd02.prod.outlook.com (2603:10b6:510:33d::27)
 by MN0PR19MB8297.namprd19.prod.outlook.com (2603:10b6:208:3cb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 16:56:13 +0000
Received: from SJ1PEPF000023D6.namprd21.prod.outlook.com
 (2603:10b6:510:33d:cafe::ab) by PH7PR02CA0008.outlook.office365.com
 (2603:10b6:510:33d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.12 via Frontend Transport; Tue,
 25 Nov 2025 16:56:12 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ1PEPF000023D6.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.0
 via Frontend Transport; Tue, 25 Nov 2025 16:56:11 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id CAB25406541;
	Tue, 25 Nov 2025 16:56:09 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id BAEB582024D;
	Tue, 25 Nov 2025 16:56:09 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: vkoul@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v3] soundwire: stream: Prepare ports in parallel to reduce stream start latency
Date: Tue, 25 Nov 2025 16:56:09 +0000
Message-ID: <20251125165609.483763-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D6:EE_|MN0PR19MB8297:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 4655ccb9-c4b0-459b-4d5c-08de2c43899f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lUx+V33zszPwnisGc45iwhY1PBok8H7dJsV7dRQBJUh7gPSB2JgWoe8p/pt8?=
 =?us-ascii?Q?4gAxCt6qYZaN+CFUjDflOF8MnjbnZx1GBguHnOVN4u2oO+xDzs3m7NSpahT2?=
 =?us-ascii?Q?6lKw6yWk1w76Rw8vFnsbFa6guTXrAdh373b32lax+0FYt1JnLC1mvHVlImfm?=
 =?us-ascii?Q?OSLKaJvEoWztvI3aUa/GcN4biSFp3IOUmQhkJ4qUvRJ40FpKQBqBVvrj+XSc?=
 =?us-ascii?Q?Lumm2XEFio4Y79SmJYF80uO0b8Hpzr0pM/+dXnsRAo9QRo2VBONki4FvggrQ?=
 =?us-ascii?Q?FQvLs5rGUhb0UQOd79GKDz35J0MJPrQgcTbTlLZ6nksSpqP9s25+ImB4br++?=
 =?us-ascii?Q?jVoWuAEwQqOYguveoKR8jGXZBD/MnokrHJH8fVleoTDewWUFaowBmw82Mvgy?=
 =?us-ascii?Q?367XHpocatRZvPnUkqQsmfuWQX7cOpyxllZsZQ9Muof5EdF1K5qe7R8ZpvVS?=
 =?us-ascii?Q?psfQAv/B13u+5UJRrwA32l/KEAg3ukfyYa71lQdZiRElURTkt4wyOkIzIKCW?=
 =?us-ascii?Q?W8+gir/QNcuAz15g4CoEr3UE9VuvHz0TtJVBJ4npRts91T/VhBJVgEp2wcFT?=
 =?us-ascii?Q?CpqJ32OTPfVIu9ZdPBrJvCzl0jA7KKFJwBKfV3YPI5I0bTghmVdOk//VDksS?=
 =?us-ascii?Q?pubNyiQsyPOzfYsSFSpyWBF0B9MdiZdUAwhb2GKfR1JD+tDeRkJPN6D2cycS?=
 =?us-ascii?Q?ZBpZQilnQ5gzaWBFsWuC/Qr1U/ooX5ym3cU9S0pODprsxYwRAOJsC/dJizzY?=
 =?us-ascii?Q?noHYWialtOE7wOm5sF186W5sP3byk42TwER1PxQxZ1+FCxOnjui3ocvMD0wu?=
 =?us-ascii?Q?h8+hUSDvdaqmXrCWjaepU/Vu2UVPPyvuUnFlT3Xm4N8Q3/VkumCY2kuJgZp5?=
 =?us-ascii?Q?OYMr10u33n8bIQTpf3geL3YptvkrksgVzV/suNMn5q+WEEAZwvYWrCotLR2m?=
 =?us-ascii?Q?LDKzN6YRvJCSN+/MeenLTR9WMnHzFMO5YVPGHrD/XpiMdR4XiSxTc7RQtrC8?=
 =?us-ascii?Q?LDfVYnSIW3VW4bzxDY6lgYsufcV8RwOcybQVwRR130y7Icks4PxhK4obkeYm?=
 =?us-ascii?Q?9I2CCvbJwAkfDjLlGHEKnrkb9H64XQhjdUnNsz+c/ZCXRUFmJqnwR7Z7DBgf?=
 =?us-ascii?Q?4pagEsRsnxxJzPAahHFYNExepTGIe8wRZz855HfCXONZ5VUt32pz7+u46TFI?=
 =?us-ascii?Q?lMQqKdKn+H9hsSKLGhhvRjQcxfyQnRMK3yAJBxzJmzbrtmBOte7bH0sncCfB?=
 =?us-ascii?Q?FkxgeDv9woNwi9oBZ7boBu00kyOdNYLPk1gIRsOeScN96PbsgcR0DhAKkVnL?=
 =?us-ascii?Q?V455lMxO7IUsM1lGsaybzHL9F54b0sirYLoImtak6AXHLQcJ86NahNl2mbpB?=
 =?us-ascii?Q?6UTkxy28WVS43OOptvqFP2+v4DyVBQFyX1yTqxPO9jx7OhtszDZcigdXcRbr?=
 =?us-ascii?Q?euipakh7m5y+u1lWdCK2fvgU11JpuUpn15Mph4a228uSMzbJu3JUXxehNy0l?=
 =?us-ascii?Q?ORDzXla1SkxFsA6fkSrd78YvySG1KW0x88OrDvhv8XUCrA2dM7tPf6luIzVV?=
 =?us-ascii?Q?m9WyyLpAgl3fPmbPxwA=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 16:56:11.3137
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4655ccb9-c4b0-459b-4d5c-08de2c43899f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ1PEPF000023D6.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB8297
X-Proofpoint-ORIG-GUID: kSgp0innfHGtRsioE7zzDGx0U0MKVhqu
X-Proofpoint-GUID: kSgp0innfHGtRsioE7zzDGx0U0MKVhqu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDE0MSBTYWx0ZWRfX4v+eilOEodSC
 erIhCZrfZk4VdY/LfPWqjgLPmTn4iMBY7qVW/m2iApuannyxuAc2FzJQUJYz1Xy860GIHvoCJnx
 G8dXvT2FwGBekNVF9LmKoj8/sBODWIa4nfm8+sfEhJrP67vfR1VBm6JfIuzx3fGyLpDjFZzsm8b
 GKTzF1ernqVIDfEcWS4NYnK++09Ty0nsC2XGx+MTzt8wrRQ2XYdV5V3z8nh8MGae7QwjCtqx0tB
 2yKCDPyT8oG3QG/e285amYVF9RleYBv2J5fjvjKvXyWLYU4U0kzkfwlmul6MUf1xQM4GN0IAESq
 K5/7HUG3UN6Ihuhpbqr4WujGn5k63TTLwj7MJsyiGD1i7iLNMl4Nsv0/Xyisloj2AdKYm7sP7Yo
 tUobQn1XTZj++2WNjsVqXUErZc9lIA==
X-Authority-Analysis: v=2.4 cv=Dacaa/tW c=1 sm=1 tr=0 ts=6925dfb6 cx=c_pps
 a=DX7yn1dTRzwlA/k+0Vei2w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=U2mTfj3WJaeVhp2YELYA:9
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
Changes in V3:
- Removed duplicate deferencing of s_rt->slave->prop.dp0_prop.
  V2 saved it into dp0_prop, so use that.

Changes in V2:
- Fixed missing initialization of dp0_prop.

 drivers/soundwire/stream.c | 101 +++++++++++++++++++++++++++++--------
 1 file changed, 81 insertions(+), 20 deletions(-)

diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index 38c9dbd35606..15d66262ad37 100644
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
@@ -543,6 +532,67 @@ static int sdw_prep_deprep_slave_ports(struct sdw_bus *bus,
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
+		dp0_prop = s_rt->slave->prop.dp0_prop;
+		simple_ch_prep_sm = dp0_prop->simple_ch_prep_sm;
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
@@ -594,6 +644,17 @@ static int sdw_prep_deprep_ports(struct sdw_master_runtime *m_rt, bool prep)
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

