Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011053.outbound.protection.outlook.com [40.107.74.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6554818DB1F
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533562; cv=fail; b=ioYzu4PmrLre3bujhvcP8SzVVAouHcJ6LIzgJVF+F/SQqSOIpNzFFcjrbOGTE6QZEdsAbjR5XYummvKw0ZanFAiX75hSom+VRp+YtKFEaXDNoo4WYg0SB8T79zANsLc1Xrfw2Ur6GLLphuKumVbXQzxj4lJQ1ZR9Siz5TmYAYyY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533562; c=relaxed/simple;
	bh=YiuSCo3eOYkbm95zqeaD+K7NDDdoZPkCfmDkuTh3frI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=hEmXer6yt2bRqA2WUWxLzkm5WR1WEA1dRf0PKDD9mW/uBU+Vvztpm8vphmu/WUTtIcRInQd+YnNiBX4c/e1Az66EfE13KumCJYm6IbsrCAnzGUQs0ITNjDVr+vhzEw7OaB/bKjOq56aP7W/UJlW248vr7l9KTz/YxzAptvecV0Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=U3zom2xM; arc=fail smtp.client-ip=40.107.74.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="U3zom2xM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+BEBALCgJZwXs/vC7vW2IxJ/tYGk3ANqI93Qxo8S3eLl8NxvDhMD1+LkTT4Lera3kF7ykqsPVLC+j53Im+l0wNYSNLXWOQqWFk6voYlz/qtK2VmL5EeStvJ+RbcYclAz2SDrR4DSbKRru6ZJlKlmwKK/WzVd0l4j04LSqqL4RjjKojTputKDeLAADKMuyosODlq6hXjNfAraYRknSDcIDSCYA0k+GEK9a7kd2ndsimmIDWJzETJH1f+zsXUgD6ujenTjY2c84JVHqDZajj6sTRU7GN1bFEes4aUK0MvIopQkwn/XMyeHlc2wAKf+pk/8nrKXMt7MCJuYk4YnRDfOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmqZSzNuRMYvQaXMDf255s0pNdLe9ESTtTftjxVfQoY=;
 b=PYsKE+xvFF7P17CWcYNGVCilQtJODyBNlcB+p2qNm6u2hvdVMa02bESlSY00bc9vVTseL1zan9GeSBztHEMgNCL5yF7IVD6MLvykoocs7dKkDRgdrbIXjwklwdgLLhzSfZ8HWbrrnw9aNG/4GHhdgp65KQ2Ami32ssDMWkKX7u2SN8eECOd7S7aNNahhO+7CCuA61doa4rBOESPCX2j9ZvXp+03ogmze9BQLDTLVBBI7R1NH7LTDPeU6AQ+DblX0ASUCByFx/WUbIIoGQpsTzBGSq91eqDd9nfRdyWLEX5ZYJ1lIlNNpWJXKFMmzBKPq6bT4G4D1irvlRfsNz0YFGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmqZSzNuRMYvQaXMDf255s0pNdLe9ESTtTftjxVfQoY=;
 b=U3zom2xM8zCTSJicD1cMpO+dB5y36zbluarwnBXcHUu4CudQuVAprdAogj7kLY/XJZ/M2jx57gEtpvVkrz9sWsPFHQBa4yv+hiBy4Z7Au4I5yFBRf/3bWgmIjnu0k8bvAw82T7J45lhWS/wnCXka/qeZCs70E/JhtDoYPUT+TS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY7PR01MB14457.jpnprd01.prod.outlook.com
 (2603:1096:405:240::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.19; Wed, 26 Feb
 2025 01:32:39 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:32:39 +0000
Message-ID: <87tt8hebig.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 040/157] ASoC: codec: nau8824: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:32:39 +0000
X-ClientProxiedBy: TYCP286CA0261.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY7PR01MB14457:EE_
X-MS-Office365-Filtering-Correlation-Id: c9e700b2-f770-4edd-6f32-08dd56057513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jUNDyuq6bjS5kJWQFyVwjORT1hHtFcxmq0jS4lRywEbKRwCRBxHWMSney/jA?=
 =?us-ascii?Q?+2m76plNy7NQdM6LiANbhqp3o55mkvxLFB/0vLwcWnR/2VYZIZ45/cJ5n8lR?=
 =?us-ascii?Q?Fc8BaWwM+25CQaUdywuvFKE1q1XJnh7WL2+ETwKC3lLkeMuTBXpvkJwoHjnj?=
 =?us-ascii?Q?K5szcTRNSkCsTqxxrywp1DKvfuw5tLKYWv1WzARCi2scJuKToP+UL0o9y4Zm?=
 =?us-ascii?Q?O8Jgb2nxubenGAXrZScoHkq/LQQpZG6ItpSjlFvm6X4pKPeGPtcWDquAlxGV?=
 =?us-ascii?Q?HMU/GKDg/l9WKkLCjdu54lR2bhLWV6px3n6Qbdvjzk/eUaaeaGuCvf+JB68W?=
 =?us-ascii?Q?9ofT3b76mrSDxCZweP0E3bAfu9y1cdx9gKtTr5rGrDrHdt8WSAujK07mDBO+?=
 =?us-ascii?Q?QdFw7q5iFVwRGxMtZ7zmDRies+n7Vhl6P1C5OtQxECj1fO7nY+tvEf65ESpt?=
 =?us-ascii?Q?CRuaqOWxnTgz/tXFkEGbmbA1LieAkaAVCJqGcCipEvV4KCV5rSdXVW6trbZa?=
 =?us-ascii?Q?A+HcCesjZXsZs9eea2cvnjWiYgniuXJ14lGutHv9gBiJGjbhtOt74QqPZuMq?=
 =?us-ascii?Q?l4qvvr2uHBDOO1PNoZKPXLbWiPHSKntOvUcBkbJkprFVSyD1PqkLVkirj42P?=
 =?us-ascii?Q?WTTp1b59nRdLl1HlHLy6CLQxe8puvuXT/zOwx4/bwWy5nMG15UAyVG0Ao1mg?=
 =?us-ascii?Q?e8zOmAJbSc5DB/fP6QZfe8J+Hd1c4YQ968ATo25igw1MlOjx3CognRF/In4I?=
 =?us-ascii?Q?Y7EmpFknkOm0rZGvhGaPN3SiRDHjhW0JFcf4+o5MRZEEg+Q4IEXqh2iRh+dh?=
 =?us-ascii?Q?ClEh7LR2gBZZT7fqFnAD9lFQFUxmfEA1SmcE2DArRQOFFNymbD86ny9nLDz0?=
 =?us-ascii?Q?NUP+8bMr5WDCAAD5ToWLUXO+x9pSYyTgmTOZaCHPVL2AfZ3YeYcL6Du9rMDU?=
 =?us-ascii?Q?//bpfeqnWrvqIZl18UsnIh96NpLCG+BsglJtYpLiOFk8SOEUMM72+z0xpm8y?=
 =?us-ascii?Q?PYA9N9QFPYIly+HiQyxUhDS92ECctnIuuxS454F2Tv7sTDwwnf6Z6Q0yZKMb?=
 =?us-ascii?Q?okjJ4Z5DnIheKVwmmiBEB4mHLrFZUugJOdmJURblYis9hQGYJcw1k/MNcqjm?=
 =?us-ascii?Q?dXI3XyBcm4h/6NmyIr0ySIWRheieVP3IzU/siL5urEsLANjScGy+dWb/O/Am?=
 =?us-ascii?Q?poytMAsuZ0Mko/IKFhgnw9Fcks/qriH2qsCgYADrkgsCBo8JYFJS3rSGr72F?=
 =?us-ascii?Q?5D9t3CxK5uae4zYqlPSK/bI3pjt/8gCaADSmq8756bjGo4tUiohsYupbeBRg?=
 =?us-ascii?Q?B9IHFupHZhxJ+2RddTG+Ln1k7D5uwLUd9i7fibNhaQNhbwex2LT/0cbEP8E7?=
 =?us-ascii?Q?Oj6jIh97rUzl1P7Tc80gkxCtLYwnYdlpjmNur1hTgpLVRXvBAHsJCDQTGbBb?=
 =?us-ascii?Q?rcWg8k58fiimW2w7oX/4FOysGvNon3SR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6noNQaG0w57zw41gBFnAaeRbmFnV3KXNAHV7D9KFXLT2+VDLiKLkw4Inyb0W?=
 =?us-ascii?Q?VtsdZHNUKpTwTBDnBGs4mrPLzOEidSkMlRUfjd4JQ4s6xPksaffUXemqWxcw?=
 =?us-ascii?Q?ghx90KCSxbZK76Wu16Cbl1s1FeFd5TlLIE0fiKp/vy4Xgt2JwtCqZIf02wpi?=
 =?us-ascii?Q?+4B8H8dmCkiGkNgxD7UPsGrSVLhy1pDBwadfR5PW+MQ3pM9JRnwRCt3RfmQf?=
 =?us-ascii?Q?rytIilXlz4lTW8ZALmWX0xv+x+U197EwbpaeMNODWohY/PaeDv7MuGY7oVUo?=
 =?us-ascii?Q?6n1AM/r+p9dSKOCW+RZ5DPK4rzLo/arPKPw+hdEamcqs2EDWtbS/FXMKPubJ?=
 =?us-ascii?Q?moZLGRdUy1piagBAN1EK4ZPweSh6ruYzWehjs4rt7CamjTzl3RY1l8Oaja76?=
 =?us-ascii?Q?MtFFOj7Ns6wbqg62fQ1DEBxXLOkdxakbVyavazCivy9Qs9DzXQohUeBEzyfB?=
 =?us-ascii?Q?PjjyC3q1SmEOAbLpitZCuVsSIwipDEnkPR3B/t8xnu7pFO1H8xsdEduDcxe4?=
 =?us-ascii?Q?9TyDhIDJBsQW4AW6pzg+l8FeUzX4Vwea4LoTYZLpLIihN114QSWyAwRw+Nku?=
 =?us-ascii?Q?GTbrOefQc0jbVdjGX+d+e9u9WwjeqS3bl5DzCcXUfsl1xLhwlvb+KbuS8MMV?=
 =?us-ascii?Q?1RysURjsXbxI+nAgQ38NTs+7TP+dwVEB8JLYgHVm6tpw/fvgP15dPYW3zg3S?=
 =?us-ascii?Q?lT/sGa3MZ/TXYcLHp//CgTFtBMAYlcS20FvFWDXhHIldJykCjThJ6sKSQRgF?=
 =?us-ascii?Q?l4av1FWfdXjPT0NHOjYz1AgY+H/6Gqdk3+hSpP8hqKNO/15iYXhKlolI9X08?=
 =?us-ascii?Q?6r3AUBCKzxLTp3+TOrz5H5QMdlduyamlaOiziIDbzG4UTWBQSM9nkVUwgYE9?=
 =?us-ascii?Q?vBO/zUCBHNOZ8sNzqiZn5up4yXfO6mXb7xsaF/aFuvd+/+JZoqJuVSLdFWXl?=
 =?us-ascii?Q?/03MVKYpHiYIwjoPguLkfvobkh4isUjaXlvFkwzeieTkI9LmkbXnAWBkNWDY?=
 =?us-ascii?Q?dBNG7yL6+O8qH3jsCWy99r5PA8iBxRVC/vYIM3cROntSvszW/DxA5j3pESSi?=
 =?us-ascii?Q?e9/aJ8eYVVyD+7gSylxAIh5+RMobI91hl0BpD8c/Kmhj+Yo9j+GBDu5Lfc/m?=
 =?us-ascii?Q?rz3zSaUT0xJbzoBWI9DuDEAbCDCPk8C3onZjcSYMfJK1yBf8FaZT81ws9sNr?=
 =?us-ascii?Q?X81ADMFiOmNPAq/SPIlxVv2EPIRwY4SovYXp2WDlNXyX9kcV23BYtbD8RKUE?=
 =?us-ascii?Q?g/CJfoeIMSItC23JlSTyHzx0DxDE6ExyqfEQcdKWDYltBKz4sDECUoHGDRCx?=
 =?us-ascii?Q?osgyonUzcm1Uj3+8fQKKZrmJ7dx7dNaYb0MS12NKBwgkDb5exmdSasRRpHbC?=
 =?us-ascii?Q?fINFzgBdSCpFsJ7D1bSxUG7suILF36ouO+YtRYGMKwHzHsp7tF1LlgmF2jFe?=
 =?us-ascii?Q?0mtTZUUfS26wvPkMLaVd6cOx7h75u1Mn55h7rLgYZiCHj3IG5u16bPG+q4Zb?=
 =?us-ascii?Q?NkrYMb4c8Xx+1IcZiE3jNhQKDu+w6Wt3HtnAxuuShSCByUhmk14ZBVHzqvx8?=
 =?us-ascii?Q?CRRuVzZ+eBQa4dyu0aZrE9JxWLhSwxCs3bSOSFdMRYvY4L+egMQdHX76xWeq?=
 =?us-ascii?Q?XJp518zMvBOIPAw6wp6yLrk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9e700b2-f770-4edd-6f32-08dd56057513
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:32:39.6692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w31gqlFZQqlAyuUilXq5FWGKuHlzTE7sjsqYGqbyTKGvXz4E2gJ3LmeGpHHCQwtBxYUaU2CP3u07ovzgqD1Id4GQ50d6Mn4eSyLOu0t6FEKDDvKMVQmmd4tZWuOt+K2l
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY7PR01MB14457

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/nau8824.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 5aaf8c496300..542bd22e6180 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1159,10 +1159,10 @@ static int nau8824_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	unsigned int ctrl1_val = 0, ctrl2_val = 0;
 
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		ctrl2_val |= NAU8824_I2S_MS_MASTER;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

