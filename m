Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011050.outbound.protection.outlook.com [52.101.70.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E738356A14;
	Wed, 11 Feb 2026 09:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802467; cv=fail; b=B4CUx57v2xPcLoDPwJFNptGomyLfuJc8AbGVAZovKsVTPaFrT2ELp+NuagUyONk8oliyvgjIvtRLcWbocD71HxcHGnx/i2sg5iTb3NP3lVgYfTjzvIpyikLKyLPd5bW+qfrtwRf9zdz/60ztXPRG8OnIjElHkAFO/kr3jiVbYj4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802467; c=relaxed/simple;
	bh=DPihMwoo6IdO49m2EiwzICyKCExvCQitbJmbX1mvQKQ=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cSypBYQ786h+73uRQ/Iu4S1ysMAVtZ4t08wAR/1icahUxVupfDuIyWEITLXFxQcNgErKWsgcwrR+dQeXK7D60WbrvVaxF0Z64fE+PM1hGfvifIzUioa8MJdYn8hSzAZddCbTzAzxxRyOvdf13YZeMWZ4scDTeenefFLl7jraZ6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=K1eRUL+n; arc=fail smtp.client-ip=52.101.70.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="K1eRUL+n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LY8dzY4H0Q29G7PABuFZN8QW6H8UpOEEFJLkO5TyktiG2vksn8c2ALinPx3XkD2ixeu/1Fdkr0uNcPvwC57zyB9O4sVLDWUs+bRapi3Zk6kFQbcW1uLiMoaENosIAAKLbzBUwrxc7LWduYcJ0ZX8tL6c1GAih5nm26c6crsZ6m/16YWYwiMWReR+h9wr/HhMHqXUrqbJ9UU9JARqUFxmZpZ7ngAaEa0OIUMGz6tVLGCJmH9gZQbM8c3F/RCBL7kljp9f7irP/x2xQmZ5oBO6dZwqTAJrGvw43Xkmowr85f7rV7VKoqJ+gkHqNrvBU9zz7ALWtirNw/wKNTPagelnbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DBq1fH+rSJpZB2Htels5hkwR6joQ6sunwLeYUrXhDU=;
 b=kMHYwdPALDv+KKflvRG6VRoNUwAszGbl58yD8+Ieqr3WgMtT5DWRW9RlNOrlVK8XeQS+Y3nLwhrPzJwV4/V9zpM7J9XWv7HZcM8Go7mNfj5s92LqZKQvLpwvajl0DWxgiSWS/mqqX5a0pGMxycAyFcRBVgiHuFwGDdFLyEssydZYKCyqnBimUxE9ZPBRPYAnslBrD5gzkPAG+Vjl0RsLPKvUM1b7SxVUEfALntVx3sbirNii8eGDu3XH3nVGeiQSWg3bFRkaWjtjQcNKQcjN04QrFxEaV8rh3AcMcCkVE6OrgAfjCN3+CTIwTjZ5fmZpeW31DbDhcNKiDmxpA9tgSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DBq1fH+rSJpZB2Htels5hkwR6joQ6sunwLeYUrXhDU=;
 b=K1eRUL+nRF7omjW89896vNwEnXux0McHjYZRHYTd/d8DsbQ/n1w3eDk2vZjXOC6MLbXQp02YaYzlWtq64b4RA10tCXAwvmyUBc3FmK4ISVL5GAfDOAMPHetoYKhcSkVO8CHOfE3i5FGSyP0fQTpEShl/uj6iYxkultIBeSBgECE21AwEDJa8HPnWYs97OyOP88B+EwpFEzEXHTlYAK4S4MSxesHxEi8+VnztZK3+UHkgqfLbnlkRN0ogOWDy06LFzgF9OJRWtjNvzopPCPhYE780OhQ9scA4ZK4MXZqQdW3v86yA4YMXS1fgYqFeJdNgqDYxRPjaHq3wUdvu563G4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by AM8PR04MB7219.eurprd04.prod.outlook.com (2603:10a6:20b:1d3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 09:34:19 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::bab2:d15c:fcf8:ef2b%3]) with mapi id 15.20.9587.013; Wed, 11 Feb 2026
 09:34:19 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	ckeepax@opensource.cirrus.com,
	andriy.shevchenko@linux.intel.com,
	nichen@iscas.ac.cn,
	kuninori.morimoto.gx@renesas.com
Subject: [PATCH 2/3] ASoC: ak4458: Fix the supply names
Date: Wed, 11 Feb 2026 17:35:26 +0800
Message-Id: <20260211093527.2892297-3-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
References: <20260211093527.2892297-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0040.apcprd02.prod.outlook.com
 (2603:1096:4:196::6) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|AM8PR04MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: 85d328aa-7f78-4c9c-89de-08de6950bb55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|366016|19092799006|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VrnSDsf7hlWmHxDKdtO4AskIMZqcrYmZbu3z266VypoAoxraVY3E5ui5b3wN?=
 =?us-ascii?Q?44UktD5j5Z9bssUb3NFqyGN2ocRze3/IejRMapw4yqOmUymjK8r9AkwWDWfM?=
 =?us-ascii?Q?umOomsUO4iZUPD0oRt+Ge1pMs4j6BAs4guaAbbteVJelxtPjbfd2JcIJnPNx?=
 =?us-ascii?Q?+TT05vDGl3KjcroBsiyCR6jhBncr8L+yQkLqgHqlxe/AlhVfQxGJDhVhwPrw?=
 =?us-ascii?Q?bOu41nl97c6h+aa1+bK52jseGrUDeRaqgSnc9wzzo2AjTXLehzNY2U06p42r?=
 =?us-ascii?Q?wjQxeVwcLXIvquYfBRGaume/gMNbWtNEGacJKgOLM2GMEUO5fyGTg0DVqcPP?=
 =?us-ascii?Q?X6GsqeVZcDljnikrKlo/e0C64SyvdiWwrbrocBWu2RlW8j3Tp9U9ZBGF0t4Z?=
 =?us-ascii?Q?8lIr0hdTe/WAMuGcjj3chabbokjGImCY+m+bQRj8wS0U6tSCx8s0/TupOlMN?=
 =?us-ascii?Q?DL099po/vr8fp8drnLizi6GqM+d3fd/ZF3LTOmGzWfEkkGYH98zN/2nePAeA?=
 =?us-ascii?Q?h+ksyKtWfyj+CwKCj1UVZfvR0lg0PsydHzy12fHzskUFdErUJBwgMZY2szDN?=
 =?us-ascii?Q?zKOEzMM3mNykrEZt1rIqsWypbSeI0iEvfPiAfP+M0NHLnGdRZUquPiyArhwJ?=
 =?us-ascii?Q?XAG/LGpLJolBQrhJsNapfpV/Zgygp9xlF6XaPymItO2WGVVfRfewOZ5wTWz1?=
 =?us-ascii?Q?tISFwONKXkDJDsdVahC8fcZhn96o8Uc+yNYCg+6JxAC/fzEWw+rzxD1OLAoD?=
 =?us-ascii?Q?RaxEca2T5DM0zbwYK+MBBUYUeJD+jBFsAB3R4QyGlpBkkltGk43UnamcQid2?=
 =?us-ascii?Q?U+u4ipzwyVEalv21aCq9T0ugdYcBF81KCVc1CAHWDEQHBnS/hNIPvpf0DJAR?=
 =?us-ascii?Q?HM20QDjvvCadeuZJa2q6Rp9tHuh28a+ZpHI/ZVVmrcwRc7iQEdR/J4jnsodT?=
 =?us-ascii?Q?reb7n65mfp9wv/N1HWkzVundz4dAurOjl0wGVDUt3459/elvp6NeT9JZbaaE?=
 =?us-ascii?Q?/nV2gL+AFT9goSBISMpGP92jGLH2PXeUNnt3eTEDr596b8uswK4WA7DXQmBP?=
 =?us-ascii?Q?Xap9F5A5PVQ63XQiXW4wjDQWWWRr3MqcniWj3EKL9LXdt7qFsroLtctG3bgl?=
 =?us-ascii?Q?zFj2IX9q+hXOac7s7QFFlfE7o+7xmnbUaViwemFKPwHX3gnWFXZNUMDQ6zk2?=
 =?us-ascii?Q?/35UgQARV/H1zpBxq3dgHWZt5DtN8VSz5530hrJN7uMAKTLW8Bo45dQ7gS5W?=
 =?us-ascii?Q?QKKqoRy4rfy6hhAzdrzxZ3vH7uFi1WqD4gLSwr5VD3TJWguTqPLsipS3uzlt?=
 =?us-ascii?Q?MrvtzInJyX5dHx7fOyuigcqHEcaWrguX7pudL2jss0docdeO6tnbxbNestcC?=
 =?us-ascii?Q?thq3hQQYPnhAChWxxFOaRRGNurAwyd7++GTIcyvEXLa5EXWQmruves1LLiIV?=
 =?us-ascii?Q?O7a5upYwKaO+1iTTFyhsQbg3CO3SHSgxgIywpQB8M6Y+cQesXjBX6bDoWczT?=
 =?us-ascii?Q?Ku118IUamXG0mDX6p274aih290tNKMicUDg/0rZlLLS0a1lOtrYsrMCvg7Au?=
 =?us-ascii?Q?ac13fewn2Wr3sd/tb92ml99XXyP3FyRUOfJQjOoNZleSZx05/mfi5oUf11E/?=
 =?us-ascii?Q?VSKYvCspP5oVzKz067pcFPIVLgEMQpOKkyy7uoidQsvZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(366016)(19092799006)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mwggVfqlmS5x8HEpPTfY6w6Q1umyuch0xKR+xBCu21tdx2Ag3f06n9Np9w/+?=
 =?us-ascii?Q?OhF/AvQIMnOabWgaWx/WNksyPltpQLQ0ofCZNcdt6z56veXHseJ5xjR9rjeL?=
 =?us-ascii?Q?fziqL5+zrwfGfrrgr0k98Suiv+HgkNR/vi3GGvzgNNivZCX5vxGMHHGXbayr?=
 =?us-ascii?Q?8SqSsMjnUPJfErD0paSbMHMCZYaIWtAjCbvxrKrqGQgHG5atzWwa1mcwBP3a?=
 =?us-ascii?Q?tXPn3fCRLslQjZhMwGSBN6BzEuapLNpNbl2kL9AQfCAjEbVy7rj9aBYC8tLE?=
 =?us-ascii?Q?4/mX+HRu4P2JFqlyRIwb093NONrMhNx1NicDzza0qlGcXp6IPZQWpYYkXpHI?=
 =?us-ascii?Q?agsDaUNMpWIPqT0j9evGCgIc0wiErlKFxvEBlKmC1nIV4SCAeY5w3MReYugR?=
 =?us-ascii?Q?FdOMXtP4nU+X8b5VUf73WYaS5x/ehGK0cnQukAV1MHj6wO9MubDhnDQXZ6Uz?=
 =?us-ascii?Q?URO1kRSQTnPfwGUiumTetagxtW1NH5XNA4qHUbWZouimGPCdqhxdd5KyRtMq?=
 =?us-ascii?Q?uKfKAotTLpd4EwnUJRFskdZ2LukVeUgZoyVcsX8+hOXPBI4P8ibr/0iDE3KM?=
 =?us-ascii?Q?3T4sXzBCcvGjaGGLkKFGYOZQAH+HQJh/du5zz4Q99c3kbjAOl9nZzDiCiXXb?=
 =?us-ascii?Q?CKrlCDYwYl2zbCJD/tGfNslQgU1PoIK3pvVi2gyTNclcrTI3RCkSJ73f3w6m?=
 =?us-ascii?Q?8Bke3RNuIq1E3u5ZrnP2RU0TEIcLuXWehYekM/b6e1ALnlLoGiV7YPB8eZ/D?=
 =?us-ascii?Q?HoeiRI4KPWRhnJ6iMb3CGjhPhMkOQLJoAt5GLz382F0xGvnO/6CK9+IHqgBH?=
 =?us-ascii?Q?0fpLy+DAXpYZ5GlNSNpAnq2JZ7GEjkaMIlArRUHhyywiWP2IVfUIlGu4YdcA?=
 =?us-ascii?Q?yX0FuYmx+UFWRgR7fr+1i5chlTfHn4FvjVdix6YLDILP/Huc0wyNQUhzQG8W?=
 =?us-ascii?Q?WsqKZjZ35KUn820xLb3jsK17S9DlOdl5ELL2KfNAqO2V9eYR+RlpHZPGGq+I?=
 =?us-ascii?Q?6C2yBda8Qi1tyh1bveV+2qka5Qs9g1OZsAK1n3VgLHA4J26Ty212Fk7/CE0h?=
 =?us-ascii?Q?MPOmZ/h8mFDulnrOdq55j0B/0UOJmkFd6Vg5jM88W/RGfgg+dWCoWvKhclyG?=
 =?us-ascii?Q?zXV/RfTDA1IHSpGoCR4vWBJ8re0XxScuJHP10eg1omLgUxtcoOlAPODo8B3g?=
 =?us-ascii?Q?+tMKInIq/PfugNiSdgCuw4CgR244PKv/aT+ARknDt9dUV4qfqDx16Ywk5p2/?=
 =?us-ascii?Q?HUInDTCEoe5r5UaKSP+LIu3LVMaTbh7EUIJCAhkRtXeiHHL5uY3rJlyKhZVD?=
 =?us-ascii?Q?+S43ZD28tdZ1EsEv1XPXtPZJkItQXS8DtTd8ZBNMZVpAEr1GwZ8wwC0HEYbF?=
 =?us-ascii?Q?xKaH+sVkcP2ey2w1bupBHUrHzbfNG3dvMmo3fg6SleSbItRUF8G1fSx97blc?=
 =?us-ascii?Q?j1AkTHh2ls5hIvn8YhyJbzYtlq8FeDongEUqGYMP2zYONvlpbcK3iois2mOi?=
 =?us-ascii?Q?qpsW8HDzGnyLMMYVSCKpmOHsxJkLKOfWI5R9xGeTe8fowy3/chgY3+E82qgb?=
 =?us-ascii?Q?CzPC2uNhYjzK9FyGcNGv7p7/4SPITmx/1skwLgwjUhCE4+iTvV8rUDKBRnea?=
 =?us-ascii?Q?atNqMjuaEbJ4TGTa/zxG654toL8V+/GHE0SU1TJyxEEbYdJ7YBCdKYDjdagp?=
 =?us-ascii?Q?Y/mZGHuC17rjsllKhpAMb319WfFqvG/JLawRYKJWh4uW7qh+tHDSP5u+zJ+r?=
 =?us-ascii?Q?ST07g6R8Vw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85d328aa-7f78-4c9c-89de-08de6950bb55
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 09:34:19.7431
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiPdaVgUN92oc6H3kEe4kxk3zcL9n/jjA5PCQ/GMfpYUDki6+JK6CH83zV/7rH8P7LqFDvjA1msJsS0oJXjkcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7219

According to the binding document, the supply name characters are
lowercase.

Fixes: 7e3096e8f823 ("ASoC: ak4458: Add regulator support")
Cc: stable@vger.kernel.org
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/codecs/ak4458.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index f81cd8cebdd8..bfd4c039bbb7 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -24,8 +24,8 @@
 
 #define AK4458_NUM_SUPPLIES 2
 static const char *ak4458_supply_names[AK4458_NUM_SUPPLIES] = {
-	"DVDD",
-	"AVDD",
+	"dvdd",
+	"avdd",
 };
 
 enum ak4458_type {
-- 
2.34.1

