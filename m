Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011003.outbound.protection.outlook.com [40.107.74.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC7D223DEA
	for <linux-sound@vger.kernel.org>; Thu,  2 Jul 2026 01:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955303; cv=fail; b=JWGD/hTA8PMavLa4rP+74HGSkHLea0c/Mn4gOu4FVbD4YsB1HZ8b3sqmoyiAebh2UHGyqtXhmFx4shlhv4Fil6nLrJg/nERkLksoUyG31TSWxE49xOAqn5kQoR/+3/qWpcZDs1F55fhjzCInzgb2YKaq29qKt9LaiCMgS8tdiLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955303; c=relaxed/simple;
	bh=pWYc1nGeSgDaILRwdNj6T5UMn6rQeE5RGa7CwW5u9fI=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=LoRU3GK7LqmByo8Tp04xGQRnThGFlcZrPPctIxtMQfAqwlZECRpyH3fQZIsPvHceEwdPuEz6cqsp9FwLcfH0j11d6T5VIEesgKL8xUsZJUVfpaU0LSMCtbpoG4FCMTNnCr9t9ukwe6563CVy60rO0KBG3gDoFJgZuDMmgwDFALU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fqntXzmH; arc=fail smtp.client-ip=40.107.74.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fqntXzmH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icLYpii/GHuF5ynLGhAhygNWCSBPE8IHXcDXexfFtOR4e3cmcL/sn+N0VJr7Gfs9K5bQIHl0Yzo3ycwbUdtuZzJSCPUdWqBs23emC+bmagLBJC4qpyGJE7aWpyNCmbmhaVSfPERx8B5sa+JPi00iu5+AEpxbWVxb3TgXmjOyrAmPYm9QbtgVWYCwt/oCiUXHZ2WybQrO3aNiBnJqpTcsgyAgBXEhE/3NazmQoFtcVSJmMnCrp3hznauNfVsjxyEQcrk729DHfcCP/v/qBrQu9iANUSWba/HxwxBLiO//ujjq56/cLGw4gzJH0acSADjWRNwonoUYBnQRXUgnvpdzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5B35VoOOKcwjM9m75eWbpmBi/Ji+j5iwsG+4ndccrM=;
 b=UlH+pZohgDg5EniECYkcnM+whCiPepv/QA4GMDGtIU635Bqk3d8O2gKOYhLcnllxRZsfAwjV7SuZTtdENY7daeQJ4mhLICgBj5TJBxf0dRoDfg5h0S5zfvaqpmCjN4ooKHkEHKTg90GU9U7wHPh6wp6+tjUDGUYjc8UzlZSiYcSAxEIPZg0r8S3gZcLaBeEdCeb62Xwo9Gfg0i14PR8LAqZsoBNH7w29dx8eqXeXZVWjtWc9LaAUEFwJgGvDeOAzycTdyMIGgjxsSWZ+q8uQ/Wj8bRlRK92fQWT3AaLgF6Lcb8/jCKuB49nlQZueH/ZTKeXsTZU82vprWtspiAareg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5B35VoOOKcwjM9m75eWbpmBi/Ji+j5iwsG+4ndccrM=;
 b=fqntXzmHt2LBMFAsG/e73tmgA/ZiDAPNBEWe1eanu4eq1wWtwkGVPaPHlB713mjKyFhUXEpKEqcFG5nfqXWxvqoAGdsqgmwEnLqEs9RRCp545zQ9tDy0hYqnwBuK226IH52DnaSZh/oZzwKbZoWcd/j+aNdlO8askZbjwAWCs9c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by OSCPR01MB16080.jpnprd01.prod.outlook.com (2603:1096:604:3e6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 01:21:40 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%5]) with mapi id 15.21.0181.008; Thu, 2 Jul 2026
 01:21:40 +0000
Message-ID: <87o6gqxk2k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/8] ASoC: intel: catpt: pcm: use snd_soc_component_register_with_name()
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
Date: Thu, 2 Jul 2026 01:21:39 +0000
X-ClientProxiedBy: TY4PR01CA0038.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::11) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|OSCPR01MB16080:EE_
X-MS-Office365-Filtering-Correlation-Id: 062e2da7-dd4f-482e-71f6-08ded7d844e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|7416014|376014|52116014|56012099006|11063799006|22082099003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	hmNjTntCGtZUGDQaWQ2AgjSd3w//dwBN7IUGuuPeMsmNStUp1574OlfDX4d63RDjGqivs1b5Mli5jfs2Thx31yT0FrJa4qwV7Zlp9PsO3z4YmBqzKy16nv/PIXH2eJhR8XXU6rgOHe5LYHXs5Z/m5CR+DXpXC1H+DarYN89ZXvaBYPJMwj38JzYvTBKiwbNwWeEERvuzJJ+oLU93E6+g710rd8osu2fiKNtRfosGxATKyBKpGuST4jTOC7OH0zyOt8PdJb3GJHk3rYykH7ybvD2gzI5/jEYGn1XZ/loFrwBcp/Mgg/6HofoF3UczL0mP2Scoz36s+im1ZwzVdRHrFDTKcAwZQy7eCASdg/1Y4TR3DybZhp9QLGaSvJd8X0LW0WJrr3n+dJyFkr0S6fJy69ok+II2sMyZVm2q5qsWhXvm9UaudtdKA2q8mRE1Cb7BkrbcGV5isdLT01nRNHhkqXT3khxNIwDPnfX/4dD9vQg69AmmLDszzMdCjptvNjm262GIiWsiOw1xHAvziDE9/sZoEtfHLp1b4LRWUTi0RbdhKJfB71HkvLKutv3ShWCc2muoQfajwhg0FEbqDZnoCgXJzXKn4p5cyCYClMISJVAnYFcbn2iTQor9j1hBlvfGDxB/qsdjrywlOVcMM+v6eoaMydjR8kfh7u/LwHmp/QR3+CAalM42bmYWbJ0ZQLwSCoS86pCd4rSGe2jhJ0iOFtcill80kPFVyeFodJJmDImjPoPOavr8cUyA71gG7WN5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(7416014)(376014)(52116014)(56012099006)(11063799006)(22082099003)(18002099003)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gGqta607ZXZnQVHhXKlPwjF32bqppDU2oDA3pxFLqp1bcWJwFAF3SvxiR/5F?=
 =?us-ascii?Q?Ya0ExfutHHi3w74Y3Cse6LrGnRu9fYeaYMzIxFJ53lKgXmF3MN7yUvMONBwG?=
 =?us-ascii?Q?J8H9DiA6qwCVBUFgCJzzA8r+IYwFP40A0qHIVHB2xMawj90oBaI5Q5a4pKF5?=
 =?us-ascii?Q?ue+YwiMmplgy0LZ1F3w+z4yujR0N2JcPxpxn9oFnRznF2ip7Pk5ZZe3tfSzl?=
 =?us-ascii?Q?chNAxhYx6VkS/U85w0a9e7EfrLtzUjfUFdigt1oAOi2cegx6B+VvyiWqrLDI?=
 =?us-ascii?Q?Wh6XHhOqHnW5W4vSXzj5po9kIMLzFA9Pv8yZ3UCI+PJrfEBqSFcK5Ym9EPtc?=
 =?us-ascii?Q?ZKQGHV/erFN8XevECi1rKuVmhpE7ge/ZE4/NZYovUFZn5BYEjRC+YONzjr+W?=
 =?us-ascii?Q?st1/H/WNGXhyV9DYvlUWSdBwo5DM57SGqv5JCsVoENraBETG5STJgkbzEkZb?=
 =?us-ascii?Q?xVBQ/gSzAdmD7nSzN3kvlh4EcxZo+XTp7aVN2KGC1XGMUZvitbr8jvsmYxU0?=
 =?us-ascii?Q?fRBWt4/bc+pU2BD3aUciN1XFvXVKe5L30Dzo1MWR35p5XVu9Sb4gT5diQnrl?=
 =?us-ascii?Q?0rAmqLKDWaXS7C6mq7QYvntIDWRevNQ7dbKhCqr9d2bLt8uHMZaAdR3YrG7+?=
 =?us-ascii?Q?c1R594rjKA36MWO3N4JAaS4ILPiQynvj5X5gvnqAt02KtzKDHp98XJurlIM5?=
 =?us-ascii?Q?mDydOKGKNBk0e1UvWHmAKfGE5eDzS5USwHbPmZvoe1rlEFHzmij54c+y2Nue?=
 =?us-ascii?Q?lzG7BcgaYhK3tLsU9i8EvsdwNfO9dRYevYaRxeXbmw2HHwl88vAd7raMK6C3?=
 =?us-ascii?Q?REGXA3MEHIozH2lUQhlmckexBkDyf1kyEyKGOq8Vsdm5smRrLRom82+fpZSD?=
 =?us-ascii?Q?zS3NdXUB1vfhK2+TtZAI3+Ylvi6OZIlnuPZzibUg+YhvA6pkkwbnZ7x0+F8O?=
 =?us-ascii?Q?PRJz58VvHW3HtatfjdcygSg2KlkPoRWYyTTa4TXsgx5MF/HsiYnGcAybCOXJ?=
 =?us-ascii?Q?D2QNB+OSBLl1kNAhRnZ23nUjkQqne2MxpH9qQoF53P2dRB+uR3JRJbbwt8aQ?=
 =?us-ascii?Q?9Br4YubuD5vjoyj8+75Qved26dXQjJ9AuHuFon4gJju0ANuhMiF+ZMkxUSFM?=
 =?us-ascii?Q?FkZDppiwROdKz56W7TuQcWqwn52yEIcbRvamEnZ4KyG/mpB3JowStPn35y37?=
 =?us-ascii?Q?np8EhxOdY8PSv7PuvwZHCEZk8mzkHZdgH44cq3p4gjthtoIcy/E1KiD30EiM?=
 =?us-ascii?Q?qq8targ78VU9Of4DOrJKlG55ZU5df1ysClWfYz9ScsOVxmt3S7J6JnkTrugE?=
 =?us-ascii?Q?goXVe+rLwb1Iwoqj/G9g8n0gr6xaklJzfrBwQXajbY68BMGKDH+SKR/lZ6l7?=
 =?us-ascii?Q?NTmGOD3x600KagHuk881KmZ0L0jhEaB8R/ABLDRgjmTRBftTmQ4aBP1xPBea?=
 =?us-ascii?Q?1vrGyD6mRf+f5gkF7HBLMtJj2oaZDglCCZTLJv7wmy9cUnVl4PuewUfu2W/z?=
 =?us-ascii?Q?AfQP2x8ClDbR4D6wZNbkQQhnFe9RGGjbBNbGMZB4mMpzZWQA/Goatl0AoLHZ?=
 =?us-ascii?Q?ctdqIbzpYgk33uBN3yNRjHOsf7oAinn1lhsq3srEQB0xplyDhF6pIDZ8laap?=
 =?us-ascii?Q?q36v7KIAAsBg3C/w3MlrgEb0Bs7NbB6q9mFLPVRIJnqzrQ/5W1CjLAHkVbUV?=
 =?us-ascii?Q?oraqD1wjFsomn5zEhr1ZlUpoGB69iYA4BcuZqJx/vMGQ/qDtI6tvkPeZnw0s?=
 =?us-ascii?Q?mcwEu+0EsC7CpM4T7gIwRnVeRTG1he7ImEnWd2osylLNYyIdneAg?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 062e2da7-dd4f-482e-71f6-08ded7d844e5
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 01:21:40.3869
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IM9AedeZdanUfGacOfAv+f+qwcwmpB3x6z/Ygp4siN1RdSotGNgENBszn2JQIQallOWeIaz3l/YbuXHbPaQPIb1NXeeTiPVzrq85ANunkbS+YdD1zH/EE26j2NXYTDl/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16080

Current intel/avs is calling snd_soc_component_initialize() /
snd_soc_component_add(). Use snd_soc_component_register_with_name()
instead.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/catpt/pcm.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/sound/soc/intel/catpt/pcm.c b/sound/soc/intel/catpt/pcm.c
index 8fb0efb67eb1d..ba238197daf34 100644
--- a/sound/soc/intel/catpt/pcm.c
+++ b/sound/soc/intel/catpt/pcm.c
@@ -1072,19 +1072,8 @@ int catpt_arm_stream_templates(struct catpt_dev *cdev)
 
 int catpt_register_plat_component(struct catpt_dev *cdev)
 {
-	struct snd_soc_component *component;
-	int ret;
-
-	component = devm_kzalloc(cdev->dev, sizeof(*component), GFP_KERNEL);
-	if (!component)
-		return -ENOMEM;
-
-	ret = snd_soc_component_initialize(component, &catpt_comp_driver,
-					   cdev->dev);
-	if (ret)
-		return ret;
-
-	component->name = catpt_comp_driver.name;
-	return snd_soc_add_component(component, dai_drivers,
-				     ARRAY_SIZE(dai_drivers));
+	return snd_soc_register_component_with_name(cdev->dev,
+						    catpt_comp_driver.name,
+						    &catpt_comp_driver,
+						    dai_drivers, ARRAY_SIZE(dai_drivers));
 }
-- 
2.53.0

