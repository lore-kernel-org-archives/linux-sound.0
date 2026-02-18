Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91B57303A30;
	Wed, 18 Feb 2026 11:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771412519; cv=fail; b=cnarjWb+YiipstKXCxMO3962uEp99Vj/kT/x3hJ2Q49Dh1lChMYiOd0zzVa3f3k/+sEDH7oe40mBGZ3+C0poUcC4y7Qf9OFe3kYNKCLmYXJZPMzkkP668SYA9a4Kz7CSmI/pW1vrgWFcvvD6skV+ASyvNHLqLYiUDa91w5G9qw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771412519; c=relaxed/simple;
	bh=xkhSBVl3sPPcAm9uFw6tTUpLrBHS3uSUSTopI0u7uMU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eB6haU5qwSofHOLFmlp1iJ1k8Ph0ar4SDWoHdXBBi2lgunznZqQwtf7w4a3na4oF9q0esc/WIfoKwwCmaD5IkCle58jUCsaU9BNov1GA/idWxjlIawh8C9Wh7EkjKBkbrnEH0g/Tf0aoi/kav3PddHWmvhFR08X625I0dBw62kY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=lOXPRovl; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=a/doE68J; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="lOXPRovl";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="a/doE68J"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I6tth12267276;
	Wed, 18 Feb 2026 05:00:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=m/DgvT9YGIkgDte4rqyNVbG2UwZz/h4Lz550+nK38Ek=; b=
	lOXPRovlvrRwQ48aXdlK1Gr/o+nNA62Lmy3tbZ63n2+x+1HmVoM++B/cHS3GSHOF
	UVQ1OPeyKGfgFuur1rLv0TE9A7Vc00HMtp+cBJNtLZqU/5NwJ9T1Fuxk0P9x2zmP
	Oso52RUUmw1rqHp/KoH95m3/ixQbehs2MC9Hy6EB5FxI8Zxf21vcv7nNp7P5fOQE
	lWSDOr/29yRQdIt+aOp3JOUOizCvAFDFB4jgRNkYkkvuo83DUO02TsIe/4Rg3a/c
	iT26jk1zJB54AOHPNQMmp3u8wElJlJnn8HqdOmywBICqR1KC2Rgpziv2ywTibpku
	38idPXSxTqrPhpR0MdgOGQ==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11022078.outbound.protection.outlook.com [40.93.195.78])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4caqb1ku44-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 05:00:58 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sYF3to8coweGG1KTHiYH+LQIHZSPSwl6ZpvNy8hwa0o4ANb/YRJP549S7K11WrmnvA2XCzHN1xrBjsYfBtf83fAYR8/rUVe+GHQqhvQ9stMVYW302n1oGH9HCv/8pgNXJQ8SFyC11Z6qm14COthNvuGmTwz1xxvmGNVfKVUVzi2ZPmQwp4uHnNojMUTHq1Dodp8x6nAFrjRvQGTIMemAbhrJe0OHkOlvKu/i9t1EOMPPks0OzPeJ10tR08I8GCa5wyOwxg1r43e9OWomnu+u35c9ZU5HNQvQ9E9YHfnjB+xLTeNd2/8hIlJxVRRQYU2ljSiqDZsV+FW+Hvvx/sQ96w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m/DgvT9YGIkgDte4rqyNVbG2UwZz/h4Lz550+nK38Ek=;
 b=bVnKMduJC3S+TrqTvfqOKUAgX0tMQhd33ZdgB5/sznZtcmBxlzGqu79kgGk1u6GSOqzQymyHO2F0anhllcnopX4yTXrl43X2J4RM6F1wrejyeX2GZmcpECOedLtBM4Bm00Im7kqlbxFWQ2kmtamGm5Jx4ECGzJqLTJMWZffqSoqdkp8MoV/kEDR0TQ6K1hFiDb6PjMqK7dS7OSWqMaGM36D5uJ7ai2oaqHqzhgAdMMbKB5LozjiM2Lqtusih9HMp43nuVq8tODOY98Y6JSCVEViG1fFeYKE9B1cOZRSEt80EiLjttllMg0VqNypDLoW07dt14Hmssjy8/rwgGY/2TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m/DgvT9YGIkgDte4rqyNVbG2UwZz/h4Lz550+nK38Ek=;
 b=a/doE68JIUDNULmOrxJ8q5imQJ5E4r5dX4oiFARaFP9H4Gw8IiBsc2PPc3TUfmWdL91zt6hwz9nd3yrytJ/SdeJDoF4turMtg6vw8bkZKAK33Er1I6C/9CaZRhRSv9binJjTz2Chv3kv1arsK4mtrPmVpEWH2d3B3yKCNV9twZo=
Received: from SA9PR13CA0148.namprd13.prod.outlook.com (2603:10b6:806:27::33)
 by PH7PR19MB5657.namprd19.prod.outlook.com (2603:10b6:510:13d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Wed, 18 Feb
 2026 11:00:55 +0000
Received: from SN1PEPF0002BA51.namprd03.prod.outlook.com
 (2603:10b6:806:27:cafe::26) by SA9PR13CA0148.outlook.office365.com
 (2603:10b6:806:27::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.15 via Frontend Transport; Wed,
 18 Feb 2026 11:00:54 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA51.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Wed, 18 Feb 2026 11:00:54 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id ACAF5406540;
	Wed, 18 Feb 2026 11:00:53 +0000 (UTC)
Received: from [198.61.69.19] (EDIN4L06LR3.ad.cirrus.com [198.61.69.19])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 28941820259;
	Wed, 18 Feb 2026 11:00:53 +0000 (UTC)
Message-ID: <c3af1d6f-72dc-4dcc-aa4c-1d90561419e1@opensource.cirrus.com>
Date: Wed, 18 Feb 2026 11:01:03 +0000
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] soundwire: suppress expected unattach warnings during
 codec reset
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Cole Leavitt <cole@unwrap.rs>, vkoul@kernel.org,
        yung-chuan.liao@linux.intel.com
Cc: david.rhodes@cirrus.com, lgirdwood@gmail.com, broonie@kernel.org,
        perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
References: <20260217233533.4716-1-cole@unwrap.rs>
 <10794ce3-a1ec-4286-868c-53abb20c3094@opensource.cirrus.com>
 <1c8e8c15-97f0-4da9-ab9d-e84aef9d58e4@linux.dev>
Content-Language: en-US
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <1c8e8c15-97f0-4da9-ab9d-e84aef9d58e4@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA51:EE_|PH7PR19MB5657:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b980962-54fa-42ae-492b-08de6edcfd11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|7416014|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z2dJQk80bmNSVEkzam5nK0ZtQWt3MUdTOTNLVXJKMTJOdEQ0NWJhZ2Y0UTkz?=
 =?utf-8?B?amM2cGg1alo2OFUzQ052WDF6QmdYU3c2akdQZUxDWnpBWTJmK0o4SU5la2Np?=
 =?utf-8?B?MDY5K3BmNldqTHQ5d2hVVmRic1Zna1NmMHZmVU0wcHJVMEJMRHMxa1Y3eTdE?=
 =?utf-8?B?UlNkeVFTVU8yd0IrRnFuNFRIaU1aYXY0emZPK2tXMms0OFA2aXVJRzBYYXFo?=
 =?utf-8?B?Mk5CZjI3b3hscVZYVG4vTGpPRG9jQ0FkNWIzUVV5eUFGZFhBelUrMnBIYlor?=
 =?utf-8?B?Nm52ZTFBblB5VHU4a1JISWt6SXIzUXZhUzBaTXR4bWsxWHhweFN6NXRPT3NQ?=
 =?utf-8?B?dzI4OU9GL2cyaGFibG1KYlUxVE1sdXJHSlVFZU5ZZ1dRSGFObWl6ZmxTOCti?=
 =?utf-8?B?M0JxMXFqa001V0ZvUldodVM2U05IWWlxQjlpQlJCcHNxQTBMNHF1ZmJaTjI2?=
 =?utf-8?B?QnYwN0RNdjhQS0dyOG9LamZTUEhrVCsvWExCQmRRRENIQm9LSW5nRHNZdG0w?=
 =?utf-8?B?cWVHODQxT09kcC8rRmlKazdxY29leHlpeE5jYTUxNWc2VHBoT3ZGc3RvdE0r?=
 =?utf-8?B?azhoNE5JQSt4Z0l5WkZHMXJSM3ovOFgyZVVhcVcwWFBDZ3FyWXR6bEZ3NVkw?=
 =?utf-8?B?eHpQYk14VTVnVlZrRjY1Tk9CY3JrdlJyQjRVcFpEckdkeEZ4WE9pQ2FkUEtK?=
 =?utf-8?B?a1Y3cXRmOFZmOWVETFFLb0F2cUY0emdzYW0xVURPS0tQOFlVVG1BcFdrczkv?=
 =?utf-8?B?ODgxRG5UY3hRMmljV2hoNDJVbGlIazhPWUFaOWkwbmdnYlZjN3BQbjVSSlVa?=
 =?utf-8?B?eVJEanZDbCtHMzlnN2NwQk8xczBIbEcwSm92SmxNNjJ4TFpRMHE2OSs2QTB1?=
 =?utf-8?B?YmREL3drTWVkZmlHNFNtQVRXVDlDcVdYQ0xHQXBWU2NZOHVCNnJYWjlEZXVj?=
 =?utf-8?B?ZytGVkxXTkhmUGUyZk5BZjJjWXNEUUZHZVJvRWUwNWpDcXNHbkdoL25WZDNy?=
 =?utf-8?B?azJtWHVUWkRic0p3Tml2TTB2eEZqR1I1VVN4YktaTVQxYnRhTGc2d3RCeHZt?=
 =?utf-8?B?NHhDTUVwN3BEZnN3aHNmSlkyNURZUHZJTGxaRi84SUppM2RPdEg0T29TdXFq?=
 =?utf-8?B?QUZlUUQvZW1lMlc3NkFjNHkvaTVFNTNHNTRpTWFNL3JHQlRIME5rYkVZdXpQ?=
 =?utf-8?B?ZDlQc0kxVk1reVk1aG5OMjhUcHRHd3RVdjExaTVyays4WWV0aGdtakdZVVFY?=
 =?utf-8?B?K0x5dmROc0NkNXNBQW0xWEo3M2RYTnluMXUvZHloWHVpS2pBM2JaL3dnQ1JT?=
 =?utf-8?B?QVhNdkFtVHY1czQyTXpRL21COHNHMXMrcnhwU1M3OHpXOUdPeUVrVHh1RGxr?=
 =?utf-8?B?cXBvYlNNZkNlRHFseDEya0xmZDFCem9JOFlUckhKRFBsRlU0RnV1bXJxV1J3?=
 =?utf-8?B?bm5lWEVGa2twK0lrWHNva041VGFHWlZEaVlwb1FiV0F6ZW8xTnR2TGJmKzRN?=
 =?utf-8?B?d2dqaDlNby94RnllMk1tc3BYWTVYMHFUakticGhMSVlKdGt0M2o3SytZL2Ri?=
 =?utf-8?B?blZvd1VJUEZSQWYyZ0tMYzFmYXM5dVV1VENGN045U3ZUM3dvc1RvVGNibXZq?=
 =?utf-8?B?NU9FNVRQWHdMUzFsV2NrR21uclNFcUhXaC9VRFNiRTFneXpMUHpEOVFSOWs2?=
 =?utf-8?B?Q1RtbmRJVk1VRWg5WWZXb3JSenM4R05JWm9DSjdveXZOMUtTak1CWncrZ0NV?=
 =?utf-8?B?TjdhVlpJZDl0UGNidGpXR1gwNDlXbXRkZCtXNUo2M1g3ajNLajdtaVBQdkFI?=
 =?utf-8?B?bW4wYUJoaXNrKzFWeXhQRm5lNmNKOXJYNmpTbWowdzBHQXl0bWZZbDV1VVJG?=
 =?utf-8?B?a0ZFV25oQXFRRko4TFFCbC9YdVFaNkh6VFAzNTRKQ3g1VDh4TURVWXl1Z3ZK?=
 =?utf-8?B?Y3U2TTlNMk5KbWVVcWFia3IzNW5rMGRhQVhKSWtyYm96eVYxVUtPd3RCVDA3?=
 =?utf-8?B?OVhDZlBDRm8xeVlxbXcxVGFkTWgwMWMrYlk1bDlzc3BQbWVLMXNSNFV0c3ZN?=
 =?utf-8?B?M2FnMXVkZGR1c2hCSVREejZ4bi93SlJ3OTVzaW93NmhKYnQ1akVSQWNsK3l3?=
 =?utf-8?B?Mk5xeFBNODVXK1pPdklaWTBMTDQ1S2IwYmF3SW1ha3VZWHBPR1RlTGc4ckc1?=
 =?utf-8?B?dG5sN2JodDNBN0ZhWFc0dU4yYmNoUGppUE5sd3U4UHVZS0pQc0cvcHBuNDEr?=
 =?utf-8?B?bTJZM2hmWWZibTkzRzJSNU1hNmhBPT0=?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(7416014)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QAzXz81g0m9lfaHjx4i3JRtsGEjaQ1SCP9yUcyuJ6VrnX4Q6BnFrim4KWTrI5166F9A/dHjpUAOgirz6CIonksLtl1k05J6J1UdIUMIzYSaoIUFk34fmtLeSsiVfPQj0uEf4aCF5dIxnzSAzOhtKUUDUTbKp7Ut6WOXYgc/exfvWkw/W7moy/9EfjQsg81TPdauLP5oaK+16xGrBCq2G83K0RoUunQ5hB9q5YXTy9NP8FKfejTBxMXffEMOZU/Ol6/Z9+gA3qOoB6shupJ4YTYZNzxY84yrCeDMkSpuA8/eoasmuK18oGuUGxzCL0v4qiiOWwmrXyHiNaL7SzbDV/jfsL27ggJAJNS2alOt3QUKUwa5xekONHh8AtbnShNQqV9Vi03XRzsbbAhATX34B/QG5vrcL0LVNdq7w/jC9Phbm1Es18FB9z+biCw3Yp/Zn
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 11:00:54.8055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b980962-54fa-42ae-492b-08de6edcfd11
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA51.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR19MB5657
X-Proofpoint-GUID: k2OjyvTG2Ek9kP-SWshq61LBVEpnGHqZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA5OCBTYWx0ZWRfXx149xK8LAMSL
 DrGnejzbh/Mz9RR2JyZfqR0JlFdz5Ne86BktnWSXG6OJV8hBCDF0DIHY4QIs6mHrhgBKiorXASb
 rLljRURvXMde0CqdNE5xOxKHguAi+83YJWCraHPMPPpQDPFVLW3A76RwJONBNsANSkQuhDyWbkg
 Mtdlb9CP34ihhCZ3gKJ0L0gJv4tKkpyeaDZcTHmtyJdYeDLYJbO8REhuZ4q/99kUBb8ozUc4Ga9
 mAYGq+8YFnQCcHYQph0sNyYbTxj3wFOivtK+MzaVYoWBwl7EMh5KJRU9WVvR3Afn1pSc5ajRax7
 SAFY1bgvxZiRJ0c4ZTmJ4WL1H9LLP+kti2aINddRNJpfRY9QiM1srkW+B/vxrzprZIbXJXOYaze
 r4Ff4YHgc5hWqHJeVhtatuGymNOi34Zcb/fwC2AUAWwuR5I03j8zPzXBmbqBDPuOW2EUNvgd9GV
 J3atW2LI5dATZgZgHmg==
X-Authority-Analysis: v=2.4 cv=SOlPlevH c=1 sm=1 tr=0 ts=69959bea cx=c_pps
 a=yg3rYln4nUvKBXPnFt2I5w==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=03fcm0097e9WuGQsTEkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: k2OjyvTG2Ek9kP-SWshq61LBVEpnGHqZ
X-Proofpoint-Spam-Reason: safe

On 18/2/26 10:50, Pierre-Louis Bossart wrote:
> On 2/18/26 11:14, Richard Fitzgerald wrote:
>> On 17/2/26 23:35, Cole Leavitt wrote:
>>> On systems with CS35L56 SoundWire codecs (e.g. Lenovo ThinkPad P16
>>> Gen3), every boot produces misleading dev_warn() messages:
>>>
>>>     cs35l56 sdw:0:2:01fa:3556:01:0: Slave 2 state check1: UNATTACHED, status was 1
>>>     cs35l56 sdw:0:2:01fa:3556:01:1: Slave 1 state check1: UNATTACHED, status was 1
>>>
>>
>> Is this really a problem?
>> They are warns, not errors. Nothing in that message says that this is
>> an error, or that it's unexpected. The message is accurate.
> 
> I would just demote the dev_warn() to dev_dbg().
> If you look at the original commit, we were chasing weird cases where we have dyndng enabled anyways.
> Also IIRC the problem with 2 devices on the same link was fixed by Richard, wasn't it?
> That would make the dev_warn() even less useful.
> 
Oh, does it date all the way back to that multiple device problem?
If that's the one I'm thinking of, as I recall it was Simon Trimmer
who fixed that.
