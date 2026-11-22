Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795355443;
	b=HnduBpLaObUtLzct4EIKP5Yyb5jFOPTGh/kJZlrRW8Ta6ODl2XJ9MHarSWAU3ZeqQ6l/
	 s27kSlYXXVdpZ0kd4ZX4UjrUlkl9Y8GTBcC5v50DIPSD3d15F+fTi9ds+9rR2e8HTDIR0
	 SXGBTaCUNlq8tC05XGNURdOeq+zCUXLVJ76l2YrOCTteiLC3uorYNw3owwDu2C8PLS8mY
	 w4DtpEO15GX6YLJF78LH+QA14onMmDDelRoUeFtV8DayIaJN82uqKHeikrbn/eWoSMcal
	 nvgVP8uSx55c8LqP/u4Zu88aS+wgUEs+EMDSuymfr8HhpP/+yY0r/89/99ur+Y5OulA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355443;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=94MINeCWenDh9avtDcgZ8osDEvM91PXXsyg9tlMKx4g=;
	b=Vo6v5xAV4pOul4BCqlyeaKVQJfmB6qWQWvunVRdJx9BpBWSq6T4yLRUHXw7G4fWYwef+
	 a30B+YfmLPuchjkbO33Ixv7VyAO7YDxYgT5QEdtRjN2PE2Q32BjNlw20WIoXQ2eE1bPAz
	 8DAK8z5e6c2N/w9GVik28dmQlNN9G7uYTsbQuryjdMOyzHhRwV7aZqj0RgXVssbkaK0Zd
	 ksIW5W6rog8ov6UkY34IX6zkew6iYbGelh/b0b11Nd1QvfsV14desVWbjlaLDkBnXFgIT
	 QBsbupbtEuBCCb5NGQCGqiFHhcxPmMP+NPx00/1TfMYgFWqraGgkS307jsijX2fow2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nw/bNtd3";
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BE7606A680
	for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 13:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BE7606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nw/bNtd3
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1b3acec6677so3472234c88.1
        for <linux-sound@vger.kernel.org>; Sun, 22 Nov 2026 05:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795355442; x=1795960242; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=94MINeCWenDh9avtDcgZ8osDEvM91PXXsyg9tlMKx4g=;
        b=nw/bNtd3Waj8U4tOxlOlNyEaUOHeknNFRji4dHsNP9/aBIcSZoYe7jHNNkiqkEXyJH
         Whecykv+BPp+NBZkfmZ/O9lhuDo0zb7hemxhPHEu8+Cg03I7lxNuoQ+++C53x4X+pEPq
         lRLeYOn6F3mVI2Xo7HCsaNKHNU6sIUQjcU68Jdwx34/FV8RsS7+9JfTy0g2OLRh8Y5cG
         DfplYY0zQYQWoGUbU1Gxn+/Uh9O8nBNRGDEQZBn3xW6GCM5v5y/B6cYrqoeZgx4v+18T
         lHV7IcvEnYLfGRKhyJcLuoM3JRlAeiM+959SzynxkqXyoF0DsW7WicTCmsr7YuDkF6iT
         gIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795355442; x=1795960242;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=94MINeCWenDh9avtDcgZ8osDEvM91PXXsyg9tlMKx4g=;
        b=q7b15eH7wDs7yWZFS4GdX7G93/UX4F9s3Zg/xFjcdvEvg5cx90PzatuniekLB+M674
         ncTrIR5zGGdvtGck9pNnibEbAuNa2Kjt+QjfloZ/Vu9TY8AyMq6n2oL3ewoD9EN0cfY5
         szzKC1PazV16l+h+qqUIXc34Va0Up4e/B+f5WV0MrZAwuCCvUA1RpIGnMRnLOYcQoZVl
         BDf7RgAEpHBr0PFmIplZpKatoIWbt7WEAdNC1QWROx2Z991Y93oN0gjWR87bKE8SWyEF
         JKF6Yo0rk3YYwCqthbXmxqwhX+uZ4UvbvfP+YzWftuPzzDnXGGmGXwS3+vraI+3tGXKD
         h0fA==
X-Forwarded-Encrypted: i=1; AL+hErHlH6y+HRdkJkdd0+64FA2T4AusUy/C0QNP78Im46YFnDjpfEEf7gUmbhObJE/YGwQPM49ZbJ6Bzd07DA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9xa2h1UswHuIVjDS+QTCRMuSuFx6I71dX2msGJbwX+cbnblCC4
	dBtjRWFkmQeJ/D8SQtwHYViX7dcoptKPnsFJpBOv9Fxi9PmZgdee74E0
X-Gm-Gg: AZFdTZetEX+qrkOmJlxqN5JT/7GjxEf5ckGGUj4tl//qCE7If4d2lFUJdVU6PjGuiqZ
	8DGcni0zf2ropD/E8GKs3PhWtrIzzBU4ZeBO7iXhcpVlcy+DgP/oHlSrbbLTawAToWXtvO08PAs
	Y0+1RiTo3BzHwjLuStVog7goj0r/mm+ynp+9IHXL3MW53E6Y6J3NePnuuNOySX0BT22MVHVlvBz
	9PSLV+j6WzFnyIXec1i3MhOw3y2bxOG8dtvg2AmJZ3ady13nWqmalPJNxjyci15Ea2jutOSds4R
	j+Kj2lP5zWwzgPJUx/cKQbfeIXDYIFTpuZ/OxW7lvihnXRNoLRIr39+19XeairrSzxMniEVSJD3
	vrbF9tmq9PC0M6S/hymeqV+MdfG9km9bliUOnWYVgl1HyBwaC1rPGZ70iaMbKUVYP3rtOIOMrOn
	npkBMb9k9ak7usD6Xh2QIuj3xskOlBFAQ3iW5sM3+nqYwUDpYuybhE1I2gBCM3PmNG5pDPxEJDd
	PdQtL/q1xDpCZXSPy4vIuv7XcklkUCiTKb5trdhCyh8SN9f+EcqkY9DGhDHldrl5Xy2s13/PJD1
	w2SFCKwDNw7ug2HIktik5ujpt8o=
X-Received: by 2002:a05:7022:b051:20b0:185:b157:f271 with SMTP id a92af1059eb24-1b5568e30b9mr9964368c88.23.1795355442402;
        Sun, 22 Nov 2026 05:50:42 -0800 (PST)
Received: from localhost ([154.21.93.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm18999164c88.5.2026.11.22.05.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:50:41 -0800 (PST)
Date: Sun, 22 Nov 2026 21:50:38 +0800
From: Yao Yuan <yaoyuan0329os@gmail.com>
To: Arun Raghavan <arun@arunraghavan.net>, 
	Yao Yuan <yaoyuan0329os@gmail.com>
Cc: Michael <jagerkin@gmail.com>, arunr@valvesoftware.com, 
	Takashi Iwai <tiwai@suse.de>, Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
	alexander.deucher@amd.com, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH] ALSA: hda/core: Log stream DMA errors on interrupt
Message-ID: <awLx3tBrQODt9p3e@sapienza>
References: <DKT5BQW7XPHP.2KNASR1XE11UD@valvesoftware.com>
 <20261026013835.98210-1-jagerkin@gmail.com>
 <5b34b0ef-9eef-4049-a018-3e60bda634f8@app.fastmail.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b34b0ef-9eef-4049-a018-3e60bda634f8@app.fastmail.com>

On Sun, Nov 15, 2026 at 07:25:24PM -0800, Arun Raghavan wrote:
> On Sun, 25 Oct 2026, at 6:38 PM, Michael wrote:
> > On Wed Aug 19, 2026 at 11:53 AM PDT, Arun Raghavan wrote:
> >> On Wed Aug 5, 2026 at 11:30 PM PDT, Takashi Iwai wrote:
> >>> So what's the best option for users if this happens?
> >>> That is, what happens if we don't restart the stream?  Is it a
> >>> temporary fail-out and the hardware recovers / resync by itself while
> >>> streaming further?  If so and it's short, it might be better to leave
> >>> it as is.
> >>
> >> Unfortunately, there doesn't appear to be much users can do in this
> >> state. The warnings we have introduced should at least point to a cause,
> >> but the issues seem to be around GPU clocks and power management
> >
> > A data point from Intel hardware, where there are no obvious issues
> > with playback quality.
> >
> > 7.3.0 logs this continuously as soon as PipeWire opens the analog
> > playback stream:
> >
> >   snd_hda_intel 0000:00:1f.3: stream 7 dma error: 0x28
> >
> > Per include/sound/hda_register.h, 0x28 is FIFO_READY | FIFO_ERR, the
> > same bits you reported.
> >
> > The only open PCM is pcm0p (2ch, 48 kHz, period 1024, buffer 32768
> > frames), so I'm assuming that's stream 7.
> >
> > Counting the callbacks suppressed, it's something like 7-8/second.
> >
> > ThinkPad X1 Yoga 3rd gen:
> > * i7-8650U, Sunrise Point-LP HDA 8086:9d71 subsystem 17aa:2259
> > * Realtek ALC285
> > * snd_hda_intel
> > * no dGPU
>
> Hum, that's not great. I'm not aware of what the Intel hardware might be doing. Maybe Peter (cc'ed) does?

Hi,

I have same issue as Michael on Intel pantherlake device, no obvious issues with
playback quality.

Device model: Thinkpad X14 Gen1.

some info from dmesg:

[    4.355830] [    T456] snd_hda_codec_alc269 hdaudioC0D0: ALC257: picked fixup  for PCI SSID 17aa:0000
[    4.356574] [    T456] snd_hda_codec_alc269 hdaudioC0D0: autoconfig for ALC257: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:speaker
[    4.356962] [    T456] snd_hda_codec_alc269 hdaudioC0D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[    4.357355] [    T456] snd_hda_codec_alc269 hdaudioC0D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[    4.357734] [    T456] snd_hda_codec_alc269 hdaudioC0D0:    mono: mono_out=0x0
[    4.358113] [    T456] snd_hda_codec_alc269 hdaudioC0D0:    inputs:
[    4.358499] [    T456] snd_hda_codec_alc269 hdaudioC0D0:      Internal Mic=0x12
[    4.358885] [    T456] snd_hda_codec_alc269 hdaudioC0D0:      Mic=0x19

>
> -- Arun
