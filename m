Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010039.outbound.protection.outlook.com [52.101.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0096F145B27
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820459; cv=fail; b=Yh38RNlPgSRX6HfwZxiMNpYtfo6TTxKUV4jAogBck5RIT2ZJGAsWXsyluUPf22SuQYI8VVg5WdmV6u4NeW/qP1MbaNXSiyda4umIc/RXZmEwa7WNRoW6RF2UD4pJ/eEzEpfiB0YgEuiQyPdA1QlELEDXgyiWKcwNe+FGBMs/MMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820459; c=relaxed/simple;
	bh=Ex50Uvs9hBaKb/tSJH8mCWbdg0w7zy785BeGuaepJpQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=l7Q4W1hx5AogG4Yc5IYTC+dw0R1dvo/iIu/3lnVLEsHwQwuryF5y4JckQ2WNxV22C/RumoCGoTzBVAaiMjz5R/XEJQ2vjBDTMUw43EpZ0GdQ7FeYAfj2CcDHY418nCAMune8a8TAziWqqL1A7OsVTg5YGL5JJYFDRvzxlzadfiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U6iChQjB; arc=fail smtp.client-ip=52.101.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U6iChQjB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8Pbwn37n2/Louc+XK06eO97baz7+pCXCnXkk3g+ArCqqkQnCaJ0vyxJs7n1VbgrsYAxNy2k1s2HOOZbkERsTrME5M1zY9GTRNnnjiFJY/RpbwXyL65R9UHGzKJDakxryFbuwUNY9juWr0EgnrBW1L78t5Z5Oq5inKd7zGGtL1mvEx5+LXkgqfc5/RV505ZlkPFz1z2npD3fNAGP3Ad/YLQw3GmUP5MLPRq7UGXX9I7K9znwIrbanBrZPWTBLn4bK/rohGbL8m/gtHdwyKIU9tpUmn7W7U6ipd0mg5fJ2oMBzi2Bp+5QgIUYyFIlDvQXxgBeBWt/BhXP9CLBjfT3Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysVD5JVX2g66WNuajhsdp0y5workFHynDyxkAl/xnxE=;
 b=qutKyMClfKPgh100f/JeM8rNSfQLoyAlFypX5lVURf6HKlq+qEEk3Ji3Y3a92dEkT+8dMFLMZMfqSaw4GgIXqywbnVAhMxANjFi3njcD4Ve+5ohzc/lWPm77TkH+i8q15+MPUltbNQGGt61qNtVEXQDDHmcDP/nfBLPofYl36pwGwiTWbFTJjxA6OX+pocmc23z7mdZMlEsNiKtVD77T86jYcQa2iMHso+xO/0qM4t9ALTobixLWPz4SHhL8mmFVNGQttm5+8XP/KDIp6mB7Zb2GJp2mWi3sjzj7FH1Udrp/2xYNqj142X5kDyi0C9SEmOx1GV7uNSXELFDRL0/WbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysVD5JVX2g66WNuajhsdp0y5workFHynDyxkAl/xnxE=;
 b=U6iChQjB+4iO7Qq5f3a8RGTk12lpe1ilteTw6kRpOzn2LXZY3KXRUKq8BBLH1qKrIo3MUkLd4vH4Ornh/JtJnAO1HIsfg9DOyEUo0dApOn1F2sbFtKC3qMWeCQ1EwmpMUyerMWQfkzNm9RQKJ8JBiLey1CV885N62C2xkJTW39c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:20:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:20:55 +0000
Message-ID: <87o6p9772x.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 041/292] ASoC: codecs: cs42l73: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:20:54 +0000
X-ClientProxiedBy: TYCP286CA0164.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3a4a1f-56d3-4fce-f30c-08de20b82dd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NduOMv/GvMhu2FkPABgazct5EQKm4kumoudgUOhSoS8ujzUGHGWEFEHxXKDp?=
 =?us-ascii?Q?mKY/a/9K/HZ3Gav4NdvOashyYxmsbDf0IJMLuVIqpiOz1KyKPn5JTC69asJh?=
 =?us-ascii?Q?eYDmO5UUO8AT/WAYJzPVANtBcr5Q8Hom90m56d8rTAxmXOCIjGiU4sW9pVs7?=
 =?us-ascii?Q?jji1rKRS7W1E54SA2emDRGjzbaaOe4C18R385c/JiHnh62WMzFsD/95WlQ7A?=
 =?us-ascii?Q?qgw69q3LOzWoBI6+IvQ0oIOa7brlZyZOJHz2UutYIN0E31kss8FmhjkQLUgn?=
 =?us-ascii?Q?ya6Fe6o+3hmCa51t42l6/2sV54kcYpZf/JTQW3ZTsu/mRHapsb3xLraIsYk9?=
 =?us-ascii?Q?5U5hBktjx12pF4yacnxAGGZEHvYoLT3FtaugriIRrf8fJrVcibYNaBWxXLys?=
 =?us-ascii?Q?HQbnNdKkzu6z6r24GGwGT+4PWlOAM7R/awQcR0ZfjvVSCWpFfT1zWLl7CGOI?=
 =?us-ascii?Q?98ztbeK3qxybt5X46srA65aFGlbaig3KlBV5zbCuicmTyanBfI9geWkzYdHS?=
 =?us-ascii?Q?jSqSvN/pp1bPChyolB7xHmE+1gZrbLNNCk8X5pJfgWqlekC67rL+MrctBSfj?=
 =?us-ascii?Q?3P4byo6UNNBwcbdckpMJeGOTwhQc3Zikli6UmNagjJuO9SssxI+13HuiyT6p?=
 =?us-ascii?Q?9YOrMAe5ls1hP6EvyRu3J/90FwMG6BAJ2jC2y/d8d+3tCGzvgpqR1+YXxLYo?=
 =?us-ascii?Q?ZL/W2ItOHciwNoQXRKvXG+MRGkRwMoDXWB8w/r8eTkYAfr2Yoyc9C3vU3Ef4?=
 =?us-ascii?Q?eYj0LsT8lZpsBmDZJKj1n8DEsV9BUVEiyCCQBAnuTm7gV87R+X/ukVOI9YEz?=
 =?us-ascii?Q?yFNUCwnZLVgrm83HQqALHRQsYTSeJhH9VaqJR0BdtfuCx71PiFcqHmzUB2+A?=
 =?us-ascii?Q?OTnkIPNbHb6vWQ6Fsjuh7HQviwJsS/SNc7Ev+VQKT9S1Xb4nBijI3PDSr8lZ?=
 =?us-ascii?Q?O7rP3v+w8Z6JReovXjpV6Csbs1/+MWXYCkrFSUTbxtvab+p2/ERxPg9BGtTl?=
 =?us-ascii?Q?AjSDrokRZJboega9FubfvlLVhA0PCT6f774JHQHH8XWhhk76ZT5NJJbx1rd0?=
 =?us-ascii?Q?fPM7hq37jxEujv4M04D511DZo6roZe7TdRFuot9n5yMliAmH9J1zG7UpSMkq?=
 =?us-ascii?Q?HaGWoDMNv8B07y/iXu55GqrfTBMh272KsNdW/nmd06/bWaZEW/sMCPMg5Q07?=
 =?us-ascii?Q?NtDIlNKspjacqn+E4Yxfqr0yDIu9YPjtAH2vA8j9loj804sqijoqylAOeALU?=
 =?us-ascii?Q?p8SNkriEDC1oml33BXqY6BLoXsA9VjUZ0lKinX1zzWF8l2PGOWn3flKddCqK?=
 =?us-ascii?Q?PsM5zV21szoq76oFSv2dKif3clwAGOp8OFKAOL4ii9CcaXAAM2tW2J04pK5w?=
 =?us-ascii?Q?WGsjCcVE02G2/zkOADhRD6r9rbDXUU+nIlIF78FAaE50jeevzjAAkEaO3hQP?=
 =?us-ascii?Q?rD/zDkxNa3/2UICFExmU1+hxEv7hOVo4AiqeoB5Od4bhsRrgRNO8N+cHZJ0m?=
 =?us-ascii?Q?XL/CgYkIuIkzNVOzKoMyKbJubJkfObdfyXFw?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?sl9fmTm4X5j2/FWIR/9LqGjZAUw6MZMlhvyaNjU6YqoM0M4rZ8m96p2HSANg?=
 =?us-ascii?Q?ls4EXOsqUHmfTXp2sW2grkTUG5lu3FOBxOI7W00v/wGka73mFVBidIOkWT9Y?=
 =?us-ascii?Q?SHefhvtcFaxVbubsP7TtYl6AfJ4NdjWNGTkHC9IfUenmvY/BZDCZNmA/mNf1?=
 =?us-ascii?Q?uO43T1oEihOXkm2W6hePxJt2wZ60SAqYQ6j5UM7+k3kHZgzID0+YJHgzI5gy?=
 =?us-ascii?Q?ps6syplT4FijhT6pKJhbFuZE5VwmxYG+hbwUnEZny9699pSXCLRxBmx3Gxuz?=
 =?us-ascii?Q?HidiB4MKLM+zmVLG3V1nmHf9lHMJ55h4bOb9FzAERIm0uJLeKw4IsyOYFNiq?=
 =?us-ascii?Q?/x/ASBNNB4p0B8v9P7xAAOO18IhDmTcu5WJhrR/iWkVHKaj1AyXZjU5LsQ95?=
 =?us-ascii?Q?eEsAy5n5P04R+GWb94Zuu/kZmEH/GqTZmlXIEGo4Ywyer6mXRDg9xvLSmYXi?=
 =?us-ascii?Q?bvg327oIH3ZLCydyrJbYp/TMw71bZ4cSZ6oWjDSTjUZzbrh4XriBK19V42vp?=
 =?us-ascii?Q?wlAq0mD6Ivde9TmLafUl1bS9LRa5mGogJ+ZtnyOigN/51Wz91MlLEMh4kyUh?=
 =?us-ascii?Q?3ycTpfM1nIhl/Umn6o5CrGaokTv+AuVSEF7CBXeRr/7VhDBoOxWXsoqrQG6W?=
 =?us-ascii?Q?E/tN9avevm4ybldtPeIkkBtsMfj36YKVyhiBXaQZbuCKZt0MNkyBIocTTENv?=
 =?us-ascii?Q?K5LIVCqV7iJcYtFucXa5ztitJEFTW7gmn4EbQDJKKIf5Rqfn8fbHL4t70FRS?=
 =?us-ascii?Q?y8ZAjeU9pqjt+UUBE9lhhMANNgBT7jgCDk3l+lLI68ljUWohvDX/ovJHj2Kx?=
 =?us-ascii?Q?FpoghZiFx4F3xDrxMvD4IKuyZgpnxcO5OPIWxeAm4R1ykW5f4mQ14/dsYZXP?=
 =?us-ascii?Q?F1eoYZBnlxqjBrTdJCSKaGBdMsZjtEZtDV9G8uXluOtISrAcaNxtqyxPDgQ7?=
 =?us-ascii?Q?HgW8t2HSfUoQA0SuFfPF2onY+q0xvc+9Z+K3QngjWqG2in6lT0odlcIAM0j/?=
 =?us-ascii?Q?Yi0O/NVN/4tjPje5KAIFU0oAnhrAm4cWvIGVVubjXylun+Fb+ijE6UjOCh5j?=
 =?us-ascii?Q?vvgO7xiEoxiqRIjHKrD5t9Y3Wcixjs+ajgiAuKtSI2CafSltnEw1XQPbt2LJ?=
 =?us-ascii?Q?9PJ/cICbQXH2jIWtLCpDBmdgAZQqcJSR03qn60De6Pv7D+gnub9FJy2WF+Jh?=
 =?us-ascii?Q?CX2roUDs+LAW4VvTNU4XXnFJYAldmTqRarCLJ5hCIO849cpGR4iAAUxsSAbt?=
 =?us-ascii?Q?7Tl1hEj5v+nl4BtI/lH86nJguC13zv+PBsGDnlTUkxt+uVLcZGt9Ofw3wKAY?=
 =?us-ascii?Q?E+UqTZLN8LOaN7PbAvERvGdiHaNM3Ls4a5JDVdScgkId6k1UlrFr5QL9SkeJ?=
 =?us-ascii?Q?gX63ayZOHzOnUMTb9wtGFbgCozLjgKGY4vOc5Y2+dYODTaB7zItweXao8rKw?=
 =?us-ascii?Q?7LJzcIQZwe5NH3Te3kvVMNoNNpZZR/ZCrGsuNh8ecf0DIHzAyL+LU/PIExaz?=
 =?us-ascii?Q?pYcSOyI3j+qgzaoYzPJX/nYcF5fbtL5mNJ09JliSfyykQrh4cU0nSFKHdojL?=
 =?us-ascii?Q?6fndV4LGxl8XqqRhA+JdXZzoa+Efgvvg/khS3Pa6592/NWHEZSqLKLOq568V?=
 =?us-ascii?Q?8h1x6VHZZbCqYNuCb27qcYQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3a4a1f-56d3-4fce-f30c-08de20b82dd8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:20:54.9875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ly8sGpvGEcRmSrGg+Iy2PXQ1ju2EUJyjL541ssvpmDWJK9mli+LxyMsO/5rYIFtCSwVlFSGJtjjY7Pc3OspHJeBcfPClcwxuMj8yTnhjKSD9td7mOwDZjE2cAbRv1uqY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

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
 sound/soc/codecs/cs42l73.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs42l73.c b/sound/soc/codecs/cs42l73.c
index 535a867f9f2a6..bda8442c1d661 100644
--- a/sound/soc/codecs/cs42l73.c
+++ b/sound/soc/codecs/cs42l73.c
@@ -1101,6 +1101,7 @@ static int cs42l73_set_bias_level(struct snd_soc_component *component,
 				  enum snd_soc_bias_level level)
 {
 	struct cs42l73_private *cs42l73 = snd_soc_component_get_drvdata(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
 	switch (level) {
 	case SND_SOC_BIAS_ON:
@@ -1112,7 +1113,7 @@ static int cs42l73_set_bias_level(struct snd_soc_component *component,
 		break;
 
 	case SND_SOC_BIAS_STANDBY:
-		if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+		if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 			regcache_cache_only(cs42l73->regmap, false);
 			regcache_sync(cs42l73->regmap);
 		}
-- 
2.43.0

