Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011070.outbound.protection.outlook.com [52.101.57.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C79D42A82;
	Mon, 16 Mar 2026 02:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628240; cv=fail; b=WwPORiV/oX/1/kFpobdro0XlKFIFgqLKTofp1g3O/+8J4DMXZdFUKwn4GzE7mRkZOlAa5+Dt1GEbm68/vy6YWj9w7a9IJo84loWsC92A5z7UM+yNCll0/uAXcvjix8rXmQLeMuB97Ev8I+AzvleC/d3LeJFg3y65MDvX1qVMiXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628240; c=relaxed/simple;
	bh=sXpaUD9WyTmRiOU2bU9NtCryskfDFNzKn8BeUp3ECHQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=bMnIowuRIplD2Y2PhSL3dIbUfkK1NbmhlXkRjcjxT9BGzdElWfv/ICtywJEa+LjJYecdTzvzNYd7VH+DpJviuv78Y/2IAzNJXAixb40Hl+6rxIUaxrFeJq2i5RNLF0NyYLBG2vHPVFsIFFyLlkDhPaKhyhowZr/W1iBj66llNxI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=u0Awm6ZH; arc=fail smtp.client-ip=52.101.57.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="u0Awm6ZH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRSFZkbFiHgOQvrUIWH2d593z33kQOK8lYn3h+GHh6vMxhA3j9TLtFWm6jBqZAlK0i9AXE1vVyfa5ktTqqmJxTPWy6dIx4jfOUwerm8uyRgpt1S4TLzJKWpRf8mC28ePwFKEmLPFZdKeiBqM0lS2S2GzfdtxZ+7jolQA8EDfNLRKRHSww855OpaIEFdDeRXE/Flj1bEF+OP1dTXeX0ZLvcUMaTLqOOH5D1s7N9QLzsFZozj6ztnzCCXBp7c2xh4mCbhMcsHMIZrSl3NpD7MF8KOHHmtbutTSWG3iDq6X4HwvFt7tgA4ZegJV7pEJEakJTPqrlwgY184q/aRdyYW5UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gbCmGjf/EshlBW3JYX7v0ED9f/vVs+glp1jcYTeBX6o=;
 b=e1HrdDXYm8S5j1hQfJcRFTIWk/+rcgU9I/Zg/CyKH6REwr5d86tPoUiWCRtb0kQLHyQq1UNc15SDru/MBKNbJ9uINzhZbgxp8U9ZjurdweOHV2X7jCapSQXmyemFs9i50vQY6nVvURdTVHF+TasD6WwAkTXTqJhhReFiCdcpcMQXumoAox18kzAYyzN0euBByxwiD5r+QcABF0IMUoHDo/UjRBzZi9wXjCStqPZY5uTqQmMb7rP2YN5Tz2OO3HHz9L5crOOHkLIt0bvyPxGxOIJVL8ee3rJK6BxYdAp347+lesL6NSVrzdy6y3pyrC7RhNTEoJI5dKu7cyqMx0SoUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gbCmGjf/EshlBW3JYX7v0ED9f/vVs+glp1jcYTeBX6o=;
 b=u0Awm6ZH403hMQROCaq5R0jz2EroA76DRGVMoBUeF6pr2b0Etk5B76bYoIy+qA5etHKRM06CxoZ7aL2zggwbzY4TaKZslRPNlEX0FupRFmmHgtXqzT4UmwQyaKvddZvXyq9Xlz+Cl5Vvj9RQbsRpNEnXkPf6WvwT/dhkb4un9no=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by SJ2PR12MB8158.namprd12.prod.outlook.com (2603:10b6:a03:4f7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Mon, 16 Mar
 2026 02:30:34 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9723.008; Mon, 16 Mar 2026
 02:30:34 +0000
Message-ID: <d25102bc-476b-49b6-9c5f-25f0c6277888@amd.com>
Date: Sun, 15 Mar 2026 21:30:31 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: amd: acp: add ASUS HN7306EA quirk for legacy
 SDW machine
To: Mark Brown <broonie@kernel.org>, Eric Naim <dnaim@cachyos.org>
Cc: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, hasunpark@gmail.com,
 linux-sound@vger.kernel.org, venkataprasad.potturu@amd.com,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
 linux-kernel@vger.kernel.org, "Gong, Richard" <Richard.Gong@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>
References: <20260308151654.29059-1-hasunpark@gmail.com>
 <20260308151654.29059-4-hasunpark@gmail.com>
 <53a03615-7a5c-4f1d-88f7-1e6554092946@amd.com>
 <b7c72feb-189f-47d9-aa1d-88e2a223b4af@sirena.org.uk>
 <26a37f81-9c09-4691-9765-66da29dec3b5@amd.com>
 <a7e7e79d-c839-4a76-8a2a-f3422d2cc089@amd.com>
 <7790d1b9-5152-495e-85f2-3b1068435d13@sirena.org.uk>
 <0b451f26-fea6-4a4c-b986-228de98e566b@cachyos.org>
 <abdGjyMVd37aNqyL@sirena.co.uk>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <abdGjyMVd37aNqyL@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR12CA0002.namprd12.prod.outlook.com
 (2603:10b6:610:57::12) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|SJ2PR12MB8158:EE_
X-MS-Office365-Filtering-Correlation-Id: 949596b5-2902-4d31-eeaa-08de83040023
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AZYB3Bi82bhTrGSyc7BX2Ephf6TkMjhA/GmX608gfb/Lrq4/zhPH1qK4zXww26qyCqT5upExis7XIIZYMAsnl8ZB+PBsmOj7h5NUrlHGAR3Me/XbxGB6I0iu76scGnrIlsnLX7c4BOMZr+pr+pt2+gmsS+LVHxxT+BOHFXg4fPLwH09n+vbxTKzjde3OfPo09pF5GQySIhRHpDtr7B2ZCX73fy1NxOYnhOcWdHiHn2+1BKvBV/Z32HebBt/yMPz5uLd/x0hes0t8cOklQwHQs4yvPZPfH36D434zl4zat48QR9MZ776TbcX91aGDLOonoI1Dk/YEJIWH+d9RzGHQCwcV4/xYYlCGJT79a2dwpj3U8b9D/OiDw2hiadt+Mnhujbt6v4+/RPbY5WmZSg931HOgIU45NpNOcGZtqAgPGuJ8fAuUahxOUsQm+0itvEhCTabzI6zog/3RM2EZbWwZrPh3fR9ySCHt2FmySJ+e3IEG2PEjFM8E78XmdfykcZQtbMHhqQwwxw0Tev3k1WKFsOynjoqKlFmtqNfGhN+f1wsyIHrI9WKhb+bHRxjB14ZCWkVEWjyl/dY6dt0DJy79Vf1FEUul8xEazPwbS9AACUToUrhmSPHRFVQOn3pBafzAZHtrQQNRHFWXSQ4TrhLejkx9hvzfTOqUz8ZNKOrg8SG0lFJMlfGfaTKobChHIGB1KdHMhX4M/F3NDvPIqf4/c2EGRAoaJbTuo7LQETo/86I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjhST0xpQUVsbXhzajlUWmRZU2RyT1M3RDAyMTl5VjFTajRsOEt1K0s4UmNY?=
 =?utf-8?B?WHJiZVhodHlRMGhGMGtYVGg0VEtMTHV4WTRXZnpVTW42WmVrbWdlRzRuTnZn?=
 =?utf-8?B?T0JDUlBYWXIxRG1DZG1GLy9QRWlXN1FkWmxPWkJsL3BQRGh5aHlFV0hsOFp6?=
 =?utf-8?B?ZHlBSjhHd1pGQnk1VCtVZURmMDVScUpuZTU5a3p0dFV6ODFLYW14R2JnSi9j?=
 =?utf-8?B?QTBjeVZLbGllRFVZdzJ3SjVDQnllcUw1OXVta1k4K2hrTW1CclZYNXI2VDli?=
 =?utf-8?B?VlpRUVY0anBiUzcwZEczbUJSOGNvMGZhbS9tYTBBSDU2MlJmQkNuWVBpa1NH?=
 =?utf-8?B?SVFQZ2l1MjJzclprYkxyOGJScXZ2dXMwS09aemZ6VURrempWTGkzS1BpbmI1?=
 =?utf-8?B?dEkvdm94Qmx5TXZ6N1ZhMUdUZElXa1NmbVJ2Q0VWUTdzRW94RVdlbys2T2ZM?=
 =?utf-8?B?bmh3N0VYYVpRMnByaVlXRC83L1FtaUxsZ2FkczZyeG96QVJ3MnF5Z2lnVjFU?=
 =?utf-8?B?YTROVjFTZkl4WEROQmNrUHJkWS9LZUpGYlhWZ3M2V2pKMVFsc1ZRaTB0NVN2?=
 =?utf-8?B?RHI5dDluS2FaZHRIeWptT0hwak1JS3hoeE9GcTVMcjJBaGMzQ3hGbG9CK3hE?=
 =?utf-8?B?YkZzdlBqNVFDVG5RTHN4a1N5QjdvVldMNGlWeCtzMlhKQlpuMEx4bEdIV0Fu?=
 =?utf-8?B?dkZCS3RYSExub1FmQnJNWjZuQ0xSbXZuVDlFYmVxb3d5NHowdHBkUFU5L0lN?=
 =?utf-8?B?VTRpZmh5cDRRVkVydkZibkRWSHNjdHdwTzhwM0NRajRmL0RZbzAydktnWkEw?=
 =?utf-8?B?RUtzRHkvS3VqSDd3cVlNWjB4ckV2aUlUSzM1UDJXU0huM0ZUWm8zZmZGcXVo?=
 =?utf-8?B?dHk0Q2tqNDZvY0tUa0dsNk9mMWFlRzF2dGc3ZDJvdmxXUVlkdGlIQSttZDB6?=
 =?utf-8?B?N3F0cDI5aXJxdFY5T3RwVld0cEo1cjRSRU04U3dydzd4TzEyOFNjd3BSTnJN?=
 =?utf-8?B?QmhLKzJyVGw5c2dmV2lxaWhTWDBwaGJzeEs1cjhJM2FNdUgyQzhMMTZtZUtG?=
 =?utf-8?B?eVh3YXBJUDNkZUtJL2xDNDV0c0FBVkJ4ZTExZStWZnYvREEzNlNnY2Jhdjln?=
 =?utf-8?B?VU1ISHRNQ0FpS2x1NUVJa0ZkOVNLUjQ0VmJzSUUzZk1BZkFqb0VRb3N1YUVI?=
 =?utf-8?B?S04vN3gzeWFoOCtFOEtQcXZQL2xqM2ZvdEFIcnRrTm9CdG8rS3hhYm1IRmpD?=
 =?utf-8?B?M0tIb2JIREF4blRCY1pZZjlJOStFQXpITHB6QmwyNEZRZWVqVDBUOGdkbEFi?=
 =?utf-8?B?bkRwaWp4Sm5yNzJvVFMwTXFvY2k5N3dMeXFQSFVsN056eGE4dnRrVHZUcmlD?=
 =?utf-8?B?NmxpVEtUZEZnRlZXdmFYTHRiQjZKczRaU0VJRldwY1ZRVTZMVHZYbmNyU3lD?=
 =?utf-8?B?Uk42VHMxckFLdmh4QVEyZUpUYTI3RFhSbkV2YXZpdkJVcW9WTWFCSm5XWGdq?=
 =?utf-8?B?ekhNV3o4aUJQN1ZPOUhHMllZNjJxV0dqaVlYZ0pMUkQzeWFUWUZpVVgraCtV?=
 =?utf-8?B?QVJlbnEvc0JqK3htTEpFc3ExYUx4YkFTM0tNVGFpaUUzWEtCWS9heHlOcm9u?=
 =?utf-8?B?L0JocnpnVHM0dGpUNVZWc3NqMlhncVNLMG1ybjdPb0FIVXZGb1pWMkNZb2oz?=
 =?utf-8?B?NXNqOFo4bHdoM1pwby8zZ2Q0VHkyMGl0MURaRlVwN3dyRVpkR1FTZWdPYnNK?=
 =?utf-8?B?ZzNkV1ZpYWkvaklhdHAxRDdXQWRJVXNHSUlCbjdlZVJoTWVid2xvYlZWM2U4?=
 =?utf-8?B?MCtRMVNrclIzV0NHSW8vR1NpWHVmajRob3lydHRmbGVaeEpJUmQveWlMMWMw?=
 =?utf-8?B?a3B4R0ZOaVpXdmZlM2NwZWEvcmZtTFo3TWlXREdYM2VSWndkTUhPUEw3M2xI?=
 =?utf-8?B?R25IR1FWZldKbTdOUC9FUHlFbll6R2kyNTBSbW9mUTZ4VVEvU2k5UDZSaUhS?=
 =?utf-8?B?d1BCQ0FXNEJ3bk5wOG1uVURaamtFRStrUG14Zk9SV1hXdlZUWUhWT0tDT1pD?=
 =?utf-8?B?aEF0SGNpcHpFZnhva25sZkd5aDBlZkVvaFhZU29JZ1lSRkw0V3NBdGtCOEhC?=
 =?utf-8?B?dzFJcE9hYVgxSTV3eUZMZjRIenNsUG1CUkVieElrYmgra1NSajVUU1QrSE9X?=
 =?utf-8?B?WExmVFd4cXNjQWZyc0NwMVdoWXRFZDZFbWNjWmxQUEpJcTA2azdEdWQxMjlM?=
 =?utf-8?B?OW96RVpJK0JzRWNRbFV1RnN2TkEvZkk3aTNURmI4RFY3LzJFQ0UvMVhkdS8x?=
 =?utf-8?B?N1dtVDFOeVdpZ2VBQ3dXaldrM3VqQXQwbllCaDVFdXpmTFN1KzFDUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 949596b5-2902-4d31-eeaa-08de83040023
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 02:30:34.0356
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyvGwVgotN0qzkna5s5DkRc8zft407FtM37M2aQFE5QZ4Hx6I/62hdNvF/kFWiRzVY2U3flk5Alvr8m5YWbALg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8158



On 3/15/2026 6:53 PM, Mark Brown wrote:
> On Sun, Mar 15, 2026 at 08:20:00PM +0000, Eric Naim wrote:
>> On 3/12/26 9:06 PM, Mark Brown wrote:
>>> On Thu, Mar 12, 2026 at 12:19:48PM +0530, Mukunda,Vijendar wrote:
> 
>>> Thanks for duble checking.  I already sent my PR for this -rc, I'll take
>>> the other two patches once -rc4 is out all being well.
> 
>> should these patches be cc-ed to stable? As it stands, I don't think stable kernels will pick this up.
> 
> Feel free to raise it with the stable people if they don't pick them up.
> I gave up on tagging things since their automated selection of patches
> picks up vastly more than I would ever select.

Eric,

Hold horses on this one.  Vijendar confirmed the hardware design and 
this patch is wrong [1].  Let's not get it out to stable.

https://lore.kernel.org/linux-sound/a7e7e79d-c839-4a76-8a2a-f3422d2cc089@amd.com/ 
[1]
