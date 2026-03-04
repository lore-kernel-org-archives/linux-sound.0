Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB2537F8CD
	for <linux-sound@vger.kernel.org>; Wed,  4 Mar 2026 06:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772605457; cv=fail; b=iJf1zaYLwAVrzH3MoWVhIOP4J2nSFv8L6bz+cVgj24f+v5F942fiy2R0a4TUqLN0gizY6ppmlWJq7BYyx9HdAyHXhhl9Iw3zYedmZFIxTD0N7PPAZ4Yd3Ul4FMYBRZSWCMYjz3m4A7xgfF0fQDsNoSyb2aynDmQdkDoqaUeD71Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772605457; c=relaxed/simple;
	bh=mFPqklze2e8Bu4/nQnWS9eQsETW8h2zuCrMIEb1tYFY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=k4b9OAQ0jPUrcBB8WZ/cRAyIyBel+VE/t4J7pSeRnzwVKpCnwyHzzUmrj7Q21E6Y9X7/i3D/C2BJc3TJ0FOV3VZ+miH9jtCThzzvPzqOauvW6ub0SCPEeo1Hk9l8BSB1rUzfRaB6T9B7Yas+FXqMb4RAdm0d2OLpF8AXc4OcX4g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=g+kqaNh/; arc=fail smtp.client-ip=52.101.228.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="g+kqaNh/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E+QKMjUE1F+52erTGSQmKq6qgufrA8ngpc4+MH5tmu5yWitTOWfMyLHJ7tshQDJZGD5njTWdJumAs3GMq7LEbZzoEEppZng5o3nEx/cLQ9uSEYEQadjulLCs/PL+nfYzNSNRCc3nNmN2lYabtte/OciYbeHv9QQ0IniANdNmiA2GSSxZFuGLbQCrRX5VloIrutpEjYC9uyaa0wu7FUfcp+J+8WsyITZCkGZaoyavmcoKww+fIBLL4qSEh6JSnwKOn5qeYDsJcBIFycndcrR3ddpV8t1eIYCa+TKIIahpAKfZ/ZhwVnsNETcQDONyj5jqqPvb3qgR4fYk1+UKd4dV9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+mE367Pll+knepszqiwuVZbfvbOHUJg3yFaBGclVNc=;
 b=qmd8XcABr7VZHyGkiq6os6gZlo3FKDUZw1y9uMPlo8Ys2Kw3Dtn8y8VAWQnx6kMCDNtzfDfwwzKhrbtcJ6hDwrLaJ3r6S2AAO2cap1QVqVaT12Pp6q9gHmQWs/+hDs4tDUuRqzdNnx+ugF6z3ydRz/oZJC4xHxsYq7ig9MPcTi+JyXGpbn9ZjeVCjFYM9e8Qubb0P78hOQ/9jxwmp9GmHD18SqmTTXBA/T3tfJ0Lq/9lw88+qNTTRuQQwx7kFKB5wpGP3SYNnlu3CFId0alR7tS7dJT07cx0ty0W4ej9OVehL+NAN9lhW6oz8tAmBhya0YDjQr3cx++B7sI24Cyo5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+mE367Pll+knepszqiwuVZbfvbOHUJg3yFaBGclVNc=;
 b=g+kqaNh/sC5KQqSzXiKbl+wRDYCoU0OdZK1n3fIlPb7cm3F303STUKsGtupaNuQThfyNmmkRRH0oxSAX5kLHXfy65n7FZahYxo6Bo4v7sFwwefD/dTcJUR+OBvrLUWhH2JpG7+Rf+47wPGekmeHGDJ8R4Ey7X9NCiHnZrpmLD44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com (2603:1096:400:ff::13)
 by OS9PR01MB17519.jpnprd01.prod.outlook.com (2603:1096:604:44b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 06:24:13 +0000
Received: from TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9]) by TYYPR01MB7976.jpnprd01.prod.outlook.com
 ([fe80::c654:926c:3c54:57a9%7]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 06:24:13 +0000
Message-ID: <87qzq0nmcy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 28/29] ASoC: xtensa: name back to pcm_new()/pcm_free()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7fcp10x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 4 Mar 2026 06:24:13 +0000
X-ClientProxiedBy: TYWP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:178::11) To TYYPR01MB7976.jpnprd01.prod.outlook.com
 (2603:1096:400:ff::13)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB7976:EE_|OS9PR01MB17519:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b535ad3-95ab-4768-866d-08de79b6a7a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	hG/0FPma6dVc2ArCK8JZLj234UZxtf+nAXvsi0aLah4DFw8Ir2r6ORrshJAhRMvGzrmH72Y13R+CbiUusFvUbhfRayYWe7QecINfky7xAj44a22eawkozBaX/YU9cX3Qf7PP2NWc1exJ95Nz22+zyfwoh70sv/9UgjG0XBzQhNQ4Nmc4Iuumi8qgSnP2FqzMnQe2stxllNac3iIghukNgcltekbeBkeUN+RZskZ5Q1MQHomhx8eomPeLh9DQFE3mC9j41+62WoNFLZjQuzX4poTQDUAcn4ELAcqaU8itUOSY7VCTsn2+YQiVgwkfYZ8shrko5EB81yhaEemih0uz1XIHQFaWd79X4bLVaZxGgNDT7n0E0On4hI04RgpT9B/saZyhVFiyhGzpu6KuVj+VjUK0Ceb6khZj4ZOHXySdB7LjxMZXHlLO0rEwzm9pWYf9k6bkfeA42pV23OIP5gYv10Xmlccz3GxssUA8UHYnSuOTplOJEubfVwq7ZCucwrCYPYtVwMcffLs7m3mMXWAmn4UNW6TQsHXa/fSoJYllv5vk46fxbBafhREqc2YB6gPbn73uL46c5gy6CJbS0OeeXlk/vMrpsnBPjSm5CrMhU3lq3c830EeLBbWGTzcEUUoTJN28R4CYyqSOcU4tTIVUGSYs0XA7IGAcUFLVcByRnLLNGTp8YZrMxUV3bvsHywqBPIS+UKm45piCpzYyy5I2yVtvi0K/SgspdzhpLuQIX2mW/sprc+11cKg40UfUmxijRq0CzemQyZktCvP50ZgsDeUpjmzMKo6OfAs5sqqDX8M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB7976.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lVGYi5xnsKYwQlO7rwN/sYSQwhJVNWJRaNg/s7u7l+cDDJO5VkwWNxLtT9uO?=
 =?us-ascii?Q?GyfD5cBFyZuRzTJoj7KzSDSvOr6PRh5TMbirxjtm0WTkXTAOYE+3Y5T3eFyg?=
 =?us-ascii?Q?ZIcavb8CFgSfiT8J2DrS2VPoRPt+6/ThBV18k4U/brp+6PshZmZxKZh8k1tm?=
 =?us-ascii?Q?2jZ7ONrXFikYS9/nbLtfZgXmxvfNR+Ehj1tpWFnF/PLZRa9Z1s7kXV4xkrrD?=
 =?us-ascii?Q?jmhkYP+iG4+kPsrDCtW0h2ZYe4cGDBXcyyO9ojs6lfBygN6IBuL9meRfkQE5?=
 =?us-ascii?Q?jSVSTwPV3/MN2r4l98V6nQ8yi0gyM2ENi7TK3PjE+pIw2JK+bC1+nHlxC8e+?=
 =?us-ascii?Q?EHamoWJpbOqpZktQoJ5maLSzFzyXX5kUbBIpVLudCwP1KJGrqceEKUqYwDUU?=
 =?us-ascii?Q?4xv4csqgDDPQXIpRrUbFs+XFygY2mWEt4YzoSYuMQ0zyC10lPc3hfs8dOlLf?=
 =?us-ascii?Q?jiVl7hqXsoMwEZ/Xs+2ATsDWnZQ5HyGAByKu+7jF4lsyBlLi/E/IjSslLAEQ?=
 =?us-ascii?Q?oN+Zxa90XQ1YYi0qd9PCrsnZgPWWroNaxKyrfXDoHgBxB4/OcUIzpiDHCrFo?=
 =?us-ascii?Q?aNFGbv3JWPEuTu/Qpu3siwKtqUNv0tugjjBcUsMOKd/YdRzEU3g98QgWtexT?=
 =?us-ascii?Q?gsiZqIzLS6m2cNq0RLqNjxolfZI+vVioosXoBUUfAcrxq5SjqHMK2MwgIzt5?=
 =?us-ascii?Q?P1xjIGJfdPDFB5MFGhR8bQbePIgz/LeyizIlL5gCLY+Q+OsTREDdAMM4KiQm?=
 =?us-ascii?Q?wBX5Nb4NQNt023rhk9UxidjIecIKqlocctJ9LLcFVuhL0asRZJBp1ciwb+GP?=
 =?us-ascii?Q?d1PI10tuOpMORNjczXG8H1qHqRf0hxK2BG9Bs6/NwfHHeZVVqTy+TdAjBwWO?=
 =?us-ascii?Q?tpYW8ewbNHm0d6BZqwRHFtUxFDT4wyRXe2zycfydsy7Jk2H3RogGcsZXjw4i?=
 =?us-ascii?Q?eUvCrwWgGeAwh8EjD08YCS0BXsGUeJILCjMPm6Q2BTEMaqlG9tctVLYpKRy5?=
 =?us-ascii?Q?KJlb+0+CRnoKiOHx1mHSAyB+xqL5Wj9GmFiGIbM7taDAyamiiAtJ64YB+W8e?=
 =?us-ascii?Q?/SYL0gj1yDuyoelDngvRJWe2IkQ9ym8ayvAwl9OHe8Pub3fD95XNEkykxCGI?=
 =?us-ascii?Q?UsaRZFLnzlEYw5rR4BWygkSBVRBz1OHzPgzhY1eG1HGmdau5ygbhgKNrZJ61?=
 =?us-ascii?Q?d9ikqH6UaGE5GtaH1Hfb/HOq6FzIZUIGpj34CbiTWT/PevQXp6msLmNKZqML?=
 =?us-ascii?Q?q/mG4quhLs8uOoMqFMweMF9YiBVoOxBTs2ZuNVMYXgecT+aQiIEyPL/H4fY5?=
 =?us-ascii?Q?eKgKdeF9bUeEeSyFk8IQW46AlWrpBvENH+VTkV+4tlqmxG+D6YNi2NRUkUoH?=
 =?us-ascii?Q?PSE9WZ9QuUKN8xZqwmq9gzGlq9MPIfnM+Ahh0xTXyWbn/5k7RXnfJKNRRgbs?=
 =?us-ascii?Q?dLxeJgwzUZR/u3RVQb18J4BZfibGc6x9Sn7GKkeXDhumG0z8Knp8XxYRagvN?=
 =?us-ascii?Q?mtjZ4ixGndkdQEGrWo0kcd1clwgnqwcUg7BKWwqDAkk3REoZzN7r/luy3wHf?=
 =?us-ascii?Q?nwsQPVEZFbZA/zAJZwo0UehTC1raqSiJpSOr91Ykmb72XBighjiNHBZLYdxP?=
 =?us-ascii?Q?ZbeFGVk+wWSCSWAH9KeT8bAevvvik8unmJVkVvbdq9tPPcxe9EmQ91m2JlA9?=
 =?us-ascii?Q?UXtZSw3uqFoDaPgsRYaUPoAX8YkzVeVUBFRwBxyYkq1kTZNV8HIl1TozsXsC?=
 =?us-ascii?Q?jN5lbVL7yVsbQPfSY+1XUYtGcj6Gjje2MOVKbu5hAK38Q7d2z9Vx?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b535ad3-95ab-4768-866d-08de79b6a7a3
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB7976.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 06:24:13.7572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gdmNTybRel5oEYdH0fjgqDAvPQgl0jcDMop6jSRW3B5vR8nDmB7LDTqKraHav64V0NT46pGuszaHDn+xU6una4Ffmjk8d+rJ73ZjPJdsythOSfG85EDDqHKmk9tcfaeW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17519

We have been used pcm_new()/pcm_free(), but switched to
pcm_construct()/pcm_destruct() to use extra parameters [1].

pcm_new()/free() had been removed [2], but each drivers are still
using such function naming. Let's name back to pcm_new()/pcm_free()
again.

[1] commit c64bfc906600 ("ASoC: soc-core: add new pcm_construct/pcmdestruct")
[2] commit e9067bb50278 ("ASoC: soc-component: remove snd_pcm_ops from component driver")

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/xtensa/xtfpga-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 678ded059b959..9ad86c54e3ea1 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -481,7 +481,7 @@ static const struct snd_soc_component_driver xtfpga_i2s_component = {
 	.hw_params		= xtfpga_pcm_hw_params,
 	.trigger		= xtfpga_pcm_trigger,
 	.pointer		= xtfpga_pcm_pointer,
-	.pcm_construct		= xtfpga_pcm_new,
+	.pcm_new		= xtfpga_pcm_new,
 	.legacy_dai_naming	= 1,
 };
 
-- 
2.43.0

