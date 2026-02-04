Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE923D666F
	for <linux-sound@vger.kernel.org>; Wed,  4 Feb 2026 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770210309; cv=fail; b=frjIkeQ80QfGz9nVdIUsIG5yPoa701IYF4maxtt2Nx03QiQ3eT9hS5Q7fcK+wUOBGguCwV1BTjmQsKrrNcB/dFTfmIdtSJ7DiAy8PHltadHtJUidEVfVqVG8quHjxUN2bO4+m5h3vRMr/OofxpYNYHhN9GMi8vS2ar8fA3+d+Mo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770210309; c=relaxed/simple;
	bh=/HN3qr10+6eCt9ppUprn01zGyAO942WnWD2zq8Xe9ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PFb/JyGOeJb0lOGnCOnAeMaOJuREH9o9YuUNL1zJWVeGxgxwx5UQY4xkYbBOnKlUGA2+Q6Od6SSU8f7Qmhb+BEq/qArAdpOHTm/OLZfKfLoZqZ/PdBs+rF39y3KHcY7hJdjrLyl0XbKjydTaL5lmoXg3wURtJEAcx9RTOYjusm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=g7FYUSQe; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=kW3pqQpZ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="g7FYUSQe";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="kW3pqQpZ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6148tEJK2815969;
	Wed, 4 Feb 2026 06:59:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=PCFapD9Ig1xoJciFHPtPt5azVWFTwX0l1aHQXvTVSs0=; b=
	g7FYUSQe+JyHMbjU/TOIUph2vmvt61WD7K3Wp6rev4iCVlzvG7SMXsO1G366SiOA
	ATS3bGuTwAaUtABzlc57kH9kaDktppDHmSEKrTeLMFRjFKgD4ne3i0hiD8TuRU9e
	0NrOF4nc+mwrTo3zh+v5FeiI7CHBvo3flaEiL9MzuOjjX7LV1hNwk7QxP+2GHbr7
	+KQ5LRXBm2WlAXAXTM39a50FP34NJGIKpYDiAHeXpxbY3h1TpcxoX56ciQgNYhWE
	xFyR46Oqt49iWlQgyAt07ds+I2oh+J+l8YDnmUXAoGx9rds9aM+HmMInOMIdS2dw
	QatMfUkr9dbj5VZX+UPPew==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021094.outbound.protection.outlook.com [52.101.62.94])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4c1g12vh3j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Feb 2026 06:59:56 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zS063/5afvjjbdnv9uMVs1lk4pXP/0NxkgTehuPytxI43QtljfvucJNYPEKWvglQr5Uwznt1fyFmMZ5iU5AlD0/rlMrnKhWQc1gqFBg08IRisbQy95CWlovjNawtpl9WxSsXaLxbM4xcHpFC1CczjCb2c/ilpACWUJ/mhBjz5ikSEgzSj2p94zzfYwt7wRjOk/MbOqTJJj7PHnlTJf/peFi8ChqXRlHnbBA+sFYZEYeipMes52VQqKS5ZT32B1JVQ6/nrZXiSVrrXLCLp064z79xt7iGW+B/x/q2373Qy9r12985OIed4gpT0JsMInK9gkimC5hCayQI9Of3Q4ri3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCFapD9Ig1xoJciFHPtPt5azVWFTwX0l1aHQXvTVSs0=;
 b=SQMgRAawdCNjHvS6PMAOkubpYdf/APP6Iqon8M23buIeURQ1UvHDuZylsD4kUeLsuSLSnpB4vOdAQoJa3HYqxyD+HpjicnLmZ/Wh+BJ+Befsp90BDBH8wuNBUFe3WiMb02QGrSlFxk3Cygx5Eat7lVtxiaOaSovWFBBonj8Nfobfi9mDy6Tz98foN8Pjld3TgefOgB+PAcOtfJJDho8fpz1N9DoG1r0BsQBim8PgNg/5+4RhmAZ5X3VukFkhCx3SgOX1kHe2x8tcURa4fs5OjoPyv5Ok40LEW5NPm8i5myp7Dm8fzLTsUp3iswLZ/hm3p/xWMv5gXNWglbd4BwLANw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCFapD9Ig1xoJciFHPtPt5azVWFTwX0l1aHQXvTVSs0=;
 b=kW3pqQpZie01q+AVorKfyyT3sGfFe7qSb2sL3WYn0X5j2Juk1ma7YFlS/fg1ZmoohKn6bEvpI/cxGQCIh0aJrLyxjaw9uHjg+qYarYMxs2RWFdHgwrmGVwizxuCBpgI3/jh2QgFFloWCN/piJJPFu2DYCOnnFLE0ngqJBzXghx0=
Received: from BN0PR04CA0173.namprd04.prod.outlook.com (2603:10b6:408:eb::28)
 by DM3PR19MB8426.namprd19.prod.outlook.com (2603:10b6:8:1ae::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Wed, 4 Feb
 2026 12:59:52 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:eb:cafe::82) by BN0PR04CA0173.outlook.office365.com
 (2603:10b6:408:eb::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 12:59:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.10
 via Frontend Transport; Wed, 4 Feb 2026 12:59:51 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 24683406561;
	Wed,  4 Feb 2026 12:59:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 057D782255F;
	Wed,  4 Feb 2026 12:59:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 6/6] ASoC: SDCA: Limit values user can write to Selected Mode
Date: Wed,  4 Feb 2026 12:59:43 +0000
Message-ID: <20260204125944.1134011-7-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
References: <20260204125944.1134011-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|DM3PR19MB8426:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 736c6c36-48e6-45c7-53f0-08de63ed491b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OcvHM2HmZ7vp5HBgx/EtCB1K7rhF86rqs8RXPcYq4bEhaSHJTQIXnqgSjMWF?=
 =?us-ascii?Q?mSdyTAIm0RxamuO0tp+JcXTACGx24lRcSoh26OxhLpUMBGo33Z9V59ZgGRJz?=
 =?us-ascii?Q?efmnSGjh8VN9zM7xZd7nEPXpdkd7QMnA2bE0qSNDiGH9ngTHQgRXIYeFsQPj?=
 =?us-ascii?Q?gg7y5JRSsfA1jAObhsVoK3THTZeN3c3uyG8L4viNNdl7GcSKGNZWLHKF0mTf?=
 =?us-ascii?Q?c1V/Y+VTePAv8Zun0eGV1CD6fTNOdxTKZ+dumUhAplzqNyp0jzMz2yTw8Vf2?=
 =?us-ascii?Q?wWm7pLVH/uF52GFJM1Fm/v9C0vPyA0440B+XWBTnkEfl/t09oVOkrPRzOBPM?=
 =?us-ascii?Q?8Lce//77Zq3mZ7b3dxtAoqrt6ktNPDMAAq7dxlJV8hp4Yk4TfyVgxMgKU1Rr?=
 =?us-ascii?Q?ATqY0ScJQjqIH/b2kkKnOaPCBZBiMrdkxOgPpWZDqNyJE1ZXL6+8IPHnurqx?=
 =?us-ascii?Q?z8v+p4aXiqPdU3RxIiDGQs6aCi9T/AvKndInMndTxu7KLB9FUZW2YWoHOTdu?=
 =?us-ascii?Q?bfpto0Meg3UYeCsog4i2sNbsFlOuQ2+5AoBq2HlxTYsFGeTCnY16GGalMeOt?=
 =?us-ascii?Q?lbZZRV2BS/HJLjmOBuxjAnMIu8oOBG5qEKuKJrIZx7iHlrvuj5828OwXVAsx?=
 =?us-ascii?Q?YaLNTpQthl697G4DcidrYMDL4AmPJsrHMf8pVVd6iDb25JUdt75itsQ3iWw7?=
 =?us-ascii?Q?wkYIcfx+RkG58cvZPucNWiNloetrMPnzknWRWxxG08EU1zYBQCb2/tL8IJAZ?=
 =?us-ascii?Q?uppg8PL3KSmgYA1W0pZm7gAfOFWHysrHy8czk+aFnGjvhZ7Aux+jIq8UvcA1?=
 =?us-ascii?Q?JjHJzaQaurPgraENmh0yMrb/X3OBUQHlXZVtj1ksEekZvGcdaPPYY84sfz4c?=
 =?us-ascii?Q?oH2lgK9WdsNh0SzjrTXbL4AWxyMBCeRSbAHe4wxJe/qjToaDzYFUC/fr8dyu?=
 =?us-ascii?Q?KTofsgUhzDArIyZyXlnF/DDrvMSltQi3aT+DyvyEbZ5DQ7Iq57ljsTAB0Tj4?=
 =?us-ascii?Q?iI38yyRpUhDPduDLAFahH69My0jXmGfoNQiGWwksD4oLvtuK3R+z9AbIP7zo?=
 =?us-ascii?Q?Ob0ibXAWgcaf32aWWFp3z61bErJhv158G/LqdIjDBqMJcBBozIlSYxEy9kTK?=
 =?us-ascii?Q?Pduq6W1cNfmXoc6XBfKgES9lPfpIe4dxQks+H3Nie/ON+I38npHb31/UauCv?=
 =?us-ascii?Q?sE55CTnmq5EZGZctAWXP3IU1b+wiHLpCNRapMa0RJH2Nu21vIXfotChUr5VM?=
 =?us-ascii?Q?+V6/F6V8HQt2WGHzIY/+Ca150NgzAf1ccY7DcImjurmByjk2QT/ZDVsmXGCz?=
 =?us-ascii?Q?LOwfFaej3Secec57bumOlY3OAtQmpcHuaSoyHyGLAk0rHr3aopTTLUMd31gq?=
 =?us-ascii?Q?L6Pqwzd1758Be81SAf8SFaz9IZMDF0HAxqCRqseFYCh61UxYfFLSVKSj/MNn?=
 =?us-ascii?Q?vRsk+Oq0UhxDJvfA70pxLDZoyMIRDv8JDYEBi/kYTEuj2Ji2B62okAIkLvvW?=
 =?us-ascii?Q?pOWLFYktTsBHr9IduUyFclsREz+EO617q3GqX4+RSu0dUNidDfl44K7WMRFM?=
 =?us-ascii?Q?rkTWMEpoedi7Mg4bbz20bbCh7r9FAn0fGx11HqiZBEVk+tiZWEgCnvA9G8sr?=
 =?us-ascii?Q?uy2sEVVLTAbF+trxFiiN3PjYys1hLrTIOgLkWsnpBWrd6w5aJTrMwGxQ7+vp?=
 =?us-ascii?Q?vjvFbg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Wy9xlXTBRFHkgkqlHI9HSgd4FKvi4gr9Q4ZA6Rj072hO9rT3Fw8oUfzQj7iAIaekB3zGAuYF2mqM+OMsrsZPZ6727VQld8CU3r20bZrBAyIy3GKXowLOieGfYTPby7rBMLxLnAN8fAJ+qQ1uLJY/rZowSZdkS0SJKs3VH0xZwXHCMkDD8oKdNwOFYglhuy7VTFtynU1iPwcgDeJbVn9PlXuC6B1LPr1jGXbRfWg8hlpuZO/8J9BqHTgFy7ih2gT6FTvhKSaZSL/enBpVUB8+qqcaexl77nnzC3q4FW7H/5UXDP9r2iEkqtukVxEbjppcJWDiSBpKpgBBKHa+QephS2/1G6GbIJK0MsXAQzCQBFPGdlMC1/9UOz1fsjzCQDrj8jzSepgzBwXtrsp44wmh+xG37uc8yCzAdPAGiCxHBVfOXUWOM3PqHxkM96n9pJGf
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 12:59:51.5987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 736c6c36-48e6-45c7-53f0-08de63ed491b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR19MB8426
X-Proofpoint-GUID: x_y2VSBESxobWt_VzbC39bVRmKipxJIW
X-Authority-Analysis: v=2.4 cv=Mdthep/f c=1 sm=1 tr=0 ts=698342cc cx=c_pps
 a=QffN0g5EZ+Wxgj/Qwxz7mA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=w1d2syhTAAAA:8 a=wx92ma0jwm-VLhLIYzsA:9
X-Proofpoint-ORIG-GUID: x_y2VSBESxobWt_VzbC39bVRmKipxJIW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDA5OCBTYWx0ZWRfX6lXig51vxA8i
 EEY05q95wRETIe7NcL5RqzRUwFOqDj9eYQ+//ip2ONAickWjhk5W76XaRRcKA5Cofij7EmHnkNw
 ZMqiCVZb/U/qjZv4zGBvk4ZFkR3NOj8Cm7yqK1+WQ2+EjG3aMcBNwtUF50Ms6a5u6ybdYI3guCj
 kmReq+tbj19FqNpJXGSx80bd6T+eMSmfkr1Dj3M0AwHJHkKELsO5bleOSvP5/Z9LNHSvAaTs1wa
 JC2w7ZpBuUqUNNfkZcDlAH6kqnvZJGsuMWYIof5Dy0HsTiyV48zgqvA78tpaeb1MvEoXDTsn0gG
 OWUC1rv6sEgaPUSBwWSw1/bMUstcN5HRP95JpDdSnW7GopALY9qAnFW836eil1+OINqUWY7TcPf
 bALzd3QnzM8/VcigXlBoMOx3ez3Y0jVpUOeOPWVYhfVM/orwAZMVaM9Cydhj72+iKWgtEewiTX7
 prwH5bTjO4/SznlQBSw==
X-Proofpoint-Spam-Reason: safe

Prevent the user from both updating the Selected Mode control
whilst the jack is not present, and from writing values that don't
correspond to a valid jack type (Unknown, in progress, etc.).

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_asoc.c | 37 ++++++++++++++++++++++++++++++++++++-
 sound/soc/sdca/sdca_jack.c |  2 +-
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index 9685281529e9f..bb6e74e80a3e8 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -116,6 +116,41 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 }
 EXPORT_SYMBOL_NS(sdca_asoc_count_component, "SND_SOC_SDCA");
 
+static int ge_put_enum_double(struct snd_kcontrol *kcontrol,
+			      struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+	struct device *dev = component->dev;
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int *item = ucontrol->value.enumerated.item;
+	unsigned int reg = e->reg;
+	int ret;
+
+	reg &= ~SDW_SDCA_CTL_CSEL(0x3F);
+	reg |= SDW_SDCA_CTL_CSEL(SDCA_CTL_GE_DETECTED_MODE);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret < 0) {
+		dev_err(dev, "failed to resume writing %s: %d\n",
+			kcontrol->id.name, ret);
+		return ret;
+	}
+
+	ret = snd_soc_component_read(component, reg);
+	pm_runtime_put(dev);
+	if (ret < 0)
+		return ret;
+	else if (ret <= SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS)
+		return -EBUSY;
+
+	ret = snd_soc_enum_item_to_val(e, item[0]);
+	if (ret <= SDCA_DETECTED_MODE_DETECTION_IN_PROGRESS)
+		return -EINVAL;
+
+	return snd_soc_dapm_put_enum_double(kcontrol, ucontrol);
+}
+
 static int entity_early_parse_ge(struct device *dev,
 				 struct sdca_function_data *function,
 				 struct sdca_entity *entity)
@@ -192,7 +227,7 @@ static int entity_early_parse_ge(struct device *dev,
 	kctl->name = control_name;
 	kctl->info = snd_soc_info_enum_double;
 	kctl->get = snd_soc_dapm_get_enum_double;
-	kctl->put = snd_soc_dapm_put_enum_double;
+	kctl->put = ge_put_enum_double;
 	kctl->private_value = (unsigned long)soc_enum;
 
 	entity->ge.kctl = kctl;
diff --git a/sound/soc/sdca/sdca_jack.c b/sound/soc/sdca/sdca_jack.c
index bfa621b744e1a..605514f020454 100644
--- a/sound/soc/sdca/sdca_jack.c
+++ b/sound/soc/sdca/sdca_jack.c
@@ -105,7 +105,7 @@ int sdca_jack_process(struct sdca_interrupt *interrupt)
 
 		ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
 
-		ret = kctl->put(kctl, ucontrol);
+		ret = snd_soc_dapm_put_enum_double(kctl, ucontrol);
 		if (ret < 0) {
 			dev_err(dev, "failed to update selected mode: %d\n", ret);
 			return ret;
-- 
2.47.3

