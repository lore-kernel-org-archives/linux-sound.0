Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011054.outbound.protection.outlook.com [52.101.57.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F29B389455;
	Mon,  9 Mar 2026 15:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773070270; cv=fail; b=pimFg/OWQCi8HSfMYDFzEdMyoiG00tezAEQUotbn7e2KE2RNXabrKhzXmdAk7n6K/pdwCuAWAYcFxZNmk3qaYeMSX94tNNMc5uGlLNrQnv4+Y648cDm2dTAoLtH0+Y2IzuZbJGKuD7/2sKcoYayQtn5ZRPEEP/FZj+nKvDv0ffE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773070270; c=relaxed/simple;
	bh=qy+xzj4dX3DJNTXuMwqw5G89Lx1RDMfIxVqwu9wgG1w=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=B7H3Fpf/OjWy+0XrC8vXD4XfTVztZgyiKD+pi+ohLwdp/XI6D7rZz/RbIQXExmNt7kQt8ErrdRSqcIBwoLo9FEg7/l4hbAcbZF5p6eZkRIO6vHRdQyKRsYUEBbXgrZ4984jSbG0muVca14hci+qXM4Yitsi8Vn/Upev3nSj6VaA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zTjIbnZw; arc=fail smtp.client-ip=52.101.57.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zTjIbnZw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aL1Xpe+YMGEakZ8FsZVGwc9LABF2OzOKApEosy82dd2T489l9XQJor8volriE+nAHNtpza/M+y/LlzOct4bLh+pIuuUbk9mu4YZ2tftSPGlQabhSMeAG6grr3GkOUZOkZDY7Kpg9YO24+m74zVF0XINbIsp8uYR0RbXCYnRZz3oQfHgnx+qHqfx/PZpwgDukGAtgjfcHcm0noGXvSmzSBG5tR0xhNvgjyuqYkZGyqakUujkCBhj11ttd2xmm8aMWJs1y+r4RqMJ55CrNn1NTZzM1pgukbO9DS9B3YDrINrEgiy5SoDKmRZtO1+bQXvmWGL7SRL80Q/f8XO7ZVeKUvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYIh8htn+8fPdq8C3p0vC2YtDeK1slfXRiJWANsbeoA=;
 b=bguGFjB7PIipe39cgzpdQLPb6nDTeMkPG7dt+DmRTl2HICrUdg8peBZdQIFGxlIG8Skovw09mFfr08Rx0D9im0MBOt3fQSca2ood2lKqpZZ12gC1g8mXXMuETR6KdsXlubhf4I00P3yEPpOXD/t+8zcQcCQVmx9Fggv7+GbDqyOR524BJnEzu0pIiXXAcDzolALdl/cwfVhh9jZvy6junilllsH+4IeLIyCdw76Ero6lZl52VKv0AIksBwrKKXwhmVSS87zgeMSIXAETQo0Q3Zy/vajrjliomSf0uOIj2mZi5FUvPLDctwnPxEFCzd0bXNTjm8PbMcl903Ufb1Drqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYIh8htn+8fPdq8C3p0vC2YtDeK1slfXRiJWANsbeoA=;
 b=zTjIbnZwHs6xPXjRn5+WhPXeJJow8Ky1ohXPfUpUSPQ2TV2eCvAiEmOYyVer988qCt4+Mhkht5kkofqB+AOxP08lhoADvOZJkM2JtUiJmRdyoTC/EXfMISadN/ZMsckrqDfXIovmpe8RskNYgakiWZvTLc/uwYo5gB0eNEj1nRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by DM4PR12MB6661.namprd12.prod.outlook.com (2603:10b6:8:b7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.11; Mon, 9 Mar 2026 15:31:03 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::885a:79b3:8288:287%5]) with mapi id 15.20.9700.010; Mon, 9 Mar 2026
 15:31:03 +0000
Message-ID: <cee01998-e94a-4f73-bcc8-2e71513166af@amd.com>
Date: Mon, 9 Mar 2026 10:31:00 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: amd: acp: add DMI override for ACP70 flag
To: Mark Brown <broonie@kernel.org>,
 "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Cc: hasunpark@gmail.com, linux-sound@vger.kernel.org,
 venkataprasad.potturu@amd.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-kernel@vger.kernel.org,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 "Gong, Richard" <Richard.Gong@amd.com>
References: <20260308151654.29059-1-hasunpark@gmail.com>
 <20260308151654.29059-2-hasunpark@gmail.com>
 <55265fbb-490b-4af9-aee5-1af1960c2b51@amd.com>
 <4f5ccc69-628b-452e-be40-a022c3fd517a@sirena.org.uk>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <4f5ccc69-628b-452e-be40-a022c3fd517a@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0152.namprd03.prod.outlook.com
 (2603:10b6:a03:338::7) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|DM4PR12MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f803efc-21b0-4d82-2008-08de7df0dff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	9D9dTH4dd3w6yKkHveD+d5gthil+ZeVkOSugIvfze/Rk2iQfZsboTBEIbiGO2I2MYmsiBaWLMYYxNIsrJtFefu+g3lt+SppSQLl/T3QrtqjkavLPCqppXWPftHIe8B7CGcFT4+K5bFQN8P+7VUcNgpkkf6ZecM6e7HH4GM3Li8FtVjoU/YWNveFpa+Dzmhuz8yH9f5ODvXlJkWldAzO/u9JlWAFfYN/PVUKXT5a1o0++6Pl4H/8RKFrG5Uzw0u6ECzYHsxM/JLSvy6ooi4JJlfmT/ii5d7HNvTxlOmP8ZrUzbRI6I05UMJCp5oT3JVuzAuKLKoM6OIAPA1F7roaY1sXZDwmg6QuGIAo+8n9GUQLyOJwOlFI9qAIlT5Om7ckXQ5voPeuPAVyVpRQwsZm4uVA8ABQq8gHVFobQqXKm3YSfrszQE6YnZNQXTr1u9LWOtnPbUEKsYXyNLmMuezBn0yOqAsTnAQv9G8nnsMxwj9X69J+mPqOHaCCqAFxv4L2EGFhl5tGn+hN2SGQfSOo3/dj2oVLCODtUGTXibt83w2ogE42xBSbRpMaVelD2wLC5wEeBoTnOe2VKfiebSVhoDGnGe/Foonq/sbpzYnorgHYCOwAV4rZyPhv0uTQIerRi3T9vIQk9t316I0w0zVhFs3faBNEFTnMe2GtH6W5lyv9OJ4IeMI87J0FElYZooufmv0tbGXye0owL5Uqo8cBXXt7IxKi/THEUdBdj6Wu3t4E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NXpOektLZjlYMG1wWUFEdGVMNmtvNFA5YTI1b05jNi93Qy9DYXBhamdQRzhL?=
 =?utf-8?B?eGRHRUZRUHJabGoxaFFmdWVjcFZ1bDVJNVdrUmVGMklzVWR3VGlOTEhmSk5y?=
 =?utf-8?B?V2hpanI3cnhOY1R5TUN5RUt6MlhUV1ZuWlRnc0RteUUydWVHNWw3YXhVVGla?=
 =?utf-8?B?b2ZsTThuUGt6bnJUSFdyeFVVK2VnQ05PWHM3dUpxYUVIeTFHV1VmVFBPWWZY?=
 =?utf-8?B?OVRhRTV1bm5vZzd3bVNRMnFiRHBYUWFaZ2xTenNDZWFRYVFCTUF5MHBPbW5T?=
 =?utf-8?B?VXZiSlJGNEZBT3RlS1daWjBPdllzUVp4R21LbkZDYnVXRkVOWSs5eHFMNXk1?=
 =?utf-8?B?RXZtdGR1QXNoazk1ZWx4T2duWU90NGZ1bUhjY1FPS3J2eW95THNHTUtocDdQ?=
 =?utf-8?B?S25SQ1J3QkU0aEJKUzJmSVRsOXFmcGtveE5aNG0xS0tzUWY2RVJNdTRpNEJT?=
 =?utf-8?B?bVozVktPeE90WVdiVDFtVVdxbnRDVHk1M2ppak93cDNqaVZhdFhVOEJIYTEw?=
 =?utf-8?B?Skk5anM4YWxsNlFXYkErTDdmb0xZeGJ6WGwyR0RONXVWVGRPZDdkOFVtQzQz?=
 =?utf-8?B?NWZFZDFwdzd6VkhycFcrUVR0V2Y4SXJlVCt0OFFONHpkZ29oc0xQK0lVRFl3?=
 =?utf-8?B?ai9oekRPeGFrd1l3Zm9NZEFZazRob0NySCs5bU80TS9HTVBMczRuMElsMzBa?=
 =?utf-8?B?MHkwM0dJL21XNExiWDZIcDMrV3VqK3RKcnAxeC95endQUnYwTW5Xc1pPbm9w?=
 =?utf-8?B?Z25hNzVpY2hzOTRha0RPb1Z3dndicEdtV2JvMUFRM09nYks0amR5dWRjQUxO?=
 =?utf-8?B?NHFob1d2dTI1aExWSGM5akN3SlpCditWSjE5MXFFZkZoVFNIbFZzbGdZS01V?=
 =?utf-8?B?R2psQmVBSHZyRk8zRi85NWVQTjB0MnZ5NTM3d1hCUE5uTGd1YmpPSkRUQ3VM?=
 =?utf-8?B?RURVM2xWeFo4dXdxZHc2YmpBWnQ2MHJ0QWNDMW1OTHFPOFJ3UHE3MVpYQVNC?=
 =?utf-8?B?Yi9PN09wdm0rdDBZMzNkVm5RcnNacy8zc3JvNW1rYmkvOXpEYjMzQTViSXpj?=
 =?utf-8?B?QkVyNlJwSE9pVmhvc0xKTUt2bTh5dXNaZGVUN3NML1NCNjZZSFhaWDl5amtu?=
 =?utf-8?B?Sm15Qi9xMFRCb2wwcENmd01JbXd2OWdzUDY3YlJ4dWZUckpiMnBBUmpsLzdV?=
 =?utf-8?B?WUROalVWTU84Z056OUtNZDJrVUJ4V2VjaExKeDN5alBIQXhTSHc3Nzk4WDE3?=
 =?utf-8?B?T1cwZFJPTFJyd0hnUVlNTGx5VWtCQzZteklDTmd6eFBkWCtDZFdseTJ2NGs4?=
 =?utf-8?B?YzlpQzVnQkNvQ3pETkc2Z1daQis1ZFNWclg1cGlxbFh6MzhrQ0dXQW9uTVA4?=
 =?utf-8?B?UlBta3ZYMzM0ekk4QjF4dERBWldVTzRMT0VsRUhFRE5iTmt6amVJTkFidTAv?=
 =?utf-8?B?RHBDdit3V0JTdTJzcExSRyswNlNIdktUd1dta0laOEw0UmZGQ2taOHZjUTJU?=
 =?utf-8?B?bW1oMXJ0WEs2SEc4eWYxK1BIdE5PZlpEVmtTeUVSQmJWYk8xOExta1ExWEFj?=
 =?utf-8?B?YlBCQjlyTlNiZVRzVWdFR04xOGhLNHlMMm9uVU5vRTU3aG51MzhHK2cvcldF?=
 =?utf-8?B?YjA1SUc3VjZPdGpYSDR0c2d0NVlQQWVMTmQ5VmxSWnBBQkRQTFVOMHlLTTQy?=
 =?utf-8?B?bEpDQnZQQXpSOUJXa2pKdFFkSjQ4NGhaYXNIZ3NpcjlCMW5rKzdtek9maHRy?=
 =?utf-8?B?V0dGeGk2bllFNEN3bXZLbDBSVTFCTUJDVmZBVG9VMWJuUnVkdjN2TEd5ajYz?=
 =?utf-8?B?dnp6bFgrOW1TMkxZcEhlVDJDNUFtMzdVUVNpcHB0bmRIeU9YVnJQR2hUNnVQ?=
 =?utf-8?B?K3NhcFRSNVJDN3YwM2JVdmJIWHJJSWx3WmJDYlplcndoZjF2OUpvS1ZzdU4z?=
 =?utf-8?B?MTZzd0liL1doQktYbkJ0TGY4bFRrVk10U1hSeU1EMU5HSGRqUU5ISXRSQUM0?=
 =?utf-8?B?b0ppeXA4dWFCTzNKK3hJVGh4SkRqdSt0SC9vWUZzMld0cFdTVjUyZzMzbkh4?=
 =?utf-8?B?ajZNTytvR1REcUZWaWRRN2pnUjByR0VJaVFQZThUaHBQa0g2d2tJMGgweG5F?=
 =?utf-8?B?TzA1eVVGaWxDV3VyVHA3RGJtVDU2Y1h2WDAxSXV6ZjgwMm1IYmtUSWdxOWlG?=
 =?utf-8?B?Ujh2L2VkRkFJbnZrQjFYSnJMNGRDeVgyN2Jqajk0ZDRabE11d1N2a25sUDJ3?=
 =?utf-8?B?VnFncVZoNUNOWU9xdUM5RWNWeDRXUThtYUxtUWJBeUtSNnBDektqSGtPa25q?=
 =?utf-8?B?aDIybklJRDI5WjkxdU02L2JNcFExTFdwQU90VUhyLzM2dTdGTkVJQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f803efc-21b0-4d82-2008-08de7df0dff5
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 15:31:03.7755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPUJYLSM/MMgR30qsCQXI9O/64YVeSyxRtENrZua4Fcz7vlXhAWT3uKPUZaSEm3MwgsW4g35jpF8FSENknQf7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6661



On 3/9/2026 6:34 AM, Mark Brown wrote:
> On Mon, Mar 09, 2026 at 11:03:21AM +0530, Mukunda,Vijendar wrote:
>> On 08/03/26 20:46, hasunpark@gmail.com wrote:
> 
>>> Add a DMI override in snd_amd_acp_find_config() for ACP70+ boards and
>>> return 0 so ACP ACPI flag-based selection is skipped on this platform.
> 
>> This patch should be dropped.
>> To avoid overgrowing DMI quirks table, we have introduced "acp-audio-config-flag"
>> which should be updated based on platform hw configuration and required driver
>> solution to be loaded.
> 
>> ASUS has to update the BIOS by changing "acp-audio-config-flag" to zero.
> 
> This is a good thing to have going forward but I don't think we can
> require that people get or apply firmware updates for existing systems,
> there's no guarantee that vendors will make them and the process of
> getting and applying the update may not be trivial, particularly for
> people running Linux on a system the vendor shipped with Windows.

At least for pre-production hardware we should not accept quirks like 
this.  Vendors should populate their BIOS properly.

But I gather this is a production hardware and the vendor made a 
mistake.  In this case I guess the vendor doesn't make Linux BIOS update 
easy either, and thus the reporter suffers.

So maybe we should let this one go, but let's look through these closely 
if more come.

We really don't want to end up with a giant quirk table of BIOS mistakes.
