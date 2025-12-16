Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013006.outbound.protection.outlook.com [40.107.162.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7268D33A000;
	Tue, 16 Dec 2025 07:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765868584; cv=fail; b=tGHsz3cVc5+gsM4T+ad6VZU9Q9acETNrQKJkTSWHgeJt2pSvHuafsbLVo9BhbJSTL5NSasFFQ9J/6XSazg4dUEdT5ZZhTDX7Hk+cVxFRKp19IijdwxoOBCuUoOIXAUPqtca8cE4b8G7MLe79gdxIGCE/JmwM8iJQDUhAlJquLQ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765868584; c=relaxed/simple;
	bh=PLRkyjyke5QmkeD+pJGjbhRr8OUYT2i8FpGpUai5JTc=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=i212SZPgisQv3iftD0+LZoU7nzlsueGt90S8G+5zkodKE+fmAPmRYE8HY/D3he2FtlHNakG7K53vKxddXb2/Hzz5eVEMxYEy3LjbSmthR7kkw5JdGwRpvyejHTy8IlRs7jWZ2XTdc1T4sZDjXwjfS42TNNOJvLoURec6kl9OlY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=G+RLeW23; arc=fail smtp.client-ip=40.107.162.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="G+RLeW23"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K6ZZIHDva81kFSzhrvGK3+N7wSZo5U1pt+/vlwT5UgqvDDXga0pvQEgZYYiKewEhYxnSUgFc0519Vevut691QVlbSKoVkqYtmcRWkj9Z/x0Ttkff0YG8rd5eIe+2d7yOY06kq9eYSXT5UEQKgd/B8KS8Q0cH3nJwFcdTN8eJr67G9Em92Wia+2c/GNL0DnyKeHACSGeBuWV8NWzlt+tTOkw27DR4HSWU7YV1C0mQapkldhuit8h7rDHXLaZjobCDQsyk/DqvccnJT1mqQGsXXm3NfL4XN3c2Wp7ZZLOcdKyrwRwO3eyQYxrNwJ/0qqhCZUbi60b3sQ4XG7R8FHUIkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Z1r06zkKxFj+MGsKvYDudZc6DmqhOBbChKCoAbX4Qo=;
 b=NDuDhhVEqCRNrqVmfiJaY5JFiTIZd9G5Itf2Y50jZSSm7R9/RJl4wyO4lWYgLn9WRwl8iF589CAfeL5huAgYVOrUI/NsPq32UCQuXJvrzaTr/TaQ0xHuY0LkScmX/x4vroR5Wt164th1zQ8ZdMgrrBhkYt4rgEk8kPY/WYQSpgDTtEEP4vOA1ClztdrQ+KcMwVcoFsTaX2ghrXUDAj8OqYpISb7ysuGMLRLdx8dUvNhD3yZE+ayeEfzpqWzzYkETqiwzj9XzP1qxKk6yRx3mdAm+FJzrNoqxVP71yfMXwOQLry7biSheKUJkqxCvV3Q5G2NBjBu4lehHrHMcAf65xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Z1r06zkKxFj+MGsKvYDudZc6DmqhOBbChKCoAbX4Qo=;
 b=G+RLeW23WpD/FI23D+vHXZmdWxQW1y0mOSoweggxur6nblGrYkQJDk3ccCcsHA9EGQVbIVIuULTXaDMIwagokkhGJtiubBfi+d7e5k8ikkahsQWNjuHlfjLTEtgBU9qWH4AMMB1KcQV/l91G/VepMJh7d5TUFhmFqbKHi3zDMCUT8kwqE1wJkAgDGsvkQkASB0yGC2XUubxCkRCD5Rlt5rXdSOxNjef97zN8C4wVQbmCZoynbnf57v6BGYHQRKxtFyMCIDPNMq6Ut9VgIlLhc+ZoGkZDWgi7FumsjoVjJvTh6EqmpeyDo1I310/omWQ8FcqnjWdDBS6YXlZD4A6daw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AMBPR04MB11742.eurprd04.prod.outlook.com (2603:10a6:20b:6f6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Tue, 16 Dec
 2025 07:02:55 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 07:02:55 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	p.zabel@pengutronix.de,
	kuninori.morimoto.gx@renesas.com,
	nichen@iscas.ac.cn,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ckeepax@opensource.cirrus.com
Subject: [PATCH] ASoC: ak4458: remove the reset operation in probe and remove
Date: Tue, 16 Dec 2025 15:02:01 +0800
Message-Id: <20251216070201.358477-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:3:18::34) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AMBPR04MB11742:EE_
X-MS-Office365-Filtering-Correlation-Id: 69511c75-2f9c-43a8-e087-08de3c71226e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|19092799006|366016|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ckCqGsk9Il+WM3cBMmgWG2b2besLCwfde+129dNqpI2NSZpfkpTLIHzMEPuj?=
 =?us-ascii?Q?5RxcuLUNsdCO1vSOiBIBSEduFa57ZNvEYRIGhwGaGEhM2I2JvKqWaKk4pYcv?=
 =?us-ascii?Q?BhwjJPjlG1PcO+8yM8A7yLHG0x2khnN3aZxH8J5Y3CLq7sT1KsBQSRPpNMs0?=
 =?us-ascii?Q?c12Szmr30/Q7HvEZS8hrueoDVqbGsqoZ3bIQIFxSkSL2aSlIX+sxTicO7tU3?=
 =?us-ascii?Q?qQnWm3fYTgWfs3CeIJKLWes2xQzSM3QE3R5gsVGfYaQdNRkfcWRgNFMc9DCi?=
 =?us-ascii?Q?i4mxcTZDVop91frn1mV3lKXCKzl4cJTACMQx10wi+llyFsG09WWDBzAjSQNv?=
 =?us-ascii?Q?Cla1ylRBsrNKfLUzVpTvXky9ZmvkocBiyyJv3sdIVJitVSZmxNjh2m+0Drnh?=
 =?us-ascii?Q?8UqMti0/uIytXyXm4qGZpIHhWkZOJ8kmNAVlCwYnuG6hpubvD9BhU21uX5MD?=
 =?us-ascii?Q?t3aEw2IZsmQ3ltyzwlDWyFPoXxJkOPgKZmXV2DizIDcTQpRc7V3K8YI6pTmM?=
 =?us-ascii?Q?n0juvuGZRJESYDLgWC+zOhTNaJkqZab9HvjmshRfOw0hKUeWjf+3MlhLw41X?=
 =?us-ascii?Q?2tal9TUkOt74lCfqe2heUtVgNAjwLNnW/5sf/DpDnWJ/X+pQT03a1R9toRFT?=
 =?us-ascii?Q?vHkq79KiOwRaTvQ2QneWn9w34IY54oEYTTaQ8bP4UFqZcIMklg6arOmraYn6?=
 =?us-ascii?Q?efespVu4JVPRycUvl6vWxQRmYWLdrQNwy4NMcD8DLOM9Q1eUxkWiQwhQJE2B?=
 =?us-ascii?Q?tuEJqMbOL5+med5m9QVPEdSpuL3zj5WnwINuoq3dt8CNPmL2wJZOAAW1Nbby?=
 =?us-ascii?Q?dGY69T2nbf2BbXiOh4F11pRxqPZK5nkxA1rN6AXn+mFUM4HECM7FOjUYUi94?=
 =?us-ascii?Q?Z3CC1PTgqMKcZpnSG0EW4W7tv2/jPqM+9xAItNr7zHDppvKYunmReXLxhCi1?=
 =?us-ascii?Q?rfWUqkTQ8CLkLnLaJRmsmfbveDzXuoVx21iW+qp4q3NZ9N0uboWwAksd3Lgl?=
 =?us-ascii?Q?b+C+X/R9ROGLiw7Ip1aCRLPYaGhkqMokDdIE0gAo3jjlji76/hOs2rKhxEl8?=
 =?us-ascii?Q?70LTa5z80qKs5pvkN3e4poRI/O3z1vkMXiL/O2UTgjpkrOBWbWjmPNZRl2uN?=
 =?us-ascii?Q?1CeHaJxjgiehOOcxLnX/Ok35WLlxnmx+LaJDewfTYKmlXpz8V2yu4k4yPr28?=
 =?us-ascii?Q?5OC6bsSKLQDPZzuslTUTDY1M0WW8VgvsBVnqA9GEQPkh09nuHEzxWwr+0/Kv?=
 =?us-ascii?Q?3aysWG0MgHLS0QoTcB/B0p++wu5s89bEBvdPwTi2XlFfQiHiN7zrU+xgqCDU?=
 =?us-ascii?Q?nhQyKxImCrWj2bjEAKELHLedyGx2wtonBujozwSQLDmLYOtwh4ZLVO1hKvqa?=
 =?us-ascii?Q?cpaGKvOURpZKpSEj/MSbEjPm8nwFanaiAFKFKntv8adgPPNT7o7FR83TEPsj?=
 =?us-ascii?Q?QBbNMaqmIX1hRSAEQkv60P8yND+sCghhjTfT/JWF8KaV0TrN4hbtaUPNUOJa?=
 =?us-ascii?Q?PO6t5Ua4xRwYm+RG8ZzTOXMjBZVIOOf48sVwmGHb/yhIlapDMmwrTDpXHA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(19092799006)(366016)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1PukYdtOthJ7b1SfDYsepuRxNQpl5H7BXDhQcVZBhNiy13AEfZ9pQ+UoalRW?=
 =?us-ascii?Q?eSDgRyy+e97py+hF9TKLDRYX2WYgwCuuKHvoddfgGXlk3L8vtCYaQB+0e/GT?=
 =?us-ascii?Q?SEUyKkHD5NzKYryfHDDk2lZJcm07jY+iLhImCnXeNQS9HDuR4cozUSqySo5y?=
 =?us-ascii?Q?ZufttPmjyHOvpuNmAnRYYqQMharwRUQOeC6ckCnImECjo1ZnwaibcA2vztwf?=
 =?us-ascii?Q?H/DfrhqFgmpDOoYx6WmR4npEJBBzyqAWGq8Vi+vju/F1//azBJlwVyc5NO92?=
 =?us-ascii?Q?8+WjQTqtju7gj5MamksuRMzcc1mfqEF/MLJGFseNzTlSg9pjpaQHwnmx+Xzi?=
 =?us-ascii?Q?Pu8NQvPMWzo7GN7VEv3fRJlF/aW/xAYSFbmiVxSIk3dJOcbuVPvw6/4fugQh?=
 =?us-ascii?Q?jRv6fGD4jm6yTWMOagffji7+SEu9pFZSfq7Xl0ImHEHr3ZXmIQfrcV+iFHhP?=
 =?us-ascii?Q?ifRU+nXrMOwprCZwBshpQXPL5O+JVSZLOfGS6faYqgzgfSKm55l1a8frz1Jk?=
 =?us-ascii?Q?prl9dGPAg3RUcgDCHK/Fr/tH8wp8lwGnDStXuzwcj7ER5Pu2TAPzYfbS2xDu?=
 =?us-ascii?Q?G4qslC02XRF+IuHFDuHy3QOAXyyiEYFcordkhJjqk5FToHqAolF8rWfiieg9?=
 =?us-ascii?Q?UenWtl7NQ9kvBAG2doLO2tgRNwKXzewPb9r8wgs9KbxLlwZ/zQbrlsfHVfnx?=
 =?us-ascii?Q?MRXuqGVb04+uKxDKGwfkVLlf14Y5NnOjrGoHt2FKh7guv5+JNOzYAjFMb5UE?=
 =?us-ascii?Q?WZvtmPEpnU/J0vuOiczMi1ASc0YPjrxv2wPqDeT1KuInB1ErvXRWybfY2Xuk?=
 =?us-ascii?Q?OrxNah4q0xt9RUYXBThnLvYPpswZv7QfPrEVJd5LNRlk9wVZO/xXx0SwLRWO?=
 =?us-ascii?Q?yRMrnCJvGyGCtV3cgRltbDHnZuMKxUmSMwh+9aBSdVITjISZzJL/+sKGkZff?=
 =?us-ascii?Q?R+/PErf3ThEJ/p3e729A6cdv+jiFCkYCdvW5ufwEvcJsAr9XinIg9YXPuR2q?=
 =?us-ascii?Q?mgUbUEtnb4n7xBwrUhC531Kfd7qyHEMCVy6X4eZjAgk/O1+IJPyBRgfPxJhr?=
 =?us-ascii?Q?VywP+opUUq7tZO+o+kO+JlGA9xbYi5T0YSne+dTkwAZItZw04I9AxHtuGuaX?=
 =?us-ascii?Q?ie4LaGyJzPm4mGPVBCJMbfVJyWRT3KqXlKpaiOkCNEJb1iXSyzebOC/sJD4f?=
 =?us-ascii?Q?1B78MsOfUsGztoHpP4RmRmDuwLPh+Q9uhWKNvxdMO0pduHvHuOrJOh5Pw/HV?=
 =?us-ascii?Q?sloFSU9xO8Vn0zVakvE4rbn34AQs11xx/831RaLW7obN/+MUk4nGyJ6mvJK9?=
 =?us-ascii?Q?R814EQpPuJoFQh30+pVDsklL4sKIjj/+rgv697vTsH7lOxVYHqGpzHQNNnBY?=
 =?us-ascii?Q?Rk85oB5cBb7WouMNTSRNi+pmpmdzQS4cs/z5O1OeO9LEfMkify3aQhiE26Si?=
 =?us-ascii?Q?7S/ZoMq/XntHhsPEub2QZBNWDF0Q/U2xATWX4dJ+i7wDd40IyTplZ553P9Cv?=
 =?us-ascii?Q?2fqKIf1wjnNDCA2nYDcm6OxHklkvejnOeM4rjl+b770NhNhU9mkCNQ+qs3s4?=
 =?us-ascii?Q?lvblXxM1cWuIvSOSRzLiryABcFowoHLgl/Oo60TC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69511c75-2f9c-43a8-e087-08de3c71226e
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 07:02:54.9163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBzOg8tkdxbmz7uFQl2mUuSv0heNmtpX5EXU/TF1Brrj9i5w++z35y1xT1/sup24S/jQW9qtP/FURsA7AICaog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB11742

The reset_control handler has the reference count for usage, as there is
reset operation in runtime suspend and resume, then reset operation in
probe() would cause the reference count of reset not balanced.

Previously add reset operation in probe and remove is to fix the compile
issue with !CONFIG_PM, as the driver has been update to use
RUNTIME_PM_OPS(), so that change can be reverted.

Fixes: 1e0dff741b0a ("ASoC: ak4458: remove "reset-gpios" property handler")
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak4458.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 783d2ef21c11..f81cd8cebdd8 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -783,16 +783,12 @@ static int ak4458_i2c_probe(struct i2c_client *i2c)
 
 	pm_runtime_enable(&i2c->dev);
 	regcache_cache_only(ak4458->regmap, true);
-	ak4458_reset(ak4458, false);
 
 	return 0;
 }
 
 static void ak4458_i2c_remove(struct i2c_client *i2c)
 {
-	struct ak4458_priv *ak4458 = i2c_get_clientdata(i2c);
-
-	ak4458_reset(ak4458, true);
 	pm_runtime_disable(&i2c->dev);
 }
 
-- 
2.34.1

