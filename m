Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00ADA3A1E6D;
	Fri, 27 Mar 2026 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774608521; cv=fail; b=KQDsnThGG9vfykhgZx+DABjBp320yqCC+FN1ibXqFg3ZwXgi950DOAGYh6TrlZC++Rr1hRWjr6OciTDuih/MM7jHzTiTFX42BWDlSBTXtbsMATsZ1De/tbKWvfDfPvCbieJ/ZEaMg/s0Waxi1HYuSXMquVNE8b4kpwRwZSSsCak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774608521; c=relaxed/simple;
	bh=2cI6vGfcHQNzp2uf0/u9hF6Z5dq6MImuxklq2GedDpE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWTofP/cj2QmiNO7C25/aVI0O/HygbFWylp86ctCWLhNjFXyektqJJidDi3AdXX/0jvPdNZp71N+B3d1pxsBgZZcQWD7p9Zh3bZcJF+lxDQXhgYC8RMXSfc6StSzDzbGUYsTByz8FmQbJucBkiFS0LLq73B7Dmp5pForlGv4yjo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=ozbYW9F3; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=S+P3/sD9; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="ozbYW9F3";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="S+P3/sD9"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R4mqvO518966;
	Fri, 27 Mar 2026 05:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=gf5kSzbisyj1tCo2kN
	0Y053Z/Gf+r1G3hCIZpqf1KHk=; b=ozbYW9F3pf6W0vxoB9YhwQxYui98IWrrbk
	lLmbJJEy0zn0ib4afzhDAKbFdbLIta0hwByHWo0q9tsSfx5NG6fEbPzarCdie/D9
	1uFPTQXkehebQ++E619QpRNCsyFzT5Kllg4dk68zgKMutotMalIwkPHs6++3tSnU
	vlUhMSEVTrBcOFdQVpgglLtRJvD2vUbzWrhV5ZJTiOXy+oTdWZWNgCq+eVs8+IWD
	xN+s6XmFOFflnKDEE2x0FtQyLRgDEHPc9PNc3KxiagZ8YN31I76E47Nwl+65nxeA
	407AKryc2fjdJM0ouhyBX6bgYLifLRUlReacFTeFNxWF0bJca+Tw==
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11023079.outbound.protection.outlook.com [40.107.201.79])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4d561d9hg1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Mar 2026 05:48:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PzkSkSVFZ6ZyC/LQ7fpNq+qS941nX3hYmcOqcpZ8SjT91F7dlmYxhg5DlHW2u+TMaYu1NjYIr1OO5Mxj9JjhTA2nKgrD+hHEw+ZT7VQ2zFArsA9dAPi8xNuH/I9Iw9hVSbHeiB3aBh1+UFouiB286jMvNTNJXbg4fsBpCStWmgGguBaLt/C1SgV8jJ/7urfnnxjfVQDxE+EA9Xg9wrOSMHHlNxNrsU7qJlDcL6NUZbPz08fXg7ZsNFSNXvwz6fRDUBJ8oycw17kV9AHdRX8LcHgusK2q1mVlZIv3rDds7fbCtMU34Af5Q7y16qGG6zmM/5TKB+6NJHAQpnPRyvWvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gf5kSzbisyj1tCo2kN0Y053Z/Gf+r1G3hCIZpqf1KHk=;
 b=FvXTnyTqou+rXEP0vl7cZExtP34EZG9I8lMawgD1+3j8kioekGRwLfp2bWT1mIXH4USnbeL6GWcEfP5gQ2YSf+Ok5hR6MtezEWV/II+JuRvyWNjs5piMf62LoD4uUyFVuXL+wPLDoAw3ZRHPww9dSqsbVfCPx6TisnvBeptqamCPa1vJ9R/zV+/DZH2mDkPyySMI26JANXuX3kJ/BeQNsjOzyfX441V0K+6zult1NuEFp8eXE9J13P6I2zacsgf1hhUs3lsTeB8z4biMsUlgzVR0gwJILsm0vUBNStxh10qy2UVvLOE/9eXbHndKKwWG4o98wZZFohyFGIw0nyGwmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=gmail.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gf5kSzbisyj1tCo2kN0Y053Z/Gf+r1G3hCIZpqf1KHk=;
 b=S+P3/sD933dGyvvjG3wJfIcVPSFQLfdVw2lpL9aKtAM1pAF0OqHQzRM99j9bkf1rVEh3mNUZeS3A6FQPKKXIspLyty2K222A5+B/Shd4+bJZIGUkizKq82iscnY11gXqgpEXTGn2YgHIM5rLkVe6K+dfJVgNzEX0wcpKCIdfnvk=
Received: from SN7PR04CA0208.namprd04.prod.outlook.com (2603:10b6:806:126::33)
 by DS1PR19MB8691.namprd19.prod.outlook.com (2603:10b6:8:1ea::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.23; Fri, 27 Mar
 2026 10:48:10 +0000
Received: from SN1PEPF000397AF.namprd05.prod.outlook.com
 (2603:10b6:806:126:cafe::4c) by SN7PR04CA0208.outlook.office365.com
 (2603:10b6:806:126::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Fri,
 27 Mar 2026 10:48:09 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SN1PEPF000397AF.mail.protection.outlook.com (10.167.248.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.21
 via Frontend Transport; Fri, 27 Mar 2026 10:48:09 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id BC4BF40654A;
	Fri, 27 Mar 2026 10:48:07 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id A241E820247;
	Fri, 27 Mar 2026 10:48:07 +0000 (UTC)
Date: Fri, 27 Mar 2026 10:48:06 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Niranjan H Y <niranjan.hy@ti.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, cezary.rojewski@intel.com,
        peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
        ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
        pierre-louis.bossart@linux.dev, baojun.xu@ti.com, shenghao-ding@ti.com,
        sandeepk@ti.com, v-hampiholi@ti.com
Subject: Re: [PATCH v2 2/4] ASoC: tac5xx2-sdw: add soundwire based codec
 driver
Message-ID: <acZgZnup3ENYl9SS@opensource.cirrus.com>
References: <20260326181712.2274-1-niranjan.hy@ti.com>
 <20260326181712.2274-2-niranjan.hy@ti.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326181712.2274-2-niranjan.hy@ti.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397AF:EE_|DS1PR19MB8691:EE_
X-MS-Office365-Filtering-Correlation-Id: 157264d2-2b25-4b43-2c21-08de8bee560a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|82310400026|7416014|36860700016|376014|22082099003|56012099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	01efENq8NUGDlhc8UoMd7Jc+NVlv1a9RriWzBzw/xL2taNosbE9oh+rSpy9JG6WHAgMqL2SMoMmJFXIvFQj8LfTmTkEROZl3jXOA7U5gnhFXgPK0gqjBIpqkNyRirmh8mLLpomDwPQjaDpuMM/i2gBC5/LaAKd0XZHaJEbG6Tkc+nescRkATKPXEZa6or5JFcTfvyLOFavX16iHsQomrK7JUMJyzU6c1cWinwxN2L9m5xjiJFiJJOJHQljfm+kylpZor2r+hUSv4ICBB5bJGV/6f7cq/8MAYyM1so04d0mAbPFgQboTqo1yry5cO9UtDCwqOpam4wxKAqOc00oVl8evsVt2q0OdB5Fx+ltJjzL2OmXER/901BVtYSLUtAdVI266awWVC4Gp64QI8lvsE4z+QSjHdyE2PkZBbfmH1i/N10JxFdDrBjHN9A0T5b1JUh0H4irEe3r22hxHrosHcdfkAbYnzYAe1hZYvAxpVzUNVXrRbTUvPcw+bkxX1K6+bhbpfQru2NsXj2aj31eHwCOzBvPThoUTuYmXxeu5FG8GRSOTiEasQp/1CBXn3LctYFdaj3+Tws8HRHplxLPK2sy1FR/A5ZHM8wAc7i9q4OvIF+vp6DlIcy0CVPjFly8qgUtUIKjjyl1L36w9CmarFO3N0dGNFVTTiztNgRFqc+hMnwbDhPL+c46mu7UgqCn4Gdp5AzZ7RJzd0QqJ3E3XyhJ/V8cecNUV3dGaR/WcD/lKQf0YpJqeswcQVV407puqOLBnXciz8+GnJUkPuFAGvQQ==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(82310400026)(7416014)(36860700016)(376014)(22082099003)(56012099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fNf2UtAIEM09d/6fcwtI+jb+F8R2C7Lrta8Q1q35f7qN8owFnWDB7PIJZtq9ueh0X8Sd2UB2FyQACoAiHSDpzvt/9/tFiXKCr5PiSuCuhigDIDcrCgsAT4T20EsXJFx6uCkg8dFQ+A8nID7X4lngwmtQM1aZ+SpTqR9SUjJYrAUcKnlZ/MlaX9o4BrzHjuaBbrWrFA1SWq3tfUQmtea4g1mCl5DbxqCx2QnOJ99fYC270fjJcF9H8Q6dzNXZAzbMfOlBE29nVs6BpQlvJl27qp+pvVu2x2YHRxpkOzqeiJwTNFquihsl9H+cNLAhTybFYSepIWnfZRIpn2ZEJjA7AyvNjEyGOwqw937rBOL3aXMHWQ63kBwQg/XdsBpNnAxree3uDunu5TBlRzKvQcVrVOa2GFvNJw8H5mQDcIn3UaeQAQlyQb0Ih84/v10w2sIw
X-Exchange-RoutingPolicyChecked:
	DlBn2s9wW1/SaNmdd+qscgqkpIw5nUxX3VTROrtWaSWsGk2iFhONpM7fwJ/2AMdjyBK1Lsf3ilbYd6JVvMZo5Y5YDowqkEiKtF1nzoXViumdoZklS/+rAEbdhZDk7DQjZxW76VAzvn0+iFmTmkdujsxOKjmE+r1XDcrEsoS7kAJsXy/bTrzxkbvLbhQKbpk/RP+StN2ZjyPG1OZpciaKK+Xyj/kzAR+EBH6x3W/446Qjc08AayfJgtn91XIIhRMVLXe+vcFM8UIsKroK2IPqVKh+DHsweZpMVY9KY3Yh08eszJa3KAM5JBSfDm5431fihXoJHeFRBjcsvXbLookJmQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 10:48:09.2329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 157264d2-2b25-4b43-2c21-08de8bee560a
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397AF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS1PR19MB8691
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3NyBTYWx0ZWRfX7YaBRqt12WH3
 nFJgl+X/V7a6CvtIiRvLGqRxNdJ4GHel4dlhd+7SoFDis/OTHCEyC/VPHMwXS5DevMMlcS52jEl
 6kwrXGusAvBxiqqSqapdH5EF+6UqnfJEGkqtRR6UohsrbQ5qMl6XU7TZ94Jh7yzjdhHopOjwjnd
 2Aiwm8y2R+XJyeoM/1MgaKkS05vNJMqrsjrlugWv81h14eVfuleQ2mBpfDn9D8mZyrhMn8HhJvs
 6GenuVdUtD3iJYVEWReJ6OVqpijWS0mzqMEJ4wOTdPlWIRMtZtUkvEs7mPNn2d8vGhzI/LsWeRB
 ZrTG0KdxAjO3wWGu537gRYxKOT1G9l2lZeCxoDvNJ3bIurzE2deFNV2pLlnTEyJjEoIKTTDtJvK
 HsfIZiFPQ40g1Uv8P5YaFrVALIle2j+EdySM9JcCBZrexbAooDc3JfG92S+mWKRQLgLA1nUk6cR
 henAkfXc9tgN0i7irOQ==
X-Proofpoint-ORIG-GUID: UJYJPhCgW_F-LE50d28r_cWXnZXZlC0o
X-Authority-Analysis: v=2.4 cv=Gr5PO01C c=1 sm=1 tr=0 ts=69c6606d cx=c_pps
 a=QpQIPgq430LJFJp+cclIig==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=C_Z8-9vfve8daUOGooUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: UJYJPhCgW_F-LE50d28r_cWXnZXZlC0o
X-Proofpoint-Spam-Reason: safe

On Thu, Mar 26, 2026 at 11:47:10PM +0530, Niranjan H Y wrote:
> +/* TLV for volume control */
> +static const DECLARE_TLV_DB_SCALE(tac5xx2_amp_tlv, 0, 50, 0);
> +static const DECLARE_TLV_DB_SCALE(tac5xx2_dvc_tlv, -7200, 50, 0);
> +
> +/* Q7.8 volume control parameters: range -72dB to +6dB, step 0.5dB */
> +#define TAC_DVC_STEP		128	/* 0.5 dB in Q7.8 format */
> +#define TAC_DVC_MIN		(-144)	/* -72 dB / 0.5 dB step */
> +#define TAC_DVC_MAX		12	/* +6 dB / 0.5 dB step */
> +
> +#define SOC_SINGLE_Q78_TLV(xname, xreg, tlv_array) { \
> +	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, \
> +	.name = xname, \
> +	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | SNDRV_CTL_ELEM_ACCESS_READWRITE, \
> +	.tlv.p = (tlv_array), \
> +	.info = snd_soc_info_volsw, .get = q78_get_volsw, .put = q78_put_volsw, \
> +	.private_value = (unsigned long)&(struct soc_mixer_control) { \
> +		.reg = (xreg), .rreg = (xreg), \
> +		.min = TAC_DVC_MIN, .max = TAC_DVC_MAX, \
> +		.platform_max = TAC_DVC_MAX - TAC_DVC_MIN, .shift = TAC_DVC_STEP, \

What is the purpose of the platform_max here? Doesn't feel like
we should be setting that from the driver.

> +		.sign_bit = 15 \
> +	} \
> +}

Probably makes sense to parameterise min,max,step here and then
put this macro in the sdca_asoc.h header, perhaps rename to
something like SDCA_SINGLE_Q78_TLV as well. That way if others
are creating these controls directly they can just reuse that.

> +static int tac5xx2_sdca_button_detect(struct tac5xx2_prv *tac_dev)
> +{
> +	unsigned int btn_type, offset, idx;
> +	int ret, value, owner;
> +	u8 buf[2];
> +
> +	ret = regmap_read(tac_dev->regmap,
> +			  SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
> +				       TAC_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), &owner);
> +	if (ret) {
> +		dev_err(tac_dev->dev,
> +			"Failed to read current UMP message owner 0x%x", ret);
> +		return ret;
> +	}
> +
> +	if (owner == 1) {

Would be nice to use the SDCA_UMP_OWNER_DEVICE define here.

> +		dev_dbg(tac_dev->dev, "current owner is host, skipping..");

I think this message should read either "current owner is device"
or "current owner is not host", as a value of 1 is device and it
makes more sense in the context.

> +		return 0;
> +	}
> +
> +	ret = regmap_read(tac_dev->regmap,
> +			  SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
> +				       TAC_SDCA_CTL_HIDTX_MESSAGE_OFFSET, 0), &value);
> +	if (ret) {
> +		dev_err(tac_dev->dev,
> +			"Failed to read current UMP message offset: %d", ret);
> +		goto end_btn_det;
> +	}
> +
> +	dev_dbg(tac_dev->dev, "btn_ message offset = %x", value);
> +	offset = value;
> +
> +	for (idx = 0; idx < sizeof(buf); idx++) {
> +		ret = regmap_read(tac_dev->regmap,
> +				  TAC_BUF_ADDR_HID1 + offset + idx, &value);
> +		if (ret) {
> +			dev_err(tac_dev->dev,
> +				"Failed to read HID buffer: %d", ret);
> +			goto end_btn_det;
> +		}
> +		buf[idx] = value & 0xff;
> +	}
> +
> +	if (buf[0] == 0x1) {
> +		btn_type = tac5xx2_sdca_btn_type(&buf[1], tac_dev);
> +		ret = btn_type;
> +	}
> +
> +end_btn_det:
> +	if (!owner)

Does this if actually make sense? owner can only be 0,1 by the spec
and you check for 1 earlier in the function, so isn't this always
true?

> +		regmap_write(tac_dev->regmap,
> +			     SDW_SDCA_CTL(TAC_FUNCTION_ID_HID, TAC_SDCA_ENT_HID1,
> +					  TAC_SDCA_CTL_HIDTX_CURRENT_OWNER, 0), 0x01);
> +
> +	return ret;
> +}

> +static const struct sdw_device_id tac_sdw_id[] = {
> +	SDW_SLAVE_ENTRY(0x0102, 0x5572, 0),
> +	SDW_SLAVE_ENTRY(0x0102, 0x5672, 0),
> +	SDW_SLAVE_ENTRY(0x0102, 0x5682, 0),
> +	SDW_SLAVE_ENTRY(0x0102, 0x2883, 0),
> +	{},
> +};

Not that I am pushing for this now on this driver but would be
good for you guys to perhaps poke what happens binding your parts
with the class driver itself (sdca_class.c). The hope would be
in time we can support all new SDCA parts out of there by just
adding the slave entry. So good to start finding out what does
and doesn't work for you guys. At the moment the class driver is
still in active development and a lot of shipping products have
dodgy DisCo or hardware issues that make use difficult, so
this is more of a long term goal. From scanning the driver here
I am guessing perhaps the firmware download might not work so
well with your current parts. But a lot of the rest looks like
it would assuming the DisCo is all correct.

Thanks,
Charles
