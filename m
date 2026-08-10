Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC40356778;
	Mon, 10 Aug 2026 11:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359769; cv=fail; b=AKQnOaa/FG1GTL3f1Fqae0VcMAbYAESS5L8UK8oNYSZE7FHxM/opuLXr0NgTydiSt6Iqphu79hanZcEN5ZbEjUSzdmdCvwg1KKIg1xdohHv+ItuKI59saua3tIbYdgdXgW5BQ6oQvmMuuxFBkmmCsB5hVL9PrMqu6uqWnCwwf4k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359769; c=relaxed/simple;
	bh=Gk0lBeTiXyFtv4RaefeME31L+gsVG5BD+xRIfsDZgJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VtO0y+3KxjuzjBN12tREArL+8PrYB2VLPuDtgoacPXcXaJ6RIrv/6MNUEURZsQ/oTYQRlNC0B+K1piAss+fkZpTsKfzvivozXBYf+tNjR4affQuRf915kvJgs/hACCpkorgg6aFjUBa4ETLK3REGZ6TC9+U1prQmQKiBLCFUlkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=LFCjR1kj; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=phRC87jl; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="LFCjR1kj";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="phRC87jl"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A6In5F2231598;
	Mon, 10 Aug 2026 05:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=QQyQuAltcqnjbQ/spx9IeFjoBCEflBwjd5Bj0oicACI=; b=
	LFCjR1kjmF8MHo3lyB9ta2qIBvu89SB2GqDpQ8sNEHwZX8OY1YNXovBBrZm6dj9U
	shaNI7XJ2cgkjueWBde8m9MmzsPdy3Uc0sz1XRv6l3kfU8h5F1VbeHCxd+rvFr+3
	LyRYCPmnfmyZmLGZ9WT6+yzP+BpqPtObMEZsDvGtlqxw8+5PXGQe/O/txKFKBKuN
	DSfQ1rWCrC6Y1lToiXdDD7NWh5YrIpNijkceRbP5UpbteN5TA9QfMUbGXaHO0TGu
	lIDAmXqijcrU7OwuK3o3mIPCEvuJ/tG5Q+MHPU/KcaqDVCXpfIzLoXThbKBjx6m+
	wq6gPGVALJSSdvu+VIqO9A==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023098.outbound.protection.outlook.com [40.93.201.98])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4fx0vg2ecn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 10 Aug 2026 05:40:52 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W42/W4RInTiiovd8HIAe/xvZO6sX7wi3M/6FmsVkfUIoMkEQBclytn0Ve3CMUZYYgg2pQ6StgL1pRWwCdvPthmAmK8yGHkipTbx+VI5g6eVuHZabx4ElhuxybpaRf5yb0u7ukVFHgD56Aaz4CoujqsddNMHqOvJDryutKPefu3w4DIdAHBpWuhPsNZ6A3sF6qm3oguX0WfxACAwY1Aba5X+czyWTj9rrSySsdGlreenIR/O6GPKxz84/mPbjYi/hosKsR6hmc6O0d2nRgP9xyvbOzDaXErhVitd39NQAi1fZAILzTTefvbYrdpyrQ6kV69yw7YQbmE51J9jVdc88gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQyQuAltcqnjbQ/spx9IeFjoBCEflBwjd5Bj0oicACI=;
 b=Sr/TFUqcVQPWBhtWZktA4YVCzOD+f7XR8HFuwBSigS5cwgJXQopXuz8vcxY2LxY/JaciJNVAfjZvfIeBQwfmFxaBdJsMKj9hzpcwvhZnmVGps53xSE/emD9ET5xzrkQXtIJ13kX1GzDulnQJfYpXfFkGUlOdHrZrOi4S/UGijs68TR9EYnAayK4xCT9oHaeUe8HDGFGuZLipJWEgELxcs7yHbJw8JQgBXDkx34qhmi4oIGOyl4EYENOTm+Hz5Jo3vR7YsY+1JS9rB/TTU+Oj9HnZ1fNDwz1uE5JRcsyvR1lxdlNjuulMTVeSRdDSr80EyuN1mAIg5M8z4nu/MB4OOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQyQuAltcqnjbQ/spx9IeFjoBCEflBwjd5Bj0oicACI=;
 b=phRC87jl8yloERJSuptYkNw6sabTFG/Lr3FqweuNPmuzB6fCjUO7VLiIcOSrRCKV8mdli7Gm/LohhrVpPlZT1Jl3bDmiVCDyPEEHiQzqe2ctTsw9WIkpIDleawljcPmchaxwOslzmFDCWwvszVoh3+XhnuJv96u+eBnk+XnmSYo=
Received: from CY8PR12CA0040.namprd12.prod.outlook.com (2603:10b6:930:49::7)
 by MWHPR19MB997638.namprd19.prod.outlook.com (2603:10b6:303:2a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 10:40:47 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:930:49:cafe::7b) by CY8PR12CA0040.outlook.office365.com
 (2603:10b6:930:49::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.25 via Frontend Transport; Mon,
 10 Aug 2026 10:40:47 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6
 via Frontend Transport; Mon, 10 Aug 2026 10:40:46 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id C4D5A40654E;
	Mon, 10 Aug 2026 10:40:45 +0000 (UTC)
Received: from ediswws06.ad.cirrus.com (ediswws06.ad.cirrus.com [198.90.208.11])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B19E5822545;
	Mon, 10 Aug 2026 10:40:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: broonie@kernel.org, vkoul@kernel.org
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        patches@opensource.cirrus.com
Subject: [PATCH 4/4] ASoC: cs35l56: Use IRQ provided by the SoundWire core
Date: Mon, 10 Aug 2026 11:40:45 +0100
Message-ID: <20260810104045.60701-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260810104045.60701-1-rf@opensource.cirrus.com>
References: <20260810104045.60701-1-rf@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|MWHPR19MB997638:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 6a080a12-8138-4d8e-8e7e-08def6cbd699
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|61400799027|16102099003|22082099003|18002099003|10067099003|56012099006|11063799006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4UMR5Fsu5eq/OmF5WrrdjCc+FdHA12bnevcsov8phhjgXOn+C5AO5efiBuBXRlt+PDYH4a4q8DpvBh84teY6SSZY5KW26waP9Rf+02DOcARlmEBlXZhFQcuF3dOjPe/1ugg9u3ZllHoVz4Dor5WGE1RJQWfBYU6zPVyMW6BhPjoNhha70pj3Q3O4hb7RzBtmKtMwzxW6fegnTdI0Y52z9Mkpxad76x4rge6zW6cVgW5XDzkXJ/T/GmUV+FQkNFGDlmaqtQZ2nUEizG6IOpCe+qvtDzWmazoApE3cwv6OZBAwt+QTL37ZQV3u/u1fqW/02z+NwpZ+z1Wpom45osz6uk6/sbOKo29Almv9XyfCjOhQQyK14OVgw8khzXKZ4w20crJ977V5NpDgvfIk7gJwYAANYpV+8t6hfL37faXJqMLHiKTvPMuMG9yF+5PAaCM37UOOiyQdUz7bsR/MCVIwkkWde0kG+vd5uBynlmkYlyrtyAYhcIx+kBXygSgh8Edioyaf+twJEKi+QB6CYEbTe1EiTaYy5gDicGs3dYyeePHpCjwY9iwGOPlGuVLC6S5SIWKlg67Lw9Ky3QeXT3KYAVkkvG1ArEXttpzgrva3OJ0OAB9u9cf4V4oHkWXGN8cUwG+lTyL3pweAs7E8rb9RC5bNp3EzniLwWevb7i50/JJlFtOM/N7Bs0WJ8dyWYcPoSEay/CtqD9qoBZ5WUvWa0g==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(61400799027)(16102099003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JV+31wPm446OUgNxYHoojsS2ftTd925QwyH80LO6wl1zjzKP2OBcHiAn3yaemG0v8KeXw0RSMHLbT4d6aZkZwDyNa+uJccMGYXjPqzCE1oapYOzq2r6J8LgjtZd7cEAGRW5xTS7bev+8pikSzsKBNiNbqMQoWBZFkR15IzwqjETJRFrLm8MEP4RBelarG1SGnPFuorDPDTJBJ2Do0DIhMQNlNk54hNCWXM1NAHe+mXLQk+9gWQl88iPKTuvnFpFUal0U0DLEYtqekIr9Zgmfe04GRaezaxEQ0PkD+dqvXBWb0FmySL68TKOdJWPjA95Z/kLHlmWyg7xGleFFX8fmhOqCLIGpiyPIJvVyvwPHJ+iKeTEzYwvSqT5zvjVAGt43ihKGbNG5g+zrNio9Onp4Wm5aZSlUJTRjaFjQTePOFiA8CTxDd87PhtE3LkoqqskL
X-Exchange-RoutingPolicyChecked:
	NdnKVwZyw1gIzdIujy6w6D9fJtWjXo/br5R8Hyr0ulub4+bZTR9TmNRVxaQTlGVkgIjBiiArO2a7FKsckQzmjtRSG836gpyW2BW5YetomeTknoPFtZD8Fw+jEajr0WaYR3HInvkRpE1t0ehdWA8vkso/O2m5fh2Y/ky1FNCFUTYjBPBLYFaa5xFeTxJaEmkqozLh5xUbEP5UQD6awJoJhTpvRC2JLv35XMYwRQL2CrG/igHX0TvSG18e/DVdss/6CzPDuAlpjaqrIgMtnG3CD9+cStneFo41UCxHw1ZBm/sua+hSBo7h3eL6iQbLupM2nTfGKIp3JvhZu9r402rs9g==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 10:40:46.9502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a080a12-8138-4d8e-8e7e-08def6cbd699
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR19MB997638
X-Proofpoint-GUID: syPUEuOPoFr8Ca_eBR1VQ0REVhTdxzXB
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfX1R7H3BrnzXjp
 UkEFg4k41ak02XSYLY8RGYF+3CR1kngH+zA3nDL2PzxypOZxlC9LwNP5YMC3TMEiz7q/ZkhhzpU
 HIXSC2grc7LK1Pzi6E0pZu8p/jY+noI=
X-Authority-Analysis: v=2.4 cv=KaLidwYD c=1 sm=1 tr=0 ts=6a79aab4 cx=c_pps
 a=NqdEbQKaF7DYfWX/hQHPrw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=w1d2syhTAAAA:8 a=KaUpwP_fG2_SX3DymbAA:9
X-Proofpoint-ORIG-GUID: syPUEuOPoFr8Ca_eBR1VQ0REVhTdxzXB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDA5MiBTYWx0ZWRfX+Qrs6zJNWpq8
 +t0JWgVcz0NtaoPwiJi1iPtOERX0m2rMotMU/YLlbwHHE3va6euNQqlmNWyCONzgoQsNGS/RF8B
 gTKlK5sJWgoLXHlTlYD3NM2tUm9fAPuqN7IQtoZeEZRVFqZeYAySiLppbr/9LLlc1Z3OwIMC6Yv
 T9V2UXFyKDZYLIsO06lIZ7xyy9n5FRogsMdx3h99AxMykVjQ9LpR3HiBRIomXNftOCyWTeI9v9c
 XgVPt+fpHbSIAds3+gKNxOTAhi9MmKo8stowiQp+dYu4NziiG0utOoPNOS1tQypA3ku5+wb3AGm
 9qbfMi27BGd68F2FOwK03JYXmhPqyCjkVdts56RLwlR7o68tKyvajHWB35BBnM7FCMZz+iBTiOd
 dRlE9XdMy19ytirQmWXY0ANpcIyKgvTN0EjxesfvoWRCOjipRiQTBBoly37Jj8fDWru9WHcYPJ7
 Lbv86rn4K1eRmZqxPUQ==
X-Proofpoint-Spam-Reason: safe

Replace the custom SoundWire IRQ handling with the generic nested IRQ
provided by the SoundWire core. This removes the local IRQ work function
and the convoluted IRQ masking and pm_runtime management around it.

We still need the local functions to mask/disable and unmask/enable the
SoundWire interrupts because the devices handled by the cs35l56 driver
don't have the generic mask bit for the ImpDef1 interrupt so masking and
unmasking has to use a custom mask bit.

cs35l56_sdw_remove() doesn't need to call cs35l56_disable_sdw_interrupts()
now that there isn't a local work function to be flushed. It only masks
the custom interrupt mask bit and the rest of the handler cleanup will be
done the normal way by devm_free_irq() in cs35l56_remove().

Similar applies to cs35l56_sdw_system_suspend() - it is enough to write
the custom mask bits.

cs35l56_irq() doesn't need to be exported because cs35l56_sdw.c isn't
calling it.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs35l56.h           |  1 -
 sound/soc/codecs/Kconfig          |  1 +
 sound/soc/codecs/cs35l56-sdw.c    | 65 +++++++------------------------
 sound/soc/codecs/cs35l56-shared.c |  3 +-
 sound/soc/codecs/cs35l56.c        | 45 ++++++++++-----------
 sound/soc/codecs/cs35l56.h        |  9 +----
 6 files changed, 38 insertions(+), 86 deletions(-)

diff --git a/include/sound/cs35l56.h b/include/sound/cs35l56.h
index 2490b72c0a7a8..45a5df574aa6d 100644
--- a/include/sound/cs35l56.h
+++ b/include/sound/cs35l56.h
@@ -417,7 +417,6 @@ void cs35l56_wait_control_port_ready(void);
 void cs35l56_wait_min_reset_pulse(void);
 void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire);
 int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq);
-irqreturn_t cs35l56_irq(int irq, void *data);
 int cs35l56_is_fw_reload_needed(struct cs35l56_base *cs35l56_base);
 int cs35l56_runtime_suspend_common(struct cs35l56_base *cs35l56_base);
 int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_soundwire);
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6af0247781ad1..ba47adb92a251 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -896,6 +896,7 @@ config SND_SOC_CS35L56_SDW
 	tristate "Cirrus Logic CS35L56 CODEC (SDW)"
 	depends on SOUNDWIRE
 	select REGMAP_SOUNDWIRE
+	select IRQ_DOMAIN
 	select SND_SOC_CS35L56
 	select SND_SOC_CS35L56_SHARED
 	help
diff --git a/sound/soc/codecs/cs35l56-sdw.c b/sound/soc/codecs/cs35l56-sdw.c
index 14bb5d1793d33..4fba59e80c37e 100644
--- a/sound/soc/codecs/cs35l56-sdw.c
+++ b/sound/soc/codecs/cs35l56-sdw.c
@@ -231,7 +231,7 @@ static void cs35l56_sdw_init(struct sdw_slave *peripheral)
 	 * a soft reset.
 	 */
 	if (cs35l56->base.init_done)
-		cs35l56_unmask_soundwire_interrupts(cs35l56->sdw_peripheral);
+		cs35l56_unmask_soundwire_interrupts(cs35l56);
 
 out:
 	pm_runtime_put_autosuspend(cs35l56->base.dev);
@@ -240,47 +240,17 @@ static void cs35l56_sdw_init(struct sdw_slave *peripheral)
 static int cs35l56_sdw_interrupt(struct sdw_slave *peripheral,
 				 struct sdw_slave_intr_status *status)
 {
-	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
-
-	/* SoundWire core holds our pm_runtime when calling this function. */
-
-	dev_dbg(cs35l56->base.dev, "int control_port=%#x\n", status->control_port);
-
-	if ((status->control_port & SDW_SCP_INT1_IMPL_DEF) == 0)
-		return 0;
-
 	/*
-	 * Prevent bus manager suspending and possibly issuing a
-	 * bus-reset before the queued work has run.
+	 * The IRQ itself was handled through the regmap_irq handler, this is
+	 * just clearing up the additional Cirrus SoundWire registers that are
+	 * not covered by the SoundWire framework or the IRQ handler itself.
 	 */
-	pm_runtime_get_noresume(cs35l56->base.dev);
-
-	/*
-	 * Mask and clear until it has been handled.
-	 * None of the interrupts are time-critical so use the
-	 * power-efficient queue.
-	 */
-	cs35l56_mask_soundwire_interrupts(peripheral);
-	queue_work(system_power_efficient_wq, &cs35l56->sdw_irq_work);
+	sdw_read_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1);
+	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
 
 	return 0;
 }
 
-static void cs35l56_sdw_irq_work(struct work_struct *work)
-{
-	struct cs35l56_private *cs35l56 = container_of(work,
-						       struct cs35l56_private,
-						       sdw_irq_work);
-
-	cs35l56_irq(-1, &cs35l56->base);
-
-	/* unmask interrupts */
-	if (!cs35l56->sdw_irq_no_unmask)
-		cs35l56_unmask_soundwire_interrupts(cs35l56->sdw_peripheral);
-
-	pm_runtime_put_autosuspend(cs35l56->base.dev);
-}
-
 static int cs35l56_sdw_read_prop(struct sdw_slave *peripheral)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
@@ -302,6 +272,7 @@ static int cs35l56_sdw_read_prop(struct sdw_slave *peripheral)
 	prop->source_ports = BIT(CS35L56_SDW1_CAPTURE_PORT);
 	prop->sink_ports = BIT(CS35L56_SDW1_PLAYBACK_PORT);
 	prop->paging_support = true;
+	prop->use_domain_irq = true;
 	prop->quirks = SDW_SLAVE_QUIRKS_INVALID_INITIAL_PARITY;
 	prop->scp_int1_mask = SDW_SCP_INT1_BUS_CLASH | SDW_SCP_INT1_PARITY | SDW_SCP_INT1_IMPL_DEF;
 
@@ -406,7 +377,7 @@ static int __maybe_unused cs35l56_sdw_runtime_resume(struct device *dev)
 	if (ret)
 		return ret;
 
-	cs35l56_unmask_soundwire_interrupts(cs35l56->sdw_peripheral);
+	cs35l56_unmask_soundwire_interrupts(cs35l56);
 
 	return 0;
 }
@@ -418,21 +389,12 @@ static int __maybe_unused cs35l56_sdw_system_suspend(struct device *dev)
 	if (!cs35l56->base.init_done)
 		return 0;
 
-	cs35l56_disable_sdw_interrupts(cs35l56);
+	/* runtime_resume unmasks the interrupt */
+	cs35l56_mask_soundwire_interrupts(cs35l56);
 
 	return cs35l56_system_suspend(dev);
 }
 
-static int __maybe_unused cs35l56_sdw_system_resume(struct device *dev)
-{
-	struct cs35l56_private *cs35l56 = dev_get_drvdata(dev);
-
-	cs35l56->sdw_irq_no_unmask = false;
-	/* runtime_resume re-enables the interrupt */
-
-	return cs35l56_system_resume(dev);
-}
-
 static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_device_id *id)
 {
 	struct device *dev = &peripheral->dev;
@@ -447,7 +409,6 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 	cs35l56->base.dev = dev;
 	cs35l56->sdw_peripheral = peripheral;
 	cs35l56->sdw_link_num = peripheral->bus->link_id;
-	INIT_WORK(&cs35l56->sdw_irq_work, cs35l56_sdw_irq_work);
 
 	dev_set_drvdata(dev, cs35l56);
 
@@ -484,21 +445,21 @@ static int cs35l56_sdw_probe(struct sdw_slave *peripheral, const struct sdw_devi
 	/* Start in cache-only until device is enumerated */
 	regcache_cache_only(cs35l56->base.regmap, true);
 
-	return cs35l56_common_probe(cs35l56, -EINVAL);
+	return cs35l56_common_probe(cs35l56, peripheral->irq);
 }
 
 static void cs35l56_sdw_remove(struct sdw_slave *peripheral)
 {
 	struct cs35l56_private *cs35l56 = dev_get_drvdata(&peripheral->dev);
 
-	cs35l56_disable_sdw_interrupts(cs35l56);
+	cs35l56_mask_soundwire_interrupts(cs35l56);
 
 	cs35l56_remove(cs35l56);
 }
 
 static const struct dev_pm_ops cs35l56_sdw_pm = {
 	SET_RUNTIME_PM_OPS(cs35l56_sdw_runtime_suspend, cs35l56_sdw_runtime_resume, NULL)
-	SYSTEM_SLEEP_PM_OPS(cs35l56_sdw_system_suspend, cs35l56_sdw_system_resume)
+	SYSTEM_SLEEP_PM_OPS(cs35l56_sdw_system_suspend, cs35l56_system_resume)
 	LATE_SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend_late, cs35l56_system_resume_early)
 	/* NOIRQ stage not needed, SoundWire doesn't use a hard IRQ */
 };
diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 0880b6a02247c..7b3e37d462d61 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -616,7 +616,7 @@ void cs35l56_system_reset(struct cs35l56_base *cs35l56_base, bool is_soundwire)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_system_reset, "SND_SOC_CS35L56_SHARED");
 
-irqreturn_t cs35l56_irq(int irq, void *data)
+static irqreturn_t cs35l56_irq(int irq, void *data)
 {
 	struct cs35l56_base *cs35l56_base = data;
 	unsigned int status1 = 0, status8 = 0, status20 = 0;
@@ -673,7 +673,6 @@ irqreturn_t cs35l56_irq(int irq, void *data)
 
 	return IRQ_HANDLED;
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_irq, "SND_SOC_CS35L56_SHARED");
 
 int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq)
 {
diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 619be47060a43..b9118ad8fab54 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -37,48 +37,49 @@
 #include "wm_adsp.h"
 #include "cs35l56.h"
 
-void cs35l56_mask_soundwire_interrupts(struct sdw_slave *peripheral)
+void cs35l56_mask_soundwire_interrupts(struct cs35l56_private *cs35l56)
 {
 	 /*
+	  * Mask unconditionally.
+	  *
 	  * The read of GEN_INT_STAT_1 is required as per the SoundWire spec
 	  * for interrupt status bits to clear.
 	  * GEN_INT_MASK_1 masks the _inputs_ to GEN_INT_STAT1.
 	  */
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
-	sdw_read_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1);
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
+	sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1, 0);
+	sdw_read_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1);
+	sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_STAT_1, 0xFF);
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_mask_soundwire_interrupts, "SND_SOC_CS35L56_CORE");
 
-void cs35l56_unmask_soundwire_interrupts(struct sdw_slave *peripheral)
+void cs35l56_unmask_soundwire_interrupts(struct cs35l56_private *cs35l56)
 {
-	sdw_write_no_pm(peripheral, CS35L56_SDW_GEN_INT_MASK_1, CS35L56_SDW_INT_MASK_CODEC_IRQ);
+	if (!cs35l56->base.irq)
+		return;
+
+	sdw_write_no_pm(cs35l56->sdw_peripheral, CS35L56_SDW_GEN_INT_MASK_1,
+			CS35L56_SDW_INT_MASK_CODEC_IRQ);
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_unmask_soundwire_interrupts, "SND_SOC_CS35L56_CORE");
 
-void cs35l56_disable_sdw_interrupts(struct cs35l56_private *cs35l56)
+static void cs35l56_disable_sdw_interrupts(struct cs35l56_private *cs35l56)
 {
 	if (!cs35l56->sdw_peripheral)
 		return;
 
-	cs35l56->sdw_irq_no_unmask = true;
-	flush_work(&cs35l56->sdw_irq_work);
-
-	/* Mask interrupts and flush in case sdw_irq_work was queued again */
-	cs35l56_mask_soundwire_interrupts(cs35l56->sdw_peripheral);
-	flush_work(&cs35l56->sdw_irq_work);
+	cs35l56_mask_soundwire_interrupts(cs35l56);
+	if (cs35l56->base.irq)
+		disable_irq(cs35l56->base.irq);
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_disable_sdw_interrupts, "SND_SOC_CS35L56_CORE");
 
-void cs35l56_enable_sdw_interrupts(struct cs35l56_private *cs35l56)
+static void cs35l56_enable_sdw_interrupts(struct cs35l56_private *cs35l56)
 {
-	if (!cs35l56->sdw_peripheral)
+	if (!cs35l56->sdw_peripheral || !cs35l56->base.irq)
 		return;
 
-	cs35l56->sdw_irq_no_unmask = false;
-	cs35l56_unmask_soundwire_interrupts(cs35l56->sdw_peripheral);
+	enable_irq(cs35l56->base.irq);
+	cs35l56_unmask_soundwire_interrupts(cs35l56);
 }
-EXPORT_SYMBOL_NS_GPL(cs35l56_enable_sdw_interrupts, "SND_SOC_CS35L56_CORE");
 
 static int cs35l56_dsp_event(struct snd_soc_dapm_widget *w,
 			     struct snd_kcontrol *kcontrol, int event);
@@ -828,11 +829,7 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56, bool firmware_missing
 {
 	int ret;
 
-	/*
-	 * Disable SoundWire interrupts to prevent race with IRQ work.
-	 * Setting sdw_irq_no_unmask prevents the handler re-enabling
-	 * the SoundWire interrupt.
-	 */
+	/* Disable SoundWire interrupts to prevent race with IRQ handler thread */
 	cs35l56_disable_sdw_interrupts(cs35l56);
 
 	ret = cs35l56_firmware_shutdown(&cs35l56->base);
diff --git a/sound/soc/codecs/cs35l56.h b/sound/soc/codecs/cs35l56.h
index 1ddee9ab6a876..35c02ae17de3d 100644
--- a/sound/soc/codecs/cs35l56.h
+++ b/sound/soc/codecs/cs35l56.h
@@ -39,8 +39,6 @@ struct cs35l56_private {
 	struct sdw_slave *sdw_peripheral;
 	struct regmap *sdw_bus_regmap;
 	const char *fallback_fw_suffix;
-	struct work_struct sdw_irq_work;
-	bool sdw_irq_no_unmask;
 	bool soft_resetting;
 	bool sdw_attached;
 	struct completion init_completion;
@@ -65,10 +63,8 @@ static inline struct cs35l56_private *cs35l56_private_from_base(struct cs35l56_b
 
 extern const struct dev_pm_ops cs35l56_pm_ops_i2c_spi;
 
-void cs35l56_mask_soundwire_interrupts(struct sdw_slave *peripheral);
-void cs35l56_unmask_soundwire_interrupts(struct sdw_slave *peripheral);
-void cs35l56_disable_sdw_interrupts(struct cs35l56_private *cs35l56);
-void cs35l56_enable_sdw_interrupts(struct cs35l56_private *cs35l56);
+void cs35l56_mask_soundwire_interrupts(struct cs35l56_private *cs35l56);
+void cs35l56_unmask_soundwire_interrupts(struct cs35l56_private *cs35l56);
 
 int cs35l56_system_suspend(struct device *dev);
 int cs35l56_system_suspend_late(struct device *dev);
@@ -76,7 +72,6 @@ int cs35l56_system_suspend_no_irq(struct device *dev);
 int cs35l56_system_resume_no_irq(struct device *dev);
 int cs35l56_system_resume_early(struct device *dev);
 int cs35l56_system_resume(struct device *dev);
-irqreturn_t cs35l56_irq(int irq, void *data);
 int cs35l56_irq_request(struct cs35l56_base *cs35l56_base, int irq);
 int cs35l56_common_probe(struct cs35l56_private *cs35l56, int irq);
 int cs35l56_init(struct cs35l56_private *cs35l56);
-- 
2.47.3

