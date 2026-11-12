Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.7
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794443553;
	b=XTX6Bq6QNwBd5nPl5SfYU5p0kpnwmDRBC2TSFnSkwHWkASV0H1W1LXcS2I6KSZsUGEgg
	 bpbRpkhBFCbrHV51BQhiAm9vPHmgiqB1rhbmvZgztBgtmpM8YMcr29CgwADEbwoxta5Uk
	 OXZHFa6NevJkT4hgGOzYlZ/Wvnti7IwcoWGphERJ/okLD0ALsxBq7H2LHCAmd+fmhni+g
	 t+Ui85uSibryAEqDa7cz+jLrVsue9yAdapDKJBOphqNt2dPYzbyozFU0SIdvSZfeoQ+SI
	 YUlB00W6Elb8BJHE7kUk0mDZ1UB4eQuWog/KteOigoY+fwJOpTtBCuS6Wpa13Tkxmkw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794443553;
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
	bh=E745QoaXyvNJK7K5y032bMNEqEjWLwZTIjbad147BGo=;
	b=dAx7xft8eXt6CSTv3qm9QbER9s8HodL7pMVozVm88lsB/LmMhRT22H3TzBRYWCkTJKAe
	 sYCw3PFDP9fyrEKF3lvRr1MJFW9kOYG97hMH9mTBfZNWSvxcc1CgZi73ID4rtjyC6RxlN
	 PTZ3n45T/Cq3Tou0O0UZ+lShjhtvFb3hj9icSshT28jbp2qXLfmDZm9a9tqz1v3KDHk+m
	 KuoiSPBCxEvlwNZHBweLkI7v3dNsHJ6zSsNm2fLibxqOVO5HAT2I0HoiNscYlGfBjRiLK
	 K7t3z9Zuhn4I2MTH0G6FpRGIlD/5Ita5HT/vsgD9MoI4gPhZwHZbI+ivC9iVFqvVKhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=ZfJRbydD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.7
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011007.outbound.protection.outlook.com [40.107.74.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1836606A324
	for <linux-sound@vger.kernel.org>; Thu, 12 Nov 2026 00:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1836606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=ZfJRbydD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mHrjHEpaR3skEaprHa7wmDGFLW/U51T8gILa8NuhBtUOHxwGhZcy95irtuu/kaZLIsnexbc2l0rkg3ao/D0aTlmm/+D5uXHlaiL6wFr/WpTxqX/4u/UthkzhJex//0Cu3np0q4PHwvHMmAets5NJFC9kMpYY5zdiPVA1KV5BUxcIQJF6DrIqtLCcwG+8G3D/cKofcctDG4hzjPVgPDI182g8PsKjjYUK9aBKagZl433H3kagK23JiOk2hxlyQtSpcTXwWv4O7qQ6t7UmrqpbgZuxLd5Qoqh4wjnz0JbSVXUuUaUuu0P+Ni3k9Mv4KAFDnitujidz7UxiwhqZFZ6r6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E745QoaXyvNJK7K5y032bMNEqEjWLwZTIjbad147BGo=;
 b=mMJTCIXWnwANw94etbdUpD/WavvN/FiBI4DS2R2kA1wjb6+uTvmoBFgjsi53Jc0XrtQLKmbZFOB9X1yR41DRoVaDeX7v9K7SQdJGL69KTVLxN/fekg8X87SzJJ1IZFNivwzJdgPGrvekmNEYABouKpc2SZ7cpyM3GiNkn3NT8JAjayH9FFkDeAgS14OeX8J2ZBKptBdycx3qXjUeMwocuKftoqNOnHW64P24T4PZ2NA+Wchi+RCyt26AnSrCFlCzqp/6jIa6JKVq5f7AvDnOMRU+AofpMYFewBNWh6TY0fzsdb7GpMcv8Wy0RBjCevezEpzsZpT9bq6BoTulqCQT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E745QoaXyvNJK7K5y032bMNEqEjWLwZTIjbad147BGo=;
 b=ZfJRbydDgGnEl4tW2TjDykbgD9rEPth3J/x/deIvaLssvlkAYJrAsfyGnx3lh2Xh4e5cpf9v/WIXNUzLfpwwuCve0XAztb/B6KworhBgndBXDVRWGKbrg2XEaub37vltZegHAK6fQ1haHNB4vfN2u/DuJZBXNwulttNVA/Xlx0k=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYCPR01MB6867.jpnprd01.prod.outlook.com (2603:1096:400:b6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 00:32:29 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 00:32:29 +0000
Message-ID: <87mrre28kj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 09/27] ASoC: soc-devres: use snd_soc_component_unregister() for devm_snd_soc_register_component()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
In-Reply-To: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
References: <87zeve28ol.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 12 Nov 2026 00:32:28 +0000
X-ClientProxiedBy: TY4PR01CA0086.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::14) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-Office365-Filtering-Correlation-Id: 375bbbb6-c6dc-4837-2fd5-08df40546eba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|18002099003|22082099003|261009223027099003|11063799006|56012099006|261102130727099003|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|261021123027099003|38350700014|10067099003;
X-Microsoft-Antispam-Message-Info:
	ft6Pb2WhcSIw/BP9QHzTZU049RmKd5PwVJYhRrcbYyt4/ign1eGUIiUrKCVYy759asmsisTuCPFC25E1DJdZRcIH4UtWtnHNk3Bgp5SyqyB31YzvsA5r3MV2gm0M+Sp2G6qeKHBe831rBDV/KBISvnigo5roPOAP9fqDeqK9hPu47eN1B6gLq3NMJvk/bNW9bnvd1d2c8s1v6qcnnI+qal57nYmY8lEGicRs89laCJdoc1EbhHovHE/MnUbK22LDZad7fPs5NT2IGtgP23RJKk3tjwEHm2y3zuo9rbZ62o6kaRz+xty+qcSrvtCvhe/GP6IZdCdj099Bskhd4ZxCuZKykiF4ScHQCX0RKOgYqfCilLNSLVZOK+IRIb4bG/f4EsAxn+OTKjnF93l29EoWe4bASXXyWlp28Awpv0BXZYO5N6rqiiFOaJItr9+tWAqHy/AylfIkh9shkzvq25SR0UPJvXk1+OXuZbrkU9ec4Y7AMoNoLBRdzg1lztbXOiA/EwDnyOGh88pFKlIDuE+lBW2kldDOvaoHFJnNO/16SkvG+v6yjmDG6Al9M60qWXHQ1rtVmCVBLrQDcjL8xrceIO2CM52Ppkh1IAGFeILEqBQL655j0nQ1M9NFkG16Pkx9mK3t1RJUUJvt5d42uIozBtYWqGM/b7XHkYzr/5Avnq5ESfOL3x0E3p4ljyY14mcgKahFQSysAIAcc8r3FZIdO62Ykh2aAGYVIikFuESdfOs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(18002099003)(22082099003)(261009223027099003)(11063799006)(56012099006)(261102130727099003)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(261021123027099003)(38350700014)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j0qgo3B8ZUDztoeZa1TgC3utRWdzS+2dUD9oVGblLoY6sq6FwTqwkqpkTkfh?=
 =?us-ascii?Q?mmgYbrY3mrx96TOskxhLx5O/BmR8muZw+jTG8hHuU52xAY4XQX3ivQ2F7U6N?=
 =?us-ascii?Q?RuU1i4vZAj0jrVLestYvtJ6t1PMVVsclx8xl6N/0cTxhn5ydnZv2VeySsjX8?=
 =?us-ascii?Q?HX/Bl/tDDZpkiSGQdDuKXPThQ1sJOMNUEFBwY+qa7ub1WRvk/6ckV+/1Fhlx?=
 =?us-ascii?Q?07ZQSGDZTeAUsU3toq/Trk1PqnpjdPtcV+e26fKSwNt9HV4tX3zWuhrr4Urd?=
 =?us-ascii?Q?Pvsk7S9Co7sphwNOF8kVBkTdKCYrLxtZphIfsg72qi5kLqj7OX+lMTubzjXp?=
 =?us-ascii?Q?H5G73lWcYPz4Da/QcITK0BgZH8jqPx0NbUzseDNndQF7WS40YtKu4ZINX6DG?=
 =?us-ascii?Q?/Z9iOdvZLZq4yHjSEj7OYZtKUOi9f8fH5scXBA7LbPMzC3mlWA+tgtm6Y5dr?=
 =?us-ascii?Q?QJH9XEOs+n650tXazC1tAgkNI86kabMuSkR/inCxD0QIepYGiFHa9FCIvVnR?=
 =?us-ascii?Q?f5DekmgzIsOEsqFYHpz8slZ/0iJLCFE2V5bzvnSCv6SXnSqLfdxRFd8kJ7+i?=
 =?us-ascii?Q?LoTeERIvyhtM05xcRi+NZS1ZuION6pzypSrIaS7TsH6yWCo4/hpeHaMaScd3?=
 =?us-ascii?Q?w+ea6qo8guK05HFNQTHDGG+ifwm29CGYG0cJWdJT/KtXPXSXiRd68/fBDqqk?=
 =?us-ascii?Q?WA7PDzjqn35TZLeiahoCtrdCZQxQ2Ad6XZ/RKLlWl35YWyWKdJkCePFprUQX?=
 =?us-ascii?Q?BjC/kOcLMvAApK1i4e1EH5xIDZQuIt9Rv7iLK48sK4dSJAbgf2+ofXYt4ntA?=
 =?us-ascii?Q?tCDg2EgUx2TjOjaut6cWZ4xOHfkZyDS/r6yiT82iKsHqX6jaO4GvZFTQ6leG?=
 =?us-ascii?Q?pJ4JGXrDm86Y9iwB692tGGwLecYBJrvxEzLJDhjT0spM+hi9X/hQOCN0eZww?=
 =?us-ascii?Q?FvhjboEPTHLNYDbDlXa8Sxu/3rBAeJ2zXzwuBm7Jg+xxXehhYnbUTvjnchS5?=
 =?us-ascii?Q?alKCoYmNjxlvzwHs12Va3SnzrGo0wCx9HfUVTH33NAAB9u9wMAQv/CIevOYH?=
 =?us-ascii?Q?F6/te3TK78k13Wfyfq83k+NGf4DMwZ5q3MPm3LtUn9jP7+H2YertLNC5yw/9?=
 =?us-ascii?Q?9V/07MhDRXzUJzhwxyfpcjVScY8OepwMBQM5MojayXBKvrup+Ab2rxKvmZXH?=
 =?us-ascii?Q?zMdu9g1F0pnS8iusy8HXxDS3d6aBDZ7L9+Xhl7kqd8ZSTCdOjYv+x4koOsQ2?=
 =?us-ascii?Q?lCAgZveALX3ltt4aD2ceOmOJmy9B11RA3iZ9N+n7Xd7PqHWmVMXEy7mi5WEo?=
 =?us-ascii?Q?8Ns06mlJBnw5QDObP4ryodnKH/CDAz3vNhklzcks/HuhDnnu+Novf2zTibrI?=
 =?us-ascii?Q?vENunx8q6ewTjk3QAEqZfUzr+vHHweOlq5fIHNzOE3t5ByfoLdWsOK5E47fn?=
 =?us-ascii?Q?3ieGibguitt8rJcKw4t82JIEy6dAhvHOdawS8WwYaDQpvYinp2n3IHrC7bNT?=
 =?us-ascii?Q?g/UMVicfaYTi81N8+kOXELAEclfH6KAy/ZjZlc0S3s0XGN2lkxsC55yG1c5r?=
 =?us-ascii?Q?SHLKmGvBRQnep5P9pcJfwaninsmDdHSWT+euWXFbNth2pL5WwygSvdsj2t6b?=
 =?us-ascii?Q?j1DTJ0OCh2Nk2ek2V6GW/PviqmQ7YDr6EsNquUd4tVDvAJzSbEkOAID1aiAS?=
 =?us-ascii?Q?5qukEHk72Mt8HFP/o32WqPAxqQcUi8vHW9VhQecn/efBfJTAhcssNebtb8un?=
 =?us-ascii?Q?YWOe6kFqSitEiogzUC0awtZjhkwjaQGD4UxcbCIBTlSD77Kidlso?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 375bbbb6-c6dc-4837-2fd5-08df40546eba
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 00:32:29.1080
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Wr+dv4mrxdXnxwIJ36bof7hQLHdjAGpNec3oVYPJ+vlFav7ke8Z5OFBzKeLYl/cnmHZp8hfjJ+pdjhUvAdRNwodM5qwfjAdc3Iddu1mak0CRvspKePdgonnErjnc0BD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6867

Current devm_snd_soc_register_component() (X) is using
snd_soc_unregister_component() (Y) to unregiser component.

(X)	static void devm_component_release(...)
	{
		...
(Y)		snd_soc_unregister_component(...);
	}

	int devm_snd_soc_register_component(...)
	{
		...
		ptr = devres_alloc(devm_component_release, ...);
		...
	}

But now, (Y) will removes all components if multiple component
were connected to dev.
We can use snd_soc_component_unregister() (Z) which unregiser only
target component, not all. Let's use

(Y)	snd_soc_unregister_component()	// unregister all components
(Z)	snd_soc_component_unregister()	// unregister only target component

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-devres.c | 35 +++++++++++++++++++++++------------
 1 file changed, 23 insertions(+), 12 deletions(-)

diff --git a/sound/soc/soc-devres.c b/sound/soc/soc-devres.c
index ca6c29b54f6ab..0323897c664dc 100644
--- a/sound/soc/soc-devres.c
+++ b/sound/soc/soc-devres.c
@@ -11,9 +11,9 @@
 
 static void devm_component_release(struct device *dev, void *res)
 {
-	const struct snd_soc_component_driver **cmpnt_drv = res;
+	struct snd_soc_component **component = res;
 
-	snd_soc_unregister_component_by_driver(dev, *cmpnt_drv);
+	snd_soc_component_unregister(*component);
 }
 
 /**
@@ -30,21 +30,32 @@ int devm_snd_soc_register_component(struct device *dev,
 			 const struct snd_soc_component_driver *cmpnt_drv,
 			 struct snd_soc_dai_driver *dai_drv, int num_dai)
 {
-	const struct snd_soc_component_driver **ptr;
-	int ret;
+	const struct snd_soc_component **ptr;
+	struct snd_soc_component *component;
+	int ret = -ENOMEM;
+
+	component = snd_soc_component_new(dev, NULL, cmpnt_drv);
+	if (IS_ERR(component))
+		goto err;
 
 	ptr = devres_alloc(devm_component_release, sizeof(*ptr), GFP_KERNEL);
 	if (!ptr)
-		return -ENOMEM;
+		goto free_component;
+
+	ret = snd_soc_component_register(component, dai_drv, num_dai);
+	if (ret < 0)
+		goto free_devres;
 
-	ret = snd_soc_register_component(dev, cmpnt_drv, dai_drv, num_dai);
-	if (ret == 0) {
-		*ptr = cmpnt_drv;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
+	*ptr = component;
+	devres_add(dev, ptr);
+
+	return ret;
 
+free_devres:
+	devres_free(ptr);
+free_component:
+	devm_kfree(dev, component);
+err:
 	return ret;
 }
 EXPORT_SYMBOL_GPL(devm_snd_soc_register_component);
-- 
2.53.0

