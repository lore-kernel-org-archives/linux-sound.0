Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E407435EF0
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510607; cv=none; b=Z8XWzSbhRaJX9myKIiZsnwTWZpDvzs5rBGEBXmNT80nItL2iYrTLmdhLOImEZjGymrNRIJMOpeSF6Qf2+fDz4syXvVZbMjOtGKHCPCAq2xVEK84J1pr4HjjDQRIZxs4+/LeoPl3yI9Zi+Jn5Iw7Xo5kAEaSdng6cwmvsj0MEbIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510607; c=relaxed/simple;
	bh=xyVPcixK8CyBgubuOnyyyg+tJD7huzpVRaenw0cfKgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fWbF5UjVqtcBcrznOID4YOoPF1mp2Y+EuG5RF1zu2R4BG2tLjc0TC4E1/wndmByTiLlXvJo6IlIVJ6q59mg34q5k3B4otBvcYdhkliiRbeDdLHD62AzABtNo97E/iGU0iYUCQ/NJhYR23TrpOhw+oWSg3yUFFvSsh7+mV6dotcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=NHqPEap6; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="NHqPEap6"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 02594BC18F
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 18:02:05 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id 1E9CCBC21B
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 18:02:04 +0300 (EEST)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 4E8A71FC3DB
	for <linux-sound@vger.kernel.org>; Fri, 31 Jul 2026 18:02:03 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1785510123;
	bh=ePvk27fVH5gnk1U/qffqjJXuAVgPm3oKmSjpGmvgVkg=;
	h=Received:From:Subject:To;
	b=NHqPEap6AMcPRtoMmjdvxZhygDSwPxxs7dG/KGAg10gCgQWVJO9KKQ2lwNH31kN/8
	 FZbMQBmOuni68tGf7A5LY01y+2hRComy3oTWMbl3AICMZHWLToy+gdARe7RLi9XXnE
	 y01rp2F8bN31M0NE/VaBd3FmY7vwYtY7/bGnrJx9x9Sa5zKCgl+BXDbzoMGe0OeAN2
	 B9Smn06ZKyCDKPpR2XX2Ji7k3EzDFfh+WZ7DmARFRZDCeRJTeCUSoXJlcet7+pwxmj
	 zYgmOyzC2EBcm3JkKeOvIflEMHE3y8uX7Jhq+tioHcmQ92vSCVWKj94mcGdxm07FVx
	 4d0vXBSpnSazw==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.214.175) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pl1-f175.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2cab973140bso12736725ad.3
        for <linux-sound@vger.kernel.org>;
 Fri, 31 Jul 2026 08:02:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AHgh+RpgPWpv3tZzij3J1vzK+rGzojh2BJvQS7KN5v2mIDTAAEgtbuwVoFBu66ABF6VlIzcVZxjiX+yLY5fj5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YzMahSqQlt50RcpzDYORZiAvAp2NpSQhst3NJ+J6epDrxIeNjlr
	fULTLsMNix2ikNF0Ey76NIo88hPw1R+irmFB4BFss48EnZpjYNy33cpEw3qabF6qYdy/amZRKEE
	xBj7/Sv02Y1MEtyKak1evcjNHUyZLKU4=
X-Received: by 2002:a17:903:120d:b0:2cc:e620:e307 with SMTP id
 d9443c01a7336-2d0521e9225mr3058145ad.20.1785510121770; Fri, 31 Jul 2026
 08:02:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731031253.38976-1-faxuser@proton.me>
In-Reply-To: <20260731031253.38976-1-faxuser@proton.me>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 31 Jul 2026 17:01:50 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwGXLu8qWQw8MwMFQ=jiWfRJX6Xs0=4mMOwH2cPJHnjigA@mail.gmail.com>
X-Gm-Features: AUfX_mx2vqsn5NcZWGzy009LoyP1VCZRVdYfWu1zoK5LEMVURGhB1sIqOAJykrw
Message-ID: 
 <CAGwozwGXLu8qWQw8MwMFQ=jiWfRJX6Xs0=4mMOwH2cPJHnjigA@mail.gmail.com>
Subject: Re: [PATCH v4] ALSA: usb-audio: Add quirk for Logitech PRO X 2
 LIGHTSPEED
To: Brian van den Berg <faxuser@proton.me>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <178551012361.3382589.13969925837828879254@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.5 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 31 Jul 2026 at 05:13, Brian van den Berg <faxuser@proton.me> wrote:
>
> The UAC mixer of Logitech PRO X 2 LIGHTSPEED works fine except that its
> volume GET_CUR method returns sticky values.
>
> Since commit 86aa1ea1f15c
> ("ALSA: usb-audio: Do not expose sticky mixers"), the sticky check
> considers the mixer to be sticky and unnecessarily disables the mixer.
>
> Add QUIRK_FLAG_MIXER_GET_CUR_BROKEN for Logitech PRO X 2 LIGHTSPEED
> (046d:0af7) to address this.
>
> Compiled and tested on 7.2-rc5

There is a first time for everything. Happy to have helped with your
first submission. The description still seems a bit vague to me as I
do not have the mixer. Maybe there is a better way to phrase it. But I
will leave this up to Takashi and Jaroslav. Hopefully next time you
get most things right on the V1 ;)

Reviewed-by: Antheas Kapenekakis <lkml@antheas.dev>

> Signed-off-by: Brian van den Berg <faxuser@proton.me>
> ---
> Output with quirk enabled:
>
>   usb 3-2.1: New USB device found, idVendor=046d, idProduct=0af7, bcdDevice= 1.00
>   usb 3-2.1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
>   usb 3-2.1: Product: PRO X 2 LIGHTSPEED
>   usb 3-2.1: Manufacturer: Logitech
>   usb 3-2.1: SerialNumber: 0000000000000000
>   input: Logitech PRO X 2 LIGHTSPEED Consumer Control as /devices/pci0000:00/0000:00:08.1/0000:07:00.4/usb3/3-2/3-2.1/3-2.1:1.3/0003:046D:0AF7.0003/input/input6
>   input: Logitech PRO X 2 LIGHTSPEED as /devices/pci0000:00/0000:00:08.1/0000:07:00.4/usb3/3-2/3-2.1/3-2.1:1.3/0003:046D:0AF7.0003/input/input7
>   input: Logitech PRO X 2 LIGHTSPEED as /devices/pci0000:00/0000:00:08.1/0000:07:00.4/usb3/3-2/3-2.1/3-2.1:1.3/0003:046D:0AF7.0003/input/input8
>   usb 3-2.1: 2:0: broken mixer GET_CUR (-18944/0/256 => -2662)
>   usb 3-2.1: 6:0: broken mixer GET_CUR (-18944/0/256 => 0)
>
> Changes in v2:
> - Commmit message missed the version I compiled and tested it on.
> - I forgot to add v2 to the patch.
> Changes in v3:
> - I included the wrong patchfile in which I forgot a comma.
> I did compile the correct fix but just to be sure I recompiled
> and tested the change again.
> Changes in v4:
> I don't know how that file deletion was added to the patch.
> I removed it, recompiled and tested again.
> Hopefully this is okay now.
> ---
>  sound/usb/quirks.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
> index 0de7c9d94259..3bd66094863d 100644
> --- a/sound/usb/quirks.c
> +++ b/sound/usb/quirks.c
> @@ -2251,6 +2251,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
>         DEVICE_FLG(0x046d, 0x0a8f, /* Logitech H390 headset */
>                    QUIRK_FLAG_CTL_MSG_DELAY_1M |
>                    QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
> +       DEVICE_FLG(0x046d, 0x0af7, /* Logitech PRO X 2 LIGHTSPEED */
> +                  QUIRK_FLAG_MIXER_GET_CUR_BROKEN),
>         DEVICE_FLG(0x0499, 0x1506, /* Yamaha THR5 */
>                    QUIRK_FLAG_GENERIC_IMPLICIT_FB),
>         DEVICE_FLG(0x0499, 0x1509, /* Steinberg UR22 */
>
> base-commit: f5098b6bae761e346ebcd9da7f95622c04733cff
> --
> 2.55.0
>
>
>

