Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011050.outbound.protection.outlook.com [52.101.125.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31BB30AD18
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416035; cv=fail; b=iTiFLvLIYAQSvxmogqnYyb0fU0wy3GNzzpB3rBQwqEmaZJnhg5wkpjfcdyiCAXC0ZLuAWDeMuRlrgjGuCEEoW0HD+wmnyBabF0JboB3GFDjDDtmvH6BqpuMEDwPlIo8u9UPbPSOXF6KmTDhHf4j7rY1tg7CvckQh7RFoB+hXHBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416035; c=relaxed/simple;
	bh=ppziA175/0Isv9LNEOlWgP75E4fOgmIz/ucQtRvwFnc=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=W0I9cJydTOOE0+7YP0CGEGILRScszgv//RQwJrKjfE05mF+cGJj/Wlup7EC2FV3GUmXAIGVUR58g1tEKT7s2/5DHlp6KBK6YoO9cVzOgmzhbcNW5tSp5x3IlGsu9qt5p+3XjxbBr0VW98PkkJkFjy2WXH3PC+tBRT4VSbNOusIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bfBaROnO; arc=fail smtp.client-ip=52.101.125.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bfBaROnO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hgsd7bIUjvzJPZZ8u5yeyGuagKWj1DQxDvoZq/61fgt+3mT2aU83pRPT0f7JFeiIuQ0lnXFe4MeBA8GQ8joWo5h9LtQmOvlh+bvEEEpoMKOY0Xh03B2VxCZEIe1q2QkIBY2CHw+Yg3QK+OmNA7kHAQESIIcahKZdvUaJtiMvEWMMrGAJb2vX80lSYlARAhtltaUa+cWc0LDe8VpitdRwYyBB9VJsA5rNNrCErtD2ycLXqxusJgWUjG9yjbKFDfmhTS/LVzanGz7BJIf+gZMbjc0SiiiVleNYJmU9OSgXBn6pHtRksLyyzSudBp95Ceu2rsPCLyGAv/2OE6Gtpz0k3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92R2Hhg8w5T8hO2sQ8cez0Rjn8kgLgHREgoMCWQ65ok=;
 b=HYVC3aUkFcH6YEIV80ZXBtKaY+WykJ9LUUGATEKAzNFlceWTwvUXJj9ZLM7McTYFAXT3WiyPNwHV97IOA3yIzn8IwP4IZc8SGQT6eiHN+PtXya2rBqDAdECAV8mxkZdN+NxMU/mV23OtZD4qSUETWXta8/CqIW105dmEM0bGujb8cbYHS0EFTPNnc8rNCg0ndQ9chO7ff0Jqa0jQw9iEFoVZ14Xzl+qFSrjaWBRPSsLABJ6HYYWy0ipo09Svz3BG2cCLLLeAC1GmRHNN5F94380TVaRUXilxFhli/EKpPmpkk/VLNylrrZrO1fDbMDRwqljsFHUX3xXctGwSe1vmOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92R2Hhg8w5T8hO2sQ8cez0Rjn8kgLgHREgoMCWQ65ok=;
 b=bfBaROnOeoem7O7Avr5BbagJAr0k6ko0+dGKa9lM4qzTN7OjUp3gNFAgshR2Ed27ljyENs8lg2EE37Uol5KFGPJ+5s4cyEWUrIC9BTlV3goZXOoBgFNUyJTXDSOpNE1+dWk/hb+SyO/CFfd1eJs9VIR5oe4o+uGAkWj636MrP2Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:07 +0000
Message-ID: <87y0pem7l2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 123/139] ASoC: codecs: wsa881x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:06 +0000
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: edd98c55-9f5f-4476-e571-08de0ad9ef13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZvVGjahZNU0/qFKeRO6aK8VA5QeI3/LrbMOE+Aqt1BshRPkmVbhss3hKIZjL?=
 =?us-ascii?Q?6dCxZ7So0P84mlP/PFBCt+2Mbbv8iiRwGKwhGyUIzFqEhEUJfKSCFaS9Wvtp?=
 =?us-ascii?Q?0X0OdOR/V2IVb/WXDK31E0BTxIJn4YAs7TixHFa82W7UVE6VJ64AaMU9K2ND?=
 =?us-ascii?Q?x0WjCTiRjbIn4A3qfPHL3w2SwRNEOMfDtWRkXeb4lqeHyLwxzKkRAViGLnAo?=
 =?us-ascii?Q?qw1QY84M0lujB8oncGxc43KtR1FOHSTkjOxDP9xUlE3xvYb7vRFhTobj0mQz?=
 =?us-ascii?Q?Dw1a8EnY63bKRnvmY3rcjxGu0rTJXgsPC5eZTTsjUl5eE6z5ywXTkGyn7PQP?=
 =?us-ascii?Q?q2zKC9iZPkTFVzkRquQtqE/2bZ+l/S+8XE1zLaISo1Fxa8kA3QHNA4okcdpl?=
 =?us-ascii?Q?h4aUMHBr/ervu76835QYRgErKKlhsd10Aay+KQTqrqRbDo5JlLSFtG4ziWE9?=
 =?us-ascii?Q?2dVwUfutp9IEzj9Yer/1/J+1J2I3spPtxKWk+sQTFUD115Z6ED89Zq8Vbrtj?=
 =?us-ascii?Q?hTFX6SXn1jbDFefPtdxQ+p2MVkUnIQjdBWF62eelKN4S/88qpwsfQsjESdLC?=
 =?us-ascii?Q?DxtdICaCFspDYGuubix1F57V3cjYx2y/VyNoJGnVHq5pYyhqn7WfqCDqrhzq?=
 =?us-ascii?Q?+9eGS1z4xZCkvyqBCrd3B8aUsmw09RqtKcqffACI3I9tdKXqT2S+/qDZP/j8?=
 =?us-ascii?Q?2VhEVPRKOTCvU41CpXQkw6RqprqF1g14oX1WdeBJwFE74h2dWxlxxovBK7ce?=
 =?us-ascii?Q?23M6l/6eGDDhTXSPAmdA6G7+0iT5jhEjwIBiiDdvCBec8t4gSZunbfvS2R6V?=
 =?us-ascii?Q?OQnvV+4C4Aqk14iBwWndKx9fTUxCZW7+nI9d1tzQuzY9LRDWQyWK+svqGJyJ?=
 =?us-ascii?Q?vq5kiOdm5jc0Y3h6L3xYavJjzIok/pDz9WpDAvqI1MTUOmiUAkFd77Jo+2sT?=
 =?us-ascii?Q?JgD8Lqy69qJe933QjsHTG1717EDbO6gSD9XpWQEosQTazilqN/NSEATY00hx?=
 =?us-ascii?Q?6k/mBiavgCw5KKa7F+FHVfyND6JwjrA4iuQy+RbTqz2XSOINU7xkk77GEdRv?=
 =?us-ascii?Q?z8fDhd022rBR9ocwr2hKmqP64zz3pYptQGOGB0Zyk+cid9pioB77V26Sj54o?=
 =?us-ascii?Q?veTmfhqeZ1Hd9ymrimacPuUtB4smZ1SrPaDjA387dti3zWMsRrssT2Cn91Mg?=
 =?us-ascii?Q?IOKcHVWJ2wglbIbud1NWYfc+NI3Spq0uK0f/WssehCtMAJSTRQKV28iq33yF?=
 =?us-ascii?Q?pMOfRc6nBFP2P/J/J0zpcUt+C3CnVk8NdoUURPZDSI8qxPPA7bftimDRe0d8?=
 =?us-ascii?Q?JZAhwmIMcot4JWrouOxuXLUC3MnnXZiO9rmj5zV8QYnf6zJQilVWB77v19fx?=
 =?us-ascii?Q?Dt5Pq+v/0GZgQtJ854y5cyq4mn2JX76HuUxI5tto1emd3SAVT3HuLJGeV16p?=
 =?us-ascii?Q?gS8MbyyroIp5nQJeUzVEkR/3RLZjJUWH3kldU/bb5Jmc9O4Uo4SS6BvezAMa?=
 =?us-ascii?Q?s9sCBEtTm6hKJiCZC+LNV792FshaEZwvTb+W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?d+VyR1hTaqlADESPB+HMBl0Jkb7aqD6RUhugtnyhm5HjxFGfOQXzqkASLKAa?=
 =?us-ascii?Q?XKIRGyMgDfeFWlMeanxY70DM7dRUQiCEIZNKoLH94GBGkVk8Wbcc4h9E2taZ?=
 =?us-ascii?Q?pxO9exIvU0R+g0zJlB8aqImdsg944KiFD1wA8e6sNdvE2gbw2jHFVXhtjhGC?=
 =?us-ascii?Q?0dPUHLw59ypG11v1rrTCniZ9goAIVv9mSzIIEll8gNKKjVkDfoyBGizfm0tE?=
 =?us-ascii?Q?UWDUu3kujEjHXUt65zsvtd4TSRcEe+EG6Scy41tpuNfJ4q0Bwg8lEinLsd0g?=
 =?us-ascii?Q?+2nfaFMMrK4JqAz3Xv8ImB/960NBBNan5wpOm/kQMAHOWG/HuQgrBvbqZJVI?=
 =?us-ascii?Q?A/+SBmW8pOe76b3nW5ovsn8KzyoXSe+EQL11GN45WRY8g3srUPie2nYI6URU?=
 =?us-ascii?Q?pM22XMbl3/gDjbqeX103JUrisqqW93rGPeVauILNrnxF0HILoLkWb5obUgs9?=
 =?us-ascii?Q?R6xs+ECwmbDTmua58N8s8qmWdx6cno9D7jZwRjiy8eed82fTSJILH5rkx4NZ?=
 =?us-ascii?Q?pxsAtBo0yi64LvYkNrN8QcnNV3r2eNHhjK4fzKHSGkdkMdDxBoA0DMJz3gtA?=
 =?us-ascii?Q?PoTdOSICbE5j62v0A6DpNE8ksItS/Ekl3dKalmqq6DQ1Bmr3ZOaXo4eUSvAG?=
 =?us-ascii?Q?afTjryd6iqooqXEUgNH2qSPWJ0iLyjAmcrU8HUNrSdoU5wvv5cQKVBRra5Z9?=
 =?us-ascii?Q?+I4AW9psZZyZBXfgLNtLOqitqOzGQosLPXkl1qNuvf3n6jaqPy5uk4/e095q?=
 =?us-ascii?Q?rKOSLJGQQGf2gfPsBPterXLyZDN3XV6KmPJc75oQ4pWUH8YjESuTCY8vWbyA?=
 =?us-ascii?Q?lqjC0E2k9dp4lYAOCQcR/SzHa2CrQ5djX0emtvwH0Vg9MOIJ9UegHw8Jg3lp?=
 =?us-ascii?Q?xZ87blGLtw77TXSC4KrEKzPBsF/xX1/pWlFZYvCnRGUjrh4eStsVWrWSlKLN?=
 =?us-ascii?Q?J/p2vLvTPJquKI72Y7JLEYnJm2dDv/tbQfBRJDGf9lyku/D239j8P3Z8M84a?=
 =?us-ascii?Q?Lc/7y6QB2ofj6/RMWNeTZXDG4ATswKkdgoSozZ7J+ZRRQuO6GcMR8uznD7GP?=
 =?us-ascii?Q?xoFTcDBgJ+VgdYAmmphhOcpKnzwSeZPqONAvND9z3zNMsPhpJW+65iVtBAOg?=
 =?us-ascii?Q?t/bvYXgECPPOdc5F6QXNMPmgqqGOKplWk7Euj5DBGBBXuOIhwb6wtCEh8er5?=
 =?us-ascii?Q?P1S2yhKts+VAeM1AJT+aynMH77vIRwJMzZscFMurcNHCu4Va8K4RcwznyW3e?=
 =?us-ascii?Q?HUUKtNO8y0t9Pq2U9maWsP3ktLu30RTWjqdu5/3TxxWe3LwfdQcTnaSu8JaX?=
 =?us-ascii?Q?mN77hsJPy6PNXwMWaMceQ6zRhnPJeUB+VC9W4/HPKoOrEmv7gl4u3BJVHpf5?=
 =?us-ascii?Q?B0EdJy2EO68kOK+WQascbMnbdBCy5ipo+hI0fyE1FD56YNTt7y2PLoFygPjF?=
 =?us-ascii?Q?KRf7480wz9e5sqQtquPSMvLP2CNvftWCwlyWG1F4Hm6Fiy3jorjJaG0/rYvP?=
 =?us-ascii?Q?YG2P0XMbWgI3N6cADe0sISounCT0ec+QbQul/Fw6vO8vcL6n1Jb1LEzpcmf0?=
 =?us-ascii?Q?BIK19yVSPEq4yXvUMcg09Zf9Bgqx9bKtRt/noRqdbw1a5+UEGszQBBVj6oSq?=
 =?us-ascii?Q?5KhQL2NqhPu8hg8Iag4Mc6A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edd98c55-9f5f-4476-e571-08de0ad9ef13
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:07.7865
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LfmeLPn4Yfw0TbCrEIAf273RyCbxKvkd2FJKBVL4BJXVs3LtRb+FgxTvu68Ksed90XD7+sqz5e1qgEGLHhf1FbSUaDJJlWdjFrt37CxAunlVc4znNMzsGH49CufTyCO8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10584

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
 sound/soc/codecs/wsa881x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wsa881x.c b/sound/soc/codecs/wsa881x.c
index 636e59abc3772..e249de7f91d91 100644
--- a/sound/soc/codecs/wsa881x.c
+++ b/sound/soc/codecs/wsa881x.c
@@ -738,7 +738,7 @@ static int wsa881x_component_probe(struct snd_soc_component *comp)
 static int wsa881x_put_pa_gain(struct snd_kcontrol *kc,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kc);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kc);
 	struct soc_mixer_control *mc =
 			(struct soc_mixer_control *)kc->private_value;
 	int max = mc->max;
@@ -783,7 +783,7 @@ static int wsa881x_put_pa_gain(struct snd_kcontrol *kc,
 static int wsa881x_get_port(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct wsa881x_priv *data = snd_soc_component_get_drvdata(comp);
 	struct soc_mixer_control *mixer =
 		(struct soc_mixer_control *)kcontrol->private_value;
@@ -815,7 +815,7 @@ static int wsa881x_boost_ctrl(struct snd_soc_component *comp, bool enable)
 static int wsa881x_set_port(struct snd_kcontrol *kcontrol,
 			    struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *comp = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *comp = snd_kcontrol_chip(kcontrol);
 	struct wsa881x_priv *data = snd_soc_component_get_drvdata(comp);
 	struct soc_mixer_control *mixer =
 		(struct soc_mixer_control *)kcontrol->private_value;
-- 
2.43.0

