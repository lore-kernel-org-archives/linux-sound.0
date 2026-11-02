Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=157.180.73.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646820;
	b=5YkpPdBTXmTLhCZRJ0jsEhI7zLucqVa6DRYR31ZSSLsZvHAwKLw4MzixDvBDQvH4l1aA
	 2mgH7xYsx8sLbsaJ90vJbSdUKqXkxW9W5m+Ld1wVCHZicXbVeiyEdJfuKfQdCN4bubIRa
	 W+8PVEp3W9O6BcTexLLn2ReXEyoqqOzJ8g6HFzecUio9hiYWcWEzGRk2r9eqni1JyhLMp
	 qawjRDgNyNh4fjkxO6dSX83iwY5bwOXz9LIc7DvLKxFTjfSnLCtD6K/Zcy3QvvCWO3S7V
	 i1SCENrcdhJjYkCizbLQnWYPQNbGcf+29wou26tZrzGohJNeYV2FtHowZmPPzm8Wu3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646820;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Received-SPF:
	 Received:X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:X-PPP-Message-ID:X-PPP-Vhost:X-Virus-Scanned:
	 X-Virus-Status;
	bh=Xax+p7m5RCBebK4a1+/omYS133Ve1ycVI0ylmwVPxUE=;
	b=OcqjYPpdOcd1TMJwAZhPoOY5bhHXJnV1f89Nql/2klmHYwgCTc5XRHZoO9H9MeBV0fif
	 UbuNnLSQn+9ctZWfjd8ekVLMkFXWPtI9+SgF6wytNb3mO9X8o8SSKOgOvJZd5o5aTA6QU
	 Hvz5j3ZqeCIKqX0VPbM5nKk5mQAsSaEesJpTxFPyhQFbqzLunP64zjEXsi9Y6ksMqZsFX
	 eLXO4JBaNOHtBUv+xNtIsNq0M68E9uCbHJotGHAsHwNt2Xnqtxj1+pRsMvePxHJfcXrNX
	 6+c7m9mrVcTMgAmTK5X2aX24Nz25binQVcYXJGjyTf186zxnl16ltzXSc8k/Xp43NXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=antheas.dev;
	spf=pass smtp.mailfrom=antheas.dev;
	dkim=pass header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=nCg6wvu5;
	arc=none smtp.remote-ip=157.180.73.62
Received: from relay14.grserver.gr (relay14.grserver.gr [157.180.73.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3216E606A326
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 19:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3216E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=antheas.dev header.i=@antheas.dev header.a=rsa-sha256 header.s=default header.b=nCg6wvu5
Received: from relay14 (localhost [127.0.0.1])
	by relay14.grserver.gr (Proxmox) with ESMTP id 383453EC40
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 19:13:37 +0000 (UTC)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay14.grserver.gr (Proxmox) with ESMTPS id AAC713EC25
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 19:13:36 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id B59DC1FFF90
	for <linux-sound@vger.kernel.org>; Mon,  2 Nov 2026 21:13:34 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1793646815;
	bh=Xax+p7m5RCBebK4a1+/omYS133Ve1ycVI0ylmwVPxUE=;
	h=Received:From:Subject:To;
	b=nCg6wvu5XfspGeWNi0R2n/XyK8+Mq4HFOz5Gz+/5+k+n+a6A9di22K126QD/ROxV8
	 DdlVa4jRreR5A5Zp4EA2FdcaULkVvaCJLAAR6pzTMrOVLPyGR4rHWVksseNKX5WnW2
	 +2EApaozcuw4g2I+SuELGzMXaOcac0FuxMVMow//to1bLSlj39lKfmt8sbhngkav8j
	 pb1CuEipv3Ot/Xh117H+w0r35Wac9ZJFkbzXfJSkJmibU8tntnUraw+i2ZTDKLWonw
	 V+7LBdaLWcAqPrN9ikWURJKmCoPmkWlDDxNslBgnTc/V37jr1SDc5ileTsXT34cLRt
	 Diipqh8mepQzg==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.216.44) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pj1-f44.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-3ab60ff4273so2853720a91.0
        for <linux-sound@vger.kernel.org>;
 Mon, 02 Nov 2026 11:13:34 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AKwUvBx3l5Sh3dnDzws2hJhkWOvvM60qkAjFl61t82sBAuObyKvzJyOXwXPVOhvPHSeYojt7a0n+eybkF61/Mw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ETKsS6LDIIfZ7EeikdJPSeCcVjRd0XwDuhEHFfOUCP/GQ81HF
	RN3/jU5OO+yTBUrgri323aieuTi6QgHppVkKGNlMB5iBN9sQoZ9QG2h1cYUxWCF+qXJxtFX8WWu
	xUL3wptYdRPJS4G6/lIrmznZNpAk4B7k=
X-Received: by 2002:a17:90b:5344:b0:3ab:a3ee:33ad with SMTP id
 98e67ed59e1d1-3ae897eb378mr8757651a91.22.1793646813306; Mon, 02 Nov 2026
 11:13:33 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102174052.1216670-1-lkml@antheas.dev>
In-Reply-To: <20261102174052.1216670-1-lkml@antheas.dev>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Mon, 2 Nov 2026 20:13:22 +0100
X-Gmail-Original-Message-ID: 
 <CAGwozwEonhmmZUD1cyXu=6t6MMGyz_yOr1vPnUzhOuwZhC2NbA@mail.gmail.com>
X-Gm-Features: AclHuK-WiY0Fb4cF6nE5AJNNvIJXfCMXfWO_c3oD4hDmHpDoClAM9Qjh_kebXzU
Message-ID: 
 <CAGwozwEonhmmZUD1cyXu=6t6MMGyz_yOr1vPnUzhOuwZhC2NbA@mail.gmail.com>
Subject: Re: [PATCH v2] ALSA: hda/tas2781: Prevent throwing away custom
 calibration addresses
To: linux-kernel.supreme403@8alias.com
Cc: Shenghao Ding <shenghao-ding@ti.com>, tiwai@suse.com, perex@perex.cz,
 baojun.xu@ti.com,
	kevin-lu@ti.com, sen@ti.com, matthew.schwartz@linux.dev,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179364681535.838592.6022973979442469250@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

Apologies, I forgot to cc you.

Test and report back.

Antheas

