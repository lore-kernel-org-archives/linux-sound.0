Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012005.outbound.protection.outlook.com [52.101.48.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C399C339381;
	Wed, 12 Aug 2026 11:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786533763; cv=fail; b=Qqw3GYQl3B7C3u159Lob9/AAZWSqn0X/R4u3+Nepsvsukg2/hddQPlaN9aOzusU1XfGegJdbMmG2xsZTHDXePiZDT/BaM26Ggqf9Aqn9AtVsf1T+SSqu95mpk+Arwx6vkaK1HKzdD1DJHsfKPUNwAdZpZxEjAqfzkyh2pZ9irZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786533763; c=relaxed/simple;
	bh=Tno9pDc4IqvlcOYOfVBV1cjmT7u6fJneVb5W9XtHJ1o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=fGM9K/58EfCfaKSD/rsoi5nOHZC5EtoPsAYekCQ/HaFnkfvSZrlIn30Kinq2P8++rX/TcbAWpi0fkhTdXggNTm2XBhifqSsoTytybQK0L1Po2blNr/kFjsp2E+5/syTHKZerl3zExrBLj1ObdyNznU8vutqPFuZNyeoEtAoH3RE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iuDY14Af; arc=fail smtp.client-ip=52.101.48.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iuDY14Af"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L686AdZ4kq8/fMJk+Ad8cfHLbB/46Wi5Q1e2uzXOdinl4AeJyvrrg12EYWaSe894NJjRxw6UDU6nhG6T+3QEYtGM8WlDTNTO+8z+peUXHUrbVsB4omHXC4Fm4JdFluV327piHx20NuFpGnc6YA4MCBvw6wNy6XyWuLSS4HVtDzHkDMFF+4/zZ1ZSJEI+KMlf2pHUHek+d9ni43ZUlpENYR/dqb48puN4y08Cu1V5mZAObtcqnbVfpfJFXTZyoWPfQkFXUGs7mVzMtzwtpw22vR+bW+zO2fgFuBg7Q+XWkMSs4X0djHScKwpU4LNobla8VelijIRJuKRWzhDHC7cB1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gmdulv9LWw/vSnrOXJ2C9N4vTh7q0l5k7bNeeg3LBiA=;
 b=XR/oTuawgEJ94bG8wYY65mR+sM7KqxpVrqmOu43YKsspZqDbB4sgR93GVQKDYYoFQ2WJgNemSqOIR4cbTIDIvoYu+mCiT1g4+Xrtl6zxscHSbDehybU99W8qQb3QpXYNy+SvypjYmd0mdOk16yYhvmWy3WZ8D+LPw95ZslYiVeHxug+F2o14s0BYni0mLFoPtbD99rgjxDfTDdSJBh9m4iNgIszq1pbGo0VLtoB4DviTF7JFPK5ZP/cMYQSk19OFXg43Ia1DqCAmUM11gW3IosMxTH6G+rhttkc+kfJ0hRmg/otyXMyCwKrdTPC0n9dM2cIskbgGMeCPJlc7jq+Dlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gmdulv9LWw/vSnrOXJ2C9N4vTh7q0l5k7bNeeg3LBiA=;
 b=iuDY14Af9A3gcrSeG3oF+7FA3RtMmbFuXYp1HQApkRUCKGeaSFOqpvb94oINPU4cll6PVszGSkZWhNAHS4AXYl0RtZnUgHLFVmyhYSyFhCQBsX5gTMSV479greAltrg+SkoEwnpPq5sGWJeKXfeFuFihnlPDH7qwPZtB1yG8KDc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA4PR12MB9788.namprd12.prod.outlook.com (2603:10b6:208:5d5::11)
 by SJ2PR12MB8927.namprd12.prod.outlook.com (2603:10b6:a03:547::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 11:22:39 +0000
Received: from IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db]) by IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db%5]) with mapi id 15.21.0315.011; Wed, 12 Aug 2026
 11:22:39 +0000
Message-ID: <8ef668c5-e66b-4750-9fb9-54d8025a9c90@amd.com>
Date: Wed, 12 Aug 2026 13:22:33 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2] ASoC: xilinx: formatter_pcm: use more devm in probe
To: Mark Brown <broonie@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, linux-sound@vger.kernel.org,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "moderated list:ARM/ZYNQ ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20260811185013.26960-1-rosenp@gmail.com>
 <647a44e4-babe-4858-84de-ad26b6711ba2@amd.com>
 <c22c308d-ce38-4327-a9d9-19ea995584e5@sirena.org.uk>
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
In-Reply-To: <c22c308d-ce38-4327-a9d9-19ea995584e5@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR14CA0024.namprd14.prod.outlook.com
 (2603:10b6:610:60::34) To IA4PR12MB9788.namprd12.prod.outlook.com
 (2603:10b6:208:5d5::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR12MB9788:EE_|SJ2PR12MB8927:EE_
X-MS-Office365-Filtering-Correlation-Id: 336d954c-13e4-42db-96b8-08def86404a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	JwGEmf5Lc+XwCr2iOgxVystjqJUFLqicMoYl17T810N4ZcTYM3SNYY/hwvflael6NgsonmqIhAFujZIIF/AKSqG6XDHqvnOeE9MB7zueEkTVqQPtS4xnfzRElRK3eOn6RE30VJKuVBgaNZabwKuHmpK279qI4F0oogqRS7a6oXAw1JQiD85MEcStQOMltMAcX5cYdq8su7p/dEloKaPMePqNzZ1hJ6ozwHuEsf8QjEbKhjhEeEfXasFJHK9iMkeYZF+hTXgIIuDd1OxNqI7ix2vfQ+iulSiUH3t15i24/n/tMEfHCJikJ5bSUs3whw3AFRBETzBYBvHGUXkNnWvMfHFTktSRmN93mJRFlZKf2X7qqtZFuVmOqGmHgjSoYvcxo2+508DPgsz9Suf8cxBRO7HZ/UlScJikpGsNJ59kUHanDh3F4TbLa31lyxQ89ijHEHfirSlIHYcJRsqBJYcHx3av5xB202SZhzUIePAct6VvH4UlUWfF6+znm1ThdbIfmxSfVEn20HM0YRM6POYnnEs47rcG12MWD4gnA0/ZK+RjZaiIDw7C9uAT3GrQDe/5NugxrM5atgXg9VUGwlk85HgI9/JX6GoaCQToCt2FCH4MqDFKZYcrE3n6kQRKB0nzbayVKXy+Zcd45homHCQLyjDokr9c3caI1dsRSAYCuO0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR12MB9788.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bC9tK2ZqNCtVVHJQelRlbU1FODhRekJrUXAvNjFhR2NYK1E4U3V2OURaRjZ2?=
 =?utf-8?B?QUtoelJCM2tabXJoZnBONlhaS3FTZDQ4bXV1Z0JRZ21lMEtFbjZiTnFhMzBt?=
 =?utf-8?B?bmkzQlkrRFRwT2VVTytIY0RGNWdjRGk1MUk5SjRCa2J4VzhBUG9kTnNGY0tZ?=
 =?utf-8?B?MHhlS2pZT3NkUDhOMWw4WWhWUVlaSDFYUW15YWRJZnNaWm5heE0wOWZzWUxl?=
 =?utf-8?B?MWRadjVNS0U3NDh5Nk9tTFk3Ty80c0JkaTVoSzJRTkRhUEl0WGZKNDRjVUVI?=
 =?utf-8?B?bkthYTFKYjFmQWpnS3g2aExxVnNwS25aS0lQTGkyVXZNeVZSMVg1dUdTZHZS?=
 =?utf-8?B?VjJDTm1zMVhXMS8zd2VJVHNsYyt6WnY5Y2ozZmdzVEFvRFVEYnZ4N1hIaVY2?=
 =?utf-8?B?eVJYdFZZTGtISkxlY3hEMDg2L2MvMmxhdVFuLzFLa1BvR2RKcTZJUVdpb2oy?=
 =?utf-8?B?TVJvaUZHdUgyN0dZdVl3d0dQNkY3ampXZGFZelZHNkVHNVAxeFlpelFxSEtP?=
 =?utf-8?B?dldMRTRNeDNUWjIrU2ZEbE9UYWhtL2dodmlZYkhTMWRoOTZEZlVwSDFJQ0N6?=
 =?utf-8?B?elJ2NzVIY2h4eHJueWpmVXVyQWJuMmFpeTFLQW4rcVJHT05wUXNoeVV6U2Q3?=
 =?utf-8?B?QlpTV3pWbG5PNS9zclFHMTB6Z0sxQmJibjlhTis2cnY2eHczRlErQnRNeGRq?=
 =?utf-8?B?VzV4aTVxWnB4NVE1aWlOQnJFb2xvOFIrUFdGSjJIcTVWMEhIN0EvSzhmWmgy?=
 =?utf-8?B?TVM5NXNRQ1lIZUVYL3dDMHVPbXFhZEc2NEg2QW0wQTBJOUhjVU9tcGtNdk5u?=
 =?utf-8?B?QzdacW8vQkprbnRuWm5RZmljNXNYbXpEOTFZWTdXeUdVQXdkcTYwMytLVkdh?=
 =?utf-8?B?NWJoR20xSEVSRFBUWjNNZ0tQTDNGOE81bTdRWStHbVg2S0tCQTVkc3o2TlRq?=
 =?utf-8?B?WlEvdGNBajJ6MU5tZVUybkFxZG5NMExQZFhQVmZNekwrMEh3UjVYRXVMSGow?=
 =?utf-8?B?aXJGTnl3WXBoUDliK2U0KzFMTjV3UkJ4T1RmS0VhcExrN0RyUTN2bnNUbWxy?=
 =?utf-8?B?TFhlaFVBR0ZEcngyVDE2dXV1Wk5FRlZsK0I2LzNDSkErcWQvam9HSmFaUVJY?=
 =?utf-8?B?UFZKVmYvVlkvb2Q5dy9DZm5Bc3R5ellBSW9XNHZaTzBoV2V5MU9DcXc1OU1a?=
 =?utf-8?B?bWl6b3dvZU55TFVZS3hxM0RqYUo2bTRRelkzUEtlemp3cXY1d3pvREV2VEVF?=
 =?utf-8?B?R2F4QTlhbEFtelhkVG1wcHBmSDVJVE1XT0YvUk1zcE9NN1FwWXlPWTUrekNB?=
 =?utf-8?B?eTlHUG9jcDdLMUdOTlJzdWoxd1YyNTg3VXZkV243OHlINmZmSTh4dldpbXVG?=
 =?utf-8?B?dXZLQ2ZIZVFtdFN0ZnQ0K3p4MnNoc0piOWdwZlZlYVR6YTdYWVNmQllHY1Y2?=
 =?utf-8?B?eGxxWEFJWkRhVzZHZ0pJL3lIY2MrUTNIZWdFcEw2MFZwUjNYVmdXNVJCSFpD?=
 =?utf-8?B?eVFGREZpTnA3S2hoUWJQcVU1bjlYMUc1U29rMEZ5MFIrSGhKTml4STNVcjBz?=
 =?utf-8?B?Mm9JUGlBVlU0czQ5cFhlc2Z0L3ptT0dVYXg0YTVJa2NPbG1HaWpEeXE0bVU5?=
 =?utf-8?B?cktOMUdzWi9jZXMvTGxmTzVSazhXTEdHTVpMSTZ3OS9MTllDZi9Yd1JYU3R0?=
 =?utf-8?B?TVBHTDU5S0s3OHVpMytYT0FzdW14T1QxRW02czR5MXVBVlp6NjZ1Zkc1Z2Uw?=
 =?utf-8?B?Y3NPYnlIWDB2aWlhSk16bE1tSTlmWnE3MjlTWG9zN2poRlZJTFYxaldoVkh5?=
 =?utf-8?B?eDBldnU1ZXl6bU82aVlidm80Zk5nZUVqczhJaTFOZUdtTkM5aFdPMTFwb0xY?=
 =?utf-8?B?Q2F5V2VOTWFXZU5VVjdxbzR5eDVnRzMwM20zU3gvazJWL29WVnZLdzlMa0lo?=
 =?utf-8?B?dXJsUUxtSUNKZ0ZMNkVwa2VTU1RNYkRHYnA2T1FiZ0IwYVhiSGwycW5jOHAw?=
 =?utf-8?B?eEN3N1grU2g5bGFPdGpGdXdiMHVYWkduUGgydkRoSXhwUlduZTBKRXdKUUlJ?=
 =?utf-8?B?V0tjeDdPRTdVNlNZSngrc25QYTkxbnIyUnFaL2FXK2UvZ0hNRVNiN3lLTGF5?=
 =?utf-8?B?eWc1QldWcnpkVnltTnZ4RjNzaU9hTVNtK0RhbEtVQ1gzemJORmxxUTJLY3Jn?=
 =?utf-8?B?MXNUbHZtTWJPQ1hBU3B6bTArdTUwODB4bFNKSDBraUtjdXVxMlUza2R6bDVh?=
 =?utf-8?B?ZDlYbGNwSEwyeWpJTTVabEl2SXBac0lvUnhPang5YmxicUtQU1g3Y2VTRFpO?=
 =?utf-8?B?UTkydyswVjBBZlcyenhVbUJjYzVCYTZ1R2Z2ck1sQXRRUXk1azNPQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 336d954c-13e4-42db-96b8-08def86404a5
X-MS-Exchange-CrossTenant-AuthSource: IA4PR12MB9788.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 11:22:39.3479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2UDBJo9U4mAlmH62dH9f/d/bUBr3ncEMu9vkqX+GaChx85mDt5APk6WgTGCIbdkK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8927

Hi Mark.

On 8/12/26 12:16, Mark Brown wrote:
> On Wed, Aug 12, 2026 at 07:58:23AM +0200, Michal Simek wrote:
>>
>>
>> On 8/11/26 20:50, Rosen Penev wrote:
>>> Use devm_clk_get_enabled() to let the clock be enabled automatically
>>> and cleaned up on unbind, dropping the manual clk_prepare_enable() and
>>> clk_disable_unprepare() calls in probe and remove. As a result, move the
>>> clk struct member into probe, which is the only place it's used.
> 
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.

Do you mean patch content in this case?

Thanks,
Michal
