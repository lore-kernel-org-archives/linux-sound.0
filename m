Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023137.outbound.protection.outlook.com [52.101.127.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3FA42AB4
	for <linux-sound@vger.kernel.org>; Sat, 21 Jun 2025 06:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750485708; cv=fail; b=uFYih64m0Hphm1QGTHROKmCtWELET/6jYhCIZeu9srX+ddD1NFu43+9c8u8gF4u4rX4Q4ujJULc+qhUkSb0Fu92Is08XCmwygf6lgVx8L4f6dAmq6ooOAGa00Ei3kKO52oxfuh3/t4Vmq/mv/APOsTtztLgeqZc9kruU7CpdNWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750485708; c=relaxed/simple;
	bh=etqkI4waPD4/+Qpkgr8qbX8gxPgFO0DtKDrT+9e51Lo=;
	h=From:Date:Subject:Message-Id:To:Cc:MIME-Version:Content-Type; b=WDGDl2lsaM78V23SpnjlfnCjG9oynBIOT4SIaOua7BR7zzsHuBdboxchSZiFvprQ62SgtYG310X6vLRvn2GwkMKg7IKua4g4wlBGG4eecqqnzrEhBXO8iGYrVt9frTj2xv2wFL/NBYqO/fjTxnsyL9UQ7vqKa8UasXxr/ZYT57k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mEw65X6L2hCqLrqdpOytGiNx9/cr3C/1PqbdpsfeeIACRpXM2j4sqcDanGy4f2u+gGFbAvTYOeNK72mnRlMC0aV6rEs1CbW39NGzRFStWRlcmgv2JltcE7BUMyZYjVnYXo5rY7o4ZE64jynAKSPZD72n31ngUyubp3I58PmrQSR9FPox8q3YRWwlJOC3n48WLXVy3xT/3LjtoGXJrawZzt/hbuzPlCt9trL/42JakMnejPOVqmK0x9oVgdcvxIvtkDMHeRH7ZRZuuuu67pi0iEMp+SOR0hzLK5fYTGr9YgdtzHUSzYkv3HZbfOr57PWhvO52PCeiYeDlFy2npNk/+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etqkI4waPD4/+Qpkgr8qbX8gxPgFO0DtKDrT+9e51Lo=;
 b=GQ8yhbAoIKpVvb6Hwq0IkBL6IdGFrNmM3YKdEPrbvpD+Y6cvttz6DJSsFVAzTotTrBxXocIAwrirFYSBMW/zG7lUI7OjG88kpq4E/gATew/45oRnzmfnljWi8Ua6PwANOgtYyX1xhLKMKcAf0vH1s07qonIzo9MtyA9xe/RQrXvsu5VdktIekDJ1RobmPDBW07OfRGW52RTtfULr5A2PqlJHzBjf3BZz44uAyQIaNexRAzoFdX2nzdSXnL+6UmrGHM3vCqZ2kUq2cglEZLWbomGzJzb6XkvUS4jxAr3JTN8vredIEzSzcTpwHeQn2NAzfwV7lodj7iKMwJHNL5rLWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from substrate-int.office.com (2603:1096:604:428::11) by
 OSQPR06MB7975.apcprd06.prod.outlook.com with HTTP via
 TYCP286CA0060.JPNP286.PROD.OUTLOOK.COM; Sat, 21 Jun 2025 06:01:41 +0000
From: Joakim  Zhang <joakim.zhang@cixtech.com>
Date: Sat, 21 Jun 2025 06:01:41 +0000
Subject: Recall: =?utf-8?b?5Zue5aSNOg==?= [PATCH V1 1/4] ALSA: hda: fix
 controller cannot suspend when codec using jackpoll
Message-Id: <R5URSCF9HQU4.G5P1YJ6V72FV2@se1ppf57e05f539>
To: tiwai@suse.de
Cc: perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 chris.chiu@canonical.com, kailang@realtek.com, geans_chen@realsil.com.cn,
 cix-kernel-upstream@cixtech.com
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
X-MS-PublicTrafficType: Email
client-request-id: d22219dc-1922-df09-92a1-3336feb3a5a0
request-id: d22219dc-1922-df09-92a1-3336feb3a5a0
X-MS-TrafficTypeDiagnostic: OSQPR06MB7975:EE_MessageRecallEmail
X-MS-Exchange-RecallReportGenerated: true
X-MS-Exchange-RecallReportCfmGenerated: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UDZ6czIzTkhUU0YvMEJzVmJWZ3RDWXJ4T1UyYlVpVTlUS3BKZDNrN3FFelRR?=
 =?utf-8?B?K0J0MmZ4M0pwN1l6V2lmeEZwM0tVcjRMNC9FbUZYejdzWWVZRk9sVFZPVFI2?=
 =?utf-8?B?UmhXK0dLNDgzeitsVHBFb0tycHozU0FraURVbHFZc3RRMTdxN2N6R0NuenBt?=
 =?utf-8?B?cnpSS01XWDFDMHlKUWc4V1VVMWlLd0NMUzFOUWZEK0FtZEtGZldEdElxTDdE?=
 =?utf-8?B?MDRkaXBvT0w5R0FWRklEbTc5S3J5cFlsRUZwcVdZSjZ6WjhIYk0vc0NjeTA1?=
 =?utf-8?B?RUY1UWRjVkVwb2hib1E4NGxSaGNEc3JMcVg4L1M2TlU3N0M0aFhPVDVPNHBX?=
 =?utf-8?B?M25ac2pGaElJMDEyUFUrdE43NGVMQlhQemtKS0lVQUQwUzRManlCdGZhaG1z?=
 =?utf-8?B?cHowYTA0djRYVk1vc1RVZDRnbWxxSnBHdE1HM1pHUGlrNnhGZ2ptMDZ6NjV6?=
 =?utf-8?B?dDNUY2JMS3Q3Z1hBaW9pMmYzaWVVMXN0Y2w0STd0ZnJUaHVuNGhJaXY1cWVi?=
 =?utf-8?B?MUsrUTZGOUZKdTVRQlh1T3U4eDIvUFVsZWsrTFdobklwaUxLd09ycUtKc29i?=
 =?utf-8?B?RGZKWnlWZ2Q2THVvc1RianZoenJPUDJjS0M2NVVXbWxwV2NWbm13TzJ3OEhT?=
 =?utf-8?B?MHRzRy9HL1JyUExjeXFuZE4yaXFVbFp3MFFTMTFGMlA4RzdKTW1rbnBBcmhU?=
 =?utf-8?B?Z3NrT2FPdkVKWCszTDlBdXdZdUU4YkhIajFmNkZ0U0VzcEZyL1pidXJFeFVz?=
 =?utf-8?B?Z2luNGxuSEJkQmNDYTRqRU9xVmJjK005aGNuRzc2WnBzR0xsV2RaTzFYWlhI?=
 =?utf-8?B?VElXaFl5V0xsQTFUcFBHcTlFei8zOStKV2lQdkZFQy9rZDBJbTZKYUZQZWpi?=
 =?utf-8?B?ZjUxeVIyd1gza1lSOTdBOXpvZ2xtcW02MkJHNWlGdzBHUWcxSGtSUEZqR01Q?=
 =?utf-8?B?SkJyZXNRS1pOYU5NWHk2S2hyVXpPYnhCYWptS092YzdSRS9KdThDUnJaT2Vn?=
 =?utf-8?B?bFcxWFlNVlgwZGtQTEtYQnI4ZVhvSEJMRUEzQStXWFBxQXBvR0tuN08wWG1M?=
 =?utf-8?B?LzB4bWZsWGNrdnVSSUpkSWpjRVpRZ3pIcnk2ZnVwY0REb3MvYjVUQlBQR1pE?=
 =?utf-8?B?eU85OWdpV0lEeis2eWFLUGZpdUtVTWg5K1lzVERCVHdjTXlubDVkWlpFbXVr?=
 =?utf-8?B?bFlGSzM5N211OUY4TnRmK2Y0aFBDZHBBOEU1K2NXaHp4NGNyaS9CbmZlVUFN?=
 =?utf-8?B?dkVzYzJpQVpjTVU2Z3BUV3BUaUhjVTlmUUhtbmhCQlNHRVZWVkRaL1hRaXR4?=
 =?utf-8?B?ekNCMkxhMFkyTS9XVE5SdjRhamdZTkcrK0pUTmxCSThwYkIyRUZXSzI1Mzlh?=
 =?utf-8?B?Vk1sQlVNTHZiMEp3SzJRRXZOcVNjZzhjSWtuQzQ3R0dUSTJwZTN3OUU3dVdH?=
 =?utf-8?B?M0NFKzlmUGVTSWIvWXF4SWE0RWNGVTJuVEFGdDU2Y3dzR1JZVElwNUYwZGlU?=
 =?utf-8?B?cHRxYmI4TGdoekhoaG10VGxxS1o3OHFjSGRKNlJGM2JWeC9BNEc2TUJvZTZX?=
 =?utf-8?B?VVorS21PZG1Ccnh1dURhNmxKd04yM0x5Z28yTlFmN0FNRmlKMEw4cldGQzBi?=
 =?utf-8?B?c1k4dFRnRmZvTHBSOXpESWc1STNPTDE5TkJaYytOenA3VzBFWFVLVWZTbWRY?=
 =?utf-8?B?d3hreUl5OWRuSkNOdVY2cnBUcUJJRUNvM1IwcmF2TUl6dlFPMHFrendiT0cy?=
 =?utf-8?B?b2FRS28zZzF1R0hOR252UmhjL3NXekRLWnh4NUJSRFQzV2ZvTkRLaXdlR3dw?=
 =?utf-8?B?MDJXc0hqK2RNY1h4cU15N0tGVTBRVVJXT2c1dUpHdk5iMy9wV0RaQmlSZHVl?=
 =?utf-8?B?V1lMRTdEcEZZOS9wa2dhYjU1RlNiZ0RRRGtkNFM0MVZLTVhEbHZHaTkzbjBx?=
 =?utf-8?Q?nUG5EmotlSk=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ogdFv85aICY6g4CGFusl1PwnBcXtl6d73b5HoA1BU5p1klbDhWbrmG3Sjjlsr+1Q+KhXAPOVOjH1qD7M321y1wSiFXx7MPyxROtyH6ik42SClnC7UnmoGOAPmc747tqOifi/oJnZkS0m4ZBomKvfPzxifo8BJXOHCuocnmDN0mcNEYSvswQAfmUoawWt45Vyvl+t3I09oHL3GIFkMp6RaOSh0jigoEe56xBnrQH/uaGUvjlTNONt6ynNWcy9BLRmzYS8VOTk4urxPU6iL+pmARqUJ1PNhxc0Al5hg9BAMwVjpWfjOJJo7SGhSLsWwpzaN6BzvpSH0KHnEdYosBa5BuArw86/SNJ4SL3hHpJxiFAsWWPKkUkWcda4lCLvaR719CqdxA0SKrekG+fkorhZCTIbcfHq8dmhq5UQ//DbzCI=
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: HttpSubmission-OSQPR06MB7975
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 06:01:41.5907
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a46fb8-85db-4c0d-acfc-08ddb0891809
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSQPR06MB7975

joakim.zhang@cixtech.com would like to recall the message, "回复: [PATCH V1 1/4] ALSA: hda: fix controller cannot suspend when codec using jackpoll".
