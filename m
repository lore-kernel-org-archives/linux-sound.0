Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC41E3BB57;
	Wed,  4 Feb 2026 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770205557; cv=fail; b=UM8ysAUdY9z0ZwFh4za+InSwOFW5n85QKI+kVdtcZgAKAG8Hg08G6797UDDtA16YKJw15Yceo9ctYP83GS4Ahgs7cc5jwOzJ5alnj+n6W8bHBYW1VKSbnepyR+DYtdjTNJyNH3vPpD4Zw/o3xD/Z8BA5QG5sJ6jgzcpdmFcD+uQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770205557; c=relaxed/simple;
	bh=ZGct8SaGEIGmxlQyT9f8PoCbCXN8xOJkrOuzyyJ8Nt8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rldn9hgELAZ/sZ9lhddXmNfd3k05GGj/uXzJTn2r0WDJ1AJ07tLMRL6ndThFZqACoQ85gLSgvN94Ehuj6h7NBu6K9j6yOy/z5+QRgf3OdEeOE4du4BAwwVQu953EjShCeCHFceO05212D44d9Wsv/FkgmT+mWD5RxQy3SiIRrIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aNhfv+k4; arc=fail smtp.client-ip=52.101.48.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aNhfv+k4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZVcHhEZg1z9TSQ/GGi6d6aY4bGMesvftYTJRf7Bg+9BbKLgcIUuIrJVXexm99SRgQV02v72o8qDPRe2f5IlAPO/DmGhH5ufrzaIqBCf3UNMT5T4GNtEzanT9L9OJLN0zSitQoqLYubR9bmbPx8EJmJjZ5IF9aEB6Aq7RalPYz8IDHMYFMaBggPflF9vtxjgDbEmKYpwIDQ13Um1dsTtI2lcFquuzcta7nUZtq6h3R3xCkiuGR5LasBKj7l4K4nY9FyKEAQssHCOlJrjujDCkIBrE0wHHqGs0AXQDWSWyOePfvMwE4yjFdLQ+mcNKgS+JTYz3byjqj7y9u3btPfi+TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kt8PgxCRenoHKdrw6QMmCEZA8RBxdteP0XAztT0gDWc=;
 b=SS/gnXvCys0/sftzTaMlo5Yw00ifLfM2T7Sx5whnq+Ba5gRnN6AwaEBJYcZMyfTpfEA7ugD9nA3EZUAK3KMh/itf8V8ZTEcMQxpclufHUx0lTZwDFVujvx5SvQS2W9jUNJxeT0tB7ca/jkI98J1koNK54D+wi0V9bkBNOWCM/izeeMDT0VmS7AUY/Z/Z6HrBgWdtyahLYuN1U/Nyj66y53OWwP65lib4ClRyid2xXbzgRVmZjKUKXpGcceleR9ZUZs0PZmLIZWWMJtiMC494VQArNqPCFmXH/HBqE/LhSKwe79ChV9hTzKfdwbxWE6ude5uIFEZ9DQxIxM9aMR/nGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=suse.com smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kt8PgxCRenoHKdrw6QMmCEZA8RBxdteP0XAztT0gDWc=;
 b=aNhfv+k4je6MDyzfXLHU7/SbfIebltVUIdT0gPo0yG1XuKgWr/zL23iSci3uLQ1TJnGiR3bgO7Vf1HDbgRUylRRT632jH6JPLMhutCcni2NmZoMf1v+jT9urzXz/jKnc8fTMVu8+4KfdPE9+U+KPdIoW38QiQXdftvIe3BqjYNA=
Received: from SA9P223CA0001.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::6) by
 SJ0PR10MB4767.namprd10.prod.outlook.com (2603:10b6:a03:2d1::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Wed, 4 Feb
 2026 11:45:54 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:806:26:cafe::27) by SA9P223CA0001.outlook.office365.com
 (2603:10b6:806:26::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.13 via Frontend Transport; Wed,
 4 Feb 2026 11:45:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Wed, 4 Feb 2026 11:45:53 +0000
Received: from DFLE201.ent.ti.com (10.64.6.59) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 05:45:51 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Feb
 2026 05:45:50 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Feb 2026 05:45:50 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 614Bjn7Q1044493;
	Wed, 4 Feb 2026 05:45:50 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <sen@ti.com>
CC: <broonie@kernel.org>, <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
	<krzk+dt@kernel.org>, <lgirdwood@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-sound@vger.kernel.org>, <perex@perex.cz>, <peter.ujfalusi@gmail.com>,
	<robh@kernel.org>, <tiwai@suse.com>
Subject: Re: [PATCH v2 0/4] ASoC: ti: davinci-mcasp: Add asynchronous mode support for McASP
Date: Wed, 4 Feb 2026 17:14:57 +0530
Message-ID: <20260204114457.1617288-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203003703.2334443-1-sen@ti.com>
References: <20260203003703.2334443-1-sen@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|SJ0PR10MB4767:EE_
X-MS-Office365-Filtering-Correlation-Id: c04ad876-fc5b-444f-2204-08de63e2f391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FTkGSg0zcOqeZSUTgTyvX/xrPocy8TjXBDj1u7rHEX/e4QbRPr7yBsIX/GTE?=
 =?us-ascii?Q?8MwVoRsdFZlEiHPdPwqW6ifejRq/AuoCx/khNTGGXeETsjen7bnqoRwrtRkz?=
 =?us-ascii?Q?lHI29xZ1wAVnCsZYepsaxpEDd3fdWCmsqtmQg1jvnjGCI5Tfn7wYj/LD1htW?=
 =?us-ascii?Q?OmEAyFM1o6G0Ujg1UHO0deTEK4FKbkBWZ5R4oMwMIzytdNFKYTyCfdDBA89m?=
 =?us-ascii?Q?JdQmZYYKQcyPdUsdMpjCGa/gdjZyAXsHvamIWMj63I/YnlAmReT6McPuKfm1?=
 =?us-ascii?Q?E2Y93PSL+7AtPCnz9jSlCv/tgBklrKRNIuXIH2otBsA9X86NjJLLR4cuHAkQ?=
 =?us-ascii?Q?eJszLxCoXXIV98FimRb2igB63Ch0m62U5YfkxHywHiquTlSb3C/AABlwWiGe?=
 =?us-ascii?Q?bgeF8ub7w4SarE8HTVjIEMJCbwAM9KNDUyVmBbc8dlKEGxBrUQaQrBGYXGYM?=
 =?us-ascii?Q?rm35r7g6Xrm28YEdYV9HRobV2KQEpNIhrQaksyEK4SowsjWUllfrx19ZXZGv?=
 =?us-ascii?Q?wKxI0lCFmvJ6T/Kv5U3FrjSNgGLAXotVTK0Rq9eJzkSh5AQp/tmtcfWH95hs?=
 =?us-ascii?Q?ASGDac7GBcpW2YdvznJWlYvoExbSjRhZ47NfnE10ngEckZGBStcWRfpeZmjv?=
 =?us-ascii?Q?nk14Be5Tj9rtUS+W7R8Y/3HrF3O3xef9lF6RnJkA1pZ54edDk/vK3FgcM5GZ?=
 =?us-ascii?Q?w67g1DP1QOXtcbtGytN6387VKGdtC+SgnLpfeOG8iYcRUXoT4oZIYzbS3iJS?=
 =?us-ascii?Q?dNxT7bEyuYMOrtr7qEotFZ9/+mvgBW6bYqo1s9LFYLCG9ru8KrIN/ISDXJei?=
 =?us-ascii?Q?fOwjmIRbYdRIGh33oESaTfJ9qko/kf8wqmIDqdzRfXx1rXwbz1/rf6fOvV7C?=
 =?us-ascii?Q?Il4FfeqbMNugZgX8WupXw5KZOS6KZ2pcgAhGbvmeONm3iJU3rZ2d8pqxlt02?=
 =?us-ascii?Q?KwNmN1CyKUpBYZamUA2VTkwomR7NhDYZROCV/Jr7hy0MG1cx13ZsbkfrztoE?=
 =?us-ascii?Q?7TbLkxEDtxABXYNu+EbEAzp7i2W7jMrEYaFWS6153PHjVdmG+fo7x6Eq7KLQ?=
 =?us-ascii?Q?hk16TtrAd4q1GNvplJshIDuncTxPGMEXj2snsQ9/nmP1N3c/ztsa6mLZw90t?=
 =?us-ascii?Q?QgKbxcF6cYy8WZUQN1tCnqWXor3Et8ge5BeuMABErZ/ReUxIwSsGaH00VWMc?=
 =?us-ascii?Q?dub5Y43o9XqvpbXYnJLKPk3lHvLuXb2PHQU2hb1KXjSmzPXeP3WNQp8cRMmR?=
 =?us-ascii?Q?05R1t1rygzaIJ/y4VmC0+wFeZCxUtIyTUP3ho1GAgpduPds4sbePE+aouPn/?=
 =?us-ascii?Q?TlQIQC/fP1LLQ+VcRMslGnagYdYzoKED7Z+Ffq1Bsx4DbY3YcvUxJRSV0jpq?=
 =?us-ascii?Q?zTiIrE1nn3VynJ3FpCmBQsSCdhFwV18d50rMqnqmTovzdctoZ4E3/OBexDe0?=
 =?us-ascii?Q?44iIWlbgfRhCn08UpnIuqQW4I/b3w6n3KS5elpFXIcY3rI9gV+VW/0ZHh1+f?=
 =?us-ascii?Q?etBWFQIWvZBgFhcR3MlRlPcA87c1kJxUdKlHNabpgdqZ3SFP14aMnHPhMGTe?=
 =?us-ascii?Q?+933S+IkOWrEGon/VQSMX8UdyO94FSJnQChZ0aa3LHnsNAmAaQW+4N/ounki?=
 =?us-ascii?Q?NPrSyHW+VxV3Q1PeIV0UKSY=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dRZZVkL9yy13UwJXIFaqdh+rYjZXLUIxq8LkRUhNjdzdfrwimYY7dzyVBCVMkmkmjmw9ujCcoKOa6E/RaIKMRg34/kcaXRJX6PpoOyE9bn5dgbQ3l+5c8Pv5oTeNCPKope6PDIMGIjpARk25AutX+oW0WDRDUDllFr9sQWuhGDpYTfPFa7yMztNjM9jdRumM5a8BcCv1BrgHgP/Wu8yoP86t6qpc/pQyTvw9jY8+gaciCyA0fLBKhXOp9AzmlPkMybcYhnz4Z2s6Iw5qhlkLeXxUaGXNpKKX4SZI+mInEcA0lcBjGGlUUF5y9o1MLSyz0v21fEMrD/xdUzuLGfrKh8lSGCuVH7YHVAb9RKRrZGa6YoKdL49XkGNNLjQ5jGF7+YP/4uMlikM/oW55YqKnT2ywCA873ex4Nz9uYFJC77HDbgacKVbr0ZF625b7tued
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2026 11:45:53.2964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c04ad876-fc5b-444f-2204-08de63e2f391
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4767

On 02/02/2026 18:36 PM, Sen Wang wrote:
> This series adds asynchronous mode support to the McASP driver, which
> enables independent configuration of bitclocks, frame sync, and audio
> configurations between tx(playback) and rx(record). And achieves
> simultaneous playback & record using different audio configurations.
> 
> It also adds two clean up patches to the McASP driver that disambiguate
> and simplifies the logic which avoids the async enhancement from being
> too convoluted to review and analyze.
> 
> The implementation is based on vendor documentation and patches tested in
> both SK-AM62P-LP (sync mode, McASP slave) and AM62D-EVM
> (async mode, McASP master, rx & tx has different TDM configs).
> Testing verifies async mode functionality while maintaining backward
> compatibility with the default sync mode.
> 
> Bootlog and Async mode tests on AM62D-EVM: [0]
> 
> [0]: https://gist.github.com/SenWang125/f31f9172b186d414695e37c8b9ef127d
> 
> Signed-off-by: Sen Wang <sen@ti.com>

Tested-by: Paresh Bhagat <p-bhagat@ti.com>

> 
> Changes in v2:
>   - Corrected patch 1 subject title
>   - Retained original order of operation in patch 3
>   - Corrected code comments to use inclusive terminology in patch 4
> 
> Sen Wang (4):
>   ASoC: dt-bindings: davinci-mcasp: Add properties for asynchronous mode
>   ASoC: ti: davinci-mcasp: Disambiguate mcasp_is_synchronous function
>   ASoC: ti: davinci-mcasp: Streamline pdir behavior across rx & tx streams
>   ASoC: ti: davinci-mcasp: Add asynchronous mode support
> 
>  .../bindings/sound/davinci-mcasp-audio.yaml   |  71 ++-
>  include/linux/platform_data/davinci_asp.h     |   3 +-
>  sound/soc/ti/davinci-mcasp.c                  | 510 ++++++++++++++----
>  sound/soc/ti/davinci-mcasp.h                  |  10 +
>  4 files changed, 481 insertions(+), 113 deletions(-)
> 
> 
> base-commit: dbf8fe85a16a33d6b6bd01f2bc606fc017771465
> -- 
> 2.43.0
> 
> 
