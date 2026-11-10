Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288310;
	b=x4w6MqlqAdUAqPvsBVDf7Xm0BXave6enP0vQyaJhyrfYfwBduc5Cca0HtHDTmamHj8Sg
	 4YTjzzngHMVxgKF5pMcDLqPJ8RLeWk7Om8otvuC5skwx+K6EB2Z7eXRmQld1NyyBr7mDT
	 +qXcozwlHWi2tazojD7xhp+lYy/u1qtCgWboAkVKx7wjieMWY9QeR/JlEXtV9Yplz8WYj
	 MKVoCCxGoElF86rwEC0hyPHlOzJKLo0NW3Z8GL/QIr8ZipH/U8G2zi8BF+nBniBxjiiDS
	 F/f/fSFH0VbCU8BsmbaMWpOaIW7ypSXaZKlEI0Nki4PlMesRPjbPw7bqgXAezcHAPjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288310;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=lvEXxflrWtMojkBu3QJ4WqbwP3SqdaMO3Q2bx3+HZU0=;
	b=v0wx2KtfYg2MCAcwArSv3t8BXfLemc9qi5iwxH70/QNrGEY/lbQWt/W/SRFTsPWK4ggn
	 e0IMXi22SX/AhiLVuCONvViYM5a+C83x9ZGQo5zTOWNMb6yucCIaHyvVOC/Svxpr98ori
	 KUgc2wh5IAeiSMygpGwS9xVqllm3c74Qq06aS85WuzBRV+RymPHGULj1E3szgRR4TygfN
	 nDKiCzgsQwW71pBOTRsLkgP00SOzPlPO9HNngMxVQsmIZvLlIPohTFrNwflpR6RqSKpVy
	 w6MCvgtL5V715ZTkndQuB39Tenovp36Jji4Kap+sGOBlDbaQ+DdD5le+Kkpz2VqsvIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Orlla63H;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.33
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD67606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:25:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FD67606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=Orlla63H
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+a8bZn0p31bpv/luKJtczn2/w6h9b2d+gSpK6qQ/e9DOkJagCA6N6Zbi+3obM3u3R8/t+mVmiaLaQsu5gCnQO8M/5xcYKZZJhnQOKE52K04xVTIKEmqH38dBwxQMpS5ZS2x1x91V8nBKsHS9BLRpUJQBqxsR7bMLGr9OdUGk1Z8w2lzwTpKZk7TQ5VJjRTCnQTXUgVKAaUcS9BJu3OjH2jVCX6Hx7MfF/G8prcrLfrZd2M35sjesRc8s2cOyCgcYH9jHHnWs9+zSdHlfavBBG3u8r5lyw71kL08c9JmN8uxb57xhPO2h2B1rWMftXB4lZk142E9DO1Bs06xcDB6HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvEXxflrWtMojkBu3QJ4WqbwP3SqdaMO3Q2bx3+HZU0=;
 b=Wplh9jqiz3WlQbTSMuu/OWgelBTo4dexTKfXXhSQRuXq310GGuPdzwlTDLlzjhq6wOR30wunYlmI/ir+ychwaOjn5lMHVBz3tMT8i8dYWhJUz4MdUpxDhFXBAxmJl5h8E6Q8uxHekKHRsuH4mcomQ/5FA9AggY9JWRVLpmd7YjNM6ft9bRI7uwdCzB1CHmQJxo4Qm62yjxdQbQStzOdJirIU+uaXBmSWMbL3BASEsqurZ1/aKm7+aZnz/SLGCujXxZBuP/sO/h+Ts2zzb3xevNJJkxGQrm+z6Cm8lvmRtksCc2caK2qAI0NYggXD7FaCUPgYu0kM3ZP0xazmNsZrtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvEXxflrWtMojkBu3QJ4WqbwP3SqdaMO3Q2bx3+HZU0=;
 b=Orlla63HvyX/fWnEjdM6eKEwpf8XN6N2W1TzBr96M9GQU8Knmv7ATmzfmKadNI94J1CXHW6qk+RifJiB5fc6dLpI82imgzS5TSnl4apEF3XHGey7UMgnDIBgK/j8qbV3jRnnJPo/YsFbmaREOm/rGbF29zFFeYjS6VIMADO5uu4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OSCPR01MB16478.jpnprd01.prod.outlook.com (2603:1096:604:434::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:25:08 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:25:07 +0000
Message-ID: <87fqx9mf64.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 20/20] ASoC: soc-component: add snd_soc_component_device_link_{add/del}()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:25:07 +0000
X-ClientProxiedBy: TY6P286CA0020.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::11) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OSCPR01MB16478:EE_
X-MS-Office365-Filtering-Correlation-Id: 27fce9d7-5316-419b-03f9-08df3eeafba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|23010399003|366016|22082099003|18002099003|11063799006|56012099006|261028144727099003|261102123227099003|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	xfO4ihTCHHtn1KNM03eHfNXlIecW2OXhQm3ALbqWw4eMvsO22rT6hG97yZezcB5EjbWuSPthm/63SQgAxAVM7U/HtVho4wSXI2tOgVdGqqFQxUDIZLf0eYiqEeFRyIU7w+UIRDwp2Ud2OR+evLNjSZc1hDORYezM59DafiIZ/ipWOczwXk0QywQKtikjYWkr9dgJPZNLro33cc0Aau7QINgfFLYBGHF6BTc5gE2Y9xC5nxahXdNwjUfOOPQxylqn6up4y8gEg0+z1DOVG7YskUQAL9Gp93rbUpozoG8IqWvBAnNwX/RuDyfFGeW10gAdUpxFe153IwdaqpdQxrzwNV+HEui2fDZvgWaXV4+iMlkaOjrBy7DWx3y5l3Rt3zb48MZtw8l+j07Prvcu2VhHAaOWN5xvGdtl3qnnqegG0OlQ7F6fZsbJUVYyVXrREgB61wX951TVjF063VV7+1Seq69Q6dVX0eWUY/a/WcurC9zbbUSQmxj8ZwcHp/92gsKYz6I/6x2Z2f0St1eSdkt56r6OEu76jJ+Xvp6LsgVqk6Tj3XgPxE13LKm1C/PgYuLLJKvzvrKFKoEkmE1mqcqVIA8mnNpDrZApugWu36M9vp7OakSaYybmyn54HCo2sUFCQXkMAPRAZk6VQ/Mn22rjAGi2SvyAdIMQezXId5Z1I5FPJQQz+we4OEPG1PtI1t6TnxfUzZDlZyBokOfTOnAWqz/J/5Jr0qubbpaKKf4iNYc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(23010399003)(366016)(22082099003)(18002099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?w0WyZBvCkSVkCpsCDVlhOWqdnSN+DySJjzjj4nnautP5P1omFYTZV7Dzn7yd?=
 =?us-ascii?Q?O8LBmIqtXRBEjBJpADD5J5wZlN4OQwFKSivIDGcE0OablrUx8k1wjbRejVIb?=
 =?us-ascii?Q?rwiqvA2naJHSrEoPeW9AINIw7ZssGU0AtHwwHLhPWrvy3Cfm0WhMPgU1WO7z?=
 =?us-ascii?Q?FeVqj5aoYlKYsIApJ0XX/f7ACNoPpNmrF26jgC1WZWN+E6qbXXoSWjmn4MrU?=
 =?us-ascii?Q?Z0qTLFW39DIfqIWOho0gsi+sCmru/NsrFZXGg+wo4aIU8v1LDyXGktu7S2Zo?=
 =?us-ascii?Q?byeb3MI+WFtDWTnv0RO9eYa/1vYAaMQlyPcqBRzChcAxzPD1oVrevirc/rX8?=
 =?us-ascii?Q?JBhbxx5F50gm7j1eSbGB57vVdXlPQL8YmlIE2whhr82lqGC6h6yzy9hl1ZgV?=
 =?us-ascii?Q?jVUi7VwNrfxM0LXAHNjMzDM9TVrJZpR57VOsc82XehR/gKEHtm6KXcxxaGGz?=
 =?us-ascii?Q?NCUZa8zhz708YelOxdMbueksGBlF5ZZ+Z59WMN1+zK3U8GjR0jt4/pBDv4bh?=
 =?us-ascii?Q?x+bGKeghBvV11Emil3amcBaK8QbEzgwr4U7w7j11MRmT4uaXmWes5OK3QcWa?=
 =?us-ascii?Q?rb905Ustd+9RdH0ksy4hHdz8gEMMeirpZmMOJNCTqjW2aJibpioqBqyqmD+a?=
 =?us-ascii?Q?0udU8Bo1ldBa2yYlzc/pzu6hZpjllX+5XmkVmCYVUvSmAicH6mpIpgh5gDr+?=
 =?us-ascii?Q?I0ombVBYBjDb1U+7ywFMiE9Fw8h3XOEf03q2Xk5fktiPmQ3tleOpqm6frTUt?=
 =?us-ascii?Q?WLr+fcFrKrI/BG4/QVVaJ9zZquDDgCj9GjXSQQ46hgbuwD5W5ZvPD10vV4bU?=
 =?us-ascii?Q?0GN9x8xnkcF9jkjVWJy6IgXwyF2YgViIDSKyerMopQhh54bScFg3XI+fTXlB?=
 =?us-ascii?Q?JnWCYqmzMJayQJp0zJl6fCbiKSahgtbS86FtrgoP6R7d01kIa80/5bvlRBgI?=
 =?us-ascii?Q?hUjVHwpyLVDc9WdaNmYSC1OFCHfXASjCe5KCsdkbMPnhZt0M2xr4foTTCHNC?=
 =?us-ascii?Q?ORMOZ8y11R33TjZkR30ADLuTvALtSEUTPyjYWVmg6O+mxP7bGwCz3+b6h1Me?=
 =?us-ascii?Q?wG1O2ejCPeY00x9JUL1pA2bIaXQyMpoy8kejiYCd+ZEi4W0YYQo76aS1RsM9?=
 =?us-ascii?Q?OIJNv1eNLBaU5w2/Y8QumbVqXp3K79qpMfgbb7VJDF4PDdy49XFExo01u8KO?=
 =?us-ascii?Q?BFxFD8mp+ewb9+nkXet44hp7FxL9FB9GfZ8JYlHDSS/fZ2kpY9aOaEwyjNP2?=
 =?us-ascii?Q?uEgO8mpAcw3IoBKLiew/mwgnVI3iqmhJ/jJghQGaBW31Ze58KApBg4M5CO4m?=
 =?us-ascii?Q?rkLgT6YrLoKOynrfx5UY1Wm6tuJghezdPy8YiqKqQAfu/yR1R3XCXkDAW57R?=
 =?us-ascii?Q?EaBonEJDqmphJPD8DcOIjrJ6RO4pBTGAlSlf7D9bVefG1rt/tnHvFGnkfeRP?=
 =?us-ascii?Q?wRPL9SYTg4LsrYH+LFKU7me1Fhr9F6drDKfahGqlLwSQMsgEYF4M8NOxkOpa?=
 =?us-ascii?Q?oztPy0rc1y8MYjOTMstcydYXMZnyXbjk6vIipsyctWc1iUZl/sCmVbqTcpVp?=
 =?us-ascii?Q?i4wTfdlDEKO9SxZJUUBMl+08kuYFCVtrpI8T7MOmC6Xg0XmqWNEZBt6VV7Dw?=
 =?us-ascii?Q?QBsMXh+5egkWFt39BxwMQ3xMdCrzCv67GGU8Fdr5qNbLGed1fxsd5+h10e/I?=
 =?us-ascii?Q?22x+iOAXHVlAG1Pd1EymF/I67cLtwIU8rTsS5U3KTAJwtuAvgPjdsUtkLVA9?=
 =?us-ascii?Q?FndgDOtf8XrIjBJX2GAPDKbEWOXnI45fFxkYVr4j3rhhWcjNp4Hq?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27fce9d7-5316-419b-03f9-08df3eeafba8
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:25:07.6575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GDNN2cVqbZ0JITS3eGgu45i4TGgOoZ3ZPgeWO2FBJJScx52f2nCLnDaS8shWHI12vi/lJg2kgXb6r/c7go6nxhA2GwWKEKob60h9ZqODXek1GKByU8bG1vMM/r7W6N5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16478

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_device_link_{add/del}() to handle
Component device_link.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c      | 22 ++++------------------
 sound/soc/soc-component.c | 28 ++++++++++++++++++++++++++++
 sound/soc/soc-internal.h  |  2 ++
 3 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 6544dbf2ee260..079312216a3b2 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -884,12 +884,8 @@ static void snd_soc_remove_device_links(struct snd_soc_card *card)
 {
 	struct snd_soc_component *component;
 
-	for_each_card_components(card, component) {
-		if (component->card_device_link) {
-			device_link_del(component->card_device_link);
-			component->card_device_link = NULL;
-		}
-	}
+	for_each_card_components(card, component)
+		snd_soc_component_device_link_del(component);
 }
 
 void snd_soc_card_unbind(struct snd_soc_card *card, bool reuse)
@@ -1043,18 +1039,8 @@ static int snd_soc_card_bind(struct snd_soc_card *card)
 	 * If a driver pair already have a link in the opposite direction
 	 * they must manage their own suspend order.
 	 */
-	for_each_card_components(card, component) {
-		if (card->dev == component->dev)
-			continue;
-
-		component->card_device_link = device_link_add(card->dev,
-							      component->dev,
-							      DL_FLAG_STATELESS);
-		if (!component->card_device_link) {
-			dev_warn(card->dev, "Could not create device link to %s\n",
-				 dev_name(component->dev));
-		}
-	}
+	for_each_card_components(card, component)
+		snd_soc_component_device_link_add(component);
 
 	ret = snd_soc_card_late_probe(card);
 	if (ret < 0)
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index fa5dd07bf498e..1597acbe1a965 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -122,6 +122,34 @@ void snd_soc_component_connect_dai(struct snd_soc_component *component, struct s
 	component->num_dai++;
 }
 
+void snd_soc_component_device_link_del(struct snd_soc_component *component)
+{
+	if (component->card_device_link) {
+		device_link_del(component->card_device_link);
+		component->card_device_link = NULL;
+	}
+}
+
+int snd_soc_component_device_link_add(struct snd_soc_component *component)
+{
+	struct snd_soc_card *card = snd_soc_component_to_card(component);
+	struct device *card_dev = card->dev;
+	struct device *component_dev = snd_soc_component_to_dev(component);
+
+	if (card_dev == component_dev)
+		return 0;
+
+	component->card_device_link = device_link_add(card_dev, component_dev,
+						      DL_FLAG_STATELESS);
+	if (!component->card_device_link) {
+		dev_warn(card_dev, "Could not create device link to %s\n",
+			 dev_name(component_dev));
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 /*
  * We might want to check substream by using list.
  * In such case, we can update these macros.
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 1190be669eae3..e713d13543b2d 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -71,6 +71,8 @@ int snd_soc_component_probe(struct snd_soc_component *component, struct snd_soc_
 struct list_head *snd_soc_component_get_list_head(void);
 void snd_soc_component_connect_dai(struct snd_soc_component *component, struct snd_soc_dai *dai);
 void snd_soc_component_active_update(struct snd_soc_component *component, int action);
+void snd_soc_component_device_link_del(struct snd_soc_component *component);
+int snd_soc_component_device_link_add(struct snd_soc_component *component);
 
 #define for_each_component(component)					\
 	list_for_each_entry(component, snd_soc_component_get_list_head(), list)
-- 
2.53.0

