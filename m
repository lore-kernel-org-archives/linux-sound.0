Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91298C1E
	for <linux-sound@vger.kernel.org>; Wed,  9 Apr 2025 02:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744167464; cv=fail; b=Hs/K2u2vPQrFiyBjVoMbWZWLwTcyAt4qFkqy+lQWCHhiOWXjW6lB6AjYZHHml2y1ocetDk2qU+KvJCARUktHTSfttzT+vAfyFdVKPDiF/yi3jnyNXHMD5JvhUGLeE/tTSfWzSHOS/xlfd3VqtE3vAcgVY5xhFbTMrBqOaeUUIgk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744167464; c=relaxed/simple;
	bh=GSl6WYCUiecsRMRJ3S5Lphyv9XVZ2kpYk/IF1weQ7Mo=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=pBlrEU3MeKsZdo3YaiznnMs34jMVa+aZ4LkFutRSrVBgbJ3sMkr7Thk2V8dOYxGotjHjGXTvcbQq9a7tpd3ZT5oQoWrZSbvsi0/mZkNOwYrUI72ZcjvGiJ4ftFFMQD/Kf+ZW8VPHU6ll0E2CKBLrpU0U9Eq3uOyrRD7DonCKfJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BecDwjUy; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BecDwjUy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5KF/nlCioH9g58LIrDDvXfPhVK/b84gGr/cquIjZFNcAIDdGHaiK1kUAhGJeRrNVddNaoJiBN3/YRVg2colp6o9nrYaFfNinhNZY0qbmQKt1pAaVv4fzuyTyWw/08TYTmuo4/HJCW0jPxeeRapLTKFcsUvVANw1a+TzMMWFAAM/WSJU+PEt6EKkkGoIC51rJLuBxeAzY95AcHqDnPzAMGRBpaZUIdNNxVvnHMSMcSBgxnHJxQv4vvonYontZRaV4dOso0OfZauZ9OFPrEWyTd6oNARg+jdQEmtL5ZSY+TNo/yeUA2n/Dd7X3cjWnEABDutdV/nrc3/GLgP1+pGsTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FspZpjrbBXNvnu0Jq/RZmJdcoHNeD+tzgK9RFKi1cn4=;
 b=SFWd10G95clFJ4vp+WWELNLfJ2SJMjJ76kIhqXK62/rpCOlAgYEiSyWkneBzFWjbgiSKzj0xKRDNspYq10xaDPEARMGeij24nkgMyuUbyLLOhXOr7Ry0KWUxg6jhc6tIjMhjT4W98VaJBYYW6Kxs4G9iVjiUMOdRGsQ1ODj23jJxj/x/hLWpWseWczkPJD9kh6YA4z9CBv5cm1YWpkLhwGtn2OPZasv0kpOUDFKgwxCACl5vhHn2Ko+y3OcyUW4HCrASBrSoFV4Lej1ybq0KsSvLJu1CXDnC0T7XMnXHSt+eUm9ejwBUh0/77+q925E8oUmpdfj/VMWZh2LPAuATDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FspZpjrbBXNvnu0Jq/RZmJdcoHNeD+tzgK9RFKi1cn4=;
 b=BecDwjUyxIistnIv73UtoW6kb14xBANhIMlvU1Bd0X525x74U2LIkW4Yig7yr+4fO4vKg+M9nG3V1+cSynkjSXKk0QLw6cWBiYamzMuAuX4C6/Cwodqauc53t2hkNTW+aQKBfCuNL00+X/wTGm8nqqn+B8kH+bknpGjt+5WcaeM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11643.jpnprd01.prod.outlook.com
 (2603:1096:400:3dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Wed, 9 Apr
 2025 02:57:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Wed, 9 Apr 2025
 02:57:36 +0000
Message-ID: <87h62y9h3z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 6/7] ASoC: soc-dapm: use snd_soc_dapm_to_component()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Kiseok Jo <kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Benjamin Bara <benjamin.bara@skidata.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 9 Apr 2025 02:57:36 +0000
X-ClientProxiedBy: TY2PR06CA0048.apcprd06.prod.outlook.com
 (2603:1096:404:2e::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11643:EE_
X-MS-Office365-Filtering-Correlation-Id: e3d920ed-822c-425d-c9ae-08dd77124877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|52116014|1800799024|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g6XS9mWvRa3rrFkWDcMPg+40Q9eiDvVan6IptjATWicsDReyEKd02cwcWCSG?=
 =?us-ascii?Q?Y4xh1Qd+LR3unkipGU0RfvtLrkRXVwcU06mvrB6epbaIlJxqjyI8L7DEwV51?=
 =?us-ascii?Q?OFYCWVYZlejRMcf1lxt9NEww5RmiDGHEPWqVS3FjSU2UXIaWyx+m6cP58825?=
 =?us-ascii?Q?9MNVmP6nLcVNDclfTAT4yq/F6I2GDz6UWJxVhsM8B5SFeQiC3mopxJdj5Wdz?=
 =?us-ascii?Q?rQ3e0pLRyt+j24RiGslEn9ABHD6UjuCULJSIvuj8gcBqR+lG2W6/5B2AzN7o?=
 =?us-ascii?Q?f7YWJ4z6KhdXOqMFEnp4PKP8cYTJ8ODEnp5yiSup7mby1MVFiJeO/Y7eHAcd?=
 =?us-ascii?Q?xooBNkm4Q9JBj+Y21NBde0EdQoTAJ6G8Gm3bE/90rI2bB+esXkhPlhXZdU4S?=
 =?us-ascii?Q?9dotaTz2LebLDRPvCIwUXR3WtATPRSCf0iV8lUTX/JNMLuMdG6BWXLkdLtqs?=
 =?us-ascii?Q?mhLk+eVStwp7dmAXkOoJDO1QOoI/1sp9JX08xNB5O3Ow4gk0lBkVbkrmzuaa?=
 =?us-ascii?Q?gYPXNTBdu99eKV4rj0aS+APlLA0EtcbBDcBDuCBfUGF2bzkj2jRcIo0YiLWy?=
 =?us-ascii?Q?plid3AbLM8OjOILFQuaBXs4iEjlHN176/nuge8ktVA3Z42npH6xJcbmFA/H0?=
 =?us-ascii?Q?oPDPEpWVGBnD120APG0M4QZaBjqK9XwyikvXgYb15Onv/uCVcZPzH2wVvpCq?=
 =?us-ascii?Q?t2hjrONUY/s7SLOkXInV0FplpF1cQf65ZxoULzHJXa9dyJr/tyKdVc16QmUo?=
 =?us-ascii?Q?BqOCt7Ubl1GudlD2tSm2CyPfwsM0I1ayjii43j528MsMefr2WDy7YWh2dHny?=
 =?us-ascii?Q?sftY2gTMBj4AEXovIt9k++UPizMuVUroet7PtV1nna+r2IvmEf9OWQ5ygbdS?=
 =?us-ascii?Q?SinNPEjPyeUo+zuMGBr0fyfGaQsKunaerTc+pcRFFVjxXu0NNiH+CZh0IeSZ?=
 =?us-ascii?Q?0rOxmANMVshao7SLUA/pK0T/b/F1e8jg9kOnHDFMB/JtQsh+TMNNFDsMgIHd?=
 =?us-ascii?Q?eWtbUQO+S6ZURJXvOxN0/y71EJ7IsbJXYzSomBdkdXGVxWXubyRGt4yVN2LU?=
 =?us-ascii?Q?psyA/feTalogt2sz+KxbJsaHXvez6D4CpczhcrYSFfdy4kM8LDdjXB/6oUuD?=
 =?us-ascii?Q?0Hw7/xCC1u6X5l0pypeUNyi+i2eZBZF9wpB5R5v/lTuw9+PQENX5xbpyAd7W?=
 =?us-ascii?Q?nuFSqHZsan+NWc7VlEDqEHy4b8fHuK8EAjVTnjQhSpcIJVcPCvaU6iJ8Ib/w?=
 =?us-ascii?Q?JJhYGtlyCQXDXejFJh5P0PYP+fWPKMaFPDI+yAdmykHETRMUgyO9pIW0qhGM?=
 =?us-ascii?Q?4Zs/+7Htr5ALxzE1GDzRqksjZrPHLdwA3X/QE6aaP3cdvu5Jwv+EdbXfXTYQ?=
 =?us-ascii?Q?w4cYXIE13G619deVMkWPsnPs0uYeezKxbehsHig1jfwVJwNfTVgTqSQLjxke?=
 =?us-ascii?Q?LI52thYfNUZ5uVWq3Eo58JkSXHVXKDe1jzc1FfL/4Dl7XPjWuZkXQWmYj42b?=
 =?us-ascii?Q?/ZlLfI5nBZycUNg=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(52116014)(1800799024)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fgxn9Pha1n7xQBGw79HCS1rUsjD32YrBxEQxnk2ZHj7Ly+SF6w31xTWJ3fod?=
 =?us-ascii?Q?l8kvr0PCDwr0+bPP3l/WqLTco2aE60f08cqYOcwpB1by9Hsqxdl1OdYNOj+b?=
 =?us-ascii?Q?UeF5ygcOSUYFJuV7tS+FYwWfjOp48FMPtwAbJ51I8IlvecfC8OY6ierKUCmD?=
 =?us-ascii?Q?BURCX1KEVrzc3NSl1XVcVfbLrGSzfSi3JJMZZnTikdqDI+jV/ZlgRFq5NuuF?=
 =?us-ascii?Q?mlYnME2C47pKCTeD4qL7ekKwcKDQMkthj14nUl2T6NES98t5EWhI71rgwcsc?=
 =?us-ascii?Q?8XPSvpTp8SU73qwCQ8iMCcHFs3Vga8t1MmmpW/r0Yh5hq2Da6sMxfk9QzVrs?=
 =?us-ascii?Q?VcSIuOC+Xmhf98ISLfV5QT9tEeEPdhfCxLNJllW+K2xjO9+lsyMhL9rZfowG?=
 =?us-ascii?Q?pXKpBtF8i0Kx+fkbWy3lb61Vlc199tRe+7ocZ3cDMd7DXwrajcvkanyzBzTm?=
 =?us-ascii?Q?nn8QrMKEKKoE8BSCr+4xfeUK2o7nGuhyvRl02EzoPVa2ZK+o1//RtMU9sUkt?=
 =?us-ascii?Q?Ds9MphRqiFdxf/l57DQ9jtKIobVkjghKLAstRsvU603NNJxZe95XHPBT/nuJ?=
 =?us-ascii?Q?u98r4vxg2msfqxxqbfdiBgkRwYjTLz/R2qP5D4QQQoZFNKGnN3xMojg4elqy?=
 =?us-ascii?Q?YGbW3m8F5E62Zbl07ns4+8LWH88dOIspmVQPsVmpT9sWAhSJ7LCQ3bSNbNJx?=
 =?us-ascii?Q?IaBX0iBZ6Jjy7t4zIhNGK06OIyVgqAQ5AWZjfHGmdzj+W0vgYIj6vXAneQkq?=
 =?us-ascii?Q?rxbx0IU9fiJcLDpf08TENRVY+vPTCCEPmT5pJZizKeRoexUmmCL7Mzg9Yrfs?=
 =?us-ascii?Q?HkSqFk1K56fXjkXYPh/pzMRkvXjXCem4uSvHV3EC9vo4+sFg2WnKsRInHUNS?=
 =?us-ascii?Q?MFySPjMN+Su/WJDQcxStkAocziWIVfB2d+lqHmSkEfYH+JzFkgM8PG4870rG?=
 =?us-ascii?Q?Rc5KAWfRKAVI/dUvjC8yPBeSrU/SODJDHay4DsC9+KOW/H6e+CDkcXn7/KBl?=
 =?us-ascii?Q?ClZuxZTaITW8ts2sN534TlkPAri1ge+cUXRitBjHB3MoCIPzFbKobGdrC9tf?=
 =?us-ascii?Q?hhFs85jh5/L/1wW1+BXRDQ88Cw8lrtfcNnOPcv9xPeWC3a98vdeObt5tX6VA?=
 =?us-ascii?Q?SNr9rpJhbIBhYRrolXrpqOdCV8SLtnkqHtcERiZiU17g6esnTXBFWgK4xkiv?=
 =?us-ascii?Q?nNsbg4hFeLuJs4ZJ4inUk3rTkyj/s59qQWmoFmoaXccZgQLpDIZO4fXfccWf?=
 =?us-ascii?Q?mqeZa44qo59PEgCHKl/EWpS3SlhrSlOMVKL7TPZQJ+5kaVpF5/2dwV6FIhSV?=
 =?us-ascii?Q?eXFaiabeAiJ6loqVnueEzgmO0kZUG5M1ocF08JlpGhNftRovLU+bvL9FneHJ?=
 =?us-ascii?Q?d/FJ83VhPas7SnWRXoSz8C5s3Qag2wWXWVbKQNdnUYFEhChfu5n00xV/S5c2?=
 =?us-ascii?Q?ABEbm1UFi3VcEcmZIbImvGF085O7bl0DIhJGYRtnRm9ir8lVbgayUti3YLJF?=
 =?us-ascii?Q?oAsq3v5M1xvfTidQ639KW4SK8iFf4AotOqJx8O4/k77pSxRqg0oel8QhKBxK?=
 =?us-ascii?Q?j77q8qmigRvYjeGedqHgSs8e4Uo0+wp2mNC6RkoqbKyBvGojS90cRhKN/A+p?=
 =?us-ascii?Q?q6pcmLVTGXT0UOEfEUUTmCE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3d920ed-822c-425d-c9ae-08dd77124877
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 02:57:36.6423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WVHyIreKc4Vs/7FeIZ7GJvYXQLWJVdLo0M/W6hJ2mXTGyE4DbMZDFpx447YHAXiw1TiJcGYv64sux9sPY6BB5mUrz0bHNHnKs2jzxl+PojtmVAGYRYvypQfy9ni+HNVf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11643

We can use snd_soc_dapm_to_component(). Let's use it

We have been used snd_soc_dapm_to_component() before commit 3fe9f5882cf7
("ASoC: dapm: avoid container_of() to get component"). But was updated
to directly use dapm->component, because Tegra got issue from it because
their dapm was from card. Now, we can use snd_soc_dapm_to_component().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Benjamin Bara <benjamin.bara@skidata.com>
---
 sound/soc/soc-dapm.c | 58 +++++++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 20 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index b7818388984e..7c84cc86f1e4 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -621,39 +621,52 @@ static void dapm_reset(struct snd_soc_card *card)
 
 static const char *soc_dapm_prefix(struct snd_soc_dapm_context *dapm)
 {
-	if (!dapm->component)
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+
+	if (!component)
 		return NULL;
-	return dapm->component->name_prefix;
+
+	return component->name_prefix;
 }
 
 static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg)
 {
-	if (!dapm->component)
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+
+	if (!component)
 		return -EIO;
-	return  snd_soc_component_read(dapm->component, reg);
+
+	return  snd_soc_component_read(component, reg);
 }
 
 static int soc_dapm_update_bits(struct snd_soc_dapm_context *dapm,
 	int reg, unsigned int mask, unsigned int value)
 {
-	if (!dapm->component)
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+
+	if (!component)
 		return -EIO;
-	return snd_soc_component_update_bits(dapm->component, reg,
-					     mask, value);
+
+	return snd_soc_component_update_bits(component, reg, mask, value);
 }
 
 static int soc_dapm_test_bits(struct snd_soc_dapm_context *dapm,
 	int reg, unsigned int mask, unsigned int value)
 {
-	if (!dapm->component)
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+
+	if (!component)
 		return -EIO;
-	return snd_soc_component_test_bits(dapm->component, reg, mask, value);
+
+	return snd_soc_component_test_bits(component, reg, mask, value);
 }
 
 static void soc_dapm_async_complete(struct snd_soc_dapm_context *dapm)
 {
-	if (dapm->component)
-		snd_soc_component_async_complete(dapm->component);
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
+
+	if (component)
+		snd_soc_component_async_complete(component);
 }
 
 static struct snd_soc_dapm_widget *
@@ -696,10 +709,11 @@ dapm_wcache_lookup(struct snd_soc_dapm_widget *w, const char *name)
 int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm,
 	enum snd_soc_bias_level level)
 {
+	struct snd_soc_component *component = snd_soc_dapm_to_component(dapm);
 	int ret = 0;
 
-	if (dapm->component)
-		ret = snd_soc_component_set_bias_level(dapm->component, level);
+	if (component)
+		ret = snd_soc_component_set_bias_level(component, level);
 
 	if (ret == 0)
 		dapm->bias_level = level;
@@ -1653,6 +1667,7 @@ static void dapm_seq_run(struct snd_soc_card *card,
 	int cur_subseq = -1;
 	int cur_reg = SND_SOC_NOPM;
 	struct snd_soc_dapm_context *cur_dapm = NULL;
+	struct snd_soc_component *cur_component = NULL;
 	int i;
 	int *sort;
 
@@ -1670,11 +1685,11 @@ static void dapm_seq_run(struct snd_soc_card *card,
 			if (!list_empty(&pending))
 				dapm_seq_run_coalesced(card, &pending);
 
-			if (cur_dapm && cur_dapm->component) {
+			if (cur_dapm && cur_component) {
 				for (i = 0; i < ARRAY_SIZE(dapm_up_seq); i++)
 					if (sort[i] == cur_sort)
 						snd_soc_component_seq_notifier(
-							cur_dapm->component,
+							cur_component,
 							i, cur_subseq);
 			}
 
@@ -1686,6 +1701,7 @@ static void dapm_seq_run(struct snd_soc_card *card,
 			cur_subseq = INT_MIN;
 			cur_reg = SND_SOC_NOPM;
 			cur_dapm = NULL;
+			cur_component = NULL;
 		}
 
 		switch (w->id) {
@@ -1719,6 +1735,7 @@ static void dapm_seq_run(struct snd_soc_card *card,
 			cur_subseq = w->subseq;
 			cur_reg = w->reg;
 			cur_dapm = w->dapm;
+			cur_component = snd_soc_dapm_to_component(cur_dapm);
 			list_move(&w->power_list, &pending);
 			break;
 		}
@@ -1731,11 +1748,11 @@ static void dapm_seq_run(struct snd_soc_card *card,
 	if (!list_empty(&pending))
 		dapm_seq_run_coalesced(card, &pending);
 
-	if (cur_dapm && cur_dapm->component) {
+	if (cur_dapm && cur_component) {
 		for (i = 0; i < ARRAY_SIZE(dapm_up_seq); i++)
 			if (sort[i] == cur_sort)
 				snd_soc_component_seq_notifier(
-					cur_dapm->component,
+					cur_component,
 					i, cur_subseq);
 	}
 
@@ -2193,8 +2210,9 @@ static ssize_t dapm_widget_power_read_file(struct file *file,
 			if (!p->connect)
 				continue;
 
-			c_name = p->node[rdir]->dapm->component ?
-				p->node[rdir]->dapm->component->name : NULL;
+			struct snd_soc_component *component = snd_soc_dapm_to_component(p->node[rdir]->dapm);
+
+			c_name = component ? component->name : NULL;
 			ret += scnprintf(buf + ret, PAGE_SIZE - ret,
 					" %s  \"%s\" \"%s\" \"%s\"\n",
 					(rdir == SND_SOC_DAPM_DIR_IN) ? "in" : "out",
@@ -2784,7 +2802,7 @@ int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
 
 int snd_soc_dapm_widget_name_cmp(struct snd_soc_dapm_widget *widget, const char *s)
 {
-	struct snd_soc_component *component = widget->dapm->component;
+	struct snd_soc_component *component = snd_soc_dapm_to_component(widget->dapm);
 	const char *wname = widget->name;
 
 	if (component && component->name_prefix)
-- 
2.43.0

