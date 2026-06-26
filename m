Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211665CDF1
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 01:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782436091; cv=fail; b=GK39/vGKVvI8gXwPewF8AxJ6oUKErGIEmErRhTzbLm/mPnhJYE5I/pcpagO+hQDCHWgy84vllZUDas0Frg+gZcxjk5raQQFvk7k/NwRSydPPt4tkVOP+yU5yR5IoGc0k+JZ9xPkZQD6cVL3dHRYdGyFVoJmwXGch3Gu8I8ed9hA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782436091; c=relaxed/simple;
	bh=jDMuwDcIE//xts4IDa8SB4n56NdkOckLpow4qaIEQq0=;
	h=Message-ID:To:From:Subject:Content-Type:Date:MIME-Version; b=V4xD2jUno2CND07ymuV2Rt62Qh08Fclc4/k6EdP2en/rmeB3iExbiHQhlFCOHFMt11cacF4QFtprpakfENn3ROVo2STNp2JFC+mjpgl1iESio4Dk7v09tUCZL9WTjir154b71PusR/UBsQ6SxjWWfqwzVi1g0rz1daWsxpM4ZAE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gUlf+nAV; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gUlf+nAV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuKX4u7/yjx2nYZlfsZbvWKmk8kPfnagO6ypj0Q/fIdgYK/UK8rEsllS2Wg3yp6BTwT/oBJH3ZARmZ7sJt0CWFYq2eqma6FY+4Xx+JqHmRNqtpEKmOACrU8uYJwOkgDT/tC6Z5VJepuX7B8Cb7ylN8ofLujXrWw7iXe1bn2RuaONBvPwH9E6HVv1qVnsCcmP7fjY/T9FE7eNgVFjn+3c++FSnPpmhIeE7oW0FV6G6MjLDo8lDQvTLKhIQb5TfRkPUdsSyKKmCDkmsVQCIfwySNVGVQxGdTPAJ9WctHNy3UIdok1zW11AFqJeJwX0lY+FfL2Qhcqa08HdWahGHQXAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtzA+VSowj/6DLwnhZLE1uETZaZkT1Zq1+rihouREPk=;
 b=tTICgCEymRzCL8zXIGTHpFGYoKgFmK3aoCSIHKD3mC6efIXpIvvc8/ijj45iJTJBEcWmyfXzOnHC5abTT674DLW+plQM3b8u0IbFoQKhAY52mnbTjhUB+10c7Ba+dZN2dFiLWXmq30Ejc9/2Q3kxioHg3e1aYya0Mq7DkSqNmlqbzWWYwGUYVxTeQADYoOHT+6N9ugbAJ625UFeppB331pWccR6jfsKPJ8JALtl9uqjWSrqOj7ocIEsm+vZUzH1hYZYDEi+wnt88+Jq0NWqjmIws070AZpFA/ZKYO2YCFfpMK41RDaF1HAQzhxeypd2RofUfFcKWLXeRfg3EZUndCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtzA+VSowj/6DLwnhZLE1uETZaZkT1Zq1+rihouREPk=;
 b=gUlf+nAV3WFaNw0G6YmWufLDJjyan1oi1aAKCmR+Gdz/kgGoXWBgZeLktWbiGDIYXxz7OobcmEaYAWpnJp/Y6t6dwCIpaWQkyqHn3+HfZHit4WvEdHQbfm9loBYOJ1R3YtHaR1dVTDZbomJiHK5dP3Fs3ivcpQll3MzDALi8pOQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY3PR01MB9696.jpnprd01.prod.outlook.com (2603:1096:400:222::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.17; Fri, 26 Jun
 2026 01:08:08 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 01:08:08 +0000
Message-ID: <87y0g2ds7c.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: au1x: psc-ac97: remove unused chans
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 01:08:07 +0000
X-ClientProxiedBy: TYCP286CA0202.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::10) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY3PR01MB9696:EE_
X-MS-Office365-Filtering-Correlation-Id: 45744b95-7fcb-431e-b4c8-08ded31f6233
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|1800799024|366016|38350700014|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	A25vftnDqJsBQUQueM61rNVytpexkTBBCeJP3/I9bEnFlEYiJq5vfrZIJhAnbD8GhtYF2WCfLqFqrb610cjqDqAf0fJ+0Y+O2eya945r7XRrkmibCEiSssTJPtCp3aeCu8loi9hSyyfuITlRoVoJA2N0NctPk82vUYEBRZPHexxILVx26R313pCufaiJMooxF0Iy3SgfffWWAW7LGOrWDDmMAppFReLqCMzSrNIF7LXfitVcWstW+kE4bX/GcDjGrtGv2WsKo/cDWkdfsJsdapBRzO8qsLCZa7B2vhjU+uV4N8cWu09dlHw+3N48TysBYbto1JmfmjiyklT+hA1C73LsdYTBNCJEfs+Vvpp+3DFBVyTzITYVRMWHDod5NCgcfvdLw/MIOgmgSAaTw0XYUKCfI/U997unDUoThf0sHTEIikYG9qGv3h7+J8Q1GXBcWRTiFijbxjZID6pLtVUlTFtkLA11dyJV7LfY4E5if7ruywK6mo3766ZB0WTeEeycAPIytOTD52KV6KuM+TKfWpOpK+dagA/axhbsRg4qYUGnEXCfs0Lv7oPq9lh/QJSLSa68eTPywoN5f5G8UONd6uaR7DYeIqTLmUGkCIqKB04O/7l69iHL6WXWpnv9MJLHKZBute4/TABzjsn4I8JtrSHxde7HL7NPACfpsksh8Hjz5iUysE1KUVsvgN2j239M1X04rndEUH19uHDGrzSii1uCk5e9dyRLVwngkBQcxqg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(1800799024)(366016)(38350700014)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eVlWVXzCKAfDxCJovaPuaDmgsY7isbe7wilyrKdg7ylWkkvEBo1HuHHNp4Rf?=
 =?us-ascii?Q?wW7MRDtR6suzGuRxk/8OVdCvWx4khFQ3nGHnMeYnbh5OKriRZRD1aGhScYwT?=
 =?us-ascii?Q?7JsB/8zM/hMHz8ruMtOPpQSpp4UxTCQQU6FdeX6y4Q0+TrwpuLHNAOVMyfG8?=
 =?us-ascii?Q?PZLCCScNGw7ECwrKTZhOU93hKnnzObbmz7wKxi59DMXIkpg/Yy67Y9LWpy63?=
 =?us-ascii?Q?DPA1+geMwcACrOHCY7CYefKRSO6pY4JfnPerAzXgk/QR7JrHMoz0NOgmLnKP?=
 =?us-ascii?Q?wpiYXkwMYYWrgvPaOwBpMvOBANMx3NB/7XSvuy7tu8QCrUukmfhx3bCYW9OW?=
 =?us-ascii?Q?pWf99yibm4NpavCeMHi1PqGLLr+ETSr4PJV6hutbDT9RkxKv/M8udQZlOZMA?=
 =?us-ascii?Q?KlfTZCtbUV1a8G86N9Sj1EeRa0U6T5PdY0IaamTstD6Vpyc/McTFgsbVfQTG?=
 =?us-ascii?Q?FuUBaFc6JYlYCQsr/UIdEX6/2ipfrpPe8CtjkiKPi1C0pz5r5EIk17vies+z?=
 =?us-ascii?Q?I5YUgV32mpTBMxPIMRf1zOPrtMhGVDqbS3oSyltLKGoHUWgk2NcWRFAy0j6z?=
 =?us-ascii?Q?KfObWcWiliYwmkxMK7WylwEmwhzPWUy/EG/ACMDMAoplASul4T23DQHe6Xf5?=
 =?us-ascii?Q?KAWcy+ZYz5EhVHi+ApAG7kOIy6Lx78cJeAyB0/VXeFJEkpk5rnHkj4/QOfUp?=
 =?us-ascii?Q?6ULS6lGed0nkHmbntiyjcHPNNhxpcwpNzrkgiZtMC7xvwsdg8d2eHM4Qe8yW?=
 =?us-ascii?Q?+zHIGvJ0Wo5BHTUAccoPZ/h+mWWu0Orj2596CSYdxWaYIhF9DhtE3Xva3FBG?=
 =?us-ascii?Q?n4m9bYhk3jx1MX86gnTBq3KquSzKbzdlzmKPiAZbU6a3umnSMfOdq4Wic6SH?=
 =?us-ascii?Q?3dYpeyAOPVvTopKAPGebcapuOiqQOeJcxvImkL8cELF12IbWuK6XLFA7SgMd?=
 =?us-ascii?Q?0eQnbkfCEO2gZYu37xA9laS25fqbj8HpsZyBF+Lq52G6GSFLWIj1CYPQLQOk?=
 =?us-ascii?Q?BB9UL8toAxafgzv5nJLoN6Yqei7h2EsOffADp/WnnFm/nXSxz/n6hQlvSBFv?=
 =?us-ascii?Q?yB0+LpAb7U2PrWy3F9Y291Dxh7ipWCyiGXXfJf1WT8eHjpPcv00wGLt3RqIs?=
 =?us-ascii?Q?1FQNHkT0E13PrFV8mSuI3IEzlKyzrnd2m+lTXhHB+BJHDXF1lKvRV1OgqTve?=
 =?us-ascii?Q?+hZVJ23hDEMH6WcMamn8XTQR6A2MNmk01C5qb4hhakKqJp3/J44V+Q/zBwpO?=
 =?us-ascii?Q?xfjN1xZ5IRsjtmEwCLl9KsoNCwfn/QLjoRU3Yc5cRpSeT5xzlBc0ou9aYWOt?=
 =?us-ascii?Q?63NE6Uwo2lCJUZN1mkFf31ytlDeL2O3iyU1avbBPxc1WjCQnXaDuygpQn9ay?=
 =?us-ascii?Q?HNGiq4aVnjJm9Ctj0Uxceca+zsiIO2S8WlUcwCTKCpBVlGK4uSsg4m7DfhaZ?=
 =?us-ascii?Q?pVIZc4ES8hP91CtNQ0zEd4q9sPdex8sxNCWSn1HTV4S6Hm+JVezFjGHKPvKZ?=
 =?us-ascii?Q?Q662GNh2m2wvYSX7nPhIvSQMXVTVpW9MNstpTXSEmw5uF4qrU2sMdH0v8bAQ?=
 =?us-ascii?Q?8XqIEsD2I51ieJHHYtUezivEa5aQq3tK5XKaf1M5iwUcGmhPMEfCxJLyO4a9?=
 =?us-ascii?Q?+BkfAfUITTFzHfQiKCRrP5azdPedAb/zaD8w+lr6kqFxubhCw8+t9nD+V0ep?=
 =?us-ascii?Q?2na9Q8Aj/RSnLodQRz1ngt0Cd1yAgVEKsvFgLdjOc7Rl6tfxt/jxR8huKChr?=
 =?us-ascii?Q?hXlqoeNyybLLWEcD53HK7VAnW5SJRlA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45744b95-7fcb-431e-b4c8-08ded31f6233
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 01:08:07.9947
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7umJIqAvkkPKI9dxqSDyBAI7Qq09t6j31WMMSNL+USpLPWkCUo3JOLz6rRq3LjcY/Emcbp3Ci70+YX3w3QnnT0CSlUux8V+V0K+B21mBKgDnnaQk1eu/FKPjGhHbj780
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9696

chans is not used in au1xpsc_ac97_hw_params(). Remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/au1x/psc-ac97.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 94698e08a5134..0f9d808831167 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -210,9 +210,7 @@ static int au1xpsc_ac97_hw_params(struct snd_pcm_substream *substream,
 {
 	struct au1xpsc_audio_data *pscdata = snd_soc_dai_get_drvdata(dai);
 	unsigned long r, ro, stat;
-	int chans, t, stype = substream->stream;
-
-	chans = params_channels(params);
+	int t, stype = substream->stream;
 
 	r = ro = __raw_readl(AC97_CFG(pscdata));
 	stat = __raw_readl(AC97_STAT(pscdata));
-- 
2.53.0

