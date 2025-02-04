Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406BA537E5
	for <linux-sound@vger.kernel.org>; Tue,  4 Feb 2025 01:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738633290; cv=fail; b=sIkIhIUhz/dl0Kh0idra/MTh7czFCssUF15qAaxDrHwK5Y/Fd+bgsTawrwOMMr6eaxh2obtjA3r/4KFxQpkX8V5Kxi6xGErogNFAOgj/9GHHEeVsGJ7SBdYYDjudiPgyjIzjQJzPgehlZwTeCUG16oZsISBlK/oXKplbNxNDX9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738633290; c=relaxed/simple;
	bh=aaqCqIfYeNPPqOnu9O5pQMuVFWEN5FGAEi9ZlTq5UEU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DS4QplahCNG8KmI0bxYSfY/z+RRDEcLBMTRqeF4DR1CBnCQVywQVZuFN6te+OZaoSDZ9nO3WmRnsb8C6bHY2WyDC9R5+FhdeXN5Awqkf7omHgthB9VTd6Rfnaw+J+ttxt8T1Gy4RKRQuqdEFSmVjPr8CbNF91NDKRi0VMyI836U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=VEErfErO; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="VEErfErO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gXLim3cr2KxH6MZ2HKejC0KedaOMsayuWUCzFKT4RTaCjlvllc9LZlPLq63fl/lvSRUsqJ0EvXP2mWDiZ+oZsS1dcbnEkaf1he/ibSOBV7MbWnVlL6ITfG67sZt7O5/AIqu629tMpathUHV/mabHCNJNXy9D1FNHWlQbTb23+noqhUWnUWoYFgedC6S7XCyR2Ddeqq7nfkhCzfPsLCbxlOS3fEOciNdgYi1iVhB9YeTH9MCTmFt5dWqp2XSepb2QUMH2fGKKZhuIGf+CqFXo+qqwi/9Rp2Nmix8gWVgJvdR/SUtMNiGyrGph78/h3hrsC+DmqsEVKVNFhSuTaq1/lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0CUBwxBj+DcbTh7BSBcG7lnqeGSxmW3GpFgcR3plmo=;
 b=Z8x3yr0pz5BEinno94Cf5x8Ky+9Q36YZz7jAZ9+TWZ03bbQv98np7hS8IX8Cjvj0xnBjoNaL6swPPNLfj45qfO1M0MKcP0gU8vVyYb4cN/lFnvPqdA5Mh+g8xxaGkKTrYVAUuRTZ4zW6dNhx0t5XmjudAUCZB+q54FAIkgtnHRiDl94wZmR3SelxN0MW1Rxwv9bQZQdiXGE4lXDbCzb+PeKYkt8w4tMRhw7l6o5pDsNH+tkkbdtx3+PlIqYou4HhYq82QGM+UlwezbQUqtcTcMexDjaZXvxWdUkxFT8DVbIYkdJxEcA/JY8Q6hZS6kW0MiYpYpQwBfUXdBxkqPM2vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0CUBwxBj+DcbTh7BSBcG7lnqeGSxmW3GpFgcR3plmo=;
 b=VEErfErOkmDjmFXxisKtyzM+G6szhWgLEbBodWTv+B+bkgxxi72su09Jk5A6AZXMFWFGyLM9eNpaxmDyt+O8lMdnyZFbfLvaRdydBDLQ0JwAumFxDYgM9ek8b2sBh2X5wM5WszVx8Uh/WYwogUAVgoYy0zTusoS2RbVZeG6m7Gs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13000.jpnprd01.prod.outlook.com
 (2603:1096:405:1dd::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 01:41:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 01:41:25 +0000
Message-ID: <87msf232rg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/3] ASoC: rsnd: indicate unsupported clock rate
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <87o6zi32ry.wl-kuninori.morimoto.gx@renesas.com>
References: <87o6zi32ry.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 4 Feb 2025 01:41:24 +0000
X-ClientProxiedBy: TYWPR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13000:EE_
X-MS-Office365-Filtering-Correlation-Id: feac80a3-08f4-43e2-f13e-08dd44bd08a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WKYNKSzV8oPDXyrRPSCqK+525sITGYTUw2TYA/K3tkgAsdK56jrqbdcRnfNu?=
 =?us-ascii?Q?PonQpFQKXsO6D2H1KKl5wnfTsu8VRr0FLgb6bLp68QP8/ONUNKroe73AIMw1?=
 =?us-ascii?Q?q659JNdZbyBTJG0HvLhx9P1xEWAUyMbXNX5Gl7wuzE/MLyfwQwlQXj6QCEFr?=
 =?us-ascii?Q?Dcm4Z1XDjg3NP6g/nVzjtfGuknCWmlLdIjp/9QFDF86XBu+msX987vBWDKHD?=
 =?us-ascii?Q?0/qObX1Bx4T2Lo9DrNow26DAlkEyOV+nnTJ3oig13wmgZ6dWmpgrctuZNkxf?=
 =?us-ascii?Q?lhxyIyNIDA7QbOyB628h/jSwUeHEugBG8wrnuw9VvMHXdIO4Kruv+8HZ/CEK?=
 =?us-ascii?Q?h+XcZu3ta4nZUxG2uYsOLQ+3YsgXhZeT4JNaBDYmwcaHEPqPQvMACf/qKc4x?=
 =?us-ascii?Q?TDvnfqZsiETKmu5aa3/kzQMo85g6rqQrpUHId3wxW8eFAewya58xcIZFXIIL?=
 =?us-ascii?Q?ysUMCsbRgPWmyWOvrpVR+Y+r2dnAgRoWH1iDm3CNCLaQzqg3LT1EwgZM0u+u?=
 =?us-ascii?Q?qcp8opwGIE0HLwY9kaMYlNTb4P+ixXT0FiovrDV5EUx4xDGBsuxI+osRt6xp?=
 =?us-ascii?Q?hmbw7JpOEL3jfME0euyt/VjN+DqQl+RDWlNxxkYe19bLSHvaXr1XteRCGokq?=
 =?us-ascii?Q?3zPDNLZfyB/OD3G0A4QAwWTd46/kGJO9e4QTqWHFAbz712CTOoqxjk2BTTx4?=
 =?us-ascii?Q?6MmAdG0Dkkt4H4ZsW2wzcgSV1Bu2XiStMR4RpJCdeJTgwg/GTRXovswT/S6s?=
 =?us-ascii?Q?wFuoAs94wJ6bXSyEJF70RxtSQU4SV+sB89agBcOa25sMMxY08ZvlgermNA12?=
 =?us-ascii?Q?fQaEEYaxBQN24Yfw3s1oxq3xxLvu2XYYBOuqvUquC5PGeCl+Yn5J/A/YaonR?=
 =?us-ascii?Q?rYDPgA8bB2eUn43BdtyipbT6BIJTJhNGXAODO+viEgoYz/kQB9z2MJoOq4MP?=
 =?us-ascii?Q?SKgg9r6bXMuu+qFmPNvDqrroPZdqVk6cU5ztdeWiyeiF9kek7CfTBuEqltY3?=
 =?us-ascii?Q?45BVc9it2PpnODlRvgYmre6wtiTXwouBLQc/oLy60WkHyVnoks5VmruQvuiy?=
 =?us-ascii?Q?cMWuuO4o6ADyVLDc4dVgBbG5PuZpo0F8GgEZLo8fL05tcXpN1KkM8Lq0PXKC?=
 =?us-ascii?Q?qewTGjQxGjAs4FTBhnCrIH6z8l66jyczEpbdhyjcB9+FQdGoUV7tN/HALr8l?=
 =?us-ascii?Q?Evye03Cis1XgZFHK9ErwtVxBl+pVkc0v2J+Q6KZwoSQTNnuKTrVhZoOZ00Of?=
 =?us-ascii?Q?7aebX/7w11JpkuICF+nGlSEsuqTCpQGyL9GTh/wy0GcyehBGELbivvwRBVFo?=
 =?us-ascii?Q?AfYyg6F3Ztu4F3QeH0aBuexncp2q/kCrt+wgIWTuJobtWvbCw6WzruagL15J?=
 =?us-ascii?Q?lp0EOfIa1tY+Ibt0kYWSDtcvwovqymHqm6T7A+lLcG8MkImIligjONWmu8/s?=
 =?us-ascii?Q?2UeuW5ske+WjDZDyAPq9Wguc3Cf/Elke?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xrL8KVfdqh3BC7HkxeXL4mHPxK/dA8GDsOPj2tRjb/JPyQ51B1/X4/AMj+Fj?=
 =?us-ascii?Q?eSipAfGOeN7OvKtmMVZarv+Q8PLN3XgooDJrgesdQXEckzpGg7iIo7Wq8DmX?=
 =?us-ascii?Q?MaV4sK17S+i7oMQzkFjJwz5H722oSz8oUMfDnAARfN34QbS0VafuH8Hw5YkH?=
 =?us-ascii?Q?ZrtJcr+okm6OC8KhYSL8NMcitPyXFzlk3f3rPx0zALSUru1m5u+4HbFG2fz7?=
 =?us-ascii?Q?g9X6QG/gKmh1uEgDAhoCBMjnWbGwXmMfii+GWKDViKktO3RBKzY0Jm4Rrhue?=
 =?us-ascii?Q?H7Ui9I+6+J1DJvD9UpWrqpQYLGo7De/y2Dc8QJrSIDf/RmeRqbNoGZTi1E59?=
 =?us-ascii?Q?nDihpN3Btrr7N9kdJ5Jpmo1SMQMJCaMAo6JvljKdOtUEsEoJBqx0DGGvmIlq?=
 =?us-ascii?Q?WevKvL0EWzzESojVBgPnMMA2BP0P8U1uXiAndYypWYXYkROooAWMwxKTZp7K?=
 =?us-ascii?Q?VtWsran5LNnJFo41XDiUONBtK/3ZXTmRQ7JxEASL0A8n6tkXlxn2bnYanBSX?=
 =?us-ascii?Q?OCp6qQ1s2Jvz1552DD1dh7GK//DeBN5DbPkjXfQnF+K4ZVU3ye4ENXPp+6f8?=
 =?us-ascii?Q?05HGW2ScZNh4dKCXszp2eNLoFQNznnDwl2yrinoTcao6LWOUB9K8Ze/QHUUW?=
 =?us-ascii?Q?kvo9KFj7rEe/efEoiNENrTqhUMdiBTOTvdYsj1mcm2Wn2zK790gnjozwASut?=
 =?us-ascii?Q?aHAVea41XAn19Tw4PpPNjm3QPMsaQd3ER4lPq2fMuFt0ufxu8w0F/3E9r2xW?=
 =?us-ascii?Q?wOH9DUc+uoVjwxJQIDsbzMFtCBEFxIbt4UgC719Nzh1K0J98edP2RWsu9x0l?=
 =?us-ascii?Q?lx107kyuwteA/9AE9KVv06Zen8aDCWjsmzlxksI8Dcef71dcolRcTbL5Lz9V?=
 =?us-ascii?Q?mY4NmyOzTtAnGOmMDsZ0rCoDrW7Ew9uUigrU/V6qmR+gHBggkEHMb/SW7bhC?=
 =?us-ascii?Q?XsOtHZCwThjC0olmTuZQfcgbFnSDrfOeza5zrJbAd9sKJjRR2H2kHS+vr6Vp?=
 =?us-ascii?Q?IBYKAMSkedRV9qu75S0qfkthlrw4A9+ASZmxOYInWjlpaOiQ4xz+z6tvXaJ7?=
 =?us-ascii?Q?AusrabU/Eo0SjyEOzVhp+6UUA+jXnwl6QU1Pbrdb+NE3+R3LqxlA12UW46AZ?=
 =?us-ascii?Q?pUhEWX9fWceabC+jSO22AzDuwHec3u0r74IvxH4+eWLmuM/Gk8ON2QO51uGO?=
 =?us-ascii?Q?95ndOENCkoYRJxedElqvXkWObUFmKC4dWdp4BFiOiGuh/ZQHgrvbYOVmXseo?=
 =?us-ascii?Q?C44dMCPYFY0hwLxjKLx93LlEoe2SpRS37EYr98zIjoBL0xRuVkl2NL9gdyun?=
 =?us-ascii?Q?+xYhyZ9cQPtneJH6tD4O+RVwA8ZkDnPTsw/vLfZqnow+SDIa0pJMgA/nJh4E?=
 =?us-ascii?Q?fvIIdhoo8lBeGnz0mMbmvuqd1L7QHWW2yDU8FPBpnk6tMjon32F6MLuWF/i3?=
 =?us-ascii?Q?9MfrvYfiLFUvi2uqB1W/rMwyDNjdH0hmu1Ies8C8EBbRKyU7l0Pq151hyfwd?=
 =?us-ascii?Q?CzlduEllhj6M+G2XLoXRpNV/8wy+SvsuV71IZV2tet0qm8Adv4cIhlBpvRoD?=
 =?us-ascii?Q?ckNg+mCANhKdvgR5kOzhArxxv/oPNPfqeW//8vHiZ/mujeekLitmD1B2Rl3r?=
 =?us-ascii?Q?g1/04I3vQ+KNgakU6EIW/SQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: feac80a3-08f4-43e2-f13e-08dd44bd08a2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 01:41:25.7237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X3BRS4YWSKF9tm8zISTHb7Q7EGPLBTLOhvYjpAbiNAHHcQoFQe1yYKmFl8INt4D+SQA4gafCzGFVjIps6/KLwriCI3A5BqeupLCmXNMFe2GoPO6iuDgkK5phW/cQ2J5+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13000

It will indicate "unsupported clock rate" when setup clock failed.
But it is unclear what kind of rate was failed. Indicate it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/renesas/rcar/ssi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/renesas/rcar/ssi.c b/sound/soc/renesas/rcar/ssi.c
index b3d4e8ae07eff..0c6424a1fcac0 100644
--- a/sound/soc/renesas/rcar/ssi.c
+++ b/sound/soc/renesas/rcar/ssi.c
@@ -336,7 +336,8 @@ static int rsnd_ssi_master_clk_start(struct rsnd_mod *mod,
 	return 0;
 
 rate_err:
-	dev_err(dev, "unsupported clock rate\n");
+	dev_err(dev, "unsupported clock rate (%d)\n", rate);
+
 	return ret;
 }
 
-- 
2.43.0

