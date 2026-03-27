Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE77542A82
	for <linux-sound@vger.kernel.org>; Fri, 27 Mar 2026 02:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774579440; cv=fail; b=OHnqa7Z519bO8hy/4XLORizIRz4U6z4Nw+0IfxuJI5vvXOpBeW4oFxkWCSsWoYn1doKb0CE0gLCWJQZbXVt0moQxO8aY7eKrGmpaZkJXsV5TJ0slb+yWZLQBQkOWvdGDCnW715xi/MTYKKLsOm5QTM9zqWPdXokeuepbmr5+3AM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774579440; c=relaxed/simple;
	bh=M90Crl4i4Hsxb7RcCttHdzGy8XoPhtItyFMj4smVNQc=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=XJ6f3YMZ83VngfJnu3QGuOZHGVXP/4XQvJUgeuQzGsDGUC32Alv1fyerEiGJWB0kg/sugN4F1wN2tRRFuiR0apwKpqL1H88SzSOhdNWKcgxNuhNpAeT+FqbNu8N+k76dibbocbA9P1WEcIdtPya+rLwtrrio5DFMa0pHgYT2V8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=SsopZOnw; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="SsopZOnw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3ot/54zdgP4hl9aK7FttWdHfktdWo0yJZdgD0NqZyvRQA/eRHRgozSu9ady9H4/AibaoKyzDHkL1SL3LTtlz5PbLVgXZzUkorjwBDxe+2mCOFEUtd33ZMwjwHIwX2OlNmWvxdqGNUjHGIocuC8giNOOAHGOks/Ns2uTQG1ofuj+1EQwWOf9gT7aNCWRUPwrm5TIB/3C477GU/uD0yq+pDbsoqQIqCtT0IbhQLAd+sXCrZRR/YXIOYlzqiPLBuy14ZiIJebijULCpTAt+nRJETC9p/HpFJ1vAWbldgPDiI0k7cHQ/3ky4SpDjIsgCApEaY1ESkqgdosmdiOXmxqEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CHweuJgT0nFr9E4BdIm+u6+M37vmYWn1jDWNMqsbdH4=;
 b=yIrITtluL4xae3kUbJ9Cwn25HLKrCAheVWXD4+uXXhWLOLZnr4mHea3cGNFvgVYHLgk+zEXzEHPu3mFA2kr0HL/XSQqcBu/+2bkwsZ57KKWosdkQDWrTh2ZjmNktW9Jqw4D1WPNGUfLL0Poml/Nhkn8vDA3c5MAWxT5I3Cs4xDNGPFo4wqnCp7WsEVX89lyfzsMzSJYsSHsywLQSGTwjisOZ8OJxCjDPoGXKBn/5olH3lgfshMFXv/q0Ull17s28fQoMig506CvX/G+LyOjjRZ+fxE9qg8MgSyX8NAEyWYXDu8E6jaWxJFfLS+5wy41BIDHGD5+V64gra3CQiqeYng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CHweuJgT0nFr9E4BdIm+u6+M37vmYWn1jDWNMqsbdH4=;
 b=SsopZOnwwLxp2uoi5ywia+WoVoNK3VBbly5wtmbO/qBye4Z/8q2YTYxFvM1DtlarrALRYOq/lyGDYzEsoxPCxAqh+5VRys3LN9PqoQdUEpW/hWvYjYahEJzE07lxclGdKnjUzpocYOeppzQ0/rtuvE3obVaaexi8aoTY/8OLjPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB10243.jpnprd01.prod.outlook.com (2603:1096:400:1d5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 02:43:54 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9745.023; Fri, 27 Mar 2026
 02:43:54 +0000
Message-ID: <87341mxa8l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: soc-core: call missing INIT_LIST_HEAD() for card_aux_list
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 27 Mar 2026 02:43:54 +0000
X-ClientProxiedBy: TYCP286CA0095.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b4::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB10243:EE_
X-MS-Office365-Filtering-Correlation-Id: aa7c69a8-c882-4652-481b-08de8baab00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	i6DD5yTvCQeSl1hxNOSJ+tN6q1ClqXrAyyssE8EzSkIppbEH/wZ79j12abfmOUCmVTnuwKgLMZO3Cb4XNkVw4Dve97TW/ZIOba14WT9bME5OyfYNljeZJ0ZFkBJj6dzp1oQMepNmMfRL4132YoQ96yyRdB7wdxaHR9qM5WEI7HxSRbG7a019RHOew68mjC3e31Xh/qGeAByFVdcrLAHF5G/tFq8ro65WJjM/hqeS/+eb30qzCZy+Ygm43BBuKCcE7u+X/Q3KV7Hss4PpTCxIt9HhG8Ux7N2OiKHcqB11Kowa0NJt12YilHWmGcChFPEE5acqC1KNisQAi+p8T79uhASuVof2svzVH52iuluC6wHCNVdnoYs+kYECMTLl9YyY9ikGVL7Tj029tRdrPEdQ9JotNj40Iem60qTNX3zvOGk0qB+hB7Ai3uT8pRlRUzLJaBebGtrwEwQrD0G6v8JA3iMK4lAFJkgjhXJAptjmpthoHe/37zAaQAmfPGMlHoDMsQ7xw9t/y9JhzgfWU2Ie2XY1E6d/XiqF5MVz4Cm+vnC6DtLtjGxMFbEKRMBb2/fNaZXktHN8hf0ubQxUBJNQo+UqJs66LuadgS28UE49ifYOJcYB418oO9IZmICEquFAxs5fv8RscJbpi7pORce5/oY9tVLWrvPWs5H0X5klFgk2kGpKhn2SuVlCaIJiVL74ZjG1cc7iXiWEcxgur2uVoYEuGCywwXkVWVWo81Q6+cXJ64SIRdLv6/fRCE3txQX0VWWtQB9FOlMyXMMmgSN1SZFI0sacDEjUXyAEHLs237A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HmL9s9LFWlKIEHNoWJgnRoQyt6irctqHxkb7w32/xF1ZlsOEcMBSUxxZQPJr?=
 =?us-ascii?Q?Yr4JVPmgEcBQ7hGXEJ+MhMj+EmTHVwYPhXOOEU9sMBuB2bbeiHvrdQerhAK5?=
 =?us-ascii?Q?qqORMYIUcEB7aSEJPkB03oCJdCn4nmcN+sUb16B33ISU7IaP8af6hr2Xlhpg?=
 =?us-ascii?Q?QT3thiUhRXrBVLq2p86n+A74gTOUNl6qiogL5kiDxGydAdrh9+fB8Ujo3c08?=
 =?us-ascii?Q?B0nFBGBFCwaRLodgKkT9wBUkdPGEhpq1HcLTzx8XFYnclC+5/eUuvi/q1lOS?=
 =?us-ascii?Q?buqujbzWD2QN+RPeiSXb/lNveEeshwrY09cW6WsGs5moDgvhabiR04mda3oH?=
 =?us-ascii?Q?4VziPHorStw1oYolMPRvSsr8ArXNMH625+u8pbPMbqAxAj3AJIzPvDK7kuju?=
 =?us-ascii?Q?cyPLTlpnINRAYyaaZs5MynciKHLweeFot7JgpvY5q5oc2ZhBYP6fCC8E1Dsc?=
 =?us-ascii?Q?dPQk41RIL6devr7LijXW0nIrq0uMs7cWkq+O6AOC2jFexBfhNKpmqAoxMv53?=
 =?us-ascii?Q?I8lOfP/SgZC+i2nAlUfgqre5yfHgqAaxeMntTL68QRygYvHOCv+uvrtcNkFS?=
 =?us-ascii?Q?lYCThE+kGkUwRjHTl5TL8LM05k6lKfjUMVQLhaOsfE7Mhcg27Psq8GvPSGII?=
 =?us-ascii?Q?UZigZ11fgI5+/sWmoMqyxGtAp/1az3Wl2S4FFwCUZRy8UmsDmyX+MmX9F7f6?=
 =?us-ascii?Q?MPKwLGeZ4BYRA6HB3gl1ubsFFAaV1i1DSTk/Yri9Nq6Tin7fOcDin+ox3pQT?=
 =?us-ascii?Q?bU2IaR1lEtUM5Pd0NDvK6rlUSt0AEiLYILx+JlDESTh6f+UAPb/BMsm4MFN2?=
 =?us-ascii?Q?sSloQUwMgiC6dkkEuVJu0sFYlzW1CHW5WwafXjMVJu6Vc0QsgYM28MDdSuH8?=
 =?us-ascii?Q?Ko6jFqU3o/NCQvT2sUqBn6g6cpGEhfxUhzN5zhrIC2m+QdZtfKkKR5s8TDWA?=
 =?us-ascii?Q?MsfD0Asd9Dx1OQixvUM5l0l9N9XfoMqzOj+02+xWDK41qoTyfKp8jPRnIEWF?=
 =?us-ascii?Q?QBKpLEr+vcMj3juwYNviRKmgNXORGmZk4AxJByjT2M6o7FBYnlJdYSHl5uy8?=
 =?us-ascii?Q?jmBamNSGjpkIcxdvdFeGUYsC5X7dkpj/OLPQNHDlnrxwxPSc2ILxnhra1Gkd?=
 =?us-ascii?Q?m8iOt/inHkQKavN/Mj84HLH7IA5UKAORilE5In52PJv2GX3BNczvJo61ynyj?=
 =?us-ascii?Q?u4eugHXGxatNEcJP4Uq1oxiPFW6hoB5wdbroBDM8TOCIklbK00qNzX9iOu4U?=
 =?us-ascii?Q?GDU6yOrtlRrGveDpbjCMGuUKCZSzHXGHFinOfE3WHLw/FijR+QmQ+c/ouUI0?=
 =?us-ascii?Q?Othvs55qOfqDodcXXJU0J+TZnhIq7LQXCn7lONnLYbaVVCkiI41R7JNrtdwi?=
 =?us-ascii?Q?Jft4COfNEXiy3sv/w42Z6DJz22UO0r36gv/bwnhF339vtmM7zWEGyEZbkIlH?=
 =?us-ascii?Q?0anbt+EG1A7zaO4OnYtn4l6MMftK2tTck0/sE+H/MujL5pY3IW2ySV0PbZI/?=
 =?us-ascii?Q?bV9l3j3NtFpSvLjyszgsAev5S7lguCioifQtrBk8+DBSMPXDDvk/92LGgpMo?=
 =?us-ascii?Q?aFHtYzeDIGRosHlOc1PN2acxIox/AFHc6ALgCEEQ0bnUpo87ANAlKmDJzvln?=
 =?us-ascii?Q?FRzS8wC0EqhyFWf1GenphLCKk7yetWAdjHgB9ppZCr4BOend3fyVh9rPlY+j?=
 =?us-ascii?Q?JTJ0GMLy0K5NkxuzarXV6Pkzdch2DEolC9rB1KuR8YiFR+3el7coa26SI6DR?=
 =?us-ascii?Q?DPZEzudGofjWyXIIC0SU1Qw1KhxWlsI7TFE51eO1U0uMiu8bp4eX?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa7c69a8-c882-4652-481b-08de8baab00c
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 02:43:54.8290
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KxQW47E8N6DbedUWu1jolvahAwRG/uJNx4rHM5TwEuHW01VdhMRS4uGfuesGGMypuMrXJHwzAmWoKtZV7F87ev1BgbANq99y96Cmkzj5jrCcdtba82V5bX+yQ1zXZZSK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10243

Component has "card_aux_list" which is added/deled in bind/unbind aux dev
function (A), and used in for_each_card_auxs() loop (B).

	static void soc_unbind_aux_dev(...)
	{
		...
		for_each_card_auxs_safe(...) {
			...
(A)			list_del(&component->card_aux_list);
		}			     ^^^^^^^^^^^^^
	}

	static int soc_bind_aux_dev(...)
	{
		...
		for_each_card_pre_auxs(...) {
			...
(A)			list_add(&component->card_aux_list, ...);
		}			     ^^^^^^^^^^^^^
		...
	}

	#define for_each_card_auxs(card, component)	\
(B)		list_for_each_entry(component, ..., card_aux_list)
						    ^^^^^^^^^^^^^

But it has been used without calling INIT_LIST_HEAD().

	> git grep card_aux_list sound/soc
	sound/soc/soc-core.c:           list_del(&component->card_aux_list);
	sound/soc/soc-core.c:           list_add(&component->card_aux_list, ...);

call missing INIT_LIST_HEAD() for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 67d9ea319c84a..4dba883de0f78 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2856,6 +2856,7 @@ int snd_soc_component_initialize(struct snd_soc_component *component,
 	INIT_LIST_HEAD(&component->dobj_list);
 	INIT_LIST_HEAD(&component->card_list);
 	INIT_LIST_HEAD(&component->list);
+	INIT_LIST_HEAD(&component->card_aux_list);
 	mutex_init(&component->io_mutex);
 
 	if (!component->name) {
-- 
2.43.0

