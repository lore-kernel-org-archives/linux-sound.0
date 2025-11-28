Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91213054DE;
	Fri, 28 Nov 2025 10:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764325306; cv=fail; b=Q86YU2g7Znoo0Pe2nRqTiFEGkjKox7MxT1h2BGwQZLE71VpJqOzkNYOTb8l4qVy948JMk37T/YHk/mu40uVDMxtmd9gwOiWi0oqFlhqLAfiSOCrYg1X7xM/+3c5XM+37AOr9oYxL6f5vkqJhktNXJK2I7aDhnVuOyyFJjQ+L4gE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764325306; c=relaxed/simple;
	bh=aaOpEoM2lYfEijmUJGcm89LrSbdZ9oY+X+NsanbC2JE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bsfPlrLFkkpX9hDhVbcDP9u45bfatZgDi4Y5c3Fgd57I53wrP2e3Ak5EaWVV/D9zQW9rLB0joOi1rlchYAA3cfs8vhKaC162DpCZH3WKgaECHchovLMg8mLQcAU+BwBLnfzyHObNt9dHy4uuNMNdWZpnvlf4lwZnrMW84eDYpEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=quvk0h+k; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=QiG7UjE8; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="quvk0h+k";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="QiG7UjE8"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AS91e2M2747797;
	Fri, 28 Nov 2025 04:21:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=XXg9uU+V2BsPszJA
	XFHTPEGCW++yVJbmy7CXjpXI1i0=; b=quvk0h+kjnz/IhPAJvAjNMX4lhDSd4o8
	r3ATuJJgjoT7NJPC1xdh5dRWAH/eCPbqq+o+p2w8yRAoemIzi6xFrunknu1tFKw7
	18Vv2KQbbkfLlzsRWe2unRMX1McbXSs9M9ZQlroG4Ei4Sbgxxkog+6h6nMNKXD/v
	Hij7c4oiOOzUkl8fxY02ZdbnRuZA2MsAzUha7nmHeUN+LLIqb3FYoWc2gMKnn55c
	gHrDC7qZefgRaOtDm1sxnU4Ded81K3n7v8qN7xaCcpyvAx5oubWC0EaZWykdtXII
	0RtJL+YZf02ePZ/mHPmgd8JwdJYUj4Klx7DAMiBp8+Dj9dX/wq4mZw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022076.outbound.protection.outlook.com [40.93.195.76])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4anjw5kdp0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 28 Nov 2025 04:21:40 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OrL4z/FagIC0hhdTOItwsfdJqREtVTb+hsajsMrbA6LdUNsIDd3HEm4wiTRimnGBDYAasqHGZVZObUpYUuXtz9J7x65+6+ptPnO2nbGoOUic8VnLKl1M4+Q4HEbHITUNekitA2Msi94qBwiCC/Emwic7UfEQN//xoQaAeXcUfvkQeogQ13MGltPy9el4LipIVzfw+AoHuXjp4PdrOjpAPoOhkFi+7NmqdZbOzlORgpD/FsI2cM57H2aBuTauFNEbxh3tIL04KkDyfesCX6F5REVhHjWyg7INk+HYaB0QblZeqlGoYrSWPvvGzI93STdwn+NRgBDO+RD0+t+MR8KEYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXg9uU+V2BsPszJAXFHTPEGCW++yVJbmy7CXjpXI1i0=;
 b=NSIS8oxQtwl9GMaaGrjbCjLrfPv3TUod6FabeenfzKCVm8W5j62LsiAdCTgRjhI9JYI6UvPA9KqxJFTp/kd/wXtd5RoBRQVS0w5lT/AY4aXLCEiJUdkNGG80U657noz8YqpZBKAoWmbGHwl+r7Uyg1UFNefc/FT1pMUzkaqlBpHtmT62Y7nnERgmq+aZeptu68udJCDGv9QRRnEb76J9BTOxM322iE/GCPXm+w3l48xa9AgWwT2SWsM7NGK3LFDQ4DTUBTlNrPBlP0tDWxkyDDrtdoEjs4K0xyqSOHttEB3VMmAtjVWsZHfd3eCNlWEZuMhS2QR2KSLMZ23NzEsy2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXg9uU+V2BsPszJAXFHTPEGCW++yVJbmy7CXjpXI1i0=;
 b=QiG7UjE8xCDQSnBeou6x407UFWOyLBDC5PPLaJdcDaOVytUbZwVs2tIDnvnigr9ve5iykw9dyAdKvXuGKlzsIhijH9k3PRT7nKmFZ4VQ8JUcNJt90hyeO4q9ZUxT07fJmAmGfmDMVZ4WLEMOnfJLn2YZ+vycgm4dbyYIJPCPBx8=
Received: from BN9PR03CA0094.namprd03.prod.outlook.com (2603:10b6:408:fd::9)
 by MN0PR19MB6360.namprd19.prod.outlook.com (2603:10b6:208:3c0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 10:21:35 +0000
Received: from BN2PEPF00004FBA.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::bf) by BN9PR03CA0094.outlook.office365.com
 (2603:10b6:408:fd::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.18 via Frontend Transport; Fri,
 28 Nov 2025 10:21:35 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBA.mail.protection.outlook.com (10.167.243.180) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.8
 via Frontend Transport; Fri, 28 Nov 2025 10:21:34 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3EC25406541;
	Fri, 28 Nov 2025 10:21:33 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 26A7082024D;
	Fri, 28 Nov 2025 10:21:33 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] firmware: cs_dsp: Remove need for clients to supply dummy cs_dsp_client_ops
Date: Fri, 28 Nov 2025 10:21:30 +0000
Message-ID: <20251128102132.1575177-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBA:EE_|MN0PR19MB6360:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ccf5abc9-acc7-4103-0706-08de2e67e87a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rm9P11kgvHH4S4SsllhcAlDpbPZrYj4nLpmSrcrSCjbUKsRYaJYtkpg3uBgH?=
 =?us-ascii?Q?kddttozPSNDd4/LYT2LlhOm3OMlWpE/+cA8hJeSquwCsrgQBmiDM4pdrGINA?=
 =?us-ascii?Q?Xrzwr9pf1CTU6qEc7tgiXYOtmX6aRS63+ZPtVVFle+FZyqx5EwwFOWh4Seky?=
 =?us-ascii?Q?qBWEYShLet/w8xEX91f8+StmOsmd0/Ya8ZC3WE6ItHFfRvn2dXUxNDuAeJRP?=
 =?us-ascii?Q?W13qlwHZJAD8/hP/XyOd2qk4GdQbxQoU4l8qjkZQXsRn8E1cXkr5NlXKaE1i?=
 =?us-ascii?Q?WDTAIwcI9nGeyvBnR2QhqyBVj6gUd1QBkpQc3SMNDmEWe64FK+AjZlulAAuw?=
 =?us-ascii?Q?aWBY/fQgNCObGyJ0yuTZ4ucON0rLgFEZzWyImiQlel3HNMS2X2BDCQtRaFJF?=
 =?us-ascii?Q?Dz16pFruMMfplHafF6WVp8m3T1WIPvAj4XCavJFl313mlUxSvBt9G1DWoGwa?=
 =?us-ascii?Q?g4bHE7stTfXYoX0nmVaxL1asaP6uKYVbAIMQc9n1jTsq036jDNqfqyQ068Ue?=
 =?us-ascii?Q?w4CnTIx5xBC522FIEJWG4b/GE5lYbminkwO+w6sUicxkODUEel/t3GV5Y/DE?=
 =?us-ascii?Q?Be6830nGeZtH+bDwIXf28a8SKG6ASm2Jk43SrVefBU5JU3YyUhhUUmirmGgx?=
 =?us-ascii?Q?ztLL/ArDZeyrZuvqujEEe+DIQKwTLiLSdI+dcY9z+ERODY7teuw/4syYoeQb?=
 =?us-ascii?Q?6mFECpN5Y+5fdVtuSgPxfpjZFZKL/uyFHE7rMpqf6KCM3q6rKCaucUgqFj53?=
 =?us-ascii?Q?hLIT/eoRyVlubm5jRoHVRfuWG7jOauMj5Su+CmVpbuXoIVgVfJDeoZmi9fop?=
 =?us-ascii?Q?Kd8gMWeasqfkf82p+IIsEOEE1yAKJwO9mGjb8oEu2l0FAhx0hvc6BplERQUS?=
 =?us-ascii?Q?GFLbetUvpMivsEf+DwXtcEkmcBWb6hhx+9Y/6Ig0xcymaucgVSRAVIMi11+k?=
 =?us-ascii?Q?tA9ebkeO2zvYtCCE6aXllCBNAZg6D+QJsheFtRvVyut6vN15WyBzlT2f+gr0?=
 =?us-ascii?Q?v5eeb/F8sj68Hec8xr8q+WkBrPgpO/fGTdPQ/tI0x7gTQX9Qf99f5c1EnaWj?=
 =?us-ascii?Q?skFAa0ebxVPE8EjYhycNoEokvdMoo1kYGGpC7QHDnUZyV+bplzjA+VPuh6ro?=
 =?us-ascii?Q?DO8T+hN68c16ZjJo5Ql6dx4CXMvnHrRUohXpHP12KbTMWTijqeH+K8aywvED?=
 =?us-ascii?Q?kpY7xaXHWd2J5hqhaaXfaCJC9XXlKimTxb+271bGaRj2nXQg/yA4zOrKi0gR?=
 =?us-ascii?Q?c2R/mdJeMDKOSnu7ViUTzNNO7KCe/ZE8wmx8Y2DMCA6TXcuD6ZjAjMOQ2BN+?=
 =?us-ascii?Q?WRXgspDvh4YveikyF0ILVFn8dq1KMyw0KPN5zBTvz88JkbEAxeaGxai82MxD?=
 =?us-ascii?Q?6oavAqiiI3x1fy7nZrdfHnXtUKULrI5bnL8vny/RRoHWZT/e6dQuPPDd2AQN?=
 =?us-ascii?Q?Pz68AuHErPJtbnwDeeKIHvqD70wbukWFGKFjMWwiLVs+8TEJIsiw4sBHB8Y2?=
 =?us-ascii?Q?pnj1rd3sdZsstdUzhus++XOMrvCZKb5HqKGT9/BAR734ugEe1AH6kcb4Umxz?=
 =?us-ascii?Q?bAQp7OsbQH+dmO8eRq4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 10:21:34.7821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ccf5abc9-acc7-4103-0706-08de2e67e87a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF00004FBA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR19MB6360
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI4MDA3NSBTYWx0ZWRfXwv8kYTjG+XSk
 6M5ga3BX7TEMfIHEQWpsD/NI2v4al8MlJtrT2BtaxwvE2nwJkdqtDWguFUYwFXNN5MRkljHTJ1j
 Zq4cHkxiAicV/Ynr8wVU8v3WLmvS0Acf0cU+kt6OaavQVA1xXhL4+75jP8vCK4tMGkxA0Hmh36c
 MaZ2CXxVKWOjCpispuYqLVY6QVygaeZx9+YAhPj1+jww9DHD5jgnAXY1SeECsy6cF3olscdzEPc
 6e5K3UxANEChMBl9vqIbofzO6QF9KqYV+dQ1UpM+7x4SVyXo9IMNLmYF48VgZN9McKrF27t7NW9
 PopvoMTmgtW9lFew4ZT6sV/dXVOus31eZhsmy0ALvxq6fNcsFS0z4MQeUY3aoqVu3UNTHQcGDn4
 t7IoWiyHYZuqwhgjbSHVYpDbGIEFXg==
X-Proofpoint-GUID: QJYEqCDO_O8YU_570qPWnVZ6RsKu7Y6C
X-Proofpoint-ORIG-GUID: QJYEqCDO_O8YU_570qPWnVZ6RsKu7Y6C
X-Authority-Analysis: v=2.4 cv=V4JwEOni c=1 sm=1 tr=0 ts=692977b4 cx=c_pps
 a=eCb8aTw/9lghk0zZp47djg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=542Xt3fljRZb82d--KEA:9
X-Proofpoint-Spam-Reason: safe

Clients of cs_dsp can provide optional callback function pointers, in
a struct cs_dsp_client_ops. The client had to provide a pointer to a
struct even if it didn't implement any of the callbacks.

Commit 1 in this series changes that so the client doesn't have to
provide a dummy struct.

Commit 2 adds kunit tests cases for this.

Richard Fitzgerald (2):
  firmware: cs_dsp: Don't require client to provide a struct
    cs_dsp_client_ops
  firmware: cs_dsp: Add test cases for client_ops == NULL

 drivers/firmware/cirrus/cs_dsp.c                     | 6 ++++++
 drivers/firmware/cirrus/test/cs_dsp_test_callbacks.c | 1 +
 2 files changed, 7 insertions(+)

-- 
2.47.3

