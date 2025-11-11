Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D422318FDAF
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820673; cv=fail; b=Bk88ufrOPsXKsaB7ypLhmZ12boNWIQpqCBlQTci7P+BDiNwCYrIMEHgl6qxqsE9id1VYiU/TFXCiqFx4bSNXBhQi6BhZyWMbh5OUtXy46BLd2j+655Gi1txSLT/hzRfCUw2rC95YkWvdDhufYWL0Yh/uNkVaD81UURYf9BrbBH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820673; c=relaxed/simple;
	bh=0pduOct0Spa5phtQrqQNSUxsqb+WSN8unevAB8geb8Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ahQnJ2tBFw+Y+ln+eVQnDVEs6G8bLO0k7IBSJZa0TB+iZ5mXUhsKxzqnJFL+vvtvzLBxRPfH7l/n82pZZmf7on7n2tpEKZ3cbQyKcQK2kgQN5nJy67PwUtXj4NJ6jGzxzV6TfCHNxgN8j7eERBcD5tnYUNr/AeVL0aHG3OqMQD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=mt9lyCmc; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="mt9lyCmc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XMKr+c+OUZ+RyRsJR0yfrfjf7/1FXOmkHDZO19NgCujk2hJOhBrPLowQYGXuxzPV/AZjBo8GuF1Ian822Kr6ENpsUBEarje4jUgPqXnG9DyWqjVh9JUoQGAAhtErU+1NhOOnhXmGJKW87XjJzPzpd/xidvRR9ckixxu1zeonQLS4PHFkhe2yBuCaMOVknPATgmaACQ4Hn4aNds4aSg1ZUrwHBgMNSsQLE7MsQtngYJ2GE6WAlUHtMRtNH60g2URBRvBa1nqPge1JxnnaJb9T35sQx9OeGDZsDYzYa+UgONiRW4UzXIPcs/GzcU+Sq85WF0px3ulPT+fmG3/Y5JpP6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxbJxj5z+d5z/JXWUXYGXx0moX5n1dVMtBMyFox79Rc=;
 b=AwqqVr74gS5AH35QL0pUq/id7Dh+kSaLFERoBABmm3Ha7EilReGTKKkd9dHKlVY8CpwE8vuVy/JprEMKR1RLIOMub381nyv1eRpN1GP7ESrPtp3z6xLt9FNYkIj0SywqZkBJrn4TxyRPRS87kt4vFb3fKIv1AFlFIYBBvVoMzPOmKcaqJquJa2EBnH1hoY5KGUAi6dcDCcsGBz3E+IHBAFtkDrz32KQQ5g6gXzmHX008KeDu1QSNW3ms6qJMYLx3N8lytc20H/RQt8PZ9+2jPUxmoKKzr2GDOLbOIwOOAwRR7Ug4k+pCOZjPuROS2sMHDhr/ES0Z/lJ9RlD+NPOyJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NxbJxj5z+d5z/JXWUXYGXx0moX5n1dVMtBMyFox79Rc=;
 b=mt9lyCmciYABBeYcrosJkhdtuXTzC+06/ieXlCnLlIzNYmf+EmJFKlrMFnl5IjxmsHVPRUdxz7QF1nZONEfwaVlbVteRWg9/BM83jqDg3UvZWNzU0a+WXYysdOBB4OZnFLE9yfgfkh3zE8wKUKxz5dOWYa54Y+puN2mNlUnQqLE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB16440.jpnprd01.prod.outlook.com
 (2603:1096:405:147::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.11; Tue, 11 Nov
 2025 00:24:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:24:29 +0000
Message-ID: <87cy5p4ds2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 099/292] ASoC: codecs: rt1011: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:24:29 +0000
X-ClientProxiedBy: TY4P301CA0078.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36f::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB16440:EE_
X-MS-Office365-Filtering-Correlation-Id: b704b275-9472-4a7e-ef61-08de20b8adda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VcjiZmL1mv8ZxfgeMYo34BPu61bDZfHMReooL5Xwl8lkiCgnkOKdi9Zdt7fE?=
 =?us-ascii?Q?pytjQR78MEvXfHjxBy5gs/X9Bn1Yc+47ghMb99Nu9koWMRUBt9Pb8VYGFS/t?=
 =?us-ascii?Q?WYytOSLFkthvK/KKzejtOkW51gv5zPqGlsSO2oRnUU0L56lM353o623dFDoD?=
 =?us-ascii?Q?3hQG8pTzt+QJXN6vD+eAtxhumzXhOAjI24fwSV+SZWU1xmn4eF5KrHuPfqOa?=
 =?us-ascii?Q?+aExigOBLU96WCH/5CLIoTVDZtu6R6gCkRUXAXW2bpm/5BR7sNR+OZhLSSyW?=
 =?us-ascii?Q?ufcYRVSvT62TtMPcmU48sXBX9/W2E8b1ZI6KuGM2q4iM4AFDYtjeO/CwJTKd?=
 =?us-ascii?Q?Hv72/n7yPVBUSzr5I4w/x65RVdlMYOVlBl6hl7sU30+ckkyin4Qrgeq3ewyJ?=
 =?us-ascii?Q?v3+ZuhsiWnBWVOAYD2ztsgCQ2LlsJxlgUfOyWwUBrKLc+rgfaEgu1ZifCYyS?=
 =?us-ascii?Q?VdOR/5RtHGycS0/33rQ9M0wuLepZexPKpfPVFpbXNu4EJ2/iYCHCcCH86LPK?=
 =?us-ascii?Q?DcIG/93l6CpKPZnTUm3sXHHk+BmFXViEQQfEiL6xNtLwc0wQ5XDXPndoaGq0?=
 =?us-ascii?Q?W7YjERoXcsZ1Z75k1VBNJ8m1iFQW5jHO97BjEHKNXp1xI+WgaUvwgjCzRuSy?=
 =?us-ascii?Q?AXzzr6lwOehL9h5xYGvpPTwlvm7iucDThbw0ICdYtaA7qaW7swsZBNV9Gtj8?=
 =?us-ascii?Q?i7Oxlrv5MVMKJcfa0IeqSp48gzShFfer70spbzcA6O6ZivktQBv55D7Utj1U?=
 =?us-ascii?Q?dXcwwvml1JITgIgYU4asfS4AM+Ij0wIFtLBdvBW4D7uwAIzIEc+bNf2G0Ner?=
 =?us-ascii?Q?OE51xSTXw5WBd1/kpnDnt6fKxqxpXYMSJOFDlZbJIyjQZksYf4FsP8YpKHZf?=
 =?us-ascii?Q?Du6Hs7aOQ4E6quFYRW0fVC6oDxsOUHUR5AvVMUBlpSDV45MHjzXtmLJw/mB7?=
 =?us-ascii?Q?7ERuvWrcEszo/AUYbwHd1oX6TwI0kNUv6G6darllLJbIhrudmiG0t5RtHFEa?=
 =?us-ascii?Q?81jxZVh9o16Jmkq9cuDrcxPVVhBUoef94WkaMbPj8keBW1hWwpQdyRJoZ2qg?=
 =?us-ascii?Q?mtOHsHfra7J3dGQipUysAAXA/RLkOIM0+i4LknqAa6HWw2ohtgLL3e+L6pDL?=
 =?us-ascii?Q?JZUFjZwdOc+c5qUtYCZnDtrw1u078wxxk21x/FdPi/TE344UzwodJtbXJpyN?=
 =?us-ascii?Q?h7jrGxg+J2vmxFiuypYyO5kukWwaq7+EaCzFxuwe75hPwnceAW4f3W9hcJLO?=
 =?us-ascii?Q?XTlGjLQWY6uxKwk5lscWOUOAhDaEaATahDGNhGlLs7CN6A2/kOeStV0fkNnL?=
 =?us-ascii?Q?MAOaZ986ly48YnKxc2Ny9MConWRkFdlctv+KXjZrjFeGvndIBzWIfxUvV/r0?=
 =?us-ascii?Q?fgpxGXyhFzp168HaxnZIDxzwf9kjHKh3rWqBu9kX+uDVQSSFpkQ/N0kLF6D0?=
 =?us-ascii?Q?ULDo5z8z43R111CBg1bz0Fnt6VgmNdTbarWlxorzXyp21mDURHHNxz4VssWX?=
 =?us-ascii?Q?1d+Yr7K3Jjmqt9P5o65Oxwi+MYDeMdJNgjpi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U8ZSqby7o4PQKwCejXfDMH/EiZoB3MuQZ0rK7BnsgZs1pw+gIKv43X3zGngZ?=
 =?us-ascii?Q?13JoDRl+qGB7WNQgK9Zfg0EQtXB9EETfDd5Aa1Y+q4jqLwZpqZElWsC1qwnL?=
 =?us-ascii?Q?L5+snFPfDoevK6dwSicZGmM3tzJrTfYEWnuGX2J9evw+i2G3VXB24CmUwI3p?=
 =?us-ascii?Q?sSvRFCC5JqODd1WY8XpEhS6W9oYqHaZDnZwZBGdv7hJ/Qlh5ogqd/WVoJoEy?=
 =?us-ascii?Q?muwg0JSnxFJ8ywD6fE2ax+SkcdA1gAV9gUmexMNMvqb4ZPg7xS6ZTI2N+wL6?=
 =?us-ascii?Q?nMyLkMnDUdv0Heb3fnmyMonfEv3uzW+G1UnR48BVwH4pAqmcLmPCuNXCeGrg?=
 =?us-ascii?Q?Uxc0wB4Zo40O/Ay0KVE9I6l1jAYLYkL0RMDWUOFcBw/rMctBHP1q7ft5GlgK?=
 =?us-ascii?Q?7QClycM5aE+1rR7KXiPaawFYnAWu9S6De3+2F1ws0Q3TTxixR7Xcb8jE09tm?=
 =?us-ascii?Q?eN1UDCkbRr5tHapGxY1OBL2dHrfLiPPFRlCziYSiMqaI2RGCD3z+5XrU9Sua?=
 =?us-ascii?Q?GmF0QZ80J0wAyvi2JryD+EyQci+RWCOC968SCovDv9tC6jtBla4WdVkpQumR?=
 =?us-ascii?Q?GU7TTn2gVxxy8HbwucZwX3rJw9XjvTDswHOqJTnSAKvodzmQ3ClIIuo8d19n?=
 =?us-ascii?Q?sEmmzxYz7kCBcVYbTKa2TCru3UBJC9ms52ntuMtF/mLmrz5TesEnvlv3ojGt?=
 =?us-ascii?Q?g6Dz06+4ml5IZ39sITDy59YL+XhAJVMIKkyObQ7QiTNitZwXXvUKROBAv2l4?=
 =?us-ascii?Q?bWMTFFmm557koWQVA5GaBMKMlOGb4TSEm1EQp69Fdi3WXC2mMRxYsrgVPBFH?=
 =?us-ascii?Q?jz552boSPo4NxAddIxHFS2DkImBOvokNkitmRHuB5Hjx6JelFwxDjaDHOux5?=
 =?us-ascii?Q?SjVfAyijSTToTwKV0O4ITp96kDUlRwFD9Lqtn/LdNTGkmOfBxBxYlX3QMibt?=
 =?us-ascii?Q?CWeqjR1P7vDxcxIbQ1I5i/QHmjje8fRRkcA2b6sbTjTVNEAlNr11pYlUC24M?=
 =?us-ascii?Q?DyL3MDAYHEXbEm3G0Ln5tS8o85rAE2q5ZrxmJG1jYHANyO5pikGkuBlXeSsN?=
 =?us-ascii?Q?SzgabM+65AhX0deIcBltPDFlzcRq7Z7qmapkTUm6MQEpMsqcEA5eGKq9+0UY?=
 =?us-ascii?Q?DrJabRphweJ+5Iu/mEke3mRQqi7eHZC1WiiGC10C6njUqyY5Ieb3MFWyoPlM?=
 =?us-ascii?Q?65kt2a7bFbDZZSG8srXLY7rqOhgxK7rHfr9iasr/kQx9HM/RqKBRGUltyA+Z?=
 =?us-ascii?Q?Wsd7545meXzulFgAIQMXZSjoeVNkCosx1uXcct6SzLHdvy/W2Y8BszDpm53z?=
 =?us-ascii?Q?IG09flyzlhvK52qC7L7ej7CXcV36VkFXLTkU28aVo21dqbrg/NY+283JOzui?=
 =?us-ascii?Q?SZiWCyI5K9d6PWQOrZAE3mKpSbviJqzmYZvlKqUXmOuoRsljskNggMkF2iUp?=
 =?us-ascii?Q?0Qd42bWYcyd6WtB/mmNOaHVNhvTpfkMN53A4dVlzZuFJEVt7zquLnqLYSehd?=
 =?us-ascii?Q?vTXZoSWy17mHw/0uj/3gMIloR8KX0xwlfQtWcWxakBHb7rQOWvCWeD54yfgy?=
 =?us-ascii?Q?n0h8h0rOs7Va043+ZEkiDsvjKlTNULlcRl2d1H7rdoIUNY5tSrRLUtGpIaaq?=
 =?us-ascii?Q?I1L/DNn9mm9X4txD6VRoT64=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b704b275-9472-4a7e-ef61-08de20b8adda
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:24:29.7023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLXeSlUnvCVZCmf51xq24phiwOmySrv6fTZnYcMsGbXgh4KMT8SgSCBsXaeRPpAon5kwNs8hmAPkXfJaXaXk+kxr9M80ChcoEPh7+v/Cb5Y2fSLQ0iiPSOhtkW+hVlep
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB16440

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1011.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/rt1011.c b/sound/soc/codecs/rt1011.c
index 170e257e6ddeb..9f34a6a354876 100644
--- a/sound/soc/codecs/rt1011.c
+++ b/sound/soc/codecs/rt1011.c
@@ -1047,13 +1047,14 @@ static int rt1011_recv_spk_mode_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_dapm_kcontrol_to_dapm(kcontrol);
 	struct rt1011_priv *rt1011 =
 		snd_soc_component_get_drvdata(component);
 
 	if (ucontrol->value.integer.value[0] == rt1011->recv_spk_mode)
 		return 0;
 
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+	if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 		rt1011->recv_spk_mode = ucontrol->value.integer.value[0];
 
 		if (rt1011->recv_spk_mode) {
@@ -1220,10 +1221,11 @@ static int rt1011_r0_cali_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt1011_priv *rt1011 = snd_soc_component_get_drvdata(component);
 
 	rt1011->cali_done = 0;
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF &&
+	if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF &&
 		ucontrol->value.integer.value[0])
 		rt1011_calibrate(rt1011, 1);
 
@@ -1260,6 +1262,7 @@ static int rt1011_r0_load_mode_put(struct snd_kcontrol *kcontrol,
 		struct snd_ctl_elem_value *ucontrol)
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct rt1011_priv *rt1011 = snd_soc_component_get_drvdata(component);
 	struct device *dev;
 	unsigned int r0_integer, r0_factor, format;
@@ -1271,7 +1274,7 @@ static int rt1011_r0_load_mode_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 
 	dev = regmap_get_device(rt1011->regmap);
-	if (snd_soc_component_get_bias_level(component) == SND_SOC_BIAS_OFF) {
+	if (snd_soc_dapm_get_bias_level(dapm) == SND_SOC_BIAS_OFF) {
 		rt1011->r0_reg = ucontrol->value.integer.value[0];
 
 		format = 2147483648U; /* 2^24 * 128 */
@@ -1658,8 +1661,7 @@ static int rt1011_hw_params(struct snd_pcm_substream *substream,
 static int rt1011_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 {
 	struct snd_soc_component *component = dai->component;
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	unsigned int reg_val = 0, reg_bclk_inv = 0;
 	int ret = 0;
 
@@ -1839,8 +1841,7 @@ static int rt1011_set_tdm_slot(struct snd_soc_dai *dai,
 	unsigned int tx_mask, unsigned int rx_mask, int slots, int slot_width)
 {
 	struct snd_soc_component *component = dai->component;
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	unsigned int val = 0, tdm_en = 0, rx_slotnum, tx_slotnum;
 	int ret = 0, first_bit, last_bit;
 
@@ -2212,8 +2213,7 @@ static int rt1011_calibrate(struct rt1011_priv *rt1011, unsigned char cali_flag)
 	unsigned int dc_offset;
 	unsigned int r0_integer, r0_factor, format;
 	struct device *dev = regmap_get_device(rt1011->regmap);
-	struct snd_soc_dapm_context *dapm =
-		snd_soc_component_get_dapm(rt1011->component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(rt1011->component);
 	int ret = 0;
 
 	snd_soc_dapm_mutex_lock(dapm);
-- 
2.43.0

