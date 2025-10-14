Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011043.outbound.protection.outlook.com [52.101.125.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4301E3081CE
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415649; cv=fail; b=HMYLWFy3kkyDFhlubdQsXE2D0WJOlBpewIPLyE9JyIAAgKIJRH0ZJ8CmybduKD7nUvpExA11fqqMeRRZ3IYyIem/x+zEjNuKN5hT/btL4/2lo9EZvNAqKjhNVs3byJSAFB0ne9Cg3lo3Nc9oCQrNSwqcxqRK4Htudoedj8Br0UQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415649; c=relaxed/simple;
	bh=J73clC0WWnRih3ksBhF7jaO7MwnzQGrB25a3P3/fjxg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=uFtdbERcB5Yy5XykgBCBrl0ecVlIbnkQC3z4RTRf4a4LajjvsQQTq6L3vWdmORJvJ90H5Q1qf7FpACdd5u/ep65tiKsQCn3TYkRNLehCvlOlA/ntX7pa6Z8pVwpz3MRVYcDzVtsbmGOMcU3PnWts4a3KtDoHHBXBOoeMX5WF7gg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZUHKXGcF; arc=fail smtp.client-ip=52.101.125.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZUHKXGcF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vEC4YCfEWeYidvjGa/7c8xC8M/Uw/rOD8eYlA16SQ/ZAPEgfynZO9EEWmDCdnNOAc2ojNhiLRJQse7oq9fKBbokx0/Ekg36xJycAaCh++PXJtB/4Ny1Vz1o2dLsnF43bIXEfzKAhLiG+SmXxYdMVW9cb0yxBR7GdbGrUlYMCqgs5cyBhhzEh+9+a6ACIys4+E6LmP0KfQo+Fh82o/Y+CSJDJnmhNe77mpbLZS8kA/FJI29YDnt/VrhFKc3OWjL3LkyK+8yMge6mf29K5WaJhSm/l3M37aiwlz8jLrVOFRcbzmJzhep3XbvAUpBgLu9hSFZOlg4rYZYzDC/TQSvbvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DO/2hwUtQ5g/w1jxoeHxLA8RdepkAqafN9GS4h0NGP0=;
 b=ayQA23ts68cfcuSkVDAjQDUQ7Ooj56wVeapHW6zbYYENXdBmj3nB3sHLdDi06+qwG5cKyFKs9+v5zdi/KwmaWOfdzJlAc4IKw3uNnwt8e1dxrH2qYXSJsBqcW83oPOj/u7Q6ifh9IWARG4JXWwNmjBgCqrbXLz+bFTl55ObV/riGDOYT6c0fRl3iJcoq4DfIaLsRr9hj0vQGStvMN5EZOX7W5xusyvEhENpLe4mPN/TDHiYXue2QDh5zKGpHk+g6qlgmJgbOvkDlh8S3XOy5QkZGD7ZQHhYGz5Uos4WI7rwGcstPri2KdZWqQR0Ev4F8myXLiyepC4PrA/eJ9mRoVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DO/2hwUtQ5g/w1jxoeHxLA8RdepkAqafN9GS4h0NGP0=;
 b=ZUHKXGcFaNFVOo3pWD5TCIKxVL0vkvH9oFqmvYpM7D2aIkoGTT/uZ8ZzMUHPJTpXRJuorxEW6HI6lVXoB8Qoa7FikonjLCdryiHkVbxapxFLm+DwkFPOnc66sMFffEEgr12kA2XqUFBD6yzbbFgHT1HQc93xTNbx319wY6yH1CE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13995.jpnprd01.prod.outlook.com
 (2603:1096:405:205::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:20:46 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:20:46 +0000
Message-ID: <871pn6t8pt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 021/139] ASoC: codecs: cs4270: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:20:46 +0000
X-ClientProxiedBy: TYCP286CA0092.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13995:EE_
X-MS-Office365-Filtering-Correlation-Id: 27b3305d-3b50-4e84-2877-08de0ad90c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WA+9iD2Gz4WF97zc88PhjrW91CshecJ077iS0HY5u5BQ3AfMebaargQ4eYZ0?=
 =?us-ascii?Q?IZsbxOKt77CsynOXAp4titpJgxE35XyClujlMGB0sq7E6Dm+vZyvHC0is9yR?=
 =?us-ascii?Q?RPbIvIFgEWcWUxMhxqQhlCVNi6RsHBUk7aGHuXWWDvhMAuW2N453Ust+/44h?=
 =?us-ascii?Q?WtWj7uxwYX5Tol2s3KDmK2420brAUj/c7hu5jLiQj8lQ7sIh3TsCPYsp8DG/?=
 =?us-ascii?Q?ugfq521LKoogbajPGDNKumZqCQidvozjxXXFvefaNVqn2kDXiFbuI7On1Wdu?=
 =?us-ascii?Q?S7OSjFh+wEpT5emPiivxCpsJ/oCqv9UmwPC3A46M6trOw2pB2+FglDe+G2mP?=
 =?us-ascii?Q?3eEpdCoC4scI3yYSEqHjfq3baise0HhvAehIBEG0+nsnUw9zvVVXb53wJEuN?=
 =?us-ascii?Q?+UY+ORAfSn/LLtC4Up6zMekvVK5yD7Xylj/vcePaJHSWiIIyJWJQmqUKlmC2?=
 =?us-ascii?Q?08fnZ6n6cd9mEOkxq0yjYsYhPPpVHldlB1yyJCQjN5XvmOdOXTZLPlbxCeCI?=
 =?us-ascii?Q?zwvQ9Bg4L6gFAyYvoFcghFxubkCpy03c4LMW5EtmHPx+CSvvmKAqYHBfLRGM?=
 =?us-ascii?Q?HriH/17KvPZaUCVeD0zkpFlSfbvf7g7Dv4VwgZurrWDERRru+8c0aWHEkZ5M?=
 =?us-ascii?Q?b1NqotDIjDWYaZr7/R/8iFWTfLpQSCrZuXC3V5zeKJT3PuAaSeCur3Mc8sSf?=
 =?us-ascii?Q?GqABozxJYH4GKsbR96lGaSNjZAZqLQk/Id1fCmO54CgvouJWxZy35llUWccC?=
 =?us-ascii?Q?XPyISZ+kL/0lIaR9IGsOMuWBMWbY2O4IJ/sxMhMfKF8J1qo0PT40MGNiYr4i?=
 =?us-ascii?Q?x04UbvhdHegaXqeUZBEr0D4Rcouj8TpHHWKiln9YkrhxeqvSBxhaNX8Ysphk?=
 =?us-ascii?Q?U3x+3Tgj+qwJTf9MUeMjIR4JoeuNWlvfVMXjVBQWMMX3EApojecfRM5tCJ+D?=
 =?us-ascii?Q?0tQskzoGT8Y5767kXAmjBGVETNyvYD95TmVdspo1z/z8swhmnm+Z6J62/4up?=
 =?us-ascii?Q?+om7hvN2vkktb7CWv77Q68i12C0zAUosa93RG8eto7hCQ1uXKpvktu3/PAtU?=
 =?us-ascii?Q?Xdnj9kpxkwrB2bYd81srzlc8Mi0hFf3Jj69OsA1WiQO6P+3FBo5EBwMnLA4e?=
 =?us-ascii?Q?CcPzsHWeQalfsxHMWR+XPZDr6cOkmn4m3254pnZ3g7YZX/CAwM/s6JvZ0X98?=
 =?us-ascii?Q?SEJpTInzManChgqzaZ2E44pQ3sOi2+bfYrJweRjlNYvWZFHdXcUrIXgTOH/7?=
 =?us-ascii?Q?MIGC0vRPz1nGcMtqEgbjzS/sIUNQ+xWZdLbghTJNfXH4DW/1xLiI9rsqMF8p?=
 =?us-ascii?Q?6UqeDAK03qelPhfcXddoHnYOR6o+jHOlapOjFxaokE10ioyY5UNtNdFuGZj6?=
 =?us-ascii?Q?Vw2Vpa9YR+pSnoigNHyP47P5/8Hq+rQdIiTu7Aj0bXltb3nbGijC/uXJANp7?=
 =?us-ascii?Q?C6hPHxlVLKbCWvuP4u2WAE5aio3if7zgCj+FOU2dZJOv/YglE443HIBrkM4F?=
 =?us-ascii?Q?iz5MHp/nRmUudxlfALkneUyrs6E7qv8cDabX?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U81MvmK5ic8edkTim3HG8Eh9BFPIatFOLMafWiaufJIAn+2EAembGcywunij?=
 =?us-ascii?Q?pKjxtFjxrjAMfToIGSgf/HgTEfvb6XA1j0mftDoKbWQKQ3f02H446DwiDx9u?=
 =?us-ascii?Q?4AXHgBpqPjUe7U8izZK2yXHJuxu0MceI1nqQiHErxJIxZdnzAPRq10HtiKRd?=
 =?us-ascii?Q?At/HkXe3Jm5JO2SiO9WSFaH4IPSG3rvDtTSRPuJ+OR5IdRk0Yk+iVakBabqn?=
 =?us-ascii?Q?PkB/BstX4yghyUVjhynBIOvSYt2rfN9yfoDXVg73b6Npr90nVjGcjbGlU8fX?=
 =?us-ascii?Q?0Z4huYWI25N7ivxeZGbPp4Dv03c0YIKpOTxlQ6atdwZnw1ZuKuuK/pcJW6Ho?=
 =?us-ascii?Q?CvYkAl8vqP9g7Namd8LXQS0IkxOFoHtkyNItAxAF2Sh7TyriFgWvv6wd7jgG?=
 =?us-ascii?Q?qZpWe5hFaWLJRTBBRRnyAt9HHO3V2BKSAaQBvAF8GBOx0Bzh/PjXHIJvk3P1?=
 =?us-ascii?Q?GBFxUc8hgZ3AF+g4uArOP4Ef05jAMMIxFgXmg3XqO4ze60zJjB8s+HCLbZln?=
 =?us-ascii?Q?s7j1/9daQ3XADn5De5BFe7UJRPbkjdjTGUCoeFe4z2OcU/DyleDrrmjkajKf?=
 =?us-ascii?Q?4h87kfBZGN6FJ2gIHiHWs3wQrJ+cmGtMpmukE4aHG+6Gwk9M3EgX121l6zJU?=
 =?us-ascii?Q?cLZO+uGY4UfRUyTAa6t9tAJ54j1+xR6q1M+W0CizgLwho34s2DaAHwuYSJY3?=
 =?us-ascii?Q?4w0FVGNw0xr8WIl9UyYHiGW96ClrcyFWxeXUrvXYkdoIZ2bB2gfkD6ukvDkn?=
 =?us-ascii?Q?OdCrgHpUn514mGGKfhLlCvc4NWPvTMcfPlxD42DEcjPW7sabt9J3H8GT3CQp?=
 =?us-ascii?Q?hU15rbx8wlECgahKd/SguV3AgK+Igh6EK776QwnramDk1HIXrO98naNEq+ul?=
 =?us-ascii?Q?pGyd/4RO9B4MspT3dKrzTxzOZTezcgZuqEivxdzctPhz79FBhliqsbeGrvME?=
 =?us-ascii?Q?CwYYTKXsCalLkt7VtEzfzPt7uQUaT+0uArLIOtDiZ/6PNjiql8LTZxoTtZht?=
 =?us-ascii?Q?BQuvVCpsufLNuQTGuF9kOLTud6Xzbhdzywr8U3Cc5A+mdI1kUA7O65IGzsCI?=
 =?us-ascii?Q?MRGr9enRtwjSpWI70Asttx/uBPfuJaT1LeEAo1u7m8EcAWTZAmrzzOh6OaOw?=
 =?us-ascii?Q?9m5E6peFCK/5jeUMrXkdkD3VlYnBSzxzr6wgkR2PToubvgGlfzdwOR4oFexu?=
 =?us-ascii?Q?9zlT9FyQjOp3cleVTzsxSlq+rAHeqLzN58NUXRsc/Qn5ULfsSzM8DJ4xeXel?=
 =?us-ascii?Q?la+HXobMECHTzTpxC8W5HSllOj9A7eF/EtZChMQJUTenH/iY65gy1A0msIM0?=
 =?us-ascii?Q?lDu85EQ/zxBPx0KXF5Cf2dI6BV8diIhDxfVoqtlCVvtC8HMRMXSQtU0KVGZD?=
 =?us-ascii?Q?IVr4HVRHOaeefcoAL7sz0hhgLDI5Gv+fYlo5o7PbbogAdEyrPEwciNvulFRO?=
 =?us-ascii?Q?t8GBvFphNHNXdN7udGZ0buJzpxQjT9MNPiu5duy/VrnMqtdBJA3zKwUq5bZE?=
 =?us-ascii?Q?UkmVzWUX/g5uogksie1YgHo1UhtdDaQlaKvORB7BAdFXnTi2dIy6HwnR0tml?=
 =?us-ascii?Q?B5T23QTfGCeDkkbNbCoP+0kNb3H8OpfgGkhOKoYY9w/L6r19tiVzG2zoUHXr?=
 =?us-ascii?Q?l3TC5MeQS0+xFtqmwId2/7Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27b3305d-3b50-4e84-2877-08de0ad90c48
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:20:46.4564
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A4EE658SOUYO5NHkoBmLWRw5EFlxFnbaMW86/KmeYpTVeqEzYlgS6mgepM4dKRZahEZHfI9N8YaFaS6f8wJbtOtU6XV3DZ5iGmRMyksMaev1tIKX0xuSZbyYjJMV207d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13995

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
 sound/soc/codecs/cs4270.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index 9f9dc8b017a35..3139f03cd42b6 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -433,7 +433,7 @@ static int cs4270_dai_mute(struct snd_soc_dai *dai, int mute, int direction)
 static int cs4270_soc_put_mute(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct cs4270_private *cs4270 = snd_soc_component_get_drvdata(component);
 	int left = !ucontrol->value.integer.value[0];
 	int right = !ucontrol->value.integer.value[1];
-- 
2.43.0

