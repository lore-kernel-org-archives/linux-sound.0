Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011042.outbound.protection.outlook.com [40.107.74.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F6C33BBB9
	for <linux-sound@vger.kernel.org>; Fri,  2 Oct 2026 02:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790909542; cv=fail; b=ZXl1JMv/6wUXpWTz7hQHlIqlSEXZg9Rxpc8mhG8daluaErUvRSVpqe7HuGAM9adI10b0C531caTki9329AX1/+ZqRlB2SMeo2VDJm4BMighOt5Z0dVSRhxAYswcs912DgNn+Tuz0Gp7rZQpChOozsL7hd4o1VEVri/qbabTqxbo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790909542; c=relaxed/simple;
	bh=1oFrow8mQIZ9rBO53gZKTe1xbTETzO09JcOEXnerpZM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Czl8JbowhUgeTJPlsY55DXxSCuWDHmR7jaHsH/VkTh010mYPCdiSwRplZelVf7owgMJ3qgQb4wBwGo8wKllAfCQNQvtUmEYBY5BkX6V7LYXVpxNGCBx7nT0mEP7omQ30nZFeiObotHwx5p63QQeoOOPzQEGI7Nj1/V0YAoo+h2E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=PvmpBVuQ; arc=fail smtp.client-ip=40.107.74.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="PvmpBVuQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MwA37usKx/RjABR1gMWs8HscC0XQxsEPmjPkn0YvHA9yXgAl/TEUVKnG7WZ5uLr2skXPBmseCBfbEHemOX+akgTvPJEvR2/qLv+EAbmo/lq6iRStcaDPzba18ndRvF5gjt4UeL9z5k035wUXqoFk+vpuGLN7XpItGT7Q/1OZbsyssqg65te0L5KZCyM7erV572kdXIcsc38e/K9O/rFft3qJL/Xm0MC3aBTiAINEPoaW5CfFVXWJIW8uXfGuIkDfAy/hTNVUBZ/bMdnsn2dGTzw8/XxfkWck4QkPvFUN5L4nbZ/tYNvVWkGFmTQCEQgvj6UWgxNfHgGLzmgeKxM73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B3f+T5eOGEuCDz+O6zL3pklNILBWT8kNkuxMtseLGHk=;
 b=PEbDGmVt08y8rfvxIXUw1ymvFl+/OuTiEsSeNvdJwo7h3ZxtOEKXtrUlHld/IRVvg0++/ddvY9RXUD61ZuvYvlD2MgUMhOqc0//Sai6XleFu2dJKApsWR+R2D89/Il2wLgtAy07TCptfvdDgv7QUZxPnYVIP408huZ34C32fkeik66VdYZZNzPM4c9ShfKGpfV2fjRdPDX+UUuFI9ef2cey6SfwMwbbb/z8bmPh7R8PGq0/fC8WMH8gApCH7N9BfPa7040+vo8jzO9XVDGldvEflLPob7ECPRdatFYlU3jwuEp7SpCsuocu+6JeGa+0XRrwz5iET1aP++rlyYz59bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3f+T5eOGEuCDz+O6zL3pklNILBWT8kNkuxMtseLGHk=;
 b=PvmpBVuQxoUcfxCPKJd5JCcgaUcDH6TfrYVDNft4AKEMVGhMbPV+VHfgtldsJ7RlXb8l+FBxKGk8TdY6GN2pvDDatXNrgL7gRWHxLA1QQhyzahG8pFKH2N2QomvG4PMv4dCVvd1u/R13O9S0usIbbE5acVNmQ//cpdpQBBjgUg0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12) by OSCPR01MB13696.jpnprd01.prod.outlook.com
 (2603:1096:604:37d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Fri, 2 Oct
 2026 02:52:18 +0000
Received: from TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45]) by TYYPR01MB14118.jpnprd01.prod.outlook.com
 ([fe80::846f:9035:6a33:1f45%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 02:52:18 +0000
Message-ID: <877bk06cgt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 11/13] ASoC: soc-component: move component_list to soc-component.c
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Alvin =?ISO-8859-2?Q?=A9ipraga?=
 <alvin.sipraga@analog.com>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
References: <87mrsw6cje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Oct 2026 02:52:18 +0000
X-ClientProxiedBy: TYCPR01CA0196.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::20) To TYYPR01MB14118.jpnprd01.prod.outlook.com
 (2603:1096:405:214::12)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB14118:EE_|OSCPR01MB13696:EE_
X-MS-Office365-Filtering-Correlation-Id: 519434da-98eb-4c36-007f-08df20302c6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|52116014|376014|1800799024|11063799006|38350700014|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	96R7vPFxEEHL1CW06fRc17PCwQw9i8Rp7H5MSmHcyg3wiu0pjHevytlz78qnJ2eXY3TAswd+vs7irAiIZMp5YJZvDe3T4lQzDTwh4V9eZnXnMaraoTZ/eSkLe0h08SCJWzEKZ3/d0EFCRAzm/YOqXqVsGNb0T6GVrMndxFCH4sahSEeuo5MeT8ZfEyd9oAsUxy8kAMydLXb879r/6twdDyG7X/qRMwicuHAWluzvqAzFAeDrF8o4opEkNsFU70ezJADqFP9FULA4n8pcnezpNjaKvrnwUmhIY1rvwXlau4tEB1oeO4Rti7qoCyvlS0/O9oTvyGrS5pD9s+Fm0I1pVHamFiYb3yRiTBxS/9giLq5n1b+S1fHt3byHZ9J/UxNf+NpRtscyFFEFSGVF5nnzewGiz3BqxplgU83EqzXsf5PxZduqrHvKfNILTo7eT2+LsYaoh9mjOqUDLRFXfQwyb+MmREtIc4Qwl8cMU7EhcVZgJE1Q3yzRc9f/hMLdQQhCsLmUlhsF1BDRPnw3ztX6yuwgS7szAKvey2RIO5YkJTb7AlX+kjwwakJg2FSEY87aLtC4aDhWD7N6dvEbHh5mmyPuyr81YhSahFOJL5dsTioMJBWpe6XYc79cto987rBYYWVlGBIEPFe3kOXqN/NuGW9uWBmd/UB2vyXojW/NhgbCJ/gflYRIxoYs9ZfmcAMdK32CLaSMikgV0k4hwSamD7TwMGGq/8RlNXKfdEf+2kE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB14118.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(52116014)(376014)(1800799024)(11063799006)(38350700014)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-2?Q?6V/WJwtfFhJCsDGpL3Uq20Wqsn8ipmnrlg5rmS5m1z0KWuia8sV+CjYhT7?=
 =?iso-8859-2?Q?Oz2sdjFy7EZjAas8kWK8XKWQuTFX7prMGoWyOBel8yLoVKwxJ4+zMDAUed?=
 =?iso-8859-2?Q?eCHg7R22cYxFZVYjy1lWsRWdDzRFsay7EyR8r3q2AOOlTN6Wr+pLi7cHW0?=
 =?iso-8859-2?Q?xqTRB+TCqGs/SilVbFLFLHe6KzmGio6Qbeo6uL6+CHgi3p7cPtg57ZUUnw?=
 =?iso-8859-2?Q?OPcoDd/61hq1+8CcvPA8hrF4ed5z6tsUa63fuCLAfO45U9/yEYdmL2CIyy?=
 =?iso-8859-2?Q?C63j+fx8U53BfMkecaimON/Q1JIBDe06Ezbb1VoUHC9H2bkgLYf4DJBc7s?=
 =?iso-8859-2?Q?j4zpAXUk20dby5aGUgbs5Y70zARN0TVWUi/vnBOjfAWASHMn7nq2W/8P/Y?=
 =?iso-8859-2?Q?btxWI1FAI4AhrfhjbEvyJl0/NRkFlnEkFKGr8xsOnbQrmgcoIasuWEr81S?=
 =?iso-8859-2?Q?/BT0YHffIsSh3uG8eEHKUUwtNCbNTYJrX6Y886b2/VGsWVSbaa3wL0m/ws?=
 =?iso-8859-2?Q?0qpGJT2OE2BK9HG6ALbEU4fDQkjckjy1ss1VSMke876emtK8NzvB4pTe3S?=
 =?iso-8859-2?Q?7akaV22+x21GA9FPEga9beNiyjKFz7VMW7TuWwDxngsIG5VFzW6F+pA8Eu?=
 =?iso-8859-2?Q?etG6L4ilHfT4vkfEmSmFsANlHkAj+D/eQbS8wLClTWqkTFaDG3QP/zp468?=
 =?iso-8859-2?Q?XulgiTS9htTfjwnae7jUigYTRTxEMlZ6VLJf5VPjC/GGod1xMqoft6Oz3k?=
 =?iso-8859-2?Q?6Fi4y2RKHG+DGLDhpFExrCYmMnv4ZkZTvFwFYW0X33moTgLNnToag6RjYd?=
 =?iso-8859-2?Q?0ugdh5lo1hq+2xPeS3TtsbFtqUUHZMCkV+u9YwB1EgG9ulVpoE85HpwBDU?=
 =?iso-8859-2?Q?0IHDlzJRgFS1LHKmospLB5tedWTTXMeFHa4AEHIJr7KvfobipxrnLRsySG?=
 =?iso-8859-2?Q?9LtillV85CgdGGwVWCRhPyBPXIz5NJY52pq/fvblJB7//Y0QviJhNJT6Nm?=
 =?iso-8859-2?Q?CQIBD53JsvenvwQzoZ43P1qIuOqh4+FWILQIPYiFnUuPpBPoxRR4xGM1IK?=
 =?iso-8859-2?Q?oMJ2QpmRjHNrgrLtJIPN7ZH+KVPy4J5YfohaeyqIu3DwHmMO4JQsP3m8id?=
 =?iso-8859-2?Q?7B9LoILioVWLWj1Fn76XNKdZtdiK9wKy1p/TKrskS847r+/LWVtuhgygKY?=
 =?iso-8859-2?Q?UOhytUL/Ji0V8PZSMoHt2zWbwyEb3MGXmSFt6YHhTqp5kUvRbLSvkAIvId?=
 =?iso-8859-2?Q?/drzCRrfz0LOCv3ROmLB7cQC4uJLgMwkP64SxlRD9CZ+Zlbp/YvIX2TNvd?=
 =?iso-8859-2?Q?jdYY2RtAx7lYqN8Mg4mbj3J1HN9iPNHNhP7zOeI/6g6ELcmNLSkHfxLMGs?=
 =?iso-8859-2?Q?ssejVyqrdvECz+ML7B4BXEuZz5Om0wIp8XZlxQzr0QEVp9F53qyiu9CTGk?=
 =?iso-8859-2?Q?D1UQxmTXtvpdx+MGJPIx0dqQ1vKOuB1c5bdiLs4THbyiMnk4jgkn2u1Cb+?=
 =?iso-8859-2?Q?qy4pj8r1fjNp4imWKHy8EAp1A4k+9ca9ASL+lw3Ld1nOQYWBjbYtwX5OFR?=
 =?iso-8859-2?Q?WzV12/B4Xpac84T6y26C14gARQjntCX8DZwvV6BRvpJFyCxs5ULYPAw+2A?=
 =?iso-8859-2?Q?4/54cgDWQiOdyjEdFDkC/rvWcULFUEB0Tl6B1JYVzNhjqkoPqPYK4UBQ7Y?=
 =?iso-8859-2?Q?wIwD+25zlxWhegbFQEG6ljTfEODLMC1yLNUTuWFtvY2AIo88nJ55A8OsXU?=
 =?iso-8859-2?Q?3szO+DtEtio2rE3pIlwAzq7Rw/4s6HSJLHLJ7GYOhApnm39RB1xf9YVMvq?=
 =?iso-8859-2?Q?ay/2DsQ+lV4mePLjIc+44FL5s9NsB9TZHrKTTHZ2HTvUQppYxyEr?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 519434da-98eb-4c36-007f-08df20302c6c
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB14118.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 02:52:18.6894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JB/R+OH/tSb0ptL/2+vJHHqoOBsJEu7C7jzEbryVIkhZstu5k/j9rICgEowWOay2AJDyQxMCsvAFO/bF3TRYX4wvAKPNmEETQTQunQ4TDmrz6DKq7QsXlH8sY8dJKx2R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB13696

struct snd_soc_component will be capsuled soon, its member will not be
able to access from non soc-component.c.

Move component_list to soc-component.c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Alvin =A9ipraga <alvin.sipraga@analog.com>
---
 sound/soc/soc-component.c | 6 ++++++
 sound/soc/soc-core.c      | 7 +------
 sound/soc/soc-internal.h  | 4 ++++
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/sound/soc/soc-component.c b/sound/soc/soc-component.c
index 381195d0fc78b..a692edba8f07f 100644
--- a/sound/soc/soc-component.c
+++ b/sound/soc/soc-component.c
@@ -44,6 +44,12 @@ struct snd_soc_component *snd_soc_component_alloc(struct=
 device *dev)
 }
 EXPORT_SYMBOL_GPL(snd_soc_component_alloc);
=20
+static LIST_HEAD(component_list);
+struct list_head *snd_soc_component_get_list_head(void)
+{
+	return &component_list;
+}
+
 void snd_soc_component_set_name(struct snd_soc_component *component, const=
 char *name)
 {
 	component->name =3D name;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 6fc9f428d4060..16bff4cbc27a5 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -47,13 +47,8 @@
 #include <trace/events/asoc.h>
=20
 DEFINE_MUTEX(client_mutex);
-
-static LIST_HEAD(component_list);
 static LIST_HEAD(unbind_card_list);
=20
-#define for_each_component(component)			\
-	list_for_each_entry(component, &component_list, list)
-
 /*
  * This is used if driver don't need to have CPU/Codec/Platform
  * dai_link. see soc.h
@@ -2389,7 +2384,7 @@ static int soc_component_add(struct snd_soc_component=
 *component,
 	}
=20
 	/* see for_each_component */
-	list_add(&component->list, &component_list);
+	list_add(&component->list, snd_soc_component_get_list_head());
=20
 	list_for_each_entry_safe(card, c, &unbind_card_list, list)
 		call_soc_bind_card(card);
diff --git a/sound/soc/soc-internal.h b/sound/soc/soc-internal.h
index 17ed22c2cd505..b844b27574c8a 100644
--- a/sound/soc/soc-internal.h
+++ b/sound/soc/soc-internal.h
@@ -44,5 +44,9 @@ bool snd_soc_component_matches_dlc(struct snd_soc_compone=
nt *component,
 				   const struct snd_soc_dai_link_component *dlc);
 void snd_soc_component_remove(struct snd_soc_component *component, int pro=
bed);
 int snd_soc_component_probe(struct snd_soc_component *component, struct sn=
d_soc_card *card);
+struct list_head *snd_soc_component_get_list_head(void);
+
+#define for_each_component(component)					\
+	list_for_each_entry(component, snd_soc_component_get_list_head(), list)
=20
 #endif /* __SOC_INTERNAL_H */
--=20
2.53.0

