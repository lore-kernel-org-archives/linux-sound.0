Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011047.outbound.protection.outlook.com [40.107.74.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6A018A95A
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533481; cv=fail; b=DOhmA4NJgJnJGROmGqlnOH/JtU4bYCyKtT6V7sp0vdR3rc+3qsoBBKjeWpk8Rh+56H4tUISMQAdObrFmWwL30l3T8F8Koj4oND+CSPfkQ36HrQKm+7tBAGK0M1GSy994HQwpCspAslmb8F+6sAZyum2Hvfo+YeUg24OE96T7xU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533481; c=relaxed/simple;
	bh=xKeKfWUr2k4omP9dQfNJarTOlo3pqonKfpBxSDekr+0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=FYOWn+hbC0F7nVOEMJd9Bt8JZDFwkSqppqUXORb1cm675bMZX5nuGI7qHgyvHalSqOK81ZQfx/casZctVcC8nv7BH+gRREGlAcMhh6V9LUPnPRzPCNtsFWQEfE/3qhp0KgDn88QgSM/W8xxeVRgzzec5n7a+fTiVtqMjIIRiui0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=kCC2EG3r; arc=fail smtp.client-ip=40.107.74.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="kCC2EG3r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ry7tsXGkSPPjT56c8XcyJ+NLuOi1I4eburbBCQEQC06KK0UfKgIJGMPmy9e47E/fr83pb6uTGBqUjR0QPVXS7fcAY17JM6iBLi0qTuiiubNyEiynUwZe6SVAZKvbHe/Qe5mQBdnpspONqpsGUlcO1CUYMQixpTlORWe6FAVmwNcEALPideByt2Z0PcahrXYLbKCS2N9M6xHERZg2ydM7bmHEaoREq+q5ap1pBN5IurFYMGyL/ims4ZlgTPQjv6KsY/U/5LTwuiRC117NVE5B7YKVgVmEsFL61XHzRe3pt3wlGxRmkbZAYxpL5AGd1gbvRTS/+ddOLeCbE5PCWLF4hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ug958JJvPJ0R2Lcq4iYxEUZc9Xbc1kWsLWojEukZXiw=;
 b=uWjfwuhP4x6cfp1dwAjJuWiOxDazPLI5wa2yoDN6xAVt6FMY1LSIgRI83I1ebMQFjN+A4T5EBrHgcdb1h3+0ffXOotFbaNu30jsHHODFLuLKmioxbGTkLVC45YZpM1Pg6GyfR5vNnNjL9HeSmV66xmn03F3434OBf+zZv6Gi50+qpsuPF6EoaAOIXSbYjv5lX09NyjjYX57VepvkPEsHubPhUlZdfjOWG7PIprDrE89Dj3eZY1aMOWsgUVfYAK91saI2jfl2vfy1NfjlRecUmNsfSHw8+hJ3ypGqfYj2jHDzzBHtxunU91q0fmVCq8qTD46njel2yt2nILhYlLnoxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ug958JJvPJ0R2Lcq4iYxEUZc9Xbc1kWsLWojEukZXiw=;
 b=kCC2EG3rdBfGx4Hofx2gCtyTff5LkD4nhBuhUDm8uYFwjAfk+t179o9DMOywJfoV+BrSRxvkzyQeGjdL8yhjEKUPPuhSo1icR01ukDw4093mjH0saLeNBr1TpMVwCf4crkbf/8uME/jLz3teozvFatgClR+YzlIyGXmMfImlbdg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:31:18 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:31:17 +0000
Message-ID: <87mse9fq56.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 020/157] ASoC: codec: cs530x: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:31:17 +0000
X-ClientProxiedBy: TYCP286CA0144.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8a0be9-4aa6-4b51-516d-08dd5605443a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?chAuvSMoogN+GLdjEmtCN7dq3FN5YZGROLE7i+uSHvexPJb8oZJKwWw7COfk?=
 =?us-ascii?Q?eEsTjpKzu3beGkkjep8INv1DHguIQkP/bLzVyvzuGkVLgYc9oJJZYzPaWqpK?=
 =?us-ascii?Q?v+PAKNbUO4UybC+caBgENLNNTvJ/a8FMRF60QhLhTLC5CDRZNj4nOMpqNaJr?=
 =?us-ascii?Q?7XOsK/Ptr/9jO5YTkYBcb2qhGrQXwOi/FcJz3VA2sN6UBh97EOK8hxH1NPud?=
 =?us-ascii?Q?NrcjElKqrOhAwaE1V7PBnRvJI2Ijxr6wpxjkCE/Gr4rbAWuGiAfBVmPrLDWg?=
 =?us-ascii?Q?rXsIAaR/9G6R5Ch7wLamiKbyHmw7sd56RiA/44N+sQ7Zslop52aNR9ORoePM?=
 =?us-ascii?Q?wUotAqS+J/pQkgQGN4fHYOZj7TzGSeE+xy4UVfgZpwR+odvg77fyr5PZHq4b?=
 =?us-ascii?Q?wgizUhtcL9n+3q6P2xhm/hlTR3/vLf4UTiqaOJmnPBupjNqj1s/IRiJzGEZQ?=
 =?us-ascii?Q?lhqKbyBqqlabuf59wlNYk1UkyDDV+WtpImK2RCuu3CA9WVyoBGXQVbK9X0x9?=
 =?us-ascii?Q?V57ZPmHYIDDzrkh7RycSBAafFjpBbeFZdP2T/rhsu1JKF3YmzZJklpFAQc56?=
 =?us-ascii?Q?gKGDsuauQAyav1SIMGbl2gRM3V5ZzOpkJ0QGq+JlqUJ7Qz3ARajlKbYru6yo?=
 =?us-ascii?Q?Jk1WsFaulEBV8ZehZgIN/fjKYyfEzdMnEJU/g6v/AKDKzfi3T1O4kOuKOchk?=
 =?us-ascii?Q?zFyiQ44bZEJ2hZ+4LrNXLODHGOZ8P7nFDgPApvvb99UvQoadrVHgqvSszG8O?=
 =?us-ascii?Q?skoMt3eoi2JnUbM1pFH3O0LgkI2jC7FmDxEvL/wsbSrMBOUEHyIQw9DcFemk?=
 =?us-ascii?Q?9qtAhkzqUNv9iDNOpHD79WmLrQ2uZeX2QiENp6ornzWgF+YSo2ZPc8odFNfQ?=
 =?us-ascii?Q?XZKXUFXR+JWdnnUB9iQcIJ17dVXMzoZsZG9jH6rfnkWEDkSkrz1/HqjulqXR?=
 =?us-ascii?Q?JiLyg2r4jb//9dvNp2kOFOLDpVZOOqK0UjtHkSs7GSJ17f0863fL4N08WJjB?=
 =?us-ascii?Q?T9HlUL+Y34q2UtVsp1Ro2TGo6phuGUe4U/HvuNSo2L3gw4Mca4Q9ZSP2H0Pl?=
 =?us-ascii?Q?uyrUMwuA9UjdCAQfo0ViK7mtak5uCX+1ZCcfSggcAnPDKhT3xjRH8DeG9rze?=
 =?us-ascii?Q?q7mjkkrr2wLikQxNOaIBpq7oFd6ZwltEWrc+ihsXuhBKyOFTWEW3JUgD9k73?=
 =?us-ascii?Q?/r6ASSRqSlVdmpd3add5B0Frm7Wk895htnbSAMeaBYO+78vhRaE47JnQ2INQ?=
 =?us-ascii?Q?2P/wqmCYtIpgv/Yv9Zuz1etGEvxted+xBhfKToQ7WnFkFoBKTYsGTUF52rIf?=
 =?us-ascii?Q?9KSX+nZkpntsu7qsqRYzJDXhDWnwOaq/E2g2c0PFGl17LkDppI8kBpWYdqPr?=
 =?us-ascii?Q?hjRomMT1+RS0sH9gkIbQz4vhegnft+XjveDjrRJ15C7+v4FWTSPvnzbLlloK?=
 =?us-ascii?Q?5MkFgBlXF8W8rz1jVrAJskAz4Im8A+H1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?q/pkkYqm/Mvt96fmZXWt2FGBiyhs2VLzG7Zhhl4MoTcHVEAOTOn4tidKiFek?=
 =?us-ascii?Q?esPGIV/Wba/3/PLNQ1bnC6uMiWFbmlCTTM8X9bd4ouS2LfIcL48o7T5xADe1?=
 =?us-ascii?Q?Ur7tIVpmAHAXA6Mf4roYp03hVBLeHCprZiO69QdKtSKqIsZxlZpVEbX5L5vv?=
 =?us-ascii?Q?X0FkfwQXTGcfRymVvyVUm/wmwYGHxwIBm7zqaOnq6cB+2CPSybEeZAVhV1iA?=
 =?us-ascii?Q?WFmTc/aeRgmS6AB0N8tFWW0yIgbBGxrB022cEzbFfWSPYemQJEaA1BBnXu3L?=
 =?us-ascii?Q?Qw9RxF5s11K/7oERrIrAyVmjYmBfaPSZVzt4OU3ByLrg7b1rvuAdqod3gITd?=
 =?us-ascii?Q?NXd3Gtp6tGJ/tHKSHFQHCiCeL5+fl8h9FJcrJY8FvBbRFC0v4A1l+Jg/bs/Q?=
 =?us-ascii?Q?Z/BxiTo1ZwuW8NFPvvxkoSBVlQyyNgB1gfAEt+aW84DBpf5AAjp744B8+d4R?=
 =?us-ascii?Q?GDvO/8jwt8c7vMoGjX1MbGeG0eOgESBohbP7OkJ+9I/29F9hwDzobyohB+9j?=
 =?us-ascii?Q?4gmUiVSBuHgayqgF+IB3BpmM/NDslGmpH4xNanROnabbY4pKGRXBznVpi+gE?=
 =?us-ascii?Q?kvINqDvHBaDhu5jhvSbc4T2KjY328v8zMX+V3DWfQG70y5yHCcvd5c831K/R?=
 =?us-ascii?Q?c5q/IkdDwymLgkX23pvmdBAXfWbJusqkkgjt8EcNHRFm8TltZkdp9UIutC2a?=
 =?us-ascii?Q?3DHfnezwxCNLc6W3CLMDkhD5CIMaOtOsmrhnN+F+e4FUYr91+x7Dtmri0J7o?=
 =?us-ascii?Q?zR/A7wsURc/iqY28gRpeqvv8SwX4XixfAziHXp/Ad58ADy/M60eqqQUGNHgB?=
 =?us-ascii?Q?fWK6csKfChKl925+oY8wGy2o0iZMlUngLitYre6bfXlTo7T2q7wVc5OuPocp?=
 =?us-ascii?Q?r+i+zT5w0rtFj/TBBZnpIj4Bl8RtPMw76apHJg0blEgqbACXHTzGXCGUbQr3?=
 =?us-ascii?Q?5lgVhJ9t6qCQpNu2786phSR1hQdW0u6rfJN6pHdctEZUUlKyda1MNywNRzNd?=
 =?us-ascii?Q?lcMAqs/HkJsepXw7QEPcZVc4uyujTe4iZcToyl9oVmZ0VRk0ijUru+rknjUT?=
 =?us-ascii?Q?JDTxJerp2wNJaqSD81f3F15XJSzt1kKehknyYNdWfl2r49zWof7k+W79x0kC?=
 =?us-ascii?Q?HtTgXWSAsGLRbPklR2LNL7ZOyPHPvR8DKSZNJ5TChHkXonNdSR+rxXUEk8yO?=
 =?us-ascii?Q?aMjJcvf2E3CrBdPPQsrmio+MhOvbIeXod66Pg1vmCb8O4UBHEzZ1Roil8GWb?=
 =?us-ascii?Q?/kgFd563X5W7APV7hgx4VC/eYONyPS5O6VG3hoMoF3nlp+HBob5KDtvhmghu?=
 =?us-ascii?Q?lnWdT9beJAA+B3LkoX+NfDNF19ES4KvsMFEhUSmKgIgv46KJeBBWJ9lxiRp+?=
 =?us-ascii?Q?HoqFt5s95J/cIQkBBRNJlYNi9RXPvDuN8zeUDtC3AkiQkZURriYteiG2YBs8?=
 =?us-ascii?Q?NTupp6uKGivRWF3QnuSv0J0rk8UVzTqFydH6yJKgiVOrPFW6cJDCgzNxoN0E?=
 =?us-ascii?Q?cuOGVBrzrcYhykVZbaQH1VN9TDUVaqqa/WSPyORDmAbDPYe3QmVjIa4WVDCi?=
 =?us-ascii?Q?elUBcU8FfTkckhKPgfAb41dzAeZP7bDDCvEQ2uZ/XalJx4XRhpNyMgjeHFSd?=
 =?us-ascii?Q?RZgNG3iyNrVGYYLS3002mf0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8a0be9-4aa6-4b51-516d-08dd5605443a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:31:17.7597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mekarZtUVEFmlOS73w30miO5tWjXagInIuHMkc2OefGc+ODrjXtodLuTgwKLoQTOsbnD2RsdQAwprFWy/nf12fZOviJ5KhF5QEvSXiIzrHFYf5Czh0XnHwBCZFQ4ieV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs530x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs530x.c b/sound/soc/codecs/cs530x.c
index 252e66c8449e..b9eff240b929 100644
--- a/sound/soc/codecs/cs530x.c
+++ b/sound/soc/codecs/cs530x.c
@@ -557,9 +557,9 @@ static int cs530x_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int asp_fmt, asp_cfg = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		asp_cfg = CS530X_ASP_PRIMARY;
 		break;
 	default:
-- 
2.43.0

