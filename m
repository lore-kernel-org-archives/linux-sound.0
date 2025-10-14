Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011051.outbound.protection.outlook.com [52.101.125.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FBC630ACE8
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415950; cv=fail; b=ZPogT9K/W8X2Ph5uMtKKEXBomILRDQRF/EYtr4pTAD4ntcqFx6pvFqPWToDXWhI2RlXpWWGXUrxrdLZjWdrAV23zbzAMl1fLKZtEBwRiJWTTIJpgdPgCBOnHmf4RKjksP2MwpK0+93kZYGf/ltlbueEipilXe71KYGE//CQyFzQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415950; c=relaxed/simple;
	bh=Afy9N6pIDVejWSGpKax8zc+R7JQrHgR1heeGxZxwGeM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=IGAXHBGsZp3hebaQf4R+er4lL32FJiwjXjQ2B8ZfHtcoJkc9IabDOTK9f2zP34Z8cy57n+25AhW5Y4HLOvmMj/yHvqnUXqFUz35stPmHROWmIlqnaAndkakmDqhWNNKn/2xXLZWdSle7FCm3nW8/i8dZ/hica5AiC400qYyTYrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PVk0x/gm; arc=fail smtp.client-ip=52.101.125.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PVk0x/gm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KJeJlm5Yfbs6s1nYEybi/8MdajzK/i12oPRk7OPrCkRiVRJTaQiah8b7LULftZzXwAKfO53D3p7Dq3wEB5hNht+gRyK0Cq6npzmW2w/QnEZRVEOBwe1aIUWXiyEaQXk3gjYPGb08a97gPwwaZM4Nm3J48mc+ZKcRzrIon6IQ76Blcmtw1PEHZLdk4GiFfbwKKAoHizzJEhxUFn1P14//xxFHjYH+2PEuQtjOhVPeEdXQ6MVe8IFHedA3VZ/Z7Fc9MlrxfZRmTH5T+d/12gmj8I/vMaYe51GK5octSL5kJkEFnburisDCMWYG/2fQBdZSttizcteIRpLpDPadMMHxpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f337CSoby6+bbtLyAbk0Xty9nBw+ct2PmXnIpCaOPDI=;
 b=HihHOY/Hruz1flbjAluR0W8NHCD5PlImy3Zwuk8vxfzgs9ViI3PEqVlIXzFctG0d8idVhZ7fViyPHbIQEdxtW1BKQg8G6aA10kWGKUPRiaL9/ZwtW8R0j8X9msOwPCUGpwDm6KVRiBgA43Uokx3oql0/0wP9N0+06mM95JiNbM7BxBvQiK8FvssPlN8FsmFEFBI1oXv7OYlky1MNBgWuk85eXnIggpkqvHZfKWPtorKY2b/NnqArhAdmTqGbURuM17YfgShLDyZqGbU2g9SJ2ydSuN3m6THtyOMjUTT4SRb/r67OG8FLZxHLEpqhTgBN7CxT5UBgBhBalmp+ddUBrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f337CSoby6+bbtLyAbk0Xty9nBw+ct2PmXnIpCaOPDI=;
 b=PVk0x/gmGioiZ0ghjvPGSGngFW/PfGRjFyCSpZdjNupsDb1DN1lxTepJKtilLlxUapdHwlacjRxyqG68tGwnAaIrmjttHu7IolbzwiPtaxY0wYrqupfybjeawfz8IMKmHSmjNjiTEvSETL8YGSR1sy2OrMFP3i3DLOlJiByR1VU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:25:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:25:45 +0000
Message-ID: <87v7kinm7r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 100/139] ASoC: codecs: wm2000: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:25:45 +0000
X-ClientProxiedBy: TYCP286CA0038.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::9) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a34f66-be92-4e50-5e96-08de0ad9be8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KV73MrGH5DwhrPx0I4P9aKPhvTLbu2USJcfP4svrpN7y3qgH+KFqdibNaNPh?=
 =?us-ascii?Q?/u1jTgIO1O1me0S3WU6M3W4/nWZnDppitulXQXda8v0+b2xdrK52a5R9tj8o?=
 =?us-ascii?Q?iEogOeej8wJ3751iNBUPjfkCUGIyPtpiHEffzBzhTgZGi+ngsv6sXmOK1X7k?=
 =?us-ascii?Q?X6UBabc2SNJrU+L8CgJK2rtiWrfQts85vvvtUtMrtaQVaitUu9JDoC4ukVZD?=
 =?us-ascii?Q?bC+gv4Ykv3pwFc3/SXi19+BSTXlhqLXpy/pfMbMgFCIBXT7y8sZqvkMP3Uig?=
 =?us-ascii?Q?GbpEZbeojPyPIV/YAF+EjAl9oorjxxgpWsw11cZPvgUowY+2BYDbNbjivqs2?=
 =?us-ascii?Q?nM+0/uEknsisua4o2k1Q4opr1j509I03vAGoYnNGvYmG/gm1pTlE/SCih6SN?=
 =?us-ascii?Q?HFNvZmkH41oUmCKPVqOcauEwGTNKtXO+1XE8MJ9JYGV8E/YcrSJGIU15HdvB?=
 =?us-ascii?Q?L0YH2BUv97flbZmq+hnr6lKnKumBl+So12AriZx6ov0mlOfA5pfw6qns8l80?=
 =?us-ascii?Q?ye77nHrokoZ7fOhN5WxiBlbmzMpsqArr7KIOLwyl2L/XpgsSsD6TmW9QOEKO?=
 =?us-ascii?Q?ijfQkenVIdcQ+khzULz2N//fFIUfVZNrRuCwBF9SlY4xrbamVG7ZBqHVW/TN?=
 =?us-ascii?Q?rkD0u0MA9VKnP4Xl4nvahoZdDV2wo0Zd9tDukiy3VKUx6PP3nyT9mq5XUAW7?=
 =?us-ascii?Q?oidtYr99VpJ+IMsXGHPVPLHp+apL/Z83Rgk0qcvVh3iHeP/4/Tv23reFOQnq?=
 =?us-ascii?Q?Lxf0mOXpKhYxuinV36W4qXPUwfth3CxMH5biG5fF5LU2PYGKWdEUltDTQ201?=
 =?us-ascii?Q?pm2Cif0s1VjPRSaiA3jWzRkjXFXOHxBkhN+4fYkuYmcWuyGHdDOavRdsXNg3?=
 =?us-ascii?Q?aKp7k1SUuSsBjlqfG/6j5j3wZ7htuF+h/n8hi/mRUWGg/xi/P7nZ+ITzZP11?=
 =?us-ascii?Q?cTQ6VHZC3bxfmaSgubzSJlfSs8bW2VL8uGiB4MpB+C9hFXiK42/HJpFbk2yj?=
 =?us-ascii?Q?9Hy5fTQx8D+XVkUemRpb4Bh2SYMwzYrCyP13/rClRI24jy0SoNaD70pxzNV+?=
 =?us-ascii?Q?ZQDCbReEmkJN4vXZa7YKL3xEmzel8S6p/4+Xt9l0VwozCmqFe8eiNfNYWflk?=
 =?us-ascii?Q?YsJ3NjTQ65tEvLkKhShLKmM8MbPuYa2PEyYv2rM5gb/1ZMi3hrD7UFamgGIP?=
 =?us-ascii?Q?vlBJcR8d2MGri3t1FI0ZYsFVrY95olrBbIqG8vFfGc7sqvksLyK7U27kDgPu?=
 =?us-ascii?Q?MtEr4GU8QSoha3AmqVXBihZgWh0EyldhCIgrtEeNNxb3XpR4H89ttxvby2I6?=
 =?us-ascii?Q?Ef+njdPTVvIn/iPu+TDCWTNxWIQj/d11bOX8msmAGKrQmSC2z/TIR9Yypz/x?=
 =?us-ascii?Q?nAKv8HCnpeVtoLgCxoWhB6CAIpG1RhIEpFIRbn7g+bm2zrzS6Ev/c+pcUxlz?=
 =?us-ascii?Q?o+wxNTvHwZHjKDk2JecuweeSNsUGFpLaJD5+MevbfXfLgajHX3Yv/yL5BGnH?=
 =?us-ascii?Q?vdBF8qo43V926PsFkFfJxB8jDQGMb8hITUws?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?eo+kn5dxXysHMG0TkRwo5AWBe2Ur5XFK00Adc7giM3VBvWBGtTjUXxW0Df5L?=
 =?us-ascii?Q?RJW4NCC9mMRwznR7JydjTOoN3ddC3ORhQQOHjHruy40ZrarQXxbfzARhSWQB?=
 =?us-ascii?Q?NTVys+CGYnhpoyBAP5Upu08Cd1W97ZmYcIej4tcy2QMg+b3eUrs1u3Tb5n4l?=
 =?us-ascii?Q?pMs2bDz32Pvq4v9j3CPXRhJETk2mmUGBgm0NQ+PkUFo5L6ff4iljOoIX1xm4?=
 =?us-ascii?Q?cuGg3XxQTv5V72440hgeXhq0OaRUqPvPqNqApS6B6z8iUvN8HPjFdpUmuywK?=
 =?us-ascii?Q?RgxFl14wHfjrcBxXNA+C6zc9UwyXLki5UdpqUf6vDTy7pwMg2VXeIKEtGXsW?=
 =?us-ascii?Q?pxPB4X5Xh7Z9dfUsSoiDIRMl8N8XnuN177lPcZ392LnyCkqjehb5n1Fh+LzP?=
 =?us-ascii?Q?4zSPNxxG1ArTS5ebgB0b+ualtZt7UPq7+zxLE0Kf00TwIAlhKBKXyh8Kyvoo?=
 =?us-ascii?Q?wfM8VXRKv4nNQCq9r/y56yfZZpbi27v5wzQhv5NcdIeQZ7jNx1fCrZ5l6KjZ?=
 =?us-ascii?Q?MBhVbqcOi0W9rYhZvt47xCGvQJHYbyIi8IE/gvPkOVNN0Uq4XKmWQbMLagrb?=
 =?us-ascii?Q?OB39516wKLjmDoN9dHwRc+d3OuJzvoGZAUUKih8kw1e4Pdtwqn3Yp3cAlrSZ?=
 =?us-ascii?Q?OwskX/diZxVqaYN1L7Ayk4GLY6IOOvskQz7vxclgdfWwYvDHw7YPXc9ftQAt?=
 =?us-ascii?Q?Ls0LdWKxvpEDpgqW82xs8uQN57KE9xYoFHrwSsI0hfnr5OVR9E1QM4ijhxut?=
 =?us-ascii?Q?4df8a6tn227TaBB0lTasoPeCfgws3Gp5+IiISWMAibLcbWhE5sOuUM+l77XC?=
 =?us-ascii?Q?rVAqFx9XhkvpXddZAK7ggu7ji1jS+s7gbNTIV1ov5WG1b+hhlb2NmSgU5Qek?=
 =?us-ascii?Q?2Grucw7L8yUBXitqWuGeXVGI2C05lMlW00+5cLuwXXWDBoRKFpJPX5ocnGSY?=
 =?us-ascii?Q?rGebPt/l2iQ7IDv6aPyQh7WiJuRCS1AatXMBLNE6Jpy7dGO8N4wU/TSgUa2G?=
 =?us-ascii?Q?1N0NKGAjNqlBTP5zGA9rE9m9WvRU6sFUJQQcrKhXllradD77BNn8DLya8rs9?=
 =?us-ascii?Q?T+kwFA6msDdHGbVaQzlTrBZK7EHe66UY8aHNUn8vKLjKn5t+c04arond7Y30?=
 =?us-ascii?Q?QeonoiDiSJdh7iIrmlOLM8NjtnQ32MsylbxCK0yvF9xJEoEKI7PA2mYOrZ2F?=
 =?us-ascii?Q?nvp7Z8iUaKJf7mYmpBM3Gb09abvWjHX08ax0yHS+dBhryEBrmVIaovMcIcDw?=
 =?us-ascii?Q?3hpx8i4BpIN7/nirO5VdsHlEwY1FlskYFEkXLoBvB7e1kO9rgJrOmlCK+3Fv?=
 =?us-ascii?Q?v5mnmFK5vis33HjTPNyIOswvNcTGaRdN7Ya+76ALapgynwsXCzFMp9uxE2ak?=
 =?us-ascii?Q?0R6qwJMNMHM4pcdrrd98fgS873G0oXBTQniFqnNNAJesawbxuvNJMh0/AyMV?=
 =?us-ascii?Q?kQk0qlnCuyLBxT+Uz6oIgIfWPY3rEAb/W6eH9S9KnZjrOAu5iVNFsHDwhK1q?=
 =?us-ascii?Q?lx+pwnWNkrOv+eLk10ChUtEV77jao2JeE7cvsCv4nFiKXk6dstZJVRKv4X41?=
 =?us-ascii?Q?LBxNVgmS8iE/KR3TDrorijMyuXqGjy04N/Z9fuM7Zvl0mEt/TKFg5Oov71pj?=
 =?us-ascii?Q?1dgIkatkPxuJEOHTJmfd0cM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a34f66-be92-4e50-5e96-08de0ad9be8a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:25:45.5190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLNe2fQcJhJLMhTxOpxZJ+mvo/9pfaikE7GPKZkSEvkotAFmrK5ykXJFH5zmyOp0wSBNmQ+h4r/qDBbq0EJTkzyDAL46+NXOpqafEw+2DhmiyAK/FdErey+gFlhMUpGQ
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
 sound/soc/codecs/wm2000.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index a07a443ba1963..126be2a2a8f34 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -598,7 +598,7 @@ static int wm2000_anc_set_mode(struct wm2000_priv *wm2000)
 static int wm2000_anc_mode_get(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 
 	ucontrol->value.integer.value[0] = wm2000->anc_active;
@@ -609,7 +609,7 @@ static int wm2000_anc_mode_get(struct snd_kcontrol *kcontrol,
 static int wm2000_anc_mode_put(struct snd_kcontrol *kcontrol,
 			       struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int anc_active = ucontrol->value.integer.value[0];
 	int ret;
@@ -631,7 +631,7 @@ static int wm2000_anc_mode_put(struct snd_kcontrol *kcontrol,
 static int wm2000_speaker_get(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 
 	ucontrol->value.integer.value[0] = wm2000->spk_ena;
@@ -642,7 +642,7 @@ static int wm2000_speaker_get(struct snd_kcontrol *kcontrol,
 static int wm2000_speaker_put(struct snd_kcontrol *kcontrol,
 			      struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int val = ucontrol->value.integer.value[0];
 	int ret;
-- 
2.43.0

