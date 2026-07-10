Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010043.outbound.protection.outlook.com [52.101.193.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56EDD14A8B;
	Fri, 10 Jul 2026 07:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783668902; cv=fail; b=kfdU5kjfc1fIkbbDf/xsFi5v8I6dWcITKymyu9qnxveeS8mnjawi2meLn0tcZyZ57R0KGzrlaczOn01DjxsdaxmjK1s7/M81AavDz1qHDAvD/j9GPVCobuosZW8NWSyyzNMYIUbBgUR3nleJMT32sFzDaGxqjv36S/n+y/ZhHWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783668902; c=relaxed/simple;
	bh=2tPodvHceSZUzJL4f02LAYHv4x1qSukpiX+P5Bn1+I4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tKUlNi7afVtb7Lqut2S0hZdO/5FBzFMsjg+uAU+0ZuNrY2xttTGKnUgvWpJx+T388cySsl1dyl8q3gw38Q50MTvCc5WwGp9zT5TANoKhM7KwCFcG7Xm6LqnrDbm19LKoUd2h6pyLWt78AXpcKziHhtd5nJtYT5J9i9EumhZr5rU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u8P/7vn5; arc=fail smtp.client-ip=52.101.193.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u8P/7vn5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i4PbzzFtGNz/Gmfnp7SJ3qR8L7O7bZPZ/vCp1nggG8i9Z26kBB6mnMhNOHwnw2Z9CjZSSHfJr4Zbi+deGsUFIpS3RFhDaUVLkvEo7moIUqf3ktGPKZWK/NCGcxdAL7oqFZZ9PUuNhgFSBg8tNDebc9HMnCWhTkhsQK5BUFV1b4GMkuUZv8Z3nNJfcOwdUTezER/OTw8+GDJhe62AhZyw8hVmPi5NDeVZiy+4R35jY3Y3l/+bbJKiXlR/mb3/l6HVuteY/MGWOpAiInzuLVmz56KCX6Ow4juQve8M/6vOQwz+NgNvxD//alVn776UgLqQm2r5UAWyfgoSmVw98IaWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVSFoZ93BXgbwcCMQ0+ed4ye1yLHo3JAHzh7a43G0Z8=;
 b=O1MuxSRGJPCdQtlADJQtbWvScEYlAJqBjC7yLzD+Zp4TA6Yb00+5RAlp1xasrz0Kvvg3klt9zjx9Cmg2MfvNR9MpTZCyX3ynBIyqKUgSRaGuuYX22jT74wErSTAdpG6AAP7tDSsmbumgpkLK/oWzOcHZaCJq80I2tqrJsf3eNri7C0s1rseh22R+p/ws2XyhA5oC/nEIBT6Ym7Ys0ro00mBaLpQMMnOL0BeoLY4l9SurD5ktr+asJGrl46De/f3aNVZdPhggk5Z7DUPUiUGDq13orNQ7OH05zTn1lUe3avS4Et4kMsvlkkWMW1qxRvfruyZb/U39d5acMsxMP8rWBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVSFoZ93BXgbwcCMQ0+ed4ye1yLHo3JAHzh7a43G0Z8=;
 b=u8P/7vn5zW+nBfc1S8MtiSzbqdBBLfofslEP/krqlsaLRxYXpw3KxWFfageNLZLxbgmmF7CJeEtEGh1gkZdBDXvgQxrMDQbnw45J2JwatX5unZfwN/pYNMX8rsF8rJJJeFCdgV+L+K+qoW1uiM9M6s/W4ZLcyt39+Yw9bI9WY2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA4PR12MB9788.namprd12.prod.outlook.com (2603:10b6:208:5d5::11)
 by SA5PPFD8C5D7E64.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 10 Jul
 2026 07:34:56 +0000
Received: from IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db]) by IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 07:34:56 +0000
Message-ID: <a84c3eb1-7ac5-44a8-95cb-e33175e78ee9@amd.com>
Date: Fri, 10 Jul 2026 09:34:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: xilinx: xlnx_spdif: Use dev_err_probe() and
 drop redundant error handling
To: phucduc.bui@gmail.com, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260710050223.14266-1-phucduc.bui@gmail.com>
 <20260710050223.14266-3-phucduc.bui@gmail.com>
Content-Language: en-US
From: Michal Simek <michal.simek@amd.com>
Autocrypt: addr=michal.simek@amd.com; keydata=
 xsFNBFFuvDEBEAC9Amu3nk79+J+4xBOuM5XmDmljuukOc6mKB5bBYOa4SrWJZTjeGRf52VMc
 howHe8Y9nSbG92obZMqsdt+d/hmRu3fgwRYiiU97YJjUkCN5paHXyBb+3IdrLNGt8I7C9RMy
 svSoH4WcApYNqvB3rcMtJIna+HUhx8xOk+XCfyKJDnrSuKgx0Svj446qgM5fe7RyFOlGX/wF
 Ae63Hs0RkFo3I/+hLLJP6kwPnOEo3lkvzm3FMMy0D9VxT9e6Y3afe1UTQuhkg8PbABxhowzj
 SEnl0ICoqpBqqROV/w1fOlPrm4WSNlZJunYV4gTEustZf8j9FWncn3QzRhnQOSuzTPFbsbH5
 WVxwDvgHLRTmBuMw1sqvCc7CofjsD1XM9bP3HOBwCxKaTyOxbPJh3D4AdD1u+cF/lj9Fj255
 Es9aATHPvoDQmOzyyRNTQzupN8UtZ+/tB4mhgxWzorpbdItaSXWgdDPDtssJIC+d5+hskys8
 B3jbv86lyM+4jh2URpnL1gqOPwnaf1zm/7sqoN3r64cml94q68jfY4lNTwjA/SnaS1DE9XXa
 XQlkhHgjSLyRjjsMsz+2A4otRLrBbumEUtSMlPfhTi8xUsj9ZfPIUz3fji8vmxZG/Da6jx/c
 a0UQdFFCL4Ay/EMSoGbQouzhC69OQLWNH3rMQbBvrRbiMJbEZwARAQABzSlNaWNoYWwgU2lt
 ZWsgKEFNRCkgPG1pY2hhbC5zaW1la0BhbWQuY29tPsLBlAQTAQgAPgIbAwULCQgHAgYVCgkI
 CwIEFgIDAQIeAQIXgBYhBGc1DJv1zO6bU2Q1ajd8fyH+PR+RBQJn8lwDBQkaRgbLAAoJEDd8
 fyH+PR+RCNAP/iHkKbpP0XXfgfWqf8yyrFHjGPJSknERzxw0glxPztfC3UqeusQ0CPnbI85n
 uQdm5/zRgWr7wi8H2UMqFlfMW8/NH5Da7GOPc26NMTPA2ZG5S2SG2SGZj1Smq8mL4iueePiN
 x1qfWhVm7TfkDHUEmMAYq70sjFcvygyqHUCumpw36CMQSMyrxyEkbYm1NKORlnySAFHy2pOx
 nmXKSaL1yfof3JJLwNwtaBj76GKQILnlYx9QNnt6adCtrZLIhB3HGh4IRJyuiiM0aZi1G8ei
 2ILx2n2LxUw7X6aAD0sYHtNKUCQMCBGQHzJLDYjEyy0kfYoLXV2P6K+7WYnRP+uV8g77Gl9a
 IuGvxgEUITjMakX3e8RjyZ5jmc5ZAsegfJ669oZJOzQouw/W9Qneb820rhA2CKK8BnmlkHP+
 WB5yDks3gSHE/GlOWqRkVZ05sUjVmq/tZ1JEdOapWQovRQsueDjxXcMjgNo5e8ttCyMo44u1
 pKXRJpR5l7/hBYWeMlcKvLwByep+FOGtKsv0xadMKr1M6wPZXkV83jMKxxRE9HlqWJLLUE1Q
 0pDvn1EvlpDj9eED73iMBsrHu9cIk8aweTEbQ4bcKRGfGkXrCwle6xRiKSjXCdzWpOglNhjq
 1g8Ak+G+ZR6r7QarL01BkdE2/WUOLHdGHB1hJxARbP2E3l46zsFNBFFuvDEBEACXqiX5h4IA
 03fJOwh+82aQWeHVAEDpjDzK5hSSJZDE55KP8br1FZrgrjvQ9Ma7thSu1mbr+ydeIqoO1/iM
 fZA+DDPpvo6kscjep11bNhVa0JpHhwnMfHNTSHDMq9OXL9ZZpku/+OXtapISzIH336p4ZUUB
 5asad8Ux70g4gmI92eLWBzFFdlyR4g1Vis511Nn481lsDO9LZhKyWelbif7FKKv4p3FRPSbB
 vEgh71V3NDCPlJJoiHiYaS8IN3uasV/S1+cxVbwz2WcUEZCpeHcY2qsQAEqp4GM7PF2G6gtz
 IOBUMk7fjku1mzlx4zP7uj87LGJTOAxQUJ1HHlx3Li+xu2oF9Vv101/fsCmptAAUMo7KiJgP
 Lu8TsP1migoOoSbGUMR0jQpUcKF2L2jaNVS6updvNjbRmFojK2y6A/Bc6WAKhtdv8/e0/Zby
 iVA7/EN5phZ1GugMJxOLHJ1eqw7DQ5CHcSQ5bOx0Yjmhg4PT6pbW3mB1w+ClAnxhAbyMsfBn
 XxvvcjWIPnBVlB2Z0YH/gizMDdM0Sa/HIz+q7JR7XkGL4MYeAM15m6O7hkCJcoFV7LMzkNKk
 OiCZ3E0JYDsMXvmh3S4EVWAG+buA+9beElCmXDcXPI4PinMPqpwmLNcEhPVMQfvAYRqQp2fg
 1vTEyK58Ms+0a9L1k5MvvbFg9QARAQABwsF8BBgBCAAmAhsMFiEEZzUMm/XM7ptTZDVqN3x/
 If49H5EFAmfyXCkFCRpGBvgACgkQN3x/If49H5GY5xAAoKWHRO/OlI7eMA8VaUgFInmphBAj
 fAgQbW6Zxl9ULaCcNSoJc2D0zYWXftDOJeXyVk5Gb8cMbLA1tIMSM/BgSAnT7As2KfcZDTXQ
 DJSZYWgYKc/YywLgUlpv4slFv5tjmoUvHK9w2DuFLW254pnUuhrdyTEaknEM+qOmPscWOs0R
 dR6mMTN0vBjnLUeYdy0xbaoefjT+tWBybXkVwLDd3d/+mOa9ZiAB7ynuVWu2ow/uGJx0hnRI
 LGfLsiPu47YQrQXu79r7RtVeAYwRh3ul7wx5LABWI6n31oEHxDH+1czVjKsiozRstEaUxuDZ
 jWRHq+AEIq79BTTopj2dnW+sZAsnVpQmc+nod6xR907pzt/HZL0WoWwRVkbg7hqtzKOBoju3
 hftqVr0nx77oBZD6mSJsxM/QuJoaXaTX/a/QiB4Nwrja2jlM0lMUA/bGeM1tQwS7rJLaT3cT
 RBGSlJgyWtR8IQvX3rqHd6QrFi1poQ1/wpLummWO0adWes2U6I3GtD9vxO/cazWrWBDoQ8Da
 otYa9+7v0j0WOBTJaj16LFxdSRq/jZ1y/EIHs3Ysd85mUWXOB8xZ6h+WEMzqAvOt02oWJVbr
 ZLqxG/3ScDXZEUJ6EDJVoLAK50zMk87ece2+4GWGOKfFsiDfh7fnEMXQcykxuowBYUD0tMd2
 mpwx1d8=
In-Reply-To: <20260710050223.14266-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0142.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::27) To IA4PR12MB9788.namprd12.prod.outlook.com
 (2603:10b6:208:5d5::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR12MB9788:EE_|SA5PPFD8C5D7E64:EE_
X-MS-Office365-Filtering-Correlation-Id: 4502bacb-7667-4150-8236-08dede55bd06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|4143699003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	3m9hjDoxFStaL2DZTheZixwf8gmun0RlN46B2rBdFoMF6hGOe3pUQgzDEskaaV8PaIOpDt9H6VDJ1SnsS5kyIV3810XMBAgYqDwMM6bBJwdqEi3uEOSf9ER0qvnXqAMar0bEYDiMog1KMi4TO/BWP26wUcOtjQaGq2ALtHC/QHiEzxDT/ygbhRmy/L7Jz1SApdMNgGGq9Yb9RWaSTk3qPy99bpCKwjD4574RJZBv4be+4lI0UwodD+yomECFeP7KaXDdJOZbJQFNsZtndpkQHf+hBuzupz/8TiXpNqDyqt2xIOALzz3Z3m2Ne260k3UPgbfm1O7u9ruxRkbyO2A0cO/OwlcetrO5uWCQn8Qd/e1OASCJ9nrV/5i0rSt8bnY1ww6QQg08iM6zK/XyuVJkeocsZORo/MNWK4MEwIT4ZWKZf8ydtcg55eBZeDKURbzgqvb0FhdEYS7sx1aUyozkTEJ5z4bAqaKHc43IoeJDWbbSPcZS47VDZ851iyaYlXKB2Hq5vMOVeCS6zZ8E/Yr3ZB+80xTBjfGtqm71ZnFKTV0D9Byd+39/TSym8VDcgTd1adj+1A37Kw/VtDgEMqXkpoymrpDJbetMKo3RY5NkTf300MCwMkSA8A87YBVrYBRUxiyUQgu871rqcP4rBzZwmF11m/Zz4DaoEdHR0Norrt4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR12MB9788.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGVoTE5RbU5LcTEyelZxYW5jeW56WldMZUF4QmN2bmZSUG5zRDgxNStNNHpT?=
 =?utf-8?B?RTlYSTVab09haitaQm5UV3dQWk41UUFQbndtWFFoN3dFdllmdzBCbWFsUG81?=
 =?utf-8?B?RVYwZGp6Sjk0WGFSQk9yWWhsWUhTNXJ2VExydXE5Q2ZEQ3lFc200NWJsbGt3?=
 =?utf-8?B?NldrbjdaRDFwZFZOS2V5MlhPNEthS29wTVNYbTRtUWpESVZzbENieEM1Z3ZQ?=
 =?utf-8?B?YTg0djNIK1l5UVNHSXlRTmhPYTgycWl6czlzNXJ5VmI1eVNPQ0VOZkh1Q3FM?=
 =?utf-8?B?anNxOS9kT1QwVHc5T2NHdG0vZGNaMnQ3NG1XQWpNc3lZZE14aWxrOTlaKzIy?=
 =?utf-8?B?eTFQRUJpSHpMc1pGVTVSMkZXcmRYSXQ0SmxmMzFETDBRMks1ZUNnZU5pOTE1?=
 =?utf-8?B?UXpLR3BhZ3BsYmdJQ1lMT0QvZzIvVmVTTmhlZjFlVXV6RjloVy93aVdBakt3?=
 =?utf-8?B?d01XMjB2bnQydGdLZm9MZ3ZIcGRCSTdzY1FtOTExbkcvSjZ0bFNwZTg0azVp?=
 =?utf-8?B?NjdHVUJsS2JudVZzeU52NTgwT3RFQzBjaHhhV3UrQzFqSDI0b2t0cCtTV3ZU?=
 =?utf-8?B?SU9YeGlJVndzNHJCRFVhRmlEcEh0VDg4NHdZMlM3dHZDVkttbjlnK2Y5WEt6?=
 =?utf-8?B?MjYxaU9IVFoxeldYaVk2eThudURlN09GQW1PeHplaU9KL3BCaG9XWExtdThU?=
 =?utf-8?B?VENYVGhmWWFiaHRaZWpTeWJGdnhpdjFjZHRuYVFkTDZ6RTNyTlpBb25WS1J1?=
 =?utf-8?B?SkYxd2Qya1FXcmdhQnh1eFdTNmdUTzBwUWtWMjZrZXdLRm5sbUsxc0V3V2tV?=
 =?utf-8?B?L2pjM1hGRUQvdXh2MXB5dWhFRmdYU3ZIaTJwLzA2TE9IcEM1Y3NqSGxYelZn?=
 =?utf-8?B?VC9DZ2JGT3hWSERkNHJHcXdSMXJHeTV2ZTJHNHpZWHdkV0pPczhOZHdyV1V3?=
 =?utf-8?B?anF2R21FYnp2eWNCaXdHdVAwRysrUG5RZFFmamVzMG1IU2xtKzR3S2s1aU5L?=
 =?utf-8?B?ZDgwNjJGcG9pdk1uVTdYOUgvU21pOFNxN2JWTU14RTFiWk1rK3NXYUJnckRu?=
 =?utf-8?B?dlBrVTBQSEdmcXl4dlNyNFNObUtKb1RJVWhoaUNiVG1Qa3AwUW5VdjB1THBG?=
 =?utf-8?B?Tnoya1ZmK1ovRG92SVFQdnlwakNRczJLTzZ4Q2JQYlY0L1hCekM3bXBEaDRX?=
 =?utf-8?B?TERyT3JOTTVsRXN5N0QrZ2MvaS80REVRTEpHSUZEcFJtU1RRL3E5SkxwS2NS?=
 =?utf-8?B?L3dQbVUyaGxieEVXbVdFUkx5MHZHMjBjOXQ5MzYxTzVrcHFWVjRDcWdNcTZT?=
 =?utf-8?B?VkpPdzBnT09NVmlYMXJpS2NwVFVtd25NVUpmL29xRUFwR2c2OW9GQnRqRGta?=
 =?utf-8?B?TVBJZStVcG5CTlFybG1sMGUxS3Z2dHUycDBaSTJFaXo0RHV0d0dFaG9uWmNk?=
 =?utf-8?B?NVRkR2MzNDhYdUVkYUx2TnVHQndHcUh3SE9kd25NUm9sWnlqMytVNkU3QXQw?=
 =?utf-8?B?T0hKZWlhbEcyT1ozbTNwZTJzNnBrS1o0ZWk4aktWZnNrRUp0SjIvWjBnOXdY?=
 =?utf-8?B?Y2dlempreGpSdCtPb1dZZ1Y0em1yS1daYzgrWVJNNElxSzliNjY4L3FVZXpN?=
 =?utf-8?B?M2VKQVNaVWVabDdyRFZ1ZzVJSEJxTENMNHN6eVVUTWx1SHpNTCtCK0wxQi96?=
 =?utf-8?B?cGpIM1FGdndpdWdXOGxnVjRxZ0k1TnFQUlM4bENER2JwTG81VXExOWpReDFv?=
 =?utf-8?B?RHdmaHM0c3EycUd5Nmd4UWoxRnFhWVhkN09lYXJqYU1LbEc4RURXVFRFQ09C?=
 =?utf-8?B?Wi9MeUNmOGtMZkdHaEdIbUhrbUQvOWRCT3ZYS2F1bm8zWkI2bVppSEd5elU4?=
 =?utf-8?B?dW5jKzhoTFcvYU9lcFJXZ05vd1BxZjFzcEtBQUxMbHgxSzFJMURYTFd4aDNK?=
 =?utf-8?B?eGpYRHJnUDI5WXRhbWlvMWJRUTVrcmpVTVNLem1GZU5BV2lCcmdndDF4cVVB?=
 =?utf-8?B?c1haZkVSQXdUeUI5MkV4ZFY1ak5MS0V6cmUyOFNtZFkxM09rZmFIMVVxaVl5?=
 =?utf-8?B?RkMwL3QzdVducEJwQmxKdUoxcWhFeExUc2w2MTE5UlhEUGpBRkZmS2N4eDVB?=
 =?utf-8?B?aENGUXRkL0xHZkQvM0I5UkRYYzdBUFdzemdNQS80ZnIvSzhxMjhzUUZ2RkdD?=
 =?utf-8?B?ZEtVMlpzV1RTeC9pSFhPa0NVMmpwRW9yMUVYRkR5U2FIN09FU3Z0eE5zK0Z4?=
 =?utf-8?B?VUg3RmI3RW9Jb2ZCd1BPYzREV0tnUGZObE9RUTJ3WEt4aGgrUHZ0L1NJTytx?=
 =?utf-8?B?cHVJUEV6RXVFLzRtV2gwVk5QaFpiWHJJWkNodDJ0dkxJN1Z4SVQ1Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4502bacb-7667-4150-8236-08dede55bd06
X-MS-Exchange-CrossTenant-AuthSource: IA4PR12MB9788.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 07:34:55.9394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JTeUDYqvEAfnemaFvtu/4Ti4v/NPBL9F5MOp+9Lj/BEmih5a/WavyLgFqVavzoXN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFD8C5D7E64



On 7/10/26 07:02, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Use dev_err_probe() for probe error handling where appropriate to
> simplify the code and properly handle deferred probe.
> Also remove redundant error messages when the called helper already
> reports failures, returning the error directly to avoid duplicate
> logging.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/xilinx/xlnx_spdif.c | 30 ++++++++++--------------------
>   1 file changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
> index 017a64ab9f1e..8f4d238be890 100644
> --- a/sound/soc/xilinx/xlnx_spdif.c
> +++ b/sound/soc/xilinx/xlnx_spdif.c
> @@ -249,21 +249,17 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	ctx->axi_clk = devm_clk_get_enabled(dev, "s_axi_aclk");
> -	if (IS_ERR(ctx->axi_clk)) {
> -		ret = PTR_ERR(ctx->axi_clk);
> -		dev_err(dev, "failed to get s_axi_aclk(%d)\n", ret);
> -		return ret;
> -	}
> +	if (IS_ERR(ctx->axi_clk))
> +		return dev_err_probe(dev, PTR_ERR(ctx->axi_clk), "failed to get s_axi_aclk\n");

This is pretty long line. Message should go on the next line.

>   
>   	ctx->base = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(ctx->base))
>   		return PTR_ERR(ctx->base);
>   
>   	ret = of_property_read_u32(node, "xlnx,spdif-mode", &ctx->mode);
> -	if (ret < 0) {
> -		dev_err(dev, "cannot get SPDIF mode\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "cannot get SPDIF mode\n");
> +
>   	if (ctx->mode) {
>   		dai_drv = &xlnx_spdif_tx_dai;
>   	} else {
> @@ -274,29 +270,23 @@ static int xlnx_spdif_probe(struct platform_device *pdev)
>   		ret = devm_request_irq(dev, ret,
>   				       xlnx_spdifrx_irq_handler,
>   				       0, "XLNX_SPDIF_RX", ctx);
> -		if (ret) {
> -			dev_err(dev, "spdif rx irq request failed\n");
> -			return -ENODEV;
> -		}
> +		if (ret)
> +			return ret;

Here you are changing error value and commit message is not saying anything 
about it.

>   
>   		init_waitqueue_head(&ctx->chsts_q);
>   		dai_drv = &xlnx_spdif_rx_dai;
>   	}
>   
>   	ret = of_property_read_u32(node, "xlnx,aud_clk_i", &ctx->aclk);
> -	if (ret < 0) {
> -		dev_err(dev, "cannot get aud_clk_i value\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "cannot get aud_clk_i value\n");
>   
>   	dev_set_drvdata(dev, ctx);
>   
>   	ret = devm_snd_soc_register_component(dev, &xlnx_spdif_component,
>   					      dai_drv, 1);
> -	if (ret) {
> -		dev_err(dev, "SPDIF component registration failed\n");
> +	if (ret)
>   		return ret;
> -	}

And this is another case. Where origin code didn't return any error which was 
wrong. That's also not described in commit message and likely this should have 
Fixed tag.

Thanks,
Michal
