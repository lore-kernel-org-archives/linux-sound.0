Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70F3238C26
	for <linux-sound@vger.kernel.org>; Mon, 23 Jun 2025 09:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672078; cv=fail; b=Br50m41ZFBbZrVWnQxPZsjU6/qLdGFJCaBnYrnnFonAYNu4CBieGIfsONv2ukGGwXu8sgBzRT5Of1PcVOgo7BraC6O0xuL7IgOVwBTZQG8nsEHsAQOfx/drGhyrv0OtqEncpaDsynAdQH2haGb5KYhXvCEs2EsH5Lawo0y1VdU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672078; c=relaxed/simple;
	bh=h9IdsUlRu7Qa/8himTKKavACb2sd2N6bOPOpCJMJNpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OvEjeAZhtXPIfhBNaqdVQf+AEfA4Zybh9r/H5TFeXdD2eYhRhynrTmqQFnDDk3F7rnYbAfcwsFKqa1atr0zeytw6COJWTG6W171nYH6He2FhscAXFes79Xhyq4N4RWdhPecTC2Svh8vFBKO+mMpNSZQimcli229cz0FK9D6/VSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=Ot7PheTK; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=IXoUh2Ft; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="Ot7PheTK";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="IXoUh2Ft"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N77rpc030627;
	Mon, 23 Jun 2025 04:47:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=geRzmhutQRFTvFaRYs764YrMdJoHsMl9BNJQ/59YJzo=; b=
	Ot7PheTKDyJXW/Mow0NuPgXAGpAYw9N5rmSo4HZpX/zc/W8+86zv9GMf1D4Br24R
	/FmQpYHYRKGThy3HYY+czIIfYXCCoEiIsF+UTRaFA68Zv2GwSIsTmEsYqUve58tb
	2rE5lFJMHlOO+PSIJKz/2kkOSFIvLy9fVjYHTu5IbRitkLHQ4VEvfVnQZP28XJo4
	8r8HwbaAYYLYcbGTd7ag9MuVCvQVUTGlOb8Vn0pzvfbnqvYo7vKwmnEVNOOOpyLC
	d5Q0lIaeqYJV3yHE5WnPSzfk/UdS82FYNMkgjILfNooaHVpoiSuRYAvKk1vXsadk
	mn/EnL6oQiO/N7qVh76t/Q==
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2119.outbound.protection.outlook.com [40.107.93.119])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47e5tysdby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 04:47:29 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QT0oW9QcyjvjhIS3hdWMuXNFUyBGUU+RsT5KMTYoFnsW+WfdvliwfkzfB4uxNF7hAHGfss+5htPEhZysP5PWAZdt0ojPk6H8bDhkwAtR73Ca/t17+UyOaGybg1yryFgKCA7DWJEwBfunX1Q0A4j2x5bjF5uf0i3p+Kdjr9ecjwPTuH8uVMda2UhcJ62ZWT2Gz6KdirRXXwCkw+Z0X8Sdw0ftneHfWq3rEAipWLBmYq6+JyJE07QUyYWMvxvZbnPFW7UOxudIOMZCq3cLne2CVNF1lNzWMNJB6VQvQsFSf+jqZv2omdcBynQI//g+6IB9jsBB7pnIYYn4p+alFUUdqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=geRzmhutQRFTvFaRYs764YrMdJoHsMl9BNJQ/59YJzo=;
 b=wYV5L2sbdcMwumhH426yLIvYukB10FinCyMdIy3ZL1w/JolBes4DPuJlIqmTQZfFE8B7jm8IDEb7rnzw0RK/W0NoPY16OdIYqs+ABC0scaQHx+BPAj+L6SnjnckDHj9opwhRGFYzkw6FjtU2CAIpJl171TnkmlCg8AZ5C5rjCsKKr8dLO2AxsJbXYogJTOa+gtAOZ1fmtxrsBqeZMja1UK6+kQBAJ5hfSAfj3pxD9qpPLol4OI+Rokw+djFQAgom+JUwxYBCwl2AS351FcOFAePYHfgZImt/V7aVdRmWKNUQPjCo+GWx3xLD2NVG0LG2PpyvinkvAOCk9TnUEFpI3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=geRzmhutQRFTvFaRYs764YrMdJoHsMl9BNJQ/59YJzo=;
 b=IXoUh2FtzOLpbWhhduKIpGcijopyCbSMBLh/CzZar8uLDN5DOCvOwdTCd6DYOwJilIXLxStS1931d4II5AP1wiJ211ePYVi6NsetIxCT72y1yxwsX0dLho/QLreNf/SElx5BujknWIDcRAS5nFDe9xdTt6/AjHvVhGG4GWed9rg=
Received: from MW4PR03CA0044.namprd03.prod.outlook.com (2603:10b6:303:8e::19)
 by DS7PR19MB4407.namprd19.prod.outlook.com (2603:10b6:5:2c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.16; Mon, 23 Jun
 2025 09:47:24 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::d3) by MW4PR03CA0044.outlook.office365.com
 (2603:10b6:303:8e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Mon,
 23 Jun 2025 09:47:24 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Mon, 23 Jun 2025 09:47:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C954440654F;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 9BE8882255A;
	Mon, 23 Jun 2025 09:47:20 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v2 1/7] MAINTAINERS: Add SDCA maintainers entry
Date: Mon, 23 Jun 2025 10:47:10 +0100
Message-Id: <20250623094716.1874443-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623094716.1874443-1-ckeepax@opensource.cirrus.com>
References: <20250623094716.1874443-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|DS7PR19MB4407:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 2df7e323-25ce-43b8-d394-08ddb23af3ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fS3ZwQ4I/DjDXHrJiKuo0Ekh2Hld2ZzYdYjfhCPZp0xzICTR6zIzlrOd2m3q?=
 =?us-ascii?Q?MoWoJOTxNgy/Pm/unF7wd15qCSfI0+SKXQdOvzFVRuL9CINrdh7nnqp/TO9s?=
 =?us-ascii?Q?F+lQ3ECkIky3tzjvfXZOYqLvraEVFhoKDc+eA9LmbxPryyIae10dznd7f2oD?=
 =?us-ascii?Q?bIweOqmR6L1ZG1jpulkDA/lLYDmygdwLYcTYLS5lOmCcHTjvb1BYU7NltN/I?=
 =?us-ascii?Q?t5H1uPt7WI2oAbnbWPoXwUdB3/m73GThmDJahduaWB6oAAnx9eYHAUb5rl4k?=
 =?us-ascii?Q?d8aB4QvclYXS782ulZFNC3e+HjZsNY7JkXCzuvKAkVHZzTM1lW1piUwIHoj2?=
 =?us-ascii?Q?lylq+JQ5+RnyPjzOpqUsGunPHw/YEnX+qo1kkopQFO2emwwirDausbazbvqy?=
 =?us-ascii?Q?RILm6YIW5uoIsaXyS/MdFHLEsHNYCuSJJy06Kd/gXoiKTJ/ysuU1a75yRF9+?=
 =?us-ascii?Q?wilvBDIJ0X76jb4uG0SLNt5+nUplECMRVGFGxYfWTZWvrwT1jKgA0jJAlRZ3?=
 =?us-ascii?Q?FdoRj7rtSoVd5zcK9mXsDU8JoW/o8P2nXjrGnffd+8ySaz5f8dMc1i5WvDut?=
 =?us-ascii?Q?KvnU0VPgiMcTvK2I0CVfA9N4ipgx3IkUIClTEaZJAg9nmsehoDcP9R3Cj5uH?=
 =?us-ascii?Q?BudA0DVKHSXpdIn1gG2tbk8l7ifRH2n8ufNDCwLP0p63wqWOLKrJZ+d121/F?=
 =?us-ascii?Q?FlZlWxtH7ZLNCvtw5eZ99Zd0zMAvy4yAzZTnQGxZCnEpWBdNWQ2m/ENv/Fgw?=
 =?us-ascii?Q?kUG7anT9bv/eJBtRCajN/Dpdb52cCPTYFVsCg5yg+NfNSqQ1FcCayNNWt3g6?=
 =?us-ascii?Q?v/BvO21vB08UI4LHe8fWVaQF4cPczbRZrQGOMA9bjJ/iv2esix9TD77MKnhM?=
 =?us-ascii?Q?JUFtlPIz5hBINKQvizBQWkxtvdwAsyoYHqheopmRbVUx42IZHzHrV9FLG9Yq?=
 =?us-ascii?Q?oL35oyd8lZwz04T24h3gl9ucIDCAChZxzvZ1fLoCLq4AV2BNiikq0SV+B5xh?=
 =?us-ascii?Q?3G2Uxbmw2ZTPoq7VCch4e64wC4P8r3Q+YjZsLKKqnUsbSQ5owY8DJ6WMW3lk?=
 =?us-ascii?Q?+pz+7qxXCG8yA54TldKoYlfBo7w+zY/de6iGejqhWHAwwiBlq+ou7UxUK5qL?=
 =?us-ascii?Q?mFL6AjKxU/EEoOlq9oHc9iDbN0qn4C1G99LSOmi55fIjOEQF9pALZDn3jiJS?=
 =?us-ascii?Q?xfKrDUBrhlq4Z/J4gwOhsKIRfMEeggkYfcsg/lBx8f4U16Dit2vh0WAvTvia?=
 =?us-ascii?Q?3KK2ZiDaj5L4xMpfQjVKXQasX1sl9KxvpwHLg6nfn0SX4F/BGcV0V10WubCp?=
 =?us-ascii?Q?UDr+nke9LJs+82GGWJu5weQigmHNfmW++zikLBMaaVjp6n28njj8rqwvhJuk?=
 =?us-ascii?Q?eD3RPQTrUpfTLw/DgWbrIzPcI05N9t4ihOTqfGe02vV4lMIWWQxHDBLyZkZt?=
 =?us-ascii?Q?hf9fBE1OgHzAT4MxJo0esjLa7A/IUtn6ogN8aJLPQwdQggq22D5ic99PABDC?=
 =?us-ascii?Q?pVcb4t9IzTmhFSuTlEiPmsCGHlyqVcK4s6lv?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:47:22.4609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df7e323-25ce-43b8-d394-08ddb23af3ff
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR19MB4407
X-Proofpoint-GUID: POPNqktJDk4JwgCtT-XTaaye7RE_xRB4
X-Proofpoint-ORIG-GUID: POPNqktJDk4JwgCtT-XTaaye7RE_xRB4
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=685922b1 cx=c_pps a=hD2y9z8mk2rAQUSEBvgdKA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=FP58Ms26AAAA:8 a=FfjWbaYm47BBfKnykuMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA1NyBTYWx0ZWRfX1bW4tfuUam/X LqaFhhl755vA5gTojRrifFOzVu9dQgl6JWYq3zTENJix5WNrAIuOF0NQMiwaCdzb3ZtHNfIi5Gr T+tc7jwP+qD2+W82rPj9OQIz+/M4c24/E0o6A3W8CKGvhHUaRHXrFI2Jsj7lsRyho+IRhL9Ri80
 Ss362KzA8WROM2P/ZUtQKHLkm85+piDmx7iykdM8duizorqD7bS5TuXjBi4rbxZKKeNAisVHhWK I/gLADUhlUryDqilesxDvalLYrwSnr+WNsk+dfFH/F36oHS0oRrjK4ycEWglsiDRQcvq8nxtKml 4495kBaxNump+FntWFxIruUMLlu2Z6wezj8EIwHXzpejQigv64OHTPtqaQD6i01CmPjwPY5iczf
 T6+lNm2hYIIDuCjdV6Yoj7WAlDqrUG45KQmKwXLqzfNKYqUBSzhMje5mON5eYkVQaUHHZVdk
X-Proofpoint-Spam-Reason: safe

Add a maintainers entry for the new SDCA support code.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v1.

 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163..b9782f84bb369 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22298,6 +22298,17 @@ M:	Jim Cromie <jim.cromie@gmail.com>
 S:	Maintained
 F:	drivers/clocksource/scx200_hrt.c
 
+SDCA LIBRARY AND CLASS DRIVER
+M:	Charles Keepax <ckeepax@opensource.cirrus.com>
+M:	Maciej Strozek <mstrozek@opensource.cirrus.com>
+R:	Bard Liao <yung-chuan.liao@linux.intel.com>
+R:	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
+L:	linux-sound@vger.kernel.org
+L:	patches@opensource.cirrus.com
+S:	Maintained
+F:	include/sound/sdca*
+F:	sound/soc/sdca/*
+
 SDRICOH_CS MMC/SD HOST CONTROLLER INTERFACE DRIVER
 M:	Sascha Sommer <saschasommer@freenet.de>
 L:	sdricohcs-devel@lists.sourceforge.net (subscribers-only)
-- 
2.39.5

