Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010017.outbound.protection.outlook.com [52.101.229.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5A4156861
	for <linux-sound@vger.kernel.org>; Wed, 19 Feb 2025 02:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739931493; cv=fail; b=Y8mgMt5TFEaMsqpUMHMc0DtSilUu7taNu8gb+UPsnYFcI5BIfwjG6q62E8yBeaRkLD5xWUuj2BJEVmPeSOrHP6cHgttxoM6DHHyZ74t+00oLzjeg/Hiuv7aepk5j0NeAfx892GPIFUCmaRoK8GzKz+C9IifTtJrRXN3CBeiiZVQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739931493; c=relaxed/simple;
	bh=PuQLiWYV+kIzUAa0u7WWvNBodwcYovEOEjz+wmBRUOk=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=i30JgHYwh63IOo8Q4QAql9/mQZr2UZY0+SkfGUgBOLk/FN1L32O48J6g4tu1JQDfZ+hd4jeIhh/DSUTndQUKWLbCa/JaoebSx9mmTyjB9QKJtSTfZpx3IWKSOhw600RvNRyv1V7H9wkQbMd1S+y8sBALgysNsYnDPb/hVEy7hVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=Vj9PFEMv; arc=fail smtp.client-ip=52.101.229.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="Vj9PFEMv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VvDdg+IqHHnRfEUB9znSwlVcOGt9WMom0mZvgT0OCD000jWhr+xtSmIiw/Lg0pY7+x5AgR+U1/Nzenm6NylcsDk3gdIQXVnqY2xFjACB965Oh8elGne402xW7et8kRgGTiQ3s+qjwdA0CijNoV82H/Ch9Lz1pAmCvZRxgkNE2s3gube0obzje+kKiSAfqRPjunvelkNwVCBVd4b9pEr6DXqFpCEYcPp126RV5KOrpkaP1wDkw6r2DuOplepZHdDmvZxzy1bj5pzzkLRyhHT+YdnQwuJ2uqQdAO27xiJ1QcIyTZg1kH+SUhu3viMulFlrG+tF/YqkhLZKkK3tALN4wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gqIyRYxbJH8/W2bky3zVWIb4CWu2EsnPfCFegV5dWCE=;
 b=xJ/+vE2okW5VCPqbqotxe8eVNP5rNsixx4gtskmT6n/9ut2f05xz7GN9+TBrab1jmqSjdfpZmn3W7baXDWax8u11ZshK4rRxDLyBlP+EkfgYkeHumU9x9Y5g/5srEiqQnPVq+HgLLkTco6cDj/GY6aMpp/6Zu+MK24kdcFUQ5Z1xqdLsDTwk1KknclTFWAnnTbhV70ymoQGtHnUs7RQ0nWdgTls9gVxfKDM02lSKm2iowrmdKKOGISPgzJymp9Qk9wbPBD+92bbAIfiHOYIGrfoqb+LG0m7tjsX3Pn5Wo7O6rWUqOaaAAI80wEICYGMadEy5/UBXTrPxVhfPeW5bnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gqIyRYxbJH8/W2bky3zVWIb4CWu2EsnPfCFegV5dWCE=;
 b=Vj9PFEMvfPFNP8lBob/ZudBybQawNtDnY4yHGHUU0xYzOJBB3AzCvnqV1XZhxnqwYBTD9zil9IffTSas5dxiqTrwCg0PpakradmtIpbZrAYDJSzRuHQ/OGv3SK8cYjL/nI4nJMqj1SCM5/1weOuS8jgGJNqtKZuzQX7XV5vgUNk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB6150.jpnprd01.prod.outlook.com
 (2603:1096:604:d4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 02:18:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8466.013; Wed, 19 Feb 2025
 02:18:07 +0000
Message-ID: <87bjuyvfs0.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [RFC] ASoC: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
In-Reply-To: <Z7U6vQBe-BQcmrDX@finisterre.sirena.org.uk>
References: <87jz9mviis.wl-kuninori.morimoto.gx@renesas.com>
	<Z7U6vQBe-BQcmrDX@finisterre.sirena.org.uk>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 19 Feb 2025 02:18:07 +0000
X-ClientProxiedBy: TYCP286CA0212.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB6150:EE_
X-MS-Office365-Filtering-Correlation-Id: e434147c-4155-4a53-dd87-08dd508ba620
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZtT+YYC6GquAifVIlxVHIjjlsWFb/KsxYxP7sFIPxjzOTDS1KQybszwxpk4S?=
 =?us-ascii?Q?r/Gm8UWlFL8pFqkJ5+lRC8cPvungLCEDCPMwmpp41WtGa68g5br08vSaAo4I?=
 =?us-ascii?Q?yXZEZfrdQZeJ664EiasuAKH9F73un7n1hU3KsdD6uxqNa7/IwE35UhbVLq2v?=
 =?us-ascii?Q?GGISHtWUPZ9j+Y1YP+Gg3Y1AJYLa+F6eyS5IQiq7+rgck0+rtETI9ion4G2u?=
 =?us-ascii?Q?r98vCkuKEkl/+pmJLQsVXkfqicA4lA210c2DsfRfxEUMDZkwSig1CiXC3Hr/?=
 =?us-ascii?Q?Bpd9ST4nb1E+2WisArRS/npJk/b0Vej9+g1qbjYai56m9MLR+4AMzx71W+ok?=
 =?us-ascii?Q?2QvzO2L1BNKMmvqjJZyy4u2rp16jXMfY1hZvsqmgY9PhpKcRPQVvIA3kEhQH?=
 =?us-ascii?Q?WqptM5kNJYDFiLdfDM1v7B66QCaZWfiTjA/zivUuW1wJVz2lCbpaGToRH9WC?=
 =?us-ascii?Q?Kf+VvYvE+7d+xhsVrwR1N/NE4wEqvgqmWGuttjsfo5LbUnO4P8WDsCZuZzSR?=
 =?us-ascii?Q?y9Fn0G86W1yMp/1pZ53d0JryJIWGOHUsjhYG4hWqvXXhgd28wRKTwTZCyfA2?=
 =?us-ascii?Q?4ti0v2qoVqsJhWFZZWUsi3DiOsdkwdYY+gi/U1rJiQeZ1bJ2cCIS2h8AxjYJ?=
 =?us-ascii?Q?0NQ3s6sXAy126d4eQjRNr/Rvx67oi20KpseFyHsf0JA/IBAvJ2OazVH9oWJ2?=
 =?us-ascii?Q?PsS9gzCsVUj+YCgpRIwHDSiA8gZjGPadU3yoKKSQflBMxKKPll2kCaZCIMFH?=
 =?us-ascii?Q?ojeLGDxZnEECpttiZf+aXY3hzEtk2sZmTgn8y30/MpnQiYlebrosiXEKxbYX?=
 =?us-ascii?Q?Fjc14kA7DEWa37SFtzLgJMf24hHxt5m9yjj3kH4GjKy5d0zphvClJ41iAktq?=
 =?us-ascii?Q?Hc1Jgf2pI1uI3PO3ozNNGOJHah7iCgcqNpwS6QNrLfaWsrDfFZpCPAx63bO4?=
 =?us-ascii?Q?BuGEfrBJzGFXYJd665fGQcbtPUR87Ll52PaA5dCnv7jfEDutJfWmr32TnXE1?=
 =?us-ascii?Q?DMJ/Ib59XWB16zmhEicTcV+am+L+uj+VDK2WMccc58UiWmu+8UdqnW6sx8+q?=
 =?us-ascii?Q?oQNddjlmtS/DGHrwr/u2JtabkpFydIMkFG5k400SNc/OHAUlxF8IaWH6jcWo?=
 =?us-ascii?Q?sMh7PUCrWt0gsId6GzIptw61fJBIEoHWtONqy9Z9vUK4fV6CiJ9smRADX89x?=
 =?us-ascii?Q?mKesgBS0cvYPb/aucokH2W7e8eymxFgHiC8hkRtmToU42ceQCS/VxVYSWLCs?=
 =?us-ascii?Q?qNOsFJEMFbeoscKVI2EgnrtmfHkcvkPXRE8bGCHUlbQWO0mN0p/hn3UT9p8c?=
 =?us-ascii?Q?q+il6SmN0rCK3zDtY+0VoOjJJGZUqr6y9anUMYF6C6wTd9DF4li7xG0m3N6Y?=
 =?us-ascii?Q?DYrH20uH3eiCR9fSy6wGSwci/6/A2+UNYtchh8iV28nSjdTVcDrzUnXkTMb0?=
 =?us-ascii?Q?8/2HDrPX4s1q7NvYVxHUnIt8iIFDltak?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1FkT404zGrXVoVi4tjYCMpu1n/IPVirAgJPyaKENgbRy7ZPVoZm79lwm82D6?=
 =?us-ascii?Q?GTCgiqEJXIrStoXOtcCLWyRUUP9nhKwpzBtJUKK0/RFFf2doamZHz6l9Y9TM?=
 =?us-ascii?Q?7F6aiPqNI3mQLR6ZuarJdTRk1knHPuqWT6eFbYv19RPQygzd4dDNh7zv3v3h?=
 =?us-ascii?Q?bPtQlB5EVqYy8zdH2ZPhKGZT7VeFFKdYhHYIEjmpMUeyfDzqOVnBTFxzkVz6?=
 =?us-ascii?Q?eNsdJohlATZPRBegZqtYIDzZ1pmm8r6dd7VhnZODbpIZ2I+vdUSVxj5QTBhU?=
 =?us-ascii?Q?hZJSFIU48K6JRrPGxZEbNIZAJ/dTpJoiG4w/msqrYTY8znFIm1TIwHDXCMsx?=
 =?us-ascii?Q?J8zmk69Sr53UWuwThS2UxrI3lQP5YMWjoLach5kbyCEXw/KbytB7EgvuVA+j?=
 =?us-ascii?Q?shCYZe2fFl3SXFuDW8hm9TClbUbD/R5p2lUe/Dtt/wKhhiLZh3Ki1N+SARFW?=
 =?us-ascii?Q?r+uIS+gSVNBmibZKlgbGmtn5x0ETRQjo2EFkfvo6wNa8pnbzJROjGFbNSWSc?=
 =?us-ascii?Q?mLUKJnld82wuO4i02kq6HxBBDEL/Dtb/XveQ4teDYnjNetRS0mseu/PZr36u?=
 =?us-ascii?Q?CvS0E7tNXdrj9rOCSv1SATAniiQOaNcRHHHrD+vdJlbHsBoo9ozeEbVKYL33?=
 =?us-ascii?Q?VNiWY7MhUWovpqMhRUPzXo78bh0FnJeTuTI4E36ydMVbFzU4G4tikrE7LVG6?=
 =?us-ascii?Q?6z9r+42O3xDKbYy2sZrptZbq7T8+66wMGKaPApBcVjsChbu7g7PDpXx2Gqy4?=
 =?us-ascii?Q?XABmR0bRW6WamY7WPW3jylonNVdr5KqxT7zd2yQ8lf3RxZAYAGL7pwgxR6JW?=
 =?us-ascii?Q?s4GaFIEHOVmlIief6Yt+MXIkaRoUeixkphE8hTdW/C1zaICc3woywkTd8tDE?=
 =?us-ascii?Q?7wdan5TMH6axUnT2gcy4mg2DrZdf1X3YhXC2ciV4hmR9e7SVF2buHODPS1UJ?=
 =?us-ascii?Q?YRTb/W0VbFZzSnivYpVe659b9g5VzjdKXokwUko3Y5r2bMvouPcSKrQZHY3C?=
 =?us-ascii?Q?6mwMQdNv/TKunXGUtGQhGiwlr/Xyj5b8Q12BNzYA7denpvce4ONcXHplWL50?=
 =?us-ascii?Q?Dvy3mRs0TRN76vHeOjPjSew9kMUUjpLyjybpuDaLYLgeJCJQzGPM8ni3SX/K?=
 =?us-ascii?Q?qlr2QYeyauPlGNJL60ZHKas7OGxYGjPzQZKCl7jehAU8gh8g818SIC61FWLS?=
 =?us-ascii?Q?l//Vd4G9MA2MwTNtN+UgI/nekEN+fh4+LS+uANjIZgYQm7VZmpT6jVc9GR7p?=
 =?us-ascii?Q?+d9TavPvNlzEcfMOvLJcovLJ6UHAg88LytjOdfDjjCMFiyIUKQQzgGOT4M+V?=
 =?us-ascii?Q?WiF8c6JuxEHpaJp1nawgRy8Y4Wb8SyPfzIlpQcyseY3U9k1vpvze5+azP6b2?=
 =?us-ascii?Q?ADC3fzOpzbNWbxZ+n0SqNF+/dmw7ZeLdnpbg4prQ4G8Q5XHPwGEaLNAo1Tjf?=
 =?us-ascii?Q?45xDB2D80Ych9jI1fuI9b2xLNArVWpH/CAyzDw3meRskTTHtZnmDQ9TyeLcW?=
 =?us-ascii?Q?+J9eo83PoyciqgzxMExcQpmswsWgEGdZZT+3186qghNdd30fSClV5lzXrOsu?=
 =?us-ascii?Q?3HnQSqcN84maDjvqU96rLDAU74zg0vuS2qBFcnOa/aInWhbDlneqlbqIxMTQ?=
 =?us-ascii?Q?IPQaU24KrPgqyV9wGrRoWsY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e434147c-4155-4a53-dd87-08dd508ba620
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 02:18:07.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xkZ/QamehtcJYwheGiLzgSuac2x5wETtwB+9FlkgecAi3PfSqByuMEmqAM2e3B7YA1tBA78gWoltS5qrWSAEcvpbOLYbpyn+jwgQYtY8Qk1crtgE2sbHp0bhvLy0+WO9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6150


Hi Mark

> > We should not use (A) today, use (B) instead, but we still have (A)
> > definition for backword compatibility.
> > I think we should full switch to use (B), and remove (A).
> 
> > But it will be too big-patch-set. To avoid patch-bomb, I will post
> > some of them as sample. I will post full-patch-set if there was no
> > objection.
> 
> Yes, we should do the conversion - I've been chipping away at this
> intermittently myself (mainly for CODECs).  If you want to push through
> the remainder that'd be awesome!

Thank for the feedback.
I will wait 1 or 2 weeks to get other feedback, and will post the patch-set

Thank you for your help !!

Best regards
---
Kuninori Morimoto
