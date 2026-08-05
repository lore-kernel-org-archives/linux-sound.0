Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011021.outbound.protection.outlook.com [40.107.74.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3361F1932
	for <linux-sound@vger.kernel.org>; Wed,  5 Aug 2026 00:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785890184; cv=fail; b=Yqj7q/XHUVj3jY/Y7l0SCZM2Nfqe4pixafyZPUuvzBraNJzYp/FrkcbB3/d9sDHXyICkNkGi7s6q/nUctO1olGB8uI8nVYXItLPhfhYx+A8fLwDcTH5Jb6DWv/OCMdqy0JZPuG68yqn0r5K+NFWyDa6HAKpJnAB8Hj55aqA+rGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785890184; c=relaxed/simple;
	bh=ivBcmXkQHOqhHVlvmUIOdCoMsjSF8wmveGb7oIhMZTM=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=PavViu/zUpQnR6fpIBdOttVaKk7UdWfJud31ToJIxURY5ZXfSO4kgGYKDjaQ1iG6SqzWE/r9DuPaWIEoV3uD32x8Um9ABP3eDdfIxgJnPKOqlfNN8oj95apC+OaoF0PKqLMdNB1nuEQ52zHp6cVReqkYgPVsQCXIFmbU9xjQ/08=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=DAx8bBw0; arc=fail smtp.client-ip=40.107.74.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="DAx8bBw0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3kceifco0qTktgEXRoB79l1/JkfOn2fpKuKbNOWdpTKbbnt9SVqZuX9y4qy4cBXAHHm1uNGfJQCHER3URFmtRBNqT7jhbM6/h2SEWZuRo9zo6ZOoRzswPJx1hw7aQb+/Px1acok6df0wbO2WjtrdZ6/XAD0GdQmnVPLBkUVNFqDgO/9cqSmW7myKMK02ohuy7pjLmoezDIfiCdydAkuK/HWk5Jf5W1yoSin2KfDMudRuhH2NiYNkp0GBHdcGvEUCYVasGZJnsuQGwlMfySdFYZDjblnN6R3zhoCCRpZ5CThXf+Fe5dHqlWTnlJPS9Jg7WOGHC/GbOAjDelugYNhaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usd0Uhn0sxZzAiK+19BG0ODslqnlZD/ChNhinpZICl0=;
 b=hzsJt7+r0i7s9YYM9Q5p+jQjcki1e7XxHeH/No34fODKCwwY0Vofassskk1wYfvyCL666RgUAC6xkrVsHr82+Uy+VJ/uPbEHFEr2dAgV+YkGi7axZa4jzKr14+jgiGO9aYjJipeHVMzWsw97ChCV7G9vD3/sVznSQJs3wCY8k2Ggr9j+M/9OcV81kUw9t6Dl/TPbJm+LIFEH6DOhQB5G3Niklg+mjF/zxlvGp9gWFLB0IWWE44rgNM3YfcneIMfMo73+rWXZWwoQJGXVcy4gUbDLL/Qr8u55ZGQ638dYu0M+PJDFVdoe3X5qgsKNQyvff0wD/kBImgwo26cHdP76VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usd0Uhn0sxZzAiK+19BG0ODslqnlZD/ChNhinpZICl0=;
 b=DAx8bBw0dYj46HZG9IOkdKBVezZMnUg10eyOlVoX4pRmn80Q9eMz9BgWBWFQ3RqAuLXmhjugq4q0QWVUrpZal6ilOy/L5pPXkuuAB2AmWXJ96fItE+X6NZBQw1dqrHrN1fZe/MhT+A+La1xOEpb9umU9DEMCP+2kzo4DwKWscHE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYWPR01MB9542.jpnprd01.prod.outlook.com (2603:1096:400:1a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Wed, 5 Aug
 2026 00:36:19 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%4]) with mapi id 15.21.0292.015; Wed, 5 Aug 2026
 00:36:19 +0000
Message-ID: <87fr0tv1x9.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/4] ASoC: renesas: enable COMPILE_TEST for PCM SH7760
In-Reply-To: <87h5l9v36n.wl-kuninori.morimoto.gx@renesas.com>
References: <87zez4rmrq.wl-kuninori.morimoto.gx@renesas.com>
	<87wlu8rmr3.wl-kuninori.morimoto.gx@renesas.com>
	<c474b067-e549-4d51-be21-4337cb8de184@sirena.org.uk>
	<87jyq6vgyd.wl-kuninori.morimoto.gx@renesas.com>
	<CAMuHMdWxRASq-jwryP4prDMAQuYEBSYpPNY2iw8GbQUKh-P2ww@mail.gmail.com>
	<87h5l9v36n.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 5 Aug 2026 00:36:18 +0000
X-ClientProxiedBy: TYCP301CA0077.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7b::19) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYWPR01MB9542:EE_
X-MS-Office365-Filtering-Correlation-Id: b165d768-ea4a-4950-cacc-08def28990c7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|52116014|366016|1800799024|38350700014|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BphAkA4FsTNKyIR/PIRyLv3pg437GGofkcVp1wrarO0p1p77FqqKXcU/TwRxjPHB5bK/U0sVnisIiQVNUvRyIbLmW/Xem4LwfxjpnkeeiITRpble2QSS6SOaeBG+CINVcSAfPxJOGhwtOAIQCQVwE7s8bIY+KZ07WY9yeD5v0thbiVgm7p//IX2LyEtzwjU0KBqtxutz9UlpKNJxBP85yOj+wjBkqzSgcZYGAxEpkWohtJhlRvXXWRZi3ucjx2jdKUPg7/6/P5HDW9EdsmnJZkPFSvTVEML9VqpTf1G5ribCQUC62v5BHRxaIhfPrm1yDxOe5WEQfaAu4obBe5qpLgvGS8Wt0RuzEKdFSEM0ZuXipUYq00KdmdYIdxifT9t3hdNhhcAMT1uHz2TgtTfvu+4z5l1gK2RAnqfKNRnRgmHWUXs3xGGKInmAeVAGIQXQ05Jkt+AHvnonuPVVhhA4q7xcC3q2tUtESVcH8nG0oS1SMNsQvZIAkrqla6PSBkOGstb1v9ZWYK3CKHufVmtHfNJYfMtRuov4lYwCRNSYOMlGunD2Ec8vwXggLR79JTG3xKXWEwvKEQCUgotmmvhEJK/S8pcP1hPz/Ro7WUEeKhezOg4f5A+DHMCsYtPF125siWKfQqyd7FY8/0R8IGnkG0whPZGYXSa8mYQ1PRK50K+rNvBmYldyNSH2WcxOpMEXbEG9v0VFdy9DKuFJ4wOcK+Ki4gynbRsnYuGQ2WOCkAQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Zxwq77NfUzKyhrvdZXtvcw+PRvo6u+cY/28wBeyqHEhh2cXt/d7lIl9Uz4tz?=
 =?us-ascii?Q?dND+Ofh+YDiOMMiXjFSEOhMJ+W1HqNno6ISADlzLN2ZiV8xAtTAJfoPVjDKt?=
 =?us-ascii?Q?IMOIyH/2kiKA5lobguxEIsHKtFgmA0irdKacDvgnOLBpO08a9GOYfHmILm/b?=
 =?us-ascii?Q?MB5H9GD8SUA/Q2kHPA+frJ+2YJUOmM3qT32vuJ9LOXLFpwlEZ/thAubJI798?=
 =?us-ascii?Q?EMsavpEoXa1FBGzZVVR/t5/Muv8ybcICfdtZq+BCS3HuYhsf/e3U6nBs9+NX?=
 =?us-ascii?Q?yolnzFp3k5AxcS/W5h+hws78W5vZEold3LqFJEpB0yuUFDoq0CqjqgbQq8sH?=
 =?us-ascii?Q?4AfWjgLeicpWaP0i/FbwYL3IaYxZqiU1A4GbH+gPDthn6mfxEPBhrYhIzQg/?=
 =?us-ascii?Q?bXUqbMVq+5RQiVnizgq0OWfDLfMorgCYShe4S2LxBEEgDEUkgp3OPf4I2wpR?=
 =?us-ascii?Q?595AWes6XNiOoujcd7GBUD9IFfOOxT+5yPF8mJkZlcQz/cWnlqBdM7qmDEi8?=
 =?us-ascii?Q?uJnBvy/GU4Wtf8odfXTw0szzevC6dHhMNVUJ+Aw+0UHskoty3FJu8hqMFTe+?=
 =?us-ascii?Q?p54npbEsWH2L61OcDTTts60Y5aK0muqM5Wsk8fa+vbZeHGh+nEHD9Hm02PZF?=
 =?us-ascii?Q?yQYjT6kGdKczu9IorGjLnOOkPuWUo9dkP5MMQcf80IwBxHxcOwRBzVZE/w6k?=
 =?us-ascii?Q?vXqWom75MU2KXMnk6Wbdp9lepVnJbdc4Ph3XBvx3xNOssA1JnQwwqO+2U0Ur?=
 =?us-ascii?Q?0/yc+A0b2+UCSNCUVyrarmQ3GIApt6fpzitliRj0JfqLt8E6I0X90HVQGxUs?=
 =?us-ascii?Q?sjEyDHwghjjfthYb7HKgAWc2CU7EvOkCeUNGLL5BybyDwe3EPxyN015fjP0r?=
 =?us-ascii?Q?PaYXearO7rjAETj6ckuaErkJcauNm5tdX+GzAX2sK09mk/aolQRTr9jB1JOI?=
 =?us-ascii?Q?iUeGQ5mZCoQlj4qyn4jWXPMDsXBFiTeiYquc/yh80l/1bUfCOZCGMA3QRYSY?=
 =?us-ascii?Q?TIQwHyt2xCc50mM4ho5PM582E5c/HXAWoFk56Y6jcPX2wNXXY7TaKY7U491+?=
 =?us-ascii?Q?ldsKwL2rx61LepUgY6rOZNa+UlZD4Aki85Dlmn1DBY54S/aUrtYS+oJISASd?=
 =?us-ascii?Q?ZhW0BtrGBGtoUtl2C6zY3JeXiQXAaTcAyBzs/j2F2T/yu1Gek44MIhO04h1a?=
 =?us-ascii?Q?Lp1hLbLeVdWW1txRBDMkFYPFgS8bOF8DJ+NqfHCcBAtSIwbLdaN+MG3R55iB?=
 =?us-ascii?Q?rThmflejn3RzD8NYadWsOFmiz5pDBYMkI0TWUAKQ9+hmgRY8IdeUykNdrlIb?=
 =?us-ascii?Q?0hHz7NL8NOg3WaTFw5RKmbqnYDBThPCqE14vx0XXVgXqpZBM+1sTqp7yUAJo?=
 =?us-ascii?Q?ZSJ/AhFsxPK94fpe29q7vNxKtwfDAY5A0qLYjh2tdKyBKVCJafI3JdOey2Or?=
 =?us-ascii?Q?85HVLpawOBwnInD1WRyMkMqfq6y5kskebqbnYfSvLvqX2dLbn5owqIARxpJc?=
 =?us-ascii?Q?yw1BH+E06PWRM9fwmleF8Sc42HboaIidF1aNzkd8ob0IvWNpfos2rJV+NvZN?=
 =?us-ascii?Q?HRE2IlT3M0oRAHL/1JzjO09Wl4SZ4SKuv6Y7YN00dTJLuk74MPz+eJOIFBvL?=
 =?us-ascii?Q?fMNLKSmUD+J8XQadsiuE0XxG8ud9LpbBlQH/g/M2zhrCuzNdt960jLHwaYRS?=
 =?us-ascii?Q?lDtCmXPLoKLS6QRY6etF2n+4+hClTX3Gaf+pMmsM4RIyS6OVcF6f0gtev/XH?=
 =?us-ascii?Q?BPvZrHKNfUP0uwfFdbaPxGJn+smkrWs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b165d768-ea4a-4950-cacc-08def28990c7
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 00:36:18.9166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZOR60lV0wmjMI6LYQE3QJieTPOsgaoyh/OlZGJZlBUngKbiyVgX1Yw6F+nos8Xluxw+RIr65DAOaVfQG7vJZv7Z7XTDnhBSyVtdgmNBzT+3VeLqPhJXu+hwiwxVMvmSl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9542


Hi Geert, Mark

> > 1. "depends on SH_DMABRG" should be fine, as SH_DMABRG is a
> >     user-visible symbol,
> > 2. SH_DMABRG depends on CPU_SUBTYPE_SH7760, so you cannot just select
> >     it without enabling compile-testing for SH_DMABRG first.
> 
> Do we need to use "depends" for it ?
> 
> SH_DMABRG is indeed defined as user-visible, but is needed only for Sound
> (and/or USB ?). It is specific/necessary feature, not generic feature.
> 
> In this case, it should be selected automatically if Sound (and/or USB) was
> selected, IMO. In such case, we can compile with COMPILE_TEST ?

Self-correction
we can't use "select" for SH_DMABRG...

Hmm.. we can't use COMPILE_TEST for this, and no defconfig is selecting this.
I guess no one is using it. Can we remove them, like ssi.c (= [4/4]) ?
This kind of driver that leaks from compile test and/or it is thought as
no one is using is very difficult to keep compatible...
Whenever we can get-back it because we are using git.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
