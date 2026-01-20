Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010017.outbound.protection.outlook.com [52.101.228.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7EC7261A
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 00:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768868115; cv=fail; b=tCdw+juUktuoM/KIkYhj5aJQW1kdGzNpATaV1DRc+7LOQ1PHrFOi0foX7Kh15JlK3woNFXuzQ3KhMLgleIwx/WsMqV5rzmjMptDpmdbiwNr8mE5nWrC184BLnH5AaPLOxZ86ldBPWaeH0cPm2UdrPepwwZUJfG8D4O6WlHRS84o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768868115; c=relaxed/simple;
	bh=lKZISXxti+RozwduBZ6HfccpUFVw9U67LOYFp8zO2N4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=l57isAxW3R00dxTMR1zUCH4/0OdRVeuGMqZi7cd46xva8cpt9CCB+5IKkopGLhLnkdzi6cIuD07FR7G1/ZTRf5zUGlt19PMH76QmiphJYti9aVbsFPtEPPl5kF94nveaqMzIy1chk5vIIYlwv6mCEfGoPqvS0e6RYogPpDVGMjg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EDRCfJL/; arc=fail smtp.client-ip=52.101.228.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EDRCfJL/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBB+UD6MLhxbqu4cyi1264OfQraxjhmigb/UI8HD3Gsz98yWltZv8DOlGJsLzWByVeG9B3BmpVskflFV2mgdB8J3Mmz7/iertbfscxbz0xu5mIlRsk7JqrLV4A5qE2asmnTcOTGnLw3CROOiLEyAZ5ltcqw5/U8giP7p3yXHJS6WCoGMT7G11XZzxLz9CTKDJ9kq2GDgqEaRs7rVv+c6XhF+zcRhKMVbkbVcJjFhZxNUOrhpWlCoje4adXlsmJQBeol5sN3oAMaG+MOr9POi1IQhZ/9HEmt6HQ4sA48ZuSbZVAaLZcX5wSc9zacrrIK3M/KyXZ10TvAqSGTFQIUBgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AIxXj8XKrUPORH/I7jW5i8kvqTb5NHq3FWMx1MKFYrs=;
 b=n5SyekXx1Z1SfUYX2uDX6XIdFEY6foZ4VbqU7vs4N6j8UlcPOMNcBFzcAJNrmazOhyKAZyCcOimQNdGxUzAjGd7qMT4RDcEKMw4bvot4b02ptSTL3LlQ2PF8IggaLJ6t8cWLDssBbU6PWIF414WlUgPlIghjFcHV70aQtZH3i/X8Usb5vzEi9eK65J+n586JzkxopulWvHd13JydCN2Yu3tgtvPHL1xhokusUiiF7gAu1vyt5iD2eD/VMy23xeVWUFNr5TFbYkeVU+hMM6CzA7VnP/0hC/mHujjUogo3JNb/UgW/qOBCrPRMGWXgbIDwSOKCn+A6FG6nv8EBh+zowA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AIxXj8XKrUPORH/I7jW5i8kvqTb5NHq3FWMx1MKFYrs=;
 b=EDRCfJL/LHR8zj2UgnRnj2hJD7tVtl4p01gpQ57L++AWh7a25uIon+vfyDeADTwQ5CKQy6VoTOhut2ZdPF7yCfkwwzXfLeG68Ry0UgREnVbNRHUSQ8CpC+kgpq/sH1aAajEEwVY80kBh7yHAJ5psJwk6vw65epm6ealqm0VBdfE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by TY3PR01MB11799.jpnprd01.prod.outlook.com (2603:1096:400:3dd::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 00:15:09 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 00:15:09 +0000
Message-ID: <87ecnlqgvn.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 8/8] ASoC: soc-dapm: tidyup function naming
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
References: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jan 2026 00:15:08 +0000
X-ClientProxiedBy: TYCP301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::13) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|TY3PR01MB11799:EE_
X-MS-Office365-Filtering-Correlation-Id: 29b630e3-1698-4b66-74f6-08de57b8f896
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5NHCRk3c+0aMYKRQ3lE84Cc7Bgm48a5umYye+pgF/8UnlHrwN6dFRyrdJdsd?=
 =?us-ascii?Q?Q+zQmX+632Vz/l8S94fMCTsEnlRL5efXxw/IFSCzFKVoYEXHIHSa/YpDwphW?=
 =?us-ascii?Q?Zv+R3qyxhsvlLmzWN68XfFOxoLNh70QcusxD+EB6Q7j0c8x1rhiZVEb7/OIW?=
 =?us-ascii?Q?WSNxGxQxXDuNS0Lftn7Ml60ssAiRCV/1mP9AOxnNc1JTkIafids8hWp35MzE?=
 =?us-ascii?Q?cCBdQFpXAA4Ij4UeYr3PlG9Rz3nRZ9GGkez2E6amE9qBraihhdwB0F9lZ/Ut?=
 =?us-ascii?Q?ZwBuV4Q20v6/bu2m3kcbdSzaRIgEdlbA8OeVCOHI0gmPgOvu6bc6RbHI/D5L?=
 =?us-ascii?Q?FB8w6ODFhrvuvuEyXetaU/evXm0CRp6Y9akiWBBIzt1+yFdR+9Af7gmR8fEz?=
 =?us-ascii?Q?9qba1d+Ap8lc+uHtApKQPwyiucAt/VjXRsxRA7TS6NuKORRmWhwef1+XZtey?=
 =?us-ascii?Q?81KubjXZofYbBOWGyDWkWR3iiHzw+aT5Oy4wy4+G3c/F3X3Vegm7wfcwP67n?=
 =?us-ascii?Q?3YyyaJSAzSx/1HiMyHk5vZXLXQd3d2sN8TxnfUR6J5xIE1w75pOGzeP2mzS+?=
 =?us-ascii?Q?hXXfjyhmtxAPps+Ihc42ePuuBnufV1RFni006UHiv03j3OHX66FcNekpxcHE?=
 =?us-ascii?Q?X5ExqDC6NPKHZ2GEFuBJYOG0sWDGf0AonPlRJMDW7830dTRwAbUF3NOHG6uG?=
 =?us-ascii?Q?Qk6LEo6xKlvDLhmn1aWQaJ8UjRPvbXw+WgfdtmDm21yMzBqt0eXVdUILAok9?=
 =?us-ascii?Q?tyv8CillU6yCbyxDY8Tnf9NAZ7E5omfIweYY/m6nJ/t70diqS0KyVQbHFxi8?=
 =?us-ascii?Q?INpMbFvXzWsbl8bv7+HqvfRf8fQS4rTCQvX7RbLqDctbIxvTiamx4fKc+/jU?=
 =?us-ascii?Q?fpqyVE5+vDaWbrRdd2zo44vkeIGGR2dCjDUBBt0ZbrvJH2Ao5mGFzLGEuVhU?=
 =?us-ascii?Q?kX43Z97LKsUPUrhbSlzYy9JNxCNklz/7L7Hx+XdNuKjX9ReP0F0BodcArOrC?=
 =?us-ascii?Q?tkkVuYYEO3a59JHh1wUoDaQsrG1EvPBGeybnax4mgSGHfQhPGPH+7QboJDJW?=
 =?us-ascii?Q?kbOu7Of45YHC9F0sMxlS+wfTDc7Hs3Ur/haAvjS569N2o/Ri7cCC26L1Fe75?=
 =?us-ascii?Q?cuZYsRkThKLd0KVLGHfQe/ppFKMz+b1lAfdhjuTKQMjEGX2sbzox6yob8Pa6?=
 =?us-ascii?Q?Kf+rEgwSoX1Yhe7XI5b2s+3GCLUxQewqWM5kngf/eIcTFYeCKOY0se+cag2q?=
 =?us-ascii?Q?I/GdCuyPv4/2c1zYMjM/+HtaImOldMxRLsFvrSucJLTvZOW39JnQECuy+hVq?=
 =?us-ascii?Q?WUC8dVCCGVnApqcQLokOv6EJnGalmDoN/QJvdiqt2DrYERkkIZzf7U/88/HQ?=
 =?us-ascii?Q?vnx/PAkbakIIPN5TEb2o6uK0UqERZuQYsf+5FDX5cdmRALV8/cCQVjyNG+cc?=
 =?us-ascii?Q?Hyzo6G63+OQvvqAQxuRJxtkq35vJJkRssy88IjUiYM0YLsj9wnIC3+edA8pD?=
 =?us-ascii?Q?e/OtGoh0+ASadanKup08Rm+eSfHbpZz4z0HJZ/KXURkYxlIvHK1tyTJNvIp8?=
 =?us-ascii?Q?vYrl1UWLfyxLs3cy8m+vphq9juxYyBk4GcYo/zR8hkUjVpOFR6DkfcBRyRR/?=
 =?us-ascii?Q?eA79zIqE/0vagO2J9qvwc0U=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jT4LmSE3UYtRQqwcmXE3hwt18/iKYIGAtjbCtjGrXFrmgBwsV++goeLJSemW?=
 =?us-ascii?Q?tMqY8aqkd21hEjZAVBIhuWP3gxLzEorbLCQvK1FzEeuuIgk001AW60ai99Pb?=
 =?us-ascii?Q?4leuTS/JvwutJ7mRTf0gD3X671DS24R2LFPMbOzHzH0M3BuR+roaK1/zE1jb?=
 =?us-ascii?Q?d4UmxiQ/OsI/7zEcZeS5cMx1KPWJWv8U7pejydJQYS63+beuif334oAJHQJv?=
 =?us-ascii?Q?TglMryLZWlXHPKj7wIwGM0AhcW9VEemu+vAWJ65Xd9SYaIlLuD4yS82h8ANg?=
 =?us-ascii?Q?Gje9DUERKCKp3VSgPKH03WFz/oNvPKz3L0rRLCRYVdy6eMYh3e4wYel+g77E?=
 =?us-ascii?Q?RtWs3As3LHE2R3lbrC5WinOvWtCnZqB8OnrBR8XsSkDFWGVWy8JfgzPeJesS?=
 =?us-ascii?Q?xgQgkv5BU+nOLfK4KMZUfpmUuQWiNJ0EQmitTNbUnSwYRyafg929IRyML8DL?=
 =?us-ascii?Q?MgfTwErBdYYkT9yxqCK8OSpHpxS0Kt1NfEofAbVUbvjnCFePjNq9dNXay6fa?=
 =?us-ascii?Q?3pad9jhmdXSwWqe3bAdP7BV8zoO66kSbdCcyM9MpC9ZmVZOwQ+RcdoDbniX/?=
 =?us-ascii?Q?nl56Av4I8ZGLyDJKlmVA33HLiuQFAn6r7Jmf7vBKY8jNj+BYnr0q2mIgYj54?=
 =?us-ascii?Q?hpezJE98twgVCsjtLgGfPtyzPPZmJNGQRJKvyvswBnLP9g0x2XgGXLpJYMsl?=
 =?us-ascii?Q?luAoxvbK+1HIS33t+0YBnOWFXnmlmIJgwaBoHJV0A0guYyMc1sHLGzGSbfxm?=
 =?us-ascii?Q?jTlQ825XgsV2qguA80XLurq9vlMHx0Q4pDpdew3h+IqOqYFtlCeqcWc8eCY3?=
 =?us-ascii?Q?MN35/mZnx1Sbao2JFjLcjYRxwXiPnOSjdXXt5+yFtIuae5VZTBa0kzl3fpQa?=
 =?us-ascii?Q?hQS8tevy+ZVDV3NGGuFwdOHUqioxse74IbDBkasHJdB4J74fHxn6+e/dhdrM?=
 =?us-ascii?Q?TN+WL6hmsWrS79Vl6lM7W+4zQkxVqYU1UpxyOMIDVAisXGpgx+LdCiRYR7Iv?=
 =?us-ascii?Q?oGR3XOeqpZJ0ES2xB+9oJ0O69CWsM3BsReE4C4G3vyW048BLT6UxgMKMwcWq?=
 =?us-ascii?Q?9zjgbm9otSBQWSkAcQmntm0mEbm6Uf54O0s+VUnHCpTcfQ/KVzAezXgnNDse?=
 =?us-ascii?Q?KC6eYVp8rtMpF2JwNr9YVqOqbkWaZXSkeDiwpuJzm5imfUMBy1d6JBBQxKKA?=
 =?us-ascii?Q?/dVmLXsfRYOxOyBbyxgHoC5IhBk0C0InD5De0SbxJ0X8WUbL3ScqNr3QNRGD?=
 =?us-ascii?Q?pVedfqUf8Rzzfys600hLXUG0ijPo1zcoTQKTDSyczR3rp5YkfYM2n2KOXDz9?=
 =?us-ascii?Q?OU8rv+wQ2Lzgysw5E5DqIJTbTIqQMf9Tk1Eyecb9BSqx0fnPP6yuTaqaW22q?=
 =?us-ascii?Q?xyws40VHczCAKBw8d1GGFDsSJZXycr9gbCFl3d3+mAE6Y6DX4+IFmUdvI6CZ?=
 =?us-ascii?Q?vR2XKBsNTgU4BYJBp9wlEyJBGCg1lnDQbPS3FXLjDlNn4BQz0LX1R9A5HNqZ?=
 =?us-ascii?Q?Z1rAXPrLps9keg7VPrpeebxHkg9RrOE6ADHa7Uyu8ukC321PDx9OsTma0PTg?=
 =?us-ascii?Q?BAjqpA9bWpsxZWay86o71CM6UknFo6ovUdVpo08DDs8UexAUxLDnzO2H5wjp?=
 =?us-ascii?Q?RNqueg4sGG2W5uiF4mUYLmcFOWHe6LPKMnZb4zlYJE96Ju9J1WMCYTvO7z7e?=
 =?us-ascii?Q?ssL8n3mqY/iJ+7alvWrbFa7xteU36tJes1wpM0BC9zkWUEADUJOior2IRU4Y?=
 =?us-ascii?Q?krrXhhIFCbT3xwjSPoP35gjDb3ViCJf3TxcdL2nryVg+F7I9h50n?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29b630e3-1698-4b66-74f6-08de57b8f896
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 00:15:09.5622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 90zjDu0LtyBB0Gj169CX3NSr4hdbziTK0csLZRbc++m8nwPfgI4NPY+CCB+4bJgwGPacYossNhiJFZkSiDtOJiJNLAT5AodN1p3iIBSFLkIqqrfdGBwDwhjrd5UULh6/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11799

Current soc-dapm is using random naming. Unified as dapm_xxx() for
static functions.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 318 +++++++++++++++++++++----------------------
 1 file changed, 157 insertions(+), 161 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 07370215ea7cc..c23ccf4a602d1 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -63,10 +63,10 @@ struct snd_soc_dapm_context {
 
 #define DAPM_UPDATE_STAT(widget, val) widget->dapm->card->dapm_stats.val++;
 
-#define SND_SOC_DAPM_DIR_REVERSE(x) ((x == SND_SOC_DAPM_DIR_IN) ? \
+#define DAPM_DIR_REVERSE(x) ((x == SND_SOC_DAPM_DIR_IN) ? \
 	SND_SOC_DAPM_DIR_OUT : SND_SOC_DAPM_DIR_IN)
 
-#define snd_soc_dapm_for_each_direction(dir) \
+#define dapm_for_each_direction(dir) \
 	for ((dir) = SND_SOC_DAPM_DIR_IN; (dir) <= SND_SOC_DAPM_DIR_OUT; \
 		(dir)++)
 
@@ -159,14 +159,14 @@ static void dapm_assert_locked(struct snd_soc_dapm_context *dapm)
 		snd_soc_dapm_mutex_assert_held(dapm);
 }
 
-static void pop_wait(u32 pop_time)
+static void dapm_pop_wait(u32 pop_time)
 {
 	if (pop_time)
 		schedule_timeout_uninterruptible(msecs_to_jiffies(pop_time));
 }
 
 __printf(3, 4)
-static void pop_dbg(struct device *dev, u32 pop_time, const char *fmt, ...)
+static void dapm_pop_dbg(struct device *dev, u32 pop_time, const char *fmt, ...)
 {
 	va_list args;
 	char *buf;
@@ -240,7 +240,7 @@ static void dapm_mark_dirty(struct snd_soc_dapm_widget *w, const char *reason)
 static __always_inline void dapm_widget_invalidate_paths(
 	struct snd_soc_dapm_widget *w, enum snd_soc_dapm_direction dir)
 {
-	enum snd_soc_dapm_direction rdir = SND_SOC_DAPM_DIR_REVERSE(dir);
+	enum snd_soc_dapm_direction rdir = DAPM_DIR_REVERSE(dir);
 	struct snd_soc_dapm_widget *node;
 	struct snd_soc_dapm_path *p;
 	LIST_HEAD(list);
@@ -387,7 +387,7 @@ struct dapm_kcontrol_data {
 	struct snd_soc_dapm_widget_list *wlist;
 };
 
-static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg)
+static unsigned int dapm_read(struct snd_soc_dapm_context *dapm, int reg)
 {
 	if (!dapm->component)
 		return -EIO;
@@ -407,7 +407,7 @@ static void dapm_set_mixer_path_status(struct snd_soc_dapm_path *p, int i,
 		unsigned int shift = mc->shift;
 		unsigned int max = mc->max;
 		unsigned int mask = (1 << fls(max)) - 1;
-		unsigned int val = soc_dapm_read(p->sink->dapm, reg);
+		unsigned int val = dapm_read(p->sink->dapm, reg);
 
 		/*
 		 * The nth_path argument allows this function to know
@@ -423,7 +423,7 @@ static void dapm_set_mixer_path_status(struct snd_soc_dapm_path *p, int i,
 		 */
 		if (snd_soc_volsw_is_stereo(mc) && nth_path > 0) {
 			if (reg != mc->rreg)
-				val = soc_dapm_read(p->sink->dapm, mc->rreg);
+				val = dapm_read(p->sink->dapm, mc->rreg);
 			val = (val >> mc->rshift) & mask;
 		} else {
 			val = (val >> shift) & mask;
@@ -455,7 +455,7 @@ static int dapm_connect_mux(struct snd_soc_dapm_context *dapm,
 	if (e->reg != SND_SOC_NOPM) {
 		unsigned int val;
 
-		val = soc_dapm_read(dapm, e->reg);
+		val = dapm_read(dapm, e->reg);
 		val = (val >> e->shift_l) & e->mask;
 		item = snd_soc_enum_val_to_item(e, val);
 	} else {
@@ -543,7 +543,7 @@ static void dapm_update_widget_flags(struct snd_soc_dapm_widget *w)
 		break;
 	case snd_soc_dapm_line:
 		ep = 0;
-		snd_soc_dapm_for_each_direction(dir) {
+		dapm_for_each_direction(dir) {
 			if (!list_empty(&w->edges[dir]))
 				ep |= SND_SOC_DAPM_DIR_TO_EP(dir);
 		}
@@ -555,7 +555,7 @@ static void dapm_update_widget_flags(struct snd_soc_dapm_widget *w)
 	w->is_ep = ep;
 }
 
-static int snd_soc_dapm_check_dynamic_path(
+static int dapm_check_dynamic_path(
 	struct snd_soc_dapm_context *dapm,
 	struct snd_soc_dapm_widget *source, struct snd_soc_dapm_widget *sink,
 	const char *control)
@@ -601,7 +601,7 @@ static int snd_soc_dapm_check_dynamic_path(
 	return 0;
 }
 
-static int snd_soc_dapm_add_path(
+static int dapm_add_path(
 	struct snd_soc_dapm_context *dapm,
 	struct snd_soc_dapm_widget *wsource, struct snd_soc_dapm_widget *wsink,
 	const char *control,
@@ -634,7 +634,7 @@ static int snd_soc_dapm_add_path(
 		return -EINVAL;
 	}
 
-	ret = snd_soc_dapm_check_dynamic_path(dapm, wsource, wsink, control);
+	ret = dapm_check_dynamic_path(dapm, wsource, wsink, control);
 	if (ret)
 		return ret;
 
@@ -686,10 +686,10 @@ static int snd_soc_dapm_add_path(
 
 	list_add(&path->list, &dapm->card->paths);
 
-	snd_soc_dapm_for_each_direction(dir)
+	dapm_for_each_direction(dir)
 		list_add(&path->list_node[dir], &path->node[dir]->edges[dir]);
 
-	snd_soc_dapm_for_each_direction(dir) {
+	dapm_for_each_direction(dir) {
 		dapm_update_widget_flags(path->node[dir]);
 		dapm_mark_dirty(path->node[dir], "Route added");
 	}
@@ -797,10 +797,10 @@ static int dapm_kcontrol_data_alloc(struct snd_soc_dapm_widget *widget,
 				goto err_data;
 			}
 
-			snd_soc_dapm_add_path(widget->dapm, data->widget,
-					      widget, NULL, NULL);
+			dapm_add_path(widget->dapm, data->widget,
+				      widget, NULL, NULL);
 		} else if (e->reg != SND_SOC_NOPM) {
-			data->value = soc_dapm_read(widget->dapm, e->reg) &
+			data->value = dapm_read(widget->dapm, e->reg) &
 				      (e->mask << e->shift_l);
 		}
 		break;
@@ -980,14 +980,14 @@ static void dapm_reset(struct snd_soc_card *card)
 	}
 }
 
-static const char *soc_dapm_prefix(struct snd_soc_dapm_context *dapm)
+static const char *dapm_prefix(struct snd_soc_dapm_context *dapm)
 {
 	if (!dapm->component)
 		return NULL;
 	return dapm->component->name_prefix;
 }
 
-static int soc_dapm_update_bits(struct snd_soc_dapm_context *dapm,
+static int dapm_update_bits(struct snd_soc_dapm_context *dapm,
 	int reg, unsigned int mask, unsigned int value)
 {
 	if (!dapm->component)
@@ -996,7 +996,7 @@ static int soc_dapm_update_bits(struct snd_soc_dapm_context *dapm,
 					     mask, value);
 }
 
-static int soc_dapm_test_bits(struct snd_soc_dapm_context *dapm,
+static int dapm_test_bits(struct snd_soc_dapm_context *dapm,
 	int reg, unsigned int mask, unsigned int value)
 {
 	if (!dapm->component)
@@ -1004,7 +1004,7 @@ static int soc_dapm_test_bits(struct snd_soc_dapm_context *dapm,
 	return snd_soc_component_test_bits(dapm->component, reg, mask, value);
 }
 
-static void soc_dapm_async_complete(struct snd_soc_dapm_context *dapm)
+static void dapm_async_complete(struct snd_soc_dapm_context *dapm)
 {
 	if (dapm->component)
 		snd_soc_component_async_complete(dapm->component);
@@ -1175,7 +1175,7 @@ static int dapm_create_or_share_kcontrol(struct snd_soc_dapm_widget *w,
 	const char *name;
 	int ret = 0;
 
-	prefix = soc_dapm_prefix(dapm);
+	prefix = dapm_prefix(dapm);
 	if (prefix)
 		prefix_len = strlen(prefix) + 1;
 	else
@@ -1295,10 +1295,10 @@ static int dapm_new_mixer(struct snd_soc_dapm_widget *w)
 
 			data = snd_kcontrol_chip(w->kcontrols[i]);
 			if (data->widget)
-				snd_soc_dapm_add_path(data->widget->dapm,
-						      data->widget,
-						      path->source,
-						      NULL, NULL);
+				dapm_add_path(data->widget->dapm,
+					      data->widget,
+					      path->source,
+					      NULL, NULL);
 		}
 	}
 
@@ -1402,7 +1402,7 @@ static int dapm_new_dai_link(struct snd_soc_dapm_widget *w)
  * the ALSA card - when we are suspending the ALSA state for the card
  * is set to D3.
  */
-static int snd_soc_dapm_suspend_check(struct snd_soc_dapm_widget *widget)
+static int dapm_suspend_check(struct snd_soc_dapm_widget *widget)
 {
 	struct device *dev = snd_soc_dapm_to_dev(widget->dapm);
 	int level = snd_power_get_state(widget->dapm->card->snd_card);
@@ -1454,10 +1454,10 @@ static int dapm_widget_list_create(struct snd_soc_dapm_widget_list **list,
  * widget and all widgets that can be reached via incoming or outcoming paths
  * from the widget.
  */
-static void invalidate_paths_ep(struct snd_soc_dapm_widget *widget,
+static void dapm_invalidate_paths_ep(struct snd_soc_dapm_widget *widget,
 	enum snd_soc_dapm_direction dir)
 {
-	enum snd_soc_dapm_direction rdir = SND_SOC_DAPM_DIR_REVERSE(dir);
+	enum snd_soc_dapm_direction rdir = DAPM_DIR_REVERSE(dir);
 	struct snd_soc_dapm_path *path;
 
 	widget->endpoints[dir] = -1;
@@ -1471,7 +1471,7 @@ static void invalidate_paths_ep(struct snd_soc_dapm_widget *widget,
 
 		if (path->connect) {
 			path->walking = 1;
-			invalidate_paths_ep(path->node[dir], dir);
+			dapm_invalidate_paths_ep(path->node[dir], dir);
 			path->walking = 0;
 		}
 	}
@@ -1484,7 +1484,7 @@ static void invalidate_paths_ep(struct snd_soc_dapm_widget *widget,
  * generic function and at the same time the fast path of the specialized
  * functions is significantly smaller than the generic function.
  */
-static __always_inline int is_connected_ep(struct snd_soc_dapm_widget *widget,
+static __always_inline int dapm_is_connected_ep(struct snd_soc_dapm_widget *widget,
 	struct list_head *list, enum snd_soc_dapm_direction dir,
 	int (*fn)(struct snd_soc_dapm_widget *, struct list_head *,
 		  bool (*custom_stop_condition)(struct snd_soc_dapm_widget *,
@@ -1492,7 +1492,7 @@ static __always_inline int is_connected_ep(struct snd_soc_dapm_widget *widget,
 	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *,
 				      enum snd_soc_dapm_direction))
 {
-	enum snd_soc_dapm_direction rdir = SND_SOC_DAPM_DIR_REVERSE(dir);
+	enum snd_soc_dapm_direction rdir = DAPM_DIR_REVERSE(dir);
 	struct snd_soc_dapm_path *path;
 	int con = 0;
 
@@ -1511,7 +1511,7 @@ static __always_inline int is_connected_ep(struct snd_soc_dapm_widget *widget,
 	}
 
 	if ((widget->is_ep & SND_SOC_DAPM_DIR_TO_EP(dir)) && widget->connected) {
-		widget->endpoints[dir] = snd_soc_dapm_suspend_check(widget);
+		widget->endpoints[dir] = dapm_suspend_check(widget);
 		return widget->endpoints[dir];
 	}
 
@@ -1547,13 +1547,13 @@ static __always_inline int is_connected_ep(struct snd_soc_dapm_widget *widget,
  * direction as an arguments, it should return true if widgets from that point
  * in the graph onwards should not be added to the widget list.
  */
-static int is_connected_output_ep(struct snd_soc_dapm_widget *widget,
+static int dapm_is_connected_output_ep(struct snd_soc_dapm_widget *widget,
 	struct list_head *list,
 	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *i,
 				      enum snd_soc_dapm_direction))
 {
-	return is_connected_ep(widget, list, SND_SOC_DAPM_DIR_OUT,
-			is_connected_output_ep, custom_stop_condition);
+	return dapm_is_connected_ep(widget, list, SND_SOC_DAPM_DIR_OUT,
+			dapm_is_connected_output_ep, custom_stop_condition);
 }
 
 /*
@@ -1565,13 +1565,13 @@ static int is_connected_output_ep(struct snd_soc_dapm_widget *widget,
  * direction as an arguments, it should return true if the walk should be
  * stopped and false otherwise.
  */
-static int is_connected_input_ep(struct snd_soc_dapm_widget *widget,
+static int dapm_is_connected_input_ep(struct snd_soc_dapm_widget *widget,
 	struct list_head *list,
 	bool (*custom_stop_condition)(struct snd_soc_dapm_widget *i,
 				      enum snd_soc_dapm_direction))
 {
-	return is_connected_ep(widget, list, SND_SOC_DAPM_DIR_IN,
-			is_connected_input_ep, custom_stop_condition);
+	return dapm_is_connected_ep(widget, list, SND_SOC_DAPM_DIR_IN,
+			dapm_is_connected_input_ep, custom_stop_condition);
 }
 
 /**
@@ -1607,12 +1607,12 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 	snd_soc_dapm_mutex_lock(card);
 
 	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
-		invalidate_paths_ep(w, SND_SOC_DAPM_DIR_OUT);
-		paths = is_connected_output_ep(w, &widgets,
+		dapm_invalidate_paths_ep(w, SND_SOC_DAPM_DIR_OUT);
+		paths = dapm_is_connected_output_ep(w, &widgets,
 				custom_stop_condition);
 	} else {
-		invalidate_paths_ep(w, SND_SOC_DAPM_DIR_IN);
-		paths = is_connected_input_ep(w, &widgets,
+		dapm_invalidate_paths_ep(w, SND_SOC_DAPM_DIR_IN);
+		paths = dapm_is_connected_input_ep(w, &widgets,
 				custom_stop_condition);
 	}
 
@@ -1645,7 +1645,7 @@ int snd_soc_dapm_regulator_event(struct snd_soc_dapm_widget *w,
 	struct device *dev = snd_soc_dapm_to_dev(w->dapm);
 	int ret;
 
-	soc_dapm_async_complete(w->dapm);
+	dapm_async_complete(w->dapm);
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		if (w->on_val & SND_SOC_DAPM_REGULATOR_BYPASS) {
@@ -1705,7 +1705,7 @@ int snd_soc_dapm_clock_event(struct snd_soc_dapm_widget *w,
 	if (!w->clk)
 		return -EIO;
 
-	soc_dapm_async_complete(w->dapm);
+	dapm_async_complete(w->dapm);
 
 	if (SND_SOC_DAPM_EVENT_ON(event)) {
 		return clk_prepare_enable(w->clk);
@@ -1740,8 +1740,8 @@ static int dapm_generic_check_power(struct snd_soc_dapm_widget *w)
 
 	DAPM_UPDATE_STAT(w, power_checks);
 
-	in = is_connected_input_ep(w, NULL, NULL);
-	out = is_connected_output_ep(w, NULL, NULL);
+	in  = dapm_is_connected_input_ep(w, NULL, NULL);
+	out = dapm_is_connected_output_ep(w, NULL, NULL);
 	return out != 0 && in != 0;
 }
 
@@ -1864,9 +1864,9 @@ static void dapm_seq_check_event(struct snd_soc_card *card,
 	if (w->event && (w->event_flags & event)) {
 		int ret;
 
-		pop_dbg(dev, card->pop_time, "pop test : %s %s\n",
+		dapm_pop_dbg(dev, card->pop_time, "pop test : %s %s\n",
 			w->name, ev_name);
-		soc_dapm_async_complete(w->dapm);
+		dapm_async_complete(w->dapm);
 		trace_snd_soc_dapm_widget_event_start(w, event);
 		ret = w->event(w, NULL, event);
 		trace_snd_soc_dapm_widget_event_done(w, event);
@@ -1901,7 +1901,7 @@ static void dapm_seq_run_coalesced(struct snd_soc_card *card,
 		else
 			value |= w->off_val << w->shift;
 
-		pop_dbg(dev, card->pop_time,
+		dapm_pop_dbg(dev, card->pop_time,
 			"pop test : Queue %s: reg=0x%x, 0x%x/0x%x\n",
 			w->name, reg, value, mask);
 
@@ -1915,11 +1915,11 @@ static void dapm_seq_run_coalesced(struct snd_soc_card *card,
 		 * same register.
 		 */
 
-		pop_dbg(dev, card->pop_time,
+		dapm_pop_dbg(dev, card->pop_time,
 			"pop test : Applying 0x%x/0x%x to %x in %dms\n",
 			value, mask, reg, card->pop_time);
-		pop_wait(card->pop_time);
-		soc_dapm_update_bits(dapm, reg, mask, value);
+		dapm_pop_wait(card->pop_time);
+		dapm_update_bits(dapm, reg, mask, value);
 	}
 
 	list_for_each_entry(w, pending, power_list) {
@@ -1973,7 +1973,7 @@ static void dapm_seq_run(struct snd_soc_card *card,
 			}
 
 			if (cur_dapm && w->dapm != cur_dapm)
-				soc_dapm_async_complete(cur_dapm);
+				dapm_async_complete(cur_dapm);
 
 			INIT_LIST_HEAD(&pending);
 			cur_sort = -1;
@@ -2034,7 +2034,7 @@ static void dapm_seq_run(struct snd_soc_card *card,
 	}
 
 	for_each_card_dapms(card, d)
-		soc_dapm_async_complete(d);
+		dapm_async_complete(d);
 }
 
 static void dapm_widget_update(struct snd_soc_card *card, struct snd_soc_dapm_update *update)
@@ -2062,14 +2062,14 @@ static void dapm_widget_update(struct snd_soc_card *card, struct snd_soc_dapm_up
 	if (!w)
 		return;
 
-	ret = soc_dapm_update_bits(w->dapm, update->reg, update->mask,
+	ret = dapm_update_bits(w->dapm, update->reg, update->mask,
 		update->val);
 	if (ret < 0)
 		dev_err(dev, "ASoC: %s DAPM update failed: %d\n",
 			w->name, ret);
 
 	if (update->has_second_set) {
-		ret = soc_dapm_update_bits(w->dapm, update->reg2,
+		ret = dapm_update_bits(w->dapm, update->reg2,
 					   update->mask2, update->val2);
 		if (ret < 0)
 			dev_err(dev,
@@ -2384,9 +2384,9 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event,
 			return ret;
 	}
 
-	pop_dbg(card->dev, card->pop_time,
+	dapm_pop_dbg(card->dev, card->pop_time,
 		"DAPM sequencing finished, waiting %dms\n", card->pop_time);
-	pop_wait(card->pop_time);
+	dapm_pop_wait(card->pop_time);
 
 	trace_snd_soc_dapm_done(card, event);
 
@@ -2395,7 +2395,7 @@ static int dapm_power_widgets(struct snd_soc_card *card, int event,
 
 #ifdef CONFIG_DEBUG_FS
 
-static const char * const snd_soc_dapm_type_name[] = {
+static const char * const dapm_type_name[] = {
 	[snd_soc_dapm_input]            = "input",
 	[snd_soc_dapm_output]           = "output",
 	[snd_soc_dapm_mux]              = "mux",
@@ -2448,7 +2448,7 @@ static ssize_t dapm_widget_power_read_file(struct file *file,
 	struct snd_soc_dapm_path *p = NULL;
 	const char *c_name;
 
-	BUILD_BUG_ON(ARRAY_SIZE(snd_soc_dapm_type_name) != SND_SOC_DAPM_TYPE_COUNT);
+	BUILD_BUG_ON(ARRAY_SIZE(dapm_type_name) != SND_SOC_DAPM_TYPE_COUNT);
 
 	buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
 	if (!buf)
@@ -2456,13 +2456,13 @@ static ssize_t dapm_widget_power_read_file(struct file *file,
 
 	snd_soc_dapm_mutex_lock_root(w->dapm);
 
-	/* Supply widgets are not handled by is_connected_{input,output}_ep() */
+	/* Supply widgets are not handled by dapm_is_connected_{input,output}_ep() */
 	if (w->is_supply) {
 		in = 0;
 		out = 0;
 	} else {
-		in = is_connected_input_ep(w, NULL, NULL);
-		out = is_connected_output_ep(w, NULL, NULL);
+		in  = dapm_is_connected_input_ep(w, NULL, NULL);
+		out = dapm_is_connected_output_ep(w, NULL, NULL);
 	}
 
 	ret = scnprintf(buf, PAGE_SIZE, "%s: %s%s  in %d out %d",
@@ -2482,10 +2482,10 @@ static ssize_t dapm_widget_power_read_file(struct file *file,
 				w->active ? "active" : "inactive");
 
 	ret += scnprintf(buf + ret, PAGE_SIZE - ret, " widget-type %s\n",
-			 snd_soc_dapm_type_name[w->id]);
+			 dapm_type_name[w->id]);
 
-	snd_soc_dapm_for_each_direction(dir) {
-		rdir = SND_SOC_DAPM_DIR_REVERSE(dir);
+	dapm_for_each_direction(dir) {
+		rdir = DAPM_DIR_REVERSE(dir);
 		snd_soc_dapm_widget_for_each_path(w, dir, p) {
 			if (p->connected && !p->connected(p->source, p->sink))
 				continue;
@@ -2612,13 +2612,13 @@ static inline void dapm_debugfs_cleanup(struct snd_soc_dapm_context *dapm)
 #endif
 
 /*
- * soc_dapm_connect_path() - Connects or disconnects a path
+ * dapm_connect_path() - Connects or disconnects a path
  * @path: The path to update
  * @connect: The new connect state of the path. True if the path is connected,
  *  false if it is disconnected.
  * @reason: The reason why the path changed (for debugging only)
  */
-static void soc_dapm_connect_path(struct snd_soc_dapm_path *path,
+static void dapm_connect_path(struct snd_soc_dapm_path *path,
 	bool connect, const char *reason)
 {
 	if (path->connect == connect)
@@ -2631,10 +2631,10 @@ static void soc_dapm_connect_path(struct snd_soc_dapm_path *path,
 }
 
 /* test and update the power status of a mux widget */
-static int soc_dapm_mux_update_power(struct snd_soc_card *card,
-				     struct snd_kcontrol *kcontrol,
-				     struct snd_soc_dapm_update *update,
-				     int mux, struct soc_enum *e)
+static int dapm_mux_update_power(struct snd_soc_card *card,
+				 struct snd_kcontrol *kcontrol,
+				 struct snd_soc_dapm_update *update,
+				 int mux, struct soc_enum *e)
 {
 	struct snd_soc_dapm_path *path;
 	int found = 0;
@@ -2651,7 +2651,7 @@ static int soc_dapm_mux_update_power(struct snd_soc_card *card,
 		else
 			connect = false;
 
-		soc_dapm_connect_path(path, connect, "mux update");
+		dapm_connect_path(path, connect, "mux update");
 	}
 
 	if (found)
@@ -2668,7 +2668,7 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 	int ret;
 
 	snd_soc_dapm_mutex_lock(card);
-	ret = soc_dapm_mux_update_power(card, kcontrol, update, mux, e);
+	ret = dapm_mux_update_power(card, kcontrol, update, mux, e);
 	snd_soc_dapm_mutex_unlock(card);
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
@@ -2677,10 +2677,10 @@ int snd_soc_dapm_mux_update_power(struct snd_soc_dapm_context *dapm,
 EXPORT_SYMBOL_GPL(snd_soc_dapm_mux_update_power);
 
 /* test and update the power status of a mixer or switch widget */
-static int soc_dapm_mixer_update_power(struct snd_soc_card *card,
-				       struct snd_kcontrol *kcontrol,
-				       struct snd_soc_dapm_update *update,
-				       int connect, int rconnect)
+static int dapm_mixer_update_power(struct snd_soc_card *card,
+				   struct snd_kcontrol *kcontrol,
+				   struct snd_soc_dapm_update *update,
+				   int connect, int rconnect)
 {
 	struct snd_soc_dapm_path *path;
 	int found = 0;
@@ -2712,9 +2712,9 @@ static int soc_dapm_mixer_update_power(struct snd_soc_card *card,
 		 * channel.
 		 */
 		if (found && rconnect >= 0)
-			soc_dapm_connect_path(path, rconnect, "mixer update");
+			dapm_connect_path(path, rconnect, "mixer update");
 		else
-			soc_dapm_connect_path(path, connect, "mixer update");
+			dapm_connect_path(path, connect, "mixer update");
 		found = 1;
 	}
 
@@ -2732,7 +2732,7 @@ int snd_soc_dapm_mixer_update_power(struct snd_soc_dapm_context *dapm,
 	int ret;
 
 	snd_soc_dapm_mutex_lock(card);
-	ret = soc_dapm_mixer_update_power(card, kcontrol, update, connect, -1);
+	ret = dapm_mixer_update_power(card, kcontrol, update, connect, -1);
 	snd_soc_dapm_mutex_unlock(card);
 	if (ret > 0)
 		snd_soc_dpcm_runtime_update(card);
@@ -2862,7 +2862,7 @@ void snd_soc_dapm_free_widget(struct snd_soc_dapm_widget *w)
 	 * While removing the path, remove reference to it from both
 	 * source and sink widgets so that path is removed only once.
 	 */
-	snd_soc_dapm_for_each_direction(dir) {
+	dapm_for_each_direction(dir) {
 		snd_soc_dapm_widget_for_each_path_safe(w, dir, p, next_p)
 			dapm_free_path(p);
 	}
@@ -2899,7 +2899,7 @@ static struct snd_soc_dapm_widget *dapm_find_widget(
 	struct snd_soc_dapm_widget *fallback = NULL;
 	char prefixed_pin[80];
 	const char *pin_name;
-	const char *prefix = soc_dapm_prefix(dapm);
+	const char *prefix = dapm_prefix(dapm);
 
 	if (prefix) {
 		snprintf(prefixed_pin, sizeof(prefixed_pin), "%s %s",
@@ -2929,8 +2929,8 @@ static struct snd_soc_dapm_widget *dapm_find_widget(
  * returns 1 when the value has been updated, 0 when unchanged, or a negative
  * error code; called from kcontrol put callback
  */
-static int __snd_soc_dapm_set_pin(struct snd_soc_dapm_context *dapm,
-				  const char *pin, int status)
+static int __dapm_set_pin(struct snd_soc_dapm_context *dapm,
+			  const char *pin, int status)
 {
 	struct snd_soc_dapm_widget *w = dapm_find_widget(dapm, pin, true);
 	struct device *dev = snd_soc_dapm_to_dev(dapm);
@@ -2958,13 +2958,13 @@ static int __snd_soc_dapm_set_pin(struct snd_soc_dapm_context *dapm,
 }
 
 /*
- * similar as __snd_soc_dapm_set_pin(), but returns 0 when successful;
+ * similar as __dapm_set_pin(), but returns 0 when successful;
  * called from several API functions below
  */
-static int snd_soc_dapm_set_pin(struct snd_soc_dapm_context *dapm,
+static int dapm_set_pin(struct snd_soc_dapm_context *dapm,
 				const char *pin, int status)
 {
-	int ret = __snd_soc_dapm_set_pin(dapm, pin, status);
+	int ret = __dapm_set_pin(dapm, pin, status);
 
 	return ret < 0 ? ret : 0;
 }
@@ -3032,9 +3032,9 @@ static int dapm_update_dai_chan(struct snd_soc_dapm_path *p,
 		p->source->name, p->sink->name);
 
 	if (w->channel < channels)
-		soc_dapm_connect_path(p, true, "dai update");
+		dapm_connect_path(p, true, "dai update");
 	else
-		soc_dapm_connect_path(p, false, "dai update");
+		dapm_connect_path(p, false, "dai update");
 
 	return 0;
 }
@@ -3112,7 +3112,7 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 	unsigned int source_ref = 0;
 	int ret;
 
-	prefix = soc_dapm_prefix(dapm);
+	prefix = dapm_prefix(dapm);
 	if (prefix) {
 		snprintf(prefixed_sink, sizeof(prefixed_sink), "%s %s",
 			 prefix, route->sink);
@@ -3181,7 +3181,7 @@ static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 	dapm->wcache_sink	= wsink;
 	dapm->wcache_source	= wsource;
 
-	ret = snd_soc_dapm_add_path(dapm, wsource, wsink, route->control,
+	ret = dapm_add_path(dapm, wsource, wsink, route->control,
 		route->connected);
 err:
 	if (ret)
@@ -3211,7 +3211,7 @@ static int snd_soc_dapm_del_route(struct snd_soc_dapm_context *dapm,
 		return -EINVAL;
 	}
 
-	prefix = soc_dapm_prefix(dapm);
+	prefix = dapm_prefix(dapm);
 	if (prefix) {
 		snprintf(prefixed_sink, sizeof(prefixed_sink), "%s %s",
 			 prefix, route->sink);
@@ -3365,7 +3365,7 @@ int snd_soc_dapm_new_widgets(struct snd_soc_card *card)
 
 		/* Read the initial power state from the device */
 		if (w->reg >= 0) {
-			val = soc_dapm_read(w->dapm, w->reg);
+			val = dapm_read(w->dapm, w->reg);
 			val = val >> w->shift;
 			val &= w->mask;
 			if (val == w->on_val)
@@ -3409,11 +3409,11 @@ int snd_soc_dapm_get_volsw(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mutex_lock(dapm);
 	if (dapm_kcontrol_is_powered(kcontrol) && reg != SND_SOC_NOPM) {
-		reg_val = soc_dapm_read(dapm, reg);
+		reg_val = dapm_read(dapm, reg);
 		val = (reg_val >> shift) & mask;
 
 		if (reg != mc->rreg)
-			reg_val = soc_dapm_read(dapm, mc->rreg);
+			reg_val = dapm_read(dapm, mc->rreg);
 
 		if (snd_soc_volsw_is_stereo(mc))
 			rval = (reg_val >> mc->rshift) & mask;
@@ -3497,12 +3497,12 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 		val = val << shift;
 		rval = rval << mc->rshift;
 
-		reg_change = soc_dapm_test_bits(dapm, reg, mask << shift, val);
+		reg_change = dapm_test_bits(dapm, reg, mask << shift, val);
 
 		if (snd_soc_volsw_is_stereo(mc))
-			reg_change |= soc_dapm_test_bits(dapm, mc->rreg,
-							 mask << mc->rshift,
-							 rval);
+			reg_change |= dapm_test_bits(dapm, mc->rreg,
+						     mask << mc->rshift,
+						     rval);
 	}
 
 	if (change || reg_change) {
@@ -3519,7 +3519,7 @@ int snd_soc_dapm_put_volsw(struct snd_kcontrol *kcontrol,
 			update.val = val;
 			pupdate = &update;
 		}
-		ret = soc_dapm_mixer_update_power(card, kcontrol, pupdate, connect, rconnect);
+		ret = dapm_mixer_update_power(card, kcontrol, pupdate, connect, rconnect);
 	}
 
 	snd_soc_dapm_mutex_unlock(card);
@@ -3549,7 +3549,7 @@ int snd_soc_dapm_get_enum_double(struct snd_kcontrol *kcontrol,
 
 	snd_soc_dapm_mutex_lock(dapm);
 	if (e->reg != SND_SOC_NOPM && dapm_kcontrol_is_powered(kcontrol)) {
-		reg_val = soc_dapm_read(dapm, e->reg);
+		reg_val = dapm_read(dapm, e->reg);
 	} else {
 		reg_val = snd_soc_dapm_kcontrol_get_value(kcontrol);
 	}
@@ -3606,7 +3606,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 	change = dapm_kcontrol_set_value(kcontrol, val);
 
 	if (e->reg != SND_SOC_NOPM)
-		reg_change = soc_dapm_test_bits(dapm, e->reg, mask, val);
+		reg_change = dapm_test_bits(dapm, e->reg, mask, val);
 
 	if (change || reg_change) {
 		if (reg_change) {
@@ -3616,7 +3616,7 @@ int snd_soc_dapm_put_enum_double(struct snd_kcontrol *kcontrol,
 			update.val = val;
 			pupdate = &update;
 		}
-		ret = soc_dapm_mux_update_power(card, kcontrol, pupdate, item[0], e);
+		ret = dapm_mux_update_power(card, kcontrol, pupdate, item[0], e);
 	}
 
 	snd_soc_dapm_mutex_unlock(card);
@@ -3699,14 +3699,14 @@ int snd_soc_dapm_get_component_pin_switch(struct snd_kcontrol *kcontrol,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_get_component_pin_switch);
 
-static int __snd_soc_dapm_put_pin_switch(struct snd_soc_dapm_context *dapm,
-					 const char *pin,
-					 struct snd_ctl_elem_value *ucontrol)
+static int __dapm_put_pin_switch(struct snd_soc_dapm_context *dapm,
+				 const char *pin,
+				 struct snd_ctl_elem_value *ucontrol)
 {
 	int ret;
 
 	snd_soc_dapm_mutex_lock(dapm);
-	ret = __snd_soc_dapm_set_pin(dapm, pin, !!ucontrol->value.integer.value[0]);
+	ret = __dapm_set_pin(dapm, pin, !!ucontrol->value.integer.value[0]);
 	snd_soc_dapm_mutex_unlock(dapm);
 
 	snd_soc_dapm_sync(dapm);
@@ -3730,7 +3730,7 @@ int snd_soc_dapm_put_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	const char *pin = (const char *)kcontrol->private_value;
 
-	return __snd_soc_dapm_put_pin_switch(dapm, pin, ucontrol);
+	return __dapm_put_pin_switch(dapm, pin, ucontrol);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_put_pin_switch);
 
@@ -3750,7 +3750,7 @@ int snd_soc_dapm_put_component_pin_switch(struct snd_kcontrol *kcontrol,
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	const char *pin = (const char *)kcontrol->private_value;
 
-	return __snd_soc_dapm_put_pin_switch(dapm, pin, ucontrol);
+	return __dapm_put_pin_switch(dapm, pin, ucontrol);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_put_component_pin_switch);
 
@@ -3763,7 +3763,7 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 	struct snd_soc_dapm_widget *w;
 	int ret = -ENOMEM;
 
-	w = dapm_cnew_widget(widget, soc_dapm_prefix(dapm));
+	w = dapm_cnew_widget(widget, dapm_prefix(dapm));
 	if (!w)
 		goto cnew_failed;
 
@@ -3878,7 +3878,7 @@ snd_soc_dapm_new_control_unlocked(struct snd_soc_dapm_context *dapm,
 	/* see for_each_card_widgets */
 	list_add_tail(&w->list, &dapm->card->widgets);
 
-	snd_soc_dapm_for_each_direction(dir) {
+	dapm_for_each_direction(dir) {
 		INIT_LIST_HEAD(&w->edges[dir]);
 		w->endpoints[dir] = -1;
 	}
@@ -3951,9 +3951,8 @@ int snd_soc_dapm_new_controls(struct snd_soc_dapm_context *dapm,
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_new_controls);
 
-static int
-snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
-			       struct snd_pcm_substream *substream)
+static int dapm_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
+				       struct snd_pcm_substream *substream)
 {
 	struct device *dev = snd_soc_dapm_to_dev(w->dapm);
 	struct snd_soc_dapm_path *path;
@@ -4068,8 +4067,8 @@ snd_soc_dai_link_event_pre_pmu(struct snd_soc_dapm_widget *w,
 	return 0;
 }
 
-static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
-				  struct snd_kcontrol *kcontrol, int event)
+static int dapm_dai_link_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol, int event)
 {
 	struct snd_soc_dapm_path *path;
 	struct snd_soc_dai *source, *sink;
@@ -4082,7 +4081,7 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
-		ret = snd_soc_dai_link_event_pre_pmu(w, substream);
+		ret = dapm_dai_link_event_pre_pmu(w, substream);
 		if (ret < 0)
 			goto out;
 
@@ -4160,8 +4159,8 @@ static int snd_soc_dai_link_event(struct snd_soc_dapm_widget *w,
 	return ret;
 }
 
-static int snd_soc_dapm_dai_link_get(struct snd_kcontrol *kcontrol,
-			  struct snd_ctl_elem_value *ucontrol)
+static int dapm_dai_link_get(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_widget *w = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_pcm_runtime *rtd = w->priv;
@@ -4171,8 +4170,8 @@ static int snd_soc_dapm_dai_link_get(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
-static int snd_soc_dapm_dai_link_put(struct snd_kcontrol *kcontrol,
-			  struct snd_ctl_elem_value *ucontrol)
+static int dapm_dai_link_put(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_dapm_widget *w = snd_kcontrol_chip(kcontrol);
 	struct snd_soc_pcm_runtime *rtd = w->priv;
@@ -4192,11 +4191,10 @@ static int snd_soc_dapm_dai_link_put(struct snd_kcontrol *kcontrol,
 	return 1;
 }
 
-static void
-snd_soc_dapm_free_kcontrol(struct snd_soc_card *card,
-			unsigned long *private_value,
-			int num_c2c_params,
-			const char **w_param_text)
+static void dapm_free_kcontrol(struct snd_soc_card *card,
+			       unsigned long *private_value,
+			       int num_c2c_params,
+			       const char **w_param_text)
 {
 	int count;
 
@@ -4211,7 +4209,7 @@ snd_soc_dapm_free_kcontrol(struct snd_soc_card *card,
 }
 
 static struct snd_kcontrol_new *
-snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
+dapm_alloc_kcontrol(struct snd_soc_card *card,
 			char *link_name,
 			const struct snd_soc_pcm_stream *c2c_params,
 			int num_c2c_params, const char **w_param_text,
@@ -4222,8 +4220,8 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 	};
 	struct snd_kcontrol_new kcontrol_dai_link[] = {
 		SOC_ENUM_EXT(NULL, w_param_enum[0],
-			     snd_soc_dapm_dai_link_get,
-			     snd_soc_dapm_dai_link_put),
+			     dapm_dai_link_get,
+			     dapm_dai_link_put),
 	};
 	struct snd_kcontrol_new *kcontrol_news;
 	const struct snd_soc_pcm_stream *config = c2c_params;
@@ -4274,14 +4272,14 @@ snd_soc_dapm_alloc_kcontrol(struct snd_soc_card *card,
 	return kcontrol_news;
 
 outfree_w_param:
-	snd_soc_dapm_free_kcontrol(card, private_value, num_c2c_params, w_param_text);
+	dapm_free_kcontrol(card, private_value, num_c2c_params, w_param_text);
+
 	return NULL;
 }
 
-static struct snd_soc_dapm_widget *
-snd_soc_dapm_new_dai(struct snd_soc_card *card,
-		     struct snd_pcm_substream *substream,
-		     char *id)
+static struct snd_soc_dapm_widget *dapm_new_dai(struct snd_soc_card *card,
+						struct snd_pcm_substream *substream,
+						char *id)
 {
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
@@ -4311,10 +4309,10 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 			goto param_fail;
 
 		num_kcontrols = 1;
-		kcontrol_news = snd_soc_dapm_alloc_kcontrol(card, link_name,
-							    rtd->dai_link->c2c_params,
-							    rtd->dai_link->num_c2c_params,
-							    w_param_text, &private_value);
+		kcontrol_news = dapm_alloc_kcontrol(card, link_name,
+						    rtd->dai_link->c2c_params,
+						    rtd->dai_link->num_c2c_params,
+						    w_param_text, &private_value);
 		if (!kcontrol_news)
 			goto param_fail;
 	}
@@ -4323,7 +4321,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 	template.reg		= SND_SOC_NOPM;
 	template.id		= snd_soc_dapm_dai_link;
 	template.name		= link_name;
-	template.event		= snd_soc_dai_link_event;
+	template.event		= dapm_dai_link_event;
 	template.event_flags	= SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMU |
 				  SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMD;
 	template.kcontrol_news	= kcontrol_news;
@@ -4343,7 +4341,7 @@ snd_soc_dapm_new_dai(struct snd_soc_card *card,
 
 outfree_kcontrol_news:
 	devm_kfree(card->dev, (void *)template.kcontrol_news);
-	snd_soc_dapm_free_kcontrol(card, &private_value,
+	dapm_free_kcontrol(card, &private_value,
 				   rtd->dai_link->num_c2c_params, w_param_text);
 param_fail:
 	devm_kfree(card->dev, link_name);
@@ -4457,7 +4455,7 @@ int snd_soc_dapm_link_dai_widgets(struct snd_soc_card *card)
 				sink = dai_w;
 			}
 			dev_dbg(dai->dev, "%s -> %s\n", src->name, sink->name);
-			snd_soc_dapm_add_path(w->dapm, src, sink, NULL, NULL);
+			dapm_add_path(w->dapm, src, sink, NULL, NULL);
 		}
 	}
 
@@ -4478,11 +4476,11 @@ static void dapm_connect_dai_routes(struct snd_soc_dapm_context *dapm,
 		sink_dai->component->name, sink->name);
 
 	if (dai) {
-		snd_soc_dapm_add_path(dapm, src, dai, NULL, NULL);
+		dapm_add_path(dapm, src, dai, NULL, NULL);
 		src = dai;
 	}
 
-	snd_soc_dapm_add_path(dapm, src, sink, NULL, NULL);
+	dapm_add_path(dapm, src, sink, NULL, NULL);
 }
 
 static void dapm_connect_dai_pair(struct snd_soc_card *card,
@@ -4516,8 +4514,8 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 		/* special handling for [Codec2Codec] */
 		if (dai_link->c2c_params && !rtd->c2c_widget[stream]) {
 			struct snd_pcm_substream *substream = rtd->pcm->streams[stream].substream;
-			struct snd_soc_dapm_widget *dai = snd_soc_dapm_new_dai(card, substream,
-									       widget_name[stream]);
+			struct snd_soc_dapm_widget *dai = dapm_new_dai(card, substream,
+								       widget_name[stream]);
 
 			if (IS_ERR(dai))
 				continue;
@@ -4531,8 +4529,7 @@ static void dapm_connect_dai_pair(struct snd_soc_card *card,
 	}
 }
 
-static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
-	int event)
+static void dapm_dai_stream_event(struct snd_soc_dai *dai, int stream, int event)
 {
 	struct snd_soc_dapm_widget *w;
 
@@ -4600,14 +4597,13 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 	}
 }
 
-static void soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
-	int event)
+static void dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream, int event)
 {
 	struct snd_soc_dai *dai;
 	int i;
 
 	for_each_rtd_dais(rtd, i, dai)
-		soc_dapm_dai_stream_event(dai, stream, event);
+		dapm_dai_stream_event(dai, stream, event);
 
 	dapm_power_widgets(rtd->card, event, NULL);
 }
@@ -4629,7 +4625,7 @@ void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
 	struct snd_soc_card *card = rtd->card;
 
 	snd_soc_dapm_mutex_lock(card);
-	soc_dapm_stream_event(rtd, stream, event);
+	dapm_stream_event(rtd, stream, event);
 	snd_soc_dapm_mutex_unlock(card);
 }
 
@@ -4672,7 +4668,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_stream_stop);
 int snd_soc_dapm_enable_pin_unlocked(struct snd_soc_dapm_context *dapm,
 				   const char *pin)
 {
-	return snd_soc_dapm_set_pin(dapm, pin, 1);
+	return dapm_set_pin(dapm, pin, 1);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_enable_pin_unlocked);
 
@@ -4693,7 +4689,7 @@ int snd_soc_dapm_enable_pin(struct snd_soc_dapm_context *dapm, const char *pin)
 
 	snd_soc_dapm_mutex_lock(dapm);
 
-	ret = snd_soc_dapm_set_pin(dapm, pin, 1);
+	ret = dapm_set_pin(dapm, pin, 1);
 
 	snd_soc_dapm_mutex_unlock(dapm);
 
@@ -4789,7 +4785,7 @@ EXPORT_SYMBOL_GPL(snd_soc_dapm_force_enable_pin);
 int snd_soc_dapm_disable_pin_unlocked(struct snd_soc_dapm_context *dapm,
 				    const char *pin)
 {
-	return snd_soc_dapm_set_pin(dapm, pin, 0);
+	return dapm_set_pin(dapm, pin, 0);
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_disable_pin_unlocked);
 
@@ -4810,7 +4806,7 @@ int snd_soc_dapm_disable_pin(struct snd_soc_dapm_context *dapm,
 
 	snd_soc_dapm_mutex_lock(dapm);
 
-	ret = snd_soc_dapm_set_pin(dapm, pin, 0);
+	ret = dapm_set_pin(dapm, pin, 0);
 
 	snd_soc_dapm_mutex_unlock(dapm);
 
@@ -4896,7 +4892,7 @@ void snd_soc_dapm_init(struct snd_soc_dapm_context *dapm,
 	list_add(&dapm->list, &card->dapm_list);
 }
 
-static void soc_dapm_shutdown_dapm(struct snd_soc_dapm_context *dapm)
+static void dapm_shutdown(struct snd_soc_dapm_context *dapm)
 {
 	struct snd_soc_card *card = dapm->card;
 	struct snd_soc_dapm_widget *w;
@@ -4941,13 +4937,13 @@ void snd_soc_dapm_shutdown(struct snd_soc_card *card)
 
 	for_each_card_dapms(card, dapm) {
 		if (dapm != card_dapm) {
-			soc_dapm_shutdown_dapm(dapm);
+			dapm_shutdown(dapm);
 			if (dapm->bias_level == SND_SOC_BIAS_STANDBY)
 				snd_soc_dapm_set_bias_level(dapm, SND_SOC_BIAS_OFF);
 		}
 	}
 
-	soc_dapm_shutdown_dapm(card_dapm);
+	dapm_shutdown(card_dapm);
 	if (card_dapm->bias_level == SND_SOC_BIAS_STANDBY)
 		snd_soc_dapm_set_bias_level(card_dapm, SND_SOC_BIAS_OFF);
 }
-- 
2.43.0

