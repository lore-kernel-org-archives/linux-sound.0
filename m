Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A688733A6E0;
	Thu, 20 Nov 2025 13:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763644014; cv=fail; b=VQY18vjGGisMg4hmwgjsPqsaXDezJbssLtHALz10N7ZYy1Uxq+a0PJNib2/gYshmg3sv8hRAzKwJJTz1ktohu0W7l5RXlKGKuhq3/qJrFrkHC4DAVJMYOMELO7cG6N4j2mMrsfLTwLoWyL1+uRuXMPKlbkXOuCkhm+1FQ8P1oH0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763644014; c=relaxed/simple;
	bh=//OltloGT01+2LK5F1grD2rQUr+jbpRxppVxZtLzsyo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OYIMPoKwN1LEfU6ij8zle6KF7GTh0rH/elwBZYBWOwHvO0T3/9Fp+4T8fkEIHtGC8EL5NdFJi+YZaIQjTUEFputj+4FG22dnJJP5H6H6BRs6zyj0P5Vdv6qnY2X5CeHppXFTdFtAudbNJNbUUF/onj2fwXhYOcjvFF5ZXHItq0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=J84uoTSY; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SBZrXp+l; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="J84uoTSY";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SBZrXp+l"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK5KmYZ311678;
	Thu, 20 Nov 2025 07:06:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=gjTn15HIV57He2Vo
	qJg9KRowsxolZDcis+15tMZVqj0=; b=J84uoTSYBwjlRXxlITNm69dWwg9KRkG4
	WiE+e0T/IHTARD05d8pVNaZ5V1ucbsIrXhAKm64pbd8H/8eCJwdFqh14CYfPeb5n
	I1WeHN9/Gzy0OV7Y4jcK61bG6WItHoHhHGtDBHIx6TGiJ2Vm07ky5iF0fsjAUC1F
	YUrXcpl+f93965468p/3LzQPneoG3b9qWgh0ahWSnlV9XBT1qQ/mUW2dPfgmMsGQ
	dmQK0G7GIaPIT0jAZH+OrF8B0EhL3bG1B2n8g5GK4sA9RQ4aq7HFh/PER0csdodJ
	KZ+2Xo4x2gfiJIVsU7KhBMezOOqOJEjQ5tvVwdyOkaVG24hu0HdKOA==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11022094.outbound.protection.outlook.com [40.107.200.94])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ah1bmad97-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 20 Nov 2025 07:06:46 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovdS09wWKFNQy9ZEXXmWHeD7/Uc2zcaF5VyECZUxeMI8X06BMDUJOVjmtxu7PDfjrcq3G+eZHJWK/hTwbFp6kCG81gWYVEK4Awdzn3lJk3wlA+UCbv7JPRG0bsJVhMGEor2Nck7Ua5pHU1RcJQR1Nmy97fVWbKmi9CV0gNLxk2L9yniJNH+iaxGYpHE4mUIy90SJmyDwWK3e0wIrG9S71Qg5rEUVmTfGh67D/qtCk6veOSexvdrO8L3q6usachwd3qNPZAR5vyFqMLDDlSiHWKK/vxUjLfQZobnOLKgnkYone1Bd8cib+eqtCTxFU2TLpu8T7IQiQoZcKT/zMHygvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gjTn15HIV57He2VoqJg9KRowsxolZDcis+15tMZVqj0=;
 b=VyROh63J2QhB+uaXxoOyoDwU4NUZcp8g7KB3acmik0cw7u1FhqKR0ktdEWX40BooNH84VQAhakKvLah0aCmPJ2Uu8jtrWoMD61MUQMwbAbJep/zCzyZqzgHaBN8UeP+dFjwohqircJ4S+7QX7IFgV7xwJpLEd33IYy0ntrySDg+/klyZlUf1pbCPth2Iw4TzR3XCSgO1hzDFTbxXDqufkGEex8MyiIQQmG2/oN8RI0dLQXBfPuNX+uxCG7i7nM1NFV9HC+UTKH7SOTuTla5Vmh6yUtXLcbc04kh6k6XBUBKfgovuzEW8vATQsnKbKr88cdLPkiH+H9wMu1hTq1LcQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gjTn15HIV57He2VoqJg9KRowsxolZDcis+15tMZVqj0=;
 b=SBZrXp+ld75XjowvDPg0YnPGtkbjiHYWEn7sM+A//n5D6aA81YZrZ/DAfDIzQ4wCQrMkM3W45JaWUA0BKkbGDVUqP85PEbL1alv/58xPmyljSHxqtWGcL3Y3PT6rBLbwbkl1UkyjBEDl2zjo1cyjiaBCasuSUjaVw686A181VLA=
Received: from CH2PR08CA0014.namprd08.prod.outlook.com (2603:10b6:610:5a::24)
 by SA3PR19MB9695.namprd19.prod.outlook.com (2603:10b6:806:495::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Thu, 20 Nov
 2025 13:06:43 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::79) by CH2PR08CA0014.outlook.office365.com
 (2603:10b6:610:5a::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Thu,
 20 Nov 2025 13:06:41 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 13:06:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5EE17406547;
	Thu, 20 Nov 2025 13:06:41 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 449E3820247;
	Thu, 20 Nov 2025 13:06:41 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 0/2] firmware: cs_dsp: Cleanup debugfs for wmfw and bin file name
Date: Thu, 20 Nov 2025 13:06:38 +0000
Message-ID: <20251120130640.1169780-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|SA3PR19MB9695:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 571425f9-57b2-4eb3-1905-08de2835a6d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|61400799027|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QQcibZtKMqwNDzEhS6t3ofcpQEs+cJ/lYmvZ3vfhq9BhzhK/jONsuAii5Kkr?=
 =?us-ascii?Q?4K6mx3yJN1USB/dUJ0gLt2ffttuTvluKW1zfe/ykL9xlQCkUCe385MDZ9rct?=
 =?us-ascii?Q?L8iQIrDxYBMJMRFrBEF8VctHm1CpGQRULL/v8avhH5ql4lxz8zU8GHnOSdUu?=
 =?us-ascii?Q?XpCzcovDUnJlU97lgPk5KWyVh6dihK4LmF6WtYpAlNDXzKUFi1sS4RYMOJQJ?=
 =?us-ascii?Q?GgqIDLLlrPl2kYAr70jkhp3AtgPMwgtwj0S/us1au6ejlXtjjwKb4EksjKYO?=
 =?us-ascii?Q?kTkflaHmODVk9iiX0h2a9MSsyxQ5QqQguNrtOaPhuruKVSriuDUIvPUzptpZ?=
 =?us-ascii?Q?G5jZ6sU+oPvseaIVGakkR4lVQ6cZStcsiPAPPGUdGX95SH0cdHtPd+8r5SKC?=
 =?us-ascii?Q?sWN1ruj6ts4YySh+YqXL2N1udHlVMzPhXArKE/C+XWYEy6/MZT/Lom6fLidN?=
 =?us-ascii?Q?r964A9dYi4dxsbTH9d9DQbDXd+M1Tu9QsImnN9V0/HYRL/vGsdYyyJC78JYI?=
 =?us-ascii?Q?PGNQ5xilArrSQo+J9vN6/i1i7Y/j25kG4S8CB1t29jMrtlZPwJmQ76xXKMRt?=
 =?us-ascii?Q?pu4aGPcAIFs0ukHt3CR6SmJtAceCBU/XV4cIuP+ES1J5c7a0PsswAnvgj6s5?=
 =?us-ascii?Q?ngv8vzC6AZ3d4n6pmgpdVwFA1x+IJQc4MKwjR7ZaAbgcFAdUgLtdyE0G89sR?=
 =?us-ascii?Q?u2S3pPWMvPp/FKprlQSBKE3SGN3IPyDBAo9FdFcilWozW6Yhe4S7dFzlCOQW?=
 =?us-ascii?Q?9w/tn+43Ns7QRYATc4bEQ7Bk9feZz8Ka0DHJbMhRfvC1RstMnslWf+YdFRhN?=
 =?us-ascii?Q?JsQ9SnIxUEDALhQn7JxfXpBuLf96c6qjDt9N699kb3SIxw2fDB2DjK/qr+hw?=
 =?us-ascii?Q?34g36Jan46fSMmlnxn0Ug9EOuIgxyHqBkyhrGinPDifUXQ2qrytLc1JW2fdI?=
 =?us-ascii?Q?wW25Op1tXtVb2womNAfSifQfGFJ/bzfMFM4hDNJxJTZFIirVCGcFtwi0Rq0m?=
 =?us-ascii?Q?TXMMYIC7gFMQ6assb1fHHJRXYDMjct+H1SmZSSugHvQCNIYAYwqIwERYNZ4h?=
 =?us-ascii?Q?4GW04jQUZJPy4Xf9lRoTeknmkLthxPu5xxya0l+ed5nonSMEJDqzU8IKXQxs?=
 =?us-ascii?Q?y4cMqb/Zjodw67awW6a5a7gSv4mK9+AKQ4tPivDIHFD8b3Odpg/6TnrQLoiE?=
 =?us-ascii?Q?7PGc1zUKeNXaN3v3IHcBPfaY6oVe0rdK8scKLXs33vOBNzDL1RBU31clUe81?=
 =?us-ascii?Q?A2icSq9vC/kMJ9Okz7lro8fJ2Sh/iQfhX4k5SOsmCNCQWG0YbhOGgUYZa6rr?=
 =?us-ascii?Q?ceg6FEHuW7C0jOHsS7FKS8dOQwXkW1hw0wbAlbBbhHrfsgFM7owxEI2HCJ4u?=
 =?us-ascii?Q?5/wio9Cri756MKVheN+8CCb2k/lEDJ47HCxttxUiYNcodFhKKPwKnS8h/jda?=
 =?us-ascii?Q?BBgGUWRV6sedXsqwTYAseywJi5BYXcZjYEcALplRPhyAcdaA6U5PvZspwSt1?=
 =?us-ascii?Q?yYJrK7p2WmN3BYRr09OZwi8yDbfNSN5cGuDnF3Ok45sxDrvNTNqMYbtotAc/?=
 =?us-ascii?Q?TYML6TnjpcXF1h+95r8=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(61400799027)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 13:06:42.6769
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 571425f9-57b2-4eb3-1905-08de2835a6d5
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR19MB9695
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA4NCBTYWx0ZWRfX0qOPnZOQLgRF
 LqnZoTL5o1Ave/B1cKjZYwz6cK4ZaFtqNujKMnycuMw80qHiP1Kv1bt6szRZKyAyBwAhh0m1pLK
 bXC6LOj9MUsrlcfZ0k7JM02adnxnjwEPScf+NN0UYyvER/AiCGUO+tYu2m+Bu0dye01v0HMUHw7
 J6ZX4c5xwwOpGittQ7AhDiN5sSzPPdvg9yT4s0HjT3MJmZw8Iv8b0GaoFY+lgTCWhwPcD9epp0b
 nAnixi50g7CQADKfQ4Ejg6h46Xnd198npUfC+rp4GfNavho5o4dp0uPeoPyUq43sCc3CJ19Gcb5
 1Gg0OMQ8oCd6aY9tAyi2pXOTW8Iy5CcY5u1uM51isgFvnhyzMIuUm9jw9itQYJ1pTQqRAyJ1aAD
 TMD09pE4gHxa5p86f+jBr/T3Ab8fzA==
X-Authority-Analysis: v=2.4 cv=XcmEDY55 c=1 sm=1 tr=0 ts=691f1266 cx=c_pps
 a=t88XDKUlDquqCT1Kmp1J9g==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=6UeiqGixMTsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=51w_oVqo9F9s99f-ZKsA:9
X-Proofpoint-GUID: J4kaRuMQldouTapxkUOi2mXbCbBQAkiv
X-Proofpoint-ORIG-GUID: J4kaRuMQldouTapxkUOi2mXbCbBQAkiv
X-Proofpoint-Spam-Reason: safe

These two patches improve the implementation of the debugfs files for
the wmfw and bin file names. First patch removes duplicated code. Second
patch replaces the old clunkiness of storing the filename with an appended
\n. The \n can be appended when the file is read, to keep the stored string
sane.

Richard Fitzgerald (2):
  firmware: cs_dsp: Factor out common debugfs string read
  firmware: cs_dsp: Append \n to debugfs string during read

 drivers/firmware/cirrus/cs_dsp.c       | 56 ++++++++++++--------------
 include/linux/firmware/cirrus/cs_dsp.h |  4 +-
 2 files changed, 28 insertions(+), 32 deletions(-)

-- 
2.47.3

