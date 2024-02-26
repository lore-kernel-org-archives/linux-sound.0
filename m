Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01olkn2090.outbound.protection.outlook.com [40.92.52.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8594128368
	for <linux-sound@vger.kernel.org>; Mon, 26 Feb 2024 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.52.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708954226; cv=fail; b=V3WN6JyqpFLuv+ogUmow+e/id/O54ajtpw54zYsslySU/J7PdA00+IhUKs/JjlFbdexfxeqKwJoFCCR1mZ3Gd4+OUGGWONa1WzlqRA6cjMNgBzdxnGFTD0nPvdzi03e9KfwwUzqmyoa9+Bs7O7I8tcR4fzNkID7hEt1hv+tQf8A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708954226; c=relaxed/simple;
	bh=xfBeeAs2GXC+qeIkoSHJKtSTMCMkKk9fw4is9n0zIRo=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=p1KsQfTUcap8sjfRod4bOHZPv4Q4XN4e7oSxD0dKC+HXk7RA0xexdDFFU4fotGis/gqknwxXaxZ68Mt2CDP8by0Rz5aNpXF22f8NNlVNfvDZes1f/Wvy7End+cPMk4MO7JIXs4R05AjOElD9vtfDNOk8Yho7yG8gyBorJr7TBdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=aQdBHx9X; arc=fail smtp.client-ip=40.92.52.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="aQdBHx9X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NDoIlSVXsMXTU/F2bV+xdSkXozZB88V+7s8+HThz0W6Ifq+BXjPtYw3Mu98PjqqetOVJbg9MHZ9OYHyi0GaJNMmi6fzDds802r+nlabhH4o+VnTE/6/9MVrZ1dUvIhindTW+Lq/fsvW9P6hnaqZVzZw0M8LMKqlKn/LkFuJbZr4PUQMbpdqdzi/qRBYPytTvOfjupAcWGSPNHSLe5UgEep1aDMv0ezxmnBfUDz4S+e32anL6XkUoKP4B97/AlTUIbVpwrM4NCEu/VfQBexCv/onbwy40d66afdS7oy8PRiA0QdvCNLzeSJMAjtLQhlyk2Z9OhHgULrCZjV4PHcjB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3V1vfk5GI2/cV6h+dGADzPFlu+EpQDE0GrZWcifoqg=;
 b=lkRsl3mGj9LAEXzdoyDYdYDvRdRiutjxfhRJTuPYpNq/ut4ITQeKmGGB6JDvNKzE+k8Voknz3mJEeD2qnywAnFLg+8dRJXjEEP1SLMJvOgmLBpjrEDaOr8KAC32gnxqyswCbec9Hc61p4j68KIpbp3lNKMQnPjQ7c1YZ48y1gxZdNUVB+weAXF7ttfOvjUj7bQ8PnPDeBp1DKruoF34aIrb/EsEIsN5ESDtzIlP2kG6ufriC0095T+S8WoD8hDcWj4uzV5J7e2oFlYMiNkuvhrVqzu3JqibpbnRzdLvwvL31qXWK8pkmgqboP/bB3bAtRMZkzd878XM1bLUsLQN0mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3V1vfk5GI2/cV6h+dGADzPFlu+EpQDE0GrZWcifoqg=;
 b=aQdBHx9X89o79rCG6O8P8uTiRB82pqRMIiAh9EBFx7dpsUb9EdaoNmVASMC63zqT5Js9xOLDDgsjv8bL1IgPFO3V7csMaFxo5j/zMZfkCGzoVKwfzC0SMFssTM6fb66TRkFlrGuZXTOvrTTzSEGJci+oD+dUSggb5KLtJWM+RYZewPr0H8SgQL1xlKr8pcjw7XVunI3Qvt7/ftvAayDAw6aWTRyVvIdgc1Pra+4lEB/LBhCOdBI1CsTRPaz+F/m+HBCaAUNq/axO2OX6786euyzFPBQrTAQZ2EuJjCjaz5FIhd+9HTZBYCbTYLOQwPnYEtjZjIdBrGwwr/SViDCn7g==
Received: from TYSPR04MB8429.apcprd04.prod.outlook.com (2603:1096:405:d0::9)
 by SEYPR04MB7426.apcprd04.prod.outlook.com (2603:1096:101:174::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 13:30:21 +0000
Received: from TYSPR04MB8429.apcprd04.prod.outlook.com
 ([fe80::b04f:2d88:3925:de09]) by TYSPR04MB8429.apcprd04.prod.outlook.com
 ([fe80::b04f:2d88:3925:de09%4]) with mapi id 15.20.7316.031; Mon, 26 Feb 2024
 13:30:21 +0000
From: Johnny Hsieh <mnixry@outlook.com>
To: Mark Brown <broonie@kernel.org>
Cc: Johnny Hsieh <mnixry@outlook.com>,
	linux-sound@vger.kernel.org
Subject: [PATCH] ASoC: amd: yc: Add Lenovo ThinkBook 21J0 into DMI quirk table
Date: Mon, 26 Feb 2024 21:27:32 +0800
Message-ID:
 <TYSPR04MB8429E5883243B650AF86A030C55A2@TYSPR04MB8429.apcprd04.prod.outlook.com>
X-Mailer: git-send-email 2.44.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Jht+OS4FL59zgGa23nofFJloc8y45p9c]
X-ClientProxiedBy: JNAP275CA0072.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::23)
 To TYSPR04MB8429.apcprd04.prod.outlook.com (2603:1096:405:d0::9)
X-Microsoft-Original-Message-ID: <20240226132732.36089-1-mnixry@outlook.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR04MB8429:EE_|SEYPR04MB7426:EE_
X-MS-Office365-Filtering-Correlation-Id: 9504b37d-66dd-47e7-f905-08dc36cf1487
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v6wzYyT4t8LipIaqEuB36WwLO2JbvRpQ6XuSrl6ASdBWp6FvCp/Y4RIsAI1Kc/iZ+lb0qaT7GBMENV3BORPFypZH44XtoMiZbdxIUY7TeZc52r2CpzkDwcDw2IkEAZhOLgxAd03lPnNHXgHjeYLKakQlWnCBiogs4C+Do8WjVLvfleWaVOR1Us3ndLRyxZ1IfdXGXCJGuFW+EIvfox1HUL6gHNDO22x35snWhj4nLryHv0MfV6H8ssar/4ZT2AIEHySRAeQE5EOOXf1tP+ZhJ9vGdPmT3lupJZ+ro/IeOBmMtPxDDTrSvJbZtc97SFkqf053Yq9/5iO+n9Utj//DBod8KNDAPZFlQc/dEJEgjvm8+xpsWrqjS+8FeTgarqhrOiBi6dt8OSc2mz377dn9mbm3cyYlNDMuYpZoWY7w8WncSdu76QknyOM8N7+jxBdzqAVdQiGL/riGujQlcGsAhR7FCa7PWVwtGei39Dn+/XTjDPI7s52rNOSZh+bClNi9mnVVndIyLURziKe3iPbjc0fnX2aLAlubjL2rBATgokwsF/iX/TjTU1DkBGYEiGJxGuT0t8Alexgr0HJpOR5DqzpaMr0oRJupvq/236mNrNF7HTlZ34Hf5FwgsaVAbBhN
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Qc3bqxQhGACr2HW5sr3JPvRfkbw4JvSI0jOt648jB3fblR9FXCZP8NcHsnN9?=
 =?us-ascii?Q?V9wqhxgUIs/JYLDWIpGnsU7r/NMyplXvBhA0I2oWUblaQX29ljLFlIUHA5G0?=
 =?us-ascii?Q?a3NyWHJvu8PFbYUD6e8R64XkrH64jenwchvv7aYB4rAfR/ycfhEPLuz641iS?=
 =?us-ascii?Q?BrtRS5PWxhbX/5YIjJ4OhXLLzyLuDAjwrkCeXaRuyq39Hf+0eCGjL2IuHRf5?=
 =?us-ascii?Q?jCnMbnwExZljQjNGLhIIJYw2kehwiL/rQ9dXhjkvqeISyZBhrxe+BveTnXz/?=
 =?us-ascii?Q?c3iCo3TzD8KEXM7baAdZLa/45pgJIX1PAW4hvZBPb9b3hx6TScDcl7biS7Vh?=
 =?us-ascii?Q?vyqE7FXg22yq2VOXaIpmzDVJr8ZvigSmZsTpVnOEP5S8BcpfVjUsZInAoV3V?=
 =?us-ascii?Q?zkDfkFRxB/7WJzssAK9xMltUnmTo+6JEmv5BDYCVTmiEla4Y1WV6o5uykoyd?=
 =?us-ascii?Q?YnAbGAKP7XW/O4hgtC4PkZHT+o5kkwsW7KNyKjYkXveXDyXshkz9JGMWoFsd?=
 =?us-ascii?Q?uqQlYrG6EqKOYhGg08Q5kSavOr1J/jqZ75Xe8uXKhOHgBkOBbbd/76P6z1gI?=
 =?us-ascii?Q?mnBA1GfWMyzBvYCxpV7Jgp5jlz8AGCeUCYwZ+26bAdqCXq+nK01P2rQxanx9?=
 =?us-ascii?Q?9g++0l8KJXt4JPQ33laVR1h3F57wvpajyETgcvw35xzJZDRMCP8jvx5Dxuw9?=
 =?us-ascii?Q?FSC4K7UxKczzXQJj/gh/u0nvgbTB0e9UUH/uqs+c+vvM4a2qJbB+rZyqSKcN?=
 =?us-ascii?Q?HvClyvLRLxzx7YMq1an7cy+Mye2wP+NFPyHfk/kfMbUqE/WvoPNidGFX+Dos?=
 =?us-ascii?Q?+IYZk252tY17C6vvFmElUHJ6c+GGVgC0gmfA2eZv69Y01xgBT6Mt28JzHUNU?=
 =?us-ascii?Q?G5LQYAqnTv/IsIdGQhTOOj2muuK+T+vQ8D07tiYVL0kpS+T4ksljtHu15NUq?=
 =?us-ascii?Q?HB8TmFNZLokpUHzwlpwKacAD4kJ8ZB88KcOub2S2yYwunyV1LC/R7ceNW3sI?=
 =?us-ascii?Q?mAunOS/cQw18upT4i5IRmWJuUmWSGFHW1LtzPoR/rLcjfsGIbRRZ2XQPIzMf?=
 =?us-ascii?Q?YFFAMY4raPmYhxD7Z3rBYhryMA4vmyfNyBq4cUxJqOrCROgDKMwOXyzZU7Yp?=
 =?us-ascii?Q?Z/K214AoyixmunjCtb9MuubGjIjFNRXk1V4PAJrpZL4x70SomKMWhHxB0WXU?=
 =?us-ascii?Q?L7ogHyxo3Qe4Y9bR9Ouf5RO7o4xS6C6ZIHHEmS4uyqbELkHiOutq++F704Q?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9504b37d-66dd-47e7-f905-08dc36cf1487
X-MS-Exchange-CrossTenant-AuthSource: TYSPR04MB8429.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 13:30:21.6770
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB7426

This patcha adds Lenovo 21J0 (ThinkBook 16 G5+ ARP) to the DMI quirks table
to enable internal microphone array.

Cc: linux-sound@vger.kernel.org
Signed-off-by: Johnny Hsieh <mnixry@outlook.com>
---
 sound/soc/amd/yc/acp6x-mach.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/soc/amd/yc/acp6x-mach.c b/sound/soc/amd/yc/acp6x-mach.c
index cc231185d..3d4cb3e0f 100644
--- a/sound/soc/amd/yc/acp6x-mach.c
+++ b/sound/soc/amd/yc/acp6x-mach.c
@@ -199,6 +199,13 @@ static const struct dmi_system_id yc_acp_quirk_table[] = {
 			DMI_MATCH(DMI_PRODUCT_NAME, "21HY"),
 		}
 	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "21J0"),
+		}
+	}
 	{
 		.driver_data = &acp6x_card,
 		.matches = {
-- 
2.44.0

