Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6EA28B4FE
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 01:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755568745; cv=fail; b=QeeiEyaPYVV+iRUmTz91TpY8uwcGxAt+4rvEZZ4W4ITiSj9glKB9ZpN82dxzbaFWj6NdiC80lEXqTIDzp6P65Iv2SSqCFFcT2ypqWxw3P2X/5lHUDgU+vDA8M45dBIJgilkNLDQ9vBMm3UjkwbOrw6lKNKDVfK2yR4XhLxJ2TB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755568745; c=relaxed/simple;
	bh=WhF82Xh2JOj6Sf+FLgR+OHI0ozb7sQMiQIoc4FGBJxM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GK+YDit3VFtUpW2J1xlh59sb64XMYm9pvk27KGC9wggM8CZKU2noNrc74G9LDtSeXCygmqJLlWlP1EfcKNBwIobr0baKi9dQjnZAUOLge420LMT9GIbOftx7ySS1NFG0fpcFn+NbOtIdQ0Wv0BBuPww7G6H/K2FgXNK5x/k+pR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dfwc2FGi; arc=fail smtp.client-ip=52.101.229.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dfwc2FGi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5Pldc1N96nka4ToDhvRG0uz7P3nd4+RBQ7Bm0XSwmH6m8pODs9D8Zh1Gynd/nGmjWBQctMcLA4F5Ls0IH5urCEFebKyZ7pqRbzSIv7KoRlTfIkXu565x95eECAvGwH5iMh4WR4S7kjevIo103Kk5KGeP60Z9NXiy/RzUv8SDeNn+lXqgqUJJEnA5TvZGlgy7yK6hDJmjW7NKYbnuD6uCNklWCklP+fx9AdM5U176C5IAmCnBV8N8Vo2jddM5M0ULLPPlgTMAfBHOjatKTk/BnaROb6GA0rNn04Cd6O1uoBOinXPcQcieQ5TPmK6HCzPlIZtidSN4m+aLbq9X6LQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgyvFZX/kt7KQBuVSz+d1PvZTBi6YuQwK28fUxbIpjQ=;
 b=pW3kib4H5OTdAok9ofrJfOAqlNAyOPmNye5iabPy4PsjOES9PMyTZnNm2LVDBUpRydHBKSiAJA36Ba4itTespAOE8lkdLFwCvGZXiGpa9wHe9rx5hRNfOJldCrC9PMfR2DbS0rmjbdR4wDN5fZu7Vn2+Q/zJYFbpF1hxZosyQYsT6do4FvRNVdXh1eAO5w29JhxdYSyZ4uIMJ1LJYH0Ztt+3JT9At0JnKDuKpB1Ox/jrs2uW2eATCfu+xamLxBtY952FlxboGlHs4fTBzEa4rsd0Wsp1RS8MA1QuBdxEm63QeODfsGpxKMRA6+y8lNKPxYxNC74uwaQ/nUe+zhxeBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NgyvFZX/kt7KQBuVSz+d1PvZTBi6YuQwK28fUxbIpjQ=;
 b=dfwc2FGi5uU8J6DDnm9vFkPZCqaA8W0NbLa5WE2ObTSZc8H6Zb5bw4NbgHfRAW9b/OmwaYTJwVG/uP0o06G7Xu4HWgP2l8yt6YPTDRZt7xTNrPw2i+gEPHBlHDtV6n8XLJ0CGAH6r0OJgB5t/2OuPnA7xh3+CoLfzBvNySiADSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13973.jpnprd01.prod.outlook.com
 (2603:1096:405:207::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 01:59:02 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 01:59:02 +0000
Message-ID: <87cy8sysuy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: soc-core: tidyup snd_soc_lookup_component_nolocked()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, J. =?ISO-8859-1?Q?Neusch=E4fer?=
 <j.ne@posteo.net>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frdoyswf.wl-kuninori.morimoto.gx@renesas.com>
References: <87frdoyswf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 19 Aug 2025 01:59:01 +0000
X-ClientProxiedBy: TYCPR01CA0131.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13973:EE_
X-MS-Office365-Filtering-Correlation-Id: a28640da-6b25-40a3-d2c8-08dddec3f824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mO16glSpKd9snf7cWd/Owef91xmIA+y3vJF+qTcgdFXPjwpDmIpoJAkMZCuS?=
 =?us-ascii?Q?+m2JewWfXWJgTXRZmHZHOIbgsoKIJFXthRlSvfeqS/SStpCayOKx47ux+3Cj?=
 =?us-ascii?Q?Iawcjpiv65W4tADzzbuDa0MtV4GA4rSdL2qf2d559HJHN/BgCcznhGcow/uc?=
 =?us-ascii?Q?bKvQ+GW6lIhE+XfHHIVs4IHiwDWs5X5O+frBMhoWFJve1G4m2S793pOB47yv?=
 =?us-ascii?Q?/IAZekRdSIy6FPHH5enMpJvFqfJ0SXmyxWAzjXXiAFsEku3SCENfEg5vS/97?=
 =?us-ascii?Q?Nlskfl7gaanxYAPrhImGfJ/kxlr7PQZp3Kz3bUvDr1Aa23c8tz4E6TsHJZD8?=
 =?us-ascii?Q?kRbc2Ne9Zsywxx49bWnn9Gphdm/M0toawqlB2J+jYRUNBUfveuet4lWf6hQ1?=
 =?us-ascii?Q?t/g1PV7/UkUYhkprCb6hKhq/7NkxL3j5Nc6L6uSXo39wwJgRKCv2JebglHOo?=
 =?us-ascii?Q?0wUGSpF34oy3o1FxRWDhBGDMZXg1pJQbIyYcz/lH0hCJQraJZzf7w1ysxAMD?=
 =?us-ascii?Q?kxsKrgl7F2kATWZccHLxl4oJVq4vI6eOjTMremxs1hM6UyjLT9e4fF+X+Mtq?=
 =?us-ascii?Q?9YS1phrBffYGCKH0TPLA0Oyt2AK9rwQdcEVZNgZPap52ZrOUoBpTBpKvnDk+?=
 =?us-ascii?Q?BXFDUXnVfPcdGnV/w6YfTJizfCk68j3u+7ga8TvBfLrXDXbP2KoYoZjf1u2J?=
 =?us-ascii?Q?CwkkACEe7cP4iimriDIhAtU32ZtqS4YXmegE2fpiArDLaGYWpSlkPrDhJsjl?=
 =?us-ascii?Q?osyv9Cx+ROIKLRj2oskFPjvh8leLzDKnjTp79q8sAwH7f0vCV6tZjnXbg7QN?=
 =?us-ascii?Q?kadLcemU4sVZscFrFZeSvexNTT6AZFYZqi/tshRAyCOh8p681hH6jM4sMglA?=
 =?us-ascii?Q?FAtza8MpQTPkfKEncgDSV2yZdCsTE5XYa7zJ8W8MrC3NVjfvA/tS66GzuHxX?=
 =?us-ascii?Q?qCoIzY6BIoMESjZ0cH/TlNotkYZOX3uFde62stvGk7FWVNf2KmjkiPfI3BFD?=
 =?us-ascii?Q?k2ltPDqFq15K9jY7psRbNV8G6zH0QYnIxas8FptfInb0xZMriYnDn2f9ybcp?=
 =?us-ascii?Q?qCtBM7MdoN0dFY68ioTjGIiS7MEM/O+lcqQMMf5b+Ru8KHIJMiiRG5RLlOpx?=
 =?us-ascii?Q?aP4LrhdUUqpxMGO32lO3SUFQjK9iTAuI2HPpATUG0weL4/YRC6RFxqcGQ52E?=
 =?us-ascii?Q?J7lbYaLQ4tcGeCL+pNn8lMYizyvAPglnrg/IwwvIBGZoZ9kALs00la6c5PSt?=
 =?us-ascii?Q?6R02Gt22Qm5xuKkad8JQlksBU5EHU6bLhBSSmWmRYxbY9B/JxH3Z7kzBBoc0?=
 =?us-ascii?Q?zv7rgmnIVizWx8+rKkVPVIotab90nbgl18CMcx5Ho2kX4jf/AqyjEsol913A?=
 =?us-ascii?Q?hSL02eNVrcb7EvvqVmCz+mQwTOSmGvD2qUwhIBGFmGcN9Bnu5z4KLZupgIso?=
 =?us-ascii?Q?gjdXsC3DZeFBP6MHWH2YijPFUcvi2mGS163WoTx8JH+LLK7i9unVkQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g0Kp6ij21kWJuwZg7BfMKMPCnuMPev6H1aKdB9cZ8+fNfJ9P28KRQphyDtEG?=
 =?us-ascii?Q?MXrG7d8d4IYvj96nM55VtGSCBlR1HmUNUOyFoHliOH5N2+tHl5G6SRCiBowf?=
 =?us-ascii?Q?JL0X7wn7BJmrncyCsnAT0Ceu9tbulEz7Ey62GkPtUBWhcghQxwjmNARLMhZa?=
 =?us-ascii?Q?SxEHY/gZ4nr2G3Vze3+kfeNzNbdcNEi3E35lLIY/U01V2cUCvtgyb9dG8jNT?=
 =?us-ascii?Q?jcUsw/03I152GG3ZD3u/qqOut8cY2K7szLqX5KsScgZCk905/H/oVZQm07td?=
 =?us-ascii?Q?NUCM64k7NFYgVKoYuSItzjrSQFi2Wf9bh3998O1pu2gIyeEKXtyX9r0Y5x5K?=
 =?us-ascii?Q?r1HhyPGUodZImg8i+4tdqaMAMhyeB9oNOVw5nXLNjfGSrnw75+Xk5DAon/nc?=
 =?us-ascii?Q?ZHlWehk5ss6BLsQ/yJsKoIIx/LvBPNP8oPuMvveh7bzx11OVSXcUf3f+0zEt?=
 =?us-ascii?Q?t5vFrxZHSkjlipGotSLkr+U/EHJxVLz8CLZM+UAN/U37d9aE7aUJcTysl2jU?=
 =?us-ascii?Q?CwOVe7ITgifKHbx7raDh0YqPx+/d0pqhVl+7S4SVixbe0E8W6OqPARIFPl2U?=
 =?us-ascii?Q?1U2fqWlpOODH/AtX7Gt50Arc4nnYYbxI5o10PXzTkTP/qQCdGRvElsbEG6ic?=
 =?us-ascii?Q?UeEi7Zp2ek8ct/lOnuVgHaWTsWQbsjm6Vxyy1cK476Dif3sYC6eHY2aTIwjf?=
 =?us-ascii?Q?nNGEpwxDguURl4B/EXiy/5H3FJE4CQWDSa8+ZDjdpnVlfpQYUvhzF2wk46LD?=
 =?us-ascii?Q?S4ldvi1Hs7HvszUL+9BJXmfysrCOS4zCKQBaOJghmcAXOMlwB/G4dBYuZnrL?=
 =?us-ascii?Q?229F+SAyqu0vGfPuZL4a2aZOmQHcMUULBx4dwS7N/jbvtNCHEjbnHSysmXbs?=
 =?us-ascii?Q?ePOHWA/Vj3lYoWimhOcQ8dCQH0bORr6hzveVKi41OetDeGRzxSscTsrtLF7p?=
 =?us-ascii?Q?bqZqhXING1VH5qwV9MGf0rwtqxMa+2VPXYucV5Qnhnx/OCl7P9QKOcRaLpVb?=
 =?us-ascii?Q?J15IrGdXXbl8TTfriJHiapTuFj7Gax0DmtpZgZam7wDmoPXqO/H/ZspAjUMm?=
 =?us-ascii?Q?7A5bzXURGsPNrPofs2UV6DYdsz8/A1Pwhyd5br3bKrotKzjBC0BLzWv45Jvc?=
 =?us-ascii?Q?BVECk3AHUad/Yc7jaqTgA7CjJOeCuErk90mH4zXUBguph0K9TwkqQ+zueGK3?=
 =?us-ascii?Q?wj1VnerYRkpyH7WoEDdkqvj7cLnMlEA2oIqEym5evar8QQzIyzoHiBkzGRAU?=
 =?us-ascii?Q?xbkLVREg0kjPQa2OOXJ1cQPZgUTdyAzIJSv8rZEm7stCe26+anigKB6WWDWo?=
 =?us-ascii?Q?mYjiWWp+XHPPjz3MmpJ21kfXKUyqV47luCfLYumtik4cufIAYeNk0a3cr2RK?=
 =?us-ascii?Q?fq05ODr7FPoGVJgjzK6QXZ75yor49F/Awoh134s+QG26/zBOM/r27NYcFGBB?=
 =?us-ascii?Q?g/EAKjJgHGKpkLUvq9FncSTjPcPZSfGCmlzjlWacmgu+zSJ0uICg1L7B1Gv4?=
 =?us-ascii?Q?BsIgbqEAIpAT40rGZVHf02YneBT46zI1mTHgwSWRVRSfn6P5oe0OMH9ZUyEK?=
 =?us-ascii?Q?h2zEqQZnaZVhEZkb3cID4irFhuVWqNX7StcxmbXSs15kn++3Fglvp6IJ5c8Z?=
 =?us-ascii?Q?Ih4wv/OESvEcz1yCfHjt1M8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a28640da-6b25-40a3-d2c8-08dddec3f824
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 01:59:02.0895
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7DHlXNiTWc2XqAy+1qGYCYryxXHlqn5sN+GDkzFLSMzBq7NTMrwG5i7av8Hes1gl+WnI9MqMmzmngf6GVRKasURtuOuH2JXp+hvGJpskUi8ZMLUZXInygwXlMeHI1RD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13973

snd_soc_lookup_component_nolocked() is very complex today.
Let's tidyup the code.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index c1cf205e05569..cc9125ffe92ac 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -369,21 +369,25 @@ struct snd_soc_component
 *snd_soc_lookup_component_nolocked(struct device *dev, const char *driver_name)
 {
 	struct snd_soc_component *component;
-	struct snd_soc_component *found_component;
 
-	found_component = NULL;
 	for_each_component(component) {
-		if ((dev == component->dev) &&
-		    (!driver_name ||
-		     (component->driver->name &&
-		      ((component->driver->name == driver_name) ||
-		       (strcmp(component->driver->name, driver_name) == 0))))) {
-			found_component = component;
-			break;
-		}
+		if (dev != component->dev)
+			continue;
+
+		if (!driver_name)
+			return component;
+
+		if (!component->driver->name)
+			continue;
+
+		if (component->driver->name == driver_name)
+			return component;
+
+		if (strcmp(component->driver->name, driver_name) == 0)
+			return component;
 	}
 
-	return found_component;
+	return NULL;
 }
 EXPORT_SYMBOL_GPL(snd_soc_lookup_component_nolocked);
 
-- 
2.43.0

