Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010003.outbound.protection.outlook.com [52.101.229.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5CD19D8A8
	for <linux-sound@vger.kernel.org>; Mon,  8 Sep 2025 02:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757297435; cv=fail; b=TmeUYUBOhJUSY/cugm0ql9F1BrduUut9LrJ8Haa8IkewxkyDfmcg2fSDhB22YUDB4M9UgdXrVmC0PEUnxWwzs199r3J7OvYxlhGHwL6ZwchSawyKk6CDwvZNUfXoo7e5Q0jgD9JPOmEw2LA+LBK7lDTqsgF74Btrjgp7EyuLQbM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757297435; c=relaxed/simple;
	bh=bnwRTNH9G6jfirzOXVdIo3bTzieoHdIdpfA/lu4MZIk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jANd8228dr4iYcbVZtNiMdjHKiqY0H6eHjcn2GxT/ZvuJ09UoqQ8z3gmP7H7IfTaqPKmVUDG6WTvZo2rbAur6tXWd7MuINyTXn+FeFtGWxzNMhOrvrKoiECz6BeV0OSvlllTkYeT6RdhKhGPqaLX/J+C4nXeFTBmVAuHmMvtv50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iDwTuFNJ; arc=fail smtp.client-ip=52.101.229.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iDwTuFNJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vD2kDEF1AszhRmw0S7HfZOeCelkxN1yojMlXKXupPZMTKN1HD0KuJlESrGqnmVLNJ4pWeNRtXctesvfH0pJxgfhF2BVnQ45nhpsDrj2WD4Owz6stb6OT5iJOiRhB8rcLkBsbveIOkwnSAqInQezRS87a1fJdXr6rf/IfMGaoz+cqpQ2nd/pH7I4PQUBeLItsZD0lGET74PV6EKuvsb99cdzQWxUd2S9adfh4QAuuRXM7dIVckSRbA8+tgMFe6Wsi/sNNJd2VzFE1UHXraXFujm/wRcZfQsskDStAK5q88IzzkFnlzNmgVD3x6y7alALB9C7kBe3ofsNTeWxrCzSoAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZOAAm7WqNd0AVIqN/e6oZErygOv7wkccQIkMCzjThnM=;
 b=qnRe0IMfHMV5+OxWfow8bWdxNeY8a+77It9pOUD09dR9am8pNT3E8+jRHGxTrNw8t9g2Ay25HSRzWmz+KaN3XOLuc29eogElR4DF5IHO+pJX+bjMbxq4I1aHktMdoQKqZ7f8tE6AIl9NIa2iwh+VI4mAbVWrSmgxoyBnu21IAKfxbC6+KkcBDqgwkStodN+B+HdJUc7QNPsWOKnufSpOSGdkFlqQur2L1T/85sPlH/XVq5K4OXKDkied9/cfzFwtJAZfCcYcyKm13yGTObWAplyQ6AlJVdab/fuHuiTwcawDaYPoXl1f4QHN7rB/17p6ZgtV2Y0PrXGmQDZWHamm3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZOAAm7WqNd0AVIqN/e6oZErygOv7wkccQIkMCzjThnM=;
 b=iDwTuFNJBiJnD4sZ6LzaybT9RYL25BEAydZ5PRF30d40jBUIJuoafkVOZZmT2aIpApBg3K6gfp2UNV3xMH46kmn3umRyk4kPhf+JME/4IQDLgybYp91/yUTurVsg+epLHQ9/nsIKfttMC/0DuehNJOa5EoHW23vMVLFuGqa6Az4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9666.jpnprd01.prod.outlook.com
 (2603:1096:400:228::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 02:10:31 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 02:10:31 +0000
Message-ID: <87frcx1yp5.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/4] ASoC: renesas: rz-ssi: Use guard() for spin locks
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87ldmp1ys6.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldmp1ys6.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 Sep 2025 02:10:31 +0000
X-ClientProxiedBy: TY4PR01CA0037.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9666:EE_
X-MS-Office365-Filtering-Correlation-Id: 33575a50-babd-4bc5-402b-08ddee7ce357
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?M5PaQPeRlYf8Fd5gSczCfm7w5sew04g2NYZmL81vr+zRTBcoI4cTn0dtyOIJ?=
 =?us-ascii?Q?SnTM8XYnnr2IQQnZYwUBJiqzwiOzGKtqQdevLTVzIAK4Mbd8uHJam0KQ4uQU?=
 =?us-ascii?Q?zp7eA6yL0h5OdKO0EkFOtWM+7pe7haQnzs6G9tJpiJdiULtb5lNrvOMZYins?=
 =?us-ascii?Q?aZ8i38/+CZKhnWuroVZ6UwrTi6fUV2ZMEXN7z9Mp2qQsCMTLUkBgLO6TnGVW?=
 =?us-ascii?Q?RAdgXYTbwfvwZBFyg0pHu1JDdWsGpnagVvoOs2ZoqY+xgvXnCiuJvQ+yjbVl?=
 =?us-ascii?Q?2WPhFd1/AdE67WmbicipWhmtJWr+MxKh28yo/odbAb66j+kI52IzmI/hJQ+4?=
 =?us-ascii?Q?miFjXWMLeKT9CVfWP5W2/x8nzJFJfUOOf1xne1oBCwZiO5ORCEDsIZM5DKNW?=
 =?us-ascii?Q?DIuVPtGcKBAM1iBwgku7nhtE8KBoJ8nFcEEnqxGiQspUNDfRKZnNvSmfuQjP?=
 =?us-ascii?Q?OLeYHgRh87rXJn2QZ5ZTV8ngGsU7OEAk7Z8Yza/FIBd1+/xaxpc3MzsOtoM1?=
 =?us-ascii?Q?gmeCwx+LqFZ7EnMiz/tN6CwpMeHXm3kQa4NZFtiXiyLdfYnky9lmenXKHT0t?=
 =?us-ascii?Q?b+l7MqD0y4uDBK92B+Q9PIQXKSlSur4yI7mGpLMms3zfM6rFk8kxu69LJLWs?=
 =?us-ascii?Q?bG+atOx0jIRFzEDMJ9ggYsEY9dOf6njamynCB/zMidVNL6wbHwVjyxxiUai0?=
 =?us-ascii?Q?NaLTOVxACqhw7sJfv7MgyeBBP8mEDX93wjv1MkwZsq4DUMQ+Yyjw8/NCGA+A?=
 =?us-ascii?Q?XsdmJpCOd0L5/2qJpDpkl2AGIjBOEnRkMdTOdCGbGAuFBHLwSSUnyOshmTtG?=
 =?us-ascii?Q?BL3iiYLUVYfYZNFBioXowoQmOY6JkVlQhYq1vqwnCnv7YtWNMgFwB6SM0AYQ?=
 =?us-ascii?Q?G5XkvfJMMkrghCj/KJ2ZTSmfcNApPSlTF/LkaNGRzZrCt4/ovATo53GjvGg+?=
 =?us-ascii?Q?ALUVJhvGCzO12rkbZecIBe5lwW4oanaO5d/d0r5LcmHJhsgJEBaETx1xmvJp?=
 =?us-ascii?Q?MSPzxlbeknlVf/DTaWh25U8OquA7w3SMkYs683grwRFu8R0GSijiFCMtNDuE?=
 =?us-ascii?Q?M8gSOEQOSOuVWZgNN4eUDkLjJYxgbflNIKjy7dqSlNRvDfXVEgAEYiq40WjI?=
 =?us-ascii?Q?RmU+xpE1NC6suqkDXZNtb4AeA699moZ1lniZ60vHisdQ4QTgUbjRVk/OvdPx?=
 =?us-ascii?Q?0wrxvhjxypCKInOlQBruDmpnYrK8KjViE5ZjV8XU8gMMVd6MrwfyDD1v2Zip?=
 =?us-ascii?Q?YBrzJ1nhJzjjcPfAhuMO6tCGShcEYq7whozHgXnRED51hZV9mgnznvUhZ0On?=
 =?us-ascii?Q?XdKrbOg7Owj9f/Z9ZrIJClFio3HI4A4R+QKQhHWAYR7je9oUbBtrSRSJrgs1?=
 =?us-ascii?Q?bcYqg8xccY8SiqRGEghtVFnSxjFsRSyHy6cRQEts25N3ZBKE7yBJNkiSlc6c?=
 =?us-ascii?Q?n/aYT2C9SiyEJC4ujIF1JgPjblyCoHAl6SgVuxE0+UlsgtDyByg+aw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NB+FQikRPzrx2EA05ebDUwcdifFw2n6dKzciNRHteqxDG7ESh/hhwVvHMGTC?=
 =?us-ascii?Q?fuhucgnREtYPPsvOOW4RA35G0GnbX9tOfuDFESndpUmIoWzSRtxVT6QJ2mi8?=
 =?us-ascii?Q?rvnS/DkPk4VQNpsgwspbKJfNCplJYo7q2rbnO56CibNDbIiJB683JoQssUlm?=
 =?us-ascii?Q?kOmBLzN39Ljx0c3nFp0+5ByuH+vr7YKBgKyQ4lbgNoz6nqoB+V6Tl8cPXwkf?=
 =?us-ascii?Q?LnjbmmTeIIe10MpLkqkYsvIrxIjwFdgKrUXZTOMCEcxXek0hcR1Z7HT9ifPt?=
 =?us-ascii?Q?1EvPyzJRe7ZJ9JxaZ/RPQAgs3113rzktIQiTxTI1gmaCF4hCpnbYbS+hF7Bz?=
 =?us-ascii?Q?I48sh8IaNfRhfmK0YB10Sds4mCA09sYmeCNWXjWrZMsRkb+dMA6ce2tmKj8C?=
 =?us-ascii?Q?qjemEk5nDtboH2O+rra0N/iFaJNNX/GoMMR5aJNO0bRtRpOVFBVYMcCF/qQW?=
 =?us-ascii?Q?ydHtD5oe8glCaBB6i7dj2mX3KuTGkPFpQV22E949q8Mc2DwVKGoLJ9juyPE2?=
 =?us-ascii?Q?ZB3d/OKVjiuO0GRZCoH2pElErHiBDfwca9tGTyO9Jnb1z1t/BpeyOPfUXjUc?=
 =?us-ascii?Q?201kqZvsDnnAsBV6XQ+XA0KuSLC0LY7eC//r6vA1oXdZWnUJ+LWeKiAyKLg3?=
 =?us-ascii?Q?WuqSEJ+x1rQFPqiUi1ddqg0qdNBXCX7XNd4BUL5IO5s72d99iX4q5CaKYZ26?=
 =?us-ascii?Q?fxWjDmQlTZRseR02LmliZonESK9z9o5zXofEpGRAMcyQwli2RCyajaUxxRL0?=
 =?us-ascii?Q?oIiWVtx0lHdk0VrCsXuq/dOQoVboAfsszr/xKjQ7j5gYUboyQEpeBaFh/5T5?=
 =?us-ascii?Q?ZIvdcMDabDs9Al0lOavBE02VcXGzAFGtu9QQFCOzaV8paWXqTY6b7/P1OPmq?=
 =?us-ascii?Q?5TMb98hj6lg/2JzgSXJYuhDCVfyU6XLgIATeIAif7OWcZ+9uuoXcdbZ1YgND?=
 =?us-ascii?Q?zzgLoJ5KfO9VNzsIR+2sBxQ1otQMKo4DXxngqxIrgXIRuE7H9gmQ+tbL+4Sj?=
 =?us-ascii?Q?V/4f3M3728aLVxlFKOToEwn7+Pqi/3nsD7nq5Elfpxhrns2FdJ7JjwQs6Wyz?=
 =?us-ascii?Q?992wWXP63C7IS01RpZtA1k/633BgQa1VdWqrvFy2AaqivQv2M2FcHJV4gEHh?=
 =?us-ascii?Q?lsbP0g1gMpgTUB93v3a7P5HsZiyQFD93hPrqdcGfdiiigFifn2TOiH3yu0tP?=
 =?us-ascii?Q?4SzXO9DMBixEFmFBdw0Z6KR0Mx8p27e+dFopSU9G1XvXTktKwkGxitUbAvrq?=
 =?us-ascii?Q?rvx++TD8BXyHpFzv1FgzHP6CFwliVgQEcJqqwr/c1u85wOTzLqa7239ez1UR?=
 =?us-ascii?Q?7a4lKzSPkDGRq/TeRfI3hTuDyfDDapbOjJRYaMOHADy8BBrcMy+aY9aqmbjH?=
 =?us-ascii?Q?ub0asjpKXEe1XWlIvRycj/OSDUip7wU5KFiLJDEIiAOav20ATUtq0ZWGwrrV?=
 =?us-ascii?Q?oGFjEqaBaTGQG38IsYvpjoxvICOsk2pZVLhQWKBvtUG+knoc0ktIe/jFD+F4?=
 =?us-ascii?Q?QD0pAk2+3/iOFpHHf1JfEeTNdf2fWdGyQwK7EF4agkj19bO14MuKKzYq+pLC?=
 =?us-ascii?Q?z7hN1OBwtDzZwaj1g6uDt8Ctfw94x/0G4TqGr4Hglo9zrpVsjpCi+VfrlEo5?=
 =?us-ascii?Q?IrzA15S2o0JaRYnodCOL9n0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33575a50-babd-4bc5-402b-08ddee7ce357
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 02:10:31.5261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GyHMN9TY4HACISrQgG5GfFPNW16l8xopOg2A1aN7kpexnUo8o/cqdJkZOn0R4bwO2qTHZiOPvLO1OTCePhcYkZCHCS8f0iUJWQmq6cqPpNEnIuXBLefXQebikdg7KaUk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9666

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rz-ssi.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/sound/soc/renesas/rz-ssi.c b/sound/soc/renesas/rz-ssi.c
index 0f7458a43901..e00940814157 100644
--- a/sound/soc/renesas/rz-ssi.c
+++ b/sound/soc/renesas/rz-ssi.c
@@ -188,24 +188,18 @@ static void rz_ssi_set_substream(struct rz_ssi_stream *strm,
 				 struct snd_pcm_substream *substream)
 {
 	struct rz_ssi_priv *ssi = strm->priv;
-	unsigned long flags;
 
-	spin_lock_irqsave(&ssi->lock, flags);
+	guard(spinlock_irqsave)(&ssi->lock);
+
 	strm->substream = substream;
-	spin_unlock_irqrestore(&ssi->lock, flags);
 }
 
 static bool rz_ssi_stream_is_valid(struct rz_ssi_priv *ssi,
 				   struct rz_ssi_stream *strm)
 {
-	unsigned long flags;
-	bool ret;
-
-	spin_lock_irqsave(&ssi->lock, flags);
-	ret = strm->substream && strm->substream->runtime;
-	spin_unlock_irqrestore(&ssi->lock, flags);
+	guard(spinlock_irqsave)(&ssi->lock);
 
-	return ret;
+	return strm->substream && strm->substream->runtime;
 }
 
 static inline bool rz_ssi_is_stream_running(struct rz_ssi_stream *strm)
-- 
2.43.0

