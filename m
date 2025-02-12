Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010066.outbound.protection.outlook.com [52.101.228.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F7478F4E
	for <linux-sound@vger.kernel.org>; Wed, 12 Feb 2025 02:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739327358; cv=fail; b=kV7GbcFB0Yob4odhOZMrAOGWqHyXLdQVxk3XJDtkwd5HcppE5IIjXYYDmrVj9QuMTyPdYyoiJoi183kWwQOmLZ9he+S6rb0VMQeFcg2fkS30VW0D8jsPlf896bYKfMcZbHge7agEIUMAkqdA1/2xChZcalI+Ko6KbLHDG6yz96Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739327358; c=relaxed/simple;
	bh=WJf78SeRs9M32iifElS5r2u4RwVk6YkmKOby5JU1wps=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=d4DRdLxE4rTIOOjr4K1PyT88qHElrq/ZWqY0SwtPcV+D9JNp9fr/KRsIAP1EWgKRcTyDDaFuWP1mKaUgYMnZ0rtilco6/b67/SdL0wGhX8Bd2tmkj4LdUchEPlYPJbGwMNlDCUGEaHwPHzA4pU87GT9PutNpk/NzoTndrwZq11E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=EB6h5E+D; arc=fail smtp.client-ip=52.101.228.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="EB6h5E+D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKz0mp2zX6Xap/8my/0or3nzROV5VPKz5RNFein0i1Dwsdu8GJwLPnCP6TsmKItZTZEFbjSpmRQibiKUKCFUPI/4tvy1Cb2Hhn95gADM/AT6V2rZMK2WtjnRVPN+5v+quUO6/DO6iwoyxsC30U9+g/gQvLnOX5o/Jy3QYMHGZ7kg8rSDqE/xmQty+NmXnlaFHgsosCGVRQL9Fpy3XJB2rKiym0xqRisIziDR0gFgKBu6HukjgBGEfGw9yBhOD+6dOkUzryMSizkchlkECW9kZLMN/Mg5OrxqyJi8lWoImNZF96vajXOmK3ayBLVPMXtFup1LlHI1PiK5Qr6c8PxADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fni5xxspew2uovCi2hGEtx+lE7LpBfheEKOcZaf1hKw=;
 b=lw2RqVptZXrSfEW4ci879bAe4PY5z2YER4kp105JI6QfxzoaTmSiD+XnqkqZdm6i5GRsgUdELjdtu0DHJULARpOpzzdQM0YpehJbCV0IRu64qDtiSH8kQachhuQXZaOdDMIWhmfcibsX1J6ZuQpYWqB4ee7W4X4achIZqZYArezG4+ru2L0I6wQj6PJ3grNjSXlAFc/K0dnWqiyiasmzcXCSD0CW4YOE+AEXjYVib9nmGrHN/eOOtmL4bB3tCQ8MVUcfMFvehLeFTUmF8FljtDlDnQOvy25hrKNHWDa782jCsA7F8gbg5RIVmDtMMYmvt9+B620BYuhXdz0zLWthzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fni5xxspew2uovCi2hGEtx+lE7LpBfheEKOcZaf1hKw=;
 b=EB6h5E+DkAnsqVuAIGawHGiXwyWAoVo8wO9A2J/y6la0qICtX6dJa+zb/WMqRO4+9+sx5pvpK3qKcFRqYbUrsiE7HAwYyCAEV+BW0qYwIEm7Vi5wcKG7+jXbxMTFeHnlVUKRnOv8g+i7CbjJuMWcLMrOvf4JZtfS+hbZGjyLv+I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB12096.jpnprd01.prod.outlook.com
 (2603:1096:604:260::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.11; Wed, 12 Feb
 2025 02:29:14 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8422.015; Wed, 12 Feb 2025
 02:29:14 +0000
Message-ID: <87h64zyjyd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/12] ASoC: soc-pcm: cleanup dpcm_fe_dai_do_trigger()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
References: <87y0ybyk8p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Feb 2025 02:29:14 +0000
X-ClientProxiedBy: TYAPR01CA0045.jpnprd01.prod.outlook.com
 (2603:1096:404:28::33) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB12096:EE_
X-MS-Office365-Filtering-Correlation-Id: 83d451ae-7307-46af-1fa5-08dd4b0d0af5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?j6teuc20EIPuglV+/83ka7GSDYmroQsF9xNFDKpS7JMdbJZMBh5YrexFeGBL?=
 =?us-ascii?Q?qQNl7PGvxLC/t7fQxDYZ15L+fTrtom6UG3OOc8HQPQpB6rKQBpyikYWNNGgS?=
 =?us-ascii?Q?OdA+GL2ANWmJB4whxHS/gotywoGnYH5+W78SsFHMIS1jiQqPLC0D67HHe0Sq?=
 =?us-ascii?Q?LLB2s6FpevGRcU+0HPEVJXeepEdUR5nYSuFlb8NPfyOcc6EDBMRHJbh5xbu6?=
 =?us-ascii?Q?BHt1pz9fHjjh7FUpLZouzW6pWnWHXHU2XQebLSuCRieR8+I0BziKLQswW3Bh?=
 =?us-ascii?Q?KpNtcfXx/5MnwfcpJmAQPCAyp4URuIxsnugmrEq97aPyl4dzNwQi/1YTpfhd?=
 =?us-ascii?Q?vcrTqyHuYmDOQ/IpN8evVKDG91RKcKf8xD7UTIG9ceuqN6v6ApyW7xfY0Tg1?=
 =?us-ascii?Q?UEA40kc5+3dQ1Sg1rMIWIYnNuoCwrn12A79K5B+VmOTnccTtT9iKMEnpcRkU?=
 =?us-ascii?Q?KPm7oGDzu0KDgUDqFyG1Iv+QWPTrxT3Sv8HL9E2Z/eK/BpqO3lagxzOenK9K?=
 =?us-ascii?Q?NDfQeMZyY0Gd+kdeMKDBGqRdzA8hdADrI6nSuJcTzYv1HAWD+N7xuTr1kiPI?=
 =?us-ascii?Q?9j95c708OFHxWoNj/A1EI3NSZSR5uwjIezHnlf4EuUr0KeWTIUl6mykI/3di?=
 =?us-ascii?Q?rHg872SwXj7uV6LdKEnr0txoE0RzoDtTyw5Oy77NUTnDeKMI3G2voFqqdNR3?=
 =?us-ascii?Q?JpXQ6U6Tmi8rKUGDm0wPibc4onY/bkz9cj9CtjYg0ZPXuIX1zm5BbRrTgJlO?=
 =?us-ascii?Q?Jf1Tv69FT5f6Jtawo4acNHkAOPpCoCkVsAuxK+xwdvbe5uyhGQ/pPQmvuTE0?=
 =?us-ascii?Q?HTL1FtZ/HhBZHJcBZCdqIUzY+0j42YmfmY7NzN5M97Yo/sZhEmvtGxO9yixH?=
 =?us-ascii?Q?x7Q6QGk+pKgmh9hJ6PJ8GKUBRPdtlR5tfhFd62Vtj8cmVRZJ4padC97Aux9E?=
 =?us-ascii?Q?Gx9TOEbAOOx2XS5BsKb2TsvrR99xD7bEJj8h54wGi+cTQOcaxkeBRQfNM1hB?=
 =?us-ascii?Q?wMhiEEhQwul/n2bUuulk77DcWCV4S81Jb7gmQ1enh5EJjmbrs3zgd13M8+QR?=
 =?us-ascii?Q?0rt7gCQMYy26T+TCz3RfDD9EHAd9miRWI0HrT7zfZYDGvELAezKiJns7bh94?=
 =?us-ascii?Q?UROD1wzRtxdADQ9sdH3JwTBJ7RQqTWhmw3EIljhTo32onRB1P0w6l6ZpTm+H?=
 =?us-ascii?Q?5UHfMtiFkvphf5F4SI5F48QsX0VpbUVWYUKmzH6Rsd6I/kH+mIWDv1VmTUtQ?=
 =?us-ascii?Q?kv98sEW4aTx6y+74biL46bXK6QrEH6zK+QhushS2M63OwFIyx8Es8AxWy4Hq?=
 =?us-ascii?Q?zYW0vegGYAEwE8YGnRr63yjH1gNsQ//oJ6SBnjiC25e892/LfK6XKvZNXyyC?=
 =?us-ascii?Q?ShRiBTB49k9X7PzfRGyMYNeF+hfkS0A86xijMd7IdCVOBbK8mS1KpcmKcOv4?=
 =?us-ascii?Q?zek5K8J/MUabuHDE5T+PdPvchsY/SEDM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0y0qtQsCDF5/K1PnGecoJyN3hsaCXU7FrWgPqbFb0UDDD6jRjf+aVvXJzxtz?=
 =?us-ascii?Q?p9kciL5xzYLA0mKWPYsO6ji8tKolK4N3N0psfyMMNBOyikkfKdWFKXq5wdME?=
 =?us-ascii?Q?rizcRPCQjErkMdUDy00POZQeAJ9i0omzhUdbsvZHrbpUooKJtQP1g6MuNhO7?=
 =?us-ascii?Q?yZ3nZkqKQ8OZLRxepzZIjdexCsKUdwyQA9RADpn10zpQ4oF4JkcUE3weFK9s?=
 =?us-ascii?Q?4X2XJwdxPQcgsoL4ykjIkqTTgmUxrvYxvBHUdJem8KsI1tnCQ4a5sKe8aAZK?=
 =?us-ascii?Q?NjiZiqquNc5o3aSzg9YTaN2rcoS3kO48mosYpiUka6pMoFH4M+NHwx4112Zs?=
 =?us-ascii?Q?BKHik9Xk1Vk2PD6f28tvYhtqewptEIGqgv8RhWDRnxe9cGVRltmxaUYB/i9a?=
 =?us-ascii?Q?mkxJaR+4G3/Uy0nZsl6QihbrMTY10vtGS3+fKV0Qe5GDy5x/MGcuw6OHogzV?=
 =?us-ascii?Q?470eNoFwikRdMZAely9bZcAkWJCs5IpqVKLajccNarQS/M6SoI0TvsiIjb6K?=
 =?us-ascii?Q?duFE2lESyrj6hicwCIOfjCAXC8Pfrx8U73C/xVL22e2bixw7OJSfret+FLeC?=
 =?us-ascii?Q?1pWDIgpk+JO/iKFI5ggl76MroS+/plZcl/WeaYhbiN38DjHdeKoTlSAlfI5Q?=
 =?us-ascii?Q?MHUk0HWaZ+D9DlcKetrVm2+tW2OqLAJ9XA7tW4YS0FwtzsMr5yXIXjWUNK88?=
 =?us-ascii?Q?yKKUnbTWzRyX0uS8B+9kNKL01tHA0IlkQhsTXfXdR5AkSKmwNLU2+7TV8Z/g?=
 =?us-ascii?Q?Zz3g2wTcGB07/OGjwSeQbEvV/h3+mvgCxsES8+IS0nMf3JIRKfch3t0MdGHr?=
 =?us-ascii?Q?FGldXy6oLcHVG9lK1SJwjOvyUq2MM9W5ZkbCrKS3UGfNe8bVrZ3w7UK++Ggd?=
 =?us-ascii?Q?cXOEPU3yk6H2uXzzaW0ndxidIdGxPwObq4ZHgqVoCkNC7SUXVglwYRIssucp?=
 =?us-ascii?Q?fXT4jfreSpvJyHoViQgjxt5GMbZ33HWSNI6dVetyYeRhjy+4fF3cgTs4eUwy?=
 =?us-ascii?Q?5Thk/clBW3y3LfxDoOuTXBO/Omm5N9zD5fBGjwAZio3CVVtS5UrhnJy+x795?=
 =?us-ascii?Q?uV7iX0MjHkD5k6J0HzGy3v5ZoOLVqhcrXG6l2Xn7nJAL7DPUf5uoO2bquokX?=
 =?us-ascii?Q?n52fTl2jJfxs1WwkOKk1TYAskEBFe4TPWsjRqVEMPHhT9jut0mMjNiz8eGYF?=
 =?us-ascii?Q?LxVDqOfR2mVTGezpz42ED8wMX4KmviUAB7yXhB1YlGxGar4UKF4toxVUtRvv?=
 =?us-ascii?Q?M7d5OnNh5TsvP/2Ch9HO9iZ6uwrZvj7gP/h+KSHfv50XvqYWbru49wDgYNhP?=
 =?us-ascii?Q?qvrRgA7lUw5BJMKaURurmIECxy/IxO9G3c1Q4DpfIrPGOpUiGAgEAK3CHaDk?=
 =?us-ascii?Q?sy7GegLbWm9dlw6JR0TtDCGjXf/SkNcrhwQ2d6tieir0OZvzFfS7iMoWIo8o?=
 =?us-ascii?Q?7tbYRT7oEiuksfnRvqllKjb0cdLrRYY/3wnrUNpPecoaICucQdDtUPuMsG2i?=
 =?us-ascii?Q?IWIMwh6OtR214ZgayuxbiPKuwnjRtbTC6W2o5HmONeBsHbZCwQC2J/ZcRqdt?=
 =?us-ascii?Q?KJgrIxfg+DphFrcaMx7ZLEojD47RRNyc+0zw7V0hgTvIrCGHWIVcpjX8LEEn?=
 =?us-ascii?Q?o6p+B4/o2WXM2u+fVd9dF9E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83d451ae-7307-46af-1fa5-08dd4b0d0af5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2025 02:29:14.7904
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zdc0GYZHs0rx1hC/JBFlH/R9CWF35HsQCZhKQk84WM8neb7xFdgoUJvr/cIK8zNuacO12eiGov+xKBIts6VBY7Gns2BPnbDEkJM9hSdWCTEcpxajEeTpfdCWenDhxU0n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB12096

dpcm_fe_dai_do_trigger() has big duplicate code. Let's makes code
more simple.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 52 +++++++++++++++++----------------------------
 1 file changed, 20 insertions(+), 32 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 8a3073a506aa2..2a53a2eb4acd2 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2386,46 +2386,17 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
 	int stream = substream->stream;
 	int ret = 0;
+	int fe_first;
 	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
 
 	fe->dpcm[stream].runtime_update = SND_SOC_DPCM_UPDATE_FE;
 
 	switch (trigger) {
 	case SND_SOC_DPCM_TRIGGER_PRE:
-		switch (cmd) {
-		case SNDRV_PCM_TRIGGER_START:
-		case SNDRV_PCM_TRIGGER_RESUME:
-		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		case SNDRV_PCM_TRIGGER_DRAIN:
-			ret = dpcm_dai_trigger_fe_be(substream, cmd, true);
-			break;
-		case SNDRV_PCM_TRIGGER_STOP:
-		case SNDRV_PCM_TRIGGER_SUSPEND:
-		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-			ret = dpcm_dai_trigger_fe_be(substream, cmd, false);
-			break;
-		default:
-			ret = -EINVAL;
-			break;
-		}
+		fe_first = true;
 		break;
 	case SND_SOC_DPCM_TRIGGER_POST:
-		switch (cmd) {
-		case SNDRV_PCM_TRIGGER_START:
-		case SNDRV_PCM_TRIGGER_RESUME:
-		case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		case SNDRV_PCM_TRIGGER_DRAIN:
-			ret = dpcm_dai_trigger_fe_be(substream, cmd, false);
-			break;
-		case SNDRV_PCM_TRIGGER_STOP:
-		case SNDRV_PCM_TRIGGER_SUSPEND:
-		case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-			ret = dpcm_dai_trigger_fe_be(substream, cmd, true);
-			break;
-		default:
-			ret = -EINVAL;
-			break;
-		}
+		fe_first = false;
 		break;
 	default:
 		dev_err(fe->dev, "ASoC: invalid trigger cmd %d for %s\n", cmd,
@@ -2434,6 +2405,23 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 		goto out;
 	}
 
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+	case SNDRV_PCM_TRIGGER_DRAIN:
+		ret = dpcm_dai_trigger_fe_be(substream, cmd, fe_first);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		ret = dpcm_dai_trigger_fe_be(substream, cmd, !fe_first);
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+
 	if (ret < 0)
 		goto out;
 
-- 
2.43.0

