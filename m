Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.2
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443434;
	b=gzcZ1HObBauengqrHyeuGsad99NgnfaUZiTkDbbCuhoSkhMWMqSAqBJXuuDt+WmZSn03
	 gnQwll2p0FKsTX6rBpoJBNIHWcu8+QwwlU4a8XJagRomYC3xJLbXbhUahk1K+sjv8Ya7s
	 hO7ZZslr2n1bq9qwZRkVY+qPeohXDdV+gho1FPRK39J4XJnJbFS9mLLruWaRwodPE7YRo
	 xmhJhbWH1cDeJz5DtdOSP/ht+iUajcilAVxEPO9zKA9rBJsS8F5fBR50JIfuuPXJTUGep
	 EFKnRUQQTHleYba9e9hwy+oeep3dYHhS+7aiaUa7Ejjb7JCFlFXWo8ckypRVCKHLEpw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443434;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:Date:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=cDalbT29jaW/0bAy6f3Fe0xLtiQjqDmfOG66ssh0/eg=;
	b=lKv+fZpxm/zWODrSGU0Ix0n/czI2r+mhPfNFI9JjJsRUsYwb4ZxTIKSLAV0J4yqCsGKs
	 6MUBwlKzgmjNz4OFm4YihnWw/rbGMbzlWKgW4knan7uNXz9c0rX61Jwx1CglVnXNvEFHl
	 reN7+JCcZaghnuR9hOKBi5MpuBDA3wK+bcOj80bEGxL22FXtWYSZI+709McuDU1erwACp
	 IyaLob8IaZaL7Udjwr0TI4KY3WKccIzT4lGplPcXBgK65TQmZhql18D40Z3Jtoo5OClWW
	 8BA92jJTAbAIM9oMcrLzKCUNpR2TbIrDJFSR499wKHyP//gU6fWwJXG8pbhsnFkemgQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b="EGsud/b3";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.2
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011002.outbound.protection.outlook.com [52.101.125.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F41606A321
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7F41606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=EGsud/b3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mJrEVcnschZTzXReSjl8rG4Q9fKBXxZbcDeq+34BMgI0Xt6WQMLt0ALNRFhqpl6KtX0OWKzw+m7XU1qPqn1j87jbYZaLv/Wbdol/4o4cFsHWnRFnkCzfQup9hvHGR6IiIaWnPxSINUPYbqxbcO0Bgb0l5vAlZnHrXq+mchaLiqpOqABvL9zKjiEdcGY8Hew98uMcsL1FciOiLBeVD106NjTwcJA+taSvKuFbGbF1VKfSnkEq5HaCd8ip25kz6uP+I9WhaKLJnIu0IlzhM9bF1Hpz+laPhUNKNaTZgjMcyx5A3/SPUExr2/IxPZQPrnRApq4Q1F9YzpxHHqpyAOiWvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDalbT29jaW/0bAy6f3Fe0xLtiQjqDmfOG66ssh0/eg=;
 b=lBW4gHNJQpJekIjLVMDrYYESg0UDvG7wSqOZ5xl5OQPexNZuW5vhVTpOl36vYeukwB4Rk/HVDhg/DR/IwAB6ZaoZRAqN/NhL4kqgYxNMwHAsyTktYed0UJYh9w/azmgsIHIP+zox3c/Gl/F4aVFHPDywApkYXwBYbXcyeuugYbRiNA/gqIUBWyupGZ+NxCXOQZffyKj3AgcGSxVZWnwLfNXt09xN9ZIRTy5Dndxeqg7W1iSZ5YCpWSyKsHcPBGK/h0MKMJbzpT+qt5GPlggbXGI4CHPDaMpm04PL7s3vZEsL7dxx/VA7PSqaybhhkK1X79+kOjKEzhyHrk68jORwMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cDalbT29jaW/0bAy6f3Fe0xLtiQjqDmfOG66ssh0/eg=;
 b=EGsud/b3wg5gU2rgaHOvKpeTcXGxTyMagYMGevWGnxb5x0SC3sntLu9sShgl/FDynPa3g4nkgdZPQOD3/3ExCTnFZd3J9RGtd6RHHg8BPSTu3RF3zsIsPRbGy7ATHdddtwvPXSGtzwGAy8eetDOw4QvHMwhAx80+cJaX8st0xuk=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OS7PR01MB13650.jpnprd01.prod.outlook.com (2603:1096:604:359::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:30:31 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:30:24 +0000
Message-ID: <87y0ay28o0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 01/27] ASoC: soc-generic-dmaengine-pcm: move devm_snd_dmaengine_pcm_register()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:30:24 +0000
X-ClientProxiedBy: OS0P286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9c::22) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OS7PR01MB13650:EE_
X-MS-Office365-Filtering-Correlation-Id: 12742a6f-28ed-472e-c96a-08df40542462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|23010399003|376014|1800799024|366016|261026121527099003|261009223027099003|10067099003|261028144727099003|261102130727099003|261026140227099003|261021123027099003|261102123227099003|261021121427099003|261022075727099003|261022105027099003|38350700014|56012099006|11063799006|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rDfX6JM4pmhS2QTkm6TJ3qrGU/KJ9HMK+QbWfex7xPuwG+JcIJU1PXHADDRZuKfNuzUI0jm6/jrEIHTUePutHkJyKxoPQ1WDt5e6ZUvs9mGfeb++u4NjMp2Hm9omwFxkMEDJG1nAvKSNHUVXW4nrzdG/On3Kw86kEO6sHxNQnKzB4Un2JuwCk4t/7r3NYGMd8BYUYGkZvI7POktCtMj0dOG/1b2V8RwzkxpHZ08T8pg2IAEpUblqMpGVTGMbRSIM42QSMby6N0h0mN2Wd9UaGhsyrdFwRc1uMeVRUsW0lhMKZdwBvxYMT6jCYrGDU+JQ8Nv5dIF5o7Xd6L5WM0uwW2UMLJunxXWpwNXXpKio7EbaWq4YobZ1aYi94+7C1I3wk9/25tWwh2CM24aq2YT0Y4pQ/tPbsATezmWj+zmCYkpQ691TeY4Y6wtEZnJw8XYcB0WDjxiaD5eaJibFZBJ/M7LKwAnYqcou9UaPzaCqMZ4URhCPesIPyVzizZSMaGQWuniaEprKYTrn8Q68GuVhz6CTo3N4DJM03CKmRCKgwX3wi0YUR1m8RBmWf6e/E7lyC2NPrHkgKECF86BerxHyNXXWgGT6SB8McuK6FGDEsGfiIQid/MZUvHT9QqDJRjnseVdhaRwVDZBjZtxnpYo4CrLL16gyYKmyeitf6gLc5/g6zzqVS2bU09bag3Bd2NXI9Jfvf7fArIIVdCdW1utgUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(1800799024)(366016)(261026121527099003)(261009223027099003)(10067099003)(261028144727099003)(261102130727099003)(261026140227099003)(261021123027099003)(261102123227099003)(261021121427099003)(261022075727099003)(261022105027099003)(38350700014)(56012099006)(11063799006)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?q2lAAlZm6kAfN1gjiq8Xmn2HQYECvbEJhMuOdGYnzc8Vk4FMbLvYDHQAnZ?=
 =?iso-8859-2?Q?3RDJSbSwDtzsPPeJFlM5neyQPr9L1agh/DBpmIJuG+saZdlcPiLtINtd3r?=
 =?iso-8859-2?Q?6cB8Vcy/h3rgId3bcTI5gS5XpSN0iuBwdJW/FzpytvfRosImnOXMJBnz6k?=
 =?iso-8859-2?Q?AuokIBceBm+VHgAwmkfr05lC5mgh3vvwR8sLvWlsFDz/HcnTZwZFurkQB3?=
 =?iso-8859-2?Q?rxEGr2yYvSSzjoQ75WrT9KlkyNviVCAmKpx9j5eunl+mNrs1Ldh1XBgA2u?=
 =?iso-8859-2?Q?H/F0EXmNjBJlM4IrJyEQv1QI2YHudA6g54Fj9eA/KQ8cP27gY1xZ8HgDId?=
 =?iso-8859-2?Q?/+C95O1rWpxQWS7mSSHIiT70Q357Z5W7FTQTzViGcq1n/l0IqkQL2FxLbG?=
 =?iso-8859-2?Q?48hlIqxq/rC9huSstCrbCQVRhFEKtYgqAHRlxdK8HRVYKehgzIHM6blYuQ?=
 =?iso-8859-2?Q?JeQ4kXrkYPj/HObM9Tg4h8m969C07zbUOCQzGcuVXjqXZ5TQ2f1Xgnl3iA?=
 =?iso-8859-2?Q?fUHHrxOMIPsM4TcQg2PMGuCaOBxqH79c4Ic/L1moIsOxUTEWDecLlbYNh/?=
 =?iso-8859-2?Q?CKbOivITV12GQtDgzAyXy5T6v9NZPfRTRvx4LW0gysmrYxkVo3vCJKIsLM?=
 =?iso-8859-2?Q?SRW4UVqOPFHSHWa/wFxo1jh9Y3Kw+JUCtlsbKpbJg3Fb2zVyZIc6CnE0jm?=
 =?iso-8859-2?Q?oECpciRDofOyzGbfVifyu7kMNPC7SWTz1YYc9sTEsi9ZvBrM75auQaNnjN?=
 =?iso-8859-2?Q?WKDC8UQGTPhsDF7ymDD3DpJM10tRZKhtdrr2DOWXrpxR8AMNhlG3aFmxgN?=
 =?iso-8859-2?Q?9MQ4dXMHG1dIsO4Fx5LHx5Cze0iuA1dvpjcFs6sZwOmB/MmXpGCzkALwpK?=
 =?iso-8859-2?Q?psLgrmlPb41AylVXEbATWcMHtKZYdc3n/6qKvJEGkEmFocy2o7P+hh9Lrh?=
 =?iso-8859-2?Q?+SjifJg1U0nqLR1ew9F1oHZqROhs+ufBVnOuJQqYlu7AlUifRjHUpGW0ki?=
 =?iso-8859-2?Q?f6R3UvvqDkPmIFglisnFWloNESPePyWnGV6sSBsveqxoFxNTzniNMJri+C?=
 =?iso-8859-2?Q?KrycZiesCtFUqKXGoJqP3ZiKzIIeWNkUnyobiWu/OPOM8uZVuSg/bBmPLZ?=
 =?iso-8859-2?Q?FuEMz+7mIfxaO0FaccnMFdSq6olzGNkBWIWuScQlz2eDOqvRa4EU5NMdS8?=
 =?iso-8859-2?Q?hx+IDpS0w5D3X5wkOUQbmHcVp0+mwmlnb45M17i53m0Xq0QydYESWLgJqg?=
 =?iso-8859-2?Q?ZEgMD/IoUHO2I5zUCWuqh3XRDD+zZ9prY4WD/Uc37q0O6hAkcPO8dAB61y?=
 =?iso-8859-2?Q?Tdc+DzbZibucFrewPCsGzhoHWUqqCNdlLwLeDmb5TYE9ScUCiAhjQzDFLo?=
 =?iso-8859-2?Q?MyVbjiDQcTs8g5J5jYAt8MoznPGu5vVyK0XQLqjHKiSLzTqyMBFl0qtZy0?=
 =?iso-8859-2?Q?gW8YOI+2rrW7jTkW7+apXFxZeC7OMu8oWiimvy30gmbkHEIPXfHS8rAtd2?=
 =?iso-8859-2?Q?d+eE008azAnjf3FaLtUKTS4A3IwZWbAmPuxM9FiMwQ/ls4LiQsVXSBahtE?=
 =?iso-8859-2?Q?8TExLizUpAC9V4UAgPRJXSaoZG4DgDAbDdIjhO4ior59xR9GQLNpKmAwLF?=
 =?iso-8859-2?Q?aUDWY+txZ1Lj1wRBNprH9uODMBmLFAqJ5hBlbRP6BkgU5seeUL/VtbT21n?=
 =?iso-8859-2?Q?Cz0sjp+uXPWjBVlcZsIjZ2/8ywFpAkiRTQ2j0/P398LHu/61OGr2VEuv2R?=
 =?iso-8859-2?Q?DI6NxGxmJ3PrgAQXgCOBCuVsoiWPK0ejmfTmw/Svh5/TTalccMe2cKj0xY?=
 =?iso-8859-2?Q?LVUFFn27JIf2MHH2QAWh/VAhrCl6lkU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12742a6f-28ed-472e-c96a-08df40542462
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:30:24.3238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pKyJu0Kqf897axU2YbQvT4/gYqzbGjvqJQqseYFA1oxtG6J1GFb1Q+zFh65ug1+QP8zktMV5e6VIJ+5IduAW+YmjvlMNEIGkYg+1yp6wsz05D+pCvodHffV2OA2YN3MO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB13650

We don't need to have dmaengine related function in soc-devres.c.
Let's move it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-devres.c                | 40 ---------------------------
 sound/soc/soc-generic-dmaengine-pcm.c | 36 ++++++++++++++++++++++++
 2 files changed, 36 insertions(+), 40 deletions(-)

diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index 718165ba84ac8..ca6c29b54f6ab 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -63,43 +63,3 @@ int devm_snd_soc_register_card(struct device *dev, struc=
t snd_soc_card *card)
 	return snd_soc_register_card(card);
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_card);
-
-#ifdef CONFIG_SND_SOC_GENERIC_DMAENGINE_PCM
-
-static void devm_dmaengine_pcm_release(struct device *dev, void *res)
-{
-	snd_dmaengine_pcm_unregister(*(struct device **)res);
-}
-
-/**
- * devm_snd_dmaengine_pcm_register - resource managed dmaengine PCM regist=
ration
- * @dev: The parent device for the PCM device
- * @config: Platform specific PCM configuration
- * @flags: Platform specific quirks
- *
- * Register a dmaengine based PCM device with automatic unregistration whe=
n the
- * device is unregistered.
- */
-int devm_snd_dmaengine_pcm_register(struct device *dev,
-	const struct snd_dmaengine_pcm_config *config, unsigned int flags)
-{
-	struct device **ptr;
-	int ret;
-
-	ptr =3D devres_alloc(devm_dmaengine_pcm_release, sizeof(*ptr), GFP_KERNEL=
);
-	if (!ptr)
-		return -ENOMEM;
-
-	ret =3D snd_dmaengine_pcm_register(dev, config, flags);
-	if (ret =3D=3D 0) {
-		*ptr =3D dev;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_snd_dmaengine_pcm_register);
-
-#endif
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-=
dmaengine-pcm.c
index c7523bae45af7..1ecf3feb2bed0 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -520,5 +520,41 @@ void snd_dmaengine_pcm_unregister(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_unregister);
=20
+static void devm_dmaengine_pcm_release(struct device *dev, void *res)
+{
+	snd_dmaengine_pcm_unregister(*(struct device **)res);
+}
+
+/**
+ * devm_snd_dmaengine_pcm_register - resource managed dmaengine PCM regist=
ration
+ * @dev: The parent device for the PCM device
+ * @config: Platform specific PCM configuration
+ * @flags: Platform specific quirks
+ *
+ * Register a dmaengine based PCM device with automatic unregistration whe=
n the
+ * device is unregistered.
+ */
+int devm_snd_dmaengine_pcm_register(struct device *dev,
+				const struct snd_dmaengine_pcm_config *config, unsigned int flags)
+{
+	struct device **ptr;
+	int ret;
+
+	ptr =3D devres_alloc(devm_dmaengine_pcm_release, sizeof(*ptr), GFP_KERNEL=
);
+	if (!ptr)
+		return -ENOMEM;
+
+	ret =3D snd_dmaengine_pcm_register(dev, config, flags);
+	if (ret =3D=3D 0) {
+		*ptr =3D dev;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_snd_dmaengine_pcm_register);
+
 MODULE_DESCRIPTION("ASoC helpers for generic PCM dmaengine API");
 MODULE_LICENSE("GPL");
--=20
2.53.0

