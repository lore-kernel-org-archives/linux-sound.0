Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528FC32C8B;
	Wed,  6 May 2026 10:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778064893; cv=fail; b=c2yeA/z3Pobcr6nIkbr/XfYtUZRPy0cs1yj2nWJNujxBEdYaZjPuLWEHPKO2G70B8BcIH0uuMkWNIXK2pTMlL69BZHVBBi5nfofWlv/X4Welj0zacPetwp3Esd2mqAT2u9vsTrhzh48X3l/1c7H3etIMtYPdGecz7CmLNelI1iI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778064893; c=relaxed/simple;
	bh=AOkuL3dIuiQ63wJZj+vY33eh/WEaIylEcGWco4VHTqY=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K75yoEOx5H7N4OdbpZK7Qojg15NQ4Je4T3bKyNPfCy9untw/3299SUyrxawzEpL1oEavyuMtH5Q7GRH8wnRJFCq8gv4gOtv1BUNLTrjWJqBnxBCHSszDczPx4yxH/pwsHs1ovK0rBucmaBOYiHQNymGpd8C4bWQIRhesMPcOxqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=i7K7tnPA; arc=fail smtp.client-ip=40.107.208.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="i7K7tnPA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uqW+EZfD10OC2iZgex1dQB9YLc9ze7bEmpfORTybmEcxepJHl5oK4PTMZyYyOVWZ3Spp+iiaExlKccvCD9lNezC+U4Zl3bd6jH+CHtaSjhUFHhYYdy9haWKg+/aUEFy04DQEm5XDVflegNGIAwwoIYHbFlDvpF7sy96uxQEqDLElIyYHj00JSB5wzFRM+6b+SVC1BrBBCWJSy1AwLj4ZDoFhFe/4lRlKemLr3pbkH/vZelno0O3DilKT+57kUMeDJYZ20PjnIF5ved4rEOxH5N9B6nQXLdf7ctdw4ncgZRHZn1Zs7TDnrrZbtNVUoeO02Zfh9viQhpUMr8nVKReeVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QF0PSYbtG4hbiFxcpZ+S7nZJqkmEhCHdlhLbId8bG2A=;
 b=u1+Oj/FClH07jw+4GaAbi6ukPd2Y9Hy3USUQ75uacLgQjr1f1JdOikOI7bztI7ZW2QgB0FeFspeR8JCkCjBAY13BGs8IadQEglL+f5ln/piqjSC/X+lH815tXOb9pInCAhZDnufOX4PMY8mfePHi+bOdZVmuQuc0J7WdeXlOKAFupRyQg8Qn5RPqaTvl+0Ml28ajmLZzKO73TsnbuqT/WrwFgqMf63rBjs6Tlfnio1AZt9JWeMTYivXfUckrTYuyx7pHBlpvreDMi83R5f2vBjlcy+wYaCFFczMvqNp+GsQncryDzN3rV3U296AuCoceVp0xsEnVXZjPsQNTOWMfSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QF0PSYbtG4hbiFxcpZ+S7nZJqkmEhCHdlhLbId8bG2A=;
 b=i7K7tnPArGYXnDIq9zpIg8G/02zh5dgCOlLvzWGhOW0oCi8bi4OrEKjvaKp7zSq5Xj6gjZuybileZZar1FEH63PDU3zBZmjWrlJiE468NB1nxhE3WSFNMsaveSMC7d1yYViRnAePFrK++VEghJkdwdOmQvceaOKhgzP1a+D9U5A=
Received: from BL1PR13CA0010.namprd13.prod.outlook.com (2603:10b6:208:256::15)
 by CY8PR10MB6633.namprd10.prod.outlook.com (2603:10b6:930:57::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Wed, 6 May
 2026 10:54:49 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:256:cafe::75) by BL1PR13CA0010.outlook.office365.com
 (2603:10b6:208:256::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.14 via Frontend Transport; Wed,
 6 May 2026 10:54:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 10:54:48 +0000
Received: from DLEE206.ent.ti.com (157.170.170.90) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 05:54:48 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 6 May
 2026 05:54:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 6 May 2026 05:54:48 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 646AsmJQ917632;
	Wed, 6 May 2026 05:54:48 -0500
Date: Wed, 6 May 2026 05:54:48 -0500
From: Nishanth Menon <nm@ti.com>
To: Peter Ujfalusi <peter.ujfalusi@gmail.com>
CC: <broonie@kernel.org>, <lgirdwood@gmail.com>, <sen@ti.com>,
	<perex@perex.cz>, <tiwai@suse.com>, <linux-sound@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] MAINTAINERS: ASoC/ti: Remove myself and add Sen Wang as
 maintainer
Message-ID: <20260506105448.xhafxb7vtcaey6rt@debtless>
References: <20260505164744.16134-1-peter.ujfalusi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260505164744.16134-1-peter.ujfalusi@gmail.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|CY8PR10MB6633:EE_
X-MS-Office365-Filtering-Correlation-Id: 6091144a-a9cd-41de-1f84-08deab5de49a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Ae0PObwFTxQleH+UeKnE7UBzSUVV8mjsd3IRu+4wSAc+vE01RbzDbV9Hnic1BwILH9ma3SK/ucJh+tu7W4mqIHBbdpNzeI4v9vqvyVq8ucVHfBNnHYPm/oQ6GZjhVm7x5Bng4Mvk79ljTxzKv/c/EGQIG1X775ZOWxvJ44++uyrygvJ5KSO0oXxwwze1+G3XMaOgPkj5RT8P45Za8kN9tbuMlw+vMNkLtokjKLtUHTSZqhJEsHfmB80dxnjtKQTKinV/gPycjJE+Ub4Jk1nOdGMBHNdrGtqT+L+xVmHwbha6gWXsaNwMEVnJ6MSzXCNarjz5oQWWuB8m/xZ9bWWfQPx23MJpuckI8D1njzn5TiBI/+oVCO74lxrXtEIS5YmuEvBacnKvD5wflJfPpSeYEDkSsQt/EV6b/XnA1PNVrChT1ZprjtSdEsfp4BaX8TGxmNZ5c8JGcG7xAbxHxuMpbjY0PdA8Hu1rzhwQ8K9g9AYVZ4w1bsxWdt00GYIUQ7yzG5C0EQ9u4YsIpDvtpy9UC5DhN7h5gqraYpflDkH8tDUPWdEB8qRU4R0iNWPyT4SK2/DJa5HXhBxTYE7rpqJPpx7MkTZozsmM/yDol+uoLoBvkUBab+j0NHxwOruUdl7Q+u0+8F8hjfDyEGcJM2DTONqteZ3ISYB4185eX9k9Pb8WQrGEMT+WQSJW6P9YIOljVWd0s/QxSb25qJghYM2cm0wvPDcxxECmOE6o3VmCqKw=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OD5to1QfvFxBzsSmsCXy2EO9xIcM8/p+Uf4I5L47gB9x/I8prPNwv9qvfRencFDxi1vq/XNUf7NsD4Hgx1qM9MnbxdR4an9xFSp1fCqYlRr493ZCwm66im+Kdv+hoQ3Pps2ahgd51G5zw7Y5s7enZlGgE4xAks6vZ0N14OHgA/ZN9LJrbSGkh5+dJy5xCFy8SgZcXiA07gkTnXNUNg35KomN29+zdT963yweGZ/3SgmC0CahKgmeNvGnZXqRM3LyXGh8eOUHZDVc/RB45xGKzl6MhbcFKszQz9tyE3vxlfHjGeRZQ90OpQaS6QYb+oMGNkCsC6aZTz5yqbfqYDNzKl7ebUpzGxuJi8NsoRkdZIEOBzdzY7bw4UJkatlwAK2zPchRo9FE6wecNx4dJHK3b/748JtfS/GhjcR/D+GfrD4f//pof9q+Z4pHT8ZheKxd
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 10:54:48.7653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6091144a-a9cd-41de-1f84-08deab5de49a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6633

On 19:47-20260505, Peter Ujfalusi wrote:
> As I cannot spend adequate time to fulfill my role as maintainer for the
> TI ASoC drivers, it is for the better if I resign and hand over the role
> to Sen Wang.
> 
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
> ---
>  MAINTAINERS | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f1575f1d2d8b..8dd2df6a6452 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19464,7 +19464,6 @@ F:	include/misc/ocxl*
>  F:	include/uapi/misc/ocxl.h
>  
>  OMAP AUDIO SUPPORT
> -M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
>  M:	Jarkko Nikula <jarkko.nikula@bitmer.com>
>  L:	linux-sound@vger.kernel.org
>  L:	linux-omap@vger.kernel.org
> @@ -26366,7 +26365,7 @@ F:	arch/xtensa/
>  F:	drivers/irqchip/irq-xtensa-*
>  
>  TEXAS INSTRUMENTS ASoC DRIVERS
> -M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
> +M:	Sen Wang <sen@ti.com>
>  L:	linux-sound@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/sound/davinci-mcasp-audio.yaml
> @@ -26872,12 +26871,6 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/iio/adc/ti,tsc2046.yaml
>  F:	drivers/iio/adc/ti-tsc2046.c
>  
> -TI TWL4030 SERIES SOC CODEC DRIVER
> -M:	Peter Ujfalusi <peter.ujfalusi@gmail.com>
> -L:	linux-sound@vger.kernel.org
> -S:	Maintained
> -F:	sound/soc/codecs/twl4030*
> -
>  TI VPE/CAL DRIVERS
>  M:	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
>  L:	linux-media@vger.kernel.org
> -- 
> 2.54.0
> 

Thank you Peter for the years of help in maintaining this. Cheers.

Acked-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
