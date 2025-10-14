Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376AD309EFE
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415831; cv=fail; b=Ln5s+msIMi/Fz8Y1vLvNMI+RerzvNuQAFEdOlL7X/xnuayx6QH445C8YT5tzkvADuO4nnrUTcB7m/G9RhRFlzkj07B0IubaVZ67v9eq8s/3I2ybvicuuUuplpNYQtgKFDBvwLxGDO2D/+0AQ+qSXiV6bnZpYsA5rrTuK2ZRfLls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415831; c=relaxed/simple;
	bh=YFCLEqlhaop8s5ds8M0A4WkYnydmxQDOQBlHWMYR25Y=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ShCsQVxjDEjBEdfFwtj51Okz/oj8jfn5SNpNS6Dkkim3E7hyzI6IT2CzP6dAAAkC0KSYyGItiLpeVA1mzGSYDK4Jz/MPaIe1Q7hwClPIotVcbVE3rVNEzjDK9kKUcdRC17Hy8f6MaXSXLWnz2f7DHl+EsTwLQlZhx4ZFSc6nqjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=goH4zx2N; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="goH4zx2N"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=da/YOrcD2Pc8DHKWDT9xko6vrfJPHKl+PVqt+bq1NoP5i5UCZ8BSLQPliNKEAWBvMqWsobp4z/qluf+Y9hQ2UamobLrCToNnYYO8ieUBD701DK6WJfan2Y6i6AIm9tPlSbURVYPqfMHt8Bi0VMO1vqiaJh0RL9jgSalb/m5+u3MMuob0YwUZFUO15gjOvcqOROkzv9l6OT8KnUoW1Oz3VAGCotVHdo1rQiI5gQJMwatSKUIiwKlHesGIkW23n1xGzaY4j9/o/t0FKZOGYZEjOL/NyzNkBkPvtrfSOMa5UmzmSz+qI7siti3uMI0UjrdKPghHmW9e2MByQfGfulqV8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrXi+i2r04k68szwbzyRDregywNt4iWIJQaVntmtrkw=;
 b=TtkqYP4tINxWgASvAf3anPVI6ihpIDTqJSWHYzRGkANoif9B9MJLMZelMYPxBRJ1joINadUurQJLiWlD7wbvMFvdUYO1BTwtcm3YX2mDyYROlt1CsaF3kZx7HsOqlpxi6BfYy1wMOLf3a9wGKajPGlP4kbJ3lIygmHwmSv5YWIo3mF5fzM+MkTVxpUV1S2a7DOWaVIVqFcBpbC90I6t123Sdh0hqjJn7mWRlh56f2efZa8rHVSGMtjLbGGO252G2VdoJefcrcwk7fOlkBwL0AZLm6jFhzdRG5TQt07KL5Ry6UTolB0b0Zli8J5a990f1uQSRc3M0+MQBMHB4VXz+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrXi+i2r04k68szwbzyRDregywNt4iWIJQaVntmtrkw=;
 b=goH4zx2NlOi490rrRsIFD7f7OnErjRSfleVxoS8Km7cn1dqP4uuR7Rtr6HtjgpH2HCIqYhwR25l3+1dU2ZCphCHsOztADe4AZIVaiL/nlG8dJ4eXBjnSQLLj89cJ+69ntrp6NWH8sCb+Dlq/Un9Uh5TQ3v+PAKFEn7gmskUnYc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8810.jpnprd01.prod.outlook.com
 (2603:1096:604:17f::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:23:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:23:47 +0000
Message-ID: <875xciqffx.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 068/139] ASoC: codecs: rt5631: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:23:47 +0000
X-ClientProxiedBy: TYCP301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8810:EE_
X-MS-Office365-Filtering-Correlation-Id: 796a4d88-5846-4752-0f35-08de0ad9782f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?30uS6F/bx9UEMFIHmvDab6mNXi8SuZfv4Wx+Se2xssO6CF0DQe4BvE06MdAU?=
 =?us-ascii?Q?YJh++Rn/Ch2qs7sMEezLbIeC4M0GhVqg3YYZtj3RFoYD3pH+k2dq/Ta4eO4W?=
 =?us-ascii?Q?Te5qeVboEr/FAw9jci+6/TbH+MMLV23s841je0Ero8SiBz6nvGoSO2z9uU9y?=
 =?us-ascii?Q?tCaOiQuwsAG03v41GWyojg0eGOLLlPAe9I3ZlUBVwgLeHsnrw/NY1Dd4lQAk?=
 =?us-ascii?Q?2RuqwIAcJ+YTnDA2IBy2RtlNNkW0fNVHNVslo3xapx5UlEkRZAyoiwuHVMLt?=
 =?us-ascii?Q?wDo94P+BtxhDb5Q845eVn4gtrQpm/ZvhSGIzXAP1hP3AhUrehcjjyQpalSFG?=
 =?us-ascii?Q?lf8LapEO2SlO0Kod+d87BaDvnYYCxjDRQxvCn+vm/PF/fJWOPvXRtJ0md9bS?=
 =?us-ascii?Q?rez7T9TbwUwXPbfvqgkx4d/Yqp5j1ND3Q2ieYUwaSizzTVsBnzFqAzvjqkNj?=
 =?us-ascii?Q?51oc4DJPZcAbbDPyCGdlbX9bbV/wIb53M5sjEWXQNUPpt+rgiilxQ42CsKUF?=
 =?us-ascii?Q?LdmUYL/bqPI+eZhe2YDzaIunBi2dHaKw0RDyWgUhYDYyBSeJ6BTXozI4apU6?=
 =?us-ascii?Q?cczx9pblrFjM+gRyi7SSgo5j57R4ieDSGMXW9H+B2s7aVWzXyjgxIWxxZsNF?=
 =?us-ascii?Q?WKMzIQLSs7ZCr1zmBsVM0TqG1VzPT5TZ0aqDcbofRutOvjpte4gn9kHGTCwM?=
 =?us-ascii?Q?o5A/qD60STdY6//tWXbsMRFAYSFDNPkVmB+xvq1HQ425q+gSYAkaRXKUY20M?=
 =?us-ascii?Q?s/32uiBYrH27X9fLC13F9P+5zUHF/xUCqUK9kFCyxof7M4C5tJtauuPxfgTA?=
 =?us-ascii?Q?mzzVKeNQicrLEI+dSq5esTkohFFlTp/BLDCbXrhfMfMAoHOTCVRCf4GnK+fG?=
 =?us-ascii?Q?YdfYNB1ZXyn9m76k1M/5aq5Q+lSBmUpgMq4+dU1bP99O/qohbxcXECeMmjZT?=
 =?us-ascii?Q?E5+M/hi8JW8+evK+qgWTs1u11U1EVxr9DwMQxt6u2ukNo+m8K2XG8sAoVcE1?=
 =?us-ascii?Q?zR2WMdd8KpEkR9zbhZY7XpK0CPaYIYQ7ARBeJMcfn/i/thUonEjB81qQpTGA?=
 =?us-ascii?Q?SVeaKM2Bq/9dIyCoHoSJiI4Hj9Te+oI9Co0BsptXy5BeQPfEe/zENvIrfbY6?=
 =?us-ascii?Q?ssA7AHdyGWi/MZg1K8Rp9GrV1vS9+y8Okjh0WlulQxlNCQjJA9NYiLVG0I/l?=
 =?us-ascii?Q?2bb0ksIBInoyjfz50A2j1QSzjK/GCP+EKm9HR+uWk7rthEz1LaH+EsbSuC5u?=
 =?us-ascii?Q?+AdTyV8zSza2qzoUM+BeMljcr+2gtlqBZzDHScGIobqRirYrlqqaNfhoXxFC?=
 =?us-ascii?Q?bEBa+sX68vSHAYngEtjzauH0rPLoi09s2bLhEcMBswfoZaLpjUsRbnPstKdm?=
 =?us-ascii?Q?LlfZgugQqlO08CvAGe4pDJTeY59X/on0vcIsRocuhm23W9lq8dzTJlY8vQ7X?=
 =?us-ascii?Q?xobhm2AEInQaBgGIppKURmJo75Djw1XZGkZynQg/b7Vj0ZTo+bCj2gx2/0DQ?=
 =?us-ascii?Q?FFPJIgYDfnca/oFlMTAMUI1J9K4oRnxuWPVH?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ROeBz3ZJDfwqVHFlGAR3k+XHKQBA0uoCmFuefRJ5gcEr4agvqxdMI73+y6XO?=
 =?us-ascii?Q?Clx8TmQQSmsZdP7krMC+NgUU1nRkKhmQMZ7JKTj1f0s600kuFQIoGztUe3FR?=
 =?us-ascii?Q?C08ZJrw9zm0EBKCV4+/a9n5IYu9mLgJ8n/KKUWp2rl/jA68e20/Rk9f51YuD?=
 =?us-ascii?Q?n/0T/pdzsjWqdcKeeFPt+DIt0sbTLCbmMRKb6Dscqmj1966jrOaYUhu7RL5r?=
 =?us-ascii?Q?axZ5OB2iVfxzxJEWbSDdSn9BIjdJVT/bdEigzkDv7ZXouM39hdiZNDbqDbFn?=
 =?us-ascii?Q?dNJcF0uXzWi37jD/x0Di9YRpE4YLr6ztdt+ZqSrLoAcUpIUOBKij5N9Gs1zO?=
 =?us-ascii?Q?c0ekQNRcrqWIJL0aUoqAAY2h9NcYgOfzwsrGUf/JRRkeXOKcQg7m4IhvMzud?=
 =?us-ascii?Q?k+bzK/vTI5OWT30rxncn3yEj6KGmwzjVMxsmr9cWHWcKlQ5zlSNlTk+I1KS2?=
 =?us-ascii?Q?klFO23Y3VbPMC4gm2O9kOU+dEjU/qdTAhagxnWBZfsJ+DOa93B6l3lJtXtCw?=
 =?us-ascii?Q?0+RpPRGFVH963kenxAOl3UvCTG2gfDn6y+CfjPhFvZ7Gsnr36l5I2i7+AsU2?=
 =?us-ascii?Q?WZBo8noiN1+v7X7ZnzSh9Xhwo0c+nPXHd3JOoLkeLIcpZUMAAjoJayzJLURE?=
 =?us-ascii?Q?7M9th3U/YDjAq1x0VXKqFtJBDOwDg5OXP9RNtXDPuhVkw63gZ8uSMZu1hDDx?=
 =?us-ascii?Q?2cR7Qr8oIgAfUAJp9UMSTTXm1oVVFFyaFq3i4L+BrBE4VHWJ3bl4r1knHKPJ?=
 =?us-ascii?Q?DQnFcXoD7xnwAZbS3EoXGVwec520hjSgCA+tX2DGDR+m6Vq7Kzap/cNQNKcZ?=
 =?us-ascii?Q?B+KKbEeSOT/ay3x6hCcBwWHn/s7ZO0x4OygBHsIG0IV4WD+WDDnvVy3ow+bs?=
 =?us-ascii?Q?/P85WKxSYNHyJWkSwhhzT8eGqwByXShgctIOBh8ANkQtly4VBfa5V+QSSbiw?=
 =?us-ascii?Q?jeruUbRTQJGv5M6DJOVbkGP228sYviCAkwS1CkNqcQ50jHB5KdL0FwTF/Thu?=
 =?us-ascii?Q?vwGDQG1ykMOY/HYprLGA1yNt9Hn7eOrJXq3BjmwExwOcynJKo6CD8P3+1IK1?=
 =?us-ascii?Q?6YFVPqwOkcqzs5nSwaf4XxiYLP9FADg2/7pg7nyKlKuZi399fB48uS6jJktm?=
 =?us-ascii?Q?PErh4wlrHGRkUAMIfKlkoe/5F8zYAy/BV+ueBlxD/rs/GLMZ+ONZMNZZU39v?=
 =?us-ascii?Q?QZymrttyDthX5HAj9/2GZfs8osIOJAFm/49v9jjUZFukRN+QG3P2k/0uiQwA?=
 =?us-ascii?Q?7CN46ZAe5H7bgiq+/CA6k49Bg8v01Dqsw3q5QPy5mZsX7AevFf7sv/d+SXmQ?=
 =?us-ascii?Q?+zPWOmgwDzlfg8cDGz8PxYFCh6YOp4EbG1pvW5eufagkGZvi7efrGefnkKgp?=
 =?us-ascii?Q?j8J+xIe+ztN/smc4Cou9CK5Pzn4k1KPHH/gRS13lvPsGobhEmECfzVyalbPu?=
 =?us-ascii?Q?ikjcgkmopH5RU6aWbrRsCUFLQN5/UlO9iPhctwwXvFTHtZ5WG9l62Zb8wTN4?=
 =?us-ascii?Q?nCe9PtagN2E41QP5Sifbc1WUzvUp4tmiGr7cJZZyDDvd6jlqmH7UX3It5VkZ?=
 =?us-ascii?Q?lVPvfigIp5OR//ANXhRRkTe2R2YATk7sKr6iVGcJpLVytPnMteIOEqu2msx1?=
 =?us-ascii?Q?7aZuAQJ2xs7ytApGnbNY3kg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796a4d88-5846-4752-0f35-08de0ad9782f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:23:47.4839
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y632HJc1IeOe/iJ27e7aoMF4yFdlunhEHFlNn6nC+PpsaHRZ0OgrovJdN4W6hOzK+6y5PNhPb6VYian+cCCXVlkeWHdzn8/VllN9CIeQAKawRkMCcjxIznS/uVxhXleJ
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
 sound/soc/codecs/rt5631.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
index d523477c51021..616db75b634cc 100644
--- a/sound/soc/codecs/rt5631.c
+++ b/sound/soc/codecs/rt5631.c
@@ -183,7 +183,7 @@ static const DECLARE_TLV_DB_RANGE(mic_bst_tlv,
 static int rt5631_dmic_get(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt5631_priv *rt5631 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = rt5631->dmic_used_flag;
@@ -194,7 +194,7 @@ static int rt5631_dmic_get(struct snd_kcontrol *kcontrol,
 static int rt5631_dmic_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct rt5631_priv *rt5631 = snd_soc_component_get_drvdata(component);
 
 	rt5631->dmic_used_flag = ucontrol->value.integer.value[0];
-- 
2.43.0

