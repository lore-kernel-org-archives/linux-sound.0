Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010008.outbound.protection.outlook.com [52.101.228.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8FBC309F18
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415869; cv=fail; b=Obfx5nFCDVx0p4NBhy/j8CfKQSnwvJncK8Xsc3jVZWmgl/JVgSxclE0tgsJQpmmbvfjmpj/QBFoy3L5Yh5SsihF179+/9iWo+6GO9e33NLeF24BJIv6SkehMYs5bfiOILGiivBlOvrWXGL88FftsVGOsOhDEVNmr38VzxflB5xw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415869; c=relaxed/simple;
	bh=kk3aPS0/eL9WiynI0M2TSQchqZyBDsmTtf3mSurSpcE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=nM48jR6P40s9OAoqmsisqDnDK0XTOHhuUrCq3MEnMdtzUuvz9ddyBjk0gqm1D5ugK8EsrtSHChv8bopYVOeBtGYGkYShd+v9occJKm+O6Xq/vz5KbTK28PjqOAC8xbBcj79QfEokxrBV2gC1qG3B47czEhbMVEk7kVL6vXiQU9Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=fHmmyxH+; arc=fail smtp.client-ip=52.101.228.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="fHmmyxH+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cOOBsy4x1z3tPmzhekY3YwXZrYykysUDOIMwhZQwfO7Tgl1MOixc67x3w/ZSpv1hUz/rx/vywuivO2phWsG4J+nRwe6e4IDMSMzVmwm6YGL024DhXJ04dCI31Ug4Y6+mHjED2Xd8FSnwln6XJjwW/c2C9ZsA+IhvEZE/78WADywBCc6CfNMfy18tcZeSHLGT1Zg1REgWhfWHsfLptaw/Hp6TjnFIueUnSCKJi08M8ayzZ05yrmYtd6NNRbJqDCOMdxd2DZNIKbPaQAZ7R3aY1JKYhRDrNEXy2GFoyGE4KK7U6lXv6OGwMRqim1/dSzyYR+irz4u3Ueox7jvXrHmS4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jviTra2KsjbfXkNsO0T6eXmJM2X7hmVkBbHoiT6OzJA=;
 b=ZYP/iNWTLn2kgLszLbPbbk46u7dY/9Vl48RVqn+ush4rbOFmzRB6IqBnlo0FLvlSwul0JTEmuqqeXdc6kXoAyCuKZcjpF/bPf9B/2pZYoGJ9LwlLra3ExeelUFPxq+6yTneBt+C+FKGjuHL9ZOL05YG8Q6OBnRI1F3SWN/nw7OXHOFP2HG2cnGu0O/eO7ipJ5ueeIkOi/KmQ6eauBEZXIikBzAoFujG1ALaT7uAPd3bq8DmpeL333dOD0koBc2uUh33xsNkWqFoMuc+YEfqGEtIZoPZkQiOrzuSU/k40Ij8Bs273/sWPU3GUeFdCZtl63qigGz5L1QzQUaudUOpgWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jviTra2KsjbfXkNsO0T6eXmJM2X7hmVkBbHoiT6OzJA=;
 b=fHmmyxH+e93O4652HX6YHj7ldSa0vb0fWvGsBDS9Qnuj+eqBL2Scp+hyGzVpXqfJ20vS0mh+LE1Z/6+gJZhmtLcajjSsmY5LQm+MglH/T//Hc0d44PQEhKxF+HDNBSGG2ci3D9dEsq/zOdoxqUfQSqampqqE0AqVieeKfEPx3Ac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9449.jpnprd01.prod.outlook.com
 (2603:1096:400:199::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:24:26 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:24:26 +0000
Message-ID: <87plaqp0ue.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 079/139] ASoC: codecs: tas2562: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:24:25 +0000
X-ClientProxiedBy: TYCP286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9449:EE_
X-MS-Office365-Filtering-Correlation-Id: 39b485b6-12f8-437e-f391-08de0ad98f19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GOXwqlG3XRNe+LUqHd/OidPY3Df5Ra3VwD/5C/ulyWJ0oyxr+og9HJl66d9L?=
 =?us-ascii?Q?Hdg3hqv969bT74Xg5zm6cfvnXyYWTWoMOu/UIhlHwnj671c3+Zjq4/Hu7VRX?=
 =?us-ascii?Q?ICbkfhkSZ4VmviCtElTk/v/AFHqCUJi+PeIryXq3FEFYtNTkc6WF9PL936D3?=
 =?us-ascii?Q?jYhIyOPcUilZml4QWV1YNgGxq4rsSd3xZPbs03SxCjIjb65IINi/3g+LnG6F?=
 =?us-ascii?Q?ceVu/KCRJUAuyvnB4fV9H1Ak18lYJ0Aq2a+hcZMcw5JXSBFYIYkf5dr/D4bN?=
 =?us-ascii?Q?eUAzlD79AFABSZb1+ZqL95UsM+01HNiF5uX6HP/vIF3lxTtBVfJI4F4n5xgo?=
 =?us-ascii?Q?AEgV5P5vZCpHH7/mhPvnnZT7bEjlsJ/wzLLfKWkKY4cvouygiCOWLMtpfE0S?=
 =?us-ascii?Q?yuSrGZd8ZZFdRyQ2mn6lK39rT3TTOsoK23XlXqtmSSZx6gKFZBqSGWg6DpYm?=
 =?us-ascii?Q?oDzYErtHZsxSytY9AFrqxi6/rZlH+J4G+H9Gh7MJdn5YMCPAhRFi2vo8FQwe?=
 =?us-ascii?Q?ETGfKRF8oNhIzZ4/Os+LXJ9wfV5OBqYK6EFQE5xTkYsjPBKpCRDcpHjKMv1e?=
 =?us-ascii?Q?2UZ1W/NZpSZpb1AA3Wuo75Twubosb1v/laSnctqW7vnwQAQSwexjqmR9tkV2?=
 =?us-ascii?Q?eJYq3UGLE7GqB5V6nlwlaSfNSxU0zn1u4VSbeqGYfJaRFj58gWIwDaN48Im+?=
 =?us-ascii?Q?tKLjAq903eAOEkAPxkryTZwVenRzb06owp+JnxWtw5oP1rIfo6crT5AAoxYK?=
 =?us-ascii?Q?nFo1ExawGTDaR4ron98uybYVUG9lhxo80FYechTctQeUzZBrWP9xpuaB03IU?=
 =?us-ascii?Q?8kNEFEw0yEnpJzMSOyfkXvEe/yLDSiVUlc9g4MBsB15SBjORTFR+PRABGZx8?=
 =?us-ascii?Q?2c4QIHDuzxwOBYW/6lXLSIG/oJ1xgOSfQkyBnFQ0zNHUXh2cTF5aeszoxaqZ?=
 =?us-ascii?Q?AgCWiKPLiOsK+D1qVY56D2l4Jv5NatHK+agP2a3SX0ymLBOBZyigR1Q6D2JP?=
 =?us-ascii?Q?YISqfB2pjOakKvAS0cJ80l9+xBBFM8VnMcCedxR2rLMNtlejuf+eqAs7swaX?=
 =?us-ascii?Q?KtWRiLpumXKhioTLve8r/z3k4i1p0kqTXcaWfqozDFVxG81JVzZmtrho6Yn3?=
 =?us-ascii?Q?9vzeE6yPE5xwPn751u7TpB0dsUHySwvY43e8ZX868yg2fN+57kmncwnWDxWV?=
 =?us-ascii?Q?eUuPFpNuouXOIcGRU24ZcSkpTvVK1qYT25a9zLvU43/iRDSC26zBAcqsfqGR?=
 =?us-ascii?Q?7xnKR+VegwM9m0Pqu2TDVvw1z7l9P+FwjcDv9fxHBXbA9Nhdc4YuGT5s9/fx?=
 =?us-ascii?Q?xX99Wz/X/ZKM4Zl50isOIgenHqsWXNQ6agrQ/aZBzhb2LgG0cwCvAZ9WWIGk?=
 =?us-ascii?Q?2G7wegxUEc6bgA10viG1fWJf2P3UsUtiJMmWw6Kr7XrsT/48e1PqNWPtOJ+g?=
 =?us-ascii?Q?+4Ymf/6GEAZzbajXJ3qKxHHjly4iEvn4QfWSC6OvM5ElwQ2RV6cdXzCMGwur?=
 =?us-ascii?Q?wF/Mvnc9jF6IGRqho8QDG9ruzYck3i7U/F4g?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VbowbJq1ofzT5ffMmWR5SjWSKTVHC2yrTzw8mN73jSgs9UYXxU2fkTiw/o3t?=
 =?us-ascii?Q?ETdyzhzFJXSFErBSCtBAmstmubctiekEnF1wSakbwFeQckoPB+tcRtTeFdZM?=
 =?us-ascii?Q?loHhfeUeQBXe2ZZ3svIbnRkg4yXSe+GghzTGgGxCzhsvWxK/E1O0kApROzUI?=
 =?us-ascii?Q?5Vvxf2xmSEt8ChSchXHkxtxmg0H7Wsm3Um/oJrtQG+Jpyh0rw6fpDdjYxplr?=
 =?us-ascii?Q?HrQ8cUhwxo1tSzjUBZnbUfjHw69ZUSUO+N/I3AwGN2Fb3lx44E6RgTB2Dc9+?=
 =?us-ascii?Q?JAs93X0/pGdu+tfxl8g7YuBf0rruBX/AhfqpygDowPcdHkcILuauUzi8KRJE?=
 =?us-ascii?Q?c6uc5aEMHC8l4ljqswINwYQXaHuQGDF41sOzFitQDdDN3t4zT9pMx7j2JvQn?=
 =?us-ascii?Q?3kbwCREPDfYWrmPXNGGCU1dysPt9bzrczaHK9vG8ZJDmKcvZDgeE/t3LdFfi?=
 =?us-ascii?Q?gDKFBp0HNTK+jSBZVsn4v7c2ygDSN5NuDPd+fvs0606VwysyJkkvPg8YojEy?=
 =?us-ascii?Q?gwbaM0LawXWTuSnQ2AtbNHutKW8Ks5ylvTGcVahLz4OP8d1/Y7zee4Fj4ze2?=
 =?us-ascii?Q?cKdEY7f99w3EocACntkFO7HWP/qxZ97LSqe9/eDupCzaDzZW+ttsC3Zp//28?=
 =?us-ascii?Q?8N4F76I3q22lq/Fol6FiWahy+hetV3QtHksGfLNZbF9cqWzpbGEeodQhq+DN?=
 =?us-ascii?Q?iung9304FXG1icQRau8xJlemfMXePlRSNVCTzfpejMNSn2rdK2KCJU0BarYK?=
 =?us-ascii?Q?+762+NEp5ZRjdz9oRJLvPsqM/2ICCp6T0uE3/a89MVRnQeSGmNjk1rXeXDAg?=
 =?us-ascii?Q?cHldjpcGFvEoLBWGNdaf3dK1sUHRRXlpHeLNR45Lgu3SeqXgyfqFcE7bB2nY?=
 =?us-ascii?Q?YabZbkBsOMt/YeHPHFGGkNMkvn7UUxSnc8fqTJ1sbd6qDAX75XewoVjYyPA0?=
 =?us-ascii?Q?eVD+3/NGcm/L1QtXbcIWmLzQ8OCf3+6GN7i24uoUlozHg6Udb/iN81Dqtmtn?=
 =?us-ascii?Q?2x+GehfdVzwVfHmM018DLD5zMeVkRp+fiiLKDSewNT1dIDI9IbA87sYHFndw?=
 =?us-ascii?Q?zIlC/zzif2WdmJArPr6E5VutFnEJ9V2kxZBNk51Xv8h6VzAFpJ8Xff3M63Z2?=
 =?us-ascii?Q?8ssnr/XqEcf07yLgrLeAHYry+9qPHsQ668Ds+QOz9GkTec3vU62nA84ZyuWO?=
 =?us-ascii?Q?jAoEd6GifMkOaF6du2ouHFzBRG7fszyqibb09pZ0lOtlxRHfUQScMEFkkIv7?=
 =?us-ascii?Q?UIvv5e+O7vyjSSvci2MLXjO7vIslS8W05Vc7X7leyltQv3liHysL3NeRbU8x?=
 =?us-ascii?Q?LKGXAiF0v6X5TNXi6yS4I1Wy9wDftSmBuFFjtAzP+eGzOChRGljBq3qz+AoC?=
 =?us-ascii?Q?XCsdABUaDLRLyPZ60bqV0mNV+pOq3/Zvx5LQn3HOeaUbtTa0qYdY+IDBJlAb?=
 =?us-ascii?Q?7vbtuM908hkRgryCbfkbVPgLazVq1wb5FGz57wBFYdYEEUPWHUv93bmzM64a?=
 =?us-ascii?Q?59y7iD/L6c9XGowJqGF/y3Tm/o+YABidYHW6Z0fR7TL5nM82ame2Uf6RfvPL?=
 =?us-ascii?Q?KxeUa0BqY7dW07fbK/6u/IbxJhSooumMqDqH+cKOaB6f2WkCk0GEVhlqUdBH?=
 =?us-ascii?Q?PId3UqYG3kuAOBqJy2IUkL8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39b485b6-12f8-437e-f391-08de0ad98f19
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:24:25.9866
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vr+ajxrnuHfG4m5j60r9Pd7NLFAXGEkU9zivjqka/zolozbiUXV3AGWBQwFE48mnmymhJVMc2xH/FdnA1azlioeUb2mmn9xHpPP6tbdg3EbpyM6UA83EwkzdrzqbnHgw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9449

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
 sound/soc/codecs/tas2562.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 8e00dcc09d0c2..ceb367ae05ba5 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -459,7 +459,7 @@ static int tas2562_dac_event(struct snd_soc_dapm_widget *w,
 static int tas2562_volume_control_get(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
 
 	ucontrol->value.integer.value[0] = tas2562->volume_lvl;
@@ -469,7 +469,7 @@ static int tas2562_volume_control_get(struct snd_kcontrol *kcontrol,
 static int tas2562_volume_control_put(struct snd_kcontrol *kcontrol,
 				      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tas2562_data *tas2562 = snd_soc_component_get_drvdata(component);
 	int ret;
 	u32 reg_val;
-- 
2.43.0

