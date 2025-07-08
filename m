Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92D5188006
	for <linux-sound@vger.kernel.org>; Tue,  8 Jul 2025 02:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751942810; cv=fail; b=BXkgloImo7FU2GY/3cwbYG3W/HlxC2elMUPtcob+nIQV2C9cUe2W/tKESD+Jck2MDY2GoxINKpm/E9LqUmXZdzhSd2+W/lrk0xVcPWkCHZ/gWsisp2L6ZYKrE2BHklSC91M2A4cEgoRdUgvVE6B0VdiV2Bb45YobrKn+M/wxFiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751942810; c=relaxed/simple;
	bh=3vXN6z2EfEV7A2wuopDgufcmhfk8lTonVYL3Et2pSek=;
	h=Message-ID:To:From:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=OhfI/2+g7nl8rM1kgyOU4UYzucWBDkIkcAfX1ixsb2nHeoC+0HMkLHVeFD9b8uVrAIAIHvzWe1OpNonA55yYECIBiNkvCIq8V9CWWbVJPAZJkTapAHIXXNN2Y/HVlYNA6yylxmN5SEdqPzyNmjbmntRHttXdGYKspH/7uFNNuwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=lDhcQ821; arc=fail smtp.client-ip=40.107.74.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="lDhcQ821"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5r3omCM9rXC9Ph+0r+LSN7Jjzp8vx6ESi3hFKDdvyzXc53dNezEis+6q3CJYIx0YfW5PZAJtOZNqUxZKpois1O6L9fINNnOHILWNDBMjaGjceCA3ZY2WWNuciOoKcP8GqAL/tbhC5nNVX5Dnc7IJBmU1CToyLybUUE4KE5iZjKqr1p33K/XPAzW5HZBFaGhG5CoqPsi3iF3nx4RBiTX5kxQQMbVuiGXgA7rrg9oGJe1RMdwd0spBJgVuyXZH4y7Cqzdm4J81pipFFt+qcy36JVvik5D0bTFvPHkX4cm5Vi0jkw4wW6AR5q8R7BMbooChFgDIuZdCZcha6+JGZaIEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aYukVXASxSzN3N4aI1VZFbe0zZm0XD7j3pVnIpUGU3E=;
 b=ZR3oyvz0fcqcbEj7Pkw+SjIc19YjmsXSBdttAFrptVOA3ORMLywzoi2fbI1Ra6yNtxDVT9MXYgoq8KHv3kvDJbbvzrCHeGR9LEa7z08XW5MHgP2XMmGpICLBRnMTzs1/Zy980ETrqMuB68aWM72s/4tzqM751NNP1W1TnCDPnsez3Y+vafDStUJ3YVeIeKvB64fEqlrYhmqW+K797fJyCaO5X/4Nngft/5V+NGrv1GfNIu1xvxaLYsLqujPwrq3JWbqlDg1nAzYKN58xfWueU3q1wAkTXHKMMbOG/ptWbV2O1LkKkFjyqbYC1mpXm8xXAySicTk3sA16nTy1o94x7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aYukVXASxSzN3N4aI1VZFbe0zZm0XD7j3pVnIpUGU3E=;
 b=lDhcQ821KRSC4n9dTp21Pzq67UbzQdhYtUeFlNAW/VrfAFtoTAafS9eo6tgPlY8QBSfzqNhnDzwl+bgyGTDbjjitEet5NI8famLnOnbCXvFT4lNFWudcSgPIrYvKO+Hyn1/pb0aZbtA3avmHxuUSIyc2JcciCXC41UN85KAUmok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB12162.jpnprd01.prod.outlook.com
 (2603:1096:405:f5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Tue, 8 Jul
 2025 02:46:47 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8901.023; Tue, 8 Jul 2025
 02:46:46 +0000
Message-ID: <87plebmmax.wl-kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>, Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/2] ASoC: rt715: don't set dapm->bias_level
In-Reply-To: <87sej7mmbo.wl-kuninori.morimoto.gx@renesas.com>
References: <87sej7mmbo.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Jul 2025 02:46:46 +0000
X-ClientProxiedBy: TYCP286CA0187.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB12162:EE_
X-MS-Office365-Filtering-Correlation-Id: 60dfb43a-33c7-49b2-ff4a-08ddbdc9ae5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SjheCp/3JbK+GxvptirbbMt4RNQXj4R/pI2rDPCUjZ65/ed/xnO8O+NSSol8?=
 =?us-ascii?Q?ESoiU9SFjKLW42yUVk5RtWSsdQSJLxdE3Fhb5khBK+Q/gf9o6Nvp8dML2yHz?=
 =?us-ascii?Q?kt1h6X/VVYt68jyXqqMPYe2RQwIpUV26A7dJ56+ytQ6qRuSFG0xW0ue5/LmR?=
 =?us-ascii?Q?Vwnb7TozPvwm4Pfxfax6mWjBeRwpb36B1XmUejmpWp/9jXvL2N39ZQ1NCJ/b?=
 =?us-ascii?Q?Qh6QElolsHcqdCxYG7IPPWRemq++pAt9UOovVszJJQwTnWRqwSJFajcSUGtc?=
 =?us-ascii?Q?B030C5KHzVR5SMVjtoeMRJMfF5/rKqKsg9p11xQlNiOVfbN3UAd03Lq+KAhG?=
 =?us-ascii?Q?Z617jTv/6yhfSxSpK2W7SyEJV9OwlWrOaPmlS6NGKzxHlf3ZOsAo0uoKTobB?=
 =?us-ascii?Q?MDXlAGrdN7qccahcvnBsbBrbyx4DaQ2AeC20gy1hcgFNquQsbzc5pC9Do6BF?=
 =?us-ascii?Q?hsoMoN9feUxBAGLbZAOR0ISdusxmsRjwjqXvfkymAtkqiBgawufjL8sMOvFp?=
 =?us-ascii?Q?gjCJW/a2Zoa3qccl+F50b02Eg3gsfo9pr0TYwX5QgvGKqlRBYBeK+aAFwYId?=
 =?us-ascii?Q?sHhBAoEE8XXLycYlb3OkxPM5gmYjeSoBlQyNbff81F71hwTapW3VYxQZ+DpS?=
 =?us-ascii?Q?25U+Am4n3P5bFmBWhYqTTW2ks8g3Yzd2DTSKFFkNdR99h6g2SHB7hXbulpq1?=
 =?us-ascii?Q?ARXdFsY3k+LWSDFfPGhIkcPB5umUXvVrxLxRb4Zc8GiiC0NgB2D6/t4C6iOl?=
 =?us-ascii?Q?l1dR3RAPbIDRiqTaJr+sbeSm9IEOz8dmOnt5lFrdCkvAUImB0BoMdYLchkiQ?=
 =?us-ascii?Q?/WYXvytOVn4eFmfoglZY1UVsrMZ1iNjER/oYNNz8SQ7akOvIDFpEvaAqybz7?=
 =?us-ascii?Q?s6wBP3OOn+mZZautdBgoOIFiES6kOQ48tt9yCckJKFvoLG77ETQP/M6NHIPt?=
 =?us-ascii?Q?nMfJzpZFRubrt1qZKwWhHNpXk60JMfvizD5bnrapSIk2iUnXED49lcczEyiM?=
 =?us-ascii?Q?vdcZ3Qdj4iCVbRugFr/Y8/utsBKXRBBR6H51sju/LHyS/mx+m1fjXmHFc9zS?=
 =?us-ascii?Q?fcAYRZ+OZQFEx3B/ksI+ckWoa+AjkpdemaHx8duBZ/0E2lDPz6O5HmTlKlbk?=
 =?us-ascii?Q?CPpjEUTJVjsDKIMC6R0jQznCilw6/KPMExMPVGXcvxqdR1jbnofKqZMrI/xF?=
 =?us-ascii?Q?Wp+JFpWx+cwH+070TqDFBY53en4ah79rL5CN15+oWjirmYARu+GLwDuUdgPI?=
 =?us-ascii?Q?JaDZwJslZdVU+KkOJJJEezG4SDYqc2/isyXU6enIARPBEXt0nrqPAU5YRawQ?=
 =?us-ascii?Q?iiS8AnA+TcAXvcnTyOu/46Ex/8wcu9egO+zia/YOEFhwgtGWDtCZ+li41Klo?=
 =?us-ascii?Q?xHwYHcFTMdtWUmlvuOFI4z7jjyboDMzSVjdp3H7tJE8zzN7VMgTRUhefux0B?=
 =?us-ascii?Q?8WJniKEyYq++HS8KHXZKqtVDZc4SWL5Usj3d6pEd+KiCc52uJ6VeWMAkzgNe?=
 =?us-ascii?Q?3V/s8BqCegHCLoI=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ORT+W50eYMy08QU+uKUToZI4UYSZeg6lnCo+2aJ0fogGHbprtT47PvMydOlC?=
 =?us-ascii?Q?z9GqOtkospGgf+OW9+tgNMwVBa9gZDjfuWeVioa5UrJxgK9W+0Bc7I2VzUb1?=
 =?us-ascii?Q?dS7AnsqwyExBuj59bD3VoZ0o3Y7EYEHNdRDL53GRX8nxyskSOjoXSHooYROU?=
 =?us-ascii?Q?Qn/tHah/VYmgeA+C7Eosfhiooz3dj31s/jI9Hl2kz4sdY3Y+jm+/7Fie/33v?=
 =?us-ascii?Q?iwJajq7Un0DxZO7YPnk95Pim5j4DlLsCEw4CSenB2VEIRTv3h+JLIAsvjq4c?=
 =?us-ascii?Q?ohi8+2f3Vqbqr0uUuE6BgAt7RwMgB/blk16hrwaqCRc8KRcBlcORScMGIhLB?=
 =?us-ascii?Q?9zgNhisEJfyyRJXtABtXFbjbuzo6KJmDg+znseQ9SB3ZhZMLpA6ArEUCh5NH?=
 =?us-ascii?Q?xBtw0M4UxsIm48mUh4S4Z/6k2Qn8lpUaZP9uMCTiFVT8WXeYHG0lfGvyymP1?=
 =?us-ascii?Q?QCCc+i5fpFqTk/bwlHCBFqbGrFlcplisbGtk1Jk3wYTFMs353JGb/gpnvhBQ?=
 =?us-ascii?Q?580YvPMhjFPNziOHlfPhlUqZSou9B3YODjvB7Jb984KkGb3ptqXDAgToSzHR?=
 =?us-ascii?Q?f7/qOLSbj54DJq/p4Y9G9ZO0FKXwrp98q/rcWGoPGd33020+30WeSaku+HEr?=
 =?us-ascii?Q?Nz8sI8MUMXe/hT2gomh2UQwHsdAqCoSZuTlUhAfrAdflfPEmoS1FVvcPDLki?=
 =?us-ascii?Q?LRK1B28kUzKUX3QR1sZwYcsYP4g4DmwDVTZTjinCLhm65ysdLpvxR3M8tXk5?=
 =?us-ascii?Q?VOTB+0LEBR/Bpw2EA7B5iB0ZtYooYlB7r4Lky6ov5nLNt/xyOlaCDXcoct3r?=
 =?us-ascii?Q?iv4dXCIehQFu1YU6mQTZ77MgoKcq3ZCNxZwd9JQwSAv7sJB02oFWxtjl/LtS?=
 =?us-ascii?Q?O4bee8WEkazwPDB3rLlOAolP4LslaswLB6OFLtZtJAI2P1PCUyhugkQmULro?=
 =?us-ascii?Q?GJTaO5lH/8L9j6NxB8/GDCvDbDo5POrmK5SKHuKvrSKsVEc+weFW5gHBeqLh?=
 =?us-ascii?Q?mAH0S/otSciXxnLN5rGzkNEfHl5rrfGmP2eRyRzZVaaMaw/lPWencIUgm2Ld?=
 =?us-ascii?Q?tB0Kje1z2gNWNSOj870YHc9FiKumiLJOvwElYTM/BVXOiyOb1qp0pm1AmNM8?=
 =?us-ascii?Q?66BxvVGNGmaib4B7/McCCz1/9PBnD6Hnldm9j55hHN9RpLCTbNypY1N742aZ?=
 =?us-ascii?Q?ZH+U/ZPbMMG6yxdjQaHmlfE9lD55cI/gCKn6BDqtW5oQwqRFfn14AqBWia1x?=
 =?us-ascii?Q?Lo9kI9wplkyTbEvCBixkzS4Wz0vrQ9eV3Hu5js2DDIC8Q9E3K1tB3l5ewII9?=
 =?us-ascii?Q?2F8KxoRLnM3VkUL80SKTqRrwMxhEeNSBWtWnAf3gjRRNVhl+Qw5pzSVyYi/N?=
 =?us-ascii?Q?sd5eCXGYGrQBiBd5hCuXOIvKZmTx7zXn/RW01lqOXulZmbhYRysC+olavwwW?=
 =?us-ascii?Q?tBpMSx6hSLZdPVSjyyOSpd2fzqDjv4GKsEHhBvI2vKNn/SVj/pNzOTTSwV65?=
 =?us-ascii?Q?J483lbk/9acIQ33T1Cm3lr/uVxYJpcDN1OBp92pMdOR4n8tfHuLOK0BqbIgO?=
 =?us-ascii?Q?jY5k2kxst9R8Wb2UQPYY+CLlvLI1XwHi1kI/wyDs3z8QiPCD7LK3MJu2CBlS?=
 =?us-ascii?Q?4e7biIUoHIfI/d1+EFZhNQw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60dfb43a-33c7-49b2-ff4a-08ddbdc9ae5a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 02:46:46.9279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wUNVmz/MPeTnMKsRC0ty1gz3M2e1CpaLeMuT1h//xYW6Xqzbey3pOEBlxfFXo9m7W6KJDGm2r97QQ5WhlHYAbmaV/zh2hJk9gXkMBUAx9vsRQXeWg6LZ50EHlQyKFB11
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB12162

snd_soc_component_set_bias_level() (A) which will call .set_bias_level()
callback (B) will be called from snd_soc_dapm_force_bias_level() (C) only,
and it sets dapm->bias_level (D) inside. No need to set it by each driver.
Remove it.

(A)	int snd_soc_component_set_bias_level(...)
	{
		...
		if (component->driver->set_bias_level)
(B)			ret = component->driver->set_bias_level(...);
		...
	}

(C)	int snd_soc_dapm_force_bias_level(...)
	{
		...
		if (dapm->component)
(A)			ret = snd_soc_component_set_bias_level(...);

		if (ret == 0)
(D)			dapm->bias_level = level;
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt715.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 0fa445d88e232..7e1628a5c9d1b 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -775,7 +775,7 @@ static int rt715_set_bias_level(struct snd_soc_component *component,
 	default:
 		break;
 	}
-	dapm->bias_level = level;
+
 	return 0;
 }
 
-- 
2.43.0

