Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010045.outbound.protection.outlook.com [52.101.228.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA6512C544
	for <linux-sound@vger.kernel.org>; Tue, 11 Nov 2025 00:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762820384; cv=fail; b=qHDEVihI0A1O+bFvVkl6/7XRpAodFhjF792vewKe9it7bTitkt9kEXTYWTFUW2an52B+axP/Z1u2CjcQHB+Y/BPnQHfnjYRu0347MDPnVEhHjuIxWOgUkQ5T/Bzrb9vlaQR6hzUgT1EQzOOKAcXEMaTFA1A9NdoEGNqgiG5LoO0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762820384; c=relaxed/simple;
	bh=Z5rcBBqxpXnhmxIrifeIdMxRUXdotBWQae3y8APWmmU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=ebaf/GreTxLxTY1DQxDCbb3Um8Nkg/nOlknmV3IFPBrhfmWkCLNViUZkZ98CeGKQXQM+s7D4waFu6dnwxEaJSe7fGuf7av8hAN+NL5LHeRcK7gQR0/oMN2yevurMQArC6ep/LgkPLgTMqlTsGU7E8/PNOKxipQmfbXL7li5TBAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=h3ze3ntE; arc=fail smtp.client-ip=52.101.228.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="h3ze3ntE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F8PIMAak1PiXK5eQ+M9Z+sJO30lUxbrz1bhKGI+I8v/F8W1y8uuUNOFf5i3PFuvos5daoEQxQq/GPq0ZoCwpORuaNAu5AsU/8N+gLWMr8pV3KaH0+Z+RGNR3SEcp5EC9/b7u7yZN6XAtkhUFoGLLkLa+7PTyyurZB2Xby9VRu7ehXyczxMQmME6RqIQDocOjjFWQ3Xd1r3rVGnrTKphb84iLhZAEmA2sXxMtDLLqeCjABUdrjlyutzTKUyZEgM4ks1rTCe6SoGRCB8ISzud0wY65OuNG1LHxGw9uGqlVRdPhAeNTbdTZJnbhcU+oJccHImAZ2pi9hZEWrz9ISAKaag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ji9hqlg2l9ZBf379SVmyT51tmHVGigEU/2wAgFp3l/Y=;
 b=XWKhHZcv9SuIEU0FS0qRnM6n8gacZ2459+qjBHOyRiuwolernrCd7Z001QmsMY62bSbYa0Jicm0eUfWirHLQ++/NYxVyw6EDmrBo0CtYQwgHIwgs2SVHv8By/8luu0Z4vmZ5iQ/gWq9i5iNRNJIC/az0mYDCcCaIOMqw2FtLQqyeq34PmvloCR/GbwMoTjHUuctgROlD4fYw6nuQzEgLTGMPSh3AcqGfl9Eb2ASrtZHN78Qf/f95AtdGCOHdVkO3ojur7Kf7lz0Oygv+Tu+8iiII6XODwgCy1wTbl23mAcgmoqLH07cSvpgN8JwS9XMjpPHhVHCQAKnDNkQaAENOaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ji9hqlg2l9ZBf379SVmyT51tmHVGigEU/2wAgFp3l/Y=;
 b=h3ze3ntEKOLL/CZANTEURLbz72V+XUpsh6mqWssWrBibK23RWPuZlUdghrWBuQ3tSu30he+dsCAhTxWDXjNMvgL8hfiHtsJqpkJnrG4l0yUaun/U/CVGTl3i6JYtK+XdN4jk/vP/K5AKowODho3ti5G//PYHjlP+TL0j+cVhMOI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS7PR01MB14361.jpnprd01.prod.outlook.com
 (2603:1096:604:38b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 00:19:40 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%3]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 00:19:40 +0000
Message-ID: <878qgd8lpf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 027/292] ASoC: codecs: audio-iio-aux: convert to snd_soc_dapm_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
References: <87cy5pa0ea.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 11 Nov 2025 00:19:40 +0000
X-ClientProxiedBy: TY4P286CA0067.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:371::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS7PR01MB14361:EE_
X-MS-Office365-Filtering-Correlation-Id: 21278ed4-1b73-438a-9c90-08de20b80169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6PSWH6RzlwSt8EoVJ3AU37KhQAqVxWLuCz8de/rFCHHUXlqgScn1zAVYGR01?=
 =?us-ascii?Q?qWi1CnF8Ax4jvHPdRo9s8i9R3lpFGSLKGa2xlTvYvVJ7bYW6ISGqUeDkaxnR?=
 =?us-ascii?Q?mMBSS55eqoZifAlEjaWqCS/yYXuUWZ7ch1NNdrAFRWwUSkpZHMatmI2lmzUo?=
 =?us-ascii?Q?bxJcRR9eO0U9bopayMuffC7OoyN/fS/Cs3FHeT+VgtXanws9O9Ri1rRRVxCq?=
 =?us-ascii?Q?Vw1UzK2yu0EAJPESojfxEJfEIt0tkAxYO/OypDDbX4g9ro4so4RMC7aJiZcn?=
 =?us-ascii?Q?IP3XSrFEmi2GTMi5uTl94zWXPrwnQ+C2xgz6yKLY4j6gEzuzBD38cGcYOWwG?=
 =?us-ascii?Q?tQNYOFieyC/fg6LGftEGQETvasLEli4yJvnGk9A9CMcdaSEf49rt4zvOSfgo?=
 =?us-ascii?Q?EdLNwI28mPTnwonoDwB/UTugJ/IgOBchJkblly4ACpMq48Y0j/CFJ55pB5Jb?=
 =?us-ascii?Q?y0S/bdNTqhCtXo3MLKPw08qbv45oezHyFo1+ReQKmydtyC9iocvtrRE6CeA0?=
 =?us-ascii?Q?xYTmPEtSBrUlj8lYmVagaKiKzR10sv2HYU8hPg4W3m9QsjkwgqOwb6YJmqDd?=
 =?us-ascii?Q?SamezcySXrY3NwgJaBWERs77OiNJPpXwffUCEDkn81wPWmm2CweSPpIIeePh?=
 =?us-ascii?Q?ub2yEpJGVEzkt6eRpynxtP/MjwTTrCg4QbOQbAsWzxtygHAED7AS4IPNcHm+?=
 =?us-ascii?Q?jN5PIeEZgQpT9lFniHI4UxiaMzR1uBM5y+i9tAq94OYVkcUshOWqEITaKYWC?=
 =?us-ascii?Q?/kelDRUwDf5LP5NRqVqGIx0FtYpB4PLZsoOkzGc7/kry8tSRZ8VkqA9AR7jW?=
 =?us-ascii?Q?/mR98FFcGWHPBGQlEpA9G72kj0AJL50IGHAXmbbWvaiTEqk1v+qK7QkNE+WV?=
 =?us-ascii?Q?sjkDJauobUjuzNsnWvQGmcKWYPPPhyztQbkVMLrZAs/rvxDp04F6Hl6QoB/x?=
 =?us-ascii?Q?iKdruWTIaJITWedjaRP+8dwFncOOEkx6HP0P6goieVTulEWD/i5U2s+l0XVy?=
 =?us-ascii?Q?GPO0iOPY1XKfJLi/rArm8kSfdg7cZ5xgSLogFBzLvZfT/osELVUiWNso2CCz?=
 =?us-ascii?Q?EA+C1DTK8U66mtc2t4JHX/DMHIY0uOM5MLAgbtkpSI9BXbZhJ3uPum1Lxe1N?=
 =?us-ascii?Q?TTvmXsNd0Q1FqqzsM7fswsI02eWOXOVSmW3LDPjS0/OvJay/cuGMGWCfcbNL?=
 =?us-ascii?Q?nvzjs4JzESIJmQ5XQibgZiEAF+nD1uEwnc3JDiNyHtFolBdCmNNnw5hfA2Bl?=
 =?us-ascii?Q?vNTD4NfJDJLImnvo37JMFinUORwo4BE7Er2POXFPnjy05gcy0xrOdACCZSYF?=
 =?us-ascii?Q?I8oRuXiatt9x+eVM2NB5cMJCamfNWrr+Eq2bTA3tDoT6mAeLZYzECATj70gx?=
 =?us-ascii?Q?FMgxWAvhHJANzk6dh77ZXe6nmlKpMlfBKoZMQfSl/8rdjWmkYgjEIf2HWq1Q?=
 =?us-ascii?Q?B1qFM55GtM0tz96pzcPiXIlnscxVvdUIACLF/PXAbzch2WEjWKmVpGy6p3Zn?=
 =?us-ascii?Q?pvcgfFlTsaDAK/NoC+gQZ6SLgxTs+XUbV5jI?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cvknA9tdTGg/4dGLmsKENRIEPSiDsSzLZL9g1unE617Uh00MaWwtXAMgw2FC?=
 =?us-ascii?Q?5rU4+JhNOWwBLkEj7yfZfasR0RbRwiJyN+5VkpESVl72cMa1cYTbi9ww41Ab?=
 =?us-ascii?Q?erZXSpiHovde3RbViREYs5Y1zgX+JQBqBXiVItK9nl1RDR6BY0f/LtqCEsGZ?=
 =?us-ascii?Q?1MFXiw2hXFWZYfJrzZ5GefAE8LMsJTT2WS7nalRYoI9oatNEHX7tc0atKRFg?=
 =?us-ascii?Q?lWLQ30GiB60uoactlCLQescBGczlagj1cTJLXmVOVlJO9fTU+HPDYoXuZKvM?=
 =?us-ascii?Q?87soOz/KS1rsqPK0sTlJX0+9C1Io6lELk1uPG1oaEIy94Jt7+hMrQAkPINzl?=
 =?us-ascii?Q?ITn/bHdsIiZaOPzeZ8eYsEep/VGFRjyLRYZAPNk8iuCyfdNY43J8S8abGCOy?=
 =?us-ascii?Q?MtCglmoEZXP0SjAWVo1ILgiHL4/oR/NiwW3uhd15ygYEoQRg0na8kD5YG+Op?=
 =?us-ascii?Q?VkyeyKpBm2pbLroUSM2+mUuc1+wBLcLHabCWDU1YgahcLfP1+H1m3Z1pI6sh?=
 =?us-ascii?Q?UqvAm/YyNyLPsjURl3lucb558DrI0Vke2beWGjGhkgXRFRs94HaT5IgLkrbi?=
 =?us-ascii?Q?uy7MvRS3WXndn37UpVQpr6d9fKbtfSgSYQXcPUYAdO7Ls0GjCi3Nu4s45iCW?=
 =?us-ascii?Q?2L2R5nxrQYFx3cmMdXgGnkGrGzVzMchY6Lvj6ROhNZtlQpOa2tiqJSfQkygM?=
 =?us-ascii?Q?YPlGzFV13GMhvtJGAvHAoESlaTNMde+P7Yqz02sHKQBz1zo9IRy261dFauqk?=
 =?us-ascii?Q?TJBh0wPf8WS0buly4jnWqZY3dYGfxoLoXCxMOuND14qjAjkGV+Ay4Bh3gJS4?=
 =?us-ascii?Q?aBf/tHH4vOkvSHofJMlJvXnKVEVf2qWk1wOHz3Wp78A4RrytMDk39rdF+yC0?=
 =?us-ascii?Q?QhTKksjCL/SkGmMVFo95uN1Tif7eDfAZYsf12Ky6jkq8nOGPFcjwqW1Y7x3E?=
 =?us-ascii?Q?W8DKdqm1EZCChmD8FcCxlyCO/ucue4sHz5NuFg+YQ2bEPAzXW3GSYOWcUiZO?=
 =?us-ascii?Q?fkPq7DKbhCuMz5JnvXYfWVy1GvU9DbAukSJzRpYqTinCt9R6eYVUdaCIg72f?=
 =?us-ascii?Q?EiiWdxUD0Dx4FahIMNQkcYgPVt5MMmYPdtY1UAP1jhzJFVc+nfXpRpHatXXw?=
 =?us-ascii?Q?QtDqN6REdUCiWrq6lSMQat8phXE5Z78NKusonrOk6RipZ9MqTrQbOALAIWGK?=
 =?us-ascii?Q?27K/DE6s3VQIbPlzvCHMHBtKl8PxywIOeI+8Qi3UKo78hkgkjShBVjKC/gJO?=
 =?us-ascii?Q?dINUndOaUS1f0FZo/2B7ktHDFSmFuaEXAhiQBfuZB6Tha9Fk/jMlTMus0dh4?=
 =?us-ascii?Q?0MLC7djyjwArcZh49nOfOUU6m0KNt90weRRFFpjoHxc8DgH5byqLGzR3mlLV?=
 =?us-ascii?Q?4fmkWHxLxdn85Lr6LhE3rGjKMYXR0eoERBZvG55aF4yCoxQH9hcBc1Jbooej?=
 =?us-ascii?Q?XSVzoK2JPDEBwj3eWqCvPxldfRCuMtgNVFq/QxMmywwfbrhBjev8NAgAvCaa?=
 =?us-ascii?Q?pPQWhUedbebuTLL+aO9KWj32CQUyVk3+TFY51+qqtxTDL0bQ74TlbYRnrGq4?=
 =?us-ascii?Q?T+qt7oolNVXN/iCvHLPfiO5LB5Tupu7Bw6fItsVT7bdoBEJTZetnPni3kVi7?=
 =?us-ascii?Q?2LizgxT1giDgwIHUmJ7AI/o=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21278ed4-1b73-438a-9c90-08de20b80169
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 00:19:40.4319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ip0v/TqN6umuYcoVkGPlROilY5MKsOZwPT4AcMDuqvy/xawyIfRT/Gg5zV1kMFH2EmjZQB5e0eKnD1xFGY7CZ2lMYLlUxwY4h9wHoCF2TlvZfLPETmYr3aQecQP9A23I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14361

This patch converts below functions.

dapm->dev					-> snd_soc_dapm_to_dev()
dapm->card					-> snd_soc_dapm_to_card()
dapm->component					-> snd_soc_dapm_to_component()

dapm_kcontrol_get_value()			-> snd_soc_dapm_kcontrol_get_value()

snd_soc_component_enable_pin()			-> snd_soc_dapm_enable_pin()
snd_soc_component_enable_pin_unlocked()		-> snd_soc_dapm_enable_pin_unlocked()
snd_soc_component_disable_pin()			-> snd_soc_dapm_disable_pin()
snd_soc_component_disable_pin_unlocked()	-> snd_soc_dapm_disable_pin_unlocked()
snd_soc_component_nc_pin()			-> snd_soc_dapm_nc_pin()
snd_soc_component_nc_pin_unlocked()		-> snd_soc_dapm_nc_pin_unlocked()
snd_soc_component_get_pin_status()		-> snd_soc_dapm_get_pin_status()
snd_soc_component_force_enable_pin()		-> snd_soc_dapm_force_enable_pin()
snd_soc_component_force_enable_pin_unlocked()	-> snd_soc_dapm_force_enable_pin_unlocked()
snd_soc_component_force_bias_level()		-> snd_soc_dapm_force_bias_level()
snd_soc_component_get_bias_level()		-> snd_soc_dapm_get_bias_level()
snd_soc_component_init_bias_level()		-> snd_soc_dapm_init_bias_level()
snd_soc_component_get_dapm()			-> snd_soc_component_to_dapm()

snd_soc_dapm_kcontrol_component()		-> snd_soc_dapm_kcontrol_to_component()
snd_soc_dapm_kcontrol_widget()			-> snd_soc_dapm_kcontrol_to_widget()
snd_soc_dapm_kcontrol_dapm()			-> snd_soc_dapm_kcontrol_to_dapm()
snd_soc_dapm_np_pin()				-> snd_soc_dapm_disable_pin()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/audio-iio-aux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/audio-iio-aux.c b/sound/soc/codecs/audio-iio-aux.c
index 588e48044c13c..066e401912b05 100644
--- a/sound/soc/codecs/audio-iio-aux.c
+++ b/sound/soc/codecs/audio-iio-aux.c
@@ -131,7 +131,7 @@ static_assert(ARRAY_SIZE(routes) >= 2, "2 routes are needed");
 static int audio_iio_aux_add_dapms(struct snd_soc_component *component,
 				   struct audio_iio_aux_chan *chan)
 {
-	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(component);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 	int ret;
 
 	/* Allocated names are not needed afterwards (duplicated in ASoC internals) */
-- 
2.43.0

