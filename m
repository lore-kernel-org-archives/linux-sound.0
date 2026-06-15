Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783F72F7F0F
	for <linux-sound@vger.kernel.org>; Mon, 15 Jun 2026 05:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781500687; cv=pass; b=QgUjw2Yn5CzaZy/CFWF4VtCjG2Gs+iEImFG1KBHlew5iliHHJiWN2nc+qUEnnT/gZYQAJMn4SZwJXeYyW96MwKQpt8+G1Fi54rl6Eg16iMTZgvVZCNr6zYpsjJ5aKvOY9342pJf0PtRVyCx7D393+5cFVoUm2OKP3iyHdW6qbcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781500687; c=relaxed/simple;
	bh=Q5OPxhP+CspScS1nLYEDe5+mVuYgOaCZiuJROYkIGgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQZeRnf4985mKJ6gxpkAWr2NK8VCUzdU3cq6WNeoajZ/YCuaFC/TIHYpFDwa2QH/dmeiwqOS4upZt8oAfhkJ7FeWLJZ6cmz8d2Y3RjTCQPSU2ZEAG/915MBsOBq07xU6pE4G7vaRsOsFtoK66ti2QytxIXWdl9ah6lINTIIqTlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gI8aEOLD; arc=pass smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gI8aEOLD"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c85a2c012e5so816737a12.1
        for <linux-sound@vger.kernel.org>; Sun, 14 Jun 2026 22:18:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781500686; cv=none;
        d=google.com; s=arc-20240605;
        b=ItLZHG1dGGYU4WgopojBShySZYaKJqO6Py7tcIEEP9YbOmmlA1nacoVY2IpP0a6zIA
         JpVz5KKz4sowKM1tfAePVuWR3A/CH23DLagxqsd9EvqE4My+xGjeTj+EQbRB93Q3PAQg
         2UBpfzVZAs0XZLLgdLEvW97dW9GegNg5lYG5H/+ekmihrks5+AKSPecS9O3/2XAzCl95
         2vHghV4l/QRb+UjMWwsS8L/KL6kU5I7QS7Lc0lPt3KfmWwuqox7pi01jvPQDfFDV8i26
         6+34fUpR7fYhPbfa4LyUI1G7LS1rXFkgwqeDSxdKIDBE4xrqzFB22v0QT4+TDmJs9dSv
         ILVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=u5Z+dpuey7Egy9wZLQhya1KqlCVIFqeHwt0VDEyuTm4=;
        fh=8vEGfWnm6rNtMv/Ku8Fw/ZNSX91VUKCSp2mL88lWpIE=;
        b=lWavoaDt34VXPwBS8vQWcYZ3EXtgQ3eMa71LSluLbeb19FfyfxJ1K97wM/ROCZWK2c
         1b31dzuoKwUJsZNgP5AbIn7AUvC5Dsc/ZRtfI1395QPwlSzfiSkPYqj90Wcjmqh979js
         lxUd5+0oGQjgCpchvBIenWGcvY20bKrZrxXe9Z/tY0BVqx5csUuUDs9hpZKitdOisp+o
         vSC6v/+MXPgPuCpGBC5gKaEZbIHs/V5x6oi9huNfr5gen9R+6VpQUAmelij9fF5aZ4tW
         VvocLseWorA293DCSIxs/Ku+g5zzIMSf0FWb07NVYbssq6v33jRGIaqE5Lhqm721FTaF
         yXHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781500686; x=1782105486; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5Z+dpuey7Egy9wZLQhya1KqlCVIFqeHwt0VDEyuTm4=;
        b=gI8aEOLDJHxr3vddWqxcSkPia4NVb0rgcMWjJckcfXgs9JMMdHuRPmGgdgXgcE+gEM
         fSOCjCnAZlp4chumWjLUpFFkPcmhvU5Dm6y9YH0heT1nAZb1D51RZfWQHDopB5T4XDF/
         EjdZYc5kP/9xfRpZNxAOvLpPCUwpSI+yS4uFPxIVBTsLlSeugQl1ILJnsJNG9/+kr4jL
         MMBgdTch0V/RKzed82CLFeG+DAjDaKsc8m6QYIwiJ/e4XWYsIQ8dbmTt86ddQVJipFsz
         ZMtoqzab4YL3pBTbtUWDz/dNuY15NJIXRfo4tUaGbwma5NjC3g9bS5lfxNaUIGCAS4IK
         RoYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781500686; x=1782105486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u5Z+dpuey7Egy9wZLQhya1KqlCVIFqeHwt0VDEyuTm4=;
        b=PSiHNUHQkn/Bd2uRxFD78evShTTb8qlcmNX4ZbLHkwuOPDQEFHx0ZCoLXXPAN90nVn
         H3XBYF+VVfrvIQCcVjpOuk0XKZoVCkTvQzuTLAcfj/h3EpyexiiC4AKrq/UOXhWR5u41
         bbc8xWyy6p4/sof7jag5N+VKZEBkqS4S1EJR/b9tuUMolo3pr3I++J4T1dVYAOUXxFzr
         fo6e5ehXMlXcGseFS9LdSzgYQhPAmMwRLbrgTasylzRJw6oDA5XAjCcNaq06r5CnBh7g
         t7ReP0vSz0f/Uw4pSmuWvAwVbfpz08lUzJWCIzsluzbYp5Z8uphpEhez0ToQEKKeO9Mk
         qOQQ==
X-Forwarded-Encrypted: i=1; AFNElJ9nnO5kZAaqEWkdUPPdSQloDw6KUe0TpuFYXOB8sz72n38dWSTKp00PYv+36tm84U5B71QZWVoHBey0iQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpvri6yZyAP3R3vMK511kxUAcmdWZZU1+/4/qQDMChdtv/Z+vm
	RSzpJa2lcAOm7ib12oeURSbghQPeJVEas9Q+6PSHCxhNktHQmbTCWhlzdoWzTNZWl2NtYcbbIEA
	RLQ1DNSNJlMguH7faOQhVb9Tkf5+AH6s=
X-Gm-Gg: Acq92OGPF9TryLMCGXSqF73p3A6UC0XrgtjrDPPrXZsi3PpXvEQ3W5umgKGoXpASnuN
	PMgRE8goknxwz4lE4eKU3eRkGaEjxa0+1Ar+8n2+g2kv+XnHjeHBhHHTWpl3Gtb4YIIbWgArHfl
	DjiOROZBmfFkqgNw4uTqu9F31fc6VaDWVcz+b5o5W6jENZy8J+TqQHxNlrI5o2nKlLD1zFOqKEX
	suMiR2+OCGvlWSkHsQVEVOERE1XuyT3hRFbvby1zF6+zTKLb+PVx0wjvx9C4/LnKqWXuiWnaLNY
	xEt0ZMMC8yjFajiORwk6TzvLt6OYQ+dfeOB97g==
X-Received: by 2002:a05:6a20:d43:b0:3b2:a8cd:ef4e with SMTP id
 adf61e73a8af0-3b783f23b40mr15009348637.28.1781500685831; Sun, 14 Jun 2026
 22:18:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260609113836.45079-1-phucduc.bui@gmail.com> <20260609113836.45079-3-phucduc.bui@gmail.com>
 <CAMuHMdXku0BVRgwWWv1vNccKpRbvTu+1b0TjYacNJH94XBDOGg@mail.gmail.com>
 <CAABR9nHFHWFeEaaYE6X9fqt_Zb-3pF=jJbHQpsiBTgkS5LyTLQ@mail.gmail.com>
 <CAMuHMdWsLeEzjCPHEa=nY-kC0n34RHL3kUMW30vneUajCWwTRg@mail.gmail.com>
 <CAABR9nG2kHH3=gkd0H+vhGZJtvkHLA7YMpoWt+p+XtdNV+oe=A@mail.gmail.com>
 <CAMuHMdVQhVQvvnh-aJxw64_h6jOcfaQFk6_Sez-T9aNV30DfRA@mail.gmail.com>
 <CAABR9nFoLrYTUqRr0__n33EZ9Y+YfM=RxAMsx2EFnDWxHa4k3g@mail.gmail.com>
 <CAABR9nHtihP+JW1WcaKpw8470Y25LvZgzNqSZaU09u9F=2K5Ww@mail.gmail.com> <CAABR9nEgE=jGTSS7snPxyRDgRj6qiFDDkbm0MBM40RpLy_nESQ@mail.gmail.com>
In-Reply-To: <CAABR9nEgE=jGTSS7snPxyRDgRj6qiFDDkbm0MBM40RpLy_nESQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 15 Jun 2026 12:17:54 +0700
X-Gm-Features: AVVi8Cfvt5cdb-6_WYt2gRmdURKt0pynWpaJM-czjNHwMc5_DptuTE2uMt0yVH0
Message-ID: <CAABR9nFUGY78TxN6yT92a=h+Xe3QQFTKqk0-LFzNExqGOOKK3w@mail.gmail.com>
Subject: Re: [PATCH v6 02/11] ARM: dts: renesas: r8a7740: Add clocks for FSI
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-sound@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Dear all,

Sorry for sending two additional emails regarding FSIA. They were not
in HTML format and therefore were rejected by the mailing list.
To avoid further confusion, I would like to summarize my findings here
and also include some additional observations regarding FSIB.

1. Regarding FSIA

The 12.288 MHz oscillator (OSC X8) only provides a reference/system
clock and does not by itself determine whether the FSI operates in
Master or Slave mode.
The Master/Slave relationship is determined by which device drives the
BCLK and LRCLK signals. Therefore, assuming that the current MCLK
source remains valid,
switching the FSI to Master mode would primarily require rerouting
BCLK and LRCLK, together with the corresponding software configuration
changes.
Alternatively, the codec MCLK could also be sourced directly from the
FSI MCLK output by rerouting the MCLK connection.
In that configuration, the FSI would provide all audio clocks (MCLK,
BCLK, and LRCLK) and operate as the clock master.

2. Regarding FSIB

I could not find any FSIB-related connections in the available
Armadillo board schematic. The schematic only shows FSIA.
Therefore, there appear to be two possible explanations:

 1. The available hardware design documentation is incomplete, or

 2. The connection between FSIB and HDMI is implemented internally
inside the SoC,
    so the FSIB signals are not exposed in the board schematic.

Personally, I believe the second explanation is more likely.
At present, the only signal related to FSIB that I can identify in the
schematic is FSIACK, which is shared between FSIA and FSIB.
I cannot find any of the other FSIB signals. In addition, after
tracing the Linux 4.2 source code, I found that for the FSIB-to-HDMI
path,
only one FSIB-related pin is configured:  ' fsib_mclk_in '
Furthermore, when the audio stream is started and the clock rate is
configured, the driver calls: fsi_clk_set_rate_cpg() rather than
the external clock configuration function (fsi_clk_set_rate_external()).

At the moment, I have not investigated the HDMI subsystem in depth,
and I do not know how the internal connection between HDMI
and FSIB is implemented inside the SoC. In addition, the original HDMI
driver source code has already been removed, so HDMI is not supported.
Currently, FSIB is not ready for testing on the current kernel.
As I also mentioned in the cover letter:
>   - FSI master mode is currently compile-tested only. Full verification
>     requires a dedicated HDMI driver (FSIB) or hardware modifications
>     (resoldering board resistors) (FSIA).


3. Regarding Geert's question

> I have one more general question.
> arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts configures
> audio for FSI (fsia_pins), but does not fill in a clock-frequency
> in fsiack_clk.  Instead, it fills in 12.288 MHz in fsibck_clk, while
> the schematics call it FSIACK.
> Apparently the FSIACK pin is shared with FSIBCK on R-Mobile A1, so
> which function is used depends on pin control.  However, the DTS does
> not perform any pin configuration for this pin?
>

Based on the current schematic and source code analysis, I think that
if we continue to support FSIB for this use case,
the DTS should explicitly configure the FSIB clock and pinmux, for example:

&fsibck_clk {
        clock-frequency = <12288000>;
};

fsia_pins: sounda {
        groups = "fsia_sclk_in",
                 "fsia_mclk_out",
                 "fsia_data_in_1",
                 "fsia_data_out_0";
        function = "fsia";
};

+ fsib_pins: soundb {
+       groups = "fsib_mclk_in";
+       function = "fsib";
+ };

This configuration appears to match the current resistor population
shown in the schematic:
FSIA operates in Slave mode & FSIB operates in Master mode.
However, this conclusion is based only on the currently available
schematic and source code analysis.
Additional hardware documentation would be helpful to better
understand the internal HDMI/FSIB clock architecture and to confirm
this assumption.

Best regards,
Phuc
