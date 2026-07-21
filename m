Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010033.outbound.protection.outlook.com [52.101.228.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4013EF658
	for <linux-sound@vger.kernel.org>; Tue, 21 Jul 2026 01:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784597787; cv=fail; b=BdrRYgi8pdonK5Y1/Ut4O1QNlQotHMaSWokHhZR0Z13pqjVryS37LSmBjmt2YAMUW8qjO1x+cz8ns0DC+p/OHhT0xtxc2Xaasi7djGeEBAgEziLfKA1u/Mq068cvAlT7rVKJTiH6dWySRnB2WBgW0rXOKleDu6DjQw4/eoA1+h0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784597787; c=relaxed/simple;
	bh=hStenPE+u2LhhiCWyXn6ivn8dRQYHnTe3Ydu7GkGz1k=;
	h=Message-ID:To:Cc:From:Subject:Content-Type:Date:MIME-Version; b=R5gepAO3b5LQO5CSbKudWAxaN5uuiAmKVA2/2AQHbu6qaLfaevQgol+deFmVp4rRzQKKCRBQMNVlnclr3iyc9Nri5HySY7/2NiMzrX06DMHNqJDgNFnVqxni7PiNk7twpZVoPK0zFy5nhGapVf2iRNEqISCeDULpFbY0bQxn1Uo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nDi7sS0F; arc=fail smtp.client-ip=52.101.228.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nDi7sS0F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bISPmJ3yPBp8TR3MNS72VujjhJqBuXgdTHhrh0R1BR5v7vEW+Ky56vKMW31to4hmpcWZqtQsEtPcS+/EkYJ8Kj7+OeLpNFAldh7h8CpSWJk1zCYWq+xY7UOFfaTQnuDNjW8ZtpQeNo+fBbRJOw+ClxNv/qe5tqtgqhaeKotw4XQHn5DLtQml1Jph/TISKMRH8CX+4oopNhVXnsfPpxqKhmSJM0DigS4mIkDkhQn+MJMR7oEW5y2AXH3a+7CE5TCGDxCuVZqdUApeNHwjdGVjThY45NvNMIqyEGlmGStr1XOnO1HJ7yjm13hfCDoIU+eWy27wVfZk+RdUrlV8p/klxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lOdC0p4G9k8473QE/ZetfqAp4Ko4XokajowOF/Vg3Ms=;
 b=fGP0Vt0lsmwZTDE9m30k8jFF6WShoTGYfL0YWu/zGHY2/gnmEpseBDoLr4WzHNs4o0JYZ1KHHm7zCZsPY0yaF3rvMbsn3mZ1cg+k/qm23CQHeY8Z36Fnf9V2XQjlQmcGbT4cb5pZlZbBINHZiYn8OrE/dqZAeo1KhsVfJ/LOTMFjWUu/6vc9OJGwMwmokyUxYkd2ia7duxJcrKSrAPTM7st74fmr1EYDGtH/fVlPJT6lUGAYvUSE/lC0w6p4r3em3zu1D5d/rnn7Xr8gfhXKUOwrVkZpBum181YcQ9cJCCiQV/fjmVDoVvXhoPXE0kKc+6t+xnBZuBOJRcLPVjfx9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOdC0p4G9k8473QE/ZetfqAp4Ko4XokajowOF/Vg3Ms=;
 b=nDi7sS0FxjYDSceHtDInAYQ7VaEemoHovBQ3Uf3NdeENwVHp7QIhsrLeDo0/BwGlhqV7RwcQKx8RIzWKTn9gmsqplhi5XG4oqRzTKi96/KFtwoYFNMJXHJlGbBl+MgNOWBbJ5ycuThj4iysD4aO62AByvzyTiTsY8Ywa3Dooe5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB7282.jpnprd01.prod.outlook.com (2603:1096:400:c7::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 01:36:24 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 01:36:24 +0000
Message-ID: <87v7a9i0o8.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/2] ASoC: meson: preparation for Card capsuling
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 21 Jul 2026 01:36:23 +0000
X-ClientProxiedBy: TYCP286CA0255.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::15) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c76b479-0784-4806-952b-08dee6c87986
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|7416014|376014|23010399003|366016|38350700014|6133799003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	VhyBbWNI4Mz+2Pa6QaWfV2rDafhd1OdfpCqKsfwAaDdhMcaHc9sFxEmOL9MW8PfO1LqUVjnr/H54AIgpE+N8tL7tg35QqebgND3cSqcvE9mgfUIbnRuEHjnf37YNYsRdvZmrRCh7rHdVyhFArJXEmKO/vlpODAySADgsaMEGUNuYjvAlDjjsyx6yw44eoCj3jGK3dzXIyP5tK6auSkU/DGkitd1L5XY0x+7hyzbv2tniTfAyWyrt8ba4GPEnVpQbHfJGYYZq2cm0HGobIQnmb/2vijcfc90XRMYPGSRFP3uzidhu6mTOsa10deUSmQLy8jmgz/kDTOI2913C6y2eF1Cw0XDJwaj3DlubSuvroaKlTSq2YlVIe0W7c+IQERmFyVLCbbDBlWND31iBfKbfmpzgEeW82ejg9SgbIativnjvJQhjwfFsurvXt8df4dWpop+XnJcsjKVRLOA30QmkqV21YpVEu8JQDgRWrRKMJlwtgtRnEQBlPGkedGDpicQ4TCqMHYjgEe7V3Et/Iwc8i68Ib87FWBFDEVTplvKf1ePzwyHiLGhnhMUNSwOV51O7d39FJuF4yiTjleL1p7rioqQTh1zSHXsoeYSPh9JDZ0RYKp8GyGWN/YrKhktKl3a0v4tn9H2gkk9kWn46AA4ZJ3ENoqAWzC+PRfxbDbduwVM/CXzFweDJggTkR/ozGScIGDsuloHNmex45gF1V3VfL3eqdH3i3mfgZVC5rgCA3+E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(23010399003)(366016)(38350700014)(6133799003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?01qreDVOg05DNBdSJ8e2J+K7DhTq4P3s1zkZ/jEu9KiBvBJ2X/RQJ0thGn91?=
 =?us-ascii?Q?VDvpT6O31CuHqQcIehB+fk8D34L7OC+GmM4bKAHdnm1ckPK2t/BRZ4O/FFea?=
 =?us-ascii?Q?WW/xPdseqSgpli78WXpkOlrvOwSc8YP1EAZxDvHhBMaLWd1MQlANXtVO4TmK?=
 =?us-ascii?Q?CkIbYIVaxBeY0miqc2t9WZnDxv3VgBy+AUEoE2fvRE6SsEQQYvngwbvJuqv/?=
 =?us-ascii?Q?QQwKFNBaxH2JOQNbJoP6uEQf1ggOAC13HuWdX9YEC+DDzFVJ1faYnfzyOUdF?=
 =?us-ascii?Q?zIQydOaGYVMKxrFxV7JIEeL24I1RLRpHITaX2fKK4vtsQ2Hd4VVfAsxvIAAz?=
 =?us-ascii?Q?sQHpdrvoVnyxHJqFCTT8Q8kB7gAuNkYC1ckQAr2mRPtfe7SXJLQ3ACqMfq4Y?=
 =?us-ascii?Q?zRXyqFdTD1T8S7fDE+xfCik0Htl8MGnI46wcIGugekyXGdrMD4VjZdFtneKt?=
 =?us-ascii?Q?A0bpI6UdObTMStF1y1elC3NUhyVSYrsO66XrzyDb0ZPTu+xFTdPztp8tEA8+?=
 =?us-ascii?Q?iSpHxHzlfS52YtX6bUfQma7vGjdWshfc1JlL9VnP4t0kq0raOyEBhqTpMpBp?=
 =?us-ascii?Q?TNJ7dHUv4cI2xssgFnbT9oBXKWLid1croZ8atIusJf05jHAT2Ke+ujzLiHD2?=
 =?us-ascii?Q?uwxy931aJktpzab5RHwudYoZfADW/4KpDSASK6amaR5Vova4EaAKmnPh/lpF?=
 =?us-ascii?Q?thcvNp5EJPFyLT/3WEKDVketzSCJwXOtVJzvlTCNdGlTyAdXvhZInv4TxF1Z?=
 =?us-ascii?Q?eumjct/y/BAYUdcwKmx6JqNv0Sk5KVdBHK1t0Q/h+Px5OsqI2NGM20oPdTii?=
 =?us-ascii?Q?mxxtPMmrKY2RM1YIdzUWrcoLeSChX7eLYbz+xA8+W7R/0DSh8Hpn/KgVjmcZ?=
 =?us-ascii?Q?xiIGnvEaZykqmHolsIBIlijGFB5Ic9MHofkO/4W7DEVqZhC2B4CTYP3kaKdW?=
 =?us-ascii?Q?MR2NHc9Sc7KXdbPlKR+lRJgLTbvocSPGJpy3SAdoFvMgOxe57WWW/FAPGksh?=
 =?us-ascii?Q?CSLNqB7PscVfMfb1mxljt2iZT9SFDmvyvWMPGS6JS4h/vh5wqOLaprYuKRK1?=
 =?us-ascii?Q?78uk2H0FHJRedMFGV+yMFNnvpSYrMtWfWbTPemv6e0xsQCkVFBpVhpTMpPMU?=
 =?us-ascii?Q?8+uPlKGy6gNHBKW1Xy0kxqGkRSJo7Xw0s3MUXfdUIqwbwyCXqw+12mjDToiz?=
 =?us-ascii?Q?ivNp27gWs2u6jjsShe6uvnl+Aaq2JLQHMKHv+mzlBwbqy+1BVRVZ2MIbK5L/?=
 =?us-ascii?Q?VygKdrENAhnuTQVtCs4KbIBdEAxnLgf3t5+SasobIfX0/EcbMLm1ZtGPX8Yu?=
 =?us-ascii?Q?JZbX2NJi0pmOdd5u8sslu+8lTlmy+brWM/KD0elApfl350Qa3PU+QJkMe7HV?=
 =?us-ascii?Q?G/TNexUP4cyUr6dIwHLTXq2607vvddpcIinBC46bSyAjBE97xJ2SAaY+FTdB?=
 =?us-ascii?Q?kkcEoIVxG3OTHh9rFF4f42QbNTRcY1JNMW5GdkWtlwJSpvZ3hYGViGJlmEBI?=
 =?us-ascii?Q?n3COeZnXMc/86jnw1N/0+gXui2rrXp6eSIPQPS0tg5v4ZA9Bu6eTwLyuAPoa?=
 =?us-ascii?Q?uCScavjdP23+gIWIOaiH1YqGWrrQRo5MWTxyZI6hk5y+gqNnJimfDeFiuO2y?=
 =?us-ascii?Q?sWXvg8YZ9sEY7MqWk7HN4fXHshNXWwtEKoAIHeAZjsTK54aB6NP5KEbbJJ0C?=
 =?us-ascii?Q?leFPSAgUfw2SaVJ0nrLmhQvnAFmb2P8mMwFSWLfvYHUxWg0iBdZrq8MO4390?=
 =?us-ascii?Q?NM9V3T2vvyQlV2qdBovOPBd6A+Qd6cPWdiT5V94nw4mug8tsl3pi?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c76b479-0784-4806-952b-08dee6c87986
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 01:36:24.1344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c17//45RRT1JWiQlul96NkFkG+PtEuCBgB7oZ+g875v8dSp34ThYwwcgUk7KB0EY1teIZ3eAxizin0BkWmKT3JoAPytRnbTc9bz3zvCD3dGwQcTkP0MKny8NfRcb59LF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB7282


Hi Meson developers

I will post Card capsuling patch.
To makes its review easy, tidyup meson drivers to reduce
un-related diff as preparation.
No functional change, but is preparation for cleanup driver.

[1/2] is RFC

Kuninori Morimoto (2):
  ASoC: meson: meson-card-utils: use meson_card_parse_of_optional()
  ASoC: meson: meson-card: use priv instead of card on each functions

 sound/soc/meson/axg-card.c         | 63 ++++++++++++++++--------------
 sound/soc/meson/gx-card.c          | 23 +++++------
 sound/soc/meson/meson-card-utils.c | 59 +++++++++++++++-------------
 sound/soc/meson/meson-card.h       | 11 +++---
 4 files changed, 83 insertions(+), 73 deletions(-)

-- 
2.53.0

