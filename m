Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011037.outbound.protection.outlook.com [40.107.74.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D98211C
	for <linux-sound@vger.kernel.org>; Fri, 25 Apr 2025 04:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745554581; cv=fail; b=S/kOf6Biz40eubwj10WffkwDrs6dkjCAC2knp446yx4ZLGFlpBayRQbn/W3uB7JrEzpApB1J+JCPHIex/gCxOP35QzeukXnm8IcKTmrsmBPdFgjkTT/uYLBTKmzySWtjiShxILpmk5pMWa0JicimBmjdx6aN7t/Kcw+kBYu3Xgs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745554581; c=relaxed/simple;
	bh=QEcm7rItECgo4qilCBl8vmc+3dyj39mVXQgne7fgEzI=;
	h=Message-ID:From:To:Subject:Content-Type:Date:MIME-Version; b=nsDOIKHeGUesqu8KIRJVnIvUi4zSPfCBRp6iBvwXVQdAAGKpZ6s9VQsa6ch/iq3/2eCScykLnPLPzaCI1ZVyrX88KFdMqBzybz8TNK7EjdWjR5UcaWqatUg4jO9aCL5aCFZceNG2820QRTtmheNMwnDlvo/8dlaqa833adToJYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dZNwWhB4; arc=fail smtp.client-ip=40.107.74.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dZNwWhB4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AW+AJYoD0Q3bxf3tkamYfQXaZu/iLMDupT2H+C6Zk4XTtrBkJ18PSYM25LIWcWBiy7uXumPNUBYlU95aE7rN5r3f84GmZBZj7MTpqTJ0UKlWw05lYyXHHYCpmMumskyIcOhIyeKli/RMr3RIdtwJfI9WsLHRUFpc2ehK7fCA2jtuV7Q3gWQQqXYXDQd5isWXAV5dJ60xVMbqKoLD3wsaz+qfa1FnJYdm1pil7D9pnRx2W4UEsy0vU+QN8VdKJoePE+JH08gzb0m1OVu6e+tGC0+dXihe+PMBGeZqAkfgHbeTOTkKeiGeiUPrBtTc2338JccUUo3v2AOaSwXmngSsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sAeKz2qzZYTpNGrugi8rR5KkO2z1PX2e4pvrF0ngKwM=;
 b=lbgvEjdrZqj7aKtb63gZ+lFtMPbF4C2syTmhjnq2g2L2ZNLKQsqWrOMpOZQlgPCElM6iq1SpPE4JoqVXwYfgRIzbBfRMdWjQOEDd0lkF5kMfSGtYo2noIV+AK+hbNJLcecwntdgu9i0D5Ixnjiog2Hj7Y5nDRBJgpt4G/e+Q+oNvioNpz4CrtDp/BLmyCnpZd05Jk0rszXLa4G+1hTMNzzhvBeCmk6sTx4MUH5mXakLk5mfdJHAvB1J2VgeFa8qb8raUPF5kZy/qn/Zz1iMcgGJpV72YcUMtTfkHZzUx9dVBk+T3Tp3SwoM9RivxGJy6W9t8fwJ7ogj3enggF3BhGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sAeKz2qzZYTpNGrugi8rR5KkO2z1PX2e4pvrF0ngKwM=;
 b=dZNwWhB4/pGLyR6v5OrRGI5uUoSO8NkSz7fRwVzgFJwF7nK9YXxsZHE0XS0+hnVrQbuLr+WOpNq7tneF+7sGfTjYp3P1XB/7p07qTWVUZq/xQrzQsUdm4G+k0poT3wtBXRb29MSXIPfvZvGH7qJr1zKkimmOZylUZ+OQUiVXx+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14) by OS3PR01MB8066.jpnprd01.prod.outlook.com
 (2603:1096:604:170::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.26; Fri, 25 Apr
 2025 04:16:10 +0000
Received: from TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8]) by TY3PR01MB10906.jpnprd01.prod.outlook.com
 ([fe80::592:9b7b:ef57:2dd8%6]) with mapi id 15.20.8678.021; Fri, 25 Apr 2025
 04:16:10 +0000
Message-ID: <877c38dgfq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: linux-sound@vger.kernel.org
Subject: Question about conversion kcontrol to component
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 25 Apr 2025 04:16:10 +0000
X-ClientProxiedBy: TYCP286CA0141.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::6) To TY3PR01MB10906.jpnprd01.prod.outlook.com
 (2603:1096:400:3af::14)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB10906:EE_|OS3PR01MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e652371-7333-46e6-d0de-08dd83afe8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FW2gD+/uw3bNa/cQYeqPBbuTUlQbWl1i4wzVtW6WM/4fT/mwWKoihRi0QYON?=
 =?us-ascii?Q?Spa3XOAo/Q/knG55g5FXHMJDB6SNO6/GYFXtctKirh8fRTXvLlotXF34/D+a?=
 =?us-ascii?Q?2z7kYtKJbUYMyHsjcdGtM1b9AYMJVv5gztdalYYI9cQHLiZb94pqgtZ+R9vS?=
 =?us-ascii?Q?FrCxrWRSJzs6a8vnq2ZPFRsuqarfVhgHswQ0EZwlzsbwSCIXED8qKJqDK3FZ?=
 =?us-ascii?Q?J/G2nAM/FvGCAmyjV5OcoTRGedHvic94VwzZxlabIQK0TNs41ukCty726IEC?=
 =?us-ascii?Q?KmpYFgYJPjG2mRf3GCvSmOhJUO7mXw1k+fKL0mUez8CI12yKUQEOZ4pl/Iem?=
 =?us-ascii?Q?srUgLHglMu3q5YGngHHLSknQlfwESqGdXAd77cMp3sye035YZuwvQBwtBtGj?=
 =?us-ascii?Q?r1Yi9g0hK1sdeNW1ks4riqyMRUqjFwzorqy0jzKQRlx5Vcv/MUAKoWHE76DB?=
 =?us-ascii?Q?rJ+x8eXl3RJtxDUx+lHSFAcL3SneS3vUYtPFAaCg1GVKZcA/ynSypZd8/1Ai?=
 =?us-ascii?Q?3tysTC9tdCSnveGpP2678tFgUNBOGYBncGIXAd5y4PZ9PKhD9lkd+mRE3KZ6?=
 =?us-ascii?Q?312fz2AG9EJWtEXlbWkURs3YmMUxFZToa07iU9uVi40vehIANLANg2TKMzkx?=
 =?us-ascii?Q?5dXhc6hL+6xcOXumbihXAc/i+pZCpmrudD343481eOBU0L4gQ99P3CTXX5nz?=
 =?us-ascii?Q?F/VxMEO4GDodu/1qan9b+n5a/bqhu2nSgb8159vucof2FbcNI801naFXvfVm?=
 =?us-ascii?Q?r5b3fXD/OHPZzInXMo55P70uI6b1PC1oHbjWHoqoOUXzq6o4T6KmPYIsF7dw?=
 =?us-ascii?Q?fwFCPyZPbYkC/OF6ZMqaQ39Kirp4RnocK2AVYljppfaNhgW/mVU4zwJxiI4V?=
 =?us-ascii?Q?4mIPuhhuv0uLfPS9XW55gU+6+vaABlvR+WVpYKX0z9WIyk4spdfrILYpU+QV?=
 =?us-ascii?Q?v90jQphT1LC09nktp1MHk7P+Zx3dAhfYCmgGXwvmRzU3b9xERDmJZId/7bjd?=
 =?us-ascii?Q?27QQw7UGsdfiavUU2naV7Uz+ubCWJV6Xu2f5tkttVLEgVd3412rbyKNvfs3l?=
 =?us-ascii?Q?+z3LfXWiZKl3DrgbgixzRdU/l2oikKooYi9Q//2pZWm+Yhu/L3+8VGDKLVHo?=
 =?us-ascii?Q?rfLV46GzN4H3zi9Iy2lUR1gt5kw/ibRS5OQ7VG8CmeKGbBTB3Fs++grY4nsO?=
 =?us-ascii?Q?CWc/uN/mUzGBJNcPAhI1tMDqhJ4qnszo1uv0RXZMPqBKC19hQxAN2Tiy5i9f?=
 =?us-ascii?Q?DEqGuXoSrkOQ0sJKP/vwsoBBBQ35beW7PSHMUVFarjLriiU5UZxjWrDnSyFB?=
 =?us-ascii?Q?eAGx7fGxRgH9folWfZ0AkPVCWjQ5CqL4tg5J8Ag77idojkgAgMB7ahd3enBI?=
 =?us-ascii?Q?n3t6q6AMWbtNj6lKlo7SLWtm9VYpiLsr+N6lMO1PCof3YWSdrDCo0cQ7NSk5?=
 =?us-ascii?Q?d4fqGbDedQggNloPQkzObr4Fmw59rjto/THsutt0DeoMTpWNvMT0ow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB10906.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jVJPBdA50PRHfPwNhUTc69/cMYTgKoeV9ijZwl5re5mq2CECdSv07cm9/ioF?=
 =?us-ascii?Q?WJsYyQRDJs5yA6+eDCDyLx0IgKQVNX7qJiKeNAVzG+OkTw9l78kJZVSd7Sdd?=
 =?us-ascii?Q?wIYeubsK+Edeq44A+e5Bzm//5OpNGCQrVrkpw1KS7Tg+BVNqFrJzrMCU1UmX?=
 =?us-ascii?Q?9DJGGXqxKD0GQgg7+8JpHN7OcCl/6bDkGmpubqiQ+3vra3JrttZ25H2MZawm?=
 =?us-ascii?Q?m0faOCaEHRqbleNnG285ZPrWeJYH+Eezja0QksLKZkIV6VLqfKO5i7CcsBNI?=
 =?us-ascii?Q?yakbr0bOhvD0ZCCs8uYC+4IyFRuU5NcCkBL3ps98csVDFidccHZyxW4XqXhG?=
 =?us-ascii?Q?ArlraHVzNQfyDIkUTXlAnXE2YLS6E7lV9U6Xtkk5UB1IrJSYRqYGpoCCiJiL?=
 =?us-ascii?Q?8VGXYo42ixbVHfFXGYLfPskdHqZ1VKYRq3EQbSgNszv6ihDQkdbt9ybOO2my?=
 =?us-ascii?Q?K+FDll3ChxOdgud9V/wkhNL5ekrsCY6HC/RfqUKCTQWRBMVS4rjEaYlO91wP?=
 =?us-ascii?Q?HHP8aEzjdXMKTKOtzLej5Y5mmzS2YxOuMTPWPhmX8F/PA9++8m1e2nOBphaK?=
 =?us-ascii?Q?Fa92DbAwdz/7/z3kZzyBnhXeT/7uT+JUy+IYu3HcxH1ZpWnucv3jnGaWLk7V?=
 =?us-ascii?Q?d4k5BqOOFSHUnMefcmmQFyyMZcHtajfqgaguR10KQ/XLYWbh9vVmOPUsEVID?=
 =?us-ascii?Q?nZ3yCMTbTi1qq4tbCqqtrIpNKn7nMLGHXBOGwxU25GqJP9u1nfJ0jQNLIEIW?=
 =?us-ascii?Q?0GG4utxnpgyjfPDBbVOXbyMcYuYPNVKx9+KQC6xSwCkiplZKtm1OcErEjfB4?=
 =?us-ascii?Q?nrnm34G1fIhhIgEg96NogquPEQ5kp3HDRPg2ptuZOPW6iG18ytmintsPDJwO?=
 =?us-ascii?Q?hvzfbHgb/1ro79QeHP+d8atY+SrhRD1xv1w/RXB8lGC4KC4lqYs/7Z+HTqcc?=
 =?us-ascii?Q?7fh2H42rf5ht7BrTvc9UyTy9o3/8Vm1Ijo/84APAC65CY4WJ6l8FJhoe3+FA?=
 =?us-ascii?Q?RMhyLGZ+8y5VXtPgGC8wsV3TNV1qUVktlCahLFZzKn60wj+Yfks8l8AXfyAl?=
 =?us-ascii?Q?2zZCM4w2/KcNHn3Ih384HiYPLzf0KYXnpLDFFAj3Z6j/Ksqc+H5jH3ODS4E4?=
 =?us-ascii?Q?5rMvZDryrzsMfgySC6N0ND17kZr2BuMsvGAt6wBGXero152n1akbOCSW+nZ4?=
 =?us-ascii?Q?N4z4r6eaZnCiSbpYud7+0fV3PrWZFBJ/yjY2Z3LA6H8vTR1q34j1Sv15/ei2?=
 =?us-ascii?Q?legpKk5AZPWa3U0CNrSF3sJw+jl95acg4M2OyltEbMVjYiRvVeD6wtP49nbI?=
 =?us-ascii?Q?a5mHf/ZKovs7Cy5D116IUcTF0r9O4qI15MRxipdPpj11ePUvsxcq3ZG160r4?=
 =?us-ascii?Q?4AwecJqUxqWkjWSVQznuKABfQWHOYnUHbYXLOmnn2VxqoOGkJT9c+/+yz2c3?=
 =?us-ascii?Q?EbMuoeiuMtbnsCtVilXQ+3IH4KQIEL9OsCdATx3ZCeuuXiVtNFAnMWYn1WGI?=
 =?us-ascii?Q?nXxFjDmNLopvANcdoRBNiAix8pzUvI8TWXw66kkP5r331tDB01Ck2I1gP5HX?=
 =?us-ascii?Q?mtHVOb1soLXXPYvyWe3fAIRgAaARWSIHCDSYI0SshWdLIF3ikMWxHp0qhGbl?=
 =?us-ascii?Q?Z28uIoTwpJ42xnQs1WBI+qU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e652371-7333-46e6-d0de-08dd83afe8ab
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB10906.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 04:16:10.3492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3vxwTPoSgNAjhucpRkmqrWM2utCZwDO0fh4Vri6aPFHq+OgYRxSyiD7IZtVldyBtNqkPdKRI3tAZNxTIETxPE04lV1e7oE//xvwP1BLpsEjg3dUvDpG5Ed4DfYimpek
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8066


Hi ALSA ML

I have noticed that we have similar functions

	snd_soc_kcontrol_component()
	snd_soc_dapm_kcontrol_component()

Both converts snd_kcontrol to snd_soc_component.
I wonder can we merge these ? or which we can use is case-by-case ?

Thank you for your help !!

Best regards
---
Kuninori Morimoto
