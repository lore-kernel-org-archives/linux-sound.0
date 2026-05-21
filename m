Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A66E3C3C07;
	Thu, 21 May 2026 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779363479; cv=fail; b=ng3y8qch1Dd7yfIMj81GXSvxXNBm0Q+L7r1kfnG8dM3B0x6wOV8C9E1qhFkgIB8IxHMwSRU1KQnO4exd1L9FVoTrMqqM8TVY8gMBqy25Yob98BI4NwUYXSLaNq56tkjYLfet1No3SxPM5nmZFYrdsoTGYqRU0rASg2OTsyJcMP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779363479; c=relaxed/simple;
	bh=1ZzSF7IsTimzlWJFMOL2V9lSEyzrrlB0a5DCb1ogT0k=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=suWX8vn1XafvG82HNSQHwBF/kphpaupksJda9Nvg/G2DaoK6eMzcmZ/qUCJOk4/YTxo5ux4Ifc72XUmBl52GoTKzkSSwOpDf0ZpjSdGePS79psGSR5P10doaU4v0AEpLvN25oDkWKQ0tnY2GbwUD1qgPlRdg3rB4s2I+4Fm0HXI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Mp7RAbgx; arc=fail smtp.client-ip=52.101.193.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Mp7RAbgx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TNXbTZ/GBDDBwpf33emMiCzLiqKxgLW4pkkEjh2JPg23Q2b9u9AQDy4QBQs82g08VMMpRy0Xw6BdEn41lAHYucF9DXE93yHYCZmteutIPCIr+zi5xNgqmCb5V61Of/HIbqawB7/5t8WbPuXzTuycHxeun+ho/5gZnEVghBY49c01WFv8x7MwJozT+O3eM1ZI93dF9/eN896P+gZqdQSqTF76llA6MXtmPh15W71XEenTyk7zKsxA3tXvf9SjDY+TGhLSvew1E4gBEq8/LA+crAYVyFq4H9UyHAF1Rmpma33q1Px4AEz11h0e4Kr++wfKZ5D6xkuhi90u35Xo5sox9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGLZC6dHj1S/MtRernz1Xwi1Vuz/OaQUh+yMwS5eVfo=;
 b=Ta2oWiTowJ5cw0UcPLf0Ouf+8emUxtz6JaSB5Q02k4bXxhzSq7c8yKAgtKX7FqXXabM2KC8HkiPd7I0XXoYe/1SQqoxPMFIzTzdY8O5yKGYRoRFAsx7W3WVBfDNwVadzrqOkRYfDuaPhJ4xAi2vIiP0Z1eallyu+8KgrlY7/5VDo6U2+Hd5nxo6hqWNsCMgq3YriY+U8AOMKCiXtuQErX5g2PDxDdEB/Q/j7RIir9SmAPRd9VBpdvMQWze61/gPTPkPjGUBaz9oCtJG0GNhd+qjBsqUzkjAnj57covqXLRSRaFqXP2Cz5DMP+Q42Tmrysaagn/zn2lpjmn3gh+6vbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lGLZC6dHj1S/MtRernz1Xwi1Vuz/OaQUh+yMwS5eVfo=;
 b=Mp7RAbgx+tEp4a5X/HWMRIwGbFBVAEegjAALjxS0GP51U2zTukqZ7iCYM/Fm3Hm3BmfsjbahQxecxzI66oLLiUaUNsnDuMz3RmRciMEkJXobm2QCnlpExBimlQ8RRQz5PC5ZBdSc1un6Hq+yyJs0wdXR73Y23mTLmE1MhxmbTOk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 BN7PPF0FD1DEA27.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6c8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.21; Thu, 21 May
 2026 11:37:48 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0048.013; Thu, 21 May 2026
 11:37:48 +0000
Message-ID: <786c749a-02f9-4e50-bf9c-62f2674eff4d@amd.com>
Date: Thu, 21 May 2026 17:07:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ASoC: amd: acp7x: add system and runtime PM ops
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, Sunil-kumar.Dommati@amd.com, venkataprasad.potturu@amd.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260507181251.20594-1-Vijendar.Mukunda@amd.com>
 <20260507181251.20594-6-Vijendar.Mukunda@amd.com>
 <905bfeff-ab78-4299-a2a4-45fb8f05e716@amd.com>
 <346949dc-d4f9-420b-b208-65a02c4657a1@sirena.org.uk>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <346949dc-d4f9-420b-b208-65a02c4657a1@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN5PR01CA0021.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25e::16) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|BN7PPF0FD1DEA27:EE_
X-MS-Office365-Filtering-Correlation-Id: f0331fa2-ac74-41ff-fbd4-08deb72d6205
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|4143699003|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	iX47IlkLtZahw/9QCCq4eBfaPci1sH/5mm1iVTUfGD7FmknG7KZWREz4/7rMsbp7hIofs+EXKM5zv2Xo69bd+a2PL0PMoXxMQ0UwC8f62M1kuXUkhww9PjLCJqfFDk5ks6/CCR174JDSHdfgl+BML2tt4yqULsXv/1qoHA2eRKunfKiF2UIp2XJm13Zq5x80f2SgAeJ44gGNQ97dY7sycy8pCh7DwLo6gtmsjt9+Ay0oaylKtsVJVy1S2HFq1r7+u04c1+MgqLg2mYMKjzxsBfKxyJ4xzd121RX2NL2wAVxGdI3zhbaVCldEzvvObIc+RUyFf+0qDvZ7pALNsYbUsM9pkd1pH2VGiCwxz+N/pSDSdC23hFjnSXTllU9rvIpeXO8YTaJZLbLCt19QqBmG0PwojePFt7E5IHfUnagRAF2Q8UG5cY0KjUxZKdTLVJ3yWG3J4CSsiAHrcT7TZDo1IR3RiCcRG/6uSP0TeSIejevaCC8BfIhu6cDJnID2xFXq5nDSe4lLjWU8bxyyn9beNX3JhmG0cS9uiV+0ayr/llDF3JhaDtt+MwteQQrZtO8u6/AMb/9dGhlQlVvZre3joKRhcFV0a5AKQyIIFlkAxO8egOuNskqLWpUsjMYVbIrkoxFLSCXcbp4y6paE9cr75wwNvh3+8DFrbQTMZuMkMUJDX6nIYl1QmEoGnQ7LvoEz
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(4143699003)(18002099003)(22082099003)(56012099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dFdNU3RsKy9BaDB5MzI2ZHVraUUxbWczSExQZWFTWERYUnh2YXVOZnBCaENC?=
 =?utf-8?B?ay9mdmhJek5aWHFTdDJkODRTcVYrTDFUTVd2R0hESHdBRkViL2NUNnB4RHZa?=
 =?utf-8?B?TjE3U2RxYm9ZN3JQWFJubmVRZmthanJUTGxTWUJ2aWo3Y0E3aEk2R08rWW05?=
 =?utf-8?B?REZqWU4reVhqQTBaK3pHRmhKU3dOMUJpZTN0SW01ZVVvV0RrNG1Od2xsSGta?=
 =?utf-8?B?MjdieTdRVjlDUG90bFZzTndIY1BMWWxLSmNUZ2pXNW5uK2ZKZ1lkaVd2Q1NJ?=
 =?utf-8?B?cDFRM1VEdTFQMVFLeUpmSW1oTHRNT21VdlZUOG1xTXRmbFdtWGI5OFA2N0FT?=
 =?utf-8?B?dC9vVk5CYWNGaWQ1YjIrZjkzZFAyeUpjWHVTYTBzR1lidGhTK1JyaVNRdWwx?=
 =?utf-8?B?cUxUYjdPL0ZiWDJaN3NaNDNDWGxscUhZMWgrcWErczdJb0d6NjhxQzVuZEFr?=
 =?utf-8?B?dEk1TzB0NEhvMmhDV1p6SmFwZEFtUWk1NW1rT28yMCtmRzh3Nisvc016aTZn?=
 =?utf-8?B?bmY3WjdvYzRQU2tvQ0FIUXZLd2RHRnVWMUFTbWt0WGs0ZGs5MkYrd25NNFlw?=
 =?utf-8?B?SVVXNXdLRHMyeFE4dG1zUXNmZjE4a2FSN3VWelZ5Z0M3WW9raEVHcU92dkpM?=
 =?utf-8?B?UmVaMG54Q1NMYnFZRnlzUWp5ZTNaVzNhNnN5dW1vSVBjWks2eHJzWjg4L0lJ?=
 =?utf-8?B?YzF1S2xGMGtGc1EzNzlpYzFLbkxnT1B4L212UkkyUitiR3p4S1RQQWFmWGM0?=
 =?utf-8?B?cjhIUkNBeGk2NyttYjlKTEU3NnE3WmhnZTEzemhlOVBzNURvUkFuMnpxcncx?=
 =?utf-8?B?Uk9tcTNTdFgrSzJVYkl0bjlYN2RRaEpKZ0pDcGhHMEQxRGQyQ3Z6L05PWms4?=
 =?utf-8?B?MzRhL2pMYWkzc3J1Sk9PVmFIQnRmVFZTTG5xWkJqK3FKa1RYd0Q2bXo4dCtu?=
 =?utf-8?B?RWZiVlljZ0MwVHJzbWEraVNGWjlpelFuY1l0Smd0WThkM0RqNjkyTVdxZ2RH?=
 =?utf-8?B?ek5vU3lMTGJncHNPSTY2WEEzQWVmekt5ekpxOXhveUdvWHVoNmdrOU1wdi9Z?=
 =?utf-8?B?REtLYnMrd0hSc0s1ajFYZGxXamdtZUVwR2N2S1VTZUhmbk00a3VhY2dFcld3?=
 =?utf-8?B?MmkxcXNLeDJ1YmxFL3Bmb3doWmM5N2N1eHdGanRYZlQrelBGbVkyRTJUUTBH?=
 =?utf-8?B?b0pPbDFsUzZIeGRsbDIxZTZnQ0hvbEZNU0lYV211cDZWL2lYNTJMWFowUG9a?=
 =?utf-8?B?Ui9Da0k5ZGxVNEZaYXE2U0t2bm0wckxVaVBwRThhN3NoTGJ1dDZ4NkV2Y2dV?=
 =?utf-8?B?b2FUaThVSnhBYWk1UjRuNHdhT0t4RU0yenVzc0dJcms5MkJWbEJxYjZ0Vkha?=
 =?utf-8?B?VFRTN1hpOFpSOTd4eVludGE0c0tpZGtwK0QrMEVmVWxrQm40U084VldwZDN0?=
 =?utf-8?B?elVNN0w2RDdEOTcrZ3V0WDZCUnZWczdEcUo1QUJrWmdlZjJPbm1McC9ZSSti?=
 =?utf-8?B?VG83WXQ4MDY2ZTQ3RHlkNnJJUEppOEg4SlpsUGlUZGxhWkNicnpMN2FWVjls?=
 =?utf-8?B?c21YbUtXWXc5dFIyZ2RmdVNqVE9HVGhLWW1RT1pmZENWRjZ2a0JrQ0lLdEdO?=
 =?utf-8?B?UDJaOW1maG4wclpIbTIyZDRMa3RSVTZJMHNyTDFJbG14Tyt1dUNwNUhOWUhH?=
 =?utf-8?B?MVg2Um5KZ1BIeEQyNHNVSkdhbjdrVW9xM2hkT1ovZ2JOZUk1R2h0RXdhNnhH?=
 =?utf-8?B?MFlZR000Z3pJbkFzN3BKMVArQzVINCtjdGlzbU5kM2djM1l2Nlg1bFdhaFJD?=
 =?utf-8?B?ZWFoM1BZT2dNTUZ3bDFDQ1AvdUQrM3FnR3RxdjdwMHExL2VsM2Y2a3VVNFVB?=
 =?utf-8?B?S0craXVjM3RNN2JoU1hESkRGZnFUKzYrZDBqMGJyOXZhNEpBeWtyS2F6aEFU?=
 =?utf-8?B?UlpBLy91a1ZmQjN3aHp0Q2VwNHNIeWY2WUh2enJHNUdQZmxISDhLTTNMdkU4?=
 =?utf-8?B?NHJ1NUduSkw1UVg3SXVXd1JQdTc3c0k5TEtHZ0hhdDdJSUVicnZYSm5QYTlj?=
 =?utf-8?B?MVJXMzNNb0QrMXdpV0tTeDZ3ZUpqSGZCNTlsQXBHTzVKTS81cTBCdXY1L2lM?=
 =?utf-8?B?UUJaOTFwSzhRcFRkWHFFcUdYRDIrdTQyVnk3djNPV3pTU1NaVmVxaGMwcE1Q?=
 =?utf-8?B?QjBNeHBBbHF6Tm5GMzFGUHFibUNHNk9tSERzOERhdytaa2pBT2tEMmhiRlFT?=
 =?utf-8?B?K1VyMS9xdDBZd1Jlb3d3QmNwS0ZNd25ib1BBYThKNnVRR0s3dkJyU2o2K3M1?=
 =?utf-8?B?TlBMaENwTEYzZTNsZmpkY09ielJlbHAzcXQ1SU1yN1dmTTFqcWpUQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0331fa2-ac74-41ff-fbd4-08deb72d6205
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 11:37:48.2681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3R50SYhBCtDSKlhO6CytlRQzfkEVkfewrUU+uMaxieyJtkPGaU3K6JJUHZz0TOLJ2SDtptN8qqOSRROCzL4b+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF0FD1DEA27

On 21/05/26 17:04, Mark Brown wrote:
> On Thu, May 07, 2026 at 02:33:47PM -0500, Mario Limonciello wrote:
>> On 5/7/26 13:11, Vijendar Mukunda wrote:
>>> +static int __maybe_unused snd_acp7x_resume(struct device *dev)
>>> +{
>>> +	struct acp7x_dev_data *adata;
>>> +	int ret;
>>> +
>>> +	adata = dev_get_drvdata(dev);
>>> +	ret = acp_hw_init(adata, dev);
>>> +	if (ret)
>>> +		dev_err(dev, "ACP init failed\n");
>>> +
>>> +	return ret;
>>> +}
>> Both of snd_acp7x_runtime_resume and snd_acp7x_resume look identical. Will
>> there be later code (when machine driver and IO enablement come) that makes
>> them different?
>> If not; then I think you can drop snd_acp7x_runtime_resume().
>> If so; this makes sense to keep separately.
> Not seeing any response to this question from Mario?
Sorry I missed it. Will check and provide reply.
