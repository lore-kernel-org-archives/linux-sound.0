Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.31
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795570998;
	b=nHzbZ7H9Q5HOdNzY0iRaonYNPltxp2WMfnQ2+LfRUvewXbnSf4kWQQurLesxDsYvIhcO
	 MSBzEwAolWP/evFj/ej2hS94RQkZyTI6v3t/5QbtHbBMU9CdP1i0I2OKVlUsJ28Ki/3lp
	 0oPf1ktfR3TB/lUcA/HlJ1SjnsnSG5xN8hHj/5FE5sb3VYqBs8D5LPx8eJviP9HV+zJgH
	 2C33Qj/D74h8oXUKhwpST7ZNbLiacRpBeknaC5xVbj2wkUJVarf/FAOGQqfrnk3JrXlnS
	 /Nm9UqmVo3oDvKgFbTYASsSxyFayVgN2TJv3xyzDXAZK7+5GH2H1hjvAlP8ou8oFJvg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795570998;
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
	bh=yIYYqO1yPsu7Gw/d321jhEc3oTirq1U42XMpL/klBVY=;
	b=oBseqveDV/sNxcaJQzdOGtN1Wjv07Rp4Z/XYGEWV7iA/QFyGi5m16MCU7UWI3duwKtMk
	 XejOmd1dGpjAOQgSKXM6LCghubL/9jilFQul4NKRFpio9Cb9kee1fWzEpk3aOIwFeVgmu
	 xCtH16N0lbUf4oH+QmdfuxrXN3hNGbnH+52wmRsJPwZYZytls+zD8xyr5aKLO2MDl3Beo
	 sVLgX942cC97zjVthLN2wFfnBz1pluyFLbMRPUMS+6r68ef5/DH/ns0E7sczr/IiwttLv
	 JnSvchhUd3D1ZnsPXpE7Uw3bcrS5WtmRsSaZfLPnmIGB6YbFMo7HvVNfkI9rchEZN0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=fYH+FLNG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.228.31
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010031.outbound.protection.outlook.com [52.101.228.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB84606A31E
	for <linux-sound@vger.kernel.org>; Wed, 25 Nov 2026 01:43:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB84606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=fYH+FLNG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lhns3cgrH0LP8kyaZIGhGN0CNwMwkmCpUOOjO08aIgmvLUeRcoRC8m+Iah50rBZmgWuxl8+cq8jd4H/HGGWoqI7M7K1ctLO1H/LfopqC5sBdidgSVQFzfjQMim9z2+OQ5QRex5/8GwguZlg9rO6UBNh3dWZqKDQPYw615x0MXiAQ4Y87C7ExLEvZjFa53vQD+YzHtlbWc71sUgHFtGCZ1YwBOZDhXqd/1A6H3yQqhPJdoQvosXpblTydUas2wbemol1GO4qVVFE5H7p/TE3eQPsFxyh+Cx6o3860D4AZqxQCN1Ev/SqybdbCY+FGPdixiVMtpNWSBcZmi/q9bvN6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yIYYqO1yPsu7Gw/d321jhEc3oTirq1U42XMpL/klBVY=;
 b=di3KPkDxDgDV9Ho9yJ4hKWHG+GOwUFe3o4TvzFab7qxs+Xn4RWElRuy/LdATt9LZvhoZGNtvjBidALeThZLDXEoKY6VON+onCQTv/KBcoWt5160K7tPBQBi/9kNEJUrr9c4AnA1ke8ZDcC0KK7Huh+s3TCvTv9bB/UQMX+C2suFFMPpUy5iloOVA0QRfw0OA2M7cM/rwBesAFrIYGobthRpViIl080VoJiVTYVmTRAWZ83QTsG1Ljt4X/LwpuMkcjaL8uYT50t9AlIg3reTMHNS7rRoaffO9vdM8eaXJKTM54pjvpD5KohbddaarjNO9FcEymM6S3OzlAud6keYRhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yIYYqO1yPsu7Gw/d321jhEc3oTirq1U42XMpL/klBVY=;
 b=fYH+FLNGjmcbVv2TQ8QpS7hHr0ZvuTddy4DRlDkv4o+PeJrmQ8KvY8QZFBF+BV19v6TvgWsG4Q74JEsSFSDmEaBsriWwSKteBHeEIUO0Fc5JeHDSBfJRL2eK7sEjMHLA6gPHmQI8svWBiIIV2Paf1bAXQo2UMiblkRkRkPbcjac=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 (2603:1096:604:4ba::14) by TYCPR01MB10476.jpnprd01.prod.outlook.com
 (2603:1096:400:304::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.6; Wed, 25 Nov
 2026 01:43:16 +0000
Received: from OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180]) by OSOPR01MB749128.jpnprd01.prod.outlook.com
 ([fe80::6a3b:d29c:c743:5180%3]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 01:43:16 +0000
Message-ID: <87se0pele4.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 12/27] ASoC: soc-component: move devm_snd_soc_component_register()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
References: <87a4mxg01k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 01:43:16 +0000
X-ClientProxiedBy: TY4P301CA0080.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::8) To OSOPR01MB749128.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: OSOPR01MB749128:EE_|TYCPR01MB10476:EE_
X-MS-Office365-Filtering-Correlation-Id: e1f8896f-fc80-4cf0-ad38-08df4a9579b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|52116014|366016|376014|1800799024|10067099003|38350700014|56012099006|11063799006|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|261028144727099003|261102130727099003|261102123227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Bw/QttSecvV5iuF2Jy8cGpGah1O0GpFuIgUHcdUdEo7jFDFQnhIJbODyhm3ht7ujVjnXxGYEisK2B60dzRj/7d4nGIznrn0fp3Gc0UXURrxi/4GVZcP03l1+Fx+rDVPKNJFoG3STCExO1s8zNGZi2pTWboYA8cCEyoygXoAsvbJ1zfKac1x40zk4G4IuhfLZGyrYHxhzMrW/e5fT6PcribkILUBU0enBHozVmJEPY1hupDr5nD7A4b1vUDMlUOEyTwu95dcdZRb/FQSW61nhfwVjEatg2ghaXd8/elBDwL8WVA1IRny8bf9Da1APkMqxnM5EoGMSyxhIZOoGCjHz+iJh5BlqA+umlRmw7aihjasnG33ahELuCyPaSYV9x1j8Lbe4QBF1uCXi69KACkM7vNFle77YQuXVT4ZNlFRbGyS7wlpLXFd45+sr22JGYxb4lvDiuxUa89UD2kEEe8DYZiTfh5Zs5Sk3enpXUSvTEnb8mMrEFDA5IhO++9L6xiLGK2H+bzOJtIOOGod1ib79tPcx2YwmE7pjVJ9RTn2jr2KX7rRSS0my/Ywbn0m2hGuYUjXQ84pxeboCghJ/QbccXTFt6VCihxlsgYC4UWRkS1gB23Drp+buR5/SD+R8WNHlSz3/gFHHiLaxcS519OGW5KsRNNkmq9D/XPnVO75COE7SxdtYZbnMiFsYsSXPRnM/6bzymWtcylbeloPNjteknQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSOPR01MB749128.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(52116014)(366016)(376014)(1800799024)(10067099003)(38350700014)(56012099006)(11063799006)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261028144727099003)(261102130727099003)(261102123227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?gB17staSnBneXhS+BMYJOgFTMJnl8zPI3QmZVsGDrZeioavTTud9EPCHqE?=
 =?iso-8859-2?Q?/YsgoUdseXB+hQ0HeQRl7Mks/Kt5CX67Odi2cmweMLXbJq5VccCU+UZicp?=
 =?iso-8859-2?Q?/3RY77cnvrnwxFLjdJzIIuDMwETDvU6+w7QaAFFiO5nMI89gASk5UOJm28?=
 =?iso-8859-2?Q?ODjCJW61+AoCKq6jbTAcYhBu/9xCWJ6NuaXGnr8K3WRsPz7LEaLCbIB18R?=
 =?iso-8859-2?Q?KbKpyK39hNd3bwXPeV2bEBt0KdUGR9As7v6JH7JiVh+UvUq+yHRAyK7bY8?=
 =?iso-8859-2?Q?ZsCJ9/ycYcisBVbS+OCpVb1GQQQuvVYmMudLGgEEUmFvTjhpwMCpcUfeLS?=
 =?iso-8859-2?Q?pkntKnHOiE/UGWPgwvYbB2mCF16oFr22wRxuq/b31mhh6e8WApKF6AuZ1Q?=
 =?iso-8859-2?Q?OFPM7ibbB4BFBBpC4OIJqKuBwNk4qTRuAUWBv56aVBjloBGIK6P9eLjLMu?=
 =?iso-8859-2?Q?Y4G3kH0d1qESmIxXl/H/aRRJ/ps9U7JhZLS3K7WjO30XBuTpLySy8/dkrz?=
 =?iso-8859-2?Q?BYzcBudQZn0bAi9B2GwC/Oorhik8mGoWNTVgzYAeVT8tVhUnNNP+dZaYJI?=
 =?iso-8859-2?Q?0YRLGNildAACqEV1jpZmT4dUjF2OWrnJKXYepUq4TxgoXlZmW8w06HcJrz?=
 =?iso-8859-2?Q?RJ+lSL4ZDgLPQ2GRbj9rHB9nq8QWVbGhYfZUJ3vesal2fdlXkHscJovoHv?=
 =?iso-8859-2?Q?VgRJyCH7u9bTtAT0NrDaZxHGXDvkoR7DVeBUw4uU+/oBGGZRCdJgcnabi9?=
 =?iso-8859-2?Q?G9bTao8FKugid5wDevsQ9gcDFi07Q4Jv6P2fl/ClLRMsoYUkljRy0MzlEK?=
 =?iso-8859-2?Q?ZoZM9HbbtsQUtGqsMdVPK45i7LCR5yml3aLY5vWu1p0/l+HgDFm+HU7AaM?=
 =?iso-8859-2?Q?4DS8gxu5pdv0MwoevnZFL1jDG/cqiOraNdKq6HiY/Xb91dI5ZACZYtyX6R?=
 =?iso-8859-2?Q?cmQJX1mWaHc/2OUhDmrSOdV/q+gD7f7rkKPtkcLNAr76TSAM+gxqxtRPOD?=
 =?iso-8859-2?Q?JxZOEWdvggaxdueFp3YAQhDY+UeRGdsC+Ti9B2uF2VLtBVU4PRF9toFxJ6?=
 =?iso-8859-2?Q?+0OjXE0YZqI6I/kJ8uH3B4m04fj/WDpC1UeCWmbJSWG7VynrfaPSDM3l1S?=
 =?iso-8859-2?Q?UZvMNqNJ5fU/NyVzr9IGVIGRRntn6hb8ip7JEkr0M8uTr/+bJ+d9j6VAss?=
 =?iso-8859-2?Q?F1lFh1h0wFkPk89UrRKVvijHP0hSw8EELA0VncAeER+jbrH6vtEKykifoD?=
 =?iso-8859-2?Q?JnLIlTVutNwwu6i9/wgJ6+7yc8gdt4eDUfe+AFX3CdBpVW29EIC5WuSdlF?=
 =?iso-8859-2?Q?EoWQv2/XHo0SDo9/dRjIcIhgdvxtyrIpqRX/L6jwbGs9FZAyYSgEKjrfix?=
 =?iso-8859-2?Q?AiyFGQyjCszKpNjtKButZzkvEG1JdsbkQedXXnHsO6FC+lHRf4P7y8rf5U?=
 =?iso-8859-2?Q?nYGZ1Z2q0UnAYTd2Hco2/fPHZv3eiTXfGT7eFAeF/8BQrW59Gc+1DHx0Vk?=
 =?iso-8859-2?Q?J5TyqJu3vBkUFMp/tTZBTS0DlMnUym0Lq1quLZAuAQbbaHe6goG5zwaG4Y?=
 =?iso-8859-2?Q?HrO9fG1UuTNN6AE69B3+yPxvh1vLp36/jcWKOkPTq1HHmoAAvslGKvrth0?=
 =?iso-8859-2?Q?FD5luhmEG6DKdp9OU3DXVWPNkiyu3sZLtDnt8A4j95mCOXUGolkU9zKg3n?=
 =?iso-8859-2?Q?jqBZPDdFPtrufKd4XhheQiq7IoetrBar8MXFbKF+QS/A1ascbl6vwY19an?=
 =?iso-8859-2?Q?jkKUKI4y7LOgNZpLa8JfPTXXjEta58+QcOsmDRU4mD1GXp6xAFBPuqPQfa?=
 =?iso-8859-2?Q?kOBlibH9J0ypAf30fGBp52R80g1qmGSckX60pMo0jYcb0+iMhYtw?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f8896f-fc80-4cf0-ad38-08df4a9579b4
X-MS-Exchange-CrossTenant-AuthSource: OSOPR01MB749128.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 01:43:16.3513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fpNM3eAKhKlRh3JfJDwHNEAFGFArHd3XRqgWgNq0e07spN7j61dDGp53ciEFx6PVD0ye0QfOw+jioEdF1Jh19Dz4uYZbMAUmiAEHIeFjmCzZW6+R8+UDweqAuzbuVWoF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10476

We don't need to have component related function in soc-devres.c.
Let's move it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-component.c | 51 +++++++++++++++++++++++++++++++++++++++
 sound/soc/soc-devres.c    | 51 ---------------------------------------
 2 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index ca51f976ec409..ea8ed0a662dc6 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1766,3 +1766,54 @@ void snd_soc_unregister_component(struct device *dev=
)
 	}
 }
 EXPORT_SYMBOL_GPL(snd_soc_unregister_component);
+
+static void devm_component_release(struct device *dev, void *res)
+{
+	struct snd_soc_component **component =3D res;
+
+	snd_soc_component_unregister(*component);
+}
+
+/**
+ * devm_snd_soc_register_component - resource managed component registrati=
on
+ * @dev: Device used to manage component
+ * @cmpnt_drv: Component driver
+ * @dai_drv: DAI driver
+ * @num_dai: Number of DAIs to register
+ *
+ * Register a component with automatic unregistration when the device is
+ * unregistered.
+ */
+int devm_snd_soc_register_component(struct device *dev,
+				    const struct snd_soc_component_driver *cmpnt_drv,
+				    struct snd_soc_dai_driver *dai_drv, int num_dai)
+{
+	const struct snd_soc_component **ptr;
+	struct snd_soc_component *component;
+	int ret =3D -ENOMEM;
+
+	component =3D snd_soc_component_new(dev, NULL, cmpnt_drv);
+	if (IS_ERR(component))
+		goto err;
+
+	ptr =3D devres_alloc(devm_component_release, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		goto free_component;
+
+	ret =3D snd_soc_component_register(component, dai_drv, num_dai);
+	if (ret < 0)
+		goto free_devres;
+
+	*ptr =3D component;
+	devres_add(dev, ptr);
+
+	return ret;
+
+free_devres:
+	devres_free(ptr);
+free_component:
+	devm_kfree(dev, component);
+err:
+	return ret;
+}
+EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index 0323897c664dc..431bb366468ac 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -9,57 +9,6 @@
 #include <sound/soc.h>
 #include <sound/dmaengine_pcm.h>
=20
-static void devm_component_release(struct device *dev, void *res)
-{
-	struct snd_soc_component **component =3D res;
-
-	snd_soc_component_unregister(*component);
-}
-
-/**
- * devm_snd_soc_register_component - resource managed component registrati=
on
- * @dev: Device used to manage component
- * @cmpnt_drv: Component driver
- * @dai_drv: DAI driver
- * @num_dai: Number of DAIs to register
- *
- * Register a component with automatic unregistration when the device is
- * unregistered.
- */
-int devm_snd_soc_register_component(struct device *dev,
-			 const struct snd_soc_component_driver *cmpnt_drv,
-			 struct snd_soc_dai_driver *dai_drv, int num_dai)
-{
-	const struct snd_soc_component **ptr;
-	struct snd_soc_component *component;
-	int ret =3D -ENOMEM;
-
-	component =3D snd_soc_component_new(dev, NULL, cmpnt_drv);
-	if (IS_ERR(component))
-		goto err;
-
-	ptr =3D devres_alloc(devm_component_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		goto free_component;
-
-	ret =3D snd_soc_component_register(component, dai_drv, num_dai);
-	if (ret < 0)
-		goto free_devres;
-
-	*ptr =3D component;
-	devres_add(dev, ptr);
-
-	return ret;
-
-free_devres:
-	devres_free(ptr);
-free_component:
-	devm_kfree(dev, component);
-err:
-	return ret;
-}
-EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
-
 /**
  * devm_snd_soc_register_card - resource managed card registration
  * @dev: Device used to manage card
--=20
2.53.0

