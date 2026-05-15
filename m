Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7F73B992E;
	Fri, 15 May 2026 10:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840055; cv=fail; b=W47Q3Xd2QNyfRDuDvO71wvyuT1re+OnO3I26HD4xCDaSUX8lLWTZZNs6MT2xK1s2wfZny+eeP5RXrzXvTyTaURxZE+70ePRf2MHo2sQ4z5hJDPFm34cunjB7A/E9XCYIsxTJVySVdJbBIW3hzOGvqXxyLo46/3hWDU6Vydh6kx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840055; c=relaxed/simple;
	bh=fQFlCjzRAE9xiZIYlpdDVhpa562NOiJdU8i5PWsy8eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7FnnWBGb/9Z9FwQqcVdIZoSkCnkMZrN0LGnlL7kXDLJeMiyIR9dKWPGCGYlh+dzRwJycOkUxQ17GdFhQyS0/8ANZMN2oENLFMyR+Th1VxDk6tScI7xRj61Jkhal0GPEIF77sxXchKyPF13hcIjimbpTcaJ2E9cxdxwwIKTFzd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iaDCUvTu; dkim=fail (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=dQ99aMwR reason="signature verification failed"; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iaDCUvTu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="dQ99aMwR"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64F5c3D9181242;
	Fri, 15 May 2026 05:13:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=7F8DTGsovLt07W5P5UVWKy1GU0U9+yJowi4CXPgYuf0=; b=
	iaDCUvTup5ayGmgRDfOKIZx1YywixrA40Sugjz6Ffk89K5B0k5w+U/u3iVVC2SSM
	cyy4j4/xmEKausibWFmFHPLPZVM0WLgVqJD3aCtdit8CVl9d1KeHW9r1/ReYx92A
	uRA9EC2oQwLRLX/J5guOn5Kla5pQTya4d8rL2BviXYrUpXZ0mP1AQvdK1Oiiz73h
	/uzgZ3poAxZ8Sawmz98U4xujUhtnUzSdHUAt6hmo1h7qcqqUy64IrtILyMQ8KzuH
	whFvXmc9FLRmL5xjQKQ+wXorB2Pfzzau7mybLJNjA9PVDTrZdGODr7/YNJRhigMM
	03qlxzwbcpPmOlUHwOdUPA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022125.outbound.protection.outlook.com [52.101.48.125])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4e5m2krsnc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 05:13:27 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2rbtXn5xIPUe2SE0n51GQIc6KH8fbpeczerBECdTNypnf1Kc8xlWeOJYuT3iJsOiIJLsrM8/Wnf0DApMdqNiZnMIdRWNcrs3RWkmXSJnPhpMRmvvexcLmXwetcNfVadn6q3qcsAkbxD/HZf2RsiIOMowyZRyZ07s2qu0RKEP7Y2e3RI8Eb8009yA1bLC8PKAsl7Ceg0gn7hh1DqYN1oAYPM4Mullk7dfiyA/qJ6+iSJBhnfqV9mMzUJquRBgQB8SsTiklGU37WkRa8HLwKnAgjDScqZUsQ1Q+tqn4DC6VMYJNy8CS5DBRr+1uBhmSQXcVTPgHzpEVbyMtKasPj/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WtzyLwNW/BUu4vIPjJKF0c1yhdhI/1M7JYQ5nkQUZvE=;
 b=a0qJXBsDtIDsmUACWGheZ0j7mlR53t4lt74MWjtbdSDDvh7XAZrA5rwrbhl6eLPr5AgirUwF32Jr8CFeLPZMh8IjZ9O8fYK1cbn9FRnKv5M5yLr4bjlDHjw7gv10a7ZootD1LJP9pGnJwfRi4BerQHRvxVNNYltSPe6IFstfQF+qwMVntJk9f1X8AO8NZ7qEDt/fDJ01gV2Pe5t/p5Cjfd5NvoP4ccy/Gx7gowkAEM6wJBJSHVBEpNijCKW46aHrh1nEP8l3pVfhgdUpdwKdArN+MVIFduFeojJhJVvpy4In8TWSNxPFqPBl065dX4BBTQhvo1L7BLf/QZEeVLmSQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=baylibre.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WtzyLwNW/BUu4vIPjJKF0c1yhdhI/1M7JYQ5nkQUZvE=;
 b=dQ99aMwROtHdWoyP3sV0RAIoQIBFxbCkOTOlhdhxSjVjq4vjNARmlkO1n+IqK/sxbfRpc1PN/pwWJJ4W6cYii959EYlAM3zMrD+doMUa7wT7s3/0unK9NceuhXLkDe+P60KB6wwAi060N0ct+F+9seKYKHCF3vZtmYkx9/HIhs4=
Received: from MN0PR04CA0022.namprd04.prod.outlook.com (2603:10b6:208:52d::21)
 by SA0PR19MB4207.namprd19.prod.outlook.com (2603:10b6:806:82::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 15 May
 2026 10:13:23 +0000
Received: from BL02EPF00021F68.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::65) by MN0PR04CA0022.outlook.office365.com
 (2603:10b6:208:52d::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.20 via Frontend Transport; Fri, 15
 May 2026 10:13:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BL02EPF00021F68.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.13
 via Frontend Transport; Fri, 15 May 2026 10:13:23 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id E8592406540;
	Fri, 15 May 2026 10:13:21 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id DBAAA820244;
	Fri, 15 May 2026 10:13:21 +0000 (UTC)
Date: Fri, 15 May 2026 11:13:20 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com,
        Markus Schneider-Pargmann <msp@baylibre.com>
Subject: Re: [PATCH v1 1/2] ASoC: Drop empty i2c remove callbacks
Message-ID: <agbxwOdgwX25RF9H@opensource.cirrus.com>
References: <cover.1778692164.git.u.kleine-koenig@baylibre.com>
 <3afd8230634dd68ac7c1885ee2b01da377349f89.1778692164.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3afd8230634dd68ac7c1885ee2b01da377349f89.1778692164.git.u.kleine-koenig@baylibre.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F68:EE_|SA0PR19MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b1cbaf-e571-4f9c-8214-08deb26a98d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|36860700016|376014|7416014|22082099003|18002099003|16102099003|56012099003|4143699003|3023799003|11063799003;
X-Microsoft-Antispam-Message-Info:
	L7+DANOLL/9Nwfj5sfE4ZIEDDWO/n+hWx+7k9kHSCPHeqWdkRNBcVwQZ1FlgCHEsIFpM2QXN08Xvy9EpDYOKPsQ1h9fo5aLQvQ4hAB2bdpmrx7dt47LYg99A12rIhq7ImQCkj5/zf6Xc0tywCd56nDZFirq4CfGBgG3Lqx6Y1pAs2d5g2z6UHjU0Z2JZA6Uh71dfz6OSQwZHvko2Sgxw0pI37DDGmu7FZSRFR1V0weqFYyTLQhGz4lrSv8XDyW5RTbSKQUorGpBxj5n57W8wDe3fHRHCTmuzO0TcWa3VJa5O6/Y1W/K7bLKMpYwYc2ImZDpVWZmrBuk8dzD0ZlEOicVqzwyD8paUDxGS2bh6/xdLYMciHkNLSwcKTtysU7ioxS+Sweh6GNG8QrInQJ791W1BqjQu0JG78r/Oq+ItKmbpcWZXtulyWew2TEU2A/16HXBpg0SLcewh4lioR0TDPBq+glnK94Lrc8okmmj3YOoYFiAB25iUihDB4eGSqArUfVzdueCg39mzfRr8IzPnfmq+SGYZ+L07d1YqtKkSTf6j5eg7KbEzNXqnzxb0zeUfKzAZZQOym7MHgZK54eXTeJVN9gKYGM34FYRe9a3T8uar1CYGGj2ml1hGP96c/BGXOY4fGo5OzCjyCTKHdTeW+H+YhWYq4+0KvmswRYdDIif89W/T3eTyN68IdKX7vY6oKSL6jt5f2oKMn17HfGyeLhpKw48YXga5SsQu5R4PyEE=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(36860700016)(376014)(7416014)(22082099003)(18002099003)(16102099003)(56012099003)(4143699003)(3023799003)(11063799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NCPxNLIlDstsXbjAH3z6lWIvL/wRBPhjF6t7V7i874HKKGy4S3xFyJe0a7+8Cp3WDzRlyRh5dK8O+h+ldhFgWtt+kB6PAmcetHXTyteUZ+4Zr/iXAD00f+bChXGUvA3Gb0nfzQ9BEQjzrQA/rpjb7T1XaFLf3lzpWMZdv1B1EJQ9G1yTZPD6B/+TKuUjZTRkA2rtGY0Tkp6KTd00QYn6WPAP63n2xYU4QYMoF7wZXkqvF+IvpMugxwM3Nh5VosbVD4BUUvXVk6tQgsj0ZcH60rqzndD0wm11JpbUsQsx+a9uRi7dM5DJRuJyFGobS37lUp1SYcyTHZZiimemOHvSRLCNik9f201utRCFMi1Jf3eOZN4d/9DhD31lPkUm7ZWQUcgI0bS/3h8XHjRRgIGkXJgyzw9+8dwAWd2xfrqq/6Jwzr0KDEpgeJfTzuBbiQUM
X-Exchange-RoutingPolicyChecked:
	GwmKCN85+TvRXt8QSb57CAsMS3uY8p/1VBrZ+eT3x70/jWNYgrwWfpJTkhKSN60IzVMPDtxZ3DChdu8oH6U+kbZ/n8xYX7x0YfLVvLx8menPg90/l7meqaPs6JZbI0ir7CZqHTx7+HzyKLJPKP1TK+vlKfrj+2xe1egbEtl+poVLQ08bDi0GWHzbGphoV/Fadfi8PNBdXHnfKiboCoKcUEc8LoqRYp3zIM0V01ufXl/Ke+AXXbNAUZ/ABVsg/i6WUlIfqxwi4vIn2w/vByNWuyNK9BDyvUaQJCP8xZ8KRAOsR+dHSvSRXTLlx0+ab6f4hZAZkr8z5RbKs1ozqJjNXw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2026 10:13:23.1733
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b1cbaf-e571-4f9c-8214-08deb26a98d8
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BL02EPF00021F68.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR19MB4207
X-Proofpoint-ORIG-GUID: PFyre9MlF3w4dYs4z9dPVRtHG13wB3F5
X-Authority-Analysis: v=2.4 cv=KOdqylFo c=1 sm=1 tr=0 ts=6a06f1c7 cx=c_pps
 a=qTO11YbfUBYfkhAk4rXMnw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=8nJEP1OIZ-IA:10 a=NGcC8JguVDcA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=IpJZQVW2AAAA:8 a=w1d2syhTAAAA:8 a=3IC7fnRq9NOobXjXcvQA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: PFyre9MlF3w4dYs4z9dPVRtHG13wB3F5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDEwMyBTYWx0ZWRfX5XqPgNPkV05p
 aqH8n84lrSHQAaIND1dsNw7mRUCzRNzGLMrpJzCf4Wor9lDYlMdoyiwHcdIB/D9eonyzf4sltra
 VKLwo8J3cmA+qgmHEmQU1dCWeAta1jWGBDGzhnNOrmrwQUAuqPOqBMkgdMy4uLnxuhqHcdSYaX7
 wNYa1orb8u0PK+7QRNUID/mel99SyOAjfKwN65s/XsF6XdxBljefNx5MyBAgiWd7degvwzaTvZX
 zI//jDI6A17qH64kvc+2tzfxkw5SuyoZBKRuymRFUe09MkeJiGXOFcfVLLEc5bWed8kZ+Rmfkp/
 neSwPesEI7oF9C5L4CJN0h0ewMHvx5M9oWCWTxfgDpfk3Pz1BBeSDOQRODSZBMriBEov+Ih2LEL
 nMmycn4kDik8ChPh5eVwiMlMNqCEDIoyXkse4IsrAR7h/kL9lxjT1H6A8rqNGoWWgmpDEewqfzF
 H2eG82vHQlvWsiauYTA==
X-Proofpoint-Spam-Reason: safe

On Wed, May 13, 2026 at 07:23:03PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> A remove callback that does nothing has the same semantic (apart from a
> debug output) as no such callback at all as i2c_device_remove() just does:
> 
>         if (driver->remove) {
>                 dev_dbg(dev, "remove\n");
> 
>                 driver->remove(client);
>         }
> 
> Remove these useless callbacks.
> 
> While touching the driver structs, unify indention.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
