Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010014.outbound.protection.outlook.com [52.101.228.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F618305E02
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415588; cv=fail; b=k6UreuBd9iEF6tbQ3RbPVMhnpYrjQsv6YsCFPGk6/43K8Z2UUJhzmNWW7AkNasdgoXnNp1C0+kNlOUT+20CW7knfNrUdxIMTcRSp6aOg5Ptkg/FixEuoL81Hn2clNqXV0AX71pG11LuSqlM0S8pMEXgXCJgI8Phbunbvmi6l/kU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415588; c=relaxed/simple;
	bh=ipG9luKu2Z54NH0egBYvpvUZ2gqqaL+hdGS0BpGbzQU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=XI71HvfRJ0OHPp8cXwNPeeSdEx7HwaSFutJMxy9rFcODvpXYbNUoSWVTtDdoPp8hOZP3h1+qXnjbFiP9FdT182n6RPqQiOHs2HJG3DuygNYl1/wthFgkciS6brr/O9HWwurssNOUwKzetBx6wvGBxFXDO8C7MtEGgZhlpI7enhA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=elYWDKVM; arc=fail smtp.client-ip=52.101.228.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="elYWDKVM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a61B16mpR79p4xkeh9ha4d4pTBVZAC6iaRt1vHcLG1EU4gAg9GSMmdXss9S5ehB/Db1t6KMCh9UTvQzzISBodhbDY1VS2haOp4By6anxRgjYw2aBtjBloyJSnDtutL8wY/amOziDTy53VxpPztZMSeCZb7M5wZdWDaEwpSlmlgHnU/qcWwXHpAa8z0w5lR4p2eqOz9u0zAnFqfKvll29WClgtBsExsx7i74l3zIqOaZlUb+K0JQb+lL3Thd8bWa8kENozRzMYT9tZUeOYjvVUnHBGvn0IBNfcWo0HPhkAwp8nYklxPBbJstfHYhzuXqz0wZZ/m6Vm5r9Xl1dnfMdQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8epZfOnBrGhWhDKWFJ+s46/VY3nzwgZdGsNrSUZz0o0=;
 b=veZs30UxBbcn2tloo42nBcLhBGbs2Wc/zqmH1eaNZmfnstUK6fnSGLOy+d88G+dpJqXqwQmkAmDQqbG+Lv8fwxQHtk+P0KUXqYtKV/MATFeL22cuYKgThWPvLyKpyNiwJ7b8eEuaKaF2byiKBUfzie7WhQXdzy6E3JNSJaPnV4TY2v0E63wdyU2ZSpW2QfY2JJmCmDqU0Kgjik/zqHafBLBeGnA5/aVSNLEncwMHvQlsjJ54tBrZ5OV9zLoi2ldE7kzcCZavW3f728EQ+aUdJUiLInPY7FGmWInY8Y/+6X4ZScCaDsbF+w8G0HOnT0+mqBQ/YvbR1KStyn2bL4uKQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8epZfOnBrGhWhDKWFJ+s46/VY3nzwgZdGsNrSUZz0o0=;
 b=elYWDKVM5ftUwB4LbSiqhWxjkm2c8bjbdqqD1HoDZQHhTOdslSGLYBjCasW038cckwa4ycl4m6b3Tozs3T5HWYQ1VxZGlPvfTNzrUWRA3VVpGXdIT9t4EaUKaIO+hjCJIK2RRw8wWkB7VBzx8Rq9iPqmaFOZUDdqmEiKdLAUhHk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:19:44 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:19:44 +0000
Message-ID: <87o6qat8rj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 005/139] ASoC: codecs: adav80x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:19:44 +0000
X-ClientProxiedBy: TY4P286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: 06924730-6ded-462b-2b94-08de0ad8e77f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dmDelJuYCcJ2qmONXPk1q7K0to4553yWeXvFX7CqC4p50ey2UY/BkKNDH9S4?=
 =?us-ascii?Q?jov08AqFR8kgiLLbp/IcZgODm9Yzv4eGVCteg/11jxYMO7kFX9NWuAle4zbO?=
 =?us-ascii?Q?q4AuMLzubb6b3snNS+iBaCBO5l7lCS/Wg6MuJ/azbKmY2xwo1SSufX941ZCU?=
 =?us-ascii?Q?CKMwxR0+R22vn59YuseKMteUPd76ZQ/wAOhJF06ldCjLagGqpVzLP3ezDgcm?=
 =?us-ascii?Q?cnNZ75gTWb8kjBxPKZX1RTX3Oh1MCC9YA3YXMYSdssibLtUmMRaAGzZUzdBg?=
 =?us-ascii?Q?LmKsR4y6H42yOxreRLhUoWJ1JziiwozTc+zH9ZLAPF0X/9zhVsBQxK3qWmk/?=
 =?us-ascii?Q?iIL3ubuUFtBqfVgMgdLdqc1umYZU0jsZscWtcIseNxyBmuzVbmwtirCeObyN?=
 =?us-ascii?Q?N4K0dRKiy/rQV4ydoonScDOvAkDGHo+1EZNsTc0nTBYZVNTLMTOwCoJmewK4?=
 =?us-ascii?Q?H9PdkWwRW0m0wEpaixQXSC+j8RpEATMZELILMF3lAar46KkbjVwFLrajCGPZ?=
 =?us-ascii?Q?5QdD/LP2Y06Fveq/rGEYrSjrzku33ZONL8l7sSFN/y/RKTnwg+nNutjWPSKk?=
 =?us-ascii?Q?8w989Sqrlk3v7V5p9o/HVKAFX75qnmiH7ODld+FPrfkLVWmVazeHYc2mEXoQ?=
 =?us-ascii?Q?MV+/O0gtIfXCc4csd1ghDAKFC2/+iycecIefoqWVZNlDfBakJThcpDTwjA38?=
 =?us-ascii?Q?HqwZV3/SBF4NbwnX64EBHKxKAl3TJxYqeqKon8qD1N7aH9FJQ8J4Ws46K3Ia?=
 =?us-ascii?Q?/HhxxouTZ7+rrmv8bQbS2+M+xUFe3/GfWQ7xI9+7Sn4Rjfy9r4oWR5GvZqE2?=
 =?us-ascii?Q?eM30+tnVLFWM4ZyqPDQzzmorrdpvJnV+p0oV5NNWBDzwErO6bf+YtQlxqjGx?=
 =?us-ascii?Q?r3akPuilq/dbpH3g0GI2Fldmp75wcqWtTdI7Bi8gVJwu5B5bkuzyOZQjXB8o?=
 =?us-ascii?Q?s94J62gu1jv6Yby1iQsQ22NoHHi/17EN3X7UoO4A1K0sWj0C4oUUy5ZpVjlx?=
 =?us-ascii?Q?erx8oVrMPVr0rZk8/MO3TwCjJXZWGGDsjv6+pFilxkL+wjDQ2ttHTivqxud4?=
 =?us-ascii?Q?wC2y0ypwlXayOzvAtY1urYV3bDEbIuz5g8iglZRZjNX+EQ8r8VXeiWmVof6A?=
 =?us-ascii?Q?DFDiytNVQ5krm8Ea3L6ml2UhItFeR2bNVl0O9BWTRqEoEVSw0k8ZkFuuZx2r?=
 =?us-ascii?Q?PPXl83Ct39y/xTOaGympfo/p1yI7+mUKW5lVLbmAc66od2nIEqlnDOcNCnzp?=
 =?us-ascii?Q?pJQNcwf1lz5pMY7bVF2ThzhNSNUP/dEKpMy82ggiP9kZZHPov9LfgvsJrxcJ?=
 =?us-ascii?Q?pBMWwyYrpUgJaEHpw2GO5ET9twtFqSDGPQIzwwc7wcs/pirX7ha2SVFSq7kk?=
 =?us-ascii?Q?A8BSFa1CddBG/e3HZuys8J9mj8pidaa28i3He0AVJfTNvY7UU6+MNTAAyW3m?=
 =?us-ascii?Q?iIYaCp3IYmqYEgqd5y2n8CnKzGKfjpP0pbej+xuo0nj3kdHO4P/Kex77LOxr?=
 =?us-ascii?Q?VOcevF7T89WJrfhelwclVYzrYal/YOBSUInr?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SGC8JN+TGSP7tof8zCcKgUEolB2zmJ7RpX0JBKoF8I0/8Dye5yiTLJiRDgIG?=
 =?us-ascii?Q?eoJQthBIqSO9MN72nv6AUPMKm7CkVtEO0JJbbTCBicHuc4FYoH/YuYtjXM8h?=
 =?us-ascii?Q?NcCtr678F/dqEh8Hx7zYzP+vNYM7ZdC/T9xgRIXGvuuxJ/r/c188SlM0t1+G?=
 =?us-ascii?Q?+i50Ti6UoIl26flkJcW2UIHo8kFWvVfrNTiGRJHG/FuAbNU8WuDtLvOobHkl?=
 =?us-ascii?Q?t0ERxGW6trsfbsw/Zkpjok0Og0PczT5asP8S7SJ8ni5g2mmBscNT9hvzRELb?=
 =?us-ascii?Q?ctfsONhEcdrqIpLzZqJOkA8HDaMbrn8N4MaMmdXF3QM7S6L4zC7h6tVy1aIK?=
 =?us-ascii?Q?60XBRXBX5I6gjHeG7A4X5qWjq5i75+VhsaMyLaHo049dh3EyaCpZLSx+1G13?=
 =?us-ascii?Q?rg+MTVoblC03RrmW2b7wwJkQ7esxQJZF2+LYCJ2gKErKCEkyk1oX5yV6rWgJ?=
 =?us-ascii?Q?O4y4TjAQ6zHDo8QF7Td4ZCukfjRfJ8LfKgonHfiy1gGKbkl44eZZhz0KCUGc?=
 =?us-ascii?Q?I7KRWzvo2J0AfCW/KPxiw2PAkI6kT18cwSphIV3QxTUG7tN/G7YO552H8Aty?=
 =?us-ascii?Q?7o9zo1vUO6LWsBmaVLML2tnfVetQA/simo4kuTV7vJ5hw5As6Gji0SJHa57o?=
 =?us-ascii?Q?IieqkRvjKuVaxljDvBkxntwziPygqUeBBgrCHWIwNLrrgNEQW6K5rlPD110g?=
 =?us-ascii?Q?WxwgsocqIP89l84FzRiYMgW7z/PJICG+B6x4qWrkz6cTkQyAGY34fiyh9p4Q?=
 =?us-ascii?Q?pp9tXmGdNcbw47wjGk4SPzWdYa7Qm10LfdUOiz3YzshRgy4YE9yqDjTqwQKL?=
 =?us-ascii?Q?i5LGRv5HEXu6M3zp7B+ivDnWxi7uB11w1EOqmdc4u0u3s5Y/E+eqOZw5qo1d?=
 =?us-ascii?Q?VWlQzzrsDVaYji0xbdeKB3BEXssF34sNniWFogVw7J8hsOj/6waSHYVSPFHp?=
 =?us-ascii?Q?k6SdYc1kGpMj9lxonNGDDKKsOx/WXr0WCMLm7GLTEVERVOA4TLD+1PKpvp+q?=
 =?us-ascii?Q?AAWFxIVTCMmHGtoniOsiqZbh1oydJSzQqGj1miQ4eMCRb3mUVHgGqIdT248D?=
 =?us-ascii?Q?aEg1EKNjxXWGBiD8IZ5CG3u2+Nr15hy1gi0Hfa6qNrf1LLvWhhsUuNUEvyZp?=
 =?us-ascii?Q?7QOJAw5hQ2MunGWX1eb78bqoe3o3NpKJMlMNLZcqT8bF1PcS/xyYaIn7r3Ca?=
 =?us-ascii?Q?62cfQxTJzdMalLU7ZDh5wN31fVFII5ThMNEPbkcpX64h44wO+84hK39UYUNV?=
 =?us-ascii?Q?3tdGUL+YD1ID/2nE76OgxTdPzms0b/HLLXPe02PilOfMsOz+iLqrxvOz7sqc?=
 =?us-ascii?Q?Yod1JMQwiLVTv4jgMw2wZe8ojGAbp35VTX0jkVCwFrvyMlJPfMfFhg7+5GIR?=
 =?us-ascii?Q?F6aHsThDy2M3OafEeTMeos2HWqQqgqnEtrq/+hXJ8bkSupieLsxXaROW5sjL?=
 =?us-ascii?Q?YlEoCuTZJMXaG/igxzSJWdUdWEhGQg6kHg1+sQ51j5Bzx3ODqbUbd7bblJkS?=
 =?us-ascii?Q?0lJo4EZrFthExHD1ZgVGZ5V3DapkP6H7QFGBDU5spY3x167hdR4CmZdC8ix3?=
 =?us-ascii?Q?J6CcJyNKSNnLddtL7qtEL4bMEX9B5WpSrchjh81a0HRQw0yyWejooSdtdSTx?=
 =?us-ascii?Q?kCCWQ+fBIa9gWjoip8IftxE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06924730-6ded-462b-2b94-08de0ad8e77f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:19:44.7489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cnS4vLkKRej9ekXBW2z7Ntnw87VBQpDffNcJcstFvFU8lnDBn06EMaXStWNnpNVcu7GzRCpmcs93mmDaBU2NORsByJOopcpt4J6V2ZTbr+pzGI5V53VGNaCxhpJ97L4e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13923

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/adav80x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/adav80x.c b/sound/soc/codecs/adav80x.c
index c8c0fc9282116..c9c41496c17dd 100644
--- a/sound/soc/codecs/adav80x.c
+++ b/sound/soc/codecs/adav80x.c
@@ -314,7 +314,7 @@ static int adav80x_set_deemph(struct snd_soc_component *component)
 static int adav80x_put_deemph(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct adav80x *adav80x = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
 
@@ -329,7 +329,7 @@ static int adav80x_put_deemph(struct snd_kcontrol *kcontrol,
 static int adav80x_get_deemph(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct adav80x *adav80x = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = adav80x->deemph;
-- 
2.43.0

