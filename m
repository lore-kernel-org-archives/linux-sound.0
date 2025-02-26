Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011055.outbound.protection.outlook.com [40.107.74.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3538317D346
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533404; cv=fail; b=syhkVGwEkY5N5Zhqo0TxW62k0VYZIsdyCyZxAgXp3WUat/856JGIUghWikfzFfeB9l9spEDpkWr363r163nmJt0iuX3QOQKOUMZFcdq7gP6ctb6UrT22So4HhKqo7df6rQk424vzF6cvks97SnCMRCah//7Po/UtxrrFZO19jzk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533404; c=relaxed/simple;
	bh=12b2X6vMVffQIWr5sUTu3RTEXuQOZ6icv3ZIDw3KSag=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=jve+xMJcOp7BGVR+J2wuKUiXmiXuCCWSfx4lsRY+2Qn4a4teYLnlC1IT83e6y/NihOpcwXUtnfBW6WYzK+e1NTR6yIiDV0smZSrEIBvKak9my7BImpsK9TCZ+U3S3tuIchKvLtwpG8uGiPjbkGD/KdnBFX+4m3N08HKzSGnwHxg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=AiQ0m3Ne; arc=fail smtp.client-ip=40.107.74.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="AiQ0m3Ne"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OBnoqU2u/28BQjEQAEltuJqX2PfjbSftdfENuVQ5ykKQWl8L+kzOhiKrf2Qp0um/FSKJUGwa0e/uv9M1YGpf9ZXq9R8mJ28EjOvEWEJlPVp/RtbC53I3QRnl2VW3ffUuxl9u8jOfJe9pVZZNvr69g5+mEjzgUcY8+kbvC2UWCwsss0ZgfvlMnz+5iZNb6eQk76rQTxbd7g9LPhXcxZWbT83+Qdvvz05G9zrh4zrKIjUjbDidND5Dun07ItmYnqYUQDmVuFhMbWCcFMb+eWTMCJbJNwzxNzLSsLVb66/zsNh+lozo5cmUUv6q8jYjYMhTZ56ioDxMEDbYQIYYa4yXiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+BR3pYODZyULBB5YKI/BvzFion6s7TMdd6ciSTkO7EY=;
 b=Qh7a+kqzAnRm5NCXN34wc56vZC2ggbpbk7sp23qgck3umInlVn/JAKl339mEWFFMyLXOJeul01TRUoDJ6UMRFswrsYpUhIdqplCBCl5Epw6oqwyYcjlWvif+P595nmJ+nofn6WDA4WAMso4J9XuiN7H21yXNEt6B3Ip5aNLgXo2Vf4Bmei/I4YsEsOp39ejUAkIwkj5ZFcLiwdMggJxoBRB9CN8G/lsdhaTzjCHrsRwZz2tF2zs+e15fhiVTTOftuMWnadtl9/3EVKiQGpnJurg+7E/Dr7gdKukrB0HRNPQnKOf/vSwmKkFr2Q69TOiHd0boDKaqg8Thm94dzinYpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+BR3pYODZyULBB5YKI/BvzFion6s7TMdd6ciSTkO7EY=;
 b=AiQ0m3Neth92wBmpfW37inGYIS6wbIXEJYEaLNpUbys3T0U57Gir3hxur+B861vWm8wmF7oZZyIPwinBp9L4+SybD7BrxMAT1SKQ1tB7JwEezwsqA3Caah6bFM+q1fKNxDhgmw3GISmf7kZk77abmUnmqLDsBU+s5m31t2F/8Sw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYVPR01MB10735.jpnprd01.prod.outlook.com
 (2603:1096:400:298::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:30:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:30:01 +0000
Message-ID: <87a5a9h4rr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 004/157] ASoC: ti: ams-delta: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:30:00 +0000
X-ClientProxiedBy: TYCPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:405:4::35) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYVPR01MB10735:EE_
X-MS-Office365-Filtering-Correlation-Id: d6741158-6a09-41d7-a04d-08dd56051689
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gFJVHrT/KFAGJA3KQ67luIhhAHZbBJ37/Nx21+27WDSErNGCd5/nxNMC/RQF?=
 =?us-ascii?Q?iamnOuZmG0Gj1krHjqewyhoetMZS9n93x5gA/B9TJtsjV5eS7eIbSsp7Qi7O?=
 =?us-ascii?Q?e4fNSHFQoV0Y1vJT3WKY9WOnxngTabjJLgmU+kJnvgyuSctxWU7BXYd0pARm?=
 =?us-ascii?Q?s/yWWzH5zCfxG2HieSO2Q+oMkhDwkeh6PCRf51ohmvs5R0SggcdAwDKKm3rq?=
 =?us-ascii?Q?z+gtbDt5I+uncNU5DjBQwO6s6Ptzu5Q4x2MWKBP4GPFWl5b9P2G57c8uKeRK?=
 =?us-ascii?Q?bNU/ET0eAn08YRGfznHRJlPU0/unlq3iiB5EOsgwElA7JKMo2Fddk4jfICwq?=
 =?us-ascii?Q?p+Bg6x6WZK+l+vRWdgSGQixePPjSqFZCH6j7ZSFoT7hEbD6zxejN7BFQsNvV?=
 =?us-ascii?Q?04zIHqEweaG/Js3nNTORp3wYPj3eunxNiXg4ZO/EznRKFetnHVurhaAUrXQo?=
 =?us-ascii?Q?4eF9vy4mztU8XZEGbph3GGNXIL72eDigQG0elDzR1x249gFfFbt9e2Lm8zSB?=
 =?us-ascii?Q?vyFau9YMtiQ/N4T2KTkxog8sevijd7NZhPFPxECmnGZ2fOoLGUkhZRzdYApW?=
 =?us-ascii?Q?v50j/iVNVO9BwdWHr+dQrhkTEbdAchHrwpN33OOYBVEMbpz8NvqCM4i25HDw?=
 =?us-ascii?Q?XPv/PUEStlJs1MbiqwBRi2nelcK26Z8+XD7PlKn4DBLuV+s6amNWPO7s+/6d?=
 =?us-ascii?Q?SUWLwqM/wiJB+r/yCyEu9IrWTR38AZ2cAXF/FhnhMV92ilpIhOlUjPbK/3y6?=
 =?us-ascii?Q?XcKi/QWg8yUZ2Wub5balvgLWU55jwG3Kbx076+WVLtxif2PG2XkPIlP8tLar?=
 =?us-ascii?Q?CPQv8dol35l/QHhLzNWsaJP0rEpQO66PPk2E4t++uFDD745r/rg1GxND/Bt9?=
 =?us-ascii?Q?lGV0C6sVi7mLF23lhLxvgrEfS/sf7rRjl+ploUhqE+ECAfl/TnzNHorfuT08?=
 =?us-ascii?Q?f0GHCSOWp+W7RYujjBwsLw7vEV9fOtpIp2OustI4xkOefvMbJ2R/jTsupK5d?=
 =?us-ascii?Q?oVQh9VnfcagixDHfThp9TbeeWUChpQmBC4qLBDntgUmxE4z3Gme9clk9OCT2?=
 =?us-ascii?Q?Zt0hwZy8yAa1w6qcn5jzPaVVxmSn2rp+aN0ZiTEAe+G1abOHG5SJJA0O9Hgx?=
 =?us-ascii?Q?Q8SbnMhOpJj9Pxt99MjtkwPMRvEQEsRIdjdymExYOm1LB2p+OpjCIzl2UWrR?=
 =?us-ascii?Q?xxMYKay/pEjnSulm5qgwGpODjyyafdUdVXe0RLzIiKWjzNeDLbUDBjouX/RC?=
 =?us-ascii?Q?mQf2K7kvNz1TqD7DmutozueOSxRWD3ZH0AZ09avbXGGtVerIQEjXsSQVFVHE?=
 =?us-ascii?Q?TsgA7NpJp9jqOGem//30acM+HzqxqObdw2xrd5lqgz5TBv0pv0Os7+BAjhXt?=
 =?us-ascii?Q?CUmJC1XJfXcCzInqp6dLh3SoLotcX9EGIEqkHY+EgRhfb2PiA7kqsgKY0mJJ?=
 =?us-ascii?Q?vhxjbqhY9zV2hVrRD4zu7ScGDmmEU1jD?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kowk0OCmNICAFBfzzColAIekxkDn8EDRc594XL01/F1Vf6MYD0PBmmEHiq/Z?=
 =?us-ascii?Q?zGT1XXy367J4UJH7ndtUgq9WnKs/r5tp2u3SIj3NPRbzB3dIX5EQJ+1EmZRv?=
 =?us-ascii?Q?zsAFzjLsKFBXnHVxaMp4JMiDP0bneEiarZlN8iOJQ74tw1dpB5Pbs3NRt60M?=
 =?us-ascii?Q?Hk85R3bMRM5vBMWX3LQMvdjEKdB6RduBMrw4oYWBJaPGxdOMptAm+2tEV8i+?=
 =?us-ascii?Q?b3lxsBPmbZvHos2v/0bjmdTr9xZN9AYIWU+pQZ3DWbolromlsBpt3uvuCcqc?=
 =?us-ascii?Q?zH9x5/+517WL+WphSDmkJhI0ovuK2RSjb+ej28x0aQ1GJYXR8fBcFiFzjj3C?=
 =?us-ascii?Q?W1Ekidb0CaJJ+ebG3zDAHkQkPd0x/TRjMbEzxjDfgL0flqqTyVuSPIiEbtWC?=
 =?us-ascii?Q?Pz0WlRPJEhLmtcuq15HPjaEZ+9ZQVhOPxgGTJcgzH2Eto11zYTva3cAc3VAS?=
 =?us-ascii?Q?+8BpmVdzv23b/UxJkZF0wwMrkTVjDD1aZVbE2pdiMlo6sVZWYTV/HH56dmBL?=
 =?us-ascii?Q?Re1A9rZ4sGqDWWuqzhqyql+MRjCgZsuc5xjm9xCz+m+7vVqc5VadAx8jpi7a?=
 =?us-ascii?Q?Q+RP5f0pXD8pgGvgtizUXDX7J6Wke3aecQlebL3KP31wWwZtJIP6IeozVrXm?=
 =?us-ascii?Q?IhN2kUT8rXT7t1bZCss55Zmi+3meXeHkUOfZZcrDkv27i38F8gMkh8KPCi7F?=
 =?us-ascii?Q?qXHZeWptw0xvQAZGa51wB74dbN7EDxrP8SJLcpc5x5u0b0RrkNUl6kQs3pkX?=
 =?us-ascii?Q?ZwL4hQTgXVp3oIeTmdHncX6vHyc92Vd4EnqsVHITm13II6fGzRG9tjyA3OK9?=
 =?us-ascii?Q?JVIJ2k4YZO2/fwR7+15m3pBy8CP9Xr/A5Y1Q8EAJTBemWnghIymSQTO5spzq?=
 =?us-ascii?Q?XMI6ESgtfGo9pN1anEdDzmulw96vj5CMyOAr2lMGwLzotWvwUBrt54Ngc8Go?=
 =?us-ascii?Q?DLlp0MX2iDe+FHc/kiF9/iTeiIngSwqEdOcf0x0ojKVp+eFm5Fp0BabCA1y9?=
 =?us-ascii?Q?6jQi5P8sREx6r8nI3uqJ5/cxuXXBAPe5rwULwSF73/N4xLtq8V0JXDkaaT84?=
 =?us-ascii?Q?2TKUjPaLFaJkFBwDoym74ulk6abrUIa7MKj35tsGNPmD403H4M4fy+S9adl/?=
 =?us-ascii?Q?30muuWRXzxCT9Rs04gdWze6n8MW2jyletjL/m5ED/SU/8NsF2vLBvFf3elPQ?=
 =?us-ascii?Q?uYawE4XEHNSJfIqWlbUgU/Nqi0b77FztnlXNgUdrvhY9UMuMOR19AimBDtBS?=
 =?us-ascii?Q?QdsJV3a6kgySo5jb8t2QspKxsYFR30BJDk5mslmBGY0P/T5UdGymX+mPL0hq?=
 =?us-ascii?Q?4aQ9ug5Qza/RbDyr4oOGdjOOnuHJden1L3vUnmKoWjB3BNMynSny/kxNQ/xd?=
 =?us-ascii?Q?yoAdBeUCSzcHkhc7t+HuBbBV7y0JvNkh+6hRzmM+guKp44WS0L84GD2Kcb0T?=
 =?us-ascii?Q?t+m5wFN1NkFgLQ8459ay3RQcVYngwlUc8VlaeEQHgaNZlDsXY8ogUas284y1?=
 =?us-ascii?Q?JkQEzK44k8uo5kABwZj/lep6AnS8HTszXikqjUkdIZUAxlV6HzuMMCGED7lS?=
 =?us-ascii?Q?guB1fEhcTT1gcKF4l1qVHjr1Ufjv9HHSY3WzzEehGcMqScCOWpBMrljn+4OI?=
 =?us-ascii?Q?rN021VAhUHmOdtD7ZCPUbOk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6741158-6a09-41d7-a04d-08dd56051689
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:30:01.1058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m//FbbgINPLqBOAczCFEGpPdiLo+gNpJ7xuYjpwxzKajXzs/baWB38gxpHk8LZ4beZWtmlBpOb4FSMMHvRMeRSAG48o0HEP38VLQBDII2Wyq+sGQAqUTXX4nbPkwrhEi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYVPR01MB10735

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/ams-delta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 94645f275495..8a4423646aea 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -532,7 +532,7 @@ static struct snd_soc_dai_link ams_delta_dai_link = {
 	.init = ams_delta_cx20442_init,
 	.ops = &ams_delta_ops,
 	.dai_fmt = SND_SOC_DAIFMT_DSP_A | SND_SOC_DAIFMT_NB_NF |
-		   SND_SOC_DAIFMT_CBM_CFM,
+		   SND_SOC_DAIFMT_CBP_CFP,
 	SND_SOC_DAILINK_REG(cx20442),
 };
 
-- 
2.43.0

