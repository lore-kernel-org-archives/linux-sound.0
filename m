Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2061.outbound.protection.outlook.com [40.107.113.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58EC12838D
	for <linux-sound@vger.kernel.org>; Thu,  9 May 2024 23:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715298444; cv=fail; b=lmYXD4DxrMeXQVfW3mrfCdxSdxmBEUb9pdUUjvhc2Fj0/96iz9WhN9J8iF0QItquIAo2EAhAr0/Gu9VPY9JNxNmcZW1c+5veU3OWYXtwObFZPEXsnCWofTV/hxDmRlMuDx79XOibTEkkf50VGDsJS/XfIKczjFPp55adX6o7JQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715298444; c=relaxed/simple;
	bh=TbWa4UMDvX64l+fCeRtwuKKLNvXySoZLWnq4WAWkCJk=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M59KB73Cvaeb6TWy2AJmyq716JdnEMAZCHk1ZGNgvGeR3DCINqTUNpWjzXQaPdF/bJ1jPOHbcEpN8Kb0J03C9CRkNjrAxSAqiIiPIHWhaAC6PMNcElP4vxn9PIzfDa15HI4ixY0npum4hpQ7I9X0IhNwygGzjt0+ptyseqLHLiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=CQ30Gnmj; arc=fail smtp.client-ip=40.107.113.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="CQ30Gnmj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeMc/qNwS6WYYxZforfLQ3X8185pjygiCB32pccSi/DERXroKUESzfyb29AcbQFyi4Qoby+dEzft2zcnRZA2zg1Hp6aTBSRH8kiePqWRnJ761FMwYdQeAHvmT2OODsBYx06GfCjk31m8vr94A80i1CxHl+Q5U4JxirL4c8G58X0hiTsi0tCtYqa+7C/hkIA8wPOEkhy5qISPMW2KRHcK//O4P1S515tSpioO8GzpVln3sT2VPwXtSwRzXPWuhlpdkeOO18rfg2JGDawEh78lipnUuBx/r0sPPDTjfVi7AJmFnakRGfshiHPD7TGzjVPf82ByJcWTROx7VBpkfL1GZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=br94w2cXVQpJRAz18MrGLsfHEB//SkZ1Wk9bYIHW5+I=;
 b=Usvcur51FzIUfTwpFcqbDASFXgpGLnUKVjR6Jn0vuzUmsUkBL+0BsDtwbTY6h2mLYghNkpLlf465ot3ABKHTW8+BljfdsgbUXv8m88Bsn052VorFOqvsNd4rZ0620793Va/l52AWtgv0L4/s+aMiEYajBhvfJvqLOt0V0SZsObkOLeQwhJbEIxEkt01vzK+li+JaGmQmX3vG+wpLg8Wh4+eg4v4F+75C90kv3WGtU4yFwor+cUJZQBeE+w4S1e6nnEFuDXnC+/5vrpl1vRoxAMkefeGbolrl0LR4/kbgOQyI8qUeX5nqrBZsh+6RSS0/jsKQ/7K7qfl6TZgpa86Vew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=br94w2cXVQpJRAz18MrGLsfHEB//SkZ1Wk9bYIHW5+I=;
 b=CQ30Gnmj7FHHbL5PfZzm4Nq2SkzgP6nqSR+Y9niYiOwAuRkGbVIVae/FyNFxDrkedv27LovvRO81T0vO9Tp63wszHXKxYZbQWLq73kyBeYX36EucD36HCc+MCwg5yDh9j86aSBNLRzQDkUgKnycT1RQzUtbeoYy3aeOL6J95ddE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6477.jpnprd01.prod.outlook.com
 (2603:1096:400:93::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48; Thu, 9 May
 2024 23:47:19 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::2f40:537b:2694:7b76%7]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 23:47:19 +0000
Date: Fri, 10 May 2024 08:47:19 +0900
Message-ID: <877cg2r1iw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: linux-sound@vger.kernel.org
Subject: Re: [bug report] ASoC: audio-graph-card2: add Codec2Codec support
In-Reply-To: <241354da-20c4-4ef0-90f7-68d6c4ee13d4@moroto.mountain>
References: <241354da-20c4-4ef0-90f7-68d6c4ee13d4@moroto.mountain>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TYCP286CA0055.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6477:EE_
X-MS-Office365-Filtering-Correlation-Id: 7340e942-556a-47b5-9791-08dc70825d96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|52116005|376005|1800799015|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZLXe4+EsvuTw1mKt1YoK20036HYLg2apB4f0lOJ+j4fTMnjVagUxQH7fX1PA?=
 =?us-ascii?Q?Rev6Mnt23B4uDQk5xE/YpsOoKsE9GAGOYylIfbinM8oGC8PxbWNU5WyGSAbZ?=
 =?us-ascii?Q?JMmASM2B8fk4qaPtMY+mCVVEmy9R2oSGKX1YbqZt19YisGPjyyz9yKNe2Tyk?=
 =?us-ascii?Q?ySV7gVzp2NwF6LGnun3XKqAXn1LINwYA+1zZcZ5gEyLyNf+i9MP3orjaKG2n?=
 =?us-ascii?Q?7C1uw3MnuLYZKjvBzZtj3A1UNWVsIISwodwGGAch0e/IOqiaAG7uBGwmya6O?=
 =?us-ascii?Q?dL6s2UU2c57CO/pwvDtiXW7RZNP+IJt8g2qZzGcMt3+Xmf4SUG7V9U3Ur+1U?=
 =?us-ascii?Q?KEGyK/GtjeeQqgmdc3LxbLKYxA5sZEVs82P4hQOPUWk4tGlO7H/bohtUZtCj?=
 =?us-ascii?Q?SzHxu4R2JloSqA095nanimUithtMjSEAVKgVmb+yD7tYTOYmetFgbcknt3yF?=
 =?us-ascii?Q?h4/hdg09fEl66Gi2ACN4fJzSHrt/XgVMx53m4z9Hj604hXGqiWmUl6pS8h+Y?=
 =?us-ascii?Q?RGuo/N1CrjtW2kh+Ccx2YKH5oFy2M9fCA7GPAxE+dUrtyy21A3epecOd/5pP?=
 =?us-ascii?Q?osJYIVqIRcoTMC8NQ5H6XoPNGSIxZmqvJl6FSpAXE/TmPjfi2OwycgoyWzll?=
 =?us-ascii?Q?+bd6ZLwKC7zUZVvQbxqtn1o6ZUrsnIuhRv5/m51bCLFNy+DXiiKbBGn5ghw9?=
 =?us-ascii?Q?1sjwLA+H5sx8hlx0qgUojmwYtvvTTEdUfNv75dQ7YnCknnLRUI6ImBh4zRLj?=
 =?us-ascii?Q?7G6in8HZ5yiFmPmXeiY5QL/TkbtE1F6JK4pbdqkLNu8Zuiup2aZse8e6TESc?=
 =?us-ascii?Q?nfQddK7sQXHuIChdlTaqtS2yiSBiTf3rUL2wmVnW8G4P4/TWti5tqeVz6qkL?=
 =?us-ascii?Q?xCFiueoCL3lYiv0/3oWvoS+9ErQgqn5KgRZ5LLAXcoM/+fUt+/9DjGtk6kf0?=
 =?us-ascii?Q?oChVBr89PTGAQRyDVUnKKjHIB1MSp+i+DydgjJkEmbz+6ezatavsfG3wb5YF?=
 =?us-ascii?Q?lEQonv4ZmYWUrEmiUqka62gXGk/b3eM7k7ANdDj6FK9tWBZzJBsb/YtFQkC4?=
 =?us-ascii?Q?I/GqOGmAaqgApNOKd+FffO7xh789QE4Jl/6bBVR5GfVsWnabZ2XiYyOsYhQD?=
 =?us-ascii?Q?/RWUzaC97fNPK7O/IVB7YVx5hKq1UQOMHatxURJgkdaafq+x5FLAe7J2ah9B?=
 =?us-ascii?Q?BGyyySMyU/NEeYJ5W1I/64zmmOP69gfXR+g9S+7VWKejx4gfmMVcxYYhIEaQ?=
 =?us-ascii?Q?CY8CO+OoCfVYSVebUbBHgXWOZcbZWXuVglCh5rgUeIFhBnQRv7YuEzOYvVAn?=
 =?us-ascii?Q?R8FL0sueAKBvqW2dhxHPvG0TqWy6Z4O+JO4QG2cOpkj2Ig=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(376005)(1800799015)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?A2q/rtme5Qd6Kx4eKGA1WFmiiUrLSoH72th/Q0U5j78XL8nKSXEHMz/BxXxo?=
 =?us-ascii?Q?SvUFlKJAW4mJ2VztVHcb1R9FcAXoerymjKD2TFzfh3MfL7hic6fhKk+v0cU0?=
 =?us-ascii?Q?O1LEvp+EVhzrcrK94m7/jPqzSngrYeOl5OG6jy9czLMXMKkpjzlgcTnwg/Cb?=
 =?us-ascii?Q?57m7hxGYiiUNXUHkESCIArgT0mdVXo0l91Slg50EHLe9yoKGlcVaTit4wCw2?=
 =?us-ascii?Q?ayZU2j0E8sxiLrBIW2L2X+6IJTrh/wz6NoT5nQf7QhQX1LutI9L5nDJgTFLH?=
 =?us-ascii?Q?1572qnq7Q+GRoYQF58x+cDaq7B4jQDmlPCqjfY/61zLVN7GEPPZPu7nsspR7?=
 =?us-ascii?Q?gxlx6P/sKK3sj3HGlqp5UFKDQKdw4oIdq1VBiwhycMOwv+Q2Ruj1BuqdAUX2?=
 =?us-ascii?Q?ucLz9Ar0k5SDspxMIEuOStre5w55O0kytFJYQ1f54fXGMB883bXvYJobdnVq?=
 =?us-ascii?Q?sEAyQYzkg349cb6DpLaUGccN0dmykDswC2E0NeeNKs7ka5MOXqGBzgAz7zha?=
 =?us-ascii?Q?k3xTCw7hWZ4enwop9kDy9RcnbqF0ZbnSkd04MQeSv0SSJVJVzZmfP3rS2wYI?=
 =?us-ascii?Q?Zk8PBBWwmy54XaZ3V6Qxy3NbQcMZDJVbjfyNUIZamxvRv3KnYdsjUUyZX0AT?=
 =?us-ascii?Q?zaqfRLn7iRexnbQyEdlubL/ipeTbpyvs17SatafEyxj2X2MSjXpAxYvfvp4P?=
 =?us-ascii?Q?W5t7/gnJXaLxowHL9KaqNVDYetGOLmmXojcTTYu3+wt01gLdP7UeS0zX9riz?=
 =?us-ascii?Q?LL8VBGAPDh6CYflupYR02nSdVlDZiG/qKio2QLuHkEPDwaoUrRf8rjKc2i5j?=
 =?us-ascii?Q?YLPPY5pYs9hJkS9SoEP/PkvzYMpBriUB1D9SqsHaq9WOOGuKqw3kvIGebrwY?=
 =?us-ascii?Q?hHWDY2uPWwrM50MjSZNtFFdrxQ2SygEfOJdQCsD9uqBXzb4TgEINB7ewnMIn?=
 =?us-ascii?Q?uTF8HndMW4QMk1Wqu4fyllJlmhuOdg+u3zjmaHS6KGvaOwccQ5GvxfMd7bDh?=
 =?us-ascii?Q?d6px0pbBKBWhN/a3d+qMtMwcjnDKyLfQ8QD7g3PDGdk3NNXw9NwmX+VCF6A1?=
 =?us-ascii?Q?/kHVdvtWMke6rXAfnTZCC9GCzUuLv6rkMFVlVeLnFL9dhtXidFEs9eWujbfm?=
 =?us-ascii?Q?6tltkkFscbf0JjxPM5CY/+MOQKk3CDV1S3sJftwBZ15p4w6mrzVsN3Rrlh9P?=
 =?us-ascii?Q?s/UrR7Wm4kj3nzq7loCXQpHMdykkUZd84RChd3ygSRBuD1gPsH2i+RLAgGUn?=
 =?us-ascii?Q?OYtbTcCV9C1XaFPoqvB5EBTjZoN8R+JD7ftMHb3VD68IALnvtN/RvyX5+p3J?=
 =?us-ascii?Q?PoFd6iikjk+g5xj4P62LfNeDM8tSw1TS9VMLop59ipkOlHNSKe7of+RoG9h7?=
 =?us-ascii?Q?rMeKshlRiwPRa/D87n+tnQTCsBxFh9hjU0F+o9JMi0Hk4q+Pydu48bmOZskY?=
 =?us-ascii?Q?/L0WQasFnSrJ4SH0frA4A3gpnaVxBderpkmpUwLS3ZI/uTj+7T+tYkijBefW?=
 =?us-ascii?Q?UKR0UdDraS5u163tu1dK59aefZhAFoFsGXmxVNXP9umxZa806duRg3+b7uKp?=
 =?us-ascii?Q?wEX/QQxRb6/7yD+e6eOq009lFNw4QyYP2aEDubzjJX6bGZd8+xFXlmfCM7OT?=
 =?us-ascii?Q?QjAtt99pO29igeD2j1yEOas=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7340e942-556a-47b5-9791-08dc70825d96
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 23:47:19.9218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ILGyziDlxgZLfyjBMPPdKLGeeqfUJdunVk+p6pdk62UlHcivtcuf54QxneYrFhpQBS7qmCAvWqHG757Zd51kcJyCZUTE6jlaSKYdvScsfxFD32PTmumfyqYTFUQh91ib
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6477


Hi Dan

> > >     1201         struct device_node *ep0 = port_to_endpoint(port0);
> > >     1202         struct device_node *ep1 = port_to_endpoint(port1);
> > >     1203         struct device_node *codec0 = of_graph_get_remote_port(ep0);
> > >     1204         struct device_node *codec1 = of_graph_get_remote_port(ep1);
> > >     1205 
> > > --> 1206         of_node_get(lnk);
> > > 
> > > So this of_node_get() undoes the put.  But if the reference count
> > > dropped to zero then this would be a use afer free.
> > 
> > Thank you for pointing it.
> > 
> > This "lnk" is used as "port0", and of_node_get(lnk) was for it,
> > but this function doesn't call of_node_put(port0).
> > So yes, indeed this of_node_get() is not needed.
> > Let's remove it. 
> 
> No no... of_get_next_child() will drop the reference.  It is needed.
> The point is we should take the reference first before calling
> of_get_next_child().
> 
> Maybe something like this:
> 
> 	struct device_node *port1 = of_get_next_child(ports, of_node_get(lnk));

Oops, oh yes. It need to keep reference.
Thank you for your help, again. I will post fixup patch.


Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto
