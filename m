Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.72.10
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793954702;
	b=LOrJpCNA5tNFFWjOqX7n0Aubg1BHEN6J/z3LRGj/e+t/1EeDKGqfmCcKvua37HX3MKAg
	 ynHoE7P5wUkGFESHHLSCL6NIJbwXKpn+Hil+EgeJEwn2flQxuAcTPBudnpsASsi78RTFz
	 3H7z917kNHSwnplOOue7366jTtHdPK9oDA8/QRWbHEVdHAdGBpq/8HBquWG60lt481Smh
	 c14MEDy/Y7FjOEjGo7pwwAwSZeB7nUCogPqbzarQttd+76BaOAP1k8lVWW9TjSFpxFw/I
	 mgz91Gtg2CRB0qf7WRGTp6RvcXE4/a6AAicYJs6+JRwgIsVO2alX3XMHDESwzBqUajg==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954702;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:
	 DKIM-Signature:Authentication-Results-Original:Received:Received:
	 Message-ID:Date:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-ClientProxiedBy:MIME-Version:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:x-checkrecipientrouted:
	 NoDisclaimer:X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam-Untrusted:
	 X-Microsoft-Antispam-Message-Info-Original:
	 X-Forefront-Antispam-Report-Untrusted:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-EOPAttributedMessage:
	 X-MS-Exchange-Transport-CrossTenantHeadersStripped:
	 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id-Prvs:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=L6VJsBBw+9aLUNmIbT5EOz+b9Lupz6euvihDRf+q8UA=;
	b=JCFeJ1oWnh50skXXZ397H90wLWDwhK2yAzENO5A9K/9XG7/iutdyh1klNIF7Qz6Ds774
	 OWfAwqwvnBa+HwJXRlyhTq93SdtV5iMOWATLgoSRZp7vflTBr2GMtlK+nMBIoR3HD0ANm
	 s57Iiwt47Ig014b0y282IcYW0cwKIOvNvBPXOTCmc5F8oBEqGi2ZTJGe4lJf7/r6nYa4e
	 6e0ZwxqEBwwcPWWKd8aBdWDvJLtStXf5S5WmqCx8eDwQhpyiRmNqZaBKH69g182wDbgcR
	 9NuYd35V7t3O/h0dFKvmFRBMmtwMWF1smuCppWuzhdLZ6eif9eO/5CaryypxaKXi5IA==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=VTct3TJM;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=VTct3TJM;
	arc=pass header.oldest-pass=2 smtp.remote-ip=52.101.72.10
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013010.outbound.protection.outlook.com [52.101.72.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1DA606A32D
	for <linux-sound@vger.kernel.org>; Fri,  6 Nov 2026 08:45:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A1DA606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=VTct3TJM;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=selector1 header.b=VTct3TJM
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ht/BN+JtPDQFGDWz/cAhr+70B9w6L1Si6VMQLHgnqiIIct3oxf6g4MhL3fEf77qFqTFnL/JoHoeMJwDSzkEo4rz9iW7BH29N0ZK4yg7F1cgtst/PRHsqMm580ThBV56XXPO/AxXLFFcTRbN67FlEGZVR5625JBCdiu7T2MRjmXthGpyWruhJKPTN1G+OYF3Hk11dqEuwm9pvcN9mj4SfAnVe+R2BdlDRp6+9lgi561ZEtQg1pZrWXI6iIR0tIHutftnJ9f5EWnsNCsAVCky1Va+CK7F80HHl04nK1wgtRSnTBogXFmJa1QuI1SdhCET2oSN0VQT2UlD2UMrfUaJdpw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6VJsBBw+9aLUNmIbT5EOz+b9Lupz6euvihDRf+q8UA=;
 b=MZWQUzTdKu87Z3yZNlgPnk82XzGFeCNH1Fsok2pB/wirMZZ5GVTQu3hubMDQgMI9PbDKmfVLbDWol5UjsygVq7qap9oPZeR0vQJ/mFqe05V3HQ1/tFkR/HroxBlOd4N5RnDYWUjz6AN60VMMx4nFgNsthh0PixQYfQyenthaawpFWlVtlQFL5e1TrHCgQW7cS8pLvzc2xzJuoEI6JZcyy4J5OBem6Z+6OEjC4TKjLirTf5W/NoflrYbP7iG/GIGzY+8mACsqnHJlNcSk0ZFI3RZfe+UEFFX7hwGZAbA00MPWkllZKoyACe56BAnn9DSFD+GVGPXad4xBnrINTLr+6Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux.dev smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6VJsBBw+9aLUNmIbT5EOz+b9Lupz6euvihDRf+q8UA=;
 b=VTct3TJM+OunBfzGKVKBs1bHWhwAuwIGQQLM9WyomdtBvDXcGitFSBsJw3rmK2+GxfFUf6PYXASw2g/WrvG280L9uw2yJf1eQhvxzypYk32uzbyPrrN0byTHHDvsZuwQX+qVQSenj0+RkPJOTkRgJhHTnr9L8zwWDV8Gyl9B1Ko=
Received: from PR1P264CA0176.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:344::17)
 by AS8PR08MB9362.eurprd08.prod.outlook.com (2603:10a6:20b:5a9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Fri, 6 Nov
 2026 08:44:54 +0000
Received: from MAD0EPF000008C4.eurprd05.prod.outlook.com
 (2603:10a6:102:344:cafe::8e) by PR1P264CA0176.outlook.office365.com
 (2603:10a6:102:344::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.11 via Frontend Transport; Fri, 6
 Nov 2026 08:44:54 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MAD0EPF000008C4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4
 via Frontend Transport; Fri, 6 Nov 2026 08:44:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s0U5i4Rn/UCIlotiLo/VvUA1a6U0v7YRBf0h0qxbKixjoTDXolHKMHI+81ST2iSBij40UkhqXDsL+sYt4MCLe5uWreOA7SkVr9TWGBJLsh9uuHMbNo/9Hn49hzj17LP8Sp7Xwa+48BNcoeykitRg/I9krN35oK1HKLgn0IomDqmVT9K1NRIhqPItUFmZ4WSP5n37dMz8RoWaQGFh71bQMHlIvtJZaKs5GFCad9CbuGItn33hnXVXTkuLGPJExq8CMcdPGQqZKrGyia9tyh1WuZoTO2vQ5B3p5TMA1E+ZTUhddqj3KImydjuyu55+G+yd0AQPzip/TZ/koWdM8u3ObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6VJsBBw+9aLUNmIbT5EOz+b9Lupz6euvihDRf+q8UA=;
 b=sljIyRyMiC/coR93PrX6AW9+zxGgQss9F5QGMweCfqgDQgcl07npH3G5kGJCC/ARACEbb/zVDf8AkeRr4g21mNI00hgprYqUmQfXaIePTPKaQOkxb+9FhJt8/Z8E9HLbweo6RmtWALMi0oa5NGTvcuzjGelY8BJKeIy0GEGb6zaCZ1tRXYgde7SEuzzvAKNVJC/lvlnKiCcQRWAss21cXrIokd1eVN2BHV+7EHqUX+j68pJsWkTmlAeJTOHE4iBZxShKge/EQwhRYYZIp1dEFEFAyorj6hRwkOY4+GQzRqql3JQ/TjO/PYVbrtW8xsWtrIsvIiTIAr+8wiFCFUMLyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6VJsBBw+9aLUNmIbT5EOz+b9Lupz6euvihDRf+q8UA=;
 b=VTct3TJM+OunBfzGKVKBs1bHWhwAuwIGQQLM9WyomdtBvDXcGitFSBsJw3rmK2+GxfFUf6PYXASw2g/WrvG280L9uw2yJf1eQhvxzypYk32uzbyPrrN0byTHHDvsZuwQX+qVQSenj0+RkPJOTkRgJhHTnr9L8zwWDV8Gyl9B1Ko=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AS8PR08MB10291.eurprd08.prod.outlook.com
 (2603:10a6:20b:629::15) by VI0PR08MB11199.eurprd08.prod.outlook.com
 (2603:10a6:800:255::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Fri, 6 Nov
 2026 08:29:30 +0000
Received: from AS8PR08MB10291.eurprd08.prod.outlook.com
 ([fe80::9f01:508:17aa:279c]) by AS8PR08MB10291.eurprd08.prod.outlook.com
 ([fe80::9f01:508:17aa:279c%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 08:29:30 +0000
Message-ID: <00152592-fd72-4413-88cd-c78a3722829a@arm.com>
Date: Fri, 6 Nov 2026 09:29:24 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add offsetofp() and offsetofendp() for pointer
 arithmetic
To: Christoph Hellwig <hch@infradead.org>
Cc: Chengchang Tang <tangchengchang@huawei.com>,
 Junxian Huang <huangjunxian6@hisilicon.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8?=
 =?UTF-8?Q?n?= <mic@digikod.net>, =?UTF-8?Q?G=C3=BCnther_Noack?=
 <gnoack@google.com>, Paul Moore <paul@paul-moore.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Vineet Gupta <vgupta@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Selvin Xavier <selvin.xavier@broadcom.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Benson Leung <bleung@chromium.org>,
 Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>,
 Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>, Carlos Maiolino <cem@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, David Ahern <dsahern@kernel.org>,
 Ido Schimmel <idosch@nvidia.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 "Geoffrey D. Bennett" <g@b4.vu>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-wireless@vger.kernel.org,
 bpf@vger.kernel.org, netdev@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-bluetooth@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-hyperv@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-scsi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-xfs@vger.kernel.org, linux-sound@vger.kernel.org
References: <20261105-offsetof-v1-0-4153f5c10edc@arm.com>
 <au2J-lMcEn4p4KGR@infradead.org>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>
In-Reply-To: <au2J-lMcEn4p4KGR@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0163.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::6) To AS8PR08MB10291.eurprd08.prod.outlook.com
 (2603:10a6:20b:629::15)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB10291:EE_|VI0PR08MB11199:EE_|MAD0EPF000008C4:EE_|AS8PR08MB9362:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bad4ecf-12ac-43d8-a453-08df3be23a59
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|4143699003|11063799006|56012099006|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261026121527099003|261026140227099003|261028144727099003|22082099003|18002099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 faF+axEssCynoG70FYMCePhIoNpODz8nUUte48ilBjAxzSF2ljdTx9FZ+6SAHTl+L2p2VXDJxSZLAuGF+8xFPD/wczlw8gbdBoL9FYDE/uIqKiUIVgMy9ykCSws2uLPnpBAK7V16FmgaDTf3NDZ4MRCgeh2p/ygbAULsuCjRiqxv58kWepRcOoaQ5ttqxnXxAXPKc2jvzHJmnczt5v2Kl8dZU8kI8J59iMg6p2A2UfEIkbd6esvii3NT0/PLpM3QpDXXGSib9e/FqsLftpDpwBHPG0ajxoEH77qdkiTImbxXmZaR+H7buSGy9nCBRwtkWF3EQzXzU8Un+j3LQ0ndbfjxrZXJuKFFb9qdo9vdlnYBzuYxZliIbcBCqGM8uEl08awDM9NgD4ISXI2Z8Fk9vjKO8IB+rDAACKMn7XVoXXn3aXYaoxFiC/+fU1rUjP9DJCuOdM/TNxWqW5sG/GIglVNr8u83u9+GzJGqGnbVLzt5toXnEiRGY02Q00lVU8FSmMDMgovq4aRgxyJtQSPVxatmi9SLwh4GF4wg+JPW2VuGA+Prl2qZeAir1/AyWcIbQEfeM8jN9f+XIQ7UjGHZqoolFhgR72yHr5Gwpsv/xmaYN35+U3vuTQYmWiwrxxEi2A3dMvf09/CGVjsdblkAJlBwzfpwxVdFkOsORGPVI/Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR08MB10291.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(4143699003)(11063799006)(56012099006)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261026121527099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 NeCIiAyKEnvG3hV2ch//xgC4atks9H+CsONLPBStOOh8CG85CyJF+aQCcRm3+Ez54VEWInVKsHEWmfQrrnHjx6GKV9fAL09L5MGK+lgS0vVTtRHSlZub1CBrTbF2T1URA+C9/2gQAvxl/cpBCRA670gFqJRIIOROFz25Frpvk68WIa5CF9Z832T4xoZMom1cCsaSvT8hspU7R+kOxNryq7oFCYnDuEUv/9AOknzx7HFViRfLoJG5F3ZXvirXd0fxz5WgVPd0+JUsUzOsKiXYZvDW5EXdOgNkIDrg3X8Nd9FzJNwSSx5bCq41uZQbnmLUoMn5JwUmO/XCfEZBdMBkTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR08MB11199
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008C4.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e5a6ba2e-9dc8-46a5-9ba1-08df3be013e6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|376014|7416014|1800799024|23010399003|36860700016|14060799003|82310400026|261026121527099003|261026140227099003|261022105027099003|11063799006|56012099006|4143699003|10067099003|261021121427099003|261028144727099003|261022075727099003|261102123227099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	HSO9cwC5VRegcVmiy6CgxFEafpC3W6HDLu2QXaGAJf88uw22p09ZyPghq0oLdIx6b3RbA57WWq+z/S1L/PNa4zi4U9qVZ91CandGXVgCB3//VS/8NlnTpseh0zOhJtaJQ/A7T2FBrdVrMZJV0B7lleFtH604vQLBh6ze+sePMMKuUtumeB/cxmBfu8vXB8swku86tiG9VXIibBOqolTAjsv74txeExpu6kLl82vI6KyxuwIgzkYqfSptNPQ8aczUlXVryeMeGFX6Qvw1cShgvCcLLawoUnKG3NA3OsS7v5m2csExLpsF4IaFzAqXde/Zy0fwXftjC7hTOXBJCedjgbWmpQGDdS9cX9CrPARZx85S2/vvoAHrZ6MTu4b0tNj2av6LFi5CEObPmrx8YlUWc8IcLMeWhwo87SZ7NagDXj+bNYHIvfy5yqzIsXhW6ByyFzId30YQ5YOeLIFpHRUbNpTNmlJiy58LUVSmSKrQOwKrcveqssQWx0meGXcwlo2Q1ONNtbA96hbaineVXsGEjfbMwwUjcZenUm5lDlO8Lx+sC+L/dnsgxKK8uidTRVHJm5h+tjz0FkewSAuvwGklAO4SFNbv+tloe4GYIG2YrMeYH9N79g4Iche52OHHFPVq12uFGky7CVafrToDRG3XGMMHJ5qLeBESMSEJbbEw8bGHQTXNpuFEnv+Ynr81DECQ1h+UToDmPWtzln13QylWiw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(376014)(7416014)(1800799024)(23010399003)(36860700016)(14060799003)(82310400026)(261026121527099003)(261026140227099003)(261022105027099003)(11063799006)(56012099006)(4143699003)(10067099003)(261021121427099003)(261028144727099003)(261022075727099003)(261102123227099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bp5ObyIu2stdKgMs9To6eRb1LS45es9eImLvEmN3CpjnUbyjH+ebJlc5Lm92O+pOBjRxs+wWvfZTKH1f8pSdvOOMaJ7gMMBPSnI1RyrvGihUJtYsDx+6kT3xS+P22y85VEK9HrQtlcvPfJsasEfJo8DNa88/ONHHP52SoGk7fIGyMj+xfw3dmB8Lt4XRmYSgFTjTCeK5lDAaqs1PVq3MbAZOMhPwYCCADwc1PK2WJQV9bNkZj4EIr3ovFKkUimSfs15z38/FgLvYWFxHiME0wE8OCLFi7SOOnwtsA2ABwBL7OUtFEesPcd6aCM4jVuASLriF6nU6sFS2IJaPO96DINQEw9w5szNSaFUBRPffPx8A+suSQLkzVqxywB7YrYcCjZFMEJydtMKzOs6WZHvHBKfOYyChyxBKm3r8HefuqEnQxjTBnd3CbjJGJ4IQaw1g
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 08:44:53.5664
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bad4ecf-12ac-43d8-a453-08df3be23a59
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008C4.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9362

Hi,

On 2026. 11. 06. 9:04, Christoph Hellwig wrote:
> On Thu, Nov 05, 2026 at 06:16:15PM +0100, Bence Csokas wrote:
>> A common usage pattern for offsetof() is the following:
>>
>>    offsetof(typeof(*ptr), member)
>>
>> Condense this operation to one macro for a more maintainable code base.
> 
> What exactly makes non-standard macros with no obvious safety benefit
> more maintainable?

It is written out in more detail in the msg of 1/3: it helps keep lines 
short, and as typeof(*ptr) may not come naturally to many, some may be 
compelled to write out the typename twice::

   struct my_struct_type *p;
   off = offsetof(struct my_struct_type, member);
   // pointer arithmetic with p and off

which induces additional work if *p's type changes.

However, as Sashiko pointed out (don't know why it didn't write this 
earlier), struct_offset() already exists, so we should just use that 
one, and probably add a struct_offset_end() variant.

Sorry for the noise, everyone.

Bence
