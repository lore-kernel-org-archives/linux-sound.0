Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81FC315E97
	for <linux-sound@vger.kernel.org>; Tue, 20 Jan 2026 00:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768868039; cv=fail; b=IvGQTO7d050mOHw2lGKvX3fsO/DxdNJC+jFzo1iZe2bb3jhD4wVdPQcSnLGzL7Qp0k7mejlJ6xto2K54O63Zw9I0Vo1a6CQ6yG3nKUJc3oPnO0Ep4dFoSKGhlK6JitDqnNXcuIZVt/OYR2hNhyk8catiUqc8JmujPVrCD5/jm5Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768868039; c=relaxed/simple;
	bh=98rnrvIELGC28KkOCpCkfWnYl7nSdHPGHNJT2FTr428=;
	h=Message-ID:From:Subject:To:Cc:Content-Type:Date:MIME-Version; b=AR/dJ33nKMKorbt50S0PDxaek/xy/GV2srVBROozJ7U7vbJjl8fzpCjxaqWWXlAcCGid9i0ytATdxpfya2u7S709pa7W4KDCScNBMBtBzYY9WNkjMibr1q2dwgNIVXyzBdvREb6CoD3LJMoZOQJhLAEVUWfEAnPsn+9lI/kjuvc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hTRUxiWX; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hTRUxiWX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4A4TLdjzKwiHh/KNgxwlNoSYn3DIohlL6atyVo3nVAzZzG6EO2lbIoOUxq66rnSRoDlV5SoGJfcnK3+ZttPpqvvY2Tpf1rUwd1d8v4o1uwAOIzGDCNvBo7hjZxlNtulQrH904egwswYJl5LVzA0WPd9O0rj3eCrDp715YtK65wHvqtL8Ot9D0UPnM5pUGOJI/KEhDkb9qI+vdc0558jtwNFSF+J6eF6gmtdolH04uhh1lUbS6G269yVxX3tziwMEeZSXslzYVwzWWsdhiVhzwOe+83STE1CiJ/DqroOvZefzQyIq6WLSsLSQY6eUlDJCYQPkb7MYMbQk6ge7Uz8dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsHcj4LX8GosXB32tq+iaOdu9jOaBLFyJkU6/xxOi2A=;
 b=y+0a5h0RNjqnCDYqFtpflzNgumfxBQl6E2jG2saqf9sBNavX7EW6meZapeAKpyY+bDgioJtTIBbZNPHUcfgEqVYJqlqbkJuH0iJjSpvQsSyidKg0KgLnjSSdSr6B23wKbBiuZISN+/nzecRk8tdc5ec9MLrpDLaqO7mvJNAW/qNpLmTXq2/TPR3+yRv3CFY7j9KH7licVcUcFzUcJxSaHX+k1QjvRayIlGp7FVbrcBGErT/N5Xs6+ZrRt+ULVUKm9ZRQ6qQ2kSVfaWCNN8yUxiItyxOP2OJnqeufhLuSuTsofDa+S3NBMHDZBQPxFNqSK+uJ+WWLLCwImvZr5A5mWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsHcj4LX8GosXB32tq+iaOdu9jOaBLFyJkU6/xxOi2A=;
 b=hTRUxiWXB3zpB9W4undpra2ZPHl3aXt0xGI3+GLgJlD5Ag0fBkGnWTGY5d0BekEltS2IaZotyvRFL3wUzdEc3PXUvFRRtlE8xCCuN5slsZNBSfGqLM4/7TV6yMCs0LORdM6kKFaGn6zDnfU/T2UGi9feIIjars5Ai+B+ku2PSs8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com (2603:1096:405:1bf::6)
 by OS9PR01MB16099.jpnprd01.prod.outlook.com (2603:1096:604:3dc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 00:13:51 +0000
Received: from TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee]) by TYYPR01MB13067.jpnprd01.prod.outlook.com
 ([fe80::dac1:6ae:15b:67ee%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 00:13:51 +0000
Message-ID: <87pl75qgxt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 0/8] ASoC: capsuling struct snd_soc_dapm_context
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jan 2026 00:13:50 +0000
X-ClientProxiedBy: TYCP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::16) To TYYPR01MB13067.jpnprd01.prod.outlook.com
 (2603:1096:405:1bf::6)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYYPR01MB13067:EE_|OS9PR01MB16099:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b7a13d2-9d63-4783-d194-08de57b8ca02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LGY1OIu24vxiT9GDZke6ArW/DWS8r9qRup+JCm9njjr568mhzYQclK80SIhL?=
 =?us-ascii?Q?2YGFb7HCMhCgnZKJpgwOg5UIVCmBNKxdH2/10A12spsDgZVOFSEjcYu2eW6G?=
 =?us-ascii?Q?NEPcpC6NadNvpzIV3vqSR1xabL9Bm9dZAEl327PncLMT2LhFZoXCo4oV0e+X?=
 =?us-ascii?Q?U5vRf5+o6pokTbsH2oMoP1U6iIM4iXhxUBhXj5rZezYU3Dcfe4WONNQyJyH/?=
 =?us-ascii?Q?Pkm0hQV6iPtQ+zqbhvewF8FkeHYv3f+CK4sbB1NK+nxwmExpOY5F/VsLgkyJ?=
 =?us-ascii?Q?FZ1ihg9NyUviVpYPjzcKN7l+K8ptzz5IK5pTdytavg418bPqMRV2ip6sPkVK?=
 =?us-ascii?Q?7RS0nSNvv7GRtQMjm0h8oG0ntQWqNOm9rch4RAdw82Aw6jX3qIWE2yfhAzNl?=
 =?us-ascii?Q?zmdloC+5mN42hb0LhvhMmXJnBv1RzIOCjCiMiZOwCsVzQO+gh1Cx3q/5snrg?=
 =?us-ascii?Q?UoskaNNAk5Q1BjEZzgkC9j/kYERn2vrTiB3LwmKY3D9eg728WQ5VLKftkDjg?=
 =?us-ascii?Q?l8akAPu/blsrszlD3BBb9xXP+kKyoTtVY2MQ62Gy54FA+eWNUqV5ZNdgFWBU?=
 =?us-ascii?Q?CPhCZ8PBtypKqpEgNtK6lMLRRAXtOT87cVdozStjJ6aKa8YT1mrUWLROTE8O?=
 =?us-ascii?Q?4Vx/NbGqaw23KiisYyzGpKylIUC1v4PrWbI09Xso46G5j5ho2em++gTwDzX8?=
 =?us-ascii?Q?IzrVeWQLlLLfS02BCFTXNSb6mlVJKQM8IOXO35GQdQCuhecrmJ26Hd0clbAT?=
 =?us-ascii?Q?7TWNZMUR5jFqd7BC0e57Z/NYFrmRe9/43DC2yN1ohwsCVWBCDyg/oCTImzwR?=
 =?us-ascii?Q?K4UrIsh3WIzlbOsI1woeeY57qo1Fo2TtaNXx+kelinZYT6fDUBA12689jYmv?=
 =?us-ascii?Q?U5kJJllkxkdi0DS/EC0IvEx6+M7SDYEs72Pp3zJ/Tj07WCAdXJipQtByOiJj?=
 =?us-ascii?Q?gl3B9pY8B7/txI4OAbuw6aSYJ6SEafVNI5EeeDLGPvNTThgRP072AIcfoAXC?=
 =?us-ascii?Q?kdMa8hsdms/sLMn/zMoylOm/LmWQ/pEg2uUhNYvFatVw2z/KfxpX1z4IDxgD?=
 =?us-ascii?Q?HVGcT7U7XKLZBLSXiBl2Pye0933J92xZt5cLJqfilCIFK7Z1pS/SxKi8xlrQ?=
 =?us-ascii?Q?9sOjhdNZIEFC1vB5Q4AD7alLG33QzF0b3L8B6swQh293Lv6whq3ixZMagZTh?=
 =?us-ascii?Q?3rnNM8hT3jEBE6XUwvH6EhTtsUmIGgp6qOI40opOztWsn4+1xpTNV+iMwnHW?=
 =?us-ascii?Q?qp0s3axd7T+usxKBdkpOM17p+EWCSH2UTgB/9wL3+wkRpQytyo3QJBQO9oD+?=
 =?us-ascii?Q?ynEg/ixRSJtbxeeeceSSjCRt51dhCp57A4FuwXlazTTQRy9mQyt64EC0hgOv?=
 =?us-ascii?Q?CzgSbRDQHxs+rlqqRoMC6wWwwtoSgi78/JyYRUmyP5TXb5V7PAT4cLF4M30m?=
 =?us-ascii?Q?SfEsuvaMrdmCjzTSmNM96xDvZVGD6LHSYiBgZ5XNm1afqiCze23e9gV25Cs3?=
 =?us-ascii?Q?Wm8xH7UE7x0CDLJqbF4zM5SzNeQ+0JGn4FywnPh5imoi/SUsqZ+w5qCUWEkG?=
 =?us-ascii?Q?NYvc0To++pbA8rtM9s7F0ULGnsQLq/5CmKvfzqnLhs3DpJUSzkdgsIQoHIzY?=
 =?us-ascii?Q?5H8iw31kh4/9Xl4WqQIiWuk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB13067.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?M2S0S8mLHb7u1QLQ6+6pM/EepyTJuolzey+CYBnCSfiYtZMC66AmVxXNEsqs?=
 =?us-ascii?Q?nWb0tX3/kIeLDXNjkFqE8ZMir0qIBrvn3u3PM+ZGRi7UHybLOQbv5t7kPEnD?=
 =?us-ascii?Q?LEu5eeUTIbQubcWoX05VJbPGvKXloZCyEHsTuaOTNDW+mam2rcLwC4sOQ7rW?=
 =?us-ascii?Q?UiffhPA73pcOcx+N5Dkd7uQxEtsTuLik8lfxjN9nndjjlbgx9K1Z3vnUd7nW?=
 =?us-ascii?Q?CMyvU/QedaeOPZOYZqX+hDoAjXYNAih9GRt+N78viNor7HaEnSKLf4Ok9njZ?=
 =?us-ascii?Q?I+GC8xBkND8rv+Pf7V3HqfD3BBz7TokoHFNpgdnvo8WOxdcD3paw9VS8ISUM?=
 =?us-ascii?Q?T2KkVWaL3EyyYEHbnKAfFE1s4/YA9LWiJsOOuqTpqj64qXc0T7x7YkvCUNAs?=
 =?us-ascii?Q?IkhA2Wwnpi9OKJt+xlpazY3dVprPdU3JeaEhrRY7Whpw/Ltv6CTDCNDwuQ1S?=
 =?us-ascii?Q?TqvQ8vMQYeFqsXP6/xfaTDkh3HEwKoIPmJPyRvWxrgOEXkqXibfKI2h4aD6L?=
 =?us-ascii?Q?jbNSXUegjiuN7m88CzYrB8znoV8mdKWGSewA6vxBi8Wpp9T4gIePq5qcCSD2?=
 =?us-ascii?Q?KyEQ3KiEhTrvVkrWIzCt6QwbAzWBJr1oCJ1RaNxF8H/pnGHCInQWm4Xsc+01?=
 =?us-ascii?Q?VwjYdR4D1QYoarO+FFNd29BLYU4XRdIi5rmpxRQdu8cpFeoZzpopAKS5GFbZ?=
 =?us-ascii?Q?ifWfzigBb8fd95spb5hIviQREKnEvHvpaO8QwbIyqi/O7vORKyk+Rp5AluOw?=
 =?us-ascii?Q?Lc7pijBZu6WVtp85htznq+bI3FRQ9eYPDqyoY8AJPl6t4Gksr5hlBjWV02cE?=
 =?us-ascii?Q?vA0ffCm1CjhmM5ldnrXFmaueE+rMsOH3PohaS/BVNSYu8Ax+M8FCMMeeHaqa?=
 =?us-ascii?Q?sms7fuPVEC7VBg+O8E3NiHTNrC7at0vdNMnUdXuMIKWkHXDCghc5sCgm8xhH?=
 =?us-ascii?Q?jQxBdpobge0gAf93BnKNUu9iOE1scaWbU+Vt/wwXzW4WyXdtQ8h6jX5dHTXT?=
 =?us-ascii?Q?IyqmXHM0023ZZ1RwnWc5DOm4XIJ5P/qDo32O/1dTUK+OlYKac/VV+E+csUJJ?=
 =?us-ascii?Q?IsVpTuvHUULRfSahBvNktXewAiM3jyCCYZb80CjghP7GcIvTwNWqOfD/B01E?=
 =?us-ascii?Q?/MZZyB6LP8MWZ+zEKh041yhTopIXfq0FD+89KL+F+rd/f5LT7z2yZW8UCupi?=
 =?us-ascii?Q?hvNLq7nhkHPxbCduro7kbWeQgVocdqDnZGsGVYiusLSTouAIgghpo4uhkfji?=
 =?us-ascii?Q?ZNIRQY/9fH4dMhCRYwuWNSga4NZ1ms9dNAo2Fqrwvwo1Jw8vGpW2ZTghEuan?=
 =?us-ascii?Q?2HPiDrC4yDICcw5wTwi491jB2gi92Pb3lFzvomK2dnxDEI8Lx+vsziswA1kO?=
 =?us-ascii?Q?p7xrlaCDimKYm2Il1PhkiHVGxvDGLRkvFVihpCBLXVd/GbIdjhZMY99KYfWF?=
 =?us-ascii?Q?2XYS2SL07WpIiSnUEkm3UeaNrdRbwMlg+nqFTN/iVntxVnOkQ53Pldr0RsIg?=
 =?us-ascii?Q?+lKGgj7sgOYLsDaHZvsRflqW7GWsL4D3aEFTUDwJGEgze2cmNEgj6BOQFdw+?=
 =?us-ascii?Q?RU66OUVGaQXD3h8TaMc+oJkN1qAvEP6exJRUXvou5+w5z6BSCFPKA1STs7az?=
 =?us-ascii?Q?MEQeYUA2AJIcia2qFVU0ig3IxM2PJdkO/K5VcdTWMlBGZDDcnqThcWv9F6nU?=
 =?us-ascii?Q?b5zIzMQJZDsgVWKYTElIGp1FVUHeSirpXKoNwWhHpiunKSdDrOrO6LeMlQhS?=
 =?us-ascii?Q?NqAHRWaZwVMRSGbHX2HFwZ+rRTC6om0FESpBnTwY3H2DJ/Qa0hkf?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7a13d2-9d63-4783-d194-08de57b8ca02
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB13067.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 00:13:50.9793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uvfa9UgJtom1pz4YWIM/Psi2Tqp2u40ZJWCTlq+oVO4+2L62AZ+nEgvQPpH3Y3THA50k94xyL56+cjtslZ7IKZzn/0o0W1nNDdSmAmX+nH6/q5NwF48AkWu2UktnoXlk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB16099


Hi Mark

This is v2 of capsuling struct snd_soc_dapm_context.

Now, all DAPM users are using function to handling it.
We can capsuling it. This patchset moves struct snd_soc_dapm_context into
soc-dapm.c, and remove un-used functions.

v1 -> v2
	- include tlv320adcx140 patch which was added in these days
	  and is using old function.
	- based on latest asoc branch

Link: https://lore.kernel.org/r/87zf7jrx52.wl-kuninori.morimoto.gx@renesas.com

Kuninori Morimoto (8):
  ASoC: tlv320adcx140: don't use snd_soc_component_get_bias_level()
  ASoC: soc-component: remove snd_soc_component_xxx() wrapper
  ASoC: soc-component: remove compatibility definition for component
  ASoC: soc-dapm: remove compatibility definition for dapm
  ASoC: soc-dapm: remove dev from snd_soc_dapm_context()
  ASoC: soc-dapm: add snd_soc_dapm_alloc()
  ASoC: soc-dapm: move struct snd_soc_dapm_context
  ASoC: soc-dapm: tidyup function naming

 include/sound/soc-component.h    |  29 +--
 include/sound/soc-dapm.h         |  44 +---
 include/sound/soc.h              |   4 +-
 sound/soc/codecs/tlv320adcx140.c |   4 +-
 sound/soc/soc-component.c        |  82 -------
 sound/soc/soc-core.c             |   8 +
 sound/soc/soc-dapm.c             | 352 ++++++++++++++++---------------
 7 files changed, 202 insertions(+), 321 deletions(-)

-- 
2.43.0

