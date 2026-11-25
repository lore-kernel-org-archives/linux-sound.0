Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.3
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795571066;
	b=tujJnMCfvWldhL7c3ElTEVZM7R5xaIhk7wfamEF3uNzAJcFNxC7h6VtrJW4nxtUu7K/1
	 nYeGSrjtyxoq3E0E7a40SrI101Esr+7UhEgWxXDfqMe3r4siwFAESf+sYY9E6DKu2cyWb
	 W5TcjERobil25CNRef4y2GcNToUXjmCanLxjTePh7OK9W4OAKOSP9is7jj+rhR2jaAs6U
	 GS8XtlOqWl/gT1vGelYcXxhVM87UnKbKfGjPJJBWuJmLRdtSn8bDjWWADo4vWU/wWDMi7
	 DEdoPOl2fTXIrOCYbZ1TVsOWAZfwjuMlYYr1tuCqsYuc8opwBUUsKv96eg693fasNIw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795571066;
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
	bh=+KFXWQ9J67nqi20lI+1kB0pQ9rVUr2Z83Z/mZVgymMw=;
	b=s7EY3reK1k2WciFilPRQEogVhtDRJPcAVTmD7diu3gLjzseW5X9Hva/Pj1QQiWXquSH9
	 zfig6+oBWGFikYP7XZ0wuqpygKgeGeAZW9YdBSl7ZJLOqkZCN3JUHuf6RJWrNbIILms+7
	 USALcc2dzXziSfMYLYYKAGUwoHt6xElGeVWqCOaP7TkLPB6adeTu4+LObvR5lDjAdCTbQ
	 uNBBQLXYb1MEFE2LIT2mqmYiVxntrn9V7Y1JstF05wi3DCGz6G7wpD1g3u4v2g+UvoGAi
	 pWwG7E3evPKmOr4ShPbnoFXLNqYqhRRAUEV8S1vtKSzfwFlLi/4jCgBz3DZowCbFhYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=JDE1EDkS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.229.3
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE87606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CE87606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=JDE1EDkS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bPrK+HIuMDRzdGrek+QCHPMrb9ZTSarIGVwHLGyBLqgmiyffFLtbhCMqtNANCcO21WqoAbM7ui8etfANLcnzUcrbBDgRSTjD0dNJN3YmI7g/+LQ4HTaNrlEPgoJiTTi1qwVnsPM8dBdnH0fKqMwC/M3Qmi3+WWvvK7O4OgI1UdYuiZfD/8+suqVKUg/v5r7Gu2VUqUdxDrcFj3tNmiQRq1fL+ueXEFZhG5/R4KXwWOIWfsoyvMjQfmNtuhIXUHo0Yy4vrRtoFb5g4oAWzx88kuREshX/bIi7dtJ+1KPD5KkC5KQW+rqyelDSBq5n/cy/puEHxP4tHrgnjCxBKb5r4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+KFXWQ9J67nqi20lI+1kB0pQ9rVUr2Z83Z/mZVgymMw=;
 b=FJAFmDqKUgcU243AUjwRHpX6jRbAbLlELK34pfgm8DShyJ3Z3Hkp0DGAHgHj/TFuTrEjbk4c3fxcYCaFW99o8O/YuB/K/ggaL0mD0E9h15h/frHalZ2UjcHNmNS2pB4QQOGeRiHDeuwx1PGhi0LEIJ7azJ80P7SSz5fsdpfKffT54KFxnImDqtd0dLQpGb5tucQaFEgNK47fcXcmt/04biE/T6W58Dn6sb+kvYZ8WV3q01/OvH/Tuia+F23L6cdOriicee9yruZ6S+9ktr2wDKKfr2sTwFyzHgSBaaJbnqK5S0k9DjKmSP33Sdb09kFIofzRp13PbGtSRNG1slYtwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+KFXWQ9J67nqi20lI+1kB0pQ9rVUr2Z83Z/mZVgymMw=;
 b=JDE1EDkS2TNYqgBg3D40JINqv/8hwUCYXXmGTbHJoIArTcaAntbsuGvPOLnFPlbd4x3oRQ/nI75zRRuW+x59oaqJN0SMCGTQlVqmcrurSF3lrURaC5hEvv5gSvu+W3ir3wZ0frX5dzLfRtU2voylrguxnozoGudK7BT6aND5X1A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by OS7PR01MB14506.jpnprd01.prod.outlook.com
 (2603:1096:604:388::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 01:44:24 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:44:24 +0000
Message-ID: <877bi1elc8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 27/27] ASoC: soc-component: add snd_soc_component_device_link_{add/del}()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:44:24 +0000
X-ClientProxiedBy: TYWPR01CA0014.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::19) To OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14)
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|OS7PR01MB14506:EE_
X-MS-Office365-Filtering-Correlation-Id: fc5c2636-21a0-4cdf-4d50-08df4a95a235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|23010399003|376014|366016|22082099003|18002099003|261009223027099003|56012099006|261028144727099003|11063799006|261021121427099003|261022105027099003|261102123227099003|261021123027099003|261026140227099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	IppZ4Wxnrmc9gI/oHcYo422BPxm9qoBqHokYkbAHYKxSdR8Quk967uNwWXWBLQ03Oew4hgmznl3ClzUE32K+vTAE8w+u1dDwSYzCkU4JYXMSws6YjKssZlyPwB1ohyxaHkvlEIWDNcw6sfa0AMoE8mtZhapcg004Qdcbmqc9X21J5di+pVmxypMbS9Mb2+vwPK5ZmveS7ht81tlHqy83jjgkIAEujjs89v2Ae7Cn8f7zP3inkaFWzqgh0E8AmFPxVEPSHK1pP3B0hp6vAqOzbwgXP7/E15r1uUdGM0vLKxmOzD6FjX044eGfZdn+UK5twBSf7nqyTpuXoO8BEdL1jSFz2Jy7XDWcm5WSD6hqOaTAdeN3xESMS/AJbP8qYuRazwAEn2tiWtkFgnE3so1J5eqB7iQ/kVUzmrrQhnAjFBAkkkGJMNY9lOGgThwaHAlX/xNzz9t+GSlm8IsO741ehrIMGN0bEZFIpWl5lS+CEnFeaOuC1jZZcrQR1/KVy23SYMYo8//o/ljMxukJ/HXCqH1/K6Gc1qORJyyYz2EiewMBP0WASNGJcWgqX5gYfy+IU+XAX3BHuBsRhhzErqJxYZ10yFfFmxMtOuYi2ePrQtOYbP7DDtM9sm7Eg56wP1szX8so9+u3cziw2iBOwlPmIj96PRooKh1/sK7lAoESwyHRCG69DS+pMHUIYMbTMscNgjXWVAI4fFBu31GevUhq+7puwfjzEiupniArew/f7hU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(23010399003)(376014)(366016)(22082099003)(18002099003)(261009223027099003)(56012099006)(261028144727099003)(11063799006)(261021121427099003)(261022105027099003)(261102123227099003)(261021123027099003)(261026140227099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?fE9wAOwQCqZzey5vOdyBojkxrzr9RyiX+BBGvXvB7TMLZGF4+FhNvvXfXH?=
 =?iso-8859-2?Q?03oawfDf2dDZoda80bDR1gR6y5Ag+d3HHlTrVRDHk/9XvE1D3X0MOscE51?=
 =?iso-8859-2?Q?4VewV78qaNy9VSjUG5MFOLrytco8a0GcxfiJnVBJ28ifQqg4Gj0NljZMkM?=
 =?iso-8859-2?Q?OP6mP0UylUXA1/6LVixvRP9r3Vs5vC62P6MYOpM0RdFw0esa2DCygc5FXv?=
 =?iso-8859-2?Q?aQdrcJF8F8HezImYn8jbyZhERCDF48Vb6IRkd+pZEXfYAEjJnl2VgGUSIS?=
 =?iso-8859-2?Q?q2nScvI9JBIWne7M9fciYQ2U3/nBihEVNaVd/TYllogpdcrOqqG4M/VwK9?=
 =?iso-8859-2?Q?5y73Mehequ1WxORF/xXKkQjJpP0JmmtQkena+pFNTXzJDzaMSP3dIeBMaG?=
 =?iso-8859-2?Q?wZtjUQA71CWzGL/RxUNfeQQSl83leHpSPBYFLWO0JNeBQ296GENTx9PH8N?=
 =?iso-8859-2?Q?i+0MPgg5jysaW9MTlnd7SByN3YkRuNOcKgiWcfFdn8j5APKdsrMG1qbIE+?=
 =?iso-8859-2?Q?dJ/RBLidDH20lPbpg3wLrlkl+gFpYW2M9VV9pa62LtYugq+/kDKXIu3cYp?=
 =?iso-8859-2?Q?hAuvL6u4xMH06uJNMddNT7sRG1bZbwPB2IaZHznFUKYcgVSQP2rwx97fpQ?=
 =?iso-8859-2?Q?Q+rArMuNc4vxRcol2NUWnLNI1ETz7bQaQ0C7zMCorrAVmyrCiSN2F5ozKK?=
 =?iso-8859-2?Q?Uw+JsP9xNh2w1dBrx8Lcr+vQgiI5KmhyNoLKk/XwpItl0m81Ik3gyqndSn?=
 =?iso-8859-2?Q?p47xPTRDs48ZiAIlMZ2hO5Hjf8r5VvZQ/yXWbpQmkch45dY8o5R5p/MQ/u?=
 =?iso-8859-2?Q?buHa6JoM8myXvVp7GkS6G9dW+YEJ6cs//uH530dDEgDPq2bz1eYrrpzLiP?=
 =?iso-8859-2?Q?KMKdJyBFEev37sUsylS8Jw9ylXkdgShBsQ1QmhdnhyEpNH1wGgPrbZUPNi?=
 =?iso-8859-2?Q?x9XoRpdc6h9umjRWQgaTIhwnyePYWh9zfpTI7WUkSNumESg6xwQg53WVbR?=
 =?iso-8859-2?Q?0ikqsNCdJNderWBFPGzYyqFAZQUl8k6IYjmxeSJYd0NdaPOPS4BLRRVN5J?=
 =?iso-8859-2?Q?cjIcBw95uhnj5z4aD0CX62DSR51jEOxCJRIXAs/ALmZmqXOnx6mXTTXOi3?=
 =?iso-8859-2?Q?rw63Zudb7JmW3i7L5yKX7OhRkV8iLsBeod4ydp+dD9Miuv5FJQ4Yh6nAWX?=
 =?iso-8859-2?Q?0/5WvlworSvA09LMfNo6l2CzI8eXWEuRwJ7yr2lI4Quig0OgBlH/sixAFL?=
 =?iso-8859-2?Q?SjIb/vokVYkphHCJ/toTn5M2LpDWVA1y+ZPjWIxP4HjhScbfR89qgs7mcx?=
 =?iso-8859-2?Q?Eh4Oo9FWjavd7UUkjSaeFdPPXOBmB+By0iBZblqR8gG+uQby1vRMA02hLS?=
 =?iso-8859-2?Q?lzNSvXsCehzPjWagOY7Yy9P8DvWAH/vlcjwb3IRYTD2beVXuHNWgJ3qsa/?=
 =?iso-8859-2?Q?I+ix96R3oRE0moip9CA8wONoYcNL7SJNep6Wz/5tCKuvoDTndZZV1YzgC4?=
 =?iso-8859-2?Q?HTrbnYmW1v8tju6Z8RfRNkI1YO0V6S7196RU6cqhNCjdM/NCqQizgjemTY?=
 =?iso-8859-2?Q?Utdtc9o7S00FxwnKdlOHC9WP2+VdsxnCLqvS5s993QvlA78nIr29lXiciZ?=
 =?iso-8859-2?Q?28TWuUO7HEu5sJXlJN/m3azM2UfQTrjqc6TtpW4RwllnqhAD/mnrJd83ul?=
 =?iso-8859-2?Q?aOnokd08PZx/A1UYwd9pG9uIjspK1l1D8pjZBL3U2EUe8V/iE+rZ7a3HOv?=
 =?iso-8859-2?Q?3ztYacMRf3j/Cw7cEt5It7914lpIPS57VwCIAXd7Qok3hvtDUpHloGuBE2?=
 =?iso-8859-2?Q?gDE+YioRA+1CoSDhBO8uqAQvFcNCP0QB1zlfSkVTnUHfeJ7fApkV?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc5c2636-21a0-4cdf-4d50-08df4a95a235
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:44:24.3001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vechD82adnCiUfZxSZRyv+09E9BO4y18vggxAFY3bNmUfIgAnJNGGQ9380YIRA0+kirBAAhRHE9Pp9ai+CXjopegnqZX4yfPJq5r+IB+jFmz7YjzGGf9ogZ9WPYyB0d7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14506

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_device_link_{add/del}() to handle
Component device_link.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-card.c      | 22 ++++------------------
 sound/soc/soc-component.c | 28 ++++++++++++++++++++++++++++
 sound/soc/soc-internal.h  |  2 ++
 3 files changed, 34 insertions(+), 18 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 6544dbf2ee260..079312216a3b2 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -884,12 +884,8 @@ static void snd_soc_remove_device_links(struct snd_soc=
_card *card)
 {
 	struct snd_soc_component *component;
=20
-	for_each_card_components(card, component) {
-		if (component->card_device_link) {
-			device_link_del(component->card_device_link);
-			component->card_device_link =3D NULL;
-		}
-	}
+	for_each_card_components(card, component)
+		snd_soc_component_device_link_del(component);
 }
=20
 void snd_soc_card_unbind(struct snd_soc_card *card, bool reuse)
@@ -1043,18 +1039,8 @@ static int snd_soc_card_bind(struct snd_soc_card *ca=
rd)
 	 * If a driver pair already have a link in the opposite direction
 	 * they must manage their own suspend order.
 	 */
-	for_each_card_components(card, component) {
-		if (card->dev =3D=3D component->dev)
-			continue;
-
-		component->card_device_link =3D device_link_add(card->dev,
-							      component->dev,
-							      DL_FLAG_STATELESS);
-		if (!component->card_device_link) {
-			dev_warn(card->dev, "Could not create device link to %s\n",
-				 dev_name(component->dev));
-		}
-	}
+	for_each_card_components(card, component)
+		snd_soc_component_device_link_add(component);
=20
 	ret =3D snd_soc_card_late_probe(card);
 	if (ret < 0)
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 5475938f80738..de3218bb2b2a8 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -122,6 +122,34 @@ void snd_soc_component_connect_dai(struct snd_soc_comp=
onent *component, struct s
 	component->num_dai++;
 }
=20
+void snd_soc_component_device_link_del(struct snd_soc_component *component=
)
+{
+	if (component->card_device_link) {
+		device_link_del(component->card_device_link);
+		component->card_device_link =3D NULL;
+	}
+}
+
+int snd_soc_component_device_link_add(struct snd_soc_component *component)
+{
+	struct snd_soc_card *card =3D snd_soc_component_to_card(component);
+	struct device *card_dev =3D card->dev;
+	struct device *component_dev =3D snd_soc_component_to_dev(component);
+
+	if (card_dev =3D=3D component_dev)
+		return 0;
+
+	component->card_device_link =3D device_link_add(card_dev, component_dev,
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
@@ -71,6 +71,8 @@ int snd_soc_component_probe(struct snd_soc_component *com=
ponent, struct snd_soc_
 struct list_head *snd_soc_component_get_list_head(void);
 void snd_soc_component_connect_dai(struct snd_soc_component *component, st=
ruct snd_soc_dai *dai);
 void snd_soc_component_active_update(struct snd_soc_component *component, =
int action);
+void snd_soc_component_device_link_del(struct snd_soc_component *component=
);
+int snd_soc_component_device_link_add(struct snd_soc_component *component)=
;
=20
 #define for_each_component(component)					\
 	list_for_each_entry(component, snd_soc_component_get_list_head(), list)
--=20
2.53.0

