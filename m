Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294A4137923
	for <linux-sound@vger.kernel.org>; Fri,  7 Aug 2026 08:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786092905; cv=fail; b=T5z1x3p4jqnlL7d7OBr/46l6e3w9seHfIOTVOWL57Zd5+10wGn/PMMnPhJs/H/kEgbhp6i+77jYSJpdysjLOtCxl9YFQsBJNvhbYROmMKbv4bKta7pKaqjPFs8kuaUkjKzzX8e6nyD6qi20GrvLqizBRlTfxZK4nYVKPn8wnnuo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786092905; c=relaxed/simple;
	bh=xscPNtPW7joZn6OUBEiluBsOUMYUlcTis/hMJI4JPAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WZaHEUmq2QOAAr0wKV7y9/nv4OCKP/aa5rD0rDJ+YIhPH1uh0N5GoXFQmBYNwgfaMP0bG9ktvLOwy+CJAnkK9TfKbr/Ic7EfZC8NIljd/F8hAoRM5TfUb5XE5GBx6ylnulyAZQlxqHCqcriRVrR2F9bw9jkMIBRIhhBUz9WCPfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=mfC65tRt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GqcU/ADs; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="mfC65tRt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GqcU/ADs"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6775XFmH3308977;
	Fri, 7 Aug 2026 03:54:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=E15pqkCnaXipFrA2H6
	ZDoA7Mebis8QdEU1YEE/GUJYI=; b=mfC65tRtl2IcmYOfeHvqAHs2DcVEBwn3Ju
	AVYjZxxMF131px8/P7cgZOaDq61M4yJJ8ByDQjn/l2lTy2ju+rdJC3JNN1ZoFiz+
	6yj8+7eQJorSUbVXMxdk7hYDsXiQXWiMCKSGjtUT/xGeICxroVviK1h2PQ8/H1m5
	DWHKnRPwEMY1i3+dQe3BkU2Ik2FzxvRrCi1QN9JgrDeJaAPWcBcEI61rBy34Bj6v
	G99avxue6WU/M2gaBpVWuGuIaqTxaOradbn+OsD6NAJYHdV4tbaEuYybatU9lZlj
	Q8KtQasEgtgTgGgPcXMjWlafIebssgYlRztZIZv+X4FKbB/hNPMw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020118.outbound.protection.outlook.com [40.93.198.118])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fvxu61a2t-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 03:54:39 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwzFxuexVi82UBfoc2ZT0Md0x9E/JhOWWeaECdEwdYdQ/x4p8FMmhWptQR0i+jPn3gqpzCkDNoBQXHTdYWb13awOf3qSU1HQjFLV2XoJNT+vTnGS8bGSAzGhseNSWr7LXhrld+Mq374R2rtNJeoPmRml2KEpakA/0ml1+y+ba4Mp8HvTtEANGa4VK7z3HEG2xRET0Yna28BFYa/tAChW0cruyhEjZzTr3OAIp94KN8/NKpOzuC+AgDieq+N4FfHB1Lfo1wO570t3VohVkgzEe2Iq70rpxZMrrmq0hImcN5nkQi5B7bjg1NJ4M/XAICx/jyRQMe7gIK1KQpIPEtS3pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E15pqkCnaXipFrA2H6ZDoA7Mebis8QdEU1YEE/GUJYI=;
 b=cI+FRzQMuXyiIxWiHf/XYlGH0aN+CNg9VPNHEQaPdZbvbZEv7bkwpQNptQjpZsY9ULdnnV1s/0DYuNqGbukOHhq0n5EDtOA6zDJiZ4eXGScA/sh5ntQxuFfot8itzowFaEtAHbM/wdFIeIXqScjRmT5uOXHT+TGb0BDnXDgNWQQvIlpKUfJZWbS5Fo9SEuqLyeENGL2QZHt7SQbKGhZXK/EKao0fKOGUUvUkwT99iGhMzuGiWv7EAgwq3emhpAfuYyG2zfI+JfK+hRQQXvmUekGYBGQjjlcv//4l7oGzVrFpnilxDw/SomOCoJJeZZFs8ROeyaZFPhQ/TlZNIPvfMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E15pqkCnaXipFrA2H6ZDoA7Mebis8QdEU1YEE/GUJYI=;
 b=GqcU/ADsqrqo8Hv7ZF8PWxLHm9G6YeoxdzFdRUgjpcsTkxogQ6tTM+ZZNwyMSeU7pccclXm5r4kh4ev/Vqb9dsl9PkfjxMINp32GG40Sp6J1K14gsAWODZXrzRbKV7xRNMA7Yh0clZ0Hu0P/NfC6XXX3XUGhYjZNjvk3ebLrpBU=
Received: from BL1PR13CA0417.namprd13.prod.outlook.com (2603:10b6:208:2c2::32)
 by CY8PR19MB7155.namprd19.prod.outlook.com (2603:10b6:930:51::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 08:54:36 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:208:2c2:cafe::85) by BL1PR13CA0417.outlook.office365.com
 (2603:10b6:208:2c2::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.8 via Frontend Transport; Fri, 7
 Aug 2026 08:54:35 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Fri, 7 Aug 2026 08:54:35 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 48CDD406544;
	Fri,  7 Aug 2026 08:54:34 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 3467E82025A;
	Fri,  7 Aug 2026 08:54:34 +0000 (UTC)
Date: Fri, 7 Aug 2026 09:54:33 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 22/44] ASoC: codecs: madera: use
 .auto_selectable_formats
Message-ID: <anWdST1pWPUPvEKe@opensource.cirrus.com>
References: <877bm2vjjn.wl-kuninori.morimoto.gx@renesas.com>
 <87bjbeu4uq.wl-kuninori.morimoto.gx@renesas.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87bjbeu4uq.wl-kuninori.morimoto.gx@renesas.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|CY8PR19MB7155:EE_
X-MS-Office365-Filtering-Correlation-Id: 56f07111-c858-4cdd-abd5-08def461816f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|61400799027|82310400026|16102099003|18002099003|22082099003|10067099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	UZY7gqSLqnzDm8ZXiieUoVUCpW2oP+BXi3hLYp/GJkys7IkG3UPeFMdU0p+nlxkWBXkW3/ubVvrNNyJldx5upPG4ZYT39+rGskq7CR9PHIK1jMcc8HjBI7U1zvbwyYZIjAdH43v2ORbVwwUfo9O8R9JxsuLT43q7NeHW6MO7vniEQKh8iIuRSyDu2MMBnqQ0CioWsPRFNeL+aKEdub80hkMcKRRricx3jtscliDq7P6qYZnH7zrBNIbwqOJMJ2YUbJEzB4FZ1Wj0x3OwfArxWAj6y7jet3H+/xzt9IEkGalHJQriqD3DuhTowgJinyt084Ph6VM1Chhu0VoUxwuGI/RlCT0Z06vKxbXhn1A9AtCrnEJSfj4GVsb8C9SaZ9dVkubDNQ2QBxUuEgPw2Jp2UJI2W2LYfOoXHDCea9UMw6yvlDwSzoZPFtkmjL2Ydigv97pduUUo5iV5Smai0z+/YNWUnMbbLZZ9VG4XfrVaeDFraB/NY78fLXNoTM/AV3vfoTZjXamWAHs+ueIJT+VM8vIdgJyC9oKWSuktuk3Ca1MGkbJQ4mKVbn75Z1o0rF9g5wEnY9cfFQIDjFPYjrA/ryvor7Laf8xHHhRO1CuKhCBGkIxFQI/LXe3ZOt9ad9B/v6BvVgUAa+WN2gRjPFmkwmY5zGoki99MqP3mSdxfv7H96VI7F1FVcqcewu4I5sRrKBpXNg7/lKlEgP+tade+Ug==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(61400799027)(82310400026)(16102099003)(18002099003)(22082099003)(10067099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fyd5U1w0PbxpYJL0UtEs541wHArZ6o7N7p68TdW0BWiNuPJPz9TrksYnSsfp+/f/nvFqs/mMBvLK8mMxW/JpTAaucywnTp7S6HqENHaA3T3CsR0ZatMArZxy8cmHjjkdcFr5RfW+GCIDxUVp0nv7rKrM+Arg8ATZZe/vqYbiEPXsoX/gKM4eR9809aKcuxQn+AutFmu2/MR9nXn0ZHGx4roSmB8uF+5vJ02m0tQn8yqB18266zxRcqxH8Wc9Uktt2Acuzsd1VrDKgVeiQeFvlrfd1joJZZFSERZuVbo5DG7wvfod4qVLC+dPjkQlrhkHQXpnu1wpOBgB9O4GVhVfV3BolK2gyovjRgkEE9xdk/Cm+xF/gb1Jc0YbCdgW6cV27qivVKx/XRGzh1wPcfijdpRIJFgGH/OAZiBjoEMxhyX5llz2BxUeEvsLWF9xYCVF
X-Exchange-RoutingPolicyChecked:
	BtlAa44zcwFY3qpF8mSyG0GEvy0QvZxLWs9hyZetNWduEUjbcEVHiGbAy6fBAJqzv8I3HMm7kl/Ovm7iRVABLqAjKyf+Rhr64BRHCnN7CrYOxd6r73TSyEiqQw2LSjnAWrqHiTcOZ/VS/zrp4nEtESGsS+uEiaLQhZ42s4E7jgNpF1QZ/6mB+I1UQmk7LFsV8L5sBNg0dlk6xT6h8HLDF2faaEoOVGNsWQFJN6iKfkCCax3jiOj+fLNBAvkiYolUAz2bFGtdfE6+HLMW+kipMXLOWFIdf/iVPrKeKd9l8NRCXW7wZQ0kjKbQTnoRbYUk+5TkzLkljnehDnrSAd449A==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 08:54:35.1713
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56f07111-c858-4cdd-abd5-08def461816f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7155
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2NiBTYWx0ZWRfXyVdenSHZCRlG
 /RmlOZQu6tsWWy+Yis8z4iHDSkMDEBUtEG2Vg8+MN3GDhqiGWp4hOqp6MkO4d1LtGUkgPRLRX/L
 CI4YpY5dx/LdWe2kN02xYYjeOb/9F5cZRxlF7vi9PnmxNDlIV2XGOWP7Rz7C2hK6+eniRGxn5wa
 m5IRTAuflZ7w/+PhMxJ+Ev31Fhy2t9t1Ap7st2eRtDYBLXr4R71R3De6VhQ/xAC4/mARCbm3qFB
 MSbWH6tYo9Vjo3Kq8QywsoNAGOuPvp+Ph5rUjA4MLCXQ3/2l7zmQRCEc4KHQGq+dURHsZM4Uh73
 kyO/aqoubMOPLCpO7sy72yjzItWo+sLFOOnDsZxknyjcNnsQatmj1d8h/HzVNqsM8ZBKtEM1Owp
 HBKG8Sh6h8O3HEIlEgNkDCSyvPj9S92u+3jc6BtxgA4+usZlGCYP4vdZ+wHbbqW4vxvBtctDGzR
 xtvcEKLciI8tFVA6M1g==
X-Proofpoint-GUID: LdzQdFsbnJN1SNz9NH6iJJzuLrYSJxfZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2NiBTYWx0ZWRfX2EJeZuV+84OO
 etIraSOfCvwM5RPyVn69jIwVwOboU+MFNczNau9L3x58l0AM9nCa2+eeJry6qdPVlFgL+aenRsH
 B1UucUE4mHuTmuykZkAyrXM8qA9ClqA=
X-Authority-Analysis: v=2.4 cv=V/5NF+ni c=1 sm=1 tr=0 ts=6a759d4f cx=c_pps
 a=LryC7IEqKcSdoWktnkYnkA==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=yC-0_ovQAAAA:8 a=w1d2syhTAAAA:8 a=fCYEM5yUJuOXIdsSaJ8A:9 a=CjuIK1q_8ugA:10
 a=Ha9PRq4w45QA:10
X-Proofpoint-ORIG-GUID: LdzQdFsbnJN1SNz9NH6iJJzuLrYSJxfZ
X-Proofpoint-Spam-Reason: safe

On Fri, Aug 07, 2026 at 12:55:09AM +0000, Kuninori Morimoto wrote:
> We can use .auto_selectable_formats. Let's adds it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
