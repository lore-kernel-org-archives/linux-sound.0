Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011052.outbound.protection.outlook.com [52.101.125.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F562580CF
	for <linux-sound@vger.kernel.org>; Fri, 26 Jun 2026 06:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782454199; cv=fail; b=nQmbAPBD0Dr18DtFH11s3LV7aasWvp1Lcgw5H6U7+wfrtavjAzF4Hrevx6di4TS63eQWN1cIONjHT72LW+5dLjCzvNoSo3oO1kHC/KmsFOvoSOtI0zokWYuWvgqNOsikutDVyzssjDNmUPjgWvhPMr4mNSQI/CG/955WwYu/BjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782454199; c=relaxed/simple;
	bh=bmUxjsEK+z7+HKDYw+Z9EBxD8lMEJOiI7TP3pYRNC2k=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=rGzB7eOPAH2tpO3AmNQ/8x7MtaOPL/xOMX/Dr+XvBRzn8mZW9gAIdT3NXNVeNMTXfrjEVcmH4EBjavyLprpXzfXuNXqgKBSvYT2uiiotfvr3tBqe/192y9+yjpAEpWjvQdB47ncwYNgiGyYIgCJWPZw+Sl8A7/TOIAwC1mzuJ6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=l160nPi0; arc=fail smtp.client-ip=52.101.125.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="l160nPi0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tL32W4t4zPrUr7isyKB75dRCtGCmUwJbgvk8zqJzp8Ni17rW+yUoy8RnkRhhxwnpipSnO1HkpgDDLaah7zZTgZ1ZjlFSdv5ntB2XWlhJ/ALD3EWL8Q0lWiXpe1xdgqeCticOigWXIsYY58ZMUvUpbNk+/Qv3G6cCYvVyTFbix+en7RP0c+ozg6gQhGL60u08kxKlw23wcqzZ8sg+rbUv6R9wA+gz87HYu+nP1v9axu60whOqDtV/sS/YYAiZa+wJsRIOzQifyOUU5B6JWBpOLg5/nTq/uP/FNGJgS+8ivVY0zpQRCLBQz6zRyigjuOEJKN+07ljFopmTsocgLUR4Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9+1zJoZijJJ7td4eNlLix/JFwDp9BNN8p6igSWJ6hr8=;
 b=XxMP0arFqYsE9JkCnXtJajvCfY/6nIbpjLUIndW01mf9B1YiEV4kCxtrz6BBTB27C5Rnx+bcEKO3JQJiai/uaXtsbQ0D+uvWo6ccC+ToLIHhw9oe/0EIo24jYUV5C0mk2wNbcAPA4M02BlZP7WNYX3bj4/JyWhxiXKkUxEg439IxMPel9MMFN7aUBwVUiP/92lIBFfEXu8nZPQo4IEE9t9KJwMFC+P1aPIKurCahEFl0a1jR6VClQ3Dfz+iQd2caRQxlvDwm7S0tMswKbYasxOwbcijJ9Z/YU1zfYwljZ1yORlpyfFR1Op0Ry+OldzaIOp5nzRDOE5yChQtXyBYEFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9+1zJoZijJJ7td4eNlLix/JFwDp9BNN8p6igSWJ6hr8=;
 b=l160nPi0divoi8le9p52cPWt8LkmINRPWiaobSNpW3QvVB12f8502CR9nN8/EZkY9YkrPguMGO/w7LHImmsTy+b3Aznl+LBNtYID0JuOLi1kCbV52IE8II5qnLcoqHpxeWSneQER74wxvXBfCtmvS/EPW7xYZaoGwQl8fCwkUec=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TY7PR01MB16025.jpnprd01.prod.outlook.com (2603:1096:405:2a9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 06:09:56 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0159.015; Fri, 26 Jun 2026
 06:09:56 +0000
Message-ID: <87cxxdesss.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/5] ASoC: soc-component: add component_name
To: Bard Liao <yung-chuan.liao@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-sound@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
References: <87fr29esth.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 26 Jun 2026 06:09:56 +0000
X-ClientProxiedBy: TY4P301CA0049.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::7) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TY7PR01MB16025:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fbcf962-4c5f-4179-4bdb-08ded3498b99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|52116014|1800799024|376014|23010399003|38350700014|921020|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7RBuaMZsebPw8D8oGyQbEUmfZtiK8FITpLjEIjWMIKBtltcHWEOKX57+bxt/P5XEeQyPOHM7z0acZygFDeWZjzV1XJYROIaypmnmSwbgVLmZQN8D1jfD+HCJvDF9tCgpsUdDylZGEs1g/A9zIkqosCpvGQex9/MxLaQHtlqZBOBjgFG1lwAJIJ0lVUq9OG4wtkOryGCtHVfZzbVtzy2LxKjNxk3KHuFddVhyS6xAg+QV1kLQ2QO+Rm3LE2QRoxkNTk/vkz3eN5Hv41Ozr8hzOXhLQAFjepRorol7tDD3p4AZO6wN1YZMIAaw3vf2fD+uo4zigSsv3VTb+zgkeMyq0yumtshwIYs1pl59hGEL2Afesvl6w6DhBtwThrhDnRrMdEY0mrmEGHKvNfTcHUUHCTB9f5Y6F5oPWbHWKjzgzcUteHytveptj+sfmYbVOn95kYU7/UGXZmdb1pUl3oUIZAp4+yGbNvzht4rU8EWBfOIe+Z31kbVzzM79ntMjTqnwrfCDRNon6lYOmZMVDafoAHQZpy1H733Zj1wQj9JqA3wS5tOl/ExGaRdYAQSq4aBoJ2VK+EQ4HQVsmYYRKxEZzdEYI3ZXRRdFdcODTlvObrdvTT1Np6PR6+0rv3BJaQXixxDuyqehXtu3QHZ6pl1OwckM+q9WhK2d72OUbM4iN3jKg+XoatNlru0/TgE1tfatdLFXi/AL6nsPg7jX5saovQpnPAGY+dxRxUiWbjNJxS+Rc+YwCzgI62/bwQT4Adoy
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(52116014)(1800799024)(376014)(23010399003)(38350700014)(921020)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RzW4Ov+joU7V4UknJUi0ChVi0aLQ31j2K9txyIYFc5P8rX294Nq9G1P1plqu?=
 =?us-ascii?Q?w4T3mvMUQDt4UO/vUAuOE6qIk01fm/Rr1iv1fPfrbTm1qaDG6hJKsXfZqcxC?=
 =?us-ascii?Q?KfPpEodTZM0CFRbXQ0ppKPjFf/MaV4PxvUtaIROq9DHLQ5n81BvOq9lPKzPh?=
 =?us-ascii?Q?ISeYUpiLJ8KVfTHCTmA9cNi9gN9qobpxILsTd6KHPyp0lboXOLxIpPpUfjZe?=
 =?us-ascii?Q?EMAzpEsbZm6yogPxEyEkd0G/jt0nTXFRHHCCXp7+6c9tU0tHwBfWFEow9gyG?=
 =?us-ascii?Q?i1sVg9k3eSmMigqnv5Xt60thGmD6NAj2Jkay5VzYbM+W9/Knpm3SbT7vuzdk?=
 =?us-ascii?Q?8vHRWSlUCzgj38rwl7gW95wqUjECOrPiJ8sfI2TCLOwnxY+maqKoe7IWzRyd?=
 =?us-ascii?Q?RozDUPlO+cztsqKJrtZkyzrX2Ym09SMFpk149HYdmk7PJA13VrAFsBCHWjaW?=
 =?us-ascii?Q?Qy9ZZCy+JVVAFf95HyxhQaAuU/XNowG+ZJkQbBjh5SSYig/yXOpec7sqlRvC?=
 =?us-ascii?Q?ZqsikEtlJJO7myg4SnVYT+/B1vmB/85a+B4mX9lJd9NFX1agKMjWVpybLWPX?=
 =?us-ascii?Q?0OAgDTGZfOIRGE9Ndb17iXy9HJ4jD0wPgd3TwAmN0+JU2uYWS3+KqzfMnCNl?=
 =?us-ascii?Q?jFntDCJO9Se/bBN4HSVTKJj4thd+2SfTbb/4O2wf0fVxImioTaaExFt++sg2?=
 =?us-ascii?Q?CR023V+tEf2nEOP7V2iRN1Z778SWBjvP85+yyPf2OyB9CZePQTTFkLT4hPRT?=
 =?us-ascii?Q?nENs1Y6URW1e/tllbjNbHl7tz817akAQ/sghgmb8ylqfnz+kBFyFB0qUc3G0?=
 =?us-ascii?Q?KeJ0Q68aCei45CpaGn0+cUq77gX5kKnjkQ21nqE3s6qGHaqny2R8ZHYc/2Ai?=
 =?us-ascii?Q?ttmNtThVt8Ugyi8DJnCjXEoQVDaEMLpY1HKOTAeRKNvUZ8hbb2sSnfcrL3+E?=
 =?us-ascii?Q?UhMrsX5S0RMxdr3Dq0pg55ET+N75WnL7XuulXTDkd1DmumHYgNMg7tEmoQJ1?=
 =?us-ascii?Q?IcPIUd/9tZMMcjjFFrWHwdfDgvoCBnXDmEfo8hnetgCCTLMLqC1UNtf38tkI?=
 =?us-ascii?Q?zEZu4bwEqFwglV+U08/HLJHk5eYcYO6hII3rOfakZ5SDmc8MLbaumiVGZ98v?=
 =?us-ascii?Q?tmbGOHj0MuDpFtz3dZuz/WMuJTZmyL9kq+R6V7Opnf7A2MAH58cGxRlvlVb6?=
 =?us-ascii?Q?AOIcxDjAgz/22NivkcL+A0kwhmtqC2mwOSTEe17ZzOpuYennSjUiRN6CcP22?=
 =?us-ascii?Q?n0oJb1j200V89BQfG9oFBO1SC1MJfHMUyJIDYczUuUUMY7EHW9J/MmCWNhjh?=
 =?us-ascii?Q?F+p2RfHZ1WbD0vO7Yod299121Asag64fbGF5iB/+rtAYbY5bPxI7YxQHlbXK?=
 =?us-ascii?Q?vLj3eSLetSnwl2T2OepaqNdVsTg2U+ouFfohC1+beFFKd3ZrIEyh8HjCNRPL?=
 =?us-ascii?Q?7gBJtyB8S4VflmkrgeK49UMLG7TQwsUJHZHKIc+URimDjI3Hd1FcHXCTm4DJ?=
 =?us-ascii?Q?rNNziTQr5upZ0EQr0rpv0gajxlmk1O9IkFzAHRBPasnDh5/f5rqtxiGlG39D?=
 =?us-ascii?Q?lkED8QG0hqFHKMl30PQqDcUjIJvPp/oFVqX5xMXU3HkLbRzy2SSePsNaCb6e?=
 =?us-ascii?Q?2vHsS61DLn4pCbeiHcslWswp5pr8LKsvLukQWrZi/AkdUDfh08pbEgWk5xof?=
 =?us-ascii?Q?8hPrdlJzydQh2fR1t0NjJVAQiIoiTgEXXK+or7n98Xc19tKYsZX6Gv6iIY1E?=
 =?us-ascii?Q?8v6R2nRZgVYU6vNCUhE8V48Co46tMTVa+0CPBtC0MvWoyN2ffBVn?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fbcf962-4c5f-4179-4bdb-08ded3498b99
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 06:09:56.2477
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnK/cCK3faxKKZuls2qjuNEgD1bJ/2A2dWVND9UjolqRJMSFzpkz5eTxFOPb/226t1nkfaTaAbc00Xvtr8jzEr8xvXqvhhCdxZ8P3d1D1TkZkhVdPv8Q4Pl9j01mScEh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB16025

Current component has component->name, but we can't setup it via
component_driver today, so the user need to use
snd_soc_component_initialize() / snd_soc_add_component() directly
instead of using snd_soc_register_component().

We can solve root cause of this irregular to add support it in driver.

Adds component_name in Component driver.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-component.h | 1 +
 sound/soc/soc-core.c          | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index b2a362f3effa4..4ec6c8c52ff92 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -71,6 +71,7 @@ struct snd_soc_component_driver {
 		const char *name;		/* REMOVE ME */
 		const char *driver_name;
 	};
+	const char *component_name;
 
 	/* Default control and setup, added after probe() is run */
 	const struct snd_kcontrol_new *controls;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index e5860a2cc90d3..24ba5b1817293 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2717,6 +2717,7 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 	INIT_LIST_HEAD(&component->card_aux_list);
 	mutex_init(&component->io_mutex);
 
+	component->name = driver->component_name;
 	if (!component->name) {
 		component->name = fmt_single_name(dev, NULL);
 		if (!component->name) {
-- 
2.53.0

