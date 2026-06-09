Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011059.outbound.protection.outlook.com [52.101.125.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4376B221FD4
	for <linux-sound@vger.kernel.org>; Tue,  9 Jun 2026 00:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780964602; cv=fail; b=U+YjQIXA65PTHdKY7hsWh1D00Ch9BGkFZ87L8ufecspFUUadSAb3BYzFmQYgWZKiCtmy4TZVtXXNkj8fkJRtd4MBslcUmBM28Ycze2E9tDbPjGRRZ7yLHGvsx3KqIUTBMreW0butSVwOAsV+LjEiegd0G7kGEvQUz4FEYGG10G4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780964602; c=relaxed/simple;
	bh=r+3mUaTi0L7swTihvrY12ws9AHgWROdJdeiuu+J/9DE=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Ehle7EpRqOHl5z9T3zIbM18SYH8Q1BmIuk+vPAz85JyqMCNvrQxamZt2is0w50ULMX9xOoWwXI/YL5v5Au0NxcuLzbf576i1OIIobGqPhSHew0CbVLMlo/zIZLjV6154JorDKBCf5IoK9Qfx5Zp/8a4cXv1Tff0+uOm247s/q8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Q13SlDsR; arc=fail smtp.client-ip=52.101.125.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Q13SlDsR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H2EhCAUalwmImiKJ6v/KR2cs4gfyeyYP+JCtaRjifFhyN42nHDChnFxwiedylHV6LhOKKB0ThT6U+bxzgzCU8nHfiwRvrfNwhEBz6Z8It9OPnL7elgRVM5cTpFTxPY0rSCZky0CZQoBf0dveOyS5wMPbZd12YKEJIAQWHLtqmmYHslj8onIIw9KQgdqGdxlYFp/6VTIaTvimzK5eelw4+xuS5AtUjsQAk6qEObGJ1DX7yIbHIpsPpG3EAOXD89Dm3uSLNgHuWfTq7BDAgiTdOd3s5q2IatK5eJxklC4TMncOFKHcmVrrg1uwT2Eknvv1y2Sm/x6XM5l4Ia5sOV3PjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N5hgmOHOi+C3Na4pvJjzo25hQmKxfs7B1iGqaqAhwKA=;
 b=lhw0Zgo8rhPoxRWZSGguhcjBrCGNOj0qnaM598i5TPpHVLhxyepvfO1i4O6v/SCcQenuwyQwNJhafQ6ZsFMBmGrMY5HfKVixWKV1KkPUKbIiKC6Ewo++VdeXS9Zuce7cPNMn8kTFDSIiKtHX1dfnuUh1DF0q/NGLRc7Gzf0mkdQQmFDdyDyLlUaZtrOAc7ab7SRz5GRJwOr8VS9pOd06/tiaHTljm/nc+KJhwhbfdL0uJAWXBtEc3EONX1GMBl6PtFqBMOEgZmfGKlQ0t4oxbNHxt1/yJ/uHV0upb/sXTHQafG/ZiuZ6IEACGrtBNAmykrOwdMqbzwjRQf+KhJod7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N5hgmOHOi+C3Na4pvJjzo25hQmKxfs7B1iGqaqAhwKA=;
 b=Q13SlDsROxmUiCEeE4nhbPiXGCrmQN3FWwolnWTzEaTHqIBtT8WDuL+XgVhGY2S/AhLqwFdGkyayqFf1SWFLGueNKqQZMriQu/qykhHfLsdapjijxEUeGs6ILxuLlV+5FV9CCE/7UmjbW4DoCAx06+1vZ3nPJPaKj81bJLxb410=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com (2603:1096:604:235::9)
 by TYYPR01MB12760.jpnprd01.prod.outlook.com (2603:1096:405:15e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Tue, 9 Jun 2026
 00:23:19 +0000
Received: from OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834]) by OSRPR01MB11811.jpnprd01.prod.outlook.com
 ([fe80::a2c7:5e53:c133:d834%3]) with mapi id 15.21.0092.011; Tue, 9 Jun 2026
 00:23:18 +0000
Message-ID: <87o6hk36kp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 5/9] ASoC: codecs: ak4619: update auto select format
To: Baojun Xu <baojun.xu@ti.com>,	Geert Uytterhoeven
 <geert+renesas@glider.be>,	Herve Codina <herve.codina@bootlin.com>,
	Jaroslav Kysela <perex@perex.cz>,	Kevin Lu <kevin-lu@ti.com>,	Liam Girdwood
 <lgirdwood@gmail.com>,	linux-sound@vger.kernel.org,	Mark Brown
 <broonie@kernel.org>,	Sen Wang <sen@ti.com>,	Shenghao Ding
 <shenghao-ding@ti.com>,	Support Opensource
 <support.opensource@diasemi.com>,	Takashi Iwai <tiwai@suse.com>,
	=?ISO-8859-1?Q?=22Uwe_Kleine-K=F6nig_=28The_Capable_Hub=29=22?=
 <u.kleine-koenig@baylibre.com>
In-Reply-To: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7bs36m0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 9 Jun 2026 00:23:18 +0000
X-ClientProxiedBy: OS0PR01CA0126.jpnprd01.prod.outlook.com
 (2603:1096:604:9b::25) To OSRPR01MB11811.jpnprd01.prod.outlook.com
 (2603:1096:604:235::9)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSRPR01MB11811:EE_|TYYPR01MB12760:EE_
X-MS-Office365-Filtering-Correlation-Id: 8eab899d-0994-4195-851d-08dec5bd4e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|7416014|366016|22082099003|18002099003|38350700014|921020|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	rv2J+XFM+OUp5dXPmP06hj607gmJ8DZ46zCWXCGXq2OVq5jboDAIytEOeFrmo/6G0XUXmi9CW8nIq2D4Btll/c6xrAbv7kRxGfg8UpCe1/uEbqVXe4YIx18RHxi4AxWCXSUbesnSgoyM+s2IfcNq14Z9Jrs5iKp7Y+kLc9rXIFJ/V/k3MdytT0RC09vp+fDY8A4sD2/4cJHJ8rIxsL5hdJu6+WWti0sSsA8S61QP+uB/YhtXvz80JXK6uKVOd82CnUUFY+5C/3KlrvreJM0CZWtq9Ng3tegoD7VpQlX7BDEO6hSYTa7Ntq1z8M32714aBrBSjDP1eYR/Cgxp7jBS6WiQP1hkYlA48M3MaoTRfk+rktl7flEn1Z99RtvjJbZMh/c5XJlphFGp/Sk+qtBMX3lH+Inj7Un6InLFwIokEoYf4KMSk+wPuU0n6Y+S2HKBOwWGVpZ3P1v66fxmxPhLXlbUWay2PvgePrwulnt4P6DBgWDOi+hGftRqDCrOW7G+KLskOvQbcEIGfD+A7q0dIw59RiFgrhyDbOWIqU+nSYFZHv56i5CWk5AZoe7ltC6roUSGheSlX/Qt5tUqmb2dp/4DbkJKquW3aKSKHgKP/WsvINWSUXQ0aM0ZOmgrud+NTXJtApLTxnO1Rlx3T5mwwIfPSxLUHn52t1NBoCljfnUF1Vjg+yfVE8Q9UDiya5TkP0Srl6aOjc6b9i04nDf+xlZylJT1R39F5dJQnErmqZPPrm/PxloHo+GlqXBzzgm+cklvXAcWKU2R3nWLnCGctw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSRPR01MB11811.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(7416014)(366016)(22082099003)(18002099003)(38350700014)(921020)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dsDK6Z1ddFenuOS1wVKtnd5V6BkDbXQaU4KZcBoHGW82BGgJFFiwNMalJu5h?=
 =?us-ascii?Q?uk7ujrxgd51gCU+/Il79oWvhSYbHC8A+8TsUJrGQ5BthDSCqDO/fCsEPJHf2?=
 =?us-ascii?Q?OkOIcVMLPoy/rXfo4g3AmMXWRhSJYuSsqZlEiUpVYyYW6YLzMp2/X2dl12hm?=
 =?us-ascii?Q?QAWoojL+OEB+aiqILYuEVF7JHwPXlrGVQJzhHnlC4C/fdZiXgX+B/KLa0pWZ?=
 =?us-ascii?Q?UcZcqN5kBJUwXRWhTwgpFLJ7Y6SvKOCoVyVZHBq6pvEhSnNOVlAumoyoTTQa?=
 =?us-ascii?Q?7SuwneG1i4raB16sDeMZWNfrVh93QFAR2pXT5+GQVmx/St/g0OJ+OmacG9ZJ?=
 =?us-ascii?Q?6xtTUtGd8VTUD1xGH/X1lJbUJ/Ww2v+6+9D9cRPbg5F2h2nREjy7Os1T6bvb?=
 =?us-ascii?Q?ddVeQRbVsccLmBejR0Oyt1Keh5a8aq3yd3JQ0h3DjzcXAVqay1kUPxg7Iqjy?=
 =?us-ascii?Q?yPwhbDtT1bIBuEsd5ypdoVRjPgwuxipt8DUHoPj0V708LcB74HP9UkXbV/nz?=
 =?us-ascii?Q?ji6bN9fz+vlFq9G2hNvnuulw/1oIG8ZqZkunsJum4BxrJINKj6IyQdM+lwQC?=
 =?us-ascii?Q?ri87mvkctT9s/dpjvKB2gj3pqQSfSKcatZB6W+91onEoeUYx3hIoFjb4Atjg?=
 =?us-ascii?Q?fumqBe8QfpksP+203buSKWaKTpfYm8d5FNexNU5Uxp3id1zUqg2BDlBbUOot?=
 =?us-ascii?Q?sIP21Bu7XxiKxX5X+Gbitec6zsh1xkPlLNvRrZlFfN/cHbm9fEphajuOivyK?=
 =?us-ascii?Q?rKfHkmyYZoCfsOrg2w3+RW/ThvsiFdUDlQlcveORZ48JLhTGtS5vvr2UH15L?=
 =?us-ascii?Q?QMPi9IvzdpLCepEz90UcFZNNWyD8B3OyTIJNBVfiINDQcOQtrSZ9qCeD2+Kq?=
 =?us-ascii?Q?XhBlJ1UlZgNJdE42oNFPda+7Icf/EuWiCKL6MwpbgEMgQKTbi1el4pdOA2Fa?=
 =?us-ascii?Q?rMTI80jHig9U4nyetolQBILQD8U9PkXpHEzhqohffOWkG4Trfih+0a3ZMTeO?=
 =?us-ascii?Q?b8p386S9gaNpWlxzoxyrJGRcqwq9r4oyDA6ejkS1wjGdH9JZuCYEGF5KNjXY?=
 =?us-ascii?Q?/EqqjP/TPzyu9ZEMF/NGfbVCS10YxhOLwYaxd/uj5Q4cxadKK1gjW7MS/jj8?=
 =?us-ascii?Q?Hr60IUx6vTVdlEl18Ukml7/El5urGFzYVWRDsd9ORLSNG7cNhkhnXws3aOk6?=
 =?us-ascii?Q?rUZYjtBtVST4GOj3d+EXY+cOMGOnztr4HODHicwlsjtpgTR1j2IztKuy01D+?=
 =?us-ascii?Q?3Ccf9JMUATTiWAA4dExNqLDwPLGI1LVnWY5ZSoAOxdcH2WYG05McA4O696rq?=
 =?us-ascii?Q?srCgOrc3/UXDN1qypwIDq8QJu16wOTA/pzlc2YjiD6CRbOv58VIRJtYZATQc?=
 =?us-ascii?Q?/ZIq14XuMIV4ROQHIexHbNUeHGCZPz6jUFLuLfNXVeVRrVnmdC81XN88pyP5?=
 =?us-ascii?Q?GsE1vi3DfkMeVNKZHBvJ6fBae2kHRmPAic15pVUBMWLewpGxL1QLkhfIYGFB?=
 =?us-ascii?Q?kJosjSdFSOdJTAeRgwLiZNyUYhOcxVemsDGDitqBe0fu4b2Ed7tg9PdcKaOu?=
 =?us-ascii?Q?dVlJ4fgZ4wEpPy91nRlIkZUlSMCjG6qyo1oQBI7fECBfyIVGZw9eIX/f05IF?=
 =?us-ascii?Q?X/OpefMq5u2rlWTRWW+iJUIrAJ9pw/iu8vH0AqI1XhhyoRcJdE3OIzBA85Hf?=
 =?us-ascii?Q?RLsfe+yUxhcrAzg2rOa2DRpGFrkL/jRWqI1Fm2kWOtpJI1HMKqffzQ2Ah3kR?=
 =?us-ascii?Q?QtD7TvmqNkEF8AF5x9H/yorMq+S+Gfuau6IltFlgdXgniKH5Gsaf?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eab899d-0994-4195-851d-08dec5bd4e62
X-MS-Exchange-CrossTenant-AuthSource: OSRPR01MB11811.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 00:23:18.9190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UhhF7NWbSgwbIvJfkEPGDF9j9jfNI3S9S8xcxrvEMEFJUtGC4Rxmrji4nJ2ZuSdNBZGbDoLgv2+n1xIW8qXFxjsxt6IXwZDcMz0m9MLWUsCw1ZgDGhuDyihJ/f0f55po
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12760

Current auto select format start with the highest priority format and
gradually add lower priority formats one by one, and search matched
format. Like A+X -> A+B+X -> A+B+C+X+Y... (a)

But in this method, we can't handle format if HW has some kind of
patterns, like A+X or B+Y etc (b).

Current drivers are using (a) style, this patch switch to use (b) style.
This is needed before update auto select format method.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/ak4619.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
index 192b0c3413968..d9c9f6b200284 100644
--- a/sound/soc/codecs/ak4619.c
+++ b/sound/soc/codecs/ak4619.c
@@ -783,6 +783,8 @@ static u64 ak4619_dai_formats[] = {
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J,
 
 	/* Second Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
 };
-- 
2.53.0

