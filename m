Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5A0FC0B
	for <linux-sound@vger.kernel.org>; Thu, 10 Apr 2025 00:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744244432; cv=fail; b=tPz2KXxGNVk8O5/d62cqnBDUK+dqu5ThDKSlur3vDyI4d3ca0Wi7houaFqJQpN3rC+115usNgFCrrzGqTcCVLvK1ydXO2dVJjPc3nlug5nOJ39wGcNvewThCKHRG8MNzt0WgV5Jy2FilP9ZV+AOU5gbsY5+NGHTsR6+IwDhpS/I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744244432; c=relaxed/simple;
	bh=R6zl8uvXQgXpcfird4cCPg/SJnHHAY7N459axhraMKQ=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=Xo4fGnNv4TtdBXZW11oViILFjBaeoF+NP151EUtGPaDTph/o2yk/LV+54Ioo7WRpcwgsw4BrDCCN5HRC1ZPnV1kFVBPqhhZRJDcpuBGRXKVMII1XPI4ciiKGv974R9XN2qvBNX/dwEXxVmB0LsXtIUsVP/kZw4ngOKgGSzXjGrs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=R6x8/bxh; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="R6x8/bxh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zv5RS/skS/rw2c7dHQc3+72fiWjfeV8n3X2qqJH+GKUtKHwRVQtVBDAXEYNkPwUUSdwJ5toKLHiev9/pqizsLOTpRi8kyL14FfhIKZ0ndhR5J+3y/uJXYmUT3PZHifLQEHj2ZMQGaD6iTsTUclaE3PrwoITX+0jROUMMtWktjgBz6oCcYD/lkcQjtB1XC0/z4oyVzn0D5oTJBpMfD5zYTF8fewqt1tAy2xvEhsscVPds21g3Cm6A4f7Td7wZoy8DP87zeHXRLZNjNNhpNFyN4IMYMzJAikndijvoC/eI+6xh3uCYz/rVySQJUWdcBMS6VqPN/ByUSLOZt7dMn60HCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIKn4cAfKtvGkDDArA3F3X0wFgWOruKYkdZFlMlb+U4=;
 b=MHRcsDWkc6bQ2h6TkeAjaPqoj9ZxIXxmJ5rvjrGT03imXXGqFYzL0hWliG967jSK4IgVfiEaMStUzIOo5d+XIZ9+6939p4ZPNqzLOSJ3Z//uLN4kBYjKr9GzwqUUvwaRW7OciQx7cR5kdoh2j3OKINYbUGkPTYV3rPhuU4d+Retg87ksOKr5hVDEdy26bcUOOUstSng+u2+4ey+alwlf9CIfbVOYjh8A3bouMBvNxzN3ihACcnFUrqJrC70sTviwW+1544xl/FJ2GHmlgAiu1Rms7ViSpmVZjO3S1lcNp4PMqUWACFidtkKbfJdEtOqN8WCLtk5DCz6wVxtB55SVCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIKn4cAfKtvGkDDArA3F3X0wFgWOruKYkdZFlMlb+U4=;
 b=R6x8/bxhw0OrGU63WRb71WKdiia/czPpgN3gMW7PteMRMWskkQJaGt7GclejIGT3gpRDFXDfFWSOJDAu5py8fR8evVrdjxN/YEhheaIBx7S/qjt6XbPNUJsfQzDoSGB5kYHbUN00Enhy0L+EuTj/5+7u8FaSMFyPEGktt3RYPCc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB11176.jpnprd01.prod.outlook.com
 (2603:1096:400:3d2::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 10 Apr
 2025 00:20:25 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8606.033; Thu, 10 Apr 2025
 00:20:25 +0000
Message-ID: <87zfgolvee.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Bard Liao" <yung-chuan.liao@linux.intel.com>,
	Jaroslav Kysela
	<perex@perex.cz>,
	"Kai Vehmanen" <kai.vehmanen@linux.intel.com>,
	Kiseok Jo
	<kiseok.jo@irondevice.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown
	<broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"Peter\
 Ujfalusi" <peter.ujfalusi@linux.intel.com>,
	Pierre-Louis Bossart
	<pierre-louis.bossart@linux.dev>,
	Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>,
	Takashi Iwai <tiwai@suse.com>,
	"Vijendar\
 Mukunda" <Vijendar.Mukunda@amd.com>,
	Benjamin Bara
	<benjamin.bara@skidata.com>,
	<linux-sound@vger.kernel.org>
Subject: Re: [PATCH 4/7] ASoC: intel: use snd_soc_dapm_to_component()
In-Reply-To: <062c88bf-d4d7-4fa8-bc2d-eea9de45fe3e@intel.com>
References: <87plhm9h5q.wl-kuninori.morimoto.gx@renesas.com>
	<87jz7u9h4c.wl-kuninori.morimoto.gx@renesas.com>
	<062c88bf-d4d7-4fa8-bc2d-eea9de45fe3e@intel.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 10 Apr 2025 00:20:25 +0000
X-ClientProxiedBy: TYCP286CA0252.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:456::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB11176:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b60db4-b43b-48a7-e8c0-08dd77c57d94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hLmFikBKub+6N05KJb5oyl5JRwhke1nVgOw0yNIuOoKSn04DT3ji62VKPZ3V?=
 =?us-ascii?Q?4SSVIGWD0aRalN4BDRQnfzfq+uMDZiw7SkxRc9R2Ab42BOaorkO+QdHKPz2k?=
 =?us-ascii?Q?+Qeszp4b4kvLLlXsOLN5Adzjc5VCXCTRJdgW7gOstU4kESj1NrfPJeBEOPNI?=
 =?us-ascii?Q?aM0eg32xjB/+8WTyKyKRO3Ez8FRmBd+VGTjHX7BpVbJrYPtavha80yOPXBxs?=
 =?us-ascii?Q?Rt+/FzY6CbLLEMAqh6sdBttOCGdu+MKcaRqO0UEH7ksnYn9t0vbQcIweorbb?=
 =?us-ascii?Q?XuEmsxtdXQimdu79J0FJn9ZBU9fj3bCuY29jp6GqFG+nVohcP18CadjNbdoI?=
 =?us-ascii?Q?WrV6LAv1R+7kKUtTh/efzJ3WgtNhznhiHnIZMELRvArah2cdf2Y4lF7dtYYp?=
 =?us-ascii?Q?r8R1MJ2gqOjeQK6CLLk3lxniQANPP/gBdgc54n/ozntTDkkF5B7e2T1UPsg5?=
 =?us-ascii?Q?xudM+5UIccQDbpZPxewPJVwEkRHZEkE7Erw9JTlel7sLJJIRXGUrcNDmWTzF?=
 =?us-ascii?Q?OmSs7NITUXvuqd7IjRzcLK3n15yT/cRjUigJV/dHOWYLd5I/YHE3Lowg2d/f?=
 =?us-ascii?Q?VCeT26+uxwVx4jx6CiFzbegS3ABi0YqWSXDK6kv8EtITzfAKS1id/zP5aim6?=
 =?us-ascii?Q?orRfR/A6zMlWNlXXOYY2gGSVVIpP6uQvqRgCbHaeDtvrtApGP+O/Rll6Lsf1?=
 =?us-ascii?Q?G5ccJuCi8R0KwZFagxokrj4//2zSQldvZaClcKCOYubZ5+wCZ6bObhEEwvwj?=
 =?us-ascii?Q?qSD+wPFKvCMYwIFAnGYRh2gWrHh2zZIo6Nm5AGAPRNMl6sJY90muMbahqUyo?=
 =?us-ascii?Q?WR52VfOzm30435Ua7dKP9NgInDeCYaLtKZpApZZEAtNW08yknXNTr76PQwPS?=
 =?us-ascii?Q?vFnS0nk2heHJu8gMfVKKqX3kiE4eAgfkastZazIhQcuaM00OJ6lbwYZehyUK?=
 =?us-ascii?Q?Uh3MNQZyHyMGUCBR/hxIWr+G4m/UKCtrm9IsodIxp0oV7hQ65laN7kONPLs1?=
 =?us-ascii?Q?+50cDkHtWlvuMSHryju6WmdBV27p1Uce0UcHMW8d8vZZ+2KIN6HjkcNrxwUp?=
 =?us-ascii?Q?c21tXoj7I5bUJny8azG1vuaL+2f+WgjuOD23Pc+wnzbA4eT98LNsnp7X+KVA?=
 =?us-ascii?Q?vngnoFc8qD4ZHWj4F+U+uckziUrUzCNEPp8qaYluX6X0LeeaGl8EkG/Y0eBr?=
 =?us-ascii?Q?YaL5G4ftIKnG7G0xxI+lrnOWCxnI5PnKz79I/jq/i6cZ0QPmaD3U9HPiCpMW?=
 =?us-ascii?Q?aci81IByzX4JzWz2BAfbu1K3PCEF3+1yuh5uOWR1s4TFCs5FeVWK0E+r07Uw?=
 =?us-ascii?Q?n3iNrLXoMYV17l8TcJz7pv3EAwf7T652dBSZpmECGCXTNVrqhzxNK0jfrXVF?=
 =?us-ascii?Q?kKFQvC6OVI+IeQx1BAdNAfhDZixEhLVYKNeSoSlrbmcNi9PK/M3ExVNAuR3z?=
 =?us-ascii?Q?S1l5xm7d4VPnPyT0CZfJ5XWU8cLR0NVQh+2/LMh83X/LiHPRahonMg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DDljlAJh+bw2GWPeQtKQcG1pI00dkudY0CgmatUrZ3m8SyjRs+WaQEoX6mRB?=
 =?us-ascii?Q?rpmf8H9+uB/elAyJRTq59RCB+fUg/+R41patK9qJp9y0Dsa6+y8+tcR27NyO?=
 =?us-ascii?Q?Uo8ZZWb44O8LsFkmTMYKD9QgAOOE2LnwgZd3BwyeRdSyRfU9Q0ryIpc5Whla?=
 =?us-ascii?Q?Gm79aXRk80yvbQt3gdhj2T3UhTWslFcl7e0WMte/zANA/5/oJb+2sNdqXZuj?=
 =?us-ascii?Q?5xE2BzXHEC0zD5obRXkPHh7ygTZF90Fh/0rwwi7jRmWqaG4gGTEge9LhPmvj?=
 =?us-ascii?Q?8gHQGD8Er9Ka9ML2GO/GB0Pz9x6iQ4UE0fgMQ9Kqc966qQaJseYAaeXAa9Xu?=
 =?us-ascii?Q?oxffUvQF566XWZiuBRvTnghArWQmjyLnm7CK7UZCx+xKd4xgMc6OSoTM1e41?=
 =?us-ascii?Q?7NLpP+RRa2ANKOMtReTMX3h63GI/lnhWlpONaH2P6bLPGB2D9avz7e/jMkB1?=
 =?us-ascii?Q?1qFF74xHPUvpqzyQHkTNldc+VP0IpFa3dMdw263qEvFcHpTwHzw3rQzzSwZt?=
 =?us-ascii?Q?396zONsxZLZgqlG+r/tSyESKcQ28jRsI1rsxaQ1S/yuZ7hR8sbpTAKRbGHlf?=
 =?us-ascii?Q?O1J6o7oMgKVPDGVPH0AJD9su3DGKiVMJfQ7pBUYAdmHAIxYZdnCztTsJvQHb?=
 =?us-ascii?Q?IegyKzviwp7XB/lKCJC2WH9XkEy1YwGAO68wpGc4jM0YiT+IcgRvGf8ytNJe?=
 =?us-ascii?Q?IiFG26GAO6uh5hjXl0pgBhxfAIfh/oAhKCjjNza/62oQ/x5K5iYluKsRhlOU?=
 =?us-ascii?Q?PTA8/TnGdcjQLI43CRvFTf3eE366vt4K5ETKMSNQYDV0cT2vMZ4ImYAhyNL9?=
 =?us-ascii?Q?+sRqUiwSz5DMZfqQ3TjXxnVQFKB6MExMJAmaE64e5kJVTIdXGjeHUXp1I/T9?=
 =?us-ascii?Q?KbHVeiYFhUfSVNxF3RK4yhuZY+k4pxe+STGUwqUcvnsKT4i8IWq4Rabr7cnL?=
 =?us-ascii?Q?9jmKxZ+MPj/5N4geBrOOD3SEhOXAeKk4tXTboE87XW8AWaXgD/qwixlYBKms?=
 =?us-ascii?Q?k7NJKjg97qDbSo9jWM7AY4Sq9mlXwo/b8RmRNabUxHsdJ5q8bUewJ5goUk+R?=
 =?us-ascii?Q?sFMgejKwZKDoGAyg4lpcqUqffJLRqmgys5lLnCKTPROrc2yQqtxMXmR9+sQK?=
 =?us-ascii?Q?7vebrJV72IR8DHzbr72ggR6/5dPJU1XbD3I8fML/tjdv+cxGcqZlnvz5+Sxw?=
 =?us-ascii?Q?kXQHomwcBNPHUFtSatAbMZE+iICzKyOpQm9WEt6Qm5F4lwMCV6QOJZFguLT8?=
 =?us-ascii?Q?2LE03jFUf0LcsLt8MaXuyNpnuaTy5B72mFOKViJohb7SdidpU5v7YxtAX4mI?=
 =?us-ascii?Q?ya0J+H2CuckXtzcGWrNp86vtom2P4W34Zl8axU2YTIHA0K+M70gkO4TGxr3A?=
 =?us-ascii?Q?omRzsMxbv217mY1vKiaiStJieKHCjImIY63YQ5G5Z29lPGYoB1neLGMWNY4i?=
 =?us-ascii?Q?FB+Q/ASaWKcEtUcw0xkPdkHlB6N6zLZbAIumO1iNjXEwmHM4jnD8T+PmloKd?=
 =?us-ascii?Q?dBah31SUw+iSAL1Iq+LK8Ca+64Jllp46mgo6s9f/Agjc9z4TRcxiThKbCfns?=
 =?us-ascii?Q?wQ8H9a/DopGjtR7kE1S4BspdaTubWZtuBuV60JRixTgWtBZCR9FHBKwfSTqV?=
 =?us-ascii?Q?4ng0SIKq8kc1gd1pMcfzi4M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b60db4-b43b-48a7-e8c0-08dd77c57d94
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 00:20:25.7126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tw8BpMo2Fbt281G5GASHAP66jw01KF+nrQZ6DcGI9B8iLbwakyFGHj4ZTkaPLqpC5eZlTgBCe6LQsBPbncWrzLCvpqeFyc8pcTIINL/DTuSkMBv9uy0AoEUqsjqNK1TT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11176


Hi Cezary

> > We can use snd_soc_dapm_to_component(). Let's use it
> > 
> > Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> I'd appreciate "ASoC: Intel: avs:" prefix in the title. Keeps it 
> coherent with other avs-driver changes.

OK, thanks.
Will do in v2

Thank you for your help !!

Best regards
---
Kuninori Morimoto
