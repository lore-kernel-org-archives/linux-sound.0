Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443625;
	b=5DcvdDCXQFYo3vaD5KeF8TZzgHDOiFmeWtC7ugXYq2Zjx5SIOx9ALsB4+a7KDL4gIc6H
	 d9v7r5us1eff1Skn8RQ5joFveef+WRcZ0I76/2YqoMPJQmxMgmaYuWdLqZN8eZ+j3UKd+
	 H/r0olYoKT71fVFQ/jIDbqSaXRiQftYePPhtNtRanENhJMMYkXY2nhQrVQEgAsTNmiUgf
	 lARE2Nu0BsGGZjjxHitNE/BWFqe1tdlnq0M0L28VS7ctTcw1CnNHGZ+mgP1vUu9+0V13a
	 Aoe/UDzWJakt8XdrWCpdHs4hX6ypGqLRws+prrRUfDOjcKcwGqZkFiocilLILmp3KDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443625;
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
	bh=/aQ14d8VEa50yPgydF6Z9Q393u8JnSwVyTpKi0WYELQ=;
	b=Bb/36FEwZK2s7gMK2C6WZSObOvZUtXr+4TfbZoxDvt3SdaMnaLzvtf8jFzxK5OxqTlgJ
	 QyZ2XYvEiCW5zAAGH41l9bdYyud2ZNEVLZzcJSRlO6bwwu0YdYNGJon2I3YK/sLEUm3GE
	 ak/whu2Rz0YCnsA10WUVmVtfBEfRWn5DB4AhffnvIvN2mPCLG1z9u63ppqFcYVTEmpeUU
	 OBZ+LamvaRX0gpmWZclNaZkSQxvIiYQW9RxMRB9wn62Z2YxilEzWd8ZQXUTnqxrNMWyPV
	 ms+z3e91OKz9b7EPqsssf/WUq21xhgrFmC+f1vq2k25SIgF1Tz89HoY7WPe16N/fMqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=g0wFbg3m;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.65
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010065.outbound.protection.outlook.com [52.101.228.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7972606A31C
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7972606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=g0wFbg3m
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0uvzNgfiuETmwpVETaKkSJi5DpxazcpV2cmKyR1c1gJ6uxdplh1WlQsfIhYfNtacVW3tQuj3Fz78vCzcIlUD178GALrt/j8SoO2Tybnbro1q0dI/JM1lo6cht8x5Qqe/n02wlIWW6ZWhSxbLTzpBeebawHZ+PaKF3IiSIArLOmqetpsRjmrllSci5uW9ng7Rk8y6NKFv7JFrTUYIXXXGjPPUS96zXuqpjjuoiS+PZdF3kZXFl+P5/fF7FsHauUiEiS1CqCPHLjVzDsdWKEHQ4DklpLniMoMUDGhfnmxD1VTK9VtW50XzR6LnYufrf91zVV6Bz/woWzj05Oxj/ahRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/aQ14d8VEa50yPgydF6Z9Q393u8JnSwVyTpKi0WYELQ=;
 b=gUkQmk58ILLcgOpYsL89PilBX0EEWEaUlo1RWv73aD1gWCywCfQP9zajQQEGTofhcd/TlonHC/ac++rdxy2H++SkRLylGsSBAxNT88x0MFRQx7tdC4j0qwVsb6uHjyA6NAZKyC5lCpbihfWFh3++vdlk5NQOZNd1IpZW2D8o6gkfOdtvoUI39MdKM1UtaYUszhH4GLHOf94FdY88EQxFyJAZwHkOoH+mVesljsYJtUaH+Xf0tOprSTNXXku3krmf6JzoMsOjuFarXCq/vRyasGsBAMyg0k2Z+2vOrbw12UDfrrZvCb/DfMPiTjD6WNjgT7w2HvbB4KE/2XU2Fl4ouA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/aQ14d8VEa50yPgydF6Z9Q393u8JnSwVyTpKi0WYELQ=;
 b=g0wFbg3mUxU+nI/kGwPfSbIWH0L4r3cNnFsXmIwhJFRCaIdWemo+nNyOOlmFORnPEDI4iN6hoDyJrxSUIssLbJRhgDOwe7tflU9SgUxGe8n3AelAqYFGafN4oTxQwKxqNvVW5m66cstY+fRdFP7zwjL1yXP9W8oqh+bhnFyFrys=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB13263.jpnprd01.prod.outlook.com (2603:1096:405:16a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Thu, 12 Nov
 2026 00:33:42 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:33:42 +0000
Message-ID: <87wlqizy56.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 27/27] ASoC: soc-component: add snd_soc_component_device_link_{add/del}()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:33:42 +0000
X-ClientProxiedBy: OSTPR01CA0062.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::20) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB13263:EE_
X-MS-Office365-Filtering-Correlation-Id: cc3f5efc-580d-41c5-00f2-08df40549aa1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|1800799024|366016|23010399003|376014|261009223027099003|38350700014|11063799006|261021123027099003|56012099006|261022105027099003|261021121427099003|261026140227099003|261102123227099003|261028144727099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ufcoBWF0VXlZQOEAS49ZMQ/HJtcCpEJfFEXy7QaWBXg63HnetB8IGW6jmPojptR2lgtcv3PTzLvSPhruUGCKI+uBbxnPzFewYaUnaUqUt2lvnVydzxeF58FKqDO34Xgj4BvWzXatqG5FKpj6jzzKBMFYSER1Ls5OwEAi/XSSveYwO45hpi3XD5cks7ZyM0i8P0yP8OHXFQHBqxPvni4waBA/GPnI6osP4aWW9J4RpTrypABUOITwu6eHMZACp48CjZ5MvtwTt7wNGBZWL2Iw6X93ZPmhMxK2IMQ5lv928EaDRiyL594HBVWUx4U0acRcMStnBBpKUg1ZvDgrdJggoQBAegsGD3j00O/ZhgY/4ikCTWov1Rn0EOYgR1OWxPI6L53b8wR3YlwRP2G1kddp/QgyEpn1Y/glkvdT+FplwYCvk7ftKszC7yT/nwZjkMc9XWgGpAjDYQLz1iagdmeXnDNt0LbyDtgPgbYn3Z5IB5ZYvUEnpQzXtq6qVvvYBVB6rIeK6DCIUgALX573rWSs4gwdDKjylHcEfNxKEJYH6b2h1YZw90JJ473NIM9F+IcAvyrjp3wvZ+CW2NeO5iVFVuo4a4wtSb8mwYFaJq2G+F9g96YwJDYDUerS9AOqij7gefE4dg2EHTPrmqRVJjjHf4lTFtiANeFmemjZ6MoYmyevwEKbL1JzLR1cv99Z5W484GrYou+QdyZuLxhwB7qYdtOfTbjTuv/Po8F6GPMwqeI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(23010399003)(376014)(261009223027099003)(38350700014)(11063799006)(261021123027099003)(56012099006)(261022105027099003)(261021121427099003)(261026140227099003)(261102123227099003)(261028144727099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?XAi4WZ3wr8f6EplPAc90DcD72aSnDwqnI+Wkv8QSyaJJqHZiDWuDCbwo+m?=
 =?iso-8859-2?Q?sEh+K9iYJpjISOuX+gIunTyw88V37tW0hhBzG0y9DaFiu9h+3eoSugqECe?=
 =?iso-8859-2?Q?5PS1sugfq3REo1BngYFVOIhNqhZA3ZBsMf9AW4Pyh0uUhfvTRcx771nj2Z?=
 =?iso-8859-2?Q?7gSeEqfiH7uWerF+rNhfF6lyFJjuaaHjL+4VuTlS7+BW0SRW5JvvxBfKda?=
 =?iso-8859-2?Q?OJW3KHC7HD/JkVXuOElAW191rg+pl158Ww6H0EA+U+CLCcsgo+YWPFyZrw?=
 =?iso-8859-2?Q?vtdT2N24tUl4onzOhv6UW/HFfCNbJGAUdrprxEsrYhXevfoRFu5lNYO57/?=
 =?iso-8859-2?Q?Ijj787vR+mt0993I1SBM3+z0FFRSYb010x2A7MdAAfQMEqKNsQcWsGS93M?=
 =?iso-8859-2?Q?qESazKDzwkMSvu9PqVdy43/MIQbZIx583PNzG9WFmebr2Azd2WErShe97x?=
 =?iso-8859-2?Q?Y1dDZy4f3a9bsVmkz6omuYVzbEVwh5VurTq69yET7Sl/DGdC/sTNoHPC71?=
 =?iso-8859-2?Q?DM+Bi/XuprwzxK4IPpvXuQvq0x2v78Tsz657k/23dlQPPvCpx2PT7Rz8HO?=
 =?iso-8859-2?Q?V5Hx+PVdTtL+943nOZkzw8Nyb5R0OVfylu/BeGh2tr8VxUBOl8F0DDRxoc?=
 =?iso-8859-2?Q?i+EdPtCK9TLJaKM5BbZUyyiZ12QYMcp9tUDHj/rm+3s/MlqrFSiXBpHLLB?=
 =?iso-8859-2?Q?tYnG6fBKcinVDlPRufnIn7hsdTd/Z4XFdkZF3xxQ5UXGud9vjaYa4FF6Ls?=
 =?iso-8859-2?Q?HR+GvqGG3Kzubup95YsVhOkXXISilOQN/uDFFaPK5r1wryn2HyOD3z3G/0?=
 =?iso-8859-2?Q?5ZJy18Y0dvkM+W25piU18+aPSmLCFF74dRjY8Vac0mPSWG2/ioQ/IeO8Eb?=
 =?iso-8859-2?Q?vTK2GSqodv81bVbGQU6+HilfM7pKrO+ynj7HZ7arhTx/S71XoMVYbccaBG?=
 =?iso-8859-2?Q?vDO8/phyU8UksxmLIwaGIySFYawvJBUyKFnFqgtrfHh5Ei0vpEQetMEi4o?=
 =?iso-8859-2?Q?3qjUDK9l96b6I+Jsy4CyusNeveW5475KXfU/MaRZOdy+MYGoDN63JOrAkH?=
 =?iso-8859-2?Q?unSHgZm9g4QJS7rGWkyf0BNmYcxbUNbH/DDddTrTB97OX1YxdawFkIpQ2P?=
 =?iso-8859-2?Q?y27wVOGLId54HU901yDP8sinnNNIepbRQHg5yp7miE5IzbvYQNHaQaJUan?=
 =?iso-8859-2?Q?vQDBi5dF970oUEtBpxjOEoo9an0h8snOsDUPVti6Zf6lfNcsSX1Vr+ecL9?=
 =?iso-8859-2?Q?SkGSqPzQElTWNiHBNidXjC9M+dbWLzFQwtJ6kRHlZDzDlDMzl5CO1O5Ks0?=
 =?iso-8859-2?Q?uRD164+EJemwZqTMALp30ij6tEXTDyBveZh1siMrfVaGA5lQVOx39gBLk0?=
 =?iso-8859-2?Q?W2f3PCihyMKyeuAbxTi46n8HpBPVHhqPk34hjsjoa7tbKOqFuIEK3AxwoE?=
 =?iso-8859-2?Q?Dkhdf8OpQpW75/qctKW11o+btdds+5IJv6Fm0qIf5Ss1m1mBAnpCV1srWz?=
 =?iso-8859-2?Q?sW9Wl41DkzFkftIRyG6fqK6VUKxP8shH2tW63SNBkDsCvR+d3GZPSvxp7m?=
 =?iso-8859-2?Q?7RR/wq5GBg+VKrwGEEuuXEVUOxuHcyctHMODc7pDpDpPlgXlSTROHgjIcD?=
 =?iso-8859-2?Q?OZY/FN/2225d9UWFVltymy9qa4KJG0x+UNyAHtYzVPt2mtCwRUBAeVndLp?=
 =?iso-8859-2?Q?8RCCkHT/QwJ9iFYERdbYd6qTKmDLOf2cwlxlZ9GU+JYUNABAJETbbwrRWx?=
 =?iso-8859-2?Q?HBOPie9ZdAJhlvnQ4uDEI+0Pd0aQm6gWquQrVu8tUybcTTiZcex2EHaItH?=
 =?iso-8859-2?Q?3hzwu/Nvf/csSi6OO5OJT9j4vqekSFdo5ybsGgHb0Lq+A3Emktli?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc3f5efc-580d-41c5-00f2-08df40549aa1
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:33:42.6782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dVhcsHLvGv63Vnd7+rCyH9g9T1YNLzNK9XWmeO8j0VzEBdMfIfBDMwQ1hw6BmoVTKanspEpN36l8odWUGAX0kslFR7YiRCNGt5pvL4sJubIVWGqjOCIaOqQ3x0vCl8/6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13263

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
index 6a3ef36801ec6..9d576eaf2e33d 100644
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

