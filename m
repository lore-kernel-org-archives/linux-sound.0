Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6602337BE6B
	for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 11:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781262495; cv=pass; b=sC4Nwb4LVw4Uahn1CNHdSeeItXGBBDVGQOYqFYay+p6s0ni7b2HPTdjICbxOx761j/tlOFud6Tun2V+/uCBTm85StfkzWS8xlcnGIHiWm3Lzy3iNFmhqVzlGKOo70GkFH8RiUbWlajDZnV2muQD3XQVpPeU4u3qFoM7xImwLNdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781262495; c=relaxed/simple;
	bh=46tK2SY8oxijrIbVND1wuLnWgyakUWAvGn7lOjZ9328=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9RniVoxsYoWNKqiNHCiHfkHlX7YNv7KpQr9UmkrXoVUxm/6yUEI7ovhHvnJ4oEFI17LYwf1ZFbDlQhMRgvEV0DYHseAL3pCQUcNvttbZMWR4qjZfA4/S5I44TPr2UaXINgvcYXYHaiCmsmssE2LYNLuMma+wELwx0tbris0qGA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LrVnDpn7; arc=pass smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LrVnDpn7"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8423610ec93so766673b3a.2
        for <linux-sound@vger.kernel.org>; Fri, 12 Jun 2026 04:08:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781262493; cv=none;
        d=google.com; s=arc-20240605;
        b=aylleJWE+uky2zyO5TVCaJY87qURPVG16GxVCEDsoOIJOT//QTToSGuEQcW07PRG71
         5KDqniZlpp81cBLrssT981HVHXJ99QzFbaKGuiqW8T6Pv77e3jAMeai6C6+FjjN99Bem
         1mN8VcrW4tkbxCeaWk6hjolTg/7zL3lIdgNtuNF+TNN2xyZ/PhrjXL9C3OD1bdtnF/Js
         TKna/dCHh5gAJwy3ShQZlMNJ9lk0lcO5HHrqUh4oSMpO9u/3mC6wD90zXkdw9wce4v+s
         Uza63VU8dMBetftgYC2dFfu6ANJwZ7+tvMrku1hLAMmUZ2/HnLkYuBXI1J/Pn8K9wnup
         TsIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=C8RG8wfZcQWUkvU7NuWObL4uAtXpFMwBEsyZAZlGxso=;
        fh=q5i2xyiqnNPnnjY01JdyqZBAhUVpfhXBKM9WGKC/Q1g=;
        b=QKMbzHFPu04NckKEpLvLxkTs2+c/FqS+1Y41tUwssuDhkHOsShG2cuKwkDJ+TMeBwi
         pvfxnbeFnPJTvAxWCZzYBvBCw2ycRPchaPFCYH0PMGRdOgteBKbXSvWKTC+XuSIM5hNR
         6b0FBO9OQYKiYtj3BKWRucKjHW/7pWMyoVJtN8Nllx+HhXqiNHK3PndHkDDmD50XWBqK
         6tv+bzYoXDjbQ1rxdF02+BAXd14z3L+mqO3REsiSWw0chB2vykBPuM4RQ3zWRMuV0R+8
         rhkGHxjQ8zaGE/oQbjsuEOs7hWm3Or7HHfuyMjPWO85qQnSM2/7KFuj1a6coTp1F1h8Q
         rtAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781262493; x=1781867293; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C8RG8wfZcQWUkvU7NuWObL4uAtXpFMwBEsyZAZlGxso=;
        b=LrVnDpn7bA0lGrLH2SO7PGUdXWe3BMQ4RVbOBDaQgZh+k9d6A7aYAB4AIr6AGQzvY9
         0S1r91PPdcBldK4sTt1uTSyHmos83NTJucuawzTNsazAWSbYopGgsSSbz4GhajxMCtkb
         cMmEOSFuGzX0hTWKC41NlYycgVV5ZvuL1WHE/9mbAB1Xusoh/VRQGC86V7/d+gjSlnuL
         dy3Yt2pokH8DI0VRw6zE/gtWXfJw3oCZp2ptPEeJCBz4otDdC4C+1r2eLzbcbZpOweAJ
         26nIsT+F47av8PppgoTGAtv9JNzsYTdwd0o2lT4GrNKmyfGxv0nY3o2xm4aZTxmS+RcC
         sSDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781262493; x=1781867293;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8RG8wfZcQWUkvU7NuWObL4uAtXpFMwBEsyZAZlGxso=;
        b=kXIYV7ZYlJpgZbcC6n7OGsOD8paZt6E7TC/saQXXFbS2dTz+YJrehp7pK2GY2xecyW
         IKsscbHwG3Qv3HxfnXSMEuAKGRTSf5w2dDImqW5XWezpqxMBUjdrtPcVALj494pmZRdd
         6KB4b9vPnHZuRY9i4ROvjC72hjWM6YBNa018188MzI0C1vD5XkxcK0lPQtb4vgd1+Wwl
         UyEt1yxOkxxDPs3V+ykKMtM3X0tbLxsINdarlCePayjM2sKd0e4BlkPOTpQH/lxHTHLQ
         3uNkyzXVeGI/4s6i4fU06qPeOkuqQTvVIoz3gS09i+qAj6jfmAzIJaa7uhwCYI1OGtHF
         w6bA==
X-Forwarded-Encrypted: i=1; AFNElJ8MgAaucLVhfJViVlrJv7rPAAhS2OBZGHw/QNzplS5d0OuqpZyWtN1UgixEP85kgvMG1pF1tCIfQT6/UA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGNWyGCYhlm1Q0ewJ5egN3nlbzcH4vhs964jxBtD/UzHrBhcTy
	dIJLOHkdMc/WfirP+SHzvjR0NlhZnETJMI+cISgUmJiJtb5+ooOPx+7FqBVDJiUcAW+64weMk/3
	Zg7ryWoykvhTM+lQWKG50aEpeQPNp2l8=
X-Gm-Gg: Acq92OHD+2obuW9zUDHhSZcWDc/0VGa430spgjmIqIiWXS0K/JUvzhU5DlRgYxmjEaB
	pNORh6FeXLO2vwE4ajSh52lhZ1eLqmsVgKrmKVXAjskSMUpb+LmB2OrDFRSgnFFWJL8xbB7mRBp
	H6XVlSTTbEJY0Uap/SVeYdjwHyWb4qCx/DpFVCsjI2+036Aa+oFsI7J7SyglG0Q7swsUilpUtaQ
	5L4lcwMPMh/pe4BGOWWvOOyHsvazfO0C4oxMSSIpObTv0eQb7ODBsb/4g8evAeeGYzOM/1cvQiM
	tgi8mwviAiqrFGz4fM8fWUILQio4i9ePTwYq5w==
X-Received: by 2002:a05:6a00:805:b0:842:3be7:4d54 with SMTP id
 d2e1a72fcca58-8434cc0b564mr2663158b3a.15.1781262492776; Fri, 12 Jun 2026
 04:08:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
In-Reply-To: <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 12 Jun 2026 18:08:01 +0700
X-Gm-Features: AVVi8CfMXSYu3RrDvNLF_rgtRUBfjvN1-IvBNNlzLi33SiKq9QBt8Ro97SYOt1A
Message-ID: <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Geert,

> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v7.3.
>

Thank you for the review and for the Reviewed-by tag.

> I have one more general question.
> arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts configures
> audio for FSI (fsia_pins), but does not fill in a clock-frequency
> in fsiack_clk.  Instead, it fills in 12.288 MHz in fsibck_clk, while
> the schematics call it FSIACK.
> Apparently the FSIACK pin is shared with FSIBCK on R-Mobile A1, so
> which function is used depends on pin control.  However, the DTS does
> not perform any pin configuration for this pin?
>

I checked the schematic in more detail.
On sheet 12 (FSIA section), the FSIACK signal is connected to the
WM8978 MCLK pin (pin 11).
It is also connected to the X8 oscillator output (pin 3) through R121.
By default, the board populates R120 (0 ohm), which routes the signal
to R8A7740 pin K5 (FSIAOMC).
If R120 is removed and R250 is populated instead, the signal is routed
to pin G3 (FSIACK).

From my understanding, the default resistor configuration places FSIA
in slave mode.
In this configuration, FSIA receives BCLK and LRCLK from the WM8978,
while the codec receives the 12.288 MHz MCLK from oscillator X8.

This matches the current DTS configuration:

simple-audio-card,codec {
          sound-dai = <&wm8978>;
          bitclock-master;
          frame-master;
          system-clock-frequency = <12288000>;
};

Therefore, I do not think it is necessary to provide a 12.288 MHz
frequency for fsiack_clk (xcka) in the current configuration.
If the hardware were reconfigured to operate FSIA in master mode, that
might need to be revisited.

I have considered testing the alternative resistor configuration
(removing R120 and populating R250)
to switch FSIA into master mode, but I have not done so due to the
risk of damaging the board.

As for the relationship between FSIACK and FSIBCK, I am not sure.
The schematic I have does not appear to describe FSIB at all.
The HDMI section only documents video signals and does not mention audio,
so I do not have enough information to determine whether FSIACK and
FSIBCK share the same pin on this board.

> Note that I have never tried audio on Armadillo myself.
>

You should give it a try sometime.
The audio quality of this board is actually not bad for hardware that
is more than a decade old :-)

Best regards,
Phuc
