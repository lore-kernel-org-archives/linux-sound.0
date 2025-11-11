Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011040.outbound.protection.outlook.com [52.101.125.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101E51514DC
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820469; cv=fail; b=rw9Vfvd5lk5ieQuBVr6CejMv1MVIZHYf21bc/mRiQO8xyZVCaR2vsnzbc7gzlXAbQQ/lIkM8pqDVPbeaVf0LzMjnpWrz3UpkKlGn/dcR/EozAiszaxHc2uZHNpAv0t2WueQ8jZ1FMC2deLYQ6si3uE2mscF5nJOG78QiTHyYUB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820469; c=relaxed/simple;
	bh=wFjP4C/s8rFcJuUaVzdCjPx3lPGMKo3sgfiYn5E0VDA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=frpKU/L4cTPNWUkZHGMQ6+ofLVJ6+6EoqHjKq/qiMk6ZExVwjeWIRdN0k4PcvtFWXDFfSZRvznAzrVc75eRbzG41MEWeXvv3XJkPa9Lgi3qJNjE4UnxQOwpM3MJFqA9yH8f8w6qjSL/MkUDr3hLLgwu8PkNISi8XIjK5nC/L9F4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=c+zDvUA4; arc=fail smtp.client-ip=52.101.125.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="c+zDvUA4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDIyQafnIiSCPJu6Iro0KJZ1phTJM2j3O0iIKi46VjKplf2mbPcUclL5JNSSJ2Q/d3JQuLVX3GTpB9H44dZ4FFdYN37CC+hUF6MCR+1QVjH1g0/Vl2/KGgzDem0RHhzmESaiUu28PeffhketEcEUfzLX//kk33L7zJ6XMGZ5inrx/S0e5WTiwwsfbnTwELNJnKDwR4YRI7YN+DQnPKokAGL7SssWe9gkDacIFhWRXtMMC2dFa9BHdseqmPRVIod1j/PowhovSM+D0RkdcDrOukM9b3sHal8ciPcFRc6DoHH5cvArZV4UQkRAFoOlPFcW2jUM/yOeE42SrJ9Rde4Z4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fBmw4jkz2p5i5og6yXdeuDMtb2rWiOLiIt+cD4TChU=;
 b=c0J0D8Kl8V2puu2tDpEntYOdK+BruOPE4wxXgHjoGpL+gRTyO8Ffb8vs06oVoeIHXpL7MMFQ3sMiT86v0IwGkBn1ZiIkM6pfx7b242jqShZn+fC+S/nFdVB83T51asapZq2eNYOZuTNlD2fQSjJTu8PSEO3Z232bFwAZf6N4JaoMVS/a/1yi/ty8crdm2+I/ex9ye6KPSJp9QRGLbWf0IjleLjyz2zjqkJasq3xlDUN/VoqudJsFsR50nGarUlzeesezQ7FoBHh8CGuJuEwn46ntFaUx3Wz9s5IO7vQou6C3uNxf2m06SXGENioL7tcmiAA/JR4U4iRNOe1KTeCCJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fBmw4jkz2p5i5og6yXdeuDMtb2rWiOLiIt+cD4TChU=;
 b=c+zDvUA4SJ7Gh1NG8XUBtIDX3qY1mArQDY2VpKN/fjvL6FZEemAcA2Q78X/XeCPMlViiYxHIE3h6sPLhGrXq2CtQDcaCb5d0633XUa8CXeCF2Be4jLNcdiTY2zR56N416DZtRgN0sZFOJ6kQzPKwKwYJNubgOan6BGBN5NdiDTk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6994.jpnprd01.prod.outlook.com
 (2603:1096:400:bd::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:21:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:21:07 +0000
Message-ID: <87jyzx772l.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 044/292] ASoC: codecs: cs47l24: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:21:06 +0000
X-ClientProxiedBy: TYCP301CA0071.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6994:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dd41809-5e16-44fa-55d3-08de20b83512
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V6pnkWNzPGqMphuhLvn0vQXDU7Uyc1c3Pw7TR7uKqVv/+Yb9uNDk5wRtbQ+Z?=
 =?us-ascii?Q?I+uGNAZHz+CGmpOnQuX3zJK5u6WF1+doBKiUb+B7XW7cX0yZ/BVYBDbK5vcf?=
 =?us-ascii?Q?oPbdYBN+e7n9ng1EmvOcKlMl4UIqSPY5RHpsx3cjeFhv7unMRT5TY6+o8Udj?=
 =?us-ascii?Q?GFepFDFHhqCViEyqhWZOR583voWZCK/5e5cAaNab/9GLi7rt3C2bfqxOK5ix?=
 =?us-ascii?Q?YOnfY549LmWbjDrf2RM7I7pY4ZQvR/v9SJih+ZkCLhXNGEW9qVN0nDfmVHKS?=
 =?us-ascii?Q?2uREK4ix4ehou0Ky10pwk6S0u2dHZEdtvXwR93NsZwjiBlnaKaQyUOgN/oq5?=
 =?us-ascii?Q?06PcKDOH6csJBqr9LqH+Zn2ydKP+G5OKMOzmZo+s5Y4ssui8JwJsJSc430sz?=
 =?us-ascii?Q?6QXYeLCeyL2sfd97ZeOKz/c/M/DIAGLF9RdgK9ydjrCckz1++U6E0w5fETjE?=
 =?us-ascii?Q?UVO5Wi9gGmeHu4eX7stcelC90Z7mi6MhHaSCfHs91jwFC64O1PGfceOd/Wxu?=
 =?us-ascii?Q?4L/+/NDRiiduIHzM6s/fV6YfohLrFdG1t2Fmk32ooiDbwiFZm+lMyIxELBs3?=
 =?us-ascii?Q?9+dd7rLa1+JNujN93XT6ddKgR1AiGeUM+uoMkRi+r6HGsx/UVDAuSF+yGr6Q?=
 =?us-ascii?Q?Q4jf+3PKmEfJaZkg3O+0xZf+BckEqTqy2OQsOFB58QgUmWWr01ZPTJwDYxaM?=
 =?us-ascii?Q?wkNHbvcVbQBmsN4xzPFVJFYr4KM84Fub9q+9aJ6Ahk9fiegK7oE2NEOXn+Pg?=
 =?us-ascii?Q?y0gXZ+hl4WKAVhER3lam2B7NyspN9It0PaWiIi3ggQoSPe/oXjOKrJiGvrKy?=
 =?us-ascii?Q?0ki+PwP58vPCJbCa62abyFFVZV3/28wwlpCD1N1WmxqE/5U4KE8K7XbPEMDR?=
 =?us-ascii?Q?m8tVi1JzTo9AARd/Jn2IQDgYwjc2TNvRrn9/Tp+v1IeVL9Ou6Ob8yovrprdu?=
 =?us-ascii?Q?HtCh2Xs5OsDJtC2QMezlN+DQnxcA/0HkTqyU0Taw5z0SWpofuM03gj+k1fFJ?=
 =?us-ascii?Q?aSh3iy5XKAqC8nutTIhor31CIgl8waJ91t02hiAdd4hER7sAzCXrkd2nyvtB?=
 =?us-ascii?Q?qwhw3PvxXBVwpmE19QqKDgGdqNAZyi1J0pTVdrBa7SKp9VeXIhFLc79pPGuk?=
 =?us-ascii?Q?1ARSWeZzBH3EQ6vtqaQC8hZwjSIDbLi87i0+ZYb7G/Ur/k8BKUoMoNAzPCBx?=
 =?us-ascii?Q?9v4WbfVnm+s7MOSnFuyai9pJEd7tteBTqt58ft+mlgh+U8zHSlzUjLQ7PNWu?=
 =?us-ascii?Q?mME194Vk3fF1+c8DC1M1V9tE+maTL+AuopNnSt1++FQuAzNHEvKl7Pqbjrhi?=
 =?us-ascii?Q?PxpoQLpkjPBgK65TOOZMbhpmpScXJvb8wSPbo2EMnYPVl8DsFfTzzBFlwm7Z?=
 =?us-ascii?Q?Zd5mFvCDgggXIUHsnkx3UwtcAhQ0juZdsRI+HJxA3LCM/RcEtOB8HpLVDrET?=
 =?us-ascii?Q?V++t45gTSzCm7/8XBfph8bsMBPiGM40uHe9MpZCncwpqPXM4QP/uqGZ1SjNS?=
 =?us-ascii?Q?MJxia1TKqs1CvgDjMP64xD/ghtFhxW7tbIQc?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?yOQecGsptsq14RLXphKL2puUXZK0YUX7EctPJO57X+yPq5wInZRGiGNwTfwI?=
 =?us-ascii?Q?IwrL5ETPXSRppjKhe+IFZ+ty2iXyLrnwOcpjbP1W3CqpkwB7qKJfYdycihLB?=
 =?us-ascii?Q?P8snWZrqFiysI49+l70yKErlAy+t/XiNVa72Pu5du2o5BNO6UqRM91Ki1ICS?=
 =?us-ascii?Q?/jcV54sWWuMfw+zOJT55UE445LKc8fDIE3wDcm+taij1mGvaBpaCXJd7fNCu?=
 =?us-ascii?Q?Dc9rvCm7WHwbSk/Nbgpgazp4CM/8gwpCrG82oF9bJaM7Q48PTlP4Dn4mKpL7?=
 =?us-ascii?Q?54+QjBjRxQvOVKNbauM9bNIE+UXmcBC+fW+XLpOoluMhYm2eKny7QRQU8SH0?=
 =?us-ascii?Q?Si8mDH+RPqEa4g1YEPYgKlazPG1zUTd7nVJJ9HgXulFr29qJuLn5BvVHic/z?=
 =?us-ascii?Q?IQbWhvm5UeSwjmk527pdw5SPA9k39pBu1zRHo7v52aPsjSEihNT+wENMdAHC?=
 =?us-ascii?Q?BWb1ivjudoJo6/CxSGOKti7FZRHSbsQW2a70FG1THy5sB/NMKq+sDEfPFdda?=
 =?us-ascii?Q?9W2llGjqGWAhRs7EmRK/n0Say3cU4S6FwbuJfoRGK1rfn8TWFgvv5dnXDii6?=
 =?us-ascii?Q?OWXBSO1OfKLbQN6Q6W94kbCEFSE2t5bhJAEsohBvlmvzZnrVa7n2im9y1484?=
 =?us-ascii?Q?PQuCqboagtI8gIfTqtWRnXxHae+1CaLBjNu3acoPIwErfmmTVKXx4kV4VJfJ?=
 =?us-ascii?Q?iwtAZvBBDCTeu7mkNjd9vhrL8ZYV1t7n5//izRcqDXWv3zYBvjsIBGqfo9Be?=
 =?us-ascii?Q?LSWCRrQAUaLXXQ3zNcRrqYibxL4F9I/HnuNtqB3Kedg1ugCTtXToMFHwxyxY?=
 =?us-ascii?Q?6z6lSDbM9WLHAvz1VU1z3AYp30rmXDnNciX/H7fHdyF2mvp3LBVE6EMPy9Zo?=
 =?us-ascii?Q?NoXCTWs48hlIZaT5B14FzwojM8awRU1y/Xu4NR8mKoWUCkGd1ORFFfSSzfvU?=
 =?us-ascii?Q?JIBdDWTSdwOFh6PFSahP5ohHnHFqhCEwJp0DxVxqDAI7pB7i7ZewP1Ppi6W/?=
 =?us-ascii?Q?yFCYyRtschBWioAZJ3pASiwEXZLgoUIxVUewXyBLCFLueVFuZYHYkMTStnEI?=
 =?us-ascii?Q?zM1jwv4h98GhI+ceC6No2nLCQlkypPYe1BFmXIWU4JC/kYLmvefOKAfmaB1G?=
 =?us-ascii?Q?oQpcMQmTjdb9J2m6vpU/jtVg41I80AFN+gJMHklL7n5O7pa9lAvCeEUHatGj?=
 =?us-ascii?Q?k1ewnbmpkpAiSwYhdZmufOoBMU6fb4y/QedUBHFI5g4enya+QfcpMDK8nag0?=
 =?us-ascii?Q?RVOMgT+JG5XZPjQdLXso+BCcFssHnOq2QthubYLYqDb+8VHviiMT3kAr7Pzy?=
 =?us-ascii?Q?zyCFSAPNPbW60W301shd7CodOS8nSljqW1AERSmFRsPc7xim9wwCxKom0p3i?=
 =?us-ascii?Q?qxIcuYCsGPUYPwIwcIAn2zkfHpif1m/7zTV3dNu+rTF3Wxalkh54Za3xeb1O?=
 =?us-ascii?Q?dDqjlJu+ynqQxL7ipilPfFJMIMHYor61BsZxSpbR01pKSNxpavf+nzsEUGxx?=
 =?us-ascii?Q?ztpoX+560XsduU7jBx1sKdZRkA6VI+SILaDZLZ+4MOAJftVFlQ120QuIny66?=
 =?us-ascii?Q?F8YdV67ON022Wr/sGEHa1kREFwmJzJZ0bTuw4TqQjgYxaeieUhuGr2ciSodS?=
 =?us-ascii?Q?UP3PEjWjf6ibs2VjEmXl5W0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dd41809-5e16-44fa-55d3-08de20b83512
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:21:07.1076
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q7s6ox9cBzmNBc3UvXLajOoapfOs9bZD67rsnMJxK262lNTYN9i3xw+guvIU6usKx5Olm2PBSXrsAefjaKpXgpslxeVb6OpmnDGL1eufs87aGOMi8aERNgr3+qoQiHrc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6994

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/cs47l24.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index e2a839fae4fcc..5100b1aac9022 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1124,7 +1124,7 @@ static irqreturn_t cs47l24_adsp2_irq(int irq, void *data)
 
 static int cs47l24_component_probe(struct snd_soc_component *component)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	struct cs47l24_priv *priv = snd_soc_component_get_drvdata(component);
 	struct arizona *arizona = priv->core.arizona;
 	int ret;
@@ -1153,7 +1153,7 @@ static int cs47l24_component_probe(struct snd_soc_component *component)
 	if (ret)
 		goto err_adsp2_codec_probe;
 
-	snd_soc_component_disable_pin(component, "HAPTICS");
+	snd_soc_dapm_disable_pin(dapm, "HAPTICS");
 
 	return 0;
 
-- 
2.43.0

