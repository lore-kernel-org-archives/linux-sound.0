Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C3228A1F3
	for <linux-sound@vger.kernel.org>; Tue, 22 Jul 2025 10:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753179823; cv=fail; b=mChGqGTRf6gUgX3ZJpk1s18HC3GjY+/ibV0iLrsm9t9p+qcIrzTzRSVZjiNhfD2waKRIxYuZzS0t81UTA1HVc3FpBpR/IZRI/oZeM0yKeSioizUKN+OmzPtkfDzDrVQlrgSn8NDxIjFIDp3InMJ/NT5A60kpCdWHg/p2VBohI8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753179823; c=relaxed/simple;
	bh=mr0KEaua8I8cTd3aZ4tpubg+a4O73iXw9EGYquf9H74=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=TX147MkutppP0qfpHCzyMht5CHU+XRDqPJu/E92nVF/iyxfSHMibynOoEYRsfwvYY6/SRV5abNReE+0myTMtgXclNPyZpvSSplih15OkEqxZga2j1UNs/oJygDz1MncEz2+DyWMbeXG2HqHd85TyK/cHEuphZDXUHD13R5nas9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=dLJSGfqu; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=mJmOwUpQ; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="dLJSGfqu";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="mJmOwUpQ"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MAN0cu031139;
	Tue, 22 Jul 2025 05:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=dCssjYXG9sc9VPqN
	IqGjZO5pnJuZ1qQiTf/4QHpA9/o=; b=dLJSGfqutJEjR+TvrzvOAu2/tYjtSQG6
	OCdMmkATo5OjNApn3Aps5POcdp/uj04Vns0oMl6j6uKmqiIHZ68MTiG6MDHZcoa/
	LLtbEQ0LMifFwshv4RtEci4z+U35b9eJhrZGiLvZjFV2M30KdduFF8A2brrCCq/B
	XLe2LYSZa2Kh7ysxAOopn4SaYVTiislO4J5axhtFhCTEy4NaG4kh2sdxJINCCrML
	SI1pF+2MXZd3hJYA8VGfttgabHQUql5etTRmmfeBTOO9+6ML3xC/zlQ1mfxkcodZ
	XpyQmBKPAZVqRgORWmey0M5+Mkgv5DWQTxwvASP4VvXM+NzhkV2x0w==
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02on2093.outbound.protection.outlook.com [40.107.95.93])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4828ue800b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 05:23:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bg4kXQYfi4qWhE3/NIhXIR0swCmWF2dPQ9/XnBYnrKN+jnaC/OR4XzzAcRkOHz7TuZJYEbjxpkec7g2MazoL5+mPFnNQTpuApycEKMmDLEGzWJKdJkTErHB9JWaI1MB/9Ja/aDC9Kw3Ak942BtVja+waOWDLvjRGtKnqcj3IY4x92XMxJYD6/ofGdQDibr9yHRwXGCI0Zi6a1rsVK+ounMTrOHZp8Kyd/G+Flwvj+jR0TdJlAXj6vep9sBwxEHeB+SuVJp75qlwfxNCOVi6+yp7MyQVjkeg8247zImoORRD7c1xQP9r9iEBzcFsMRO7v8ahEodli6VI0tAWe1+icHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCssjYXG9sc9VPqNIqGjZO5pnJuZ1qQiTf/4QHpA9/o=;
 b=tv4XljIZXNX//PA2SiJDzaroNe3/CQt5So46NGpdppbvjHCuxMMv//nFgI/MhH47XU9SM2Fp1zfjQJaiMSxObFPdN3xIOfZ/RoSLfglGQwZeyO8Onkxhj6/fQF7EO4It5TlbhyAjUQzM41IKmDvbazLvmDWGZK8/oqG1CnjuJ2QU6krVZ0azHmSYBO1vcKDxBI8SknFIPfBzWFojOd+DxCNbqAl3zbNLWKRevDmNoh4fLJws4V5KMGLVlw5w9r+D2Hh+T5q27R6gCnBqyoYPdhTGL5/9fv1J/gixqqevYe5GD5tGFnVg/L/vMo1Hl6V1pGDqcKGUSeweyrcCg+9zQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=arndb.de smtp.mailfrom=opensource.cirrus.com;
 dmarc=fail (p=reject sp=reject pct=100) action=oreject
 header.from=opensource.cirrus.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCssjYXG9sc9VPqNIqGjZO5pnJuZ1qQiTf/4QHpA9/o=;
 b=mJmOwUpQcqDOs7X11dqXiU2WZU5MqhLUmk1bgDg7Kz4BE1vfN+f54a7w2CIXyecjOLq6HjEGur3drKRqpZeb1pl4m/uTNQ8ESn28G70Uhx4r5VX/zJwMHPyNfDiUhUTqa7b9ZgsmAdlGbNTSvXLzXLZ12ASuAzJyozykESRQbME=
Received: from BN9PR03CA0239.namprd03.prod.outlook.com (2603:10b6:408:f8::34)
 by CH3PR19MB8128.namprd19.prod.outlook.com (2603:10b6:610:17f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 10:23:10 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::96) by BN9PR03CA0239.outlook.office365.com
 (2603:10b6:408:f8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Tue,
 22 Jul 2025 10:23:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Tue, 22 Jul 2025 10:23:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 75A99406540;
	Tue, 22 Jul 2025 10:23:08 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 4D8D1820249;
	Tue, 22 Jul 2025 10:23:08 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        arnd@arndb.de, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH] ASoC: SDCA: Shrink detected_mode_handler() stack frame
Date: Tue, 22 Jul 2025 11:23:05 +0100
Message-Id: <20250722102305.2513755-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|CH3PR19MB8128:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8342ba1a-0364-40cd-37d1-08ddc909c185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|61400799027|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JkB0iRoZyCihnIuWoJRXlom/b5dQruBuMBxsVIQWCIWiTAlzc9rOVq3ENvoN?=
 =?us-ascii?Q?QpzCS2sHfFb45cZESdsvOF2MQQTKGmEEwlrxgoBmVceIWrUYGxiLj5UFQ22H?=
 =?us-ascii?Q?MtXMeRyiGA93J0JnLyuyXPLVeueCH9B9b4OiGHGy645xvG89zQc4I3pl9nu2?=
 =?us-ascii?Q?XTlsZx03mQDyEKdkz3D0jzyQl7Sk6RxDjvPjr4+jwI8WiVQ4VtF7ELDy2xO2?=
 =?us-ascii?Q?S++RUI6g09yovTxeLyY7Qlbf+HKVb7m12NjxNnsJXQ4toUcCCxXxjCKbZmDY?=
 =?us-ascii?Q?KkDzkZSN0uLpcOWMsTP4TQW6tkqHJ5Z3AQWUdf/qSvSzxbZx3E3GydeoRIR7?=
 =?us-ascii?Q?7Ip6v7WlGq7kQLYcx8GKwxaU7AIkLIm2Ozf2xlnSmpvwsX5GaSUu3E7mBa7B?=
 =?us-ascii?Q?c8FRDqcIpq0fh5vPXZnvegWNMw9RFwGBd6Q9Th7sHeT92AhZY5WZo8ksH8nb?=
 =?us-ascii?Q?jti7ab/JWao0bNa8EwZB8//4ySWJrsoGksWgQpPqvqq51PT8aQqf1KYm1uNV?=
 =?us-ascii?Q?14MKY8D+gdPR8Pr49GATqWKUHDhkezI275rCxn11EKJUZeAfS/lByuoZOVUf?=
 =?us-ascii?Q?JQ6r7359G34k9tXeq6wUPWnIjxlOJHy358NHRax7Qtg0/q63pakRP1OSyU+z?=
 =?us-ascii?Q?9EfZSlAjK3D5wDaoCnZlhI7z0a9YPhoSDq85Zik3t+wDvycyMDWjp/7zf/zB?=
 =?us-ascii?Q?Ekhg5jSlhCirZ2FzlyoRleqdJad5XRe+I7MDrAkWlYLREbeDwlI3jjnDwK88?=
 =?us-ascii?Q?Pv929RxxN0aKZPiCSy4EVsSzLT/Zz6WOMiR9jLHjPUeXVvKTmWOOqZcRlCR0?=
 =?us-ascii?Q?Wn95b2MO2Q7yGQbEe8ao5wEvo/9l8WKqTlNb1XCN+VOyhl3VtkUBFUTILCxo?=
 =?us-ascii?Q?tWsBx8antx5uMQOFDiely07jk7UrrAJqvnwidGhi4kTcoHzX6gXdQMSPNDMt?=
 =?us-ascii?Q?JO24NX4QyD4y3JHdt4wlRFWycuQwDsJnlGH/DzXleYHEkpuAmBgPN6hf1jJX?=
 =?us-ascii?Q?380CsXaJ+v8a9NRKjoOOOK2ky47hYfvHDvQKIJzqcGKyghg/TWNJpBoeRj9B?=
 =?us-ascii?Q?d9pP/0ywo8DFQ6T5WvOSwcp9r0mlvwtW8RBRsxKEl1gPj+B19SMoJyEOYHEE?=
 =?us-ascii?Q?UFF+4UeTX64Y3A46T+0QabgrsH6aclj1vUEK/2TNl0uEgtMVdqJUdaTKkQQR?=
 =?us-ascii?Q?se43hm1y88Owxb3TQ+zSscyqrgsANAH1W1QgVvy4VgKEemyFA8TslxdRIl6e?=
 =?us-ascii?Q?AxYyzJtW8RPOqfCAD+6HqN67KAxV0S+ooivEBSmAiVasXNvQ9348N6H/FKRZ?=
 =?us-ascii?Q?W3DipeggPj2CMib1RvSMDS0ijh50zswRJI20X6UDBSU4QDhSpb6pcVQ2ohE1?=
 =?us-ascii?Q?BgnHAmXHFb2Q55B96BG7bG3US3EC0WrOEybtFp2YkNv30LPWjC3sOdLQhAM1?=
 =?us-ascii?Q?twWQMKZwxz7FkSZJxPdg5+/WXqYkobp0Wsiqphory7XOKU2mV2pD7nfwItw8?=
 =?us-ascii?Q?lk89yb+kQUqPDCnqXso+yuKXwJuE0NQ2laEP02phtO9AveN0B2A6izIAxA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(61400799027)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 10:23:09.2946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8342ba1a-0364-40cd-37d1-08ddc909c185
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR19MB8128
X-Proofpoint-GUID: J2ny4MVZc_Z0Ea8O-bx4b6rgaTDk-yum
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=687f6692 cx=c_pps a=Qmi5oy1sRjPm40iBRcRqmA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=Wb1JkmetP80A:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=dyoUJAjtGU7NaWPGKOsA:9
X-Proofpoint-ORIG-GUID: J2ny4MVZc_Z0Ea8O-bx4b6rgaTDk-yum
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA4NiBTYWx0ZWRfXz/+H6tAQQLF/ z1ebWqzoNZ2z9YJ42JXKQjDB97DW42k5cziBlD3MXea2432SYu9KJlS0EmzCNrMmyH4hPdCBjzs nwGuLwVW0NqF8LJMPQ21K/cQtXvQvOGAsUlCEXK+b64LK259z2lUVSJSsqWRfVD3vdl/G1wBbCT
 lD86/aGRnl3WAViedS1X6YkZwHYGQi9LllewmNjbhr0xSGiB48ZIUliP5tB3GW2Qmy3ia5litlE mhWn6xe0tAqoTsbacGZOuS1IEfDp5Z1cSxAg0Puse3xT4UFg4nO5MqmA/42tVMJXp1pmI56OgiT XunVWL1QltfhMYzwkVJi/BoreCaVTKbz8Cmn1lr49BSUl27BOZzd34J/HlqVCkL16t6VZkWVjzx Uzg+vAqS
X-Proofpoint-Spam-Reason: safe

The stack frame for detected_mode_handler() is a bit large. Dynamically
allocate the control value struct, which is most of the size, to avoid
this.

Fixes: b9ab3b618241 ("ASoC: SDCA: Add some initial IRQ handlers")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507182222.OLgOy9fX-lkp@intel.com/
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_interrupts.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sdca/sdca_interrupts.c b/sound/soc/sdca/sdca_interrupts.c
index b76512732af8..a5b2adaac312 100644
--- a/sound/soc/sdca/sdca_interrupts.c
+++ b/sound/soc/sdca/sdca_interrupts.c
@@ -144,7 +144,7 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 	struct snd_soc_card *card = component->card;
 	struct rw_semaphore *rwsem = &card->snd_card->controls_rwsem;
 	struct snd_kcontrol *kctl = interrupt->priv;
-	struct snd_ctl_elem_value ucontrol;
+	struct snd_ctl_elem_value *ucontrol __free(kfree) = NULL;
 	struct soc_enum *soc_enum;
 	unsigned int reg, val;
 	int ret;
@@ -204,10 +204,14 @@ static irqreturn_t detected_mode_handler(int irq, void *data)
 
 	dev_dbg(dev, "%s: %#x\n", interrupt->name, val);
 
-	ucontrol.value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
+	ucontrol = kzalloc(sizeof(*ucontrol), GFP_KERNEL);
+	if (!ucontrol)
+		return IRQ_NONE;
+
+	ucontrol->value.enumerated.item[0] = snd_soc_enum_val_to_item(soc_enum, val);
 
 	down_write(rwsem);
-	ret = kctl->put(kctl, &ucontrol);
+	ret = kctl->put(kctl, ucontrol);
 	up_write(rwsem);
 	if (ret < 0) {
 		dev_err(dev, "failed to update selected mode: %d\n", ret);
-- 
2.39.5

