Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57043921EC;
	Sat, 20 Jun 2026 15:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781971091; cv=fail; b=G1EeW7fSUbSBlzM1qjGWaPsJPqqQqeDxG3hEgsoL2SjkJYz40Vj93dewV7EsAOGs1gtUpBF2xvevuZsWydFR9YLZBPsSyS8hy7AFCIDybCO04TRTXnAmaCGQZDbkWbdUYKqGph6UopDgab/fZ2sRwbUcgqc54/NpfeV/eJ3CMt4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781971091; c=relaxed/simple;
	bh=wmgJVk1Wx5yGgQr9KQakX5nPXVt4fQxfK5qlZhEasSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lapJ50Us5YdUB9ZK0eLis8KJ1D23uy+W6QcQsUM68austcCZiAEm60PswbYqLSHNc7jw8/Ca0iD9SBDnVxnDntvvilA0a4fjKeqmiRIi55IUZ/yJLLuE6TVJphpD+bAHhg3UXq36cN/62r9WfNEp6hSov+/M5QyblHlcXGvEXC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ix3NUqi1; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=x6u912Di; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ix3NUqi1";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="x6u912Di"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65KFeuX63347926;
	Sat, 20 Jun 2026 10:57:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=kJXtBxpjprOg8Dt9Qawmr5vINCwYnqPAF0ob6p+wPQY=; b=
	ix3NUqi1Xo+dmMQGQOxl73gUtTVYEMEL+iNIHWQCr1DoTeC0mceIzTEOPUZ+SQWE
	E5UqrgPNW5gD8ye40dooLZGsVUOkE9jeWY8jlX1vqsJ7nakCYj+IT07zs2l22aO/
	XHL54QXOMSqwhUy5Dfqs+RYlbODypQ4xlWiX9WCNzDBV+2C+ntDwKahonda1kJsP
	WmkZpqtRwBn3OqOcuQqkVuUj+A2e+KNN7YbQmh5kEX8O1WWhqNLTy9I7yo7GZ29D
	L7j2oy39YIOHrSn+cku1Up7OZ0kKwk8bIo8nGADolWDiDB5rSTwYBE5XQOBAtohg
	arbmN/gxMuBbTlZeBhYMJg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020102.outbound.protection.outlook.com [52.101.85.102])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4ewq9jg965-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 20 Jun 2026 10:57:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CzzQEDgo9xir+noZ0RMRKxf1B8ySqTydOGx5Y6doot1ZpFARetJZE2Wc1QZ4BB1g5VWGsk0RsBDZk3/xqWi0yTtXx0S1UGo7GAguyzLsugQN7XwUqdZFzIKkTpg80mRWyg7CLu6iRr6chET51rrTARChZudZeFxwxJjG/vAXRwKKvXtKbSc/oqmVxomVEydEX38XBCK+NZ1DB7uCBYL+bgZs4oI5jWDFNLp7frfkCiVqVwiJ5pFlPwr8Y8icS0Q+RUUojzuVzdseCBpFUg2npaG1IG4j5C6hqF5i0wGnGGikK6/6T/vWa52aALfPQ92r2tFysyUmcWyYFUteH1TUEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kJXtBxpjprOg8Dt9Qawmr5vINCwYnqPAF0ob6p+wPQY=;
 b=jzZEwNBqyyvKSHGhcIeJmFpHtJGr4evhJatWyrof64FRrvbiuxXZBsL/cz09Pe8/aL8C5n76AqgCfnk82kAFk70gw95wvE7v5AuHoJ4VF1TzfNefA7tGko3VN7uk7zcatAmIH4ukpuNYtci61524WUuc9guIHiVo1cjsR3difv8oJPWJzds4eGWm80x2WwJfjwGUrDe3YYCHAO8xveXtO5qoQEDTtSZdfByDq2R8l7DkAOawv80bM9gwLw/cweOlXHSv5k6hupD/zeu7u8mIAfAO9Jyh06He6DrpAbTNbw2cXewfrjI7Vpyky6pI+NXFyT09mYYGMLo8ysor2Y7OPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=broadcom.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kJXtBxpjprOg8Dt9Qawmr5vINCwYnqPAF0ob6p+wPQY=;
 b=x6u912Di43OLIFXIVmUxOvd0EauETA/S1QuFwz4s8zn4iDg99ecAl1C0LeLSZXZikqjsFq2FvRcSF7rfqYWEcAH9FQeS8ND+fdphGnxrvIl6CNngbKmvXJ/JeRD8/yC74lwLsaAHm6HiTrxHfbyHPAcw7FmsMoyg27NHK+8ZDv8=
Received: from BY5PR04CA0016.namprd04.prod.outlook.com (2603:10b6:a03:1d0::26)
 by DM6PR19MB3740.namprd19.prod.outlook.com (2603:10b6:5:245::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Sat, 20 Jun
 2026 15:57:43 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::27) by BY5PR04CA0016.outlook.office365.com
 (2603:10b6:a03:1d0::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.13 via Frontend Transport; Sat,
 20 Jun 2026 15:57:43 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.8
 via Frontend Transport; Sat, 20 Jun 2026 15:57:42 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 49FDD406544;
	Sat, 20 Jun 2026 15:57:40 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id EF1F782025A;
	Sat, 20 Jun 2026 15:57:39 +0000 (UTC)
Message-ID: <274c6e32-4571-4e74-8e70-53c780cc7e24@opensource.cirrus.com>
Date: Sat, 20 Jun 2026 16:57:39 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: soc-core: Create device_link to ensure correct
 suspend order
To: Marek Szyprowski <m.szyprowski@samsung.com>, broonie@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com, Maxime Ripard <mripard@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
References: <20260611110856.1088110-1-rf@opensource.cirrus.com>
 <CGME20260617141046eucas1p2e85629d57bfc17449b135b16f9230d57@eucas1p2.samsung.com>
 <4c9156cb-6508-4fda-8e36-7edc4eb7d6f9@samsung.com>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <4c9156cb-6508-4fda-8e36-7edc4eb7d6f9@samsung.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|DM6PR19MB3740:EE_
X-MS-Office365-Filtering-Correlation-Id: 005d698c-5136-42f4-8356-08decee4a997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|23010399003|36860700016|30052699003|376014|11063799006|56012099006|4143699003|22082099003|18002099003|16102099003|7136999003;
X-Microsoft-Antispam-Message-Info:
	GuEOTmEirLc+9OR08+ZCSgIbferShpmnvYXNLcdSYvG/Dd8VbkNzKoTMV2uTL9gUVxcl10UfOjrXwNCRLjOw2XCIHI0XHAoepb0CJrtZ969109pwBvN46vJvQOxQ1vPW5NYfWnyYSzpsOe/bPBphtiedHB2ALfXKi+jyF4pJ2X+C++n8TySfpZkE3pNeWKh5oCuS4bOfwq55Tda5FUd896YraXSA5Dkwg9jIFKJTXQ7sAF7+74zvAM4mrT8GYAcI2WW4bAc2c2WxPIlv2IBMvp/Nko77CamXIrBT1idKdsQM/IGXM0e2O4CVPoFXD1GTsv5Xlw4ZaubkDIFj7RaO9zC3Jo/FzmB5Q4Ht3oXJ1+Yds2ud4/9I2EewsT6MwVGc/0QtAhLVoCrF/MatDCE00yLRqlZY6hbBbaeFQaQkuVHGuNzfv+2Du8Xj9A4uNubhPsTmCEfCaIxOuMW4/obsSe++yTGUz5e9atgOPxhoFohumPOHi2PBmkpGk/WbRDfD5Tqk0bJ4nVI8xc/p+iFtKAaoBe5mFjZE2uecbZciw7nR0yksepydEKtYVQbHDRn+Br6gy37pDZ799lIg16K+aof4Ik99xIdmWdTOtcG6wKeNO1aHQAEUGjbw6J1EEMI16lUx/6A7T6ncJYM4XMqr30beDwQ+qBEtXFNRAPYzs6MDnvFExnTX7zfVMimJEVdLYntU09HQ9W0fPUPNzsLluw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(23010399003)(36860700016)(30052699003)(376014)(11063799006)(56012099006)(4143699003)(22082099003)(18002099003)(16102099003)(7136999003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8CwfUgP/h9Bv/6UTU8ImclGpf7ahCcnn6Wqh6+tJpGXwtadrIT+GfKQZ9k1DWxPopZbKNbQI7YXKH7NJN3s5mqiE94+llRQOvlE9ngNGS8CMk/+Cv8GZONMKSgMYIo8DFgjD6qab4rQ+JQPDo0BUdRJT4lA4CZe6nglBvwdDmRS4ZYkS997RS8rNLHlZT5TmFL1DIZcDIypOns01ZuPr98nmYG/3o5QRCNxHIwsxJJyCmxKTkKBjqwpMC5Gi0Bf7hZmI26jzqQ0eGNTODG7ZSu7OhyoR7BqJgP9Qjj+PujST7/Al5tG04/tNSY4cLFFn+ATH2jL9M7XaURG2PZz2fcLhx0HZKclbexi4Asu7NH5RkVc95FQBejmaVJVBA8yn7llj16k5EQWckF+YEJDS0QYDOWpSzRcG/R31iOkpNa3Or6GINb/H33TCmKilhtwx
X-Exchange-RoutingPolicyChecked:
	g+ubruEhgZsJ3AbUdQoghbFVxD1rZDsYIIk5rLmsqCnqCdFNXFrzsC7ghmYOKB2loXClshMpAo7Zk0Bny0Uf5jvYHNiQY0/GxE9+AFOzEiV6VHG64cmL1D89uHXKednvw/66vVpLA4hHYKVJxkM2sllg7rtGyaH5D4zmQ1ghXvEHrgs0Z0BzRJYgIonntsBU1mvQlbzlc7ebTJYkpY1Dqcwz449+ZYBfSwv/vTvSCAf66rFX5Vix8UBOK2pMbZW0prwdtTRutqe018AMD6XCi+S4EcQHxU+C1GquG3p4PMuBPgXhMyMAB++2REGgT6sBsrNdl00mA/4FfFNJZ9wycQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2026 15:57:42.3076
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 005d698c-5136-42f4-8356-08decee4a997
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR19MB3740
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIwMDE2MCBTYWx0ZWRfXxD7+vP6LcUTC
 COaCd0s5WjMllPxXKX04v4pYKMoV0/VJEmEU1LoeB1MivIT58KDiMevF39N1t6lphe993SDMKCZ
 FwM8HhXtcvYxoek9RUkyRaKKoa5K3jk2QbnPVjHaOd0c/soZw8Iep7uaonP7wFgRNOusabiOBGH
 QJKzmI2KZssplPNO0hM5EZc553F3nc5sdSVxRWmiVpZ+aJ7JohxEftOdKuLc0zSSDiVOkVdUnrz
 YSQSuqsXuAPOKDC7qyLHl2yfgSfIC2V0d1fz29+mTXVodVeSgLoQ+KOADMC93VnZPOdH6xCAQay
 dscWhoQ/69deEbxmC9TFgxTgFCBrdgxuHP8KuhXH0nts1sDMKE3pgXOHK30oSy0VIO40rAsKCPW
 QiHM+53oiYm9ZH2guCJ53n5ExJnEB/8jmu4niJVYvwoHU9EQDYgBoPCl1djgDOGp9F3bnS8lrK5
 him3hNVoEbRpllZnsKA==
X-Proofpoint-ORIG-GUID: 714QrEnw76SezuapslHSYEiO89Teu4eq
X-Authority-Analysis: v=2.4 cv=SajHsPRu c=1 sm=1 tr=0 ts=6a36b87c cx=c_pps
 a=/HvL1LX/IhLcM0VBVohJhQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=o9ibTLtEAfoyA2TpcwIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 714QrEnw76SezuapslHSYEiO89Teu4eq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIwMDE2MCBTYWx0ZWRfX/q8dObo//Jub
 WMvgU7TMDzP5CIrkbg5L2b3pcrbt+3PByCUsQLS/UTZnAq0lCSLOzZcG8jiFvoLaw8auR5Jsc+c
 +McGGQROeOzbDpSug5Ok+Yk0PLmc2dw=
X-Proofpoint-Spam-Reason: safe

On 17/6/26 15:10, Marek Szyprowski wrote:
> Dear All,
> 
> On 11.06.2026 13:08, Richard Fitzgerald wrote:
>> In snd_soc_bind_card() create a device_link from card to all components
>> to ensure correct order of system_suspend. The card is the consumer and
>> the components are the supplier, so that the card will system_suspend
>> before any of the components.
>>

<SNIP>

> This patch landed recently in linux-next as commit 0f54ce994b23 ("ASoC:
> soc-core: Create device_link to ensure correct suspend order"). In my
> tests I found that it breaks probing of VC4 DRM subsystem on Raspberry Pi
> 3 and 4 boards due to an issue with hdmi-audio-codec:
> 
> # dmesg | grep vc4
> vc4-drm gpu: bound fe400000.hvs (ops vc4_hvs_ops [vc4])
> vc4_hdmi fef00700.hdmi: Failed to create device link to hdmi-audio-codec.1.auto
> vc4_hdmi fef00700.hdmi: error -EINVAL: Could not register sound card
> vc4-drm gpu: failed to bind fef00700.hdmi (ops vc4_hdmi_ops [vc4]): -22
> vc4-drm gpu: adev bind failed: -22
> vc4-drm gpu: probe with driver vc4-drm failed with error -22
> 
Marek,

Can you try the patch below?

If this works for you, and passes our tests, and nobody has any
objections, I can send it as a proper patch submission.

---

 From 08de5810ef813c9945d01a2ce23cd9dd71cf3d99 Mon Sep 17 00:00:00 2001
From: Richard Fitzgerald <rf@opensource.cirrus.com>
Date: Sat, 20 Jun 2026 14:33:18 +0100
Subject: [PATCH] ASoC: soc-core: Don't fail if device_link could not be
  created

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
  include/sound/soc-component.h |  4 ++++
  sound/soc/soc-core.c          | 32 ++++++++++++--------------------
  2 files changed, 16 insertions(+), 20 deletions(-)

diff --git a/include/sound/soc-component.h b/include/sound/soc-component.h
index 11bc9527653f..aa423865dbe7 100644
--- a/include/sound/soc-component.h
+++ b/include/sound/soc-component.h
@@ -10,6 +10,8 @@

  #include <sound/soc.h>

+struct device_link;
+
  /*
   * Component probe and remove ordering levels for components with runtime
   * dependencies.
@@ -216,6 +218,8 @@ struct snd_soc_component {
         struct list_head card_aux_list; /* for auxiliary bound 
components */
         struct list_head card_list;

+       struct device_link *card_device_link;
+
         const struct snd_soc_component_driver *driver;

         struct list_head dai_list;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 86b6c752a56b..8c24049d44d3 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1980,19 +1980,15 @@ static void soc_cleanup_card_resources(struct 
snd_soc_card *card)
         }
  }

-static void snd_soc_remove_device_links(struct snd_soc_card *card,
-                                       struct snd_soc_component *stop_at)
+static void snd_soc_remove_device_links(struct snd_soc_card *card)
  {
         struct snd_soc_component *component;

         for_each_card_components(card, component) {
-               if (card->dev == component->dev)
-                       continue;
-
-               device_link_remove(card->dev, component->dev);
-
-               if (component == stop_at)
-                       return;
+               if (component->card_device_link) {
+                       device_link_del(component->card_device_link);
+                       component->card_device_link = NULL;
+               }
         }
  }

@@ -2001,7 +1997,7 @@ static void snd_soc_unbind_card(struct 
snd_soc_card *card)
         if (snd_soc_card_is_instantiated(card)) {
                 card->instantiated = false;

-               snd_soc_remove_device_links(card, NULL);
+               snd_soc_remove_device_links(card);

                 soc_cleanup_card_resources(card);
         }
@@ -2012,7 +2008,6 @@ static int snd_soc_bind_card(struct snd_soc_card 
*card)
         struct snd_soc_pcm_runtime *rtd;
         struct snd_soc_component *component;
         struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
-       struct snd_soc_component *last_devlinked_component = NULL;
         int ret;

         snd_soc_card_mutex_lock_root(card);
@@ -2146,14 +2141,13 @@ static int snd_soc_bind_card(struct snd_soc_card 
*card)
                 if (card->dev == component->dev)
                         continue;

-               if (!device_link_add(card->dev, component->dev, 
DL_FLAG_STATELESS)) {
-                       dev_warn(card->dev, "Failed to create device 
link to %s\n",
+               component->card_device_link = device_link_add(card->dev,
+ 
component->dev,
+ 
DL_FLAG_STATELESS);
+               if (!component->card_device_link) {
+                       dev_warn(card->dev, "Could not create device 
link to %s\n",
                                  dev_name(component->dev));
-                       ret = -EINVAL;
-                       goto probe_end;
                 }
-
-               last_devlinked_component = component;
         }

         ret = snd_soc_card_late_probe(card);
@@ -2185,9 +2179,7 @@ static int snd_soc_bind_card(struct snd_soc_card 
*card)

  probe_end:
         if (ret < 0) {
-               if (last_devlinked_component)
-                       snd_soc_remove_device_links(card, 
last_devlinked_component);
-
+               snd_soc_remove_device_links(card);
                 soc_cleanup_card_resources(card);
         }

--
2.47.3
