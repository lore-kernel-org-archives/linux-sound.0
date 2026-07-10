Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012054.outbound.protection.outlook.com [40.93.195.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668623B3894;
	Fri, 10 Jul 2026 07:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783668565; cv=fail; b=ThmRbxKMwYnuYwk4BfbFE/STi6Fu7UKcrIoECTu2NHEjT5lS7RGscM83uR2EPW6zcapP0J+gTufxxJeRLgswLYri6I9SVyZX6CSGoKXSbie8n3UKPt0Q5QCd71GLLDjeRMlkWAG9/G1TrH1QluTLb1J6c6+pyz/aUfRT4LUEasU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783668565; c=relaxed/simple;
	bh=Lof2ki77/XaXFH3q7rvF7wnyFH8qtJfDyeoNDo4prYY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=G2ybGIda5FLWRpwdiny/ZR9OVhyg9hGJna1SzQB5+4RVVm1QeqyeF00yDiLcylfmRxDndLbgJhdkOqx8s2UqSQ7YZ8gr8QiD5Hd6o4hOD1t+ZOzHORmhp+jzhT2lM5y2dvDDTqUzO7EK+INlnvj5RYvEwICkbgbMM/IlVTQwoQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=C6nGEcM7; arc=fail smtp.client-ip=40.93.195.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="C6nGEcM7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRUiqnSl16j8dEp/z4dvFJm0PPX6358S5oi2ta7/YFZKm+THl7BZ4sQXI2XNLLvxcu2DaJTpKA3Hw9UWwIW+9KuOS6pJejTLmcqCf35oy0KiwbGY8jE1op8P0O7BKTz+IsjfxEEi8ChO0FYmBIQZzZNbaP9vuup5+Qy0wTAgksUsOzyv9cLYq0bAvY/8fUNbN9u7Yje6nUe6t6fOZAMrt99vleP9kJ87BivWWN5KqEIhXPPe2vuNa9DNtfowyGA/NbTxK8UEUhouqvzkhBWxK7hFA6hwAeC8gwHfwkeBKmFmAIWe1s69AZcINInxL9uptEiaK9lb0S+Qtk7hxAll7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+FvoYg7AeNABh6yFk7H2Ukab/Hk6psGtZoNKOSnJYM=;
 b=kgiaj9OvjNCKbf8QgB3jWDw1EJWCHjtQj2RCUHg+d7EDsS3D77BlmMQIDOqunVOgV5QXfjDk9KNGJ48o6IxtMVpD5g0Py3gjZpPrKEKyccO051Vsxz/jqRTlGC3/HAMmvDdDqUxdiofYl4AzkIkZdh4U7zmXCKUuN4bAsN/v6f0c5arQlFeYBcxguCU/ILhsXohFQjhsWHQy1CmHmNPGJ9zPsq85Y4ETKCHlUqj1OP4EIDSg6+blYkVZvdrK931PO2WfEVN5ltioZu5naXYutb71oCW1YBUulpBxtqzsYMnS0Jbs5upUz8bavGZWjNF8Avr0aNudQWYNyZvFmUTjvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+FvoYg7AeNABh6yFk7H2Ukab/Hk6psGtZoNKOSnJYM=;
 b=C6nGEcM77kBeM3bCQJufoaDdjDwYOpF5EqPC3FRTFaKtgQKuX8hurttdAlAs3LL3vRobSzNWBQyqhs891fKkVvENQxpqEndSVsoNyPQclVs3HmBHt8KtiXanl0D3Zx+bbndCFg/6jBq9p7UpgUHBW8YjWkyHxkPSFl3TWRiRJdQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA4PR12MB9788.namprd12.prod.outlook.com (2603:10b6:208:5d5::11)
 by SA5PPFD8C5D7E64.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 10 Jul
 2026 07:29:20 +0000
Received: from IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db]) by IA4PR12MB9788.namprd12.prod.outlook.com
 ([fe80::aac5:ae06:3bf1:36db%5]) with mapi id 15.21.0181.014; Fri, 10 Jul 2026
 07:29:18 +0000
Message-ID: <5d058564-5546-4e48-99eb-fc44b07c733b@amd.com>
Date: Fri, 10 Jul 2026 09:29:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: xilinx: xlnx_i2s: Use dev_err_probe() and drop
 redundant error handling
To: phucduc.bui@gmail.com, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260710050223.14266-1-phucduc.bui@gmail.com>
 <20260710050223.14266-2-phucduc.bui@gmail.com>
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
In-Reply-To: <20260710050223.14266-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0185.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::10) To IA4PR12MB9788.namprd12.prod.outlook.com
 (2603:10b6:208:5d5::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA4PR12MB9788:EE_|SA5PPFD8C5D7E64:EE_
X-MS-Office365-Filtering-Correlation-Id: 04288fac-a06e-4d9d-c428-08dede54f413
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|4143699003|11063799006|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info:
	WPahL+g2YB2oZyyeRQdM2vESIQkD+lVH92WwMP60fU+7RRY1KgJP+wtzCjDSzsLe3ReV6o94bB0nNM2iUdxmTT+/n9Pn4AToAmmOWs7alf/m2PEvpXgWmO490dBTlcIMwRAnSQbOdBUDnAP4GFT5o5dhXZnjskQ8Eg8CGCOWpSaO/9peA38qeljj7W0UbIPg5P6C3PnIAXkR0jyIGT+jeeUXoWNfol7bEB4/829akSRNEq/i9IEV/JkYuSSRUR9CKmZSAyMzUFatw/UH5zPqcizixXeP+IDzLMczOD2Pu4I78ojv+w/FjLTkpA1mE55hXGLhvhpa37nDQEfOp4yt2/UfoTCQcan+AFX9Fo5VIjuY0jTx9PNTNBtk6WajI4R0ITc2RDSD7452Y0UdJ6vDEqwF97H6i5zRgPHHI4jGWxVGUr7gDkl6HuHBM9E0M1Fsv+WhFI7ZSVB4u66PPJSJKnnRMaBGtY4WMwT7lLRgFxy2x0/aV6WEDnZC+ko4s0sQ+aNanhYj3KRh43rogd2ldrk+M8aaHf0e932K7+U50On8uUhw8HXNNt0uerz5X/HTirBbnZdXTJvtsNBu5QceQNn4yRFNE0bSfACNrBTqXmdsjuUGMo58fCTt0dCWDzfWNKGKDrNqIj1GpIzlE4OUkiDCqcH7svlKVL3jfygwXHI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA4PR12MB9788.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(4143699003)(11063799006)(6133799003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WUE5SnQwMzdXWVRPSlNpVHlzdkNsYmVqdlNtTis5QnNONzFqeFpVd05YQktR?=
 =?utf-8?B?L3k4ejg1Syt3WUJFM0IyN3NzQUJEcVRoUjBrTGk5NGhwRTc1bERZditHVGxh?=
 =?utf-8?B?Tmlmdm9BekxUL2w4MXI3bHhWTFRRVE1KNnNNdHZ5ZDgyYVhMRVUyZGV3WlVL?=
 =?utf-8?B?MkhvcWVOTVNvK0c3ZU1ia3BucVBsdjkwWjdIZWxnWU8xV1FreU81V0taa1FM?=
 =?utf-8?B?ZE1YRi9Bc1NaRkxyblJmWXN6UHNFWWQxMkowVHo1TjBsRlZCekVQMzBLOEVt?=
 =?utf-8?B?WkdJS1BsRDhMWHdsUmpESG1ITWNud3hyTmIreTF4dGoydHRUMG9TTzlMUy95?=
 =?utf-8?B?YVdRSDNHWExCZEMrMVVtc0swYnR2Nk5RZ3NDWFltZXg5UUtyd2NqWXN1QjlN?=
 =?utf-8?B?VGJmWUdsNGpnUGpoSEsrcnJPNG9XQkJ4U1BRWEhRbzRvV3RtSmxpb3hJWkM5?=
 =?utf-8?B?VWJxbDVMckxIWURxMkxPZlVncndGR3VuN1NzdUNhRUphaEdxZVhhd092Zm1W?=
 =?utf-8?B?ZWxEemIxYkVad1J0Znc2cHlpa2NrYnJ5NWQxUnpQVDVkU2IyN3VlNmc5UWJL?=
 =?utf-8?B?RStsQzNVK3pNSWxMT0JhQWdnN0laOFFyaUErVmlzTndGdWxSNTNSbyt2VDd4?=
 =?utf-8?B?NmpxOVdiYmRkY09UVEQvQTNoYjlNbXVEaU5pTERKVUorSDZweG9WM2R1Z295?=
 =?utf-8?B?NVRaL2FjeFU5a01acE42UjdYTjJ4VTR2UTdnTUJtbU5jUUZqVmdJVkd5bW5r?=
 =?utf-8?B?QnJwSy9Hd3AvQU1oUHlkMDIzZVNYWk42M2VpOUZrUk1naXZ5OEpIeEFIYjJo?=
 =?utf-8?B?RTU2ZU5GKzRUVkRoSklLV08wYmNIQzh6dUd5Vk9UdjlaUGhNYk5FdW4yS3Zt?=
 =?utf-8?B?T09icXZTazVYZTFLZUV5T0M0eUpGR1grbElHMlZaVGZtdXhRazhwdkt3Y2E4?=
 =?utf-8?B?V1padjNIOG1BeWFqYmtkaXNJUWZnb2ZZYlNpTWhXWXZKMEg3M3JpUWJuWk15?=
 =?utf-8?B?Rkp3ZFJsTDF6M3hPS1hpczN6bldOaGdjekY0V0dWZGttY0ZnQnNobUZMQmN3?=
 =?utf-8?B?QXYxbU9SMDVJc2l0ZE9ocmxEcHI0VmpXRmd2L0c3ZGdLK3Vub2JTWnI1NmJI?=
 =?utf-8?B?d3RsZUJLWU1GZXBtSDdyYVNFTHQyZWRMQWhwYkhPci83YWJZUU9nU0Z1bTQz?=
 =?utf-8?B?dU53Q3E1WFFXSi8rN2wxaEhZdnhlUllGdjJXN3IxdnU5MXl2WDU4QTRJYk1k?=
 =?utf-8?B?SUZxbEJLZ1RmSzhLeDdSaXMxOFpyVUtmc1lKUW44NVNHMVZobklwS1BiaURC?=
 =?utf-8?B?N0FPa3FUaGhXYk5UbXUzSEE4UE9NM0xwb2Jyd3lCeXR5aVhMOG1Nd3gwODRB?=
 =?utf-8?B?VCt1TC9mRXlra0VOZ3k1Vk1ya1p1TGw4ZzRtN25yUnBoMEUrOFltdVN3Rjhk?=
 =?utf-8?B?djU0R0luSGtZNU1nRnFtSmxobWJ0WkRlMDlFU3NIVU1va3ZMNXB3NVhSenl6?=
 =?utf-8?B?L3krbnh1Kzg2ZVRWeEdRb21PZjlaM1FuYmhaRm9PZGRwYzBiVE1zNGcyQXhK?=
 =?utf-8?B?bWlzQ2VrcnlFc0hHNUJkQjZ4WXo2RjA5WUZJaFJYY2xnNDNnNEdnSk8zQmlW?=
 =?utf-8?B?alVqVDBLeWx1T1pFY1d1NWFpdndxSzUyZSsxb0RMNlZVYitJblpyZTMvUHps?=
 =?utf-8?B?dldGQk04ZE9jV1BHcDhzQVF2YzN2UW1Gc1N0YUliVWtGZm16TXpsZkxUNGZH?=
 =?utf-8?B?TTc3T0I2TW9BUm02MnIvaFUrMWZEZlBhVi9CQk5vc1RqRm14M2tXTFd2MlFk?=
 =?utf-8?B?aUg0K0dlRXBTNHFyd2FhTGhXQnIxRkhycXRiTWtaMlJPSXhnSnpWYnJwSEhR?=
 =?utf-8?B?dHEzY1ErZWpTdCs5cjJWSkRhdFdrd2Y5M2UxRVRMTktUSlV0aEovZjNRWTJr?=
 =?utf-8?B?bUF0cDA2cUthQmV6aEw4YStJV3JPQkhXMGN0dnhyeUJ0WThQejltNGYwU2x6?=
 =?utf-8?B?ZmZpWnJHWS9GZVJPK3VWNUFMcGFSSEFRY1lXbWhrM1RmV0xiTEtKZFVHNDVm?=
 =?utf-8?B?L3lwV1M5K0JKSnBkL2ZiTUtPQmo3bjRLSzhNM0xRM2dPYVltS1NwdjNqVVoz?=
 =?utf-8?B?bzBLdUdxd0NIQWp5MXV2d0RrcGxOYXYyLzlSSStQZit4dU1UTGE5VjVmWWFU?=
 =?utf-8?B?RjZDdzF4dHVZcmJmK2J1MW1oZ1d3WXhSSzBQc3NqN1F4YzhDZnNNTHdCd1c0?=
 =?utf-8?B?MStIODM0TitZbENiVm9iUmRCdXlTU0tOcksxMVdYWU1rdU4wTzlhQXVTUVF1?=
 =?utf-8?B?NFBoaG9uRTlCS0FYVHV2TDNJQWF6c0tteU1Dd2toUGdZTGx1cXUwZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04288fac-a06e-4d9d-c428-08dede54f413
X-MS-Exchange-CrossTenant-AuthSource: IA4PR12MB9788.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 07:29:18.8083
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xEja+Xm1o4eU+zg2+eHkNOz0O7pAOqW/vBjKh/inMMSy5pT6/4cwM184jv4KqC7
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
>   sound/soc/xilinx/xlnx_i2s.c | 18 +++++++-----------
>   1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
> index ca915a001ad5..0676da122edd 100644
> --- a/sound/soc/xilinx/xlnx_i2s.c
> +++ b/sound/soc/xilinx/xlnx_i2s.c
> @@ -185,17 +185,15 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
>   		return PTR_ERR(drv_data->base);
>   
>   	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
> -	if (ret < 0) {
> -		dev_err(dev, "cannot get supported channels\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "cannot get supported channels\n");
> +
>   	drv_data->channels *= 2;
>   
>   	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
> -	if (ret < 0) {
> -		dev_err(dev, "cannot get data width\n");
> -		return ret;
> -	}
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "cannot get data width\n");
> +
>   	switch (drv_data->data_width) {
>   	case 16:
>   		format = SNDRV_PCM_FMTBIT_S16_LE;
> @@ -233,10 +231,8 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
>   
>   	ret = devm_snd_soc_register_component(&pdev->dev, &xlnx_i2s_component,
>   					      &drv_data->dai_drv, 1);
> -	if (ret) {
> -		dev_err(&pdev->dev, "i2s component registration failed\n");
> +	if (ret)
>   		return ret;
> -	}
>   
>   	dev_info(&pdev->dev, "%s DAI registered\n", drv_data->dai_drv.name);
>   

Reviewed-by: Michal Simek <michal.simek@amd.com>

Thanks,
Michal
