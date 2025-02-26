Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010000.outbound.protection.outlook.com [52.101.229.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C8A25FA29
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 23:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740612640; cv=fail; b=A5Q5Uuww1L9ymuWFLsRQ49Hzzh3gcqvLtGM5Oc/wxVJOZMcCQ4vtwBPr/o9ZWNNiivoNrHN8ydqJRmSxk6izilGa44EPAxUrWYidc/5Vt/UziII0aFnj4T/SI1H+21+T2JadFdEkOiJsehN2FEK/mB5nUD9x9ZAfJyMg7Q0DUvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740612640; c=relaxed/simple;
	bh=yeP+P0ZG14jV9JXJP09AleGC8WQlDZvtZ5bTfmRnhic=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=bI2C/S0TD5Atb82FZQeL+YQK1YBwDaWuD8OBApG2zj83WluFxrtojLKjsaARcO9djoLcKeO0v2pta4OidlKk/MOU9IRN3Kizqkq4Dp8SPQpF1BG5LFqFROg09gWWZ9fb7sgj0wTuGpAUQf4ZAg5Yx5jWQ7RvpwRZeGupPQ6Ya9g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Pw7d5Lk6; arc=fail smtp.client-ip=52.101.229.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Pw7d5Lk6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpL1edjXT2vSr12pBuCbev9DQV2YZEoPPjICpvWnZ/NX7A4XuUHfWypILzL2rp4xJOpsXFFqA45BG//nHwsAmokZwQ2hy9BxYP4EZaIKeIzZqeaoQb72A5n/EANunS1lTvRXget7cXIAzVi9dtgklHmqqGvngL/Wr8DHBkPxOKutYolSytkzw4BllWwqbtr70+4iqcdntuxugA8F2CSEaKo51yUYH2Ivwd9PYSFTzrVH0xXPFe9KmcyIPgx9flqdmY6xRdo/7yh29h+9v7Z20+GZml/BKWP9IIHx6tlx8iOInGRX948DeeBgiz9NXfnsCQWigNFEHET3M6oOts3u2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpWTazqGc9vQRBXfp/ScS7cS8mdP2xdoZa0eP7JZMzs=;
 b=etlzc7ghRzBbMvZVaFFtOq3KGHwxdD1FP3nbx7XGcE0510HEWGHE5wRS+NlGbRa3Yw+3SERqDgHxzO4ri4C5k8cBC8M6n28iQ5E0EVaMkgbPo9DGmJGneer8PglbyqK6exxQt+ah5o6IK/VWqAZixq3/mYTUedghZiqg1IligeH/LJP7lwRfb0nQtgSwmkdgSy9aeiLPWPFxHdyjvh7VlCM0X3VGsLWLprHXN9f66Lx4WGTfo+NEBSEvY+boJWhVd6ZVtHBnlCHI6V33J6pmxrH7SK4+Wpnn8lu4Wq7gES2Qwitpo9648YNJInbbT7+ziEIT96jldv4F2aomugwX3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpWTazqGc9vQRBXfp/ScS7cS8mdP2xdoZa0eP7JZMzs=;
 b=Pw7d5Lk6QXim9sBMAA+OCzPbqDxOpocP8YE+rtik2uH9MHqKiF7cV/L97q3g5vlIPUNcOeY5CB2RJn04RRdF9OCZVrts7w6+auP5/Dy0cs+vMz4EzWKM3BaGc9Gdc5YRpKiodXKu9vFr1NGJasm1GYFuvZfTOtNEfdwYZN3jxx8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB10345.jpnprd01.prod.outlook.com
 (2603:1096:400:249::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 23:30:36 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 23:30:36 +0000
Message-ID: <87bjuoqo6c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/2] ASoC: simple-card-utils fixups
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 23:30:36 +0000
X-ClientProxiedBy: TYCP286CA0111.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB10345:EE_
X-MS-Office365-Filtering-Correlation-Id: edb4abd9-9898-4dec-40e8-08dd56bd9277
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?smwsE3bcHZqhtY6kv/IjaUFXM178u8xdAsNSTUTwfRA5Q7H5TXqSldYM3o7X?=
 =?us-ascii?Q?UpYTenKCzjwAp0b/H/obh7vU4MDWpWvoopo6MJxqpUtJ90ibSvuCxkYItj8T?=
 =?us-ascii?Q?hJgCzzDIHzEQcDtoSpI4aR52vKA6m3tqMwzDILlnOdM+Yb6DY938VgVPsHYb?=
 =?us-ascii?Q?7njjDZbD6d6XMVyw6MdJtN3IYcO+LFxD4JGPB92RgM/LBWwEPZZgRqFK4pCx?=
 =?us-ascii?Q?Md6i+yxzLcBU4rvQ2HGK0nuVx/FBDzUHH+gwUqV6UPcgqXxiHVYSzy1KfUlv?=
 =?us-ascii?Q?scvvfoP1fI/eSc5Wce4nD2XLDs/7bkOf+dxDyUnQqjrT/Vo+yvzP0fKCaFXr?=
 =?us-ascii?Q?6QoH7YFBP9xRRbuAKj1duIWuob+DnUz0e8HZW5dJNRxsp7PK9nTW1x/whKqi?=
 =?us-ascii?Q?Vssue4BfB8qEf0BSmbdIUbqdiCR5T5c9pYvTO4LhIIguzOj9KyqolCg1zBfC?=
 =?us-ascii?Q?mbiRutlAe10Tjl3Hqujol3gBqDcFtYuLvBBqHSE4Ul+V8/Psojkxowr+3z6+?=
 =?us-ascii?Q?ymk4+7kfwuA9KLd3F8BaOmeeIFknTMUplnVfWFV7gRS+66UwX32zAfrv2OfN?=
 =?us-ascii?Q?/eqnCI9s85WGx1FNIVsgRn4b/A76bhimBDvcO2WsLa4LQc74G2Q2xan6qmv3?=
 =?us-ascii?Q?35SBVrGuqZcQToTPkwDyM7hE+ZPV26fBctZgcafug9l4Mm8Kutp5osl8Kpdk?=
 =?us-ascii?Q?PQ3kyQcItQIAgjteW0sT2wNLbjiO9AyIhFzUATORT+iQmeUb7K1aUHibX/Vm?=
 =?us-ascii?Q?lhvonIYnFAckKInkzOAHFgVWueaCTlWg2hc2PxMAhaZ7eJJlVcgOm1Em716o?=
 =?us-ascii?Q?1WikjeupGeKRE9iwYlD+GOpiRCH8upHaCUZ6Arm6vXpHifbQTYMRxE6g40IC?=
 =?us-ascii?Q?Y6hSWWT3x9TtViDi+QXRUPU6wrp/n+hu8HX5czkfKbFRDTiTSJX9QwuQNWVP?=
 =?us-ascii?Q?+XLzVck+70GlNxNJUHRlkhgb2X0r9NxBIdNqtf1H6E8LjtT2WAJtlJuaCuhN?=
 =?us-ascii?Q?2Iy1dBSug5NiSQRdTg6vXiM2QXItpxHVAE7nqHYbvUNkG6Kd7q9AVfDeLA2p?=
 =?us-ascii?Q?agBuHr8duhkLwB4hcnCg4zWKw7ugd8bAQSCA1vge3RdLNeoHMvW3r2MQwy75?=
 =?us-ascii?Q?cgKWAcQamRQjDgBY+XaSW+gJ967cy/Iqk5JsXC+QB6qTx/ByjU/gik4yYzCh?=
 =?us-ascii?Q?7pYQi7MoVLh1PkHXRtNlqcddOt1Wa4k6XXeMoBFSg7yphEufzfP3zmQIS9QP?=
 =?us-ascii?Q?Z3FqjXQpz2Fq87xBmXEh0o77t9tpnjOJQP+nJGwNpQUlGAYCaglWohXAOpZw?=
 =?us-ascii?Q?nssYW0A9Rlc6bTM4+3YVp/Z4+xeHb+7HRJ4VdJwwbARMs8i1OK8EXxVjn2g9?=
 =?us-ascii?Q?nlRofOMCkM9b9Lbjgq4Wccv7Fn9gUxNYjw+1RGsR6wMauui6Nrt785ftYT41?=
 =?us-ascii?Q?zYk1xvo/9k4xxS09WZg3Nu0B/ew7t8gv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7ZmsvYdyajg9yo2kmOF3128nJs4Scw9t3KmU3r76B+YgAUGpdnAb4IjzQ+1y?=
 =?us-ascii?Q?rvUgKtJv5jjZk30EQvMI/3ezlf+QjgjQwlcwifP8iuninNJs7r2rJmLol8W6?=
 =?us-ascii?Q?pXsHX5jhC2xNEE/7K3VdfHWxdb5CPRpiwaoQDbSZ344p9QxEjt51xSBfwclk?=
 =?us-ascii?Q?It2nRYpb7YB/jJ8ZE1laWsab66CiJp04Jn+tYFXyU8FwHCsHH0FFmFrXfELx?=
 =?us-ascii?Q?Z1wn826xi8/qbJ11VloGPnosKgEAs9C5Iuh6DULgSUoMYvqSzj7p2/VBaKlK?=
 =?us-ascii?Q?LVMNGpb72x4kjFtlThAk4r8EtBYtViP03QjNTsCnBUbhXurtPgPTVWXoZIG8?=
 =?us-ascii?Q?SUlaa7MKhtYEuyWOnOA3V9WExpktMVUmdDKPD/bykfRxa1ipavYqd+VS4J4v?=
 =?us-ascii?Q?GKn4Je3PSqb5fK6JI1+xBOK9U/FJVVwCh4PE8whaiuXCC71cMaG4CzzV59fc?=
 =?us-ascii?Q?8pmkovbzFySB+0t5TwcVWdhkYO7nBHo0BF4eaGhNPF2hPkci1/hrHIgVlU5W?=
 =?us-ascii?Q?6RaaFWKQxoKJzWRgnzAQ1vTwndjKFXJkeBlt81gtI8S1gxvhiKCpeIVfKkTR?=
 =?us-ascii?Q?1cBBWxvKz93rUXEqdGgr+ip6yxyXCfv3b8lR37nAAWzTmlHx7Hmq0xW/IH2F?=
 =?us-ascii?Q?5MV1f1HJSQBnI9B4yI3Qv2J2KCtRGz0R/Bi2ROGC/z9QDqVEmd/MDCwJfz6i?=
 =?us-ascii?Q?9zqFYG3DPWhYQVNOWAeZjQYXGx5Epp5jBflNKPcjpHe7jO6oIQfE22bK9Jvf?=
 =?us-ascii?Q?aiToO35HI/gx/KztkBBDtn4cwUxFKX0W9z0Lh+NXTeJCGepAZ5aiRZGoBSZG?=
 =?us-ascii?Q?e0ien9s0Imsn/zMWHLc1i5A5bWfaMDWLv2/eVaGYpoer8jdyWHp9F4kkdflt?=
 =?us-ascii?Q?GvyZBCL1Cy1heWuBivj6hn2qZ+uYIgRJTeoxWdGDoefFTQvPDxcVDuLMGJFt?=
 =?us-ascii?Q?vyDoSxcZTt7nYUlP8phQms/SwuDBRGa68thovbaT70/3QCkqhnWK1aOSNeTT?=
 =?us-ascii?Q?rsr61+w0b6XOVa66XOHtMC/zKMoeusKCuYkni+MwvwPu4yrtxxYlf5iWRBZY?=
 =?us-ascii?Q?Tf9AVuOYqD/Avi2SLVGU/Drg7wbugExLatICTUlwRI7x1keZ29f2hO0alW58?=
 =?us-ascii?Q?Ar0Y1uBgemncKEb/2aZuq83sz/Gm640ypjnh/C/xDwxnPPX+/oRiGoB1C/gH?=
 =?us-ascii?Q?RCOeTemMeIRV2GDozGzbk7kU+Ns32zOqflBL4pVEorA10QVP457FHXS04kKI?=
 =?us-ascii?Q?PH2G+6G7XKRi7vHNTL1JDsmUEXNXHsLAKVNmyZDj9y/Men//oxGtgEA/osaP?=
 =?us-ascii?Q?w0Y+44YqVepjFxb1dYkH+zJWKGcZ5oFJxheHh7WrZnl1uP0ymPmLBjlBXoyo?=
 =?us-ascii?Q?IMxZu1FxMeYdNvFWG0GI0ioaD/vq08Okc7ZyhGxBYgTUzYxkLPQL8t9hDehC?=
 =?us-ascii?Q?OP5UTtuQFHnvzPiM+pqkQp7werIxNyD7ZiCWVqVoB7w0jQlvI+IVBZsKxy2N?=
 =?us-ascii?Q?S4cUu9yOk/dEHZY0u4HJEEQsMgNbz+szstUTn3Cu4c3H7P+5NOW+1ilVIqZX?=
 =?us-ascii?Q?FW4eEvwG3elV4QFh1zBt7YCWbpBHrYGZh+ab+wKqxJyIaMUec5wNU/J9hKy1?=
 =?us-ascii?Q?3yD8mV8wG6+AiImGZI5ulvE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edb4abd9-9898-4dec-40e8-08dd56bd9277
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 23:30:36.3668
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zNa+m1/+uOxD4wPC/tolnJe6H5XPzHkABqtYGJ1x1kI3NzJgJ3KA15WVnTCCuLYr5Ku/5G/p1L8u1zELYLYu5vTEA+eIkZXkma7GtRHurVkXj/fmQvpdFoU2Wu38ky4a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10345


Hi Mark

linus/master includes my patch (419d1918105e) which uses __free() in
simple-card-utils. But because of it, it has of_node_put() count underrun
issue. [1/2] is needed for it.

[2/2] is just cleanup patch on top of it.

v1 -> v2
	- Separate patches

Kuninori Morimoto (2):
  ASoC: simple-card-utils: Don't use __free(device_node) at graph_util_parse_dai()
  ASoC: simple-card-utils: fixup dlc->xxx handling for error case

 sound/soc/generic/simple-card-utils.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

-- 
2.43.0





Thank you for your help !!

Best regards
---
Kuninori Morimoto
