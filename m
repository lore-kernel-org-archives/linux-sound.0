Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795190363;
	b=s7HSmxfbpZLYGOsOLuAIEqlaD2t2oWnVje3u3aR51cIA27K1oScYTT1Hv7YyPiGezyfX
	 k6SXrZOJow5UfIjXLSaHhz+gxi3pwr0+2uPs1p+DT7O1Gu8UHwh8DkvCaiL4b28ofvNky
	 WjKLpDXkGD4Py5FqKanwPkAFG12wuJHdCuusvjqUIMNthoyp7bFF8x8mZKdDja6SE92Gq
	 ryetxjdj8SV+R2C17OFhfZxS/1kZL3rnznnxs0gPStpb01VlYvuVVraQRfAERKFfygpZK
	 HtZ9oqENa3eiDasu8BE6X1zmUNYSJhjupyQTNRoGSlLM8q7maiBW98z9gFjbS6blhtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=cwFux5qHypa1hmB1AxqIBQOqrfG5IPPYnQ1o/++TL0A=;
	b=KPkVU0RcTWS89ZdLYbyMmwjBn/6RM4eGUjccrSI77jUMY3iAHGIq8Cc5un3XsEL6WAIt
	 2ABEhv5TK2UTNbMfhAKeRXwLZ7Zs4C4kQ1pCiyyhcnUKwlpXpkykLKndOzqqAjhinz1oK
	 xLVSsJkuCnu6ZFRMIPcCfC76H0159G/IN67psDg9sDdlhWsD6wBYfpwxA2+45ol8sWKlu
	 K7eVBb57pArYsNF2q87HA0JrOzZyCtgjsNbCKs1D9+f4FWFclw0ua8TiH3CwCnzVR+Ggx
	 Y4gGAta11PdtcL0ReODc+SFLDdvpfuNcOIPIOKma9MEEUP5BZ0h5KAwb08R/nuuRjNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vN0DlqMV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6F6606A325
	for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 15:59:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A6F6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vN0DlqMV
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3acef9307c7so8611901fa.2
        for <linux-sound@vger.kernel.org>; Fri, 20 Nov 2026 07:59:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795190361; cv=none;
        d=google.com; s=arc-20260327;
        b=p5N8i2Q7miwi4gZzIMcqHy3Nd5b3PEV/2wt+g+65sTOtsxhV/pfbEM8LL7X0JTDxk/
         Q08owrxj2tMBf9zPQS4Fn/C7bVQCuc0Ccr76XDXmw80gXWtaqzokFZoAzBuwm8p86pxU
         YPMYg9AQoh2K+pd4ewhxoSl3SEdrx3RrYTWhglus8NgpyGOlQG5v7PZWogEo2wwEoDNh
         +W8iyXs+ofImijZ5ZMoMs5XxxKzqErSc520Cjiw6IR1GxfTznj9xmjw+2mBZAuKOfmv0
         Kjcf+xcj63B8BMY5r/gD4ANpWCMqmoV0YcJqVcvbMvMykJbIM6Orcp1YMEc7/49S/cmR
         7LGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cwFux5qHypa1hmB1AxqIBQOqrfG5IPPYnQ1o/++TL0A=;
        fh=GoQr/Asb/acSSJf3V0dlATA0OPkHAOv3V3HqUP3BeiE=;
        b=M9DRB4OM7s+YAkew4ITgk5isuBdtGNgpgA410CxqoXV38NWCbKC9qduvb/+XYL1JIt
         VVXiulOB1UTc95qOlKQ13pXAVRRk/IccUXTUnqchhGMUZTeVVwziqQtPNJ6XgJr9J3fv
         8tsgOckf8XO4o/bGRKzWaqOvs9Fth34S2yqz2fhiCB9eJ0eMgL8oChXwPddaMGQKc4w2
         u6+rX2Kll0DfEY1vSRXHzTQG9ckisW10TJE4hoaYgcqyztmMKusUfqrOIfZp0MBVMBZL
         7+Q/6Yu1OanxOqW7eXnodebmjJo3pMpqiJiRkQC66Aiuj17EeZLMETnHg1BAfWZDfz6S
         ydkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190361; x=1795795161; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cwFux5qHypa1hmB1AxqIBQOqrfG5IPPYnQ1o/++TL0A=;
        b=vN0DlqMVTzUvo1+SSoXsp+O6DLkr3wws+9fAewtSerkIPCZ3DupsBqw+d6vzuNVs53
         2/pX/Pkp7SMVIsXbEkKyyoWLmVyeHPHaj9SStQ2XUTSAiCMHj2RbJV6MguYtrqWSxWcb
         igcXBtc6iSbYYA6lbAv7RqGp1jAH157ioSP9Q3/DTCCl9G/xM+jPIoX/tmrbAKcgGJvX
         O0Rf4lYjKTa8wim8Si7GDzfJGhwED4nOQ0fhnDy+ew9MXXb7z85pwOpVc5hyr6tr4i3S
         pSILEERoN3YmLdQo8GgQjBCSdIDcCk7hrsvlBqPtFrWSHMpi2Ju+7NTIgsm4u1CfverD
         Sxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190361; x=1795795161;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cwFux5qHypa1hmB1AxqIBQOqrfG5IPPYnQ1o/++TL0A=;
        b=U8qR1lKKdfZ1OeqVnmpi19NAYnFwH4WxbtFo4+G3nebUOb21OJn7g2QKBsrQtNHJWx
         JAzbUMeYXrwGaf1wW5+v4+51G6i1PGPM24ALPEixpEhj1rmNq2Q3SOSP59WblxyxVcVr
         wxjxX+zd/trC5RjA0I+rdNqhhfK6rw9BdwaHCuiViPjf1cQ2t99nGIs9gzpLHNspPjzf
         Arg7OcBbCKQm/KD9U4KxW2TmYhYsmH7Qq+vnYuuGiqmQn5f/bYge2Ww0DgV6ZPh0Acqs
         lEIsxmTn7MB4vDq6SZUBQ77K/Fpkgv1qkppRroFOTO3qhonPzCf8PYBk2uQb/XS3mO+c
         V+rQ==
X-Forwarded-Encrypted: i=1; AL+hErEaUD+MDIk62Vs6Wk0l+AMaEyRe1tcExmks943XJGQ0tYToKItiNSqmFV2ttwUeVne7S5PbdylnJ8DLGA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8sQpPtjqn79YadsfXhv4ASPHCE70SjLaVajCJDGomEhmEDvtL7
	XbtfkSPL71BIBe6NW26nBWSWub37yL8bK+EgKpcRriWo4cv3RKilP4YFXGJxGXQUfh7pR/rEkjI
	NvUEyjRegfxMuOVmy2tIBy53eJFaOh9Q=
X-Gm-Gg: AZFdTZdED9rKEFNZOhvB29wMTNJGf1GV97iw5vAdxLnm7XIz3kqMaHF7dEczluEVvoU
	onVadfd5LVz0oeTii+vYxoHyZPqHEOWS+WxXDGk7kl1BJRS/VbDRbKTRQys13QyXGRNTwuSp28q
	BUvFjfCQEvTnBGCNGQ9KCYhQtM2ZKhvHUIB5Hk97MXDSTte8GhMS2roVsIm0LicDC0NueyiDv0y
	2OXXRTWAuME/NHUd3qdyPjfAn1B0LREBn+MOyyW8FOpHJnr6ET6otmRzIgRi4Y6wMmrlO4IYpMa
	XgQC7EK7Yu2cfTKz0PLlhiQiaBLoGZ1IGXdcFuuUaGwxJsxdXKHh2pQfBu1+w8q8Oc/kSbeI4c0
	08TxHCzX+sZs5a2lC2q8BGVAfZu/dX8bkgITsUWCwRF2IWPHXhzWJZBRxmw==
X-Received: by 2002:a05:651c:a149:b0:3a9:87c0:7737 with SMTP id
 38308e7fff4ca-3ae7fa80f4cmr12124381fa.21.1795190361359; Fri, 20 Nov 2026
 07:59:21 -0800 (PST)
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260911094539.237430-1-antoniodilorenzonap@gmail.com> <179007765990.322763.17356606026712759937.b4-review@b4>
In-Reply-To: <179007765990.322763.17356606026712759937.b4-review@b4>
From: Antonio Di lorenzo <antoniodilorenzonap@gmail.com>
Date: Fri, 20 Nov 2026 16:59:10 +0100
X-Gm-Features: AclHuK8yZmOqqi-lAiiBZbZApPajXyFLQeCGhiWV8iK0mtx1Nc2kngS67wx0TxA
Message-ID: <CANcofmUeSPtVsCdsQ7Lv+pSw9Y5BovAZWVNC3rKoXD-7q0Y+Sw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: Intel: soc-acpi: add SoundWire config for ASUS P5405CAA
To: broonie@kernel.org
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, 
	Liam Girdwood <liam.r.girdwood@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark,

Sorry for replying off-list. I'm resending the test results here
with linux-sound and the original recipients in Cc.

> What's the issue you see without your change?

On my ASUS ExpertBook P5405CAA running Fedora 7.3.4-200.fc44.x86_64,
the stock kernel selects the generic SoundWire machine driver.
Both TAS2783 amps log "function type only supported as DisCo constant".
SOF does not load the speaker topology, and ALSA exposes no Speaker PCM.

I retested the same Fedora kernel with only the SmartAmp function type
fallback from thesofproject/linux PR #5904 applied to snd_soc_sdca.
Both amps were recognized, SOF loaded sof-sdca-1amp-id2.tplg, and the
Speaker PCM appeared. Both amps then logged "init writes failed, err=3D-5"
and the driver rejected playback. During the same boot, the kernel
reported a divide error in sdw_compute_group_params() during PCM prepare.

Stereo playback and the internal microphone work on my local
7.3.0 build. That build uses an older kernel base
and includes both the static match entry and my separate TAS2783
stereo fix. A comparison on the same kernel base would be needed to
isolate the effect of the static entry.

Would you prefer a separate report with the logs for the TAS2783 init
failures and the SoundWire oops?

Thanks,
Antonio


On Tue, Sep 22, 2026 at 1:47=E2=80=AFPM <broonie@kernel.org> wrote:
>
> > +     {
> > +             .link_mask =3D BIT(1) | BIT(3),
> > +             .links =3D ptl_tas2783_l1_rt721_l3,
> > +             .drv_name =3D "sof_sdw",
> > +             /* "dummy" tells SOF to require function topologies witho=
ut fallback. */
> > +             .sof_tplg_filename =3D "sof-ptl-dummy.tplg",
>
> This looks a lot like the default that hda_sdw_machine_select() has,
> 754b3dade5dd ("ASoC: Intel: soc-acpi-intel-ptl-match: drop rt721 related
> match tables") removed a bunch of board specific stuff explicitly.
> What's the issue you see without your change?
>
> --
> Mark Brown <broonie@kernel.org>
