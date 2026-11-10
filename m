Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.22
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794288273;
	b=qb8//2lAWhhnZgT49gXYXvZgzN1CyL7VRDhVm5h4lmJb/aFauT6qCK5BBUs9Szhj1XSz
	 PCOLlg59sa81/J0wFU/VZjmeyOF5+pvi7iLmn1plCv2oaUToJY7e/INDGZjrT9amzIDMF
	 oVRfp68Gj5T24WUKL4bqvsvz0ChlE0xlRjtDGZ4RVPWDnXz+jkhvYBzD5sCLXYLE086jK
	 rcoNFpGUltE0XDPQYtRiKI/QSK2NkvL4Sc6bsRGw+to/iEPB2T9wiuvh+KQ+oamQ4CQwO
	 dd0vF7D1leC9FLe3NGQdtCUlzkuUVZsmJZ1ytCeEwRaJAXGNOKdpDVv9FIS3WeI3fiA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288273;
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
	bh=0Z1wpDb5uMRo1t1KO2HKUTiIwAtYaibBEy/aicnhUYM=;
	b=pSLov/yVR2kDOHUJi73mCidstd6j1ZFQXFvcJL30QsU5pkBWECEZRSeK0SyO6eDPR3Y2
	 2k0eEWgbgdssDSrqLMbUWzTkT9kPfdXf/+Q1xqJfyJYmOPR6cyxIy0MjBXfly4tP7xlZ5
	 pak5R20X0scXBY3AD14Tn+0CHkRXtIi8JRwD7qUq9P6Bwl32JkTKCbmMsLxHv63wt+mVC
	 Qn/UciVX9DSGFX70AxZ4lw26Jiu9D76Jehy/mTzB2ISybq3ZUY/Y8CSID/stbobSQSqk8
	 2BmrNYtea0UmAiFpFzbWJeQ/t2B+AvHKGbGoweTHl/rM1dEYxISe0hwUwXqjIT7JmWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=ctZjIZLB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.125.22
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011022.outbound.protection.outlook.com [52.101.125.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F494606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 05:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F494606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=ctZjIZLB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpZcIRdTXfsvpC+Hto7D4f6dzmzQsc5QafEfft5BLUxiWvI29wzQFx2jp8YrV69GHEBS24463dUYxyVm4rthq7R7a9sg5GAMQwJLx8tW3BZyUXZdjXwR/oz2pvh3zSZ72Esw9uVpc+P/uvMHPymyeJWDTF/bHMiJ6R7hoWYDAbtqp4O4MjRM9S+7+R8stY+iEs+y9pjuIVykTh+4kpx6iTFFr9bonw2S2qMi3bjt3lpGHiR9xfJMQOPx3s66qQAOPnHAFyBgYR2WgS5GAfCgno3AC6FbegLi+395mO+EdSgGN2WRYWSyFxv7r4iZc/pb4i+YgoOKVxTCK/UAHzSu8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Z1wpDb5uMRo1t1KO2HKUTiIwAtYaibBEy/aicnhUYM=;
 b=L+Slkz5hYWIK3FTiQoTWsL/9dDkjYeWPVnvrwR5yIju4RsuM0gIMpLm+fNG1O3Xm3oeRhQ6UdigdVId+mDzoJzcOXQ44UWHd7J8w1B41cTY90GLUUuO0/xxwE+Ns34sYuiMIOSfSAiWdBG8qlcOkhq7jIJZj+1LbYN0dLIZ2jiItaf49cIRSAlb71OpayFp28MOLoiewYG6vU45ESYxISqfEaRqIcyJgPPzxeN+7s3lRQw8+0gtPJKSqwtYJd4TIsRpK6V+3CS+y07f9OuWbZk0Xt4G+4uqAz18XQjk/K2G+X7uD2fUB8yp8EZMV/dE1uRqZDlCIYV67OTph/AlfHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Z1wpDb5uMRo1t1KO2HKUTiIwAtYaibBEy/aicnhUYM=;
 b=ctZjIZLBwSJRqUBSH8pyq/M7u3hTLsPX2X8jom9ifw5ite8+qu47ln3bc2x6S/RLKcAp+NSSswCsFcX18LekT7L0NIiJ6WDHx2DBdG1Qu53AbiWnTpLXHx8SfqG5G7mTwrefs3+zvVu/eCd4HH9y+RN/6Mq8IgdXET0Aw0NJq/s=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by OS9PR01MB12373.jpnprd01.prod.outlook.com (2603:1096:604:2e8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Tue, 10 Nov
 2026 05:24:30 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0592.012; Tue, 10 Nov 2026
 05:24:30 +0000
Message-ID: <87se19mf76.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/20] ASoC: soc-component: add snd_soc_component_to_debugfs_root()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 10 Nov 2026 05:24:29 +0000
X-ClientProxiedBy: OS0P286CA0150.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16a::14) To TYYPR01MB15175.jpnprd01.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|OS9PR01MB12373:EE_
X-MS-Office365-Filtering-Correlation-Id: de7d8deb-35c6-421b-ab9d-08df3eeae53a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|22082099003|18002099003|10067099003|11063799006|56012099006|261102123227099003|261102130727099003|261021121427099003|261026121527099003|261009223027099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	j77kgMTgSmxQH/+a0v1pCZfqAdEy8WhJ0jgqzzW9NI9xyjB3LGhlJPs8vUiO4Z6BBUzJn2c1/ydsU6erS7J2BfAuKUkNj68DKf1zDZooaW6DQN+6tna4Q3ErDuQd1KfrEZeojHJol8CzRSrV8Luxw2Jnh3yApoB6j9HT34cz/Jj5ml1NgPTsV3Vmacl+XBc4fTeswKhrkwNLW93rJaiy1ugJTHskwuzOGUwnHDdxd+sWZteWaDRrC7OpY0n4xjn96oemcnenEEKKQTOCDilDlYeugCIP2xioK7PD+aXPk/Y9aSCRYmfrSUcGfshPI/5EOTfZsr05hVe2pTvLHMwP20qG/RZCITZGiUWFa0t/H9LZPBAAg0G5DvPyjW16LYQfHDKeoLv1iw1rZ35K394b4hMxrAD3uGibvunwDbT58GLnOD53qGRq480uVbERsjW0zsU3VwoEKmLzJx8YnRZ+v4Z7TMDeU+KRVuzbK1rzEHD5qVX5XbeehIdkoxvHf6Fw3zn0nfxV4H9IKbGM7yCN9VHpzbF852RlZY9rKhbT8I3kHu4/VHWrdyKUTJ6tJCkdhZw9B+WZRm9Lj+EnxhXkRm5yQPND6gyjHfgOismr1xVijyZsUFOtzh4f+WQHdsB17mD//ZMCcyqMPXeMgSBu5eYJ1v2Wq044rsVTPqNyd1VSsRvIyjxX/vpONYQAAzNbkDYWzC68Nh4EEHS0SM3WyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(22082099003)(18002099003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261102130727099003)(261021121427099003)(261026121527099003)(261009223027099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?k1tJZXH0YFXuW542/8AafMx3i6TwzxaXdi3QGcfSIsTLhZsMSkelUkh1Y+tJ?=
 =?us-ascii?Q?gsgAa1H5r7Qv9vgW4uAKZ1C1haMGwVADaEbhppt69mOvXodGgND9XZbi62sW?=
 =?us-ascii?Q?XlTfq0HbSJxUrHzmD+yw/yr+1Z0m7wmEGFGSXbwD+z86IgPv3MCV3NcV/pIy?=
 =?us-ascii?Q?D4Z90wkM6zcJB/VjuY0ibGRDcUMntLQCcEKhypkXUjb0tDJu1O8iVL+w1lxK?=
 =?us-ascii?Q?OrGD98Ydk3xP1TNhKmqADNLFY3pgpseJRuX0W8NhSIeCmIDEOrZOjCCN+RGA?=
 =?us-ascii?Q?clH6PdtGz0iX+FT89J0KWCFcsLBVjvqOd9MJ+TyE1qrTYwmd7u/CVmzQLp9a?=
 =?us-ascii?Q?2NWH8JmR0x90AdY2W0rO7DAIUZYED+P+c+pXfu3brHE0nllpdHXDoDwr36Fb?=
 =?us-ascii?Q?1z85q0fwrivErJCfyvF0vdNO3wwMFTEj8a0IC9aTOdkZ3DsZ50dF6sKHmCFu?=
 =?us-ascii?Q?4xTGR3cS7lami445t/g35Psa5zxq3QWW2QLjxeTgt42lmQA3R/GOTFq54lTa?=
 =?us-ascii?Q?uS0Z+YzxH/yJ2nOBSsS0JAG7vJetERZoznYu6uXwlQEl7OKnp7chk3gTw0ao?=
 =?us-ascii?Q?dDZJtTgpRG6zPabIrDesRnmes7Y84Fn77lGCyR6SFWb82y/tHB/orruy2wb3?=
 =?us-ascii?Q?hIXeWI2NMnLk0gVV6FJduaCv/BZTxDW9gJbx4y/PSuuFHG9V83IgxTxqzSwI?=
 =?us-ascii?Q?dUSJIrQT/FhCR3Lpl7CX50S6aBgcOoL73j46lXtlQiifVddllj6vzaTS5Jn1?=
 =?us-ascii?Q?sHGOwDdyKbv56OVyNve8/s5BGGijt+Omu4r/gwUKOubsqlNSXV9mKD8raZEY?=
 =?us-ascii?Q?RfKw2Ve8ejy1LpT4aURKFJaY6qrS4gvuCpc3iCklltwn7GHGHF54yHmv6TyU?=
 =?us-ascii?Q?F+IXAOtpolxaXWtrK9VVcDczPMitpPTxs/D2BeZsvnxsGMNCsX7mr6K9yCwK?=
 =?us-ascii?Q?zrBQLOrAbJx9bvcdQXNIdIKZzj4A1hMVAeVY/kYKe/CjpwbKhiQrAJ/rtMm6?=
 =?us-ascii?Q?jhawb2NBwasDXacBI5uP0isol5IAR6GLCQZSqCY9UhjQnOoKY/+6q167L5Ek?=
 =?us-ascii?Q?04zvdsETzMtdSkpn/x6RwKKetlRRaBMce8tsS27IfQT5zYZtjfttGz/Zu2Bu?=
 =?us-ascii?Q?31F9aZUgnzE5gkCVEr7gH+DsgPRtsHrB2iOi8WlZMKMku2YLxvKJotmQkbAU?=
 =?us-ascii?Q?sKIu+dh4FKLZyf5MD3FTiNZFrRy4qSBwfFD0mDBphB9VWAO3CcyI0bP/+Gz8?=
 =?us-ascii?Q?kGts7On8apE9W27Sp1kfhOztwzwYzY9POKt//TTbx4tD1g9Jr+eYFsQAl11Q?=
 =?us-ascii?Q?k/FiuUWjKmLaTNcTNhpBVbNyz4XWljYOYUynKQv/v8GBcAQsocY/d0asbrr3?=
 =?us-ascii?Q?I2k67arp8V9YrjSN44nUF4eWcWGlE3XxxfTYvjo91VLhHWt/PsTid+e7oNUD?=
 =?us-ascii?Q?5klqDvVVvct1qvba34N5bS5JedlkkdJY0JlwCPSuP4ZMyxjov4/U+k/tALGD?=
 =?us-ascii?Q?pFi3NG/uL/0G/QUe/HNQabaEjyuzmtuD/26wi7BpAOeqftjHc5AaQxmgf9NR?=
 =?us-ascii?Q?lEKwBhcQtL0NFxxXxUxxC1ZziV/0klvMv7UQpZF+pQCzgAyIJmZrohfgGlY2?=
 =?us-ascii?Q?a+FkuNBEcG23qHPzB26nhSF7SJ66YOGRaS3ky2VdwzIjxQZ/kW5iBdbxsb4Y?=
 =?us-ascii?Q?+CX+wyBVED+VicTPYmNhWKFP45SnQTLwrJVyD5jaBsZer6KieanZw7t462CZ?=
 =?us-ascii?Q?wSOkaLu5vnc4t7C8C97L17DOD4KdNEa61T2DVdISnm0QhJAKCeZZ?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de7d8deb-35c6-421b-ab9d-08df3eeae53a
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 05:24:30.0320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /T2XNiaiV1NUJyBFAO1nxtrfv9EDzlcthORddsEO/6gaBt1V9O1HBwtYvZhwubXuvpoJM9W0TqgCP0qKBzVQ21RJtEacO+VeFQo4XTntIr6bmTy4Rhe2zyP7R42AUsro
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12373

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

This patch adds snd_soc_component_debugfs_root() to get
component->debugfs_root.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-component.c     | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 64aca0083c98e..3ba4e2c84e4b4 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -277,6 +277,7 @@ struct snd_soc_dapm_context *snd_soc_component_to_dapm(struct snd_soc_component
 const struct snd_soc_component_driver
 *snd_soc_component_to_driver(struct snd_soc_component *component);
 struct snd_soc_card *snd_soc_component_to_card(struct snd_soc_component *component);
+struct dentry *snd_soc_component_to_debugfs_root(struct snd_soc_component *component);
 struct snd_soc_component *snd_soc_component_new(struct device *dev, const char *name,
 						const struct snd_soc_component_driver *driver);
 int snd_soc_component_register(struct snd_soc_component *component,
diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index bf7c0fcbbb8ce..ebeac81355901 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -86,6 +86,12 @@ struct snd_soc_card *snd_soc_component_to_card(struct snd_soc_component *compone
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_to_card);
 
+struct dentry *snd_soc_component_to_debugfs_root(struct snd_soc_component *component)
+{
+	return component->debugfs_root;
+}
+EXPORT_SYMBOL_GPL(snd_soc_component_to_debugfs_root);
+
 unsigned int snd_soc_component_active(struct snd_soc_component *component)
 {
 	return component->active;
-- 
2.53.0

