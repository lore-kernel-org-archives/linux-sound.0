Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010034.outbound.protection.outlook.com [52.101.201.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148291F3B87;
	Wed, 14 Jan 2026 00:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.34
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768348860; cv=fail; b=txNmCrFoM3WvvbIIYkqFlKvBcp+6NDhLvu7rjJUXmbL4tkZj2Wbc/SW3ZjnnNbsKFb8TCruKlgRP2W/k8Jnr9vTNw+RRVS6tcIipbKXSqA/LQDzSGNSiyQMFX30/ycr8N1sAjnJ787xFAc914U19H3iUNxk6F1zcOrh/y+dIhcE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768348860; c=relaxed/simple;
	bh=d3Y2eHa2JZwDc9upJmFhE6fTpw+LZMQWy5m9rMtAqHM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=g5GFpN9wGyaUPPU/rPznWrt11J/ZlPe5o23M/jc0l8bMl/p9niICxQaYHsQboPI1NEaw2iJXCCSYuHWd2o/dUs4nVNYaCzWdbJYGfaN/gwgzD/6EzX4nP3qpzytMaP+zAN8Xu3zQIr/9bERJazFXvDEaOkCtbHtWiU3elx1N02A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=zZilFD3H; arc=fail smtp.client-ip=52.101.201.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="zZilFD3H"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lsivd69A5Typ2mYJuzHIExlbb0nb13hZaZNkPK7MI9hB5UkbhsgEYf+d9QwpqmlvUQBY47IlIfreDbck7IXbHcM8xJ9F+zz3Sg3+Op7tjt0rgNcwzMRlnV6K8VP65n22L2tosJxpuoIVjRpYXo9z9YjL3qWOnhqEjqI8WskZztEoHkCTl+VpIP/5Os8E+FvT4Nr2NDHZFAb5h3OwvQTnalw3WMev4eJ7d0RMrRQL/6Z8n/c8DxxqKdl/nn7sYPwS+CafLcJMHr48WxrzrJQHZFI0SmfErbYpp9IRwSugl5Onz548XnOtRtjkxiJ585/CdykBvQWxjlviNUO9nrGS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbrR8s1L9CGubIy8GKXIiHs/MgY0BA5HaH2pD8tzgMA=;
 b=DC3oDftnrlhNW3Gjg4KOB6WtgNAbjRpkZAOQ1Gz5OCV0dkB1fnyT5oc1U7My/zzktJb2ZJg7BFrT5ReBagJ0rp0rgWQIt7XByrtlq33YyTJ5faf/9dUzeupiWxDsacnO9CPa6VTyi3ysuKEZLDs8pXAJSmS6iS/EtC+LMvSherYTyc2Edk9hwDHt/9wdkNSHZJ3nKtnf1W0Nz/cwzD3Uw1fGaLhie0UW7jc+fOYOfPAx05ScOnVWqL7n8IXHtep7Rn4nyg1K+wHg8HXeRx5B7ihUJZNdN6/9rs3iMUEPpG3J8BJMfiQT7JKeNXirHkcRDS4V0WkwsZpDXYOE3zd02w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbrR8s1L9CGubIy8GKXIiHs/MgY0BA5HaH2pD8tzgMA=;
 b=zZilFD3H0SC2emCN0AybMlN0oWd6tF3nlAuZ8yV+IxYB309EF8Sq0DRVfDZ8u9o903q2VrXYR0IooIhN9RCUi61XCID24cCnNKS7aSeCSBcbxZ98hWYZzkTWTYnoJoJe5NIdr9yBhKODHuBZ6oN4mAlen7DWu07tJwilpresUDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS2PR12MB9567.namprd12.prod.outlook.com (2603:10b6:8:27c::8) by
 LV8PR12MB9154.namprd12.prod.outlook.com (2603:10b6:408:190::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 14 Jan
 2026 00:00:54 +0000
Received: from DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5]) by DS2PR12MB9567.namprd12.prod.outlook.com
 ([fe80::636:1b52:24ca:d7e5%3]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 00:00:54 +0000
Message-ID: <e1383cb2-d506-4adf-a7e1-2c5d168555bc@amd.com>
Date: Wed, 14 Jan 2026 05:30:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] soundwire: amd: refactor bandwidth calculation
 logic
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, vkoul@kernel.org
Cc: yung-chuan.liao@linux.intel.com, Sunil-kumar.Dommati@amd.com,
 mario.limonciello@amd.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mario Limonciello <superm1@kernel.org>
References: <20260113141352.1940465-1-Vijendar.Mukunda@amd.com>
 <20260113141352.1940465-3-Vijendar.Mukunda@amd.com>
 <70daa8bb-5dba-4ec3-ade5-d5ce57ca8b2f@linux.dev>
Content-Language: en-US
From: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
In-Reply-To: <70daa8bb-5dba-4ec3-ade5-d5ce57ca8b2f@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0100.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:278::10) To DS2PR12MB9567.namprd12.prod.outlook.com
 (2603:10b6:8:27c::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PR12MB9567:EE_|LV8PR12MB9154:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c9e9d75-a4b5-45b7-d5a5-08de52fffc98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MU0yenZDQlA3eDNBZXpzcm1LZDRlNDhwdDVOMVJhNGJhNGpFS2pmOWZ2QU9F?=
 =?utf-8?B?ZC8ycVdmREIzYVZrQWlScUQzWCt1Qkw5T3k1RnB1L0EzS2lIb0pUSDlRWXVZ?=
 =?utf-8?B?WU1zSDJmeTRPdGxVTHMyazcybDhwQU1tblZab2IxS1JwRi9sL2ZPcFY0ZS82?=
 =?utf-8?B?SjluU29pbXJ3ZGMwNWprY1EwWHd5dHZtNUNoSG14V2FSQlE0N0h2SmJSMzhR?=
 =?utf-8?B?WllyTXZjY0dGWVNYTUhwWEY3SElMWk9YbXJvYWtvc3VhYmxKVUdzNStianJZ?=
 =?utf-8?B?RndvUmdoY0hqQmw2UElEbTlUNDUxOVlHRGkyRDlQQ3NvRGJvUE0wOWJuUk5L?=
 =?utf-8?B?Sk93bGtIeXp4YWJrZkFPUFc4akxYMGJCT2tjZWZjQTUwZU50ejRQMkhmM3JV?=
 =?utf-8?B?amFkRFJZdFZzZVB3TW8rV2ppeWhWSXc5bWQ1L2xQRmxxb0UxMDcyQVQ4MnZ1?=
 =?utf-8?B?N0UydUdld014dkRmcmlVQ2o3SnJRTm5IVjdIZk5aWjNRd25NSHFkQ2g3UjBw?=
 =?utf-8?B?eUFsOS90UGhpVzdZYUFYbjFIajl1R2NEajN4NW9sc3VSQnkwWldFNnJxL0FI?=
 =?utf-8?B?Y2ozQ2xQU2twM0R1cC9qNVRXZk5uMGJYNjhnMDR1M1F5N3RtS3dCd1hGbWJy?=
 =?utf-8?B?enRPTzdXSFY3dm5BenpUMTg2Y2ZpVzhtYkNtK0xvdldQdHFaL0c5V3ZvV3Ft?=
 =?utf-8?B?bUlaVmxnT0dlK1hUSzdXQ0taZGlOb0dQWjQveEFpZGIyK25JbEh1bFZvWEVE?=
 =?utf-8?B?SUNSNC9rT1lJYUsvTFFMSitEMjJYVDlPRXNPZUNsMWppNUxMT2N0MzhqYXlM?=
 =?utf-8?B?YlY4S3RDa0RrTG1DdlJoN29mWHhIb3RlMW5mdFk0enVPQm9qN2kzYUFlc2Ra?=
 =?utf-8?B?RTJJcm8xcDNxa3M5OTBxQVlPQjJyZ2Qwb2dpdHloT0FtQXlWU2VoU0xTUFNC?=
 =?utf-8?B?QXhYR3FKZzhodFNGWFhOOVRubFRzLzRkc3ljZEcrR3NJTXJPcEVzRmtvWTFE?=
 =?utf-8?B?M3FLVFNQak8zSkh0ZHRCc09VaHFXd2NCRktCd1ZVcm5qd0pUQzFnNGpHWVM4?=
 =?utf-8?B?RjBtK2Fib01obDUrMWN4QVh5dHo2QzdVaWFhTzJoL3lIWXJaeUdqb2E2TTh1?=
 =?utf-8?B?SVZhZ1JtYUhQbkdPQk42NUE2L2llQ3RybXh6S0wyWTNHcVRhYUQ2c2tBZFBm?=
 =?utf-8?B?U0F1Ni9OcHVGS3RoSlJVNjg1dlM1N2o5U3UxS2RLQ0ZVUEZTUlRrUE1iN0tj?=
 =?utf-8?B?UUtySVlselhkaU9mVk1jMWlZeUV4K2QwTUJUcERFSDlQKzVZelFnaHRvQnBu?=
 =?utf-8?B?SDZRRHBXbVZROExBOWphbGpFOEVXTklZbGE3VlplVlpLWXRPcXpsdFhMQUsx?=
 =?utf-8?B?c05SZ0xEcW5HeHpHamRSb3MyV1Z1MWlSOWxjZVBrL3VPWHBNNTJnb1NYd0Vo?=
 =?utf-8?B?TkwyU1o1NVQvV05Ca0RhTTZRK0FXRFg3Vkl3WlpVbGpYazdmbXZFMGtTQU1L?=
 =?utf-8?B?bnNwbGUwSVRFRTB1QkI1VmlJRG1mbWRhODFDSkVuVjd2WHBMckNLR0JUMnUv?=
 =?utf-8?B?aTdoeVJmeDk2WWp6TWFwT2JGb1JPR2R3YmdacW8rU0NNL2Z6Rm1VZ3lXYzQx?=
 =?utf-8?B?cHk1cXZQdnRuc0NaQWFYb05YWk95NXV6RjdPdVJwVk1mUkR6VHB2YXBJa3ZC?=
 =?utf-8?B?QTRteHNIMVg4bnN0Y1ZSTEtBVHVqQS9ONENzZHIvSTZMVEYvR1RrNWp0NUFp?=
 =?utf-8?B?YlFGL0VGTSt5UTZ5ZFIzVVNRdlpuSVoydHFCazFmQ3h5bVF4R3VHZXhHeGJl?=
 =?utf-8?B?SHRFMVV4MkJWNVlLeWZhaExBazQwNXlybHo5UEdMdFpZWnVybTZTTXVVZWNp?=
 =?utf-8?B?c1pvSC9BcHlTZDd5aWY4QzVHRGRma0V2enViMVNSUnMvRk5ld3hvOFdDdUpt?=
 =?utf-8?Q?juwQ3y08neagbGuj8xIhFpX7FaSd9Lrv?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS2PR12MB9567.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ck5Bdjl4SmExbVhFZkViaG5VdjVoUmdxdC84UkMxUWZxQzFNbi9EeGgrTFRY?=
 =?utf-8?B?V2NaRnJkbWVNTlVtdnpxSUJPdWY1MHczOCs3Y1QvYzhlZ3NDK1VYQzh2QXVS?=
 =?utf-8?B?enNyc1hhWXFzcFZodm1aZGdhWmpOMDQvQldCZkJNa0ZHR0RsWnFGbW1taUI3?=
 =?utf-8?B?dkRMcDBWQjlWN1Fwbk9uNjdsZ09HN09vNGRPUjJNME1CTWlQVnJYWWFkZTNq?=
 =?utf-8?B?d01SUjlpYVlyMnN4b2t4bkkvOFNXTlhJdzNEc0I0aUJianJXSzdhMGwwSHNa?=
 =?utf-8?B?WmU0L1MxZ2NNM2d4endtMWZGNEhFZ2xGbUR4RUpIekk0QWVybnNBUzJMWjNZ?=
 =?utf-8?B?RjRTZnNmSXZqdG1wUE5tUnhCbmZMdDVpM0wvS0FCYUtZRXEzWnYwT09HYmZZ?=
 =?utf-8?B?MW9pUVA5cEdLUUduR3pEZTlLRzNFdTY1cTRBK0tzcXZqUXVUWjZTbUtqRWt4?=
 =?utf-8?B?MlVEeTk3ZWRTcUN0Z0Y5V2JER285UzNrYW1qN3NTaGZ2Y2hDOWt5MkRxeFI2?=
 =?utf-8?B?UVBJVDgrOG5lU3RrMVl5R05pQWVTWlBQZFVXZkdYNzdKZXdGek1BbGRsc1Vs?=
 =?utf-8?B?bjJEZlJPWHp3RzV3UjlWRS9QSUFyKzdXcEdiTzJVQkMrd3FjN1JBVEJrVTBO?=
 =?utf-8?B?Um1XYWVUUStjS3J4Ym1VcHBuRFU3VXFFQ2ZRUVQ3TFN6YWgwQjY4TG1MUVdx?=
 =?utf-8?B?a05WNnpDdmdwY1c5eTB2Y0xEMUhkNmN1bXVvQ3F3ckpTb1hwMThkNlVzWGRh?=
 =?utf-8?B?dkdSbjBHREEwWTN2Q0Fhc09lcVBIQk50ZkRKcDFodkZ4czFQT0V1NE0yc2x3?=
 =?utf-8?B?eFNmS0dZNEZQYjc5Z04rR293bE9LeXdmL0xMeHhyekVwTUhJZ2pPck1TUGtm?=
 =?utf-8?B?RTVrUE1pd0UrblhYcnNnWFVvUDlNcnBQZGpNcFBVM2owTlZVNVdyaEwwVVcv?=
 =?utf-8?B?QlRRVDJGWklVTVFMMGJPQVBMQ3ZkUnlJN3h5UTF6SElQcWdBdlgzazREcGh6?=
 =?utf-8?B?eTVYRllVVUo5eUIwaGxMNFY1bWlFMXMxMFpIQ2hBdVNDdGF1TnpWTm5Jd2xF?=
 =?utf-8?B?T0pXakZybnQrOVhmYTFjL3M0dmhZQTRDOGFNQmxaUktNQUczNC9lbU13VGQz?=
 =?utf-8?B?SVhoTGpxTEw5VjdsYVRGazhvQUtOa0hnTFg3MUJHZ0U1ZzloWEc1Z0crQ1Zl?=
 =?utf-8?B?Ymthdlo3Nmk0b0YxYzJjbytjTDlLWTIydXJYeEl4VG96Nkt5dUtiUjhNN2RB?=
 =?utf-8?B?UVBxaVVKWDUyNVZIRjcycVkyMHBCQWpoS0xhZ0UrMGxLZjg0UCtVQ0R2eWhR?=
 =?utf-8?B?MlZIRS85SElJODR1OEdhMUFDVDJJaElNMGRvL0VCcTZuSFdSVXoydHFNWGsz?=
 =?utf-8?B?SDd1REF2VGowNk03dVVNNXVGOU9xMG5WdEdKR2o0dS9tMzFjY251ZUdLTy9M?=
 =?utf-8?B?Z003VVI1Ti9UR0V0YjBaaFhrdzRjWmdNK1ExT0RLYXJNbFFUL2VualY2UG1v?=
 =?utf-8?B?c2x3NjZKeXVRWHc2M0FGU2hlKzgwcnRqUVg0MlpCaVFPaDlBN21McUg0M3g2?=
 =?utf-8?B?NG5BMDhrQ01CSGNUNS9xbVdZV29JbUY1YzFZNHFMc29ybjZLZWdUN0NmU1NW?=
 =?utf-8?B?b0NiQmpUVUdBT3lXL2hXTjZ0YS9uSmk2eUp0Rnd6RFZESXZFTlhDd09CdS9K?=
 =?utf-8?B?VXJBNXRGRUFuNTROT21uR3k4M3BSZG5TRUJjS05mTFY2QzJxaGI4WWpzUlg1?=
 =?utf-8?B?ak1kWTNVMHREUVhvWmhSV2YrTXFGQ2pEVC9BSW5VWlAwQXBXMnVtS2d0Q1ZW?=
 =?utf-8?B?THBEWUEraVEyeHRFVStvcUo2N20rNmFzaWFQWWVZNDRSTktIakV3TnZhT1NU?=
 =?utf-8?B?bjNRaS9iRmFHdWpWV3dMWVVCb1ZqZnlvUlBnNi9SNG5QMVhrOEpiS01XMEJn?=
 =?utf-8?B?TVNPaGZwZkNsOFRYVXRBSHE4bmxXenNKMi9OMm5rdklyY3NJeDQ1Nm9kQ0Uy?=
 =?utf-8?B?Um82a3JycDdSWFg5QjJzdXFSOGxrWGIwSEtnVWhuRCtrcE5ReENoaVBVSExX?=
 =?utf-8?B?T0NMMTVLY084NGNFTVJMVXMyVWxDNFdwc2ZnRk9YSmJFUWZFbXN3NGVSU2tM?=
 =?utf-8?B?cE85R3d5Qlp6NkVKc0c3N1hRN3R3ckc1RTlGNVh3cHBuUlRoMkxNWUZlaVo2?=
 =?utf-8?B?VE93N2hNdnVxaVRCQTM4bEV5Q0RnZU81Sis3MGNRd254TFZVR3YxUDIxOTRs?=
 =?utf-8?B?REVHazkyZFJtR2RJd3IrcEdITUlPeFhPVlpsM1NyYWFOZ2trOEUrT3N2TVRw?=
 =?utf-8?B?QWllMUhVY1RrbHRucWxvWWRuSnFnbFNlZFhHeG0xMG8zaXc1M29Mdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c9e9d75-a4b5-45b7-d5a5-08de52fffc98
X-MS-Exchange-CrossTenant-AuthSource: DS2PR12MB9567.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 00:00:54.5090
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3OD23waGxyJkuXRbLLmNIxCFpTUWTYZmXE3A0haW9q8x6Nab/lbZVYtOrcoutXO5FyUxWAkdxoceD/aLKrV6ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9154

On 14/01/26 03:09, Pierre-Louis Bossart wrote:
> On 1/13/26 15:13, Vijendar Mukunda wrote:
>> For ACP6.3/7.0/7.1/7.2 platforms, amd SoundWire manager doesn't have
>> banked registers concept. For bandwidth calculation, need to use static
>> mapping for block offset calculation based on master port request.
>> Refactor bandwidth calculation logic to support 6Mhz bus clock frequency
>> with frame size as 50 x 10, 125 x 2 and 12Mhz bus clock frequency with
>> frame size as 50 x 10 based on static port block offset logic.
> Consider rewriting this commit message, it's quite unclear how you went from 'no banked registers' to static mapping of block offset calculation logic. There's also a built-in contradiction between the need for bandwidth calculation and static mappings. If you force a specific port to use a specific part of the frame, then you don't really need to calculate the bandwidth, do you? Or maybe only to control that the space allocated statically for the port is enough for a stream.
>
> In addition the text says both 6 and 12 MHz are supported, but....

For Current platforms(ACP6.3/ACP7.0/ACP7.1/ACP7.2), AMD SoundWire manager
doesn't have banked registers for data port programming on Manager side, 
so we need to use fixed block offsets , hstart & hstop for manager ports.

Earlier we only support 12Mhz frequency with frame shape as 50 x10 with fixed block
offset mapping based on port number, i.e. For example for ACP7.0 platform,
we have two SoundWire instances where it can support 3 TX ports and 3 RX ports.
Else condition logic points to block offset calculation based on port number.

amd_manager->port_offset_map[p_rt->num] =  (p_rt->num * 64) + 1;

Now we got a requirement to support 6Mhz bus clock frequency with different frame
shapes, i.e 125 x2 and 50 x 10.

First, if condition checks for 6Mhz frequency. As max available bit slots vary
based on
frame shape, we have implemented logic to calculate block offset for a port where 
it should use fixed block offset for that port.

Will update the commit message, add comments in the code.



>
>
>> +			/* Static mapping logic */
>> +			if (!amd_manager->port_offset_map[p_rt->num]) {
>> +				if (bus->params.curr_dr_freq == 12000000) {
> .... this only deals with 6MHz bus clock. 
>
>> +					max_slots = bus->params.row * (bus->params.col - 1);
>> +					if (next_offset[inst_id] + stream_slot_size <=
>> +					    (max_slots - 1)) {
>> +						amd_manager->port_offset_map[p_rt->num] =
>> +									next_offset[inst_id];
>> +						next_offset[inst_id] += stream_slot_size;
>> +					} else {
>> +						dev_err(bus->dev,
>> +							"No space for port %d\n", p_rt->num);
>> +						return -ENOMEM;
>> +					}
>> +				} else {
>> +					amd_manager->port_offset_map[p_rt->num] =
>> +									(p_rt->num * 64) + 1;
> ... and this doesn't seem related to 12 MHz.
>
>> +				}
>> +			}
>> +			port_bo = amd_manager->port_offset_map[p_rt->num];
>> +			dev_dbg(bus->dev,
>> +				"Port=%d hstart=%d hstop=%d port_bo=%d slots=%d max_ports=%d\n",
>> +				p_rt->num, hstart, hstop, port_bo, stream_slot_size,
>> +				amd_manager->max_ports);
>> +
>>  			sdw_fill_xport_params(&p_rt->transport_params, p_rt->num,
>>  					      false, SDW_BLK_GRP_CNT_1, sample_int,
>>  					      port_bo, port_bo >> 8, hstart, hstop,
>> @@ -1093,6 +1130,11 @@ static int amd_sdw_manager_probe(struct platform_device *pdev)
>>  	default:
>>  		return -EINVAL;
>>  	}
>> +	amd_manager->max_ports = amd_manager->num_dout_ports + amd_manager->num_din_ports;
>> +	amd_manager->port_offset_map = devm_kcalloc(dev, amd_manager->max_ports,
>> +						    sizeof(int), GFP_KERNEL);
>> +	if (!amd_manager->port_offset_map)
>> +		return -ENOMEM;
>>  
>>  	prop = &amd_manager->bus.prop;
>>  	prop->mclk_freq = AMD_SDW_BUS_BASE_FREQ;
>> diff --git a/include/linux/soundwire/sdw_amd.h b/include/linux/soundwire/sdw_amd.h
>> index fe31773d5210..470360a2723c 100644
>> --- a/include/linux/soundwire/sdw_amd.h
>> +++ b/include/linux/soundwire/sdw_amd.h
>> @@ -66,8 +66,10 @@ struct sdw_amd_dai_runtime {
>>   * @status: peripheral devices status array
>>   * @num_din_ports: number of input ports
>>   * @num_dout_ports: number of output ports
>> + * @max_ports: total number of input ports and output ports
>>   * @cols_index: Column index in frame shape
>>   * @rows_index: Rows index in frame shape
>> + * @port_offset_map: dynamic array to map port block offset
>>   * @instance: SoundWire manager instance
>>   * @quirks: SoundWire manager quirks
>>   * @wake_en_mask: wake enable mask per SoundWire manager
>> @@ -92,10 +94,12 @@ struct amd_sdw_manager {
>>  
>>  	int num_din_ports;
>>  	int num_dout_ports;
>> +	int max_ports;
>>  
>>  	int cols_index;
>>  	int rows_index;
>>  
>> +	int *port_offset_map;
>>  	u32 instance;
>>  	u32 quirks;
>>  	u32 wake_en_mask;

