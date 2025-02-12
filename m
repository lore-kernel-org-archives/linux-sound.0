Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875DD78F4E
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 02:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327348; cv=fail; b=gM58QZoZdU7YR/tvpfIXEwW8l3IoqjVyEfiwLXFKK3Okl/VuAlgdYopS8H8StmbjSXIy1yR+94btXcNj848EVICGVZF2phSRZEwlnomAKYGF7OUw66BcwSSHMhf3GO/6lhAP6ZO0L31n7demLTMMwAMe9SdythyrJhEy50uvyv8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327348; c=relaxed/simple;
	bh=PfjRVBsFVqFoSQVTNLhhZEIu/FT8q1mzLa4bLzv00+4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Zskf6BLiu3wUo2L0MlbQr67GSZbLBLipSqVNE7hhYi7Hh7mMtPIFvF3Q9zxws/VkUrLLHW2xcOL5mYs9OUgZvlWmdt01xszqiVgnKVCqdFVTVQzHDuMVSZaVzjUL3sY+jU7XNnfeBgDJuxaCQ9S0A/gvFkoqkOJIFtj/QeM4B1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h4NkcvHN; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h4NkcvHN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/c4uozuxTDotpSLJwsmrv3l3QpUOYNzZCIWsTVKltyqlx0liy5L6hoXbJN6j5iNrcbSiAT25SDiNlgDXjRCgubpIxr5pxfN4p9nssMngmZCh8FxIb3bocw0Cnt6UZtRs0auCxbRwp10+75laUeuyUK+IsEXC5A09usveZiA67CsVID5OR0NPbVG2IgxR5CwDdQ7viUyjhC9aAc87jIzgtRdXXUM59EwLmax7e7HGNc3tHC5IsKOYyBVzh8r3h45JWmHfNwFKtwCQ+KxetPeyxkR87DOp2dZx4PV50ltpAyfusokCy+L2lDKtGkLG8OMVlbMHyWF2To4I0l+5W03Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjAIhSt/tYsCk4rT/b6+y7XSxzcKvHMyuO4okBZukmA=;
 b=nXjV2njSz4UWdmwZoMlIgpLBH2RPQh1A2iDGPGJoYV4tALRf6gGTnSTPrDdEnDdYhicuiaE1yNbf9HDOaY157dfiEqr9pg1Ec5TrPKZDfnV2kLQBeR2+Qn2vRh0FHQF4VI4VsbwpwLmwWU2Nj06G4821roKGOjWBwirI8zTOdL1Q0Ng/Eg6DPN7gVE7l+K2BSuK6biLx7tmr18L70FEjWvMNMV2WwypsTQKPua2ElZIPTsyoaerXjz5WKmQV8gmX7mo0Hh9g14XqN0PXXTqU2smLA/C0+84kLJPjmFpYhV9PZVFyfLyE/r91HStXRraBmC4+C3AbWqWMgEg/BnRdQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjAIhSt/tYsCk4rT/b6+y7XSxzcKvHMyuO4okBZukmA=;
 b=h4NkcvHNO2HYLzWqt3R02rL6pGc4d+itXAy+4j857nuMNYQaYCp+1pE/FMLR8aS473u2xruzNUnho++i5STWrcaoFlk3vALdBOwldSSDdyJtJNFU/JAKoEyWXNX5Qu9GzBdu1qAfYR75cEeEaJyS3+IpD/DsH6U+vgLlaz29kBk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB12096.jpnprd01.prod.outlook.com
 (2603:1096:604:260::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 02:29:03 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:29:03 +0000
Message-ID: <87ikpfyjyo.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 11/12] ASoC: soc-pcm: cleanup dpcm_dai_trigger_fe_be()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Feb 2025 02:29:03 +0000
X-ClientProxiedBy: TYAPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:404:28::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB12096:EE_
X-MS-Office365-Filtering-Correlation-Id: a5f59063-01ae-4687-d368-08dd4b0d043c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kaLljiBCUtfW7dhHt95A7sfPEURFb2Jp9lKK+Uj/LSD1ffL/DPzTVvEUWSBc?=
 =?us-ascii?Q?ldAIcO4t7JCgO0boEEwgb4wllYdylXOR3noGnyq/GxjZHa8Dwowl/L4X9Fzj?=
 =?us-ascii?Q?b/Crw1EmN/57z7wwxYk3cK4t4FtxNrRDTkxJqnQjHa9JMwkeYBxgUZIe1QiU?=
 =?us-ascii?Q?RvvUY0FQYQaehEMrP7BAMsSjOP853IbpcgbMItozz1WoHXPE0LfEa7lJjqgZ?=
 =?us-ascii?Q?DcIPHblJMDhkX0ms35ipX9DNYHNRFJSkgelUkNUPPMWLUW3RkvxZq7FebnH0?=
 =?us-ascii?Q?4Bw+ffzD5tgkbmgutX2bGVf397UZ/szqsSqKzNqIY5MVSOtHiLKfHnNaPUQU?=
 =?us-ascii?Q?y21L27Qldxb3aHQNvCH5jEtByTpKic1Qu8Bhi/LcgGweIhhNjNZ+Zf5YKYWA?=
 =?us-ascii?Q?1PExH0SHuC3Z+NUBwB7BT8lWR6Z2U9PhYGlAfyuwMekEPhyxCd2L+f6s9K3M?=
 =?us-ascii?Q?hQrmD0/V7uJwg0Cs2rGxpKTbOH78Eq/ydacbHgSVeILWIqtMLg/ofES8fzIh?=
 =?us-ascii?Q?ytbhjYqPqdIMNcNXG/2Rb3dHDc9/jP7U448QtWMLnuOIjcV/9/LgZdtsvvfU?=
 =?us-ascii?Q?3uqXXCSvHxPKUI5mAvs2xYlmjVPz7WJJcvntVSgPwWoYkIP6bIkoVQwiJ2JV?=
 =?us-ascii?Q?c8AfX0j27C5Ne9iYdl0MGdydUUGwrip6+fOZ6nQVmvpWBlFu837BSD1VjRN2?=
 =?us-ascii?Q?InOjefAo0EcyoUiqtQQu46IfN+IEoMSDP+xdM9g6Ot2Y6oggABrKindLz9cz?=
 =?us-ascii?Q?fVrmeD9SNkRAaloYStSZq4oR0V9Wk3ZW9W2eD8mKsfykrfr7O3fRelKx9mzN?=
 =?us-ascii?Q?9cO/96K8GaAMGRycT/1LWUH5fKt5sd33hAGcbPuciUGaTlg7Xfqz8UXA+E8D?=
 =?us-ascii?Q?9q1sx62SbnEp8o66sEyylDtMNtQwVGnarNX4vrVCEjD7HKU+HMgEj6mtx6ul?=
 =?us-ascii?Q?xhfjt2x9kdm7T9bOy4vn/9fcSPdQ55M7Xim9hawg6zPSmQlmgKjZNshRP6Sw?=
 =?us-ascii?Q?lf0XlamPqMyzfcybOSvs+5DZjKvg6rT44WH7HVrwCzTu8dAHZ20E0SAVHjVC?=
 =?us-ascii?Q?NwYzEdJL5Ma0W5HiEaFMABRjiXZUbqc4bX8MUC9YMWWtY8kl57F0LXMJ6pUk?=
 =?us-ascii?Q?2AVEhZR+PxJZC4KVccrWMGuEeSxNJMZPeEdRqgsS/hHbXrUl/l7Dqehx59EI?=
 =?us-ascii?Q?tZUoVqoaWw0QMh7k2+Ou3Kxzk/fu9aJ7WG0icHSV/52DKK1r6YPdGzl90v2t?=
 =?us-ascii?Q?BHsH33DE35sIuN3LDIMf4L5UKY6MGUXNEEprGrT600dJsW/mzlf4mnV0bU0T?=
 =?us-ascii?Q?Xlse/84OJvPvB2iJMYlkqMRXIQBDzQjipQcw0hbutb8Dc2DQX9nkc3da21oO?=
 =?us-ascii?Q?28yAZPj4M8UReD3KjFxD3ne0Hf2yiJBdWyjOjkUMu1S7X4rSrunvzJHWWn+E?=
 =?us-ascii?Q?ubckCCuJdIE/tHJTVN+jMWwd8q/tmXkE?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gjxgfkk1I2gNJw6gmkuQD3MfP0kI5dKJMJ7OdbVW3M7eRwwvofIM3+Do1Woq?=
 =?us-ascii?Q?2owu1FpAB0XqxTn4yvu0gQDTeXz06Ppjy3BLguXKnNwI4/zY7S1jnwvlTL9z?=
 =?us-ascii?Q?3tduDpVQ63RJwKfl8cPAJ1aJxX6dvqAOTRAM0x2StxZEJl2GfVJRa6cGvuvl?=
 =?us-ascii?Q?An189yVEQ00Z1/viWZxmrwi7y2Fg2gYvPV5qIKoc6RRJDXU5mAaGPh+o3LL4?=
 =?us-ascii?Q?I25u8fWKyPdESicUYd7z73132b7DKgzlqqOf8jqGIGQj4rWtVjeHoRq2g0Du?=
 =?us-ascii?Q?3kyoFOLhFSqrbjqqQ+vRVYgrvJilrUxp/oOYqO+EHwGx8mPxwFZat0x8K+7U?=
 =?us-ascii?Q?yDzMQg89gC8KzXEgPyHaTxXmaOEg2a87hW6tH7jS0GjpLXmK1gYqYAAWMVwm?=
 =?us-ascii?Q?H6mGiGNv8VvsWswY5dQtr4PSPyWf2REGQ3pKZw/cVVkeTnNxZQcnQygS2JOV?=
 =?us-ascii?Q?/BH/6N7ZFhJT5/Pz9oLo9hXLJlI6nyoPG7qMS4RbDA/kh6b0tlgXMAdYVUvl?=
 =?us-ascii?Q?1rLoybWnMID8it2TSZNpH2lNodnQdLEuUjuOVTFh6F1WzS/qHQMnBzQV44OC?=
 =?us-ascii?Q?t1jDidH5B/EqLE0pSWCj8YnbY3/soYxjcOv/15/yT4JqB6/WUuTrGZzBAGbt?=
 =?us-ascii?Q?sRp1jFKKKG+s3/hd7cYI8n2/oVP+9dWQUs5gQeEqW8B0Nh6Gs4+1oaB+1DS3?=
 =?us-ascii?Q?e2LKbNTOfRSobedSl82oaF15aNxDtRvZ7RRxLuqT8lezJFYJmKIaYUliwsFw?=
 =?us-ascii?Q?YxaxQ1CnKEeboGUMLHpnn0jRinG6/u6xeYbj/g0uoH/27gBp7QW4rSEeSiyK?=
 =?us-ascii?Q?zDxw05RLL4q38O0Na6dyuRQfS/jqRIcQf8OK+ml3BHqHSacLGGxoHbSgK/hI?=
 =?us-ascii?Q?DXn0ufG1BZvXSLr70yIgSF5gKQf9HNJlxo6l7YyLT0e8jUmf2QftOtuG+8yw?=
 =?us-ascii?Q?uZlLyDdBsV4dxeh7GqoDBYiE+0Dw9oJxdG7mVHgfuqOr+32+1aptpMsJs4LR?=
 =?us-ascii?Q?87zU1pnvbpq5rsZEsJAGo65/04OC0pHFI1Jc7DDbQZY3q+20fw7Z2Hu0/EVK?=
 =?us-ascii?Q?nGULTPMq7zIbDYh7vkp8CxfN2kjRzGUmXRnoCp9/0J9nx1f5b7fcTDliTAWD?=
 =?us-ascii?Q?5zpagt/IieVmFz0DmW+KBDYcYphdJh0KkHpl3FrzZrmljJ8yGj9A1tfwCYQg?=
 =?us-ascii?Q?JfU1lfNUJj3e+u62v2eHY3FqutnNdmxuXnBzc8PnLV+ZSi1Uer2VDNA9g1/0?=
 =?us-ascii?Q?rivZhbJ4LrgQvAIICqFEwXQKiOLX8TawVRcFGEhQDzbyaX20er3jNGO7oP+o?=
 =?us-ascii?Q?R6QS6er9vJ9/vIhdoCfZENMbR4oCoW/JdD39Npo1z4VXju4rsXS7CPPdxHO7?=
 =?us-ascii?Q?GqYNm12c1QPWEwRQocJBD3c8zwDdU86zUgATLFBy1koH7zoGU8/Qhv/LfD7i?=
 =?us-ascii?Q?9Kd8qfRX45M9fDwfUVpbcB3iYZG2a+SNxVz6WUgxDiTZVZsR6aJjf9i08oF8?=
 =?us-ascii?Q?Z83ogG9aVLGvw5TiD0daYTb/Pj0Sse2qdTO5Z2ms52bPtAnX4kqlc20kAge6?=
 =?us-ascii?Q?JItf3+2MT+zQxIH2KzH0Ul84sKwTikUhDpliGpWIYt2uF2S9sLb184uWIe+M?=
 =?us-ascii?Q?loMNqZpIB+bOqsCnD6NgpOM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f59063-01ae-4687-d368-08dd4b0d043c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:29:03.5292
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+EmzO8nLyjKNPeG41U0thkWkOsUKhGsU4tMGkjrSMlBnbUKvISQxVxkkQQm3x3QjkO/RGLd8QKXgwkmXwT2H+LlKokMwKdOHlYhDF8R/CfbGqsXMgq1DskR+vjhT44u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12096

DPCM is already difficult to read, but now dpcm_dai_trigger_fe_be() even
difficult to read.

	static int dpcm_dai_trigger_fe_be(.., fe_first)
	{
 ^		if (fe_first) {
(A)			...
 |(x)			goto end;
 v		}
 ^
(B)		...
 v
	end:
		return ...
	}

It want to switch function call order by using "fe_first" for fe->be
order part (A), or be->fe order part (B). But the code is using "goto"
in last of (A) (=x).
Just use "if..else" for (A) (B) is easy to read and understand what it
want to do.

	static int dpcm_dai_trigger_fe_be(.., fe_first)
	{
 ^		if (fe_first) {
(A)			...
 v		}
 ^		else {
(B)			...
 v		}
		return ...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 96776824d9daa..8a3073a506aa2 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2365,18 +2365,18 @@ static int dpcm_dai_trigger_fe_be(struct snd_pcm_substream *substream,
 			goto end;
 
 		ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
-		goto end;
 	}
-
 	/* call trigger on the frontend after the backend. */
-	ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
-	if (ret < 0)
-		goto end;
+	else {
+		ret = dpcm_be_dai_trigger(fe, substream->stream, cmd);
+		if (ret < 0)
+			goto end;
 
-	dev_dbg(fe->dev, "ASoC: post trigger FE %s cmd %d\n",
-		fe->dai_link->name, cmd);
+		dev_dbg(fe->dev, "ASoC: post trigger FE %s cmd %d\n",
+			fe->dai_link->name, cmd);
 
-	ret = soc_pcm_trigger(substream, cmd);
+		ret = soc_pcm_trigger(substream, cmd);
+	}
 end:
 	return snd_soc_ret(fe->dev, ret, "trigger FE cmd: %d failed\n", cmd);
 }
-- 
2.43.0

