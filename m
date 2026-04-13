Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011065.outbound.protection.outlook.com [40.107.74.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92F940DFAC
	for <linux-sound@vger.kernel.org>; Mon, 13 Apr 2026 03:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776049528; cv=fail; b=K/maC7CcFh0z+8ZtavyZ8j+QdNSuLZdv2L+W9A/7gkOkKNNbl39aEXy9xXsCPjjITr3IDxv5qrh273KjDOz3b+aZoqIzAImQRzzY3OUy2v/YDnjaO4ymKyP5aFxiGoeW6DAAPHsZm5ebTwGmxwPhfaXMx4x/Ee85OhWdT0NwRlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776049528; c=relaxed/simple;
	bh=2lrcp8OKMfIbwxZL21j3Kgk7zPGZWJ7Ewr1YChMGFuU=;
	h=Message-ID:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=VcHhQre3ZQRQQqkQePFigOxTJsnz17WC/FTrVWeq82tpLGzKuBfOuva07oFL8b2pl8D94A5BBrcrtSVt8hQhAqkrGVBDCE317ljEpJjUXdEicmwe4tfpw8jVBM1B8BG4vJYwp/NY2MCN/KIh4sp8jir1aDTGODTJ08ucf7ciO0Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=gXu1gv3f; arc=fail smtp.client-ip=40.107.74.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="gXu1gv3f"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nb33w7EsmLUZT7QO5D9g8DC5Wa+jmFJbWHjWuHWt+mfh5jAIqdsslLiT8uzJZ45JtBWcz4Iov2D4hIovN23MD7UV3dfdo2OklGuddbSHE4t6WQgPfuaqEAwHIzljhtQWHvZELxPNB4efmTnjo8G+JTxkfpKZo2WkRDliPffq8Ul9x0mvsOnv+QJOlS0NtUMRgFaqD0ISgpqxiUG2TXacIg6xn5DIzlrSlXllLnRb5xrqvhFVpZxwInFN9v52Wnst8wSDhWcLBj7Qc5Utr6B6If7mtHASjq5udRLxDy3y87Glv7+uShoY8uJmvS8cuYYPv6jcPyQsZioFWeqimFT+mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8QAPyDPVxn0erHZQWm0gohM3ZMLDSJ6tYe1F+I8XSYo=;
 b=ybZ2eIEmi3qvnvuYnS3a5ViE5PMNn7Yem5F1jpT81DC/P6zHeuEP5ygndKscCLIZRlde7sTm9JUOkTlvQ/g7BHf1I2Gy9GmVVBs5JYRFD+UafyExvSWfYCgCMbd1HwTZdc40QJIX9o9CZVzTSGK6LBpmeDfq6+u+QbNdYvBFZq+zWm7dNW4Uu1soeadIKefeiAmzFbdR6RfQqWJiQp/786LZvbSic4BXf2OnnTODh2/4QD23kSK0bagN4/MYdvxyK0NrxttfqFAP2GojxPCjrCgJCG9ucl3ueAhCKV9VJxx0FhVLiS6ClpD7kMUXVwfEW+fsE1KlrcdMlqIGXmxi4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8QAPyDPVxn0erHZQWm0gohM3ZMLDSJ6tYe1F+I8XSYo=;
 b=gXu1gv3fGAr6d9IH6ZIPB+lnOLGvbW8nz6/huQJL+Bp9j6YGRnJp3T3jLt4BkWbuQgKE2V0u2jzE7dZ5zP9tEY8wN7MdcugiT7E2A+hE61kvJ+QfJRyaCJ2RdOPnBB7qWdx6QVSKs+x0VbA4zLD5ZqGT71ZbiVoU63K3TmQHxhk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com (2603:1096:400:373::8)
 by TYCPR01MB6931.jpnprd01.prod.outlook.com (2603:1096:400:ba::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Mon, 13 Apr
 2026 03:05:20 +0000
Received: from TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383]) by TY3PR01MB11797.jpnprd01.prod.outlook.com
 ([fe80::1868:c915:c230:a383%5]) with mapi id 15.20.9769.044; Mon, 13 Apr 2026
 03:05:20 +0000
Message-ID: <87cy0336hd.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH] ASoC: ti: ams-delta: Stop (ab)using card->pop_time
In-Reply-To: <20260412012657.1370381-1-jmkrzyszt@gmail.com>
References: <20260412012657.1370381-1-jmkrzyszt@gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Apr 2026 03:05:19 +0000
X-ClientProxiedBy: OS7PR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:604:257::17) To TY3PR01MB11797.jpnprd01.prod.outlook.com
 (2603:1096:400:373::8)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY3PR01MB11797:EE_|TYCPR01MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: c4d61835-1d8e-453d-afe8-08de99097eea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	atazTkC2ZxjjYx1jvRd+UOp3zRDiCo9kECcuA4hYhpdiZM17AuAIbqCcfYHAlHIJBLPkhEeQiDqHdOKcmPg4qlPYjXJ//rmvS64RTM439f9Gn3LmA+QX79d/Py21oHCzm2UJbphB15R7hy5PtxrQX/XzvqqXRx+dcN+7QdOqsf4DGyjdBssGM0lFgu3HSAWEft3Qr8q1jcnIKRs6a5uKdYvWhfvPjA5+Zn5iuW6GTln60VDplG8zhDu+1n3j+jAH5Vlq67DuRK4N4glV7hFKWTINSCqKgrdBh3/bcYv8YeNv2qZRhkFYEe8XtX7aECwRHqJQ1aZ5Ulcif4S6caUVcsNTfTrBRiZ0xF9qxCEsJrsmau70HOK8xslJvbZ3bW3/9V+aUbVuEX+pGTNhYJS8YmGuB9LQY/vg3S64YHABo2YfGc1Z96JvOrrvivyOmmf6LzrlDY25yJGMoftLWM6mkeIYF+LmAibEn1HAFcwcESRhjINjjda7IoxzsfPVIm1nwDo69FFScO0i0BxnUNUUuRitcF3K8eEkePNMjWXqtZ2kuB15DdO+BgSJ0JLYBehsykNkNPSOZLCoYTGTzLFD5AJyQLsBz/MEtMDYxUT09IT3Tv23oO8MVo2WslXo68vaPY1lJ0bKDURV9p255ELn5hKG49BAuF/W40UX2gl2yK2Ax8LeBJkTACxOz6vMuiE7fznOhyyBDkhNjDTyEVFFGwRiO3RlrgLz7KKJCfqj3ruZTBLDeYlnOf0Ag0b8sFxYe63v/7kl3Y5jME5OXIRxfql+o0drU3DsLVYD19IPodA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11797.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h2m64zQnKV0Qa9437LVQkoy9wF5RC/DGHdE6Hzdc8r2vuW6an7E/yqiBPph7?=
 =?us-ascii?Q?qYqWX7jyvY5LUgySTkoK08NjP9B27SDcZw5fW3RErr48C0sjZEd4sn6JyNFz?=
 =?us-ascii?Q?qlgm+OqdN85OZWoenNB2FTKBQuN1izx9lIswo/VSp4gaq0VgtZg9yZly7gQI?=
 =?us-ascii?Q?tzTRwF4pRkhuKcUChxbK0lyxKxYz04oT17WpUdmHf2/YrlnAxtY7HZV7fXhH?=
 =?us-ascii?Q?YR8QtHm6b/mrHHQpLDVZSFVcJFmNdw1dpztxqRQ5Mt7YbVwY924TI6N2NZhp?=
 =?us-ascii?Q?B/sMme9OhkZu6ZaePlxwdjO1zBcdXK9Da/YqgsdbsTqL7/1cskf9t/JE7+rb?=
 =?us-ascii?Q?26KADAIDawdlgtBIQcb93ik9lx70PbI0mQIl773Tbn6ixug+x+TcWZN/yzZe?=
 =?us-ascii?Q?IcWv1jJKYwTxulJpcVoUDsZTWTsSe0YvTI3d/cCFlIbBK9LUxvOk4DcTkkC3?=
 =?us-ascii?Q?Gqp/4KKUvpO4HYWYpi10afV/wQchKb8SoiRu4f1Wl+CJ+XImGJcKpbApiSs/?=
 =?us-ascii?Q?HzKU6SiHK9GcAkrekC2uz1TSuOaYm/9UaE6ET5XXHX0/JN5fhUZ8doqox3fc?=
 =?us-ascii?Q?L2EkCYzxo5Kv9GOX5RBzoskuCyVIPOiM+J3GRYdyCDWNKLdVAbBYj5UgPZcn?=
 =?us-ascii?Q?qeDRfqaRdD9zTS+lX/mxsnQQ1POaHy2N6QV16+a8QzOSfbcOtCN03YIPkuHP?=
 =?us-ascii?Q?vS/NatFTuFwxwPn2ZtRf4YO7k84VZUJbVi3sUsHmf+SwVgJ+GSWlOb2Hb6jG?=
 =?us-ascii?Q?CP8qve5o+of0verdjNDs3HFKyZj3XtPxRl6rkJtYCnyybZ/yX03A7Cq4Xyi2?=
 =?us-ascii?Q?hJMRir4AvE/NwmEB2H8w7NYQMvwQ3oTXAQSCFlIIMqDBnm8KWgt8Nuk+ra+C?=
 =?us-ascii?Q?kKG5SqdUzNcKsfkgsaxcnqlhbvtKPjqZHBSIzviG9xOW+IsZrFAiwKHw2Xiv?=
 =?us-ascii?Q?IWsjYJzV1QOKY0gxkrna3hLefF8LLI2FOhFRHNfPwHin1v1HFWwPNljhIUxu?=
 =?us-ascii?Q?czdJO9t1lE4IuZavR9dWexZF6KkHWIwrZw/4YUhUwzmoBkPGyLH/WEif80V6?=
 =?us-ascii?Q?EV8ujxbGPMHLY3DB/HeMUgU4Ufnsx8My953GkBmIJGaCz7E8LALhFmXQSzdp?=
 =?us-ascii?Q?6UtxkfCQwegBAXc9IJb20vF7/P+DD9QJqvYhjx0Fzhhg1gzEeTmB3xfIRIOD?=
 =?us-ascii?Q?5tL8MGkNlPI4BN8hWqnD6fS4/tP0PuDUzUhpdfsMM42JujMwGDPHp2X1OszM?=
 =?us-ascii?Q?gaWVH4DItpdPd/ZQ4PDterFC14/G+z+ZaJxYZUjjfGyVMwcFKEeBB21f4sjc?=
 =?us-ascii?Q?q8aiJ6SzhxiGiA9EQaoELuHzgZTQLw2YWmXHJH8vrHb4wHsbo1hRtoc+IcEc?=
 =?us-ascii?Q?hUeuSQepWMUHxmeBJQWotuIJLjhmVKpPN8mC3ll2pBLMDj+tCv4Pz875Nots?=
 =?us-ascii?Q?rV7xvHXbkVwcDjvXEevOE+BIaPRX3GQrMd2J1sXG/j8gb8EfAPiPLkAi0z1D?=
 =?us-ascii?Q?YctATgmonvzKhVh9B1STUpXMamtjswEMuxxO4qOvWHJunt7UyCgztD1a1VHE?=
 =?us-ascii?Q?tnbwlRrLf2y5XwIcYj4Hi50gGLErdPrnD6Tbqz6EPz/7+hC3rp8PduuKkF8t?=
 =?us-ascii?Q?vHv5srq2g18eicbAc6lyakfR7bdrOzqQPZrnyxZXOsyDWu/D0wPF3VP43AFJ?=
 =?us-ascii?Q?K+o2QaOd2U8NEoMQ4Kf94bQD3jRfS36+Zb950mSjc05SLlqOqp+pP0Te21ir?=
 =?us-ascii?Q?xWJ+UF2qMt7Ld5mVlmw+322oodN3t2G52f6ojZmn2ATKN7lnUp6u?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4d61835-1d8e-453d-afe8-08de99097eea
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11797.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2026 03:05:19.8948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V44yCqPDVz/diMymKw9S/IsYmItE132xcJhqEV4WBb/LtlLMM3wL9rdThrgpiUS9QiISD9pjRw3jc8eBzB0CpmIltpyGmlzqGPA/gcM1GmCu24MqvB+Zw4F7iBNM7Vrr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6931


Hi Janusz

> A flag is needed that tells the card driver if the codec has been
> initialized successfully over the modem's line discipline.  Initially,
> codec->hw_write was used as the flag, but it was then dropped and the
> flag function associated with card->pop_time, already managed by the
> codec driver for diagnostic purposes.  Since now the card->pop_time is
> going to be killed, stop abusing foreign fields in favor of an own one.
> 
> Signed-off-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> ---

Thank you for the patch !
Some question from me.

> @@ -248,6 +249,7 @@ static void v253_close(struct tty_struct *tty)
>  
>  	/* Prevent the codec driver from further accessing the modem */
>  	cx20442->tty = NULL;
> +	codec->ready = false;
>  	component->card->pop_time = 0;
>  }

It switchs current card->pop_time handling to codec->redy on cx20442
and ti drivers which are the card->pop_time user.

Next, I can post the patch which moves card->pop_time to soc-dapm.c local.

But do we still need component->card->pop_time settings here ?

(A) Is it possible to remove it from here (= set it via debugfs) ?
(B) Or does soc-dapm.c needs get/set function for pop_time ?

If it was (A), removing it by this patch is reasonable. But next my patch
can do it.
If it was (B). next my patch adds new function and replace it.

And do we need "card->ready = false" at cx20442_component_probe() too ?

	static int cx20442_component_probe(...)
	{
		...
+		codec->ready = false;
		component->card->pop_time = 0;
		...
	}

Thank you for your help !!

Best regards
---
Kuninori Morimoto
