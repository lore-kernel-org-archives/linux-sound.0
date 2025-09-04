Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011007.outbound.protection.outlook.com [52.101.125.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BA9C8CE
	for <linux-sound@vger.kernel.org>; Thu,  4 Sep 2025 05:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756963275; cv=fail; b=Y7R7ZgpLxfr7KtQBgCwGOGmcZ9t8eLXtUE9GJ/nslfM31fCVJcEZ6JfO2fju4O7IpqviirGeszFHtmixyN2+385yI7JX5GItOW/oRUQj8MRycHLrhMkhmxQlHdwdZemKTtf3h5Z5g5MAlhSAWsNkp5m7jTgteBJdLg8h4jnN1xE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756963275; c=relaxed/simple;
	bh=bzpk0SpQC+g6nFvk29BhD9cV60avBz23XWd3BTQO0Nw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=oT1jgG0kc9ptbgClwcYhNUxed0z6KwmfIaFSYYsd/uEJRKOTcNwt3jqNAqkjt2SQ/TSRamFqSyV9jX+CxBAgGsVV5GGHIa0py8ZE+dNIvW7oKjeZcwOjQ/mLGTgpbQk/z0zQvX42NALRD6mhbLOtUR3p3Gb069grQcVfZZSjKB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kZBsajEM; arc=fail smtp.client-ip=52.101.125.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kZBsajEM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llK7Yl5ruZrj9tf/s1N07sGGU/soubLuPzRo5Uzy4zswzBIudAvrByQ/ZOKvN243dxgQd7TD9BlM2ArS7mEpsOo9xjjc/lEHvsNZhgwlOxGpCGuy4nM0+8GAQGrEPdJdDAUbIHL8S8dWja7O7DX81Ml10i7c3kNT/0XHQ15MKvbrooFGUcmf6X8cFE7jWTm0LM2l8v2GzBWC1MufZkQ1m/MpGQVL0FpmtXCKPH4kTa5OmISM8BeNnl8ZzYstzxEPDJ6uIn3er8llr+QhQyD0xjAN0P+rtcBFj3dnFs7nrx+A7Jk5LaSD/ba41HLGSdT5aP9ldoFWAWs+7mIMSAKWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3/6f9ovwCC2bikolkGVR9Wlt6LIuIfS8Re1ukV6OH8=;
 b=K9/QtavEwi+zjUwH8B10RbV3a46TheE6Z29KJQyy3672sVR7p6fDsXWYVjgbXu7GsHzh3Y9hJMEo2KjIbIz0rpUTqYl3NBXUx39FBmm89HpbSMdeVaNRgAQwM961VBH1KXuWY1zfOmVdjGbmXKPK4Da813Ikjo7uRQ0SAqAxXoTPl+m0gHBs2LhBsJ97lvbyRzbYg5gqwrYzKPXIpElHmXnglHmNJvYahHoi4U3BPccR6+PhF8M4rMhO9FDw3v38Wn0L8PHae3xfsZ/1Yj38S0sWkAKT+w3xa5G8rIYqBbPFhyNzGKvnTbYhNi61H+PAIOl35dkIp8lv7aWSj2ja/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r3/6f9ovwCC2bikolkGVR9Wlt6LIuIfS8Re1ukV6OH8=;
 b=kZBsajEM3MCuQ4czkV1RBlqH/Dmhlqv8pRylMa3LwaygwXhGJ1f/grYKGSLhTf22cXFj+JknBDIU36ImX4WlN2tAmqdE3yZBijeFToacxb3j+/xEa6zMVuJGBj1xr3fQkU1BfKVHsJPumEb8AeN0/3P0Pc7SZsiUXw9ZA5r2hrc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY1PR01MB10672.jpnprd01.prod.outlook.com
 (2603:1096:400:320::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 05:21:10 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 05:21:09 +0000
Message-ID: <87cy86x06z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 01/10] ASoC: soc-dapm: add snd_soc_dapm_to_dev()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
References: <87ecsmx07m.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 4 Sep 2025 05:21:08 +0000
X-ClientProxiedBy: TYCP286CA0294.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY1PR01MB10672:EE_
X-MS-Office365-Filtering-Correlation-Id: ee711f07-b4ad-4592-7f8d-08ddeb72db05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?d07d/6cBMBwGpOF7eYeNIw+IMrS3jpDwt2jC+G18rraPPvLX3mf6B1m+zr+n?=
 =?us-ascii?Q?BF2iIFhyaP1HM1/2q6pmr5lrmMFozuA9FTl1PG0LUGoeFInUAIu2KuFpAK3z?=
 =?us-ascii?Q?NPAWmEPoNwvulAee17gB7VcSDvXLJBNZlnbzLRyH3bax0+6OuapgNXMuxXz4?=
 =?us-ascii?Q?FoihHd/a1/jB3NS+wlL7Fw5sT3XLrNMPG36iaWg4FltUpsViumoBYtucbJ60?=
 =?us-ascii?Q?CChIPnqbSFc8MbLeCNCB5RgHFMH+oxWSuWpN3jnlfQLpo8lxBJ3syrFOPfaV?=
 =?us-ascii?Q?Ioh+l/D87c5m8tBzJ/mzvHtYDebQFUZWwsuX02PBMiEkV9hMpq8cmwkS6pcI?=
 =?us-ascii?Q?qfruE4raMhns+mj+IVJb1PLpBovMC8/qlM7yWuDp0kYA8N35WKzLVvZhSydy?=
 =?us-ascii?Q?xGwzPrNskHUZcleDcNSRNihRPwHUTZ4dPKv5rtZjPVHa+GDPezjH0UnRen2E?=
 =?us-ascii?Q?Bx+mP/ePr2VHqVzfU/7VVdfnnJAzaRZ60GjXriDnN70rMxrxKbaQ+hiqlQjR?=
 =?us-ascii?Q?wRxk4r+Wu183sszyZrIMGyky8wCh58/JG9jyM5BVTEXW2h58OpOjZKMjuz6f?=
 =?us-ascii?Q?DJ0UWHLkO8Pr15LJB6IgivsrwqyUBAwIjkBOiTi5nO54RIaS+CLz/hEkAdsP?=
 =?us-ascii?Q?KhZkd3gEmk8ngMOL03CMmLXrr3CnSQL/65hWrTpfxuwTTkB750Jpczuep/k6?=
 =?us-ascii?Q?AsJaBaPD+oGpOl82KwhZr75QdGv2oCQsbpyVDFvvupx7od4CSFghj7KaIU2b?=
 =?us-ascii?Q?mQgN+nIVYR1XeazyaJZASiYlGlKkKd2CCI+b9EVF3Mg6/2h3kGLbtjYvBI1n?=
 =?us-ascii?Q?+dTPf41ZDOl7GpDeGkI8PZkSer4Ll1VEFAfDexvj+jJC+38KKiZFsDK6nQfE?=
 =?us-ascii?Q?YxDVmtFKVnILC/mMIKpmm5FwJznIcufUgabMbEV4n5DFugGsBgXxQ42m0581?=
 =?us-ascii?Q?LJY+VEOIEYjS3UPbfaUo8d66QD9ZlHq8RIAwcw2Lfy49w51gYUAaJwSCCevB?=
 =?us-ascii?Q?RPNrvFIKTAuHCEnDJhEONgk6Z1I66fKwc30tDDvsJ030/tmzHlK49DcY+AHn?=
 =?us-ascii?Q?AehC7UFFmeSgDBpf0aL3G0sGTWFZNWrQnXkwp4782iQMP37KIMH8eQUYzRd0?=
 =?us-ascii?Q?QrAZ+YBtcK5g9xou6o6XrvjBh5AX9IhIVzbkMnGw1PW3nfgxPV736szmxuM8?=
 =?us-ascii?Q?R99wjZKu+H+d75YTDOfj3NJ8tUnlVgMAR791325TZNk6nnpKGqWKOkWRfdu2?=
 =?us-ascii?Q?9S/GzZxUMYadhEFPFzS2Z2vLqN2Fdd6IHLNEZuWttGYESoEt5rGS3SZsJ3vV?=
 =?us-ascii?Q?KDiZyzaHctGwI7iaQxq8ruygRrW74WRDKnPhde6YUwdREUZbLoMlQ/aSMDnU?=
 =?us-ascii?Q?QH2kKdIZbtWkmC8T1jXolfy247vDSIStOagjBdpecsd0N/PdxxSqNVP+nnV2?=
 =?us-ascii?Q?BBGw0PLPG5/onftu4KIM/4tixi7tXaZxH/IJzalXZ5tHPbU0XzwH6A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LjFF9Gy/t2CGftx3wCfFhv0SoxRTwcMw0CrY9hx1v4hw5Tf+jMcdVRKQ1FaJ?=
 =?us-ascii?Q?wZyJWmyEHenPScpcU2MfS3fXjGLiy2ENOS1kKxMTV5839vgDhmZ8dP7RSSpA?=
 =?us-ascii?Q?3CTe0cdthxz1XglasD3KRLcCpYGB29zlWo0WLC1jPnhBQpKz/bfXNHBXwvV/?=
 =?us-ascii?Q?JYsby0GtZl8/dkqX1fd50CWIsqowC1lN/yvOISyoJTtgiJEf+q8W6yHx7wdQ?=
 =?us-ascii?Q?Gs1TEgjGJsmrbmITgt+Ud3+zYCgSzR+Ju0stWCFA71Mz0+7fv9mX1O2Kh5yU?=
 =?us-ascii?Q?QFVXaH+V5f6O0t3J1mod/zlXup8qMJXJKpNQmYfdQbrMJDez7BOpw7sjpQtj?=
 =?us-ascii?Q?bSQUlBO1UCoj3yEQHajjxG17T6Z/FmTvoNTXjZOZXXbM/g3ckjTmNeEkoM0Y?=
 =?us-ascii?Q?GiEbUkFcVPn83v8GAKlBa8LqiTh9Grd3PaLyp42tZCvsQL1faemEt9fY5UcV?=
 =?us-ascii?Q?graD+z7WRNexjK2VCICqekt3FtgRXVGXeKMhhnOTspNG0LvFawR7cZxUro2h?=
 =?us-ascii?Q?G8jk/HKLjrWysmD5GcieHOs55+yyRvc+p45AlMBykJx+mvZbCdPwMh8BFhpp?=
 =?us-ascii?Q?Jk0A2/d1OmDh76kj4k6KikGsZLq+VXxNc4fN7CTrlqX7T/t7ow6pnieQix6G?=
 =?us-ascii?Q?L5o68bIDqmsaZwRTCfWKFavF+KfVsf3JsWMPtybnZP8DZzDinNbckI8cQYKU?=
 =?us-ascii?Q?E8GCbSUZnEO2l4PpJ4dT+RTRPEBaicdQcQcCw/yILBg/FeK/ZQXBUWN9q7xp?=
 =?us-ascii?Q?eLwOwFzWDJ2iJhfAtyiP7OE3Eu4P+iTaQcHp2yTZvqqUCgozkKedMEjGFoa2?=
 =?us-ascii?Q?grkS6YgAEdDtm7uZEboITMTIaV+wwV+RLvyfLb1lcFU9GiE/kqQDQ+VcC+/M?=
 =?us-ascii?Q?jxXzCo9AZzl7voUPZUPbuM3zANunIWdTh5MnCvFX289MSsGZEkSW8aH4MPkA?=
 =?us-ascii?Q?66Z/Nj1SvfZJN5GB+BCSdAN8mMqEvjfNUQK4lEnbCXbHrRQrJvd9Vji+VxVE?=
 =?us-ascii?Q?jf5gm5avOOVM2yOYYxqyTewm7JfcPQ5JL9fZSWTgPl3dPuTCMpLN3nZSSvd0?=
 =?us-ascii?Q?eXLmTe9MflJRVpRHdArAeNecEKpud444tlroK/x6/5Svv0nlcbkkkUQIwBZY?=
 =?us-ascii?Q?8gYuOSjyDizxL97CMzX2Hanze7Lu/1GA7ShRK0QV6qDuToFctHyAEXXxMMO2?=
 =?us-ascii?Q?CP1VAosurNZ+7p0nWyu6OKX+dAWx2EQH8QU06CmhhZPtISwpN4n7pRT5EP5k?=
 =?us-ascii?Q?yCEdV2DB7J/SywGUL7syypfr9T5YZHoMWEXfTca0w4wSldpY2tIDWXBYY2ZZ?=
 =?us-ascii?Q?Z22IHoxoDODFKkA92w8J9XzQ5iiqcH+v5MsGY2sW7refMmigc1eaBO8ReGro?=
 =?us-ascii?Q?1rMXSmEVM1yaxAdsEWZuPANxD6UG1adIptEfFiUqDkhLuPVu4wm/kM9ieJkF?=
 =?us-ascii?Q?4nLdI2WjEQnkeF1R0MJ2CGVG25rtbzE5BmHoH3kcHRTGANevPtvwBXszQJ5J?=
 =?us-ascii?Q?ZQMRUipNdK9sKFGP3AxVJFPf1C8l7eQlI/3c5WQbu0AOhVVxSyjI15KceBY1?=
 =?us-ascii?Q?sWKlcbASevJzb+mHUrTZ3yUt3hyw9szEERWPkHbk/WsZfr0jCu+FDirCKnf2?=
 =?us-ascii?Q?UkpF6BelwnP5LmDBE7Ddngs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee711f07-b4ad-4592-7f8d-08ddeb72db05
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 05:21:09.1183
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V6fjzEOaSQ++UiYlvoFy4gL3rlGUMTm88Ptxk/iqlgdzbymuwX2yGUA4pp/lvC/iq3uJ/yRQOHl95NtRH+QiCc84Ak/lv+Wusp5KbgQ1UyvZ83cUIpFr8yQ8JoRdNe8F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10672

Because struct snd_soc_dapm_context is soc-dapm framework specific, user
driver don't need to access its member directly, we would like to hide
them. struct snd_soc_dapm_context will be removed from header in the
future.

Some drivers need to get dev from dapm (which will be removed).
We need such function. Add it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dapm.h | 3 ++-
 sound/soc/soc-dapm.c     | 9 +++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc-dapm.h b/include/sound/soc-dapm.h
index ed39458b94bf9..ccd36a198a134 100644
--- a/include/sound/soc-dapm.h
+++ b/include/sound/soc-dapm.h
@@ -587,7 +587,7 @@ struct snd_soc_dapm_context {
 	unsigned int idle_bias_off:1;		/* Use BIAS_OFF instead of STANDBY */
 	unsigned int suspend_bias_off:1;	/* Use BIAS_OFF in suspend if the DAPM is idle */
 
-	struct device *dev;			/* from parent - for debug */
+	struct device *dev;			/* from parent - for debug */ /* REMOVE ME */
 	struct snd_soc_component *component;	/* parent component */
 	struct snd_soc_card *card;		/* parent card */
 
@@ -660,6 +660,7 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card);
 int snd_soc_dapm_update_dai(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params, struct snd_soc_dai *dai);
 int snd_soc_dapm_widget_name_cmp(struct snd_soc_dapm_widget *widget, const char *s);
+struct device *snd_soc_dapm_to_dev(struct snd_soc_dapm_context *dapm);
 
 /* dapm path setup */
 int snd_soc_dapm_new_widgets(struct snd_soc_card *card);
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d74c096cc2084..83cdf97edb9da 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -165,6 +165,15 @@ static void pop_dbg(struct device *dev, u32 pop_time, const char *fmt, ...)
 	kfree(buf);
 }
 
+struct device *snd_soc_dapm_to_dev(struct snd_soc_dapm_context *dapm)
+{
+	if (dapm->component)
+		return dapm->component->dev;
+
+	return dapm->card->dev;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dapm_to_dev);
+
 static bool dapm_dirty_widget(struct snd_soc_dapm_widget *w)
 {
 	return !list_empty(&w->dirty);
-- 
2.43.0

