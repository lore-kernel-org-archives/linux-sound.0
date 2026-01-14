Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375FE3815DB;
	Wed, 14 Jan 2026 10:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768385255; cv=fail; b=ZIhUdHzSevI6vb0vl48txSWLvqI/4YY+GKOL72xXyobt2wd74LsXGqvTNvBgpNHCmM5cLOLVV6je75ITFoI62OmVigLvzlQNhfwZ5/HKmgWtDDmiglweGlVTvDCOhi+Mnnf2CkqF7NzNvOl/sAdEnvICBEDZwHXckxKPoXKu0t8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768385255; c=relaxed/simple;
	bh=RM4iIQtkFeLiizvjAPvWXPsQzP7EMrvdkYMUnGiuaNo=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IHbQQD0WJ3cQNGhQq3LKLP5pIZD4XZ0+yk0xqLZ7nxPHY/02W0wqhXxd7gQMUiqZKCg++kon7FJO67w49AknlwnwbCvwFY1hFy5p0VZgGys7GYmmJ4uOq79q1AHUuYAArlHwlQze7o657P5hCdUrhw1jDIBPas6xCuy6Xv14AWk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=PQCU/qSo; arc=fail smtp.client-ip=52.101.66.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="PQCU/qSo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXICxFTOU/eWJS9kLE24QPrQ3o/+fz6OSb8z84Gk/qD3RH5erCKs+5QGU6hKWfvQYKVDH9/PI+rqF+ne/Yr+V5WGdLivbtuTKeGd2IGX8gWNnujVYpEG4VGXqHI1YFJtcFp6CT2xYekF2hhrh2xaA3OtLvP/F8o95wEpZcRAmtdZRmG8KVoyC4lCNPx3FWlAr+Lt0W91lpG+DbMFQY4tAk4p6BApT11G/kH4hPBKueibBXsuXERhc5dlfAe6VFv6p7/FAia7aEL99fMXQGsifLc99RlmnrpR0x/KPA/N7EpcBlSKuZqVU9AHqz3Aj3GeuSePqmkb/9FU6CIc8N/NoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycwFugVTLA03rmC7tPwapRnLt2pcDFGBV11eK7IXKdg=;
 b=FzXAOXwAiATLxmAUnd31Zn/yhKqYM5+HkdDJMccbw6nTd9fhzyL4wtpjqOxfmX8xKgYC5cKqmzkSOsK3yCFu72tQ7OIjy/xgy08M0+fujuzQSHCaRU52ppcBk/NH/q4VcnfbIxDpbCnDMl90rMow/yFeiAu1gPQPpacLUKmKvj76hPPgGGHJBE2Cokd285GdcCBAI6CXT7YUkIqT3suAiRi8DGT2dqPMydF1+0l2HAVJVupCqrJzFFDQD6sdcLApr7ZkkNxhuwF1dD0DyAnmtuISrFM31Wk5txmOYj6upEz1I0+BgzBs1R5q+BFDISbuoxtdeLw2RzdK99D+MyBWtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycwFugVTLA03rmC7tPwapRnLt2pcDFGBV11eK7IXKdg=;
 b=PQCU/qSo+D8+pq3FuEkEnCOHeWFjfIO60EV6y2gTpKsPyrqvrXQS1DnMhRD29vtdYROErrPVcXCrGJzmH6qqyBXQE6eg3gh5h6H2Rd1B/M6ucRUhvDD+cJlvFD9eXp8CRr4mmsI3oLccXJz4uJYV3uori3LjUw7E/Ix6SMNqeQXWCrFsgc6fDVpwYgQG9o+psdbd7BbEWPBJygIhsLFgVL8Vm6WAyWUAR/kmJbJH96rMU7QnfbWemAFCjJlDYeA8SHGOMT+FkgrWjwObxFa+ezS8UNAOIIzcmRO51mbeW6DI6SUAPXoDoUi/q8QGNG0RjIPW+i7k/2QZZJlpFAykgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by GV1PR04MB10533.eurprd04.prod.outlook.com (2603:10a6:150:206::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 10:07:29 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%7]) with mapi id 15.20.9520.005; Wed, 14 Jan 2026
 10:07:28 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/2] ASoC: fsl_sai: support the i.MX952 platform
Date: Wed, 14 Jan 2026 18:06:53 +0800
Message-Id: <20260114100655.3885926-1-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|GV1PR04MB10533:EE_
X-MS-Office365-Filtering-Correlation-Id: 954979b2-bf7c-4af8-437d-08de5354b944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|52116014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?REb/nOIeqojPdz8/517NGS6K0PJL2SxvCSbHZvW4BDmOKjskkaOpJBzga5D4?=
 =?us-ascii?Q?Fvvn0eUaetULiMCUZ+utK9p8Zv5kx4Wj7e6qYebsGlXD8OdwdBIPojND+DsX?=
 =?us-ascii?Q?nB3sjr+SoROfYd3PoaPZtSBP7RJ+n9Wu/RAKMhHzWNjJy9vJSbFrStcu6iif?=
 =?us-ascii?Q?ZWZiCCGimhda5xZO7CcanMrjUH5wFBQjzUNC35QChTBBPPGJUkFLL16mQmVr?=
 =?us-ascii?Q?888WAjEf1yN+c8zcNn8ZJ4LkPvxkr9Jq68mrc/pg0YXbQ/E0kfmW4eJP3bzY?=
 =?us-ascii?Q?3wmL9fzGVAseBvCf3KL4iiHfbOwQC/NmIRY4vZuXkNDwXa89zpOKNMR4PT7A?=
 =?us-ascii?Q?B6TMD/FJkSbe/GS0XJzl+236wi4heUXAa40tcM8lLADSZh1uhtZjeEbQOxTL?=
 =?us-ascii?Q?1L1Sto5vDev4DKcAcbvSFi5pkYVOos1mYg8v48tT9O64CzUTSAnHkNIwMfgh?=
 =?us-ascii?Q?PJ5V31H6hmq5paoXZqyMaT1iIbfjfNonAlPh4qMQZuX9eSM+g8wXAAquJksp?=
 =?us-ascii?Q?r7qCfGlaP3bz915xp61KVFVIg2AFZqBcBl9FQo9XvTCtlhTTRUbFthQ7xTt6?=
 =?us-ascii?Q?oHCNjp7L1s8kiVp8LyiXJfUcMBrO4mpmVvy0u1qKFeE4PcU9lKIABRhM82JY?=
 =?us-ascii?Q?HI+JDjxVrd7OlOUEC6QltSwG/5uLEng/LLn/8O4dm7EyuHt3vG4mAR+Cvhdh?=
 =?us-ascii?Q?Aie0KzMQ6Um+suprf9L8Qsc2IPv3/vzdPXSmq1nVfbOL0La+qO3z+U6el9xd?=
 =?us-ascii?Q?MG7mM28UZpxfjc1mDEZ1saMUWUI0rsFlbWd0o298fKhAtD4m1BSfQ9eTjG8u?=
 =?us-ascii?Q?n5cTldV7RtcbTVrWJ6JMCPAoWAkoLslehQLYfoV7QKXBbjkz3XifSEKltKQA?=
 =?us-ascii?Q?bdqqKfyvoP9w7/+TyaWso4kZeOYu04DU8yoE/U63jbzCBieadOu+Y1WHr6/A?=
 =?us-ascii?Q?ddlQZ5bSlqDiJmOb1fwSsOhQapeOEDyHxFD+1r/HxhHiiFfcnQkv3gLzSe78?=
 =?us-ascii?Q?F7+Q+ddepA6U0NyJctYvstq40wbsEp/ZDIMUxwCAs/RZOnduJNEwY9CqvZzj?=
 =?us-ascii?Q?5Zoqrc2sTRnvvlXej7wIFk9O+f/EnlRh0PQTUTiOoMIVXp+YMaL58grefmOR?=
 =?us-ascii?Q?eyadYgjyq0OdXXud8CAh+x6JnPWnYVABDyYE2S/5NG8sjeGZY0doM8F7wbo5?=
 =?us-ascii?Q?1N2BKHXDTap6lIbKPznmW/+l2AaUHgyO0/KS8qSYcCBbYgXXYsjZOr2k2D3s?=
 =?us-ascii?Q?HriNmBO8yFfV+QCfPznJvVQTnU3oPEhauktvgIc3JeuKfscAfn23VWaSeKYO?=
 =?us-ascii?Q?N5orGGbGMv1W1KP7DlMkakYzpfJmJVTvvLC9k2OFjBB6u1Mhd7yk3tnN9Ru5?=
 =?us-ascii?Q?EreCv6ZDCLdO6ZnxUylx67dE9u7QmX1coaZ48K33c5jTB2iYd1CltVE6oHBp?=
 =?us-ascii?Q?AJBgoOB6dOLBiEswZInOZhVBKTWfYSEoOHz/ginFiWZInqUa3GUtmjOphTNt?=
 =?us-ascii?Q?jP93eylikOUEeVGMDD9Yrwr6HFMJR0S7kg+Dh0JhcpoWEa3zakiW5aRBWQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(52116014)(7416014)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pzoLFCQYSSnNDDLJ9V/eUn6UEoHVSukKQlPjaITGnVorcFTM10PT/UWQluzq?=
 =?us-ascii?Q?aCoobR8qwvvv2pbkpxqaUwAARWudJQ58C0v1prQeaXaas4chMUYg8UDxRJbl?=
 =?us-ascii?Q?k31oylMdoUbZKIfTc4EillUmO+neS8njn1UXDYWw5XV7AqE+lJn01JrI+6vV?=
 =?us-ascii?Q?QaII/EWkd9s+pxF4U4b0BTv59cR20FIVs58AJ/uB2oYnb9yhWjuch1aEGS43?=
 =?us-ascii?Q?1OajCL94IH5e85SXCx7LVLrCM9ae6QcfL6yueM+CZV8FDe8v+n+jylRjMX7Z?=
 =?us-ascii?Q?uYmCA9MqZOn2B+rY2LpJbFzl8/RvmEvDv0EMFlI/kLHXQCYLMDTH1EOqG4cs?=
 =?us-ascii?Q?zSIup3XHKw/vaOez4ix6XLQ3PmwBGeDp+K+lAx0vF0y78kWbowGOu131WoAW?=
 =?us-ascii?Q?2spdztpjzKKZ9Ybq/gPA9x97EQMPd5+vHHyoXQCNt2KEH7Dg2CphoT7tUbhS?=
 =?us-ascii?Q?zFimEPKsY0zK64jYoWJbXSGXukoWzBauvBo9HV8dodoX45PII5IEXIQJsrPz?=
 =?us-ascii?Q?Eb4EsXnCsepIs9GKiSLuzvkEgDa7M+uzj43QcDlb4BtjCsGnUUnQRKLzzkyx?=
 =?us-ascii?Q?Y1opLGnSgXTWOooSJEQmRQmWRpfdacLwzOgX+RT5XFerrnTijSxmuywbeh3L?=
 =?us-ascii?Q?lchxZIllt/bvBktEW9bT87nO4G5UXIJ6+CwgwJeapafyhgfWfFpDdZQsgOK5?=
 =?us-ascii?Q?y3+Cz2wbPpvUoVs5mA1aPAZvPEW9jR9LzK3OgLySA6UemQOjqf+NQEx4bLR7?=
 =?us-ascii?Q?pz6GYIHHpRnynfnIib/FqawtmTO7GGfdrbxqRLRFcsg+/CgN2++4kdwaNjNX?=
 =?us-ascii?Q?NABGBZbyNmZ3rIWw6IyxOW1WQQy2jQc31oLOSlcatcAK9Rw6DhlyYlMatdWR?=
 =?us-ascii?Q?ekvLOgc/IRPlqhiREtI/jEv/t3yc5KfiiZPtsrYIf9pbhvY5WqOovxFEJavp?=
 =?us-ascii?Q?r8ji7y9Zyhv6S6lYjFIYiMYzJjpUCuijkamT1fyuy6zBnyFh2kD9KYDV4XMU?=
 =?us-ascii?Q?+MDeShIFsT54C6ziwh4Z6rLyHbDcmev2M/8xWi6nA0TgGEBpMqtWdgM3yoCZ?=
 =?us-ascii?Q?uj3bDddBdjrT5Dd5BA6zI7SMe37lDlyDb+vrAbB3E1vdtRB+TvMZhfISSU2x?=
 =?us-ascii?Q?A09/aKQgkOdHiIyN6k3eRsHAwF/3HddoKSHlqUhZeEtstHRY/ShGeNZEiFAe?=
 =?us-ascii?Q?tDN7MoleI0oilzYOs2BWPYHXLX6L68dLY2Q45srXAm6FHpitD8UGaqoq/h+5?=
 =?us-ascii?Q?XyDgP2y88erleOFADQDAgJ/1CKdOJ3dmOOsLyhYDR8nDjJRUOMFNNwLFzFr1?=
 =?us-ascii?Q?AYidalHwwf0Zzej1NaSyzsyt8ugBWFVVDy4ygzR/yIphVjMqtDqrkxtF8t3H?=
 =?us-ascii?Q?X1RiQ3aIw5lOpSJEyMutkd6hf8MRKzfJYgJGs8MR3Zaa8Pml639U22sQQRPx?=
 =?us-ascii?Q?MdBH4xSpPKTLdwRSzrMWOwqHPn+1Ti4IyQPSStDPhexa6H7iAfJqUNaIdO0B?=
 =?us-ascii?Q?VaQjM87ra3vPBvU7lS05bSdSETQHuKMhvxYEzc/wDMNN79wrtFbp3Fr/foi1?=
 =?us-ascii?Q?aZDm6cPYM9FCEFlMqnJ8vGEd+HJv1UQehDv+4WPqJn9MDYjsVw93j1zyQG6q?=
 =?us-ascii?Q?Xe1OD6vRDEdODiR1yCT+u3wSHxHBcS3i0CdI1BU4SXl5ck4zdIf9Ub3O1STu?=
 =?us-ascii?Q?EtX2prn7nzwIMe7KEHtX8KqdfiDwcaNouoqc2dl22z1wpKk2irUPqZuvC6YL?=
 =?us-ascii?Q?+cvZxfpyhA=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 954979b2-bf7c-4af8-437d-08de5354b944
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 10:07:28.7779
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gi5QfBRGHQESV5yQ+TE8+MXp56ZFAdiorgQhF/9CJQJKVFx7XDXpfOEgVEhl28g6HwQ0TMQtvKzNEsyKCIvVWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10533

Update dt binding document and driver to support i.MX952 platform

Shengjiu Wang (2):
  ASoC: dt-bindings: fsl,sai: Add support for i.MX952 platform
  ASoC: fsl_sai: Add support for i.MX952 platform

 .../devicetree/bindings/sound/fsl,sai.yaml          |  1 +
 sound/soc/fsl/fsl_sai.c                             | 13 +++++++++++++
 2 files changed, 14 insertions(+)

-- 
2.34.1

