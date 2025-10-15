Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C78313260
	for <linux-sound@vger.kernel.org>; Wed, 15 Oct 2025 06:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760511021; cv=none; b=OJV7EWsjtPF7HpGMsZYWzExZGw+ScgpapciGFSEMliVJMHex6ZykRGJOGi2Go5UFD4gLVAPXx8ZrCa9yvtMgj7GMOcVk16GTOwDPr3Za4fRgPRxXlxi/CCTTm2LmXJ5ykY/IrjIytnUSySbBrST5JkzWBZd2pb98ES+YwNM+6fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760511021; c=relaxed/simple;
	bh=b/ZmBA9vQFyoE864lb9qBg9zWcvecKvXW/0DQggOaWU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APdeBU/BU8q65gwm36tM4e4a1fazJMOLQj9F70gXM+KA3VBECtvWgCPuTbxhBrhtoGV1Uu2sxdi0h9FkO8c4q0bwZxcAFK/kn80vARcs3GMVqdnugx6rHEmI4QwzZ98/BnaSo6lqO8gNgZYNmT8A23ki1b7xXtFufUmzwzbmKMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImnJrHEh; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImnJrHEh"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-781421f5bf5so26315147b3.3
        for <linux-sound@vger.kernel.org>; Tue, 14 Oct 2025 23:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760511018; x=1761115818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b/ZmBA9vQFyoE864lb9qBg9zWcvecKvXW/0DQggOaWU=;
        b=ImnJrHEhoh+rChBR/ARqeAkQCJx7FxG/oUt7y/6qTEZ+ACvQY8wpQQTVk9Ivaf0jY/
         ucbqbLjRt3oUQe82TspWoibPOfU9v1rZG2cTf/ECjaFPhR9jcI/ERe77WXGYnwoIsHKr
         KvQa1xW00OwXsAnTJqBQ1QLJII7sMwSj4+QZ2zCVTXB4EJVoZglEw9WLz4043OJ31eSK
         sHFpruh18ZQ5JfheKqLkZ5cciKjxo8ZUK9yNcSgDLe6jHyCiesXg9pC/Omjis6hZGq6F
         gKbfinIBbRZiHk8ePV3cRwYeyLMsrlBBa7U7htE81Stl9kI2rftaqr4Peap1mTfIPNje
         5CQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760511018; x=1761115818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b/ZmBA9vQFyoE864lb9qBg9zWcvecKvXW/0DQggOaWU=;
        b=wfr1bipxtP99lAAj5tSFE3vtDbsXFE3NjFK3kxzePKKI8v6ktqAz8mdrvQCY7GW7ZQ
         oJRwN5baHyftV0w2HBbBi8h8SDtQzx7m4msb8VhRgrYwdBLZ+vGEgo+MANOSIxogs/V1
         a94ioJMX8aeazmVpoKruPDS63kKoyDuGUJ3aFt14Nze7Do/JWGISxFk+HmcIv2F2e/nF
         IYU/1Wr4BZRf4poub+dS2nnwQhMYyodgZjLHd0wS/t+pYZuerBjEren+17aGvKPHOLfs
         jtf87VEoodErf6pJ4qS/fvO7f1/YuorSdtUu2Tov7qfbjEzzlm/PNWZmxXaDb/siaXD1
         0yCg==
X-Forwarded-Encrypted: i=1; AJvYcCVeVEJGthlVsq9YpclACk/A3hgj/oLeKvdatbURpWhyeyRYmpo/SNqEKnTCAV7J/I4fVBp9PbxFRfpohA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXgnv4YqbUSQAzZ16VlVDrs1gC6TZQgOT9o87V7tsz9rl4ERQG
	6G4gKTNEb/n2SGFu2DPqC+U6piAFnLG2LK+2ghIjS+pNNd9W8tA2P3016WQfHBwK+GbZBKxKCSL
	GCgEmA4cv6vZY++14kgG0NgdKh8Dibdo=
X-Gm-Gg: ASbGncsFGX5jjU1FcNbfdrfDZrbbGRO8UTnfAc9sxc4av+/FjPPTNkXfdMUeJDPbysR
	cCivuqSH9aALp7G7gg+jnk3b7BwrKK8mZ0pvpRjuQNR3xW9orHoyMhB9jdsOJRG9m3wAs5jwEdL
	JgQm25Dd9PHikE1fINwYGC52mCoY8RUfjUmQtKs6v8r3rgBPS+dskEyF77ohP+iKdmYzgVbIRZk
	DlYI4u2vhqeCjupMPRrnAwmm483FA==
X-Google-Smtp-Source: AGHT+IFPNwQgBvG2Jym4k/B0G+KrQt6FSH28b6hKi+XVutdrZ3bbmlMfxAKAFdUkns70IdMazIhl2B+kzxk6tv2OQ8o=
X-Received: by 2002:a05:690c:48ca:b0:781:64f:2b1d with SMTP id
 00721157ae682-781064f3469mr309374147b3.63.1760511018436; Tue, 14 Oct 2025
 23:50:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250709160434.1859-6-tiwai@suse.de> <20251014034156.4480-1-safinaskar@gmail.com>
 <875xci81dt.wl-tiwai@suse.de> <CAPnZJGDffiY-9sBTfdOYkkmjQqb79M3d8uLdyyb6eAxU8fqbuA@mail.gmail.com>
 <871pn47lw9.wl-tiwai@suse.de>
In-Reply-To: <871pn47lw9.wl-tiwai@suse.de>
From: Askar Safin <safinaskar@gmail.com>
Date: Wed, 15 Oct 2025 09:49:42 +0300
X-Gm-Features: AS18NWB4UG4JzkWf-LgevuOpXRWrqYaHmn-MyEZ2ITSOFdL1bmV2n62UlA1cib0
Message-ID: <CAPnZJGDeJsD9CHAmF1XkHctMAuXTkE3egEgyh-WWjHo6ctoygQ@mail.gmail.com>
Subject: Re: [REGRESSION][BISECTED] My audio broke (was: [PATCH 05/27] ALSA:
 hda: Move controller drivers into sound/hda/controllers directory)
To: Takashi Iwai <tiwai@suse.de>
Cc: amadeuszx.slawinski@linux.intel.com, baojun.xu@ti.com, 
	bo.liu@senarytech.com, cezary.rojewski@intel.com, 
	kai.vehmanen@linux.intel.com, kailang@realtek.com, 
	linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	rf@opensource.cirrus.com, regressions@lists.linux.dev, 
	Dell.Client.Kernel@dell.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 15, 2025 at 8:51=E2=80=AFAM Takashi Iwai <tiwai@suse.de> wrote:
> You have to enable CONFIG_SND_HDA_CODEC_ALC* config, too.

I just did another experiment. I enabled everything in "audio hd" menu
in v6.18-rc1.
And still no sound.
Kernel version is v6.18-rc1. Config is here:
https://zerobin.net/?e345ae7df1223a43#h3Dm4HiKvM3GWbTl3f8ErMAS5cm8gd3MOM/IZ=
P0Ta6w=3D

As you can see, all CONFIG_SND_HDA_CODEC_ALC* options are enabled there.

> As already mentioned, those are the new config of each Realtek codec
> driver that now became selectable individually when CONFIG_EXPERT=3Dy
> (so you say you're an expert :)

CONFIG_EXPERT is indeed set to "y". This is because this config was
generated using "localmodconfig" from Debian's config, which has CONFIG_EXP=
ERT.

--=20
Askar Safin
