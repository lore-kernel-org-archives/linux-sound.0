Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511123CCA19
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 11:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791371064; cv=none; b=FqCU/711heXaB7v7I/1HwOP6syP2sn0eM59hLW1PBgKj/jnNIwa4JbOKPGuVRCX9bCswuyA3f4IYsNNQacJ6KeAJNI/54Vjju24xbQcgYL7GL85tDb7RZJUzPUEc2WrJviDDPu5nN+YMtB7/VHih3taUIgyDcVzgEWZK91s289g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791371064; c=relaxed/simple;
	bh=qHQ93L30NFby/srZDdySh0m2e+fnRmBBePN03ypWWIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bk8SGMtQ7NG6wb9hwbtRP76IQ6mnm2dD4EEI8a7ETcDtayZHne6/lnI0m9fSh7Qc6KML4EQzoMw+7EPNmp5BpewYLhuPB0/P4RZ0+75MHDZjSakEUn56aIJR2wMSaqfxijOXrk5iqDdeRPH+iWrPbUsFQd3QOdO0rnLWYmJ3X0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=k+4JE8qG; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="k+4JE8qG"
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 294835E5D8
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 14:03:53 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 48D1C5E57E
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 14:03:52 +0300 (EEST)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 0FF40202BB6
	for <linux-sound@vger.kernel.org>; Wed,  7 Oct 2026 14:03:51 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1791371031;
	bh=/ORScLc1VcbIK5JR1EFjJBMDK2APU9vpafe9mtl+7XU=;
	h=Received:From:Subject:To;
	b=k+4JE8qGQghz9mcFzxqleEs8D3XOpppHS9znjxbTWKDdiilh827GA96/kst8IcmPS
	 3m5n1d/L0Uaqw5vJT8E/TpgashokoGXnGDby35JD4aGVp+RAN4Ru08iZzxEw2l3mXK
	 NX8Ev1k5cJ5FSPOmYgFhX06VKfIMCAyFPkGrk67vaTeH9bh4jm1pAJMhfMuZIEYN2l
	 gT5TI0F18/Da4d0bVzNiz7Y23X9J9Q1hgOLtlIeQrrpXIx3newv/s0qOZFmb0avZxo
	 1ByJdsEMwVbKWcxcY3ivyL2RSsa+E1VhH+AZpPiLnkhvEWUnJinGddDcPo0U7VCtLB
	 dFQTP3y7oAqsQ==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.178) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f178.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2db710396ffso10063095ad.1
        for <linux-sound@vger.kernel.org>;
 Wed, 07 Oct 2026 04:03:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBxfNWg/9r91bskSDsr5JZyLVz/8Gmxkid9vd80Z2MVm42bLj842OHgQTMxW9p1atYf6Qv19s0aOm/G/+g==@vger.kernel.org
X-Gm-Message-State: AFq9FYJH00GNpUf/1bVpuZbSOukL2D28jAgEivYbQeTN2N3AY5JQU4ts
	GOIBLHKs6naBlPEBJPNoYODJU8TDQaAVfamWtXyrsLckLmvlNetxIBI+IsRwR6nbdjSPMt9beCB
	qY+M5yMT5jKfju4XTrYGEdxULFMvJDhg=
X-Received: by 2002:a17:903:1965:b0:2e4:b6b5:b305 with SMTP id
 d9443c01a7336-2e5c4f13f83mr34551555ad.2.1791371029771; Wed, 07 Oct 2026
 04:03:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <179122226568.6.10663878730330541363.1670962442@8alias.com>
 <P3C8cUq--F-9@tutamail.com>
 <179122346529.6.9250312386131579603.1671009695@8alias.com>
In-Reply-To: <179122346529.6.9250312386131579603.1671009695@8alias.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Wed, 7 Oct 2026 13:03:37 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGQvRbwg82M4Myv4GQJhCPEhjyN__6DJ8UdMb8o0V_Zcg@mail.gmail.com>
X-Gm-Features: AclHuK-cXbFB-0vE-IM4fcBx-I70z_Em108_XAEikMcFAi55s8GX1AAXMfJVxqc
Message-ID: 
 <CAGwozwGQvRbwg82M4Myv4GQJhCPEhjyN__6DJ8UdMb8o0V_Zcg@mail.gmail.com>
Subject: Re: [RESEND] ALSA: hda/tas2781: TP3407SA evidence for the January
 custom calibration address patch
To: linux-kernel.supreme403@8alias.com
Cc: tiwai@suse.com, "Ding, Shenghao" <shenghao-ding@ti.com>, perex@perex.cz,
 baojun.xu@ti.com,
	kevin-lu@ti.com, sen@ti.com, matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PPP-Message-ID: 
 <179137103126.308119.2087054240430025412@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Mon, 5 Oct 2026 at 20:04, <linux-kernel.supreme403@8alias.com> wrote:
>
> Hi Antheas and sound/TI maintainers,
>
> Resending as plain text because LKML rejected the previous message for co=
ntaining an HTML part.
> ...
> Limits: only the primary amplifier was read on hardware, and the final re=
gister snapshot was taken idle. The listening result is subjective; there i=
s no calibrated SPL measurement or controlled same-volume A/B. Current main=
line and for-next were not built and booted as full kernels.
>
> Unlike the January Ally X test, this machine's OEM and firmware layouts d=
iffer. This report does not claim to fix the Ally X's separate symptom. Com=
mit 4fe238513407 introduced the custom-node parser with the BASIC-only assi=
gnment and appears to be the appropriate Fixes target.
>
> DSP SHA256:
>   a29f522c22cdb203eb1af84846838b5ef76c3a2c721760c7a898dd35f9ce1430
> Public firmware:
> https://gitlab.com/kernel-firmware/linux-firmware/-/raw/20260410/ti/audio=
/tas2781/TAS2XXX10A40.bin
> Original patch:
> https://lore.kernel.org/all/20260107093134.583873-1-lkml@antheas.dev/
>
> OpenAI Codex (LLM) assisted with diagnosing the quiet speakers, validatin=
g the existing patch, preparing a local reproducer and drafting this hardwa=
re report. The kernel change is your January proposal.

The Ally X had a different issue so we never merged that fix. The
commit body would need to be amended but we should be able to merge
this.

Does anyone else have any suggestions? If not I can plan to resend the
fix in a few days. I will not be able to do the testing for it (no
affected devices)

Antheas

> Assisted-by: LLM
>
> Thanks,
> assembledev
>
>

