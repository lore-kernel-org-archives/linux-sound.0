Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010042.outbound.protection.outlook.com [52.101.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1BAE30CD8E
	for <linux-sound@vger.kernel.org>; Thu, 28 Aug 2025 02:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756347685; cv=fail; b=mzmJ71AA1nkGW9RqEzIluXAMABSbSeXcM2qdC+r9M5IicA9Wmn74LWyhVaJa6/k/cqSOjt14t+L9/jaY/FuKTbOAiNT5qiKBt4bBxV30P4ZnRC8EJ/Pv4xDhCezdRPJE3MCVSGy41sN5fkiiKzPouGwTLXHSc8qk+y62zk0ty18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756347685; c=relaxed/simple;
	bh=uWK6kTCcL7zZdcOdq1UWxfvrlaTmoym7rEmkcPx11BY=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=boIK0D/hYFLv1KNSb/YNxXrr4M8zYMEBYTaYCXKnq/zTR6nyndqYxL5lyuvH0dhhwuwlskVaJcY06JKAx1w1mIcfPVx/x8kfe/U00iV1azaYbIN6ZzKoeWlbudfJ58Qtl7NX2B58xFVDQOFSF2AbFVekgkwPrH1hyyaCwpjZeCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Wfutqt96; arc=fail smtp.client-ip=52.101.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Wfutqt96"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=appdcMVpJNGiyf8IsMpJMONsAZYEMpYpEpdbQL7n+x7jPeZXu8W4j3Y2Fu/uVePu+vrONI5T4lWlqMxTgB62mD43+DyGVg1Sh8nCVA2mq45ICqviIX1T5M3LteThUMMifk4UkzwkcdS4Cjg5XFq2M1pOTASYurs66VMMWXVtN6T/eLx+1h41/xqTC0fDdunfiKZz75fQNJ4bbVdMQgRQ/gdWZ5++Vt9YG2ngwUjeYYIDXAVq2TP8Jbn90V+cS3GvDP98kKHDhaV+vMf6jVaUA0O+Tbz/pE0sDu4HV/e5vgHJK9CXM2ZVofYDS2gz9nbJOumK8jmuOB+k3QQo6yteGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lYR688yB+DPB2jE3FBClLP8nOJrp2gkOsdQa5/V3PIM=;
 b=FCuM+Y6BByirPvgV3QTWMPKNTVBzs/bYcsaVqdsQXzEQ2c+hJ/iAfgZQHQyKoMxHQSsrpx9NrE5zr1GBXgbrtT5oa/kEPjz4BGBItxy3wCkWGUBS92RVfWdCKq07X8/ORlOqpPHId+2eCRamZfzFO4GmTAtBHwKg1zq+hfsyvosLhfmImECcT24814DMgD9/p8rF1J8xOUBB0g33K8OLmap/gtlX1gvp8PcDIvAFBsW3vGAx7diTqVpEIThaX9DqAB7YprcVfw07lGS03xbyeaF18gGCVI5mndn++mX/pGFYXA5RdfdNeXc8u0eRx2X6T9Ck9PrPj/FWVlIPy4lh9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lYR688yB+DPB2jE3FBClLP8nOJrp2gkOsdQa5/V3PIM=;
 b=Wfutqt96lgDK2RmMVkU3JtLcL+UcLNg7KDQFth8YKeDZMVnfJAKKVdd0/bSpKu1OGMqg2wdRqO2VXxaC3zXhSqDn9I8ZFRLBbojbCTVgqxSQc9d+d206zHcT86zwVi3vZDskuhhPR82A1FXkAMERqMrlsflKIVS+mIUDIpGVHwM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12429.jpnprd01.prod.outlook.com
 (2603:1096:405:100::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.15; Thu, 28 Aug
 2025 02:21:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9073.010; Thu, 28 Aug 2025
 02:21:19 +0000
Message-ID: <87iki8uqxt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 0/4] ASoC: renesas: msiof: Make small adjustments to avoid errors
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 28 Aug 2025 02:21:19 +0000
X-ClientProxiedBy: TYCP286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12429:EE_
X-MS-Office365-Filtering-Correlation-Id: 7128c121-15be-4789-96b2-08dde5d99313
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L/C5jM2XOvPQxdfUF2y2EGbMh43fh5kQpClFEhCYig3lHBw/EJxrtziqD0yE?=
 =?us-ascii?Q?Qc+coJeF0tPbBN3Gs+NNhJbHOsV01fS25deatynDCRKYvUZ0mQyUTpNwSJQK?=
 =?us-ascii?Q?YS2snO7pSeAjcItq69T6ezSsTMdy05enSbHaSnvehQv1jw2bS9NxEgmarP+P?=
 =?us-ascii?Q?RYhTk/SWiQDxh65o5V6GPXmQkb8IjeXJrJ8OxenaYLa0OeBGAX3U/p6p6uek?=
 =?us-ascii?Q?PuQdqTx8jjeZ8dDgJjpvOORbTAvJ/wvEM3LW1VVOrVl9l8tBF90R6McQjioy?=
 =?us-ascii?Q?O+BxGhO8BWahWco08/56srC5Ev/ZcQFIL9UEgyFBC7rwrHNxmEZ44Wbkj8jO?=
 =?us-ascii?Q?MdyF4s1Q2bSN9soHFWIgJX0HNRTPZVhMgauZCIMYJg8XWVQCuLfdx8z8Z4ab?=
 =?us-ascii?Q?cT85CyUQGDptR04uaI1pptGvhyjmv7UAKnUTGLlGMy9UJ6aqDwQYTztMKxi3?=
 =?us-ascii?Q?S/2VSg3Q1KXRdOQAfhn/dhRkCs5QDN64HPqBR67mPOg3iwNvZQnjwyXB/RtP?=
 =?us-ascii?Q?DNHhCfxFMUw+3Ed5Fe6cVIl88sUOL+u6ZpqGbnrIYGmSxdGm6eHzisDh25CD?=
 =?us-ascii?Q?uew3KDiNXq7CNdGo0TuSVdD4i/a2a/nKt6Hxr+UVYHmRMI8Pvq97j5GYzzcH?=
 =?us-ascii?Q?GMqcKw582Rq8P5w9S25kFLjpzCJk2HiMUrm2lnW31Dfv9Vm23FRhauUeMpC5?=
 =?us-ascii?Q?Ole6EtgWkegkjgpGGyWSQ2WpHa/NQ6dIULfZNF1VaBMsXRfzCQpP4F3PQAvx?=
 =?us-ascii?Q?mNfOivjB8HOWobkwlG2zwjvRvcCrGYco1dW3HmKhoCgyL97Pb49vkcwcn9C1?=
 =?us-ascii?Q?tZDPNJ4+2i0widC/o3UKdbHXq9zZZ3lWn4phNjVlD1o7bZXdRwadtIVJMhMV?=
 =?us-ascii?Q?T+bIJHISMyftWQ2lVX0aNOOA5j1d8wA3MHr4v/LDeO3KF23Xhje+kTjW+pCd?=
 =?us-ascii?Q?smyPn/NgO54mAxW6zL1v/cL2AXoUWRanRm0fuf5SkN8Y3KHoOD4v6N90Ye8R?=
 =?us-ascii?Q?PdEuRGIWcatyxpLtQb5J+7YVLXHXsyAMgUoFV4/XxH9pB/6ED6tMU67quqZ/?=
 =?us-ascii?Q?mQFOFBID+FXndRbKYzoV4KW03NLEBH6KJCf1g5bU0Ma69VVGKgSn9hxSjJ08?=
 =?us-ascii?Q?WP4xO3raatR44ndezphzUxaWWksLZMELhNUta+v9udeU91KwtCg/SOemntMG?=
 =?us-ascii?Q?bKJYnWMq8+sEyda6JBLlBA3CThjXlS8enx0F+khixu/fb5/PQVBFNYRTte1p?=
 =?us-ascii?Q?xdHjjeydE3ye8iLmA2kCY4Wmi6lmpCoCU9G40LyMdamzvK5MNgBw+fevSLhs?=
 =?us-ascii?Q?BUo70Cs3wjgHmQcWHkb/hzO6xqoJmHpSI0Fd5pJa19kNNBctxPHyhgUEEKva?=
 =?us-ascii?Q?F/4bTdZafKFhs5DybbLRtgayHcGpgyYAXvxZSaL8ih/rXx9dd0EshUvOqf5f?=
 =?us-ascii?Q?6Hv2ZBAZAPOMkVk8bXBFOUv7J15dCexP7CGabRwHvgc9yfl6Ma/Duw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Xz2A+cPGtCsn806moLeZr0Um4uEFNtNWaTv5tVdnmDO9awQqQsEv4hMU8iaC?=
 =?us-ascii?Q?l2NV9C+z543SYvmKWS5nxZdiAAKLmRHaofcNgIeYtUqYxlOzGYwjrFC91enK?=
 =?us-ascii?Q?HR90l7uozFQeIxZjvOSnqV/yGT9N+RJseEWHB+CeVm9Zx3vyxp5+zmF5UZOz?=
 =?us-ascii?Q?wOqsS7iERbtzQiw8DPsu3g92l4Qq/pFlwxdLzdRRtvmxBuT7G90CzRs3LiTE?=
 =?us-ascii?Q?Ir7WXvu46z04BzzcZbiTXLpKp+cqZNzMPDpeHVJykyYVO8ioQDQYrIkVNhzw?=
 =?us-ascii?Q?12my3jhBCPUYcH84VHIf4x7lybVZemjy3RX/oz2bvIgJhFeuYGXmRyjo91Q0?=
 =?us-ascii?Q?rUwfzecvT2af2HGpj8P9u6iEAE8cUw/P1GvUqVlY4VV1s/EXbQQH4WrMqrOv?=
 =?us-ascii?Q?m5mIUf2QQPr0ZjOMdsYeFDjwwsTxJyJfsUUpDhGkxz64Vk4M5vtUi3FhsfLv?=
 =?us-ascii?Q?cQSPQO1DPIqbVLnAvwHnvycdafvPqaqcT7lwxzFDV7jCowNqBmU3Pu5e/ZR8?=
 =?us-ascii?Q?cluhrkPEPBSIrsiTbzC8xGTI9b0hR3N1MWCKHRmEIhDUghqmg6+eCKIb9Atg?=
 =?us-ascii?Q?RnLcUrqIiL1rbsxqXAGp1oxF6nXVE2cZI0hCHfdnXblYuTOHAUtZ5p13ymMx?=
 =?us-ascii?Q?WofwlvByjNVN/l5t8UH2sJ6OpF9iqq2tXxOLOuztuGcRvf6JDvBHuxWfaxJF?=
 =?us-ascii?Q?J+3cQSHGa+fJ6/xCoEDtR/50z9/YdsflvK/3UDTUBI2Qu01EGKU4UcJVrbX4?=
 =?us-ascii?Q?tHk5cmlTJ7k1b1xMx0LFtoPvdo2kl0KANJXN8DcV44TxyH7uRvQumZkJwNVt?=
 =?us-ascii?Q?X5kWm2W0UwToQYctkEWg8EoXYKZYiQzX3VP7E02AYmrDskLf4bksftvRIQeh?=
 =?us-ascii?Q?WswCMTtGl+CHISHJkji9yOtoR6jD6O0fRsF7meJu4qCfDq/QfOR80a2tm6Wa?=
 =?us-ascii?Q?/aULGhTyinKv5wJgKdw+SssN4b7gEmNzHXOpUPB6akrcmQ9AMmIN9EJ15IAx?=
 =?us-ascii?Q?wj9S4rMfXZ/3DNv8vRTxsunaGLNrN+HUbAt91FAk7527P9t7FkZmzHLd8cQt?=
 =?us-ascii?Q?Jj2WLOhjL5EinHyhZZMgyCWBbtQcPc6Tq1QhRRlD6ezdhFxVu6QTsfnULBMa?=
 =?us-ascii?Q?tZ15ucUESPrYw/2DMCrBaw21Xg5H0XNCyAXXXmYj7qQGdEfWVha074uKb4PV?=
 =?us-ascii?Q?m49ECcgR7Z+wJ4vxCWOptStSkis4yFcctvYYncihB/P6JIPed1poz5Gpdd7V?=
 =?us-ascii?Q?1YcEoayx1rWq+lCWp9bFVztp6ijkt6E1CIFkn5SrcKh7c/QAyPhT4jQIX5w+?=
 =?us-ascii?Q?gAC2veT18mfhpk32w3tZAVr6vfLDnRvG2Ok3mukx63SHDEKLhRe5OzCX4ccv?=
 =?us-ascii?Q?3rml7ZMrM2wiAwb+rCOdAgKgkn/6GfRE1ndKY9MfVQc4Pb1cpU9M1lzE8uZb?=
 =?us-ascii?Q?/cZMBFHFaZJLQY7xN0R397xWRKMKyqTbAsgd60nFOKiIUakew8uGzDG2LXDt?=
 =?us-ascii?Q?QSvywix/Jj3XgcZGoHlREdDMwqmh8MUfIQUPSicuk8ySUCstGph+re/iJRUk?=
 =?us-ascii?Q?1YQAShpMSGCja/Ne58sMGcAxrQeY14/QjhaE/4JQMZ3b5tE657ug2CR3fASY?=
 =?us-ascii?Q?S/TyAABSHJHy9A2FsEcRjd0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7128c121-15be-4789-96b2-08dde5d99313
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 02:21:19.5791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuZMwT8kEEKT8ibzUSoTpV2gUKiWShveDvYSM5sR3S2h7qfXL2q5gDpFr6wSw36CD6WlPnZL1roODky8//vpG8oljVzgs0gsV2UDL5BDe585VTLSGc1ZK2pxvp1HULUK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12429


Hi Mark

Current Renesas MSIOF get unknown error when first used.
This patch-set will fixup this issue.

Kuninori Morimoto (4):
  ASoC: renesas: msiof: msiof_update_and_wait() checks whether reg was updated
  ASoC: renesas: msiof: tidyup error message
  ASoC: renesas: msiof: cleanup status clear method
  ASoC: renesas: msiof: start DMAC first

 sound/soc/renesas/rcar/msiof.c | 34 ++++++++++++++++++++++------------
 1 file changed, 22 insertions(+), 12 deletions(-)

-- 
2.43.0

