Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A292EAD09
	for <linux-sound@vger.kernel.org>; Fri, 12 Sep 2025 10:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757673332; cv=fail; b=FuMRKvBC3LehbHuXeTGdPbaOqlHejTOS7ejZ4f62LxVrJhyl72gUDkBLcpIb1DNczIKjDsg66CO7G1lUGCZEaKoEJV2f+s2rzqCoV9xeEJbE3AvkGQ3HF98SdDneZHn9+227MNsBtkZsebRIKoh8HeqEjkcHDjGWYKA7QUXRNRQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757673332; c=relaxed/simple;
	bh=DvlsP8EbKpJLCKmzB5g6eg+orfmfZfljCF+Eo2aO0Tk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AOVDPsrspO3krNcaimSWg4xHO6fmvVGrgCJds+ApffHRYNIkmHA5vCPXYQx1tdPFFyG5gyOzZV9vuwkJA+3APe/mCMF5mB+hL/cOZ+OymW7GLoHbMuKDxlSnIEKzVZz8d2ky4FUeAdSlw21Pfx9K1jB1M8c3Nlqg9cUW18Ns+JM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LP33V78x; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NBw10wg0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LP33V78x";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NBw10wg0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58C5wngg3620853;
	Fri, 12 Sep 2025 05:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=qrGglmKRrYIJ+o2k
	Qk+s/pbbrWw7lck7HVhV2+NvYGw=; b=LP33V78xb4Ibpy4ZN/Mz7eF4sXur5qMm
	mT1y6rNhLPvhrGZHSXs12eL5NVBsrmZTvLyUlcppzbWKbJbKoODTIwUkevhuJPeV
	JWOqIftVt6G7T+kicIbpu6WWGMSaA6mJX73Eo7s4V5BaYPsRoVaRVOjUvFvcjVvJ
	1jrlQnplUjZMBo9V/WpB4TuVtE/+1ZxR1nh4Ow8GijMn+/HwF2LW9aCMVd+qzSpd
	hJf8coIbwgxSp+9RoHSoM6ogcK4rL0AubOslsiYY0RqeCJXHShtSCzaDu6L290i1
	U0V4dZbCq6QA84plPsg+hZwbtcwk+Ug9DZUxiRe/vLzs1FyiQa7QCA==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2118.outbound.protection.outlook.com [40.107.243.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 494due08y5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 05:35:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OtvtcS3UINABPreb/BD9ADW8vE9Pb+b5EG2w4S8KH0ABX+3NiIzbs8fpdK/JSRpbJU0+aKp/WBYDJqPpHfJjjoKjIMzLEdx4fWaQnO8rPTN1i9ATpwruH8MGXLCNjYsoGfyb9GbBbLfc9So5cLe3738eRlGkhBr/qLrwqF0iNldq+zyBFk8NLtKDtfhsisrxhyqVO+KLDIyOmE7pb6RpCqUwtOebuRyQTf8ntfZBxC6Fpe1dhidXPM7zMUbe0/hevSWhTSs6Hf7M0XL5z7b+/UpQKjKeTCUu+v80zd0KxDTYWVCM/g2bS8tqjMrmUVA9omrx0VFxDUlJMmciIZxRlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qrGglmKRrYIJ+o2kQk+s/pbbrWw7lck7HVhV2+NvYGw=;
 b=BQ026yke32DmZv3EuXq2P9VksTsEL+/sYjauoGn38kvlxDp1TpXudeqhN9pLpuJUuwYgQMyTmsj8m6PnGs1YaZ4ZPMdiGMBgMjuG9CZ24++qME2P4rgAkFx2iiq2tnzo514B771y9VjMku9WBeClzb9o9O9QGj2TwmB98ZiJEkpqqfI4uyFCyqr1rOvnuQ3c/Ki3/4Y14q/zNcUdNWwOGmdDQ/OYBjgDyVQyJNFzyNGK8Zgn3HYT2xc2EGeXMpXhHeuXA9t/dXggDa3Xwd6+SW3ch1SHY2kzpjwU3/Cs76E4DHEPKjlxF4xiqXV9fQT1YoN9MV9MNjq4tnHgpmhnhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qrGglmKRrYIJ+o2kQk+s/pbbrWw7lck7HVhV2+NvYGw=;
 b=NBw10wg0bwyAkVu4OGpol7Z3IrW2LNt4wpW7Zf7phPiKtTt2//mLSZz93C3E3qdkNbnjiCiFpFrNiIjf1Pef1JgR/2XcaROvZh6ZLy86USrHohnSpQCXm0yw4YH+F+eWQ068/cshrBd520lXWJirx7EDjXic6tjwCusad3kCugE=
Received: from DM6PR03CA0082.namprd03.prod.outlook.com (2603:10b6:5:333::15)
 by MN2PR19MB3759.namprd19.prod.outlook.com (2603:10b6:208:1ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 10:35:10 +0000
Received: from CY4PEPF0000E9D0.namprd03.prod.outlook.com
 (2603:10b6:5:333:cafe::5e) by DM6PR03CA0082.outlook.office365.com
 (2603:10b6:5:333::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.16 via Frontend Transport; Fri,
 12 Sep 2025 10:35:10 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000E9D0.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.13
 via Frontend Transport; Fri, 12 Sep 2025 10:35:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E8D5E406542;
	Fri, 12 Sep 2025 10:35:07 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id D0C7982024A;
	Fri, 12 Sep 2025 10:35:07 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: rafael@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        shumingf@realtek.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH v2 00/20] Add SDCA UMP/FDL support
Date: Fri, 12 Sep 2025 11:34:45 +0100
Message-ID: <20250912103504.2679226-1-ckeepax@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D0:EE_|MN2PR19MB3759:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6ae2ee2d-2614-401d-d9ba-08ddf1e80c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jNqgb6fOx9K/E4Gg0SXwenPQd2PyC+zxCrq9TZ8KIiZjuFPtulD3NBLmrWPn?=
 =?us-ascii?Q?gJqMWZZ0ZeyEp7IgY3LnfdZyh1qEdtI4nZ+tw4JDkyojzt1AVSrgRlxkpzT0?=
 =?us-ascii?Q?TvwuYhfDytd1JMdg0SDeCKJTeZySOSxHwDJJ0itwpmKW5fxCHy4IeztogM7x?=
 =?us-ascii?Q?wdhk/yFb9cTNOvv2qmYmFG74VVvv7G5FNNHqBwG103JMdgJW0pEP8vFuMVEV?=
 =?us-ascii?Q?9AmlTPMQNweszq00vQmTx8sn4Hk+ydJ/lnwncifyNoYIyIXd6dmYm7HfA4S2?=
 =?us-ascii?Q?mQXtdPU6GEOYNipfmsHU30zaYBVKv28p2OFN8Wkrerdt9KIm0FbhqfEyiZKt?=
 =?us-ascii?Q?6pu8Q84sE07w/FTUJp/On6nz3IWY2JEq2rQTYrw7fCnJyR4D2bT3aaNEVixL?=
 =?us-ascii?Q?zISIWF9db8GtH2a1GF8aduZp9wi29+3zNCxXWNvACVjIeC3G96NCaF+U61M6?=
 =?us-ascii?Q?w9OXs/k3TayJNGUlwtH3FoNDNWzWmdUySBKeKfAJeu24ZQghvB4TT73+9ZfO?=
 =?us-ascii?Q?eI9Ks/JcDaiRsQn4Ag+e0rnxiFdu/71tPQNmRWNjM4EPOy3sFEpdqtmxyiTJ?=
 =?us-ascii?Q?LjrYaKFYaIfR0kyxzViUhkr5Fg2p+jjNTCS9QKJdfdavkALzjC7p+6A2HH6R?=
 =?us-ascii?Q?hLxmnb1TXdUrStAMlNmT8OuJ48s2F0RgXlHUjmyA3ObIbPgajEwmpYn3yUPS?=
 =?us-ascii?Q?lo1Wuzag5BiTFETBJh9JD/5SBZLz/xgmoDctJulyws5V4RIl++lOLMItWNDQ?=
 =?us-ascii?Q?eWwDTcjwhAEfz7cjAd8cDnqWlOF3hIJL15dk7TCw53yKnMSg2FedSEpO3yf/?=
 =?us-ascii?Q?VIqPa3MrtX5aVFlSMnzqZsTVf5N8jJxRCXDu/hMGzX5m80v+vDtHm61o3dHa?=
 =?us-ascii?Q?PO8sxq892wUjXeKLMHB3qyiKJOV3R9lwKtQBVA3Gc9MdyLh2oj/5xU4ktncP?=
 =?us-ascii?Q?KF1/T/QfdBm1gP4Wg9Ao6tAA9uznIiwnMDyTP75GMCPmf6XGH8geE2jVsol6?=
 =?us-ascii?Q?XK3qoCpV/sX7wuMesg7ldamOx83uZNkgz9wRw0K2/yaW5b0AmXo5cmsxeWWD?=
 =?us-ascii?Q?0ox2xFZJo+v17edTKxIKECs6v/Tyaa391oFq9uQOxZ+YtwQxobjtETstOyR5?=
 =?us-ascii?Q?GGpmDSFtJOW612naueEfnlgaohY1B2MpCnMdhfhu3rVgKkaobv6NOirKr/FQ?=
 =?us-ascii?Q?0u568pAfPjygFxrOa1H7EykEirMPRxZJsApGIIGy6QgpUulpxIch/+WlFUEu?=
 =?us-ascii?Q?iupA0hWGOx2LCv9r0/QtKVQH2m5uqpqyXAfN5qxlnc73U4IAT/qwC1gOnXww?=
 =?us-ascii?Q?6b2rTRvOYo/uuBPiwfnbsoUoQjsq41q414b5MJjaer0Ticw/EsmH/gms0Mze?=
 =?us-ascii?Q?XkcmqhcGxffAEcQ7AVJ2J/PuJBeZ7fiNy+5FN+Vwex6toKG4ou21dZbWpASN?=
 =?us-ascii?Q?3AsGrWEQA/E94bGal83uYXUYIYDh7FrTOPzavrZe+GAsLJZ1KsEXohiz+iyL?=
 =?us-ascii?Q?NAWj0h7f+oK4ZqW9103IdYximMpMKGi9x0sl?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 10:35:09.1082
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae2ee2d-2614-401d-d9ba-08ddf1e80c15
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000E9D0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR19MB3759
X-Proofpoint-ORIG-GUID: ilObjRiggQZ4mxz7qjY6y09x12M8Vil1
X-Authority-Analysis: v=2.4 cv=F9NXdrhN c=1 sm=1 tr=0 ts=68c3f761 cx=c_pps
 a=VJPIQ4PINbh8k2pedQY/ng==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=yJojWOMRYYMA:10 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8 a=s7C3V1Zz9kbP4ZXFM3YA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDA5OSBTYWx0ZWRfXybzgoY7iFhE5
 MYF1NF60Czi4KckI9lC+A0Jhp9HBcD5cRtwEMT3JVrdXs+JDj7kx1Q/SHIaqumurT725bYHDCPY
 0gKjtwOKU8EFDo3OXvQoR78AjohO6Lnk5erTqUbxeOviJv3/dBaM9mHgwv7D8VBlg78ES00Pj5E
 MFeXBCl2FGwW2j8mv0/ZtdXlZ5w5u79dihwId/1jeb53x+r+kePdqcf9B1NHxYu6Vl9xaVWcQe6
 pTxsnvwXU6CkE6jzx5nYJ44m9Ypiwz2Cxlc49HxZji2ipOSytVpGlZtx/UTQfqyP/wLMPB3dbyB
 pT8vIwkbejjnwltmu6+7EBtMEqBS6+690GfHfmJCNl4CSq4LY1R1W0qu0AB6ww=
X-Proofpoint-GUID: ilObjRiggQZ4mxz7qjY6y09x12M8Vil1
X-Proofpoint-Spam-Reason: safe

Next installment of the SDCA changes, hopefully the next series after
this should be the full class driver. It is worth noting this series has
a build dependency on a patch working its way through the PM/ACPI tree:

commit ac46f5b6c661 ("ACPICA: Add SoundWire File Table (SWFT) signature")
git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git

But we can probably worry about that later, as normally there is a
reasonable amount of review on these SDCA series'.

This series broadly breaks down into 3 chunks, first there are several
changes to remove the assumption that the struct device used for SDCA
purposes represents the SoundWire slave. This is because the SDCA class
driver will be made of an auxiliary driver for each SDCA Function, thus
the SoundWire slave will be on the parent device for each individual
driver. Then there are patches to add support for UMP/FDL. And then
finally since the rest of the HID support is there and UMP was the last
missing part required a small patch to add a function to allow reporting
of HID events from SDCA devices.

Thanks,
Charles

Changes since v1:
 - Add timeout for UMP buffer transfers
 - Add function reset
 - Parse XU properties from DisCo
 - Rename entity_xu library to FDL
 - Add a limit to the number of times it will try the FDL process
 - Rename soundwire device pointers to sdev to distinguish from Function
   devices pointers

Charles Keepax (16):
  ASoC: SDCA: Rename SoundWire struct device variables
  regmap: sdw-mbq: Don't assume the regmap device is the SoundWire slave
  ASoC: SDCA: Add manual PM runtime gets to IRQ handlers
  ASoC: SDCA: Pass SoundWire slave to HID
  ASoC: SDCA: Pass device register map from IRQ alloc to handlers
  ASoC: SDCA: Update externally_requested flag to cover all requests
  ASoC: SDCA: Factor out a helper to find SDCA IRQ data
  ASoC: SDCA: Rely less on the ASoC component in IRQ handling
  ASoC: SDCA: Force some SDCA Controls to be volatile
  ASoC: SDCA: Parse XU Entity properties
  ASoC: SDCA: Parse Function Reset max delay
  ASoC: SDCA: Add UMP buffer helper functions
  ASoC: SDCA: Add completion for FDL start and stop
  ASoC: SDCA: Add UMP timeout handling for FDL
  ASoC: SDCA: Add early IRQ handling
  ASoC: SDCA: Add HID button IRQ

Maciej Strozek (3):
  ASoC: SDCA: Add SDCA FDL data parsing
  ASoC: SDCA: Add FDL library for XU entities
  ASoC: SDCA: Add FDL-specific IRQ processing

Marco Crivellari (1):
  ASoC: replace use of system_unbound_wq with system_dfl_wq

-- 
2.47.3

