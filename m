Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.38
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443569;
	b=e0zF6MGHrRhrmj9gnTlb91bh8OuxZsdfXdqmvuObn4CBQaV3gKhPra+P3u2ZHtvG+Bdk
	 J+xxCtSZoOS5SLIfUzIul6xSkAjf2smJD4rvlgoDN9Coo3k0OjBLusX9dXEdgGUjjd1cP
	 JlmX46Wm+PaAVqtfM390nx8r53Z3EoU/ME/tXfVDxNqmQxDSYACcxbcUQy2wzqEkZQvjY
	 AKKCae05iiRHR4SFQL0jiIErLm0L7HBUxbHKd2xSUww2ILc0dDTG21X9RxDe095WtLOer
	 OXfFao4SvjyMWP3fF63wT5GhKOAX5FZYIaxHHFGNbAL3oBnx4SRO9lVzPxeYUSWdmnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443569;
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
	bh=OTAsXJiTeMvv2tmgXXJIVYCC4V/6ztiqpuFCLdqRB8Y=;
	b=1mVAl0Xy8/EGEmEpYgWNvY0dmnqyQGvpy++eeFyxNp07k9YryE4cfA5Iv+C4veIUDpQ7
	 qzXs0yIze3G8o2I0MamOsSw4KTxvBRehrOCXR6KzLGA4VPWE7S1QVHctz+mSkqlnfAY2X
	 yuJ8NR8NgC1BwV8f4NIvf8Tawnh1mM+FKInO9/cWzrtiWP9XoSym3UPDlG/dg+sQG/Izq
	 IYGRgrdXDjISl5pv3ZDqePFwl4NVbvs/zLcuFxI7jzBN0trVYQxRXmdlnzWCLr050LWYw
	 HOx8U8AjmALfWVUcdyNOWvi7joVTiGMUrZ+Ab9UGJL73+7qTRtCqVJ8n5zQk7im+lkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=kuuywUuN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.38
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011038.outbound.protection.outlook.com [52.101.125.38])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC4B606A324
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CC4B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=kuuywUuN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pcwVSfVPSkUUGUiybW5Iz6wkKqAXtQIly1/XC+NrPk8n3CG6m3vBjo1N5BIF2TiU4UD6rWjNIV/XpP2DBXKbMCt4UiUDL5gemE2ciqebqLk0JH/fuSSa4EhheoIZf7ifJs6ZpdLbI+IOqNmczLGBJ4HjPO3U/NQoEU+0O/M/+/Ti79ZgMKAd+qd05kelfI0/S9/T4C9GE5Ll3SY5Sk8n1BUYzCBMh/MAVwfiRBid08ixVBxnStZ2fXXdGo+EiysDjZwklhSk/vj1SQxx5Y5k1uezrLFiAqMjjm9/tYPWSdegEaTpBzanRlQQkGrvmEpakHhq2hgY2E0ED1BXviNUSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTAsXJiTeMvv2tmgXXJIVYCC4V/6ztiqpuFCLdqRB8Y=;
 b=BCnz6Dbcz/Z2dAsfCjZzPHHJcx/C883Wx39LIxQmDKJp2TMdIlu5TB33GMHA6+R4WD7LJP0OulGYX00etObcTRJKT36iWh/g4zszsMA6zRG/xY7+ssaNIkB9adkpzqMgXKNEOyByouC9BI6LWcx5TkkJUpQcoQIWB8JIZRudC4T3OGCpP8qi2OT8K5/PJETkmE1NhfOBnd/ftWD3Tzg4n68+PLveh0fQE1tOn+bGu88/jBU181vgGdPt0zyKINFlRz4v4hyPv3OE5cUAMOrIB77UbLEGH0f2uog0FzQFY+qq2F8JOyB+AlqjAaUbR7DxDjS0e1/5VETbC1hWBgLO1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTAsXJiTeMvv2tmgXXJIVYCC4V/6ztiqpuFCLdqRB8Y=;
 b=kuuywUuNT+wlKwVad9S0hqEDrSXkxQK6qyisnozaSbq6V48rEcBYqvoY5T9swGaWbsbR3NI/0Jaku6Svqsb0Si+p1T7EGYWwqkeBwVNhK1+CapZ7+LA/a1yUc53mcbYYPJr5930sP9k9ZXYx+114Z0TY6n52rMM9tRGooCUAuQM=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:32:46 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:32:46 +0000
Message-ID: <87ik2228k1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 12/27] ASoC: soc-component: move devm_snd_soc_component_register()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 00:32:46 +0000
X-ClientProxiedBy: TY6P301CA0036.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:3ba::9) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYCPR01MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: 26dd0b16-c494-460b-4e6a-08df40547931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102130727099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	ZifEK7ZzinQUR7/IUKJSwRc4MvTm/X2NSCdSjmNf8LoKdpo5Y+Uvva3t1YbCFQE7OLHS99MT5K4pIW8A0PNl7MxNF7ciaNOZiT+/oDFL38JJqGrlMmpAMkgzDiabxyxUO0wya7+p8Tk0Zm4AgK7TtM5gxuTQk+PCYG1aTYYjxXVaUZis9K22ltrOBjWv0XL3eFy5AH/kFxQWbl6fWPak7Hl+QpfBJo8a4Ci8KvKR/GJW4zOSIhwhEwPi08ZR8IZHTZKWKyAsTztNl2G95NjvM1t60ppA+YaD4k6t6Pm8btt7VudcKGQm+85hbPtyhuzON1YgvmZpTNT7WcSbYeCbgpxWkUyewGti53RdroG7qeRI+YFqXvSvbHk47FKnpleFIOecNkV0UXpnbrMWmopGXmqRHCwAhsDdmfo0wtk/ea2l/8KE+4Sy2P/uk8V8xfGTn0pixRHvO2fC3n8f3Vnb3t7LlpZtwbvwBCXQdO9D675tPPHQ5titVFTc2rfzIuXlYlGNLD56WyMOh+nSM3BbDxMQxdYmhf0s2FeHm2QLbCtrSLnNVKjAMbp0zz6xiRGkM1AGpkHCcZtn5ftZ6Ge0tEBODKAyVCuZE+xT3W+fiA0fgy6RjqYSZ8gkXg3lGGyBLnosTedHQZdPXvS2LOlpXILfdEmDUie4igwvAklfpA7AOYWgMBxLSWMIqcQ1c+bBIwKKcIP6+oVEj5UPviJ33w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102130727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?Ht7RmdGAo16srN+MeF4Y0O5IriOEYEAn7B/ll9iouzobX2HDabhKG2lD2q?=
 =?iso-8859-2?Q?M4VCMk+Mix8Q8bh1cUdXLPuQjxG3JO3niBtBwj9rMUBtseyxS/WOBdtA8/?=
 =?iso-8859-2?Q?AZX4DYJuXVO3zCeUA7rXR8cgYOovcso57Uuru2sDByIVfTrZwACPBO/uPo?=
 =?iso-8859-2?Q?cORFvztVS/zF3hLlR7MfDaLJqF3MNcIvfcwrVK0J2Lx6ybmIumd0VzTCb5?=
 =?iso-8859-2?Q?iBdFJ3T4prTBqM7+RpEVL9XSRpzX2berWIqWR7c2+7RHJI7mfjeAuGOHzM?=
 =?iso-8859-2?Q?SruFCqd963277/R7e3FOrm9lOqrguvjgqX9+UQag749BoMRUobcM8/+thP?=
 =?iso-8859-2?Q?dvRir5Vi5FQSfDTAZjdIGDSOA3pcm0P+T/YMCZ11HrIlAFugUF5X+k8/tp?=
 =?iso-8859-2?Q?nQsqq4uuZEVVw8V4Ew8yck0K2XJVvepspkTbSFxZUQN08jnLoY/jRVMwWJ?=
 =?iso-8859-2?Q?KygwrOlh8l4v9rCaTywoGlY84iotmXOjJri9YGT+Y/IA7zq1Gj809HYl2j?=
 =?iso-8859-2?Q?BIpYZOG6iEkOM+ODy3zfF55oYMxYw3rWggX5bH9zaXgp9/GjqJane2SS+4?=
 =?iso-8859-2?Q?leE4eZid0O+x+rueXKXACJ40guL2phZ1SJAFdSCDts0lOJliO3z2O44vAO?=
 =?iso-8859-2?Q?EvYkTAvkStKeRhnZuUpHNatxMMOZAC4D48r3prwvFOxL7BbIZp6djQ/Ewc?=
 =?iso-8859-2?Q?k1RQ8ipaT7rGlt/z51I978qxv+WmPyeyfnRLiSStCYaFxgcB2VbdK90pzX?=
 =?iso-8859-2?Q?HQfzI6XB14av+M7NBeq51tCYa5/xPYbUgir6umKjRWYJFn6SeDaZp9CI8S?=
 =?iso-8859-2?Q?fgaGMipqlIsERzZf5NfRSVySG1bKPxJmt948YezCSLEllVgKZgLJxx1phP?=
 =?iso-8859-2?Q?k8yhYbNandNB3xq2ThP1CMeJUCFC3fH0YV132bW6/n4czp+Oriac19peD1?=
 =?iso-8859-2?Q?rZ4MrC1LcCGyKwh1LATi6PLZ31E5xUievPT1baWZ3paoFtR7CsnMTVvdKe?=
 =?iso-8859-2?Q?GrWcMZXur1W0E65PuSGk1PbImAUFyuxDbJvXHteNyueXjis21D2pv+8TXX?=
 =?iso-8859-2?Q?8vpAMjqaXBv5zEOvZ7DqO1urQf+SdW4KOOCDiWvUF3LMcys3fdPTUztQ5v?=
 =?iso-8859-2?Q?87Klc2RqB7XN19h1/XSvP8j4mIwOwBezTjftE2q9DHkxjcJV3U8Hzm7AgB?=
 =?iso-8859-2?Q?j3JZ2isF68QGIpxekF0u73FHybxIT1pV0+Ir7qXQWqnMO3ZDeS0LuXa4ug?=
 =?iso-8859-2?Q?ZVEyccVtRqY3VHNZk/93plso8tVrW9k5WpHYa3ljEHBpatoUnDFqsVa/pY?=
 =?iso-8859-2?Q?LT+LcZtxpyzWRBGmTJMP8TJEvV2jucSckM8MUEqXk/ubmO5nJBXvbwZonq?=
 =?iso-8859-2?Q?JZO9+bRPycn7xj1+jhHXWJmOUZeeYaloNgq6L6o9sM+8niRD9GU0RP9sol?=
 =?iso-8859-2?Q?YKT3CjhYwpaxbS4PilQ4IUk5/CrKP/tMC/8GjNGZlD//+ZLduw6rk3cf/J?=
 =?iso-8859-2?Q?93a+Yc7uVuEwgjqp2giratfb3iXFrFZvTaQUidmFuTk9azfkwLW3M3hjda?=
 =?iso-8859-2?Q?Ze8kNyDeQcM8UnZjxPyb+FXjqxYKvofphs2M/Xpg2gM5zAYn46c1NQXpJe?=
 =?iso-8859-2?Q?AgOESucKjXgqhc48m7y0UN0eQ1Ts0HuYt9rPGiWTONUJ+i+hCfJJO1lZqe?=
 =?iso-8859-2?Q?R+ZhznUGVvNDfDSp/oJmnhHHAYVh/2w0jmGl2dKemFjM3kUobfIW3qROhS?=
 =?iso-8859-2?Q?PmGN6YmE4aB4tI+sVkk7SiaVZTqpPTqDJCHh8JjJfhykzpW1yg6LGROA50?=
 =?iso-8859-2?Q?ViyKsC/yUKNBBsMXln9Y/nI1DYd7hHGe7SmrZeV9ttDoPs6PERbM?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26dd0b16-c494-460b-4e6a-08df40547931
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:32:46.6703
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slRTaarLzW5ECt3RKwCBVk9gim8vQzddkbT7ZG3Rrw8fdszSEqVlGQiPn7TBIUVZTZIS6sYJ0VHq951Iy8zfGjmJ0Z4NyzDAtSAkHEvbB6oXkjDkKJF/01L6dNx2OcGo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

We don't need to have component related function in soc-devres.c.
Let's move it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-component.c | 51 +++++++++++++++++++++++++++++++++++++++
 sound/soc/soc-devres.c    | 51 ---------------------------------------
 2 files changed, 51 insertions(+), 51 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index d26cb7d6a07e6..d681b2abe8249 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -1767,3 +1767,54 @@ void snd_soc_unregister_component(struct device *dev=
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

