Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010021.outbound.protection.outlook.com [52.101.229.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D897309F0C
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415843; cv=fail; b=KE5XGkvN52G5QxkFwGgEhcdX19HgmTJeYCdIU3VfsuX6lu3+8y6zLZM4735CmvwptSLqDMdpTzpkyNaYFQkSQL8LwK/xaJK0h+zYTlmvbhIo9C6LR9TD8V/WOpA6NkNUZ+97vSd2mb0Bebq/dQMgTicLUaTxLBOqxpu9Sj2cAkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415843; c=relaxed/simple;
	bh=0kpV3b6WSIGlqfgjiytdKUfBSSZzFjZIyAdOuO6cpu4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UBLuckVrdgCL98peQdjtqhlelWceFtPlkYVuw+Jx7mObVJiXk/dZbS9/5EdLfyTHiUheqsyXesJtYNGnNt64FfyUsNI+NQY516g7pvBgkp8azfAmhQ/zBoEONt5IVjYp/GJiym5jci73KmFqAFj6cvkgPRGwaY+chIvTgbGrfnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=M8YH/+CO; arc=fail smtp.client-ip=52.101.229.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="M8YH/+CO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0Lroypp88XyMdCVIzbZujUBLoH2pgkX0sZt17OweoT9KRgs2pO/W/T63cipr8Ct9z0w8HXMqBVVALCuC/jv1uH4s1zJ8ieZjfZn7kloWXF3s1ElNIDhCIxFLiTm6/tGfVISAZ6xpLApiaETp+JpSeK8080eUmcuoS7JfCeaamttxrjr+FLXqgauYk9KhfQ6mfaa+06Cw3fqL8MQ5GJdsy6HsSz0gCfj41/YVKqhqT7WMiuXdVFATNsgq3UduF4D4OSDqWxSeFY9T/sj6MmqNRTvzYWX+G47vsmdeGVc6zEAx9TKX587Rw+JlHCrf8GiOsHGmVVAcOwRlxHlx+cH+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqz5FtWoBESJh/vsro+qvVGCoL9LM1KY85DBxm3cwp0=;
 b=qFzg9XksmOsZC2kxb0tdNcTY6LaV8F1VxuIzeAujm2AWVrOwcqpJevHrl0tv9Ivq3+vM0htxuBIvyQqoN1+Y+QZK6esrwpwJQcriXM20ISBSRwOH0Ps07Rro5o+Zo4ANEUnuwP1KkdDg1qmDQdxIybWQpetfeez56jGfKe+y+PyzX+nvn/WyceGGZNUatHTwiiWzrzvBE3O7+7XYwjbSyoMUTHYfHYDQmOLiaE0wD2UJ+aJPTJpCNZXcH15huiFh6JlAEBgHkRpy+Rfdbe/JaocsKsCFr2bXNMZOJN+Pn2l/j8ATvd2dvym5A7vuutTG/pD/6ImGZq1AcT1yKGYTug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqz5FtWoBESJh/vsro+qvVGCoL9LM1KY85DBxm3cwp0=;
 b=M8YH/+COOb9VyqjRxS7FAApmmREjEDI6mW6WNVDCxi1mz78AQBDfFumiu/9k1ZKFMHoB0MDMN1HirqF5peF1WxFeWiE/eU0XmDMww9x602PV1DBLtWaFo8kiTbSfAM52cAniSzgXLcO2RuMw7UM9EFUAb3i/o991S3ir5Z7O08k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:00 +0000
Message-ID: <87zf9up0v3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 072/139] ASoC: codecs: rt711-sdca: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:00 +0000
X-ClientProxiedBy: TYCP286CA0261.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: d122c8d9-306b-4917-a961-08de0ad98024
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+6cAu1nK68scvtVQqzeh3/fCRU2byE5FdGxIIqpQ6KRjogDXQ1TQitNgcpzS?=
 =?us-ascii?Q?IcGnv/nyISFDi/tSGouDvVjYNF/6mB2fSQBmsx+kNV1ydfAFNr3TvuonvnQw?=
 =?us-ascii?Q?E4EUcWRjeY2cvWB+U9bvrOw+7v4++ASaOMZrQStJkDVL/wkJLUlFzIQEg6tp?=
 =?us-ascii?Q?a2BZrf6p8tvgrvcGoDj2YAQQkww1xfYf7f4Z0ONp57YucOtSKa3hAzx2trCf?=
 =?us-ascii?Q?xDlO+bj1G9rn2ofF3342rn8mU81PFa0MB3oYUgT/axRkvXtQaDzICvEZSeUI?=
 =?us-ascii?Q?30PqKNvx9lPtL4HWr1tX7vFET8ED+dK1SGlsWiOgeqVqxL4njPoMwUlj0Afz?=
 =?us-ascii?Q?lP8SgoY1qdGcCXS0tWlth5uPefikzuQW7TslQQs/f7QCi4JSFadX1CYNJ41a?=
 =?us-ascii?Q?gTLTF0kbUKOgrv6ohMMwZZJL0dGmqJG8I1jks5f1YKX8n/OeJX01OWOjUOij?=
 =?us-ascii?Q?8khp3Px7dV1Ya52gtEcX5sMOp9K6MtGtpcT2amYvZXJIk/ts6jxtFj1ySowT?=
 =?us-ascii?Q?x/jaAOxgRUU2Quhu0G0mKlDtruc86tndLuq50ramiYSpY/3K2YYkTIvTfiJ4?=
 =?us-ascii?Q?lwWnakEk5JliahVtE7G2Fc3bX17LfUqHFZ2twae7fuN5Dl6KnjrigHLYIorA?=
 =?us-ascii?Q?NmWCimGxXpsC3NYinLUEtQdJomD8iFz2JM1G9tWiLCa2nxI9xR5A1Vh7SMDq?=
 =?us-ascii?Q?TQApmmWL9YCA0t3QqT/gyGXpA/PyQMzSKlWYV/Ya4r5E3OwI8Df9aci/KnZs?=
 =?us-ascii?Q?gx3E/lVk1IRGmmrMYQ6cC5Nfa0qSeP9MQ3XVRcNM0WRwHrhWq6zxQ9hXR1YC?=
 =?us-ascii?Q?Vg2EPHbXnhzTDaPlAc0R/eM7dxVt0LlJnj4QswD0Xkw2ASXoG1XhN6Yv1DQw?=
 =?us-ascii?Q?mQ2J6u0TdkxWQvZj90JrLkTowtZw2mbtEOROfO+M3Zk/wE/O9Ox/QaEl6kqy?=
 =?us-ascii?Q?jChba7b2X1O3Glh1AKtL8Zy2WqvuYeC9WcTw4yyT87XoRiO29JI9pXzgVJdB?=
 =?us-ascii?Q?jdLSCCrFqYkW6mfans+Zkvbtrd29NdfXoWa+GUDirWkB7VdOK6urkOhW43Zz?=
 =?us-ascii?Q?yTDSzWedhNxXuYuCn94KxdYyhXJeucpdEsaeElDAbjbBa+aXCVFfsV0HZFlY?=
 =?us-ascii?Q?MMdU789+ITuIuTajfUY4osJUqoqSTFDeIk3I8N1OfPnmuYz5PVbVF/jdVudk?=
 =?us-ascii?Q?rsJFu1zp0uah84ofUUTVbvJ9juMk3qFs44K347OPtaHn51XHavqn8vKqMRYQ?=
 =?us-ascii?Q?anklQL02NUhTpwe86b+F/dH3nsfi4GRFEm0wjTqVMOSJv97juHvfI1r8XMZV?=
 =?us-ascii?Q?6evrcUG7QKSyoRQCflE7pvfGMG8BWgG2u+hGvVGli3NtOJkFrB+m9jYii7EG?=
 =?us-ascii?Q?0QfKkwPxcUDUtMbDzityvSx3655E5MmSn8UXBNU+kMys16Y+RVIF3MdmNSso?=
 =?us-ascii?Q?wIVVhvz9BZma2MLXpUrIhApIYDta+VCH13FA662SkkSlsuL+ZCW6QEV2GCVy?=
 =?us-ascii?Q?QFrtbcHTYjgHaHAfDU0VbDO8E6ZXoQdgektG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?19ES7kz4oAUp2g3A6x2IS4cJTg6hE4MAonYIV6+Ig2QPbhoMQ8qnB0dVnWNc?=
 =?us-ascii?Q?McoGwepCGQLK9+bIWClUvsK9ewItV3h2jOjChymEh9BEGFx/fSjMZsciOTCs?=
 =?us-ascii?Q?NS4fAgrRLdJpF5wcyJJ39XYZ975huUYTuu/FNMfyPYYEjLRyPFBB8Xa3nV5R?=
 =?us-ascii?Q?hSGOp0Ydh2y1C+kfBv1j852jDWtmN7wrziWvZtQossd4wzJ8m/dLjPLGzSuZ?=
 =?us-ascii?Q?Zfg+V9WG7+L89IFWZHg1YWibV1HcPx136N3DvLm42WIO1CfQP5QI1f3urh5r?=
 =?us-ascii?Q?/1PzcgsDYPkOchPxnY7ahNBbR3WgLHQPdo4k3SzteEM6OpBC1PKykULz1wAE?=
 =?us-ascii?Q?uA+EKh6eMN7gPnRdkOmFAI0L1kjZD5c3AUfnVih0RWb9CiwKdV+0HgrKZi3/?=
 =?us-ascii?Q?oKSGZAgInYD4MQF7hsywHwwEZKMW/JEmQs2LBf+DA9XNMEL5zbq8UHAy5Z7v?=
 =?us-ascii?Q?3cNJ9IQV4pGIj4t3lgtA/QG3jrJmuS6gqZ4kxbPJCgImXKs/N+uTOwajiEsM?=
 =?us-ascii?Q?h+Pa80jSDNuGdGv9trEbx2LHPoBf2U0mKtvJW7oa67vRkYwM+UBDFYZmsBvs?=
 =?us-ascii?Q?Etwr8rK/3lN58G9+gnDsnpiTvbu9pN3YaM3X5AETFBkVG2tF2B2VRZ86Hbae?=
 =?us-ascii?Q?1nkn5gLV0Lpsag98G0G9vgTRVLlV4AGtPb3gj/QOtOAZ77RVE8glKT1WNcj/?=
 =?us-ascii?Q?tZHGR/ykodD06zwqHirZIWOnCgyvOW901vpMR+pK4kGQ4g2SK6X8/G+gYxmV?=
 =?us-ascii?Q?jfYKqbDOVRazJVohkbmobmP/jQZxLkXU63KygMg0TOEy2AYZi+yzxYJ0cCXK?=
 =?us-ascii?Q?RPVTaUeTj2waR/X0VtuN9A+J2cDgEebmN2nmDT251odAW0WbqnkbRBncklR7?=
 =?us-ascii?Q?2bDfTfk41+W4kk9mdS2NvMM9gjfZC16a8z3/pxARZGfQ9zjS8RDl7pQjsXs/?=
 =?us-ascii?Q?lVXVyvate/8urxriR7ok28whZyi6EMt6/znRyEuDmKg3VCdBMspXKcZrQ0ts?=
 =?us-ascii?Q?SdyCA4KWtw5jGqU//C7dDUWNmUga+1CrNQOQEF5O0myopETHIn7mbxHw/U0u?=
 =?us-ascii?Q?wiedVFfElt0bE49ayRItKcHgSHiLjkT4nIjpd2hB6wWsGAi+HMb5SMHKziR9?=
 =?us-ascii?Q?ojB3MGB1aSTqEnYSr/fejomB4qRJkH7sQAAViQcVBQKbHxtOKGdqkkb6D7Eg?=
 =?us-ascii?Q?w7vml3btBe7pY7f85w1KoBSniCAMRFVBTDIJC39QQ1cx0zLTWZRCx/fXbsJb?=
 =?us-ascii?Q?UFcJz4q917gt8q023K0G1ejLVAuknK5NT2BXoy1jM9ekFx6BJh/u/YlLPtPz?=
 =?us-ascii?Q?YRR5P5ctEwJJrBhOXB0vIqm1zx6eD6xAG0EnbpS4qCVioVSpaQ/dctKWPQus?=
 =?us-ascii?Q?2HVrDcPPetgkRNbFp+LWhmmtoFP9DsjW3FmpLkerUjXqmBFsUq2P6VaZuBuY?=
 =?us-ascii?Q?EszlArhH3fRSd7l6JZIONTHHTY2LRYBNcgQe5wQUKAERJpYAPVjZK6NA+vX4?=
 =?us-ascii?Q?S9olxkpY3lYlSd8ra2aUZkWppPJGJgkwLHFx+go/2KWLx0ccbq9hr+fjR/eU?=
 =?us-ascii?Q?jvAWQAcYUnQ4fxCEoN6ploiIdx3ffNx2qQmPwSuwLkxaxgdqhaXddexUMY7F?=
 =?us-ascii?Q?FNqV/vs0ySWwQf7ThDU3CXM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d122c8d9-306b-4917-a961-08de0ad98024
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:00.8614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3g98kzA0+t55KSGpmvdIjqLlW9fKmjvM3W1SOpYqo3Raxr8K+2umH3wplGr9fso6Ri+4ArYQX8ATC960KUnoIunzIWsr43EPAAItdl9TV5C3mi2Woqg/VuQ9jFxcr5h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8810

We have very similar name functions (A)(B). Both gets component from
snd_kcontrol, but (A) is used in callback functions which is registered
through snd_soc_add_component_controls(), (B) is used through
snd_soc_dapm_new_widgets().

	(A) snd_soc_kcontrol_component()
	(B) snd_soc_dapm_kcontrol_component()

(B) is using very picky way to get component but using it is necessary in
ASoC. But (A) is just wrapper function to snd_kcontrol_chip(), and directly
using it without wrapper is very common way on ALSA.
To reduce confusions of similar function, let's use common way on (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt711-sdca.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 16c3517792434..8212887a558ff 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -813,7 +813,7 @@ static int rt711_sdca_ge_select_get(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
 	unsigned int val, item;
 
@@ -828,7 +828,7 @@ static int rt711_sdca_ge_select_put(struct snd_kcontrol *kcontrol,
 {
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	unsigned int *item = ucontrol->value.enumerated.item;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt711_sdca_priv *rt711 = snd_soc_component_get_drvdata(component);
 	unsigned int val, change = 0;
 
-- 
2.43.0

