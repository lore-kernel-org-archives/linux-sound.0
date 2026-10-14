Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011028.outbound.protection.outlook.com [40.107.74.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13003D8911
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946765; cv=fail; b=KGzWrKtFYMTwRMztPaFE/CifvPRPmkj53CROAzT9cFYrK3skWfEh6rmV/UVjcqO8JbzsP0SzKbX+bhA8G+PMPDz6S0c1hgEJs3UKXee+u9RAVxi69g/HjxBzpoxGAo9CpirnCLiDyirdvCEhd+nXEo3LHzb+N1oYjBNQLHsBzjw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946765; c=relaxed/simple;
	bh=KMROCDkPNOV2ByJtFOa/x0zAG/qQ/2i5tdxPW0W0gDc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hZ/fBM6wixDk7KMrceoNXy1f4otWDbsO8wIluh+fN5NxtLYYqTwCnly3SJRe9nvUEobWTwQTLc8kcNGxtkHSwxCBL1/aYIBXc8kbIprfP/qj9/0ILBml/C36Zfire6KtaRvH4dMETmEf3mkbcEur1z/RkSQ4TSx2XdF9rBaotlQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ReTuhHVW; arc=fail smtp.client-ip=40.107.74.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ReTuhHVW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQNDriM1U7TqWIKkucloyRdqL221BctSVodkBkKXsN20ZcBNBe2157utzG4DbwVt5AqxA+UJ/5owAmV6QeK23G1C2NPLXQHjL6ajSOI6xVOIClDGqcxrYa93M3vP6VKUbXSpCVgX8/8iZ27LSq6TW77vKmO1QsUhXkA2u1DeCHzLh7BiVwQUH7oDHpkROBhdl33NF3Gq7cfEp/ZnArVIG2FV9L5x9rB4CJMhOs2bg7+k8yjbvhn9XmGUuZkZVxZzx5mgA/eoST4lRXSe4/I4+uD5dkgEE7aaDjR83orl/O5qImZeGlKK+olES/fcNneOR34sz9N3MIF7LruSzMp7FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqw6oQ+NsjPR+yIz3NY43NiWJRTDr9xxSdidpIa/uI8=;
 b=M+VSeNNxvao4m3/zQfqBxmMTwy8oYjLwii/A9N/Enwhc3On2a3YVhzmor4G5lq7CFdBTb+Ei33VXjLePD4wNqucWn7BRyRLy9X3BUJMXkC8ZKdUCz5Wfm0KaVSPVQnULq+Oj12M77Nt2gdl1+5i32K3x2V0/jwcVerxOAwvaw0eLcwHsoAGf796ddxOEpQR5N0c/p91iTP4gYnx246GOgn4Ceq3/bpk6UR2q24H3Ti8BmUlVDeSSlFCYHi70ZdnBh32pgwosQJvluQeUBD98hBOSFmbV5PcncJ7NCryV/Z64iElKb0KbuyUupH6s1TObMXlNsfT75x+Eh51Rw8cfUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqw6oQ+NsjPR+yIz3NY43NiWJRTDr9xxSdidpIa/uI8=;
 b=ReTuhHVW903GgZ0rXBw6NhyaBdoRO+c7gjpyxNCfd1940T+Rl+RkiJEUTw+gQGy3UdC1sIuwqd4+6K8RcY4/OcR1hp2o7JXV+AwxJYhU8yyYzG1W2ngkkhxyXrXE6mIyUglaNmDKaLbvNv6oX2Mc8yIKr5r7oTSlNizk4qvI1T4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by OS9PR01MB15638.jpnprd01.prod.outlook.com
 (2603:1096:604:3bc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 02:59:21 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:59:21 +0000
Message-ID: <87a4ohyol2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 11/13] ASoC: soc-component: move component_list to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 02:59:21 +0000
X-ClientProxiedBy: TYCP286CA0256.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::14) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|OS9PR01MB15638:EE_
X-MS-Office365-Filtering-Correlation-Id: dfb7aa13-b5ad-4bdc-98eb-08df299f259e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|52116014|10067099003|22082099003|18002099003|11063799006|261009223027099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	DP9pTZdhkZF3ZXw4mQQSlUHhshz8FVFqMkm91i+yR1e2fw5/oOfEEdmhYv6gNcO1EHzn0XW370h+OuAfN18Y5TeDItEn6PNJaX24tlljdis1mWIE6IX0fJmY1W+1frBk9zllFpi+tLsJ5qHs32GJxYGS0yFEEwQLYZv4siR6fvQGZJcsFVul5kJrNf0U97odO1t0JKmy3xpbrjBKfo+HillT0QG59DfxGXUsx+5zNs2rjASrvThR8n1alQN8pkmSUOLJa6UKgNJXvcokED/gsudO22G0KwlJ/LSrZMfF8lG+Bx5BYQGXXtWjYotsnyPoyO3pUWMMCTPypMdvwAE5xo8oFR4wDCXRlh4LyYidfSun8ifa/bvLDVY8C/cgFSaHStVdM5Qxk6q0ExWmXR8+5ROl//U4XwBid5/Z8Ja3D+R+bNtjykaQKgUEuKnoSoNIQTLbhq7aJDgZI+qSRB2kcVSKw/45nSrFtKa3tyNJgpbJOxrlBRkSE0Nl02pXy+MCeQVK7KE1Yi4z5g/YR+qsEZEMGTiWPGVTcWqRb+69ZKW0NyGW0ZM6D/EhDc5wjkbNtftZ2/s5dhUFLtpCHI+0oiq8+fjMiRWF5oilT47ODdyXdRXzZrDSiJxBGutFDfS/cn9TbpH85bMjKiBN2TpDlyZXnqgZ66t8uEUwKXNHqAjXpguVudEmnzt2rx349LO8zqyYdngWgvKkOzm1Bg/JcKATKv/imywdjpAdJiCtwJo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(52116014)(10067099003)(22082099003)(18002099003)(11063799006)(261009223027099003)(56012099006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?y8fHRXF2FQUzHGKuWDxAvP81YYpBM0hbqIgWOcl1bIIm27b53nPD4oc5sX?=
 =?iso-8859-2?Q?fMgDSxA1AbznOZgDWEg2ibnRRzfAoSAK/dbbqgDYEM8KBRa5bFUsdDfoPQ?=
 =?iso-8859-2?Q?M8JqEH9MUvKlEdUqPbzGV2PZyX0yGA0d86yxNl9VORUnRNPRLIlva2ehr1?=
 =?iso-8859-2?Q?vsMc5Jx8/iy72UAh3eamniv5kZkBkqKiEumA570GsQSF1JURCjFH999IDy?=
 =?iso-8859-2?Q?MuZX0Upz+7l+n9+im5C/YygiF6dl5NigbKM0wVaS8Nn+wE4Hw0jeScy6tU?=
 =?iso-8859-2?Q?5+OKrkmQiO4CQKqXbqxtwgpj+UtPpOfbDtiKINSNta8NWhKn7tsE8lfiib?=
 =?iso-8859-2?Q?8X3N+FPiTozRkI3WCkn3TwZZH3PMT7bLiZcx5xYnpGnP0jGhyx2aDo13xj?=
 =?iso-8859-2?Q?UvCwIxAXX5RkNdHcBvLP9bGbA70K+oc2EioW8/9irWJYq4u7OR5E18N1EF?=
 =?iso-8859-2?Q?Qe4RYFSjcldrqsqNjusEAAvgdLL1goh34+n9cKTKwyrcF65E9vvjAgyZWk?=
 =?iso-8859-2?Q?hHl4q7mZR26Eyn6YBHKCbh+WzWxHlh2SVGUvi34UPcp3/IZj/bBA3YUfxw?=
 =?iso-8859-2?Q?NWhVzwTTkAkN5Ro5aZ5h9YwFc0J51FQeh18pkalC7Ygp1MB1fF0riFs683?=
 =?iso-8859-2?Q?UYNUxnEfo7NKPp1Dj9Nmkoy4Da+g/G7hdInMwPkkz7cp0fHPLSZlOQfPi8?=
 =?iso-8859-2?Q?O+ahAAsdyGkNiv++p95bwUCu7VOwmBwf1UX1TPTX0lTbGMdDBOGAXpA0Md?=
 =?iso-8859-2?Q?zeLA63N/yLjZBjKxX399eTKV6UYGUESrsHTQempgmNqkj5doN5elSF90r/?=
 =?iso-8859-2?Q?NgfNG1JIPa5NpWyWxeoS6032aj3O+ABQjHX2GnpVKCGhlP5XLSVNMHU4cR?=
 =?iso-8859-2?Q?Kghb4i23iIDxBhMB61F3G7f0y2mQIlkXk2XI+nq/RMYd9L0Z8gp5Jo0OQC?=
 =?iso-8859-2?Q?wISI4b2anAzzTweF2EYfhBlOrSiieZHPXO6H9UxKXtDzceFsNAaX2pPgBQ?=
 =?iso-8859-2?Q?PMjcUFwgBJH7YWT4640e2Zn8ZHW8uKlreYrSZhJyhPrL7lIvGluaV7rMVZ?=
 =?iso-8859-2?Q?Jf6utGr+n9aZor2I1dIEx8ovIjFf8KM5Ci9ywTjlZOeVaZcNf7KyG7XQMx?=
 =?iso-8859-2?Q?Ti+f5rCnjsNAA6EBlSGHU/1rziSlFMIcxLwRX1uro+yLS+BafYrjO9ck5u?=
 =?iso-8859-2?Q?BVvRkNk0cDjcOM1jRsnVuzdgmLCROXqNr5sFv52M0HE22cv8hkA8mbsGcU?=
 =?iso-8859-2?Q?2Kat/391FvDxp8v5s5eOcEOKwuvR3xSSgeE/g7Jhj7AaFhqkI2fTIq1/ji?=
 =?iso-8859-2?Q?ODnVqqiR9nrq6fb3Dbp2kFKscyABVwwKfM6/0/9HXDwFnZ4QK65A3VWriI?=
 =?iso-8859-2?Q?7MNv+XzjnouYRTZIRnSoq3B6Z0zC6NyrDYbovw2efkl560Dz5wPdy9P8jb?=
 =?iso-8859-2?Q?mtL4GoY5cmXeuGOCMUjZMiKxdEHpZp0hfbRhcfvgl75s40tgPe3Sh6RbFQ?=
 =?iso-8859-2?Q?Qnw3AA39HcF2WmD2HxJ+UM7MrwQbySvC5bqbDncb7mDsd5QXSJvs+BHP36?=
 =?iso-8859-2?Q?F07p+sHtSk4nOLaoZb7Y9aENjs/OWvodLvP7HXDqallHYRs4JjKY1BQxOQ?=
 =?iso-8859-2?Q?2ctGPu6NlhhZo68jsJxgchDFMkyg3Z2QAOgE+fa0aQPI0jo8Scaec7zYnc?=
 =?iso-8859-2?Q?jqgWooYYck1d7FZ4R0eOmw73vIzN+iqhTVoV8GzHfyI3X8D9zPNM/T9C40?=
 =?iso-8859-2?Q?UCwu6r1aXkNoXoL3KFLZ5d0/IBHKFERIuD044EU2//qsZhxdjYahYKaQ3F?=
 =?iso-8859-2?Q?/jXBJUrS6UeZYCFHXr9XIFzjlPEBgdqcjVBwHPCNjX/0j47huYzO?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb7aa13-b5ad-4bdc-98eb-08df299f259e
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:59:21.8295
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4KuNXwhNRERdGA3NT+4RzwK3k84zcpsiHDY/wsnHBIjjBPoS1BOHtN6stoa9JEdP9KBWEU6hA577r7yan2p1Ah+TP5q5n6OarSYbr/gsOnKrBjH3ySyiUzO8Q6k+BWMy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB15638

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move component_list to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-component.c | 6 ++++++
 sound/soc/soc-core.c      | 7 +------
 sound/soc/soc-internal.h  | 4 ++++
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 962cd7ab3cc23..86ede607ba31c 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -31,6 +31,12 @@ static inline int _soc_component_ret_reg_rw(struct snd_s=
oc_component *component,
 			   func, component->name, reg);
 }
=20
+static LIST_HEAD(component_list);
+struct list_head *snd_soc_component_get_list_head(void)
+{
+	return &component_list;
+}
+
 const char *snd_soc_component_name(struct snd_soc_component *component)
 {
 	return component->name;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index cd318d232ee33..0e935de91d0a4 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -47,13 +47,8 @@
 #include <trace/events/asoc.h>
=20
 DEFINE_MUTEX(client_mutex);
-
-static LIST_HEAD(component_list);
 static LIST_HEAD(unbind_card_list);
=20
-#define for_each_component(component)			\
-	list_for_each_entry(component, &component_list, list)
-
 /*
  * This is used if driver don't need to have CPU/Codec/Platform
  * dai_link. see soc.h
@@ -2396,7 +2391,7 @@ int snd_soc_component_register(struct snd_soc_compone=
nt *component,
 	}
=20
 	/* see for_each_component */
-	list_add(&component->list, &component_list);
+	list_add(&component->list, snd_soc_component_get_list_head());
=20
 	list_for_each_entry_safe(card, c, &unbind_card_list, list)
 		call_soc_bind_card(card);
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 17ed22c2cd505..b844b27574c8a 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -44,5 +44,9 @@ bool snd_soc_component_matches_dlc(struct snd_soc_compone=
nt *component,
 				   const struct snd_soc_dai_link_component *dlc);
 void snd_soc_component_remove(struct snd_soc_component *component, int pro=
bed);
 int snd_soc_component_probe(struct snd_soc_component *component, struct sn=
d_soc_card *card);
+struct list_head *snd_soc_component_get_list_head(void);
+
+#define for_each_component(component)					\
+	list_for_each_entry(component, snd_soc_component_get_list_head(), list)
=20
 #endif /* __SOC_INTERNAL_H */
--=20
2.53.0

