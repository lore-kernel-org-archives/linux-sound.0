Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011068.outbound.protection.outlook.com [52.101.125.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EC8192D98
	for <linux-sound@vger.kernel.org>; Wed, 26 Feb 2025 01:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740533765; cv=fail; b=ojEhyI2NV4lCu+r+mS0HjAC8TQwu2U5WVAnpDeIe8C69JqZCPCNxFHlA6upaZdFgwMkAqhJ5bir4VZ/AVIN4BAj9pboDgmewpZKbu+5p7ePey9aLFX9vfA2l2sbMe3nRdNMZuci7El6gYcNpxDNhUOgJz+DqthOzt3cV3NeL308=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740533765; c=relaxed/simple;
	bh=jmqsHR4fnpVWHEVuGSHXfm+WwXe0m/QbK0dijnuLrA0=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=DJ8ai//Q/UwK1zUNKwYWx+lLHyhbvNChLmIetjoYxRma5yxA1sHpCfm9+oH/NUPhPugGuaa/tHvi5zC5hwLPHSmRTTlGH3I37wVC6VgKZJbgtHCxGxnsbIWbpw32YW15uWHmqP87XDsFkRPSXgpcXNkTMknuiOMadveXvwGF7cs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=iOeGHuB7; arc=fail smtp.client-ip=52.101.125.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="iOeGHuB7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+PBxmgbWl0Kd2O0c5GjWgmUNR0CnnPQINxQt3jXGutH+ybFsw8wxbbKalCtr0mCd1LJlYM679f6w+e/CiJ3j/uIUK2Wgxo/DG3aUG5YXZSuOofqAfSrPPeclFcAoGmKStsT9SHNv4/aq6g0Szf0apmGS0uPsr+xOTEEjXxx2KZbkUxvnvtlMGOZfNusOLYGD4KNAcIe7l3GfxqSmUnSj4dZwYxBTK4JKB4ytXp6d5Va0+NqGz1VlqAUiP6pQ3+P11i5Uafkqbr44aoNnkyJSsF1gvDp9lbj3t3botTZPMuUjwsZKSvIvjAasc1ESt8MgiVwzZ9kw8l3t9YKLVPfZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WNK4JTmgibY1iPWSMLlbpy0HcWpuIf0ubHzyX2xCKtE=;
 b=v6QroBv0RcbMNv49aMkpD3SdwLlW+LMk7MRMDN4rTAyOa6RQgrvuarSayJoqMBhJ/8MTwGCImJSwSpOiU57jD92QbgirPfdZ0nwtJww+2wwXvUZP4hlPWDXKhon3N2YreE2VMnuyRbHfbTrU9lj+HOLEeZP3Gq+Z3JUiTws8jPzGUSvB74rrerFmhHeVaLRzRzEVaqAKN+/Jn1NByHlshRvide18CxUwBMNQ2J0uyqthjjqalVEAJcIu8aU1A2fYo0Bv49QQ9c/yyMYiTXJUhSFDem+uu/or+GzZIb9BOCiCFbPwIU8TkuRGlgJWQ+9duLrELI+sbw3KP0WjaTK19Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WNK4JTmgibY1iPWSMLlbpy0HcWpuIf0ubHzyX2xCKtE=;
 b=iOeGHuB7kSP4MSk9tQh1fXvAjmFRvOWMt1/fiDkQkt5ipTQ4byjyyqTaIPJGzizgnoeSG/VM+pFgWr9YEoTF19x+gvGyMpGlO3XF34Gzf62jKLaFttuQln1Y9ICmeukR48I76FDirpdR5yOJaCHTncepzkPHuOR4Qv/us//rce0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB9660.jpnprd01.prod.outlook.com
 (2603:1096:400:232::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 01:36:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 01:36:01 +0000
Message-ID: <87mse9bi7y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 095/157] ASoC: codec: wm8988: use inclusive language for SND_SOC_DAIFMT_CBx_CFx
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org
In-Reply-To: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
References: <87frk1h4sn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 26 Feb 2025 01:36:01 +0000
X-ClientProxiedBy: TYCP286CA0327.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB9660:EE_
X-MS-Office365-Filtering-Correlation-Id: d78fb249-526b-47ac-90ba-08dd5605ed73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?T0Y6UXJ6FyVfNlA/dfi+/TTWRpgluqJwYdpL8CvF6j6I8NIfWQeIwBhWXEDJ?=
 =?us-ascii?Q?FUcOwCfZt424PJ8JOSZVT8CO5YjKUm7hNsXqeGwRAUkL0lgkYZFutLNnv+4L?=
 =?us-ascii?Q?KOKucemyl6ki0xvnJCw91ehMi4Nk4b/ds771U35QPNsb1X44t1A//XbvYwEQ?=
 =?us-ascii?Q?S97Roo603rGoAc2I4liMi/Zdq4BcRImf7D2bnDX0D+ftpG/mVjdG/AlWYtwi?=
 =?us-ascii?Q?FF+WB3crsL7r94nGFiB/d1n5vpsjbWLxXGKGNr8bE5hyHvaOYGCmQgmEHQiK?=
 =?us-ascii?Q?0gQMUqseP7qN+xKaaG2DIwKaTeMi63u4q53tRFNguLIsPhfO/VakDvLTeTx1?=
 =?us-ascii?Q?bwCgQF1RvBE7ac1f02zDsjyaDyDHqmyuS4mHdlT/XNtH1sfUvbnC3Cf5NBMy?=
 =?us-ascii?Q?KRLvkfsrS0Jagq27c0bJhBRR+cOHHrFyYwetPNVncGcCI7LDFKlcO057TzgW?=
 =?us-ascii?Q?4ZN99ZUwXanaWgj+LbGBRiHkx98N819bgJGSh4yfB9UVQzURgflTkiCzLz7b?=
 =?us-ascii?Q?rjMiEHP15Vf3juZTI8+H2WNeFjqd1E+y6rGvcBoX9P3zqULsPcVNwdfiMVEM?=
 =?us-ascii?Q?DQ+iwDbUQNvLz2q5PxNlcS5gBquuMUG8xTDkZH9m24T0msyWR/A6YwPS1ggo?=
 =?us-ascii?Q?EC13RM8J4KKr1nRcUyTx2lJJnTBtDGnkrEMC/96SJluQeTrE2DslN8tbBJbq?=
 =?us-ascii?Q?6guPNiBtndJExzjT5ulj6SW4atfnnqf+UbVlNxWUWU5BR+uSmHor7QbtWor4?=
 =?us-ascii?Q?p68lO6tKNQAGSiwa9S/srnudHvCdIVZdZqkbWvLuY9vmMHqyuppwFzGaJHhM?=
 =?us-ascii?Q?7l0sVM88MHqg/SxThkZaf6TqEfa0Uc20cTGZb/4TXnxm01L7PsREGeNWbUOP?=
 =?us-ascii?Q?W2ZFGKKyYuFoZ1pQEK+OSksggCOF1K1T3qMGzv0M4bdaNLjiH+vw54vTQLlh?=
 =?us-ascii?Q?DBGBLLISqTPQbmRuol4Yg44zwpqLyZ68aaX3cVcGBanU9HtVnIUXqrANu75y?=
 =?us-ascii?Q?Z9bzyiX+YhWWU269d6d9DRrKgYNaOZgU7CNg8azBs0CKD1s7OpagMbO6KbPT?=
 =?us-ascii?Q?E3yT9V2qABlZfDt9NVhlX9i8a97h8uLZHWz6cpEn8/8rLP+hqijp+1599jgp?=
 =?us-ascii?Q?rSvgmc0niEJmbmb5Yobdfk55IIHszD5R68y+ZPOVbVAdihPtOZivqohmacLR?=
 =?us-ascii?Q?DdENdd+WT811u3OAvVVY3tQ29skeDbFQf+2KIrLeztCW4pg/S3pZo1rgLsV7?=
 =?us-ascii?Q?qFsdHTl8hIEPlN3JPVCFngaFgXQIwc03Z89XN5CIw6LUyKCg/lBBvE+b1Brj?=
 =?us-ascii?Q?L2IfilpZMbXZBIz95F0Bl6C9oFzdI8HC5F1RmsG6p/YFsh49pT8cr8ZCgTuM?=
 =?us-ascii?Q?PxiEEEs+4NEPk14FJRk9VTPofAkuNLW/Zt9k/hyzqi3Q6GekZK1xMyQa5zDG?=
 =?us-ascii?Q?DPBnCzN6LhdNn7SgGpbHbKpZNZDWVy1Q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fhVXzB4dXpxk2VninEjyd5nDFZ06bajCzDXBgm/oyVDoyfuOmADR+XCdPKBQ?=
 =?us-ascii?Q?ZLK6LX5rSi1Uxb6xUsVrDLCiP0FkKuDDJ1LjCmQ3ug9OUuBu/wt2FuXC0Aw8?=
 =?us-ascii?Q?KLPPxThIycvk7XDOXsteVD/4IEAn3g4cAl68fzUIrCxp8iQwkNW8zpCCSMud?=
 =?us-ascii?Q?5SHGeZusffyUJMtlJwU3pEBapVZDd2I5Mg88h5t9CX4BR2iYNW7U9z1pewvF?=
 =?us-ascii?Q?vJGdy8POIkM80IQl/p8W8tTbVR0ST6F6HUuc91mu0diAeoiNUobXVmNQC/DM?=
 =?us-ascii?Q?LpPAJjII7JP6YIzDgHJk2z7oRsT/1OKZJuqOktzzopnOFoWGRGRBHHbHQv+c?=
 =?us-ascii?Q?O6pPYtp1Hrj2r4oFu5MF72POB5WUvyAw1Qy18USc2ZnOdiM2OjBKmB+ZLJHH?=
 =?us-ascii?Q?y1AB4w4Yq831a8yzdbs8fFFiMXpNk5Tk2Hiu/k1BGs3adS1JAHCpnx+I62Rq?=
 =?us-ascii?Q?4qsuCmPP939cLN7omWtHIwkG/8ciZB/NNSTHz0czfdk22VS2MMzZvCBkcqmX?=
 =?us-ascii?Q?4ifNDepbYHYBT6qq9jqPDdNU3kasvnAvFA2KZDfQXg60VELVuiV0Kuebs/WI?=
 =?us-ascii?Q?jvUwgezpCvSIdvrE98/CWZAbqqqjLzIYYNDZ3OUbV44zI4Affmj/h87VYsed?=
 =?us-ascii?Q?+DiQmGfiaqxiemjponRS3va9TlHNyikhscNhK5MheOFhiWSxtHDmQccqZKcp?=
 =?us-ascii?Q?UxPM2nEoAhOUqZ3cFpsoaNuhuYI8XwtaXUHhPwDtPDbu2lJRX+2QD6VfzsOJ?=
 =?us-ascii?Q?F/YMvQQaNHiKHfh6w4KR+RCvKxrlE06hP9ajxC5/C32qeRx0igl6cSNMZaLS?=
 =?us-ascii?Q?P/kXKaiAmKfeIKwLyoA/0RTgY1gVX8hbENSSz4jcKEifRR7ZIU+Ws2pXbSu7?=
 =?us-ascii?Q?5UcahURXsE5+jVuVaHtba2cV+YBU+eKPQ8gg+u2IlM5pPei+48Ou0t1Kzxl2?=
 =?us-ascii?Q?0kCtRJrjEKHn7mj+427Q0AowWKHCP9RtMoRqmm9XKEDAK7cXt4xCFL/lEBo3?=
 =?us-ascii?Q?4F8gSDR6JiprSzMbmkLwdNQYW67bGEVJlZe5OB2PRf95+g4LClrMy592Qjc4?=
 =?us-ascii?Q?BUDMRRjp3hFpxH3SUbF39sl5QiFxKdVuKDlFFV6CGAonxtqC4L1TbRrqHNZT?=
 =?us-ascii?Q?ba0diHKuxaDbF2MuUGIgdqZ2Ml6Bzk0W/qHF0r30WiuORwI2GAxvQ7X0B6wW?=
 =?us-ascii?Q?AV5/gf/O6RC51pvh25VKXUXPgAyau9defSIpg217xgxAa+ZMnuh/la6DwspP?=
 =?us-ascii?Q?AuaC+jokVxc+n0LNNQHEd9s5vtYu12nQ3TJzTZ5b+EdBAJrblzNP9m7RJewH?=
 =?us-ascii?Q?HUVmNjj3ZZ7ntXNOofpGicoKx6uk5194iPbiRYn2PyBJaFvUOFUdssHexA6x?=
 =?us-ascii?Q?foM0SrQcy4g5qjVnQYLJbXiC1ytdnsk2VHutO1sKs0INJf+ls5vxv8bZrkK9?=
 =?us-ascii?Q?JRTaDlXqyM74lgpHoKgbU3VUz0tQ85A6ZUOsZxv1FJp3qG+41Al/J386ntya?=
 =?us-ascii?Q?1TpafLdbs8wlvgVzX5Mpb+Di1xDV7kGMLMJ5LVz/2MrkmkVssfXpHi7KowwD?=
 =?us-ascii?Q?2WK2IoO+JzXaB3y322NWbXAdgtZ7l51GsHCY5wPKUR9//h+Qp8EwJyt3xz1c?=
 =?us-ascii?Q?mfz5oyssbysmG3LXSbphPiI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d78fb249-526b-47ac-90ba-08dd5605ed73
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 01:36:01.6322
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S0Dww2ZlQFQf9mgXoGYcuCO+mklJSipBsKE+phhktoHa/RLa9Ze6bBACVWx4E4vDzVZlZ/qjG1VeLcWwNMKYyB2dYwz1LZf6rAmLPUgxkfEJY0XHSu0ZKAT9rUhBteMW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9660

In SND_SOC_DAIFMT_CBx_CFx, M/S are no longer used. use P/C.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/wm8988.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/wm8988.c b/sound/soc/codecs/wm8988.c
index f0e9d6e38dc0..cf6d642b7bfe 100644
--- a/sound/soc/codecs/wm8988.c
+++ b/sound/soc/codecs/wm8988.c
@@ -589,10 +589,10 @@ static int wm8988_set_dai_fmt(struct snd_soc_dai *codec_dai,
 
 	/* set master/slave audio interface */
 	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		iface = 0x0040;
 		break;
-	case SND_SOC_DAIFMT_CBS_CFS:
+	case SND_SOC_DAIFMT_CBC_CFC:
 		break;
 	default:
 		return -EINVAL;
-- 
2.43.0

