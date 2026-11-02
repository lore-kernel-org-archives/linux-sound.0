Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.156.171.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793615057;
	b=BVGQCS5wdXbodZgEqsrEhSE2os4/dD5+nRQ/Hrobs6X/mWH0G/nanppi4UZVcWJmHS/S
	 i1s2C24bpMoEdY1Ym/VcY52KSCfOdjzdLouJ++TweK+Qd0mKTEk5iFt9Et7Qf6HzrDlXo
	 AC2vTfhwoHrhdy4YTjQ2/SfcRIRUHg0xMwBIQmvxU4q81SetE6h9IbNfJv6k3rrqFTgv4
	 NQ44s4NP4U3Db9HYX7bn6Z7UGRuZcg08Z9guH7+mwkXUhNRvbqI6hhZGlfiFpehtkJkmw
	 PSBlNq0aSXSzp/koyuSX7Tv7j7Uv5Ob73hOrkC7Lac/5F2wGF/YoKiyf7BekyB/8C9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793615057;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=ti1/rRcvOD2x5O5nJzi35aJUHDueD5KyDlDPz3RWxwA=;
	b=aiHHMWjSlyuSab7PzIK8fVLLQOZUPByspJ46DAMGuo0O8u1y8i8m5YqVTPA1taBmGWF3
	 DasHNc/UbGPJFSQqPtcyp1l8IqXqVvdwq4PgouqG80R53elwkawbVagzmiRl+Uo2itTKy
	 7KbtAbRE+9EmRgoMD+eMVeo9D03t0x3UelCImnHx7/o754FGiIXaqm1havMkvyZA96uSC
	 CiqSnMr8wGssgaLFW3gplvM05d9ouqKqQBsyNWPVit4LQB1eRuCa6FZe39zFUSgKMq/cX
	 bYLM3bRGEAcXA7lk7XnWeKlYtWWjAKnSpnwrsxwmneKiCkCqPlH+nTgPstNjLBYo6Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=gKU4TsgP;
	arc=none smtp.remote-ip=178.156.171.147
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8EA606A330
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 10:24:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B8EA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=gKU4TsgP
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 141925E5C4
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 12:24:09 +0200 (EET)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 155595E5C2
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 12:24:08 +0200 (EET)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id AB674201D4A
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 12:24:06 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793615047;
	bh=ti1/rRcvOD2x5O5nJzi35aJUHDueD5KyDlDPz3RWxwA=;
	h=Received:From:Subject:To;
	b=gKU4TsgPEhErCqNU9FJF91HRCgsJbruIjQbjfOQCUt2q7+vLtkDS7IgoZxeV8/7/v
	 ZbDAwW17Uwjmz74lTsNPoSt0gaZIglZIQTvo8+a56zGgR/si23GwjjYmrCdDE5M4cK
	 HcIHNwuMw2BTRP1pZcBoihjghMuiEz7IwgfTtw9j8eqnYP0SSbnyWLpai8/+mpS9nk
	 6pRMsUzu9lCf33cBaZENnPgEjog40M/NwXIjyBE5umxlQ3oBb3T6Fn1BW4EKm2kVCN
	 bc3o1kc8Hp6PSaKz6sNw50d3Q+SCbD/NMA3eyvzO2NlF/YQDKfs8Evq/d5SS7ATMvy
	 Q0wjUOMKOljpA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.170) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f170.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2eac4877accso9177045ad.2
        for <linux-sound@vger.kernel.org>;
 Mon, 02 Nov 2026 02:24:06 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AKwUvBzLLp7kPyL+gmj/Nc8J69uyDFI0VFbnQ+vLk/tnWUPlkKosF2h+FCCFK052F0uvQPmy/3XLCJx5dvIiQA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8wWx7vhs9Nxa615juKSaDT4GaJQhnPOqxszGVckbL+qELr84kU
	VRZCysAPlrvx80U3xg6dbDacSsSU1dKqKEfGAR4WKZ5UM9NS62EnXFwTsenkTz45pZpVfXO9yiS
	v8jtje+aZBIt61FMzZPhL1nIbv1R/ATs=
X-Received: by 2002:a17:902:e745:b0:2e9:5eee:e074 with SMTP id
 d9443c01a7336-2eb364ddce7mr84007385ad.46.1793615045027; Mon, 02 Nov 2026
 02:24:05 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <P3C8cUq--F-9@tutamail.com> <P3CEBDi--F-9@tutamail.com>
 <CAGwozwGQvRbwg82M4Myv4GQJhCPEhjyN__6DJ8UdMb8o0V_Zcg@mail.gmail.com>
 <179357183245.7.3137161079355845805.1738723974@8alias.com>
In-Reply-To: <179357183245.7.3137161079355845805.1738723974@8alias.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 2 Nov 2026 11:23:51 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwHn7QC=K_ui8YxxP1Jf7Bdn_EFkFu+x+L25P2Vs5yRiJw@mail.gmail.com>
X-Gm-Features: AclHuK8iC5QkjYV9fntN7Y8hQOvyIPvVGu9CqIOdVveRIgWMeqUYF-A6BETLyYg
Message-ID: 
 <CAGwozwHn7QC=K_ui8YxxP1Jf7Bdn_EFkFu+x+L25P2Vs5yRiJw@mail.gmail.com>
Subject: Re: [RESEND] ALSA: hda/tas2781: TP3407SA evidence for the January
 custom calibration address patch
To: linux-kernel.supreme403@8alias.com
Cc: tiwai@suse.com, "Ding, Shenghao" <shenghao-ding@ti.com>, perex@perex.cz,
 baojun.xu@ti.com,
	kevin-lu@ti.com, sen@ti.com, matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179361504700.2151144.14607848286629353723@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sun, 1 Nov 2026 at 23:23, <linux-kernel.supreme403@8alias.com> wrote:
>
>
> Hi Antheas,
>
>
> Any news on resending this patch? Is there anything you need from me before it can move forward?
>

Hi,
thanks for reminding me

I will send later today

Antheas

