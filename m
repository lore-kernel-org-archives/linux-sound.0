Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010025.outbound.protection.outlook.com [52.101.228.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E573121FF28
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821194; cv=fail; b=nibyQbac9vx0E3xzeRmjR9kpACkeZpImNGzOVgKWQkWOV7znw2t5QNfDfy6Mfizt09RiS5JyURziKI6JUVUbVJy7KR02ZMSthfMkbQla/SstLHE4vNi0hcuUSN3NF3qKniCqMbLmu1MXw+rx4J5WfrSNSTwa7D3kNmjORfZCmUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821194; c=relaxed/simple;
	bh=yzPs18t4V4TZ8s6aJrrmXjA1Ei86kvZY+ebSiyL1Jro=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=amc8ckti9gyUr2adiSl+Gp28T7wjrjcUl2iP9qZ9DRrC2TA0MQzzQ1MgX0MJlKUpclSfTTOZg16qkzyj3EBgBH5oqHxRq8h5Vuki6RZbtsQOSpZvp/PVBLZTj4sSrsCl66TtG5GMhWtyHckXDqW0cep26bioSkC+O7bJYmluVxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=b780TeA7; arc=fail smtp.client-ip=52.101.228.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="b780TeA7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGqQUkrekKJGHveti56VkOfaK8wdwW0jUa7iS19rKfHxPGZh9e8N8gPtzpZnk+5Y2RqzrC43ZZUmOV+jBUL7nQwcpCNSQqTGrh6je0yVkwW8hiZzA2Xv4MBrdHuB3xGCAuK2t9OT0vDrVy5ny/l6Lb3kYe3KPlCJd2ShWgiPx0DuPi/mtFOEABVFM0OCLsBob8SoP9QoByn7C42r+Ifs+LE1itY3NbwqNY/IuCpsMfOfDUXsv6pmLq59MDQL79WXnHsoXW8dKNPJrVSOnhbGGCYZAnIjupeyzcAurhiiO1yvtLph5z4TWmhGYNl6s0vecDAhTiFyQOkONqcyRzwi/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nl8Pgg7T2HZ83oyeb6b3zQ81WmOfpZZQ4BjnepP1Mro=;
 b=Ir0s0O14EMTjniPJg08iYmETa56K3LvDpwOxbEu981Kur3+IR4H7GSKX/EpFQGYIX9jqt/M0PjJ6nUHlQmX0ATf3u4/qtBFHSGkbu6Sy3F76w4chPpZSiPMRu943i1jJV98ybtcOcF4G+Slv2v2DkEBZ6j7DzV0zgufXAwaVc81vtOyhfX13lSZWJC5oe04OY2f4C4JZFSByRxGS0M7TO9Nkk44W70W+UvXCHwxNwXV/E5okoWr/aSgXaqcCaKPtaW5fGnjZ5xFzxqEx/U6qwdja3LuabUX6rrMGGkJBbk3sOyDGh8CU2FZaYPHDaChU+bE+10rPhwVPKWuZs4INDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nl8Pgg7T2HZ83oyeb6b3zQ81WmOfpZZQ4BjnepP1Mro=;
 b=b780TeA7Ib0XtFL5pIyWehTILfRZydEvYNWV4ObOzBqpFSDZ/0RCfDa3sZr4NLEvcGilQWUqz+/qHSwIPk0bMIh55XNmK9iAVOHIG7jzf8/1hLmE/mqL54GRTivZcfUKGEzyfDGbQHQW0O3n6UTQo8vsYVUOtMxMZf300SNyJ7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12531.jpnprd01.prod.outlook.com
 (2603:1096:405:19c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Tue, 11 Nov
 2025 00:33:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:33:10 +0000
Message-ID: <87fralwgqi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 222/292] ASoC: intel: boards: sof_nuvoton_common: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:33:09 +0000
X-ClientProxiedBy: TYWPR01CA0008.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12531:EE_
X-MS-Office365-Filtering-Correlation-Id: a70666c9-74f2-4710-fea7-08de20b9e408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZeOSHj3UBVAfp66AlWymBii0H0nMRHAEx279O9YmV7jGRQxF4skBsSWopoO+?=
 =?us-ascii?Q?Z8fG2ZlAP1dr2IuvQAAIcQP/4lpvHgQOAZOupmMeXUEq4Zp2Z0Mgll63bOYz?=
 =?us-ascii?Q?v56dOw0DQBZWh63KNIv4c56hu2e6YDtWdG8dnnqBZmJei4F9p+WCUs9a2LPe?=
 =?us-ascii?Q?HlsPRgfagplEmWkURz1RyGANtbtSeXYaWDnHWXZQS6nNGU6TDsnT7T2IXB6x?=
 =?us-ascii?Q?d+fZyIqG/UwLNaISaxODTXnvuU3UBXwPa0HRzmVFH8Yc2yOpRyjoEb3CEbXb?=
 =?us-ascii?Q?ML/HEaT+B8nZqzbr8JXsPl6inTynkwcLQKfciB97MPUjdZeEDQYy/rYH+uuN?=
 =?us-ascii?Q?Ffu0cMafoKk2v1pnhUB8HqyD1SR07WU0PIWTVCsm/02dBl7x1qt/tUXUrzhP?=
 =?us-ascii?Q?fVbW3swK7axnG2OLI2seSrrl4JMwtKV+OKqGNGjoGef2na0Y24Eaz9BoUlwB?=
 =?us-ascii?Q?tUSgxlG8KnGjm8N+d6qelGZS3v8fy2JkUd3rCX819ouGDuZRQjN/KJgrXvV5?=
 =?us-ascii?Q?ia2vPqimFNWiv/6Px69bLOO9GCXZfpWIwvRqOpMJHf4FdQvjg8f1FxjU+Dyo?=
 =?us-ascii?Q?90f86F8IKTrteLpMBOG3HLLZxQJEY2BA9uxSBQPZvAg77rznA8IojVUysvue?=
 =?us-ascii?Q?IkEbMdo7kJRgpmk7qOtLdsBolEVkx28lOlR14pAb3y+FbUhdliecHPcPP9yq?=
 =?us-ascii?Q?ZC0TuTRUjjUFm7KD9buhlSzqyKxxlxbB6+4a9wPP88tydDNzatc9HJ7zIMmX?=
 =?us-ascii?Q?fMfKGYTDp8HVVxVLfvwUnV9k2VgETO+x/DvRQvPQYGjqLkK8SiokpSrYIgbc?=
 =?us-ascii?Q?yaQUNkaHi3LX15fDyG/HPoxcywB5GANTDeJ9hvOAMnxYb1LbLGsznQT9m8aU?=
 =?us-ascii?Q?nwegW1fpFE7rwpkV6ZVU0OhrCNwSPf1DGEbtR/3YBE+NWFrC1/dgMa85D1Vx?=
 =?us-ascii?Q?Tfkzcidh630XlUaYDtY/7wTKMQ80IfFQKhPjCQ6bJQ7dMkdtCo0Tu0SJZH6Y?=
 =?us-ascii?Q?BFxKwGT5EsGZIMKAkqI/Pr723DttONekq3jnDS0dMmcWaNC5cGPNYn67T59J?=
 =?us-ascii?Q?PjglJ7q76xKIYmK1nvIxCLsmCoJFUkPBY3GDeXKGlOliC1UXsEjuvTkF0pMN?=
 =?us-ascii?Q?0jb3MoPYbsmHnlj9KAwP0T8qIjKSedS0HNBVFqCLBmYz0QZa0G9GRDLuAKpT?=
 =?us-ascii?Q?za5TT1G1L9nHeunp8D+lOCNe4nipn8oS9icHN4nMM3k8x95d7tDvrOj3eMVO?=
 =?us-ascii?Q?edr/nF9u1hKPIHMPH01KdoyK3Ezvxm04DRhJvWCTDrCWYxqLZtOo2bgzRw8V?=
 =?us-ascii?Q?+e4O56tFcfmlbLtOZfWlu6ArsUONl4vzuHaZmK6+fKxysArA26bSkxblj6yY?=
 =?us-ascii?Q?cV2BdslQjBQV8XmBT+q2EJ4PjytQlF0e0jc2MU53LFLl2PLuSuLmMKUyQ6ix?=
 =?us-ascii?Q?4HOLr92cZZN6Wxk+/IFBs6zHLmmEit/5aGNWiYIagbCmLxGEVBFM1NypMoDZ?=
 =?us-ascii?Q?ZOLJ8rvXey1AxCR8q1Bvs1kOXAJaJUKgfdGG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h3570QD34ufHlM9Hj89/vsZ1BMVeW4iFVErDr6w142epS0lAYcReQ0Rg+nYn?=
 =?us-ascii?Q?jqyDElat2B/sQg15ZSh8h+JF4/7pKb03GHmP3sYSchS0B0QOODvwKIMn0H66?=
 =?us-ascii?Q?P7GvXkCL2lGVTbpu+2fgOJDhPxem5hMC2kcv5mlosiGkqEGAXSGsfDdRR0ZF?=
 =?us-ascii?Q?XdPXoZ7yV4HU4cWKcs5dCPHiRTzq/Kc3LhrGEoxwzogKePnblSrrhrPzvoGV?=
 =?us-ascii?Q?2xvMeQ236+S6zAUcGoyDvGiG10Ao5nIyGj7nU65TesmdOPp5tsP7HpVEwobP?=
 =?us-ascii?Q?2J4zNVM5PG4tnPHvKPh1WS6CFu9g/O4VgWr8wGnmy4Ch/fvu2czbNYyaX7Cz?=
 =?us-ascii?Q?uKlj4tLJpe+DYwkZ9UDM2Irr+C9fMn56LJmDnjV2q0OiJ6TJJM6WnQNIUH+e?=
 =?us-ascii?Q?UxXjlYuQb6xrNQMdKpJREnzEUJfTo/rTrumDBvqB2reWPpyXU+UQiFuhO00Z?=
 =?us-ascii?Q?ErysAa/Bass+RX7c5kWAyVZmb/MH+G60XILkHA9XREceMgEZFvT1YA0hAWyx?=
 =?us-ascii?Q?AxRP7P8xAYLH76FBgv0jhsSdhAxmEHgm79HwwuLAcPRGRIxUxM4/3/QrD638?=
 =?us-ascii?Q?ARKbJdJx6TANZLnW80L2y0GTDSM9bu6VN/Xg3ObhU1ptFnHXbNJXW5kyE1MI?=
 =?us-ascii?Q?fNYZP0MdeBQ+1ok05jBfkidrJoPVFGO0s21Q1WZre3PsfRzaDJpSYOLPp/rj?=
 =?us-ascii?Q?L2FAFw060H+VdkwYcYRfTxma5HwGzfhLGyQxsa4jY3HdDOSZp776sL9qOsL4?=
 =?us-ascii?Q?FgVjjO1CP0ez0rcKiMjD1A7P6PaKaVnEFsk6jtBvP6gE6/ysb+3vlsw/Xi0x?=
 =?us-ascii?Q?qvhhQUTlc1VF7Qvm8VA+7ojGu5u6zvidbc77hVS+O0ixm2Xb5I2mHvHAzhy+?=
 =?us-ascii?Q?/m7JP6ocTG56qJYQ6lf9ALwOgx6QjZklcTlRWX0jaihtsYc25+NrPKQ/V947?=
 =?us-ascii?Q?nZVoMOXvIGEPbmILDgwickLJAuSQSs2KBfHS8imr5Lu+qUOu04MezGTd19FI?=
 =?us-ascii?Q?xxN989kjnwxoMcykdn/ekblVl0WqiaxE/KS0PwR+wiPR76UOnnRPfYmPJ2tm?=
 =?us-ascii?Q?6S0mpem44kMNOHnrNIgubPMAoRcX7Ga2LZbrW8J1g1FfyAhted5PLwfDL5VP?=
 =?us-ascii?Q?ZcT40rY6VmPKRMKpkyGm5Nbz6dcWE/gO9syk88gqkeI4pzm3Pjj+g5vbpa/U?=
 =?us-ascii?Q?lVdWkKql3frehKt/RVLWdIOM+/sKnW9stYWP0pW7JDA3W6byR75DvZ9qbbum?=
 =?us-ascii?Q?CBv+ziyJrCu7P3oRvw6Isol2koJHArm8YN9yDpqbQenUOnFZ6VTj+1l+j/we?=
 =?us-ascii?Q?hZSoq5g+4hqsuOczjGYL4/JIcRBjYPNqR4v/t23CG5t5SicOKNEHgjy7pPfu?=
 =?us-ascii?Q?4He8vQMfRSw+/rbnghg0gj//5mgndHruZLYcc0L/0SAVf0MTG54j+rzzkY4P?=
 =?us-ascii?Q?UsWwik+Z6ZZIiSjBssH96CSHsat1lgd+B9lzKUyN8O+8/iAs465ZAUNkuOTq?=
 =?us-ascii?Q?28lSdhGfMnjioU3SjJw6GoW0z95M557QKkGlpw2V+YrRsxpLJ4BA2z5vWgVs?=
 =?us-ascii?Q?9Itp8aJTgwwIefaMCTRmyo2HBK/YpHNv0V19/yPz1Vbr9Jo9wOpjglUBJsJ7?=
 =?us-ascii?Q?NiFWUxiQo4CkarSTIN7OlXQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a70666c9-74f2-4710-fea7-08de20b9e408
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:33:10.1229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtXm2qQdXrYZBSThwvB3N0ssUh6q72wSZ2vgJsiVoCspRyVB3l8HKGqOZvSOmRaScfCQuQ1EcapFbyy0AtpwH0SkBTZVOtjmFVnQrGWweGrGxXNG69FIWGVKYrCdAhNH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12531

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/boards/sof_nuvoton_common.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/intel/boards/sof_nuvoton_common.c b/sound/soc/intel/boards/sof_nuvoton_common.c
index ed41cb6f7fa59..b09ecbab2fc9c 100644
--- a/sound/soc/intel/boards/sof_nuvoton_common.c
+++ b/sound/soc/intel/boards/sof_nuvoton_common.c
@@ -34,9 +34,10 @@ static struct snd_soc_dai_link_component nau8318_components[] = {
 static int nau8318_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	ret = snd_soc_dapm_new_controls(&card->dapm, nau8318_widgets,
+	ret = snd_soc_dapm_new_controls(dapm, nau8318_widgets,
 					ARRAY_SIZE(nau8318_widgets));
 	if (ret) {
 		dev_err(rtd->dev, "fail to add nau8318 widgets, ret %d\n", ret);
@@ -50,7 +51,7 @@ static int nau8318_init(struct snd_soc_pcm_runtime *rtd)
 		return ret;
 	}
 
-	ret = snd_soc_dapm_add_routes(&card->dapm, nau8318_routes,
+	ret = snd_soc_dapm_add_routes(dapm, nau8318_routes,
 				      ARRAY_SIZE(nau8318_routes));
 
 	if (ret) {
-- 
2.43.0

