Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010064.outbound.protection.outlook.com [52.101.229.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A4C25B084
	for <linux-sound@vger.kernel.org>; Tue,  4 Aug 2026 00:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785804175; cv=fail; b=jFKVgTAy0jJHoTpLce/JOTOUEWXqWhUaavysiSMCTuUvozmpFtpA8OUt1dfaNcTWjhVtBaJQxfXyz6GWWRFN17V1mgoDZS92aAGvRFZ2/pXDF07LS1H5cdVeM/Jo9McbWExtN1Cde7QC/S8OIXGuQfoc0Ee1FmTUdWvYNhs9bac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785804175; c=relaxed/simple;
	bh=yu0UL//nS6FD/hI4jADH5QMuNys1puOxaUYMZDBDrlM=;
	h=Message-ID:To:Cc:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Qs/fQUtaUujfbJivyAZdVuZcGT5WRDX7dBnObv0xw4iFjifLz5ARwGXlXVLGwcmjc120c4W+HfbPtryk+YTCZPZX8BDqvzzBtemScjMnjtjy4jjJDbJ2JDn9FaBZH2k0834/rED02rkMsxwOW1m19lx2yvQl3HWecCzvVNxyUlY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Tk8vvILj; arc=fail smtp.client-ip=52.101.229.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Tk8vvILj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OEC++foJApAffbacBAzwZvdDMtcAuNqot4zI7bdWJ7mQubKN6ebs+jep4LGyEiZb8h5yX0CXV7/EfVwgawx4iO9z6NkT1LDyaJcTal+nbmdO3lzX6/0mZPD+Fvwlnef2/CiL89gT2uH9hCp3CaJzQstiu4xk7mwywc/yboF+DcbUxqKyK17fvdcKfjSEQBCvgAJ7BDkGS1Ua4yVwLDq3QCZiwWErCgTFV1dlboOh3jdADd3LAhFu1dcbB+qNKTfdw3FBorfuDkc1WMQY+PiaaOUb2jj+1Aerr5hgBIIiTayAfuPS2CbEtt+91g4hbgwRclZCQhkcrOdgC8w84OtHBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QE4U2vAcTah2VHUKRUuj39R8Bip59Ns0nqg7bTgQr44=;
 b=c1ub40j+DSsFPKheLyAApGQbM+0BHX+XnsIw2idPuBD+SWST8z2GvCBKnMdZCecXiCXAMNzy5Duh+zNc8tqJ7bSTvkxhSTT2gRJo3axXHiYMI9J9rUSQfnXUgC1QNz9tFBhRnx2kpOGAIHQEbvDQizBe7Tu/jUewJIEFReCqn7hoXzwaLamyCwHRC4kwfXtSMEtNqpNZZi/yyNHZLLgZkjQFm0ubVh4BME4B1ya4XeXZ09N4DnrAuf7sOeVBj4+fDVnFLIsuIQwHmsnFtZtAzvx1kbKb4PVDF/4KpvrqxxF+pjzrbCUZoTwbm9yjmggjVJETSnFa0nSsInV1biUCYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QE4U2vAcTah2VHUKRUuj39R8Bip59Ns0nqg7bTgQr44=;
 b=Tk8vvILjYweM+6gZXq5I9wMHocyzGeNVsK7DoVtP7ArHW9afAC3mzS5DA3XSYYw+OHHTz0Ly1tlkco5xTu/ZUC9czQFOZZXj1WUJBHBvHKthx+eKTgK3ssQz+SYZ6ipeRHZWyEAEzD+LhOJrcXdwme6yonqfF4SAIz9SiKTc16k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB18168.jpnprd01.prod.outlook.com (2603:1096:405:3ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 00:42:52 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 00:42:52 +0000
Message-ID: <87a4r2wwab.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 =?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
Cc: linux-sound@vger.kernel.org,
 "Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 27/44] ASoC: codecs: ntp8*: use .auto_selectable_formats
In-Reply-To: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxvyyazi.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Aug 2026 00:42:52 +0000
X-ClientProxiedBy: TYCPR01CA0154.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::14) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB18168:EE_
X-MS-Office365-Filtering-Correlation-Id: 04c67cf0-f5e9-4cb5-1828-08def1c15103
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|23010399003|11063799006|56012099006|22082099003|18002099003|10067099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	SAEoooA+O0t5N/lQ+W2koXGq7q3oh+k7vzulwPSNgy4eXZMozHxzumpUszbU7PaVZq1Pep2U6HSXzCs2IaSPe4dsdt47EGvVJhlaTokLZdFX0od4ZaSiwOLyDBfUu5JWJAfhbHfKUXBdqd4whlVMHbtJXTE/nypA8Jz7jqtC0dDOUlBl0JlQftRlfquX2YoK1IRxcDhnZJkBER+vedHzE6h+U3VhbPLQjNNhSf52QHH24JTUS0ZQjRlDFgkuxdXJI2unhkU2yfloo2Kwh8Kutxi01qbEGQD1jpfuDUylk3by+QwwXKiQTf4LsY7k3GhhDeoVtDY0o2ILYEhPbGQcGFRTGAVuHsmBfqh3phKXNmRTCfWHFwsLK2E6qj6Ho8rASlW3NuOTzzzqdMZ5QnNyMD010flQrwxcFTGbO4vp9DPjk2wGFuv6MQQ/D2w2HERjSvr4jj13czte+rHSoHM8xYz2SINMJ9VXQU84z7fd4jOF9Ofb1/+e/F2DoEWDDw8qrjtFAaZ0kv3ApWGGPv+7RyTwMbnJab09zk+kqavZ3UwElftlLz+645q+0QW81yUdg4M4O/9JU1gXP3sLAt+QRKxVxl3H0NYsnvX1Kzsl+gb5ytSFCNc9dYvPz9eXWOwXbUPtfzpgAi4u4Nu2HdnmrzA5hlv6F/VQ40qWZYdBKtI2O3wVEXzMtxLW59zINe6X9L9uWvp1rm9CcW7Ra8qTqQU7IDd7ZS1KxFw2NxnhoEI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(10067099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7aXWmR9wsc8vlEG6ockTaxNRVtZpGgbRwNXNIu40SUAO/T/M0KKsM49iB4R+?=
 =?us-ascii?Q?ExqpwiicO8o6kDRUipIqUwujds6+YfP+WffDYNosVvOMo228XM0aXzRd7KJA?=
 =?us-ascii?Q?1ENmCTWWuJqDzFkZf+4YHGlZE+V8bHUo/W0AFWYEcoPww297g8i+Eh6dfqaU?=
 =?us-ascii?Q?U9CCoY+YkCl8Mrd4KaOGjK8yUye04gq5QywbdfnXUjXr0QaRIJvTlcAySNAx?=
 =?us-ascii?Q?DMoboBpwN25tl9t65E3Wv9SfaJaXN+qGliFrg+NMu69Zmjd4qyDIwaA/p32e?=
 =?us-ascii?Q?jzaCJynaaCBbHNvxFf9McG0hYbn99PgRZUJkOHEBZekBocj/5z+OedKDcnM3?=
 =?us-ascii?Q?bjQ2XhCGXeiHmRRyfeyiuTBsSy23voqkzVjeW3LitoTANhMezo3EgyGO0/EG?=
 =?us-ascii?Q?KLfwS1PN4X+Z0w+/TMxWqoGNwTKMW+2js2TJeiEE+QFfGydvJunvCf90aJmD?=
 =?us-ascii?Q?CFSE/CV8zjO9oT1/RhRQY5ZvAAxixPHrOjmELbuOA5zM+FvVkxPhVeAcvzIw?=
 =?us-ascii?Q?vUq+v3sHcEZUgIozYCWfGvBw7HLmB3EWEoLwz2M1oYfryESA9mAIQfK8/ty1?=
 =?us-ascii?Q?17SlcmL6xEOq54SpYk3zhprFuu1WwNJwMh2jChiBnJ9pWrEGVcpG3VctyBjj?=
 =?us-ascii?Q?4ndHY7n87Clom2F/aA5+S2QtC5BJhTryrjOVbSovCwoImEjaOpGg6BIghmke?=
 =?us-ascii?Q?Ebyu330ZVFRT/yltGVzmSP17WIPEN1XL1+/RMi0Dl9ZjqJ9KbdWfpygajPNK?=
 =?us-ascii?Q?X2q5l4krGxQrYaHGliPFGlUR0G8D+60Db62Oqpx/1tkxzhxuw0bw2Mv/+3zp?=
 =?us-ascii?Q?F6pSdbPFVxiU59gZy0v+jqxUwTlA2DpfxRPyf7AyzXCn3fzlFvjotPH18QLk?=
 =?us-ascii?Q?15oBG1b7xB0SZdL5W34KdrvjQAJT/iWcMalCy4eVEuQMQ+qGpRqAMpsLCcDp?=
 =?us-ascii?Q?H/k7r544pGgNv9oCiGxOhI0+eNvDH4pCgoEoZtoIeDWVkxU6kzTVoZHsYxNi?=
 =?us-ascii?Q?kgrI4JhHurDHCe4oxr5Q60Q2IUPumOJBBF+G03Lw7jQMIr3CnVj94Untz/g3?=
 =?us-ascii?Q?2TIGeLj1XMlQrWQfSYsVafOO1ou3ynBMuIQ/rHgMjjNgyeIWAH8Y+eBt5fCc?=
 =?us-ascii?Q?gH3atuO1iA4f79UNQSukpI4/+4CAt611aLIlThY1kLvfWY3N40gheCMoZDW7?=
 =?us-ascii?Q?87D9nbgfBSssUDByjqG1UWO84rx3+6GbwXfxcAhK2ZE0uisVBFVekYFS8Jk4?=
 =?us-ascii?Q?vZ3pEppga741uD72l1Z3zm6izXJ+AUnPh6md3UtdvX8ia/N8ma0fP8HqoN5C?=
 =?us-ascii?Q?OcB9YUrwUXZZcvPotRxx7VmFMKwawx83BBl7j0tNIlEvWz/zBKhzcrjOthi/?=
 =?us-ascii?Q?6mlYJF/OWCHwcvd5ZXbG6DQBNPC6NcWFuvMt62CnrsxTuzvMBHeaNmsdkMSL?=
 =?us-ascii?Q?U7SBA7TZ4O8EfCmFfNMoYXLB+mPKiaipCEIKPZNK/rTQsx8pbEjcSXbxob5u?=
 =?us-ascii?Q?BWU8clzEANyZhYE+lY3cskReB3UTnY4QpHmaD1DxaV2qCElcxe5Sc3A7yGI7?=
 =?us-ascii?Q?VLeefSyLCSuDsvqR+fB8JaWjUvZ+Qw7ipHkWnJQLENv3L9cpoM6XFuj+lGYI?=
 =?us-ascii?Q?E/2CAXubyIcdgtRF+H8fo5bO+3ZK1fct1SJoFQ4kA8YCmmu5sTTmvRsWswZF?=
 =?us-ascii?Q?GEsq/pT6qwt/qv2apeO3P5F6ZukO875dVvIAtjg8PifsvpZNhx5rF5HxUSlC?=
 =?us-ascii?Q?yXM6dceMCz2UVIqpNmLRsV+63CkzoiUDbFQcLY4ekBB6wuKbDTOe?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04c67cf0-f5e9-4cb5-1828-08def1c15103
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 00:42:52.4386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FyCbBJxpBJ7ZBcKbKleTSWOal+eVYzojNjDl0TnwZbc49JYNkTO9Iv3s8PBwhDjdKt4UzskUy3ojE4immb9pZap6AggSFnZ8fTz0WxviexrSG7MlNgckjmD94v53meKC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB18168

We can use .auto_selectable_formats. Let's adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ntp8835.c | 7 +++++++
 sound/soc/codecs/ntp8918.c | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/sound/soc/codecs/ntp8835.c b/sound/soc/codecs/ntp8835.c
index 5837b9379fee7..39620b84e214d 100644
--- a/sound/soc/codecs/ntp8835.c
+++ b/sound/soc/codecs/ntp8835.c
@@ -385,9 +385,16 @@ static int ntp8835_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 };
 
+static const u64 ntp8835_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ntp8835_dai_ops = {
 	.hw_params = ntp8835_hw_params,
 	.set_fmt = ntp8835_set_fmt,
+	.auto_selectable_formats = &ntp8835_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ntp8835_dai = {
diff --git a/sound/soc/codecs/ntp8918.c b/sound/soc/codecs/ntp8918.c
index a18d79aa80aaa..eca34fafc4e6c 100644
--- a/sound/soc/codecs/ntp8918.c
+++ b/sound/soc/codecs/ntp8918.c
@@ -306,10 +306,17 @@ static int ntp8918_digital_mute(struct snd_soc_dai *dai, int mute, int stream)
 					     mute_mask, mute ? mute_mask : 0);
 }
 
+static const u64 ntp8918_selectable_formats =
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_RIGHT_J	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J;
+
 static const struct snd_soc_dai_ops ntp8918_dai_ops = {
 	.hw_params = ntp8918_hw_params,
 	.set_fmt = ntp8918_set_fmt,
 	.mute_stream = ntp8918_digital_mute,
+	.auto_selectable_formats = &ntp8918_selectable_formats,
+	.num_auto_selectable_formats = 1,
 };
 
 static struct snd_soc_dai_driver ntp8918_dai = {
-- 
2.53.0

