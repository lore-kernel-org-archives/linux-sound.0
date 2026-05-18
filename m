Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010063.outbound.protection.outlook.com [52.101.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD32849659;
	Mon, 18 May 2026 08:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779094322; cv=fail; b=g7Jl5Hg1a1+AHzE+ECS/Lushzc74XgIaGQ+ZT4r57xW2O+2yhOdHQyTbZy6TlLCgHSB2s/azfiBxvoTjNxMxM8mLOzNByaPJzyB1+PeYhA1JyF7KhgwaSJ/wVgBHofntIKm+lWOY4UkEYJFV8bP1s7rHmgzYaS8IiqgVqaLWWWw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779094322; c=relaxed/simple;
	bh=cGGBGv+kcSSh7QR/RTIc4AVif8twKsZ9Oven5R5a0WE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=codWpJb/UN6OmdSzCEIrBnr5IImxZ0WiWDzIxJStPdozzEegVxkpXA1zz6yM+q9yPsu1FH+GO7HPgWvAL8txb3pdBoQJvdgC0TLSDjBpMql5jbM8MFPw9l4zZ8lxqr0XLQIIK0csNDuPDE4s8WKucDQljBTa3xgZzP0SPgZSTZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=4q6xbPcX; arc=fail smtp.client-ip=52.101.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="4q6xbPcX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/WaInGbPGNM51aoMMDhkSCOi0J0XZLD19mrtlumggyQHQqh7nht2iaVPUW+PlMsJQnia3r5nXJuliFZt1Hpnyty9f3og4F0AujQv7E4bcFTfE8wpGkS7Fjo8g6eLTVCDREUyj7Ph9MrC+fh4C4KSZwA1oWIY+Mgbu+N0ckH7Mvvhq1w7OG+KPBZcB2zfITSXm5HLEuf038cVzCspallxgO7/XIUkAZzZY0QJX61zKRC0CF+g4gbV+BQSvxSD2CxhKzp3+TQeI7/QjHxbsTA5Ab8g7EhrCjB5fNWCb5PLhs4Ix4sFLDR9lkCt3loAiwbak90Ut4LAMsfZx1vCoO+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pxPoZdBn3Chf8MiwNYAcWaQG7trWmMuQmycXFoN3M1I=;
 b=XJsirwO9lt8fcPKJWJ90YmBJ7iIXjKNfCO+zr+wDXdKujLRJ7MgJI972CFNbQQccYQoLT7sxr4/YCdb/S6RSMGWa7zh1yut5Epb751I616waJZmZFsSGqs7dszgMeOGWeEQtIPXyICwvbp4LXF0vM9fI/nrMzEDC/XeNPw5T/y3usd5JXlQrvG5NRrSSm/LcYPE2WwPdZVTHA0A8xzC2Yge6YilZc7Nv6e1CjnsiCHCbjpi3HGoP9n3yoMzu3sAeWMXdFXE/cLj0WX+L+gHCijnGHeHAYc6afrlgeeWkW+1YAajA7eg08E7GSQFq78WpVjTreKsbIK7REJWGehm6Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxPoZdBn3Chf8MiwNYAcWaQG7trWmMuQmycXFoN3M1I=;
 b=4q6xbPcXtKJmy9fNDgNCUgHHYKSE0dy0keqbZeBChC+Am7vzTpLtlS0Yh9AL4kGM6iYEt+K13L/ZWXiPhTUC5Ha+pL6nhkAYMqD+5wcXbwcH6+haiIzssG3XzswWQwgBtPTdRZ7fKhq4f6Be1hG2mIR7YeSX4R/ZidPbQX0N9cw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 PH0PR12MB5680.namprd12.prod.outlook.com (2603:10b6:510:146::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.23; Mon, 18 May 2026 08:51:58 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%2]) with mapi id 15.21.0025.022; Mon, 18 May 2026
 08:51:58 +0000
Message-ID: <7b1501cd-081b-44b7-82f7-41d4584a4fe6@amd.com>
Date: Mon, 18 May 2026 14:21:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: amd: ps: Add support for MSI Crosshair A16 HX
To: Mark Brown <broonie@kernel.org>, Sidharth Sharma <wednisegit@gmail.com>
Cc: venkataprasad.potturu@amd.com, lgirdwood@gmail.com, perex@perex.cz,
 tiwai@suse.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mario.Limonciello@amd.com, "Dommati, Sunil-kumar"
 <Sunil-kumar.Dommati@amd.com>
References: <20260517203955.42490-1-wednisegit@gmail.com>
 <d6776836-9a1c-4663-b435-8d5b05b8b956@sirena.org.uk>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <d6776836-9a1c-4663-b435-8d5b05b8b956@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::15) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|PH0PR12MB5680:EE_
X-MS-Office365-Filtering-Correlation-Id: a14930df-28ab-4858-ed74-08deb4bab81a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|11063799003|4143699003|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	CDqBWWmtMq3u+OeDcq6ZfhQWs0FtvbvncTUD+VXRBl/WKhJuAK69/pZYUZ6BU87a0IznXe9/eUOBlrPOVQcV86P6wUkV3zLPvBdV5ozikee92l1+wXQXff9xvVYl9MAyK9cEfQF0rJeabArbmpyLK2hw7eD8dU/SES4mfanrwfspW6oXIp7XX/LUsWuvj8BDzQP9VLgwQev+0IYVYo1uyyCvSx2wsfdWoGx32/H26sNBgHN9pSBtDblJbqXPAI4JI+ShYmMNW0t+ZElh98X2MGosIBp02fuWp7q8IY8ZQsEccVeuWoA0Tqp6LEyR7W3+AFPFjwD2dsY43gHc/hgYWEafMqyY/d4KQXCxf3p44cwaVQi3gYKmGaKtWIkVnGRTSxwuHODQnsBbllrBMDdC+8R7o+nqeLu22u0grbfL1k89R/hJB1glljYA9J9ou+Y488OXDbtpa51TSYgOHPEovS9W8z3a1pMd2aS9xvfNgzMuoUnP84hewxS0HyHbNpdtMxDOc03hHCF7itd72q6cky8IrFKxgkSFmsVgLR418Q4tVsTaNp5VP/h30VkJMUPPyj44ALlJUhinUx3/rFZLSRElzHTeu7UdnN+utXRTqU7TQzTwCv8cNu614sci0eLw0xGUgj+6x/zryiruOffrUVT654UjPgAUENuGbT9AhfxZodRMK8D5I9GrKlW08HFq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(11063799003)(4143699003)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWIrVlJYeGNuOGZ3Y0Z0SUluWVVvR2JOcWo5bTdJd3IrdkdXTVVLd243TklE?=
 =?utf-8?B?Q011N3BTb0QyeEdwRWlSVWtGUTZsMTNvVmppZGxTM2h5enZqa1VuQ1BBUlJz?=
 =?utf-8?B?V3FDbzlneWFJdjFkc0YzeXJuYWl0OVJIRjZoM2FER0JlaGVrUkJjN2NIOGRH?=
 =?utf-8?B?Y2NCNUhZeGQrZ0tuUFNxdkJGeHBIYURKK0JoazUvMlN6SWhJa24vRDFORVNq?=
 =?utf-8?B?K1YwMlg4OXVreWNUbFJRUkhLbGlBQ3ZMckVPVEkzSW82bWpwTlZvR1JsQVJv?=
 =?utf-8?B?SWJIbVkrSVFycEkyamhxNHc2ckV2cGkxdmRFWmRlbElhMU4wWTlBcWJLWGs1?=
 =?utf-8?B?WU1hMmptMVhaejFUWDR3WmxFV25NWU83bDF0OFliV00xWHkwV1RXbzQzN3NP?=
 =?utf-8?B?RHVVNk9LcE5YMGF0Z3JxUE9wb3dlL25FL1RjWm1RNVphT001Qmdpd0I2K0hn?=
 =?utf-8?B?bUE0UGRYN216RU92bG9ydlJMUjNwTE85QUNxYUM1VmZWYUUrc0tIU2RYTjdX?=
 =?utf-8?B?dmg1RU1xemM2dzdmemJFQ2FIek56T2tiN01lL0JkNzZCMXhYNkVEbG1SOFZT?=
 =?utf-8?B?YnRQRHRzZEpUbTJkRmQ3ZjJIVlh0ZnRINloxYzI4MDNNNHF6NWdvVkpKUDNx?=
 =?utf-8?B?cVV5RGJOc0pMSFVuc3pmQzIraklBblljY0daUGhxVmVtSkJKVjhITDBnNlcv?=
 =?utf-8?B?NDhXUFBWSFFDSDJlNkx6SVJjR2dIN2Iyc3Z0cHdrMkNacW9WVGZxU3llL2h3?=
 =?utf-8?B?ZEIvdGtmZzBNQTM2UEFtRWN3OS9sM3Y1S2M5aHJ4RmNDRXFrRXRRYU5GVjBT?=
 =?utf-8?B?TnIrZi9TeXdHVmJnS3JiVGs1d3hkdkRnOTlIaDJ2bVlVd2VWbGJ5OG12Y1BU?=
 =?utf-8?B?WTVUU1FxL3BIdmxXVkg1b0NCYWxweFBXaTdrUnBJVXNOTnpLUU91aEk1VmdZ?=
 =?utf-8?B?NFVxRjFzLzl4YkdEZWp6NEowR2h2YVY2L2dVY1lpdFkzZk5jdFNMbGxReGlr?=
 =?utf-8?B?M1ZKUjRqT3ZxZW9hbEJ5K3BqdVhEM0JUSjk2dnoxbGtKYWtldDl4NjlUaFZH?=
 =?utf-8?B?cCt3OHE1azdIOXlDdUxNZUk2VzR4aktKMkYxSTcxQUI5YzlrS0R4NFY1WnZR?=
 =?utf-8?B?TGpLdndwTkphVm53bUtYOHJ4TXJEYmZCT3YxNzFnY2lUdHAvalVTL21tT3lJ?=
 =?utf-8?B?R212akRCRWoxZndrajJtVHNyRzRSQ3BYN1JzY2lzb29zUHZsN2ZTM1dKUDdR?=
 =?utf-8?B?WTgwcUVuTHY5OUxIYVpQRTRlQXcxT3JiQTJ6QWxnRWZlUVZJcUZWbURUb1FR?=
 =?utf-8?B?YzI5bTFEZXlvUjUyYWkrQTVvbk9lNXNsbWFodllLNEdEV2VPMzRQaG8rb29G?=
 =?utf-8?B?VDh4cXBnUUhrVUJaUVBpSVJsbk5kREc2Nit0d21rQ3M3WThkOUpkWFc0Kytl?=
 =?utf-8?B?Zno1VmhwOEZPZDY2OWo1N21jcnhVb1VIY1BLeU1MbEt4clVnL0Z3ZlZYRjdm?=
 =?utf-8?B?MXZ1TmpDdHkvM2hOKzh6WG5sNGpXdU5URGFiTDNuYm1PNjU3T1Rkd2JBT21x?=
 =?utf-8?B?bVQxN1lDWFI2eUJ2RW05TE1zcHNQTUhSVGRYZlhOVWZpZzkvWlpCTmhNa1Uy?=
 =?utf-8?B?L3ZORWdIclI0RzltUzdRTFREQzQ2ZXdRaW9Ib3ZIaDN2eFh6Q093YWpMcDhR?=
 =?utf-8?B?VFhIbzZXdE9hcmZGOWhsblZORmdubkkzb3hocU5OL3lOaUJRSm5pd29iZEJu?=
 =?utf-8?B?MFkrZTVWSWhNQ1BOOTVoVXhnclM0MENLQ1dYZWpaMFhYT1NiM2NYdzVHWlky?=
 =?utf-8?B?bEZEMnh1dDl6Yno3NDVnSkZxRmp3MjZyOHZ3c28zZTk5YlpRcW1OUXFMOHBp?=
 =?utf-8?B?ME1vbnpjaEM4aW14K3FhWW5mQ0Nsb0wwdkhLRzZDdVNYeWFFdklkRTVPQUpn?=
 =?utf-8?B?RDVQNUxOK09KMm5kNm1namVRMTdBVjFFTVZxWWpLSit2ejFHSFM3RkNhSkIv?=
 =?utf-8?B?ZkhjUjN0M3ZvNWpKOXd3Zm1qN3Rpa3ZEdElTL2VUQThFdFBvNUtweDB0dVVK?=
 =?utf-8?B?aWgrZnQvcVI2V0hXQ2ViREpqWVdOcnJlR0ZvUGM5ZE9QeGNPRVpCY1RyeC9U?=
 =?utf-8?B?RDJIVndzYytQa0x0UEFRdjlyQ3ZRUFN5ZVdVRzJZS3lIK1RwYXE4SFJzWGN5?=
 =?utf-8?B?YlVaMk1zKzliTXRmYURqS0JDb3dVUjdVUnZ1Uk1mc1RMbFZiNU1IKzFGck5p?=
 =?utf-8?B?aDlDTXN3TVlRQ1l0SWNwSUtsUkV3TFFObHd3TjYwRUx3bFZkWk1qV1owcnZW?=
 =?utf-8?B?M1JLUVRGYmhEdVpyUkVrbTNSeHB5TjFna29zcjM1OGpRZUV3clBFdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a14930df-28ab-4858-ed74-08deb4bab81a
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2026 08:51:58.1932
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QSi1+T4EJUZPxiSp/AeNtCJ206Ze/5qsG3EQUs3zz7RoIKAf2aROKVfGaT1cH3gCPXHGMrdC9KdRQS6IiZoBbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5680



On 5/18/26 14:09, Mark Brown wrote:
> On Mon, May 18, 2026 at 02:09:55AM +0530, Sidharth Sharma wrote:
>> The MSI Crosshair A16 HX (D8WFKG) uses a Ryzen 9 8940HX processor,
>> which identifies with ACP PCI revision 0x62. This revision is currently
>> unlisted in the Pink Sardine driver, causing the probe to return -ENODEV.
>> @@ -587,6 +605,7 @@ static int snd_acp63_probe(struct pci_dev *pci,
>>   
>>   	/* ACP PCI revision id check for ACP6.3, ACP7.0 & ACP7.1 platforms */
>>   	switch (pci->revision) {
>> +	case ACP62_PCI_REV:
>>   	case ACP63_PCI_REV:
>>   	case ACP70_PCI_REV:
>>   	case ACP71_PCI_REV:
> Don't we also need an update to acp_hw_init_ops()?
This patch should be dropped. ACP PCI rev id:0x62 support is included
in sound/soc/amd/yc folder.  Code changes related to any new platform
addition for ACP PCI rev id 0x62 should be included in yc folder.

