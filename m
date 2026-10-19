Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013005.outbound.protection.outlook.com [40.93.196.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FEE499F31
	for <linux-sound@vger.kernel.org>; Mon, 19 Oct 2026 09:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403499; cv=fail; b=rc5INIliKF5EyvOTV4rv5roGSJ6+Qwn08aSVgf8RYzt0527yCPdzheWNJC6Bh4K2SqaslSFhhZYjp9209efIQ2GtZv23PTCKdwiFtl8RisfXGBPl8M5CtwpQpyMauAKdazjhUwvIRCxumGNmqZ1XNSbGZL6n2y1Y5WlAbWenFOk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403499; c=relaxed/simple;
	bh=8NJThvfb0C2g18rA/Twwpp9ONKvPtLh1qAj0UQak+J4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gyqRUlu7tybe85sOJJwfwgc7MhNvVuLIkDxFFihiDcbnPcUHi+zJz9T/McXTTJ2YHmB34PBADrcz0Jl/uFdsV5cs2gm1Yrt5wXjt7gtr0cXc5F+lbLmcTZ/trvqQPd1XLLokEamyIh3oJ26V9JLcxP+nH6ecbTMb1XC4AA24hBU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=vr1F3s4o; arc=fail smtp.client-ip=40.93.196.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="vr1F3s4o"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOrL51wFjtUWErQvKqrw6OuFW+ztM4CBYaHyHE6IzWxvzmhUPpQB1P0MrjkiidpHcHnZM8DxoaQoC7uW5ZZqqvsH1Bwzl5kPtTouOEhdmGFis0dn1eQIXI2NPVkU8ECJw0v2Hc747tgaqdS6uDfPO+FW6CjkRBIRmvpjNdt2ISHaYMHVMaSZHId/nuL4NRWjU14qZG2NN4psqJBnZLT5IhhTFgAIef0p7HHz1Gp1yZjnzEA08j8eO4I7DfNFUIgMKYiUPIMb2IC/8AzYhpnuniEMNsF6ranxm3VfWC8YUV/stLzxQC6JT8VOi9EV995oRPxnMe+t0dJHKVWVP7pgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVe5bLPbOcz6m/y7lAxkcwcbLb9ThPgRrL9V+GHvQCs=;
 b=VCrh+Bws8mzkP01lQkXKXKIq+bifUPEe2Ogx00rfZeUg3K9FYHSipmJAwQuYkKvp5uQCRsfUiRzGq8dRP+kFSK+r9+Alq3zSHDC8NKWYxvIuW0h1qEtZ5JAGKImavojnlSkABnqqjMLrhbdTXex1+ByWcylv/SpO7GyNZsIIYWQ5XMEBWK2alFwpQJp+fFCA8krw2SqU/6QDSUHFO2tR3exBWB1FznJqnRM2UKwtpqAw7R7QaoRWX4IehxthTTEmNT8E/kAoi4Yu3CGqgoAKsPlclJT4kLiBg7TwzGOF4usR1Jcc5PduX9oGIVQhRdDh9o/GMlHG9+2BbXgJ3PAH8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVe5bLPbOcz6m/y7lAxkcwcbLb9ThPgRrL9V+GHvQCs=;
 b=vr1F3s4or5SEfxWzIegKyTDE3gvr9wrTTUgrRuUWsHucD9x9G1Bfv9ESP8gZmrKQYq5IXV7WXNmBqAu784Kr5wbJQZpr6FBwobj1YU8O+iT6q44qexvjtSLQKempxe50ggKOYHpT/8HMCyrPWHGTGVsx0aBalFdVUXtPJpG3sAE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 CY8PR12MB9035.namprd12.prod.outlook.com (2603:10b6:930:77::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.19; Mon, 19 Oct 2026 09:51:34 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 09:51:34 +0000
Message-ID: <1d7d094c-b2e6-4c1c-b1a8-933108870a96@amd.com>
Date: Mon, 19 Oct 2026 15:23:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC: amd: yc: RPL (rev 0x62) DMIC registers but captures nothing
 on HP OMEN 16-ap0 (Fire Range)
Content-Language: en-US
To: Francisco Panis Kaseker <franciscopk.ilax@gmail.com>
Cc: broonie@kernel.org, linux-sound@vger.kernel.org,
 Syed Saba Kareem <Syed.SabaKareem@amd.com>,
 "Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
References: <CA+f704fo0TuqyOnOXaLCpVNLgHSc88aK08RKcZji8MoiibjyVQ@mail.gmail.com>
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <CA+f704fo0TuqyOnOXaLCpVNLgHSc88aK08RKcZji8MoiibjyVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0108.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:276::11) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|CY8PR12MB9035:EE_
X-MS-Office365-Filtering-Correlation-Id: c103a585-2f3d-460f-b4c3-08df2dc68f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|56012099006|11063799006|261009223027099003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	WHLlMjlQyR+CLNjYLWm8dIqsa6Wj929S/dWBgwTIV41TfTyW8uehY3QiwPQvMaJE4Ck8zxZdxLiViOr/ZRmeIP/9d00FCNwGVBWiAEgt6yFguLleKbn3eNID3wxJbNYyQ2wv/erTqTHd1qIL5zKXetohtyHszuKafaq1H4VW/mQTiiUV7+sRl1UAudyHwURZ0EssWRtlfFC7DHrLihIN+udvjr+V/FqaUvCqaDD5j3itpXHZMLRkiUKp9vaNkEi5Jm45sD4CTbqDYYhq//cuyvoDbUiCzW2HC/E9yvm+EyGspdZU4U4msxzNm6nWz5WgJNlLgDUpX10ANOI+9Y+EQeBjf0k5dKJ5mN3WvAe17eYv5Nejp7nNXBeEHTPWht3V6QZvmQRMJxcgiwsKx1vJEMB4oz3zQPSi7HAo5TbrjcOEBJqIvyhTttHkDB9F3aFeDk0Xq20r5/zwrPzVMeX48N/SReQ0BbhI/LbUkv7DczPmx3zOeApiixmU8JhmZOOT/iY7na09eThFexZc8wtngqc8XlrJ5nAL8mvJtGLEgWmbOIOf6teHcxrvTyz9adD+bGSWweyRbqECgAPYrtcPquknWSoUZtu7IrLETf7uRHCISaEmUWAE3NE5NeW2ee6Icvf+O45X/xqkhqP7VB+45UsIFbPKo8mo+rBnTtfkB/U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFd5UjVPRGRVYTUvOVBlU3hLME9VK080dDNaRHptTWZBa1NrbUpIdjd1dmxI?=
 =?utf-8?B?Y0kxV3NDenVzMmlQTnJxY2pjNHBLblpnWTJLNW1xczdWNnFRTmFMbHhxTEx1?=
 =?utf-8?B?aFlJUkxWeUhjaEhGdkk2MFRrb2J0VU53emFFakNrbUFQQXNnazZkVm5weFNE?=
 =?utf-8?B?c3o5d1pkRkMxQ1RhUFNVSEdMaFRWV2Y1bTFlMnc0anhXUTdNZWdSVFlzekdn?=
 =?utf-8?B?WDVxcHJZVG9mT2Z1bzBEY1BKME4zY3c3UlZndmpTVGhOVElvRnFnNlNOYzRr?=
 =?utf-8?B?cDc5QVJBUnIxSnpvSDVyUjFINnB6Y3BwR24zdGNQNUcwSE1zeGdjR1dqVFlY?=
 =?utf-8?B?VnNkVjNuTmxzRk9nSXRCMGhBNmJ6Mk9VbEhFZkRiRDZzeWg3QmZXTXdlK3BI?=
 =?utf-8?B?UDd2NC9XZnh1SW81MU1SemVjaWpXbDRLK0pMSmNFVHhacm8ydmxkeC9mUEM3?=
 =?utf-8?B?aFJRZmZ3RWxDSVUzakhvdUFNNXk2VDhEbVZBcUpsWTdEMzYzYTBBczMzTVJw?=
 =?utf-8?B?dU5TNGN5TVBmRFh1ckxkRVQ4UE9OSzhYTnh1bEl2aHEwMTVkOEh6eUFBbVU3?=
 =?utf-8?B?QUUwL2twak14andQckJTQnFjZGY2UTFUM3k4SGNRRE1hWm8ybTJzMmIxRk90?=
 =?utf-8?B?bkticTY0emtjWjBLWnc1NFNHYUxmdmNFSHFuTWNzK2gwV0hSM1pZaXlpZlMw?=
 =?utf-8?B?WFh6UTI4NUJwSGQwV0gzOE9TMXEzUVpJWHd5b1Vza3g0dEVtYngwdVdqQXlz?=
 =?utf-8?B?dm9VaDdoSXg1R0FOUnoxTFV1bC9IbHlldllQbDdLK0ZnTDZXVEo3T012dTFp?=
 =?utf-8?B?OHM0UWJVRVhsR3RSbEFMMDExYjhUdnJHblZra09xYUpHVGVLbW9ZaGlDSHV0?=
 =?utf-8?B?bUtlcHlCZlBxZ0xnVE4xek1lL0llMWhJWk8wSXROS2I1TE1XZ0ZCTW1zT1ZK?=
 =?utf-8?B?bXdjdTUxQmRFYnY2YmpBZVFFWW5TSmk2RXJxTXpDbFlKRnNaZXY2K040SG93?=
 =?utf-8?B?elc4c2JJb1hiZFpvblN6cmVqMjhuZFZ0ZXVIeXRRL2dvVmg1UzRxeU9NY2I3?=
 =?utf-8?B?UWw5L3VLZUhYbFJqR000b1hEWkZKaGdOdFhCT3FSSkZhTWxrbXRDZVR2SlR5?=
 =?utf-8?B?Qy85M005a0hFeTJBVDRhQXdLc3NnODZVNDRlUkdxUnNkREtXRWVON1RZZnhz?=
 =?utf-8?B?TUZOVStweGFUSTE3Rk5YY3J5YXhLQUlYdlFZUTJQVGJUcTU5SFpwT1d4QnVJ?=
 =?utf-8?B?eERtMXFzVlpZYmlFaGVoQTJFazcxaTVROU9ncjJIbVFLTDgxVDdlTUwwTHRp?=
 =?utf-8?B?a21vRVJpRnNObnZXQUw2S05HTVArVEQ2aHZRL25FSDBLeHROS0JQNVk1YXN5?=
 =?utf-8?B?V3VPNHhtckZkNzhQUkVOSVZPTXIrYTBielcyQUprR3hyTy9aVi9KMGVvU3lR?=
 =?utf-8?B?TlhacC8ycXloVU1zUTBNT09wVnZ5S2JkOWs1ZXoxSkVKWkN6NlpHV2UxNWdj?=
 =?utf-8?B?WEw2SWZHZVNLL3lsV0hCcG1SN1dWRkJFTGlUZCtxRHJtQkJjNXBLUmtiYzlT?=
 =?utf-8?B?MjRpamYxck8vejZjTzZGSGY5ZCtPeTBhTGdDVWlzTlEvckpjTy82c1lrcE9z?=
 =?utf-8?B?aDBhSWN2SDdZOWFXc05QWlF2aGFoMzV5V3VFMnA5RVdvV0pJeVhnUFhVc3g2?=
 =?utf-8?B?ZjFHS2xJdkVabUtvS25uUnZIQVBCWkRSZmtOK1B6MU5rU2VjclVmbVNLR3hC?=
 =?utf-8?B?ak41Lzlob3pSQktib0paZUdpVGVIUEc5NGtFRVAxdzh4RDNuejZ3S1pqSkNa?=
 =?utf-8?B?VVo2Rll0dEEwRHFDSVpBN25hSk9JWldhK0hoUnoyUHUwTVYvYzRac2tGM1Ry?=
 =?utf-8?B?L1UzWlJLY3M4ckFnMW9wNGp5QXora1ppQTM0RWJZWDk2TDF4bnJZeEFrTllS?=
 =?utf-8?B?LzVleittcEIzSjIwMnlpWnprZ2dodkxjM0lZVk1VcGxVK3FNM3lTV3ZpR3U2?=
 =?utf-8?B?aXBiL09wRmZKeVFGTnJZaTJ0Z0gyclROcW9panJqYlVhQWFmT2pTVDdvbTkv?=
 =?utf-8?B?b05RM3EwSVNncEhFakJEdVVSc2JkdWMyUU9IOS95ZDZLTVFydVArKzVLeTlL?=
 =?utf-8?B?WGVMWHFwSnlsVlBGRUFrWWhCZTl0S29qOUh3SmtVV0ZjZXJXS0RlVFVJK3RO?=
 =?utf-8?B?OGRGRG5xbGNrTnhOQ043c05oL1E4SlFtcDN0MS9LeTFrd08zeSt0NjdmLy85?=
 =?utf-8?B?RFllbG5VemlwMkdHT2QraUxNNVhTN3RVTzRoUDQ0MDhhUEorZ2cweUNsMngx?=
 =?utf-8?B?SGFpLzFRZTZZMG94RVJ0WExRYXZCZ3FQbXE4ZHJ2SDI3bmZCdWJFdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c103a585-2f3d-460f-b4c3-08df2dc68f47
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 09:51:34.4213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZgG9g5HDyiF9x+OBlwESZMf7VH5Tb3HlCvLJiV87VL9fOaHT5089oaTED4cfdbZxWqDh6+rTJh3OYFkbvRgx+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9035

On 18/10/26 23:11, Francisco Panis Kaseker wrote:
> Hi,
>
> On the HP OMEN Gaming Laptop 16-ap0xxx (Ryzen 9 8940HX, Fire Range), the
> internal digital mic shows up with the yc driver on ACP rev 0x62, but
> capture fails: arecord returns -EIO and the ACP never raises an
> interrupt. Windows lists this mic as "AMD Audio Device"; the speakers
> are on the Realtek ALC245.
>
> Hardware:
>   DMI: HP / OMEN Gaming Laptop 16-ap0xxx / board 8E35 / SKU D93TFEA#ABZ
>   BIOS: F.13
>   CPU: AMD Ryzen 9 8940HX with Radeon Graphics
>   07:00.5 Multimedia controller [0480]: AMD ACP/ACP3X/ACP6x Audio
>           Coprocessor [1022:15e2] (rev 62), subsystem HP
>   ALC245 (0x10ec0245, subsystem 0x103c8e35): only the headset jack mic
>           (pin 0x19); pin 0x12 is 0x411111f0
>   No _DSD "AcpDmicConnected" in the DSDT/SSDTs.
>
> Kernel: Ubuntu 7.0.0-38-generic. Its acp6x-mach.c already has the 8E35
> quirk. I added commit 70bbd833986a ("ASoC: Add DMIC support for the AMD
> RPL platform") to pci-acp6x.c as an out-of-tree module (kernel tainted)
> and kept snd_rpl_pci_acp6x from binding (the equivalent of d3fbf61317f6).
>
> What happens, after a cold boot:
>   - snd_pci_acp6x binds to 0000:07:00.5
>   - "acp_yc_mach acp_yc_mach.0: Enabling ACP DMIC support via DMI"
>   - no "Audio Mode" or "RPL Audio Mode" line, so ACP_PIN_CONFIG is
>     4..8 or above 15
>   - card 3: acp6x [acp6x], device 0: DMIC capture dmic-hifi-0
>   - arecord -D plughw:CARD=acp6x,DEV=0 -f S32_LE -c 2 -r 48000:
>       arecord: pcm_read:2240: read error: Input/output error
>   - /proc/interrupts: ACP_PCI_IRQ (IR-IO-APIC 19-fasteoi) stays at 0 on
>     every CPU
>   - PipeWire picks the DMIC as the default input, so on these machines
>     apps record silence by default
>
> I also tried yc with the RPL PGFSM_CONTROL/PGFSM_STATUS/CLKMUX_SEL
> offsets from the removed rpl driver (0x124101C/0x1241020/0x1241024
> instead of 0x1241024/0x1241028/0x124102C). The result was the same.
>
> Is anything else needed for the PDM block on Fire Range parts? I can
> test patches, mainline kernels and register dumps on this laptop.
++ 
Please log bugzilla ticket and attach dmesg logs and alsa info output.

Thanks,
Vijendar
>
> Thanks,
> Francisco Panis Kaseker
> ps: Wrote by AI

