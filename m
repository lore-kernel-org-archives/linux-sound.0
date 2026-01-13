Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA8618B0A;
	Tue, 13 Jan 2026 13:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768311666; cv=fail; b=Rkf43udUJiQlCwEYUQbzddQp5aa3aY1psSvI5Kr8bfKAqnhHGXnjrktqhtFqv/wPt77ZPjDpPqeGxtisOqOgRhF1fnk8P++g2BqGOa+VfMS9l3jq9Uk+UBXt9XWe5mQIcNm5LO568f9Mxd5iO1fRGnswbBdMrMca34CayYERa0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768311666; c=relaxed/simple;
	bh=vgvZkbRcYizAaAbLoHmj4TmESHV1vOoqM7Sud2sBQBA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eKWtidtk/BFR3sjYvI/IfcuexV6BYgdh1/s4Givj9H6rxTo0FQT6TAUGT1e+Bgeojk5fQUGfqfkAvF8ISTAskc8MXuC331kuyzfAemv6BBPDLDzFzUbZLldHqLG0fCQCS9Sxht3ynP5ukOakjexCKmDQIJbmzGZVdasllJ4QrsQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=R/vi4nsL; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=k3DzZYHS; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="R/vi4nsL";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="k3DzZYHS"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D8cjY82361235;
	Tue, 13 Jan 2026 07:41:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=ZuX8i9ZdD5ieYVN9
	PF3oAshYXGzKN+Xv3zBFTCVxFZA=; b=R/vi4nsLWnxCDheC6IeKdO6RwV2y68n+
	P48aT00c1cMY3mXuELTdK1wcLtnsHHx56b+NvxlQNIgy87IeSrKsy4aIM8euaoal
	bsnWR0qtvyROLxKhDqxEnoCqEXqE0Mz2259FstIP0uyb4MnOjl3w3LtQ16tAmSjN
	XMJgbViF4+mvQdLQDriL8s2X2eMW5wamIcfEOfs9EMmZ64FbeDrqIYBBXlgUK+75
	2dbrWJl4luYwhXRLnPOaSEHpE9UaAJTNA7ldLhx+YbYiWSCPWPrGK3wz0CHTjh1i
	84hCbstpDE6sIojMnAev/ev6gMFLS2I0IsU0kliFYomqmMSzwwrBcA==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021121.outbound.protection.outlook.com [52.101.52.121])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4bkm2n321f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 13 Jan 2026 07:41:02 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FQZBk6H9T4Lj27sLL0hO3k1WWfYfrQHrdhHKioOyNEpaHITmc6UtBr4405tIcxmCTbScBCwAmQ4yydRlBegQXTgaX4rFN7uP2SR8x2A9QTBL/Nj8DLwCCdc7IYqp0XxCNaTqVB71rE0bEtQmY2+lCbNSKbP0yNKl1SKENQ1h/dRg/BPDjk0XZm/INK9Wp0PsEhJCy32CmWkHGl3AfsNe6bROyBbdsL46N73Pe95r/sgNTvZdFTCrORrt89ADx+SMnIzdpulTE+YUNQB/byoFUMhpB+YjmEgFMj0UTFBJVTfQQuBxEQAf8j3JpcxpdxpVzly+1Gv/JPbQKI1E943Leg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZuX8i9ZdD5ieYVN9PF3oAshYXGzKN+Xv3zBFTCVxFZA=;
 b=L28cVBrjXtxTb0kdaMUB71CXuSVKWikbhyW1TMiGMMUIWCfNXHaoUJET3CL89fH+HrzljMDVGmrgXhXzUD8Y+berBXsqiEct1iVQD9elU7L0IORYUG9vE01tWnpOnDyqupeMAcKDCAFAXL7eZdSAMTEErk4HrcSgCjex4M5bW+UgRvdKMrcdVwzjMlhsKETBnyw/a4Fmeb37h0otvmMysKVRk5QDmPZGPccbJv2BaVG/ZXNKi03R/Y1YFZYsNwrqKaBDjoZk2D6qeZYWXBTAn7vSvHtRLUX3tDl3ycf+l+e7gE5tQ6k0Geg3mBZ4810zGkeoAHrccnzEzfOamORF7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZuX8i9ZdD5ieYVN9PF3oAshYXGzKN+Xv3zBFTCVxFZA=;
 b=k3DzZYHSfLPXWK8oCbNoIfEyJwVbcIiOXkiZy3Y463nZgibvZg8E7eyeteBDtuEM30akB6RFLl2eVx3+CDIc8vNfKONkuFiEMZPkCdYgOk96WsqxcvnxhXqLe1858g8mAygZ/0IwuVZ+V4/9cx5shkf7pBm5f7Loh7wuPpm3+Ow=
Received: from SJ0PR05CA0063.namprd05.prod.outlook.com (2603:10b6:a03:332::8)
 by DS4PPF0DE157F24.namprd19.prod.outlook.com (2603:10b6:f:fc00::a0c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 13:40:59 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:332:cafe::5e) by SJ0PR05CA0063.outlook.office365.com
 (2603:10b6:a03:332::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Tue,
 13 Jan 2026 13:41:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.1
 via Frontend Transport; Tue, 13 Jan 2026 13:40:58 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 3140B40654A;
	Tue, 13 Jan 2026 13:40:57 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.24])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 24283820247;
	Tue, 13 Jan 2026 13:40:57 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: tiwai@suse.com
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ALSA: hda/cirrus_scodec_test: Fix test suite name
Date: Tue, 13 Jan 2026 13:40:56 +0000
Message-ID: <20260113134056.619051-1-rf@opensource.cirrus.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|DS4PPF0DE157F24:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 768b4afd-6af9-4971-e63c-08de52a9628b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700013|376014|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MIdKVcGZnVunZWheLTlRYdGfW1y3h1q25ojI5vGvn3ER9oxJLimjhrX1JSfQ?=
 =?us-ascii?Q?R6cVjVg4/WQjXMMcAsWfLS+mC3JVcw6gbJvvUJ71oIV+k5eWOwfeb8zUaK4V?=
 =?us-ascii?Q?OsR8jKzeoFafJr3PCRu0MBrgSBFDdbtibWW5kVtokrmUL0MtYYqDiNSIIShQ?=
 =?us-ascii?Q?uB9Ky0yNI/7q3Nuytjb85+2/ZEuZsKFTCGyYQkXVUxLst8VnSRYCcGohho4R?=
 =?us-ascii?Q?NgXAQWvkwR6rnlQa6dgZUhv3Z28NEA8c0UiPBPwZP97AxFeiUb4l7nG/Bn1S?=
 =?us-ascii?Q?7Sd8Ii0yi1mt+ARQ0d765toTynYI4rzXv++sETh8W40izMdXusYgxxAf9DYT?=
 =?us-ascii?Q?V/JjkRLYdwdmpoVxbbOA2OcusI4ZfpmgLjN+FlzDEumpphK10fQ47A8jk7nR?=
 =?us-ascii?Q?x/yHpR617YLrplNDf5GgDfqMmEp5x0bH4N/NGrPozuXjn0C/5jf6Rfn4AuRo?=
 =?us-ascii?Q?08IKYCgZZ+rDCXmCn+BTBTagya4ddOZHeMKncJ0ZptBv/7E1u3jspkVYaa3l?=
 =?us-ascii?Q?d/YfPyr3HyTIIqo0lj8+8zP+D4tjR12qKBjDJT8FEPVMnZUBQp3IPrPJCqsC?=
 =?us-ascii?Q?qDE0gBPy601esInrCBgSPdiZlCjiABng2x70L/SY/73itfxRGbYBKMP8RmEo?=
 =?us-ascii?Q?UI7G8HIWBLuoXZGNzJ3sIttartnrYLbrJRO91l1PudRBfNYahaiY4UiOzKsr?=
 =?us-ascii?Q?LgVvMmTDVQCSbIh3W+ynj4vGJVkoitV8p8Lie7en27VNAqeVtVt8R0TuyuHS?=
 =?us-ascii?Q?MiM6GMrhAr1GC5bhwncDj6BJdPdnlfCb/0NTwStukYs7R48lPG+2qC0im7pQ?=
 =?us-ascii?Q?Y1oVKB+Lno7Y56eUO4lP6391NW5Z/kx1p+EccYSc/tFz9LzSYiUR5+BvnvJZ?=
 =?us-ascii?Q?k9VnqK6GJKpC1ycCjcOuskj8M27XZ4PuGjyvj1IZAmSsTAxUHgmffIWdCdse?=
 =?us-ascii?Q?0LcN73HrD/ZsSB9tf0IfsDyVo0VO3XO0oQb6SRQjSS8qAuaoNT0aWbA1UMgI?=
 =?us-ascii?Q?V2lVYNSE4KQqqzE+3bTkaOYrdPXX02U2w8IQCc7qgxJInhfB+yV1gofPsaSW?=
 =?us-ascii?Q?EeKNM10UqBDd7HbaE6GQpPJaDxvA4ki1Y4X63ybeMUaGmRYdUbv6e8e35nQW?=
 =?us-ascii?Q?txh2/PH0yz+Jtn57cEBJ2USWt08tgW5Gq6ikIkRiNtBOlhqyab+fCtkAaFKs?=
 =?us-ascii?Q?tlDSJNa3rZJjP/oUB1MmoQCOJNzLUJg2xvcBUEM3kyKt/4bEaMlLVMTOyKuE?=
 =?us-ascii?Q?v4u3N/yTLvd91iIN8JvG+OVd9Y3SEiZxss3UKW6BQO59/Sw2ZVJd8B09WcGA?=
 =?us-ascii?Q?mOwiQnyNVxZXIyvqlzSkO8A6HMRi09wyNLBJ1crMGkTRVvguCumVhZ6yvUHm?=
 =?us-ascii?Q?aZxhah3v9zJUmdOmCuXTW+Dl8c0eCzsDHRzqVfAr7HnnOb0hrMrbeUukHuwK?=
 =?us-ascii?Q?JUD5BAG4r6GK3LXmi2fCbJ81qA0yCFBXpoYlosWfMeTcNcermF2Xs+AeT/QC?=
 =?us-ascii?Q?iiwjPz+Gprv+vOl+V+Ika31o8tnIMw7QGSkjBr5NC+y40zqxTeaiyS2bjdue?=
 =?us-ascii?Q?J62fvEECqK/cSJ9d5HQ=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700013)(376014)(54012099003);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 13:40:58.6122
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 768b4afd-6af9-4971-e63c-08de52a9628b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF0DE157F24
X-Proofpoint-GUID: lLBq-QAu-TBxO7ouq77KEZVH_RojnUc4
X-Authority-Analysis: v=2.4 cv=JZ2xbEKV c=1 sm=1 tr=0 ts=69664b6e cx=c_pps
 a=2V5HoZH/GQLctVJeKf1daQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=IgMWcWaQFKaojaqcbqcA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDExNSBTYWx0ZWRfX9kyWLeiinsUa
 8AVp4Zbec/iEPtMpA6hNkR2RRpe6qgYMgOHLhvdKYgj64rV9UUkCPh0HL8SHerBTe1ia3ONu8Yj
 uvK+O8liLbo5IStSw1caFfBRnlvgfe6+afcf0rskbtdRiazP9Nrk5h4Gt8pBel69IFtlaX6faxq
 9svcPE9cBhttnRF7CAk/YS83QUlcl2rQiSps4i4Kiae/lqSMYcONJs26ALrpiIjrZsn2bYwL6Tc
 Z9y6pFrbt4LZjtVh9ePY+9+nt9257K1cRnEMKmX99/s3s9bzrZADf2ABpvGfdvUwg0VvJtN2+qq
 kNNa5JcB2GycK/9bJqzYrEba4S/Rm7Nmn5eplEKk0HCk2O2is4++bJy/F3CEhXTGup+q4xYJS1O
 mmmCAoDZXA2dm6EycoNhYrr+jwYEnIMlpc0MJDlNwV6HHvnjk4JD5sn8mt/zATnUJ++Xl3CKF3D
 Cz/pOaiyEfkzTThIsTA==
X-Proofpoint-ORIG-GUID: lLBq-QAu-TBxO7ouq77KEZVH_RojnUc4
X-Proofpoint-Spam-Reason: safe

Change the test suite name string to "snd-hda-cirrus-scodec-test".

It was incorrectly named "snd-hda-scodec-cs35l56-test", a leftover
from when the code under test was actually in the cs35l56 driver.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Fixes: 2144833e7b414 ("ALSA: hda: cirrus_scodec: Add KUnit test")
---
 sound/hda/codecs/side-codecs/cirrus_scodec_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/codecs/side-codecs/cirrus_scodec_test.c b/sound/hda/codecs/side-codecs/cirrus_scodec_test.c
index 159ac80a9314..dc35932b6b22 100644
--- a/sound/hda/codecs/side-codecs/cirrus_scodec_test.c
+++ b/sound/hda/codecs/side-codecs/cirrus_scodec_test.c
@@ -320,7 +320,7 @@ static struct kunit_case cirrus_scodec_test_cases[] = {
 };
 
 static struct kunit_suite cirrus_scodec_test_suite = {
-	.name = "snd-hda-scodec-cs35l56-test",
+	.name = "snd-hda-cirrus-scodec-test",
 	.init = cirrus_scodec_test_case_init,
 	.test_cases = cirrus_scodec_test_cases,
 };
-- 
2.47.3

