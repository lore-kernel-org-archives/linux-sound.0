Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0B319E966
	for <linux-sound@vger.kernel.org>; Thu, 22 May 2025 21:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747948388; cv=fail; b=ec5uJIa2CBlSDhPCMZ7bAVF32jaxwYxniKbmIF0yl3QxT5tdbCjLjeBRSggC6hYq3+35gMqIWl6ZczVTOXcU2CIO/IXPFz0BmoBpwpplsmdxeq9cAQwsnOLGeUuJot6AyXAM7DK745zRGu/E4AaetTZjoiFOk9+wyZU4gf2vBtY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747948388; c=relaxed/simple;
	bh=K4759TnmjCYJozQ5AFbmQ9+nyzuWAcLHsNvSXMSR42g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kfF++QlfPfLD2UX2iQkDZABxoaR1ehRx7T7JuaWvELomidnnTCcIhPoWXkBWElqK/Y+tzeGFIPnsNyw48Azk5cnObSL9raHgzXSTQRtHJLgx0NVDqjQEavzhZiPNDgc4rXd+YwJlhbhCY36aYR5ipVv9eG0akfJR5QQr0Gvx/0k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pHavrWIx; arc=fail smtp.client-ip=40.107.92.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pHavrWIx"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v2rpkkgFacPKISljuymIYGvxKVqRIS27viVcqFur24M/N45jrDhyB3FkpMz3MTv7FB2PvQI3XTCM0fXiMKrCBJPh2TxhUWsvPfTDQ1JPnv6lGKPQHQGQpumB2WDSN4gC/NTxdqm1YXQBFwywQ3jD5d2B2ZnDfiZFZZVN9yK5ZIcbW1GMCoOZ9HXAl/l2twirEJuAaxgXhihjqbBUTy5Emo6zx7bp2wLkZC/M+Xl13zrSQHaXhsh28YvAaHF98A4ZKfltN3sbIEyMGA5bkantYcdc6+tAh2Bn5Qb+DLmSE8A1U+uvLbo7j/hRJC/augaw/fcobtwOTyEj2BMNE7yDpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RnDmLM40+ZCDxX0HtWoy/dEPnGcT116VHRiwiYq9Kgo=;
 b=GSLiKAwKw+FlaCTK1+XYFhKFxWvNuGw/GxJt8NMvaJIxnI5NLOFlCtLWee2sHjiCmiQ93yVONyD/1TcWRelhzyH+nHqy/Rs3d3P3d3RGs2FdfKLqynffJsKzUIvSsMbW+oYGRJ6jXT4I1V7btE7uj+ryx7qHv57QrUIIjuwMjTEF+2GJ52kt7zJJvlPZzMXPsBPQ7ytw7m1+JPXqtjUuGlNoXRj6cQQifs2UtB0M8UZ0OOrn0wJPqTmX6TnbYzDSRa7zl70EQLpjeAE4i0ES1RZZUw8eOcAAp379BfOCI/ERe1SV1SUxhEYKUqK5DKz/RVBOUOoHMEKulwib5nSi2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RnDmLM40+ZCDxX0HtWoy/dEPnGcT116VHRiwiYq9Kgo=;
 b=pHavrWIxcHkeQFZtVSFClrKB0EAagPLjkZLaKBSVHBsDzGno0RKQTu4M/2VkaPg2EC0Vowu3GosMO8PZZKO3fzzw0tlwRGZxDQO3TKPPJZO4y9NPehCgO9L9NTEg8IyXiAKQXhfFQ2QR3DBgOI6ZJ0DnlfPmWdpTgJbz26qUISMDkx4V+gjlR7/8sEdkT5gGUq2kXleUn8W1je/vqmA9Sn7tpxJzqi5o7+V7sKSeB4C7Jwm55Ey6L71HVZX/6JUAEyowEWq1fhjl1GCRMurkyDgy9UltxMnqceXiWo0US3yAsYm3GAr90NgJFLLVOQY4axBH9gKf6Rg5FPxri8lvDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA0PR12MB8422.namprd12.prod.outlook.com (2603:10b6:208:3de::8)
 by MN0PR12MB6222.namprd12.prod.outlook.com (2603:10b6:208:3c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 21:13:03 +0000
Received: from IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650]) by IA0PR12MB8422.namprd12.prod.outlook.com
 ([fe80::50d8:c62d:5338:5650%4]) with mapi id 15.20.8769.019; Thu, 22 May 2025
 21:13:03 +0000
Date: Thu, 22 May 2025 16:13:00 -0500
From: Daniel Dadap <ddadap@nvidia.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-sound@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] ALSA: hda: acpi: Use SYSTEM_SLEEP_PM_OPS()
Message-ID: <aC-TXFqOunR0gauz@ddadap-lakeline.nvidia.com>
References: <20250522204624.1757-1-tiwai@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250522204624.1757-1-tiwai@suse.de>
X-ClientProxiedBy: BYAPR11CA0047.namprd11.prod.outlook.com
 (2603:10b6:a03:80::24) To IA0PR12MB8422.namprd12.prod.outlook.com
 (2603:10b6:208:3de::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8422:EE_|MN0PR12MB6222:EE_
X-MS-Office365-Filtering-Correlation-Id: 48acfc06-c8a2-41ee-db67-08dd99757071
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qUxadUhxFzr5nPI3jO86IqefHO0A9y6PJAGMFar2S9JdEC3doEsVntIoRwQN?=
 =?us-ascii?Q?8fpCaKGzBKHV6Gs5wDrJp18dLF3qh3YNBqaJ7SYEAHZQmscgcFtgV9v0XCSh?=
 =?us-ascii?Q?g97fASGN9eVBsR8s3Zarw0/GUqv8Lfg9hT/J20E0hy0czadBuZMlGuoWfKtf?=
 =?us-ascii?Q?D2C1CeHnuJy1IwncJOTTmxpeZeaQtjfH2eOUJC+V9K1p24k6fIklK+8w+Kxf?=
 =?us-ascii?Q?KgJLMP0pPLsm3DdUeF9Lk9PTM1UGERuk++gNKorU8QOBHT6RyJqA9fO2324+?=
 =?us-ascii?Q?SjZEajP0Ppe79yeX/4TjnvCLVYgE4QsMpNWtHWfWguHWFyQie0KKOvp8kdHf?=
 =?us-ascii?Q?PCyiQdCJR691/1oLc5Rrr+NyHy9aCJ5Y7OF7TitNjjl7SEKk0ZLp6oq0Mw1H?=
 =?us-ascii?Q?IBNo3Ok984WOeIAQIajN+DZ8MJkGNsrjpRPE4u//7S2iCDlU4pknhljFVK1Z?=
 =?us-ascii?Q?lN6UoQCKYa9TvASek2tDqmAjC4TC3rklKJgfRm4bya04nFQkMk3PAivVUgoo?=
 =?us-ascii?Q?ypr+QGMlmIefCBiz+HzLncKPy7hPlrT2b63/SXuXG1T9v8K2vxbZj4gtvRCh?=
 =?us-ascii?Q?aMuuAQtMHmMz6s2S4eZmPY05+vf2eqdpwsPLtP3+KRm9ejrWD5Xt7qvOoseO?=
 =?us-ascii?Q?S+yB19hWYyfa603RhAwJh4VkSKSMO3HyKsVOuzX+KRvDWa7koimJ7TX0dhIi?=
 =?us-ascii?Q?ybLQnK6fhTUlRwntHix+g3ZP8YSk4if1yqYKpYlTPtCDSzIO3YT82lT3lN7W?=
 =?us-ascii?Q?SgnprMnQ1yCDnbrqMsxn2dtfaUbqyAE+lJ7AM/QhOzbEgqcEGdvv/9iNK0vE?=
 =?us-ascii?Q?GeOELA84r3ja2mPmt8m78aXF1wMSQMS0gbWItppx3+m/ZKkxny5DNFm+LALM?=
 =?us-ascii?Q?TkoUiIfTkzxVtURQ2hR063ZhMInTctLbZepJBudviHqpTFv3zvWfx6waS4XV?=
 =?us-ascii?Q?kbaas+njsZTdcDRYIdueQu0cwv/qGGPxgvzCUQd8hkHZXXTLeYmzbvVM3Bpa?=
 =?us-ascii?Q?+RBQ8bdE621GIGNq5oHLc5X56Uq6qedNCXWHa6+Q5WluQxC6LyiDYHiNu41p?=
 =?us-ascii?Q?zPli8fLsrygPodY5FTnyEZ3LOKs5EqfWvNJ+YN+uTqx7EHWLQY27yCWJqZbm?=
 =?us-ascii?Q?tMUMVcABAEFXKDwYzuW85etOuh3dqwUIdKbcBpRIJu6mISH88G83BLTFBM2F?=
 =?us-ascii?Q?h9URaM8/1q1+e/gdq+i0HmH8HC4jSTBFWrt47zl0W1MvYyt+bWSzvllWgzEd?=
 =?us-ascii?Q?8pRnr1O7waa2vf8jiEKW5NK/bzmqjFW2O/9RFyV19kck+QvPwf8ziX/T0AP8?=
 =?us-ascii?Q?m6g74kGw2N8CHmxwILDlj9feonLnWWAjtKLECzwBIhWpPqmhtxS4oHVeY2L0?=
 =?us-ascii?Q?FcWsLbqvnmb+qj41RzTaT0N0XiPcnWthjfbXAnEo0N0lhIe+ObnG2+54hBhn?=
 =?us-ascii?Q?Rb5msHtSTrY=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR12MB8422.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lflP6sHv/ptN7Ukhn1eMY7bXzRNO+iOEvb8C5mOTYmLcg2z0HQu7eylm4iKO?=
 =?us-ascii?Q?cldpjZekxffwDeO6l3lMaGlbYOJHrjP3JDXw8npEjWKGmGsHnZjPLxFZfFHM?=
 =?us-ascii?Q?q5SN28A15UO/G0f3QV52S5rGj0RC4pIZtvWhkweDXEyL65GLgtZugt9Odv6n?=
 =?us-ascii?Q?A+gZ1EEaT17YkfTGE6jEqfzXwlHnnwroFQPSexwEL/AkouZemVmKB4PSptzc?=
 =?us-ascii?Q?bAKjfV1xCRvBHfTBddxZA/icQNq6nCta5oYWrBCcjdH0E9aRkqcg8mgZxKf9?=
 =?us-ascii?Q?Ufyp8FoDvyaP8OTpHeGNWSBWMnWnsEduvDP1017U5Lcia7IXnH7qztu4cyq7?=
 =?us-ascii?Q?a14UmMYaAQp2cq0gfWNclf+3F83gxgMysFOzpDgNYjG2nrEKtLXX3AjhPh6S?=
 =?us-ascii?Q?Wuzz83FU6ho5IvOtMkB7pmW5nzHieyHDSMHbR7SGbNC9mqvMUhmSXqnM6dEh?=
 =?us-ascii?Q?SvohlDPMTWF6JH3iJ2a03UHpMsZdcHIr9sqkdSopg0zBqrz3ukAV0oCeIVzO?=
 =?us-ascii?Q?Yl+tsR+RRld0UmglKmRBahoAXhIVEw0pt+uQ940sxvu/+Q1zrCxwn30LQLAs?=
 =?us-ascii?Q?QjUOCE4UMRk+0vf6ljL9p4349vaj9thGOf3GqjDuAhTKVAgZIAkRhiBA/bJD?=
 =?us-ascii?Q?O4c94dSUWWWj/oYvypSpkkYSZ2ciMw8joZG2ZuqoEjemtV86jv/UAB43tWhe?=
 =?us-ascii?Q?lYoJzUL4x07U/h7RmiLmFPUam+r9+RWvzg6WPGXBSilUDjvK3G9Ff21unJxa?=
 =?us-ascii?Q?pTegV6mN8XPelUtnhOw3K8KTcjsaGWy8fenjvC19awWPWJ86fu9VRh8yVgTs?=
 =?us-ascii?Q?5CkZ3xwIdh/R6Mlj6raxzYjAfNHzK/12NZLPLpROnYaY9WBUdUoB4VT9GppI?=
 =?us-ascii?Q?0/BXyjOJr8vuUSbw4V8He/0Mm2RbheFQnb5EFccNU5RoqBsOBzsHQ3EijZgH?=
 =?us-ascii?Q?zyor14Rw2lcxOlm4rSzfRnPCVkXq1czcmgI60VRNPT9SiYi+tnUY5A67ITue?=
 =?us-ascii?Q?Bo7cGCFLJmnQNNRLiSI0Xf4jxS2tXn1GiI0Z+sogMpxBbm0Y4mfly+da0YZa?=
 =?us-ascii?Q?gwaQ4Tu7fQTzCmoxsA4Wh4b+zcT71jQ9IWpcQcjvWF/PgPHRZurGe2gv7PfB?=
 =?us-ascii?Q?tFryYeUSkYx3z/7oddeSikbdW5aZeD433buyt4Qmch7gj5QimVEAzLmv5Q1T?=
 =?us-ascii?Q?2u54xzVp6ZNyIlqkhhgMTVlTa7710Qa27AihvX1FrPP7UY7nOFJORUkZvR57?=
 =?us-ascii?Q?X9MIaaLIhCLGvNxSV3uBhqgMMSF+3c83GlYeISHn9QAbofG73ef6v4bYNc8q?=
 =?us-ascii?Q?cHEVMzlVKCD1c++mg7GpYcgjq4+lfuhUxR52t8qM0CmHF427q1tu90ynmusW?=
 =?us-ascii?Q?Sjwnj5A6YusToRW4JMd+46kYwlyoF5IQ/mwA4bgtdJeeyrFZ18GVeTf423Hm?=
 =?us-ascii?Q?NzRmdHxZqr8iBwOdKxpM3lFwHEAnuBhD3Ikfs+prgir7QDDQs0kdUGQhjpKf?=
 =?us-ascii?Q?0j2zevYCvkVYAlXmI/DxKin/n0inHfLPgg0LSBGj+FXD+8RxiWZW47KZTpqd?=
 =?us-ascii?Q?uwYPe9uhGlG1QwMvAfpYflZOccw1y28ANq6znC09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48acfc06-c8a2-41ee-db67-08dd99757071
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8422.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 21:13:03.4084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2fqiW3YYYx83k6cMBVuUVCLAgDcvOBwrWfP+J1eYYgckjqzJTSVrnyElcunv/QGRX51+GWDKlxtHd+AhTT65g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6222

Mea culpa.

Reviewed-by: Daniel Dadap <ddadap@nvidia.com>

On Thu, May 22, 2025 at 10:46:23PM +0200, Takashi Iwai wrote:
> The dev_pm_ops definition must be SYSTEM_SLEEP_PM_OPS() instead of
> SET_SYSTEM_SLEEP_PM_OPS(); otherwise it leads compile warnings without
> CONFIG_PM_SLEEP.  The latest patch version I took was back to an old
> macro (likely mistakenly), and I overlooked it at applying.  Fix it
> now.
> 
> Fixes: 4b214c9bbe26 ("ALSA: hda - Add new driver for HDA controllers listed via ACPI")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/20250522203020.1478369-1-rdunlap@infradead.org
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  sound/pci/hda/hda_acpi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/hda_acpi.c b/sound/pci/hda/hda_acpi.c
> index c90865ca876e..513f8fde198b 100644
> --- a/sound/pci/hda/hda_acpi.c
> +++ b/sound/pci/hda/hda_acpi.c
> @@ -293,7 +293,7 @@ static int hda_acpi_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops hda_acpi_pm = {
> -	SET_SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
> +	SYSTEM_SLEEP_PM_OPS(hda_acpi_suspend, hda_acpi_resume)
>  };
>  
>  struct hda_data nvidia_hda_data = {
> -- 
> 2.49.0
> 
