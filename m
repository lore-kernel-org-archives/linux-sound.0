Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1276528725E
	for <linux-sound@vger.kernel.org>; Tue, 19 Aug 2025 01:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755568736; cv=fail; b=IB+32APMRnD5RPsdtMgrDVSPA5wMxCo/3IKvkPICWKA8ugVz4CRpkFE1RLEfNMoZ7RH6tPeogJ3iO+LVd4ajcAVPi7AkxRvo0/Ci+hEJmT/XQtwgH9Hojbnu6zvO7mO/5O+AtHOxC/Iw7buwYrtpWXkeurfa7BQ3oy61Gt8DWOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755568736; c=relaxed/simple;
	bh=z1+27SeODXbEQBbjUJHYJbnh+ShReVcHcZynbOAZNoY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=QYvUB2a4v41lk2lTQfS2+6VoVQF7Sp73o6DmswY0SJcQ7L1T562xS/rwfgHNPx/PvId9DdMPNcPIyBIKUjv3NjOWn5+zdcmkRM5qzrk4tyUQIPFuQPRxuxT6RDJd15N1lxWEVZRdOP/7rWtH4M1vSkQYtOS1DAu/coqdQwR9Iwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=KiFbXoKp; arc=fail smtp.client-ip=52.101.125.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="KiFbXoKp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qTjTiSF1AAzechI+xQ3F9P37fB621aAMjEd7Poy/YKNN7xEyHL6ag4yT46i624EdgWwbRQeYtyHnMxjiSovFE/RkuRJVFNMEaEsaXn6Y0sEmftihtnQsyomDuCHWICqAAM2qmOYos+/V0O4rQPP9L7zuAQopikJQg+EnVGObX1i3s0gCVNmAm5YxS3H00aJ4VK1aXy53hL30pmdv5mDmmSKqIxgQ+jkHRalQ+0kxf27gxDkR6OkeMWGhdGTB3mEcRb/1SFq1E6XQpa1dKxJ7XUXFQUs39XFgMN2RX96HI6DIr7lnuh1Adl7G+EcULB61WtZ0Io5CNFsHZ81Ye/mLHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uaVKYNP1toDPuk6QDbwAt73j56MK5p7LbTpR6kFW/hg=;
 b=SdyT/naBVitiHMnBDQtRL/H8qrKA64dOjO9nCVuT+vcOJpKsS/lOnF2kgll/1+qRj5y0Q3IgfC/SdgD9jL4RqJaBhGpvOIE36z56SfMHJbc8q+IPrSxfCwm2Flz2/35rH+cfkXBaLXAzbVKpHn9Ntcioj82Q1ar1PdJ5AdOiM8goeQmcwlhy4OQWi7qiO4pE4MPDR30eJdDYSIvB9127ff3sbkLePR7RviV+LcA8InVj/dtMd5w2JHIY85EDeDRWx/5LnL4t0xdviCTDDs5s7wMyQzkUVekqaNRIywal5mZtcZjcKUqqMuiN2RYn+s/NykygShCRsFLb6jgueS97Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uaVKYNP1toDPuk6QDbwAt73j56MK5p7LbTpR6kFW/hg=;
 b=KiFbXoKpXDtQ2WzkxGw0rYMJh02h5hBPUMmpPmuoyzkcW04lXj2l1zA5x5UbHh0Z//A8vk5/UOw1CclL+XDQLB1mB39z6XAYPNfb3NofFtDJaxFLi0bDZnO/ewT0JiidRTKUau6zOqWN43VnLIhuWGSmyYo5+P/yVzmOoB5UHOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY4PR01MB13973.jpnprd01.prod.outlook.com
 (2603:1096:405:207::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 01:58:52 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 01:58:52 +0000
Message-ID: <87ect8ysv8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: soc-core: care NULL dirver name on snd_soc_lookup_component_nolocked()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, J. =?ISO-8859-1?Q?Neusch=E4fer?=
 <j.ne@posteo.net>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frdoyswf.wl-kuninori.morimoto.gx@renesas.com>
References: <87frdoyswf.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 Aug 2025 01:58:51 +0000
X-ClientProxiedBy: TYAPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:404:28::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY4PR01MB13973:EE_
X-MS-Office365-Filtering-Correlation-Id: c4ac1d06-69eb-4cfc-5d72-08dddec3f227
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?iso-8859-1?Q?XEfBA8z3k5Sla27fkx0HA4MYBBBeCbEB5nHRUn1a7uBRDFzngy6F9+G/ax?=
 =?iso-8859-1?Q?KDopAIRremNnvsEbWYt1jBV3Gu76r2UfgYyFlos6Vg1DlkQOMZc4FLiFoK?=
 =?iso-8859-1?Q?zF5oXG7g8I+H6bA5E+SiWm/QlIpVTyDOceq14QEAxXdsYS4G66an76enln?=
 =?iso-8859-1?Q?G7k0G13MCguHJF2eBw58vzwlcMkDUFUdKz3oZ1L1Lvg9b3FALjn7WDZaBm?=
 =?iso-8859-1?Q?xXIrS0P5micNPlmiBs9sBsjQxy6Xz+Vg4CB0G459FSwzDPxgZZzuCyckK/?=
 =?iso-8859-1?Q?lWwJdQ5hktnVusJH3lu2YyFvws1C2m3Vl+O+fcxwvBW1jeLEH2Xpoaq3A7?=
 =?iso-8859-1?Q?uC17FDE7MRYHoBYh1nSbiM5OHdGy+nKwDWRsqJdaZAzpDOGtgUXPB7Ge8G?=
 =?iso-8859-1?Q?Dcc8xmTImtERwtadGwMwIyJadmL+fqkvuI0CkISL1rYrPckRqykGQPlQO2?=
 =?iso-8859-1?Q?cQsYN+tq4hc408kIuvlaAIBBiLPhf4DYBDVda6ZHe+DXqi//sYQryBlck+?=
 =?iso-8859-1?Q?4xXKGO6YaG4620aDANz3VyvUz51f8XEKCVU/FOihrMK6AA93S/595h28iJ?=
 =?iso-8859-1?Q?vTaYAm7adq8hs1DsC20MA6AiU+QCBlMmKON8JI2NiBbr1TIsTt00AxCPn7?=
 =?iso-8859-1?Q?5wEAmEWEcpq0rb4u9LW/I43Zibju15E+gDQZHWoxwNZVMLjM8tQeTOU1/q?=
 =?iso-8859-1?Q?R8v+AU2PR3RESP2ovBaEcyYoJlH6GozMkd1Trp9sjBlTBgODfWRfcVwJMq?=
 =?iso-8859-1?Q?5bhgNoL9DgVSkeU/TEJihTvKRDSCsffZKjrahIaZjHHxgyTjxeGN4fNA6z?=
 =?iso-8859-1?Q?0JQNcvKITXgYWb914Ze0MJ6RHAZcsJVIxbsecOJPfaeWZL+HZJ6pzNjjqR?=
 =?iso-8859-1?Q?7C4okD75UR53eZAgmDxCqhxVXUj54kQMbwokN15QSKg9525NdhtECMNKPN?=
 =?iso-8859-1?Q?hJENOzv+fjByLe1SMGgU6yxq9m0fy/nVUrmdaeK1mr8Vr8GwU+oT9M79Jm?=
 =?iso-8859-1?Q?0ka5pMZZtYjG3DA92rrYJw25/ri7qqRSag4ohiPe4PyZFqEhJuAnerJ1Fl?=
 =?iso-8859-1?Q?JL/6UjaLeQl65h3M8DoZMVtPL1wQu4lA+YXDtaDEzVTCJGBGUOZ42TMNKV?=
 =?iso-8859-1?Q?K98Ux9WhCVTMPKqEOX50srEEPB9Tn+UTG/XV+N/qRc/r8WCMa9/tyQSdzv?=
 =?iso-8859-1?Q?C0l+OHTcZGVF6NY68H/H0Ja6bNBhtSjz12geSPIFcQGmiWlHc2fjBvdmrv?=
 =?iso-8859-1?Q?+NCBLW/a7o/qQ2PG57mZGq35qlgx165RDdkQYTk0tLXQ/PVfvfd/EwvFBZ?=
 =?iso-8859-1?Q?HfgWf/uHAFMLcGhoUDV42nRGNGats4YdutU76uu26nnX1EvqTkz+eDwAXn?=
 =?iso-8859-1?Q?oino0273acxCKsKiVxTrPb1LcM5nvQZzqtVxCoW82Q0buA2xu3gLD7ylVm?=
 =?iso-8859-1?Q?GKywBRV6qsXIk7FaTD5yc2irpgXeevCuGmHYzaO7MS1R03MK8UNu5fMrAO?=
 =?iso-8859-1?Q?8=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?m4An+MUvVLqzPVatHDszVzRjfLuzVtKTXhOYmGD6UIViKaq9nfm67xzi8i?=
 =?iso-8859-1?Q?Wbxi9btLjFj9sfVfTtK6iOAuaV/V4WQJgnnoe8aw2N9bpro76s6a+8l2zu?=
 =?iso-8859-1?Q?HxUlXHpKgAMagB4maOrPWAdu9YekhJgLbtRHK3k4GYGVOXTEVH8kjn0qTU?=
 =?iso-8859-1?Q?kLQr/ko2b0HMSFx2rtgzSy58HXeIB7+TH2nwJ08qgxWnWQLEv0lZE92a9F?=
 =?iso-8859-1?Q?IxMLH2N+Y+L1TiXRWICwn6Cy4Nr0xwRa5F/p56o3XtBEQnt6ec8/xVNMVh?=
 =?iso-8859-1?Q?pvEYuczZduDa0mjtehgcb/7bqaMq/0OlIRM8cnGEDnDGlotyBi0U5gMZ6c?=
 =?iso-8859-1?Q?97FVzpEO0U93oINydPZf7hQLgbi1ZljHKf5iLBlyOFjo4WGygQDwiok3+n?=
 =?iso-8859-1?Q?2DGREJYTXQQhJDyCbd74F5B7lFL5wHntiZ98GGDorDWhuh5JG0lFxP4B88?=
 =?iso-8859-1?Q?VC8NV9i5ILgO+OqpMHnOM3/p/F+Ic5nXFm+LH8TrAXfjtD72LsSG28CCsE?=
 =?iso-8859-1?Q?+8BX9EblFmvRETYaTl5VNwWhMzCCImE4mlSWLg1sEd4/wGUcFI15XwT51w?=
 =?iso-8859-1?Q?Iizu/MfLet0x0voWqSTjXrJQii0uuVWKgjGGXlnxHrAwiAiw+tNO7itKH4?=
 =?iso-8859-1?Q?g9qkdDY0/wZ3wKLyr/SBH+gVAL9gVra7OaPYJhZmTYWthU3tqJeyi3Xp4Z?=
 =?iso-8859-1?Q?Gd2SjcZlyN11Il8X+GRQtU0PdvouBNicP1Q4wxEg+4e16/4C6Rgz5iex7L?=
 =?iso-8859-1?Q?qkKco/CEjuxEdTX60hWPnZMFfQOVEOKSKBTv47hy7nhJtCOWGPukEO5XXW?=
 =?iso-8859-1?Q?fYMPjSQchlqCO77w8C4xW49ALg3ecuyodYyp8Snb9LxUwtSqk/MQN90Qxr?=
 =?iso-8859-1?Q?YBVoA7hWP8raBI9GKOv0hO7Mwl41RKmNu96kBD5MHDh0uMu7irqBaoGngm?=
 =?iso-8859-1?Q?muooLkKfkoZYYtM2X1hIqHytS+caY2wYI8VejB8J8Qf73C2BKbq4SPMN+2?=
 =?iso-8859-1?Q?DuZd7b7dJCIPDWy2Zh7UaZX1XZzDNdSRMu6Y+AI2B49f4PaHZmxjr1FnxA?=
 =?iso-8859-1?Q?RCL97MNdlTTkliy44ziBjRmZNP90vI8drh8AAMGD/bXGJOc1t9n/X7f6t5?=
 =?iso-8859-1?Q?i/e/SfLnX2aAJC5C6V8BlGXxR55E615tUybP0IiJkuVS/diL2rs59JKzy+?=
 =?iso-8859-1?Q?tvjdp2FhnPZXNjcxdMwl1w7OSQczeYJ18TVbgKzMnsoJ3Y1GkwOKsupW0a?=
 =?iso-8859-1?Q?MOMWOJWKR4a0oH3pZ0yx7NeHEWL1AK4qC7F11wZ6Qo4Uo1kwxwrR6yTFII?=
 =?iso-8859-1?Q?1OVt1y47ZIKae14+sKaBrcLXHyqARFTyIZ3KiX3zbwbvKInqXXBSwkQw+F?=
 =?iso-8859-1?Q?rRnZg9y9HrLi3RKSK1pU/vroMChwpkOuM+3r/C9kU+UHFd97MaeNakmnJB?=
 =?iso-8859-1?Q?ajLBlPBO3s7YCIXOgjAR0zYt9Hg9rZUHb8C70YYTtTiqCUNktcBV7Pfk8h?=
 =?iso-8859-1?Q?LxZ+0PjvCoEOUQFbLeYhxMG0LRzHM7S+CY4/de27TFI6EbapHULqZJsQHw?=
 =?iso-8859-1?Q?04T7I7aOYSLUjHpVSYSMF7/88IFTnyOf5B79R8/XfzFItVuUZP7rf0My02?=
 =?iso-8859-1?Q?8XWKa44YX6FldJ5hsw5Wf5fSMnvCWEHrDRGtt04Ll151vJ4f4hLoG7mCX/?=
 =?iso-8859-1?Q?ghQ67IC/mX3NgN9j8co=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4ac1d06-69eb-4cfc-5d72-08dddec3f227
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 01:58:52.0967
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R+FX0AHSXw11iYDMS5CEw36JH2pTVjHFUsfj5qineOdRdX6WZksnZ7v6g4KaQlK4GNbHUTAm3WGO+KzpwAHJmhBXXGOnzLVq68aEAyOYpgGKyZbveEnFDJYWz+wQ81xe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB13973

soc-generic-dmaengine-pcm.c uses same dev for both CPU and Platform.
In such case, CPU component driver might not have driver->name, then
snd_soc_lookup_component_nolocked() will be NULL pointer access error.
Care NULL driver name.

	Call trace:
	 strcmp from snd_soc_lookup_component_nolocked+0x64/0xa4
	 snd_soc_lookup_component_nolocked from snd_soc_unregister_component_by_dr=
iver+0x2c/0x44
	 snd_soc_unregister_component_by_driver from snd_dmaengine_pcm_unregister+=
0x28/0x64
	 snd_dmaengine_pcm_unregister from devres_release_all+0x98/0xfc
	 devres_release_all from device_unbind_cleanup+0xc/0x60
	 device_unbind_cleanup from really_probe+0x220/0x2c8
	 really_probe from __driver_probe_device+0x88/0x1a0
	 __driver_probe_device from driver_probe_device+0x30/0x110
	driver_probe_device from __driver_attach+0x90/0x178
	__driver_attach from bus_for_each_dev+0x7c/0xcc
	bus_for_each_dev from bus_add_driver+0xcc/0x1ec
	bus_add_driver from driver_register+0x80/0x11c
	driver_register from do_one_initcall+0x58/0x23c
	do_one_initcall from kernel_init_freeable+0x198/0x1f4
	kernel_init_freeable from kernel_init+0x1c/0x12c
	kernel_init from ret_from_fork+0x14/0x28

Fixes: 144d6dfc7482 ("ASoC: soc-core: merge snd_soc_unregister_component() =
and snd_soc_unregister_component_by_driver()")
Reported-by: J. Neusch=E4fer <j.ne@posteo.net>
Closes: https://lore.kernel.org/r/aJb311bMDc9x-dpW@probook
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 37bc5867f81d4..c1cf205e05569 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -375,8 +375,9 @@ struct snd_soc_component
 	for_each_component(component) {
 		if ((dev =3D=3D component->dev) &&
 		    (!driver_name ||
-		     (driver_name =3D=3D component->driver->name) ||
-		     (strcmp(component->driver->name, driver_name) =3D=3D 0))) {
+		     (component->driver->name &&
+		      ((component->driver->name =3D=3D driver_name) ||
+		       (strcmp(component->driver->name, driver_name) =3D=3D 0))))) {
 			found_component =3D component;
 			break;
 		}
--=20
2.43.0

