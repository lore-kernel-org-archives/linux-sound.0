Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010057.outbound.protection.outlook.com [52.101.229.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3533955CE
	for <linux-sound@vger.kernel.org>; Wed,  3 Jun 2026 06:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469413; cv=fail; b=DLuwSDfNgBWq5IYu8C0UVPpU8hEfx42/LSg9l4VkinYsQbwuBJBZwMuPEYAWbVIpJgNojBbhAHwCe5khU/NKylPXbwVSggc8SgT4Ye+GqkClkv6ZSKPST7YCmzUApHXyUEZVVBs7jO3xry3IHFK3Megis7Zk/DfzC4w+mRGPeK0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469413; c=relaxed/simple;
	bh=TaC9m9Vs8dPnDOWU9yIhcwFfVvvenrFLkGTqRu+f0X0=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=UvggOGzw5Ix6CaJNPRVq9XzDhilvljySGyg7aWTg50NT4NZq7lGgxN5wJ8pE0axnnE16VeANsXYcYVySS6m4a3ww9mU6ZmdvtmY58LkHJEqhpMa9MvCps5TMIdDCQ2o9uHSRXB2GkQKuTW3tux4M+OY8IuZ/bO6ImAv/oR9LMHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=ZSGLHu5c; arc=fail smtp.client-ip=52.101.229.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="ZSGLHu5c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=os2JDr+Gf/s0wwCUpyrvLo8kuwr06dVmcN5fbhpq0snBTO8DtxiK18S0oUqvazLKcLR6WWVrHIbDZzTB9jT8DtnllAOIP9oYNhUVDIX39EHTmpi3cpVjNjEctIIBsBLhC5OokeIAaEbTr6KkiQTLJ3jj3kXTkujlr3YMAl855BxzzX2NMfBQgjGMGoBLxzAM7A0tKyhA3wsV1BLaTLM3WCD875hqs0Jgz8M31RWhqO9m3GpPNxrLSo319Wv17CyAPwfqcrB+wDYky5wTtRqhgOSp2PtnwvQ/4KqVmSMYLDG4fdBWEXbhD2DMbe+O3hpydHLKcHlqA1wcgz85HRBeog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2x366581q/JoZD/xPlLS8wETO1Sb6A9B7wc57+r8aaU=;
 b=jwbm778xXJk3qrThzJAAQiTY7q6wO/PQcqwbDz9Fuscs8If7zk0vLK0Qr1JO4VzgQC+7gMOouVKlZDwsLfTqOQwm6jV4LhcymFfcyLP5uNTpeyzQvp7CuEcBffEsm3BVYJJhtkalqBQeee6mFDS3ww4tQwsJaezVXezJvzZ8ZeuuLnbsVVm+VlSffhq3+UkUEEaZf04wWIQBxQdH9jw7RAnhX7/8/GyaMMyfp8t2xslUxTjMYYD+Q6NmI9EAv+FJUdBo/bcdHq6t7L20UR5LY2pbSFAr3V4UgwR1q4vwYmPQ4kgOEtPdu/X9rb8eDZc1CCZcNHZHWtI9RFQ81o36Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2x366581q/JoZD/xPlLS8wETO1Sb6A9B7wc57+r8aaU=;
 b=ZSGLHu5caExwaL+pi1eGZdD5pLWVzrPDZvCQacZJIxcaXV0fWNYuPki6YONirCqk7nPo5ef3hmykVg5DW2Gi+hiFzgUR10rmL372FQc+DhvaTMti/A89QgmJOqkrfy259q9LdqsWdKs8jw6zDZFC2bTe80ibgsAl386W17+awYU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYYPR01MB13496.jpnprd01.prod.outlook.com (2603:1096:405:1bd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 06:50:10 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 06:50:10 +0000
Message-ID: <8733z4ce3i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/3] ASoC: amd: ps-mach: remove unused machine
To: Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
	Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	linux-sound@vger.kernel.org
In-Reply-To: <877bogce4k.wl-kuninori.morimoto.gx@renesas.com>
References: <877bogce4k.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 3 Jun 2026 06:50:09 +0000
X-ClientProxiedBy: TY6P286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::18) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYYPR01MB13496:EE_
X-MS-Office365-Filtering-Correlation-Id: c8f949f4-1de8-40cd-f3d3-08dec13c5ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|18002099003|22082099003|56012099006|11063799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	l9e9H9Blxp4J1NZFV2IKA1HhH7CHr09SS3Adgd2ecOG/Ka3Ebpc8MNaRQT8q7YlZ3HVoXwvd6plI4IclEzvM2r1JGsecUtoMI9OBlNgEZDgj8/GOQczzSqYMsSzhSsF39YVgfTlsCKnBzcqg4iz/KdwpbNuvYkIjnNRvi4lkfeDtESUk751L/aCDF7ZqtY0+FTPV1RQ0cAqTCNy13arcgdRuP57E+Nf06wi3fbvhb7uqN1HkJMjpuPJ9GQum+sDmhDr+JmaOinG0xXEcaxlyb1KchIuyA3b6N89an9xfImLX/ob4tzpg5IRdct3S6Kh3KsGRlNX8Pyzk9T8VbSi19lgj4VH77d6BIHOAwfPvI5Mxzz7VifQpNJzpzOGA9aQX0E5vPzn8DHbPdMrWZzA4H2kUB6YRqgKFF3+4b+hbClPGY8Y/saiz8BuKOuUmMLB21X/1Hp07QqVeFEfpyooB3LMgubYKoLLu8SeVnGVAlyxqe7Xfq6M0hComK6CuIzw6LBszIHn/YVl4yBaV5c5ezXscP4goBwdInvTCJD8VHcN5KHEPDRzYe0RE47Nv4wdcpbSjyUE+LOMoaE4XUbNpdoM4SH5W4z12PYH8inB4VrmCMroEucZ4AFNYwSeLl75ud1EJXtSV9n5Hf26snXKwV6wV03K61yxmv+ayjTHvGwiY34vURVfachDEo5bv8XPokxlIzfI4pAPFaU0Mes9qMjIIf140ITA9n1h8SuEQETnNMmZF2tQQ0uxO32HJ3aeJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(18002099003)(22082099003)(56012099006)(11063799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZMX3w4YKmaZk4XCuxdDlY6RTvq7tKUH6BlrhfWfSvaDMCT67uqIemkM+Y24a?=
 =?us-ascii?Q?DGglxSdh1RAMa2g10VkuwQxVY63qiZNQRGz//2dq0Xukv6cV2dg/owATqOzn?=
 =?us-ascii?Q?bZ5BtkW27+SQ39FM+5KBuF3AN0Q8qKXKYEWRbElRs2/YIbX77DjE6xTUpWn9?=
 =?us-ascii?Q?P0S16A4/DhjunBsAa31xNoGpj8DfXyBMIwT68ZL+OoKNBRVVbYvyRzo7Fsgq?=
 =?us-ascii?Q?VSuzURJbj471zo6rH+TWHvMPiACPJ5vqMYtZm+KbudZ4eOmmBM4aviMD3Sdu?=
 =?us-ascii?Q?Kr5/AplnW2Rkjfi1yKDuPeiBCJ1/Q5ekMOrfwHdbLMjGn5X8NFM0I7y5mwrG?=
 =?us-ascii?Q?V47MfdFaUysPS9aQpCiwISeaUAFX1voR4Bj5HN6ifGEzuIb49sqHV3JIois+?=
 =?us-ascii?Q?QwbUhyyszeu+aUjlPoC4NfvRD1NqPkNTgcMlxRr1hSbXV5Hsv89LP7vMFXE2?=
 =?us-ascii?Q?k5mIA2Kr1Up64cmwcH5Hcmrj/QY0pjIsHQEdBYxrNSY2wjxb4T/OTna5aBFF?=
 =?us-ascii?Q?SOfMmPF/7SKkf4TkMnYMmstp/H0sW6p/FdhhIV09hAmIp9YeqyhIOUfsBbeo?=
 =?us-ascii?Q?8WyIbX2ZszqSgWqs6SmotoNc24dE8ixkg5cD1bFCNj50zU3fkZ658fU74CL/?=
 =?us-ascii?Q?8IJpjFDhkBYIrtMiDX7Rdm0IK0+vi8JW+GzK4lac2S9ppTfbvTwSEN4Tltjs?=
 =?us-ascii?Q?TrhkdDwYy9bLyikEF4gR9rTdyPk7Nmk+lB6BcK+u1SJjdEdjcHP7lcRdnWef?=
 =?us-ascii?Q?ew5oMR1fU8DB5agL/JBqTiOkPacLoe8gjocXBS0N3alfcOGVwbKnX5SpLBfD?=
 =?us-ascii?Q?3UNMXN2hFvsptSGrezcMetedRiFcGa0dtEm5ve1T5acAqpElIRD1uKyIWZE/?=
 =?us-ascii?Q?1zD4YIoda3i3s2oclJe4asG4vKDTM1lOwayLYiURY88meWMW37Qm+f0d6jOK?=
 =?us-ascii?Q?GJJbzsb2E5rxf1NgStqv0k7kBKneQKOu9IuZZMeuAWYJrbn26W/xjWZ34kye?=
 =?us-ascii?Q?bC6Ha0SDwAAxSgBj2rHhghBQiqsm7dM2vc7/223dR0LqtrefjeT+OOB6Knys?=
 =?us-ascii?Q?+EbVXeo1+posNtzRmrImc1ZHpEHAI0qbohz3BnIV/S/EJUbiz376irkoVVeB?=
 =?us-ascii?Q?i598Rm3e1K26g24n0ITn7i+ELF5eEpYhzEp7ng9XkLe45IYJRZAFW/moIktn?=
 =?us-ascii?Q?9yOcvwXnZhtohC4G/gizaiAB8h8JYFFBnhJs7nEWtlTMGjAIUI5+vHMaSH/5?=
 =?us-ascii?Q?uoXzNSy60qtd7d+sUrE7SB2ieoCA1VLAJBuIPU0iJ7LIJTwVd+Rv8UDgInbf?=
 =?us-ascii?Q?TZAAA3LRep8WTJjzdPDPpa1gUYsNqq8TamuacZeUS3JRtquBzkXwyi9O49gx?=
 =?us-ascii?Q?hDFc1sXIcKd4Q2AP49SiVLIPKRnNRcF2UKra/jNRkcGVgehG2kgAlyTKeiUD?=
 =?us-ascii?Q?frHA8xZCvhnziAdDh03yDKxmNm8nXlLu4hmifUYEp+7MppCNU05xisqKob7R?=
 =?us-ascii?Q?XJ350j56oZV5vSQ77Th39NQi0Kv3XAZYNRPrh9Xr1PZ0OYD5SCXoBGsTDhqT?=
 =?us-ascii?Q?XQTaz5MjV/CvoW8cz5Y+XnUwQ9o6SUYo/B5g6/a7FcUOWJt+5kRU4SZoAsMz?=
 =?us-ascii?Q?qlryUFU/WOuMMy4dFS7lrPU2nk68t2LTQSgDFMsTleELw4ApuksULzmBEEmm?=
 =?us-ascii?Q?XK6adtlaB+A4AMgWhP7nPWO7h7nbnrGbQTA+4gmY9rE7E9TN4Yg4zRMPms6j?=
 =?us-ascii?Q?OGppeDU8RRr6XbTmjZfbfH5Q0AXSuVLSe9qfofZRo0ofIHE2ZyOG?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f949f4-1de8-40cd-f3d3-08dec13c5ac6
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 06:50:09.9574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ewnf/ApeGo61CGQlW7zESylZuUz0u7QiV+Cw1ufjkI8DX+3wI2nyhk9oE+MYQ44LT0bfF7KwFpP2wLwzTtIMVf0aGkO4G8dOGU5R5IgHC/9GLgLBNw8xqUF6ubNhLN1E
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB13496

Not used, remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/ps/ps-mach.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/amd/ps/ps-mach.c b/sound/soc/amd/ps/ps-mach.c
index ff8ad036b077a..3e49c255c025b 100644
--- a/sound/soc/amd/ps/ps-mach.c
+++ b/sound/soc/amd/ps/ps-mach.c
@@ -45,7 +45,6 @@ static struct snd_soc_card acp63_card = {
 
 static int acp63_probe(struct platform_device *pdev)
 {
-	struct acp63_pdm *machine = NULL;
 	struct snd_soc_card *card;
 	int ret;
 
@@ -53,7 +52,6 @@ static int acp63_probe(struct platform_device *pdev)
 	card = platform_get_drvdata(pdev);
 	acp63_card.dev = &pdev->dev;
 
-	snd_soc_card_set_drvdata(card, machine);
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		return dev_err_probe(&pdev->dev, ret,
-- 
2.43.0

