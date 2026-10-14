Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80E7364935
	for <linux-sound@vger.kernel.org>; Wed, 14 Oct 2026 02:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791946733; cv=fail; b=BYvhwiDqd6TGVHm4qW4FkJhQ0XJbuHo2eY6H+PuzRib+IVWAXZjZHhmdA2dRohLr8tH+0wjXexwZob5nw48S2bIq8JOY+M3TDjjuWyLh96KOUpGx+uEF4GDb6u8GsPyXlKgH9DLDuqNrY5vD+e2ngbWNS3GI3Gz+smAg4ga8tPk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791946733; c=relaxed/simple;
	bh=05JRk3HXzGEpDPCIuef+E4V/JdY6kEdAr3DxxNT7P58=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ET07FMd7yTozVj27xRj+qgkfvMBAObzCCHdg0jxuQZoWVt+rsdjhpmyDN/dCUOqN4ULcGqChP72OxphMKevLsJtWWAqt1LL4rzLAcxxgqGdEMsmUvP1lmHobVyds+pmnWl5qubvdyhLz1RmjfIiZ6QVNo454ByVFmPA7Ut1Z3bg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=JxrlHJeZ; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="JxrlHJeZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNQwW48YBCK/ozEm0RNj9uFzjweowft+1nptCH6Quo3iTiHjBfxzErBCdh0Rc9GUdfnvDXiVg4V6fu6U1TLWdnXnfhYwBSKaAQhwSb817GmrQFqDv8gstB5ANjR3PIt+emI9FjY+UkkXBmo7K7Js2F8Rh5wLO8AF2lGrMFWna/AVP/4qmcdbeEBnj4QFxu379pCFs8A931BD1TsWgM84S6XfoPDqPV4P5fvDZYdgwnbwMy+M3LfDUl6VKChE2jeMiOzmcneCdpd1XQt5vABBa9oa8x4iboR4kgMZPkvLBzIVt1gBsnGD2xvhpQ/GiSl908uQFYVkpwDHJXIURBpDSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A1n2kwUBLPrOLGSglwzAoxm5X6MzM0cEiSoM0wqXrgM=;
 b=vgQyiehOnpL+rmOyeF9dMHJcH4tc5BBWmVufUsHjRJvfi6caMOuuiiqmMn30lRkFtsKvsAxjSSaMcGg6Za+7mnJDtBLrJQjYwiBvbzesrXSIVQo9ORzCzvazg2s1qF/0OGoStogdlkl5hsAbYVjkzwvGyw63PN7i2eI0JcoVqcORIxuu7qiOH00yIDonM8ChpsR3FKOM7lJYKLjzyqJRhLKwRWIc3nssSrS9PFBO15oPiXRouVed5+BpfOB3PoqaIi3awECheGnf6wYVT/grhyAvmwvfOhUQDqOfBYqSaopMA60/ry0kIqyBNTO0kOFTKHg4bzB0Zd373mNHOaE45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A1n2kwUBLPrOLGSglwzAoxm5X6MzM0cEiSoM0wqXrgM=;
 b=JxrlHJeZrwYWIJbjol5jq7s30Kd5ZqHYc00xIx9zZrOTlAmmB7n7XUUzBeXorvObdGoFzxjgPOhmdkUG6sRPdilm1K9czLK8JfkXF8bQK3pAE9YNkKSboMQaVelDqz+IPGIBdLRcgXCVmruPb/3Mz2tmI8959z4X8pEfl2m+wTQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14) by TY3PR01MB9728.jpnprd01.prod.outlook.com
 (2603:1096:400:22a::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.12; Wed, 14 Oct
 2026 02:58:48 +0000
Received: from OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294]) by OS9PR01MB820914.jpnprd01.prod.outlook.com
 ([fe80::12e4:c507:3730:2294%6]) with mapi id 15.21.0496.021; Wed, 14 Oct 2026
 02:58:48 +0000
Message-ID: <87mrshyom0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 02/13] ASoC: soc-component: replace bool member to bit field
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
References: <87pkxdyoml.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 02:58:47 +0000
X-ClientProxiedBy: OS0P286CA0155.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:16a::6) To OS9PR01MB820914.jpnprd01.prod.outlook.com
 (2603:1096:604:50f::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB820914:EE_|TY3PR01MB9728:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bcc7601-603a-4611-c770-08df299f1185
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|56012099006|261009223027099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	p6PdREj5a3qqnU5FiJqK/s/hN3y1WNY3vkjkJzcGmraXbS5WkvWxg9PmTKiPA1ixcwUH8ngLgPFfd+RmliIoOJELGbUovEMEFe10fZmtAYnLSubVoVNIzkRz9/a1NU54+v5ClrLsSLsXmRteGOYnrkaiu4nV93MSfkDg17JTInJlXRkWhmcEdT3UyfoUVefRO+TgcXc/CKAXoyI2Dj0sc28882+DepOQkYUbF9tYmPvIrGEZHCjnq2XZYpr4G5apBNeYYVta049MFEXNMCUjADj/5s/6FG8YuXgu7ZcnamQZp9c9cxrWPTiI4B9DEPsvyqjFnXu8IqQptsJthqzDMZCWvaULpipjp9wr2zLtN/qAUof2nGUx3tp9rBmBu66AXsQbSwEFIOlS8cZDV+9H6A+LOhKcPzeu1Au45mVuzH3UiQMkQ7gDY/4jl3n9qHZiXLsWSRB1g+Vccepn7IzcCRBpQwEUrcHeWNhqzcaLN03VznurMDriU2SS7ozp3t9umMDKGyliYT/d2onWVedMaLyiTrjK0T98H6R0frTtEj6YaAXdDekAfYVQEtinAP9jI8hvO2CZQG+w4m3uq9YN7hJUd/S88CXTJYEN5q1OmRsWLPm08bf4BNOUYJbywNmDtTk8x5K4E2OVIzeMkFBAwRatKBzm5vL5eaTUK/k/n8klT36iP/Ay4CXWQvNPP/aqsAzntDnMXHzIDxhJY5YisI0KnjeYKHSxVLvJwQbmmY4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB820914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(56012099006)(261009223027099003)(22082099003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?AcTKV/lty+u1unjQEe2Rf56ta8ZpWyXbcXUH0G3ZortGaky2n6q3pnXiut?=
 =?iso-8859-2?Q?NpV8yvwm5vGD/ye+VnqR4MgCl0IsGVIDj/rT/YVcqJt0n7vdo+wKKbHBVR?=
 =?iso-8859-2?Q?fCbpSEcR7vo89t5fPLJJMlLUihSfSvFrE84RVlN5nT4M0v7KEFPLwPEcRF?=
 =?iso-8859-2?Q?sADe+6tFa0JyZhNRzBHdSRQEoCilVHYIMJhKOPLcnt9iU3B0AG4A30xvfd?=
 =?iso-8859-2?Q?wRfIA9YRB3uv25EdaXTACBfR8vQydCZ16bQes+vLndcfQW89R5I5ZI+P0L?=
 =?iso-8859-2?Q?ay4xR/VfdK1yOmqfh3Hexpfbvd9jNX+fHt7WJIRIG7w1aQf6XjHZCtHJw0?=
 =?iso-8859-2?Q?MW2QHl8R5kcKPj5UfRmO529RxubwAfgjN3JvKTabKuZ4CO4xqRmayfup/+?=
 =?iso-8859-2?Q?tx2N6enmCacIpsGF9z7INezdzxAZ9H8hfRRs6oCYyUs5XOriqkuNY3KCNp?=
 =?iso-8859-2?Q?7xVV5vcByRVsjJuF/WuCsp6GKFC/q4aRs0jqkMW8FJEF9zNu2k5qHcD3xc?=
 =?iso-8859-2?Q?sxxoy9EoHWN5/rjpacm9fKsoOV8TnfYxNMtC+wal8tPyU2qlGFC2AQcBjf?=
 =?iso-8859-2?Q?ddBNuF0qN/uMNtwiFz/lwNkgRYjtV8sjBo4UMibUfm7QKxJGxpzBgYFwr8?=
 =?iso-8859-2?Q?sz6+3+VQduKrrq7snDWz8zsggoA0i/63EqD9q4I6acfRy+bCqaTIpINqiM?=
 =?iso-8859-2?Q?9qVDKzLJjbsJmubEq33lqKNdu9c+VtYAz8zdkJznxCEK8XlRDQ9PdVtaE+?=
 =?iso-8859-2?Q?CebfTZqybE7ZPBP6OKIvBPWanFytUNPqq5HmV8676FCLflnimV36ow+EhV?=
 =?iso-8859-2?Q?e7qpdGflwqFoUwlPJNBbhoQev5/dzcEHpxE6CPKgtY2lt/oyxrFlJNo+Jn?=
 =?iso-8859-2?Q?l8LHrEtx20zxfojMrpI3SvbnOvD+7gWooySZWbYZUIVrrAU9htx6OfspWS?=
 =?iso-8859-2?Q?s4X8AX4ErhgwdVdzyQaD7Ozkk9md0nWW5D4t5LAShZQo0kt/KJNZ42aACg?=
 =?iso-8859-2?Q?svbWdfNdaMtfBgryhLq7xbhORNa6fprOMsSgNlMrUWSvgSFyvvdcgFuqYm?=
 =?iso-8859-2?Q?lVH5Vx0bCU/Ak2JlwdlecvC1ld+0+AYRsm5c98rQjceLJwp7cUvuKumpUi?=
 =?iso-8859-2?Q?bz8m1xBRRHmjWW1CIJ0YxCdm1JhGYomZDc9mhZ7PzkwJrdxLwqeRq39/2Y?=
 =?iso-8859-2?Q?tKQqlPpq0XC7KgbRF3sI81wATEGvpigz9sAzNU0C3sQoyrzrfh/gZB3Em6?=
 =?iso-8859-2?Q?22Mk5+BeuD2iKkgPYYuV2khdFX+QDymDpoH+OmxYK6fPTPB0tQ9jEb1zbr?=
 =?iso-8859-2?Q?Bgq5Y+ZyXW6PFx/JivkcTFm/+r+v8F9XSoDghDV8+epjVljXvL3qti9q1R?=
 =?iso-8859-2?Q?Yy7wyQBLl78hgsB1rkKJbZiF7xnhmq8GHBmVGaQqTGFPcVi4Y8WlGCWmQK?=
 =?iso-8859-2?Q?sVKrQA+un39rz6aGO7wIzBR3AJtst/k5CIdCmwWwMTlPlDBL14kK1aZCtu?=
 =?iso-8859-2?Q?vVmqXeaGkg3+XlFJzkh0NLhsl8elIlCGnIu2q31LtSy3a550lQ27vd7GOT?=
 =?iso-8859-2?Q?Q3mc5Khp3pS6Kiij52JWfDzDAfw5MF3/GMwVVz32p+DIItyeQP08QhMLV9?=
 =?iso-8859-2?Q?+iqq8bYRpK6q3qMyvPSh7tuHYuJ8kmxilnFWcAyfDnkZWVpczqcUBIwvih?=
 =?iso-8859-2?Q?PhXcPZw8+nT5PBNZ0oAV2PHnSfIiQ2pgf7w/8MxoyBmA0DsTVdpB/UPtAf?=
 =?iso-8859-2?Q?25zFqD+Fz03+pj7uqnfEgZUS35de4LmhA9FDaXPyXxGWneTwLOVIARQaKS?=
 =?iso-8859-2?Q?gQlitTb9XSnIh26QURj3l0MkEFsrooqMBLJ+y7zfUHeTL9vhOqDv?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bcc7601-603a-4611-c770-08df299f1185
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB820914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 02:58:48.1004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B+ZHFCgBShdMAOaOhLheH8NXhoc81M2DRsrTOh2jnQxwB/0DQ7R1my5rU2n4uEhRh3wfL27WxhfX0tRRtvfJgE4JzihJWa1BzvxpYcSUDVXEAepMypJ9tXLhNphCwUXf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9728

soc-component has meny bit fields (A), no need to have bool member (B).
Let's makes it as bit field, too

	struct snd_soc_component_driver {
		...
 ^	        unsigned int module_get_upon_open:1;
(A)	        unsigned int idle_bias_on:1;
 |	        unsigned int suspend_bias_off:1;
 |		...
 v		unsigned int legacy_dai_naming:1;
		...
(B)		bool use_dai_pcm_id;
		...
	}

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 include/sound/soc-component.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 61898a45d83f1..149c4d4f94034 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -196,11 +196,13 @@ struct snd_soc_component_driver {
 	unsigned int endianness:1;
 	unsigned int legacy_dai_naming:1;
=20
+	/* use DAI link PCM ID as PCM device number */
+	unsigned int use_dai_pcm_id:1;
+
 	/* this component uses topology and ignore machine driver FEs */
 	const char *ignore_machine;
 	const char *topology_name_prefix;
=20
-	bool use_dai_pcm_id;	/* use DAI link PCM ID as PCM device number */
 	int be_pcm_base;	/* base device ID for all BE PCMs */
=20
 	const char *debugfs_prefix;
--=20
2.53.0

