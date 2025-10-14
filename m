Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011024.outbound.protection.outlook.com [40.107.74.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F7130AD10
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760416046; cv=fail; b=g94krC5cebQk9g0pdZFN1rTL8v5oOYtM0cowvqvF8JTGlF0DE/Y4pm33Yn/5nf6SG663kGHVDOK/Huhyt2lYMfSAJ2dY4Tmm/+VDxu/D6/fcG4zDN8EiN00t4exjAwTf6BKUecedX5iGmihAzG1Ah25jso/O7JxSD9RgxbMAz8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760416046; c=relaxed/simple;
	bh=gb+mPiKCCk0Xxk2RnK23Hrr6fTBJ91uBdSPf9jFY5QM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UMKFP1JFFIp21bQHqhAiNS7yGutiUzWH6V/xSdv/XbvSYJha83SPowURtBC8jVoU7WP9LRSjodJKmXo7k1IzCmz4a6yy+TAo8frDv1m3UD4m0hrcnd4QQcVabWYD/S4PeGSgQGp4bxHB02hDntELTKBcIGmOsrX5M/yWy6e0r3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=C4WlZVB8; arc=fail smtp.client-ip=40.107.74.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="C4WlZVB8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yt0Sj4wRLSRGQjRL9qQRTfGEiE/ki93x3NkAextV3XxFl0S4JlXbamkDIXoZGdrKwok13PRUcX7hywE8QPDAnja9yDi/BBNSzDO71qFjBSEVTiH37AnuIEt1KqlcME+g5JivOKfG7z89hJ4Qbv4gpTYLB3hGIRQtSnC9yFcsdtRRWYzDY0mjPgbZIEcGBOGvysDTq6eaNcp7hfW8qaihDQA3VSZbJ+WsagdcLY3jLJOSERtHBgBjvOoHcephxHIr1LdTox0HVeU79G/TW0z/sD6mPWnn6oI0M44pg5bMH3l92Fq1E5fa5mNUT/mtKtutyxNAr2WQgqk/WcEvVp8MvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e4mEtSJ+GZm2Jh7BWteJI7NEixhTbdwFd07s0LaDZg8=;
 b=Mn7o7M5g5umR0OVyxeTbXcXeBfZclqgHFkfSssPaf9T1YqxhT2pkhVvhbNMI2hNrWSgtjJ6wsFBIBjDVbeeYvd17111xN+2u9LrFreFkpw5Se5/RYwuQ0LtJDXQ7i+4WqjPdqhGZk/fe433xq1ATAzAtwMPMIfRUGnPjtq4f+efgiexnA2A3GkWGCgKzHWOxCynd9fqf+xOxrW8N7yttvTKMsyRp55nVxlSjqbBP6PE1HEWTim7Yf4RYjjdUdfUEMNorGun46UW4xagU7f2ZlakLbfye7tpgk6bvYDfrCZJwvT27uT3zNFL0sMA8phjdh5FC6t4GmVw4pbsQPrzoew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e4mEtSJ+GZm2Jh7BWteJI7NEixhTbdwFd07s0LaDZg8=;
 b=C4WlZVB8Q9cGi97gqeIeEdW/3b7HHgW36LFsqX3UQooDeBE7F35Q7GAH9cnQSAYNUMF1JXKw7y/pkZoO6w7eeAnpHjiBFufTmLOweLzY4q46legHaGSpxde+jeSpNfQw4SPLHbIICBdsF1a99JPqEAk/EOLe+1zg71/5JUvVlxE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10584.jpnprd01.prod.outlook.com
 (2603:1096:400:29e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:27:23 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:27:22 +0000
Message-ID: <87sefmm7kl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 127/139] ASoC: intel: atom: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:27:22 +0000
X-ClientProxiedBy: TYCP301CA0032.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:380::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10584:EE_
X-MS-Office365-Filtering-Correlation-Id: fafffa77-82ec-4f66-0a8b-08de0ad9f89f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6o9/yJR0NNxydMWQ1hoBnsPDGzSodXYbKtYbw5ZCba4Y7q371vo6GbUhN/X7?=
 =?us-ascii?Q?3w/nLgjaPtr/mlmghtSzpLnESlCgUij/w5DGyveQHaWv7jseLk+dvZsJ0rRT?=
 =?us-ascii?Q?tABB70bJi9pseTsrY/ujptz0hP5TivT8ucD5OmNLM6+8EwJWGvjyfgTjsuSF?=
 =?us-ascii?Q?pDvlL6WCmGGFeYfPvLw8/Iup3aATtzSmghQf61Nbd/cwI25nPH2ms3zgnmO5?=
 =?us-ascii?Q?zWdVsMebezGQv+t6a/1zJ50Yss7XmIRiBIUGSk9rRBxvGxXWugRcFa3FxD1X?=
 =?us-ascii?Q?wOvfnRzEaYvGXJBXYWI9lHNh2NIygWbuwbT04iMtO0J7kZH0ZTCoFKSL++2F?=
 =?us-ascii?Q?D5xJ2g/0Y44I4PBwEprqYIhb8PTkHWb5tWsid0O2tslHUEUw9feh/gt5HLdb?=
 =?us-ascii?Q?kesN7FHksfxDbejSzLUy9UCrLMJpEeQizB9V9Ax6D3nx3cUvp+8RbsshD/KV?=
 =?us-ascii?Q?F/XV2spC7SIJsQUQYUIVKTm2ngY436Bnr2YQsnp8Qk0BsavVZNZwQ2qZ0McS?=
 =?us-ascii?Q?aAppQKAPmJ9RZGIztqhgO9qz/Pe7K8c8WtvO8HDNwvSms5OjR5jaFQcvIecD?=
 =?us-ascii?Q?Ra0G2pmFSZdh1CGid7lVumlnZR6E/bIqztfB0CZYGyqaBJNM7BjoUcvToPL1?=
 =?us-ascii?Q?7/zXQhYcLxSM5a1oUjZxv0TZ7nO+j5XT4OXSOZ7LZJOXWSJmdW+Cyo26gRPg?=
 =?us-ascii?Q?cEbOVHEHy4jRwpmRM5L+No6boFBid4uDxC6B23xlSZP10OYDxv+5YkNWUrJB?=
 =?us-ascii?Q?InsdZaAdZI6SKbf88HwJZ44JzH7Q8nFB5Kj1hac9OP6IYW1suCZ92FXtpeAP?=
 =?us-ascii?Q?VCzCM37J/f9dSv9Cn6HBYuTiOicHn/OgrMheu5Dvu9czyGEnUu6qboLsRtIp?=
 =?us-ascii?Q?qZGMzKh033NmMDO+QdX/baly8Xtdx/SPHs+WLuCibYPiTI5cwKfusMiVy+y3?=
 =?us-ascii?Q?5z1Gjj1ovEusO04pqi5JqQsWNoRSFFgp0aLUXucuqEzDSfXbJ3h5C1WX3vUh?=
 =?us-ascii?Q?qGJo7ZaE6k2zK0MmfzJkf91b6lktPlFQEDkbAQuyD7yomvkAnTuI85mM7QAC?=
 =?us-ascii?Q?KaVj4kEeqT7q6nGGuXLfTgiywUWEEuHTVaHaTR8AFUmg1rI8iKkBYR8EgCBs?=
 =?us-ascii?Q?gFlP9e3HaeNTrtJy4nIpXziy1Xpf8UgOwBq827bwlZ7zcs89uNebRExLrBCY?=
 =?us-ascii?Q?ooE6AhlcKudYAoKX8ZeYUuWze3UXM7RgXvB1p95CBCKd517e/5Kg6tiALJzu?=
 =?us-ascii?Q?x2Ql0jJNO+V0WHzocJpbmmN14pWeKeNdgjjbQDB3j1GNAojADkiujzBbtHUZ?=
 =?us-ascii?Q?PiJKLLJ/8XxdVsiMv4XqqAUO5NnMh6viXhlPHCDdCPbxAxk43QEUb5y8Ih2r?=
 =?us-ascii?Q?BJxvIDnIUkVnT5fiiXjf0mSQWnTYDfBrK0ghxZGXBKRwWF6Eo+sq0eDohXZv?=
 =?us-ascii?Q?FrBL298bu6M9vx0FYcUyEFhIK39O9kA0k1qeEvGGwKIZkU5A+T7Zaer6osxX?=
 =?us-ascii?Q?1Vq9e81rgCvgTDsAgVN7cWvpPgirJHcgOocL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?okszf8NktKDYHSGpkfnuH+Cv3PPhnCapnPqKhpig1knv1Sm+9SrQ5qwtaxSg?=
 =?us-ascii?Q?z6OLCqc2mGKzNBxbPq34aYnxIxC+yhcTX7qSHBQGuSzbaUIHxZY5mck+BEZh?=
 =?us-ascii?Q?3omrVvYqPDf1rSbbmUqB+GIJ9Qm7qjDYOOgahTyLg2x1jF7khFxbZZfgmecG?=
 =?us-ascii?Q?TnCGzGCWWKyU8srPzV0d2OXa3NsEIE8V+C9KOQ29c3ZnPwq//xSpgpQJ/i/p?=
 =?us-ascii?Q?G345+svjNJAtgNvhB2g14OPqO3AhgDlMUgKVa0UvyfudQQp10xBDdDV+2Y+Y?=
 =?us-ascii?Q?ANY6vOstiOmMu1+eSV1gBOjsmWHMVzlKqjE8YlwB42wiODk71VMxESjSC3do?=
 =?us-ascii?Q?3ka04uyw2WnJj1zKNRIL9zIIGz2IMaMYn/jEsn8mEnYdmq3j5dYlM7wrs6py?=
 =?us-ascii?Q?YMp6fR7gPBgvDG7Kuyma2cCW47f/nxtIFsJWtc4UVq33x3GysnozFU5tGfLT?=
 =?us-ascii?Q?m0DlfIb/wvTqlvvT1lSjtbivVAgDE/gZL/SgfZcBbiqcsDJ4O8k90WyTkRJd?=
 =?us-ascii?Q?Q0UG4nQ/7ljYZKAXChrUT3tcEdTX8k6x9180EAbhVk961QRv2lB2wIm769Fg?=
 =?us-ascii?Q?l02n4a9Vy13SF/iFivyWJ3JGiXfbLYroSIfT9Fu+6G7JXWz9lqot8Bn++/G0?=
 =?us-ascii?Q?6bl4koTvISDwDu5XyfTdTm16Cv5GI263RmjfjOvaArirWN3cSMoVfD62NmX9?=
 =?us-ascii?Q?TL1zpudODZxfE1li7zr7GZggbT/Ehq5qKtvydYJXwyfEYToZWyDScRcyDl9Z?=
 =?us-ascii?Q?k6pdIwMuJ7PPTIMwShNgzX9N3qbYZxskMsfRQrxd2Qkfqz9OzM/jOD5UdQez?=
 =?us-ascii?Q?I8VsRxv8u3QgKOxnCOBmIPtPq5w56SUyEaa+NpJmAQPf3eZ1uYZjzYyU3vIA?=
 =?us-ascii?Q?MG+HBqViigPTLVoOH0AqiapyL5BGRrGDJ82z7qOT+/Xh+1pGGBe0ZzkW8ZDA?=
 =?us-ascii?Q?f6njNBPUdeDyI5xgad017zL8x2D6S7F+ARRQG8Im8CFYyuDHizgSqsyNXXfv?=
 =?us-ascii?Q?KAGmMqDRNep4lTZxzOY/2ka+akvnOIf9Cjp5EHesQDOG63ctdhIwwLLB3W+s?=
 =?us-ascii?Q?Xvk0gpr1T9e5Y82oG2JgHRYanWMT8/dh+w26Ff1JoG7fidC/Xq8BmOV1rsfZ?=
 =?us-ascii?Q?+mzzfB6I5Fm3d1rJ9WPi74WeeyLY/A/PIU8NDpX2/24xE1NLZT//9QgW5fw/?=
 =?us-ascii?Q?Fx/2OiWIpyJnu/KCaJ2gQKRPEGf+FX5SpAF09uGIYX7QHjyFd4gQYxU5aucU?=
 =?us-ascii?Q?2AjIqrvnXh+0DjMw13moGmbkAofcoAHUdz/JqDh4D6dK5e1R4PlxSg/yHhi4?=
 =?us-ascii?Q?nPT4ycF+jCGLJN7/ESlpQwxVospuKSCzokuYT0SI5tY3tPajskL82wFuFAhJ?=
 =?us-ascii?Q?KvNOzNfyaL1keV0gX/vKwW4btyfGP1cCZQvN9i4agmUHz/R8WrgtmfdDSifR?=
 =?us-ascii?Q?aBHVHlszzN2E/+p0Y8oKM8Wk09LOylZQ/a94AMq6evDPhD7I/QQQVqW8AqgP?=
 =?us-ascii?Q?63oD1Bn8WGCP1bNC/iy2FeF+reMzqbbwVw3rau9sdXK1zIqzdp26oLgOX5WG?=
 =?us-ascii?Q?YwWVktZ93ngHkIU7oPhz9JdWrVu1nzIcQLgstJwoWPCi+6hB6OetAR0JKw/s?=
 =?us-ascii?Q?sjgAY4ZpXkDQD7Xj4NEQgOg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fafffa77-82ec-4f66-0a8b-08de0ad9f89f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:27:22.9377
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ufybMAg2YdoZ3uUxYDX6Q9lhY5yBi9A+0mKOYFn7VBacSJMI3AjU/La+TebFosHYVYENEmjnC/qWK3NSij4d61GRR6x4RC8PKDkX+5W1+zyZOEP2xwTJaU8xMjDxTRs
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
 sound/soc/intel/atom/sst-atom-controls.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/intel/atom/sst-atom-controls.c b/sound/soc/intel/atom/sst-atom-controls.c
index 38116c7587174..c68965f152e8a 100644
--- a/sound/soc/intel/atom/sst-atom-controls.c
+++ b/sound/soc/intel/atom/sst-atom-controls.c
@@ -218,7 +218,7 @@ static int sst_check_and_send_slot_map(struct sst_data *drv, struct snd_kcontrol
 static int sst_slot_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
-	struct snd_soc_component *c = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *c = snd_kcontrol_chip(kcontrol);
 	struct sst_data *drv = snd_soc_component_get_drvdata(c);
 	struct sst_enum *e = (void *)kcontrol->private_value;
 	int i, ret = 0;
@@ -349,7 +349,7 @@ static int sst_algo_control_set(struct snd_kcontrol *kcontrol,
 				struct snd_ctl_elem_value *ucontrol)
 {
 	int ret = 0;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct sst_data *drv = snd_soc_component_get_drvdata(cmpnt);
 	struct sst_algo_control *bc = (void *)kcontrol->private_value;
 
@@ -470,7 +470,7 @@ static int sst_gain_put(struct snd_kcontrol *kcontrol,
 			struct snd_ctl_elem_value *ucontrol)
 {
 	int ret = 0;
-	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *cmpnt = snd_kcontrol_chip(kcontrol);
 	struct sst_data *drv = snd_soc_component_get_drvdata(cmpnt);
 	struct sst_gain_mixer_control *mc = (void *)kcontrol->private_value;
 	struct sst_gain_value *gv = mc->gain_val;
-- 
2.43.0

