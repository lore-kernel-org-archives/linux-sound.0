Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC851155326
	for <linux-sound@vger.kernel.org>; Thu, 25 Sep 2025 05:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758777451; cv=fail; b=H/JTn0Z84af3xJ1ZtjDFbJmajm0T+GZnFpEd51lcYPm8tBqhBYU3Lr10jsHtz1dhw3mI9zhAR7k/CN8xfPklB2IkBrYvfWgvP4WnA8du67UnrA1sWFy6vf/IwHG2MK7vfsAoLtRqRxOuIKV2OfCv6Z2BjNp0dpgjvDtMnBuMe2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758777451; c=relaxed/simple;
	bh=WzgfXUElw/ayHe7xJw8omh+LZMYc3u022WwrcV62VxI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jM+gDSLA1iQOnfZCu5cdmJFU0Cu0ZCR9vOMvKIBhlJYNOpBEUAsZlYoHv4vKWmpcWvlDTT5U8+R62t1zTYl9ZGSnEtKz34zxBadd/62OLz9HOwp/efiDGnO5tmVuOFavbwk36S3AteEp9i6DXQO1769rvZjgXM2BesUttJdKTHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=BlMtRVTF; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="BlMtRVTF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T73oM/nn8JMeB1WNSFHClfPwZVOZQw5GY1i3nGbyRxF8JoUTz2bgD03AlKFMxZKXNFIgVPJ7Bk8fsHHDuA5c45FMdXeKbl23oP8kSEK84b2meBOamvWMIDg8Ir8WofqLetpEK9FHH6yw5NxRhv8ge+b0ot3+TbRxg3+w/qbjGXEuXH7agtjOxGhvvuJdrzoLo6qc7kLPiL0pbmI6bnwjSJnN2/bRrsL2HGeFaqBfzy6eZso4TRGBU+l/F51/MQSXDfQChz6Tpg9ekULelyYqh/PCefvgpmAvfG8AhaaN4BJR17KkZ+eodJGIp+8f1MwF+Yt0dQTrSC6rekTL39P/hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rNlFWI3TBqQYVhThCFfzJtQm4hIhiU9+QoKKKre9bA=;
 b=WiBdyIOHJagrvuPL0+aDs3k4htyCCck8AATpwbz0T89rvdRzrw/QfP1XST66OBOAxNDv0yu3MYj+WVeysSVHkfwuaFdfvm7ZpFbBpp1yz4+d5yhZcMSI7Ky02E+VUWQ/+OzDgbovihjQ0QJ+ij5ZmbFmibaBeIfurPwLrLp7T1q14YsNj19cnXsATj5qHfJg7W2uIWhgX57YbLMCfN33ed0urJ3rrIP8pxjfdQcH2TxfgDL0+9QaIE5JO/zUFBvFDJbRLtZ9CFuLRRofsf8OcbpxtHlIQHRahB8UTR66k5sWDLoF3y3/OWc43EiTdAapb3v8pn2e3M4m7DrxRgQ8ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rNlFWI3TBqQYVhThCFfzJtQm4hIhiU9+QoKKKre9bA=;
 b=BlMtRVTF+2g5sVWeO9UvKi/heYkfmMlYCdyLuHKbz7Z6I+GkFH8z0rcY/f0jd6B1up6wJtCBOoZck7bO4QU1+8JhTfT5odICeCjyQz5e3hBcyUCfdo++IkkiSzFqrAahZbdkTcIBF8TiFcf6ic9zZFkb9MEmtYlS9MIhwgbjCRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB15474.jpnprd01.prod.outlook.com
 (2603:1096:405:274::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 05:17:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 05:17:27 +0000
Message-ID: <878qi3yuu0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 5/8] ASoC: renesas: msiof: tidyup DMAC stop timing
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
References: <87frcbyuv4.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 Sep 2025 05:17:27 +0000
X-ClientProxiedBy: TYCP286CA0325.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::8) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB15474:EE_
X-MS-Office365-Filtering-Correlation-Id: ff10d9e2-3600-47cf-6182-08ddfbf2d1b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/pbOG2j4Z0lo4oA+drYE0AgIhjoGtk68n83CQ4z5agXjlNgnD1VHMwKNQx9L?=
 =?us-ascii?Q?QmrsBIY+ur8cetL8eWmp9n9z2BdfkJnDluszgi+jdwT9hKTy2DGaOrqydKzv?=
 =?us-ascii?Q?jwg76pY2A6xAc6z/VmoCYqtAQ17mBSsnrdChuk6v08ogrFYvqw1y1AhxfOzl?=
 =?us-ascii?Q?cW5VrzYDkUb/4sB3iZOxD4x/AQUcuxCXTbZya1fDseFxN8RexHl8LDCkKBzA?=
 =?us-ascii?Q?RQYa8WUGa+e1eG69eqdgrCxTBC6kNmzU0jdj5I8hY0+Yovozht4zEoIPCYy/?=
 =?us-ascii?Q?7vuWoRFC4QmR71mQbRtwySOtmJfU63TiJ9SR6fJQkwmVyFWit3TTYfXSbC2K?=
 =?us-ascii?Q?F1pxblwYiVO/t2Oxi7HIFdHaNjBS2+ZQ8WdeaKTijky6ftvxYi8E4rxHzRLr?=
 =?us-ascii?Q?0K3d0pu3a4ucBPfFd4CmWmpT2cOoG/OO2WQMYIWk46XgDBKlZXvchAyOxJR1?=
 =?us-ascii?Q?qaD3VTc0Q7qiCstoUmGmFaolXCFqF3ZwCSHnxuWrm6GnEgesf7cQDaUP8c/f?=
 =?us-ascii?Q?MWnQZ5k5Om9Fl7Lp3CmSieT45x+2t1OaAgAvLkmOq/z6k0rWLT8IL36wW7Kj?=
 =?us-ascii?Q?TxKxmKhTzw8+tQ+xbrSRrhwR6ogHoDcb7mXu14ISxnvx2Uoawtdf13pLse8s?=
 =?us-ascii?Q?MdE5g3o6wtsPh6L2T32A2WehjjXQ7HFGxePjWLyFEVRFfc0/6xwQzb/7kLe0?=
 =?us-ascii?Q?Q4NAqegc8g66nEuBnyrDQvTIl2QAWjvxlC7/vmkzdwoox0NNDpkCRcXGdX3G?=
 =?us-ascii?Q?8Qmp3Pu8z8yKTs9ldWZas8ng5oZ4/euya7vkxTBhNHpJMbTVg5sW5LVOq+xw?=
 =?us-ascii?Q?zgW/NNA7dSkTW19XUl77A9rgMRWpwkLtxopsYKMHOWtB1JVvTsC4uHTFgThb?=
 =?us-ascii?Q?oGEdaCpmpo5TF2N+AKvJt8jPpi/aRtK6C1O7qGfh2XDmJ+4V95hc4SRRwkAb?=
 =?us-ascii?Q?f3OZ+AojxcdtuchexMVqn1KzeTGjcRl16wlY6UMZHEKkMSIPq6SAaS2qqqnh?=
 =?us-ascii?Q?gV/FwmBjL2JEFCDT0XHgsJTMzsFIW7b1Pedrgqwe82pDXYrwsUcAxuMaru5g?=
 =?us-ascii?Q?cseVv9lgFqcrumVHcRA/ZrFeYcj3lff1yglPF35GNRbpRbulm21zcP1llH+2?=
 =?us-ascii?Q?9ln9mnp6noxeHSCGMLGR1MkAXjwXmcPqW6Lqt+YlLPoUnJlA2A6X254NXz1Z?=
 =?us-ascii?Q?XOcSnjMqFAcXQ8y7tV42EOfKeMXRSCuC2/DLgkXJoMbuBy2CQE9gkfvJKuxp?=
 =?us-ascii?Q?7VjQUsx1oEI/ZoWQSoFbxX5UCQ4ULyBWN+BglmRZPG/ymVig6Vb8Mg4uycI2?=
 =?us-ascii?Q?JhjG80xDU8FUXp0kD9VdFj24gh2JdZ4S2KnqG1yrJiWSZZhLVHKjNNL6AaB0?=
 =?us-ascii?Q?gU8s8oER3wp3u2mi0UZ/EB/AqJGpBkP9HQxniK+WAlnNiq1q9jWEMq7bRrAW?=
 =?us-ascii?Q?Ti2MKY6Q68Lu9Y1WXBJWILwow9SMS80fi/enGEmSoQb5d4z2S3cT8pnB/vZY?=
 =?us-ascii?Q?iskvU7CW9yhhbsI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xn9wU3kURnSgeUNEmCrYNtv1GrboNZLozLdM3uIM1IIqJkpRrrJcWFIalSR5?=
 =?us-ascii?Q?1Xh9Fi4Cq8hhp07n8ogITyyXttFgMMcKMcCBdGDmlpAXhx4TtYueegLKAKB0?=
 =?us-ascii?Q?CHNXnfCw5TGVtDM0ApFIOEJf2y/Bq4wxxUoFS26Yjw+lyQHKc9eZEWmgJtAV?=
 =?us-ascii?Q?mH0JdEasYHBwfmN85h2hSaB0Xdck5m/+WfIRfF857eP24l6j8NCl6QwnQwAa?=
 =?us-ascii?Q?MfRtt2oSNFUtnq4NJYXWki//H1bjllvlluvhEkRnPO8vkr5CsdaNj6ZQDLqC?=
 =?us-ascii?Q?qL+Q210Hh5ev5cKuyc8RUmbvWNIH6PMQOimj/zAHaM2u+NXrUuiP0Rha3bLo?=
 =?us-ascii?Q?OkqcpMOXOThg4f9VJnvO5WBJEo76AV34GTpJRB9xEb4Gas7rfXOV38w4+rTu?=
 =?us-ascii?Q?acQJavV8dKs1bpLBVKkh/5bd4q1lzmtsYgTWSweHb04p7qrWKpMDUf4OthUe?=
 =?us-ascii?Q?bW55z955etgqLZNeszQxrGhr6LCyh0LHuoWzp2A36GP5v/deF/sONUDSRrXl?=
 =?us-ascii?Q?gJPbr96cgJGFKYM04VA5W4WIMmZDfjoXDSWxMxQoApjCxG9LNKl/f5OKQbfc?=
 =?us-ascii?Q?+Vr1SzT5xcJzVI32z+V4HwRLGRUKxEUHuU55bJjtdyeC6dTWPsRec7nqDhgw?=
 =?us-ascii?Q?xvY9XA13Z3JE0fV2GrobU35CtweJytnu+ZojQ2rYoyBy7n+1IepmoB+Z0UaE?=
 =?us-ascii?Q?xlt86RuO1HS1W+xK+zNEsSmgfHDfEsOKsilm7r/mYVSmmqXkg2NLmCyMMrUl?=
 =?us-ascii?Q?x4/KO/+yVGM/5YQOPO1IL+UaDqcbI7xEYL1XCI2Jymd4LpMCeFPoreTd7cWg?=
 =?us-ascii?Q?et02WC/NaDEEU/HO5SMkszMxFR7EuOa03Evk25Kai/MDjgUYNocPFAfdTj2f?=
 =?us-ascii?Q?Dtq8/UgoXEB7exKP1tku7btEZYKx4S2XVIfHLh3Rjsb59VWG8Np5zadclxGp?=
 =?us-ascii?Q?TtK8JxyuCDVjXZrEo+dhHOvQszFFClxAhmUyoX4iwN7oNr1lV2n8OBAbzjmN?=
 =?us-ascii?Q?7PVargxz7BKWkjbGKfNWI9gx/ATnnw+I3AieKLv6xf/wSSVpv0y8+ihnDNhN?=
 =?us-ascii?Q?S7acnx+2h2uleekX/veyl6oRnUqgt+4kg4/FOT7uTzz3+HTPjDykLtf7gg2i?=
 =?us-ascii?Q?PPJyjqOvb8elLiEBVX5lfoFwprJ5IY6zskvxTWDH26qsDQ3MqoaIkAl6UODD?=
 =?us-ascii?Q?+v6BApXjM9hCYODCPyBGZsmKJhJ7BDsobY643v28l7ikfVarfz5suUHo2iVz?=
 =?us-ascii?Q?TZr2WMveW9LAp71yNtx/U/OZ0bQFo87Ri3ICNdkF/cul1ZBx8uxLkcsV3eq8?=
 =?us-ascii?Q?k8Ebp9q+MZdYnVKoK1gKjZW1jFu2T1H9k2tVhp7mf6tv+MNqdUt8rHqIZbcf?=
 =?us-ascii?Q?D5c2Ec13VhUNzoUDzKGaDHRW9mWuxszvm+B5xZU69MB4avrvQ2S5qV1t8zn1?=
 =?us-ascii?Q?v2drvKbqPmTgxXOQL3lo/NcWQzWpFeNAFWMpYTPVPSSctaGMp68ARnzVdTBp?=
 =?us-ascii?Q?WiB9W6jdBYNBn5EmK9KqPYQJGwDZNSbFUxQ3qAkTuLR0uO5uVUBLKK07MscW?=
 =?us-ascii?Q?h3KOy5tOOT1EIpNC7L2oZuQOz93AsV5ZSJbhkCYOvUju/JwQvtd5b263tlZV?=
 =?us-ascii?Q?8EYy48ouvsxK3WWIagMhKsk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff10d9e2-3600-47cf-6182-08ddfbf2d1b3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 05:17:27.7083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJ2b6JbBt1nCTmWI285cBkfWXYRXfZwMWMlgf6f4pHyFdA6+ZXk90vD8b+8Kl+UglrE4HmrdOrWKGbR7x7uqhJ1/ZMSaTziOaK7kqqWl7MJutuz/nEsc9spCjV/NUB2o
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15474

Current DMAC is stopped before HW stop, but it might be cause of
sync error. Stop HW first.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Yusuke Goda <yusuke.goda.sx@renesas.com>
---
 sound/soc/renesas/rcar/msiof.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/renesas/rcar/msiof.c b/sound/soc/renesas/rcar/msiof.c
index d501ad9d7141..5b59d4bcd67e 100644
--- a/sound/soc/renesas/rcar/msiof.c
+++ b/sound/soc/renesas/rcar/msiof.c
@@ -238,9 +238,6 @@ static int msiof_hw_stop(struct snd_soc_component *component,
 		val = SIIER_RDREQE | SIIER_RDMAE | SISTR_ERR_RX;
 	msiof_update(priv, SIIER, val, 0);
 
-	/* Stop DMAC */
-	snd_dmaengine_pcm_trigger(substream, cmd);
-
 	/* SICTR */
 	if (is_play)
 		val = SICTR_TXE;
@@ -248,6 +245,9 @@ static int msiof_hw_stop(struct snd_soc_component *component,
 		val = SICTR_RXE;
 	msiof_update_and_wait(priv, SICTR, val, 0, 0);
 
+	/* Stop DMAC */
+	snd_dmaengine_pcm_trigger(substream, cmd);
+
 	/* indicate error status if exist */
 	if (priv->err_syc[substream->stream] ||
 	    priv->err_ovf[substream->stream] ||
-- 
2.43.0

