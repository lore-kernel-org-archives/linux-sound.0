Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B22346FAB;
	Fri,  5 Dec 2025 15:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764947215; cv=fail; b=nEaSGJE9K70tRJXRBA8Y21Ezdk6kID0m4siUiWjtOvxk2zNPJaqsNnVdjMtgdmjBtP8MaavDbTeQ64XIMjMm4flAC6WnkgPJ3UhOF1rNC6ZiHvlLmf2sLznYv4d9K1eREurAMDd9ZHgiLC4D3pAMFsE8B245KY3tjShbG8P95UU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764947215; c=relaxed/simple;
	bh=QGJoAU/nm4uvZCYAaK1XUYJnjugdFymyV6JJHH7LwV0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ctm917QlaN+eojRzPVKXtRsv9iTC2dhonpGD8cUqW7YNbnFuAobf6aujQu8pFmULqUJgAS/iVD8o0a50l8d59L+5s8Oes87CgkElrwZK04BGjT1G6TpMkR96mdXCHJjD7Hd7q141pYvZUMsGJdPE8wmgT0NpJH7X1vh5LO5uzfU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=XqVtH9XW; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=tDo35d7O; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="XqVtH9XW";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="tDo35d7O"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5DnpvB4121529;
	Fri, 5 Dec 2025 09:06:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=65KXRNv4Sh+/JQ1q
	s3gMpAkxKHPrtTRzfMTQZy7W/Zk=; b=XqVtH9XWaQ2zaLN8L1HgE0UYD00jlJxV
	x0FEJLCo6ggYdIupRHOqBXfHfZ1fXakpJ1nvp72a6ScpT8z3yJVEBRFko5HtjByP
	at/kBGmsrLxYAcQtfEWxYk4Hy8hIy/LnGSnz+AhnASTMF0nc3GohiIkmO7x3g1k+
	KyJhjogTU0t8WBa8e07LvH6IZp8gw4vd8yFnCMmslbLsZwS1CMdWHISvMvXGnm72
	k4RlEKBAXStPxEC7kWiklre9SAAOJSjTfC+IwYBGu11ncQCTGEBcLdufn0RDTgaq
	fYL2mMHYirSY4JH68dxNes5HEd1J1SIEL+Y26HfSYXe1Bz7Jw7GpeA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020126.outbound.protection.outlook.com [52.101.46.126])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4av0md82u9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 09:06:37 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jf/sifLsQtZ5HkRgagUbxnXqNXExbHSLwfXT92RyUdvDEbCyRfGMNRJSxgs/+w4OkNDPaems/HDs0Vb5HffBedEmw8UB3DjPsYZP/cBy4PD/MEXUA/eGc6v0drNuSAHv+pmTDmnc+StsARr5LR/V7+PG3aiA0mDKsZx9ku2V8zb5LkDzoWw1hoYYfdT1wr74CwnBYHkFliluPY3oD9EMJFdvlb/o/u13U2dTgN/heK7sl+OjGBrdKqA4scl8wBSS8yYooknoAPZ/QTpoNQjcA42CdmMgYurQErDz4sjpIvvfHV5TT2ukDHMxisAiX9OURx0qeY7XnFb7qIKosYFUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=65KXRNv4Sh+/JQ1qs3gMpAkxKHPrtTRzfMTQZy7W/Zk=;
 b=Lb4A6YQxwDiuKJSnMU6IsY9TyGehCPzScrWMHop+yowabFQtz6cgWy/Z7tpD37ZdJiBViAncTqZgvwpPrAwIntl0yzrOsQ2XITWdPtsMFHM6enAYCDEXyzioM35cIhPNpEMN0WYRejX0Hv6RF63C0PRMJiFvgAnYhj6zf5OCUD21o6bo7DWHx82tRO57now+710QOfAB615n7qw6trS9uuFaFajeaPu9KCIZHma9TAC/yaxrQ9gVzt3yP1PF9TNXxuGsTI0LwwFqIbtaVhNf4ioHBu5enuWy3G1hsr+7a4osTaqMOcWOeibxyRwoHgqEujNxsl8uf5RCB/ODcpxtLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=65KXRNv4Sh+/JQ1qs3gMpAkxKHPrtTRzfMTQZy7W/Zk=;
 b=tDo35d7OrgozD35l5MAbnypRT2kSAr8cE02AmAQFUP7b/agdO/wGqVFR820yQjLcAfiDL9ODi02Vb2tgAfYmGhQVKDJ9IGyHnBLv87B3qUiN/V1RnHGpoyidGOfJAMQ/WiLSJ+T4GLS78VPNAteH0UIIUz1tnRO5htoLvmoEJ3E=
Received: from BL1PR13CA0243.namprd13.prod.outlook.com (2603:10b6:208:2ba::8)
 by SA0PR19MB4285.namprd19.prod.outlook.com (2603:10b6:806:8f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 15:06:34 +0000
Received: from BN2PEPF000044A6.namprd04.prod.outlook.com
 (2603:10b6:208:2ba:cafe::de) by BL1PR13CA0243.outlook.office365.com
 (2603:10b6:208:2ba::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.1 via Frontend Transport; Fri, 5
 Dec 2025 15:06:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF000044A6.mail.protection.outlook.com (10.167.243.100) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4
 via Frontend Transport; Fri, 5 Dec 2025 15:06:33 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 8CCE9406541;
	Fri,  5 Dec 2025 15:06:31 +0000 (UTC)
Received: from lonswws02.ad.cirrus.com (lonswws02.ad.cirrus.com [198.90.188.42])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4F00382254A;
	Fri,  5 Dec 2025 15:06:31 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 0/2] Add Support for three HP/ASUS laptops using CS35L41
Date: Fri,  5 Dec 2025 15:05:53 +0000
Message-ID: <20251205150614.49590-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A6:EE_|SA0PR19MB4285:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8a86206e-cb6e-47b0-4ccc-08de340fe0c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rYV+soDijVSAKRyA3Xhv4CM7r/1TLP6CLI1JCbzzQtc+ForpWsIdT970GLD4?=
 =?us-ascii?Q?Z3ddjhR9fQd1kIlarEIwnrGY3/MimIFBmteXZQTaa2ONBcSp4ZQ1NNNtc8JY?=
 =?us-ascii?Q?upcw5L02ZdOnq14/LRORX8LTE+S2YW9mQy5wjDzXG2rJbR3qJZCYu5omkTL2?=
 =?us-ascii?Q?PJ+hqYg67TBgLaPlrhE9iqvHxXLIkrw4HmnSlV7btqlnoTSFAvM2n3cxfGAw?=
 =?us-ascii?Q?w+3R51xbv2NX4AwXKethwYt7nLDHWuLA2mObexHjLAtPCfpU6OlnFm3iY8Sb?=
 =?us-ascii?Q?z4+QBZcskecHh9fzEmfWtuBnLGFXEEQnQtQpImBtoQCZsThj2dC+lDjz8cZD?=
 =?us-ascii?Q?mJ62QBbqL/a7eucFmJdrR3BqdFVSSWEvCc5YRzPwUpU0YjSIG4C9573P1P3S?=
 =?us-ascii?Q?FO0UlsKshySFfhD+KsxkZSq0HDD2NVKJTnRPHAnrtp4O5iAaNPahILFSyhT0?=
 =?us-ascii?Q?NDPMX85z2aDuQr3FrEdnLPJMZJ1/MT0P2A6hFwD3QA6+UuA9iZI9BZnNLegx?=
 =?us-ascii?Q?AENYEjOR3aaX9cYWgr5M6/Y59kKsGQnGEOawkCErXeMZ8nuVLg/UnJX8wO8O?=
 =?us-ascii?Q?OO24+XNtrLsC9RJ1YwExBtWVuP6KW99/FPFJBojwDpPXGZld9xmY24z5DPqk?=
 =?us-ascii?Q?Ar56qlpFG6QUFQ+KaeHU/epepxsD5T/Xrrozoo5CEPyqMsFNQkTQRhT5eVar?=
 =?us-ascii?Q?e7jn8340U/UDGD8X+qhIQ69SzTliK6+UioYa+/3Bh7Uv+SJcydQnh4Buzm10?=
 =?us-ascii?Q?e/Dn+j4aT3zevIB0kv4dhYiztfZVsmQlX/Kk4h0cO7GjtAc2In0DN8W+PlWb?=
 =?us-ascii?Q?g8eF26a5spdKY7Jas3JGiHBCR9P581vkkT2aXExcRg6RS/T7T+LTe9kzu/Xq?=
 =?us-ascii?Q?1eMx0T52jn0AOyf5JE8oL2CEDYSFhR9S965785JF9O1UsOkLoxFF1PTdwgHK?=
 =?us-ascii?Q?O64p3+jkCRHWyG54LRG3/QZw4JahVg2Ou+BTdqTjRCpd5yi+k4519usmvV55?=
 =?us-ascii?Q?SIYOEqfEooGY15BlLcOuziJzb1X7TcAjn+KijeOX3JqHqfP5cftMY8MBKjpI?=
 =?us-ascii?Q?UoAaiDI/dzb3IXehGphhrwhVIdlznQ9qkWEa2TJK7fxVVLCspSR+sFgLhC7g?=
 =?us-ascii?Q?s3qasd4kU5bXt9iJXQn82ZZQLHOeDLRXUoTWgaLS3UoIGrM8Ed2ZX5nHZ3v4?=
 =?us-ascii?Q?KGWG/wOkyu2ofa2ry8CgAOEXQLSax2mM8o/dqEYitP29noVsr/BmScR8QXc4?=
 =?us-ascii?Q?uujwzxwS0h8q6rmYL/XQ4fsl3Yl0EW9dVj80ifGmm1BcgriMrQOMQcgU0Iiz?=
 =?us-ascii?Q?lIAXIdD7osMWwZ0UBZK+Vw49gYIzOJUgdQFptvFtVnw8+mFxctxO8wMUxWZa?=
 =?us-ascii?Q?hjY8tM10aOvZiwg1Z1uSy0AkYXiN9QZsumQ8ev7qhQ1mx6590+M/l3Z2zgp3?=
 =?us-ascii?Q?NWrkvO0DjVGtNOYYD9ZhumBVS9jrkYtKyHUo5cO8i3AOlrrwAU+/TfmnTCOo?=
 =?us-ascii?Q?SGa28tb1eLMF0RSIUushqPxyVvL0FdIEpcAQDIR9XX7Z3qW23HG6o7YwB5fO?=
 =?us-ascii?Q?o0fOvCzyTwYVM6e0AS4=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700013)(376014)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 15:06:33.0854
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a86206e-cb6e-47b0-4ccc-08de340fe0c0
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN2PEPF000044A6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4285
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEwOSBTYWx0ZWRfX9VX1o80NTI+W
 UkJiP2ChRDGzGFonpvPS2+A06n6LJrW7zPLd4DpXYKcxn7nCbTh97lFDDL7lddgH27hQm4gBk+C
 dxqDETlPPPBdyrEqVW/zrnAXjLprl4/rVj91WRZFG2R490GH64afxOLujck2NFzyQEgNbrehxMR
 ruCHAy0fWTIUBJ0LDHjz2GxpFFYNTaCKJdClmEELw1wUQf1VQ6HSEDCFUod39SAMJJ1gWDYjQio
 GfH/2sabj182mIGajudVEYlRPa3tdtEHTaR5V/PyTQ2RKg3yLARjxlLSjCqrBPs9n6AK4y4pT0D
 wno1vJvfDi/k/N67psNaegx/7eU9YP3XmZF1gy1GDPiID8yWw6QZM4ddPj3zUg/aA+Nza17zv+8
 AppaLEhQjR80NrSYngKCQ9CGW2SaRA==
X-Authority-Analysis: v=2.4 cv=cJ3tc1eN c=1 sm=1 tr=0 ts=6932f4fd cx=c_pps
 a=W9KrTTgrKfNcK5viAlcM6w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=wP3pNCr1ah4A:10 a=RWc_ulEos4gA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Tsdzcu95rSjCpNRjkCMA:9
X-Proofpoint-ORIG-GUID: HwdmEA_p3CiYNjCB4bDB1q0OLf9IMw1v
X-Proofpoint-GUID: HwdmEA_p3CiYNjCB4bDB1q0OLf9IMw1v
X-Proofpoint-Spam-Reason: safe

Add support for two HP and 1 ASUS laptops using CS35L41 HDA.
These laptops use Internal Boost (HP) and External Boost (ASUS) with I2C.

Stefan Binding (2):
  ALSA: hda/realtek: Add support for HP Turbine Laptops
  ALSA: hda/realtek: Add support for ASUS UM3406GA

 sound/hda/codecs/realtek/alc269.c | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.43.0

