Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010051.outbound.protection.outlook.com [52.101.228.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E9678F2E
	for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 04:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760415581; cv=fail; b=X8F5LZDkPkKyco1NnVSXh02w3d/OOeVyV2QGqczNGc5KKRt6mceuXnEh3zy7rqLiV6Rt9xmwUBMt3SaQaz+ZnkP40h7B6wCgsYTn5fsyhkubct+GKTh70kd2KvQ5xJAJ76K2i4SZ3tj8xLbB1znex6RyIHlNjYVTtpvgCKdpc4s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760415581; c=relaxed/simple;
	bh=a/qk8R0/NRJrCQfPK2w0RmVEO2NuEG/tYaozAYyKe8k=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=BGQFVjH9bL9hR7nM9v5InSBIzT1oNnDYYKzns4a0AZUhbFl0mBCuHTxak5yxEWCaJ+EKrnvZZ9vaWT+jcRlLTfoIV0Hrg9r884dPgiHDRdjKSjDhkc8KSC1EEU9bu1KsEMlE2/lrftVpBP3zbb1e5pJjCgPBYMD7XY6c3khJzDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=C7h6Utun; arc=fail smtp.client-ip=52.101.228.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="C7h6Utun"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XdKKE2dPCnecp7s9vJjkJPnRXSEoy3ZFL0v1CNibbGmUgWHDls22ElYOs+VQ+RN3bFp1rc2B84Kg39HpRn9yabkD63ETs6kqnJ6raM7qS7rUGraI/YGJWRhgyGfZe/GMUDGe2cwa6UO8Hq2LPK0jARl4B0wPij+emt7wyyShn7GYjyAUC42mkzvzxdyCA9P5Co3jVeKxOvfMetr4p+SrtbdbEhgJ/VOoTSbhR6w1EQT7AFBRk8GFeyBfAevDAd/1R0neSwb4smHw0zHJduCVAfDmC+KBJsEYc6BBDeo+7FXLJ4KLS/EUQ8xaPv5qxBQL847iK9KX2TiD+dginvC3+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ocXXK48H2P1wbjcdifYVEz+YIM0I+Y/7WbDzhjuPig=;
 b=sGnWQ8pCnjNyNnoG4v0Wz6LLywo2nGV6L0yjYHQtEEz4jdmhyJhzb0rV9kyAS6rOZQuMNIubGSS4RbgRXjo2MdrfzOBn0rRMO/99SMdcjLkZrvw1GjHs6J6BJ2PXHggRIG+AA+iSzj+JLu3pvqibYZcyFBMo4/I4CWY22FupjBJCnIPOYtoVmoxhnSbhnIwq7x3IxQPQsllwz8Nquv2JDu8G+nesrITSbY9pZJ5KKeCqNYmitPPt6WxJdWkYcM1xhQCvX+eN8Im2cXxBaTsU3moRI7exZwSWfdYcOu8kxAenaHyR7Pd9PDi59XF4H8y2WtraDfYgTzOkz7ZJCzxnqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ocXXK48H2P1wbjcdifYVEz+YIM0I+Y/7WbDzhjuPig=;
 b=C7h6UtunH1BttTH3MKAY94l/cLROEJ53MugvXm8XbCQ/5fBYAipVlXn7z11d7t5/XH8g2vbw8g0u5aEQyrgX/7RQU967NitNE2Z0gPFVbc70trrLY8AwR/rs+TZCXwpfRlMnPRuIoUlEReQpMAOCojTwSPJ/bu9nP+e1uglzoFk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13923.jpnprd01.prod.outlook.com
 (2603:1096:405:1fb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 04:19:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9228.005; Tue, 14 Oct 2025
 04:19:36 +0000
Message-ID: <87qzv6t8rr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 003/139] ASoC: codecs: 88pm860x: use snd_kcontrol_chip() instead of snd_soc_kcontrol_component()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
References: <87v7kit8sh.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 14 Oct 2025 04:19:36 +0000
X-ClientProxiedBy: TYWPR01CA0007.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13923:EE_
X-MS-Office365-Filtering-Correlation-Id: 74be4c1c-ed18-405f-6f4d-08de0ad8e2cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sCcpGOXaLJK1IY8qFJXGd3tZrUWqU2599VKw+o8NZH++aFfmtDkFiao/NrJy?=
 =?us-ascii?Q?Y5MZaJC2zZio92Hb2ymwd/AWiTuPKf3U6eDiETRDk+Fg4Xfmq4qYcjCH9nRY?=
 =?us-ascii?Q?BHo6XbzMjFT6FtXxXjCVPmkdJmBZqGsZzzMj4yL3x0DkQHcUCERL4/NQdVS6?=
 =?us-ascii?Q?1XC3X2c7RSyy47RlcV3VQwm9RgyVM5SPEiIzEy50XBerDkz6XLVGBa14uH8w?=
 =?us-ascii?Q?GaHJiqTaDi1LRXipzGBhPKaO46tUZBhRzwzrQ0pBKzf8KBeT1gcSWapxe1+4?=
 =?us-ascii?Q?XmBeZpJa2DfDlyjxAuFtIG1f+GHLIYudXILPZxjFUqN4Takl17Mg/U4DpMMX?=
 =?us-ascii?Q?kSy5mWs+2eullmQi9LDKzV6rpVjrAO4eZUPOE+4KJC0P674CLoWde1l9pf7S?=
 =?us-ascii?Q?21XgiJmEyCSs+aZC11E2KmAsTDbu8x0xjGfGumzwhOrAZx6rRaeEzNilgcOb?=
 =?us-ascii?Q?NCpb2tiRY/zOUetAavtFsS4GsGDGOXneSbvFyWSnA4PEJWpga010qf/p22w6?=
 =?us-ascii?Q?ImJnwAniUJ3qPRYc6jJVIMuUnPg9wShaQJ+fDR/CwoID3f27o57KVJmd/Bnz?=
 =?us-ascii?Q?kuLDiS5nDYLYebysFfQxW9GTDDyfjK8YIFFSwQi+wCT0mwySGhjnBPL2bCuZ?=
 =?us-ascii?Q?RUrlVqtMwPRLkwXNkYoE0EwyYW06U4ATCxmTreua/vut+/L0G+2PIiywz8eU?=
 =?us-ascii?Q?bZ8bpAccCzyqpfark0v3hZs4EzkPcIWanQBm3bJyU+RR4ArLFUV5f3gjWu6/?=
 =?us-ascii?Q?KheP2R95InL7fX6auoOb9H24kkY8oFHY74uBsLA2Xtkg+uNVoAH28czAweR8?=
 =?us-ascii?Q?Pb8av2mgd4sOEHRNtQdenFvNkBtJYDsJzQauDTT2OxkWBUpkFUoLdVhixYwk?=
 =?us-ascii?Q?jLZtawuQAzNKN7MOULH4tgDJoJ3CR/WRwautySVVZM26QUbZLqCTDmNJCSnq?=
 =?us-ascii?Q?21AKlhMoLI/JGmpuEJCDypOu13PVkR7hbakfJp76a+DfBVJM1sY0wULesHDR?=
 =?us-ascii?Q?NBoAzbkK9hiChLf6XdxQ1NE+Ajg27MakTqgj4SCDvXUcxz7BbVWq6RSyhWbi?=
 =?us-ascii?Q?+lwM23k52iEb4Cp3VCCv+pbekHgpTQsEwfVNchzeq5oAHgR8o2JGUl8m3XjP?=
 =?us-ascii?Q?N99zBNW1OvFPDR4ndLK2zV+mOVXXlGWJhiwYEJGjEtd0F/hhskFL/eA0w2DN?=
 =?us-ascii?Q?8dWoPrvJ8eH2PJXPELSvvxkiZNsLBAElWfT2wnoR1GO0xnTRQdwARyWsZYEF?=
 =?us-ascii?Q?GavngWG7Pyjxed2zDn1qUobxWES7m7BwSeQ5SofxCBpbPmSFa1xBXLHzcr33?=
 =?us-ascii?Q?0KF0Otf3504ixvD0Ai7a0u5dQ19g6Rdo+MJXJum7s0YS5nixefJ4Jbc/VMeA?=
 =?us-ascii?Q?x5JLDJwSXLU02zEjqlM1jv5/u9LeUiEkvJ5SlaQ669aW3iR13Y7G+C1IdUsq?=
 =?us-ascii?Q?yJivSJAhfBH04fTJCaBfiQ0j60v7wT4YJLoSqx4G4s9lEDqa0Tbi7LrdXDic?=
 =?us-ascii?Q?yOgmjeVeInLMAEg7745LxYOOUYoBP/K7kvMc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FQZdJ2aPzT8RHNDlbDwcDU2VdNQTqT4GDl9uXnYMSkE59yTiJDgkiq3WLZdd?=
 =?us-ascii?Q?weiss/GTU0nMav+j9gnSO0tlDjyIHWkRCVBaIvQsZKAmu4/4UMXMCAeR3FFU?=
 =?us-ascii?Q?JMYJOMpYaqDzNUSdFwxlsg3I+F/mO6eYoRW88kqbv8GCZT5Xw4csQT14Pho/?=
 =?us-ascii?Q?JZndP+7E5UDa+eoS2A38+jMpEYFNHkFnugAOa34Ew9i4EaOMuhiAkJUAgUpA?=
 =?us-ascii?Q?bY8Og1GDLhNkoHqOklXa9RBTGyzmOQsAs9lkMcLptDMJBj2VPCHcD+627h7x?=
 =?us-ascii?Q?YtxhP+Y0Lf15MGRkVVtOUYNphPsX0zpcYHIt/ON8oqBJu84vQ5wG1J3dfOOb?=
 =?us-ascii?Q?ziUFZRpTg2JBEEuKvtTdZT3eUInO/Z9iVrQ9cJkWUPWh2t2uapaOwmJ7jIhK?=
 =?us-ascii?Q?lQXS8dpoOLapU6zWFv6kvVlfLflPR1hm8NYgmoY0Ruz5TdC+JyhJ78zcbEy8?=
 =?us-ascii?Q?oQGkYcXLRht6pU/OxYT1j5yj7dM9d35wMLUjf0R+2iJ5RxaSs6ERXyksGQEB?=
 =?us-ascii?Q?VMCDw/OETCEx/xUCWqeGalcjaSXJNWDwm4uzMhFgRxNtLeArhZhDenRUWOxc?=
 =?us-ascii?Q?ftFChRfCoMbBPSwMD3jUBXeW1LkFCctNi6b7HGykWd0jf3cPIteTgwDSE6+a?=
 =?us-ascii?Q?O+XdV1hNUFIu/AspqOAkgINTu9YrHEpMC5BMhKWtZok88hWc0OixpYtnvWry?=
 =?us-ascii?Q?Mc0H4sa9uape+0CHD5/qnQzCbDVUeJX6qZIRLgb7HyGKEJLobYz6fhyn/zHS?=
 =?us-ascii?Q?RqKRqARj725Cw/cKPWaU4zM1fm31nhHA05Ne46PG1hC43V84lpFF5239k/1v?=
 =?us-ascii?Q?3qD9tlmKICUa7NJQP39dV6IoQ8pRu3Q4inbePnyow1iMKywAmOe6U4UWD/i6?=
 =?us-ascii?Q?Xcg010kSaC8B+akFBm3XDqQ4Utpbv98AMOwPGz1byTieNj0epW7vaLoRDomB?=
 =?us-ascii?Q?FRz0bO50CeVZgdfpsfe3TtnnfNv2DpPGTMsqTmg/FHQZTLx90CwuUnk+XPv8?=
 =?us-ascii?Q?WI/BicSYCj2uEbkQ+cxHE9QTI8qspUcN3scLTtjYY32tW/vL9RK58EpuSypR?=
 =?us-ascii?Q?08DCtujbUowwh9/Zae7oGh7V3tpuRrfsJumKZ5O7BAPzHvYfaDgefRW8Tszn?=
 =?us-ascii?Q?LCvjmVNp4whqdz0+pfZDMRfHizPa3P1ZORb8jRFue38dL31XBuqUkvlAw29G?=
 =?us-ascii?Q?pp9HHwNj/JcY4fvIW4T9Ue3f7wfnWkV4BtqC951M21QG6kBZWavRq7UAOgpa?=
 =?us-ascii?Q?BFYp/NCatQ2EeGXlAd+hVKP8ow3+jzNUfyziQaocp+tbaonOHiaAbPuYf2IZ?=
 =?us-ascii?Q?4JlHv55YIDS4Qrs43TKQ3cyvhzq53Qp292rLVvhE7xHKsZ+c154U6IhLGEsw?=
 =?us-ascii?Q?oYbJllK0sZIqPfiK87zGVfE84f3C1RLGOJOANlXZUQYiiGNZjq/z7ZHTpmVR?=
 =?us-ascii?Q?CHqRUAfYtA3N3V6/pIgSB9EU5nZ5z0/LqoEt2+H7473ohJiVH7QN3XeoHyWj?=
 =?us-ascii?Q?J4gzHqmLb7BCijxNwKkbdzh00JW5MCHDVu58KLl5V3IipVlOa9sYIioD4cZ2?=
 =?us-ascii?Q?8e8h4f5xx8RJX57RXgCaV1PbEGNuUg9SII6vUqGSG8LlglUJDib7YRFxoHuZ?=
 =?us-ascii?Q?C0PPFjQdL4PNsFREl3KP1Xc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74be4c1c-ed18-405f-6f4d-08de0ad8e2cf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 04:19:36.9015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +LMwBjfxdt2u0xJwKAgB5ApvsaFKF7vL1lAkG782r+9yuphAhQkaC1DQf0lRXZIX2lsqvioV3F3/3dm+u1miFFv7wHOQBPoNckSKc+Veh7dlFCn/nw6PuDrmPzDeXxCk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13923

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
 sound/soc/codecs/88pm860x-codec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/88pm860x-codec.c b/sound/soc/codecs/88pm860x-codec.c
index be01f09283937..58e35da2f85e2 100644
--- a/sound/soc/codecs/88pm860x-codec.c
+++ b/sound/soc/codecs/88pm860x-codec.c
@@ -269,7 +269,7 @@ static int snd_soc_get_volsw_2r_st(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg = mc->reg;
 	unsigned int reg2 = mc->rreg;
 	int val[2], val2[2], i;
@@ -293,7 +293,7 @@ static int snd_soc_put_volsw_2r_st(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg = mc->reg;
 	unsigned int reg2 = mc->rreg;
 	int err;
@@ -326,7 +326,7 @@ static int snd_soc_get_volsw_2r_out(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg = mc->reg;
 	unsigned int reg2 = mc->rreg;
 	unsigned int shift = mc->shift;
@@ -346,7 +346,7 @@ static int snd_soc_put_volsw_2r_out(struct snd_kcontrol *kcontrol,
 {
 	struct soc_mixer_control *mc =
 		(struct soc_mixer_control *)kcontrol->private_value;
-	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	unsigned int reg = mc->reg;
 	unsigned int reg2 = mc->rreg;
 	unsigned int shift = mc->shift;
-- 
2.43.0

