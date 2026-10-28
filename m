Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793156607;
	b=f65Q/K9w7Hn+jeCO/Aj2ycrw2IxcVdRhxssnygJAvNPGrepzCX30EG4uf7kfMwXt5K8E
	 qmrdw77uGqsQbO65IY/iWQ6LeUwaqesNg3Vmr6uDr9Vx1C+Gfu2nTDpFdXm0SO59Kv7Q5
	 NQFPB9HKILpSaUBdaZkEQZRxM6vIP0GVhhx9xxLI7HYS5LBCK3474Of9MW1c1s3FiFUMv
	 F6cZb7C0zBsnVD4UlC4L7v/FzbSU8vJ4qKLdUI/5G2opD/1NzpZTfuYTNnLbpxJsCr7u6
	 rcn00bppj4oM3xgvtd4v/+7txGZeBxzYbzi5SQGKMGnmz+ytoE3xnp5XbXUhwk42zDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793156607;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:
	 Subject:User-Agent:To:Cc:In-Reply-To:References:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=rFCL6Wqe/eTOC2qtDUfHygzGu2rki7a5tiu9FDzP0mE=;
	b=RRfKTMcNi4sX+fWFzoL/lEV4iBmkUnNb6Q7fj3EQ8nkfJwKGmHM3tB7HqbB5SafCRWfu
	 5EZ16Mlkhbo7O3MVQyX6Vlgv46a9BzEggaYlsG/BaQeCHF4LglqjqjjRWxmeKaUkt/pGS
	 dFPRJfPPaHJDmN2+ioSTtC7dtaz1SECcCDjzGDDAL9dxEbaeqmKtdYGhfRUlZhbM/OFf0
	 3Xmi9EreIWHWqN92eun53nhj9jvSigCuQIdIh339pXLBWULmlPbYC8UH0WKRq4YQzn8Jr
	 LBzn6OFvM8agvO/A2UoAWrn79imAxWqvFmb8fCM1YFg3YS/NJdzHoHW/R3rFhnHKJ2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=pdCOIhcO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.29
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011029.outbound.protection.outlook.com [40.107.74.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FC0606A31D
	for <linux-sound@vger.kernel.org>; Wed, 28 Oct 2026 03:03:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67FC0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=pdCOIhcO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TbCEqyt8GLbyfYRVjmGoTrptY+RJUnEOWh9nWNTGjiLSGcVyww7N+iXu0TDt4TQyP6sfHUR0G76GtoGimGbwCr61k48utSUI42opCKtwELAMgPS/lqzwjyjleW0X7MkOe/GKAUGg5bAa1GqhgY7iHqURtbgSiu7n4DcKtAviRA2UNh5b19ENTUuD1pgqV1SRYHIqRuE6b25LWiZ22ocArnuPe0txwhWzzuqb6Qz3/BIlSs/P6I/jJ5cvCc/daLBYkDlZUAOysSqfkkSnGpOi4LNWJjTPiS+kVp9iyTE5CuqyB2VqyJQIW1OYCpv1J9wSla6FmQyInzqGHFUD/Ub7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rFCL6Wqe/eTOC2qtDUfHygzGu2rki7a5tiu9FDzP0mE=;
 b=d+q3DEdbmlpz6Ozti78I16B5qnv/+acvEC5EC2mcESRy+ZWxXMubtgG7pPiXDs9LlyjTPU/3uqSvgcjUk9c3Q9x0Kf0jSPLIHWYRsVY0TYBQLp7mgQGeYmBD9OFoLHZLXxgf7udCCiZ4+0fnIvhzxjpb7jXRyqBWIeKtTA9eCzw4l91sb9xyjjp9Pb+2Ym9gjc9PgNRqczl7vz31i+8kaMMZALhxmQ7/kLIL0WZ7vUogaZvgyUI16vTOKgWjD3pFCO82hJBuBVYv/A3eYsiJUt6WaTNfRgSFDL1nO5EUioCueiCdWIMumsQ7geDbZ7BmhG9lUcdkm3ztM7jKq/KKlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFCL6Wqe/eTOC2qtDUfHygzGu2rki7a5tiu9FDzP0mE=;
 b=pdCOIhcOIhK1JXW/bif/r3irMbP+cXS7+8CNfDBAO21X+rN5QH8WREQS0IoUe2Xu/qQTLWOamkG5cNpKhFvc89gS6WT7bN5jf+ieS4YZA3FSUeK4Ej+Wm3inOzOVdgiGPJzAkWhRIMNjHAzABq4a9DKj51cNetBs6+rKiO8QUQQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYYPR01MB6650.jpnprd01.prod.outlook.com (2603:1096:400:e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Wed, 28 Oct
 2026 03:03:24 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%3]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 03:03:24 +0000
Message-ID: <875wymttl0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 04/15] ASoC: soc-card: move snd_soc_card_resume_init()
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
References: <87bj8etuj5.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 28 Oct 2026 03:03:24 +0000
X-ClientProxiedBy: TYCP286CA0065.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::6) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYYPR01MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: fd8c2798-d2b3-419f-18e9-08df34a007d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|52116014|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|56012099006|10067099003|261026140227099003|6133799003|18002099003|22082099003|38350700014|261026121527099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	fQorsbEk1tm2rg3XDndgQPBN7XNoGyclZUQAaT9lXPLpbG7XdB+7Rgq+IdnfwJsNlF/EflzHQ32Bha9oO/J7DffyV9ZSuw9uh64NlYLO8YvcweHpYq7SqL7a8gfD1z5tMWjfWifGP62f4gpD/oDD747wXXzofYAbdttxndLZYN5f46nE9AKxCHd69CgWIIIjm6iqPZDHb1mBYmvXg6rZ1wTzJr9jhhVwtByM/AdiujVlDSYbSDrk8QMxjgGUnHM+sBDzzY84iXVHIzS+j6XCNLWUyyRmFlAJEgvJFBoEMUe0Z3mC+sVn0FezYFur0BQNdj7HaBMU2pN8VxEDxtQjWBR1vjVexdKr9mw+ZvWinu5c0+aju7wiyRRLd2UA+wbyVZnxFXdhLwviVt/2cjCIak0mXNCqoOU2+Nytd9reyEeHbP1Qf9k8u8SeCd4Au07LfL6BrxXR1RCl84kIj51WVUPSv2TXT5ur7yoQW2uYhHzTTjwlekIhnNTeZEmBwIUnSFc5ZiIBZn0hDzn0523tKDa2EY5+XkvEHKjLt71+4AKW1Ujh3+ofUhoeRNB4dkIEqqAJfWLpir0A7DpCg5jDpLJJlSBaX63iQQ4YjgZgLyAXjIBCUy3oZ4UZozSKPg2DwrfzvUyhyyee4lBAaDGIiUhpXJv9EiuTMdP6oE5avBEiXO+xtRbx2n7Fpdxkr0JJUpij5Joau0lZZZb/2h8UItO2KF8s6nVULEWDOd2NcSk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(52116014)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(56012099006)(10067099003)(261026140227099003)(6133799003)(18002099003)(22082099003)(38350700014)(261026121527099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9BzoT5g3bjgUqNH4zSs3LNIdrBtIwxkcjCQqfGZ2VEik5vlyF2WPvHL28HEf?=
 =?us-ascii?Q?dX1r4f3WiXFdT7Yh405+dqW2xZ7L5u5Jgqhad2MNOdaqlY8tQS/WYYiGfWKx?=
 =?us-ascii?Q?3IFD0Xk/ouwHKrWbMoez6ksb9CplZO/vJG3StFzPVoZeXlqhwfidVgJFoE9M?=
 =?us-ascii?Q?AHK3VJztVEFvDoeFgiCIeYut+ik4FlGGkteEfUkvyYL99Fy8zFNubqtNy0Xn?=
 =?us-ascii?Q?R2ZnWK5C2n2Wy/wEX4cndtBv7p1lIiRrcHS99nhdGiHrK60/gC5Sw1WOxjQq?=
 =?us-ascii?Q?hMAOXZmeUNA+nBPeX9SL03jCd1wnDd6YS6QGcD6ZBGk1wnhF5qlnzM7yJiPf?=
 =?us-ascii?Q?vKAYAkNBINSN238JV7F+1pRmwPuYqPLsJ3KfiHth+brAPy2ydUsGzIk6G8SU?=
 =?us-ascii?Q?fU6Hvw8jzZC29RcQTaCi8dK731gkWangDGpwhDDwKR2LzTZVpyi6VWKo/72N?=
 =?us-ascii?Q?iz2yhvjhqAsZE3eW5wY+U74rbxmRc4ZzL4qzIHHWsSZZ7WFbjBf2LCjJ2AwE?=
 =?us-ascii?Q?X1HFyYsU179q7c1LKRpXcyuO4sRP+Dr5r08hrYKSCE+fsYk8f5zJDL4ReL+k?=
 =?us-ascii?Q?zcumpDvHezP7gbVUNFdPjg53pvPqcT4fFjF+hEM3ftyiqjuGTucW4QcyomMQ?=
 =?us-ascii?Q?uMStMLZsgSaIPmkI+BRClhpNPetnmkhO7i+Pt3cdUc5kKfFYMXacqZGl9x34?=
 =?us-ascii?Q?pdC/PfEhDdAC52K8p56UCEc8YyJEHsogmO8B0Gy//2P8x51tBJJjdbgXS6MN?=
 =?us-ascii?Q?ONPJ2rbR6f25e1peg2uXOvmdZgKp5m2SS88b1H7SEDo41ng6gsiS77ab2IfY?=
 =?us-ascii?Q?J6q6ttkn5yzbGXcX5H4peOq0dwKb2HhmBH6w4IfFlZCF/4bAiLd1CqSe2Taq?=
 =?us-ascii?Q?4EWHiRcy6xwgYN9aa3SUC3o44cUcubJKVVqUnrzsmJgbsW26Vn5KK23oudr0?=
 =?us-ascii?Q?3zWQ00a3rULFQXpljdPtW2Ui+6jAXBPCXow7jw2r1LU23xrSdo1YSORkE2Ip?=
 =?us-ascii?Q?iChmp+h5+joFzWq7BkgczllIung3V4t2HRpuM6BEqq/RgJfjwxm8Id7fB987?=
 =?us-ascii?Q?LVnFFNMdaDu2rhmv8dUqxLefnp28go0dmaR60FypMe9xLFNoAIFtJbAhQZ78?=
 =?us-ascii?Q?wV+mS0CyQrPtz8p6p93sB36MRjmhOG7BVZd0sQ120wRR+CO5Gx5U383mqv8p?=
 =?us-ascii?Q?pLYHbSLcWbZHgfhnVWpo4i57BQidhtK2YM2U3TsfKAS4Ke2IYptVEwyHUyl3?=
 =?us-ascii?Q?eovg0hkpgBR5zR+MUovz3Ii/sMdxgf5ILaFmmpSpEQIWU2kE4HuLJhQwZC4O?=
 =?us-ascii?Q?WR5/9mmt1EMbshAuhedko2WdhP1AV/C1I6VS2AgAke2eJSdyeGRbPiH9p5v7?=
 =?us-ascii?Q?ainPxkcekrSXmNnCNAraZ4h3njfqSHG8yhDI8war+qKsKh86F8C0+VHXrD14?=
 =?us-ascii?Q?aYcUWTABoeQRkTn9F8Xy5tLQzgRtqk4Fj39hLAulo1+CUy/zR90rlhoGOKc0?=
 =?us-ascii?Q?HC6O5T5Czqo/YIBwFSjjWWdPAEy8JxNlNApilRUfBZq90XsI78WLAsA2LDbU?=
 =?us-ascii?Q?ZhMJzpTjgeSoqJH8l1L7IAVWxA84vX66khJs12BRy3nlNTqYvC+72cRLnbpL?=
 =?us-ascii?Q?O4molMsBSNDmvOw1wkOndJgbJqaEv0pjUpS/is5rBgHpXNwvWVorRqgQAavE?=
 =?us-ascii?Q?XRMPmh7zE65xq/Zm7CVWItpbm7E8Zy2oogcJ9bIhnuz4qTaa63DqVDSrWzcT?=
 =?us-ascii?Q?hWNsfsCtKbGzDgSaD+fO4jLtEldKmcU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd8c2798-d2b3-419f-18e9-08df34a007d9
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 03:03:24.3107
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDeKblMZcen7aEUYKj7uYjwUCu6ts6gTWRlxfgkincIDY81b2ZkGhWVA3MdAvfH0Qi3mXe6bP49OIlU+C5xhq7S246/SSZ219NSfDEpmN4+eJ/0HMLY1DhbyRyctKWbk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6650

struct snd_soc_card will be capsuled soon, its member will not be
able to access from non soc-card.c.

It has too many local function dependencies.
This patch uses temporary funciton define at soc-internal.h. It will be
removed all funciton were moved.

It renames function name
-	void soc_resume_deferred
-	void soc_card_resume_init()
+	void snd_soc_card_resume_deferred
+	void snd_soc_card_resume_init()

Below functions are used on above functions. Add them at soc-internal.h

-	void soc_playback_digital_mute()
-	void soc_dapm_suspend_resume()
+	void snd_soc_playback_digital_mute()
+	void snd_soc_dapm_suspend_resume()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-card.c     | 55 ++++++++++++++++++++++++++++++++++++
 sound/soc/soc-core.c     | 61 ++++------------------------------------
 sound/soc/soc-internal.h |  5 ++++
 3 files changed, 65 insertions(+), 56 deletions(-)

diff --git a/sound/soc/soc-card.c b/sound/soc/soc-card.c
index 58aa75163045d..bccd47cc136e6 100644
--- a/sound/soc/soc-card.c
+++ b/sound/soc/soc-card.c
@@ -40,6 +40,61 @@ void snd_soc_card_debugfs_init(struct snd_soc_card *card) { }
 void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card) { }
 #endif /* CONFIG_DEBUG_FS */
 
+#ifdef CONFIG_PM_SLEEP
+/*
+ * deferred resume work, so resume can complete before we finished
+ * setting our codec back up, which can be very slow on I2C
+ */
+static void snd_soc_card_resume_deferred(struct work_struct *work)
+{
+	struct snd_soc_card *card =
+		container_of(work, struct snd_soc_card,
+			     deferred_resume_work);
+	struct snd_soc_component *component;
+
+	/*
+	 * our power state is still SNDRV_CTL_POWER_D3hot from suspend time,
+	 * so userspace apps are blocked from touching us
+	 */
+
+	dev_dbg(card->dev, "ASoC: starting resume work\n");
+
+	/* Bring us up into D2 so that DAPM starts enabling things */
+	snd_power_change_state(card->snd_card, SNDRV_CTL_POWER_D2);
+
+	snd_soc_card_resume_pre(card);
+
+	for_each_card_components(card, component) {
+		if (snd_soc_component_is_suspended(component))
+			snd_soc_component_resume(component);
+	}
+
+	snd_soc_dapm_suspend_resume(card, SND_SOC_DAPM_STREAM_RESUME);
+
+	/* unmute any active DACs */
+	snd_soc_playback_digital_mute(card, 0);
+
+	snd_soc_card_resume_post(card);
+
+	dev_dbg(card->dev, "ASoC: resume work completed\n");
+
+	/* Recheck all endpoints too, their state is affected by suspend */
+	snd_soc_dapm_mark_endpoints_dirty(card);
+	snd_soc_dapm_sync(snd_soc_card_to_dapm(card));
+
+	/* userspace can access us now we are back as we were before */
+	snd_power_change_state(card->snd_card, SNDRV_CTL_POWER_D0);
+}
+
+void snd_soc_card_resume_init(struct snd_soc_card *card)
+{
+	/* deferred resume work */
+	INIT_WORK(&card->deferred_resume_work, snd_soc_card_resume_deferred);
+}
+#else
+void snd_soc_card_resume_init(struct snd_soc_card *card) { }
+#endif /* CONFIG_PM_SLEEP */
+
 struct snd_kcontrol *snd_soc_card_get_kcontrol(struct snd_soc_card *soc_card,
 					       const char *name)
 {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 91e2eea30cb34..901fddbbe25e8 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -457,7 +457,7 @@ static void snd_soc_flush_all_delayed_work(struct snd_soc_card *card)
 }
 
 #ifdef CONFIG_PM_SLEEP
-static void soc_playback_digital_mute(struct snd_soc_card *card, int mute)
+void snd_soc_playback_digital_mute(struct snd_soc_card *card, int mute)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	struct snd_soc_dai *dai;
@@ -476,7 +476,7 @@ static void soc_playback_digital_mute(struct snd_soc_card *card, int mute)
 	}
 }
 
-static void soc_dapm_suspend_resume(struct snd_soc_card *card, int event)
+void snd_soc_dapm_suspend_resume(struct snd_soc_card *card, int event)
 {
 	struct snd_soc_pcm_runtime *rtd;
 	int stream;
@@ -513,7 +513,7 @@ int snd_soc_suspend(struct device *dev)
 	snd_power_change_state(card->snd_card, SNDRV_CTL_POWER_D3hot);
 
 	/* mute any active DACs */
-	soc_playback_digital_mute(card, 1);
+	snd_soc_playback_digital_mute(card, 1);
 
 	/* suspend all pcms */
 	for_each_card_rtds(card, rtd) {
@@ -528,7 +528,7 @@ int snd_soc_suspend(struct device *dev)
 	/* close any waiting streams */
 	snd_soc_flush_all_delayed_work(card);
 
-	soc_dapm_suspend_resume(card, SND_SOC_DAPM_STREAM_SUSPEND);
+	snd_soc_dapm_suspend_resume(card, SND_SOC_DAPM_STREAM_SUSPEND);
 
 	/* Recheck all endpoints too, their state is affected by suspend */
 	snd_soc_dapm_mark_endpoints_dirty(card);
@@ -589,51 +589,6 @@ int snd_soc_suspend(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_suspend);
 
-/*
- * deferred resume work, so resume can complete before we finished
- * setting our codec back up, which can be very slow on I2C
- */
-static void soc_resume_deferred(struct work_struct *work)
-{
-	struct snd_soc_card *card =
-			container_of(work, struct snd_soc_card,
-				     deferred_resume_work);
-	struct snd_soc_component *component;
-
-	/*
-	 * our power state is still SNDRV_CTL_POWER_D3hot from suspend time,
-	 * so userspace apps are blocked from touching us
-	 */
-
-	dev_dbg(card->dev, "ASoC: starting resume work\n");
-
-	/* Bring us up into D2 so that DAPM starts enabling things */
-	snd_power_change_state(card->snd_card, SNDRV_CTL_POWER_D2);
-
-	snd_soc_card_resume_pre(card);
-
-	for_each_card_components(card, component) {
-		if (snd_soc_component_is_suspended(component))
-			snd_soc_component_resume(component);
-	}
-
-	soc_dapm_suspend_resume(card, SND_SOC_DAPM_STREAM_RESUME);
-
-	/* unmute any active DACs */
-	soc_playback_digital_mute(card, 0);
-
-	snd_soc_card_resume_post(card);
-
-	dev_dbg(card->dev, "ASoC: resume work completed\n");
-
-	/* Recheck all endpoints too, their state is affected by suspend */
-	snd_soc_dapm_mark_endpoints_dirty(card);
-	snd_soc_dapm_sync(snd_soc_card_to_dapm(card));
-
-	/* userspace can access us now we are back as we were before */
-	snd_power_change_state(card->snd_card, SNDRV_CTL_POWER_D0);
-}
-
 /* powers up audio subsystem after a suspend */
 int snd_soc_resume(struct device *dev)
 {
@@ -657,15 +612,9 @@ int snd_soc_resume(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_resume);
 
-static void soc_resume_init(struct snd_soc_card *card)
-{
-	/* deferred resume work */
-	INIT_WORK(&card->deferred_resume_work, soc_resume_deferred);
-}
 #else
 #define snd_soc_suspend NULL
 #define snd_soc_resume NULL
-static inline void soc_resume_init(struct snd_soc_card *card) { }
 #endif
 
 struct of_phandle_args *snd_soc_copy_dai_args(struct device *dev,
@@ -1708,7 +1657,7 @@ static int snd_soc_bind_card(struct snd_soc_card *card)
 
 	snd_soc_card_debugfs_init(card);
 
-	soc_resume_init(card);
+	snd_soc_card_resume_init(card);
 
 	ret = snd_soc_dapm_new_controls(dapm, card->dapm_widgets,
 					card->num_dapm_widgets);
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 550fc1c7ef05f..3d3703e58711d 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -19,6 +19,7 @@
  */
 void snd_soc_card_debugfs_init(struct snd_soc_card *card);
 void snd_soc_card_debugfs_cleanup(struct snd_soc_card *card);
+void snd_soc_card_resume_init(struct snd_soc_card *card);
 
 /*
  * In soc-core
@@ -30,6 +31,10 @@ char *snd_soc_fmt_multiple_name(struct device *dev, struct snd_soc_dai_driver *d
 int snd_soc_add_controls(struct snd_card *card, struct device *dev,
 			 const struct snd_kcontrol_new *controls, int num_controls,
 			 const char *prefix, void *data);
+#ifdef CONFIG_PM_SLEEP
+void snd_soc_playback_digital_mute(struct snd_soc_card *card, int mute);
+void snd_soc_dapm_suspend_resume(struct snd_soc_card *card, int event);
+#endif
 
 /*
  * In soc-dai
-- 
2.53.0

