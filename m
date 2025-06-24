Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E12291C27
	for <linux-sound@vger.kernel.org>; Tue, 24 Jun 2025 12:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750768165; cv=fail; b=BMYhqVHO0MeefCya18nPfFLnieH8mc8VGfgf3UnQ9IeZ81kqs3g7Dj8FyJ/KvkS1i/D8YW9+aVSMeIVLj4X6BAo+HBF2HqOBCl4crMdpq8uhBixJTELNZHZff39FN21WidsV0ET6tT/DUsP1S0IkmR2gcxskCsHRny2qGUVwGIc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750768165; c=relaxed/simple;
	bh=Bs8U7sN/JHRbTG0cBACpP+LS6zIX7rHunlzfFKZiMvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b+uCuek+YtscB+bEn1bV24jIV5cD0AzVPuapw4d3uNdBn4m6d7WA937egWJ7jqI2VohEOwjplutd35PySZNH9Xu79bejj3+hzasOq06aH3+tCzBeiWpfmGtQBzkBLF6nArq7BFd5q+p/vMF9FS36V8fRXSZFqR0tNnhsUUeArg0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=quDqI5B7; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=NJEpKqq0; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="quDqI5B7";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="NJEpKqq0"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O5t6Je010334;
	Tue, 24 Jun 2025 07:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=8EnVoww3/D5RN2IonjYnTif3VdCr193nRXB8GC+vA5A=; b=
	quDqI5B7TAQK7EQFCB+sIPKwJ/Yny5iyhNvFqui8k9+4vnrH+q8Vk80IzVvNGNeu
	TPY/e1OLga32/yzn6+rIltfuS/V+BZYbYKp5HOdom9Of43MZ8Zs322naraH+yUkN
	EG2W8y9fs1/h7ItOvjSUMyU8RmuJQ/Bxs/pZ5f79dqoefJTY7IaAFB0JRl4qD0nP
	I54OVEP3P+5b+y9EHL+PP9lL4iZkrkTnU1yQkvPaZZMLSIxu9BlPiRy7E6KQnDbq
	AjqlNWsIruQaPqg/GdOpNFKLcM5sS3UHs7q6zKElhhWNr9jKBoygzIcDAe4uqJTg
	Pv3Izz3M7bEIPLQLoK90Ww==
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2122.outbound.protection.outlook.com [40.107.243.122])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 47e5tyu4k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Jun 2025 07:28:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GgpgPOR5XwxPuUY6+UPX8seAFSLNMAHUMsTEJpBea27d6VLmm0PTZXMqCEK89BPneLWkZ29fy6/xv7okfxa4K9KUNHKwD9PZIkOcHheJ+nMFdM+hukRNnZ/1xpvPnZEQmcDchFAL62SXnfFnWkUM1zPTIXKE2+UlHmzrB6JtzxvkE9MG8VgeJvHaKpNcl/NawZCSKs8P0uFJ+KPeNRh9bnWaoEjvnJpctelGeTfn+aTGA0yOw/r/NOzGtwcXOpnHUkrIyI05pY4ugcNxBCCR1pUApokQZ8ptVzpbqTkncxXuG+/vY9b+R0sc03U/V431DyvhYeFvBnd+FviC2EJ3PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8EnVoww3/D5RN2IonjYnTif3VdCr193nRXB8GC+vA5A=;
 b=E3YzV17aE8+iTDuB9N7ay+eXofzgPj4HJC9nv1kXGZ07vEHbfH45JBS+pnOxqN2D2MZmYOWYG40VvdPrWeiTyyvuNucTcq7HhIUaGP3JSaBCyaN0QyPDdcLtCXA43v0mZcmDQEch2vEGvfvjbwN+V+DyYczooq1rA+WVoM3pry8Z2DTvvPH+flEWSwXq+kfplsXupvA/bSLCtt8kWpqf8+HziymRzWLULX1UVwsFHV9BXSSs3YmBNoHKXhLWx2Fn7ea8wbKOL9pNjvDGznJDxllGLWzLdHQWYu2dmhmG0SnnRoNosEFpYGpaxFbpNh6w991pq8UpjzaYUvhcrTVg1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8EnVoww3/D5RN2IonjYnTif3VdCr193nRXB8GC+vA5A=;
 b=NJEpKqq0yZBCZeNoRwsjG6GxVYXj9xNNcNvB7qCUJWn8izN6gwwbvTLNn1I4vbz0CXUkIr7EGBWOHDxC7141ShOgHMwGNNcfq5HQO6I01GPmwmkVfyl3olAVl5LoO8FVFq5UC0miqy8GNkUlS2OfRqsIyq6PQsE+mMxo15Ucv1I=
Received: from BN9PR03CA0331.namprd03.prod.outlook.com (2603:10b6:408:f6::6)
 by PH0PR19MB5194.namprd19.prod.outlook.com (2603:10b6:510:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Tue, 24 Jun
 2025 12:28:54 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:408:f6:cafe::60) by BN9PR03CA0331.outlook.office365.com
 (2603:10b6:408:f6::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.26 via Frontend Transport; Tue,
 24 Jun 2025 12:28:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.14
 via Frontend Transport; Tue, 24 Jun 2025 12:28:52 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id A39B0406556;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 8FAC082024A;
	Tue, 24 Jun 2025 12:28:48 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, peter.ujfalusi@linux.intel.com,
        patches@opensource.cirrus.com, linux-sound@vger.kernel.org
Subject: [PATCH v3 5/7] ASoC: SDCA: Add flag for unused IRQs
Date: Tue, 24 Jun 2025 13:28:42 +0100
Message-Id: <20250624122844.2761627-6-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
References: <20250624122844.2761627-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|PH0PR19MB5194:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ea126693-78dd-497c-0e08-08ddb31aae16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2gQg1rJ/uVyjsEghoJ6RaaAqudF3y/NpGr6Rin2N8NNnXGbBkrafgzn3Bntn?=
 =?us-ascii?Q?r1lU7qeLuCPLJ5opscJTQlnhyMiJktrncJHPllPu16Kp1lUabZGZmvLtpaWS?=
 =?us-ascii?Q?7sNCZa7ZjMUNVqiotBJfwECyy+9uZrZDKd2Hdi5GgC6EzPwwd8nggkiDzePw?=
 =?us-ascii?Q?gdVhC8Rn4kPCXZ2UEtcRakFvoh69ov6MYc57YuCZBNJsP2dynUrTLdRV9dgz?=
 =?us-ascii?Q?bouFUV+YNX62ync8vBP9A9MLGIVpmaNzCQAtWhKb77TM//ZyeiJ6e6X/MlRl?=
 =?us-ascii?Q?sx+Bn+Ty6Fl+zwiJOW6sgz3senM+fLcP1QeUCF7UKxjoSTsaBtCGviGRtKUJ?=
 =?us-ascii?Q?uzIcX7i6P+uFHcz0T9uWhjykH7U8mlYXBtgLxxa01ClKi5NikvQGp6OzSOGL?=
 =?us-ascii?Q?mKfmuXhywaIQ3NX41xhIr+N0Qtst6/xBgf8Wp63Rb4z3Pl3LmoRCI1ViNKyw?=
 =?us-ascii?Q?9/u1NztKtKez/okDvgwOOfBdpkmTBGRiP6cE+GvEtqBmZIPUueDceytUN6B3?=
 =?us-ascii?Q?X8A34JqWLhzv1AUpj9is6B+Gi5vgxebsh2qiTJ+qxbqPa4hHrW3KCp2yaWPp?=
 =?us-ascii?Q?gmOQSnBHX1wGSCUwy0PMoLolPy3YtO2Q3eM819N6Kn1xlzPOzILOHz7lVOYo?=
 =?us-ascii?Q?WaI5/kWde8Q29KvAKvPZQwcFqGj06Fqml1xS4Bbx8q5SyXQ7H2zDcYXV9pNP?=
 =?us-ascii?Q?ORS608dluVbaH3Xm9+o0yq0gVF0UkvxbHT3cL+fcCAjMQsZ/sLv6G1+flf4X?=
 =?us-ascii?Q?zsb3b82BD+QCUE9muGYQZgrhKzLOZRWkT53jEExRrNg3pVgqdkJNCxUl0HzH?=
 =?us-ascii?Q?cdYvCD95OdlM5zDoV1qYRZDeTkHjRdjdMbWhz2QmBfdWuTlKrpYHZsHU+wGx?=
 =?us-ascii?Q?PU5tRW5/iE7XW1VuAbrH4ynY+2nEOuVadox0RXNZIbv/JyllSW9hm1a8V66B?=
 =?us-ascii?Q?6HJuNyk1etuq2iFsRzrajqMx0fmZfQseHhXj/DKGWT80dgFgjPvjiSBTGkZP?=
 =?us-ascii?Q?ncSu0rrZQmyya9ufLXF2QQwSeh1nzYulsZY51ZnfJFraoPm2Jh4aQTSWYUqL?=
 =?us-ascii?Q?pRBQQy1O6wF88yxHzpkaDKMgQLhUJSnboJShzRDd64spHSNdYpFoosXyMKAK?=
 =?us-ascii?Q?EKjCtKGThyLv4vzrZCAmRPd7LN2WxarbM96m29QqBRxuTCv86desed3KoEHd?=
 =?us-ascii?Q?4M0Afw+DiEKbs8CEAlDZdzwbr2l2Np4i9S6PSJx0gRzTBO/5B/wCkv8UpQe7?=
 =?us-ascii?Q?XqMMJFyvGNXDHYynq1fcVnwJadNyDfk2S0DqhCC5Z3Fkf8hRBKtfFN45DC4U?=
 =?us-ascii?Q?y0wlhh5F+f5La8rPhHgpD/16gx5+PTAT/v158ncQS6m6/X7pRm4dY7Tb8TO3?=
 =?us-ascii?Q?v6MrkWaqBDXnOmxRbuklohvxsWyBMJ6+tMZO1XuB+8vcduc2YJp6leH1cIN1?=
 =?us-ascii?Q?ZfSiYCn0OCPX7V/0Tjzg0kG2+Ngqi0BgwEb+3WQxma5/SngpmzS6LV5vk1e9?=
 =?us-ascii?Q?nXIW4olj+IhZ6itpzNPo8yhuzYtLekjlmwGO?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2025 12:28:52.5604
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea126693-78dd-497c-0e08-08ddb31aae16
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR19MB5194
X-Proofpoint-GUID: EArbvllI8y3q4OOVB97GnyOt0HTw-yGi
X-Proofpoint-ORIG-GUID: EArbvllI8y3q4OOVB97GnyOt0HTw-yGi
X-Authority-Analysis: v=2.4 cv=P9E6hjAu c=1 sm=1 tr=0 ts=685a9a0b cx=c_pps a=skVBa3wrE/bKtdGVm523gw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=6IFa9wvqVegA:10
 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10 a=QyXUC8HyAAAA:8 a=w1d2syhTAAAA:8 a=AM9GnGaWrZfCuFnm-nwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDEwNSBTYWx0ZWRfXznq+5WaplibQ vqDZ3ThTb1Nfw98uDS9muvQXcaCjvb0s0B/PIPllySKUNduQlmSdpiskDgCLCntwGz+6tIheXk/ StY/ujUUnGoZV96t56xEMfshH6FVU0i+yOSCfPXWTkQ1O1NmYPLnsmvvE83k91MTENj2Xvzxi7g
 39fJ1Tjlz7azdK5F2jpHLqMDzf5qX4wyQzXjjkOGnp3C0R7voh/71KhDTb6uD3w2THOzoXyZiSn vOvqEVdj4TI3knNYr46DFVF1wNZw5jYuBp3YXjMV1nAdNvEj8tn2Y7LcVoNDe5Tow53icb4L84b ZQpl/P5vHsPlNJ41tBOzzk+6gJyKuaLJPjXBu6wEQjhjJZOiqsvXA24YET2L+YdpRtuVosAM9vh
 KmCoKlxGCPerGHwC5CpXP64NEIsbl23gbW5+MueGVDzeAYCrnmEeWFcnzXiViBm16zj92p7e
X-Proofpoint-Spam-Reason: safe

Zero is a valid SDCA IRQ interrupt position so add a special value to
indicate that the IRQ is not used.

Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No change since v2.

 include/sound/sdca_function.h   | 2 ++
 sound/soc/sdca/sdca_functions.c | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/sound/sdca_function.h b/include/sound/sdca_function.h
index 4b278513597e5..b4a97ff087294 100644
--- a/include/sound/sdca_function.h
+++ b/include/sound/sdca_function.h
@@ -17,6 +17,8 @@ struct device;
 struct sdca_entity;
 struct sdca_function_desc;
 
+#define SDCA_NO_INTERRUPT -1
+
 /*
  * The addressing space for SDCA relies on 7 bits for Entities, so a
  * maximum of 128 Entities per function can be represented.
diff --git a/sound/soc/sdca/sdca_functions.c b/sound/soc/sdca/sdca_functions.c
index 093c681e93879..c34f3bf629833 100644
--- a/sound/soc/sdca/sdca_functions.c
+++ b/sound/soc/sdca/sdca_functions.c
@@ -912,6 +912,8 @@ static int find_sdca_entity_control(struct device *dev, struct sdca_entity *enti
 				       &tmp);
 	if (!ret)
 		control->interrupt_position = tmp;
+	else
+		control->interrupt_position = SDCA_NO_INTERRUPT;
 
 	control->label = find_sdca_control_label(dev, entity, control);
 	if (!control->label)
-- 
2.39.5

