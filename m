Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011070.outbound.protection.outlook.com [40.107.74.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D8D25DB1A
	for <linux-sound@vger.kernel.org>; Tue, 10 Jun 2025 04:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749529373; cv=fail; b=GOs5UB5oO9rEWk3opzsvQbt45+mavrJ9zNuzTA1tsApPLjEFaH/zerHJUSMT70+zQwqUR02IUNGWJoSLFb1BYuQTygGRfQh6IdjP+9va/NGWZfLZr6qqat2xn+TadEAzRtUTQyJjQ8wFJNAqAbXxnNntL56kztg3a6+BBSCAyUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749529373; c=relaxed/simple;
	bh=ucE5MYZ+VuWqISJs6qRcgw3SumbSeIxrVZpdAm+ceL8=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=tk/3xZ56JRbkFtO9VZYUX0B9cAILOZ6aRPZm6svjl2X4j0R4kb79HBG6OW521TG2NX0CkujhC2bGagF6P7SkYCj7GI9zFGRhmniYx7a04xhNOCKqnILrW0Ol4EovY1eAJHxxV19BtoBiC7qKor13vevP2qktbrZgRzRhE2qm/4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=IHoEtCgz; arc=fail smtp.client-ip=40.107.74.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="IHoEtCgz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hy0IJRBomT+H3QtiM0F4JeGMAS4Wte3c4HIG4gbghFIi5N4bApON6pZQtLo/s76VLEW501OKdTtWxLyOrstCK44YpGWN7bEH8Tqy0hrCzXl+IXiWTmkLT8RQHPjQOWbzUypPMQq6qLzXwIz0rAUUnyc3iMzLQhjmD4iN2XvGEYQ9cUs15bVxcqLgYSOgZeYIsMFQHfrvbzo4GI42ix5Mzj7wduJN2B83elnN68NrFyKnWw5qOrSjfscwMGzwxtVUDCeeVR5qgsXq3RCTf4Ll1cPkatLNguH+ij55gW+zhQxrO6GlxZqD4A4cK+W+LoNj6kSkQIzk/KJUgXP0lv26Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aSAtHHLn7dICyK2taHqUG7yuN+n3Dn66o4ZbjpFaK8=;
 b=D41aaF2PppmGZ1HQ+zszyy1yEGcpjyrgn0d8hRRxigKC+OZa8WBOTO0YZeahscV1F6xvi5IGVwDNn4NjodZgdXIZ3WL9cXaxcUkVDd8U/uFwJQMfTBwGXcvSVdHBI1CkHIl0uCQSDAQUeoSWkI5IDhi4YS1z9V4Y4JjG2l4BKrKA08L/tvu6J//P7nIkhBgG3C2jwqgCT4+Evx/0iidHXCy4axX5nIlTFQsgR0ynhviP1ecwJtqd222PE0I25MmHbwsIOAMSBFRVVxukmZ10i/gkUHog1UycgdWR0FyEWs1UenZBMjp6Ojhuxq3Td69LUtl1+2Tyvwa57W1T9Se/dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aSAtHHLn7dICyK2taHqUG7yuN+n3Dn66o4ZbjpFaK8=;
 b=IHoEtCgzv4dYqxzwcR7VSRS0DzrVN67qZX6KQk9epUjtP1dVrAku6wTNnw/LstS5GZjE4C2lLBktoYJxKAmbXcwr9m4oQnIpXcxfQFsIT3HaKTLVdlplGHnLD3fMvfALvHfnx4HjoUAi8nq5il7gP6exO4IU9UcAb+kMgy9JJOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12373.jpnprd01.prod.outlook.com
 (2603:1096:604:2e8::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.31; Tue, 10 Jun
 2025 04:22:49 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%6]) with mapi id 15.20.8813.024; Tue, 10 Jun 2025
 04:22:49 +0000
Message-ID: <878qm06x9j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,	Jaroslav Kysela <perex@perex.cz>,
	=?ISO-8859-2?Q?=22Martin_Povi=B9er=22?= <povik+lin@cutebit.org>,	Claudiu
 Beznea <claudiu.beznea@tuxon.dev>,	Andrei Simion
 <andrei.simion@microchip.com>,	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,	Cezary Rojewski
 <cezary.rojewski@intel.com>,	Peter Ujfalusi
 <peter.ujfalusi@linux.intel.com>,	Bard Liao
 <yung-chuan.liao@linux.intel.com>,	Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>,	Kai Vehmanen
 <kai.vehmanen@linux.intel.com>,	Pierre-Louis Bossart
 <pierre-louis.bossart@linux.dev>,	Paul Cercueil <paul@crapouillou.net>,
	Shawn Guo <shawnguo@kernel.org>,	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,	Fabio Estevam
 <festevam@gmail.com>,	Daniel Mack <daniel@zonque.org>,	Haojian Zhuang
 <haojian.zhuang@gmail.com>,	Robert Jarzmik <robert.jarzmik@free.fr>,	Heiko
 Stuebner <heiko@sntech.de>,	Daniel Baluta <daniel.baluta@nxp.com>,	Orson
 Zhai <orsonzhai@gmail.com>,	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,	Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>,	Olivier Moysan
 <olivier.moysan@foss.st.com>,	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,	Chen-Yu Tsai
 <wens@csie.org>,	Jernej Skrabec <jernej.skrabec@gmail.com>,	Samuel Holland
 <samuel@sholland.org>,	Thierry Reding <thierry.reding@gmail.com>,	Jonathan
 Hunter <jonathanh@nvidia.com>,	Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>,	Masami Hiramatsu <mhiramat@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,	Michal Simek
 <michal.simek@amd.com>,	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,	Mario
 Limonciello <mario.limonciello@amd.com>,	Yu-Chun Lin
 <eleanor15x@gmail.com>,	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,	Nikita
 Shubin <nikita.shubin@maquefel.me>,	Arnd Bergmann <arnd@arndb.de>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,	Vinod Koul
 <vkoul@kernel.org>,	Shengjiu Wang <shengjiu.wang@nxp.com>,	Piotr
 Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,	Sudeep Holla
 <sudeep.holla@arm.com>,	Elinor Montmasson
 <elinor.montmasson@savoirfairelinux.com>,	Binbin Zhou
 <zhoubinbin@loongson.cn>,	Keguang Zhang <keguang.zhang@gmail.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,	=?ISO-8859-1?Q?=22N=EDcolas_F?=
 =?ISO-8859-1?Q?=2E_R=2E_A=2E_Prado=22?= <nfraprado@collabora.com>,	Geert
 Uytterhoeven <geert+renesas@glider.be>,	Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>,	Sameer Pujar <spujar@nvidia.com>
Cc: linux-sound@vger.kernel.org
Subject: [PATCH 27/37] ASoC: xtensa: Standardize ASoC menu
In-Reply-To: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
References: <8734c8bf3l.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Jun 2025 04:22:48 +0000
X-ClientProxiedBy: TYCPR01CA0132.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: a7b21be6-8579-44b7-a781-08dda7d6758f
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014|921020|41080700001;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?78dSdjGd9Sbi3fHtjeEtuezQpc+ICeyfHbt0CnQnR6gtGCUqk0ltHxrfY+5J?=
 =?us-ascii?Q?bG7vxPRAbA+ti2rw+uio1tB6iNyKZazJZB0breosoih4FCblI5JM2ZhWWCHd?=
 =?us-ascii?Q?UWO1mZkMfJ08T2M1jR3xJ0lnBnSVphrXEM1D3Kmop+4uLF5E0FRbnY6mrmHN?=
 =?us-ascii?Q?EOpyNh8VTIRucwfCikuiDeezpDT+hCC94Ck6hHK+dCYSC+9CQ6M5kOGmSwD5?=
 =?us-ascii?Q?A8XHkUKRV1t0ngUwnYNvtkNCodsDFZcf+HL/8zVDafkCf/+x62Gjd8KyBhTD?=
 =?us-ascii?Q?mafhcqXNnGZAmDw5+WjrdM+TqRGmEHnzq/zcL+FV8MoI5K+WLGt9PYW4wBu+?=
 =?us-ascii?Q?0wa6o+Be2eCNlw0sIFfDPbM/McntFm1KthAeyR3HFRuHD8L45bECKx61FVTQ?=
 =?us-ascii?Q?4SY8RWHl2uKY0UmOu1L2AYA1paXhv24MsxvYEHsAkMpSH+bakV9qfBsHuBVh?=
 =?us-ascii?Q?OV4NSkAHtylGG4SvQL/oy9uM1Ol2lgzDwrmz5psQimbE2TI+kuobgVqT0n0w?=
 =?us-ascii?Q?TNkvS2M1/Ozzji93ue1k8ai2GM9m5vqqKmBWlVSojchKE5hu8/S+2AW2mkhR?=
 =?us-ascii?Q?0mjvYJ1809zdfHPCKVi1ZfghMab4TooOpXDcFwoTCNYXJbaMH1pW0ni4AjeZ?=
 =?us-ascii?Q?zmpIXd80FUqCs1WTbbeoY7PefQV7Xn8Umydj+8xFV3rrW6UA8N4bPlXD5O06?=
 =?us-ascii?Q?n5UEo4vSiw9/2rSYIZGr+iVhZkM7JBnnTDXmFmIUjzQBfPXyxP+GgzrBuI0z?=
 =?us-ascii?Q?zHZ+CXTK75cmKCWmQ65zWJvounA0q1eohqEtpbU5RQ6EeIZIupURGh1vmZxr?=
 =?us-ascii?Q?5H4ER6epiKb6p0rOa/VwmVFFBFY1Df9VukPZYgeHBez70jpr3cIxWRqa+y4l?=
 =?us-ascii?Q?E7HMFD1EyarUxbxhdD9fbe2x5xxgPVjkcKVS1QQ5wJDMKSJTeNQohCgCTYwQ?=
 =?us-ascii?Q?PP9nxPznDV0khlP35UyiSuMJgs9Qldfeu/Np3RZIUUeLAnoMFlxjkTTG2NEh?=
 =?us-ascii?Q?5w/RD0pmY/ULiiO3Vlfz1Hb3i8yWwTRl6ZpCNOShSJRzSRBCh3Sc5z7SyXCn?=
 =?us-ascii?Q?eqDoYoulEFc0M/tQOvoODvADmWQXyQVljr+6/GkT0IbP+tIbuCcj5Mg0lniB?=
 =?us-ascii?Q?OtAJo13zJvMKR30lZgtE666cfdQD8qn2XJ4AH1Q2E8wiH7X0O+Qbv023Bo2m?=
 =?us-ascii?Q?C5ILtG5Ju/XBrj0q+RxFFYTWB6XY7Krrfo/R2krD9a0YNkobHfsDqqPfImfK?=
 =?us-ascii?Q?hXZyOC0F1NrhG5FgCzWKz3fLoFA8tJPUpp9UEpFAOXyYTS8ytFpjvB4r7AHJ?=
 =?us-ascii?Q?yY4s042nJjVgPRMfz9RlvvCUYbJv7OPBGZX9ORwEY1WTH5kXOufN3mb8J3Dy?=
 =?us-ascii?Q?lsoYt1OC21mp49JsB4seA5xPwcnjUzg1dOxHmIUSSBO2OUk7G8+dCGw/PGkZ?=
 =?us-ascii?Q?FBc2IfhNjdSSxXpwnG9aJ62/vj2lWQl24hwnU6QTrc4i6IJ0XZPVJTTyAwpI?=
 =?us-ascii?Q?qMkiop6dwu/gHyQEUEUX3MU0TfgRGhQ1VYLmZRXR6neYOjzo7U55vGiupA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014)(921020)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FlgzPO3lTkMKlapbxHMh2S/QUy21Sq1SdvRQbwigk0b/CEj0E6nla8N82ghV?=
 =?us-ascii?Q?tsiAO5clqnQIkbqOL8SawCmJ51IgNUwgv2HkKcVDiUad3NSwS54Si8GWdk89?=
 =?us-ascii?Q?aUYxy6NG2YAusmMu8w+3wEJWTb6vGG9MM+y9DDUrwwPSqAvhL/1vc3MXnTUS?=
 =?us-ascii?Q?ve9yJHhu8zU5aXidAuudEFvzsc/2KXbylV5e9GMYGzAJ0EGrpmQ8C+FM8LDi?=
 =?us-ascii?Q?7zw4+CsORhzW91pyYwVMUuzcysq9NurfUA57LcfvPYSgTj8SRVBjJdC2+Iho?=
 =?us-ascii?Q?nJwHlhl4SVWeLo53zM9z6VC9n9HdwVcUvBVL+YfPoVvs4WR9k+azoktrUnCz?=
 =?us-ascii?Q?ZCuv9ZRtCKD7zU11o3pghitITf4lVS8kc64YHoJyjhIOBlJgjXQrRD5dvOYV?=
 =?us-ascii?Q?S361Lu3DdatC5llVq/YDse/1X4JSOvztLve3CviDzXhXLcxDn2jTb1QVR0tw?=
 =?us-ascii?Q?R7IR/Ek4va93juaOnClaGj9f4JGrzatIewsdnkbqpIi0dHQE6IJwXgakLouZ?=
 =?us-ascii?Q?UtyJ5OpY/Az1bcUjIjqVKix/khV+OjaQKTZgbS8J1W87LYheUjLG/stOUWlO?=
 =?us-ascii?Q?bT645SIRh+QFKClg81s6+IjRlobY2Y7Ua100SDAIoBh9Kj8p01tr5VMj4gE9?=
 =?us-ascii?Q?c/gqPbmztrvGI2o53r7tgbz/Rf+xIcIhaIggQiVMwfDQME4/8uFl4My/G8NZ?=
 =?us-ascii?Q?5+rELh9cJVllWWp58BD7y1lfXJ5GA/XbZSV9IdoDxU6rGJ3kjpCaBsv0D+01?=
 =?us-ascii?Q?3YggNKG5tGSgZ5WMwZBIdtnlj063LBeSJqucd/wDUpO+Pk50mxlpXhH+JgY/?=
 =?us-ascii?Q?YeiTd1ESiW1mc1OHUj6/7eTU/WDfbtzNBx21RRbN63dRr355HCJsCpc2yvz/?=
 =?us-ascii?Q?8/EVTlj/EcxDLImfsnzSc+t5Kn2PTBoVcqHnPoygeq7Cz2tgFF8A0V1lRlZr?=
 =?us-ascii?Q?FYaEnZk+pGQ84Awd1W7rW0OJw5yEn43soUw3tnt/dj7o/mhgmkZLZX92c4R3?=
 =?us-ascii?Q?H4eHXPE9E27/hlIToZ/TZmVSEXdOhwLpY0QVQjTMdk/AHmGZ++o30TzgoCmi?=
 =?us-ascii?Q?N9eUvQ8487dzy104sB1PajDR2V1AwS2idZawHhaZYGahVCrwgnUcoQeKDL5g?=
 =?us-ascii?Q?DZibrT75WQvJ6WylS9sw3zSBzKotC4eMhiKzf2lI8xI2KeJe03ubOD+iLhDD?=
 =?us-ascii?Q?oMyk98oBbFN3fGkHb4tAVkEuNF7Z9RhLlo7rGNYUaC22Wnch/T+6XgGsqPhS?=
 =?us-ascii?Q?ai4fLkdnoNJZjuBBEQbFDrB7Z8Gfe8q0EZu3msBNK4k7pgMg3XJfmPVbL/zm?=
 =?us-ascii?Q?UdmVR0uMqtA2gQJfiBf6WQNxqxhFqWZVvZEYTMmf5tPUql+NBaFM/KhNvkeJ?=
 =?us-ascii?Q?WIvMvqOxVaPihkpa3aaa3EHB4UZCLfg6pUYDvMVCnkGs7fN5rBwyPB+lYkoj?=
 =?us-ascii?Q?KACTS3pkORDfvbbLeMaQ4H4zO2XM5Pq/zhWkx9hQ1L8FPt4sweDtIOtbmaep?=
 =?us-ascii?Q?2f7vPhTd3o1gM+jTysYnQyHkDALAr8pgki8wF370GeLeLtS3KIAQo0542TWQ?=
 =?us-ascii?Q?GYPAP5+W8NXWfC8G8Fnbi52JHHv1pZDh7mHCH7gSvxWnZpl9j0vUNUt0HAfq?=
 =?us-ascii?Q?ZWEhGjgY9ixpW1NJxM1Gu+E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7b21be6-8579-44b7-a781-08dda7d6758f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 04:22:49.5183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C6AZAqJOhlzkgSh7K0BgzZfm8WdKNOFlrS4hRulvux+nR/3PbhKUI0os81D1K8PSjZuICdO+daoZPsAQlFYKxABenOjdT4XvuhfQhBA5vEyjJhVCMgUeIQy3Q45HFcBv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

Current Kconfig menu at [ALSA for SoC audio support] has no rules.
So, some venders are using menu style, some venders are listed each drivers
on top page, etc. It is difficult to find target vender and/or drivers
because it is very random.

Let's standardize ASoC menu

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/xtensa/Kconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/xtensa/Kconfig b/sound/soc/xtensa/Kconfig
index 74b778f186cef..83db5e60cb02c 100644
--- a/sound/soc/xtensa/Kconfig
+++ b/sound/soc/xtensa/Kconfig
@@ -1,4 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+menu "ASoC support for Xtensa"
+
 config SND_SOC_XTFPGA_I2S
 	tristate "XTFPGA I2S master"
 	select REGMAP_MMIO
@@ -6,3 +8,5 @@ config SND_SOC_XTFPGA_I2S
 	  Say Y or M if you want to add support for codecs attached to the
 	  I2S interface on XTFPGA daughter board. You will also need to select
 	  the drivers for the rest of XTFPGA audio subsystem.
+
+endmenu
-- 
2.43.0

