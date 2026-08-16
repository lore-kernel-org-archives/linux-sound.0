Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AD842050;
	Sun, 16 Aug 2026 21:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786915468; cv=none; b=LH6mWLvq6JBmpvpPgZcICUd5tKpT3OSM2xgUEfOLX8ye7+eQH53oiB8eqDknlzMRx5nWIQkTUHMhK/O5ibPOAPZTIeweaLJpwDmAI+4+jC2gQifN/NRlCKD914qSntbmPQHBLhiOsH5nWKMJkrwkt8HAqkMrXMkjlbLBos0t9Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786915468; c=relaxed/simple;
	bh=jvoYVYzSevCsxiBluPnTYojZ4RjT2ZxyevdnFwun0EE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ado60NO4fi/0Rdk+l3BfuZ0IuKD7/Q1PUK0LViZfZi8anBi+BafAzI5VlEVA946Vpp01uhIRJzx+4PfooyWNm5Q37W9w/2ZzDi94sKwUhzlgiR4dOChmosNVf9TxI7iTrIjDTMbxVRKTNOkSFWk0OeZIPc5zB411nc3g/8r6mLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=HsA061lQ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RGbgsIZn; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="HsA061lQ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RGbgsIZn"
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id EDDBE14000A2;
	Sun, 16 Aug 2026 17:24:24 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Sun, 16 Aug 2026 17:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1786915464;
	 x=1787001864; bh=Ywd7vf3zmq53f7VKtBzhT8Nok43bTTE9J16zrenrNOc=; b=
	HsA061lQxAbQjxv0rnjU4sNizkQHxY2HS3SCocoKX2VISw6IThGg0ik2kbV85dks
	tqVz/tFiDWtwjsdpN7mUpoQqZg+rk0AJjdNc7zhTAdFesiyvm9UeIQ9xy24sKDzN
	UxlkodySmY/cArYIx9PMMC6CKAxRdo2IdXHNhEnzXk5bdzCGBTwrekRgcqTv0PUR
	1IHsJZhwG99FkS/EJs3OtVEJ4OhjTxeiv6WUHE+MBu0I/Qd6CvrdNr/LOb4p/yEc
	VGzlyvHEy6/368mD6U9t45v0V46DF2Of0NCiYh4Ceu4OPtZ6umX9+lhOia5+a5j3
	/WklV8xoaLFu092is/SseA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1786915464; x=
	1787001864; bh=Ywd7vf3zmq53f7VKtBzhT8Nok43bTTE9J16zrenrNOc=; b=R
	GbgsIZnsfMq2TcfkqiPLIwAG2LXwLD5YJj2RkGDreHM0sbsW/PeFvAduerAsZnrT
	6q5vAD7dNFnHl1e6N6zuDxD/LUI6DzY3oQZxl4oVWh5Iso6HQSERCpiJGH2BIRYY
	3ul1LK9TnOzWrEJEOiQ+1oXAPYMwOrt0Ri8vTwjK2kG8246ZlROGxu7MM4D2/8wl
	0WXDVi8Gu5IUzz4YamfeO7YzYmI0OaV5V5zal/PEWiaH2yD1KgGK6MnBQ18mq11O
	urtzhI5Igcg3bg10NhRUmhOy+nJ4VHntdmGLq/6udvj9JkueGDyOd051HarUtIkv
	gclQef1rgDm6pwhfQudXQ==
X-ME-Sender: <xms:gyqCapuTvYE_B4fGO2UH_KDE6XKUf2LRZyp3OI2bXmfYLxwxEJRhbA>
    <xme:gyqCatTux-hOys91vCo6o2whtGiuM32C-_MJuJtdn-3siivOf5q3F1VTatBUlx-Ej
    gFRrYZKDJSBS9T1usy_r8hsp0mlCgL7Ap6nkWE_bTokXdr3T6CwbvDB>
X-ME-Proxy-Cause: dmFkZTF6QY55G4g14ANWhl7MbJOF+fKLbw3DL/YT63iMShU+zImZ1pH6hy5OKkeWcKD8JT
    +7kzpbwfO4hdc7X7I1y7GaAEdBvE+T+ikTrbgNXkmNnGYTxBLnf89ZYIy7xZcDWkKUmTic
    R/92RTQfYmg2M//l8Ndb4n9qirN5qaFA3NGV1Ry/kj7RUPffLQiq94Pq99uvxGK0f3TwRi
    12B71OnB6keO5lxpc1tt6JkrgQGg6i67euChMbN8j1eOQozLVjjdW8wGzd/cNiXaHCCiUr
    OOY//3z0uRGol8q/vzllYGiOXbwCxCUfiFwc8F96LifI9je7XfBsIupRJ+KFWpHr9j2gBu
    OWH533kYz8n87kvuvuaCR6d4rJYeWQZwv22ZqgDZrFP9B40wpdDYFUvuU+B0k5Lf3rBcxz
    UCnllQoPVRjezJCVND/fAtDK8C0r/PhGQfXHezGv5TpD0iQ71JuTYVeuVqH6ktYw5kScd3
    qqVFxAN2uhNES5wDoO82t52AIoZG2wFCPREB3JPbL+gR470rM5pijsrISVTAzqJJ3+43cx
    9LeNLuwcIx+poQPT0t+63VSotM+BC56EoP0DpKSvzqKXfoqJHAJx3wMP5X2O/iEllu/sEO
    CjDww+fgzud5fkMw/5VtczsIzQmE0YI1S5ix3zbAaowbbyqD5LK9jTuJiv3Q
X-ME-Proxy: <xmx:hSqCat7CCjxxwKhaUBnPqAkj_YMqfnaEJvAITlvWf9chQUdEYrpdEg>
    <xmx:hSqCaoTVEPhnUH0YMhVqAPXiZGk6-XtaoTXKFXncV8EvW04UbGog2w>
    <xmx:hSqCat-RIc9JNS61rY_8Jgs8zampg4w1J2G7K06wfDEzQ9j5AxLmvA>
    <xmx:hSqCahY4aL_G7v0qXt1n3AMz-HtYXpCp3TnmInMYnT7IX841JC0fEQ>
    <xmx:iCqCaiWQ5-63VwfqDYSk_IpdIAa5M8hJ7sJ2YXipiiv_-dXN-dAxyxDH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5657432A006E; Sun, 16 Aug 2026 17:24:19 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AvTxz6OVA1LF
Date: Sun, 16 Aug 2026 23:23:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rosen Penev" <rosenp@gmail.com>, "Julian Braha" <julianbraha@gmail.com>
Cc: lgirdwood@gmail.com, "Mark Brown" <broonie@kernel.org>,
 "Jaroslav Kysela" <perex@perex.cz>, tiwai@suse.com, chancel.liu@nxp.com,
 jonsmirl@gmail.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <d5dbe8cf-1e60-494b-a9fc-fc1ad5f6924e@app.fastmail.com>
In-Reply-To: 
 <CAKxU2N9mD7tLH2j7p-mV4B4eGcfVP2g52DZViMGELp0ds3VBBA@mail.gmail.com>
References: <20260802144855.3596995-1-julianbraha@gmail.com>
 <CAKxU2N9HkStUEo+iTa6xc2BJGe6KE==vARDdHPEhRH9yKOMLuw@mail.gmail.com>
 <999edd39-43d0-4973-96ce-a205283277ff@gmail.com>
 <CAKxU2N9mD7tLH2j7p-mV4B4eGcfVP2g52DZViMGELp0ds3VBBA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fix unmet dependencies on PPC_BESTCOMM and SND_SOC_AC97_BUS
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 16, 2026, at 23:11, Rosen Penev wrote:
> On Sat, Aug 15, 2026 at 5:01=E2=80=AFPM Julian Braha <julianbraha@gmai=
l.com> wrote:
>
> --- a/sound/soc/fsl/efika-audio-fabric.c
> +++ b/sound/soc/fsl/efika-audio-fabric.c
> @@ -22,8 +22,6 @@
>  #include <sound/initval.h>
>  #include <sound/soc.h>
>
> -#include "mpc5200_dma.h"
> -
>  #define DRV_NAME "efika-audio-fabric"
>
>  SND_SOC_DAILINK_DEFS(analog,
>
> compiles. That header indeed references bestcom stuff, but I don't see
> the driver doing so.

CONFIG_SND_MPC52xx_DMA is a hidden symbol that gets selected by the
drivers that use it (SND_SOC_MPC5200_I2S and SND_SOC_MPC5200_AC97).

SND_MPC52xx_SOC_EFIKA and SND_MPC52xx_SOC_PCM030 in turn select
SND_SOC_MPC5200_AC97, but that could probably be turned into
'depends on' since  SND_SOC_MPC5200_AC97 is a user visible
symbol.

     Arnd
