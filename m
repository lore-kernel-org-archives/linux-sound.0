Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010026.outbound.protection.outlook.com [52.101.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BBF266581
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955294; cv=fail; b=AnQ/hbrC4deIcxsG8u5WsKEqbZNdlziI1wiAz+QEj9e9S8RxoKPazRrvvhmBEdQwrUJjE37QEVEkPsN8xOW1B6lI3J7F6F0Vl1d+Xfq8we9BDrz+OsVIEdKzu56cJRdMgKdPZTyu6jlY8ALhQ+YKcdQVbyzKdE7nBXwITyWbEUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955294; c=relaxed/simple;
	bh=OJMWndqG5EMbfKeV1wjBnBOC2vXPCfs85E8X+onY4qE=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=HVfDmF1n1Wlsf6Nm5kKbytqxiO1E8hv45AhuLHnAv4ClBOg2K7+4HgGR3jTAAaMHTQ8MsOvJk+FOVaDtOIz/wHwlHFIhanp3uD0XNm/sAq3LnmTEGkyRqpeO6LuHDSE6U4I+WFPar9O5P9hITalixpL5+14a37UrizwAzUTIXkw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Lasx2V/z; arc=fail smtp.client-ip=52.101.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Lasx2V/z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LK1SMTu7/N+CHnIcWbARcOO3Irwq//5TFBB1cKq3faIRC/9B0k3u0GuN59fZ7ypLs143Au6Jd8X8EKI/G3aKcYSR7ECDzz8yKbFGvGrPDw51pNsORgGo+QjPhSGKjnkzHxEwZLx5C8eAd4kqAWsgFM4gjaI83fkrD9uUM92FY+e+fZKWCGubsU5kgw6rvsFkjMqTSnPZhrekuxkrduQP96tgN/izvP4d0GJyi0/vMjDvKOIWxuOvgmUG1F129JznAXbvhfTM1hnXkRMsJxztFmOzHsbCntPmwp2RyaQ/fmUwuLI0j9UbNesteMqKoZSCl26jhvdQE3qbfZlKQN+vEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06rbm2yJyOdWJotIi7DiJ8I4UnbyhXRXNSGuN3R+8rw=;
 b=HGxjRdzrmBDJHAgTgntg1QfNQaznta/tgl/I1PL2Izu40V6MlsSxRa1u0SQeJVZcQkkj27TGSvpsu63dgNW3Ys2PtzgAQlx5X8pqUorHdQD5FJOKxA7wyi7DfKqgltbpzj3hxiUczl0RuOgpeBdvcISgTKte7Mnx+o2Y6R4hxFOOy7NdjPlhyFpFfFE6cCj29S0wjjvTkP0+DoJBcJsavTVt2ZcXYDlFGXjRho0R/9dvdEHNHjEdEx0zI0heR63tJQeg19+tT0LenU9iwRv0WOxxMviKFnoJGdH1ZvIoRqqZxRW5X0O06gCn1ImtXXEiTqfj1fdfQ8vTgclqQagVBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06rbm2yJyOdWJotIi7DiJ8I4UnbyhXRXNSGuN3R+8rw=;
 b=Lasx2V/zHWgvD9fAQBAaYG2pnEq1GJ0568Q7JO57g6gfFf2eCKxe6PV4AEzFmdgx3nVd4hUQmhTWjSBPyALrzK5Z3etKcEaA0fGJTvMcTx6eVTOTX7086lSTlIYHGRRerjtRMbBfnosMjQYVUPKxxH//OMhBJyQZveWd/kwJCIc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OSCPR01MB16080.jpnprd01.prod.outlook.com (2603:1096:604:3e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 01:21:29 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:21:29 +0000
Message-ID: <87qzlmxk2u.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/8] ASoC: intel: avs: use snd_soc_component_register_with_name()
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
Date: Thu, 2 Jul 2026 01:21:29 +0000
X-ClientProxiedBy: TY6PR01CA0011.jpnprd01.prod.outlook.com
 (2603:1096:405:3bc::18) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OSCPR01MB16080:EE_
X-MS-Office365-Filtering-Correlation-Id: 54eae30a-4bf3-4d4f-d8ef-08ded7d83ea0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|52116014|56012099006|11063799006|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	7xMOI2mvZ3j2tU8PDmnhtDzss8LVqs7AcQj7Iq59MCtRnyCI7XT5zXn4ckiAfEo5KY0nG+yRWIkEMN8Yw6VpIrJX0o/92nyWS3rbZZaGd8yZ5ASiUWMwfu8XsU2xN/0gdkUa0stxVV++KPPdIjqsJfmUcNq2Tzz/y4IbgfngqRPdii/0/rZJw8nfqylm0/nwKH/voZ6ZgFO1KVLkPniSfqw/LxYfk8aRrVnwRANGZUtRyEJeoZL/jPF0dGmcKvn8Rd10n9IqpKQ/NESs0879TUGA9TlSj5JKUMRSa4Wi7G6zvXWofePwXTJfY1okRWOzT1LggWg5Zt/OnkrnXY8/y8vCz2fpqLSgbJn0v/1i+i+CrX1p/7xaYPVPhR8kyn9vEF2SIEjPbdx/9vvexytVGy+19bsde3x57y04xDFgTG7AaoSj8Wqw7Atf1X/WO06fs5vvxlBkuipeiijjmPyID8KtyIrkwH4EO6i10gWEFxSg/lmd9aXehjspwURP6BEQYrdkgybcXVtewxWSeU8NZfH7td5XtrA+oeZWv6bAS/sEkPCuzw3OjxLPHcXjDPw/42VQw4EmS9pfabyeX7i/mK8Z9xromCThUj9j76mVHbz7kusUVl8/XNwbA5iwQaysbZnS0+kws0hMhAg3I2nhpOAUOSkPZxwGes8qM+74zxKb9ZOLheSSNJQ8sSDlSagcU350UYLthRnSK3icRxO74EoOVhKPlw6ItWuoGW4qjVE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(52116014)(56012099006)(11063799006)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7CgW6Q7mzb3VB0xw2zrZbKR/f25VqWfp47owyCsOzI+Uc20GPfyvolagY0uC?=
 =?us-ascii?Q?jxQBKFbzwzIgqcFQDlgb6/bIXvOGGN5tafhhmhOBDuv5oE30nhXVlL/f1LG/?=
 =?us-ascii?Q?pYcmWN/k4+NUXdOE5xiyrILeKgQSONvuppKTpbQdCFznU7n2v0uG1nKJcC0z?=
 =?us-ascii?Q?sKNqglmKP/vXQumxiF8XNhFPgXUJ1sywgJ53sm9qHTZ1l3zSq6H6rRM2IO1W?=
 =?us-ascii?Q?O58SdYJn6+hnCHiSJ3JjBTtD5Q1KHkd+L2UI1PSO/lAJ9G1Ko9MbTlf6ym/h?=
 =?us-ascii?Q?sdZj5m9lUXmQiFFZCD4M876byfsFQf0fARCHWIPKvNK12rfyecacRKqAHtI5?=
 =?us-ascii?Q?w88D/oE8qcWGgD08gyQKi6R6JTcJmnb7n3m1lXkxnpkInNkMnirn25Ahv1tB?=
 =?us-ascii?Q?Ub41QKNgkjcTk6/C+YgiMkmkwOaEh/oJV+bKObNWCCjZ9SdqI997qLhoMcvb?=
 =?us-ascii?Q?vaeO3NdGpP4HRxwlYL0/1837EeDuDQ3BDxQTVruXBMKV7w4jp8zHkBZSanQi?=
 =?us-ascii?Q?NG8ZUOEfa1HIYOnf/FTPmO9z6qx5d5iPNQZkx1sjAg8wDmzopf6M9iWGw4oU?=
 =?us-ascii?Q?XBEnWOAPcErpVHzmdiZg0JORRPQxU/QJp3YSLFDAFwfyQHBHjvjawW5PW+8J?=
 =?us-ascii?Q?G+xFA7tW0PT48QC1Bm1YGeDHOG0FuHxMCeWBTe6yoT3Pvhs6q+k9w7LGJ4pK?=
 =?us-ascii?Q?UBKKyE5fvLTL7bOGYoxOohbr4uwXAH9ET8d8IRpwUUxUjLlmsEWVj8eiVIMz?=
 =?us-ascii?Q?RNvpvVFleZYemNtFBqHXiY7/RrMNi9EFnSP754mfGdcjweldsCZjcD8hd4Gi?=
 =?us-ascii?Q?y9q7Ya1eSFe3VMb9ykF13EhziVJww9+CrSnNubMLQ+y0M5ceHtx0jvChk2eF?=
 =?us-ascii?Q?KuMGpvb+dWPwZ6B1WAA1qu+1sIoA0i1foQWuRGzhFvvD2eMkgOac662avTVN?=
 =?us-ascii?Q?D/30kI0BK56ZweOSe87dWUZbW2RZCD3HT3axvEa4Tffpw8ZnRzgXG157umlK?=
 =?us-ascii?Q?qb/5HPcLQORZ/+US1Elr10tfxyXSYIcIsDAI6Y7+vw10gokB5/M+UEjfW20X?=
 =?us-ascii?Q?BUg6tO4bSJEZkQjAHDDjQ3N1GAnOBKtiYrQzMDsVKlhRtZNTO91nU22ujRrU?=
 =?us-ascii?Q?HKnXqD+6Wu/D87KX4knWcsrFvBRhW31WYhTax6LTC0ir/tZJdne8EA4Z6IfU?=
 =?us-ascii?Q?fdPvNJYORA76yf4noT0wK2B2V55Oe5Cf9TUauy5V1Li1E3QffmKcR/DmyPus?=
 =?us-ascii?Q?4D7P6WjjfpzA/Le06ZyJn/Aizo1dDQ0SwDRKxJGv4kNS7qKSGdZoJ7/0WTzZ?=
 =?us-ascii?Q?c/llsL3aG7k3YiKG1c+n00G8A8lAnf9FPk9R9dIqZlv77LUR5iyseQ8gj/Qm?=
 =?us-ascii?Q?HGEH+yuSGnxkCaWG5IbvT6SH554AGRevD+Zu29zyRcI32OOS0c79FsOHY+29?=
 =?us-ascii?Q?Zg9XYFc/osA61C9vn5yDNg24En+cJ5vo5UgOWZQ7zyPJI/DXBIe/KBJQtDKo?=
 =?us-ascii?Q?1+euIc3YtoVFlJ4by+iIOLoDhdmEZWr8eNtebNEjjZQxlkZUNu0uJSz1bryr?=
 =?us-ascii?Q?ILJVgfmgnEW6Hcxm0Q5bb7JcGusHXISpyXZpGlgNFwhtHpESMymaWUP+nVqt?=
 =?us-ascii?Q?pwMvsVRelo1sR+xwsFJsIzZ+VRa3fgPCWRwAXZbU0TsQBUuAUtB4gTdveAuv?=
 =?us-ascii?Q?deYYemPd4mP+AwIq2uGoqOboTxMc4yI5qQnP/32ic6Fa69C2LTRQYLkzMtRw?=
 =?us-ascii?Q?nCo8Y76qIthYlqZqTmSHmrFW5dfZH4mkNOgrgqVj7Y+coW6oMzvu?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54eae30a-4bf3-4d4f-d8ef-08ded7d83ea0
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:21:29.8439
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kdv7Irv32Nsy9rYLIUjoVc5dInc+Uq3uFh2YQYfF4YGxh6YBZeCTedgS1FpToPNzMU7H/rQfRi8VMLGfLD4+z/tvFMpI/m7G2I3uybVVMMBxOQNMf+UKl8kX83NJadUv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16080

Current intel/avs is calling snd_soc_component_initialize() /
snd_soc_component_add(). Use snd_soc_component_register_with_name()
instead.

It is using container_of() to get kunit_soc_component from component,
but we can now use snd_soc_component_to_priv() instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/avs.h |  5 ++---
 sound/soc/intel/avs/ipc.c |  2 +-
 sound/soc/intel/avs/pcm.c | 16 +++++++++++-----
 3 files changed, 14 insertions(+), 9 deletions(-)

diff --git a/sound/soc/intel/avs/avs.h b/sound/soc/intel/avs/avs.h
index 0f8ddd0e9e5f1..b4f9d66d55ad7 100644
--- a/sound/soc/intel/avs/avs.h
+++ b/sound/soc/intel/avs/avs.h
@@ -336,14 +336,13 @@ int avs_icl_load_basefw(struct avs_dev *adev, struct firmware *fw);
 /* Soc component members */
 
 struct avs_soc_component {
-	struct snd_soc_component base;
+	struct snd_soc_component *base;
 	struct avs_tplg *tplg;
 
 	struct list_head node;
 };
 
-#define to_avs_soc_component(comp) \
-	container_of(comp, struct avs_soc_component, base)
+#define to_avs_soc_component(comp) snd_soc_component_to_priv(comp)
 
 extern const struct snd_soc_dai_ops avs_dai_fe_ops;
 
diff --git a/sound/soc/intel/avs/ipc.c b/sound/soc/intel/avs/ipc.c
index 71e7997e52c2f..39b0de9831da1 100644
--- a/sound/soc/intel/avs/ipc.c
+++ b/sound/soc/intel/avs/ipc.c
@@ -106,7 +106,7 @@ static void avs_dsp_recovery(struct avs_dev *adev)
 			struct snd_soc_pcm_runtime *rtd;
 			struct snd_soc_card *card;
 
-			card = acomp->base.card;
+			card = acomp->base->card;
 			if (!card)
 				continue;
 
diff --git a/sound/soc/intel/avs/pcm.c b/sound/soc/intel/avs/pcm.c
index 797b9c9163b49..3125284529530 100644
--- a/sound/soc/intel/avs/pcm.c
+++ b/sound/soc/intel/avs/pcm.c
@@ -958,7 +958,7 @@ static const struct file_operations topology_name_fops = {
 static int avs_component_load_libraries(struct avs_soc_component *acomp)
 {
 	struct avs_tplg *tplg = acomp->tplg;
-	struct avs_dev *adev = to_avs_dev(acomp->base.dev);
+	struct avs_dev *adev = to_avs_dev(acomp->base->dev);
 	int ret;
 
 	if (!tplg->num_libs)
@@ -1387,25 +1387,31 @@ int avs_register_component(struct device *dev, const char *name,
 			   struct snd_soc_dai_driver *cpu_dais, int num_cpu_dais)
 {
 	struct avs_soc_component *acomp;
+	const char *comp_name;
 	int ret;
 
 	acomp = devm_kzalloc(dev, sizeof(*acomp), GFP_KERNEL);
 	if (!acomp)
 		return -ENOMEM;
 
-	acomp->base.name = devm_kstrdup(dev, name, GFP_KERNEL);
-	if (!acomp->base.name)
+	comp_name = devm_kstrdup(dev, name, GFP_KERNEL);
+	if (!comp_name)
 		return -ENOMEM;
 
 	INIT_LIST_HEAD(&acomp->node);
 
 	drv->use_dai_pcm_id = !obsolete_card_names;
 
-	ret = snd_soc_component_initialize(&acomp->base, drv, dev);
+	ret = snd_soc_register_component_with_name(dev, comp_name, drv,
+						   cpu_dais, num_cpu_dais, acomp);
 	if (ret < 0)
 		return ret;
 
-	return snd_soc_add_component(&acomp->base, cpu_dais, num_cpu_dais);
+	acomp->base = snd_soc_lookup_component_by_name(comp_name);
+	if (acomp->base)
+		return -EINVAL;
+
+	return 0;
 }
 
 static struct snd_soc_dai_driver dmic_cpu_dais[] = {
-- 
2.53.0

