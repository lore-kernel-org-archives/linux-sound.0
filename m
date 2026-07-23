Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED9F415F11;
	Thu, 23 Jul 2026 09:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800352; cv=fail; b=EvUAc4gS7YnxdnKN6Kfh0tWYX4HozsVU3VwwZEVD2kOM12k7nI8iSyvtgSPCQCV2mPTVl2iOkdGHqPqvBa9MSf7WfxbxzsaroQnsgNPhShjKYu7lOU0qG5bCRpI4rt9d2vMXYxe6P40e3cgDdT4HFlYl5k/gHPds0bn+uAULlX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800352; c=relaxed/simple;
	bh=7zf8Xmh3ELdFHpSx4d0l7lASuA02TgqrqNzBpXqBJzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oq3jFDD6eYBz5ks+Brbsy8eELsv9S4rfsZ4GMzRMqYkCkgx2GRMJl3UBebPhv+s7Q4D9PqTZexD4Dk4eprjwovt6zkuPyyku4DIOESyH7fXVYd+BChe/L6CrOuOM0zqPIJBiLUdcmIKQWFB0dN3UZQuIsQYU5pYfl6hS70BjanY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=d1EiASqm; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=yCWwzXxq; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="d1EiASqm";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="yCWwzXxq"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0vcAJ4168065;
	Thu, 23 Jul 2026 04:51:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=EUo2EK3B5x/KFLdgPUHQDAVu4o43ciQds3+vzx7hzQs=; b=
	d1EiASqmeaQ7UXJxz8bxPAMnjqfBq6smcaKAWWNNcg7uZ4xSkYm1Du21dDazthlD
	Xil4KN9DB5xCIhFnlG2fRPMQLE53G3T7Gx3naK0An6jfmXls2/d+HlSg0k9G9z66
	Igsraykdufe1VOY9l+cxFQDI3I5eYHUwFIsMnaM3lzi/I7fNhXOQLUooYNyktYkl
	n68vCc8ltt63f2fHd5h7VAMK+fUMlkVkAZS2K078NTObDXqTyOzUWSkMvfU7z461
	uWvC061LMe2nQGe87SClG3jbL4gV5rbO7ISwxzhxVdRL80ADKxPI0Fa7GL/qv0PG
	r8es78xBdf4JTKVnhBbcIQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11021117.outbound.protection.outlook.com [52.101.52.117])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fg5wff52r-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2026 04:51:58 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJD0EHNFxYMOCvyWxH6f75L8Gc6xIhCKoSjxs31qzMUqhx8DT7oWoyCuf0fpgEyUGM/rIgt4rqPfbQcTdyprXvssgx04ihAfcUeRoAKMQrBzkIDWtymRPe8cwB/kQxOgIKaCImzj5V7KONKJUdwsyf2PwG5DfKSk+TtNCvz0JxNMgE8733pU/FPOGhoo3UuogfYE9Q3sOzZguqngcIGZWqMVY5gBj5oNCxAo68Kt3IkdWnV2oyuBlIyb7gzbHUiGlIm/IYbjZKx6oj53yZkjIP1l95sWn2DG8hSQKbDBKK81IJ4Yp40xWnDqXcVQVDjYzVEN1wnH7t4n/mIEWtNtFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUo2EK3B5x/KFLdgPUHQDAVu4o43ciQds3+vzx7hzQs=;
 b=LvyBVekemQihADCS37SEeBA9YkOEYZvCsgBAJZ/VXzEcXn3ZXqXG0WUHednvZGP+/Y/NykTk6JUX6VG9i45DaaqeSJsquMu3SI88D+b0Jnph/n7YtwzmQLYmCVlMEBfKn6MulcXiJu7ccJJlIMQ4vb9s5XjPlo0MIzUoOaEgsvMLH+rhZ5wGlhOIGfDcLldBQFcejCXMKurxAyF3LDBP6F4fjkLakflRQDhZ/yb70Kh6JJ0zHUm+A43HTVByG3j17FHXEa2w3/I2b8IzZtB2Uolo/YiP+bJ6ekRr+fyODJADPbTlac+y4pMCdBfnZ0mNy4NljZA8yV9E6Ew20RDb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=analog.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUo2EK3B5x/KFLdgPUHQDAVu4o43ciQds3+vzx7hzQs=;
 b=yCWwzXxqKLqbqcs5oD9Km1Cn0Fps3Xf3Cumq6hssmaGDoAejN+lCh3uPIDu4Wb7JBSi7X6Nep0lyOuKJaDPF3z0baL6cSuvGyzvgjvTpdM5VdYBzeBujttK3kDyosvRVXihJi2Uv+P1fC3AqeYZ/sxzDkXdTN4+S3zy9aDRLfrU=
Received: from DS7PR05CA0098.namprd05.prod.outlook.com (2603:10b6:8:56::8) by
 BL4PR19MB8811.namprd19.prod.outlook.com (2603:10b6:208:590::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Thu, 23 Jul
 2026 09:51:54 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:8:56:cafe::76) by DS7PR05CA0098.outlook.office365.com
 (2603:10b6:8:56::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5 via Frontend Transport; Thu, 23
 Jul 2026 09:51:54 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.5
 via Frontend Transport; Thu, 23 Jul 2026 09:51:53 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 9A10E406541;
	Thu, 23 Jul 2026 09:51:52 +0000 (UTC)
Received: from [198.90.208.11] (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 802AC82025A;
	Thu, 23 Jul 2026 09:51:52 +0000 (UTC)
Message-ID: <c3f876ad-e222-4cd4-ac29-e55040ccc863@opensource.cirrus.com>
Date: Thu, 23 Jul 2026 10:51:52 +0100
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 18/26] ASoC: codecs: wm5102: Use guard() for mutex locks
To: phucduc.bui@gmail.com, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Lars-Peter Clausen <lars@metafoo.de>,
        nuno.sa@analog.com, Shenghao Ding <shenghao-ding@ti.com>,
        Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Linus Walleij <linusw@kernel.org>, u.kleine-koenig@baylibre.com,
        Thorsten Blum <thorsten.blum@linux.dev>, Kees Cook <kees@kernel.org>,
        Chen Ni <nichen@iscas.ac.cn>, Bartosz Golaszewski <brgl@kernel.org>,
        Shengjiu Wang <shengjiu.wang@nxp.com>,
        Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
        Pengpeng Hou <pengpeng@iscas.ac.cn>, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
 <20260723045327.28260-19-phucduc.bui@gmail.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20260723045327.28260-19-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|BL4PR19MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe4099d-4290-41a0-94a4-08dee8a006db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|23010399003|36860700016|82310400026|376014|7416014|56012099006|10067099003|22082099003|18002099003|16102099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	68ikyzCrjrFY6ZsTHHJMbsDD83z1o1iWBM8kzBzLxHRYAORhj+y2e0ggzvdfPgzUcXS9FSUrH3YMNIasc63eHF+q4zBT5LwJzg40YSnE9aWms5/mqaer6LTCp0qcmUHb0hSiZFBdUrYtTPWw4OFWg6Up1EIg0wI0lmN8gTlAFYVbatUGieuxHpl31BsXgaYnY3zipGaJXrsn9C52O3XNBNgPl5flFsBR1XbW9k+Y0EUCR5V3P3iVad/0EYlXvlR/mdKNFyWA7YykFyLiOHgQ8GMJDCfW0G7whpzLX8fY3BoKVHrljCdX0NwUeqPfVfhpRMbSclSD51aqARNGF2h9RQV1T5prwnV/rP8ZSFDVAAAr/fGH07/eL8Ii4hFXfd9UqCzHTQzAQUj6vSmKjxAdqDTywtUK9CQeYZUxOPuVYnJLZIujObg0DRRswtdG4q4i3K4/dWIKTHC+DCvEChzCcmiHbACWUJT3ajCvZdHedF7+eSYjCvOs59YfigHEmi0CfZnIWZuWfjgHBchpAMHJOvuy7ke3ylw3LEPh0OH2MFtWQSEyfOEm5sfGoeieiqdsqUyBR9QpsZpI2sc4DW1IvDs/tsBfu7QPjUny9wzMAmxvPUAGJDqX/m3m0LlOizstEk8jGdXusw/xb6cxI0Mi1SRlqQ7Ayzr93k1xxfKSJXd1JdOin8NOm2npKaD3V+8H7K4movYiggn/Vg66MgG/SQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(23010399003)(36860700016)(82310400026)(376014)(7416014)(56012099006)(10067099003)(22082099003)(18002099003)(16102099003)(4143699003)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fVYQusXzM+TB9NwHuBpYlcOhjVEAyr7wNVK5QC8LoftKtCoA5sZMLm67Tcr1Q0YVpCtrujx0nyMaLOnOqUV1bP+Vi4nDYJFh4hPa75dJJEkl5lsXnI11b7ct5pwZKzMttjwfobJovgqOxNWE4bjgdehQZymtcyVFo2dbRjYqpvENh8JO9AiHz/oaM53UvslX5O5YnUNa3kKkdLFhO84jLenf2Putt7jF1npPVuyXJhNw3/vPJG5pvEM+v2Qd0FkPdUSGLAHachSLLY6E+whGKMK+pUvp55kBYZhhbvtdUxxump5iULjvUzw2A9evsYENnrkVE0KXUFcf/q6HsJhO9VEppxxsMFb69w9EPH0j3qtbrVB1QZuhPH0HCcWsIZ08ziU5YSw4qSIUUr6WKynnCQByn1Dg7T0k4ItDWbRMRRFxCdFI11D6XTfoDWatR8gT
X-Exchange-RoutingPolicyChecked:
	QCDdlg7fCGBcQmNpmVHzy6gg9QBgl3cw/B2rro8q1yCMdZrctcqI0iY2kA6v/Z6cLrSwQu2OgUQO0vuUYaH7sqdZMGWIM4UhehCGJaGu1sq+fWLTzEfSxso5BxvIumys8O6HmRvcdF5tNrRqEaH8555F2M0iXNS7kiNxL5TBOWVe50pLdtTsylpl2bww/CU4TSddZO51aonu0+eqHekINA7YDKG1Ab0ISdvMtL2VqeJkwwF16Y9CJAbldL8rDJnKar3iOCf491YX83oH0zxA7ijZNPH9f/7vX631qIkY4sFKPaJGaEdP/CNXcpdhzDooIJ57Q+nqG0HBpK21qebSjg==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 09:51:53.7942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe4099d-4290-41a0-94a4-08dee8a006db
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR19MB8811
X-Proofpoint-ORIG-GUID: u-Ynx2_Ojghp4XjWz4WpV6kJhgT_jVf4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA5NiBTYWx0ZWRfXykH3MxPYGlf7
 rCPY7hbFxjL9VDNZsZSCG543kX5zwzeU3kBF6y+mF79oPTqLwlddaEKosgfD4Q2uQQl68iEMA2h
 qq2K/s8iJGsiuYrORsYhLZLiFn7KtQo=
X-Proofpoint-GUID: u-Ynx2_Ojghp4XjWz4WpV6kJhgT_jVf4
X-Authority-Analysis: v=2.4 cv=BdjoFLt2 c=1 sm=1 tr=0 ts=6a61e43e cx=c_pps
 a=nUtUY41U26iC5jD0qKn5yw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=pGLkceISAAAA:8 a=wggVRkVUAAAA:8 a=w1d2syhTAAAA:8 a=dseZgc7Wqv4YLdx5lZwA:9
 a=QEXdDO2ut3YA:10 a=MZpHe7prQc2n3JaO1KVd:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA5NiBTYWx0ZWRfX3ilaXJHHKLzA
 skfg4OiDxNwKBcjOjnf2Lq4JlEQjATPaf7W3W/CWH+GPrQ5zn0nRfG99ZsvFGGsB28rsvbXc6EV
 riovtXxF0DEfDgzQDSGnJcSMdHUhS6AgbsQkO1eK0hO1StjiiKXNt6BFxsu+4BsBLKKdpwKJzIf
 VKAI4VN7IssC6hYMCapeX7zsr7BgDQDtDrXjERKRBLD4VcA/yYJSjVzmKz5LjgjwpLCPXniHno4
 /PEFsn+X3w/6Ivtg84uGP/10zMc/aO2ld6p1goIzPPEhn6VvoW7JlFGMog+hly4rMk5pOk0JkWm
 Peu+f1t5wdQYnXEUUNx/QdnjKtauPe84VsiZhVnsSq/BeP5WvsJ07ShgLPRCXTnLTXipucwCOA2
 +xtzVrFhJFu2c5Zqt566u62ZTzxY5FuurX/JDVefxGBgCUSoKFDgQCHHFvuLPyLvl505YYBgKb2
 C3NEYKPN6T86VJrb8SA==
X-Proofpoint-Spam-Reason: safe

On 23/07/2026 5:53 am, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---
>   sound/soc/codecs/wm5102.c | 23 +++++++++--------------
>   1 file changed, 9 insertions(+), 14 deletions(-)
> 
> diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
> index b4d4137c05b4..74b775b95bfd 100644
> --- a/sound/soc/codecs/wm5102.c
> +++ b/sound/soc/codecs/wm5102.c
> @@ -7,6 +7,7 @@
>    * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
>    */
>   
> +#include <linux/cleanup.h>
>   #include <linux/module.h>
>   #include <linux/moduleparam.h>
>   #include <linux/init.h>
> @@ -667,10 +668,9 @@ static int wm5102_out_comp_coeff_get(struct snd_kcontrol *kcontrol,
>   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>   	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
>   
> -	mutex_lock(&arizona->dac_comp_lock);
> +	guard(mutex)(&arizona->dac_comp_lock);
>   	put_unaligned_be16(arizona->dac_comp_coeff,
>   			   ucontrol->value.bytes.data);
> -	mutex_unlock(&arizona->dac_comp_lock);
>   
>   	return 0;
>   }
> @@ -681,16 +681,14 @@ static int wm5102_out_comp_coeff_put(struct snd_kcontrol *kcontrol,
>   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>   	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
>   	uint16_t dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
> -	int ret = 0;
>   
> -	mutex_lock(&arizona->dac_comp_lock);
> +	guard(mutex)(&arizona->dac_comp_lock);
>   	if (arizona->dac_comp_coeff != dac_comp_coeff) {
>   		arizona->dac_comp_coeff = dac_comp_coeff;
> -		ret = 1;
> +		return 1;
>   	}
> -	mutex_unlock(&arizona->dac_comp_lock);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
> @@ -699,9 +697,8 @@ static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
>   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>   	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
>   
> -	mutex_lock(&arizona->dac_comp_lock);
> +	guard(mutex)(&arizona->dac_comp_lock);
>   	ucontrol->value.integer.value[0] = arizona->dac_comp_enabled;
> -	mutex_unlock(&arizona->dac_comp_lock);
>   
>   	return 0;
>   }
> @@ -712,19 +709,17 @@ static int wm5102_out_comp_switch_put(struct snd_kcontrol *kcontrol,
>   	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>   	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
>   	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
> -	int ret = 0;
>   
>   	if (ucontrol->value.integer.value[0] > mc->max)
>   		return -EINVAL;
>   
> -	mutex_lock(&arizona->dac_comp_lock);
> +	guard(mutex)(&arizona->dac_comp_lock);
>   	if (arizona->dac_comp_enabled != ucontrol->value.integer.value[0]) {
>   		arizona->dac_comp_enabled = ucontrol->value.integer.value[0];
> -		ret = 1;
> +		return 1;
>   	}
> -	mutex_unlock(&arizona->dac_comp_lock);
>   
> -	return ret;
> +	return 0;
>   }
>   
>   static const char * const wm5102_osr_text[] = {

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
