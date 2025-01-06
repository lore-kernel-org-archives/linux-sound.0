Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010032.outbound.protection.outlook.com [52.101.229.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E6A29A0;
	Mon,  6 Jan 2025 06:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736143936; cv=fail; b=KtwC1d9eW4LbBxr75lbUjLeDEKYyJK8bulZhQPjAUfQpbeCPOrrPKUtYA5D6jlD6rTu74s7ZlsxuR6ee/WvUQmyvEp7U6fOku9FPwweMFdbM1BNFaQei684rf9axNKUXoCOSJsJ/mrYbT7e5DSA3BB5PMhA9i8oXguJYO7pNyXc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736143936; c=relaxed/simple;
	bh=jYQg3qU26V8lPMDuLUlBYeb/xn0o2UFOIZjEd3jDkls=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ReZ37Qf4A/NYInc+DAVsLiPQ1Lr2woFVZ2JH89Y2fHNCJijgWsM7GL3x1ShTPgeWkvxzRruZcHjTfK/N5pia6Fh5QpwXxWWuhDVTm47/n4jL33qUpe5tQOHMrgVq2QjkGpmkDtFXJykgSV7Qiao+Jau+gfRlQXjhxBVtvJ/KapA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hX9nHCkB; arc=fail smtp.client-ip=52.101.229.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hX9nHCkB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=POire53/PVz0ODCUCZzoJb+oFUd7pvVy1HWf4brynH7fL3xB9ShO73GGtEOM0fZjt+3xX1TbZvjq7EPq5WtrsVyIyJ3y3isP2jt5CrfkFHZ3a3/wV+eO4qnvY8QExv/s/Y4hMOhdZ77mOZlnE96nFuFWQOIuo6fgNpjpivNcEknsccavn+n/69arFoTaneBOS8LNZwpXvCSNMjsTIdTo9Ry3KfDCmUNO23u60E4kitnsBnSUxoMQ5qCgo2RiV62Ub2aM77vQOsMyjdwP0asIv4OzATqyVF4oG4UI19+8lVazPNLQLGF0xMfzeEp5x/8HywBbdXg/TPQgeGJke/k9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OEUS4nyEa/QPjrB8iqPVS4ZHVu7X2SNa0qSajZ7eaW0=;
 b=PBaqQUynh2xFBAP+ZfrnIRIKLx1vFj0nou0VYD1hKNZH/mAZWJ3hCGMDr+TLj4yQtuZUKZKws1USRDp0EX+z1y2EM2fgheY7goXDhEjok+MXg9mTLvDKJPmEGnU3vRlsCkcSdaN5DK2ed6SrM15bWm4YLgVIPjuBDdSD2kHG5dyGRleVBpOM2aW/3RVLH9ye0PImceG5xRuW1jOxGQhCzBT5Kpb25RWW9CDCFqNc4PD3EUkiRBPE2pNGFh7qSpD751WbH75iGGWGidLEiFVEBCrF3jQW0fLRmmHHnlFTEt5sRlRAojXFJhJRXlldrcprbBrlMVzrl3OEBndvYpLCaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OEUS4nyEa/QPjrB8iqPVS4ZHVu7X2SNa0qSajZ7eaW0=;
 b=hX9nHCkBbLytyPOZBUPSePlbmt9Sb4gRfcKxa6GrOK20N7BE7tVLJ0qXAsX6BEwEtcGrNUHJqjMOcsauISbuRMsP535aGkPe8e0xSHJNseI3IJkowa1riV288mQ37zf/eSqunR2HfKd/beLzlCIYfD6i1qs2/UupE6BhyHVrn18=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11874.jpnprd01.prod.outlook.com
 (2603:1096:400:406::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 06:12:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 06:12:11 +0000
Message-ID: <87ldvoo4hw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Stephen Gordon <gordoste@iinet.net.au>
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Minor debugging improvements
In-Reply-To: <20250106050659.57924-1-gordoste@iinet.net.au>
References: <20250106050659.57924-1-gordoste@iinet.net.au>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 6 Jan 2025 06:12:11 +0000
X-ClientProxiedBy: TYCPR01CA0009.jpnprd01.prod.outlook.com (2603:1096:405::21)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11874:EE_
X-MS-Office365-Filtering-Correlation-Id: c64031af-319e-4891-b50b-08dd2e190ef8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0vZFvwAoBV/mt2pmJeX91rpmd91RrHlv49/LHiVn4nK88Qo4NspXrNqdWz3U?=
 =?us-ascii?Q?sQJ2h2SGnp907+gWNXZQrdsYNztbHKufsNp6bFOgiAmTWDgpM1kI8HN05Yw0?=
 =?us-ascii?Q?2ZxaxdETB8qZ5Ykztsa/UrUAMzzU8ngyR4HivIYXj6/ch127vt+AXiRYXmsk?=
 =?us-ascii?Q?OL4l4CkElt9rSDi30GxlXqtq1knUr55v+oq7w/AdBDaNhcb37w3QI6brlRwq?=
 =?us-ascii?Q?EUktQN0Y95KbgYDnndIBJQius2tzVLkCns9gVNFcxaD8TVZPW2HQvl13RgAA?=
 =?us-ascii?Q?XLVzv/5Wf7pWmR16TiIFlZAbFK4x/NwBjdqNwq90eaJ4KSfecFFs90IZzKti?=
 =?us-ascii?Q?HZPIhzFZiHYG2uEA/hZwMVZwDpJ2By6VKKShUILcxnd73hziZY0PK192qoF+?=
 =?us-ascii?Q?qMr0WdoNECNKvOHwyerbL7TDpREPDpzctT7adr1j16PiUu4AilPSAhNK0Ymb?=
 =?us-ascii?Q?nMIbF4AeOy+o42cicy9HusKzkatb3IVGQEW2umdTFRWsK+YPQ9AG29QCbeXM?=
 =?us-ascii?Q?WVVbK3UoaTOMKVJoqnRzTkir3XpTY4oBzcDbM4TIxICJz8WFVzfTzIOg8Xec?=
 =?us-ascii?Q?gMaIQ5ePulcOCXG9NSIFQzY0PAJjkcxAvG3kF/VNRVFj4iwHfmX9QKtq0lME?=
 =?us-ascii?Q?15Ls6JRqNWuEHLLOXc6z/eZLSAES9CPUZ7g+POXzysxKzdzzB9ftRZebZeJy?=
 =?us-ascii?Q?9NPmUF2vbYE+Sgz9blAWP6z5vgWe96cJhXcEbzALASJ2zxgesRk3OEZg7wON?=
 =?us-ascii?Q?Ubs+ReSscUdSXlus01If7Xe+2HGz/cGqHsrGBBd72FsTtd0r65q8Gm+5jVh8?=
 =?us-ascii?Q?bYq51oXVBndoJkw4M2/WFUrrqn9aE/aNX8MlYjTRZAW7oMDYj+vnmgk9lg/Y?=
 =?us-ascii?Q?NbdiOq5r3uHKx2XdmxmhwjM32nDlfG2ydueo2cKFFUE6iy2/if7Xc6GsVxal?=
 =?us-ascii?Q?rkqAq8m9fdkjY0b7NKjwMAl6dQa0gSYp9nBNAXG46MHWcR0bXbiCDGny1DzD?=
 =?us-ascii?Q?ZUcCXqs4F2pZvM5RiVDy5IeN80Phkl3Jt9fgNh9ujqkBmm0AC/woiqPNyEgs?=
 =?us-ascii?Q?oqQupFT/N5iNvkxkdnn6mTblYPczMXvJT8XyKyss/TCcv1/gj5YS0XQxwwxF?=
 =?us-ascii?Q?0gDYg/bt1C6/sHnnUNlHNn7pEUVbqvOBMB0DjC0QzSt69Ly1xsn98FuXl7x9?=
 =?us-ascii?Q?JZM2iN+lHkyPzdiLVUswyXUBRhpACJZBSO0CBNeAsKjNTeY/Bu04WbQJY+4W?=
 =?us-ascii?Q?yBcuO5nd45CddUmaqKPM1j09QYZ6b2LeIsIK1YIo72qRdyQkpg2EO/mcmckc?=
 =?us-ascii?Q?rL/Dj6+/UyBSZKVH93dp3wMiqP3nL4lXXRE1N+S6pSdeDx+Ku5e2G1QRi1G8?=
 =?us-ascii?Q?0mnOphsrDlgXklQYhDtmFLuxYbPEV7RJc0H1leKyy0/8siU9YhgZQ2E8jZ1D?=
 =?us-ascii?Q?Tr88uAhtJjtUFwbwPobfyFJSZAAC+ej7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?P5ZkZpzWBztkrO4L0Cdo905xHGGt5x8ysjg5KQGoDVAFP8l+fHAoQ1hIGadk?=
 =?us-ascii?Q?3721XEsvpV+U+vMomJqKZ1fWY7o9lGMCq80jibEmJ3Yl5cUCQArXov/BBkic?=
 =?us-ascii?Q?kvU/sD81s4HIIQ0UMW6R9JXaiLnvCkaLwMcviY4S1NIb8CBMDniJMxCumUES?=
 =?us-ascii?Q?BvCKhaWielj5RpV3uMuyFgNQVLRFI462bfHp2+zfrsJsvVTYJo2L7N0RGYVZ?=
 =?us-ascii?Q?yha6PGoRz/EaKy+kpEpFGFb/V4WX8/Uzez84TcY7UpWuLIek25KS6aF1b+OJ?=
 =?us-ascii?Q?G7T71D6/cIRtzyOcaEzJ0ly4bxq1RlskCaeDyoMi96PUWFHa3ox8+dBO0yjL?=
 =?us-ascii?Q?LPwJ+KBPEucgDNRjAw12BJ7aRyLHw0mfD4xor4fRrZkSPE9kSP5zpoamrgvW?=
 =?us-ascii?Q?iC5SlrOSFLH4I89F85CfLCQlP6ZoOsN8nVUo1EgoBWvY3oTQTvR6JZN6jiZV?=
 =?us-ascii?Q?f9RvyrL5MkCGHuVXt/i2EQmmIyEB9Di3g+ukWP+/cONDLndYyVDNown5UWa8?=
 =?us-ascii?Q?3W+OHd3dHf4yWjJdkxM3Q3pcZv2Op5LyZbgINmUndvGna6E0bqxPfixOI6xP?=
 =?us-ascii?Q?A/SMmuv6Bh7K8zbRMqVosPaIov894yM+oNvd2R02E+whPvxCjsndG9i8e7M4?=
 =?us-ascii?Q?MWD/45DwVifrRZ39uk8TwcQ2j5cPUOY8DE0TOmfTCkH5o9gM2k0gC8zlSuUc?=
 =?us-ascii?Q?EXuF40ZOVaXOYrgiD5s4Yy/Abniao9WECYOKBbXC342L7nB+S4IIKSZJCizY?=
 =?us-ascii?Q?XZtDCh11Z7O5CH5U8qvMeRz2nCZNiIatN20cbJaOe5x4CcHl9a20iXMuOLgq?=
 =?us-ascii?Q?Z4i4wmsRLwg/qR2HHAcCr6pITnwOnV+2HdfYJFDoJRr/qoUBPTZaA6QYJ9y0?=
 =?us-ascii?Q?bGjgo7niI7JW9nYspZremTfZeihiseGXDvNMv26tVrWAdPpo0QNxEt712Xhv?=
 =?us-ascii?Q?UDg9qI7fM9jh9WascZWlsP9nnDcSRkWnvco7p9hrbzCmPQbBt4pjPil+T3YF?=
 =?us-ascii?Q?5FVp6z3pwc8nwwKd+zySNpvLabjyzHU/4KUiTXExyPzhPcTmDIdiNTNU0KZJ?=
 =?us-ascii?Q?a02k7Gdk1Y0xmfL1/RxTGSTrHXwg0wbDdUJRMegvko7uLYzYzC+OzDH+rkBT?=
 =?us-ascii?Q?F2RiKEt5xMFzQVaqssJ2f5UHWwRh8HbdMr8N7MyX5vAzokiNhmAHkjPrk2KJ?=
 =?us-ascii?Q?wTemfGjlQL5qncPOAZkV39iLBu+7rfz6d5mmZzpynK+LJnWO9JtF00uxUacD?=
 =?us-ascii?Q?q3bE04BQu2bQqR/NiOfMkm5hf9BSCkFEjo2r4kViYi57smPMg8eTyiyUfoKv?=
 =?us-ascii?Q?wwSO4LYjSYUx9jmOqWzyTtPqNoCbMH99tPY9ybPuqkmU24IFSzdWvstufiv4?=
 =?us-ascii?Q?5az0wxmLuXroC8vpvKAiPRDMjH8jCjLOL0LMtdE48B+Dh50r+tkPvak8Rwhb?=
 =?us-ascii?Q?nlk594u9gzmdcBPp6KywnyUw/31Y7WWxaDIXtbPoByP2pnPRvF3JWqzGKWPB?=
 =?us-ascii?Q?u5ODsdsHnaiFxCE6s0xUEi2zsS927nTTS8Rgrqdi0TcMjswkv4Vxv0PdIBtr?=
 =?us-ascii?Q?QQsbjQhqPbJlCcgRrUMOkisyJUdk/KmQsp4BUolJE0hJ+1agEoBwUEpIjiDU?=
 =?us-ascii?Q?oMUNusTkSesJWE35A7hPGHg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64031af-319e-4891-b50b-08dd2e190ef8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 06:12:11.8004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uEzBRe4xVDB5xw5GmOgI7Vb2b3ujA92NtUH3ccBXaYiUfZvNdyHk96pMQpp0ylzi6TlzKnopMwdXAit3hkEGXT/wpzhEkeEWuri6ZHpYy9xXzIJcw2b2YRs22h8WgYui
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11874


Hi

> Some minor tweaks to debugging for dai_links.
> 
> Changes in v2:
> - All: s/asoc/ASoC in subject.
> - Patch 2/2: Update wording as suggested in review.
> 
> Stephen Gordon (2):
>   ASoC: simple_card: Improve debugging messages
>   ASoC: simple_card: Show if link is unidirectional

For all patches

Acked-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


Thank you for your help !!

Best regards
---
Kuninori Morimoto
