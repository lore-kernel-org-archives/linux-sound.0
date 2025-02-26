Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011007.outbound.protection.outlook.com [52.101.125.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA4918DF6B
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533578; cv=fail; b=LNO2GO3leDpahPzGkO0czYGnRsoX5/HT/8MrFtXnoIpawlll4QWZC+GzyjQeaFed1mgkXPxq8ZZSZtNJnPI4i7TLFQ79BdS+1bk4JSBfOVtwbss2iSQlQWXL6WdqOyLqsDuC90zteQx7d8Y2pFJ0cRs8MNxvBxhIgBTzAUeEhYE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533578; c=relaxed/simple;
	bh=J59+heFPqfsB8LtI0X69NbjEtJ4SLgH21f4jUF9xHeM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=altLG2xlZZ7JcEv+sPUln+fXAQb2iG1LnRS0SIuJO3tamXKGJW/KV8gNEt7LB2GgeSb7BNH0XW0s9IB2HtTHpLXaRZzUuUrzrQb2IT0wn8d1K8eacXftOquR2eO20SJpqKG3CvvYTV7iLV+JxK9oPdCA8olMDvoRo8Pd/QrphCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=n7/OpIbK; arc=fail smtp.client-ip=52.101.125.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="n7/OpIbK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xh05Bnju0mtnIfpqWBrUcVbwom25UERqkDxX5Nxg9un0D2NjUHZLDpOI5chyUoMN6stEZUPsP7pAuB5yjtaEV3vgp0pOWEdi0FWbayDhwyNWwvaQ9xK3BwNMRgXUjBaiwonN9GpQwZpEw3a9aErJdOuEqin+xzY6R6695UN7vh56r5jlIxSI4O2PgAp3ubhXMai0xVqjazDf7LUGdr3ivfxzWF/cBRTHVWOkswdMyVhI2JOxEOGXONH6xzuIX/2qMnzEzkLVtX2pRAVyZwdxld9GLzP19rIrBUl/xTnR9zhykmInmuhRoTUXDNWkM9x/VQ/q5z31WpUVLQfILRKgxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQTK4DGbzG7P+EkNa8VyqdfjkJQmwMXEhDoPUcIbKHQ=;
 b=O8aiaQZiJbSX2YOy99nrvYMUGoaWKYDWIvxgLbw2v7E5TiJTZEgPMptstmCKCoFqEns3+zgFEifqia1bTvIpefjMHpdxq3CSTA5xxnciVIq+hYEDV/tI97dMls2jv0NWBrt7VYU/KW2YYx3d/pLJkfs871sBaxW7Y5wlxfWYWK2hZAgM4kq/lBpQ5oN/bSrFS9dbA10wODyHBv3xSS3Y9BkiyJxvhCT6DbL8jZ8YnjlxW8O9DkXITdGxp/63pkFQNq1Hl7RIdh/mPctA5Up9Hqg4MZpnA1Cx86ySAEodeTp4PDdBAHcZhvGH1nSqsmIBRRZcy49bBl1pS4gxbIoJuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQTK4DGbzG7P+EkNa8VyqdfjkJQmwMXEhDoPUcIbKHQ=;
 b=n7/OpIbKDyMUSPne2Neg59f6dVmPZqUMLUbIeTV72UBUfnlAzGG1Msx2AV5vkU45P4QmmcP8nyVtnvSq3T91sUTES70PMmMozD0YtBmA6Jt2iORCJL86wC4pVB5lzO4OAuHCIPFggWdoHSyj/us4rDeVZD4V2nxTqGdEV8/Tzd8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:55 +0000
Message-ID: <87o6ypebi0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 044/157] ASoC: codec: rt286: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:55 +0000
X-ClientProxiedBy: TY2PR06CA0015.apcprd06.prod.outlook.com
 (2603:1096:404:42::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: b8a8af85-e3c1-45d4-b7e4-08dd56057e7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2hiHXAvNDzLN8fnrBdwUY6NIh0Jusol0pqMCvOW0LzUChAx4UAd+hY/4WYiS?=
 =?us-ascii?Q?1frtuU+aef98oDLN6nGB3aAUYBlVAspOVTgybL8Ppnp6xX/AM7rHwI5SZrQo?=
 =?us-ascii?Q?3Yvx15Q5J9FrXEs4JUWsM959ViE7pq2V59BrDInbjCskSiDb/ViEX4JfTcrL?=
 =?us-ascii?Q?VKWbW/KhqdNWeOaJe2VHxECR4mr21G+wE9yf83sSLu7lWdoX8I5fnAEbHbEk?=
 =?us-ascii?Q?DT57tMJWA8S7AVwYHxinWQpVuS2mddp/6A0W0yZsDqR4p9KA1ddbgolQTzbM?=
 =?us-ascii?Q?XX+JzVlNS1EQNHJ8hg8ykui8TGb7yb97A8hcbLuhqU9XVo4axQGs4wD0rAvj?=
 =?us-ascii?Q?w0YHyJAYjrIudO21gjl3Pa38ujSskZrc/Ldxsj8MZLyfnlaT75gpVuAq8e0X?=
 =?us-ascii?Q?YMwfidDgARd0ok7mRb2tIZxnuKM0dwlMsPeNLHjCy5tNPRzJ65L4jw7DFzRc?=
 =?us-ascii?Q?vBBeP7DSOVnFgbBHcoOIbgHovG8zaZ3BFx1LFOFk3HTGXDGHqYVgeYw4+28H?=
 =?us-ascii?Q?vwgesz/ehZ+q4dipRsgq2gfapPm8aVKBMtAuWzdT5e83DX6Bp9kEJokmvJMZ?=
 =?us-ascii?Q?2cD2Ws2/5gckHWqSelcfUAYdwa4vPw0jx4hy4Ri3HqiQwy38bPan1n7f0sBp?=
 =?us-ascii?Q?W5p8zsL41DF9RQqcwwOb43M4wM/9PidV63B1oPbN+yqYEacAkuxnDaSk6gc3?=
 =?us-ascii?Q?E2eVJOYIc5XSB+mTflFKAJm3PHMP48VnnWmwuIkFrz2+rU7LLS39rHXb+77k?=
 =?us-ascii?Q?HSXSVleLxZ0WgGOzy8T7sxqMWbOKaxnT9mcZ4rvl+c3ehvK2mlJAAyM/zess?=
 =?us-ascii?Q?iDM8c6/cdb1famr0sVcXigJWNTbSUAyM7OfZOH0NvEawcy6R0Saikq8nqW7w?=
 =?us-ascii?Q?T2IHwE+AhC+EI18H0x6q8PfbZmpBtfgYUV9BS3LfG/lKT+PMTVAOeyeK3Lkg?=
 =?us-ascii?Q?Goq0X2y5LeCGdrxZrvqec9YruAanhVTKIF4anppNR/1iKQCJf7ShK/KoFgt1?=
 =?us-ascii?Q?mk5SAiPffvUZ6nsSXKsJQVnsSJ67049O9pDkm8JrNszvMSPK4F2lCNlMQfPE?=
 =?us-ascii?Q?g2tDljUYIrkMYZLlw6GsAjM2ZwBJhr15SW9soge7rvoOx24C21oZM56/ejTC?=
 =?us-ascii?Q?t48xUuUDcjHzlGULLpkdIBCSj1JDkQQxFw+TPDrQzfV/fbMzEDH309gkdAsw?=
 =?us-ascii?Q?GZ3e9SzM19VIfGMdteoeiSDiNVRAF+L/sgAYC5QJwH3xkB5QLhV4IYUR9COu?=
 =?us-ascii?Q?qrMeR4xMC9W3rt/jZF8qkSOU2dJPZpYU6hzpECXnDrOb7NqaFYo8t9zq5dm/?=
 =?us-ascii?Q?RVNC65tZCsU/MtAqudtzHiDz1dpLQxiOwBhmnxpCyHxrQbOgeGRbD3k606mh?=
 =?us-ascii?Q?o4IGb/j9jcVsSylhi6/+8C15TK5uYgoCbdJl8D9CJabEN1v+aw+ND9PmOl6C?=
 =?us-ascii?Q?QPanu+qbG9/OErUY81CQ8UV5Yuak5wc8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?27D/tUgDge1PBRdl5KGD5DJkZ3EzDBXdTAexRX8Q4kSaYjj3Klji9y4YSm2d?=
 =?us-ascii?Q?QBA6hI8KxNkTeb7dB5gkTyzVWym31k55F4N5sgLii+feOo68T7e5pbI1Z0aS?=
 =?us-ascii?Q?st4655Brt50IqjxiXIIDdKcWJZO8LKzzeAkNF80E84AIjt6Fx7b6lQnsTWsN?=
 =?us-ascii?Q?6iCTM8nyNjz/pbgseURKElgbRwxuCpzFIKUMc3xbJhSYDSe2mrLT2FCOX104?=
 =?us-ascii?Q?SboKzQ69c3hdchMMP5bh7VvisC90LzsEtBiF4+PFEmHJoGMHUYKr3+7iicu3?=
 =?us-ascii?Q?CJhW8fmTOUnBu+pnqDKActIDs9mSrYpIwHzUm2tq/phZWjSUx+UDOIjs16C9?=
 =?us-ascii?Q?X5id/jvVK1LOmzH/XOoZp4QWcUDzGA5h1ozTc9jWdRw+khmrWAht+sNx4h9J?=
 =?us-ascii?Q?hhOE/QtwBrxPn+m31Z/sCyP2T+JNacLp5IaYgMOthf8vxlbdA0j3UdApstij?=
 =?us-ascii?Q?0HO6uoLUWmuCDME7LTynd94XQzv4GhnaydQdJzpGswURyzqLDQXs5TCAyPXu?=
 =?us-ascii?Q?e0+BXefXQ43wGh4U3EqpYIY/iUk1BcWHE7aLa+WXwBW9Zn7Oguzn4AqoxSKF?=
 =?us-ascii?Q?3AhiMidL86H0LfBF8aJiZOwqcPq2xDQyN9ANhjKCB27vP9A7G9swMHHsaBJP?=
 =?us-ascii?Q?JthBC6gujf2NrVSTo5eBxsYHSt87Te3/nygq+20UsqSnWfj4bsxhF2WXIRYe?=
 =?us-ascii?Q?lfTsy36urvOFpxMXXjvym9sMmQ6nyVww0uYuXfsLuo9YDlcIpo/SlW56a603?=
 =?us-ascii?Q?umgadkzEsQQWRmRuLet0Y4KV5svCjQLZh/HVwy0KovsUkfZQsbbx9B0mgOGF?=
 =?us-ascii?Q?nC/2gmeYDwZ4GgrgyRjyX/o5VX39VOXPlCij9NKz9F+ltX7lNDu1Zkxci7Nm?=
 =?us-ascii?Q?zUKwa1YN7/qmz7STWhBH1mqeijV8pjlwOrgIscTyEXE8x+wfVXe6lyyMiHwO?=
 =?us-ascii?Q?sTFc3An0dWudLBZ+a69WbF5U0xU2ER7G8kERP3zGR3hM+uGQrwmBOMgpluz1?=
 =?us-ascii?Q?KUnIAQTheI12gRukoh5f0SZVGfnLkUS9T8ZEgFpBgu9b8xm/wzIjNmGm9KRC?=
 =?us-ascii?Q?v+agpzdKMe4Nrr4SS1pQXKBLbERYbWVoLTh1oLBTRMTYaSBmByupqOwxnUik?=
 =?us-ascii?Q?XeSHAjnhNrvvSQKVHCcTFkweh4pVfvgWzFPclnIYoe6oOkKP4xmp8C28V4Vw?=
 =?us-ascii?Q?2WYRMn7QpPBS/Djew6F6FEvb3HoqeNxedXVTwQbk5StLFEXH+67E7yltbVj+?=
 =?us-ascii?Q?bZK7/FTWbsxSLy06hnT1kZXqb6yQh9q/nb7xVEeQe1yRnQBlTzPeQNWAUnsC?=
 =?us-ascii?Q?FTkQEaGiaK492skRfVHyFHs3Il3MM0Ob/m9DlT0S8diL61/w71s4qUqJMTkh?=
 =?us-ascii?Q?g7KKl5vwQ6cJFA8tsT9vxp5SBDkhBhwkYczEwPBTrU8EpOEjMWqyl/ZNiRPR?=
 =?us-ascii?Q?WJjBYok9n751O8jjA3yxblGoN0vNwbbadpajJDoFLTh4WazW9rnwDWE3s9yz?=
 =?us-ascii?Q?FzPQo6gptwDkX0Q7WwWMlfLLMXZuHjzA/lIPInsw4BDPz58flWEjpC6ecEYc?=
 =?us-ascii?Q?7HqMYceshGewSX/iQiu0naRgbIs7CzZ297n1ryWHuQTa2HzA5iRUdoUhKZMT?=
 =?us-ascii?Q?NqdeDzyDHyk0XunDvCJLWHM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8a8af85-e3c1-45d4-b7e4-08dd56057e7f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:55.4809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jr1BNaZKIcNm0JUV72uVWqb6enB6uTrhLQmqsYfg4hTVXJTAxUtOwAdYuxjmScbUi6m988HSaob8xXGORmNgIr8nohnBXXA7hLQtoFUucJWodrXU9gX2KlSA0nZYdVBS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt286.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/rt286.c b/sound/soc/codecs/rt286.c
index d0f533120c33..8a4bd8d5ee39 100644
--- a/sound/soc/codecs/rt286.c
+++ b/sound/soc/codecs/rt286.c
@@ -765,11 +765,11 @@ static int rt286_set_dai_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	struct snd_soc_component *component = dai->component;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		snd_soc_component_update_bits(component,
 			RT286_I2S_CTRL1, 0x800, 0x800);
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		snd_soc_component_update_bits(component,
 			RT286_I2S_CTRL1, 0x800, 0x0);
 		break;
-- 
2.43.0

