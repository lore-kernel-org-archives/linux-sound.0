Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEEB79EA
	for <linux-sound@vger.kernel.org>; Tue,  1 Jul 2025 00:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751328650; cv=fail; b=XL4l61DGkJ18WNDxSA2dpuFlGAse5xzG3DTEYO8EuDM6jQZtJkLTNeIN8V5dbz0tmDgjD3SAZ1CNViLCuLBx3cyXMTZtDrZPOS06MQPksBmBclyRa3Fo5XNwX1PIydSr+BspTywZxIqjcFYiPUVat/bWX337/gj3UzfnwQNhlkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751328650; c=relaxed/simple;
	bh=LC6BItIrdq+K6rwRz9YolU085Esw9fIkXv813oV4Bhk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Hn8gxO8H5S90BgbhHA+/AT4jHTjqfagy0bDHviie/rEJFA3HgLaVDL5y4paHElDj4KwTMABPvXYV3WucGtt7djQUY1YOn3sbvyfWboUJXzGWi513ysBIn/97dv9z5MvKeJffhT0R/HTh1bJzVlVrfkqVlTWHw8Ng7VJ/37YiiSA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=W//fW8ar; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="W//fW8ar"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gMOnAMiTCnt+bLotYhvvXIaAbGh9o5aeeQBj7JhFSCKsANEsjrKksveIQ7YmEagii46K1aZDsv++0HUIAke6Vm6+Xx/tgkKbuGRWNbjrhpjCTwzL4+YkVe+YwsNX2sAZedGnSD0Cz5INqSnIdr84aJNBUQe9Wfq/v8KgigkbU/FlGYQDg7EH0J/cRbYDc3bhLuv+IyBIK16YLnKlH/k0TovD17ik6AQycVSEuo0Y4PBGP0DAV6lXkE2MoSQga3Me99GKCsCov9JHXaX5zwEBYGr1tq2J+/KgS6Gw3pU/QvWGppTM0v5GYlySC9DGOca0Buz5NNvOnPs8WIGed2FuLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e1JbRK9kYSREw5+2x6/RlCQDlBpvyEBsNXUoHOXtBBw=;
 b=heUCnwaM3xyKCo2WbXduT5/W32IJK641nEQnWB4g2gvwfkspCtQr7nvxpKEpKMvHtvt5N5sdCsZyQdVelQUNDY+f2f3cJjOu+4l1XXTDLZdN5SzLOMS223zV7ErefHlWnAdGLp/nyi/QG7ggoEfc+c5CJN2G2eTbOfDYJNAhXF6A+xHQRtdPfd/JJ+idlteunfxuJaETWkC3FAFTon1iGJcvjdeLvRuPdmzkfPX0DEifBCAf1Wkoit3J6pabDN+g5b5hqfjwAhmGDi+4M4gb15n15fUAYWyeRrqA8yqnKOvZjDbbnaMPKr/prHQcjsVZhb63MuOzvf/738FoOh3w/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e1JbRK9kYSREw5+2x6/RlCQDlBpvyEBsNXUoHOXtBBw=;
 b=W//fW8arrzAVXegbDkKis7YqmwJ77hVSuGE3dZ+qmmP/vd9TKv136XWj+oEr7FKn44NopTY76JavTzDhzzO2De05t/zZNwzCu14Q3iwT7kWqY5OGISmbB7X3HALErJulbz6g7aSbrnobVzVhwdjRhF8QTzX4gGpTWhlkdSOvRE4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS9PR01MB12421.jpnprd01.prod.outlook.com
 (2603:1096:604:2e2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.32; Tue, 1 Jul
 2025 00:10:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8880.021; Tue, 1 Jul 2025
 00:10:45 +0000
Message-ID: <87qzz0hit6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 05/11] ASoC: soc-dapm: reordering function definitions
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0t8hiue.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Jul 2025 00:10:45 +0000
X-ClientProxiedBy: TYCP301CA0034.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS9PR01MB12421:EE_
X-MS-Office365-Filtering-Correlation-Id: e03257f8-79d5-4ac5-34eb-08ddb833b9a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?JSJG0iZrm2CIneryimkVDt12N18G2aO73uMHOpBANQzAJTmu9QxuYskJQI+q?=
 =?us-ascii?Q?tI5iHclBVFB96Irazu4QZnZ+Lz2e8tvFPY6j7SwQNTgwpV6NS/0hfscP5C7c?=
 =?us-ascii?Q?M5IWR+klolDVfZQpD+Gmb2XfszPckq5rtg/3bMuboM8DgrR9TQE6/pVrK6Kk?=
 =?us-ascii?Q?nZEX/mwrHJyGge1MxyzFz/qeAUYBAy7nZeW+tJ+hgcs0gRDpXPtPtBF8fY65?=
 =?us-ascii?Q?7Wt/f7NdubM9nJmkR/T2IaSLAsgwYdbf4axnha1Oho86KyVBEunycMBDKC45?=
 =?us-ascii?Q?YruZl4yjFoIQuYechrcQ8q6VYdzOCUkc1BUCTmDFJXKAU+imSYlznpICDyP4?=
 =?us-ascii?Q?HooHeusVcZSNdk43j4+ApRH5vfLWSSW0UG5mz6FzlBxTVfRDzIaS/EpT4vVd?=
 =?us-ascii?Q?Y5yNZ+3Oz7xE1SyE2o0Df6Kjf4mh4fTBy0p4uDQDtaOdXfk0C3Q9nR26ePAc?=
 =?us-ascii?Q?EHItNt9pjTfpbtsFHDZrTO/uJbXdn/1du+bUb9D9ou3mkZSWXL9cjiSiL+nk?=
 =?us-ascii?Q?vTCSRCwU8txbvzhY+VLmPb5RCFyN2XKmc7SvfIytpGOk1mVQO69IWR8+yHgP?=
 =?us-ascii?Q?O+DTaBS4PBzKmr7qSXFo572E2qcvG1UdUliMRonFG2jY7aMXsMCuljiTOADM?=
 =?us-ascii?Q?T2pkiHDXAwbxO9IJGzVVHuuBCZ/HL14UUTfdM032zlsufx2apu+jOxQDRoUD?=
 =?us-ascii?Q?ZSpPxDn7YVvJfoR7tZ1EnxOFQkvIJITH1oPE5i42ZdcJjpJ70smtzaUCtBRE?=
 =?us-ascii?Q?AtNrVjc/KxUyyUHTAWZvAs9bVo4/GqvganAjR8NVuSlMnWVwBMwz8hbuKYY9?=
 =?us-ascii?Q?NPAAKFKegDkqC3K1TYcIgDPnMcwdyvgVNWsLOSFhzqv/OBvpC30u/BxyR2fm?=
 =?us-ascii?Q?Pj1i7ALa8m4N0tw6Ys4HCwwZ9TNDeL5p7aOx/QgqJYYKbWEMI6KPJiTjchf1?=
 =?us-ascii?Q?M7lvnqoWp08GPrvTYXrqGHiD00HJce+am+gb/co7eBlX0JahZ9LF+hbnF2Jb?=
 =?us-ascii?Q?/f6fil/pSfR6jsrFus3I7C4/ux2lJQ3Dos4vtRjT4s+DFb5iHHh2cVPwX7B0?=
 =?us-ascii?Q?gRpCVvGX6REWXlytvsWOx2uMsd78YURKS7ZgCt8fQCAr6H8PwazmNXkocnRE?=
 =?us-ascii?Q?If+ORCnAjVgtaEfHUYK80NxKcjJByZ7gSVg9lPT+x3Dthhdhg9JYVSb7Zr/k?=
 =?us-ascii?Q?NLdaX6BGzTpBdbPhFRRa5mfj0kw/Utkm+n43dQU7BCjCnDCNYeUnbGakvwaz?=
 =?us-ascii?Q?3XwfhkYzklX+NAtntRM2hdDax/UFncGAKyBP/ULT0xxghpYNdTsj7ChumgTb?=
 =?us-ascii?Q?uasOzOvuBjZTVBrRyP2Y0q03TAERjl7+JKSgTZnzzr/+2FTOiGiFVSrH0yiV?=
 =?us-ascii?Q?tQW3/Tm4hWzkxJu4OQuQygTEQtXBv0Co1m7HaLP6wnut3hYpFj+XtksvvPg/?=
 =?us-ascii?Q?B7EL87LUTixwLPvtxi846YYVlEcPOGhTXjx6XKucqg/8IkOzbaOGSQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SQEg/KgHBiMeVY12ZRiujWFt3nPq/pwSfM7/f4OtFNq+8u/quRY/e4AQxVcN?=
 =?us-ascii?Q?QeRxeeqJcFIxs8ydbLuYZzPfxtc0SkF75RBRrdH5IQgSBNGA50u8ND+eoMlL?=
 =?us-ascii?Q?3XXMRv/ZBi9KOvQakpyBwsreFmLvqnI3sM117Pp8EbBuME1yMdffCTXefuo2?=
 =?us-ascii?Q?f4AGfuiWQLyxtVfQaXBdeKdhkIo1cgsn//tFkIElypmdeGhjZa5VF5xoG9b6?=
 =?us-ascii?Q?dVkeEpV0qM4lQNluk/sp1VMqs74VxeM5IainVjUXiiDNYioLflLAsDJx8gXC?=
 =?us-ascii?Q?126UoGzRukR93uZ0PoHMq1plAzgrFzgg/Tqgs9vl4n68ITbu7n9R9Y3uxxKx?=
 =?us-ascii?Q?k2d15wtzQ4Tw9DuCJWc+l0s/UTplOqiz/oHwHuqnRwVLxjb3Su25zep6T/KU?=
 =?us-ascii?Q?bzxMaEtnQkP6dySXWG+3cMeOAAywUVHVy30LPvzcfGWhAPDvlGVPh4Tk1vCr?=
 =?us-ascii?Q?C7OrNQJg04Sllr61KahYxb+7U5MqFpZRM22o4LchlH1XyW8XjwivutPTl2Em?=
 =?us-ascii?Q?IH19FA/gQh+sOL6DnhFaOFm1CnVCna55lB+50dujhlFmaWFgEvtM4//DuEqp?=
 =?us-ascii?Q?uJoF1biJKJ+mp5RdQFcYknfQj9sSTAPM86E8F7vuT7CsnOW09bhTgjRV0qMd?=
 =?us-ascii?Q?n8oi0nzh6Iqm2u3DO3AgFNcNj2EXJewjldixskOuzaX0MIpa0811QmSvVGn7?=
 =?us-ascii?Q?c6L2yDf5+tiwSPdzb5d6pow8LiRt4LRGzeJBy3NWON8rJoo6YRy9fGoXJhkR?=
 =?us-ascii?Q?MODioQzeXfIYVz3yXc6FV2zRJI6NIF3ypVrMmDkxaiaUi3iQF2ZguF92HWzQ?=
 =?us-ascii?Q?kF5rCWP4uRWn20jGt4zZQLLBTtE4MFjUddscDdA0Qr9UJ1rfq62ig6JzlyNZ?=
 =?us-ascii?Q?sSAgEWag7p/XI0Gkz09dcsTaW/SYlOS2B0gx8MOJ/jJ+rcTC/Y9TNmccXkCk?=
 =?us-ascii?Q?d31ydVdujaFjBlSjMUp3IFpCtFX0gNBB6gIQjq/GmpOGCr5XMCNOkxgH3CRx?=
 =?us-ascii?Q?U32ODNk/DR0jZ/yOTtcpJTfkc5yABjWQi2WBbjLWOdJqKU9U5wR/t5ef0zXg?=
 =?us-ascii?Q?kcwTpwVhIHkQ/bg1oCZhYQLd+HEg8XYr8BlKqHcgvGWmYCcpPtMUCr7vCEG6?=
 =?us-ascii?Q?ukz6Jh8aZ6eS+F2mvHHWqWJu8A9gUmqCsXLENhzJmQaMSTHXxXdy/b06Nj3R?=
 =?us-ascii?Q?RwkLtJ2zK+mIjrK6q9VnU6dnKtYRMbdfNKMBr/W/6LvDaGSVtvNri3oijgT3?=
 =?us-ascii?Q?b+o8mQrmVCymUgud95C6XTKvkV1MnI0Lb/GqY7hpLcFteHz23bW2Lp9+WsTT?=
 =?us-ascii?Q?E+ZU9Te4o3dHWUaqdnzJV3rAy6UrgKYu7Ap9Z7KP10jiyQ8qTvipPqS/fGdC?=
 =?us-ascii?Q?GhlMkzgjOUZDDla8bichwxzqpGMcgOmLk1Ls23jPPsgRl1IeR4OgDUC3Pkbv?=
 =?us-ascii?Q?Jr6fynXOS74tWOnVO3PsBKmdsYVejK505oj/n3/nMwtuP/tahStVbMKdIdMM?=
 =?us-ascii?Q?/kKkpO0eBOjIzcO6YThbFuqkf/F2BcpFL8XNTU39qISbvLbuLSbFWa3O4ron?=
 =?us-ascii?Q?aZNnZSXZROg3fvjDaci/4+rEMoYJB/keMHHF8/vuLfI6yaWMe6TfRTIa73Xz?=
 =?us-ascii?Q?KaBygveBYyWyJ+te1x5KMj4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e03257f8-79d5-4ac5-34eb-08ddb833b9a6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 00:10:45.5976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJbWJAeRzO50SMWf1om15tdPo66RoU5NgziVf+SgmCid7iKxTjlb7igYNeRuqdx59G4gvtNAT80bFNsvmg+9ig8o4cy6wwXaxTxouAdRNwqfMb6uM5jVDThO5fS2EfOo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB12421

Because functions are defined randomly, it needs function name
definitions on top of soc-dapm.c. it is not needed if functions
are implemented in correct order.

This patch has big change from change-line point of view, but is
just reordering, nothing changed in meaning.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 733 +++++++++++++++++++++----------------------
 1 file changed, 364 insertions(+), 369 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 79cd3c93a4fd..babb642c9655 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -49,14 +49,6 @@
 	for ((dir) = SND_SOC_DAPM_DIR_IN; (dir) <= SND_SOC_DAPM_DIR_OUT; \
 		(dir)++)
 
-static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
-	struct snd_soc_dapm_widget *wsource, struct snd_soc_dapm_widget *wsink,
-	const char *control,
-	int (*connected)(struct snd_soc_dapm_widget *source,
-			 struct snd_soc_dapm_widget *sink));
-
-static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg);
-
 /* dapm power sequences - make this per codec in the future */
 static int dapm_up_seq[] = {
 	[snd_soc_dapm_pre] = 1,
@@ -346,6 +338,320 @@ struct dapm_kcontrol_data {
 	struct snd_soc_dapm_widget_list *wlist;
 };
 
+static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg)
+{
+	if (!dapm->component)
+		return -EIO;
+	return  snd_soc_component_read(dapm->component, reg);
+}
+
+/* set up initial codec paths */
+static void dapm_set_mixer_path_status(struct snd_soc_dapm_path *p, int i,
+				       int nth_path)
+{
+	struct soc_mixer_control *mc = (struct soc_mixer_control *)
+		p->sink->kcontrol_news[i].private_value;
+	unsigned int reg = mc->reg;
+	unsigned int invert = mc->invert;
+
+	if (reg != SND_SOC_NOPM) {
+		unsigned int shift = mc->shift;
+		unsigned int max = mc->max;
+		unsigned int mask = (1 << fls(max)) - 1;
+		unsigned int val = soc_dapm_read(p->sink->dapm, reg);
+
+		/*
+		 * The nth_path argument allows this function to know
+		 * which path of a kcontrol it is setting the initial
+		 * status for. Ideally this would support any number
+		 * of paths and channels. But since kcontrols only come
+		 * in mono and stereo variants, we are limited to 2
+		 * channels.
+		 *
+		 * The following code assumes for stereo controls the
+		 * first path is the left channel, and all remaining
+		 * paths are the right channel.
+		 */
+		if (snd_soc_volsw_is_stereo(mc) && nth_path > 0) {
+			if (reg != mc->rreg)
+				val = soc_dapm_read(p->sink->dapm, mc->rreg);
+			val = (val >> mc->rshift) & mask;
+		} else {
+			val = (val >> shift) & mask;
+		}
+		if (invert)
+			val = max - val;
+		p->connect = !!val;
+	} else {
+		/* since a virtual mixer has no backing registers to
+		 * decide which path to connect, it will try to match
+		 * with initial state.  This is to ensure
+		 * that the default mixer choice will be
+		 * correctly powered up during initialization.
+		 */
+		p->connect = invert;
+	}
+}
+
+/* connect mux widget to its interconnecting audio paths */
+static int dapm_connect_mux(struct snd_soc_dapm_context *dapm,
+			    struct snd_soc_dapm_path *path, const char *control_name,
+			    struct snd_soc_dapm_widget *w)
+{
+	const struct snd_kcontrol_new *kcontrol = &w->kcontrol_news[0];
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	unsigned int item;
+	int i;
+
+	if (e->reg != SND_SOC_NOPM) {
+		unsigned int val;
+
+		val = soc_dapm_read(dapm, e->reg);
+		val = (val >> e->shift_l) & e->mask;
+		item = snd_soc_enum_val_to_item(e, val);
+	} else {
+		/* since a virtual mux has no backing registers to
+		 * decide which path to connect, it will try to match
+		 * with the first enumeration.  This is to ensure
+		 * that the default mux choice (the first) will be
+		 * correctly powered up during initialization.
+		 */
+		item = 0;
+	}
+
+	i = match_string(e->texts, e->items, control_name);
+	if (i < 0)
+		return -ENODEV;
+
+	path->name = e->texts[i];
+	path->connect = (i == item);
+	return 0;
+
+}
+
+/* connect mixer widget to its interconnecting audio paths */
+static int dapm_connect_mixer(struct snd_soc_dapm_context *dapm,
+			      struct snd_soc_dapm_path *path, const char *control_name)
+{
+	int i, nth_path = 0;
+
+	/* search for mixer kcontrol */
+	for (i = 0; i < path->sink->num_kcontrols; i++) {
+		if (!strcmp(control_name, path->sink->kcontrol_news[i].name)) {
+			path->name = path->sink->kcontrol_news[i].name;
+			dapm_set_mixer_path_status(path, i, nth_path++);
+			return 0;
+		}
+	}
+	return -ENODEV;
+}
+
+/*
+ * dapm_update_widget_flags() - Re-compute widget sink and source flags
+ * @w: The widget for which to update the flags
+ *
+ * Some widgets have a dynamic category which depends on which neighbors they
+ * are connected to. This function update the category for these widgets.
+ *
+ * This function must be called whenever a path is added or removed to a widget.
+ */
+static void dapm_update_widget_flags(struct snd_soc_dapm_widget *w)
+{
+	enum snd_soc_dapm_direction dir;
+	struct snd_soc_dapm_path *p;
+	unsigned int ep;
+
+	switch (w->id) {
+	case snd_soc_dapm_input:
+		/* On a fully routed card an input is never a source */
+		if (w->dapm->card->fully_routed)
+			return;
+		ep = SND_SOC_DAPM_EP_SOURCE;
+		snd_soc_dapm_widget_for_each_source_path(w, p) {
+			if (p->source->id == snd_soc_dapm_micbias ||
+			    p->source->id == snd_soc_dapm_mic ||
+			    p->source->id == snd_soc_dapm_line ||
+			    p->source->id == snd_soc_dapm_output) {
+				ep = 0;
+				break;
+			}
+		}
+		break;
+	case snd_soc_dapm_output:
+		/* On a fully routed card a output is never a sink */
+		if (w->dapm->card->fully_routed)
+			return;
+		ep = SND_SOC_DAPM_EP_SINK;
+		snd_soc_dapm_widget_for_each_sink_path(w, p) {
+			if (p->sink->id == snd_soc_dapm_spk ||
+			    p->sink->id == snd_soc_dapm_hp ||
+			    p->sink->id == snd_soc_dapm_line ||
+			    p->sink->id == snd_soc_dapm_input) {
+				ep = 0;
+				break;
+			}
+		}
+		break;
+	case snd_soc_dapm_line:
+		ep = 0;
+		snd_soc_dapm_for_each_direction(dir) {
+			if (!list_empty(&w->edges[dir]))
+				ep |= SND_SOC_DAPM_DIR_TO_EP(dir);
+		}
+		break;
+	default:
+		return;
+	}
+
+	w->is_ep = ep;
+}
+
+static int snd_soc_dapm_check_dynamic_path(
+	struct snd_soc_dapm_context *dapm,
+	struct snd_soc_dapm_widget *source, struct snd_soc_dapm_widget *sink,
+	const char *control)
+{
+	bool dynamic_source = false;
+	bool dynamic_sink = false;
+
+	if (!control)
+		return 0;
+
+	switch (source->id) {
+	case snd_soc_dapm_demux:
+		dynamic_source = true;
+		break;
+	default:
+		break;
+	}
+
+	switch (sink->id) {
+	case snd_soc_dapm_mux:
+	case snd_soc_dapm_switch:
+	case snd_soc_dapm_mixer:
+	case snd_soc_dapm_mixer_named_ctl:
+		dynamic_sink = true;
+		break;
+	default:
+		break;
+	}
+
+	if (dynamic_source && dynamic_sink) {
+		dev_err(dapm->dev,
+			"Direct connection between demux and mixer/mux not supported for path %s -> [%s] -> %s\n",
+			source->name, control, sink->name);
+		return -EINVAL;
+	} else if (!dynamic_source && !dynamic_sink) {
+		dev_err(dapm->dev,
+			"Control not supported for path %s -> [%s] -> %s\n",
+			source->name, control, sink->name);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int snd_soc_dapm_add_path(
+	struct snd_soc_dapm_context *dapm,
+	struct snd_soc_dapm_widget *wsource, struct snd_soc_dapm_widget *wsink,
+	const char *control,
+	int (*connected)(struct snd_soc_dapm_widget *source,
+			 struct snd_soc_dapm_widget *sink))
+{
+	enum snd_soc_dapm_direction dir;
+	struct snd_soc_dapm_path *path;
+	int ret;
+
+	if (wsink->is_supply && !wsource->is_supply) {
+		dev_err(dapm->dev,
+			"Connecting non-supply widget to supply widget is not supported (%s -> %s)\n",
+			wsource->name, wsink->name);
+		return -EINVAL;
+	}
+
+	if (connected && !wsource->is_supply) {
+		dev_err(dapm->dev,
+			"connected() callback only supported for supply widgets (%s -> %s)\n",
+			wsource->name, wsink->name);
+		return -EINVAL;
+	}
+
+	if (wsource->is_supply && control) {
+		dev_err(dapm->dev,
+			"Conditional paths are not supported for supply widgets (%s -> [%s] -> %s)\n",
+			wsource->name, control, wsink->name);
+		return -EINVAL;
+	}
+
+	ret = snd_soc_dapm_check_dynamic_path(dapm, wsource, wsink, control);
+	if (ret)
+		return ret;
+
+	path = kzalloc(sizeof(struct snd_soc_dapm_path), GFP_KERNEL);
+	if (!path)
+		return -ENOMEM;
+
+	path->node[SND_SOC_DAPM_DIR_IN] = wsource;
+	path->node[SND_SOC_DAPM_DIR_OUT] = wsink;
+
+	path->connected = connected;
+	INIT_LIST_HEAD(&path->list);
+	INIT_LIST_HEAD(&path->list_kcontrol);
+
+	if (wsource->is_supply || wsink->is_supply)
+		path->is_supply = 1;
+
+	/* connect static paths */
+	if (control == NULL) {
+		path->connect = 1;
+	} else {
+		switch (wsource->id) {
+		case snd_soc_dapm_demux:
+			ret = dapm_connect_mux(dapm, path, control, wsource);
+			if (ret)
+				goto err;
+			break;
+		default:
+			break;
+		}
+
+		switch (wsink->id) {
+		case snd_soc_dapm_mux:
+			ret = dapm_connect_mux(dapm, path, control, wsink);
+			if (ret != 0)
+				goto err;
+			break;
+		case snd_soc_dapm_switch:
+		case snd_soc_dapm_mixer:
+		case snd_soc_dapm_mixer_named_ctl:
+			ret = dapm_connect_mixer(dapm, path, control);
+			if (ret != 0)
+				goto err;
+			break;
+		default:
+			break;
+		}
+	}
+
+	list_add(&path->list, &dapm->card->paths);
+
+	snd_soc_dapm_for_each_direction(dir)
+		list_add(&path->list_node[dir], &path->node[dir]->edges[dir]);
+
+	snd_soc_dapm_for_each_direction(dir) {
+		dapm_update_widget_flags(path->node[dir]);
+		dapm_mark_dirty(path->node[dir], "Route added");
+	}
+
+	if (snd_soc_card_is_instantiated(dapm->card) && path->connect)
+		dapm_path_invalidate(path);
+
+	return 0;
+err:
+	kfree(path);
+	return ret;
+}
+
 static int dapm_kcontrol_data_alloc(struct snd_soc_dapm_widget *widget,
 	struct snd_kcontrol *kcontrol, const char *ctrl_name)
 {
@@ -618,13 +924,6 @@ static const char *soc_dapm_prefix(struct snd_soc_dapm_context *dapm)
 	return dapm->component->name_prefix;
 }
 
-static unsigned int soc_dapm_read(struct snd_soc_dapm_context *dapm, int reg)
-{
-	if (!dapm->component)
-		return -EIO;
-	return  snd_soc_component_read(dapm->component, reg);
-}
-
 static int soc_dapm_update_bits(struct snd_soc_dapm_context *dapm,
 	int reg, unsigned int mask, unsigned int value)
 {
@@ -678,160 +977,60 @@ dapm_wcache_lookup(struct snd_soc_dapm_widget *w, const char *name)
  * the context is already at the same level. Furthermore it will not go through
  * the normal bias level sequencing, meaning any intermediate states between the
  * current and the target state will not be entered.
- *
- * Note that the change in bias level is only temporary and the next time
- * snd_soc_dapm_sync() is called the state will be set to the level as
- * determined by the DAPM core. The function is mainly intended to be used to
- * used during probe or resume from suspend to power up the device so
- * initialization can be done, before the DAPM core takes over.
- */
-int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm,
-	enum snd_soc_bias_level level)
-{
-	int ret = 0;
-
-	if (dapm->component)
-		ret = snd_soc_component_set_bias_level(dapm->component, level);
-
-	if (ret == 0)
-		dapm->bias_level = level;
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dapm_force_bias_level);
-
-/**
- * snd_soc_dapm_set_bias_level - set the bias level for the system
- * @dapm: DAPM context
- * @level: level to configure
- *
- * Configure the bias (power) levels for the SoC audio device.
- *
- * Returns 0 for success else error.
- */
-static int snd_soc_dapm_set_bias_level(struct snd_soc_dapm_context *dapm,
-				       enum snd_soc_bias_level level)
-{
-	struct snd_soc_card *card = dapm->card;
-	int ret = 0;
-
-	trace_snd_soc_bias_level_start(dapm, level);
-
-	ret = snd_soc_card_set_bias_level(card, dapm, level);
-	if (ret != 0)
-		goto out;
-
-	if (dapm != &card->dapm)
-		ret = snd_soc_dapm_force_bias_level(dapm, level);
-
-	if (ret != 0)
-		goto out;
-
-	ret = snd_soc_card_set_bias_level_post(card, dapm, level);
-out:
-	trace_snd_soc_bias_level_done(dapm, level);
-
-	return ret;
-}
-
-/* connect mux widget to its interconnecting audio paths */
-static int dapm_connect_mux(struct snd_soc_dapm_context *dapm,
-	struct snd_soc_dapm_path *path, const char *control_name,
-	struct snd_soc_dapm_widget *w)
-{
-	const struct snd_kcontrol_new *kcontrol = &w->kcontrol_news[0];
-	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
-	unsigned int item;
-	int i;
-
-	if (e->reg != SND_SOC_NOPM) {
-		unsigned int val;
-		val = soc_dapm_read(dapm, e->reg);
-		val = (val >> e->shift_l) & e->mask;
-		item = snd_soc_enum_val_to_item(e, val);
-	} else {
-		/* since a virtual mux has no backing registers to
-		 * decide which path to connect, it will try to match
-		 * with the first enumeration.  This is to ensure
-		 * that the default mux choice (the first) will be
-		 * correctly powered up during initialization.
-		 */
-		item = 0;
-	}
-
-	i = match_string(e->texts, e->items, control_name);
-	if (i < 0)
-		return -ENODEV;
-
-	path->name = e->texts[i];
-	path->connect = (i == item);
-	return 0;
-
-}
-
-/* set up initial codec paths */
-static void dapm_set_mixer_path_status(struct snd_soc_dapm_path *p, int i,
-				       int nth_path)
-{
-	struct soc_mixer_control *mc = (struct soc_mixer_control *)
-		p->sink->kcontrol_news[i].private_value;
-	unsigned int reg = mc->reg;
-	unsigned int invert = mc->invert;
-
-	if (reg != SND_SOC_NOPM) {
-		unsigned int shift = mc->shift;
-		unsigned int max = mc->max;
-		unsigned int mask = (1 << fls(max)) - 1;
-		unsigned int val = soc_dapm_read(p->sink->dapm, reg);
-
-		/*
-		 * The nth_path argument allows this function to know
-		 * which path of a kcontrol it is setting the initial
-		 * status for. Ideally this would support any number
-		 * of paths and channels. But since kcontrols only come
-		 * in mono and stereo variants, we are limited to 2
-		 * channels.
-		 *
-		 * The following code assumes for stereo controls the
-		 * first path is the left channel, and all remaining
-		 * paths are the right channel.
-		 */
-		if (snd_soc_volsw_is_stereo(mc) && nth_path > 0) {
-			if (reg != mc->rreg)
-				val = soc_dapm_read(p->sink->dapm, mc->rreg);
-			val = (val >> mc->rshift) & mask;
-		} else {
-			val = (val >> shift) & mask;
-		}
-		if (invert)
-			val = max - val;
-		p->connect = !!val;
-	} else {
-		/* since a virtual mixer has no backing registers to
-		 * decide which path to connect, it will try to match
-		 * with initial state.  This is to ensure
-		 * that the default mixer choice will be
-		 * correctly powered up during initialization.
-		 */
-		p->connect = invert;
-	}
+ *
+ * Note that the change in bias level is only temporary and the next time
+ * snd_soc_dapm_sync() is called the state will be set to the level as
+ * determined by the DAPM core. The function is mainly intended to be used to
+ * used during probe or resume from suspend to power up the device so
+ * initialization can be done, before the DAPM core takes over.
+ */
+int snd_soc_dapm_force_bias_level(struct snd_soc_dapm_context *dapm,
+	enum snd_soc_bias_level level)
+{
+	int ret = 0;
+
+	if (dapm->component)
+		ret = snd_soc_component_set_bias_level(dapm->component, level);
+
+	if (ret == 0)
+		dapm->bias_level = level;
+
+	return ret;
 }
+EXPORT_SYMBOL_GPL(snd_soc_dapm_force_bias_level);
 
-/* connect mixer widget to its interconnecting audio paths */
-static int dapm_connect_mixer(struct snd_soc_dapm_context *dapm,
-	struct snd_soc_dapm_path *path, const char *control_name)
+/**
+ * snd_soc_dapm_set_bias_level - set the bias level for the system
+ * @dapm: DAPM context
+ * @level: level to configure
+ *
+ * Configure the bias (power) levels for the SoC audio device.
+ *
+ * Returns 0 for success else error.
+ */
+static int snd_soc_dapm_set_bias_level(struct snd_soc_dapm_context *dapm,
+				       enum snd_soc_bias_level level)
 {
-	int i, nth_path = 0;
+	struct snd_soc_card *card = dapm->card;
+	int ret = 0;
 
-	/* search for mixer kcontrol */
-	for (i = 0; i < path->sink->num_kcontrols; i++) {
-		if (!strcmp(control_name, path->sink->kcontrol_news[i].name)) {
-			path->name = path->sink->kcontrol_news[i].name;
-			dapm_set_mixer_path_status(path, i, nth_path++);
-			return 0;
-		}
-	}
-	return -ENODEV;
+	trace_snd_soc_bias_level_start(dapm, level);
+
+	ret = snd_soc_card_set_bias_level(card, dapm, level);
+	if (ret != 0)
+		goto out;
+
+	if (dapm != &card->dapm)
+		ret = snd_soc_dapm_force_bias_level(dapm, level);
+
+	if (ret != 0)
+		goto out;
+
+	ret = snd_soc_card_set_bias_level_post(card, dapm, level);
+out:
+	trace_snd_soc_bias_level_done(dapm, level);
+
+	return ret;
 }
 
 static int dapm_is_shared_kcontrol(struct snd_soc_dapm_context *dapm,
@@ -2783,210 +2982,6 @@ int snd_soc_dapm_widget_name_cmp(struct snd_soc_dapm_widget *widget, const char
 }
 EXPORT_SYMBOL_GPL(snd_soc_dapm_widget_name_cmp);
 
-/*
- * dapm_update_widget_flags() - Re-compute widget sink and source flags
- * @w: The widget for which to update the flags
- *
- * Some widgets have a dynamic category which depends on which neighbors they
- * are connected to. This function update the category for these widgets.
- *
- * This function must be called whenever a path is added or removed to a widget.
- */
-static void dapm_update_widget_flags(struct snd_soc_dapm_widget *w)
-{
-	enum snd_soc_dapm_direction dir;
-	struct snd_soc_dapm_path *p;
-	unsigned int ep;
-
-	switch (w->id) {
-	case snd_soc_dapm_input:
-		/* On a fully routed card an input is never a source */
-		if (w->dapm->card->fully_routed)
-			return;
-		ep = SND_SOC_DAPM_EP_SOURCE;
-		snd_soc_dapm_widget_for_each_source_path(w, p) {
-			if (p->source->id == snd_soc_dapm_micbias ||
-				p->source->id == snd_soc_dapm_mic ||
-				p->source->id == snd_soc_dapm_line ||
-				p->source->id == snd_soc_dapm_output) {
-					ep = 0;
-					break;
-			}
-		}
-		break;
-	case snd_soc_dapm_output:
-		/* On a fully routed card a output is never a sink */
-		if (w->dapm->card->fully_routed)
-			return;
-		ep = SND_SOC_DAPM_EP_SINK;
-		snd_soc_dapm_widget_for_each_sink_path(w, p) {
-			if (p->sink->id == snd_soc_dapm_spk ||
-				p->sink->id == snd_soc_dapm_hp ||
-				p->sink->id == snd_soc_dapm_line ||
-				p->sink->id == snd_soc_dapm_input) {
-					ep = 0;
-					break;
-			}
-		}
-		break;
-	case snd_soc_dapm_line:
-		ep = 0;
-		snd_soc_dapm_for_each_direction(dir) {
-			if (!list_empty(&w->edges[dir]))
-				ep |= SND_SOC_DAPM_DIR_TO_EP(dir);
-		}
-		break;
-	default:
-		return;
-	}
-
-	w->is_ep = ep;
-}
-
-static int snd_soc_dapm_check_dynamic_path(struct snd_soc_dapm_context *dapm,
-	struct snd_soc_dapm_widget *source, struct snd_soc_dapm_widget *sink,
-	const char *control)
-{
-	bool dynamic_source = false;
-	bool dynamic_sink = false;
-
-	if (!control)
-		return 0;
-
-	switch (source->id) {
-	case snd_soc_dapm_demux:
-		dynamic_source = true;
-		break;
-	default:
-		break;
-	}
-
-	switch (sink->id) {
-	case snd_soc_dapm_mux:
-	case snd_soc_dapm_switch:
-	case snd_soc_dapm_mixer:
-	case snd_soc_dapm_mixer_named_ctl:
-		dynamic_sink = true;
-		break;
-	default:
-		break;
-	}
-
-	if (dynamic_source && dynamic_sink) {
-		dev_err(dapm->dev,
-			"Direct connection between demux and mixer/mux not supported for path %s -> [%s] -> %s\n",
-			source->name, control, sink->name);
-		return -EINVAL;
-	} else if (!dynamic_source && !dynamic_sink) {
-		dev_err(dapm->dev,
-			"Control not supported for path %s -> [%s] -> %s\n",
-			source->name, control, sink->name);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int snd_soc_dapm_add_path(struct snd_soc_dapm_context *dapm,
-	struct snd_soc_dapm_widget *wsource, struct snd_soc_dapm_widget *wsink,
-	const char *control,
-	int (*connected)(struct snd_soc_dapm_widget *source,
-			 struct snd_soc_dapm_widget *sink))
-{
-	enum snd_soc_dapm_direction dir;
-	struct snd_soc_dapm_path *path;
-	int ret;
-
-	if (wsink->is_supply && !wsource->is_supply) {
-		dev_err(dapm->dev,
-			"Connecting non-supply widget to supply widget is not supported (%s -> %s)\n",
-			wsource->name, wsink->name);
-		return -EINVAL;
-	}
-
-	if (connected && !wsource->is_supply) {
-		dev_err(dapm->dev,
-			"connected() callback only supported for supply widgets (%s -> %s)\n",
-			wsource->name, wsink->name);
-		return -EINVAL;
-	}
-
-	if (wsource->is_supply && control) {
-		dev_err(dapm->dev,
-			"Conditional paths are not supported for supply widgets (%s -> [%s] -> %s)\n",
-			wsource->name, control, wsink->name);
-		return -EINVAL;
-	}
-
-	ret = snd_soc_dapm_check_dynamic_path(dapm, wsource, wsink, control);
-	if (ret)
-		return ret;
-
-	path = kzalloc(sizeof(struct snd_soc_dapm_path), GFP_KERNEL);
-	if (!path)
-		return -ENOMEM;
-
-	path->node[SND_SOC_DAPM_DIR_IN] = wsource;
-	path->node[SND_SOC_DAPM_DIR_OUT] = wsink;
-
-	path->connected = connected;
-	INIT_LIST_HEAD(&path->list);
-	INIT_LIST_HEAD(&path->list_kcontrol);
-
-	if (wsource->is_supply || wsink->is_supply)
-		path->is_supply = 1;
-
-	/* connect static paths */
-	if (control == NULL) {
-		path->connect = 1;
-	} else {
-		switch (wsource->id) {
-		case snd_soc_dapm_demux:
-			ret = dapm_connect_mux(dapm, path, control, wsource);
-			if (ret)
-				goto err;
-			break;
-		default:
-			break;
-		}
-
-		switch (wsink->id) {
-		case snd_soc_dapm_mux:
-			ret = dapm_connect_mux(dapm, path, control, wsink);
-			if (ret != 0)
-				goto err;
-			break;
-		case snd_soc_dapm_switch:
-		case snd_soc_dapm_mixer:
-		case snd_soc_dapm_mixer_named_ctl:
-			ret = dapm_connect_mixer(dapm, path, control);
-			if (ret != 0)
-				goto err;
-			break;
-		default:
-			break;
-		}
-	}
-
-	list_add(&path->list, &dapm->card->paths);
-
-	snd_soc_dapm_for_each_direction(dir)
-		list_add(&path->list_node[dir], &path->node[dir]->edges[dir]);
-
-	snd_soc_dapm_for_each_direction(dir) {
-		dapm_update_widget_flags(path->node[dir]);
-		dapm_mark_dirty(path->node[dir], "Route added");
-	}
-
-	if (snd_soc_card_is_instantiated(dapm->card) && path->connect)
-		dapm_path_invalidate(path);
-
-	return 0;
-err:
-	kfree(path);
-	return ret;
-}
-
 static int snd_soc_dapm_add_route(struct snd_soc_dapm_context *dapm,
 				  const struct snd_soc_dapm_route *route)
 {
-- 
2.43.0

