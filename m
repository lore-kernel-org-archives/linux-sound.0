Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC69E3AFAE0
	for <linux-sound@vger.kernel.org>; Wed,  2 Sep 2026 06:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788332335; cv=pass; b=WUR3TXZUq+YOJIqWmnaT+2aaEI2IFvRgtxjOVvZW23iwdgAGwb+2b0LQwSMK6Wg90rY3ICTtdkK/xjnErrmIatOGwE/Lhjur/zorIkLNzGBgndPzZ4yEKXjCgki2CqwPPds/so8oMRwLZVt0lBjghUPeV+MtkzSlbJvWNoTJrXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788332335; c=relaxed/simple;
	bh=lmdTvrNLyi0GtOLkMEAApwYWiwu+dvXJCi4Wv2yd25Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gc9/lrB8LJXDSMe6NAA04LYYh4aQZegeuLL3SlmOE4RWcNBnf6Nq6V1du6+gTAA00iv5KvMITGjT8hYngC8vK/8d008iuxrTt7IsAMWoSGAbRZ6LkPlKT51WfABy53OcgZ4+X2FGK+S2u6aOEOJJolzg6IxmUQgeGbjVksceHuM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eiUT1cEa; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eiUT1cEa"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47fe89fb333so414177f8f.3
        for <linux-sound@vger.kernel.org>; Tue, 01 Sep 2026 23:58:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788332327; cv=none;
        d=google.com; s=arc-20260327;
        b=gu5MQwmQCHflawUmddk1bp5RQRGhEZ9z2yWiMtLpFxYa3w/2g/TJsiJmHM9MxoxD0j
         9G+nQZig1gGufsSLA/95/4DGxcseY3MD0048ShJHQ61Df5u6A+dBtSzSvO87hf6B+u6b
         GKjloQ9EtJrHw7DXMkRUqKwS8AhmMt1BDaGYGhe3lUs/hQx8IbUoRRX36GLXM5077oPp
         l5SkVds2RC/Me9Fm+xAiUZ1cx8fJdYCRLCnix7Qbjg6Q5XZaNBp24rEZxZBH4AkpMZf4
         otHg3LICCdMEA/9bOzhbbpdwHSfR++YXYBJ/k3OFgKR3Gh4jCtRoChEBiJT5MfI6tAP2
         N8hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rHvec1B41LTsHg/y2S1IBofbmedh40uYcMY1YS/Yk48=;
        fh=CbWgkU3dKbmxNPoMSQvQyNUsM4tx+8q0FGZ1mTXRwNA=;
        b=J21RsiWdodLZwYY67SGwG4BBVur0IrPXlit1OIH8yh3+8mKF0Wu/18NWRMWzd6zht8
         N4r3WtH0DvMxyXs0v6sv5JjP0d3d0ze86baWdmfeQzxTkwJuBNjVUcGT6UAjGOW3qdMe
         J2DxgRLzr1hd5CagdNcDH2VmaghK5XaCUn9vIkvFyZzLfvAmnvpQnc5qF3DW2TbGV2bb
         OK1R13WamvPe/LMkPxO8aCSWGEb9Zpc2H4KRWV4ku3Q2q8Kh4ydIAgcXLAe47CbiC7yC
         eJBZQI/dXggmSPapgMUnUt1pCzHpCEf3xR5K4LS+CHmk7eSz0s8eoL7Qd3RxCy6V/TAd
         77+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788332327; x=1788937127; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rHvec1B41LTsHg/y2S1IBofbmedh40uYcMY1YS/Yk48=;
        b=eiUT1cEarlrQ1WvjZphP92Aw1ly/HiBwQNemB6uTDs30M/QPu+gaKsaUhmeJ6u9Uto
         IQeNO/BIXUg2ZYkpaIxtGmHL27sT9b1QXrwPz+i6E+PME2dLL+cLdTeVbIIVmS5BJCHg
         S2GPyeUkz1kcWOGQssJiheiUHv9JZ1EMyddgeWb24kBtYqKv2A6dirZoh3nCUJm6P0cn
         4bpt5abvbGHlsMJQC5QlqTDqYSnvfNGhy+uMnWn/ebXhWIxwkO0zcnbszxWwjoWbYxpV
         xx2LoX7QvmBcdhYIJq1ICZ8fLPTThpDafgEa3yL49SnnjKbiYEXgUfDIK2AJpzRQRVpD
         dKjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788332327; x=1788937127;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rHvec1B41LTsHg/y2S1IBofbmedh40uYcMY1YS/Yk48=;
        b=GvahPbe9HkoXuKP4uFnz7NWmew0mO/IgwHD08gGDAylxdDvCD8U74+U+4zLyBpSdPO
         VPYs5jdF7OmgQFyXzPSpXRHfGxBUqR9K7XCTIqb82Pu8kVCTdqbIfWipCRD3zyyOMREZ
         8wYm8aBNBsOAjEjumBmOm6ga/ZndSobLZDfhtoeXdUS91trnEJnmZPxi/uBqRwPIX3/d
         R0t+n/UN7RQFT42WbQTVWhG5jFtzGWhunZEHFjQzFSxLpfU3BAU/JI66yx+/imikDOXN
         ZACAOKIf3Uv5TNBkp9HruP0CYOvW+T9npKcHM1CvXXdpDhr2X5HlfcqQBc0tRtIHeacf
         60rg==
X-Forwarded-Encrypted: i=1; AKwUvBzLYotkk9OPCBRSPAVUlvvcPXRdLpANx5J1Ylqiout+pZOh+oPw1eGnXx58CyGUtVGursqPkzGTbH6Bcw==@vger.kernel.org
X-Gm-Message-State: AFuF++nq7j0ykaCVoaz2vWNX475tuUw9UhuoOPqDYcMgeDn9WN1d5spR
	Me9flOgQA2U1XEhYFINxEUgnBchl5MHZKzS9KLBMbRX6P3OvUeIhtl0fTCuZd0+5TxICNginhcQ
	ssMSX7nsTE8nnP98thOCE70ulgi5OGxSHFQNY9bitpDjinuU=
X-Gm-Gg: AYBFou1AbnMPGIAn9MzXXUA3Zvr4GRYdWPsyAM50MxK3GU8fi6yDWmnGdX+KP6AipYr
	+Vh5vFuE+/6Lsi9TGT66SLScrZVzDc+5atnr75uF3RJLaMct0rUiar5YA9NVnqAVWpTTFBIZ/GA
	gxk/bXBXAUKNN3dhNiadazG4Xux/evZgE+QdUQeyxt51jjPOx4rRIaIZp47sv56ESmP6dYZXTXv
	BSWgpV4ybiiDG2X6yyfFto9XXL1XyGvgBJXLiUqRzSvxgaVC1wdI61DNbc91+9oALwg5oVjdDeI
	7Fuhk2oHVb7vqTeKXkTz5kUWicFk6xFfePPHNo5oIpEn
X-Received: by 2002:a05:6000:2088:b0:484:3fce:18c5 with SMTP id
 ffacd0b85a97d-484914b920dmr4302153f8f.23.1788332326375; Tue, 01 Sep 2026
 23:58:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAPBHdanmknKKhhc+5r8jPsnyZW8LYVq0qpzfEVrvjL3i5sNuJQ@mail.gmail.com>
 <87mru0b1z3.wl-tiwai@suse.de>
In-Reply-To: <87mru0b1z3.wl-tiwai@suse.de>
From: Qingyu Zhang <usupergate@gmail.com>
Date: Wed, 2 Sep 2026 14:58:34 +0800
X-Gm-Features: AcwNN1XLih-ed91UW2Km4yjXZEpOorEbNpVueoqU7zIXItjn8HELpZjPDbQuaRc
Message-ID: <CAPBHdakPAZfcP9PTKHiTQMHeEi8g7Xemg_UOByZAqKx6epxJ3A@mail.gmail.com>
Subject: Re: [BUG] ALSA: ump: NULL deref of legacy_rmidi after parse sets parsed
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000000def68065a7a9192"

--0000000000000def68065a7a9192
Content-Type: text/plain; charset="UTF-8"

Dear Takashi,

Thank you for your email. The formatted patch with the Signed-off-by
tag is attached; please check.

Yours,
Ian

>
> On Wed, 02 Sep 2026 04:07:30 +0200,
> Qingyu Zhang wrote:
> >
> > Hello,
> >
> > ump_legacy_set_rawmidi_name() snprintf()s into ump->legacy_rmidi->name
> > when ump->parsed is true, but parsed is set at the end of
> > snd_ump_parse_endpoint() *before* snd_ump_attach_legacy_rawmidi().
> > A UMP packet in that window NULL-derefs.
> >
> > Type: null-pointer dereference
> >
> > * Summary
> >
> > snd_ump_parse_endpoint() always does:
> >
> >        error:
> >                ump->parsed = true;
> >                ...
> >
> > ump_handle_ep_name_msg():
> >
> >        if (ret && ump->parsed) {
> >                ump_set_rawmidi_name(ump);
> >                ump_legacy_set_rawmidi_name(ump);  /* rmidi may be NULL */
> >        }
> >
> > ump_legacy_set_rawmidi_name():
> >
> >        rmidi = ump->legacy_rmidi;
> >        snprintf(rmidi->name, ...);   /* no NULL check */
> >
> > This runs from snd_ump_receive() on the USB input URB complete path
> > (in interrupt).
> >
> > * Affected
> >
> > 37e0e14128e0. Needs CONFIG_SND_UMP, CONFIG_SND_UMP_LEGACY_RAWMIDI,
> > CONFIG_SND_USB_AUDIO, a MIDI 2.0 gadget or device. KASAN.
> >
> > The natural window is parse-done vs attach. The QEMU PoC widens it
> > with a kprobe on snd_ump_receive (poc/widen_ump.c) plus dummy_hcd
> > configfs midi2, because the un-widened window is short.
> >
> > * Reproduction
> >
> >        # dummy_hcd + configfs usb_gadget midi2.usb0 (see poc/run.sh)
> >        # with widen_ump.ko: force parsed=1, legacy_rmidi=NULL on receive
> >
> > KASAN: null-ptr-deref in snprintf from ump_legacy_set_rawmidi_name
> > <- ump_handle_ep_name_msg <- snd_ump_receive <- input_urb_complete.
> > Then "Fatal exception in interrupt".
> >
> > * Expected
> >
> > legacy_rmidi helpers no-op until attach has stored the pointer.
> >
> > * Actual
> >
> > IRQ-context NULL deref.
> >
> > Please consider the suggested patch
> >
> > Thanks.
> >
> > Suggested patch:
> > ```
> > diff --git a/sound/core/ump.c b/sound/core/ump.c
> > index d183c8a000bd..3d1a2ed3b476 100644
> > --- a/sound/core/ump.c
> > +++ b/sound/core/ump.c
> > @@ -1335,6 +1335,8 @@ static void update_legacy_names(struct
> > snd_ump_endpoint *ump)
> > {
> >     struct snd_rawmidi *rmidi = ump->legacy_rmidi;
> >
> > +    if (!rmidi)
> > +        return;
> >     update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_INPUT);
> >     update_legacy_substreams(ump, rmidi, SNDRV_RAWMIDI_STREAM_OUTPUT);
> > }
> > @@ -1343,6 +1345,8 @@ static void ump_legacy_set_rawmidi_name(struct
> > snd_ump_endpoint *ump)
> > {
> >     struct snd_rawmidi *rmidi = ump->legacy_rmidi;
> >
> > +    if (!rmidi)
> > +        return;
> >     snprintf(rmidi->name, sizeof(rmidi->name), "%.68s (MIDI 1.0)",
> >          ump->core.name);
> > }
> > ```
>
> Thanks for the report.  The suggested code change looks good.
> Could you submit a patch in the proper format for upstreaming
> (especially with your Signed-off-by tag)?
>
>
> thanks,
>
> Takashi

--0000000000000def68065a7a9192
Content-Type: application/x-patch; 
	name="0001-ALSA-ump-do-not-touch-legacy_rmidi-before-it-exists.patch"
Content-Disposition: attachment; 
	filename="0001-ALSA-ump-do-not-touch-legacy_rmidi-before-it-exists.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mtjqry7w0>
X-Attachment-Id: f_mtjqry7w0

RnJvbTogSWFuIDx1c3VwZXJnYXRlQGdtYWlsLmNvbT4KRGF0ZTogTW9uLCAzMSBBdWcgMjAyNiAx
NzowMDowMCArMDgwMApTdWJqZWN0OiBbUEFUQ0hdIEFMU0E6IHVtcDogZG8gbm90IHRvdWNoIGxl
Z2FjeV9ybWlkaSBiZWZvcmUgaXQgZXhpc3RzCgpzbmRfdW1wX3BhcnNlX2VuZHBvaW50KCkgc2V0
cyB1bXAtPnBhcnNlZCBvbiBldmVyeSBleGl0LCBpbmNsdWRpbmcKZXJyb3IsIGJlZm9yZSB0aGUg
Y2FsbGVyIGF0dGFjaGVzIHRoZSBsZWdhY3kgcmF3bWlkaSBkZXZpY2UuCnVtcF9oYW5kbGVfZXBf
bmFtZV9tc2coKSB0aGVuIHRyZWF0cyBwYXJzZWQgYXMgImxlZ2FjeV9ybWlkaSBpcyBsaXZlIgph
bmQgY2FsbHMgdW1wX2xlZ2FjeV9zZXRfcmF3bWlkaV9uYW1lKCksIHdoaWNoIHNucHJpbnRmKClz
IGludG8KdW1wLT5sZWdhY3lfcm1pZGktPm5hbWUuIElmIGEgVU1QIHBhY2tldCBhcnJpdmVzIGlu
IHRoYXQgd2luZG93CihJUlEgcGF0aCBmcm9tIHNuZF91bXBfcmVjZWl2ZSksIGxlZ2FjeV9ybWlk
aSBpcyBzdGlsbCBOVUxMCihLQVNBTiBudWxsLXB0ci1kZXJlZiBpbiBzbnByaW50ZikuCgpHdWFy
ZCB0aGUgbGVnYWN5IGhlbHBlcnMuIHBhcnNlZCBvbmx5IG1lYW5zIGVuZHBvaW50IGluZm8gd2Fz
CnBhcnNlZCwgbm90IHRoYXQgbGVnYWN5X3JtaWRpIGV4aXN0cy4KCkZpeGVzOiAzN2UwZTE0MTI4
ZTAgKCJBTFNBOiB1bXA6IFN1cHBvcnQgVU1QIEVuZHBvaW50IGFuZCBGdW5jdGlvbiBCbG9jayBw
YXJzaW5nIikKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSWFuIDx1
c3VwZXJnYXRlQGdtYWlsLmNvbT4KLS0tCmRpZmYgLS1naXQgYS9zb3VuZC9jb3JlL3VtcC5jIGIv
c291bmQvY29yZS91bXAuYwppbmRleCBkMTgzYzhhMDAwYmQuLjNkMWEyZWQzYjQ3NiAxMDA2NDQK
LS0tIGEvc291bmQvY29yZS91bXAuYworKysgYi9zb3VuZC9jb3JlL3VtcC5jCkBAIC0xMzM1LDYg
KzEzMzUsOCBAQCBzdGF0aWMgdm9pZCB1cGRhdGVfbGVnYWN5X25hbWVzKHN0cnVjdCBzbmRfdW1w
X2VuZHBvaW50ICp1bXApCiB7CiAJc3RydWN0IHNuZF9yYXdtaWRpICpybWlkaSA9IHVtcC0+bGVn
YWN5X3JtaWRpOwogCisJaWYgKCFybWlkaSkKKwkJcmV0dXJuOwogCXVwZGF0ZV9sZWdhY3lfc3Vi
c3RyZWFtcyh1bXAsIHJtaWRpLCBTTkRSVl9SQVdNSURJX1NUUkVBTV9JTlBVVCk7CiAJdXBkYXRl
X2xlZ2FjeV9zdWJzdHJlYW1zKHVtcCwgcm1pZGksIFNORFJWX1JBV01JRElfU1RSRUFNX09VVFBV
VCk7CiB9CkBAIC0xMzQzLDYgKzEzNDUsOCBAQCBzdGF0aWMgdm9pZCB1bXBfbGVnYWN5X3NldF9y
YXdtaWRpX25hbWUoc3RydWN0IHNuZF91bXBfZW5kcG9pbnQgKnVtcCkKIHsKIAlzdHJ1Y3Qgc25k
X3Jhd21pZGkgKnJtaWRpID0gdW1wLT5sZWdhY3lfcm1pZGk7CiAKKwlpZiAoIXJtaWRpKQorCQly
ZXR1cm47CiAJc25wcmludGYocm1pZGktPm5hbWUsIHNpemVvZihybWlkaS0+bmFtZSksICIlLjY4
cyAoTUlESSAxLjApIiwKIAkJIHVtcC0+Y29yZS5uYW1lKTsKIH0K
--0000000000000def68065a7a9192--
