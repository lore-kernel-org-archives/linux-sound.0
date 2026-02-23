Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571633587D7
	for <linux-sound@vger.kernel.org>; Mon, 23 Feb 2026 09:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771840492; cv=fail; b=Bv92kJGHTKakqnlEENhUMloElhOmetTnGZXEAsDNCfhrsoAWnPGZZZVhqkFoPaC2ALfufK8BATNCAz4UnJ6H3tGJh69SK/vDZoNlY9RtHE6lOwv8yBknvTEqZp9rGSd9sSDdS3nurqGV5SzpvHaLDLpxVZolcUDIsrl777GYUSQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771840492; c=relaxed/simple;
	bh=x3C0pF3Y7DPM61wc8IHdTAYosQ6PzAFMqfPBRRtFSnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=osMCWidCyTtNqRhE5GFrFqzzH3QIVgA+lBH5XiBKOLUWRUVo9VZs6GwDqJ1hBAKTHEOq9/w/4P0QfgarokcVC6q57r+lHJv4dovfnQSuIbG5TwhsowEbB/9DAb40/OBi6aV1kZA9fWAEAmeIDw/3/o3cEOzVsWqbbC7o792N0z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=g9mfUIfG; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=SboxTas7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="g9mfUIfG";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="SboxTas7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N5gRlW1077394;
	Mon, 23 Feb 2026 03:54:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=2vBcz5fqQTJZ1gn1QYoziS0fG3VljVwbuDl18HAXESQ=; b=
	g9mfUIfGZaoCf14WoJfiniiEuBx+bZP9Zo6JXU/s41ULxus9w7xfDEJ3xm/HNOWw
	wk2w6oOZiSRFQlZbr1BV9rlChjHrUZNKFIeQW+/yjqEVQKJsDQVA5NLNwSQCs3MN
	mTR1ew5b7/d6jNvr2nn0ryENMGwa5XUiWpyVa/nfgRBG5Lgc/zH3/HfJH8JzbFHx
	EypxL0xONnzWgVVWGAjirDatp+vr6bAjdHn87FYw0zPV39t13oP2ZiNsplAlmBa4
	bsOuA9lxSGseG6uNLDMupJ9aZjxTdZEVcflZJlpOU5QH1+03AMUhXzx4UG1jDbSp
	BLgSBT3/PK+TX9CvfBrsyA==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020138.outbound.protection.outlook.com [40.93.198.138])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4cfb019bhs-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Feb 2026 03:54:36 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAobYs/BsW2gIig/JWKCd/cmWQiR7Zwzrn/KNHbFuDuYkjVVJVSI1Ft8XnUm/S1OIwW9bIbN+3EbJZ8EU9BZQVMy2SNVoJshFCiDBQS01mpOEHgT9rbFAtUSoYoEoh/bcrW7bP+w1oCJ8pq91zmWmph7EaTfbrg5HcRZwq2B/YPjbOEqkfrQf5nM1GSaGJ3eiuRE9M7xDuayaVzqHN0DU6PyPsz5FbAXW7ptzyFcph3jNncqGnK4i+GJVfJj5IwOlsdlJqc44CuXgBBlQho3KlFVR9YUfz9KMZzFJ1SXDdGz2X9BlS/cUnQwt91mLcU8+1hBkPU5wr0q9D7ewpOsLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vBcz5fqQTJZ1gn1QYoziS0fG3VljVwbuDl18HAXESQ=;
 b=U89jBOdyxOSAkNHmXG5uZBkseqzr3keGe7dNY5lfkJyx6nV7PDCtTeDJK8Cy0bB2PxAbqcInHytrrJXdjG29jxAD9mDRUPfi+FBrD5oSrJ+wtJZ+XXPE0l2os2G2EH1vemGg0rXCqGYtMpdoSF5VkIKg/m6gtaBeQ8t4mFIiYsNNgtuBwTFTaoXLYtW34Uip+UpRigH2ztcMFnQZbZkikc5ll1fglTKX2hQE0wE+913Bx+IuwxGh1KQ+hu/cdQIb6VfjWYj0MMt8ie2TySpTQHGi8MdzbHymcz2/rVrwZOxBOfRv9fl7lULZqphXR40QgBEZw9Ya1HL9IwL6HX8psg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vBcz5fqQTJZ1gn1QYoziS0fG3VljVwbuDl18HAXESQ=;
 b=SboxTas7+/IsSNLqEr4uV9Lsip1xEtJaCuH9yeeJEYZS0w6sTsMDKeWwZWb6BMwUhzfnxaijxiKTiHIia8egfMIcE0AFEzgZQRV/O3gFucI/4wAf7VbmY63gvt5sM/0EZTMBHRXPLRBnnY0rO9OEzpZxBRqd/6H3Gs9rAXIeasE=
Received: from DM6PR07CA0126.namprd07.prod.outlook.com (2603:10b6:5:330::9) by
 MW3PR19MB4345.namprd19.prod.outlook.com (2603:10b6:303:49::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Mon, 23 Feb 2026 09:54:31 +0000
Received: from DS3PEPF000099DF.namprd04.prod.outlook.com
 (2603:10b6:5:330:cafe::63) by DM6PR07CA0126.outlook.office365.com
 (2603:10b6:5:330::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21 via Frontend
 Transport; Mon, 23 Feb 2026 09:54:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: Fail (protection.outlook.com: domain of opensource.cirrus.com
 does not designate 84.19.233.75 as permitted sender)
 receiver=protection.outlook.com; client-ip=84.19.233.75;
 helo=edirelay1.ad.cirrus.com;
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 DS3PEPF000099DF.mail.protection.outlook.com (10.167.17.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.12
 via Frontend Transport; Mon, 23 Feb 2026 09:54:30 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id AEC28406543;
	Mon, 23 Feb 2026 09:54:29 +0000 (UTC)
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 92AB9820258;
	Mon, 23 Feb 2026 09:54:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
        yung-chuan.liao@linux.intel.com, linux-sound@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 2/4] ASoC: SDCA: Update counting of SU/GE DAPM routes
Date: Mon, 23 Feb 2026 09:54:23 +0000
Message-ID: <20260223095425.3905703-3-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
References: <20260223095425.3905703-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DF:EE_|MW3PR19MB4345:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: ef4455a0-1c41-4e6a-803e-08de72c18a77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|61400799027|54012099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rCXxOOQRKmWN7hWQwR0hrW7x0KntDju+HkrJI6f+qfiXxiTkFf4rV45tR1l5?=
 =?us-ascii?Q?q0gdbgtIwH6TfM4XXviBb66G6/pMF49l9K/nON6bOcK/cQQWAmEsa+Ie47yv?=
 =?us-ascii?Q?wlq6LRcfhaSwhLc66XcJtxUsFzCFdIWckOWlyUV5Cq0cxvB2ax88T6TrF22P?=
 =?us-ascii?Q?I7hF5RBLKnhysEWXox/nIIckb4aE2/WrR/D6cBS7CDQ+StxWjFlNP3NDf9mA?=
 =?us-ascii?Q?GwOJ+mLpvasdMXdQjG0wSJj9AdMFBVfuKufims0NX+bG7+25qq6g1r/vwwXQ?=
 =?us-ascii?Q?866D9ygDXSEqfoIEfoT9OaAvMH6tWiJ3DvecgIxHMNeC89HKH/N6uWgiIl4g?=
 =?us-ascii?Q?eFwfGF5zCQWntP4RbnYeyjhPYsriBmJhzu0/hVNYpPDrs4I6/8+0qUSHdQ6J?=
 =?us-ascii?Q?yq+z0whGYL2S0YOAznEBSEsXc/a6YdET/uP1GZFM3wLBqnfg53rgUOlIue6h?=
 =?us-ascii?Q?kNB/PJC+2obiOrXGj3SMPN6nEhD2nWe0LusTRxIyvANjH7gwPQ7CzAZW0EBb?=
 =?us-ascii?Q?LZbUYT05k+qL6D13covzzQEDZ/TjPul2lpAyVeuvZcS+kmb/ToYxS+hshYM6?=
 =?us-ascii?Q?SxmViAbhwiyXhZCsV3pyyl15pt1bOpohoFkEU4uojVgs29c/+QoE8BxIOhVz?=
 =?us-ascii?Q?X3/eQSp+rw+J4WPq4yiwXWl2Osh+/0kYsRzDRiHAt9uYwhvojCfXfEUjqOR1?=
 =?us-ascii?Q?mH5/Ocst17vFj+sf3bkR+bNnQ033Z/k+l/YEkjZx4kuGOtjWVn/jHNIxezHW?=
 =?us-ascii?Q?PIxCtxwWfLExXpGUYEt5HjVeB2f2cbRCF4BO2nGRUy8zJj29I6DP6snIjXOP?=
 =?us-ascii?Q?FVh5qG0q2T465/moWNdASFHYza6hJbQGyTDPQdVgb6+mitjIL7WykBIDer3d?=
 =?us-ascii?Q?EPD1C2UB2sxT2WlTH+9FFymRul0MBJeJ/l5O+hdTZcaRirurbUoI63xyjoJ2?=
 =?us-ascii?Q?atHk4EsXtqGTepk1QZaNENXhIjGfd/2kI0mJ0diEuBnvTgqYeg+IwE/1f+ex?=
 =?us-ascii?Q?BD88bpE9rBfA6PvKAzCokCxU9yHQwDy14roWBUAn+MCHsWzw3lVAoB8TnPIN?=
 =?us-ascii?Q?icZ8GyXSXlxs3cjDf8Bug/yT2BWoDz7mktnchUwpCLtelEXXMLuWPxpZc5KH?=
 =?us-ascii?Q?C7jNFKDjLbqn90ZtWKvh4ztT3/B6SD3kkWR3Zom+NrwhnSzTKn+lyPA2XOHm?=
 =?us-ascii?Q?zVC0UlBEKTzLTzQ5QybgpIXUifaWpKOSyHpwgNxoicous5TolpNMZB3VJTDo?=
 =?us-ascii?Q?ISasOvMV3B3L3qHnBTnx6YzcH/JpUX4GzDeMoIbsRr06dY0MwROPzdLEEIUx?=
 =?us-ascii?Q?3fBV2d0Ze8nJdofrMnCUhuicU/dScc5MWT1Un7kJKnvJIreGqlRKDOSTI+ye?=
 =?us-ascii?Q?sUWLl4RE40pRpbx1eBnUU1vL3jSdbM0vz77dNuYycb4c8qDhBn7OalmjG81O?=
 =?us-ascii?Q?tZDu6gwQINovuB8dPBfMw04oxRapRGuIQsyBvJZxiHpxgYR7kt+ZgFxi5UjW?=
 =?us-ascii?Q?vuE62JPoW1/ITfbgHPfatvi3hhfbxCpOEK1JIVrbYzQwDtiOYCyT8bJFa5zw?=
 =?us-ascii?Q?Qc30MukdkdH6rjlZAhOSC3cBVDI5ADlRRYshiuvBJBsYvVihtFRdtc8df+e1?=
 =?us-ascii?Q?5yD/fbmIKzkH35IMcGNwKD4PU5Ahm2ZVhurcFKWC+BAprjmsrF918FhbLONu?=
 =?us-ascii?Q?xadUKw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(61400799027)(54012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FypP/lDp0MEBv0+Eu6bt93z0k3Utlsjm/Y3E7ojd5BKXnYyhgPm0QHC69kxp8o5MBnwr4sHssdhBv3pg+B4Gjfp8YI9I2w7XALuPsiYPL/gIS/SJ5Yz6pOQsDtn6lxZ8bb2LE0ZJtxWzLKf9Zfc4veQpl1q+/5lWKpZm33oC1b7pNyPV1ba+q5TAQJL0dNK3GsO3QKGy1bcKkSIM1P6GI/w6YjUlsi7CBN60C9KZaOucbryExcQJIvd4NqlaodTh07f+6rHSNnjotWnJWjk2bV+KVx/miAI5R3KMkpeQgmvch90QeIYLdJxg0ao94an+VdlFJcUl21b23QnzRfInZesRdUUzJtbVfIkqW+rsPQRgckEut1GFVY+X0ZA/cWUs4I4NGyagSNJ9pgIRZpLU0EuRIVXbLTi64TPP4bPLB/BS9evOEe84Yjvaed60uaYe
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 09:54:30.7798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4455a0-1c41-4e6a-803e-08de72c18a77
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS3PEPF000099DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR19MB4345
X-Proofpoint-ORIG-GUID: 8IUODC3Vr-P7zPIIJGFCXMhKBp9zyVZ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4NSBTYWx0ZWRfX3Dorn/j0dzxm
 M+v9D7iBt4JPdUQ9bkaCe5iVHtCh8srccPJeSbesfN6DtRo/RuwJhX8Y6EAKoRYruxNAIqajH+X
 /f1se7hq5VtUWCgqIwWYfQyjQe/jwRl9/lyL0mTnh0emrTEiUzC2A0KWnMxud3GU7Be/AVaNRXo
 54cXD2mjKJm9oPDUzVBzLv6+Z7crJ7WeR/S1DToNH44eC/EU2Vt/Z7g69KMlGK9ysmb5Y7GJ2mA
 yJoaLpyCQNiLjb829VOg7FnTleb0oWyzxN9gFX+gkixLqaBaWlhvrJCj7/v0e7ASccpTV6LRUWs
 rvT7qqeFlwbRbYj5KYkTsWo9scEQ8ffd2J4hJsFm2iArATria4PYS7isr+MMzx1gUINtjjzTBtg
 mbYQiK7p32BAxQ35gRGVYRm5sSDzK38yJVwpd3HTuopO1LpdhZ3xABq0tvFApCAHh3bG3N4ANNy
 QvZtEy+ETJ3uvpwEArQ==
X-Authority-Analysis: v=2.4 cv=V99wEOni c=1 sm=1 tr=0 ts=699c23dc cx=c_pps
 a=33nGjHHVSK1XMij75uKlEg==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=w1d2syhTAAAA:8 a=rGEzEHzxhIxyek61VA4A:9
X-Proofpoint-GUID: 8IUODC3Vr-P7zPIIJGFCXMhKBp9zyVZ2
X-Proofpoint-Spam-Reason: safe

Device Layer Selector Unit's are controlled by a Group Entity control
rather than by the host directly. For the purposes of the ASoC class
driver the number of input routes to the SU is controlled by the number
of options within the Group Entity Selected Mode Control. ie. One valid
DAPM route for each valid route defined in the Group Entity.

Currently the code assumes that a Device Layer SU will have a number of
routes equal to the number of potential sources for the SU. ie. it
counts the routes using the SU, but then creates the routes using the
GE. However, this isn't actually true, it is perfectly allowed for the
GE to only define options for some of the potential sources of the SU.o
In such a case the number of routes return will not match those created,
leading to either an overflow of the routes array or undefined routes to
be past to the ASoC core, both of which generally lead to the sound card
failing to probe.

Update the handling for the counting of routes to count the connected
routes on the GE itself and then ignore the source routes on the SU.
This makes it match the logic generating the routes and ensuring that
both remain in sync.

Fixes: 2c8b3a8e6aa8 ("ASoC: SDCA: Create DAPM widgets and routes from DisCo")
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/sdca/sdca_asoc.c | 41 +++++++++++++++++++++++++++++++-------
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/sound/soc/sdca/sdca_asoc.c b/sound/soc/sdca/sdca_asoc.c
index a0191e5a5a7dd..b6536eeecf58f 100644
--- a/sound/soc/sdca/sdca_asoc.c
+++ b/sound/soc/sdca/sdca_asoc.c
@@ -51,6 +51,25 @@ static bool readonly_control(struct sdca_control *control)
 	return control->has_fixed || control->mode == SDCA_ACCESS_MODE_RO;
 }
 
+static int ge_count_routes(struct sdca_entity *entity)
+{
+	int count = 0;
+	int i, j;
+
+	for (i = 0; i < entity->ge.num_modes; i++) {
+		struct sdca_ge_mode *mode = &entity->ge.modes[i];
+
+		for (j = 0; j < mode->num_controls; j++) {
+			struct sdca_ge_control *affected = &mode->controls[j];
+
+			if (affected->sel != SDCA_CTL_SU_SELECTOR || affected->val)
+				count++;
+		}
+	}
+
+	return count;
+}
+
 /**
  * sdca_asoc_count_component - count the various component parts
  * @dev: Pointer to the device against which allocations will be done.
@@ -74,6 +93,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 			      int *num_widgets, int *num_routes, int *num_controls,
 			      int *num_dais)
 {
+	struct sdca_control *control;
 	int i, j;
 
 	*num_widgets = function->num_entities - 1;
@@ -83,6 +103,7 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 
 	for (i = 0; i < function->num_entities - 1; i++) {
 		struct sdca_entity *entity = &function->entities[i];
+		bool skip_primary_routes = false;
 
 		/* Add supply/DAI widget connections */
 		switch (entity->type) {
@@ -96,6 +117,17 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 		case SDCA_ENTITY_TYPE_PDE:
 			*num_routes += entity->pde.num_managed;
 			break;
+		case SDCA_ENTITY_TYPE_GE:
+			*num_routes += ge_count_routes(entity);
+			skip_primary_routes = true;
+			break;
+		case SDCA_ENTITY_TYPE_SU:
+			control = sdca_selector_find_control(dev, entity, SDCA_CTL_SU_SELECTOR);
+			if (!control)
+				return -EINVAL;
+
+			skip_primary_routes = (control->layers == SDCA_ACCESS_LAYER_DEVICE);
+			break;
 		default:
 			break;
 		}
@@ -104,7 +136,8 @@ int sdca_asoc_count_component(struct device *dev, struct sdca_function_data *fun
 			(*num_routes)++;
 
 		/* Add primary entity connections from DisCo */
-		*num_routes += entity->num_sources;
+		if (!skip_primary_routes)
+			*num_routes += entity->num_sources;
 
 		for (j = 0; j < entity->num_controls; j++) {
 			if (exported_control(entity, &entity->controls[j]))
@@ -442,7 +475,6 @@ static int entity_parse_su_device(struct device *dev,
 				  struct snd_soc_dapm_route **route)
 {
 	struct sdca_control_range *range;
-	int num_routes = 0;
 	int i, j;
 
 	if (!entity->group) {
@@ -478,11 +510,6 @@ static int entity_parse_su_device(struct device *dev,
 				return -EINVAL;
 			}
 
-			if (++num_routes > entity->num_sources) {
-				dev_err(dev, "%s: too many input routes\n", entity->label);
-				return -EINVAL;
-			}
-
 			term = sdca_range_search(range, SDCA_SELECTED_MODE_INDEX,
 						 mode->val, SDCA_SELECTED_MODE_TERM_TYPE);
 			if (!term) {
-- 
2.47.3

