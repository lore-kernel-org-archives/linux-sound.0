Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 903B52641C6
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955315; cv=fail; b=ZLVi6CXem223E9UoF8pSXVC1R+YxsMcIZWjJfx49XPbR4xlA/YvsHw/j3Z+hCK/jczRMbXI70vnUo9GGSQHphMEn7jQ7CSBWyspThFd0xEPIQOojpgIxuAzgCMkKTgD4rDatHouh7QnkU1II1HS9wPNatWNeoSv5bl7UGOz841g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955315; c=relaxed/simple;
	bh=FvAOmjmlPu8clr+/v04o0e+MRWzMYtbF3cfgqN2XPGI=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ki4MvVDwyZ/nUV3j/Xiacs2exNOFgMa1lGdr1O3YA0/ae974g+pG/MgRKpS5X3A5TXMJjnUL4kiGIDwqEbvdkpNHhfdxkM3VeZ9ZBBIdw2QkFmRVrzX4hbnd0XHIgjFOnWLzZ4A68sHvqPNMXep3N3cgGlOSwJig1XoNQJ2J2mQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ijg68oB8; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ijg68oB8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PCMxAIlCaifruXP8YHQUOulhcrkwJOW7WQaAbuC7fW0mmUTUhZbS3xNVM6z5542Nn61VVBLoZ5+cwfs32hu+mJ04UYsaQhswz5OxP2Rqz5rj8YVDKTrJTtCy0TKt+KfsSi8jWf2Gj2ugz8IWx5Ms9nscN9i1VfuBH+TAqV+XqJ6rSY2lC2W5rXUBwE/OhPP6lgWztFCLN5vRaMUQkTM5G8E97KYSv38nefYvL5D1HdhrbjH9OEzl0Dyd6zDjJmTJgbQVcXag+TlMXcwgjR/pHQ1an0QLinmosrwEBYEPkZclfqZSaxQdHHMlvANbes5u+89PE9MIWwtekk988GTOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3sbT36D4n4U69oQJ6vrHe8eKE/LN9DbN0dYUP/honWo=;
 b=xplezMRmvKj0sk871GPjWxF4u8nxc7eEaRsK7fWfeAZHm6gIpAarBw1maKnT6tNBgQ8Xum51vm5py8Dd0BWw0ZerYreVwk5+vHHO0mjrTkNnx8542WGvIy74bimie6cX8tPgiqz/HGPptcVnStuFPuJa1Glnbbi/5jeYyo9jskdOBNI0WnlwgA9VBpW4YX/dLKUeU04ayJWIvzg/fjkulDbJ75TK2t2u/0VRNa48pdTcwqFPGZAuWAH2k6xxygj1ZjhypI54x72MvgYR0esCVTHsj2ymzegPdQ3BNndGCgz+MqLrS8lBZ8VT8mI1UVJzFbZrhCjozcVRjlapfKwydA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3sbT36D4n4U69oQJ6vrHe8eKE/LN9DbN0dYUP/honWo=;
 b=ijg68oB8R0SDQVNTRf8S9YwwRM9pMQXqeLWCHUzG93z+TlSE6CZU+/nxAgFJNVOyNzm9+1by3U1RmEETI8Lgr/YFk2VHk3LiZVd7chddEIUBM3MmxxlT9dtEi8svI4db+tpPV7lTEbPGJWqEeZOXya21ggSfc69/7lSiW+3X/EY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OSCPR01MB16080.jpnprd01.prod.outlook.com (2603:1096:604:3e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 01:21:49 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:21:49 +0000
Message-ID: <87ldbuxk2b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 7/8] ASoC: soc-topology-test: use snd_soc_component_register()
To: =?ISO-8859-2?Q?=22Amadeusz_S=B3awi=F1ski=22?=
 <amadeuszx.slawinski@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	bui duc phuc <phucduc.bui@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,	Fabio Estevam
 <festevam@gmail.com>,	Jaroslav Kysela <perex@perex.cz>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Lars-Peter Clausen <lars@metafoo.de>,	Liam
 Girdwood <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Nicolin Chen <nicoleotsuka@gmail.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Takashi Iwai <tiwai@suse.com>,	Xiubo Li <Xiubo.Lee@gmail.com>
In-Reply-To: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7ayxk3s.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 2 Jul 2026 01:21:48 +0000
X-ClientProxiedBy: TYCP286CA0176.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::8) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OSCPR01MB16080:EE_
X-MS-Office365-Filtering-Correlation-Id: 605bdca4-e5b3-4eca-87aa-08ded7d84a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|52116014|56012099006|11063799006|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	qnO09wBdLMPNikHLN2lTstLQYAp4VbEPJIuILK3UCLTaUHPBh4TuVKSp67sgFRUtLUlmCQFw0lErhMB8WxBdkoi8dtkjhq4e/SXErAa7ktDvT23HXdpmGPbp9eNJiZkTqfrKR98OyE3Cro/Xpb2y7hlCDJ+irn7/KsiO9lgbbDhIxx/FNiRDFTqVI8gr+8DEpL0rxwhUvt03B3DL3964ObUeGOt4I360QwdPxDxb0cRBBy8ner+g0ByyFSfXcndYXUg3GOMrpBO1ccbPtpdUunQC6cG/OChpdXvoKyKUhd9T6Ap/41tZZDhbFbMOgxg0k72Qbtw1drtX2GKaxzLVLy4aLVlp8O63X6NY7TUdcSPMC1IG62PXWEIxNLuZdOBLAQL/eTsmanqr1Ken2la1WHvrM2VLB2g7hsNozyBHMlFUr7Pbw0xphuXCNhEVf5ufZT0v5IX5gfBAWw8t6yazve/aDJ2wBqNPKoeDWqGj7ktmEL8J0rea8TqrdkZNZmvg6QrbuprrDKhmatZ5CjjsuPcDOwQ+EVUGiQAl/1wTZUlo/Uw+gVzsuH1gBfB2fpiO6k5/LrrMA5hXikj3eqmh6cY8wiSMP+97t0LlyaWF3ba+taab9NGi43xYb0el2Qe6TxtsEZv0/N5zyYR9OXLnz/gw9qugcw0nLviqzQs7sP/AmrCMmRd11s+miFpvT0kOYl5FtFmmmzIKmsciQD2Yf7SV+XchRm1r0Oo7psNt7kc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(52116014)(56012099006)(11063799006)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bJGLIaclNRuPdcrG2uc1p8Ik5Nehc9bMz3NMkjSpm8PRiv/NZiMhawVrO/3F?=
 =?us-ascii?Q?DZDS2U1kb7ExYu4LhYEFDOFsqMb6ZLmhZ1Qv7kFRKaLtxV8pa9sGLMeYv4Dn?=
 =?us-ascii?Q?11JCG11VLP8vxMnLolXs8JWAYFaC8/KkkVq7G0Vswhheb5ls7tVBKqMze8d1?=
 =?us-ascii?Q?iqSYYN7dz2GvlTMPj2RLKyCNsultQsQ36lBR/laf59TsZx4g9kyqCdnKbzIg?=
 =?us-ascii?Q?0EW0QxBsVF/61r0V/XO95K61uz9imeAhu1s9jXBDLCw+OdUH1M/RzD/rPRRs?=
 =?us-ascii?Q?/tG9xIysuT6tYthKLyTvOp/qMjCsBVUDUSkZimgOqc2pHgcs8xTe67NqOxLR?=
 =?us-ascii?Q?QmdE1fJMMs6rIxjR2uGUpW7gLBo/Krhz7J9OawkWz1LY3Pd2nvaGgYomfz00?=
 =?us-ascii?Q?Rt8LAa+VR52BW4rk20F8SFek43ha806kFou9MyE5DPY2iklejXtdsSN1w2QM?=
 =?us-ascii?Q?eT46nX0SN5y9gM+37gz55QJ+MmxoawFFvF94feKZLHN72jm6i4UAE3eN9y9s?=
 =?us-ascii?Q?Eiej1HuDb0TW6n8QcadOM1yAEKkWIy+KIlU63S8c0flPfAqgmoY26pPOOdKO?=
 =?us-ascii?Q?1zriMRtFOPCBQvb7cgUtxWkZrI1tiAJ600CTP/NDP/3Tym7X23Ck71CbqtnQ?=
 =?us-ascii?Q?mIO6uYFk1BewWQjMAHxlNL3oNcblGUYkUj9RBoWQUYq2blTczRw5x1BgJGsS?=
 =?us-ascii?Q?OgCMe9ehy/1RxZZdzFQXN3cUQQm9G5/iqWwsQiTHn6QZMZdmx8LRfynaoo65?=
 =?us-ascii?Q?6JadPSISae25sv55pWvXicZRIV+IORYBC6LfUrNIpnB7cqLQ9FG0jYga5YQh?=
 =?us-ascii?Q?L7NwyXaLvdbjs2xOYzhbxvdu4Xz7px4xJE470r6eJ79tK2TU+2907xepql1/?=
 =?us-ascii?Q?mC+5KBk5pwwMzSyoHRFGedGIxwOUgLFkUWtx7GiuVN+7yNb2TCJVahgnVoAO?=
 =?us-ascii?Q?uGpxEq7Gtxhpj2dsPVqcBI7tqjtrsRNZC+WP/WXkOONV9lJVa7x6pFzplMEu?=
 =?us-ascii?Q?lQ7XBV9wcrWp3pWRhG8UpiG5XORPqPI1gT0WhnzR02h4BaYlaMrih5Hekj9h?=
 =?us-ascii?Q?Ng3rkd2VoksmYkCVSw7PE1AepS4hB4piRuI/LceqabwRt1FDkUJt9PZaAMQO?=
 =?us-ascii?Q?XcfmDyQErwscGs71VSj+5pnHwiStqVtbYdlYrzZOPd7eAyv1xtEQ1G+IqB63?=
 =?us-ascii?Q?SdrIWlhbhl1ib4TER7vgxjkBAj3t2vyJUROVE7o1FiAb97Yj1Z99F8qATHme?=
 =?us-ascii?Q?zMqBV8PiCa9W5tBZF10asVUqJrhU15/mAW1n2LPYImUmqChBQmzIO4JvV1MC?=
 =?us-ascii?Q?lEPHrPTR2FSJLsxNq2jiAFdHWE87V0bG3+UANAlSTgNP317+tzp9to9DbGNi?=
 =?us-ascii?Q?S7vAU3OP88RPIH7Y1KdNy3udbxDlcIkWQYxe3cMMbvSSanS08Lw+SaRWeLyr?=
 =?us-ascii?Q?EMUsSBg18R8l2UuK1JXizt4dwOI8yDTzZYbZzPKg0qrBJR+0RZdm5/DlLxXY?=
 =?us-ascii?Q?8dZ6m9p2h7ren12S242qzJ04MF2kiC+QUmk6N/uE05bR0AEDMFZ8ReT3hA2B?=
 =?us-ascii?Q?s9gPvQ/W3Ddud3prEQ8b9ptrAOdCsZ31sANROtG9iWGRKW26djRzFzfn9KbG?=
 =?us-ascii?Q?Th4egI+VjLqIuJx/BNvD3oHUTkKkd7K5mFL9UkAarS6EzAaqjYoEpSmPsi7O?=
 =?us-ascii?Q?wR0ExLDR3JJNz/WxMPNKmtRycBTdOJlOHjXA+2hBZoLGU1kpoVxYLYEiqVzP?=
 =?us-ascii?Q?JLorQBMYisQIAu2ToQ8ziwjdNisvSuzd+3nCbDub5xgwOOzzFCBK?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 605bdca4-e5b3-4eca-87aa-08ded7d84a47
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:21:49.3670
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6p41QKz3LJmrcq/QydCEqJt0dKML7T0INKUcbZY1n3ArqRe7OK8LrwcJMtjRxlz5GpusjZSbpNSxKhkxtih6u3ZQkKSTpA27QZl2EuIELq7lypUurvZ5ZSJXfRP4yj8K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16080

Current soc-topology-test is calling snd_soc_component_initialize() /
snd_soc_component_add(). Use snd_soc_component_register() instead.

It is using container_of() to get kunit_soc_component from component,
but we can use snd_soc_component_to_priv() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-topology-test.c | 67 ++++++++---------------------------
 1 file changed, 15 insertions(+), 52 deletions(-)

diff --git a/sound/soc/soc-topology-test.c b/sound/soc/soc-topology-test.c
index c8f2ec29e9703..9dcde35dc2e21 100644
--- a/sound/soc/soc-topology-test.c
+++ b/sound/soc/soc-topology-test.c
@@ -45,15 +45,13 @@ static void snd_soc_tplg_test_exit(struct kunit *test)
 struct kunit_soc_component {
 	struct kunit *kunit;
 	int expect; /* what result we expect when loading topology */
-	struct snd_soc_component comp;
 	struct snd_soc_card card;
 	struct firmware fw;
 };
 
 static int d_probe(struct snd_soc_component *component)
 {
-	struct kunit_soc_component *kunit_comp =
-			container_of(component, struct kunit_soc_component, comp);
+	struct kunit_soc_component *kunit_comp = snd_soc_component_to_priv(component);
 	int ret;
 
 	ret = snd_soc_tplg_component_load(component, NULL, &kunit_comp->fw);
@@ -65,8 +63,7 @@ static int d_probe(struct snd_soc_component *component)
 
 static void d_remove(struct snd_soc_component *component)
 {
-	struct kunit_soc_component *kunit_comp =
-			container_of(component, struct kunit_soc_component, comp);
+	struct kunit_soc_component *kunit_comp = snd_soc_component_to_priv(component);
 	int ret;
 
 	ret = snd_soc_tplg_component_remove(component);
@@ -214,8 +211,7 @@ static struct tplg_tmpl_002 tplg_tmpl_with_pcm = {
  */
 static int d_probe_null_comp(struct snd_soc_component *component)
 {
-	struct kunit_soc_component *kunit_comp =
-			container_of(component, struct kunit_soc_component, comp);
+	struct kunit_soc_component *kunit_comp = snd_soc_component_to_priv(component);
 	int ret;
 
 	/* instead of passing component pointer as first argument, pass NULL here */
@@ -254,10 +250,7 @@ static void snd_soc_tplg_test_load_with_null_comp(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component_null_comp, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(test_dev, &test_component_null_comp, NULL, 0, kunit_comp);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -296,10 +289,7 @@ static void snd_soc_tplg_test_load_with_null_ops(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(test_dev, &test_component, NULL, 0);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -318,8 +308,7 @@ static void snd_soc_tplg_test_load_with_null_ops(struct kunit *test)
  */
 static int d_probe_null_fw(struct snd_soc_component *component)
 {
-	struct kunit_soc_component *kunit_comp =
-			container_of(component, struct kunit_soc_component, comp);
+	struct kunit_soc_component *kunit_comp = snd_soc_component_to_priv(component);
 	int ret;
 
 	/* instead of passing fw pointer as third argument, pass NULL here */
@@ -358,10 +347,7 @@ static void snd_soc_tplg_test_load_with_null_fw(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component_null_fw, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(test_dev, &test_component_null_fw, NULL, 0, kunit_comp);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -406,10 +392,7 @@ static void snd_soc_tplg_test_load_empty_tplg(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(test_dev, &test_component, NULL, 0, kunit_comp);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -461,10 +444,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_magic(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(test_dev, &test_component, NULL, 0, kunit_comp);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -516,10 +496,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_abi(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(test_dev, &test_component, NULL, 0, kunit_comp);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -571,10 +548,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_size(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(test_dev, &test_component, NULL, 0, kunit_comp);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -627,10 +601,7 @@ static void snd_soc_tplg_test_load_empty_tplg_bad_payload_size(struct kunit *tes
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(test_dev, &test_component, NULL, 0, kunit_comp);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	/* cleanup */
@@ -675,10 +646,7 @@ static void snd_soc_tplg_test_load_pcm_tplg(struct kunit *test)
 	if (ret != 0 && ret != -EPROBE_DEFER)
 		KUNIT_FAIL(test, "Failed to register card");
 
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(test_dev, &test_component, NULL, 0, kunit_comp);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	snd_soc_unregister_component(test_dev);
@@ -726,10 +694,8 @@ static void snd_soc_tplg_test_load_pcm_tplg_reload_comp(struct kunit *test)
 		KUNIT_FAIL(test, "Failed to register card");
 
 	for (i = 0; i < 100; i++) {
-		ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-		KUNIT_EXPECT_EQ(test, 0, ret);
 
-		ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+		ret = snd_soc_register_component(test_dev, &test_component, NULL, 0, kunit_comp);
 		KUNIT_EXPECT_EQ(test, 0, ret);
 
 		snd_soc_unregister_component(test_dev);
@@ -773,10 +739,7 @@ static void snd_soc_tplg_test_load_pcm_tplg_reload_card(struct kunit *test)
 	kunit_comp->card.fully_routed = true;
 
 	/* run test */
-	ret = snd_soc_component_initialize(&kunit_comp->comp, &test_component, test_dev);
-	KUNIT_EXPECT_EQ(test, 0, ret);
-
-	ret = snd_soc_add_component(&kunit_comp->comp, NULL, 0);
+	ret = snd_soc_register_component(test_dev, &test_component, NULL, 0, kunit_comp);
 	KUNIT_EXPECT_EQ(test, 0, ret);
 
 	for (i = 0; i < 100; i++) {
-- 
2.53.0

